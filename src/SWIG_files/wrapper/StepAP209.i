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
%define STEPAP209DOCSTRING
"StepAP209 module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepap209.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Resource_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<DE_module.hxx>
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
		/****** StepAP209_Construct::StepAP209_Construct ******/
		/****** md5 signature: 8f41a84f5e08ad5b483b9c150d30d75e ******/
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty tool.
") StepAP209_Construct;
		 StepAP209_Construct();

		/****** StepAP209_Construct::StepAP209_Construct ******/
		/****** md5 signature: a676c3bf6dd11a17cd377621dde3abc7 ******/
		%feature("compactdefaultargs") StepAP209_Construct;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
Creates a tool and initializes it.
") StepAP209_Construct;
		 StepAP209_Construct(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** StepAP209_Construct::CreateAP203Structure ******/
		/****** md5 signature: 1b20fd2ff46711cab1986a4298e69f0f ******/
		%feature("compactdefaultargs") CreateAP203Structure;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_StepModel>

Description
-----------
Create AP203 structure from existing AP209 structure.
") CreateAP203Structure;
		opencascade::handle<StepData_StepModel> CreateAP203Structure();

		/****** StepAP209_Construct::CreateAdding203Entities ******/
		/****** md5 signature: 16d487d4c0b00005c1f486f3c3168055 ******/
		%feature("compactdefaultargs") CreateAdding203Entities;
		%feature("autodoc", "
Parameters
----------
PD: StepBasic_ProductDefinition
aModel: StepData_StepModel

Return
-------
bool

Description
-----------
Create approval.. , date.. , time.. , person.. and organization.. entities for 203 structure.
") CreateAdding203Entities;
		Standard_Boolean CreateAdding203Entities(const opencascade::handle<StepBasic_ProductDefinition> & PD, opencascade::handle<StepData_StepModel> & aModel);

		/****** StepAP209_Construct::CreateAddingEntities ******/
		/****** md5 signature: 379899097279dcaaad6c25583d5ad322 ******/
		%feature("compactdefaultargs") CreateAddingEntities;
		%feature("autodoc", "
Parameters
----------
AnaPD: StepBasic_ProductDefinition

Return
-------
bool

Description
-----------
Create approval.. , date.. , time.. , person.. and organization.. entities for analysis structure.
") CreateAddingEntities;
		Standard_Boolean CreateAddingEntities(const opencascade::handle<StepBasic_ProductDefinition> & AnaPD);

		/****** StepAP209_Construct::CreateAnalysStructure ******/
		/****** md5 signature: 2a1fa63576e9f3f65c0c020012b2c9bf ******/
		%feature("compactdefaultargs") CreateAnalysStructure;
		%feature("autodoc", "
Parameters
----------
Prod: StepBasic_Product

Return
-------
bool

Description
-----------
Create empty structure for idealized_analysis_shape.
") CreateAnalysStructure;
		Standard_Boolean CreateAnalysStructure(const opencascade::handle<StepBasic_Product> & Prod);

		/****** StepAP209_Construct::CreateFeaStructure ******/
		/****** md5 signature: ad3da0a69c813807ea9008ad6a3bf20e ******/
		%feature("compactdefaultargs") CreateFeaStructure;
		%feature("autodoc", "
Parameters
----------
Prod: StepBasic_Product

Return
-------
bool

Description
-----------
Create fea structure.
") CreateFeaStructure;
		Standard_Boolean CreateFeaStructure(const opencascade::handle<StepBasic_Product> & Prod);

		/****** StepAP209_Construct::FeaModel ******/
		/****** md5 signature: 271a7fbfb305174123bc442e095c38de ******/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "
Parameters
----------
Prod: StepBasic_Product

Return
-------
opencascade::handle<StepFEA_FeaModel>

Description
-----------
No available documentation.
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepBasic_Product> & Prod);

		/****** StepAP209_Construct::FeaModel ******/
		/****** md5 signature: 10c8021f2717f7ff444c352b307d80c3 ******/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "
Parameters
----------
PDF: StepBasic_ProductDefinitionFormation

Return
-------
opencascade::handle<StepFEA_FeaModel>

Description
-----------
No available documentation.
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);

		/****** StepAP209_Construct::FeaModel ******/
		/****** md5 signature: caf4a32c8d4fcbbc702ef4826a47c4d9 ******/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "
Parameters
----------
PDS: StepRepr_ProductDefinitionShape

Return
-------
opencascade::handle<StepFEA_FeaModel>

Description
-----------
No available documentation.
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepRepr_ProductDefinitionShape> & PDS);

		/****** StepAP209_Construct::FeaModel ******/
		/****** md5 signature: f2216534d6ba99da86c23861ee7a5ba3 ******/
		%feature("compactdefaultargs") FeaModel;
		%feature("autodoc", "
Parameters
----------
PD: StepBasic_ProductDefinition

Return
-------
opencascade::handle<StepFEA_FeaModel>

Description
-----------
No available documentation.
") FeaModel;
		opencascade::handle<StepFEA_FeaModel> FeaModel(const opencascade::handle<StepBasic_ProductDefinition> & PD);

		/****** StepAP209_Construct::GetCurElemSection ******/
		/****** md5 signature: 8793f65138268728a25836f15f5ec56b ******/
		%feature("compactdefaultargs") GetCurElemSection;
		%feature("autodoc", "
Parameters
----------
ElemRepr: StepFEA_Curve3dElementRepresentation

Return
-------
opencascade::handle<StepElement_HSequenceOfCurveElementSectionDefinition>

Description
-----------
Getting list of curve_element_section_definitions for given element_representation.
") GetCurElemSection;
		opencascade::handle<StepElement_HSequenceOfCurveElementSectionDefinition> GetCurElemSection(const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ElemRepr);

		/****** StepAP209_Construct::GetElemGeomRelat ******/
		/****** md5 signature: 9738449537adf9d384dce098a07a38ce ******/
		%feature("compactdefaultargs") GetElemGeomRelat;
		%feature("autodoc", "Return
-------
opencascade::handle<StepFEA_HSequenceOfElementGeometricRelationship>

Description
-----------
No available documentation.
") GetElemGeomRelat;
		opencascade::handle<StepFEA_HSequenceOfElementGeometricRelationship> GetElemGeomRelat();

		/****** StepAP209_Construct::GetElementMaterial ******/
		/****** md5 signature: 7f853ea5550eeb8bf9673fca41433180 ******/
		%feature("compactdefaultargs") GetElementMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<StepElement_HSequenceOfElementMaterial>

Description
-----------
No available documentation.
") GetElementMaterial;
		opencascade::handle<StepElement_HSequenceOfElementMaterial> GetElementMaterial();

		/****** StepAP209_Construct::GetElements1D ******/
		/****** md5 signature: 39dfd133982ccff88de6ce0b77c815ba ******/
		%feature("compactdefaultargs") GetElements1D;
		%feature("autodoc", "
Parameters
----------
theFeaModel: StepFEA_FeaModel

Return
-------
opencascade::handle<StepFEA_HSequenceOfElementRepresentation>

Description
-----------
No available documentation.
") GetElements1D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements1D(const opencascade::handle<StepFEA_FeaModel> & theFeaModel);

		/****** StepAP209_Construct::GetElements2D ******/
		/****** md5 signature: 1bed16a5ca827738c86d0cc795798719 ******/
		%feature("compactdefaultargs") GetElements2D;
		%feature("autodoc", "
Parameters
----------
theFEAModel: StepFEA_FeaModel

Return
-------
opencascade::handle<StepFEA_HSequenceOfElementRepresentation>

Description
-----------
No available documentation.
") GetElements2D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements2D(const opencascade::handle<StepFEA_FeaModel> & theFEAModel);

		/****** StepAP209_Construct::GetElements3D ******/
		/****** md5 signature: 872e1fc86cdc57f90bc4650733b568e4 ******/
		%feature("compactdefaultargs") GetElements3D;
		%feature("autodoc", "
Parameters
----------
theFEAModel: StepFEA_FeaModel

Return
-------
opencascade::handle<StepFEA_HSequenceOfElementRepresentation>

Description
-----------
No available documentation.
") GetElements3D;
		opencascade::handle<StepFEA_HSequenceOfElementRepresentation> GetElements3D(const opencascade::handle<StepFEA_FeaModel> & theFEAModel);

		/****** StepAP209_Construct::GetFeaAxis2Placement3d ******/
		/****** md5 signature: 57f6170698a465f3900024109d196ade ******/
		%feature("compactdefaultargs") GetFeaAxis2Placement3d;
		%feature("autodoc", "
Parameters
----------
theFeaModel: StepFEA_FeaModel

Return
-------
opencascade::handle<StepFEA_FeaAxis2Placement3d>

Description
-----------
No available documentation.
") GetFeaAxis2Placement3d;
		opencascade::handle<StepFEA_FeaAxis2Placement3d> GetFeaAxis2Placement3d(const opencascade::handle<StepFEA_FeaModel> & theFeaModel);

		/****** StepAP209_Construct::GetShReprForElem ******/
		/****** md5 signature: a8b9f7a40a5bf4a8a8b6428f00238f50 ******/
		%feature("compactdefaultargs") GetShReprForElem;
		%feature("autodoc", "
Parameters
----------
ElemRepr: StepFEA_ElementRepresentation

Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
No available documentation.
") GetShReprForElem;
		opencascade::handle<StepShape_ShapeRepresentation> GetShReprForElem(const opencascade::handle<StepFEA_ElementRepresentation> & ElemRepr);

		/****** StepAP209_Construct::IdealShape ******/
		/****** md5 signature: f8ad2ccb2e25c6714a53a406b8e23ed0 ******/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "
Parameters
----------
Prod: StepBasic_Product

Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
No available documentation.
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepBasic_Product> & Prod);

		/****** StepAP209_Construct::IdealShape ******/
		/****** md5 signature: 7367e44e7b62b5a594edf30f4b16af7d ******/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "
Parameters
----------
PDF: StepBasic_ProductDefinitionFormation

Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
No available documentation.
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);

		/****** StepAP209_Construct::IdealShape ******/
		/****** md5 signature: 7d69414cf30b53537915dddb01901591 ******/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "
Parameters
----------
PD: StepBasic_ProductDefinition

Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
No available documentation.
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepBasic_ProductDefinition> & PD);

		/****** StepAP209_Construct::IdealShape ******/
		/****** md5 signature: 5d7feb1f5f15e2889a732091100aeb77 ******/
		%feature("compactdefaultargs") IdealShape;
		%feature("autodoc", "
Parameters
----------
PDS: StepRepr_ProductDefinitionShape

Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
No available documentation.
") IdealShape;
		opencascade::handle<StepShape_ShapeRepresentation> IdealShape(const opencascade::handle<StepRepr_ProductDefinitionShape> & PDS);

		/****** StepAP209_Construct::Init ******/
		/****** md5 signature: a41268d32348bb8b355efce3731d2872 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
bool

Description
-----------
Initializes tool; returns True if succeeded.
") Init;
		Standard_Boolean Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** StepAP209_Construct::IsAnalys ******/
		/****** md5 signature: 96201d035b5e6cfb633e102668f8beaa ******/
		%feature("compactdefaultargs") IsAnalys;
		%feature("autodoc", "
Parameters
----------
PD: StepBasic_ProductDefinitionFormation

Return
-------
bool

Description
-----------
No available documentation.
") IsAnalys;
		Standard_Boolean IsAnalys(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);

		/****** StepAP209_Construct::IsDesing ******/
		/****** md5 signature: 0acd5c43708107040bab82bea1fd3896 ******/
		%feature("compactdefaultargs") IsDesing;
		%feature("autodoc", "
Parameters
----------
PD: StepBasic_ProductDefinitionFormation

Return
-------
bool

Description
-----------
No available documentation.
") IsDesing;
		Standard_Boolean IsDesing(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);

		/****** StepAP209_Construct::NominShape ******/
		/****** md5 signature: 0520c15d7f2b54b3f8365d372679de43 ******/
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "
Parameters
----------
Prod: StepBasic_Product

Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
No available documentation.
") NominShape;
		opencascade::handle<StepShape_ShapeRepresentation> NominShape(const opencascade::handle<StepBasic_Product> & Prod);

		/****** StepAP209_Construct::NominShape ******/
		/****** md5 signature: 6a27eb5304caea41221725131f0fd6ed ******/
		%feature("compactdefaultargs") NominShape;
		%feature("autodoc", "
Parameters
----------
PDF: StepBasic_ProductDefinitionFormation

Return
-------
opencascade::handle<StepShape_ShapeRepresentation>

Description
-----------
No available documentation.
") NominShape;
		opencascade::handle<StepShape_ShapeRepresentation> NominShape(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PDF);

		/****** StepAP209_Construct::ReplaceCcDesingToApplied ******/
		/****** md5 signature: 3871c374ec849b26e0d58ff0a726b27a ******/
		%feature("compactdefaultargs") ReplaceCcDesingToApplied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Put into model entities Applied... for AP209 instead of entities CcDesing... from AP203.
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
/* class aliases */
%pythoncode {
}
