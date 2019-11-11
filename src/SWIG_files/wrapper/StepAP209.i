/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define STEPAP209DOCSTRING
"StepAP209 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_StepAP209.html"
%enddef
%module (package="OCC.Core", docstring=STEPAP209DOCSTRING) StepAP209

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include StepAP209_headers.i

/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%nodefaultctor StepAP209_Construct;
class StepAP209_Construct : public STEPConstruct_Tool {
	public:
		%feature("compactdefaultargs") CreateAP203Structure;
		%feature("autodoc", "	* Create AP203 structure from existing AP209 structure

	:rtype: opencascade::handle<StepData_StepModel>
") CreateAP203Structure;
		opencascade::handle<StepData_StepModel> CreateAP203Structure ();
		%feature("compactdefaultargs") CreateAdding203Entities;
		%feature("autodoc", "	* Create approval.. , date.. , time.. , person.. and organization.. entities for 203 structure

	:param PD:
	:type PD: opencascade::handle<StepBasic_ProductDefinition> &
	:param aModel:
	:type aModel: opencascade::handle<StepData_StepModel> &
	:rtype: bool
") CreateAdding203Entities;
		Standard_Boolean CreateAdding203Entities (const opencascade::handle<StepBasic_ProductDefinition> & PD,opencascade::handle<StepData_StepModel> & aModel);
		%feature("compactdefaultargs") CreateAddingEntities;
		%feature("autodoc", "	* Create approval.. , date.. , time.. , person.. and organization.. entities for analysis structure

	:param AnaPD:
	:type AnaPD: opencascade::handle<StepBasic_ProductDefinition> &
	:rtype: bool
") CreateAddingEntities;
		Standard_Boolean CreateAddingEntities (const opencascade::handle<StepBasic_ProductDefinition> & AnaPD);
		%feature("compactdefaultargs") CreateAnalysStructure;
		%feature("autodoc", "	* Create empty structure for idealized_analysis_shape

	:param Prod:
	:type Prod: opencascade::handle<StepBasic_Product> &
	:rtype: bool
") CreateAnalysStructure;
		Standard_Boolean CreateAnalysStructure (const opencascade::handle<StepBasic_Product> & Prod);
		%feature("compactdefaultargs") CreateFeaStructure;
		%feature("autodoc", "	* Create fea structure

	:param Prod:
	:type Prod: opencascade::handle<StepBasic_Product> &
	:rtype: bool
") CreateFeaStructure;
		Standard_Boolean CreateFeaStructure (const opencascade::handle<StepBasic_Product> & Prod);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param Prod:
	:type Prod: opencascade::handle<StepBasic_Product> &
	:rtype: opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel (const opencascade::handle<StepBasic_Product> & Prod);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param PDF:
	:type PDF: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel (const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param PDS:
	:type PDS: opencascade::handle<StepRepr_ProductDefinitionShape> &
	:rtype: opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel (const opencascade::handle<StepRepr_ProductDefinitionShape> & PDS);
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "	:param PD:
	:type PD: opencascade::handle<StepBasic_ProductDefinition> &
	:rtype: opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel (const opencascade::handle<StepBasic_ProductDefinition> & PD);
		%feature("compactdefaultargs") GetCurElemSection;
		%feature("autodoc", "	* Getting list of curve_element_section_definitions for given element_representation

	:param ElemRepr:
	:type ElemRepr: opencascade::handle<StepFEA_Curve3dElementRepresentation> &
	:rtype: opencascade::handle<StepElement_HSequenceOfCurveElementSectionDefinition>
") GetCurElemSection;
		opencascade::handle<StepElement_HSequenceOfCurveElementSectionDefinition> GetCurElemSection (const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ElemRepr);
		%feature("compactdefaultargs") GetElemGeomRelat;
		%feature("autodoc", "	:rtype: opencascade::handle<StepFEA_HSequenceOfElementGeometricRelationship>
") GetElemGeomRelat;
		opencascade::handle<StepFEA_HSequenceOfElementGeometricRelationship> GetElemGeomRelat ();
		%feature("compactdefaultargs") GetElementMaterial;
		%feature("autodoc", "	:rtype: opencascade::handle<StepElement_HSequenceOfElementMaterial>
") GetElementMaterial;
		opencascade::handle<StepElement_HSequenceOfElementMaterial> GetElementMaterial ();
		%feature("compactdefaultargs") GetElements1D;
		%feature("autodoc", "	:param theFeaModel:
	:type theFeaModel: opencascade::handle<StepFEA_FeaModel> &
	:rtype: opencascade::handle<StepFEA_HSequenceOfElementRepresentation>
") GetElements1D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements1D (const opencascade::handle<StepFEA_FeaModel> & theFeaModel);
		%feature("compactdefaultargs") GetElements2D;
		%feature("autodoc", "	:param theFEAModel:
	:type theFEAModel: opencascade::handle<StepFEA_FeaModel> &
	:rtype: opencascade::handle<StepFEA_HSequenceOfElementRepresentation>
") GetElements2D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements2D (const opencascade::handle<StepFEA_FeaModel> & theFEAModel);
		%feature("compactdefaultargs") GetElements3D;
		%feature("autodoc", "	:param theFEAModel:
	:type theFEAModel: opencascade::handle<StepFEA_FeaModel> &
	:rtype: opencascade::handle<StepFEA_HSequenceOfElementRepresentation>
") GetElements3D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements3D (const opencascade::handle<StepFEA_FeaModel> & theFEAModel);
		%feature("compactdefaultargs") GetFeaAxis2Placement3d;
		%feature("autodoc", "	:param theFeaModel:
	:type theFeaModel: opencascade::handle<StepFEA_FeaModel> &
	:rtype: opencascade::handle<StepFEA_FeaAxis2Placement3d>
") GetFeaAxis2Placement3d;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> GetFeaAxis2Placement3d (const opencascade::handle<StepFEA_FeaModel> & theFeaModel);
		%feature("compactdefaultargs") GetShReprForElem;
		%feature("autodoc", "	:param ElemRepr:
	:type ElemRepr: opencascade::handle<StepFEA_ElementRepresentation> &
	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") GetShReprForElem;
		opencascade::handle<StepShape_ShapeRepresentation> GetShReprForElem (const opencascade::handle<StepFEA_ElementRepresentation> & ElemRepr);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param Prod:
	:type Prod: opencascade::handle<StepBasic_Product> &
	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape (const opencascade::handle<StepBasic_Product> & Prod);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param PDF:
	:type PDF: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape (const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param PD:
	:type PD: opencascade::handle<StepBasic_ProductDefinition> &
	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape (const opencascade::handle<StepBasic_ProductDefinition> & PD);
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "	:param PDS:
	:type PDS: opencascade::handle<StepRepr_ProductDefinitionShape> &
	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape (const opencascade::handle<StepRepr_ProductDefinitionShape> & PDS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes tool; returns True if succeeded

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: bool
") Init;
		Standard_Boolean Init (const opencascade::handle<XSControl_WorkSession> & WS);
		%feature("compactdefaultargs") IsAnalys;
		%feature("autodoc", "	:param PD:
	:type PD: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: bool
") IsAnalys;
		Standard_Boolean IsAnalys (const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);
		%feature("compactdefaultargs") IsDesing;
		%feature("autodoc", "	:param PD:
	:type PD: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: bool
") IsDesing;
		Standard_Boolean IsDesing (const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "	:param Prod:
	:type Prod: opencascade::handle<StepBasic_Product> &
	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") NominShape;
		opencascade::handle<StepShape_ShapeRepresentation> NominShape (const opencascade::handle<StepBasic_Product> & Prod);
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "	:param PDF:
	:type PDF: opencascade::handle<StepBasic_ProductDefinitionFormation> &
	:rtype: opencascade::handle<StepShape_ShapeRepresentation>
") NominShape;
		opencascade::handle<StepShape_ShapeRepresentation> NominShape (const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);
		%feature("compactdefaultargs") ReplaceCcDesingToApplied;
		%feature("autodoc", "	* Put into model entities Applied... for AP209 instead of entities CcDesing... from AP203.

	:rtype: bool
") ReplaceCcDesingToApplied;
		Standard_Boolean ReplaceCcDesingToApplied ();
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") StepAP209_Construct;
		 StepAP209_Construct ();
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "	* Creates a tool and initializes it

	:param WS:
	:type WS: opencascade::handle<XSControl_WorkSession> &
	:rtype: None
") StepAP209_Construct;
		 StepAP209_Construct (const opencascade::handle<XSControl_WorkSession> & WS);
};


%extend StepAP209_Construct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
