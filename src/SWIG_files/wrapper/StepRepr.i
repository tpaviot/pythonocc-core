/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
"-Purpose : Sub-Schema of Step for Representations
Collects definitions of STEP entities used for describing
representation structures (from Parts 41, 43, 44 of ISO10303)
"
%enddef
%module (package="OCC.Core", docstring=STEPREPRDOCSTRING) StepRepr

#pragma SWIG nowarn=504,325,503

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


%include StepRepr_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(StepRepr_AssemblyComponentUsageSubstitute)
%wrap_handle(StepRepr_ConfigurationDesign)
%wrap_handle(StepRepr_ConfigurationEffectivity)
%wrap_handle(StepRepr_ConfigurationItem)
%wrap_handle(StepRepr_DataEnvironment)
%wrap_handle(StepRepr_FunctionallyDefinedTransformation)
%wrap_handle(StepRepr_HArray1OfMaterialPropertyRepresentation)
%wrap_handle(StepRepr_HArray1OfPropertyDefinitionRepresentation)
%wrap_handle(StepRepr_HArray1OfRepresentationItem)
%wrap_handle(StepRepr_HSequenceOfMaterialPropertyRepresentation)
%wrap_handle(StepRepr_HSequenceOfRepresentationItem)
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
%wrap_handle(StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation)
%wrap_handle(StepRepr_SequenceNodeOfSequenceOfRepresentationItem)
%wrap_handle(StepRepr_ShapeAspect)
%wrap_handle(StepRepr_ShapeAspectRelationship)
%wrap_handle(StepRepr_SuppliedPartRelationship)
%wrap_handle(StepRepr_AssemblyComponentUsage)
%wrap_handle(StepRepr_CompositeShapeAspect)
%wrap_handle(StepRepr_CompoundRepresentationItem)
%wrap_handle(StepRepr_DefinitionalRepresentation)
%wrap_handle(StepRepr_DerivedShapeAspect)
%wrap_handle(StepRepr_DescriptiveRepresentationItem)
%wrap_handle(StepRepr_ExternallyDefinedRepresentation)
%wrap_handle(StepRepr_GlobalUncertaintyAssignedContext)
%wrap_handle(StepRepr_GlobalUnitAssignedContext)
%wrap_handle(StepRepr_MakeFromUsageOption)
%wrap_handle(StepRepr_MappedItem)
%wrap_handle(StepRepr_MaterialProperty)
%wrap_handle(StepRepr_MaterialPropertyRepresentation)
%wrap_handle(StepRepr_MeasureRepresentationItem)
%wrap_handle(StepRepr_ParametricRepresentationContext)
%wrap_handle(StepRepr_ProductDefinitionShape)
%wrap_handle(StepRepr_ReprItemAndLengthMeasureWithUnit)
%wrap_handle(StepRepr_ShapeAspectDerivingRelationship)
%wrap_handle(StepRepr_ShapeAspectTransition)
%wrap_handle(StepRepr_ShapeRepresentationRelationship)
%wrap_handle(StepRepr_StructuralResponseProperty)
%wrap_handle(StepRepr_StructuralResponsePropertyDefinitionRepresentation)
%wrap_handle(StepRepr_Extension)
%wrap_handle(StepRepr_NextAssemblyUsageOccurrence)
%wrap_handle(StepRepr_PromissoryUsageOccurrence)
%wrap_handle(StepRepr_QuantifiedAssemblyComponentUsage)
%wrap_handle(StepRepr_RepresentationRelationshipWithTransformation)
%wrap_handle(StepRepr_SpecifiedHigherUsageOccurrence)
%wrap_handle(StepRepr_ValueRange)
%wrap_handle(StepRepr_ShapeRepresentationRelationshipWithTransformation)

%nodefaultctor StepRepr_Array1OfMaterialPropertyRepresentation;
class StepRepr_Array1OfMaterialPropertyRepresentation {
	public:
		%feature("compactdefaultargs") StepRepr_Array1OfMaterialPropertyRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_Array1OfMaterialPropertyRepresentation;
		 StepRepr_Array1OfMaterialPropertyRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepRepr_Array1OfMaterialPropertyRepresentation;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepRepr_MaterialPropertyRepresentation &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_Array1OfMaterialPropertyRepresentation;
		 StepRepr_Array1OfMaterialPropertyRepresentation (const Handle_StepRepr_MaterialPropertyRepresentation & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_MaterialPropertyRepresentation & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_Array1OfMaterialPropertyRepresentation &
	:rtype: StepRepr_Array1OfMaterialPropertyRepresentation
") Assign;
		const StepRepr_Array1OfMaterialPropertyRepresentation & Assign (const StepRepr_Array1OfMaterialPropertyRepresentation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_Array1OfMaterialPropertyRepresentation &
	:rtype: StepRepr_Array1OfMaterialPropertyRepresentation
") operator =;
		const StepRepr_Array1OfMaterialPropertyRepresentation & operator = (const StepRepr_Array1OfMaterialPropertyRepresentation & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_MaterialPropertyRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") Value;
		Handle_StepRepr_MaterialPropertyRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") ChangeValue;
		Handle_StepRepr_MaterialPropertyRepresentation ChangeValue (const Standard_Integer Index);
};



%extend StepRepr_Array1OfMaterialPropertyRepresentation {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepRepr_Array1OfMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_Array1OfPropertyDefinitionRepresentation;
class StepRepr_Array1OfPropertyDefinitionRepresentation {
	public:
		%feature("compactdefaultargs") StepRepr_Array1OfPropertyDefinitionRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_Array1OfPropertyDefinitionRepresentation;
		 StepRepr_Array1OfPropertyDefinitionRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepRepr_Array1OfPropertyDefinitionRepresentation;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepRepr_PropertyDefinitionRepresentation &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_Array1OfPropertyDefinitionRepresentation;
		 StepRepr_Array1OfPropertyDefinitionRepresentation (const Handle_StepRepr_PropertyDefinitionRepresentation & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepRepr_PropertyDefinitionRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_PropertyDefinitionRepresentation & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_Array1OfPropertyDefinitionRepresentation &
	:rtype: StepRepr_Array1OfPropertyDefinitionRepresentation
") Assign;
		const StepRepr_Array1OfPropertyDefinitionRepresentation & Assign (const StepRepr_Array1OfPropertyDefinitionRepresentation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_Array1OfPropertyDefinitionRepresentation &
	:rtype: StepRepr_Array1OfPropertyDefinitionRepresentation
") operator =;
		const StepRepr_Array1OfPropertyDefinitionRepresentation & operator = (const StepRepr_Array1OfPropertyDefinitionRepresentation & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepRepr_PropertyDefinitionRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_PropertyDefinitionRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_PropertyDefinitionRepresentation
") Value;
		Handle_StepRepr_PropertyDefinitionRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_PropertyDefinitionRepresentation
") ChangeValue;
		Handle_StepRepr_PropertyDefinitionRepresentation ChangeValue (const Standard_Integer Index);
};



%extend StepRepr_Array1OfPropertyDefinitionRepresentation {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepRepr_Array1OfPropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_Array1OfRepresentationItem;
class StepRepr_Array1OfRepresentationItem {
	public:
		%feature("compactdefaultargs") StepRepr_Array1OfRepresentationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_Array1OfRepresentationItem;
		 StepRepr_Array1OfRepresentationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepRepr_Array1OfRepresentationItem;
		%feature("autodoc", "	:param Item:
	:type Item: Handle_StepRepr_RepresentationItem &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_Array1OfRepresentationItem;
		 StepRepr_Array1OfRepresentationItem (const Handle_StepRepr_RepresentationItem & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_RepresentationItem & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_Array1OfRepresentationItem &
	:rtype: StepRepr_Array1OfRepresentationItem
") Assign;
		const StepRepr_Array1OfRepresentationItem & Assign (const StepRepr_Array1OfRepresentationItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_Array1OfRepresentationItem &
	:rtype: StepRepr_Array1OfRepresentationItem
") operator =;
		const StepRepr_Array1OfRepresentationItem & operator = (const StepRepr_Array1OfRepresentationItem & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_RepresentationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_RepresentationItem
") Value;
		Handle_StepRepr_RepresentationItem Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_RepresentationItem
") ChangeValue;
		Handle_StepRepr_RepresentationItem ChangeValue (const Standard_Integer Index);
};



%extend StepRepr_Array1OfRepresentationItem {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepRepr_Array1OfRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_AssemblyComponentUsageSubstitute;
class StepRepr_AssemblyComponentUsageSubstitute : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_AssemblyComponentUsageSubstitute;
		%feature("autodoc", "	:rtype: None
") StepRepr_AssemblyComponentUsageSubstitute;
		 StepRepr_AssemblyComponentUsageSubstitute ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDef:
	:type aDef: Handle_TCollection_HAsciiString &
	:param aBase:
	:type aBase: Handle_StepRepr_AssemblyComponentUsage &
	:param aSubs:
	:type aSubs: Handle_StepRepr_AssemblyComponentUsage &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDef,const Handle_StepRepr_AssemblyComponentUsage & aBase,const Handle_StepRepr_AssemblyComponentUsage & aSubs);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Definition;
		Handle_TCollection_HAsciiString Definition ();
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "	:param aDef:
	:type aDef: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDefinition;
		void SetDefinition (const Handle_TCollection_HAsciiString & aDef);
		%feature("compactdefaultargs") Base;
		%feature("autodoc", "	:rtype: Handle_StepRepr_AssemblyComponentUsage
") Base;
		Handle_StepRepr_AssemblyComponentUsage Base ();
		%feature("compactdefaultargs") SetBase;
		%feature("autodoc", "	:param aBase:
	:type aBase: Handle_StepRepr_AssemblyComponentUsage &
	:rtype: None
") SetBase;
		void SetBase (const Handle_StepRepr_AssemblyComponentUsage & aBase);
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	:rtype: Handle_StepRepr_AssemblyComponentUsage
") Substitute;
		Handle_StepRepr_AssemblyComponentUsage Substitute ();
		%feature("compactdefaultargs") SetSubstitute;
		%feature("autodoc", "	:param aSubstitute:
	:type aSubstitute: Handle_StepRepr_AssemblyComponentUsage &
	:rtype: None
") SetSubstitute;
		void SetSubstitute (const Handle_StepRepr_AssemblyComponentUsage & aSubstitute);
};


%make_alias(StepRepr_AssemblyComponentUsageSubstitute)

%extend StepRepr_AssemblyComponentUsageSubstitute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_CharacterizedDefinition;
class StepRepr_CharacterizedDefinition : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepRepr_CharacterizedDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_CharacterizedDefinition;
		 StepRepr_CharacterizedDefinition ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of CharacterizedDefinition select type 1 -> CharacterizedObject from StepBasic 2 -> ProductDefinition from StepBasic 3 -> ProductDefinitionRelationship from StepBasic 4 -> ProductDefinitionShape from StepRepr 5 -> ShapeAspect from StepRepr 6 -> ShapeAspectRelationship from StepRepr 7 -> DocumentFile from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CharacterizedObject;
		%feature("autodoc", "	* Returns Value as CharacterizedObject (or Null if another type)

	:rtype: Handle_StepBasic_CharacterizedObject
") CharacterizedObject;
		Handle_StepBasic_CharacterizedObject CharacterizedObject ();
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionRelationship;
		%feature("autodoc", "	* Returns Value as ProductDefinitionRelationship (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionRelationship
") ProductDefinitionRelationship;
		Handle_StepBasic_ProductDefinitionRelationship ProductDefinitionRelationship ();
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "	* Returns Value as ProductDefinitionShape (or Null if another type)

	:rtype: Handle_StepRepr_ProductDefinitionShape
") ProductDefinitionShape;
		Handle_StepRepr_ProductDefinitionShape ProductDefinitionShape ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* Returns Value as ShapeAspect (or Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "	* Returns Value as ShapeAspectRelationship (or Null if another type)

	:rtype: Handle_StepRepr_ShapeAspectRelationship
") ShapeAspectRelationship;
		Handle_StepRepr_ShapeAspectRelationship ShapeAspectRelationship ();
		%feature("compactdefaultargs") DocumentFile;
		%feature("autodoc", "	* Returns Value as DocumentFile (or Null if another type)

	:rtype: Handle_StepBasic_DocumentFile
") DocumentFile;
		Handle_StepBasic_DocumentFile DocumentFile ();
};


%extend StepRepr_CharacterizedDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ConfigurationDesign;
class StepRepr_ConfigurationDesign : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_ConfigurationDesign;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ConfigurationDesign;
		 StepRepr_ConfigurationDesign ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aConfiguration:
	:type aConfiguration: Handle_StepRepr_ConfigurationItem &
	:param aDesign:
	:type aDesign: StepRepr_ConfigurationDesignItem &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_ConfigurationItem & aConfiguration,const StepRepr_ConfigurationDesignItem & aDesign);
		%feature("compactdefaultargs") Configuration;
		%feature("autodoc", "	* Returns field Configuration

	:rtype: Handle_StepRepr_ConfigurationItem
") Configuration;
		Handle_StepRepr_ConfigurationItem Configuration ();
		%feature("compactdefaultargs") SetConfiguration;
		%feature("autodoc", "	* Set field Configuration

	:param Configuration:
	:type Configuration: Handle_StepRepr_ConfigurationItem &
	:rtype: None
") SetConfiguration;
		void SetConfiguration (const Handle_StepRepr_ConfigurationItem & Configuration);
		%feature("compactdefaultargs") Design;
		%feature("autodoc", "	* Returns field Design

	:rtype: StepRepr_ConfigurationDesignItem
") Design;
		StepRepr_ConfigurationDesignItem Design ();
		%feature("compactdefaultargs") SetDesign;
		%feature("autodoc", "	* Set field Design

	:param Design:
	:type Design: StepRepr_ConfigurationDesignItem &
	:rtype: None
") SetDesign;
		void SetDesign (const StepRepr_ConfigurationDesignItem & Design);
};


%make_alias(StepRepr_ConfigurationDesign)

%extend StepRepr_ConfigurationDesign {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ConfigurationDesignItem;
class StepRepr_ConfigurationDesignItem : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepRepr_ConfigurationDesignItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ConfigurationDesignItem;
		 StepRepr_ConfigurationDesignItem ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of ConfigurationDesignItem select type 1 -> ProductDefinition from StepBasic 2 -> ProductDefinitionFormation from StepBasic 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinition;
		%feature("autodoc", "	* Returns Value as ProductDefinition (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinition
") ProductDefinition;
		Handle_StepBasic_ProductDefinition ProductDefinition ();
		%feature("compactdefaultargs") ProductDefinitionFormation;
		%feature("autodoc", "	* Returns Value as ProductDefinitionFormation (or Null if another type)

	:rtype: Handle_StepBasic_ProductDefinitionFormation
") ProductDefinitionFormation;
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation ();
};


%extend StepRepr_ConfigurationDesignItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ConfigurationEffectivity;
class StepRepr_ConfigurationEffectivity : public StepBasic_ProductDefinitionEffectivity {
	public:
		%feature("compactdefaultargs") StepRepr_ConfigurationEffectivity;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ConfigurationEffectivity;
		 StepRepr_ConfigurationEffectivity ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aEffectivity_Id:
	:type aEffectivity_Id: Handle_TCollection_HAsciiString &
	:param aProductDefinitionEffectivity_Usage:
	:type aProductDefinitionEffectivity_Usage: Handle_StepBasic_ProductDefinitionRelationship &
	:param aConfiguration:
	:type aConfiguration: Handle_StepRepr_ConfigurationDesign &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aEffectivity_Id,const Handle_StepBasic_ProductDefinitionRelationship & aProductDefinitionEffectivity_Usage,const Handle_StepRepr_ConfigurationDesign & aConfiguration);
		%feature("compactdefaultargs") Configuration;
		%feature("autodoc", "	* Returns field Configuration

	:rtype: Handle_StepRepr_ConfigurationDesign
") Configuration;
		Handle_StepRepr_ConfigurationDesign Configuration ();
		%feature("compactdefaultargs") SetConfiguration;
		%feature("autodoc", "	* Set field Configuration

	:param Configuration:
	:type Configuration: Handle_StepRepr_ConfigurationDesign &
	:rtype: None
") SetConfiguration;
		void SetConfiguration (const Handle_StepRepr_ConfigurationDesign & Configuration);
};


%make_alias(StepRepr_ConfigurationEffectivity)

%extend StepRepr_ConfigurationEffectivity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ConfigurationItem;
class StepRepr_ConfigurationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_ConfigurationItem;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ConfigurationItem;
		 StepRepr_ConfigurationItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aItemConcept:
	:type aItemConcept: Handle_StepRepr_ProductConcept &
	:param hasPurpose:
	:type hasPurpose: bool
	:param aPurpose:
	:type aPurpose: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_ProductConcept & aItemConcept,const Standard_Boolean hasPurpose,const Handle_TCollection_HAsciiString & aPurpose);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & Id);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") ItemConcept;
		%feature("autodoc", "	* Returns field ItemConcept

	:rtype: Handle_StepRepr_ProductConcept
") ItemConcept;
		Handle_StepRepr_ProductConcept ItemConcept ();
		%feature("compactdefaultargs") SetItemConcept;
		%feature("autodoc", "	* Set field ItemConcept

	:param ItemConcept:
	:type ItemConcept: Handle_StepRepr_ProductConcept &
	:rtype: None
") SetItemConcept;
		void SetItemConcept (const Handle_StepRepr_ProductConcept & ItemConcept);
		%feature("compactdefaultargs") Purpose;
		%feature("autodoc", "	* Returns field Purpose

	:rtype: Handle_TCollection_HAsciiString
") Purpose;
		Handle_TCollection_HAsciiString Purpose ();
		%feature("compactdefaultargs") SetPurpose;
		%feature("autodoc", "	* Set field Purpose

	:param Purpose:
	:type Purpose: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPurpose;
		void SetPurpose (const Handle_TCollection_HAsciiString & Purpose);
		%feature("compactdefaultargs") HasPurpose;
		%feature("autodoc", "	* Returns True if optional field Purpose is defined

	:rtype: bool
") HasPurpose;
		Standard_Boolean HasPurpose ();
};


%make_alias(StepRepr_ConfigurationItem)

%extend StepRepr_ConfigurationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_DataEnvironment;
class StepRepr_DataEnvironment : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_DataEnvironment;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_DataEnvironment;
		 StepRepr_DataEnvironment ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aElements:
	:type aElements: Handle_StepRepr_HArray1OfPropertyDefinitionRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_HArray1OfPropertyDefinitionRepresentation & aElements);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") Elements;
		%feature("autodoc", "	* Returns field Elements

	:rtype: Handle_StepRepr_HArray1OfPropertyDefinitionRepresentation
") Elements;
		Handle_StepRepr_HArray1OfPropertyDefinitionRepresentation Elements ();
		%feature("compactdefaultargs") SetElements;
		%feature("autodoc", "	* Set field Elements

	:param Elements:
	:type Elements: Handle_StepRepr_HArray1OfPropertyDefinitionRepresentation &
	:rtype: None
") SetElements;
		void SetElements (const Handle_StepRepr_HArray1OfPropertyDefinitionRepresentation & Elements);
};


%make_alias(StepRepr_DataEnvironment)

%extend StepRepr_DataEnvironment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_FunctionallyDefinedTransformation;
class StepRepr_FunctionallyDefinedTransformation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_FunctionallyDefinedTransformation;
		%feature("autodoc", "	* Returns a FunctionallyDefinedTransformation

	:rtype: None
") StepRepr_FunctionallyDefinedTransformation;
		 StepRepr_FunctionallyDefinedTransformation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
};


%make_alias(StepRepr_FunctionallyDefinedTransformation)

%extend StepRepr_FunctionallyDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_HArray1OfMaterialPropertyRepresentation;
class StepRepr_HArray1OfMaterialPropertyRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_HArray1OfMaterialPropertyRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_HArray1OfMaterialPropertyRepresentation;
		 StepRepr_HArray1OfMaterialPropertyRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepRepr_HArray1OfMaterialPropertyRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") StepRepr_HArray1OfMaterialPropertyRepresentation;
		 StepRepr_HArray1OfMaterialPropertyRepresentation (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepRepr_MaterialPropertyRepresentation & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_MaterialPropertyRepresentation & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_MaterialPropertyRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") Value;
		Handle_StepRepr_MaterialPropertyRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") ChangeValue;
		Handle_StepRepr_MaterialPropertyRepresentation ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepRepr_Array1OfMaterialPropertyRepresentation
") Array1;
		const StepRepr_Array1OfMaterialPropertyRepresentation & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepRepr_Array1OfMaterialPropertyRepresentation
") ChangeArray1;
		StepRepr_Array1OfMaterialPropertyRepresentation & ChangeArray1 ();
};


%make_alias(StepRepr_HArray1OfMaterialPropertyRepresentation)


%extend StepRepr_HArray1OfMaterialPropertyRepresentation {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepRepr_HArray1OfMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_HArray1OfPropertyDefinitionRepresentation;
class StepRepr_HArray1OfPropertyDefinitionRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_HArray1OfPropertyDefinitionRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_HArray1OfPropertyDefinitionRepresentation;
		 StepRepr_HArray1OfPropertyDefinitionRepresentation (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepRepr_HArray1OfPropertyDefinitionRepresentation;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepRepr_PropertyDefinitionRepresentation &
	:rtype: None
") StepRepr_HArray1OfPropertyDefinitionRepresentation;
		 StepRepr_HArray1OfPropertyDefinitionRepresentation (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepRepr_PropertyDefinitionRepresentation & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepRepr_PropertyDefinitionRepresentation &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_PropertyDefinitionRepresentation & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepRepr_PropertyDefinitionRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_PropertyDefinitionRepresentation & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_PropertyDefinitionRepresentation
") Value;
		Handle_StepRepr_PropertyDefinitionRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_PropertyDefinitionRepresentation
") ChangeValue;
		Handle_StepRepr_PropertyDefinitionRepresentation ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepRepr_Array1OfPropertyDefinitionRepresentation
") Array1;
		const StepRepr_Array1OfPropertyDefinitionRepresentation & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepRepr_Array1OfPropertyDefinitionRepresentation
") ChangeArray1;
		StepRepr_Array1OfPropertyDefinitionRepresentation & ChangeArray1 ();
};


%make_alias(StepRepr_HArray1OfPropertyDefinitionRepresentation)


%extend StepRepr_HArray1OfPropertyDefinitionRepresentation {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepRepr_HArray1OfPropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_HArray1OfRepresentationItem;
class StepRepr_HArray1OfRepresentationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_HArray1OfRepresentationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") StepRepr_HArray1OfRepresentationItem;
		 StepRepr_HArray1OfRepresentationItem (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") StepRepr_HArray1OfRepresentationItem;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Handle_StepRepr_RepresentationItem &
	:rtype: None
") StepRepr_HArray1OfRepresentationItem;
		 StepRepr_HArray1OfRepresentationItem (const Standard_Integer Low,const Standard_Integer Up,const Handle_StepRepr_RepresentationItem & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Init;
		void Init (const Handle_StepRepr_RepresentationItem & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_RepresentationItem & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_RepresentationItem
") Value;
		Handle_StepRepr_RepresentationItem Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_RepresentationItem
") ChangeValue;
		Handle_StepRepr_RepresentationItem ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: StepRepr_Array1OfRepresentationItem
") Array1;
		const StepRepr_Array1OfRepresentationItem & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: StepRepr_Array1OfRepresentationItem
") ChangeArray1;
		StepRepr_Array1OfRepresentationItem & ChangeArray1 ();
};


%make_alias(StepRepr_HArray1OfRepresentationItem)


%extend StepRepr_HArray1OfRepresentationItem {
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
            self.current +=1
        return self.Value(self.current)

    __next__ = next

    }
};
%extend StepRepr_HArray1OfRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_HSequenceOfMaterialPropertyRepresentation;
class StepRepr_HSequenceOfMaterialPropertyRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_HSequenceOfMaterialPropertyRepresentation;
		%feature("autodoc", "	:rtype: None
") StepRepr_HSequenceOfMaterialPropertyRepresentation;
		 StepRepr_HSequenceOfMaterialPropertyRepresentation ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepRepr_MaterialPropertyRepresentation & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepRepr_MaterialPropertyRepresentation & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepRepr_MaterialPropertyRepresentation & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepRepr_MaterialPropertyRepresentation & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation
") Split;
		Handle_StepRepr_HSequenceOfMaterialPropertyRepresentation Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepRepr_MaterialPropertyRepresentation & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") Value;
		Handle_StepRepr_MaterialPropertyRepresentation Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") ChangeValue;
		Handle_StepRepr_MaterialPropertyRepresentation ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: StepRepr_SequenceOfMaterialPropertyRepresentation
") Sequence;
		const StepRepr_SequenceOfMaterialPropertyRepresentation & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepRepr_SequenceOfMaterialPropertyRepresentation
") ChangeSequence;
		StepRepr_SequenceOfMaterialPropertyRepresentation & ChangeSequence ();
};


%make_alias(StepRepr_HSequenceOfMaterialPropertyRepresentation)

%extend StepRepr_HSequenceOfMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_HSequenceOfRepresentationItem;
class StepRepr_HSequenceOfRepresentationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_HSequenceOfRepresentationItem;
		%feature("autodoc", "	:rtype: None
") StepRepr_HSequenceOfRepresentationItem;
		 StepRepr_HSequenceOfRepresentationItem ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Append;
		void Append (const Handle_StepRepr_RepresentationItem & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfRepresentationItem &
	:rtype: None
") Append;
		void Append (const Handle_StepRepr_HSequenceOfRepresentationItem & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepRepr_RepresentationItem & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfRepresentationItem &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepRepr_HSequenceOfRepresentationItem & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepRepr_RepresentationItem & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfRepresentationItem &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_StepRepr_HSequenceOfRepresentationItem & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepRepr_RepresentationItem & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_StepRepr_HSequenceOfRepresentationItem &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_StepRepr_HSequenceOfRepresentationItem & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepRepr_HSequenceOfRepresentationItem
") Split;
		Handle_StepRepr_HSequenceOfRepresentationItem Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_StepRepr_RepresentationItem & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepRepr_RepresentationItem
") Value;
		Handle_StepRepr_RepresentationItem Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_StepRepr_RepresentationItem
") ChangeValue;
		Handle_StepRepr_RepresentationItem ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: StepRepr_SequenceOfRepresentationItem
") Sequence;
		const StepRepr_SequenceOfRepresentationItem & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: StepRepr_SequenceOfRepresentationItem
") ChangeSequence;
		StepRepr_SequenceOfRepresentationItem & ChangeSequence ();
};


%make_alias(StepRepr_HSequenceOfRepresentationItem)

%extend StepRepr_HSequenceOfRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ItemDefinedTransformation;
class StepRepr_ItemDefinedTransformation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_ItemDefinedTransformation;
		%feature("autodoc", "	:rtype: None
") StepRepr_ItemDefinedTransformation;
		 StepRepr_ItemDefinedTransformation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aTransformItem1:
	:type aTransformItem1: Handle_StepRepr_RepresentationItem &
	:param aTransformItem2:
	:type aTransformItem2: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_RepresentationItem & aTransformItem1,const Handle_StepRepr_RepresentationItem & aTransformItem2);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetTransformItem1;
		%feature("autodoc", "	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetTransformItem1;
		void SetTransformItem1 (const Handle_StepRepr_RepresentationItem & aItem);
		%feature("compactdefaultargs") TransformItem1;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") TransformItem1;
		Handle_StepRepr_RepresentationItem TransformItem1 ();
		%feature("compactdefaultargs") SetTransformItem2;
		%feature("autodoc", "	:param aItem:
	:type aItem: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetTransformItem2;
		void SetTransformItem2 (const Handle_StepRepr_RepresentationItem & aItem);
		%feature("compactdefaultargs") TransformItem2;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") TransformItem2;
		Handle_StepRepr_RepresentationItem TransformItem2 ();
};


%make_alias(StepRepr_ItemDefinedTransformation)

%extend StepRepr_ItemDefinedTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_MaterialDesignation;
class StepRepr_MaterialDesignation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_MaterialDesignation;
		%feature("autodoc", "	:rtype: None
") StepRepr_MaterialDesignation;
		 StepRepr_MaterialDesignation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aOfDefinition:
	:type aOfDefinition: StepRepr_CharacterizedDefinition &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const StepRepr_CharacterizedDefinition & aOfDefinition);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetOfDefinition;
		%feature("autodoc", "	:param aOfDefinition:
	:type aOfDefinition: StepRepr_CharacterizedDefinition &
	:rtype: None
") SetOfDefinition;
		void SetOfDefinition (const StepRepr_CharacterizedDefinition & aOfDefinition);
		%feature("compactdefaultargs") OfDefinition;
		%feature("autodoc", "	:rtype: StepRepr_CharacterizedDefinition
") OfDefinition;
		StepRepr_CharacterizedDefinition OfDefinition ();
};


%make_alias(StepRepr_MaterialDesignation)

%extend StepRepr_MaterialDesignation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ProductConcept;
class StepRepr_ProductConcept : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_ProductConcept;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ProductConcept;
		 StepRepr_ProductConcept ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aId:
	:type aId: Handle_TCollection_HAsciiString &
	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aMarketContext:
	:type aMarketContext: Handle_StepBasic_ProductConceptContext &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aId,const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepBasic_ProductConceptContext & aMarketContext);
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Returns field Id

	:rtype: Handle_TCollection_HAsciiString
") Id;
		Handle_TCollection_HAsciiString Id ();
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "	* Set field Id

	:param Id:
	:type Id: Handle_TCollection_HAsciiString &
	:rtype: None
") SetId;
		void SetId (const Handle_TCollection_HAsciiString & Id);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") MarketContext;
		%feature("autodoc", "	* Returns field MarketContext

	:rtype: Handle_StepBasic_ProductConceptContext
") MarketContext;
		Handle_StepBasic_ProductConceptContext MarketContext ();
		%feature("compactdefaultargs") SetMarketContext;
		%feature("autodoc", "	* Set field MarketContext

	:param MarketContext:
	:type MarketContext: Handle_StepBasic_ProductConceptContext &
	:rtype: None
") SetMarketContext;
		void SetMarketContext (const Handle_StepBasic_ProductConceptContext & MarketContext);
};


%make_alias(StepRepr_ProductConcept)

%extend StepRepr_ProductConcept {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ProductDefinitionUsage;
class StepRepr_ProductDefinitionUsage : public StepBasic_ProductDefinitionRelationship {
	public:
		%feature("compactdefaultargs") StepRepr_ProductDefinitionUsage;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ProductDefinitionUsage;
		 StepRepr_ProductDefinitionUsage ();
};


%make_alias(StepRepr_ProductDefinitionUsage)

%extend StepRepr_ProductDefinitionUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_PropertyDefinition;
class StepRepr_PropertyDefinition : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_PropertyDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_PropertyDefinition;
		 StepRepr_PropertyDefinition ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aDefinition:
	:type aDefinition: StepRepr_CharacterizedDefinition &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const StepRepr_CharacterizedDefinition & aDefinition);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* Returns field Definition

	:rtype: StepRepr_CharacterizedDefinition
") Definition;
		StepRepr_CharacterizedDefinition Definition ();
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "	* Set field Definition

	:param Definition:
	:type Definition: StepRepr_CharacterizedDefinition &
	:rtype: None
") SetDefinition;
		void SetDefinition (const StepRepr_CharacterizedDefinition & Definition);
};


%make_alias(StepRepr_PropertyDefinition)

%extend StepRepr_PropertyDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_PropertyDefinitionRelationship;
class StepRepr_PropertyDefinitionRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_PropertyDefinitionRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_PropertyDefinitionRelationship;
		 StepRepr_PropertyDefinitionRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingPropertyDefinition:
	:type aRelatingPropertyDefinition: Handle_StepRepr_PropertyDefinition &
	:param aRelatedPropertyDefinition:
	:type aRelatedPropertyDefinition: Handle_StepRepr_PropertyDefinition &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_PropertyDefinition & aRelatingPropertyDefinition,const Handle_StepRepr_PropertyDefinition & aRelatedPropertyDefinition);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") RelatingPropertyDefinition;
		%feature("autodoc", "	* Returns field RelatingPropertyDefinition

	:rtype: Handle_StepRepr_PropertyDefinition
") RelatingPropertyDefinition;
		Handle_StepRepr_PropertyDefinition RelatingPropertyDefinition ();
		%feature("compactdefaultargs") SetRelatingPropertyDefinition;
		%feature("autodoc", "	* Set field RelatingPropertyDefinition

	:param RelatingPropertyDefinition:
	:type RelatingPropertyDefinition: Handle_StepRepr_PropertyDefinition &
	:rtype: None
") SetRelatingPropertyDefinition;
		void SetRelatingPropertyDefinition (const Handle_StepRepr_PropertyDefinition & RelatingPropertyDefinition);
		%feature("compactdefaultargs") RelatedPropertyDefinition;
		%feature("autodoc", "	* Returns field RelatedPropertyDefinition

	:rtype: Handle_StepRepr_PropertyDefinition
") RelatedPropertyDefinition;
		Handle_StepRepr_PropertyDefinition RelatedPropertyDefinition ();
		%feature("compactdefaultargs") SetRelatedPropertyDefinition;
		%feature("autodoc", "	* Set field RelatedPropertyDefinition

	:param RelatedPropertyDefinition:
	:type RelatedPropertyDefinition: Handle_StepRepr_PropertyDefinition &
	:rtype: None
") SetRelatedPropertyDefinition;
		void SetRelatedPropertyDefinition (const Handle_StepRepr_PropertyDefinition & RelatedPropertyDefinition);
};


%make_alias(StepRepr_PropertyDefinitionRelationship)

%extend StepRepr_PropertyDefinitionRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_PropertyDefinitionRepresentation;
class StepRepr_PropertyDefinitionRepresentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_PropertyDefinitionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_PropertyDefinitionRepresentation;
		 StepRepr_PropertyDefinitionRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aDefinition:
	:type aDefinition: StepRepr_RepresentedDefinition &
	:param aUsedRepresentation:
	:type aUsedRepresentation: Handle_StepRepr_Representation &
	:rtype: None
") Init;
		void Init (const StepRepr_RepresentedDefinition & aDefinition,const Handle_StepRepr_Representation & aUsedRepresentation);
		%feature("compactdefaultargs") Definition;
		%feature("autodoc", "	* Returns field Definition

	:rtype: StepRepr_RepresentedDefinition
") Definition;
		StepRepr_RepresentedDefinition Definition ();
		%feature("compactdefaultargs") SetDefinition;
		%feature("autodoc", "	* Set field Definition

	:param Definition:
	:type Definition: StepRepr_RepresentedDefinition &
	:rtype: None
") SetDefinition;
		void SetDefinition (const StepRepr_RepresentedDefinition & Definition);
		%feature("compactdefaultargs") UsedRepresentation;
		%feature("autodoc", "	* Returns field UsedRepresentation

	:rtype: Handle_StepRepr_Representation
") UsedRepresentation;
		Handle_StepRepr_Representation UsedRepresentation ();
		%feature("compactdefaultargs") SetUsedRepresentation;
		%feature("autodoc", "	* Set field UsedRepresentation

	:param UsedRepresentation:
	:type UsedRepresentation: Handle_StepRepr_Representation &
	:rtype: None
") SetUsedRepresentation;
		void SetUsedRepresentation (const Handle_StepRepr_Representation & UsedRepresentation);
};


%make_alias(StepRepr_PropertyDefinitionRepresentation)

%extend StepRepr_PropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_Representation;
class StepRepr_Representation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_Representation;
		%feature("autodoc", "	* Returns a Representation

	:rtype: None
") StepRepr_Representation;
		 StepRepr_Representation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aItems:
	:type aItems: Handle_StepRepr_HArray1OfRepresentationItem &
	:param aContextOfItems:
	:type aContextOfItems: Handle_StepRepr_RepresentationContext &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepRepr_HArray1OfRepresentationItem & aItems,const Handle_StepRepr_RepresentationContext & aContextOfItems);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetItems;
		%feature("autodoc", "	:param aItems:
	:type aItems: Handle_StepRepr_HArray1OfRepresentationItem &
	:rtype: None
") SetItems;
		void SetItems (const Handle_StepRepr_HArray1OfRepresentationItem & aItems);
		%feature("compactdefaultargs") Items;
		%feature("autodoc", "	:rtype: Handle_StepRepr_HArray1OfRepresentationItem
") Items;
		Handle_StepRepr_HArray1OfRepresentationItem Items ();
		%feature("compactdefaultargs") ItemsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepRepr_RepresentationItem
") ItemsValue;
		Handle_StepRepr_RepresentationItem ItemsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
		%feature("compactdefaultargs") SetContextOfItems;
		%feature("autodoc", "	:param aContextOfItems:
	:type aContextOfItems: Handle_StepRepr_RepresentationContext &
	:rtype: None
") SetContextOfItems;
		void SetContextOfItems (const Handle_StepRepr_RepresentationContext & aContextOfItems);
		%feature("compactdefaultargs") ContextOfItems;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationContext
") ContextOfItems;
		Handle_StepRepr_RepresentationContext ContextOfItems ();
};


%make_alias(StepRepr_Representation)

%extend StepRepr_Representation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_RepresentationContext;
class StepRepr_RepresentationContext : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_RepresentationContext;
		%feature("autodoc", "	* Returns a RepresentationContext

	:rtype: None
") StepRepr_RepresentationContext;
		 StepRepr_RepresentationContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") SetContextIdentifier;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:rtype: None
") SetContextIdentifier;
		void SetContextIdentifier (const Handle_TCollection_HAsciiString & aContextIdentifier);
		%feature("compactdefaultargs") ContextIdentifier;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ContextIdentifier;
		Handle_TCollection_HAsciiString ContextIdentifier ();
		%feature("compactdefaultargs") SetContextType;
		%feature("autodoc", "	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: None
") SetContextType;
		void SetContextType (const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") ContextType;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") ContextType;
		Handle_TCollection_HAsciiString ContextType ();
};


%make_alias(StepRepr_RepresentationContext)

%extend StepRepr_RepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_RepresentationItem;
class StepRepr_RepresentationItem : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_RepresentationItem;
		%feature("autodoc", "	* Returns a RepresentationItem

	:rtype: None
") StepRepr_RepresentationItem;
		 StepRepr_RepresentationItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
};


%make_alias(StepRepr_RepresentationItem)

%extend StepRepr_RepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_RepresentationMap;
class StepRepr_RepresentationMap : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_RepresentationMap;
		%feature("autodoc", "	* Returns a RepresentationMap

	:rtype: None
") StepRepr_RepresentationMap;
		 StepRepr_RepresentationMap ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aMappingOrigin:
	:type aMappingOrigin: Handle_StepRepr_RepresentationItem &
	:param aMappedRepresentation:
	:type aMappedRepresentation: Handle_StepRepr_Representation &
	:rtype: void
") Init;
		virtual void Init (const Handle_StepRepr_RepresentationItem & aMappingOrigin,const Handle_StepRepr_Representation & aMappedRepresentation);
		%feature("compactdefaultargs") SetMappingOrigin;
		%feature("autodoc", "	:param aMappingOrigin:
	:type aMappingOrigin: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetMappingOrigin;
		void SetMappingOrigin (const Handle_StepRepr_RepresentationItem & aMappingOrigin);
		%feature("compactdefaultargs") MappingOrigin;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") MappingOrigin;
		Handle_StepRepr_RepresentationItem MappingOrigin ();
		%feature("compactdefaultargs") SetMappedRepresentation;
		%feature("autodoc", "	:param aMappedRepresentation:
	:type aMappedRepresentation: Handle_StepRepr_Representation &
	:rtype: None
") SetMappedRepresentation;
		void SetMappedRepresentation (const Handle_StepRepr_Representation & aMappedRepresentation);
		%feature("compactdefaultargs") MappedRepresentation;
		%feature("autodoc", "	:rtype: Handle_StepRepr_Representation
") MappedRepresentation;
		Handle_StepRepr_Representation MappedRepresentation ();
};


%make_alias(StepRepr_RepresentationMap)

%extend StepRepr_RepresentationMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_RepresentationRelationship;
class StepRepr_RepresentationRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_RepresentationRelationship;
		%feature("autodoc", "	* Returns a RepresentationRelationship

	:rtype: None
") StepRepr_RepresentationRelationship;
		 StepRepr_RepresentationRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRep1:
	:type aRep1: Handle_StepRepr_Representation &
	:param aRep2:
	:type aRep2: Handle_StepRepr_Representation &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_Representation & aRep1,const Handle_StepRepr_Representation & aRep2);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetRep1;
		%feature("autodoc", "	:param aRep1:
	:type aRep1: Handle_StepRepr_Representation &
	:rtype: None
") SetRep1;
		void SetRep1 (const Handle_StepRepr_Representation & aRep1);
		%feature("compactdefaultargs") Rep1;
		%feature("autodoc", "	:rtype: Handle_StepRepr_Representation
") Rep1;
		Handle_StepRepr_Representation Rep1 ();
		%feature("compactdefaultargs") SetRep2;
		%feature("autodoc", "	:param aRep2:
	:type aRep2: Handle_StepRepr_Representation &
	:rtype: None
") SetRep2;
		void SetRep2 (const Handle_StepRepr_Representation & aRep2);
		%feature("compactdefaultargs") Rep2;
		%feature("autodoc", "	:rtype: Handle_StepRepr_Representation
") Rep2;
		Handle_StepRepr_Representation Rep2 ();
};


%make_alias(StepRepr_RepresentationRelationship)

%extend StepRepr_RepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_RepresentedDefinition;
class StepRepr_RepresentedDefinition : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepRepr_RepresentedDefinition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_RepresentedDefinition;
		 StepRepr_RepresentedDefinition ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a kind of RepresentedDefinition select type 1 -> GeneralProperty from StepBasic 2 -> PropertyDefinition from StepRepr 3 -> PropertyDefinitionRelationship from StepRepr 4 -> ShapeAspect from StepRepr 5 -> ShapeAspectRelationship from StepRepr 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") GeneralProperty;
		%feature("autodoc", "	* Returns Value as GeneralProperty (or Null if another type)

	:rtype: Handle_StepBasic_GeneralProperty
") GeneralProperty;
		Handle_StepBasic_GeneralProperty GeneralProperty ();
		%feature("compactdefaultargs") PropertyDefinition;
		%feature("autodoc", "	* Returns Value as PropertyDefinition (or Null if another type)

	:rtype: Handle_StepRepr_PropertyDefinition
") PropertyDefinition;
		Handle_StepRepr_PropertyDefinition PropertyDefinition ();
		%feature("compactdefaultargs") PropertyDefinitionRelationship;
		%feature("autodoc", "	* Returns Value as PropertyDefinitionRelationship (or Null if another type)

	:rtype: Handle_StepRepr_PropertyDefinitionRelationship
") PropertyDefinitionRelationship;
		Handle_StepRepr_PropertyDefinitionRelationship PropertyDefinitionRelationship ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* Returns Value as ShapeAspect (or Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "	* Returns Value as ShapeAspectRelationship (or Null if another type)

	:rtype: Handle_StepRepr_ShapeAspectRelationship
") ShapeAspectRelationship;
		Handle_StepRepr_ShapeAspectRelationship ShapeAspectRelationship ();
};


%extend StepRepr_RepresentedDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation;
class StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepRepr_MaterialPropertyRepresentation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation;
		 StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation (const Handle_StepRepr_MaterialPropertyRepresentation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") Value;
		Handle_StepRepr_MaterialPropertyRepresentation Value ();
};


%make_alias(StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation)

%extend StepRepr_SequenceNodeOfSequenceOfMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_SequenceNodeOfSequenceOfRepresentationItem;
class StepRepr_SequenceNodeOfSequenceOfRepresentationItem : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StepRepr_SequenceNodeOfSequenceOfRepresentationItem;
		%feature("autodoc", "	:param I:
	:type I: Handle_StepRepr_RepresentationItem &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StepRepr_SequenceNodeOfSequenceOfRepresentationItem;
		 StepRepr_SequenceNodeOfSequenceOfRepresentationItem (const Handle_StepRepr_RepresentationItem & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") Value;
		Handle_StepRepr_RepresentationItem Value ();
};


%make_alias(StepRepr_SequenceNodeOfSequenceOfRepresentationItem)

%extend StepRepr_SequenceNodeOfSequenceOfRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_SequenceOfMaterialPropertyRepresentation;
class StepRepr_SequenceOfMaterialPropertyRepresentation : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepRepr_SequenceOfMaterialPropertyRepresentation;
		%feature("autodoc", "	:rtype: None
") StepRepr_SequenceOfMaterialPropertyRepresentation;
		 StepRepr_SequenceOfMaterialPropertyRepresentation ();
		%feature("compactdefaultargs") StepRepr_SequenceOfMaterialPropertyRepresentation;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: None
") StepRepr_SequenceOfMaterialPropertyRepresentation;
		 StepRepr_SequenceOfMaterialPropertyRepresentation (const StepRepr_SequenceOfMaterialPropertyRepresentation & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: StepRepr_SequenceOfMaterialPropertyRepresentation
") Assign;
		const StepRepr_SequenceOfMaterialPropertyRepresentation & Assign (const StepRepr_SequenceOfMaterialPropertyRepresentation & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: StepRepr_SequenceOfMaterialPropertyRepresentation
") operator =;
		const StepRepr_SequenceOfMaterialPropertyRepresentation & operator = (const StepRepr_SequenceOfMaterialPropertyRepresentation & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") Append;
		void Append (const Handle_StepRepr_MaterialPropertyRepresentation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: None
") Append;
		void Append (StepRepr_SequenceOfMaterialPropertyRepresentation & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepRepr_MaterialPropertyRepresentation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: None
") Prepend;
		void Prepend (StepRepr_SequenceOfMaterialPropertyRepresentation & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepRepr_MaterialPropertyRepresentation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepRepr_SequenceOfMaterialPropertyRepresentation & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepRepr_MaterialPropertyRepresentation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepRepr_SequenceOfMaterialPropertyRepresentation & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") First;
		Handle_StepRepr_MaterialPropertyRepresentation First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") Last;
		Handle_StepRepr_MaterialPropertyRepresentation Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepRepr_SequenceOfMaterialPropertyRepresentation &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepRepr_SequenceOfMaterialPropertyRepresentation & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") Value;
		Handle_StepRepr_MaterialPropertyRepresentation Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepRepr_MaterialPropertyRepresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_MaterialPropertyRepresentation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_MaterialPropertyRepresentation
") ChangeValue;
		Handle_StepRepr_MaterialPropertyRepresentation ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StepRepr_SequenceOfMaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_SequenceOfRepresentationItem;
class StepRepr_SequenceOfRepresentationItem : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StepRepr_SequenceOfRepresentationItem;
		%feature("autodoc", "	:rtype: None
") StepRepr_SequenceOfRepresentationItem;
		 StepRepr_SequenceOfRepresentationItem ();
		%feature("compactdefaultargs") StepRepr_SequenceOfRepresentationItem;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_SequenceOfRepresentationItem &
	:rtype: None
") StepRepr_SequenceOfRepresentationItem;
		 StepRepr_SequenceOfRepresentationItem (const StepRepr_SequenceOfRepresentationItem & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_SequenceOfRepresentationItem &
	:rtype: StepRepr_SequenceOfRepresentationItem
") Assign;
		const StepRepr_SequenceOfRepresentationItem & Assign (const StepRepr_SequenceOfRepresentationItem & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StepRepr_SequenceOfRepresentationItem &
	:rtype: StepRepr_SequenceOfRepresentationItem
") operator =;
		const StepRepr_SequenceOfRepresentationItem & operator = (const StepRepr_SequenceOfRepresentationItem & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Append;
		void Append (const Handle_StepRepr_RepresentationItem & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StepRepr_SequenceOfRepresentationItem &
	:rtype: None
") Append;
		void Append (StepRepr_SequenceOfRepresentationItem & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StepRepr_RepresentationItem & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StepRepr_SequenceOfRepresentationItem &
	:rtype: None
") Prepend;
		void Prepend (StepRepr_SequenceOfRepresentationItem & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepRepr_RepresentationItem &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StepRepr_RepresentationItem & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepRepr_SequenceOfRepresentationItem &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StepRepr_SequenceOfRepresentationItem & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StepRepr_RepresentationItem &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StepRepr_RepresentationItem & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StepRepr_SequenceOfRepresentationItem &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StepRepr_SequenceOfRepresentationItem & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") First;
		Handle_StepRepr_RepresentationItem First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") Last;
		Handle_StepRepr_RepresentationItem Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StepRepr_SequenceOfRepresentationItem &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StepRepr_SequenceOfRepresentationItem & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_RepresentationItem
") Value;
		Handle_StepRepr_RepresentationItem Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StepRepr_RepresentationItem & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StepRepr_RepresentationItem
") ChangeValue;
		Handle_StepRepr_RepresentationItem ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StepRepr_SequenceOfRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ShapeAspect;
class StepRepr_ShapeAspect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_ShapeAspect;
		%feature("autodoc", "	* Returns a ShapeAspect

	:rtype: None
") StepRepr_ShapeAspect;
		 StepRepr_ShapeAspect ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aOfShape:
	:type aOfShape: Handle_StepRepr_ProductDefinitionShape &
	:param aProductDefinitional:
	:type aProductDefinitional: StepData_Logical
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_ProductDefinitionShape & aOfShape,const StepData_Logical aProductDefinitional);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetOfShape;
		%feature("autodoc", "	:param aOfShape:
	:type aOfShape: Handle_StepRepr_ProductDefinitionShape &
	:rtype: None
") SetOfShape;
		void SetOfShape (const Handle_StepRepr_ProductDefinitionShape & aOfShape);
		%feature("compactdefaultargs") OfShape;
		%feature("autodoc", "	:rtype: Handle_StepRepr_ProductDefinitionShape
") OfShape;
		Handle_StepRepr_ProductDefinitionShape OfShape ();
		%feature("compactdefaultargs") SetProductDefinitional;
		%feature("autodoc", "	:param aProductDefinitional:
	:type aProductDefinitional: StepData_Logical
	:rtype: None
") SetProductDefinitional;
		void SetProductDefinitional (const StepData_Logical aProductDefinitional);
		%feature("compactdefaultargs") ProductDefinitional;
		%feature("autodoc", "	:rtype: StepData_Logical
") ProductDefinitional;
		StepData_Logical ProductDefinitional ();
};


%make_alias(StepRepr_ShapeAspect)

%extend StepRepr_ShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ShapeAspectRelationship;
class StepRepr_ShapeAspectRelationship : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StepRepr_ShapeAspectRelationship;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ShapeAspectRelationship;
		 StepRepr_ShapeAspectRelationship ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param hasDescription:
	:type hasDescription: bool
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRelatingShapeAspect:
	:type aRelatingShapeAspect: Handle_StepRepr_ShapeAspect &
	:param aRelatedShapeAspect:
	:type aRelatedShapeAspect: Handle_StepRepr_ShapeAspect &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Standard_Boolean hasDescription,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_ShapeAspect & aRelatingShapeAspect,const Handle_StepRepr_ShapeAspect & aRelatedShapeAspect);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns field Name

	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name ();
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set field Name

	:param Name:
	:type Name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetName;
		void SetName (const Handle_TCollection_HAsciiString & Name);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	* Returns field Description

	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	* Set field Description

	:param Description:
	:type Description: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & Description);
		%feature("compactdefaultargs") HasDescription;
		%feature("autodoc", "	* Returns True if optional field Description is defined

	:rtype: bool
") HasDescription;
		Standard_Boolean HasDescription ();
		%feature("compactdefaultargs") RelatingShapeAspect;
		%feature("autodoc", "	* Returns field RelatingShapeAspect

	:rtype: Handle_StepRepr_ShapeAspect
") RelatingShapeAspect;
		Handle_StepRepr_ShapeAspect RelatingShapeAspect ();
		%feature("compactdefaultargs") SetRelatingShapeAspect;
		%feature("autodoc", "	* Set field RelatingShapeAspect

	:param RelatingShapeAspect:
	:type RelatingShapeAspect: Handle_StepRepr_ShapeAspect &
	:rtype: None
") SetRelatingShapeAspect;
		void SetRelatingShapeAspect (const Handle_StepRepr_ShapeAspect & RelatingShapeAspect);
		%feature("compactdefaultargs") RelatedShapeAspect;
		%feature("autodoc", "	* Returns field RelatedShapeAspect

	:rtype: Handle_StepRepr_ShapeAspect
") RelatedShapeAspect;
		Handle_StepRepr_ShapeAspect RelatedShapeAspect ();
		%feature("compactdefaultargs") SetRelatedShapeAspect;
		%feature("autodoc", "	* Set field RelatedShapeAspect

	:param RelatedShapeAspect:
	:type RelatedShapeAspect: Handle_StepRepr_ShapeAspect &
	:rtype: None
") SetRelatedShapeAspect;
		void SetRelatedShapeAspect (const Handle_StepRepr_ShapeAspect & RelatedShapeAspect);
};


%make_alias(StepRepr_ShapeAspectRelationship)

%extend StepRepr_ShapeAspectRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ShapeDefinition;
class StepRepr_ShapeDefinition : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepRepr_ShapeDefinition;
		%feature("autodoc", "	* Returns a ShapeDefinition SelectType

	:rtype: None
") StepRepr_ShapeDefinition;
		 StepRepr_ShapeDefinition ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a ShapeDefinition Kind Entity that is : 1 -> ProductDefinitionShape 2 -> ShapeAspect 3 -> ShapeAspectRelationship 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ProductDefinitionShape;
		%feature("autodoc", "	* returns Value as a ProductDefinitionShape (Null if another type)

	:rtype: Handle_StepRepr_ProductDefinitionShape
") ProductDefinitionShape;
		Handle_StepRepr_ProductDefinitionShape ProductDefinitionShape ();
		%feature("compactdefaultargs") ShapeAspect;
		%feature("autodoc", "	* returns Value as a ShapeAspect (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspect
") ShapeAspect;
		Handle_StepRepr_ShapeAspect ShapeAspect ();
		%feature("compactdefaultargs") ShapeAspectRelationship;
		%feature("autodoc", "	* returns Value as a ShapeAspectRelationship (Null if another type)

	:rtype: Handle_StepRepr_ShapeAspectRelationship
") ShapeAspectRelationship;
		Handle_StepRepr_ShapeAspectRelationship ShapeAspectRelationship ();
};


%extend StepRepr_ShapeDefinition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_SuppliedPartRelationship;
class StepRepr_SuppliedPartRelationship : public StepBasic_ProductDefinitionRelationship {
	public:
		%feature("compactdefaultargs") StepRepr_SuppliedPartRelationship;
		%feature("autodoc", "	:rtype: None
") StepRepr_SuppliedPartRelationship;
		 StepRepr_SuppliedPartRelationship ();
};


%make_alias(StepRepr_SuppliedPartRelationship)

%extend StepRepr_SuppliedPartRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_Transformation;
class StepRepr_Transformation : public StepData_SelectType {
	public:
		%feature("compactdefaultargs") StepRepr_Transformation;
		%feature("autodoc", "	* Returns a Transformation SelectType

	:rtype: None
") StepRepr_Transformation;
		 StepRepr_Transformation ();
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "	* Recognizes a Transformation Kind Entity that is : 1 -> ItemDefinedTransformation 2 -> FunctionallyDefinedTransformation 0 else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CaseNum;
		Standard_Integer CaseNum (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ItemDefinedTransformation;
		%feature("autodoc", "	* returns Value as a ItemDefinedTransformation (Null if another type)

	:rtype: Handle_StepRepr_ItemDefinedTransformation
") ItemDefinedTransformation;
		Handle_StepRepr_ItemDefinedTransformation ItemDefinedTransformation ();
		%feature("compactdefaultargs") FunctionallyDefinedTransformation;
		%feature("autodoc", "	* returns Value as a FunctionallyDefinedTransformation (Null if another type)

	:rtype: Handle_StepRepr_FunctionallyDefinedTransformation
") FunctionallyDefinedTransformation;
		Handle_StepRepr_FunctionallyDefinedTransformation FunctionallyDefinedTransformation ();
};


%extend StepRepr_Transformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_AssemblyComponentUsage;
class StepRepr_AssemblyComponentUsage : public StepRepr_ProductDefinitionUsage {
	public:
		%feature("compactdefaultargs") StepRepr_AssemblyComponentUsage;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_AssemblyComponentUsage;
		 StepRepr_AssemblyComponentUsage ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aProductDefinitionRelationship_Id:
	:type aProductDefinitionRelationship_Id: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_Name:
	:type aProductDefinitionRelationship_Name: Handle_TCollection_HAsciiString &
	:param hasProductDefinitionRelationship_Description:
	:type hasProductDefinitionRelationship_Description: bool
	:param aProductDefinitionRelationship_Description:
	:type aProductDefinitionRelationship_Description: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_RelatingProductDefinition:
	:type aProductDefinitionRelationship_RelatingProductDefinition: Handle_StepBasic_ProductDefinition &
	:param aProductDefinitionRelationship_RelatedProductDefinition:
	:type aProductDefinitionRelationship_RelatedProductDefinition: Handle_StepBasic_ProductDefinition &
	:param hasReferenceDesignator:
	:type hasReferenceDesignator: bool
	:param aReferenceDesignator:
	:type aReferenceDesignator: Handle_TCollection_HAsciiString &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Id,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Name,const Standard_Boolean hasProductDefinitionRelationship_Description,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Description,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatingProductDefinition,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatedProductDefinition,const Standard_Boolean hasReferenceDesignator,const Handle_TCollection_HAsciiString & aReferenceDesignator);
		%feature("compactdefaultargs") ReferenceDesignator;
		%feature("autodoc", "	* Returns field ReferenceDesignator

	:rtype: Handle_TCollection_HAsciiString
") ReferenceDesignator;
		Handle_TCollection_HAsciiString ReferenceDesignator ();
		%feature("compactdefaultargs") SetReferenceDesignator;
		%feature("autodoc", "	* Set field ReferenceDesignator

	:param ReferenceDesignator:
	:type ReferenceDesignator: Handle_TCollection_HAsciiString &
	:rtype: None
") SetReferenceDesignator;
		void SetReferenceDesignator (const Handle_TCollection_HAsciiString & ReferenceDesignator);
		%feature("compactdefaultargs") HasReferenceDesignator;
		%feature("autodoc", "	* Returns True if optional field ReferenceDesignator is defined

	:rtype: bool
") HasReferenceDesignator;
		Standard_Boolean HasReferenceDesignator ();
};


%make_alias(StepRepr_AssemblyComponentUsage)

%extend StepRepr_AssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_CompositeShapeAspect;
class StepRepr_CompositeShapeAspect : public StepRepr_ShapeAspect {
	public:
		%feature("compactdefaultargs") StepRepr_CompositeShapeAspect;
		%feature("autodoc", "	:rtype: None
") StepRepr_CompositeShapeAspect;
		 StepRepr_CompositeShapeAspect ();
};


%make_alias(StepRepr_CompositeShapeAspect)

%extend StepRepr_CompositeShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_CompoundRepresentationItem;
class StepRepr_CompoundRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepRepr_CompoundRepresentationItem;
		%feature("autodoc", "	:rtype: None
") StepRepr_CompoundRepresentationItem;
		 StepRepr_CompoundRepresentationItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param item_element:
	:type item_element: Handle_StepRepr_HArray1OfRepresentationItem &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepRepr_HArray1OfRepresentationItem & item_element);
		%feature("compactdefaultargs") ItemElement;
		%feature("autodoc", "	:rtype: Handle_StepRepr_HArray1OfRepresentationItem
") ItemElement;
		Handle_StepRepr_HArray1OfRepresentationItem ItemElement ();
		%feature("compactdefaultargs") NbItemElement;
		%feature("autodoc", "	:rtype: int
") NbItemElement;
		Standard_Integer NbItemElement ();
		%feature("compactdefaultargs") SetItemElement;
		%feature("autodoc", "	:param item_element:
	:type item_element: Handle_StepRepr_HArray1OfRepresentationItem &
	:rtype: None
") SetItemElement;
		void SetItemElement (const Handle_StepRepr_HArray1OfRepresentationItem & item_element);
		%feature("compactdefaultargs") ItemElementValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepRepr_RepresentationItem
") ItemElementValue;
		Handle_StepRepr_RepresentationItem ItemElementValue (const Standard_Integer num);
		%feature("compactdefaultargs") SetItemElementValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:param anelement:
	:type anelement: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetItemElementValue;
		void SetItemElementValue (const Standard_Integer num,const Handle_StepRepr_RepresentationItem & anelement);
};


%make_alias(StepRepr_CompoundRepresentationItem)

%extend StepRepr_CompoundRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_DefinitionalRepresentation;
class StepRepr_DefinitionalRepresentation : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepRepr_DefinitionalRepresentation;
		%feature("autodoc", "	* Returns a DefinitionalRepresentation

	:rtype: None
") StepRepr_DefinitionalRepresentation;
		 StepRepr_DefinitionalRepresentation ();
};


%make_alias(StepRepr_DefinitionalRepresentation)

%extend StepRepr_DefinitionalRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_DerivedShapeAspect;
class StepRepr_DerivedShapeAspect : public StepRepr_ShapeAspect {
	public:
		%feature("compactdefaultargs") StepRepr_DerivedShapeAspect;
		%feature("autodoc", "	:rtype: None
") StepRepr_DerivedShapeAspect;
		 StepRepr_DerivedShapeAspect ();
};


%make_alias(StepRepr_DerivedShapeAspect)

%extend StepRepr_DerivedShapeAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_DescriptiveRepresentationItem;
class StepRepr_DescriptiveRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepRepr_DescriptiveRepresentationItem;
		%feature("autodoc", "	* Returns a DescriptiveRepresentationItem

	:rtype: None
") StepRepr_DescriptiveRepresentationItem;
		 StepRepr_DescriptiveRepresentationItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") SetDescription;
		%feature("autodoc", "	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:rtype: None
") SetDescription;
		void SetDescription (const Handle_TCollection_HAsciiString & aDescription);
		%feature("compactdefaultargs") Description;
		%feature("autodoc", "	:rtype: Handle_TCollection_HAsciiString
") Description;
		Handle_TCollection_HAsciiString Description ();
};


%make_alias(StepRepr_DescriptiveRepresentationItem)

%extend StepRepr_DescriptiveRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ExternallyDefinedRepresentation;
class StepRepr_ExternallyDefinedRepresentation : public StepRepr_Representation {
	public:
		%feature("compactdefaultargs") StepRepr_ExternallyDefinedRepresentation;
		%feature("autodoc", "	:rtype: None
") StepRepr_ExternallyDefinedRepresentation;
		 StepRepr_ExternallyDefinedRepresentation ();
};


%make_alias(StepRepr_ExternallyDefinedRepresentation)

%extend StepRepr_ExternallyDefinedRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_GlobalUncertaintyAssignedContext;
class StepRepr_GlobalUncertaintyAssignedContext : public StepRepr_RepresentationContext {
	public:
		%feature("compactdefaultargs") StepRepr_GlobalUncertaintyAssignedContext;
		%feature("autodoc", "	* Returns a GlobalUncertaintyAssignedContext

	:rtype: None
") StepRepr_GlobalUncertaintyAssignedContext;
		 StepRepr_GlobalUncertaintyAssignedContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aUncertainty:
	:type aUncertainty: Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit & aUncertainty);
		%feature("compactdefaultargs") SetUncertainty;
		%feature("autodoc", "	:param aUncertainty:
	:type aUncertainty: Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit &
	:rtype: None
") SetUncertainty;
		void SetUncertainty (const Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit & aUncertainty);
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit
") Uncertainty;
		Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit Uncertainty ();
		%feature("compactdefaultargs") UncertaintyValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_UncertaintyMeasureWithUnit
") UncertaintyValue;
		Handle_StepBasic_UncertaintyMeasureWithUnit UncertaintyValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUncertainty;
		%feature("autodoc", "	:rtype: int
") NbUncertainty;
		Standard_Integer NbUncertainty ();
};


%make_alias(StepRepr_GlobalUncertaintyAssignedContext)

%extend StepRepr_GlobalUncertaintyAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_GlobalUnitAssignedContext;
class StepRepr_GlobalUnitAssignedContext : public StepRepr_RepresentationContext {
	public:
		%feature("compactdefaultargs") StepRepr_GlobalUnitAssignedContext;
		%feature("autodoc", "	* Returns a GlobalUnitAssignedContext

	:rtype: None
") StepRepr_GlobalUnitAssignedContext;
		 StepRepr_GlobalUnitAssignedContext ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aContextIdentifier:
	:type aContextIdentifier: Handle_TCollection_HAsciiString &
	:param aContextType:
	:type aContextType: Handle_TCollection_HAsciiString &
	:param aUnits:
	:type aUnits: Handle_StepBasic_HArray1OfNamedUnit &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aContextIdentifier,const Handle_TCollection_HAsciiString & aContextType,const Handle_StepBasic_HArray1OfNamedUnit & aUnits);
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "	:param aUnits:
	:type aUnits: Handle_StepBasic_HArray1OfNamedUnit &
	:rtype: None
") SetUnits;
		void SetUnits (const Handle_StepBasic_HArray1OfNamedUnit & aUnits);
		%feature("compactdefaultargs") Units;
		%feature("autodoc", "	:rtype: Handle_StepBasic_HArray1OfNamedUnit
") Units;
		Handle_StepBasic_HArray1OfNamedUnit Units ();
		%feature("compactdefaultargs") UnitsValue;
		%feature("autodoc", "	:param num:
	:type num: int
	:rtype: Handle_StepBasic_NamedUnit
") UnitsValue;
		Handle_StepBasic_NamedUnit UnitsValue (const Standard_Integer num);
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "	:rtype: int
") NbUnits;
		Standard_Integer NbUnits ();
};


%make_alias(StepRepr_GlobalUnitAssignedContext)

%extend StepRepr_GlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_MakeFromUsageOption;
class StepRepr_MakeFromUsageOption : public StepRepr_ProductDefinitionUsage {
	public:
		%feature("compactdefaultargs") StepRepr_MakeFromUsageOption;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_MakeFromUsageOption;
		 StepRepr_MakeFromUsageOption ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aProductDefinitionRelationship_Id:
	:type aProductDefinitionRelationship_Id: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_Name:
	:type aProductDefinitionRelationship_Name: Handle_TCollection_HAsciiString &
	:param hasProductDefinitionRelationship_Description:
	:type hasProductDefinitionRelationship_Description: bool
	:param aProductDefinitionRelationship_Description:
	:type aProductDefinitionRelationship_Description: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_RelatingProductDefinition:
	:type aProductDefinitionRelationship_RelatingProductDefinition: Handle_StepBasic_ProductDefinition &
	:param aProductDefinitionRelationship_RelatedProductDefinition:
	:type aProductDefinitionRelationship_RelatedProductDefinition: Handle_StepBasic_ProductDefinition &
	:param aRanking:
	:type aRanking: int
	:param aRankingRationale:
	:type aRankingRationale: Handle_TCollection_HAsciiString &
	:param aQuantity:
	:type aQuantity: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Id,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Name,const Standard_Boolean hasProductDefinitionRelationship_Description,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Description,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatingProductDefinition,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatedProductDefinition,const Standard_Integer aRanking,const Handle_TCollection_HAsciiString & aRankingRationale,const Handle_StepBasic_MeasureWithUnit & aQuantity);
		%feature("compactdefaultargs") Ranking;
		%feature("autodoc", "	* Returns field Ranking

	:rtype: int
") Ranking;
		Standard_Integer Ranking ();
		%feature("compactdefaultargs") SetRanking;
		%feature("autodoc", "	* Set field Ranking

	:param Ranking:
	:type Ranking: int
	:rtype: None
") SetRanking;
		void SetRanking (const Standard_Integer Ranking);
		%feature("compactdefaultargs") RankingRationale;
		%feature("autodoc", "	* Returns field RankingRationale

	:rtype: Handle_TCollection_HAsciiString
") RankingRationale;
		Handle_TCollection_HAsciiString RankingRationale ();
		%feature("compactdefaultargs") SetRankingRationale;
		%feature("autodoc", "	* Set field RankingRationale

	:param RankingRationale:
	:type RankingRationale: Handle_TCollection_HAsciiString &
	:rtype: None
") SetRankingRationale;
		void SetRankingRationale (const Handle_TCollection_HAsciiString & RankingRationale);
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "	* Returns field Quantity

	:rtype: Handle_StepBasic_MeasureWithUnit
") Quantity;
		Handle_StepBasic_MeasureWithUnit Quantity ();
		%feature("compactdefaultargs") SetQuantity;
		%feature("autodoc", "	* Set field Quantity

	:param Quantity:
	:type Quantity: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetQuantity;
		void SetQuantity (const Handle_StepBasic_MeasureWithUnit & Quantity);
};


%make_alias(StepRepr_MakeFromUsageOption)

%extend StepRepr_MakeFromUsageOption {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_MappedItem;
class StepRepr_MappedItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepRepr_MappedItem;
		%feature("autodoc", "	* Returns a MappedItem

	:rtype: None
") StepRepr_MappedItem;
		 StepRepr_MappedItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aMappingSource:
	:type aMappingSource: Handle_StepRepr_RepresentationMap &
	:param aMappingTarget:
	:type aMappingTarget: Handle_StepRepr_RepresentationItem &
	:rtype: void
") Init;
		virtual void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepRepr_RepresentationMap & aMappingSource,const Handle_StepRepr_RepresentationItem & aMappingTarget);
		%feature("compactdefaultargs") SetMappingSource;
		%feature("autodoc", "	:param aMappingSource:
	:type aMappingSource: Handle_StepRepr_RepresentationMap &
	:rtype: None
") SetMappingSource;
		void SetMappingSource (const Handle_StepRepr_RepresentationMap & aMappingSource);
		%feature("compactdefaultargs") MappingSource;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationMap
") MappingSource;
		Handle_StepRepr_RepresentationMap MappingSource ();
		%feature("compactdefaultargs") SetMappingTarget;
		%feature("autodoc", "	:param aMappingTarget:
	:type aMappingTarget: Handle_StepRepr_RepresentationItem &
	:rtype: None
") SetMappingTarget;
		void SetMappingTarget (const Handle_StepRepr_RepresentationItem & aMappingTarget);
		%feature("compactdefaultargs") MappingTarget;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") MappingTarget;
		Handle_StepRepr_RepresentationItem MappingTarget ();
};


%make_alias(StepRepr_MappedItem)

%extend StepRepr_MappedItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_MaterialProperty;
class StepRepr_MaterialProperty : public StepRepr_PropertyDefinition {
	public:
		%feature("compactdefaultargs") StepRepr_MaterialProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_MaterialProperty;
		 StepRepr_MaterialProperty ();
};


%make_alias(StepRepr_MaterialProperty)

%extend StepRepr_MaterialProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_MaterialPropertyRepresentation;
class StepRepr_MaterialPropertyRepresentation : public StepRepr_PropertyDefinitionRepresentation {
	public:
		%feature("compactdefaultargs") StepRepr_MaterialPropertyRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_MaterialPropertyRepresentation;
		 StepRepr_MaterialPropertyRepresentation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aPropertyDefinitionRepresentation_Definition:
	:type aPropertyDefinitionRepresentation_Definition: StepRepr_RepresentedDefinition &
	:param aPropertyDefinitionRepresentation_UsedRepresentation:
	:type aPropertyDefinitionRepresentation_UsedRepresentation: Handle_StepRepr_Representation &
	:param aDependentEnvironment:
	:type aDependentEnvironment: Handle_StepRepr_DataEnvironment &
	:rtype: None
") Init;
		void Init (const StepRepr_RepresentedDefinition & aPropertyDefinitionRepresentation_Definition,const Handle_StepRepr_Representation & aPropertyDefinitionRepresentation_UsedRepresentation,const Handle_StepRepr_DataEnvironment & aDependentEnvironment);
		%feature("compactdefaultargs") DependentEnvironment;
		%feature("autodoc", "	* Returns field DependentEnvironment

	:rtype: Handle_StepRepr_DataEnvironment
") DependentEnvironment;
		Handle_StepRepr_DataEnvironment DependentEnvironment ();
		%feature("compactdefaultargs") SetDependentEnvironment;
		%feature("autodoc", "	* Set field DependentEnvironment

	:param DependentEnvironment:
	:type DependentEnvironment: Handle_StepRepr_DataEnvironment &
	:rtype: None
") SetDependentEnvironment;
		void SetDependentEnvironment (const Handle_StepRepr_DataEnvironment & DependentEnvironment);
};


%make_alias(StepRepr_MaterialPropertyRepresentation)

%extend StepRepr_MaterialPropertyRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_MeasureRepresentationItem;
class StepRepr_MeasureRepresentationItem : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepRepr_MeasureRepresentationItem;
		%feature("autodoc", "	* Creates empty object

	:rtype: None
") StepRepr_MeasureRepresentationItem;
		 StepRepr_MeasureRepresentationItem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Init all fields

	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aValueComponent:
	:type aValueComponent: Handle_StepBasic_MeasureValueMember &
	:param aUnitComponent:
	:type aUnitComponent: StepBasic_Unit &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_StepBasic_MeasureValueMember & aValueComponent,const StepBasic_Unit & aUnitComponent);
		%feature("compactdefaultargs") SetMeasure;
		%feature("autodoc", "	:param Measure:
	:type Measure: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetMeasure;
		void SetMeasure (const Handle_StepBasic_MeasureWithUnit & Measure);
		%feature("compactdefaultargs") Measure;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureWithUnit
") Measure;
		Handle_StepBasic_MeasureWithUnit Measure ();
};


%make_alias(StepRepr_MeasureRepresentationItem)

%extend StepRepr_MeasureRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ParametricRepresentationContext;
class StepRepr_ParametricRepresentationContext : public StepRepr_RepresentationContext {
	public:
		%feature("compactdefaultargs") StepRepr_ParametricRepresentationContext;
		%feature("autodoc", "	* Returns a ParametricRepresentationContext

	:rtype: None
") StepRepr_ParametricRepresentationContext;
		 StepRepr_ParametricRepresentationContext ();
};


%make_alias(StepRepr_ParametricRepresentationContext)

%extend StepRepr_ParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ProductDefinitionShape;
class StepRepr_ProductDefinitionShape : public StepRepr_PropertyDefinition {
	public:
		%feature("compactdefaultargs") StepRepr_ProductDefinitionShape;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ProductDefinitionShape;
		 StepRepr_ProductDefinitionShape ();
};


%make_alias(StepRepr_ProductDefinitionShape)

%extend StepRepr_ProductDefinitionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ReprItemAndLengthMeasureWithUnit;
class StepRepr_ReprItemAndLengthMeasureWithUnit : public StepRepr_RepresentationItem {
	public:
		%feature("compactdefaultargs") StepRepr_ReprItemAndLengthMeasureWithUnit;
		%feature("autodoc", "	:rtype: None
") StepRepr_ReprItemAndLengthMeasureWithUnit;
		 StepRepr_ReprItemAndLengthMeasureWithUnit ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aMWU:
	:type aMWU: Handle_StepBasic_MeasureWithUnit &
	:param aRI:
	:type aRI: Handle_StepRepr_RepresentationItem &
	:rtype: None
") Init;
		void Init (const Handle_StepBasic_MeasureWithUnit & aMWU,const Handle_StepRepr_RepresentationItem & aRI);
		%feature("compactdefaultargs") SetLengthMeasureWithUnit;
		%feature("autodoc", "	:param aLMWU:
	:type aLMWU: Handle_StepBasic_LengthMeasureWithUnit &
	:rtype: None
") SetLengthMeasureWithUnit;
		void SetLengthMeasureWithUnit (const Handle_StepBasic_LengthMeasureWithUnit & aLMWU);
		%feature("compactdefaultargs") GetLengthMeasureWithUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_LengthMeasureWithUnit
") GetLengthMeasureWithUnit;
		Handle_StepBasic_LengthMeasureWithUnit GetLengthMeasureWithUnit ();
		%feature("compactdefaultargs") GetMeasureRepresentationItem;
		%feature("autodoc", "	:rtype: Handle_StepRepr_MeasureRepresentationItem
") GetMeasureRepresentationItem;
		Handle_StepRepr_MeasureRepresentationItem GetMeasureRepresentationItem ();
		%feature("compactdefaultargs") SetMeasureWithUnit;
		%feature("autodoc", "	:param aMWU:
	:type aMWU: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetMeasureWithUnit;
		void SetMeasureWithUnit (const Handle_StepBasic_MeasureWithUnit & aMWU);
		%feature("compactdefaultargs") GetMeasureWithUnit;
		%feature("autodoc", "	:rtype: Handle_StepBasic_MeasureWithUnit
") GetMeasureWithUnit;
		Handle_StepBasic_MeasureWithUnit GetMeasureWithUnit ();
		%feature("compactdefaultargs") GetRepresentationItem;
		%feature("autodoc", "	:rtype: Handle_StepRepr_RepresentationItem
") GetRepresentationItem;
		Handle_StepRepr_RepresentationItem GetRepresentationItem ();
};


%make_alias(StepRepr_ReprItemAndLengthMeasureWithUnit)

%extend StepRepr_ReprItemAndLengthMeasureWithUnit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ShapeAspectDerivingRelationship;
class StepRepr_ShapeAspectDerivingRelationship : public StepRepr_ShapeAspectRelationship {
	public:
		%feature("compactdefaultargs") StepRepr_ShapeAspectDerivingRelationship;
		%feature("autodoc", "	:rtype: None
") StepRepr_ShapeAspectDerivingRelationship;
		 StepRepr_ShapeAspectDerivingRelationship ();
};


%make_alias(StepRepr_ShapeAspectDerivingRelationship)

%extend StepRepr_ShapeAspectDerivingRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ShapeAspectTransition;
class StepRepr_ShapeAspectTransition : public StepRepr_ShapeAspectRelationship {
	public:
		%feature("compactdefaultargs") StepRepr_ShapeAspectTransition;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_ShapeAspectTransition;
		 StepRepr_ShapeAspectTransition ();
};


%make_alias(StepRepr_ShapeAspectTransition)

%extend StepRepr_ShapeAspectTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ShapeRepresentationRelationship;
class StepRepr_ShapeRepresentationRelationship : public StepRepr_RepresentationRelationship {
	public:
		%feature("compactdefaultargs") StepRepr_ShapeRepresentationRelationship;
		%feature("autodoc", "	:rtype: None
") StepRepr_ShapeRepresentationRelationship;
		 StepRepr_ShapeRepresentationRelationship ();
};


%make_alias(StepRepr_ShapeRepresentationRelationship)

%extend StepRepr_ShapeRepresentationRelationship {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_StructuralResponseProperty;
class StepRepr_StructuralResponseProperty : public StepRepr_PropertyDefinition {
	public:
		%feature("compactdefaultargs") StepRepr_StructuralResponseProperty;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_StructuralResponseProperty;
		 StepRepr_StructuralResponseProperty ();
};


%make_alias(StepRepr_StructuralResponseProperty)

%extend StepRepr_StructuralResponseProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_StructuralResponsePropertyDefinitionRepresentation;
class StepRepr_StructuralResponsePropertyDefinitionRepresentation : public StepRepr_PropertyDefinitionRepresentation {
	public:
		%feature("compactdefaultargs") StepRepr_StructuralResponsePropertyDefinitionRepresentation;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_StructuralResponsePropertyDefinitionRepresentation;
		 StepRepr_StructuralResponsePropertyDefinitionRepresentation ();
};


%make_alias(StepRepr_StructuralResponsePropertyDefinitionRepresentation)

%extend StepRepr_StructuralResponsePropertyDefinitionRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_Extension;
class StepRepr_Extension : public StepRepr_DerivedShapeAspect {
	public:
		%feature("compactdefaultargs") StepRepr_Extension;
		%feature("autodoc", "	:rtype: None
") StepRepr_Extension;
		 StepRepr_Extension ();
};


%make_alias(StepRepr_Extension)

%extend StepRepr_Extension {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_NextAssemblyUsageOccurrence;
class StepRepr_NextAssemblyUsageOccurrence : public StepRepr_AssemblyComponentUsage {
	public:
		%feature("compactdefaultargs") StepRepr_NextAssemblyUsageOccurrence;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_NextAssemblyUsageOccurrence;
		 StepRepr_NextAssemblyUsageOccurrence ();
};


%make_alias(StepRepr_NextAssemblyUsageOccurrence)

%extend StepRepr_NextAssemblyUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_PromissoryUsageOccurrence;
class StepRepr_PromissoryUsageOccurrence : public StepRepr_AssemblyComponentUsage {
	public:
		%feature("compactdefaultargs") StepRepr_PromissoryUsageOccurrence;
		%feature("autodoc", "	:rtype: None
") StepRepr_PromissoryUsageOccurrence;
		 StepRepr_PromissoryUsageOccurrence ();
};


%make_alias(StepRepr_PromissoryUsageOccurrence)

%extend StepRepr_PromissoryUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_QuantifiedAssemblyComponentUsage;
class StepRepr_QuantifiedAssemblyComponentUsage : public StepRepr_AssemblyComponentUsage {
	public:
		%feature("compactdefaultargs") StepRepr_QuantifiedAssemblyComponentUsage;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_QuantifiedAssemblyComponentUsage;
		 StepRepr_QuantifiedAssemblyComponentUsage ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aProductDefinitionRelationship_Id:
	:type aProductDefinitionRelationship_Id: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_Name:
	:type aProductDefinitionRelationship_Name: Handle_TCollection_HAsciiString &
	:param hasProductDefinitionRelationship_Description:
	:type hasProductDefinitionRelationship_Description: bool
	:param aProductDefinitionRelationship_Description:
	:type aProductDefinitionRelationship_Description: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_RelatingProductDefinition:
	:type aProductDefinitionRelationship_RelatingProductDefinition: Handle_StepBasic_ProductDefinition &
	:param aProductDefinitionRelationship_RelatedProductDefinition:
	:type aProductDefinitionRelationship_RelatedProductDefinition: Handle_StepBasic_ProductDefinition &
	:param hasAssemblyComponentUsage_ReferenceDesignator:
	:type hasAssemblyComponentUsage_ReferenceDesignator: bool
	:param aAssemblyComponentUsage_ReferenceDesignator:
	:type aAssemblyComponentUsage_ReferenceDesignator: Handle_TCollection_HAsciiString &
	:param aQuantity:
	:type aQuantity: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Id,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Name,const Standard_Boolean hasProductDefinitionRelationship_Description,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Description,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatingProductDefinition,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatedProductDefinition,const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator,const Handle_TCollection_HAsciiString & aAssemblyComponentUsage_ReferenceDesignator,const Handle_StepBasic_MeasureWithUnit & aQuantity);
		%feature("compactdefaultargs") Quantity;
		%feature("autodoc", "	* Returns field Quantity

	:rtype: Handle_StepBasic_MeasureWithUnit
") Quantity;
		Handle_StepBasic_MeasureWithUnit Quantity ();
		%feature("compactdefaultargs") SetQuantity;
		%feature("autodoc", "	* Set field Quantity

	:param Quantity:
	:type Quantity: Handle_StepBasic_MeasureWithUnit &
	:rtype: None
") SetQuantity;
		void SetQuantity (const Handle_StepBasic_MeasureWithUnit & Quantity);
};


%make_alias(StepRepr_QuantifiedAssemblyComponentUsage)

%extend StepRepr_QuantifiedAssemblyComponentUsage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_RepresentationRelationshipWithTransformation;
class StepRepr_RepresentationRelationshipWithTransformation : public StepRepr_ShapeRepresentationRelationship {
	public:
		%feature("compactdefaultargs") StepRepr_RepresentationRelationshipWithTransformation;
		%feature("autodoc", "	:rtype: None
") StepRepr_RepresentationRelationshipWithTransformation;
		 StepRepr_RepresentationRelationshipWithTransformation ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param aName:
	:type aName: Handle_TCollection_HAsciiString &
	:param aDescription:
	:type aDescription: Handle_TCollection_HAsciiString &
	:param aRep1:
	:type aRep1: Handle_StepRepr_Representation &
	:param aRep2:
	:type aRep2: Handle_StepRepr_Representation &
	:param aTransf:
	:type aTransf: StepRepr_Transformation &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aName,const Handle_TCollection_HAsciiString & aDescription,const Handle_StepRepr_Representation & aRep1,const Handle_StepRepr_Representation & aRep2,const StepRepr_Transformation & aTransf);
		%feature("compactdefaultargs") TransformationOperator;
		%feature("autodoc", "	:rtype: StepRepr_Transformation
") TransformationOperator;
		StepRepr_Transformation TransformationOperator ();
		%feature("compactdefaultargs") SetTransformationOperator;
		%feature("autodoc", "	:param aTrans:
	:type aTrans: StepRepr_Transformation &
	:rtype: None
") SetTransformationOperator;
		void SetTransformationOperator (const StepRepr_Transformation & aTrans);
};


%make_alias(StepRepr_RepresentationRelationshipWithTransformation)

%extend StepRepr_RepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_SpecifiedHigherUsageOccurrence;
class StepRepr_SpecifiedHigherUsageOccurrence : public StepRepr_AssemblyComponentUsage {
	public:
		%feature("compactdefaultargs") StepRepr_SpecifiedHigherUsageOccurrence;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") StepRepr_SpecifiedHigherUsageOccurrence;
		 StepRepr_SpecifiedHigherUsageOccurrence ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize all fields (own and inherited)

	:param aProductDefinitionRelationship_Id:
	:type aProductDefinitionRelationship_Id: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_Name:
	:type aProductDefinitionRelationship_Name: Handle_TCollection_HAsciiString &
	:param hasProductDefinitionRelationship_Description:
	:type hasProductDefinitionRelationship_Description: bool
	:param aProductDefinitionRelationship_Description:
	:type aProductDefinitionRelationship_Description: Handle_TCollection_HAsciiString &
	:param aProductDefinitionRelationship_RelatingProductDefinition:
	:type aProductDefinitionRelationship_RelatingProductDefinition: Handle_StepBasic_ProductDefinition &
	:param aProductDefinitionRelationship_RelatedProductDefinition:
	:type aProductDefinitionRelationship_RelatedProductDefinition: Handle_StepBasic_ProductDefinition &
	:param hasAssemblyComponentUsage_ReferenceDesignator:
	:type hasAssemblyComponentUsage_ReferenceDesignator: bool
	:param aAssemblyComponentUsage_ReferenceDesignator:
	:type aAssemblyComponentUsage_ReferenceDesignator: Handle_TCollection_HAsciiString &
	:param aUpperUsage:
	:type aUpperUsage: Handle_StepRepr_AssemblyComponentUsage &
	:param aNextUsage:
	:type aNextUsage: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:rtype: None
") Init;
		void Init (const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Id,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Name,const Standard_Boolean hasProductDefinitionRelationship_Description,const Handle_TCollection_HAsciiString & aProductDefinitionRelationship_Description,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatingProductDefinition,const Handle_StepBasic_ProductDefinition & aProductDefinitionRelationship_RelatedProductDefinition,const Standard_Boolean hasAssemblyComponentUsage_ReferenceDesignator,const Handle_TCollection_HAsciiString & aAssemblyComponentUsage_ReferenceDesignator,const Handle_StepRepr_AssemblyComponentUsage & aUpperUsage,const Handle_StepRepr_NextAssemblyUsageOccurrence & aNextUsage);
		%feature("compactdefaultargs") UpperUsage;
		%feature("autodoc", "	* Returns field UpperUsage

	:rtype: Handle_StepRepr_AssemblyComponentUsage
") UpperUsage;
		Handle_StepRepr_AssemblyComponentUsage UpperUsage ();
		%feature("compactdefaultargs") SetUpperUsage;
		%feature("autodoc", "	* Set field UpperUsage

	:param UpperUsage:
	:type UpperUsage: Handle_StepRepr_AssemblyComponentUsage &
	:rtype: None
") SetUpperUsage;
		void SetUpperUsage (const Handle_StepRepr_AssemblyComponentUsage & UpperUsage);
		%feature("compactdefaultargs") NextUsage;
		%feature("autodoc", "	* Returns field NextUsage

	:rtype: Handle_StepRepr_NextAssemblyUsageOccurrence
") NextUsage;
		Handle_StepRepr_NextAssemblyUsageOccurrence NextUsage ();
		%feature("compactdefaultargs") SetNextUsage;
		%feature("autodoc", "	* Set field NextUsage

	:param NextUsage:
	:type NextUsage: Handle_StepRepr_NextAssemblyUsageOccurrence &
	:rtype: None
") SetNextUsage;
		void SetNextUsage (const Handle_StepRepr_NextAssemblyUsageOccurrence & NextUsage);
};


%make_alias(StepRepr_SpecifiedHigherUsageOccurrence)

%extend StepRepr_SpecifiedHigherUsageOccurrence {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ValueRange;
class StepRepr_ValueRange : public StepRepr_CompoundRepresentationItem {
	public:
		%feature("compactdefaultargs") StepRepr_ValueRange;
		%feature("autodoc", "	:rtype: None
") StepRepr_ValueRange;
		 StepRepr_ValueRange ();
};


%make_alias(StepRepr_ValueRange)

%extend StepRepr_ValueRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StepRepr_ShapeRepresentationRelationshipWithTransformation;
class StepRepr_ShapeRepresentationRelationshipWithTransformation : public StepRepr_RepresentationRelationshipWithTransformation {
	public:
		%feature("compactdefaultargs") StepRepr_ShapeRepresentationRelationshipWithTransformation;
		%feature("autodoc", "	:rtype: None
") StepRepr_ShapeRepresentationRelationshipWithTransformation;
		 StepRepr_ShapeRepresentationRelationshipWithTransformation ();
};


%make_alias(StepRepr_ShapeRepresentationRelationshipWithTransformation)

%extend StepRepr_ShapeRepresentationRelationshipWithTransformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
