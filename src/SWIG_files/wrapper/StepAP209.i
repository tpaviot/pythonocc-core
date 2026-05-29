/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepap209.html"
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
#include<Aspect_module.hxx>
#include<Graphic3d_module.hxx>
#include<Media_module.hxx>
#include<StepElement_module.hxx>
#include<TDataStd_module.hxx>
#include<XCAFDimTolObjects_module.hxx>
#include<XCAFDoc_module.hxx>
#include<XCAFNoteObjects_module.hxx>
#include<XCAFView_module.hxx>
#include<Bnd_module.hxx>
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
		/****** md5 signature: fe6ad6218dc12a83d0358b6853ba08f3 ******/
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
		bool CreateAdding203Entities(const opencascade::handle<StepBasic_ProductDefinition> & PD, opencascade::handle<StepData_StepModel> & aModel);

		/****** StepAP209_Construct::CreateAddingEntities ******/
		/****** md5 signature: 82fa8c04dd232979aecb73571a239eff ******/
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
		bool CreateAddingEntities(const opencascade::handle<StepBasic_ProductDefinition> & AnaPD);

		/****** StepAP209_Construct::CreateAnalysStructure ******/
		/****** md5 signature: 64a3893c56f2d4ff5d576a37134fe302 ******/
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
		bool CreateAnalysStructure(const opencascade::handle<StepBasic_Product> & Prod);

		/****** StepAP209_Construct::CreateFeaStructure ******/
		/****** md5 signature: c29f50198cc6a546fbfbe988f49b93bb ******/
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
		bool CreateFeaStructure(const opencascade::handle<StepBasic_Product> & Prod);

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
		/****** md5 signature: c094cb034ec456c136f70e46d74587a2 ******/
		%feature("compactdefaultargs") GetCurElemSection;
		%feature("autodoc", "
Parameters
----------
ElemRepr: StepFEA_Curve3dElementRepresentation

Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>>

Description
-----------
Getting list of curve_element_section_definitions for given element_representation.
") GetCurElemSection;
		opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_CurveElementSectionDefinition>>> GetCurElemSection(const opencascade::handle<StepFEA_Curve3dElementRepresentation> & ElemRepr);

		/****** StepAP209_Construct::GetElemGeomRelat ******/
		/****** md5 signature: 4b911c9402ac712e73f7e960696dbb16 ******/
		%feature("compactdefaultargs") GetElemGeomRelat;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementGeometricRelationship>>>

Description
-----------
No available documentation.
") GetElemGeomRelat;
		opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementGeometricRelationship>>> GetElemGeomRelat();

		/****** StepAP209_Construct::GetElementMaterial ******/
		/****** md5 signature: 83174d7bd78439c48aceed3d2b435e6a ******/
		%feature("compactdefaultargs") GetElementMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_ElementMaterial>>>

Description
-----------
No available documentation.
") GetElementMaterial;
		opencascade::handle<NCollection_HSequence<opencascade::handle<StepElement_ElementMaterial>>> GetElementMaterial();

		/****** StepAP209_Construct::GetElements1D ******/
		/****** md5 signature: d734a918be4e1acde26e90eda73dc5c6 ******/
		%feature("compactdefaultargs") GetElements1D;
		%feature("autodoc", "
Parameters
----------
theFeaModel: StepFEA_FeaModel

Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementRepresentation>>>

Description
-----------
No available documentation.
") GetElements1D;
		opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementRepresentation>>> GetElements1D(const opencascade::handle<StepFEA_FeaModel> & theFeaModel);

		/****** StepAP209_Construct::GetElements2D ******/
		/****** md5 signature: 5f22cf08035eed734c1678541bf60ef8 ******/
		%feature("compactdefaultargs") GetElements2D;
		%feature("autodoc", "
Parameters
----------
theFEAModel: StepFEA_FeaModel

Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementRepresentation>>>

Description
-----------
No available documentation.
") GetElements2D;
		opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementRepresentation>>> GetElements2D(const opencascade::handle<StepFEA_FeaModel> & theFEAModel);

		/****** StepAP209_Construct::GetElements3D ******/
		/****** md5 signature: 93ae7cfdf6f6dce29b29623acdc5701d ******/
		%feature("compactdefaultargs") GetElements3D;
		%feature("autodoc", "
Parameters
----------
theFEAModel: StepFEA_FeaModel

Return
-------
opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementRepresentation>>>

Description
-----------
No available documentation.
") GetElements3D;
		opencascade::handle<NCollection_HSequence<opencascade::handle<StepFEA_ElementRepresentation>>> GetElements3D(const opencascade::handle<StepFEA_FeaModel> & theFEAModel);

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
		/****** md5 signature: 35c009f0bb66a209b4fd16f98bf3d766 ******/
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
		bool Init(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** StepAP209_Construct::IsAnalys ******/
		/****** md5 signature: 9335ca7ea0bc76704c698a1ea188cc84 ******/
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
		bool IsAnalys(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);

		/****** StepAP209_Construct::IsDesing ******/
		/****** md5 signature: 1d3f7cc75a0bcc14ee7e1736ed6a1db9 ******/
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
		bool IsDesing(const opencascade::handle<StepBasic_ProductDefinitionFormation> & PD);

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
		/****** md5 signature: a7754c62e9e2d7b452e4bfa96a830087 ******/
		%feature("compactdefaultargs") ReplaceCcDesingToApplied;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Put into model entities Applied... for AP209 instead of entities CcDesing... from AP203.
") ReplaceCcDesingToApplied;
		bool ReplaceCcDesingToApplied();

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
