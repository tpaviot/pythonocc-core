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
%define STEPREPRDOCSTRING
"StepRepr module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_steprepr.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
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
%wrap_handle(StepRepr_RepresentationItem)
%wrap_handle(StepRepr_RepresentationMap)
%wrap_handle(StepRepr_RepresentationRelationship)
%wrap_handle(StepRepr_ShapeAspect)
%wrap_handle(StepRepr_ShapeAspectRelationship)
%wrap_handle(StepRepr_SuppliedPartRelationship)
%wrap_handle(StepRepr_AssemblyComponentUsage)
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
%wrap_handle(StepRepr_ParametricRepresentationContext)
%wrap_handle(StepRepr_ProductDefinitionShape)
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
%wrap_handle(StepRepr_HArray1OfRepresentationItem)
%wrap_handle(StepRepr_HArray1OfPropertyDefinitionRepresentation)
%wrap_handle(StepRepr_HArray1OfShapeAspect)
%wrap_handle(StepRepr_HSequenceOfRepresentationItem)
%wrap_handle(StepRepr_HSequenceOfMaterialPropertyRepresentation)
/* end handles declaration */

/* templates */
%template(StepRepr_Array1OfMaterialPropertyRepresentation) NCollection_Array1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>>;

%extend NCollection_Array1<opencascade::handle<StepRepr_MaterialPropertyRepresentation>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepRepr_Array1OfPropertyDefinitionRepresentation) NCollection_Array1<opencascade::handle<StepRepr_PropertyDefinitionRepresentation>>;

%extend NCollection_Array1<opencascade::handle<StepRepr_PropertyDefinitionRepresentation>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepRepr_Array1OfRepresentationItem) NCollection_Array1<opencascade::handle<StepRepr_RepresentationItem>>;

%extend NCollection_Array1<opencascade::handle<StepRepr_RepresentationItem>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepRepr_Array1OfShapeAspect) NCollection_Array1<opencascade::handle<StepRepr_ShapeAspect>>;

%extend NCollection_Array1<opencascade::handle<StepRepr_ShapeAspect>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(StepRepr_SequenceOfMaterialPropertyRepresentation) NCollection_Sequence<opencascade::handle<StepRepr_MaterialPropertyRepresentation>>;
%template(StepRepr_SequenceOfRepresentationItem) NCollection_Sequence<opencascade::handle<StepRepr_RepresentationItem>>;
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
		/****************** StepRepr_AssemblyComponentUsageSubstitute ******************/
		%feature("compactdefaultargs") StepRepr_AssemblyComponentUsageSubstitute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_AssemblyComponentUsageSubstitute;
		 StepRepr_AssemblyComponentUsageSubstitute();

		/****************** Base ******************/
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>
") Base;
		opencascade::handle<StepRepr_AssemblyComponentUsage> Base();

		/****************** Definition ******************/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Definition;
		opencascade::handle<TCollection_HAsciiString> Definition();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDef: TCollection_HAsciiString
aBase: StepRepr_AssemblyComponentUsage
aSubs: StepRepr_AssemblyComponentUsage

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDef, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aBase, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aSubs);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetBase ******************/
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBase: StepRepr_AssemblyComponentUsage

Returns
-------
None
") SetBase;
		void SetBase(const opencascade::handle<StepRepr_AssemblyComponentUsage> & aBase);

		/****************** SetDefinition ******************/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDef: TCollection_HAsciiString

Returns
-------
None
") SetDefinition;
		void SetDefinition(const opencascade::handle<TCollection_HAsciiString> & aDef);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetSubstitute ******************/
		%feature("compactdefaultargs") SetSubstitute;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSubstitute: StepRepr_AssemblyComponentUsage

Returns
-------
None
") SetSubstitute;
		void SetSubstitute(const opencascade::handle<StepRepr_AssemblyComponentUsage> & aSubstitute);

		/****************** Substitute ******************/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>
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
		/****************** StepRepr_CharacterizedDefinition ******************/
		%feature("compactdefaultargs") StepRepr_CharacterizedDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_CharacterizedDefinition;
		 StepRepr_CharacterizedDefinition();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of characterizeddefinition select type 1 -> characterizedobject from stepbasic 2 -> productdefinition from stepbasic 3 -> productdefinitionrelationship from stepbasic 4 -> productdefinitionshape from steprepr 5 -> shapeaspect from steprepr 6 -> shapeaspectrelationship from steprepr 7 -> documentfile from stepbasic 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** CharacterizedObject ******************/
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "Returns value as characterizedobject (or null if another type).

Returns
-------
opencascade::handle<StepBasic_CharacterizedObject>
") CharacterizedObject;
		opencascade::handle<StepBasic_CharacterizedObject> CharacterizedObject();

		/****************** DocumentFile ******************/
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "Returns value as documentfile (or null if another type).

Returns
-------
opencascade::handle<StepBasic_DocumentFile>
") DocumentFile;
		opencascade::handle<StepBasic_DocumentFile> DocumentFile();

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as productdefinition (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionRelationship ******************/
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "Returns value as productdefinitionrelationship (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionRelationship>
") ProductDefinitionRelationship;
		opencascade::handle<StepBasic_ProductDefinitionRelationship> ProductDefinitionRelationship();

		/****************** ProductDefinitionShape ******************/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Returns value as productdefinitionshape (or null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as shapeaspect (or null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as shapeaspectrelationship (or null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
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
		/****************** StepRepr_ConfigurationDesign ******************/
		%feature("compactdefaultargs") StepRepr_ConfigurationDesign;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_ConfigurationDesign;
		 StepRepr_ConfigurationDesign();

		/****************** Configuration ******************/
		%feature("compactdefaultargs") Configuration;
		%feature("autodoc", "Returns field configuration.

Returns
-------
opencascade::handle<StepRepr_ConfigurationItem>
") Configuration;
		opencascade::handle<StepRepr_ConfigurationItem> Configuration();

		/****************** Design ******************/
		%feature("compactdefaultargs") Design;
		%feature("autodoc", "Returns field design.

Returns
-------
StepRepr_ConfigurationDesignItem
") Design;
		StepRepr_ConfigurationDesignItem Design();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aConfiguration: StepRepr_ConfigurationItem
aDesign: StepRepr_ConfigurationDesignItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepRepr_ConfigurationItem> & aConfiguration, const StepRepr_ConfigurationDesignItem & aDesign);

		/****************** SetConfiguration ******************/
		%feature("compactdefaultargs") SetConfiguration;
		%feature("autodoc", "Set field configuration.

Parameters
----------
Configuration: StepRepr_ConfigurationItem

Returns
-------
None
") SetConfiguration;
		void SetConfiguration(const opencascade::handle<StepRepr_ConfigurationItem> & Configuration);

		/****************** SetDesign ******************/
		%feature("compactdefaultargs") SetDesign;
		%feature("autodoc", "Set field design.

Parameters
----------
Design: StepRepr_ConfigurationDesignItem

Returns
-------
None
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
		/****************** StepRepr_ConfigurationDesignItem ******************/
		%feature("compactdefaultargs") StepRepr_ConfigurationDesignItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_ConfigurationDesignItem;
		 StepRepr_ConfigurationDesignItem();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of configurationdesignitem select type 1 -> productdefinition from stepbasic 2 -> productdefinitionformation from stepbasic 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinition ******************/
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "Returns value as productdefinition (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinition>
") ProductDefinition;
		opencascade::handle<StepBasic_ProductDefinition> ProductDefinition();

		/****************** ProductDefinitionFormation ******************/
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "Returns value as productdefinitionformation (or null if another type).

Returns
-------
opencascade::handle<StepBasic_ProductDefinitionFormation>
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
		/****************** StepRepr_ConfigurationEffectivity ******************/
		%feature("compactdefaultargs") StepRepr_ConfigurationEffectivity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_ConfigurationEffectivity;
		 StepRepr_ConfigurationEffectivity();

		/****************** Configuration ******************/
		%feature("compactdefaultargs") Configuration;
		%feature("autodoc", "Returns field configuration.

Returns
-------
opencascade::handle<StepRepr_ConfigurationDesign>
") Configuration;
		opencascade::handle<StepRepr_ConfigurationDesign> Configuration();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aEffectivity_Id: TCollection_HAsciiString
aProductDefinitionEffectivity_Usage: StepBasic_ProductDefinitionRelationship
aConfiguration: StepRepr_ConfigurationDesign

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aEffectivity_Id, const opencascade::handle<StepBasic_ProductDefinitionRelationship> & aProductDefinitionEffectivity_Usage, const opencascade::handle<StepRepr_ConfigurationDesign> & aConfiguration);

		/****************** SetConfiguration ******************/
		%feature("compactdefaultargs") SetConfiguration;
		%feature("autodoc", "Set field configuration.

Parameters
----------
Configuration: StepRepr_ConfigurationDesign

Returns
-------
None
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
		/****************** StepRepr_ConfigurationItem ******************/
		%feature("compactdefaultargs") StepRepr_ConfigurationItem;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_ConfigurationItem;
		 StepRepr_ConfigurationItem();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** HasPurpose ******************/
		%feature("compactdefaultargs") HasPurpose;
		%feature("autodoc", "Returns true if optional field purpose is defined.

Returns
-------
bool
") HasPurpose;
		Standard_Boolean HasPurpose();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aItemConcept: StepRepr_ProductConcept
hasPurpose: bool
aPurpose: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_ProductConcept> & aItemConcept, const Standard_Boolean hasPurpose, const opencascade::handle<TCollection_HAsciiString> & aPurpose);

		/****************** ItemConcept ******************/
		%feature("compactdefaultargs") ItemConcept;
		%feature("autodoc", "Returns field itemconcept.

Returns
-------
opencascade::handle<StepRepr_ProductConcept>
") ItemConcept;
		opencascade::handle<StepRepr_ProductConcept> ItemConcept();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Purpose ******************/
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "Returns field purpose.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Purpose;
		opencascade::handle<TCollection_HAsciiString> Purpose();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Set field id.

Parameters
----------
Id: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****************** SetItemConcept ******************/
		%feature("compactdefaultargs") SetItemConcept;
		%feature("autodoc", "Set field itemconcept.

Parameters
----------
ItemConcept: StepRepr_ProductConcept

Returns
-------
None
") SetItemConcept;
		void SetItemConcept(const opencascade::handle<StepRepr_ProductConcept> & ItemConcept);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetPurpose ******************/
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "Set field purpose.

Parameters
----------
Purpose: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_DataEnvironment ******************/
		%feature("compactdefaultargs") StepRepr_DataEnvironment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_DataEnvironment;
		 StepRepr_DataEnvironment();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Elements ******************/
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "Returns field elements.

Returns
-------
opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation>
") Elements;
		opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation> Elements();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aElements: StepRepr_HArray1OfPropertyDefinitionRepresentation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation> & aElements);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetElements ******************/
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "Set field elements.

Parameters
----------
Elements: StepRepr_HArray1OfPropertyDefinitionRepresentation

Returns
-------
None
") SetElements;
		void SetElements(const opencascade::handle<StepRepr_HArray1OfPropertyDefinitionRepresentation> & Elements);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_FunctionallyDefinedTransformation ******************/
		%feature("compactdefaultargs") StepRepr_FunctionallyDefinedTransformation;
		%feature("autodoc", "Returns a functionallydefinedtransformation.

Returns
-------
None
") StepRepr_FunctionallyDefinedTransformation;
		 StepRepr_FunctionallyDefinedTransformation();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_ItemDefinedTransformation ******************/
		%feature("compactdefaultargs") StepRepr_ItemDefinedTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_ItemDefinedTransformation;
		 StepRepr_ItemDefinedTransformation();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aTransformItem1: StepRepr_RepresentationItem
aTransformItem2: StepRepr_RepresentationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_RepresentationItem> & aTransformItem1, const opencascade::handle<StepRepr_RepresentationItem> & aTransformItem2);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetTransformItem1 ******************/
		%feature("compactdefaultargs") SetTransformItem1;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItem: StepRepr_RepresentationItem

Returns
-------
None
") SetTransformItem1;
		void SetTransformItem1(const opencascade::handle<StepRepr_RepresentationItem> & aItem);

		/****************** SetTransformItem2 ******************/
		%feature("compactdefaultargs") SetTransformItem2;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItem: StepRepr_RepresentationItem

Returns
-------
None
") SetTransformItem2;
		void SetTransformItem2(const opencascade::handle<StepRepr_RepresentationItem> & aItem);

		/****************** TransformItem1 ******************/
		%feature("compactdefaultargs") TransformItem1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") TransformItem1;
		opencascade::handle<StepRepr_RepresentationItem> TransformItem1();

		/****************** TransformItem2 ******************/
		%feature("compactdefaultargs") TransformItem2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
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
		/****************** StepRepr_MaterialDesignation ******************/
		%feature("compactdefaultargs") StepRepr_MaterialDesignation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_MaterialDesignation;
		 StepRepr_MaterialDesignation();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aOfDefinition: StepRepr_CharacterizedDefinition

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepRepr_CharacterizedDefinition & aOfDefinition);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** OfDefinition ******************/
		%feature("compactdefaultargs") OfDefinition;
		%feature("autodoc", "No available documentation.

Returns
-------
StepRepr_CharacterizedDefinition
") OfDefinition;
		StepRepr_CharacterizedDefinition OfDefinition();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetOfDefinition ******************/
		%feature("compactdefaultargs") SetOfDefinition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOfDefinition: StepRepr_CharacterizedDefinition

Returns
-------
None
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
		/****************** StepRepr_ProductConcept ******************/
		%feature("compactdefaultargs") StepRepr_ProductConcept;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_ProductConcept;
		 StepRepr_ProductConcept();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Id ******************/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Returns field id.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Id;
		opencascade::handle<TCollection_HAsciiString> Id();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aId: TCollection_HAsciiString
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aMarketContext: StepBasic_ProductConceptContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aId, const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepBasic_ProductConceptContext> & aMarketContext);

		/****************** MarketContext ******************/
		%feature("compactdefaultargs") MarketContext;
		%feature("autodoc", "Returns field marketcontext.

Returns
-------
opencascade::handle<StepBasic_ProductConceptContext>
") MarketContext;
		opencascade::handle<StepBasic_ProductConceptContext> MarketContext();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Set field id.

Parameters
----------
Id: TCollection_HAsciiString

Returns
-------
None
") SetId;
		void SetId(const opencascade::handle<TCollection_HAsciiString> & Id);

		/****************** SetMarketContext ******************/
		%feature("compactdefaultargs") SetMarketContext;
		%feature("autodoc", "Set field marketcontext.

Parameters
----------
MarketContext: StepBasic_ProductConceptContext

Returns
-------
None
") SetMarketContext;
		void SetMarketContext(const opencascade::handle<StepBasic_ProductConceptContext> & MarketContext);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_ProductDefinitionUsage ******************/
		%feature("compactdefaultargs") StepRepr_ProductDefinitionUsage;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepRepr_PropertyDefinition ******************/
		%feature("compactdefaultargs") StepRepr_PropertyDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_PropertyDefinition;
		 StepRepr_PropertyDefinition();

		/****************** Definition ******************/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Returns field definition.

Returns
-------
StepRepr_CharacterizedDefinition
") Definition;
		StepRepr_CharacterizedDefinition Definition();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aDefinition: StepRepr_CharacterizedDefinition

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const StepRepr_CharacterizedDefinition & aDefinition);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetDefinition ******************/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "Set field definition.

Parameters
----------
Definition: StepRepr_CharacterizedDefinition

Returns
-------
None
") SetDefinition;
		void SetDefinition(const StepRepr_CharacterizedDefinition & Definition);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_PropertyDefinitionRelationship ******************/
		%feature("compactdefaultargs") StepRepr_PropertyDefinitionRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_PropertyDefinitionRelationship;
		 StepRepr_PropertyDefinitionRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRelatingPropertyDefinition: StepRepr_PropertyDefinition
aRelatedPropertyDefinition: StepRepr_PropertyDefinition

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_PropertyDefinition> & aRelatingPropertyDefinition, const opencascade::handle<StepRepr_PropertyDefinition> & aRelatedPropertyDefinition);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedPropertyDefinition ******************/
		%feature("compactdefaultargs") RelatedPropertyDefinition;
		%feature("autodoc", "Returns field relatedpropertydefinition.

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") RelatedPropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> RelatedPropertyDefinition();

		/****************** RelatingPropertyDefinition ******************/
		%feature("compactdefaultargs") RelatingPropertyDefinition;
		%feature("autodoc", "Returns field relatingpropertydefinition.

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") RelatingPropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> RelatingPropertyDefinition();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRelatedPropertyDefinition ******************/
		%feature("compactdefaultargs") SetRelatedPropertyDefinition;
		%feature("autodoc", "Set field relatedpropertydefinition.

Parameters
----------
RelatedPropertyDefinition: StepRepr_PropertyDefinition

Returns
-------
None
") SetRelatedPropertyDefinition;
		void SetRelatedPropertyDefinition(const opencascade::handle<StepRepr_PropertyDefinition> & RelatedPropertyDefinition);

		/****************** SetRelatingPropertyDefinition ******************/
		%feature("compactdefaultargs") SetRelatingPropertyDefinition;
		%feature("autodoc", "Set field relatingpropertydefinition.

Parameters
----------
RelatingPropertyDefinition: StepRepr_PropertyDefinition

Returns
-------
None
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
		/****************** StepRepr_PropertyDefinitionRepresentation ******************/
		%feature("compactdefaultargs") StepRepr_PropertyDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_PropertyDefinitionRepresentation;
		 StepRepr_PropertyDefinitionRepresentation();

		/****************** Definition ******************/
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "Returns field definition.

Returns
-------
StepRepr_RepresentedDefinition
") Definition;
		StepRepr_RepresentedDefinition Definition();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aDefinition: StepRepr_RepresentedDefinition
aUsedRepresentation: StepRepr_Representation

Returns
-------
None
") Init;
		void Init(const StepRepr_RepresentedDefinition & aDefinition, const opencascade::handle<StepRepr_Representation> & aUsedRepresentation);

		/****************** SetDefinition ******************/
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "Set field definition.

Parameters
----------
Definition: StepRepr_RepresentedDefinition

Returns
-------
None
") SetDefinition;
		void SetDefinition(const StepRepr_RepresentedDefinition & Definition);

		/****************** SetUsedRepresentation ******************/
		%feature("compactdefaultargs") SetUsedRepresentation;
		%feature("autodoc", "Set field usedrepresentation.

Parameters
----------
UsedRepresentation: StepRepr_Representation

Returns
-------
None
") SetUsedRepresentation;
		void SetUsedRepresentation(const opencascade::handle<StepRepr_Representation> & UsedRepresentation);

		/****************** UsedRepresentation ******************/
		%feature("compactdefaultargs") UsedRepresentation;
		%feature("autodoc", "Returns field usedrepresentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
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
		/****************** StepRepr_Representation ******************/
		%feature("compactdefaultargs") StepRepr_Representation;
		%feature("autodoc", "Returns a representation.

Returns
-------
None
") StepRepr_Representation;
		 StepRepr_Representation();

		/****************** ContextOfItems ******************/
		%feature("compactdefaultargs") ContextOfItems;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationContext>
") ContextOfItems;
		opencascade::handle<StepRepr_RepresentationContext> ContextOfItems();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aItems: StepRepr_HArray1OfRepresentationItem
aContextOfItems: StepRepr_RepresentationContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aItems, const opencascade::handle<StepRepr_RepresentationContext> & aContextOfItems);

		/****************** Items ******************/
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_HArray1OfRepresentationItem>
") Items;
		opencascade::handle<StepRepr_HArray1OfRepresentationItem> Items();

		/****************** ItemsValue ******************/
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") ItemsValue;
		opencascade::handle<StepRepr_RepresentationItem> ItemsValue(const Standard_Integer num);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** SetContextOfItems ******************/
		%feature("compactdefaultargs") SetContextOfItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aContextOfItems: StepRepr_RepresentationContext

Returns
-------
None
") SetContextOfItems;
		void SetContextOfItems(const opencascade::handle<StepRepr_RepresentationContext> & aContextOfItems);

		/****************** SetItems ******************/
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "No available documentation.

Parameters
----------
aItems: StepRepr_HArray1OfRepresentationItem

Returns
-------
None
") SetItems;
		void SetItems(const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & aItems);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_RepresentationContext ******************/
		%feature("compactdefaultargs") StepRepr_RepresentationContext;
		%feature("autodoc", "Returns a representationcontext.

Returns
-------
None
") StepRepr_RepresentationContext;
		 StepRepr_RepresentationContext();

		/****************** ContextIdentifier ******************/
		%feature("compactdefaultargs") ContextIdentifier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ContextIdentifier;
		opencascade::handle<TCollection_HAsciiString> ContextIdentifier();

		/****************** ContextType ******************/
		%feature("compactdefaultargs") ContextType;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ContextType;
		opencascade::handle<TCollection_HAsciiString> ContextType();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType);

		/****************** SetContextIdentifier ******************/
		%feature("compactdefaultargs") SetContextIdentifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
aContextIdentifier: TCollection_HAsciiString

Returns
-------
None
") SetContextIdentifier;
		void SetContextIdentifier(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier);

		/****************** SetContextType ******************/
		%feature("compactdefaultargs") SetContextType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aContextType: TCollection_HAsciiString

Returns
-------
None
") SetContextType;
		void SetContextType(const opencascade::handle<TCollection_HAsciiString> & aContextType);

};


%make_alias(StepRepr_RepresentationContext)

%extend StepRepr_RepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepRepr_RepresentationItem *
************************************/
class StepRepr_RepresentationItem : public Standard_Transient {
	public:
		/****************** StepRepr_RepresentationItem ******************/
		%feature("compactdefaultargs") StepRepr_RepresentationItem;
		%feature("autodoc", "Returns a representationitem.

Returns
-------
None
") StepRepr_RepresentationItem;
		 StepRepr_RepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_RepresentationMap ******************/
		%feature("compactdefaultargs") StepRepr_RepresentationMap;
		%feature("autodoc", "Returns a representationmap.

Returns
-------
None
") StepRepr_RepresentationMap;
		 StepRepr_RepresentationMap();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMappingOrigin: StepRepr_RepresentationItem
aMappedRepresentation: StepRepr_Representation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepRepr_RepresentationItem> & aMappingOrigin, const opencascade::handle<StepRepr_Representation> & aMappedRepresentation);

		/****************** MappedRepresentation ******************/
		%feature("compactdefaultargs") MappedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
") MappedRepresentation;
		opencascade::handle<StepRepr_Representation> MappedRepresentation();

		/****************** MappingOrigin ******************/
		%feature("compactdefaultargs") MappingOrigin;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") MappingOrigin;
		opencascade::handle<StepRepr_RepresentationItem> MappingOrigin();

		/****************** SetMappedRepresentation ******************/
		%feature("compactdefaultargs") SetMappedRepresentation;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMappedRepresentation: StepRepr_Representation

Returns
-------
None
") SetMappedRepresentation;
		void SetMappedRepresentation(const opencascade::handle<StepRepr_Representation> & aMappedRepresentation);

		/****************** SetMappingOrigin ******************/
		%feature("compactdefaultargs") SetMappingOrigin;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMappingOrigin: StepRepr_RepresentationItem

Returns
-------
None
") SetMappingOrigin;
		void SetMappingOrigin(const opencascade::handle<StepRepr_RepresentationItem> & aMappingOrigin);

};


%make_alias(StepRepr_RepresentationMap)

%extend StepRepr_RepresentationMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepRepr_RepresentationRelationship *
********************************************/
class StepRepr_RepresentationRelationship : public Standard_Transient {
	public:
		/****************** StepRepr_RepresentationRelationship ******************/
		%feature("compactdefaultargs") StepRepr_RepresentationRelationship;
		%feature("autodoc", "Returns a representationrelationship.

Returns
-------
None
") StepRepr_RepresentationRelationship;
		 StepRepr_RepresentationRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRep1: StepRepr_Representation
aRep2: StepRepr_Representation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_Representation> & aRep1, const opencascade::handle<StepRepr_Representation> & aRep2);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** Rep1 ******************/
		%feature("compactdefaultargs") Rep1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
") Rep1;
		opencascade::handle<StepRepr_Representation> Rep1();

		/****************** Rep2 ******************/
		%feature("compactdefaultargs") Rep2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_Representation>
") Rep2;
		opencascade::handle<StepRepr_Representation> Rep2();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetRep1 ******************/
		%feature("compactdefaultargs") SetRep1;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRep1: StepRepr_Representation

Returns
-------
None
") SetRep1;
		void SetRep1(const opencascade::handle<StepRepr_Representation> & aRep1);

		/****************** SetRep2 ******************/
		%feature("compactdefaultargs") SetRep2;
		%feature("autodoc", "No available documentation.

Parameters
----------
aRep2: StepRepr_Representation

Returns
-------
None
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
		/****************** StepRepr_RepresentedDefinition ******************/
		%feature("compactdefaultargs") StepRepr_RepresentedDefinition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_RepresentedDefinition;
		 StepRepr_RepresentedDefinition();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a kind of representeddefinition select type 1 -> generalproperty from stepbasic 2 -> propertydefinition from steprepr 3 -> propertydefinitionrelationship from steprepr 4 -> shapeaspect from steprepr 5 -> shapeaspectrelationship from steprepr 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** GeneralProperty ******************/
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "Returns value as generalproperty (or null if another type).

Returns
-------
opencascade::handle<StepBasic_GeneralProperty>
") GeneralProperty;
		opencascade::handle<StepBasic_GeneralProperty> GeneralProperty();

		/****************** PropertyDefinition ******************/
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "Returns value as propertydefinition (or null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinition>
") PropertyDefinition;
		opencascade::handle<StepRepr_PropertyDefinition> PropertyDefinition();

		/****************** PropertyDefinitionRelationship ******************/
		%feature("compactdefaultargs") PropertyDefinitionRelationship;
		%feature("autodoc", "Returns value as propertydefinitionrelationship (or null if another type).

Returns
-------
opencascade::handle<StepRepr_PropertyDefinitionRelationship>
") PropertyDefinitionRelationship;
		opencascade::handle<StepRepr_PropertyDefinitionRelationship> PropertyDefinitionRelationship();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as shapeaspect (or null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as shapeaspectrelationship (or null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
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
		/****************** StepRepr_ShapeAspect ******************/
		%feature("compactdefaultargs") StepRepr_ShapeAspect;
		%feature("autodoc", "Returns a shapeaspect.

Returns
-------
None
") StepRepr_ShapeAspect;
		 StepRepr_ShapeAspect();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aOfShape: StepRepr_ProductDefinitionShape
aProductDefinitional: StepData_Logical

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & aOfShape, const StepData_Logical aProductDefinitional);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** OfShape ******************/
		%feature("compactdefaultargs") OfShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") OfShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> OfShape();

		/****************** ProductDefinitional ******************/
		%feature("compactdefaultargs") ProductDefinitional;
		%feature("autodoc", "No available documentation.

Returns
-------
StepData_Logical
") ProductDefinitional;
		StepData_Logical ProductDefinitional();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & aName);

		/****************** SetOfShape ******************/
		%feature("compactdefaultargs") SetOfShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
aOfShape: StepRepr_ProductDefinitionShape

Returns
-------
None
") SetOfShape;
		void SetOfShape(const opencascade::handle<StepRepr_ProductDefinitionShape> & aOfShape);

		/****************** SetProductDefinitional ******************/
		%feature("compactdefaultargs") SetProductDefinitional;
		%feature("autodoc", "No available documentation.

Parameters
----------
aProductDefinitional: StepData_Logical

Returns
-------
None
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
		/****************** StepRepr_ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") StepRepr_ShapeAspectRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_ShapeAspectRelationship;
		 StepRepr_ShapeAspectRelationship();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "Returns field description.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** HasDescription ******************/
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "Returns true if optional field description is defined.

Returns
-------
bool
") HasDescription;
		Standard_Boolean HasDescription();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aName: TCollection_HAsciiString
hasDescription: bool
aDescription: TCollection_HAsciiString
aRelatingShapeAspect: StepRepr_ShapeAspect
aRelatedShapeAspect: StepRepr_ShapeAspect

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const Standard_Boolean hasDescription, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_ShapeAspect> & aRelatingShapeAspect, const opencascade::handle<StepRepr_ShapeAspect> & aRelatedShapeAspect);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns field name.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name();

		/****************** RelatedShapeAspect ******************/
		%feature("compactdefaultargs") RelatedShapeAspect;
		%feature("autodoc", "Returns field relatedshapeaspect.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") RelatedShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> RelatedShapeAspect();

		/****************** RelatingShapeAspect ******************/
		%feature("compactdefaultargs") RelatingShapeAspect;
		%feature("autodoc", "Returns field relatingshapeaspect.

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") RelatingShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> RelatingShapeAspect();

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "Set field description.

Parameters
----------
Description: TCollection_HAsciiString

Returns
-------
None
") SetDescription;
		void SetDescription(const opencascade::handle<TCollection_HAsciiString> & Description);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set field name.

Parameters
----------
Name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & Name);

		/****************** SetRelatedShapeAspect ******************/
		%feature("compactdefaultargs") SetRelatedShapeAspect;
		%feature("autodoc", "Set field relatedshapeaspect.

Parameters
----------
RelatedShapeAspect: StepRepr_ShapeAspect

Returns
-------
None
") SetRelatedShapeAspect;
		void SetRelatedShapeAspect(const opencascade::handle<StepRepr_ShapeAspect> & RelatedShapeAspect);

		/****************** SetRelatingShapeAspect ******************/
		%feature("compactdefaultargs") SetRelatingShapeAspect;
		%feature("autodoc", "Set field relatingshapeaspect.

Parameters
----------
RelatingShapeAspect: StepRepr_ShapeAspect

Returns
-------
None
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
		/****************** StepRepr_ShapeDefinition ******************/
		%feature("compactdefaultargs") StepRepr_ShapeDefinition;
		%feature("autodoc", "Returns a shapedefinition selecttype.

Returns
-------
None
") StepRepr_ShapeDefinition;
		 StepRepr_ShapeDefinition();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a shapedefinition kind entity that is : 1 -> productdefinitionshape 2 -> shapeaspect 3 -> shapeaspectrelationship 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** ProductDefinitionShape ******************/
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "Returns value as a productdefinitionshape (null if another type).

Returns
-------
opencascade::handle<StepRepr_ProductDefinitionShape>
") ProductDefinitionShape;
		opencascade::handle<StepRepr_ProductDefinitionShape> ProductDefinitionShape();

		/****************** ShapeAspect ******************/
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "Returns value as a shapeaspect (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspect>
") ShapeAspect;
		opencascade::handle<StepRepr_ShapeAspect> ShapeAspect();

		/****************** ShapeAspectRelationship ******************/
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "Returns value as a shapeaspectrelationship (null if another type).

Returns
-------
opencascade::handle<StepRepr_ShapeAspectRelationship>
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
		/****************** StepRepr_SuppliedPartRelationship ******************/
		%feature("compactdefaultargs") StepRepr_SuppliedPartRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_Transformation ******************/
		%feature("compactdefaultargs") StepRepr_Transformation;
		%feature("autodoc", "Returns a transformation selecttype.

Returns
-------
None
") StepRepr_Transformation;
		 StepRepr_Transformation();

		/****************** CaseNum ******************/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "Recognizes a transformation kind entity that is : 1 -> itemdefinedtransformation 2 -> functionallydefinedtransformation 0 else.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CaseNum;
		Standard_Integer CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****************** FunctionallyDefinedTransformation ******************/
		%feature("compactdefaultargs") FunctionallyDefinedTransformation;
		%feature("autodoc", "Returns value as a functionallydefinedtransformation (null if another type).

Returns
-------
opencascade::handle<StepRepr_FunctionallyDefinedTransformation>
") FunctionallyDefinedTransformation;
		opencascade::handle<StepRepr_FunctionallyDefinedTransformation> FunctionallyDefinedTransformation();

		/****************** ItemDefinedTransformation ******************/
		%feature("compactdefaultargs") ItemDefinedTransformation;
		%feature("autodoc", "Returns value as a itemdefinedtransformation (null if another type).

Returns
-------
opencascade::handle<StepRepr_ItemDefinedTransformation>
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
		/****************** StepRepr_AssemblyComponentUsage ******************/
		%feature("compactdefaultargs") StepRepr_AssemblyComponentUsage;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_AssemblyComponentUsage;
		 StepRepr_AssemblyComponentUsage();

		/****************** HasReferenceDesignator ******************/
		%feature("compactdefaultargs") HasReferenceDesignator;
		%feature("autodoc", "Returns true if optional field referencedesignator is defined.

Returns
-------
bool
") HasReferenceDesignator;
		Standard_Boolean HasReferenceDesignator();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aReferenceDesignator);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aReferenceDesignator);

		/****************** ReferenceDesignator ******************/
		%feature("compactdefaultargs") ReferenceDesignator;
		%feature("autodoc", "Returns field referencedesignator.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ReferenceDesignator;
		opencascade::handle<TCollection_HAsciiString> ReferenceDesignator();

		/****************** SetReferenceDesignator ******************/
		%feature("compactdefaultargs") SetReferenceDesignator;
		%feature("autodoc", "Set field referencedesignator.

Parameters
----------
ReferenceDesignator: TCollection_HAsciiString

Returns
-------
None
") SetReferenceDesignator;
		void SetReferenceDesignator(const opencascade::handle<TCollection_HAsciiString> & ReferenceDesignator);

};


%make_alias(StepRepr_AssemblyComponentUsage)

%extend StepRepr_AssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepRepr_CharacterizedRepresentation *
*********************************************/
class StepRepr_CharacterizedRepresentation : public StepRepr_Representation {
	public:
		/****************** StepRepr_CharacterizedRepresentation ******************/
		%feature("compactdefaultargs") StepRepr_CharacterizedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_CharacterizedRepresentation;
		 StepRepr_CharacterizedRepresentation();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Returns a characterizedrepresentation.

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theItems: StepRepr_HArray1OfRepresentationItem
theContextOfItems: StepRepr_RepresentationContext

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & theItems, const opencascade::handle<StepRepr_RepresentationContext> & theContextOfItems);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDescription: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_CompShAspAndDatumFeatAndShAsp ******************/
		%feature("compactdefaultargs") StepRepr_CompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_CompositeShapeAspect ******************/
		%feature("compactdefaultargs") StepRepr_CompositeShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_CompoundRepresentationItem ******************/
		%feature("compactdefaultargs") StepRepr_CompoundRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_CompoundRepresentationItem;
		 StepRepr_CompoundRepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
item_element: StepRepr_HArray1OfRepresentationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & item_element);

		/****************** ItemElement ******************/
		%feature("compactdefaultargs") ItemElement;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_HArray1OfRepresentationItem>
") ItemElement;
		opencascade::handle<StepRepr_HArray1OfRepresentationItem> ItemElement();

		/****************** ItemElementValue ******************/
		%feature("compactdefaultargs") ItemElementValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") ItemElementValue;
		opencascade::handle<StepRepr_RepresentationItem> ItemElementValue(const Standard_Integer num);

		/****************** NbItemElement ******************/
		%feature("compactdefaultargs") NbItemElement;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbItemElement;
		Standard_Integer NbItemElement();

		/****************** SetItemElement ******************/
		%feature("compactdefaultargs") SetItemElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
item_element: StepRepr_HArray1OfRepresentationItem

Returns
-------
None
") SetItemElement;
		void SetItemElement(const opencascade::handle<StepRepr_HArray1OfRepresentationItem> & item_element);

		/****************** SetItemElementValue ******************/
		%feature("compactdefaultargs") SetItemElementValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int
anelement: StepRepr_RepresentationItem

Returns
-------
None
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
		/****************** StepRepr_ConstructiveGeometryRepresentation ******************/
		%feature("compactdefaultargs") StepRepr_ConstructiveGeometryRepresentation;
		%feature("autodoc", "Returns a constructivegeometryrepresentation.

Returns
-------
None
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
		/****************** StepRepr_ConstructiveGeometryRepresentationRelationship ******************/
		%feature("compactdefaultargs") StepRepr_ConstructiveGeometryRepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_DefinitionalRepresentation ******************/
		%feature("compactdefaultargs") StepRepr_DefinitionalRepresentation;
		%feature("autodoc", "Returns a definitionalrepresentation.

Returns
-------
None
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
		/****************** StepRepr_DerivedShapeAspect ******************/
		%feature("compactdefaultargs") StepRepr_DerivedShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_DescriptiveRepresentationItem ******************/
		%feature("compactdefaultargs") StepRepr_DescriptiveRepresentationItem;
		%feature("autodoc", "Returns a descriptiverepresentationitem.

Returns
-------
None
") StepRepr_DescriptiveRepresentationItem;
		 StepRepr_DescriptiveRepresentationItem();

		/****************** Description ******************/
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Description;
		opencascade::handle<TCollection_HAsciiString> Description();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription);

		/****************** SetDescription ******************/
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDescription: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_ExternallyDefinedRepresentation ******************/
		%feature("compactdefaultargs") StepRepr_ExternallyDefinedRepresentation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_FeatureForDatumTargetRelationship ******************/
		%feature("compactdefaultargs") StepRepr_FeatureForDatumTargetRelationship;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepRepr_GlobalUncertaintyAssignedContext ******************/
		%feature("compactdefaultargs") StepRepr_GlobalUncertaintyAssignedContext;
		%feature("autodoc", "Returns a globaluncertaintyassignedcontext.

Returns
-------
None
") StepRepr_GlobalUncertaintyAssignedContext;
		 StepRepr_GlobalUncertaintyAssignedContext();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aUncertainty: StepBasic_HArray1OfUncertaintyMeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit> & aUncertainty);

		/****************** NbUncertainty ******************/
		%feature("compactdefaultargs") NbUncertainty;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUncertainty;
		Standard_Integer NbUncertainty();

		/****************** SetUncertainty ******************/
		%feature("compactdefaultargs") SetUncertainty;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUncertainty: StepBasic_HArray1OfUncertaintyMeasureWithUnit

Returns
-------
None
") SetUncertainty;
		void SetUncertainty(const opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit> & aUncertainty);

		/****************** Uncertainty ******************/
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit>
") Uncertainty;
		opencascade::handle<StepBasic_HArray1OfUncertaintyMeasureWithUnit> Uncertainty();

		/****************** UncertaintyValue ******************/
		%feature("compactdefaultargs") UncertaintyValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>
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
		/****************** StepRepr_GlobalUnitAssignedContext ******************/
		%feature("compactdefaultargs") StepRepr_GlobalUnitAssignedContext;
		%feature("autodoc", "Returns a globalunitassignedcontext.

Returns
-------
None
") StepRepr_GlobalUnitAssignedContext;
		 StepRepr_GlobalUnitAssignedContext();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aUnits: StepBasic_HArray1OfNamedUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const opencascade::handle<StepBasic_HArray1OfNamedUnit> & aUnits);

		/****************** NbUnits ******************/
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUnits;
		Standard_Integer NbUnits();

		/****************** SetUnits ******************/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "No available documentation.

Parameters
----------
aUnits: StepBasic_HArray1OfNamedUnit

Returns
-------
None
") SetUnits;
		void SetUnits(const opencascade::handle<StepBasic_HArray1OfNamedUnit> & aUnits);

		/****************** Units ******************/
		%feature("compactdefaultargs") Units;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_HArray1OfNamedUnit>
") Units;
		opencascade::handle<StepBasic_HArray1OfNamedUnit> Units();

		/****************** UnitsValue ******************/
		%feature("compactdefaultargs") UnitsValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
num: int

Returns
-------
opencascade::handle<StepBasic_NamedUnit>
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
		/****************** StepRepr_IntegerRepresentationItem ******************/
		%feature("compactdefaultargs") StepRepr_IntegerRepresentationItem;
		%feature("autodoc", "Returns a integerrepresentationitem.

Returns
-------
None
") StepRepr_IntegerRepresentationItem;
		 StepRepr_IntegerRepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theValue: int

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const Standard_Integer theValue);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer theValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		/****************** StepRepr_MakeFromUsageOption ******************/
		%feature("compactdefaultargs") StepRepr_MakeFromUsageOption;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_MakeFromUsageOption;
		 StepRepr_MakeFromUsageOption();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Integer aRanking, const opencascade::handle<TCollection_HAsciiString> & aRankingRationale, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Integer aRanking, const opencascade::handle<TCollection_HAsciiString> & aRankingRationale, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Returns field quantity.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") Quantity;
		opencascade::handle<StepBasic_MeasureWithUnit> Quantity();

		/****************** Ranking ******************/
		%feature("compactdefaultargs") Ranking;
		%feature("autodoc", "Returns field ranking.

Returns
-------
int
") Ranking;
		Standard_Integer Ranking();

		/****************** RankingRationale ******************/
		%feature("compactdefaultargs") RankingRationale;
		%feature("autodoc", "Returns field rankingrationale.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") RankingRationale;
		opencascade::handle<TCollection_HAsciiString> RankingRationale();

		/****************** SetQuantity ******************/
		%feature("compactdefaultargs") SetQuantity;
		%feature("autodoc", "Set field quantity.

Parameters
----------
Quantity: StepBasic_MeasureWithUnit

Returns
-------
None
") SetQuantity;
		void SetQuantity(const opencascade::handle<StepBasic_MeasureWithUnit> & Quantity);

		/****************** SetRanking ******************/
		%feature("compactdefaultargs") SetRanking;
		%feature("autodoc", "Set field ranking.

Parameters
----------
Ranking: int

Returns
-------
None
") SetRanking;
		void SetRanking(const Standard_Integer Ranking);

		/****************** SetRankingRationale ******************/
		%feature("compactdefaultargs") SetRankingRationale;
		%feature("autodoc", "Set field rankingrationale.

Parameters
----------
RankingRationale: TCollection_HAsciiString

Returns
-------
None
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
		/****************** StepRepr_MappedItem ******************/
		%feature("compactdefaultargs") StepRepr_MappedItem;
		%feature("autodoc", "Returns a mappeditem.

Returns
-------
None
") StepRepr_MappedItem;
		 StepRepr_MappedItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aMappingSource: StepRepr_RepresentationMap
aMappingTarget: StepRepr_RepresentationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepRepr_RepresentationMap> & aMappingSource, const opencascade::handle<StepRepr_RepresentationItem> & aMappingTarget);

		/****************** MappingSource ******************/
		%feature("compactdefaultargs") MappingSource;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationMap>
") MappingSource;
		opencascade::handle<StepRepr_RepresentationMap> MappingSource();

		/****************** MappingTarget ******************/
		%feature("compactdefaultargs") MappingTarget;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") MappingTarget;
		opencascade::handle<StepRepr_RepresentationItem> MappingTarget();

		/****************** SetMappingSource ******************/
		%feature("compactdefaultargs") SetMappingSource;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMappingSource: StepRepr_RepresentationMap

Returns
-------
None
") SetMappingSource;
		void SetMappingSource(const opencascade::handle<StepRepr_RepresentationMap> & aMappingSource);

		/****************** SetMappingTarget ******************/
		%feature("compactdefaultargs") SetMappingTarget;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMappingTarget: StepRepr_RepresentationItem

Returns
-------
None
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
		/****************** StepRepr_MaterialProperty ******************/
		%feature("compactdefaultargs") StepRepr_MaterialProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepRepr_MaterialPropertyRepresentation ******************/
		%feature("compactdefaultargs") StepRepr_MaterialPropertyRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_MaterialPropertyRepresentation;
		 StepRepr_MaterialPropertyRepresentation();

		/****************** DependentEnvironment ******************/
		%feature("compactdefaultargs") DependentEnvironment;
		%feature("autodoc", "Returns field dependentenvironment.

Returns
-------
opencascade::handle<StepRepr_DataEnvironment>
") DependentEnvironment;
		opencascade::handle<StepRepr_DataEnvironment> DependentEnvironment();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
aPropertyDefinitionRepresentation_Definition: StepRepr_RepresentedDefinition
aPropertyDefinitionRepresentation_UsedRepresentation: StepRepr_Representation
aDependentEnvironment: StepRepr_DataEnvironment

Returns
-------
None
") Init;
		void Init(const StepRepr_RepresentedDefinition & aPropertyDefinitionRepresentation_Definition, const opencascade::handle<StepRepr_Representation> & aPropertyDefinitionRepresentation_UsedRepresentation, const opencascade::handle<StepRepr_DataEnvironment> & aDependentEnvironment);

		/****************** SetDependentEnvironment ******************/
		%feature("compactdefaultargs") SetDependentEnvironment;
		%feature("autodoc", "Set field dependentenvironment.

Parameters
----------
DependentEnvironment: StepRepr_DataEnvironment

Returns
-------
None
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
		/****************** StepRepr_MeasureRepresentationItem ******************/
		%feature("compactdefaultargs") StepRepr_MeasureRepresentationItem;
		%feature("autodoc", "Creates empty object.

Returns
-------
None
") StepRepr_MeasureRepresentationItem;
		 StepRepr_MeasureRepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Init all fields.

Parameters
----------
aName: TCollection_HAsciiString
aValueComponent: StepBasic_MeasureValueMember
aUnitComponent: StepBasic_Unit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepBasic_MeasureValueMember> & aValueComponent, const StepBasic_Unit & aUnitComponent);

		/****************** Measure ******************/
		%feature("compactdefaultargs") Measure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") Measure;
		opencascade::handle<StepBasic_MeasureWithUnit> Measure();

		/****************** SetMeasure ******************/
		%feature("compactdefaultargs") SetMeasure;
		%feature("autodoc", "No available documentation.

Parameters
----------
Measure: StepBasic_MeasureWithUnit

Returns
-------
None
") SetMeasure;
		void SetMeasure(const opencascade::handle<StepBasic_MeasureWithUnit> & Measure);

};


%make_alias(StepRepr_MeasureRepresentationItem)

%extend StepRepr_MeasureRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepRepr_ParametricRepresentationContext *
*************************************************/
class StepRepr_ParametricRepresentationContext : public StepRepr_RepresentationContext {
	public:
		/****************** StepRepr_ParametricRepresentationContext ******************/
		%feature("compactdefaultargs") StepRepr_ParametricRepresentationContext;
		%feature("autodoc", "Returns a parametricrepresentationcontext.

Returns
-------
None
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
		/****************** StepRepr_ProductDefinitionShape ******************/
		%feature("compactdefaultargs") StepRepr_ProductDefinitionShape;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_ProductDefinitionShape;
		 StepRepr_ProductDefinitionShape();

};


%make_alias(StepRepr_ProductDefinitionShape)

%extend StepRepr_ProductDefinitionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class StepRepr_ReprItemAndMeasureWithUnit *
********************************************/
class StepRepr_ReprItemAndMeasureWithUnit : public StepRepr_RepresentationItem {
	public:
		/****************** StepRepr_ReprItemAndMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepRepr_ReprItemAndMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_ReprItemAndMeasureWithUnit;
		 StepRepr_ReprItemAndMeasureWithUnit();

		/****************** GetMeasureRepresentationItem ******************/
		%feature("compactdefaultargs") GetMeasureRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_MeasureRepresentationItem>
") GetMeasureRepresentationItem;
		opencascade::handle<StepRepr_MeasureRepresentationItem> GetMeasureRepresentationItem();

		/****************** GetMeasureWithUnit ******************/
		%feature("compactdefaultargs") GetMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") GetMeasureWithUnit;
		opencascade::handle<StepBasic_MeasureWithUnit> GetMeasureWithUnit();

		/****************** GetRepresentationItem ******************/
		%feature("compactdefaultargs") GetRepresentationItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepRepr_RepresentationItem>
") GetRepresentationItem;
		opencascade::handle<StepRepr_RepresentationItem> GetRepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMWU: StepBasic_MeasureWithUnit
aRI: StepRepr_RepresentationItem

Returns
-------
None
") Init;
		void Init(const opencascade::handle<StepBasic_MeasureWithUnit> & aMWU, const opencascade::handle<StepRepr_RepresentationItem> & aRI);

		/****************** SetMeasureWithUnit ******************/
		%feature("compactdefaultargs") SetMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMWU: StepBasic_MeasureWithUnit

Returns
-------
None
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
		/****************** StepRepr_ShapeAspectDerivingRelationship ******************/
		%feature("compactdefaultargs") StepRepr_ShapeAspectDerivingRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_ShapeAspectTransition ******************/
		%feature("compactdefaultargs") StepRepr_ShapeAspectTransition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepRepr_ShapeRepresentationRelationship ******************/
		%feature("compactdefaultargs") StepRepr_ShapeRepresentationRelationship;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_StructuralResponseProperty ******************/
		%feature("compactdefaultargs") StepRepr_StructuralResponseProperty;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepRepr_StructuralResponsePropertyDefinitionRepresentation ******************/
		%feature("compactdefaultargs") StepRepr_StructuralResponsePropertyDefinitionRepresentation;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepRepr_ValueRepresentationItem ******************/
		%feature("compactdefaultargs") StepRepr_ValueRepresentationItem;
		%feature("autodoc", "Returns a valuerepresentationitem.

Returns
-------
None
") StepRepr_ValueRepresentationItem;
		 StepRepr_ValueRepresentationItem();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theValueComponentMember: StepBasic_MeasureValueMember

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<StepBasic_MeasureValueMember> & theValueComponentMember);

		/****************** SetValueComponentMember ******************/
		%feature("compactdefaultargs") SetValueComponentMember;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValueComponentMember: StepBasic_MeasureValueMember

Returns
-------
None
") SetValueComponentMember;
		void SetValueComponentMember(const opencascade::handle<StepBasic_MeasureValueMember> & theValueComponentMember);

		/****************** ValueComponentMember ******************/
		%feature("compactdefaultargs") ValueComponentMember;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_MeasureValueMember>
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
		/****************** StepRepr_Apex ******************/
		%feature("compactdefaultargs") StepRepr_Apex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_CentreOfSymmetry ******************/
		%feature("compactdefaultargs") StepRepr_CentreOfSymmetry;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp ******************/
		%feature("compactdefaultargs") StepRepr_CompGroupShAspAndCompShAspAndDatumFeatAndShAsp;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_CompositeGroupShapeAspect ******************/
		%feature("compactdefaultargs") StepRepr_CompositeGroupShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_ContinuosShapeAspect ******************/
		%feature("compactdefaultargs") StepRepr_ContinuosShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_Extension ******************/
		%feature("compactdefaultargs") StepRepr_Extension;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_GeometricAlignment ******************/
		%feature("compactdefaultargs") StepRepr_GeometricAlignment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_NextAssemblyUsageOccurrence ******************/
		%feature("compactdefaultargs") StepRepr_NextAssemblyUsageOccurrence;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
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
		/****************** StepRepr_ParallelOffset ******************/
		%feature("compactdefaultargs") StepRepr_ParallelOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_ParallelOffset;
		 StepRepr_ParallelOffset();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

Parameters
----------
theName: TCollection_HAsciiString
theDescription: TCollection_HAsciiString
theOfShape: StepRepr_ProductDefinitionShape
theProductDefinitional: StepData_Logical
theOffset: StepBasic_MeasureWithUnit

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TCollection_HAsciiString> & theDescription, const opencascade::handle<StepRepr_ProductDefinitionShape> & theOfShape, const StepData_Logical theProductDefinitional, const opencascade::handle<StepBasic_MeasureWithUnit> & theOffset);

		/****************** Offset ******************/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Returns field offset .

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") Offset;
		opencascade::handle<StepBasic_MeasureWithUnit> Offset();

		/****************** SetOffset ******************/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "Set field offset .

Parameters
----------
theOffset: StepBasic_MeasureWithUnit

Returns
-------
None
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
		/****************** StepRepr_PerpendicularTo ******************/
		%feature("compactdefaultargs") StepRepr_PerpendicularTo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_PromissoryUsageOccurrence ******************/
		%feature("compactdefaultargs") StepRepr_PromissoryUsageOccurrence;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_QuantifiedAssemblyComponentUsage ******************/
		%feature("compactdefaultargs") StepRepr_QuantifiedAssemblyComponentUsage;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_QuantifiedAssemblyComponentUsage;
		 StepRepr_QuantifiedAssemblyComponentUsage();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepBasic_MeasureWithUnit> & aQuantity);

		/****************** Quantity ******************/
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "Returns field quantity.

Returns
-------
opencascade::handle<StepBasic_MeasureWithUnit>
") Quantity;
		opencascade::handle<StepBasic_MeasureWithUnit> Quantity();

		/****************** SetQuantity ******************/
		%feature("compactdefaultargs") SetQuantity;
		%feature("autodoc", "Set field quantity.

Parameters
----------
Quantity: StepBasic_MeasureWithUnit

Returns
-------
None
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
		/****************** StepRepr_ReprItemAndLengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepRepr_ReprItemAndLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_ReprItemAndLengthMeasureWithUnit;
		 StepRepr_ReprItemAndLengthMeasureWithUnit();

		/****************** GetLengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") GetLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") GetLengthMeasureWithUnit;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetLengthMeasureWithUnit();

		/****************** SetLengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") SetLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLMWU: StepBasic_LengthMeasureWithUnit

Returns
-------
None
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
		/****************** StepRepr_ReprItemAndPlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") StepRepr_ReprItemAndPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_ReprItemAndPlaneAngleMeasureWithUnit;
		 StepRepr_ReprItemAndPlaneAngleMeasureWithUnit();

		/****************** GetPlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") GetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit>
") GetPlaneAngleMeasureWithUnit;
		opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> GetPlaneAngleMeasureWithUnit();

		/****************** SetPlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") SetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLMWU: StepBasic_PlaneAngleMeasureWithUnit

Returns
-------
None
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
		/****************** StepRepr_RepresentationRelationshipWithTransformation ******************/
		%feature("compactdefaultargs") StepRepr_RepresentationRelationshipWithTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_RepresentationRelationshipWithTransformation;
		 StepRepr_RepresentationRelationshipWithTransformation();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
aName: TCollection_HAsciiString
aDescription: TCollection_HAsciiString
aRep1: StepRepr_Representation
aRep2: StepRepr_Representation
aTransf: StepRepr_Transformation

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<TCollection_HAsciiString> & aDescription, const opencascade::handle<StepRepr_Representation> & aRep1, const opencascade::handle<StepRepr_Representation> & aRep2, const StepRepr_Transformation & aTransf);

		/****************** SetTransformationOperator ******************/
		%feature("compactdefaultargs") SetTransformationOperator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aTrans: StepRepr_Transformation

Returns
-------
None
") SetTransformationOperator;
		void SetTransformationOperator(const StepRepr_Transformation & aTrans);

		/****************** TransformationOperator ******************/
		%feature("compactdefaultargs") TransformationOperator;
		%feature("autodoc", "No available documentation.

Returns
-------
StepRepr_Transformation
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
		/****************** StepRepr_SpecifiedHigherUsageOccurrence ******************/
		%feature("compactdefaultargs") StepRepr_SpecifiedHigherUsageOccurrence;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") StepRepr_SpecifiedHigherUsageOccurrence;
		 StepRepr_SpecifiedHigherUsageOccurrence();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatingProductDefinition, const opencascade::handle<StepBasic_ProductDefinition> & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aUpperUsage, const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & aNextUsage);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all fields (own and inherited).

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

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Id, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Name, const Standard_Boolean hasProductDefinitionRelationship_Description, const opencascade::handle<TCollection_HAsciiString> & aProductDefinitionRelationship_Description, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatingProductDefinition, const StepBasic_ProductDefinitionOrReference & aProductDefinitionRelationship_RelatedProductDefinition, const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<TCollection_HAsciiString> & aAssemblyComponentUsage_ReferenceDesignator, const opencascade::handle<StepRepr_AssemblyComponentUsage> & aUpperUsage, const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & aNextUsage);

		/****************** NextUsage ******************/
		%feature("compactdefaultargs") NextUsage;
		%feature("autodoc", "Returns field nextusage.

Returns
-------
opencascade::handle<StepRepr_NextAssemblyUsageOccurrence>
") NextUsage;
		opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> NextUsage();

		/****************** SetNextUsage ******************/
		%feature("compactdefaultargs") SetNextUsage;
		%feature("autodoc", "Set field nextusage.

Parameters
----------
NextUsage: StepRepr_NextAssemblyUsageOccurrence

Returns
-------
None
") SetNextUsage;
		void SetNextUsage(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & NextUsage);

		/****************** SetUpperUsage ******************/
		%feature("compactdefaultargs") SetUpperUsage;
		%feature("autodoc", "Set field upperusage.

Parameters
----------
UpperUsage: StepRepr_AssemblyComponentUsage

Returns
-------
None
") SetUpperUsage;
		void SetUpperUsage(const opencascade::handle<StepRepr_AssemblyComponentUsage> & UpperUsage);

		/****************** UpperUsage ******************/
		%feature("compactdefaultargs") UpperUsage;
		%feature("autodoc", "Returns field upperusage.

Returns
-------
opencascade::handle<StepRepr_AssemblyComponentUsage>
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
		/****************** StepRepr_Tangent ******************/
		%feature("compactdefaultargs") StepRepr_Tangent;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_ValueRange ******************/
		%feature("compactdefaultargs") StepRepr_ValueRange;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_AllAroundShapeAspect ******************/
		%feature("compactdefaultargs") StepRepr_AllAroundShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_BetweenShapeAspect ******************/
		%feature("compactdefaultargs") StepRepr_BetweenShapeAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI ******************/
		%feature("compactdefaultargs") StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI;
		 StepRepr_ReprItemAndLengthMeasureWithUnitAndQRI();

		/****************** GetLengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") GetLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_LengthMeasureWithUnit>
") GetLengthMeasureWithUnit;
		opencascade::handle<StepBasic_LengthMeasureWithUnit> GetLengthMeasureWithUnit();

		/****************** SetLengthMeasureWithUnit ******************/
		%feature("compactdefaultargs") SetLengthMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLMWU: StepBasic_LengthMeasureWithUnit

Returns
-------
None
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
		/****************** StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI ******************/
		%feature("compactdefaultargs") StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI;
		 StepRepr_ReprItemAndPlaneAngleMeasureWithUnitAndQRI();

		/****************** GetPlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") GetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit>
") GetPlaneAngleMeasureWithUnit;
		opencascade::handle<StepBasic_PlaneAngleMeasureWithUnit> GetPlaneAngleMeasureWithUnit();

		/****************** SetPlaneAngleMeasureWithUnit ******************/
		%feature("compactdefaultargs") SetPlaneAngleMeasureWithUnit;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLMWU: StepBasic_PlaneAngleMeasureWithUnit

Returns
-------
None
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
		/****************** StepRepr_ShapeRepresentationRelationshipWithTransformation ******************/
		%feature("compactdefaultargs") StepRepr_ShapeRepresentationRelationshipWithTransformation;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
class StepRepr_HArray1OfMaterialPropertyRepresentation : public  StepRepr_Array1OfMaterialPropertyRepresentation, public Standard_Transient {
  public:
    StepRepr_HArray1OfMaterialPropertyRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfMaterialPropertyRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepRepr_Array1OfMaterialPropertyRepresentation::value_type& theValue);
    StepRepr_HArray1OfMaterialPropertyRepresentation(const  StepRepr_Array1OfMaterialPropertyRepresentation& theOther);
    const  StepRepr_Array1OfMaterialPropertyRepresentation& Array1();
     StepRepr_Array1OfMaterialPropertyRepresentation& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfMaterialPropertyRepresentation)


class StepRepr_HArray1OfRepresentationItem : public  StepRepr_Array1OfRepresentationItem, public Standard_Transient {
  public:
    StepRepr_HArray1OfRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfRepresentationItem(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepRepr_Array1OfRepresentationItem::value_type& theValue);
    StepRepr_HArray1OfRepresentationItem(const  StepRepr_Array1OfRepresentationItem& theOther);
    const  StepRepr_Array1OfRepresentationItem& Array1();
     StepRepr_Array1OfRepresentationItem& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfRepresentationItem)


class StepRepr_HArray1OfPropertyDefinitionRepresentation : public  StepRepr_Array1OfPropertyDefinitionRepresentation, public Standard_Transient {
  public:
    StepRepr_HArray1OfPropertyDefinitionRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfPropertyDefinitionRepresentation(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepRepr_Array1OfPropertyDefinitionRepresentation::value_type& theValue);
    StepRepr_HArray1OfPropertyDefinitionRepresentation(const  StepRepr_Array1OfPropertyDefinitionRepresentation& theOther);
    const  StepRepr_Array1OfPropertyDefinitionRepresentation& Array1();
     StepRepr_Array1OfPropertyDefinitionRepresentation& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfPropertyDefinitionRepresentation)


class StepRepr_HArray1OfShapeAspect : public  StepRepr_Array1OfShapeAspect, public Standard_Transient {
  public:
    StepRepr_HArray1OfShapeAspect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepRepr_HArray1OfShapeAspect(const Standard_Integer theLower, const Standard_Integer theUpper, const  StepRepr_Array1OfShapeAspect::value_type& theValue);
    StepRepr_HArray1OfShapeAspect(const  StepRepr_Array1OfShapeAspect& theOther);
    const  StepRepr_Array1OfShapeAspect& Array1();
     StepRepr_Array1OfShapeAspect& ChangeArray1();
};
%make_alias(StepRepr_HArray1OfShapeAspect)


/* harray2 classes */
/* hsequence classes */
class StepRepr_HSequenceOfRepresentationItem : public  StepRepr_SequenceOfRepresentationItem, public Standard_Transient {
  public:
    StepRepr_HSequenceOfRepresentationItem();
    StepRepr_HSequenceOfRepresentationItem(const  StepRepr_SequenceOfRepresentationItem& theOther);
    const  StepRepr_SequenceOfRepresentationItem& Sequence();
    void Append (const  StepRepr_SequenceOfRepresentationItem::value_type& theItem);
    void Append ( StepRepr_SequenceOfRepresentationItem& theSequence);
     StepRepr_SequenceOfRepresentationItem& ChangeSequence();
};
%make_alias(StepRepr_HSequenceOfRepresentationItem)


class StepRepr_HSequenceOfMaterialPropertyRepresentation : public  StepRepr_SequenceOfMaterialPropertyRepresentation, public Standard_Transient {
  public:
    StepRepr_HSequenceOfMaterialPropertyRepresentation();
    StepRepr_HSequenceOfMaterialPropertyRepresentation(const  StepRepr_SequenceOfMaterialPropertyRepresentation& theOther);
    const  StepRepr_SequenceOfMaterialPropertyRepresentation& Sequence();
    void Append (const  StepRepr_SequenceOfMaterialPropertyRepresentation::value_type& theItem);
    void Append ( StepRepr_SequenceOfMaterialPropertyRepresentation& theSequence);
     StepRepr_SequenceOfMaterialPropertyRepresentation& ChangeSequence();
};
%make_alias(StepRepr_HSequenceOfMaterialPropertyRepresentation)


