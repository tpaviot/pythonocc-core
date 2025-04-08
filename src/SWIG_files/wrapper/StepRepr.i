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
%define STEPREPRDOCSTRING
"StepRepr module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_steprepr.html"
%enddef
%module (package="OCC.Core", docstring=STEPREPRDOCSTRING) StepRepr


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
#include<StepRepr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<Message_module.hxx>
#include<StepData_module.hxx>
#include<StepGeom_module.hxx>
#include<StepShape_module.hxx>
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
%wrap_handle(StepRepr_AssemblyComponentUsageSubstitute)
%wrap_handle(StepRepr_ConfigurationDesign)
%wrap_handle(StepRepr_ConfigurationEffectivity)
%wrap_handle(StepRepr_ConfigurationItem)
%wrap_handle(StepRepr_DataEnvironment)
%wrap_handle(StepRepr_FunctionallyDefinedTransformation)
%wrap_handle(StepRepr_ItemDefinedTransformation)
%wrap_handle(StepRepr_MaterialDesignation)
%wrap_handle(StepRepr_ProductConcept)
%wrap_handle(StepRepr_ProductDefinitionUsage)
%wrap_handle(StepRepr_PropertyDefinition)
%wrap_handle(StepRepr_PropertyDefinitionRelationship)
%wrap_handle(StepRepr_PropertyDefinitionRepresentation)
%wrap_handle(StepRepr_Representation)
%wrap_handle(StepRepr_RepresentationContext)
%wrap_handle(StepRepr_RepresentationContextReference)
%wrap_handle(StepRepr_RepresentationItem)
%wrap_handle(StepRepr_RepresentationMap)
%wrap_handle(StepRepr_RepresentationReference)
%wrap_handle(StepRepr_RepresentationRelationship)
%wrap_handle(StepRepr_ShapeAspect)
%wrap_handle(StepRepr_ShapeAspectRelationship)
%wrap_handle(StepRepr_SuppliedPartRelationship)
%wrap_handle(StepRepr_AssemblyComponentUsage)
%wrap_handle(StepRepr_BooleanRepresentationItem)
%wrap_handle(StepRepr_CharacterizedRepresentation)
%wrap_handle(StepRepr_CompShAspAndDatumFeatAndShAsp)
%wrap_handle(StepRepr_CompositeShapeAspect)
%wrap_handle(StepRepr_CompoundRepresentationItem)
%wrap_handle(StepRepr_ConstructiveGeometryRepresentation)
%wrap_handle(StepRepr_ConstructiveGeometryRepresentationRelationship)
%wrap_handle(StepRepr_DefinitionalRepresentation)
%wrap_handle(StepRepr_DerivedShapeAspect)
%wrap_handle(StepRepr_DescriptiveRepresentationItem)
%wrap_handle(StepRepr_ExternallyDefinedRepresentation)
%wrap_handle(StepRepr_FeatureForDatumTargetRelationship)
%wrap_handle(StepRepr_GlobalUncertaintyAssignedContext)
%wrap_handle(StepRepr_GlobalUnitAssignedContext)
%wrap_handle(StepRepr_IntegerRepresentationItem)
%wrap_handle(StepRepr_MakeFromUsageOption)
%wrap_handle(StepRepr_MappedItem)
%wrap_handle(StepRepr_MaterialProperty)
%wrap_handle(StepRepr_MaterialPropertyRepresentation)
%wrap_handle(StepRepr_MeasureRepresentationItem)
%wrap_handle(StepRepr_MechanicalDesignAndDraughtingRelationship)
%wrap_handle(StepRepr_ParametricRepresentationContext)
%wrap_handle(StepRepr_ProductDefinitionShape)
%wrap_handle(StepRepr_RealRepresentationItem)
%wrap_handle(StepRepr_ReprItemAndMeasureWithUnit)
%wrap_handle(StepRepr_ShapeAspectDerivingRelationship)
%wrap_handle(StepRepr_ShapeAspectTransition)
%wrap_handle(StepRepr_ShapeRepresentationRelationship)
%wrap_handle(StepRepr_StructuralResponseProperty)
%wrap_handle(StepRepr_StructuralResponsePropertyDefinitionRepresentation)
%wrap_handle(StepRepr_ValueRepresentationItem)
%wrap_handle(StepRepr_Apex)
%wrap_handle(StepRepr_CentreOfSymmetry)
%wrap_handle(StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp)
%wrap_handle(StepRepr_CompositeGroupShapeAspect)
%wrap_handle(StepRepr_ContinuosShapeAspect)
%wrap_handle(StepRepr_Extension)
%wrap_handle(StepRepr_GeometricAlignment)
%wrap_handle(StepRepr_NextAssemblyUsageOccurrence)
%wrap_handle(StepRepr_ParallelOffset)
%wrap_handle(StepRepr_PerpendicularTo)
%wrap_handle(StepRepr_PromissoryUsageOccurrence)
%wrap_handle(StepRepr_QuantifiedAssemblyComponentUsage)
%wrap_handle(StepRepr_ReprItemAndLengthMeasureWithUnit)
%wrap_handle(StepRepr_ReprItemAndPlaneAngleMeasureWithUnit)
%wrap_handle(StepRepr_RepresentationRelationshipWithTransformation)
%wrap_handle(StepRepr_SpecifiedHigherUsageOccurrence)
%wrap_handle(StepRepr_Tangent)
%wrap_handle(StepRepr_ValueRange)
%wrap_handle(StepRepr_AllAroundShapeAspect)
%wrap_handle(StepRepr_BetweenShapeAspect)
%wrap_handle(StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI)
%wrap_handle(StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI)
%wrap_handle(StepRepr_ShapeRepresentationRelationshipWithTransformation)
%wrap_handle(StepRepr_HArray1OfMaterialPropertyRepresentation)
%wrap_handle(StepRepr_HArray1OfPropertyDefinitionRepresentation)
%wrap_handle(StepRepr_HArray1OfRepresentationItem)
%wrap_handle(StepRepr_HArray1OfShapeAspect)
%wrap_handle(StepRepr_HSequenceOfMaterialPropertyRepresentation)
%wrap_handle(StepRepr_HSequenceOfRepresentationItem)
/* end handles declaration */

/* templates */
%template(StepRepr_Array1OfMaterialPropertyRepresentation) NCollection_Array1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>>;
Array1ExtendIter(opencascade::handle<StepRepr_MaterialPropertyRepresentation>)

%template(StepRepr_Array1OfPropertyDefinitionRepresentation) NCollection_Array1<opencascade::handle<StepRepr_PropertyDefinitionRepresentation>>;
Array1ExtendIter(opencascade::handle<StepRepr_PropertyDefinitionRepresentation>)

%template(StepRepr_Array1OfRepresentationItem) NCollection_Array1<opencascade::handle<StepRepr_RepresentationItem>>;
Array1ExtendIter(opencascade::handle<StepRepr_RepresentationItem>)

%template(StepRepr_Array1OfShapeAspect) NCollection_Array1<opencascade::handle<StepRepr_ShapeAspect>>;
Array1ExtendIter(opencascade::handle<StepRepr_ShapeAspect>)

%template(StepRepr_SequenceOfMaterialPropertyRepresentation) NCollection_Sequence<opencascade::handle<StepRepr_MaterialPropertyRepresentation>>;

%extend NCollection_Sequence<opencascade::handle<StepRepr_MaterialPropertyRepresentation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(StepRepr_SequenceOfRepresentationItem) NCollection_Sequence<opencascade::handle<StepRepr_RepresentationItem>>;

%extend NCollection_Sequence<opencascade::handle<StepRepr_RepresentationItem>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>> StepRepr_Array1OfMaterialPropertyRepresentation;
typedef NCollection_Array1<opencascade::handle<StepRepr_PropertyDefinitionRepresentation>> StepRepr_Array1OfPropertyDefinitionRepresentation;
typedef NCollection_Array1<opencascade::handle<StepRepr_RepresentationItem>> StepRepr_Array1OfRepresentationItem;
typedef NCollection_Array1<opencascade::handle<StepRepr_ShapeAspect>> StepRepr_Array1OfShapeAspect;
typedef NCollection_Sequence<opencascade::handle<StepRepr_MaterialPropertyRepresentation>> StepRepr_SequenceOfMaterialPropertyRepresentation;
typedef NCollection_Sequence<opencascade::handle<StepRepr_RepresentationItem>> StepRepr_SequenceOfRepresentationItem;
/* end typedefs declaration */

/**************************************************
* class StepRepr_AssemblyComponentUsageSubstitute *
**************************************************/
class StepRepr_AssemblyComponentUsageSubstitute : public Standard_Transient {
	public:
		/****** StepRepr_AssemblyComponentUsageSubstitute::StepRepr_AssemblyComponentUsageSubstitute ******/
		/****** md5 signature: 86c65d212c27accf38277f4eb309a00c ******/
		%feature("compactdefaultargs") StepRepr_AssemblyComponentUsageSubstitute;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_AssemblyComponentUsageSubstitute;
		 StepRepr_AssemblyComponentUsageSubstitute();

		/****** StepRepr_AssemblyComponentUsageSubstitute::Base ******/
		/****** md5 signature: 6a09810ce11893cef326159fcb3202bd ******/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>

Description
-----------
No available documentation.
") Base;
		opencascade::handle<StepRepr_AssemblyComponentUsage> Base();

		/****** StepRepr_AssemblyComponentUsageSubstitute::Definition ******/
		/****** md5 signature: 3f28f0854f8fabf02330139704589808 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Definition;
		opencascade::handle<TCollection_HAsciiString> Definition();

		/****** StepRepr_AssemblyComponentUsageSubstitute::Init ******/
		/****** md5 signature: 7267e93d2f787ce90be64383d1b6573b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDef: TCollection_HAsciiString
aBase: StepRepr_AssemblyComponentUsage
aSubs: StepRepr_AssemblyComponentUsage

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDef, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aBase, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aSubs);

		/****** StepRepr_AssemblyComponentUsageSubstitute::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_AssemblyComponentUsageSubstitute::SetBase ******/
		/****** md5 signature: badeb331eea27d1ca27ee238ed48675b ******/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "
Parameters
----------
aBase: StepRepr_AssemblyComponentUsage

Return
-------
None

Description
-----------
No available documentation.
") SetBase;
		void SetBase(const opencascade::handle<StepRepr_AssemblyComponentUsage> & aBase);

		/****** StepRepr_AssemblyComponentUsageSubstitute::SetDefinition ******/
		/****** md5 signature: 09b68a24e5ef86196c460910b49429e5 ******/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "
Parameters
----------
aDef: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDefinition;
		void SetDefinition(const opencascade::handle<TCollection_HAsciiString> & aDef);

		/****** StepRepr_AssemblyComponentUsageSubstitute::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepRepr_AssemblyComponentUsageSubstitute::SetSubstitute ******/
		/****** md5 signature: 82cb5105040e94996dfe0915faaf63f9 ******/
		%feature("compactdefaultargs") SetSubstitute;
		%feature("autodoc", "
Parameters
----------
aSubstitute: StepRepr_AssemblyComponentUsage

Return
-------
None

Description
-----------
No available documentation.
") SetSubstitute;
		void SetSubstitute(const opencascade::handle<StepRepr_AssemblyComponentUsage> & aSubstitute);

		/****** StepRepr_AssemblyComponentUsageSubstitute::Substitute ******/
		/****** md5 signature: 3c3092778cc9daa2edaa916111856d19 ******/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>

Description
-----------
No available documentation.
") Substitute;
		opencascade::handle<StepRepr_AssemblyComponentUsage> Substitute();

};


%make_alias(StepRepr_AssemblyComponentUsageSubstitute)

%extend StepRepr_AssemblyComponentUsageSubstitute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepRepr_CharacterizedDefinition *
*****************************************/
class StepRepr_CharacterizedDefinition : public StepData_SelectType {
	public:
		/****** StepRepr_CharacterizedDefinition::StepRepr_CharacterizedDefinition ******/
		/****** md5 signature: d5a468c8f177c975184578fd389e3254 ******/
		%feature("compactdefaultargs") StepRepr_CharacterizedDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_CharacterizedDefinition;
		 StepRepr_CharacterizedDefinition();

		/****** StepRepr_CharacterizedDefinition::CaseNum ******/
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
Recognizes a kind of CharacterizedDefinition select type 1 -> CharacterizedObject from StepBasic 2 -> ProductDefinition from StepBasic 3 -> ProductDefinitionRelationship from StepBasic 4 -> ProductDefinitionShape from StepRepr 5 -> ShapeAspect from StepRepr 6 -> ShapeAspectRelationship from StepRepr 7 -> DocumentFile from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepRepr_CharacterizedDefinition::CharacterizedObject ******/
		/****** md5 signature: e518475515030a2f9db7a2227e2fe8f9 ******/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_CharacterizedObject>

Description
-----------
Returns Value as CharacterizedObject (or Null if another type).
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****** StepRepr_CharacterizedDefinition::DocumentFile ******/
		/****** md5 signature: bcd917452eb81042c78b397f1e6fd78b ******/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_DocumentFile>

Description
-----------
Returns Value as DocumentFile (or Null if another type).
") DocumentFile;
		opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****** StepRepr_CharacterizedDefinition::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns Value as ProductDefinition (or Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepRepr_CharacterizedDefinition::ProductDefinitionRelationship ******/
		/****** md5 signature: 8884670d0de6dcec838b821592ead2d2 ******/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>

Description
-----------
Returns Value as ProductDefinitionRelationship (or Null if another type).
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****** StepRepr_CharacterizedDefinition::ProductDefinitionShape ******/
		/****** md5 signature: b30663c40bd2822cf899d97bff9d9f32 ******/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductDefinitionShape>

Description
-----------
Returns Value as ProductDefinitionShape (or Null if another type).
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****** StepRepr_CharacterizedDefinition::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
Returns Value as ShapeAspect (or Null if another type).
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****** StepRepr_CharacterizedDefinition::ShapeAspectRelationship ******/
		/****** md5 signature: 35bed4b7262e5cb161ba72768027d32c ******/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>

Description
-----------
Returns Value as ShapeAspectRelationship (or Null if another type).
") ShapeAspectRelationship;
		opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

};


%extend StepRepr_CharacterizedDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepRepr_ConfigurationDesign *
*************************************/
class StepRepr_ConfigurationDesign : public Standard_Transient {
	public:
		/****** StepRepr_ConfigurationDesign::StepRepr_ConfigurationDesign ******/
		/****** md5 signature: 8e3002f8e676e432c98bd0a8ba140080 ******/
		%feature("compactdefaultargs") StepRepr_ConfigurationDesign;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ConfigurationDesign;
		 StepRepr_ConfigurationDesign();

		/****** StepRepr_ConfigurationDesign::Configuration ******/
		/****** md5 signature: 8d9883d9a6f6751aa426454fce9c0ea2 ******/
		%feature("compactdefaultargs") Configuration;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationItem>

Description
-----------
Returns field Configuration.
") Configuration;
		opencascade::handle<StepRepr_ConfigurationItem> Configuration();

		/****** StepRepr_ConfigurationDesign::Design ******/
		/****** md5 signature: 21d129afd3836dc5695540015977479c ******/
		%feature("compactdefaultargs") Design;
		%feature("autodoc", "Return
-------
StepRepr_ConfigurationDesignItem

Description
-----------
Returns field Design.
") Design;
		StepRepr_ConfigurationDesignItem Design();

		/****** StepRepr_ConfigurationDesign::Init ******/
		/****** md5 signature: 4ae95d19ab088398004cbac4fe4ddd67 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aConfiguration: StepRepr_ConfigurationItem
aDesign: StepRepr_ConfigurationDesignItem

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<StepRepr_ConfigurationItem> & aConfiguration, const StepRepr_ConfigurationDesignItem & aDesign);

		/****** StepRepr_ConfigurationDesign::SetConfiguration ******/
		/****** md5 signature: 2f8b77a9ccf33daca9c076bb348ea554 ******/
		%feature("compactdefaultargs") SetConfiguration;
		%feature("autodoc", "
Parameters
----------
Configuration: StepRepr_ConfigurationItem

Return
-------
None

Description
-----------
Set field Configuration.
") SetConfiguration;
		void SetConfiguration(const opencascade::handle<StepRepr_ConfigurationItem> & Configuration);

		/****** StepRepr_ConfigurationDesign::SetDesign ******/
		/****** md5 signature: 0698faa502abde297904f4a64c46645c ******/
		%feature("compactdefaultargs") SetDesign;
		%feature("autodoc", "
Parameters
----------
Design: StepRepr_ConfigurationDesignItem

Return
-------
None

Description
-----------
Set field Design.
") SetDesign;
		void SetDesign(const StepRepr_ConfigurationDesignItem & Design);

};


%make_alias(StepRepr_ConfigurationDesign)

%extend StepRepr_ConfigurationDesign {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepRepr_ConfigurationDesignItem *
*****************************************/
class StepRepr_ConfigurationDesignItem : public StepData_SelectType {
	public:
		/****** StepRepr_ConfigurationDesignItem::StepRepr_ConfigurationDesignItem ******/
		/****** md5 signature: 029ef181d1ce993296e36e3d0134f6f7 ******/
		%feature("compactdefaultargs") StepRepr_ConfigurationDesignItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ConfigurationDesignItem;
		 StepRepr_ConfigurationDesignItem();

		/****** StepRepr_ConfigurationDesignItem::CaseNum ******/
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
Recognizes a kind of ConfigurationDesignItem select type 1 -> ProductDefinition from StepBasic 2 -> ProductDefinitionFormation from StepBasic 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepRepr_ConfigurationDesignItem::ProductDefinition ******/
		/****** md5 signature: d43b5ca42d8380c05af7f64fb041e89b ******/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinition>

Description
-----------
Returns Value as ProductDefinition (or Null if another type).
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****** StepRepr_ConfigurationDesignItem::ProductDefinitionFormation ******/
		/****** md5 signature: 549b153d5236bb5dda717eed81e28565 ******/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>

Description
-----------
Returns Value as ProductDefinitionFormation (or Null if another type).
") ProductDefinitionFormation;
		opencascade::handle<StepBasic_ProductDefinitionFormation> ProductDefinitionFormation();

};


%extend StepRepr_ConfigurationDesignItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepRepr_ConfigurationEffectivity *
******************************************/
class StepRepr_ConfigurationEffectivity : public StepBasic_ProductDefinitionEffectivity {
	public:
		/****** StepRepr_ConfigurationEffectivity::StepRepr_ConfigurationEffectivity ******/
		/****** md5 signature: 6536634474eae0280f30ec2b664c9d90 ******/
		%feature("compactdefaultargs") StepRepr_ConfigurationEffectivity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ConfigurationEffectivity;
		 StepRepr_ConfigurationEffectivity();

		/****** StepRepr_ConfigurationEffectivity::Configuration ******/
		/****** md5 signature: 59c7dd46d716e0491f48f375818f8a27 ******/
		%feature("compactdefaultargs") Configuration;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ConfigurationDesign>

Description
-----------
Returns field Configuration.
") Configuration;
		opencascade::handle<StepRepr_ConfigurationDesign> Configuration();

		/****** StepRepr_ConfigurationEffectivity::Init ******/
		/****** md5 signature: 8c1954152a36e454b7711e318094467a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aEffectivity_Id: TCollection_HAsciiString
aProductDefinitionEffectivity_Usage: StepBasic_ProductDefinitionRelationship
aConfiguration: StepRepr_ConfigurationDesign

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aEffectivity_Id, const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aProductDefinitionEffectivity_Usage, const opencascade::handle<StepRepr_ConfigurationDesign> & aConfiguration);

		/****** StepRepr_ConfigurationEffectivity::SetConfiguration ******/
		/****** md5 signature: 7ab4d17530e0139eed70005caefe5d4d ******/
		%feature("compactdefaultargs") SetConfiguration;
		%feature("autodoc", "
Parameters
----------
Configuration: StepRepr_ConfigurationDesign

Return
-------
None

Description
-----------
Set field Configuration.
") SetConfiguration;
		void SetConfiguration(const opencascade::handle<StepRepr_ConfigurationDesign> & Configuration);

};


%make_alias(StepRepr_ConfigurationEffectivity)

%extend StepRepr_ConfigurationEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepRepr_ConfigurationItem *
***********************************/
class StepRepr_ConfigurationItem : public Standard_Transient {
	public:
		/****** StepRepr_ConfigurationItem::StepRepr_ConfigurationItem ******/
		/****** md5 signature: 08e5157bdbf66d2f6ee6a471b006beb2 ******/
		%feature("compactdefaultargs") StepRepr_ConfigurationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ConfigurationItem;
		 StepRepr_ConfigurationItem();

		/****** StepRepr_ConfigurationItem::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_ConfigurationItem::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepRepr_ConfigurationItem::HasPurpose ******/
		/****** md5 signature: fc79df10595a5b1bf4f69a30cc29bdf6 ******/
		%feature("compactdefaultargs") HasPurpose;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Purpose is defined.
") HasPurpose;
		Standard_Boolean HasPurpose();

		/****** StepRepr_ConfigurationItem::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepRepr_ConfigurationItem::Init ******/
		/****** md5 signature: 2f8f18f631c0265a539dbfaa814f2b0e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aItemConcept: StepRepr_ProductConcept
hasPurpose: bool
aPurpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_ProductConcept> & aItemConcept, const Standard_Boolean hasPurpose, const opencascade::handle<TCollection_HAsciiString> & aPurpose);

		/****** StepRepr_ConfigurationItem::ItemConcept ******/
		/****** md5 signature: 25f9365ce93dc3997bde508d541df9e6 ******/
		%feature("compactdefaultargs") ItemConcept;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductConcept>

Description
-----------
Returns field ItemConcept.
") ItemConcept;
		opencascade::handle<StepRepr_ProductConcept> ItemConcept();

		/****** StepRepr_ConfigurationItem::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_ConfigurationItem::Purpose ******/
		/****** md5 signature: f96745f44705150c3273c06fb78fc3cb ******/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Purpose.
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****** StepRepr_ConfigurationItem::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepRepr_ConfigurationItem::SetId ******/
		/****** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
Id: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****** StepRepr_ConfigurationItem::SetItemConcept ******/
		/****** md5 signature: ff0701cf10e735f12d14997469475a00 ******/
		%feature("compactdefaultargs") SetItemConcept;
		%feature("autodoc", "
Parameters
----------
ItemConcept: StepRepr_ProductConcept

Return
-------
None

Description
-----------
Set field ItemConcept.
") SetItemConcept;
		void SetItemConcept(const opencascade::handle<StepRepr_ProductConcept> & ItemConcept);

		/****** StepRepr_ConfigurationItem::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepRepr_ConfigurationItem::SetPurpose ******/
		/****** md5 signature: e2e7302d9004f014ab43f84f266372e2 ******/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "
Parameters
----------
Purpose: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Purpose.
") SetPurpose;
		void SetPurpose(const opencascade::handle<TCollection_HAsciiString> & Purpose);

};


%make_alias(StepRepr_ConfigurationItem)

%extend StepRepr_ConfigurationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepRepr_DataEnvironment *
*********************************/
class StepRepr_DataEnvironment : public Standard_Transient {
	public:
		/****** StepRepr_DataEnvironment::StepRepr_DataEnvironment ******/
		/****** md5 signature: ae43ce0953293c7edc6010f44200ad96 ******/
		%feature("compactdefaultargs") StepRepr_DataEnvironment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_DataEnvironment;
		 StepRepr_DataEnvironment();

		/****** StepRepr_DataEnvironment::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_DataEnvironment::Elements ******/
		/****** md5 signature: aea4d1537edfd5bba28ddba1744d006e ******/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation>

Description
-----------
Returns field Elements.
") Elements;
		opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation> Elements();

		/****** StepRepr_DataEnvironment::Init ******/
		/****** md5 signature: c40b187bd4b7475ab2834baca4418ce9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aElements: StepRepr_HArray1OfPropertyDefinitionRepresentation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation> & aElements);

		/****** StepRepr_DataEnvironment::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_DataEnvironment::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepRepr_DataEnvironment::SetElements ******/
		/****** md5 signature: 3441e62740acf358ba78a65412bbd722 ******/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "
Parameters
----------
Elements: StepRepr_HArray1OfPropertyDefinitionRepresentation

Return
-------
None

Description
-----------
Set field Elements.
") SetElements;
		void SetElements(const opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation> & Elements);

		/****** StepRepr_DataEnvironment::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepRepr_DataEnvironment)

%extend StepRepr_DataEnvironment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepRepr_FunctionallyDefinedTransformation *
***************************************************/
class StepRepr_FunctionallyDefinedTransformation : public Standard_Transient {
	public:
		/****** StepRepr_FunctionallyDefinedTransformation::StepRepr_FunctionallyDefinedTransformation ******/
		/****** md5 signature: d28ae3a94f11b7dd3c3e367079294133 ******/
		%feature("compactdefaultargs") StepRepr_FunctionallyDefinedTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a FunctionallyDefinedTransformation.
") StepRepr_FunctionallyDefinedTransformation;
		 StepRepr_FunctionallyDefinedTransformation();

		/****** StepRepr_FunctionallyDefinedTransformation::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_FunctionallyDefinedTransformation::Init ******/
		/****** md5 signature: 679184af227a462f0e9ce68192470af2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepRepr_FunctionallyDefinedTransformation::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_FunctionallyDefinedTransformation::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepRepr_FunctionallyDefinedTransformation::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepRepr_FunctionallyDefinedTransformation)

%extend StepRepr_FunctionallyDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepRepr_ItemDefinedTransformation *
*******************************************/
class StepRepr_ItemDefinedTransformation : public Standard_Transient {
	public:
		/****** StepRepr_ItemDefinedTransformation::StepRepr_ItemDefinedTransformation ******/
		/****** md5 signature: 52961e3c7258581eee113a41f4df7278 ******/
		%feature("compactdefaultargs") StepRepr_ItemDefinedTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ItemDefinedTransformation;
		 StepRepr_ItemDefinedTransformation();

		/****** StepRepr_ItemDefinedTransformation::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_ItemDefinedTransformation::HasDescription ******/
		/****** md5 signature: 6792c1621c006761fed03425ebc22116 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepRepr_ItemDefinedTransformation::Init ******/
		/****** md5 signature: 0e834570dec89c800ec534731b946b3a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aTransformItem1: StepRepr_RepresentationItem
aTransformItem2: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_RepresentationItem> & aTransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & aTransformItem2);

		/****** StepRepr_ItemDefinedTransformation::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_ItemDefinedTransformation::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepRepr_ItemDefinedTransformation::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepRepr_ItemDefinedTransformation::SetTransformItem1 ******/
		/****** md5 signature: 99732f63aa00bf1a6c69bbf51d876a8c ******/
		%feature("compactdefaultargs") SetTransformItem1;
		%feature("autodoc", "
Parameters
----------
aItem: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetTransformItem1;
		void SetTransformItem1(const opencascade::handle<StepRepr_RepresentationItem> & aItem);

		/****** StepRepr_ItemDefinedTransformation::SetTransformItem2 ******/
		/****** md5 signature: 155a21af40275c1c548422ad48904425 ******/
		%feature("compactdefaultargs") SetTransformItem2;
		%feature("autodoc", "
Parameters
----------
aItem: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetTransformItem2;
		void SetTransformItem2(const opencascade::handle<StepRepr_RepresentationItem> & aItem);

		/****** StepRepr_ItemDefinedTransformation::TransformItem1 ******/
		/****** md5 signature: 105af5bfe3029dc07c8815d24a86086b ******/
		%feature("compactdefaultargs") TransformItem1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") TransformItem1;
		opencascade::handle<StepRepr_RepresentationItem> TransformItem1();

		/****** StepRepr_ItemDefinedTransformation::TransformItem2 ******/
		/****** md5 signature: 82f263a1b8872895f76afa278d5fdd8b ******/
		%feature("compactdefaultargs") TransformItem2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") TransformItem2;
		opencascade::handle<StepRepr_RepresentationItem> TransformItem2();

};


%make_alias(StepRepr_ItemDefinedTransformation)

%extend StepRepr_ItemDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepRepr_MaterialDesignation *
*************************************/
class StepRepr_MaterialDesignation : public Standard_Transient {
	public:
		/****** StepRepr_MaterialDesignation::StepRepr_MaterialDesignation ******/
		/****** md5 signature: 8453f7b5f9d85ebccfde6ec7b3a829aa ******/
		%feature("compactdefaultargs") StepRepr_MaterialDesignation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_MaterialDesignation;
		 StepRepr_MaterialDesignation();

		/****** StepRepr_MaterialDesignation::Init ******/
		/****** md5 signature: f7267e1065b4057b9bfd29e5a193df10 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aOfDefinition: StepRepr_CharacterizedDefinition

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepRepr_CharacterizedDefinition & aOfDefinition);

		/****** StepRepr_MaterialDesignation::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_MaterialDesignation::OfDefinition ******/
		/****** md5 signature: f6fb18134531cbb762b8bb6dbea7a947 ******/
		%feature("compactdefaultargs") OfDefinition;
		%feature("autodoc", "Return
-------
StepRepr_CharacterizedDefinition

Description
-----------
No available documentation.
") OfDefinition;
		StepRepr_CharacterizedDefinition OfDefinition();

		/****** StepRepr_MaterialDesignation::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepRepr_MaterialDesignation::SetOfDefinition ******/
		/****** md5 signature: f4c1378058c94d7eabcf70549787ac9c ******/
		%feature("compactdefaultargs") SetOfDefinition;
		%feature("autodoc", "
Parameters
----------
aOfDefinition: StepRepr_CharacterizedDefinition

Return
-------
None

Description
-----------
No available documentation.
") SetOfDefinition;
		void SetOfDefinition(const StepRepr_CharacterizedDefinition & aOfDefinition);

};


%make_alias(StepRepr_MaterialDesignation)

%extend StepRepr_MaterialDesignation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepRepr_ProductConcept *
********************************/
class StepRepr_ProductConcept : public Standard_Transient {
	public:
		/****** StepRepr_ProductConcept::StepRepr_ProductConcept ******/
		/****** md5 signature: ef6170cfaf63aab095fb7f16098ad7a1 ******/
		%feature("compactdefaultargs") StepRepr_ProductConcept;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ProductConcept;
		 StepRepr_ProductConcept();

		/****** StepRepr_ProductConcept::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_ProductConcept::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepRepr_ProductConcept::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepRepr_ProductConcept::Init ******/
		/****** md5 signature: d98bcba7d21f1e9827572d2e6f71f640 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aMarketContext: StepBasic_ProductConceptContext

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductConceptContext> & aMarketContext);

		/****** StepRepr_ProductConcept::MarketContext ******/
		/****** md5 signature: 9f90da3b6eeed1e681d59f478e320450 ******/
		%feature("compactdefaultargs") MarketContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_ProductConceptContext>

Description
-----------
Returns field MarketContext.
") MarketContext;
		opencascade::handle<StepBasic_ProductConceptContext> MarketContext();

		/****** StepRepr_ProductConcept::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_ProductConcept::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepRepr_ProductConcept::SetId ******/
		/****** md5 signature: 779c5dce2dcbd218d648cf0dfb829a83 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
Id: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****** StepRepr_ProductConcept::SetMarketContext ******/
		/****** md5 signature: ddd893f4cc2fea2ba27e4b3d6845a5ef ******/
		%feature("compactdefaultargs") SetMarketContext;
		%feature("autodoc", "
Parameters
----------
MarketContext: StepBasic_ProductConceptContext

Return
-------
None

Description
-----------
Set field MarketContext.
") SetMarketContext;
		void SetMarketContext(const opencascade::handle<StepBasic_ProductConceptContext> & MarketContext);

		/****** StepRepr_ProductConcept::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepRepr_ProductConcept)

%extend StepRepr_ProductConcept {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepRepr_ProductDefinitionUsage *
****************************************/
class StepRepr_ProductDefinitionUsage : public StepBasic_ProductDefinitionRelationship {
	public:
		/****** StepRepr_ProductDefinitionUsage::StepRepr_ProductDefinitionUsage ******/
		/****** md5 signature: 079840b55209a6f2b488b3c3e52b0a86 ******/
		%feature("compactdefaultargs") StepRepr_ProductDefinitionUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ProductDefinitionUsage;
		 StepRepr_ProductDefinitionUsage();

};


%make_alias(StepRepr_ProductDefinitionUsage)

%extend StepRepr_ProductDefinitionUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepRepr_PropertyDefinition *
************************************/
class StepRepr_PropertyDefinition : public Standard_Transient {
	public:
		/****** StepRepr_PropertyDefinition::StepRepr_PropertyDefinition ******/
		/****** md5 signature: 16e4e41154040db6d9caa674326973fc ******/
		%feature("compactdefaultargs") StepRepr_PropertyDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_PropertyDefinition;
		 StepRepr_PropertyDefinition();

		/****** StepRepr_PropertyDefinition::Definition ******/
		/****** md5 signature: 856af360d89cf0304d403b2890723774 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Return
-------
StepRepr_CharacterizedDefinition

Description
-----------
Returns field Definition.
") Definition;
		StepRepr_CharacterizedDefinition Definition();

		/****** StepRepr_PropertyDefinition::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_PropertyDefinition::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepRepr_PropertyDefinition::Init ******/
		/****** md5 signature: 7f3bfb2ac3ec5fc661a0f7a811cc2791 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aDefinition: StepRepr_CharacterizedDefinition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const StepRepr_CharacterizedDefinition & aDefinition);

		/****** StepRepr_PropertyDefinition::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_PropertyDefinition::SetDefinition ******/
		/****** md5 signature: 62c061ec60cbe49a730f1c7b1da4eb2a ******/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "
Parameters
----------
Definition: StepRepr_CharacterizedDefinition

Return
-------
None

Description
-----------
Set field Definition.
") SetDefinition;
		void SetDefinition(const StepRepr_CharacterizedDefinition & Definition);

		/****** StepRepr_PropertyDefinition::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepRepr_PropertyDefinition::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

};


%make_alias(StepRepr_PropertyDefinition)

%extend StepRepr_PropertyDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepRepr_PropertyDefinitionRelationship *
************************************************/
class StepRepr_PropertyDefinitionRelationship : public Standard_Transient {
	public:
		/****** StepRepr_PropertyDefinitionRelationship::StepRepr_PropertyDefinitionRelationship ******/
		/****** md5 signature: 1fdf4780222f87ed3b53f59755ca8f3a ******/
		%feature("compactdefaultargs") StepRepr_PropertyDefinitionRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_PropertyDefinitionRelationship;
		 StepRepr_PropertyDefinitionRelationship();

		/****** StepRepr_PropertyDefinitionRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_PropertyDefinitionRelationship::Init ******/
		/****** md5 signature: 61bc997f1534b4b5148a4c82031b2578 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelatingPropertyDefinition: StepRepr_PropertyDefinition
aRelatedPropertyDefinition: StepRepr_PropertyDefinition

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_PropertyDefinition> & aRelatingPropertyDefinition, const opencascade::handle<StepRepr_PropertyDefinition> & aRelatedPropertyDefinition);

		/****** StepRepr_PropertyDefinitionRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_PropertyDefinitionRelationship::RelatedPropertyDefinition ******/
		/****** md5 signature: ea57fb961a4b980599456e455b731a05 ******/
		%feature("compactdefaultargs") RelatedPropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
Returns field RelatedPropertyDefinition.
") RelatedPropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> RelatedPropertyDefinition();

		/****** StepRepr_PropertyDefinitionRelationship::RelatingPropertyDefinition ******/
		/****** md5 signature: b0cb79d0d1a50f140631e15a0d16cb7a ******/
		%feature("compactdefaultargs") RelatingPropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
Returns field RelatingPropertyDefinition.
") RelatingPropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> RelatingPropertyDefinition();

		/****** StepRepr_PropertyDefinitionRelationship::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepRepr_PropertyDefinitionRelationship::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepRepr_PropertyDefinitionRelationship::SetRelatedPropertyDefinition ******/
		/****** md5 signature: 5b9718ebfbe1672b9f876a9e389cf5fb ******/
		%feature("compactdefaultargs") SetRelatedPropertyDefinition;
		%feature("autodoc", "
Parameters
----------
RelatedPropertyDefinition: StepRepr_PropertyDefinition

Return
-------
None

Description
-----------
Set field RelatedPropertyDefinition.
") SetRelatedPropertyDefinition;
		void SetRelatedPropertyDefinition(const opencascade::handle<StepRepr_PropertyDefinition> & RelatedPropertyDefinition);

		/****** StepRepr_PropertyDefinitionRelationship::SetRelatingPropertyDefinition ******/
		/****** md5 signature: d8a6217408f497e551b6fbb741d11fd1 ******/
		%feature("compactdefaultargs") SetRelatingPropertyDefinition;
		%feature("autodoc", "
Parameters
----------
RelatingPropertyDefinition: StepRepr_PropertyDefinition

Return
-------
None

Description
-----------
Set field RelatingPropertyDefinition.
") SetRelatingPropertyDefinition;
		void SetRelatingPropertyDefinition(const opencascade::handle<StepRepr_PropertyDefinition> & RelatingPropertyDefinition);

};


%make_alias(StepRepr_PropertyDefinitionRelationship)

%extend StepRepr_PropertyDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepRepr_PropertyDefinitionRepresentation *
**************************************************/
class StepRepr_PropertyDefinitionRepresentation : public Standard_Transient {
	public:
		/****** StepRepr_PropertyDefinitionRepresentation::StepRepr_PropertyDefinitionRepresentation ******/
		/****** md5 signature: 5cfdb8c63345c4cb84ec4137583ca6ca ******/
		%feature("compactdefaultargs") StepRepr_PropertyDefinitionRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_PropertyDefinitionRepresentation;
		 StepRepr_PropertyDefinitionRepresentation();

		/****** StepRepr_PropertyDefinitionRepresentation::Definition ******/
		/****** md5 signature: 943950990706537464fb5f3dde4c0e60 ******/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Return
-------
StepRepr_RepresentedDefinition

Description
-----------
Returns field Definition.
") Definition;
		StepRepr_RepresentedDefinition Definition();

		/****** StepRepr_PropertyDefinitionRepresentation::Init ******/
		/****** md5 signature: 35c06521fd9714a4ee295ee909ff6dfd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aDefinition: StepRepr_RepresentedDefinition
aUsedRepresentation: StepRepr_Representation

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepRepr_RepresentedDefinition & aDefinition, const opencascade::handle<StepRepr_Representation> & aUsedRepresentation);

		/****** StepRepr_PropertyDefinitionRepresentation::SetDefinition ******/
		/****** md5 signature: 4fb88cc9bfd469480d57ae8a203775b0 ******/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "
Parameters
----------
Definition: StepRepr_RepresentedDefinition

Return
-------
None

Description
-----------
Set field Definition.
") SetDefinition;
		void SetDefinition(const StepRepr_RepresentedDefinition & Definition);

		/****** StepRepr_PropertyDefinitionRepresentation::SetUsedRepresentation ******/
		/****** md5 signature: a2f761868ba3b46492c9a4b31481e8d0 ******/
		%feature("compactdefaultargs") SetUsedRepresentation;
		%feature("autodoc", "
Parameters
----------
UsedRepresentation: StepRepr_Representation

Return
-------
None

Description
-----------
Set field UsedRepresentation.
") SetUsedRepresentation;
		void SetUsedRepresentation(const opencascade::handle<StepRepr_Representation> & UsedRepresentation);

		/****** StepRepr_PropertyDefinitionRepresentation::UsedRepresentation ******/
		/****** md5 signature: 6ac63e7984f3778a190713408f0be795 ******/
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


%make_alias(StepRepr_PropertyDefinitionRepresentation)

%extend StepRepr_PropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepRepr_Representation *
********************************/
class StepRepr_Representation : public Standard_Transient {
	public:
		/****** StepRepr_Representation::StepRepr_Representation ******/
		/****** md5 signature: 33b52748087c4d724a8f8210d04c2ddb ******/
		%feature("compactdefaultargs") StepRepr_Representation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Representation.
") StepRepr_Representation;
		 StepRepr_Representation();

		/****** StepRepr_Representation::ContextOfItems ******/
		/****** md5 signature: 1ccb62aa31f3bed89d3dab2875acb398 ******/
		%feature("compactdefaultargs") ContextOfItems;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationContext>

Description
-----------
No available documentation.
") ContextOfItems;
		opencascade::handle<StepRepr_RepresentationContext> ContextOfItems();

		/****** StepRepr_Representation::Init ******/
		/****** md5 signature: 627499e8f427903c12367baab279fd59 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aItems: StepRepr_HArray1OfRepresentationItem
aContextOfItems: StepRepr_RepresentationContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aItems, const opencascade::handle<StepRepr_RepresentationContext> & aContextOfItems);

		/****** StepRepr_Representation::Items ******/
		/****** md5 signature: 98643c210b12e4be17aed588847824dd ******/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_HArray1OfRepresentationItem>

Description
-----------
No available documentation.
") Items;
		opencascade::handle<StepRepr_HArray1OfRepresentationItem> Items();

		/****** StepRepr_Representation::ItemsValue ******/
		/****** md5 signature: 62e4446b4eaba386b3cdf1be029a38a3 ******/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") ItemsValue;
		opencascade::handle<StepRepr_RepresentationItem> ItemsValue(const Standard_Integer num);

		/****** StepRepr_Representation::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_Representation::NbItems ******/
		/****** md5 signature: f3da46c6111cc4b112ff30aff83385d6 ******/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItems;
		Standard_Integer NbItems();

		/****** StepRepr_Representation::SetContextOfItems ******/
		/****** md5 signature: fbb8169f75cbebc9398b0a80d2cd3beb ******/
		%feature("compactdefaultargs") SetContextOfItems;
		%feature("autodoc", "
Parameters
----------
aContextOfItems: StepRepr_RepresentationContext

Return
-------
None

Description
-----------
No available documentation.
") SetContextOfItems;
		void SetContextOfItems(const opencascade::handle<StepRepr_RepresentationContext> & aContextOfItems);

		/****** StepRepr_Representation::SetItems ******/
		/****** md5 signature: 40f3e3541bd2da1c4b4d80ec3d5174fd ******/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "
Parameters
----------
aItems: StepRepr_HArray1OfRepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetItems;
		void SetItems(const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aItems);

		/****** StepRepr_Representation::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepRepr_Representation)

%extend StepRepr_Representation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepRepr_RepresentationContext *
***************************************/
class StepRepr_RepresentationContext : public Standard_Transient {
	public:
		/****** StepRepr_RepresentationContext::StepRepr_RepresentationContext ******/
		/****** md5 signature: 387b039e80073ad3e586481de6b91c31 ******/
		%feature("compactdefaultargs") StepRepr_RepresentationContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RepresentationContext.
") StepRepr_RepresentationContext;
		 StepRepr_RepresentationContext();

		/****** StepRepr_RepresentationContext::ContextIdentifier ******/
		/****** md5 signature: 3b88cf0586009b9bd3138bd2c7449f57 ******/
		%feature("compactdefaultargs") ContextIdentifier;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ContextIdentifier;
		opencascade::handle<TCollection_HAsciiString> ContextIdentifier();

		/****** StepRepr_RepresentationContext::ContextType ******/
		/****** md5 signature: 886ca3920d0cf913a9b4c195c4e1cc8b ******/
		%feature("compactdefaultargs") ContextType;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ContextType;
		opencascade::handle<TCollection_HAsciiString> ContextType();

		/****** StepRepr_RepresentationContext::Init ******/
		/****** md5 signature: f658a616a1c82ce8e3eb89668971eb96 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType);

		/****** StepRepr_RepresentationContext::SetContextIdentifier ******/
		/****** md5 signature: f0556277c612b4cad107cab088a8d99a ******/
		%feature("compactdefaultargs") SetContextIdentifier;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetContextIdentifier;
		void SetContextIdentifier(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier);

		/****** StepRepr_RepresentationContext::SetContextType ******/
		/****** md5 signature: 07c2fe95adf925a25ea56852e396e14b ******/
		%feature("compactdefaultargs") SetContextType;
		%feature("autodoc", "
Parameters
----------
aContextType: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetContextType;
		void SetContextType(const opencascade::handle<TCollection_HAsciiString> & aContextType);

};


%make_alias(StepRepr_RepresentationContext)

%extend StepRepr_RepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepRepr_RepresentationContextReference *
************************************************/
class StepRepr_RepresentationContextReference : public Standard_Transient {
	public:
		/****** StepRepr_RepresentationContextReference::StepRepr_RepresentationContextReference ******/
		/****** md5 signature: c328213af080df48a9b8729b1837422b ******/
		%feature("compactdefaultargs") StepRepr_RepresentationContextReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepRepr_RepresentationContextReference;
		 StepRepr_RepresentationContextReference();

		/****** StepRepr_RepresentationContextReference::ContextIdentifier ******/
		/****** md5 signature: 3b88cf0586009b9bd3138bd2c7449f57 ******/
		%feature("compactdefaultargs") ContextIdentifier;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field ContextIdentifier.
") ContextIdentifier;
		opencascade::handle<TCollection_HAsciiString> ContextIdentifier();

		/****** StepRepr_RepresentationContextReference::Init ******/
		/****** md5 signature: 2ccf5654d2b711006d7a780ce817e13c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theContextIdentifier: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theContextIdentifier);

		/****** StepRepr_RepresentationContextReference::SetContextIdentifier ******/
		/****** md5 signature: 60f8090548271b758b7db604c2dbd754 ******/
		%feature("compactdefaultargs") SetContextIdentifier;
		%feature("autodoc", "
Parameters
----------
theContextIdentifier: TCollection_HAsciiString

Return
-------
None

Description
-----------
Sets field ContextIdentifier.
") SetContextIdentifier;
		void SetContextIdentifier(const opencascade::handle<TCollection_HAsciiString> & theContextIdentifier);

};


%make_alias(StepRepr_RepresentationContextReference)

%extend StepRepr_RepresentationContextReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepRepr_RepresentationItem *
************************************/
class StepRepr_RepresentationItem : public Standard_Transient {
	public:
		/****** StepRepr_RepresentationItem::StepRepr_RepresentationItem ******/
		/****** md5 signature: 37a8e7bb3d461615b8a44f211e26dc79 ******/
		%feature("compactdefaultargs") StepRepr_RepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RepresentationItem.
") StepRepr_RepresentationItem;
		 StepRepr_RepresentationItem();

		/****** StepRepr_RepresentationItem::Init ******/
		/****** md5 signature: e10f4ffe4365262d2d9a5484d96325b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepRepr_RepresentationItem::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_RepresentationItem::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

};


%make_alias(StepRepr_RepresentationItem)

%extend StepRepr_RepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepRepr_RepresentationMap *
***********************************/
class StepRepr_RepresentationMap : public Standard_Transient {
	public:
		/****** StepRepr_RepresentationMap::StepRepr_RepresentationMap ******/
		/****** md5 signature: 896f4ed3513dd134cf174da86456bac8 ******/
		%feature("compactdefaultargs") StepRepr_RepresentationMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RepresentationMap.
") StepRepr_RepresentationMap;
		 StepRepr_RepresentationMap();

		/****** StepRepr_RepresentationMap::Init ******/
		/****** md5 signature: 1a601c08ba5aa6c4f1e277c7b07878f5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aMappingOrigin: StepRepr_RepresentationItem
aMappedRepresentation: StepRepr_Representation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepRepr_RepresentationItem> & aMappingOrigin, const opencascade::handle<StepRepr_Representation> & aMappedRepresentation);

		/****** StepRepr_RepresentationMap::MappedRepresentation ******/
		/****** md5 signature: 69dfbc3c34bc33c6fa2f7417b15f7cd9 ******/
		%feature("compactdefaultargs") MappedRepresentation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
No available documentation.
") MappedRepresentation;
		opencascade::handle<StepRepr_Representation> MappedRepresentation();

		/****** StepRepr_RepresentationMap::MappingOrigin ******/
		/****** md5 signature: 0f368209ec93575c5d183a111b618e06 ******/
		%feature("compactdefaultargs") MappingOrigin;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") MappingOrigin;
		opencascade::handle<StepRepr_RepresentationItem> MappingOrigin();

		/****** StepRepr_RepresentationMap::SetMappedRepresentation ******/
		/****** md5 signature: 16e49538745f2df2ddd16336dd061d41 ******/
		%feature("compactdefaultargs") SetMappedRepresentation;
		%feature("autodoc", "
Parameters
----------
aMappedRepresentation: StepRepr_Representation

Return
-------
None

Description
-----------
No available documentation.
") SetMappedRepresentation;
		void SetMappedRepresentation(const opencascade::handle<StepRepr_Representation> & aMappedRepresentation);

		/****** StepRepr_RepresentationMap::SetMappingOrigin ******/
		/****** md5 signature: 819e8c0f7ff88df9892fce1b5e10b8d9 ******/
		%feature("compactdefaultargs") SetMappingOrigin;
		%feature("autodoc", "
Parameters
----------
aMappingOrigin: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetMappingOrigin;
		void SetMappingOrigin(const opencascade::handle<StepRepr_RepresentationItem> & aMappingOrigin);

};


%make_alias(StepRepr_RepresentationMap)

%extend StepRepr_RepresentationMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepRepr_RepresentationOrRepresentationReference *
*********************************************************/
class StepRepr_RepresentationOrRepresentationReference : public StepData_SelectType {
	public:
		/****** StepRepr_RepresentationOrRepresentationReference::StepRepr_RepresentationOrRepresentationReference ******/
		/****** md5 signature: 2ee1db7ab40515398436157a4ae8c738 ******/
		%feature("compactdefaultargs") StepRepr_RepresentationOrRepresentationReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_RepresentationOrRepresentationReference;
		 StepRepr_RepresentationOrRepresentationReference();

		/****** StepRepr_RepresentationOrRepresentationReference::CaseNum ******/
		/****** md5 signature: b9dbcdb5b972500c66bc8bc08f651d0a ******/
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
Recognizes a kind of RepresentationOrRepresentationReference select type -- 1 -> Representation -- 2 -> RepresentationReference.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepRepr_RepresentationOrRepresentationReference::Representation ******/
		/****** md5 signature: b68b8aa0615de130a54bdd2ee7c69058 ******/
		%feature("compactdefaultargs") Representation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
Returns Value as Representation (or Null if another type).
") Representation;
		opencascade::handle<StepRepr_Representation> Representation();

		/****** StepRepr_RepresentationOrRepresentationReference::RepresentationReference ******/
		/****** md5 signature: 461a26e5dad75c33acefac7805351baf ******/
		%feature("compactdefaultargs") RepresentationReference;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationReference>

Description
-----------
Returns Value as RepresentationReference (or Null if another type).
") RepresentationReference;
		opencascade::handle<StepRepr_RepresentationReference> RepresentationReference();

};


%extend StepRepr_RepresentationOrRepresentationReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepRepr_RepresentationReference *
*****************************************/
class StepRepr_RepresentationReference : public Standard_Transient {
	public:
		/****** StepRepr_RepresentationReference::StepRepr_RepresentationReference ******/
		/****** md5 signature: 46eaeb50ae59ce7f0b7436ba049fb18a ******/
		%feature("compactdefaultargs") StepRepr_RepresentationReference;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepRepr_RepresentationReference;
		 StepRepr_RepresentationReference();

		/****** StepRepr_RepresentationReference::ContextOfItems ******/
		/****** md5 signature: c7fff1cb1d425ac6c93ad8199b152c1a ******/
		%feature("compactdefaultargs") ContextOfItems;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationContextReference>

Description
-----------
Returns field ContextOfItems.
") ContextOfItems;
		opencascade::handle<StepRepr_RepresentationContextReference> ContextOfItems();

		/****** StepRepr_RepresentationReference::Id ******/
		/****** md5 signature: cad437aa1c6f9043742098c562124f9e ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Id.
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****** StepRepr_RepresentationReference::Init ******/
		/****** md5 signature: 6936a0ecf85a476f465a79b99ca725cc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theId: TCollection_HAsciiString
theContextOfItems: StepRepr_RepresentationContextReference

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theId, const opencascade::handle<StepRepr_RepresentationContextReference> & theContextOfItems);

		/****** StepRepr_RepresentationReference::SetContextOfItems ******/
		/****** md5 signature: 9c4f4a49658882a41529c2d80e4b9d11 ******/
		%feature("compactdefaultargs") SetContextOfItems;
		%feature("autodoc", "
Parameters
----------
theContextOfItems: StepRepr_RepresentationContextReference

Return
-------
None

Description
-----------
Sets field ContextOfItems.
") SetContextOfItems;
		void SetContextOfItems(const opencascade::handle<StepRepr_RepresentationContextReference> & theContextOfItems);

		/****** StepRepr_RepresentationReference::SetId ******/
		/****** md5 signature: b1f60d3e5102c6da05e855395131256d ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
theId: TCollection_HAsciiString

Return
-------
None

Description
-----------
Sets field Id.
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & theId);

};


%make_alias(StepRepr_RepresentationReference)

%extend StepRepr_RepresentationReference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepRepr_RepresentationRelationship *
********************************************/
class StepRepr_RepresentationRelationship : public Standard_Transient {
	public:
		/****** StepRepr_RepresentationRelationship::StepRepr_RepresentationRelationship ******/
		/****** md5 signature: a42b6b05a5338767a000a85a0591f36a ******/
		%feature("compactdefaultargs") StepRepr_RepresentationRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RepresentationRelationship.
") StepRepr_RepresentationRelationship;
		 StepRepr_RepresentationRelationship();

		/****** StepRepr_RepresentationRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_RepresentationRelationship::HasDescription ******/
		/****** md5 signature: 083af65e5ebbf93f76d20e3d8763206e ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepRepr_RepresentationRelationship::Init ******/
		/****** md5 signature: 148c2be5cfa53e5b136d44a9d5e3c232 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRep1: StepRepr_Representation
aRep2: StepRepr_Representation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_Representation> & aRep1, const opencascade::handle<StepRepr_Representation> & aRep2);

		/****** StepRepr_RepresentationRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_RepresentationRelationship::Rep1 ******/
		/****** md5 signature: 9a17e85d6a8a4068f0f8d49d69881dc2 ******/
		%feature("compactdefaultargs") Rep1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
No available documentation.
") Rep1;
		opencascade::handle<StepRepr_Representation> Rep1();

		/****** StepRepr_RepresentationRelationship::Rep2 ******/
		/****** md5 signature: 183edc94b9218ee5501ae963311b4c0f ******/
		%feature("compactdefaultargs") Rep2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_Representation>

Description
-----------
No available documentation.
") Rep2;
		opencascade::handle<StepRepr_Representation> Rep2();

		/****** StepRepr_RepresentationRelationship::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepRepr_RepresentationRelationship::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepRepr_RepresentationRelationship::SetRep1 ******/
		/****** md5 signature: 4d7770d5bdc46eb8875384b2da70d66e ******/
		%feature("compactdefaultargs") SetRep1;
		%feature("autodoc", "
Parameters
----------
aRep1: StepRepr_Representation

Return
-------
None

Description
-----------
No available documentation.
") SetRep1;
		void SetRep1(const opencascade::handle<StepRepr_Representation> & aRep1);

		/****** StepRepr_RepresentationRelationship::SetRep2 ******/
		/****** md5 signature: a0bc4ecdb4135d7ff940a330438c4670 ******/
		%feature("compactdefaultargs") SetRep2;
		%feature("autodoc", "
Parameters
----------
aRep2: StepRepr_Representation

Return
-------
None

Description
-----------
No available documentation.
") SetRep2;
		void SetRep2(const opencascade::handle<StepRepr_Representation> & aRep2);

};


%make_alias(StepRepr_RepresentationRelationship)

%extend StepRepr_RepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepRepr_RepresentedDefinition *
***************************************/
class StepRepr_RepresentedDefinition : public StepData_SelectType {
	public:
		/****** StepRepr_RepresentedDefinition::StepRepr_RepresentedDefinition ******/
		/****** md5 signature: 4d002e3a6f0fe3de061ca2b25b0afda0 ******/
		%feature("compactdefaultargs") StepRepr_RepresentedDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_RepresentedDefinition;
		 StepRepr_RepresentedDefinition();

		/****** StepRepr_RepresentedDefinition::CaseNum ******/
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
Recognizes a kind of RepresentedDefinition select type 1 -> GeneralProperty from StepBasic 2 -> PropertyDefinition from StepRepr 3 -> PropertyDefinitionRelationship from StepRepr 4 -> ShapeAspect from StepRepr 5 -> ShapeAspectRelationship from StepRepr 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepRepr_RepresentedDefinition::GeneralProperty ******/
		/****** md5 signature: 644fc2281dcbe4ea457975f6595935d0 ******/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_GeneralProperty>

Description
-----------
Returns Value as GeneralProperty (or Null if another type).
") GeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****** StepRepr_RepresentedDefinition::PropertyDefinition ******/
		/****** md5 signature: 4b7b4910929a0e1832918f8266d39349 ******/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinition>

Description
-----------
Returns Value as PropertyDefinition (or Null if another type).
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****** StepRepr_RepresentedDefinition::PropertyDefinitionRelationship ******/
		/****** md5 signature: aaa132671e13ca417adc8ca962dee750 ******/
		%feature("compactdefaultargs") PropertyDefinitionRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_PropertyDefinitionRelationship>

Description
-----------
Returns Value as PropertyDefinitionRelationship (or Null if another type).
") PropertyDefinitionRelationship;
		opencascade::handle<StepRepr_PropertyDefinitionRelationship> PropertyDefinitionRelationship();

		/****** StepRepr_RepresentedDefinition::ShapeAspect ******/
		/****** md5 signature: 6c476d31e71221a87c411540ef5855cb ******/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
Returns Value as ShapeAspect (or Null if another type).
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****** StepRepr_RepresentedDefinition::ShapeAspectRelationship ******/
		/****** md5 signature: 35bed4b7262e5cb161ba72768027d32c ******/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>

Description
-----------
Returns Value as ShapeAspectRelationship (or Null if another type).
") ShapeAspectRelationship;
		opencascade::handle<StepRepr_ShapeAspectRelationship> ShapeAspectRelationship();

};


%extend StepRepr_RepresentedDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepRepr_ShapeAspect *
*****************************/
class StepRepr_ShapeAspect : public Standard_Transient {
	public:
		/****** StepRepr_ShapeAspect::StepRepr_ShapeAspect ******/
		/****** md5 signature: 80a814740fdb49c0ee718ddbe46f1abe ******/
		%feature("compactdefaultargs") StepRepr_ShapeAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ShapeAspect.
") StepRepr_ShapeAspect;
		 StepRepr_ShapeAspect();

		/****** StepRepr_ShapeAspect::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_ShapeAspect::Init ******/
		/****** md5 signature: b67a95d496189fb2cc1606d31ee71164 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aOfShape: StepRepr_ProductDefinitionShape
aProductDefinitional: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & aOfShape, const StepData_Logical aProductDefinitional);

		/****** StepRepr_ShapeAspect::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_ShapeAspect::OfShape ******/
		/****** md5 signature: e7dbf664ed34fbf02923aa01d592dda3 ******/
		%feature("compactdefaultargs") OfShape;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductDefinitionShape>

Description
-----------
No available documentation.
") OfShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> OfShape();

		/****** StepRepr_ShapeAspect::ProductDefinitional ******/
		/****** md5 signature: 55005c320f0ef33fb8aa2657e0040f0b ******/
		%feature("compactdefaultargs") ProductDefinitional;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") ProductDefinitional;
		StepData_Logical ProductDefinitional();

		/****** StepRepr_ShapeAspect::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepRepr_ShapeAspect::SetName ******/
		/****** md5 signature: 1e0b00d9eb163c8a0cdbb986e2ee24f6 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****** StepRepr_ShapeAspect::SetOfShape ******/
		/****** md5 signature: 7d21292b3a9744284e4fb90798b65035 ******/
		%feature("compactdefaultargs") SetOfShape;
		%feature("autodoc", "
Parameters
----------
aOfShape: StepRepr_ProductDefinitionShape

Return
-------
None

Description
-----------
No available documentation.
") SetOfShape;
		void SetOfShape(const opencascade::handle<StepRepr_ProductDefinitionShape> & aOfShape);

		/****** StepRepr_ShapeAspect::SetProductDefinitional ******/
		/****** md5 signature: 21b187037bb439bf46ff055cf1bc793e ******/
		%feature("compactdefaultargs") SetProductDefinitional;
		%feature("autodoc", "
Parameters
----------
aProductDefinitional: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetProductDefinitional;
		void SetProductDefinitional(const StepData_Logical aProductDefinitional);

};


%make_alias(StepRepr_ShapeAspect)

%extend StepRepr_ShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepRepr_ShapeAspectRelationship *
*****************************************/
class StepRepr_ShapeAspectRelationship : public Standard_Transient {
	public:
		/****** StepRepr_ShapeAspectRelationship::StepRepr_ShapeAspectRelationship ******/
		/****** md5 signature: eb73e2c18c73bd4a02fb8383fdf6229e ******/
		%feature("compactdefaultargs") StepRepr_ShapeAspectRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ShapeAspectRelationship;
		 StepRepr_ShapeAspectRelationship();

		/****** StepRepr_ShapeAspectRelationship::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Description.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_ShapeAspectRelationship::HasDescription ******/
		/****** md5 signature: 819ef9a3dced474861e1980d901a2978 ******/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field Description is defined.
") HasDescription;
		Standard_Boolean HasDescription();

		/****** StepRepr_ShapeAspectRelationship::Init ******/
		/****** md5 signature: 527c41c88cfe4f6d24a6a0678ed1b83e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingShapeAspect: StepRepr_ShapeAspect
aRelatedShapeAspect: StepRepr_ShapeAspect

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_ShapeAspect> & aRelatingShapeAspect, const opencascade::handle<StepRepr_ShapeAspect> & aRelatedShapeAspect);

		/****** StepRepr_ShapeAspectRelationship::Name ******/
		/****** md5 signature: 6bcb97f17b57cae0750fd29eac20499c ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field Name.
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****** StepRepr_ShapeAspectRelationship::RelatedShapeAspect ******/
		/****** md5 signature: 4e24f7fd58965884fcad774d0970e84f ******/
		%feature("compactdefaultargs") RelatedShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
Returns field RelatedShapeAspect.
") RelatedShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> RelatedShapeAspect();

		/****** StepRepr_ShapeAspectRelationship::RelatingShapeAspect ******/
		/****** md5 signature: 7daad1030e5b595738d2d053ffbf2718 ******/
		%feature("compactdefaultargs") RelatingShapeAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ShapeAspect>

Description
-----------
Returns field RelatingShapeAspect.
") RelatingShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> RelatingShapeAspect();

		/****** StepRepr_ShapeAspectRelationship::SetDescription ******/
		/****** md5 signature: 11ff45bab13c9c85c44619d6c4501da8 ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
Description: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Description.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****** StepRepr_ShapeAspectRelationship::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
Name: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field Name.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****** StepRepr_ShapeAspectRelationship::SetRelatedShapeAspect ******/
		/****** md5 signature: ae706bf8cb203f6e2aeabf2d623cdfcf ******/
		%feature("compactdefaultargs") SetRelatedShapeAspect;
		%feature("autodoc", "
Parameters
----------
RelatedShapeAspect: StepRepr_ShapeAspect

Return
-------
None

Description
-----------
Set field RelatedShapeAspect.
") SetRelatedShapeAspect;
		void SetRelatedShapeAspect(const opencascade::handle<StepRepr_ShapeAspect> & RelatedShapeAspect);

		/****** StepRepr_ShapeAspectRelationship::SetRelatingShapeAspect ******/
		/****** md5 signature: ee826437bd3aeb2ed5c09ea025f3f508 ******/
		%feature("compactdefaultargs") SetRelatingShapeAspect;
		%feature("autodoc", "
Parameters
----------
RelatingShapeAspect: StepRepr_ShapeAspect

Return
-------
None

Description
-----------
Set field RelatingShapeAspect.
") SetRelatingShapeAspect;
		void SetRelatingShapeAspect(const opencascade::handle<StepRepr_ShapeAspect> & RelatingShapeAspect);

};


%make_alias(StepRepr_ShapeAspectRelationship)

%extend StepRepr_ShapeAspectRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepRepr_ShapeDefinition *
*********************************/
class StepRepr_ShapeDefinition : public StepData_SelectType {
	public:
		/****** StepRepr_ShapeDefinition::StepRepr_ShapeDefinition ******/
		/****** md5 signature: d314e283d8e85a21a8420b2b8e67aaad ******/
		%feature("compactdefaultargs") StepRepr_ShapeDefinition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ShapeDefinition SelectType.
") StepRepr_ShapeDefinition;
		 StepRepr_ShapeDefinition();

		/****** StepRepr_ShapeDefinition::CaseNum ******/
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
Recognizes a ShapeDefinition Kind Entity that is: 1 -> ProductDefinitionShape 2 -> ShapeAspect 3 -> ShapeAspectRelationship 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepRepr_ShapeDefinition::ProductDefinitionShape ******/
		/****** md5 signature: b30663c40bd2822cf899d97bff9d9f32 ******/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ProductDefinitionShape>

Description
-----------
returns Value as a ProductDefinitionShape (Null if another type).
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****** StepRepr_ShapeDefinition::ShapeAspect ******/
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

		/****** StepRepr_ShapeDefinition::ShapeAspectRelationship ******/
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


%extend StepRepr_ShapeDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepRepr_SuppliedPartRelationship *
******************************************/
class StepRepr_SuppliedPartRelationship : public StepBasic_ProductDefinitionRelationship {
	public:
		/****** StepRepr_SuppliedPartRelationship::StepRepr_SuppliedPartRelationship ******/
		/****** md5 signature: b49c6f9def2008a89ea4f62cfe28e190 ******/
		%feature("compactdefaultargs") StepRepr_SuppliedPartRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_SuppliedPartRelationship;
		 StepRepr_SuppliedPartRelationship();

};


%make_alias(StepRepr_SuppliedPartRelationship)

%extend StepRepr_SuppliedPartRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepRepr_Transformation *
********************************/
class StepRepr_Transformation : public StepData_SelectType {
	public:
		/****** StepRepr_Transformation::StepRepr_Transformation ******/
		/****** md5 signature: c1c7671e77dbb46813fde74fb44323fd ******/
		%feature("compactdefaultargs") StepRepr_Transformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Transformation SelectType.
") StepRepr_Transformation;
		 StepRepr_Transformation();

		/****** StepRepr_Transformation::CaseNum ******/
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
Recognizes a Transformation Kind Entity that is: 1 -> ItemDefinedTransformation 2 -> FunctionallyDefinedTransformation 0 else.
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepRepr_Transformation::FunctionallyDefinedTransformation ******/
		/****** md5 signature: 6406b059ed28a6f551d59c18c4e9caa2 ******/
		%feature("compactdefaultargs") FunctionallyDefinedTransformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_FunctionallyDefinedTransformation>

Description
-----------
returns Value as a FunctionallyDefinedTransformation (Null if another type).
") FunctionallyDefinedTransformation;
		opencascade::handle<StepRepr_FunctionallyDefinedTransformation> FunctionallyDefinedTransformation();

		/****** StepRepr_Transformation::ItemDefinedTransformation ******/
		/****** md5 signature: 1ecfef967c45a22eea8d75f88475bd67 ******/
		%feature("compactdefaultargs") ItemDefinedTransformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ItemDefinedTransformation>

Description
-----------
returns Value as a ItemDefinedTransformation (Null if another type).
") ItemDefinedTransformation;
		opencascade::handle<StepRepr_ItemDefinedTransformation> ItemDefinedTransformation();

};


%extend StepRepr_Transformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepRepr_AssemblyComponentUsage *
****************************************/
class StepRepr_AssemblyComponentUsage : public StepRepr_ProductDefinitionUsage {
	public:
		/****** StepRepr_AssemblyComponentUsage::StepRepr_AssemblyComponentUsage ******/
		/****** md5 signature: adda9623c116941d43609c80cfbbc6f6 ******/
		%feature("compactdefaultargs") StepRepr_AssemblyComponentUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_AssemblyComponentUsage;
		 StepRepr_AssemblyComponentUsage();

		/****** StepRepr_AssemblyComponentUsage::HasReferenceDesignator ******/
		/****** md5 signature: 9a8965731acca81e6f70d595000dd8d7 ******/
		%feature("compactdefaultargs") HasReferenceDesignator;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if optional field ReferenceDesignator is defined.
") HasReferenceDesignator;
		Standard_Boolean HasReferenceDesignator();

		/****** StepRepr_AssemblyComponentUsage::Init ******/
		/****** md5 signature: 3f50b9f78be6c04cd1810769c2dc5d8f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinition
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinition
hasReferenceDesignator: bool
aReferenceDesignator: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aReferenceDesignator);

		/****** StepRepr_AssemblyComponentUsage::Init ******/
		/****** md5 signature: 0db59e8de9f915b20937e4ea3f16a887 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinitionOrReference
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinitionOrReference
hasReferenceDesignator: bool
aReferenceDesignator: TCollection_HAsciiString

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aReferenceDesignator);

		/****** StepRepr_AssemblyComponentUsage::ReferenceDesignator ******/
		/****** md5 signature: 3f33fa46643916f54660af9ace9ee783 ******/
		%feature("compactdefaultargs") ReferenceDesignator;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field ReferenceDesignator.
") ReferenceDesignator;
		opencascade::handle<TCollection_HAsciiString> ReferenceDesignator();

		/****** StepRepr_AssemblyComponentUsage::SetReferenceDesignator ******/
		/****** md5 signature: 13f84166ca951927e0ee687095c2a9ab ******/
		%feature("compactdefaultargs") SetReferenceDesignator;
		%feature("autodoc", "
Parameters
----------
ReferenceDesignator: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field ReferenceDesignator.
") SetReferenceDesignator;
		void SetReferenceDesignator(const opencascade::handle<TCollection_HAsciiString> & ReferenceDesignator);

};


%make_alias(StepRepr_AssemblyComponentUsage)

%extend StepRepr_AssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepRepr_BooleanRepresentationItem *
*******************************************/
class StepRepr_BooleanRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_BooleanRepresentationItem::StepRepr_BooleanRepresentationItem ******/
		/****** md5 signature: 62d7896bd9830a80036b18396d82fd0a ******/
		%feature("compactdefaultargs") StepRepr_BooleanRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BooleanRepresentationItem.
") StepRepr_BooleanRepresentationItem;
		 StepRepr_BooleanRepresentationItem();

		/****** StepRepr_BooleanRepresentationItem::Init ******/
		/****** md5 signature: 6a7222d2685c3d70e4f18fe4d13da71c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theValue: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const Standard_Boolean theValue);

		/****** StepRepr_BooleanRepresentationItem::SetValue ******/
		/****** md5 signature: c15947db8f4c3ac9a4e790722adebad8 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const Standard_Boolean theValue);

		/****** StepRepr_BooleanRepresentationItem::Value ******/
		/****** md5 signature: ef17b191f201eb6049d354dba003460b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value();

};


%make_alias(StepRepr_BooleanRepresentationItem)

%extend StepRepr_BooleanRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepRepr_CharacterizedRepresentation *
*********************************************/
class StepRepr_CharacterizedRepresentation : public StepRepr_Representation {
	public:
		/****** StepRepr_CharacterizedRepresentation::StepRepr_CharacterizedRepresentation ******/
		/****** md5 signature: ed8066e5daca3e49090f23b3fc9f846c ******/
		%feature("compactdefaultargs") StepRepr_CharacterizedRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_CharacterizedRepresentation;
		 StepRepr_CharacterizedRepresentation();

		/****** StepRepr_CharacterizedRepresentation::Description ******/
		/****** md5 signature: 2b7d3354860c933b206eaf0e345a6f94 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_CharacterizedRepresentation::Init ******/
		/****** md5 signature: 8c8beec0055e1bdcacac4c651c1459a5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theItems: StepRepr_HArray1OfRepresentationItem
theContextOfItems: StepRepr_RepresentationContext

Return
-------
None

Description
-----------
Returns a CharacterizedRepresentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theItems, const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems);

		/****** StepRepr_CharacterizedRepresentation::SetDescription ******/
		/****** md5 signature: b467a4923a6eae88022d3ef88d50bd20 ******/
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
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & theDescription);

};


%make_alias(StepRepr_CharacterizedRepresentation)

%extend StepRepr_CharacterizedRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepRepr_CompShAspAndDatumFeatAndShAsp *
***********************************************/
class StepRepr_CompShAspAndDatumFeatAndShAsp : public StepRepr_ShapeAspect {
	public:
		/****** StepRepr_CompShAspAndDatumFeatAndShAsp::StepRepr_CompShAspAndDatumFeatAndShAsp ******/
		/****** md5 signature: 80b00189ebca95f074b2966f12738559 ******/
		%feature("compactdefaultargs") StepRepr_CompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_CompShAspAndDatumFeatAndShAsp;
		 StepRepr_CompShAspAndDatumFeatAndShAsp();

};


%make_alias(StepRepr_CompShAspAndDatumFeatAndShAsp)

%extend StepRepr_CompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepRepr_CompositeShapeAspect *
**************************************/
class StepRepr_CompositeShapeAspect : public StepRepr_ShapeAspect {
	public:
		/****** StepRepr_CompositeShapeAspect::StepRepr_CompositeShapeAspect ******/
		/****** md5 signature: bd00f1f319059814374e098d85e5208f ******/
		%feature("compactdefaultargs") StepRepr_CompositeShapeAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_CompositeShapeAspect;
		 StepRepr_CompositeShapeAspect();

};


%make_alias(StepRepr_CompositeShapeAspect)

%extend StepRepr_CompositeShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepRepr_CompoundRepresentationItem *
********************************************/
class StepRepr_CompoundRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_CompoundRepresentationItem::StepRepr_CompoundRepresentationItem ******/
		/****** md5 signature: df9e4d417aaca32a5a4f8ab1fbd73f2b ******/
		%feature("compactdefaultargs") StepRepr_CompoundRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_CompoundRepresentationItem;
		 StepRepr_CompoundRepresentationItem();

		/****** StepRepr_CompoundRepresentationItem::Init ******/
		/****** md5 signature: 0207af26d68998cbecff716d74fb6c21 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
item_element: StepRepr_HArray1OfRepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & item_element);

		/****** StepRepr_CompoundRepresentationItem::ItemElement ******/
		/****** md5 signature: 3b036e99465091870d7ffbc06eecf21a ******/
		%feature("compactdefaultargs") ItemElement;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_HArray1OfRepresentationItem>

Description
-----------
No available documentation.
") ItemElement;
		opencascade::handle<StepRepr_HArray1OfRepresentationItem> ItemElement();

		/****** StepRepr_CompoundRepresentationItem::ItemElementValue ******/
		/****** md5 signature: 33efa7abc73652a485f3b432b7f5b73c ******/
		%feature("compactdefaultargs") ItemElementValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") ItemElementValue;
		opencascade::handle<StepRepr_RepresentationItem> ItemElementValue(const Standard_Integer num);

		/****** StepRepr_CompoundRepresentationItem::NbItemElement ******/
		/****** md5 signature: c297bb315bbd175c5daaa0b61ca7effd ******/
		%feature("compactdefaultargs") NbItemElement;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbItemElement;
		Standard_Integer NbItemElement();

		/****** StepRepr_CompoundRepresentationItem::SetItemElement ******/
		/****** md5 signature: 5329c3548b0d522d52bd7f8d969d950c ******/
		%feature("compactdefaultargs") SetItemElement;
		%feature("autodoc", "
Parameters
----------
item_element: StepRepr_HArray1OfRepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetItemElement;
		void SetItemElement(const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & item_element);

		/****** StepRepr_CompoundRepresentationItem::SetItemElementValue ******/
		/****** md5 signature: e7c7ae18e6a1cdef709535c771f1533f ******/
		%feature("compactdefaultargs") SetItemElementValue;
		%feature("autodoc", "
Parameters
----------
num: int
anelement: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetItemElementValue;
		void SetItemElementValue(const Standard_Integer num, const opencascade::handle<StepRepr_RepresentationItem> & anelement);

};


%make_alias(StepRepr_CompoundRepresentationItem)

%extend StepRepr_CompoundRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepRepr_ConstructiveGeometryRepresentation *
****************************************************/
class StepRepr_ConstructiveGeometryRepresentation : public StepRepr_Representation {
	public:
		/****** StepRepr_ConstructiveGeometryRepresentation::StepRepr_ConstructiveGeometryRepresentation ******/
		/****** md5 signature: 832bfed2404178e8768857a88c4c9ddc ******/
		%feature("compactdefaultargs") StepRepr_ConstructiveGeometryRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConstructiveGeometryRepresentation.
") StepRepr_ConstructiveGeometryRepresentation;
		 StepRepr_ConstructiveGeometryRepresentation();

};


%make_alias(StepRepr_ConstructiveGeometryRepresentation)

%extend StepRepr_ConstructiveGeometryRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class StepRepr_ConstructiveGeometryRepresentationRelationship *
****************************************************************/
class StepRepr_ConstructiveGeometryRepresentationRelationship : public StepRepr_RepresentationRelationship {
	public:
		/****** StepRepr_ConstructiveGeometryRepresentationRelationship::StepRepr_ConstructiveGeometryRepresentationRelationship ******/
		/****** md5 signature: 5fc5b47a61b6dca47a1ab2ce8b330b38 ******/
		%feature("compactdefaultargs") StepRepr_ConstructiveGeometryRepresentationRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ConstructiveGeometryRepresentationRelationship;
		 StepRepr_ConstructiveGeometryRepresentationRelationship();

};


%make_alias(StepRepr_ConstructiveGeometryRepresentationRelationship)

%extend StepRepr_ConstructiveGeometryRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepRepr_DefinitionalRepresentation *
********************************************/
class StepRepr_DefinitionalRepresentation : public StepRepr_Representation {
	public:
		/****** StepRepr_DefinitionalRepresentation::StepRepr_DefinitionalRepresentation ******/
		/****** md5 signature: 8ff43d8048bd3812b2ad2b07688cfe26 ******/
		%feature("compactdefaultargs") StepRepr_DefinitionalRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DefinitionalRepresentation.
") StepRepr_DefinitionalRepresentation;
		 StepRepr_DefinitionalRepresentation();

};


%make_alias(StepRepr_DefinitionalRepresentation)

%extend StepRepr_DefinitionalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepRepr_DerivedShapeAspect *
************************************/
class StepRepr_DerivedShapeAspect : public StepRepr_ShapeAspect {
	public:
		/****** StepRepr_DerivedShapeAspect::StepRepr_DerivedShapeAspect ******/
		/****** md5 signature: 9288d343ad05daa66df56d0af143d6a3 ******/
		%feature("compactdefaultargs") StepRepr_DerivedShapeAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_DerivedShapeAspect;
		 StepRepr_DerivedShapeAspect();

};


%make_alias(StepRepr_DerivedShapeAspect)

%extend StepRepr_DerivedShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class StepRepr_DescriptiveRepresentationItem *
***********************************************/
class StepRepr_DescriptiveRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_DescriptiveRepresentationItem::StepRepr_DescriptiveRepresentationItem ******/
		/****** md5 signature: f3fc83a1e7192dddc24cd23a0ab7f5a2 ******/
		%feature("compactdefaultargs") StepRepr_DescriptiveRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DescriptiveRepresentationItem.
") StepRepr_DescriptiveRepresentationItem;
		 StepRepr_DescriptiveRepresentationItem();

		/****** StepRepr_DescriptiveRepresentationItem::Description ******/
		/****** md5 signature: 68309bdf9d57a000073490b39f8e7a41 ******/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****** StepRepr_DescriptiveRepresentationItem::Init ******/
		/****** md5 signature: 679184af227a462f0e9ce68192470af2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****** StepRepr_DescriptiveRepresentationItem::SetDescription ******/
		/****** md5 signature: adddd13a906718df58a2eee683a382cf ******/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "
Parameters
----------
aDescription: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

};


%make_alias(StepRepr_DescriptiveRepresentationItem)

%extend StepRepr_DescriptiveRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepRepr_ExternallyDefinedRepresentation *
*************************************************/
class StepRepr_ExternallyDefinedRepresentation : public StepRepr_Representation {
	public:
		/****** StepRepr_ExternallyDefinedRepresentation::StepRepr_ExternallyDefinedRepresentation ******/
		/****** md5 signature: b83191137eb6a2e7c54523c3b2e2d3ac ******/
		%feature("compactdefaultargs") StepRepr_ExternallyDefinedRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ExternallyDefinedRepresentation;
		 StepRepr_ExternallyDefinedRepresentation();

};


%make_alias(StepRepr_ExternallyDefinedRepresentation)

%extend StepRepr_ExternallyDefinedRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepRepr_FeatureForDatumTargetRelationship *
***************************************************/
class StepRepr_FeatureForDatumTargetRelationship : public StepRepr_ShapeAspectRelationship {
	public:
		/****** StepRepr_FeatureForDatumTargetRelationship::StepRepr_FeatureForDatumTargetRelationship ******/
		/****** md5 signature: 038640422c8640cdad7502bcd6ae60a2 ******/
		%feature("compactdefaultargs") StepRepr_FeatureForDatumTargetRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_FeatureForDatumTargetRelationship;
		 StepRepr_FeatureForDatumTargetRelationship();

};


%make_alias(StepRepr_FeatureForDatumTargetRelationship)

%extend StepRepr_FeatureForDatumTargetRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepRepr_GlobalUncertaintyAssignedContext *
**************************************************/
class StepRepr_GlobalUncertaintyAssignedContext : public StepRepr_RepresentationContext {
	public:
		/****** StepRepr_GlobalUncertaintyAssignedContext::StepRepr_GlobalUncertaintyAssignedContext ******/
		/****** md5 signature: 2575bfb70d6c51709d65451fce4a4164 ******/
		%feature("compactdefaultargs") StepRepr_GlobalUncertaintyAssignedContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a GlobalUncertaintyAssignedContext.
") StepRepr_GlobalUncertaintyAssignedContext;
		 StepRepr_GlobalUncertaintyAssignedContext();

		/****** StepRepr_GlobalUncertaintyAssignedContext::Init ******/
		/****** md5 signature: 86784241f2256c21890b9dc4a2556ddf ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aUncertainty: StepBasic_HArray1OfUncertaintyMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit> & aUncertainty);

		/****** StepRepr_GlobalUncertaintyAssignedContext::NbUncertainty ******/
		/****** md5 signature: bc672cddfac018558323036dccc4f0ec ******/
		%feature("compactdefaultargs") NbUncertainty;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUncertainty;
		Standard_Integer NbUncertainty();

		/****** StepRepr_GlobalUncertaintyAssignedContext::SetUncertainty ******/
		/****** md5 signature: c054224ac25dbcf2b6152ad1aba77e7c ******/
		%feature("compactdefaultargs") SetUncertainty;
		%feature("autodoc", "
Parameters
----------
aUncertainty: StepBasic_HArray1OfUncertaintyMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetUncertainty;
		void SetUncertainty(const opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit> & aUncertainty);

		/****** StepRepr_GlobalUncertaintyAssignedContext::Uncertainty ******/
		/****** md5 signature: 8ec020c7303861237c2895d6f2505dfe ******/
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit>

Description
-----------
No available documentation.
") Uncertainty;
		opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit> Uncertainty();

		/****** StepRepr_GlobalUncertaintyAssignedContext::UncertaintyValue ******/
		/****** md5 signature: ae72ac2820c2cd31e09d467cfe44ffc7 ******/
		%feature("compactdefaultargs") UncertaintyValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>

Description
-----------
No available documentation.
") UncertaintyValue;
		opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> UncertaintyValue(const Standard_Integer num);

};


%make_alias(StepRepr_GlobalUncertaintyAssignedContext)

%extend StepRepr_GlobalUncertaintyAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepRepr_GlobalUnitAssignedContext *
*******************************************/
class StepRepr_GlobalUnitAssignedContext : public StepRepr_RepresentationContext {
	public:
		/****** StepRepr_GlobalUnitAssignedContext::StepRepr_GlobalUnitAssignedContext ******/
		/****** md5 signature: afffc250782eb4159f53d655e4fbd672 ******/
		%feature("compactdefaultargs") StepRepr_GlobalUnitAssignedContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a GlobalUnitAssignedContext.
") StepRepr_GlobalUnitAssignedContext;
		 StepRepr_GlobalUnitAssignedContext();

		/****** StepRepr_GlobalUnitAssignedContext::Init ******/
		/****** md5 signature: d6874bfb6ce3351123033e0682a478b6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aUnits: StepBasic_HArray1OfNamedUnit

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const opencascade::handle<StepBasic_HArray1OfNamedUnit> & aUnits);

		/****** StepRepr_GlobalUnitAssignedContext::NbUnits ******/
		/****** md5 signature: 86bc891f14ee45cd28b37a18bf9c55a5 ******/
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUnits;
		Standard_Integer NbUnits();

		/****** StepRepr_GlobalUnitAssignedContext::SetUnits ******/
		/****** md5 signature: eea45ef11a002984efb57090be89b405 ******/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "
Parameters
----------
aUnits: StepBasic_HArray1OfNamedUnit

Return
-------
None

Description
-----------
No available documentation.
") SetUnits;
		void SetUnits(const opencascade::handle<StepBasic_HArray1OfNamedUnit> & aUnits);

		/****** StepRepr_GlobalUnitAssignedContext::Units ******/
		/****** md5 signature: ab46f8b94daa775f5aae38fe2b8f85c4 ******/
		%feature("compactdefaultargs") Units;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_HArray1OfNamedUnit>

Description
-----------
No available documentation.
") Units;
		opencascade::handle<StepBasic_HArray1OfNamedUnit> Units();

		/****** StepRepr_GlobalUnitAssignedContext::UnitsValue ******/
		/****** md5 signature: ae296669577f5a6856f8993a7c027227 ******/
		%feature("compactdefaultargs") UnitsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_NamedUnit>

Description
-----------
No available documentation.
") UnitsValue;
		opencascade::handle<StepBasic_NamedUnit> UnitsValue(const Standard_Integer num);

};


%make_alias(StepRepr_GlobalUnitAssignedContext)

%extend StepRepr_GlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepRepr_IntegerRepresentationItem *
*******************************************/
class StepRepr_IntegerRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_IntegerRepresentationItem::StepRepr_IntegerRepresentationItem ******/
		/****** md5 signature: 9fd21856b74a8db35ead506e05a36332 ******/
		%feature("compactdefaultargs") StepRepr_IntegerRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a IntegerRepresentationItem.
") StepRepr_IntegerRepresentationItem;
		 StepRepr_IntegerRepresentationItem();

		/****** StepRepr_IntegerRepresentationItem::Init ******/
		/****** md5 signature: 60afb828539833300b65168eee6aa04f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theValue: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const Standard_Integer theValue);

		/****** StepRepr_IntegerRepresentationItem::SetValue ******/
		/****** md5 signature: 2c273822c7e71fc10325805d4c4db935 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const Standard_Integer theValue);

		/****** StepRepr_IntegerRepresentationItem::Value ******/
		/****** md5 signature: 46d5e48e8d40aa2967fce10400bd2b2b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Value;
		Standard_Integer Value();

};


%make_alias(StepRepr_IntegerRepresentationItem)

%extend StepRepr_IntegerRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepRepr_MakeFromUsageOption *
*************************************/
class StepRepr_MakeFromUsageOption : public StepRepr_ProductDefinitionUsage {
	public:
		/****** StepRepr_MakeFromUsageOption::StepRepr_MakeFromUsageOption ******/
		/****** md5 signature: 0d3229b5387aea3d64e06a026d92f927 ******/
		%feature("compactdefaultargs") StepRepr_MakeFromUsageOption;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_MakeFromUsageOption;
		 StepRepr_MakeFromUsageOption();

		/****** StepRepr_MakeFromUsageOption::Init ******/
		/****** md5 signature: f5d5941e265f880e80d1562146e58d50 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinition
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinition
aRanking: int
aRankingRationale: TCollection_HAsciiString
aQuantity: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Integer aRanking, const opencascade::handle<TCollection_HAsciiString> & aRankingRationale, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****** StepRepr_MakeFromUsageOption::Init ******/
		/****** md5 signature: 6b3d58d4c74c64fdb115752558a2897b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinitionOrReference
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinitionOrReference
aRanking: int
aRankingRationale: TCollection_HAsciiString
aQuantity: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Integer aRanking, const opencascade::handle<TCollection_HAsciiString> & aRankingRationale, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****** StepRepr_MakeFromUsageOption::Quantity ******/
		/****** md5 signature: 75eed7858cceaf85fb074fb63d42dfee ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureWithUnit>

Description
-----------
Returns field Quantity.
") Quantity;
		opencascade::handle<StepBasic_MeasureWithUnit> Quantity();

		/****** StepRepr_MakeFromUsageOption::Ranking ******/
		/****** md5 signature: 492d8ae35fc8a11700ecaefbf3cbc069 ******/
		%feature("compactdefaultargs") Ranking;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns field Ranking.
") Ranking;
		Standard_Integer Ranking();

		/****** StepRepr_MakeFromUsageOption::RankingRationale ******/
		/****** md5 signature: 85594cb96873e51ff47274481040f7c7 ******/
		%feature("compactdefaultargs") RankingRationale;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
Returns field RankingRationale.
") RankingRationale;
		opencascade::handle<TCollection_HAsciiString> RankingRationale();

		/****** StepRepr_MakeFromUsageOption::SetQuantity ******/
		/****** md5 signature: dad0dd6ffb53fc2aff91d0b0e1926f2d ******/
		%feature("compactdefaultargs") SetQuantity;
		%feature("autodoc", "
Parameters
----------
Quantity: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Set field Quantity.
") SetQuantity;
		void SetQuantity(const opencascade::handle<StepBasic_MeasureWithUnit> & Quantity);

		/****** StepRepr_MakeFromUsageOption::SetRanking ******/
		/****** md5 signature: 3591bd9d4b391d8e467f9c5702c3b080 ******/
		%feature("compactdefaultargs") SetRanking;
		%feature("autodoc", "
Parameters
----------
Ranking: int

Return
-------
None

Description
-----------
Set field Ranking.
") SetRanking;
		void SetRanking(const Standard_Integer Ranking);

		/****** StepRepr_MakeFromUsageOption::SetRankingRationale ******/
		/****** md5 signature: fac3f99a3548099f24ee658ababda03b ******/
		%feature("compactdefaultargs") SetRankingRationale;
		%feature("autodoc", "
Parameters
----------
RankingRationale: TCollection_HAsciiString

Return
-------
None

Description
-----------
Set field RankingRationale.
") SetRankingRationale;
		void SetRankingRationale(const opencascade::handle<TCollection_HAsciiString> & RankingRationale);

};


%make_alias(StepRepr_MakeFromUsageOption)

%extend StepRepr_MakeFromUsageOption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepRepr_MappedItem *
****************************/
class StepRepr_MappedItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_MappedItem::StepRepr_MappedItem ******/
		/****** md5 signature: 434905b92e962b9bc953f8011769e9ae ******/
		%feature("compactdefaultargs") StepRepr_MappedItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MappedItem.
") StepRepr_MappedItem;
		 StepRepr_MappedItem();

		/****** StepRepr_MappedItem::Init ******/
		/****** md5 signature: 7b148d72845f49dfbc47279c2cbb2181 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aMappingSource: StepRepr_RepresentationMap
aMappingTarget: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepRepr_RepresentationMap> & aMappingSource, const opencascade::handle<StepRepr_RepresentationItem> & aMappingTarget);

		/****** StepRepr_MappedItem::MappingSource ******/
		/****** md5 signature: 0a89ac1d573d254d3586e4b06718692a ******/
		%feature("compactdefaultargs") MappingSource;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationMap>

Description
-----------
No available documentation.
") MappingSource;
		opencascade::handle<StepRepr_RepresentationMap> MappingSource();

		/****** StepRepr_MappedItem::MappingTarget ******/
		/****** md5 signature: 87d60fe48dc3fb58c49e59de8c2d5f64 ******/
		%feature("compactdefaultargs") MappingTarget;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") MappingTarget;
		opencascade::handle<StepRepr_RepresentationItem> MappingTarget();

		/****** StepRepr_MappedItem::SetMappingSource ******/
		/****** md5 signature: 8f21e88fa3a7af22b2be874d99a7cefc ******/
		%feature("compactdefaultargs") SetMappingSource;
		%feature("autodoc", "
Parameters
----------
aMappingSource: StepRepr_RepresentationMap

Return
-------
None

Description
-----------
No available documentation.
") SetMappingSource;
		void SetMappingSource(const opencascade::handle<StepRepr_RepresentationMap> & aMappingSource);

		/****** StepRepr_MappedItem::SetMappingTarget ******/
		/****** md5 signature: eb0cb90e44a6048c193a58f864caeada ******/
		%feature("compactdefaultargs") SetMappingTarget;
		%feature("autodoc", "
Parameters
----------
aMappingTarget: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") SetMappingTarget;
		void SetMappingTarget(const opencascade::handle<StepRepr_RepresentationItem> & aMappingTarget);

};


%make_alias(StepRepr_MappedItem)

%extend StepRepr_MappedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepRepr_MaterialProperty *
**********************************/
class StepRepr_MaterialProperty : public StepRepr_PropertyDefinition {
	public:
		/****** StepRepr_MaterialProperty::StepRepr_MaterialProperty ******/
		/****** md5 signature: fd4f31b2e2a5e6f2826250c8e2c5ae10 ******/
		%feature("compactdefaultargs") StepRepr_MaterialProperty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_MaterialProperty;
		 StepRepr_MaterialProperty();

};


%make_alias(StepRepr_MaterialProperty)

%extend StepRepr_MaterialProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepRepr_MaterialPropertyRepresentation *
************************************************/
class StepRepr_MaterialPropertyRepresentation : public StepRepr_PropertyDefinitionRepresentation {
	public:
		/****** StepRepr_MaterialPropertyRepresentation::StepRepr_MaterialPropertyRepresentation ******/
		/****** md5 signature: c0ad60e7f6ef79bf3e4d7e1a2a801801 ******/
		%feature("compactdefaultargs") StepRepr_MaterialPropertyRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_MaterialPropertyRepresentation;
		 StepRepr_MaterialPropertyRepresentation();

		/****** StepRepr_MaterialPropertyRepresentation::DependentEnvironment ******/
		/****** md5 signature: 7b592284c13c4c37779b4bce6cee5808 ******/
		%feature("compactdefaultargs") DependentEnvironment;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_DataEnvironment>

Description
-----------
Returns field DependentEnvironment.
") DependentEnvironment;
		opencascade::handle<StepRepr_DataEnvironment> DependentEnvironment();

		/****** StepRepr_MaterialPropertyRepresentation::Init ******/
		/****** md5 signature: 289d33519d963453d7d16bf2db51c32d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aPropertyDefinitionRepresentation_Definition: StepRepr_RepresentedDefinition
aPropertyDefinitionRepresentation_UsedRepresentation: StepRepr_Representation
aDependentEnvironment: StepRepr_DataEnvironment

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const StepRepr_RepresentedDefinition & aPropertyDefinitionRepresentation_Definition, const opencascade::handle<StepRepr_Representation> & aPropertyDefinitionRepresentation_UsedRepresentation, const opencascade::handle<StepRepr_DataEnvironment> & aDependentEnvironment);

		/****** StepRepr_MaterialPropertyRepresentation::SetDependentEnvironment ******/
		/****** md5 signature: f0829c52498d64f0fe1cce5e0853166f ******/
		%feature("compactdefaultargs") SetDependentEnvironment;
		%feature("autodoc", "
Parameters
----------
DependentEnvironment: StepRepr_DataEnvironment

Return
-------
None

Description
-----------
Set field DependentEnvironment.
") SetDependentEnvironment;
		void SetDependentEnvironment(const opencascade::handle<StepRepr_DataEnvironment> & DependentEnvironment);

};


%make_alias(StepRepr_MaterialPropertyRepresentation)

%extend StepRepr_MaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepRepr_MeasureRepresentationItem *
*******************************************/
class StepRepr_MeasureRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_MeasureRepresentationItem::StepRepr_MeasureRepresentationItem ******/
		/****** md5 signature: 2f8071499f704562994f46c9a24d6b53 ******/
		%feature("compactdefaultargs") StepRepr_MeasureRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates empty object.
") StepRepr_MeasureRepresentationItem;
		 StepRepr_MeasureRepresentationItem();

		/****** StepRepr_MeasureRepresentationItem::Init ******/
		/****** md5 signature: 8fbbdcb135b13417b3f8de2266fd4e53 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aValueComponent: StepBasic_MeasureValueMember
aUnitComponent: StepBasic_Unit

Return
-------
None

Description
-----------
Init all fields.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent, const StepBasic_Unit & aUnitComponent);

		/****** StepRepr_MeasureRepresentationItem::Measure ******/
		/****** md5 signature: cebce694e5bf47672e110f61cddfb670 ******/
		%feature("compactdefaultargs") Measure;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureWithUnit>

Description
-----------
No available documentation.
") Measure;
		opencascade::handle<StepBasic_MeasureWithUnit> Measure();

		/****** StepRepr_MeasureRepresentationItem::SetMeasure ******/
		/****** md5 signature: 86afc1371188d09e472e16eae3622dde ******/
		%feature("compactdefaultargs") SetMeasure;
		%feature("autodoc", "
Parameters
----------
Measure: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetMeasure;
		void SetMeasure(const opencascade::handle<StepBasic_MeasureWithUnit> & Measure);

};


%make_alias(StepRepr_MeasureRepresentationItem)

%extend StepRepr_MeasureRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************
* class StepRepr_MechanicalDesignAndDraughtingRelationship *
***********************************************************/
class StepRepr_MechanicalDesignAndDraughtingRelationship : public StepRepr_RepresentationRelationship {
	public:
		/****** StepRepr_MechanicalDesignAndDraughtingRelationship::StepRepr_MechanicalDesignAndDraughtingRelationship ******/
		/****** md5 signature: 8c982a914d379ee39b4c54a707379258 ******/
		%feature("compactdefaultargs") StepRepr_MechanicalDesignAndDraughtingRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a MechanicalDesignAndDraughtingRelationship.
") StepRepr_MechanicalDesignAndDraughtingRelationship;
		 StepRepr_MechanicalDesignAndDraughtingRelationship();

};


%make_alias(StepRepr_MechanicalDesignAndDraughtingRelationship)

%extend StepRepr_MechanicalDesignAndDraughtingRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepRepr_ParametricRepresentationContext *
*************************************************/
class StepRepr_ParametricRepresentationContext : public StepRepr_RepresentationContext {
	public:
		/****** StepRepr_ParametricRepresentationContext::StepRepr_ParametricRepresentationContext ******/
		/****** md5 signature: 193ba298a7746ccb7458616d781c2b95 ******/
		%feature("compactdefaultargs") StepRepr_ParametricRepresentationContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ParametricRepresentationContext.
") StepRepr_ParametricRepresentationContext;
		 StepRepr_ParametricRepresentationContext();

};


%make_alias(StepRepr_ParametricRepresentationContext)

%extend StepRepr_ParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepRepr_ProductDefinitionShape *
****************************************/
class StepRepr_ProductDefinitionShape : public StepRepr_PropertyDefinition {
	public:
		/****** StepRepr_ProductDefinitionShape::StepRepr_ProductDefinitionShape ******/
		/****** md5 signature: e893fe54858868c2b3aab5d6d7c3a001 ******/
		%feature("compactdefaultargs") StepRepr_ProductDefinitionShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ProductDefinitionShape;
		 StepRepr_ProductDefinitionShape();

};


%make_alias(StepRepr_ProductDefinitionShape)

%extend StepRepr_ProductDefinitionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepRepr_RealRepresentationItem *
****************************************/
class StepRepr_RealRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_RealRepresentationItem::StepRepr_RealRepresentationItem ******/
		/****** md5 signature: d17a0f40c7823bc8007fa74ee9c7868d ******/
		%feature("compactdefaultargs") StepRepr_RealRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RealRepresentationItem.
") StepRepr_RealRepresentationItem;
		 StepRepr_RealRepresentationItem();

		/****** StepRepr_RealRepresentationItem::Init ******/
		/****** md5 signature: b94780edbf351e7ff2f2b4a013763a92 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theValue: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const Standard_Real theValue);

		/****** StepRepr_RealRepresentationItem::SetValue ******/
		/****** md5 signature: 00f545b803ec8605526c0f3fc87dfa67 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const Standard_Real theValue);

		/****** StepRepr_RealRepresentationItem::Value ******/
		/****** md5 signature: c39c133efac01c9bfb6299560d54008f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Value;
		Standard_Real Value();

};


%make_alias(StepRepr_RealRepresentationItem)

%extend StepRepr_RealRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepRepr_ReprItemAndMeasureWithUnit *
********************************************/
class StepRepr_ReprItemAndMeasureWithUnit : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_ReprItemAndMeasureWithUnit::StepRepr_ReprItemAndMeasureWithUnit ******/
		/****** md5 signature: 0fe235a0ad3fa751b10d9c0d1c6fd4cc ******/
		%feature("compactdefaultargs") StepRepr_ReprItemAndMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ReprItemAndMeasureWithUnit;
		 StepRepr_ReprItemAndMeasureWithUnit();

		/****** StepRepr_ReprItemAndMeasureWithUnit::GetMeasureRepresentationItem ******/
		/****** md5 signature: e13a6adb25ec4e7a7a2915d5499f0ddd ******/
		%feature("compactdefaultargs") GetMeasureRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_MeasureRepresentationItem>

Description
-----------
No available documentation.
") GetMeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> GetMeasureRepresentationItem();

		/****** StepRepr_ReprItemAndMeasureWithUnit::GetMeasureWithUnit ******/
		/****** md5 signature: e4f8bbac8dec8f2f4ad63244221b85af ******/
		%feature("compactdefaultargs") GetMeasureWithUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureWithUnit>

Description
-----------
No available documentation.
") GetMeasureWithUnit;
		opencascade::handle<StepBasic_MeasureWithUnit> GetMeasureWithUnit();

		/****** StepRepr_ReprItemAndMeasureWithUnit::GetRepresentationItem ******/
		/****** md5 signature: 005f2cbec1abd45c3116c19f1895281b ******/
		%feature("compactdefaultargs") GetRepresentationItem;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_RepresentationItem>

Description
-----------
No available documentation.
") GetRepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> GetRepresentationItem();

		/****** StepRepr_ReprItemAndMeasureWithUnit::Init ******/
		/****** md5 signature: 69035710bd6a1c4ae87de94bd56efc0d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aMWU: StepBasic_MeasureWithUnit
aRI: StepRepr_RepresentationItem

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepBasic_MeasureWithUnit> & aMWU, const opencascade::handle<StepRepr_RepresentationItem> & aRI);

		/****** StepRepr_ReprItemAndMeasureWithUnit::SetMeasureWithUnit ******/
		/****** md5 signature: fa85988bc107c123e010a83966ab3ce1 ******/
		%feature("compactdefaultargs") SetMeasureWithUnit;
		%feature("autodoc", "
Parameters
----------
aMWU: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetMeasureWithUnit;
		void SetMeasureWithUnit(const opencascade::handle<StepBasic_MeasureWithUnit> & aMWU);

};


%make_alias(StepRepr_ReprItemAndMeasureWithUnit)

%extend StepRepr_ReprItemAndMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepRepr_ShapeAspectDerivingRelationship *
*************************************************/
class StepRepr_ShapeAspectDerivingRelationship : public StepRepr_ShapeAspectRelationship {
	public:
		/****** StepRepr_ShapeAspectDerivingRelationship::StepRepr_ShapeAspectDerivingRelationship ******/
		/****** md5 signature: a8bbb3f4a2e9c295b90163506bb21423 ******/
		%feature("compactdefaultargs") StepRepr_ShapeAspectDerivingRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ShapeAspectDerivingRelationship;
		 StepRepr_ShapeAspectDerivingRelationship();

};


%make_alias(StepRepr_ShapeAspectDerivingRelationship)

%extend StepRepr_ShapeAspectDerivingRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepRepr_ShapeAspectTransition *
***************************************/
class StepRepr_ShapeAspectTransition : public StepRepr_ShapeAspectRelationship {
	public:
		/****** StepRepr_ShapeAspectTransition::StepRepr_ShapeAspectTransition ******/
		/****** md5 signature: ffd389680f40d01592188a6e0c188270 ******/
		%feature("compactdefaultargs") StepRepr_ShapeAspectTransition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_ShapeAspectTransition;
		 StepRepr_ShapeAspectTransition();

};


%make_alias(StepRepr_ShapeAspectTransition)

%extend StepRepr_ShapeAspectTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepRepr_ShapeRepresentationRelationship *
*************************************************/
class StepRepr_ShapeRepresentationRelationship : public StepRepr_RepresentationRelationship {
	public:
		/****** StepRepr_ShapeRepresentationRelationship::StepRepr_ShapeRepresentationRelationship ******/
		/****** md5 signature: fb8a77d9ec09c554051216eaccf71139 ******/
		%feature("compactdefaultargs") StepRepr_ShapeRepresentationRelationship;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ShapeRepresentationRelationship;
		 StepRepr_ShapeRepresentationRelationship();

};


%make_alias(StepRepr_ShapeRepresentationRelationship)

%extend StepRepr_ShapeRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepRepr_StructuralResponseProperty *
********************************************/
class StepRepr_StructuralResponseProperty : public StepRepr_PropertyDefinition {
	public:
		/****** StepRepr_StructuralResponseProperty::StepRepr_StructuralResponseProperty ******/
		/****** md5 signature: 07fe5abcf3cb3abb0f18c83820bfb6e7 ******/
		%feature("compactdefaultargs") StepRepr_StructuralResponseProperty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_StructuralResponseProperty;
		 StepRepr_StructuralResponseProperty();

};


%make_alias(StepRepr_StructuralResponseProperty)

%extend StepRepr_StructuralResponseProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************************
* class StepRepr_StructuralResponsePropertyDefinitionRepresentation *
********************************************************************/
class StepRepr_StructuralResponsePropertyDefinitionRepresentation : public StepRepr_PropertyDefinitionRepresentation {
	public:
		/****** StepRepr_StructuralResponsePropertyDefinitionRepresentation::StepRepr_StructuralResponsePropertyDefinitionRepresentation ******/
		/****** md5 signature: 2d65dca5509777e38eca2f8175007f05 ******/
		%feature("compactdefaultargs") StepRepr_StructuralResponsePropertyDefinitionRepresentation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_StructuralResponsePropertyDefinitionRepresentation;
		 StepRepr_StructuralResponsePropertyDefinitionRepresentation();

};


%make_alias(StepRepr_StructuralResponsePropertyDefinitionRepresentation)

%extend StepRepr_StructuralResponsePropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepRepr_ValueRepresentationItem *
*****************************************/
class StepRepr_ValueRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepRepr_ValueRepresentationItem::StepRepr_ValueRepresentationItem ******/
		/****** md5 signature: 4027bb3c9e4bc2aacaba4462bbe45258 ******/
		%feature("compactdefaultargs") StepRepr_ValueRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ValueRepresentationItem.
") StepRepr_ValueRepresentationItem;
		 StepRepr_ValueRepresentationItem();

		/****** StepRepr_ValueRepresentationItem::Init ******/
		/****** md5 signature: 0fd7d7c17c5fbd92ceee154feffa08cc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theValueComponentMember: StepBasic_MeasureValueMember

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepBasic_MeasureValueMember> & theValueComponentMember);

		/****** StepRepr_ValueRepresentationItem::SetValueComponentMember ******/
		/****** md5 signature: 9134bbde532a7b5fcdf4b0e3b86be557 ******/
		%feature("compactdefaultargs") SetValueComponentMember;
		%feature("autodoc", "
Parameters
----------
theValueComponentMember: StepBasic_MeasureValueMember

Return
-------
None

Description
-----------
No available documentation.
") SetValueComponentMember;
		void SetValueComponentMember(const opencascade::handle<StepBasic_MeasureValueMember> & theValueComponentMember);

		/****** StepRepr_ValueRepresentationItem::ValueComponentMember ******/
		/****** md5 signature: 5e98664dabde0acbfbb945792ab612fb ******/
		%feature("compactdefaultargs") ValueComponentMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureValueMember>

Description
-----------
No available documentation.
") ValueComponentMember;
		opencascade::handle<StepBasic_MeasureValueMember> ValueComponentMember();

};


%make_alias(StepRepr_ValueRepresentationItem)

%extend StepRepr_ValueRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class StepRepr_Apex *
**********************/
class StepRepr_Apex : public StepRepr_DerivedShapeAspect {
	public:
		/****** StepRepr_Apex::StepRepr_Apex ******/
		/****** md5 signature: b209a5e1a86cf413e84cbf27a2a25d71 ******/
		%feature("compactdefaultargs") StepRepr_Apex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_Apex;
		 StepRepr_Apex();

};


%make_alias(StepRepr_Apex)

%extend StepRepr_Apex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepRepr_CentreOfSymmetry *
**********************************/
class StepRepr_CentreOfSymmetry : public StepRepr_DerivedShapeAspect {
	public:
		/****** StepRepr_CentreOfSymmetry::StepRepr_CentreOfSymmetry ******/
		/****** md5 signature: 5f8b59ac990938dcd05d5480d6abf50b ******/
		%feature("compactdefaultargs") StepRepr_CentreOfSymmetry;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_CentreOfSymmetry;
		 StepRepr_CentreOfSymmetry();

};


%make_alias(StepRepr_CentreOfSymmetry)

%extend StepRepr_CentreOfSymmetry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp *
****************************************************************/
class StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp : public StepRepr_CompShAspAndDatumFeatAndShAsp {
	public:
		/****** StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp::StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp ******/
		/****** md5 signature: 0078989ba5e6c76657527a3ee2ed4ec7 ******/
		%feature("compactdefaultargs") StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		 StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp();

};


%make_alias(StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp)

%extend StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepRepr_CompositeGroupShapeAspect *
*******************************************/
class StepRepr_CompositeGroupShapeAspect : public StepRepr_CompositeShapeAspect {
	public:
		/****** StepRepr_CompositeGroupShapeAspect::StepRepr_CompositeGroupShapeAspect ******/
		/****** md5 signature: 8b8e6dd7543a4dd985f049f57bf520e4 ******/
		%feature("compactdefaultargs") StepRepr_CompositeGroupShapeAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_CompositeGroupShapeAspect;
		 StepRepr_CompositeGroupShapeAspect();

};


%make_alias(StepRepr_CompositeGroupShapeAspect)

%extend StepRepr_CompositeGroupShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepRepr_ContinuosShapeAspect *
**************************************/
class StepRepr_ContinuosShapeAspect : public StepRepr_CompositeShapeAspect {
	public:
		/****** StepRepr_ContinuosShapeAspect::StepRepr_ContinuosShapeAspect ******/
		/****** md5 signature: bb156cee5c9c910dad9b4c96079593a1 ******/
		%feature("compactdefaultargs") StepRepr_ContinuosShapeAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ContinuosShapeAspect;
		 StepRepr_ContinuosShapeAspect();

};


%make_alias(StepRepr_ContinuosShapeAspect)

%extend StepRepr_ContinuosShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepRepr_Extension *
***************************/
class StepRepr_Extension : public StepRepr_DerivedShapeAspect {
	public:
		/****** StepRepr_Extension::StepRepr_Extension ******/
		/****** md5 signature: 79e7c5797b6b8070bd74e63998b8c9f1 ******/
		%feature("compactdefaultargs") StepRepr_Extension;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_Extension;
		 StepRepr_Extension();

};


%make_alias(StepRepr_Extension)

%extend StepRepr_Extension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepRepr_GeometricAlignment *
************************************/
class StepRepr_GeometricAlignment : public StepRepr_DerivedShapeAspect {
	public:
		/****** StepRepr_GeometricAlignment::StepRepr_GeometricAlignment ******/
		/****** md5 signature: 0f93f3eedc0b55d64c7d6bfd77516f4a ******/
		%feature("compactdefaultargs") StepRepr_GeometricAlignment;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_GeometricAlignment;
		 StepRepr_GeometricAlignment();

};


%make_alias(StepRepr_GeometricAlignment)

%extend StepRepr_GeometricAlignment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepRepr_NextAssemblyUsageOccurrence *
*********************************************/
class StepRepr_NextAssemblyUsageOccurrence : public StepRepr_AssemblyComponentUsage {
	public:
		/****** StepRepr_NextAssemblyUsageOccurrence::StepRepr_NextAssemblyUsageOccurrence ******/
		/****** md5 signature: f061631e81777e98369f6e84892159bc ******/
		%feature("compactdefaultargs") StepRepr_NextAssemblyUsageOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_NextAssemblyUsageOccurrence;
		 StepRepr_NextAssemblyUsageOccurrence();

};


%make_alias(StepRepr_NextAssemblyUsageOccurrence)

%extend StepRepr_NextAssemblyUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepRepr_ParallelOffset *
********************************/
class StepRepr_ParallelOffset : public StepRepr_DerivedShapeAspect {
	public:
		/****** StepRepr_ParallelOffset::StepRepr_ParallelOffset ******/
		/****** md5 signature: 85484c3d1fc7b635808d2b9a25a735e0 ******/
		%feature("compactdefaultargs") StepRepr_ParallelOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ParallelOffset;
		 StepRepr_ParallelOffset();

		/****** StepRepr_ParallelOffset::Init ******/
		/****** md5 signature: 9eda71877f8da279711bfcd867dbe9c8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theOffset: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const opencascade::handle<StepBasic_MeasureWithUnit> & theOffset);

		/****** StepRepr_ParallelOffset::Offset ******/
		/****** md5 signature: 1de5a42878f98c409cec3f7a0781f228 ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureWithUnit>

Description
-----------
Returns field Offset.
") Offset;
		opencascade::handle<StepBasic_MeasureWithUnit> Offset();

		/****** StepRepr_ParallelOffset::SetOffset ******/
		/****** md5 signature: 97ba2a0595c70f3480663c82b2d6871c ******/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "
Parameters
----------
theOffset: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Set field Offset.
") SetOffset;
		void SetOffset(const opencascade::handle<StepBasic_MeasureWithUnit> & theOffset);

};


%make_alias(StepRepr_ParallelOffset)

%extend StepRepr_ParallelOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepRepr_PerpendicularTo *
*********************************/
class StepRepr_PerpendicularTo : public StepRepr_DerivedShapeAspect {
	public:
		/****** StepRepr_PerpendicularTo::StepRepr_PerpendicularTo ******/
		/****** md5 signature: dcf610df983791f0eaf056431c7fb3f5 ******/
		%feature("compactdefaultargs") StepRepr_PerpendicularTo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_PerpendicularTo;
		 StepRepr_PerpendicularTo();

};


%make_alias(StepRepr_PerpendicularTo)

%extend StepRepr_PerpendicularTo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepRepr_PromissoryUsageOccurrence *
*******************************************/
class StepRepr_PromissoryUsageOccurrence : public StepRepr_AssemblyComponentUsage {
	public:
		/****** StepRepr_PromissoryUsageOccurrence::StepRepr_PromissoryUsageOccurrence ******/
		/****** md5 signature: 91a3843a0e9f699165042e901696f293 ******/
		%feature("compactdefaultargs") StepRepr_PromissoryUsageOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_PromissoryUsageOccurrence;
		 StepRepr_PromissoryUsageOccurrence();

};


%make_alias(StepRepr_PromissoryUsageOccurrence)

%extend StepRepr_PromissoryUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepRepr_QuantifiedAssemblyComponentUsage *
**************************************************/
class StepRepr_QuantifiedAssemblyComponentUsage : public StepRepr_AssemblyComponentUsage {
	public:
		/****** StepRepr_QuantifiedAssemblyComponentUsage::StepRepr_QuantifiedAssemblyComponentUsage ******/
		/****** md5 signature: c486219f6b9f6bb228b1588f4e1118b5 ******/
		%feature("compactdefaultargs") StepRepr_QuantifiedAssemblyComponentUsage;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_QuantifiedAssemblyComponentUsage;
		 StepRepr_QuantifiedAssemblyComponentUsage();

		/****** StepRepr_QuantifiedAssemblyComponentUsage::Init ******/
		/****** md5 signature: a3e5f31a4ee7e96661cd7eca17cfd497 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinition
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinition
hasAssemblyComponentUsage_ReferenceDesignator: bool
aAssemblyComponentUsage_ReferenceDesignator: TCollection_HAsciiString
aQuantity: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****** StepRepr_QuantifiedAssemblyComponentUsage::Init ******/
		/****** md5 signature: f622aff8f6b34a244f8533dc581d907d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinitionOrReference
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinitionOrReference
hasAssemblyComponentUsage_ReferenceDesignator: bool
aAssemblyComponentUsage_ReferenceDesignator: TCollection_HAsciiString
aQuantity: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****** StepRepr_QuantifiedAssemblyComponentUsage::Quantity ******/
		/****** md5 signature: 75eed7858cceaf85fb074fb63d42dfee ******/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_MeasureWithUnit>

Description
-----------
Returns field Quantity.
") Quantity;
		opencascade::handle<StepBasic_MeasureWithUnit> Quantity();

		/****** StepRepr_QuantifiedAssemblyComponentUsage::SetQuantity ******/
		/****** md5 signature: dad0dd6ffb53fc2aff91d0b0e1926f2d ******/
		%feature("compactdefaultargs") SetQuantity;
		%feature("autodoc", "
Parameters
----------
Quantity: StepBasic_MeasureWithUnit

Return
-------
None

Description
-----------
Set field Quantity.
") SetQuantity;
		void SetQuantity(const opencascade::handle<StepBasic_MeasureWithUnit> & Quantity);

};


%make_alias(StepRepr_QuantifiedAssemblyComponentUsage)

%extend StepRepr_QuantifiedAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepRepr_ReprItemAndLengthMeasureWithUnit *
**************************************************/
class StepRepr_ReprItemAndLengthMeasureWithUnit : public StepRepr_ReprItemAndMeasureWithUnit {
	public:
		/****** StepRepr_ReprItemAndLengthMeasureWithUnit::StepRepr_ReprItemAndLengthMeasureWithUnit ******/
		/****** md5 signature: 97c5f9b52b1ce87f9776b38d41ebe891 ******/
		%feature("compactdefaultargs") StepRepr_ReprItemAndLengthMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ReprItemAndLengthMeasureWithUnit;
		 StepRepr_ReprItemAndLengthMeasureWithUnit();

		/****** StepRepr_ReprItemAndLengthMeasureWithUnit::GetLengthMeasureWithUnit ******/
		/****** md5 signature: 5966e85668a2da9c13e5e7c4bc5c5aeb ******/
		%feature("compactdefaultargs") GetLengthMeasureWithUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
No available documentation.
") GetLengthMeasureWithUnit;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetLengthMeasureWithUnit();

		/****** StepRepr_ReprItemAndLengthMeasureWithUnit::SetLengthMeasureWithUnit ******/
		/****** md5 signature: a64d0d611289803d7bd391368b4076c5 ******/
		%feature("compactdefaultargs") SetLengthMeasureWithUnit;
		%feature("autodoc", "
Parameters
----------
aLMWU: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetLengthMeasureWithUnit;
		void SetLengthMeasureWithUnit(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & aLMWU);

};


%make_alias(StepRepr_ReprItemAndLengthMeasureWithUnit)

%extend StepRepr_ReprItemAndLengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************
* class StepRepr_ReprItemAndMeasureWithUnitAndQRI *
**************************************************/
/******************************************************
* class StepRepr_ReprItemAndPlaneAngleMeasureWithUnit *
******************************************************/
class StepRepr_ReprItemAndPlaneAngleMeasureWithUnit : public StepRepr_ReprItemAndMeasureWithUnit {
	public:
		/****** StepRepr_ReprItemAndPlaneAngleMeasureWithUnit::StepRepr_ReprItemAndPlaneAngleMeasureWithUnit ******/
		/****** md5 signature: 2ffd6c33651f4e2acddd662e29c0b8de ******/
		%feature("compactdefaultargs") StepRepr_ReprItemAndPlaneAngleMeasureWithUnit;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ReprItemAndPlaneAngleMeasureWithUnit;
		 StepRepr_ReprItemAndPlaneAngleMeasureWithUnit();

		/****** StepRepr_ReprItemAndPlaneAngleMeasureWithUnit::GetPlaneAngleMeasureWithUnit ******/
		/****** md5 signature: e60a69ca263cfcc1ae3925255c07afdf ******/
		%feature("compactdefaultargs") GetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit>

Description
-----------
No available documentation.
") GetPlaneAngleMeasureWithUnit;
		opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> GetPlaneAngleMeasureWithUnit();

		/****** StepRepr_ReprItemAndPlaneAngleMeasureWithUnit::SetPlaneAngleMeasureWithUnit ******/
		/****** md5 signature: 47d73b0e581c9415c8ff4b21ed3f6bc6 ******/
		%feature("compactdefaultargs") SetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "
Parameters
----------
aLMWU: StepBasic_PlaneAngleMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetPlaneAngleMeasureWithUnit;
		void SetPlaneAngleMeasureWithUnit(const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & aLMWU);

};


%make_alias(StepRepr_ReprItemAndPlaneAngleMeasureWithUnit)

%extend StepRepr_ReprItemAndPlaneAngleMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class StepRepr_RepresentationRelationshipWithTransformation *
**************************************************************/
class StepRepr_RepresentationRelationshipWithTransformation : public StepRepr_ShapeRepresentationRelationship {
	public:
		/****** StepRepr_RepresentationRelationshipWithTransformation::StepRepr_RepresentationRelationshipWithTransformation ******/
		/****** md5 signature: 066f84c98a6b9bf74a45ad021187c406 ******/
		%feature("compactdefaultargs") StepRepr_RepresentationRelationshipWithTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_RepresentationRelationshipWithTransformation;
		 StepRepr_RepresentationRelationshipWithTransformation();

		/****** StepRepr_RepresentationRelationshipWithTransformation::Init ******/
		/****** md5 signature: 44a86d65fc6ec5045bdf179225110c93 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRep1: StepRepr_Representation
aRep2: StepRepr_Representation
aTransf: StepRepr_Transformation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_Representation> & aRep1, const opencascade::handle<StepRepr_Representation> & aRep2, const StepRepr_Transformation & aTransf);

		/****** StepRepr_RepresentationRelationshipWithTransformation::SetTransformationOperator ******/
		/****** md5 signature: 3ea93b424666e816630e52d8421adcce ******/
		%feature("compactdefaultargs") SetTransformationOperator;
		%feature("autodoc", "
Parameters
----------
aTrans: StepRepr_Transformation

Return
-------
None

Description
-----------
No available documentation.
") SetTransformationOperator;
		void SetTransformationOperator(const StepRepr_Transformation & aTrans);

		/****** StepRepr_RepresentationRelationshipWithTransformation::TransformationOperator ******/
		/****** md5 signature: 0c3e4ed1ddb6a6103679cce940497283 ******/
		%feature("compactdefaultargs") TransformationOperator;
		%feature("autodoc", "Return
-------
StepRepr_Transformation

Description
-----------
No available documentation.
") TransformationOperator;
		StepRepr_Transformation TransformationOperator();

};


%make_alias(StepRepr_RepresentationRelationshipWithTransformation)

%extend StepRepr_RepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepRepr_SpecifiedHigherUsageOccurrence *
************************************************/
class StepRepr_SpecifiedHigherUsageOccurrence : public StepRepr_AssemblyComponentUsage {
	public:
		/****** StepRepr_SpecifiedHigherUsageOccurrence::StepRepr_SpecifiedHigherUsageOccurrence ******/
		/****** md5 signature: 554df37ac982cb0834d08c843f64e263 ******/
		%feature("compactdefaultargs") StepRepr_SpecifiedHigherUsageOccurrence;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepRepr_SpecifiedHigherUsageOccurrence;
		 StepRepr_SpecifiedHigherUsageOccurrence();

		/****** StepRepr_SpecifiedHigherUsageOccurrence::Init ******/
		/****** md5 signature: 39082104a4554f2fdae1adf98c5ff4dc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinition
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinition
hasAssemblyComponentUsage_ReferenceDesignator: bool
aAssemblyComponentUsage_ReferenceDesignator: TCollection_HAsciiString
aUpperUsage: StepRepr_AssemblyComponentUsage
aNextUsage: StepRepr_NextAssemblyUsageOccurrence

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aUpperUsage, const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & aNextUsage);

		/****** StepRepr_SpecifiedHigherUsageOccurrence::Init ******/
		/****** md5 signature: b1a81b9215bb24232e75a49b5dfa10b8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aProductDefinitionRelationship_Id: TCollection_HAsciiString
aProductDefinitionRelationship_Name: TCollection_HAsciiString
hasProductDefinitionRelationship_Description: bool
aProductDefinitionRelationship_Description: TCollection_HAsciiString
aProductDefinitionRelationship_RelatingProductDefinition: StepBasic_ProductDefinitionOrReference
aProductDefinitionRelationship_RelatedProductDefinition: StepBasic_ProductDefinitionOrReference
hasAssemblyComponentUsage_ReferenceDesignator: bool
aAssemblyComponentUsage_ReferenceDesignator: TCollection_HAsciiString
aUpperUsage: StepRepr_AssemblyComponentUsage
aNextUsage: StepRepr_NextAssemblyUsageOccurrence

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aUpperUsage, const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & aNextUsage);

		/****** StepRepr_SpecifiedHigherUsageOccurrence::NextUsage ******/
		/****** md5 signature: 302aee25e9a0a52d40512f4cf28c968c ******/
		%feature("compactdefaultargs") NextUsage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>

Description
-----------
Returns field NextUsage.
") NextUsage;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> NextUsage();

		/****** StepRepr_SpecifiedHigherUsageOccurrence::SetNextUsage ******/
		/****** md5 signature: 019c85964995143167c93905bc40c12a ******/
		%feature("compactdefaultargs") SetNextUsage;
		%feature("autodoc", "
Parameters
----------
NextUsage: StepRepr_NextAssemblyUsageOccurrence

Return
-------
None

Description
-----------
Set field NextUsage.
") SetNextUsage;
		void SetNextUsage(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & NextUsage);

		/****** StepRepr_SpecifiedHigherUsageOccurrence::SetUpperUsage ******/
		/****** md5 signature: 26e39f58132da9002dc9a761faec9cb8 ******/
		%feature("compactdefaultargs") SetUpperUsage;
		%feature("autodoc", "
Parameters
----------
UpperUsage: StepRepr_AssemblyComponentUsage

Return
-------
None

Description
-----------
Set field UpperUsage.
") SetUpperUsage;
		void SetUpperUsage(const opencascade::handle<StepRepr_AssemblyComponentUsage> & UpperUsage);

		/****** StepRepr_SpecifiedHigherUsageOccurrence::UpperUsage ******/
		/****** md5 signature: 6a6bd23cfc5164a86ade8d969115073f ******/
		%feature("compactdefaultargs") UpperUsage;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>

Description
-----------
Returns field UpperUsage.
") UpperUsage;
		opencascade::handle<StepRepr_AssemblyComponentUsage> UpperUsage();

};


%make_alias(StepRepr_SpecifiedHigherUsageOccurrence)

%extend StepRepr_SpecifiedHigherUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepRepr_Tangent *
*************************/
class StepRepr_Tangent : public StepRepr_DerivedShapeAspect {
	public:
		/****** StepRepr_Tangent::StepRepr_Tangent ******/
		/****** md5 signature: 043cd148f5c26c4210de1fce501040e9 ******/
		%feature("compactdefaultargs") StepRepr_Tangent;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_Tangent;
		 StepRepr_Tangent();

};


%make_alias(StepRepr_Tangent)

%extend StepRepr_Tangent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class StepRepr_ValueRange *
****************************/
class StepRepr_ValueRange : public StepRepr_CompoundRepresentationItem {
	public:
		/****** StepRepr_ValueRange::StepRepr_ValueRange ******/
		/****** md5 signature: fc6ad6a08112e5c579ab33624924c774 ******/
		%feature("compactdefaultargs") StepRepr_ValueRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ValueRange;
		 StepRepr_ValueRange();

};


%make_alias(StepRepr_ValueRange)

%extend StepRepr_ValueRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepRepr_AllAroundShapeAspect *
**************************************/
class StepRepr_AllAroundShapeAspect : public StepRepr_ContinuosShapeAspect {
	public:
		/****** StepRepr_AllAroundShapeAspect::StepRepr_AllAroundShapeAspect ******/
		/****** md5 signature: c0b05dd6fb24ffb17196b4557c3ed53d ******/
		%feature("compactdefaultargs") StepRepr_AllAroundShapeAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_AllAroundShapeAspect;
		 StepRepr_AllAroundShapeAspect();

};


%make_alias(StepRepr_AllAroundShapeAspect)

%extend StepRepr_AllAroundShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepRepr_BetweenShapeAspect *
************************************/
class StepRepr_BetweenShapeAspect : public StepRepr_ContinuosShapeAspect {
	public:
		/****** StepRepr_BetweenShapeAspect::StepRepr_BetweenShapeAspect ******/
		/****** md5 signature: b9da836fe16f509b18b2df1caf61a58f ******/
		%feature("compactdefaultargs") StepRepr_BetweenShapeAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_BetweenShapeAspect;
		 StepRepr_BetweenShapeAspect();

};


%make_alias(StepRepr_BetweenShapeAspect)

%extend StepRepr_BetweenShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI *
********************************************************/
class StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI : public StepRepr_ReprItemAndMeasureWithUnitAndQRI {
	public:
		/****** StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI::StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI ******/
		/****** md5 signature: 1b0fc362b97e9001c2b7ee4249c069ea ******/
		%feature("compactdefaultargs") StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI;
		 StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI();

		/****** StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI::GetLengthMeasureWithUnit ******/
		/****** md5 signature: 5966e85668a2da9c13e5e7c4bc5c5aeb ******/
		%feature("compactdefaultargs") GetLengthMeasureWithUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>

Description
-----------
No available documentation.
") GetLengthMeasureWithUnit;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetLengthMeasureWithUnit();

		/****** StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI::SetLengthMeasureWithUnit ******/
		/****** md5 signature: a64d0d611289803d7bd391368b4076c5 ******/
		%feature("compactdefaultargs") SetLengthMeasureWithUnit;
		%feature("autodoc", "
Parameters
----------
aLMWU: StepBasic_LengthMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetLengthMeasureWithUnit;
		void SetLengthMeasureWithUnit(const opencascade::handle<StepBasic_LengthMeasureWithUnit> & aLMWU);

};


%make_alias(StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI)

%extend StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI *
************************************************************/
class StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI : public StepRepr_ReprItemAndMeasureWithUnitAndQRI {
	public:
		/****** StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI::StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI ******/
		/****** md5 signature: bbb00f4a7cc875d8d34634ffdb544e4d ******/
		%feature("compactdefaultargs") StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		 StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI();

		/****** StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI::GetPlaneAngleMeasureWithUnit ******/
		/****** md5 signature: e60a69ca263cfcc1ae3925255c07afdf ******/
		%feature("compactdefaultargs") GetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "Return
-------
opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit>

Description
-----------
No available documentation.
") GetPlaneAngleMeasureWithUnit;
		opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> GetPlaneAngleMeasureWithUnit();

		/****** StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI::SetPlaneAngleMeasureWithUnit ******/
		/****** md5 signature: 47d73b0e581c9415c8ff4b21ed3f6bc6 ******/
		%feature("compactdefaultargs") SetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "
Parameters
----------
aLMWU: StepBasic_PlaneAngleMeasureWithUnit

Return
-------
None

Description
-----------
No available documentation.
") SetPlaneAngleMeasureWithUnit;
		void SetPlaneAngleMeasureWithUnit(const opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> & aLMWU);

};


%make_alias(StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI)

%extend StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************************
* class StepRepr_ShapeRepresentationRelationshipWithTransformation *
*******************************************************************/
class StepRepr_ShapeRepresentationRelationshipWithTransformation : public StepRepr_RepresentationRelationshipWithTransformation {
	public:
		/****** StepRepr_ShapeRepresentationRelationshipWithTransformation::StepRepr_ShapeRepresentationRelationshipWithTransformation ******/
		/****** md5 signature: d17b4ca241d0bc76b41e761f3a752b33 ******/
		%feature("compactdefaultargs") StepRepr_ShapeRepresentationRelationshipWithTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepRepr_ShapeRepresentationRelationshipWithTransformation;
		 StepRepr_ShapeRepresentationRelationshipWithTransformation();

};


%make_alias(StepRepr_ShapeRepresentationRelationshipWithTransformation)

%extend StepRepr_ShapeRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class StepRepr_ReprItemAndMeasureWithUnitAndQRI:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class StepRepr_HArray1OfMaterialPropertyRepresentation : public StepRepr_Array1OfMaterialPropertyRepresentation, public Standard_Transient {
  public:
    StepRepr_HArray1OfMaterialPropertyRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfMaterialPropertyRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const StepRepr_Array1OfMaterialPropertyRepresentation::value_type& theValue);
    StepRepr_HArray1OfMaterialPropertyRepresentation(const StepRepr_Array1OfMaterialPropertyRepresentation& theOther);
    const StepRepr_Array1OfMaterialPropertyRepresentation& Array1();
    StepRepr_Array1OfMaterialPropertyRepresentation& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfMaterialPropertyRepresentation)


class StepRepr_HArray1OfPropertyDefinitionRepresentation : public StepRepr_Array1OfPropertyDefinitionRepresentation, public Standard_Transient {
  public:
    StepRepr_HArray1OfPropertyDefinitionRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfPropertyDefinitionRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const StepRepr_Array1OfPropertyDefinitionRepresentation::value_type& theValue);
    StepRepr_HArray1OfPropertyDefinitionRepresentation(const StepRepr_Array1OfPropertyDefinitionRepresentation& theOther);
    const StepRepr_Array1OfPropertyDefinitionRepresentation& Array1();
    StepRepr_Array1OfPropertyDefinitionRepresentation& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfPropertyDefinitionRepresentation)


class StepRepr_HArray1OfRepresentationItem : public StepRepr_Array1OfRepresentationItem, public Standard_Transient {
  public:
    StepRepr_HArray1OfRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const StepRepr_Array1OfRepresentationItem::value_type& theValue);
    StepRepr_HArray1OfRepresentationItem(const StepRepr_Array1OfRepresentationItem& theOther);
    const StepRepr_Array1OfRepresentationItem& Array1();
    StepRepr_Array1OfRepresentationItem& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfRepresentationItem)


class StepRepr_HArray1OfShapeAspect : public StepRepr_Array1OfShapeAspect, public Standard_Transient {
  public:
    StepRepr_HArray1OfShapeAspect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfShapeAspect(const Standard_Integer theLower, const Standard_Integer theUpper, const StepRepr_Array1OfShapeAspect::value_type& theValue);
    StepRepr_HArray1OfShapeAspect(const StepRepr_Array1OfShapeAspect& theOther);
    const StepRepr_Array1OfShapeAspect& Array1();
    StepRepr_Array1OfShapeAspect& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfShapeAspect)

/* harray2 classes */
/* hsequence classes */
class StepRepr_HSequenceOfMaterialPropertyRepresentation : public StepRepr_SequenceOfMaterialPropertyRepresentation, public Standard_Transient {
  public:
    StepRepr_HSequenceOfMaterialPropertyRepresentation();
    StepRepr_HSequenceOfMaterialPropertyRepresentation(const StepRepr_SequenceOfMaterialPropertyRepresentation& theOther);
    const StepRepr_SequenceOfMaterialPropertyRepresentation& Sequence();
    void Append (const StepRepr_SequenceOfMaterialPropertyRepresentation::value_type& theItem);
    void Append (StepRepr_SequenceOfMaterialPropertyRepresentation& theSequence);
    StepRepr_SequenceOfMaterialPropertyRepresentation& ChangeSequence();
};
%make_alias(StepRepr_HSequenceOfMaterialPropertyRepresentation)


class StepRepr_HSequenceOfRepresentationItem : public StepRepr_SequenceOfRepresentationItem, public Standard_Transient {
  public:
    StepRepr_HSequenceOfRepresentationItem();
    StepRepr_HSequenceOfRepresentationItem(const StepRepr_SequenceOfRepresentationItem& theOther);
    const StepRepr_SequenceOfRepresentationItem& Sequence();
    void Append (const StepRepr_SequenceOfRepresentationItem::value_type& theItem);
    void Append (StepRepr_SequenceOfRepresentationItem& theSequence);
    StepRepr_SequenceOfRepresentationItem& ChangeSequence();
};
%make_alias(StepRepr_HSequenceOfRepresentationItem)


/* class aliases */
%pythoncode {
}
