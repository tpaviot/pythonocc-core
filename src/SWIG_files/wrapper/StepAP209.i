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
%define STEPAP209DOCSTRING
"StepAP209 module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepap209.html"
%enddef
%module (package="OCC.Core", docstring=STEPAP209DOCSTRING) StepAP209


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
#include<StepAP209_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<STEPConstruct_module.hxx>
#include<XSControl_module.hxx>
#include<StepData_module.hxx>
#include<StepBasic_module.hxx>
#include<StepFEA_module.hxx>
#include<StepRepr_module.hxx>
#include<StepElement_module.hxx>
#include<StepShape_module.hxx>
#include<Message_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<Geom2d_module.hxx>
#include<StepVisual_module.hxx>
#include<IFSelect_module.hxx>
#include<StepAP203_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<Interface_module.hxx>
#include<Transfer_module.hxx>
#include<TopTools_module.hxx>
#include<Quantity_module.hxx>
#include<TopLoc_module.hxx>
#include<StepRepr_module.hxx>
#include<StepData_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import STEPConstruct.i
%import XSControl.i
%import StepData.i
%import StepBasic.i
%import StepFEA.i
%import StepRepr.i
%import StepElement.i
%import StepShape.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class StepAP209_Construct *
****************************/
class StepAP209_Construct : public STEPConstruct_Tool {
	public:
		/****************** StepAP209_Construct ******************/
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "Creates an empty tool.

Returns
-------
None
") StepAP209_Construct;
		 StepAP209_Construct();

		/****************** StepAP209_Construct ******************/
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "Creates a tool and initializes it.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") StepAP209_Construct;
		 StepAP209_Construct(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** CreateAP203Structure ******************/
		%feature("compactdefaultargs") CreateAP203Structure;
		%feature("autodoc", "Create ap203 structure from existing ap209 structure.

Returns
-------
opencascade::handle<StepData_StepModel>
") CreateAP203Structure;
		opencascade::handle<StepData_StepModel> CreateAP203Structure();

		/****************** CreateAdding203Entities ******************/
		%feature("compactdefaultargs") CreateAdding203Entities;
		%feature("autodoc", "Create approval.. , date.. , time.. , person.. and organization.. entities for 203 structure.

Parameters
----------
PD: StepBasic_ProductDefinition
aModel: StepData_StepModel

Returns
-------
bool
") CreateAdding203Entities;
		Standard_Boolean CreateAdding203Entities(const opencascade::handle<StepBasic_ProductDefinition> & PD, opencascade::handle<StepData_StepModel> & aModel);

		/****************** CreateAddingEntities ******************/
		%feature("compactdefaultargs") CreateAddingEntities;
		%feature("autodoc", "Create approval.. , date.. , time.. , person.. and organization.. entities for analysis structure.

Parameters
----------
AnaPD: StepBasic_ProductDefinition

Returns
-------
bool
") CreateAddingEntities;
		Standard_Boolean CreateAddingEntities(const opencascade::handle<StepBasic_ProductDefinition> & AnaPD);

		/****************** CreateAnalysStructure ******************/
		%feature("compactdefaultargs") CreateAnalysStructure;
		%feature("autodoc", "Create empty structure for idealized_analysis_shape.

Parameters
----------
Prod: StepBasic_Product

Returns
-------
bool
") CreateAnalysStructure;
		Standard_Boolean CreateAnalysStructure(const opencascade::handle<StepBasic_Product> & Prod);

		/****************** CreateFeaStructure ******************/
		%feature("compactdefaultargs") CreateFeaStructure;
		%feature("autodoc", "Create fea structure.

Parameters
----------
Prod: StepBasic_Product

Returns
-------
bool
") CreateFeaStructure;
		Standard_Boolean CreateFeaStructure(const opencascade::handle<StepBasic_Product> & Prod);

		/****************** FeaModel ******************/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
Prod: StepBasic_Product

Returns
-------
opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepBasic_Product> & Prod);

		/****************** FeaModel ******************/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
PDF: StepBasic_ProductDefinitionFormation

Returns
-------
opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);

		/****************** FeaModel ******************/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
PDS: StepRepr_ProductDefinitionShape

Returns
-------
opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepRepr_ProductDefinitionShape> & PDS);

		/****************** FeaModel ******************/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
PD: StepBasic_ProductDefinition

Returns
-------
opencascade::handle<StepFEA_FeaModel>
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepBasic_ProductDefinition> & PD);

		/****************** GetCurElemSection ******************/
		%feature("compactdefaultargs") GetCurElemSection;
		%feature("autodoc", "Getting list of curve_element_section_definitions for given element_representation.

Parameters
----------
ElemRepr: StepFEA_Curve3dElementRepresentation

Returns
-------
opencascade::handle<StepElement_HSequenceOfCurveElementSectionDefinition>
") GetCurElemSection;
		opencascade::handle<StepElement_HSequenceOfCurveElementSectionDefinition> GetCurElemSection(const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ElemRepr);

		/****************** GetElemGeomRelat ******************/
		%feature("compactdefaultargs") GetElemGeomRelat;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepFEA_HSequenceOfElementGeometricRelationship>
") GetElemGeomRelat;
		opencascade::handle<StepFEA_HSequenceOfElementGeometricRelationship> GetElemGeomRelat();

		/****************** GetElementMaterial ******************/
		%feature("compactdefaultargs") GetElementMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<StepElement_HSequenceOfElementMaterial>
") GetElementMaterial;
		opencascade::handle<StepElement_HSequenceOfElementMaterial> GetElementMaterial();

		/****************** GetElements1D ******************/
		%feature("compactdefaultargs") GetElements1D;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFeaModel: StepFEA_FeaModel

Returns
-------
opencascade::handle<StepFEA_HSequenceOfElementRepresentation>
") GetElements1D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements1D(const opencascade::handle<StepFEA_FeaModel> & theFeaModel);

		/****************** GetElements2D ******************/
		%feature("compactdefaultargs") GetElements2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFEAModel: StepFEA_FeaModel

Returns
-------
opencascade::handle<StepFEA_HSequenceOfElementRepresentation>
") GetElements2D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements2D(const opencascade::handle<StepFEA_FeaModel> & theFEAModel);

		/****************** GetElements3D ******************/
		%feature("compactdefaultargs") GetElements3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFEAModel: StepFEA_FeaModel

Returns
-------
opencascade::handle<StepFEA_HSequenceOfElementRepresentation>
") GetElements3D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements3D(const opencascade::handle<StepFEA_FeaModel> & theFEAModel);

		/****************** GetFeaAxis2Placement3d ******************/
		%feature("compactdefaultargs") GetFeaAxis2Placement3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFeaModel: StepFEA_FeaModel

Returns
-------
opencascade::handle<StepFEA_FeaAxis2Placement3d>
") GetFeaAxis2Placement3d;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> GetFeaAxis2Placement3d(const opencascade::handle<StepFEA_FeaModel> & theFeaModel);

		/****************** GetShReprForElem ******************/
		%feature("compactdefaultargs") GetShReprForElem;
		%feature("autodoc", "No available documentation.

Parameters
----------
ElemRepr: StepFEA_ElementRepresentation

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") GetShReprForElem;
		opencascade::handle<StepShape_ShapeRepresentation> GetShReprForElem(const opencascade::handle<StepFEA_ElementRepresentation> & ElemRepr);

		/****************** IdealShape ******************/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
Prod: StepBasic_Product

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepBasic_Product> & Prod);

		/****************** IdealShape ******************/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
PDF: StepBasic_ProductDefinitionFormation

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);

		/****************** IdealShape ******************/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
PD: StepBasic_ProductDefinition

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepBasic_ProductDefinition> & PD);

		/****************** IdealShape ******************/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
PDS: StepRepr_ProductDefinitionShape

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepRepr_ProductDefinitionShape> & PDS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes tool; returns true if succeeded.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
bool
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** IsAnalys ******************/
		%feature("compactdefaultargs") IsAnalys;
		%feature("autodoc", "No available documentation.

Parameters
----------
PD: StepBasic_ProductDefinitionFormation

Returns
-------
bool
") IsAnalys;
		Standard_Boolean IsAnalys(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);

		/****************** IsDesing ******************/
		%feature("compactdefaultargs") IsDesing;
		%feature("autodoc", "No available documentation.

Parameters
----------
PD: StepBasic_ProductDefinitionFormation

Returns
-------
bool
") IsDesing;
		Standard_Boolean IsDesing(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);

		/****************** NominShape ******************/
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
Prod: StepBasic_Product

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") NominShape;
		opencascade::handle<StepShape_ShapeRepresentation> NominShape(const opencascade::handle<StepBasic_Product> & Prod);

		/****************** NominShape ******************/
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
PDF: StepBasic_ProductDefinitionFormation

Returns
-------
opencascade::handle<StepShape_ShapeRepresentation>
") NominShape;
		opencascade::handle<StepShape_ShapeRepresentation> NominShape(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);

		/****************** ReplaceCcDesingToApplied ******************/
		%feature("compactdefaultargs") ReplaceCcDesingToApplied;
		%feature("autodoc", "Put into model entities applied... for ap209 instead of entities ccdesing... from ap203.

Returns
-------
bool
") ReplaceCcDesingToApplied;
		Standard_Boolean ReplaceCcDesingToApplied();

};


%extend StepAP209_Construct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
