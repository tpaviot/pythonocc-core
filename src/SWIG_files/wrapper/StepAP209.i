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
%module (package="OCC") StepAP209

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


%include StepAP209_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor StepAP209_Construct;
class StepAP209_Construct : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") StepAP209_Construct;
		 StepAP209_Construct ();
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "	* Creates a tool and initializes it

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: None
") StepAP209_Construct;
		 StepAP209_Construct (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes tool; returns True if succeeded

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: bool
") Init;
		Standard_Boolean Init (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") IsDesing;
		%feature("autodoc", "	:param PD:
	:type PD: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: bool
") IsDesing;
		Standard_Boolean IsDesing (const Handle_StepBasic_ProductDefinitionFormation & PD);
		%feature("compactdefaultargs") IsAnalys;
		%feature("autodoc", "	:param PD:
	:type PD: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: bool
") IsAnalys;
		Standard_Boolean IsAnalys (const Handle_StepBasic_ProductDefinitionFormation & PD);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param Prod:
	:type Prod: Handle_StepBasic_Product &
	:rtype: Handle_StepFEA_FeaModel
") FeaModel;
		Handle_StepFEA_FeaModel FeaModel (const Handle_StepBasic_Product & Prod);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param PDF:
	:type PDF: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: Handle_StepFEA_FeaModel
") FeaModel;
		Handle_StepFEA_FeaModel FeaModel (const Handle_StepBasic_ProductDefinitionFormation & PDF);
		%feature("compactdefaultargs") GetFeaAxis2Placement3d;
		%feature("autodoc", "	:param theFeaModel:
	:type theFeaModel: Handle_StepFEA_FeaModel &
	:rtype: Handle_StepFEA_FeaAxis2Placement3d
") GetFeaAxis2Placement3d;
		Handle_StepFEA_FeaAxis2Placement3d GetFeaAxis2Placement3d (const Handle_StepFEA_FeaModel & theFeaModel);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param Prod:
	:type Prod: Handle_StepBasic_Product &
	:rtype: Handle_StepShape_ShapeRepresentation
") IdealShape;
		Handle_StepShape_ShapeRepresentation IdealShape (const Handle_StepBasic_Product & Prod);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param PDF:
	:type PDF: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: Handle_StepShape_ShapeRepresentation
") IdealShape;
		Handle_StepShape_ShapeRepresentation IdealShape (const Handle_StepBasic_ProductDefinitionFormation & PDF);
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "	:param Prod:
	:type Prod: Handle_StepBasic_Product &
	:rtype: Handle_StepShape_ShapeRepresentation
") NominShape;
		Handle_StepShape_ShapeRepresentation NominShape (const Handle_StepBasic_Product & Prod);
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "	:param PDF:
	:type PDF: Handle_StepBasic_ProductDefinitionFormation &
	:rtype: Handle_StepShape_ShapeRepresentation
") NominShape;
		Handle_StepShape_ShapeRepresentation NominShape (const Handle_StepBasic_ProductDefinitionFormation & PDF);
		%feature("compactdefaultargs") GetElementMaterial;
		%feature("autodoc", "	:rtype: Handle_StepElement_HSequenceOfElementMaterial
") GetElementMaterial;
		Handle_StepElement_HSequenceOfElementMaterial GetElementMaterial ();
		%feature("compactdefaultargs") GetElemGeomRelat;
		%feature("autodoc", "	:rtype: Handle_StepFEA_HSequenceOfElementGeometricRelationship
") GetElemGeomRelat;
		Handle_StepFEA_HSequenceOfElementGeometricRelationship GetElemGeomRelat ();
		%feature("compactdefaultargs") GetElements1D;
		%feature("autodoc", "	:param theFeaModel:
	:type theFeaModel: Handle_StepFEA_FeaModel &
	:rtype: Handle_StepFEA_HSequenceOfElementRepresentation
") GetElements1D;
		Handle_StepFEA_HSequenceOfElementRepresentation GetElements1D (const Handle_StepFEA_FeaModel & theFeaModel);
		%feature("compactdefaultargs") GetElements2D;
		%feature("autodoc", "	:param theFEAModel:
	:type theFEAModel: Handle_StepFEA_FeaModel &
	:rtype: Handle_StepFEA_HSequenceOfElementRepresentation
") GetElements2D;
		Handle_StepFEA_HSequenceOfElementRepresentation GetElements2D (const Handle_StepFEA_FeaModel & theFEAModel);
		%feature("compactdefaultargs") GetElements3D;
		%feature("autodoc", "	:param theFEAModel:
	:type theFEAModel: Handle_StepFEA_FeaModel &
	:rtype: Handle_StepFEA_HSequenceOfElementRepresentation
") GetElements3D;
		Handle_StepFEA_HSequenceOfElementRepresentation GetElements3D (const Handle_StepFEA_FeaModel & theFEAModel);
		%feature("compactdefaultargs") GetCurElemSection;
		%feature("autodoc", "	* Getting list of curve_element_section_definitions for given element_representation

	:param ElemRepr:
	:type ElemRepr: Handle_StepFEA_Curve3dElementRepresentation &
	:rtype: Handle_StepElement_HSequenceOfCurveElementSectionDefinition
") GetCurElemSection;
		Handle_StepElement_HSequenceOfCurveElementSectionDefinition GetCurElemSection (const Handle_StepFEA_Curve3dElementRepresentation & ElemRepr);
		%feature("compactdefaultargs") GetShReprForElem;
		%feature("autodoc", "	:param ElemRepr:
	:type ElemRepr: Handle_StepFEA_ElementRepresentation &
	:rtype: Handle_StepShape_ShapeRepresentation
") GetShReprForElem;
		Handle_StepShape_ShapeRepresentation GetShReprForElem (const Handle_StepFEA_ElementRepresentation & ElemRepr);
		%feature("compactdefaultargs") CreateAnalysStructure;
		%feature("autodoc", "	* Create empty structure for idealized_analysis_shape

	:param Prod:
	:type Prod: Handle_StepBasic_Product &
	:rtype: bool
") CreateAnalysStructure;
		Standard_Boolean CreateAnalysStructure (const Handle_StepBasic_Product & Prod);
		%feature("compactdefaultargs") CreateFeaStructure;
		%feature("autodoc", "	* Create fea structure

	:param Prod:
	:type Prod: Handle_StepBasic_Product &
	:rtype: bool
") CreateFeaStructure;
		Standard_Boolean CreateFeaStructure (const Handle_StepBasic_Product & Prod);
		%feature("compactdefaultargs") ReplaceCcDesingToApplied;
		%feature("autodoc", "	* Put into model entities Applied... for AP209 instead of entities CcDesing... from AP203.

	:rtype: bool
") ReplaceCcDesingToApplied;
		Standard_Boolean ReplaceCcDesingToApplied ();
		%feature("compactdefaultargs") CreateAddingEntities;
		%feature("autodoc", "	* Create approval.. , date.. , time.. , person.. and organization.. entities for analysis structure

	:param AnaPD:
	:type AnaPD: Handle_StepBasic_ProductDefinition &
	:rtype: bool
") CreateAddingEntities;
		Standard_Boolean CreateAddingEntities (const Handle_StepBasic_ProductDefinition & AnaPD);
		%feature("compactdefaultargs") CreateAP203Structure;
		%feature("autodoc", "	* Create AP203 structure from existing AP209 structure

	:rtype: Handle_StepData_StepModel
") CreateAP203Structure;
		Handle_StepData_StepModel CreateAP203Structure ();
		%feature("compactdefaultargs") CreateAdding203Entities;
		%feature("autodoc", "	* Create approval.. , date.. , time.. , person.. and organization.. entities for 203 structure

	:param PD:
	:type PD: Handle_StepBasic_ProductDefinition &
	:param aModel:
	:type aModel: Handle_StepData_StepModel &
	:rtype: bool
") CreateAdding203Entities;
		Standard_Boolean CreateAdding203Entities (const Handle_StepBasic_ProductDefinition & PD,Handle_StepData_StepModel & aModel);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param PDS:
	:type PDS: Handle_StepRepr_ProductDefinitionShape &
	:rtype: Handle_StepFEA_FeaModel
") FeaModel;
		Handle_StepFEA_FeaModel FeaModel (const Handle_StepRepr_ProductDefinitionShape & PDS);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param PD:
	:type PD: Handle_StepBasic_ProductDefinition &
	:rtype: Handle_StepFEA_FeaModel
") FeaModel;
		Handle_StepFEA_FeaModel FeaModel (const Handle_StepBasic_ProductDefinition & PD);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param PD:
	:type PD: Handle_StepBasic_ProductDefinition &
	:rtype: Handle_StepShape_ShapeRepresentation
") IdealShape;
		Handle_StepShape_ShapeRepresentation IdealShape (const Handle_StepBasic_ProductDefinition & PD);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param PDS:
	:type PDS: Handle_StepRepr_ProductDefinitionShape &
	:rtype: Handle_StepShape_ShapeRepresentation
") IdealShape;
		Handle_StepShape_ShapeRepresentation IdealShape (const Handle_StepRepr_ProductDefinitionShape & PDS);
};


%extend StepAP209_Construct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
