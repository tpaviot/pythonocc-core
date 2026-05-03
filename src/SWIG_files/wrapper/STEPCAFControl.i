/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPCAFCONTROLDOCSTRING
"STEPCAFControl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepcafcontrol.html"
%enddef
%module (package="OCC.Core", docstring=STEPCAFCONTROLDOCSTRING) STEPCAFControl


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
#include<STEPCAFControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<StepShape_module.hxx>
#include<STEPControl_module.hxx>
#include<StepData_module.hxx>
#include<TopoDS_module.hxx>
#include<TDF_module.hxx>
#include<IFSelect_module.hxx>
#include<TCollection_module.hxx>
#include<XSControl_module.hxx>
#include<XCAFDimTolObjects_module.hxx>
#include<StepRepr_module.hxx>
#include<StepDimTol_module.hxx>
#include<StepVisual_module.hxx>
#include<XCAFDoc_module.hxx>
#include<STEPConstruct_module.hxx>
#include<TDocStd_module.hxx>
#include<Message_module.hxx>
#include<DE_module.hxx>
#include<Interface_module.hxx>
#include<TopLoc_module.hxx>
#include<TopTools_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<Message_module.hxx>
#include<Quantity_module.hxx>
#include<StepGeom_module.hxx>
#include<CDM_module.hxx>
#include<StepAP203_module.hxx>
#include<Resource_module.hxx>
#include<StepVisual_module.hxx>
#include<StepData_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<IFSelect_module.hxx>
#include<Transfer_module.hxx>
#include<Resource_module.hxx>
#include<TopLoc_module.hxx>
#include<XCAFView_module.hxx>
#include<XSControl_module.hxx>
#include<StepRepr_module.hxx>
#include<TDataStd_module.hxx>
#include<MoniTool_module.hxx>
#include<Graphic3d_module.hxx>
#include<Bnd_module.hxx>
#include<Aspect_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepBasic.i
%import StepShape.i
%import STEPControl.i
%import StepData.i
%import TopoDS.i
%import TDF.i
%import IFSelect.i
%import TCollection.i
%import XSControl.i
%import XCAFDimTolObjects.i
%import StepRepr.i
%import StepDimTol.i
%import StepVisual.i
%import XCAFDoc.i
%import STEPConstruct.i
%import TDocStd.i
%import Message.i
%import DE.i

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
%wrap_handle(STEPCAFControl_ExternFile)
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<TDF_Label,opencascade::handle<STEPCAFControl_ExternFile>>::Items;
%ignore NCollection_DataMap<TDF_Label,opencascade::handle<STEPCAFControl_ExternFile>>::KeyValues;
%template(STEPCAFControl_DataMapOfLabelExternFile) NCollection_DataMap<TDF_Label,opencascade::handle<STEPCAFControl_ExternFile>>;
%ignore NCollection_DataMap<TDF_Label,TopoDS_Shape>::Items;
%ignore NCollection_DataMap<TDF_Label,TopoDS_Shape>::KeyValues;
%template(STEPCAFControl_DataMapOfLabelShape) NCollection_DataMap<TDF_Label,TopoDS_Shape>;
%ignore NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>,opencascade::handle<STEPCAFControl_ExternFile>>::Items;
%ignore NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>,opencascade::handle<STEPCAFControl_ExternFile>>::KeyValues;
%template(STEPCAFControl_DataMapOfPDExternFile) NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>,opencascade::handle<STEPCAFControl_ExternFile>>;
%ignore NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>,opencascade::handle<STEPCAFControl_ExternFile>>::Items;
%ignore NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>,opencascade::handle<STEPCAFControl_ExternFile>>::KeyValues;
%template(STEPCAFControl_DataMapOfSDRExternFile) NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>,opencascade::handle<STEPCAFControl_ExternFile>>;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepBasic_ProductDefinition>,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepBasic_ProductDefinition>,TopTools_ShapeMapHasher>::KeyValues;
%template(STEPCAFControl_DataMapOfShapePD) NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepBasic_ProductDefinition>,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepShape_ShapeDefinitionRepresentation>,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepShape_ShapeDefinitionRepresentation>,TopTools_ShapeMapHasher>::KeyValues;
%template(STEPCAFControl_DataMapOfShapeSDR) NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepShape_ShapeDefinitionRepresentation>,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TDF_Label, opencascade::handle<STEPCAFControl_ExternFile>>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfLabelExternFile;
typedef NCollection_DataMap<TDF_Label, TopoDS_Shape>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfLabelShape;
typedef NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>, opencascade::handle<STEPCAFControl_ExternFile>>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfPDExternFile;
typedef NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>, opencascade::handle<STEPCAFControl_ExternFile>>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfSDRExternFile;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepBasic_ProductDefinition>, TopTools_ShapeMapHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfShapePD;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepShape_ShapeDefinitionRepresentation>, TopTools_ShapeMapHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfShapeSDR;
typedef NCollection_DataMap<TDF_Label, opencascade::handle<STEPCAFControl_ExternFile>> STEPCAFControl_DataMapOfLabelExternFile;
typedef NCollection_DataMap<TDF_Label, TopoDS_Shape> STEPCAFControl_DataMapOfLabelShape;
typedef NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>, opencascade::handle<STEPCAFControl_ExternFile>> STEPCAFControl_DataMapOfPDExternFile;
typedef NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>, opencascade::handle<STEPCAFControl_ExternFile>> STEPCAFControl_DataMapOfSDRExternFile;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepBasic_ProductDefinition>, TopTools_ShapeMapHasher> STEPCAFControl_DataMapOfShapePD;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepShape_ShapeDefinitionRepresentation>, TopTools_ShapeMapHasher> STEPCAFControl_DataMapOfShapeSDR;
/* end typedefs declaration */

/**********************************
* class STEPCAFControl_ActorWrite *
**********************************/
class STEPCAFControl_ActorWrite : public STEPControl_ActorWrite {
	public:
		/****** STEPCAFControl_ActorWrite::STEPCAFControl_ActorWrite ******/
		/****** md5 signature: 55d2eef5460035edc16a241d250d3133 ******/
		%feature("compactdefaultargs") STEPCAFControl_ActorWrite;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPCAFControl_ActorWrite;
		 STEPCAFControl_ActorWrite();

		/****** STEPCAFControl_ActorWrite::ClearMap ******/
		/****** md5 signature: 9356b49e3e18c060604ef62eda302963 ******/
		%feature("compactdefaultargs") ClearMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears map of shapes registered as assemblies.
") ClearMap;
		void ClearMap();

		/****** STEPCAFControl_ActorWrite::IsAssembly ******/
		/****** md5 signature: 51d457371eb7fa460bd495b77266f8b3 ******/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "
Parameters
----------
theModel: StepData_StepModel
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Check whether shape S is assembly Returns True if shape is registered in assemblies map.
") IsAssembly;
		bool IsAssembly(const opencascade::handle<StepData_StepModel> & theModel, TopoDS_Shape & S);

		/****** STEPCAFControl_ActorWrite::RegisterAssembly ******/
		/****** md5 signature: 622c0a9708d57976d3998396359aa735 ******/
		%feature("compactdefaultargs") RegisterAssembly;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Registers shape to be written as assembly The shape should be TopoDS_Compound (else does nothing).
") RegisterAssembly;
		void RegisterAssembly(const TopoDS_Shape & S);

		/****** STEPCAFControl_ActorWrite::SetStdMode ******/
		/****** md5 signature: eee55702b666d1559d6d7e16b09dd2b5 ******/
		%feature("compactdefaultargs") SetStdMode;
		%feature("autodoc", "
Parameters
----------
stdmode: bool (optional, default to true)

Return
-------
None

Description
-----------
Set standard mode of work In standard mode Actor (default) behaves exactly as its ancestor, also map is cleared.
") SetStdMode;
		void SetStdMode(const bool stdmode = true);

};


%extend STEPCAFControl_ActorWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPCAFControl_Controller *
**********************************/
class STEPCAFControl_Controller : public STEPControl_Controller {
	public:
		/****** STEPCAFControl_Controller::STEPCAFControl_Controller ******/
		/****** md5 signature: c38d16414f889d4e9baae781f84816ac ******/
		%feature("compactdefaultargs") STEPCAFControl_Controller;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the use of STEP Norm (the first time).
") STEPCAFControl_Controller;
		 STEPCAFControl_Controller();

		/****** STEPCAFControl_Controller::Init ******/
		/****** md5 signature: 90ec9d1ba4c3761913d797387bfd673d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Standard Initialisation. It creates a Controller for STEP-XCAF and records it to various names, available to select it later Returns True when done, False if could not be done.
") Init;
		static bool Init();

};


%extend STEPCAFControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class STEPCAFControl_ExternFile *
**********************************/
class STEPCAFControl_ExternFile : public Standard_Transient {
	public:
		/****** STEPCAFControl_ExternFile::STEPCAFControl_ExternFile ******/
		/****** md5 signature: 95a1646a349451e9888226d759085e3c ******/
		%feature("compactdefaultargs") STEPCAFControl_ExternFile;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty structure.
") STEPCAFControl_ExternFile;
		 STEPCAFControl_ExternFile();

		/****** STEPCAFControl_ExternFile::GetLabel ******/
		/****** md5 signature: b7ae9617d4db4ef8a9995ea610f01207 ******/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") GetLabel;
		TDF_Label GetLabel();

		/****** STEPCAFControl_ExternFile::GetLoadStatus ******/
		/****** md5 signature: bc4940b5da3f2280c94edf2abc353902 ******/
		%feature("compactdefaultargs") GetLoadStatus;
		%feature("autodoc", "Return
-------
IFSelect_ReturnStatus

Description
-----------
No available documentation.
") GetLoadStatus;
		IFSelect_ReturnStatus GetLoadStatus();

		/****** STEPCAFControl_ExternFile::GetName ******/
		/****** md5 signature: 23aadc9cd2e3411b58fb02d3fd2db5c9 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****** STEPCAFControl_ExternFile::GetTransferStatus ******/
		/****** md5 signature: 44e12665136ce99931729aef5e898555 ******/
		%feature("compactdefaultargs") GetTransferStatus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetTransferStatus;
		bool GetTransferStatus();

		/****** STEPCAFControl_ExternFile::GetWS ******/
		/****** md5 signature: 89119193724f5e891a5efe59451eb38a ******/
		%feature("compactdefaultargs") GetWS;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_WorkSession>

Description
-----------
No available documentation.
") GetWS;
		opencascade::handle<XSControl_WorkSession> GetWS();

		/****** STEPCAFControl_ExternFile::GetWriteStatus ******/
		/****** md5 signature: 66e6176228b73c95062726edf2c9ad96 ******/
		%feature("compactdefaultargs") GetWriteStatus;
		%feature("autodoc", "Return
-------
IFSelect_ReturnStatus

Description
-----------
No available documentation.
") GetWriteStatus;
		IFSelect_ReturnStatus GetWriteStatus();

		/****** STEPCAFControl_ExternFile::SetLabel ******/
		/****** md5 signature: b2ac78b1b3d88a69001417281367a04a ******/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") SetLabel;
		void SetLabel(const TDF_Label & L);

		/****** STEPCAFControl_ExternFile::SetLoadStatus ******/
		/****** md5 signature: f78974970f26eb42b7750584cdcf240c ******/
		%feature("compactdefaultargs") SetLoadStatus;
		%feature("autodoc", "
Parameters
----------
stat: IFSelect_ReturnStatus

Return
-------
None

Description
-----------
No available documentation.
") SetLoadStatus;
		void SetLoadStatus(const IFSelect_ReturnStatus stat);

		/****** STEPCAFControl_ExternFile::SetName ******/
		/****** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: TCollection_HAsciiString

Return
-------
None

Description
-----------
No available documentation.
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & name);

		/****** STEPCAFControl_ExternFile::SetTransferStatus ******/
		/****** md5 signature: 454e7d8360737240785ee5c8019160ba ******/
		%feature("compactdefaultargs") SetTransferStatus;
		%feature("autodoc", "
Parameters
----------
isok: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTransferStatus;
		void SetTransferStatus(const bool isok);

		/****** STEPCAFControl_ExternFile::SetWS ******/
		/****** md5 signature: 7321af252c520042078e4ef9dc264ab1 ******/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
No available documentation.
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPCAFControl_ExternFile::SetWriteStatus ******/
		/****** md5 signature: 62a6099bda817c6e3c4520b4373f839f ******/
		%feature("compactdefaultargs") SetWriteStatus;
		%feature("autodoc", "
Parameters
----------
stat: IFSelect_ReturnStatus

Return
-------
None

Description
-----------
No available documentation.
") SetWriteStatus;
		void SetWriteStatus(const IFSelect_ReturnStatus stat);

};


%make_alias(STEPCAFControl_ExternFile)

%extend STEPCAFControl_ExternFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class STEPCAFControl_GDTProperty *
***********************************/
class STEPCAFControl_GDTProperty {
	public:
		/****** STEPCAFControl_GDTProperty::STEPCAFControl_GDTProperty ******/
		/****** md5 signature: 7e91729793c518285f94e991723ef350 ******/
		%feature("compactdefaultargs") STEPCAFControl_GDTProperty;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPCAFControl_GDTProperty;
		 STEPCAFControl_GDTProperty();

		/****** STEPCAFControl_GDTProperty::GetDatumRefModifiers ******/
		/****** md5 signature: 43c4b27be8e9e5b9904f1b49832dcd11 ******/
		%feature("compactdefaultargs") GetDatumRefModifiers;
		%feature("autodoc", "
Parameters
----------
theModifiers: NCollection_Sequence<XCAFDimTolObjects_DatumSingleModif>
theModifWithVal: XCAFDimTolObjects_DatumModifWithValue
theValue: double
theUnit: StepBasic_Unit

Return
-------
opencascade::handle<NCollection_HArray1<StepDimTol_DatumReferenceModifier>>

Description
-----------
No available documentation.
") GetDatumRefModifiers;
		static opencascade::handle<NCollection_HArray1<StepDimTol_DatumReferenceModifier>> GetDatumRefModifiers(const NCollection_Sequence<XCAFDimTolObjects_DatumSingleModif> & theModifiers, const XCAFDimTolObjects_DatumModifWithValue & theModifWithVal, const double theValue, const StepBasic_Unit & theUnit);

		/****** STEPCAFControl_GDTProperty::GetDatumTargetName ******/
		/****** md5 signature: b72f88dd48cee3c7fded9891ceb0cee6 ******/
		%feature("compactdefaultargs") GetDatumTargetName;
		%feature("autodoc", "
Parameters
----------
theDatumType: XCAFDimTolObjects_DatumTargetType

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDatumTargetName;
		static opencascade::handle<TCollection_HAsciiString> GetDatumTargetName(const XCAFDimTolObjects_DatumTargetType theDatumType);

		/****** STEPCAFControl_GDTProperty::GetDatumTargetType ******/
		/****** md5 signature: be3d91398f65772aa797c5b1ee8729b8 ******/
		%feature("compactdefaultargs") GetDatumTargetType;
		%feature("autodoc", "
Parameters
----------
theDescription: TCollection_HAsciiString

Return
-------
theType: XCAFDimTolObjects_DatumTargetType

Description
-----------
No available documentation.
") GetDatumTargetType;
		static bool GetDatumTargetType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_DatumTargetType &OutValue);

		/****** STEPCAFControl_GDTProperty::GetDimClassOfTolerance ******/
		/****** md5 signature: f6931389cb8160cb7e14590c2a625dfb ******/
		%feature("compactdefaultargs") GetDimClassOfTolerance;
		%feature("autodoc", "
Parameters
----------
theLAF: StepShape_LimitsAndFits

Return
-------
theHolle: bool
theFV: XCAFDimTolObjects_DimensionFormVariance
theG: XCAFDimTolObjects_DimensionGrade

Description
-----------
No available documentation.
") GetDimClassOfTolerance;
		static void GetDimClassOfTolerance(const opencascade::handle<StepShape_LimitsAndFits> & theLAF, Standard_Boolean &OutValue, XCAFDimTolObjects_DimensionFormVariance &OutValue, XCAFDimTolObjects_DimensionGrade &OutValue);

		/****** STEPCAFControl_GDTProperty::GetDimModifierName ******/
		/****** md5 signature: 7409a4f0a6428922b61125f11f349438 ******/
		%feature("compactdefaultargs") GetDimModifierName;
		%feature("autodoc", "
Parameters
----------
theModifier: XCAFDimTolObjects_DimensionModif

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDimModifierName;
		static opencascade::handle<TCollection_HAsciiString> GetDimModifierName(const XCAFDimTolObjects_DimensionModif theModifier);

		/****** STEPCAFControl_GDTProperty::GetDimModifiers ******/
		/****** md5 signature: d753ee80f225881627edc6c669a645bb ******/
		%feature("compactdefaultargs") GetDimModifiers;
		%feature("autodoc", "
Parameters
----------
theCRI: StepRepr_CompoundRepresentationItem
theModifiers: NCollection_Sequence<XCAFDimTolObjects_DimensionModif>

Return
-------
None

Description
-----------
No available documentation.
") GetDimModifiers;
		static void GetDimModifiers(const opencascade::handle<StepRepr_CompoundRepresentationItem> & theCRI, NCollection_Sequence<XCAFDimTolObjects_DimensionModif> & theModifiers);

		/****** STEPCAFControl_GDTProperty::GetDimQualifierName ******/
		/****** md5 signature: 890a7f31264ca13488974d61b161392e ******/
		%feature("compactdefaultargs") GetDimQualifierName;
		%feature("autodoc", "
Parameters
----------
theQualifier: XCAFDimTolObjects_DimensionQualifier

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDimQualifierName;
		static opencascade::handle<TCollection_HAsciiString> GetDimQualifierName(const XCAFDimTolObjects_DimensionQualifier theQualifier);

		/****** STEPCAFControl_GDTProperty::GetDimQualifierType ******/
		/****** md5 signature: ad46bb9b0d4e155be88ad25f91f70348 ******/
		%feature("compactdefaultargs") GetDimQualifierType;
		%feature("autodoc", "
Parameters
----------
theDescription: TCollection_HAsciiString

Return
-------
theType: XCAFDimTolObjects_DimensionQualifier

Description
-----------
No available documentation.
") GetDimQualifierType;
		static bool GetDimQualifierType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_DimensionQualifier &OutValue);

		/****** STEPCAFControl_GDTProperty::GetDimType ******/
		/****** md5 signature: 61be6ea1502c104789f5cbb2bc1e58cd ******/
		%feature("compactdefaultargs") GetDimType;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString

Return
-------
theType: XCAFDimTolObjects_DimensionType

Description
-----------
No available documentation.
") GetDimType;
		static bool GetDimType(const opencascade::handle<TCollection_HAsciiString> & theName, XCAFDimTolObjects_DimensionType &OutValue);

		/****** STEPCAFControl_GDTProperty::GetDimTypeName ******/
		/****** md5 signature: d0af1b6c0d21c8b4d43ead92ca12a38a ******/
		%feature("compactdefaultargs") GetDimTypeName;
		%feature("autodoc", "
Parameters
----------
theType: XCAFDimTolObjects_DimensionType

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetDimTypeName;
		static opencascade::handle<TCollection_HAsciiString> GetDimTypeName(const XCAFDimTolObjects_DimensionType theType);

		/****** STEPCAFControl_GDTProperty::GetGeomTolerance ******/
		/****** md5 signature: 2f7cd26e1cef6ded0c741c54e526bca5 ******/
		%feature("compactdefaultargs") GetGeomTolerance;
		%feature("autodoc", "
Parameters
----------
theType: XCAFDimTolObjects_GeomToleranceType

Return
-------
opencascade::handle<StepDimTol_GeometricTolerance>

Description
-----------
No available documentation.
") GetGeomTolerance;
		static opencascade::handle<StepDimTol_GeometricTolerance> GetGeomTolerance(const XCAFDimTolObjects_GeomToleranceType theType);

		/****** STEPCAFControl_GDTProperty::GetGeomToleranceModifier ******/
		/****** md5 signature: 2570e746e1f91a405972220afaf304e0 ******/
		%feature("compactdefaultargs") GetGeomToleranceModifier;
		%feature("autodoc", "
Parameters
----------
theModifier: XCAFDimTolObjects_GeomToleranceModif

Return
-------
StepDimTol_GeometricToleranceModifier

Description
-----------
No available documentation.
") GetGeomToleranceModifier;
		static StepDimTol_GeometricToleranceModifier GetGeomToleranceModifier(const XCAFDimTolObjects_GeomToleranceModif theModifier);

		/****** STEPCAFControl_GDTProperty::GetGeomToleranceType ******/
		/****** md5 signature: 0b3446ba942436a2907b19cdd9bb98da ******/
		%feature("compactdefaultargs") GetGeomToleranceType;
		%feature("autodoc", "
Parameters
----------
theType: XCAFDimTolObjects_GeomToleranceType

Return
-------
StepDimTol_GeometricToleranceType

Description
-----------
No available documentation.
") GetGeomToleranceType;
		static StepDimTol_GeometricToleranceType GetGeomToleranceType(const XCAFDimTolObjects_GeomToleranceType theType);

		/****** STEPCAFControl_GDTProperty::GetGeomToleranceType ******/
		/****** md5 signature: 0b9e83ac47e5d63026fdc0df256ed92f ******/
		%feature("compactdefaultargs") GetGeomToleranceType;
		%feature("autodoc", "
Parameters
----------
theType: StepDimTol_GeometricToleranceType

Return
-------
XCAFDimTolObjects_GeomToleranceType

Description
-----------
No available documentation.
") GetGeomToleranceType;
		static XCAFDimTolObjects_GeomToleranceType GetGeomToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****** STEPCAFControl_GDTProperty::GetLimitsAndFits ******/
		/****** md5 signature: 22f17a4e72066a275b1d17ea9d1d27bd ******/
		%feature("compactdefaultargs") GetLimitsAndFits;
		%feature("autodoc", "
Parameters
----------
theHole: bool
theFormVariance: XCAFDimTolObjects_DimensionFormVariance
theGrade: XCAFDimTolObjects_DimensionGrade

Return
-------
opencascade::handle<StepShape_LimitsAndFits>

Description
-----------
No available documentation.
") GetLimitsAndFits;
		static opencascade::handle<StepShape_LimitsAndFits> GetLimitsAndFits(bool theHole, XCAFDimTolObjects_DimensionFormVariance theFormVariance, XCAFDimTolObjects_DimensionGrade theGrade);

		/****** STEPCAFControl_GDTProperty::GetTessellation ******/
		/****** md5 signature: 6a6e0d8dbc29d6b9bac92cc227a1749d ******/
		%feature("compactdefaultargs") GetTessellation;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
opencascade::handle<StepVisual_TessellatedGeometricSet>

Description
-----------
No available documentation.
") GetTessellation;
		static opencascade::handle<StepVisual_TessellatedGeometricSet> GetTessellation(const TopoDS_Shape & theShape);

		/****** STEPCAFControl_GDTProperty::GetTolValueType ******/
		/****** md5 signature: d01e2de3ffd9da6bc12def9c39c29e87 ******/
		%feature("compactdefaultargs") GetTolValueType;
		%feature("autodoc", "
Parameters
----------
theDescription: TCollection_HAsciiString

Return
-------
theType: XCAFDimTolObjects_GeomToleranceTypeValue

Description
-----------
No available documentation.
") GetTolValueType;
		static bool GetTolValueType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_GeomToleranceTypeValue &OutValue);

		/****** STEPCAFControl_GDTProperty::GetTolValueType ******/
		/****** md5 signature: 1c9751f63b6898c001757a599f0da519 ******/
		%feature("compactdefaultargs") GetTolValueType;
		%feature("autodoc", "
Parameters
----------
theType: XCAFDimTolObjects_GeomToleranceTypeValue

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") GetTolValueType;
		static opencascade::handle<TCollection_HAsciiString> GetTolValueType(const XCAFDimTolObjects_GeomToleranceTypeValue & theType);

};


%extend STEPCAFControl_GDTProperty {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class STEPCAFControl_Reader *
******************************/
class STEPCAFControl_Reader {
	public:
		/****** STEPCAFControl_Reader::STEPCAFControl_Reader ******/
		/****** md5 signature: 10ea06c63a87bb835e9684b6441da268 ******/
		%feature("compactdefaultargs") STEPCAFControl_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a reader with an empty STEP model and sets ColorMode, LayerMode, NameMode and PropsMode to true.
") STEPCAFControl_Reader;
		 STEPCAFControl_Reader();

		/****** STEPCAFControl_Reader::STEPCAFControl_Reader ******/
		/****** md5 signature: f2f3f9309ebac4d27b2491d959b8ef0f ******/
		%feature("compactdefaultargs") STEPCAFControl_Reader;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for STEP.
") STEPCAFControl_Reader;
		 STEPCAFControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const bool scratch = true);

		/****** STEPCAFControl_Reader::ChangeReader ******/
		/****** md5 signature: e5175f7e2460ff7f3db947662febd54a ******/
		%feature("compactdefaultargs") ChangeReader;
		%feature("autodoc", "Return
-------
STEPControl_Reader

Description
-----------
Returns basic reader.
") ChangeReader;
		STEPControl_Reader & ChangeReader();

		/****** STEPCAFControl_Reader::ExternFile ******/
		/****** md5 signature: d9869ef38655d98fedaab253b527c2bc ******/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "
Parameters
----------
name: char *
ef: STEPCAFControl_ExternFile

Return
-------
bool

Description
-----------
Returns data on external file by its name Returns False if no external file with given name is read.
") ExternFile;
		bool ExternFile(const char * const name, opencascade::handle<STEPCAFControl_ExternFile> & ef);

		/****** STEPCAFControl_Reader::ExternFiles ******/
		/****** md5 signature: 1154c88bc3253c7291077317c11363ab ******/
		%feature("compactdefaultargs") ExternFiles;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>>

Description
-----------
Returns data on external files Returns Null handle if no external files are read.
") ExternFiles;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>> & ExternFiles();

		/****** STEPCAFControl_Reader::FindInstance ******/
		/****** md5 signature: 437271226f0798ff95109e45bff24510 ******/
		%feature("compactdefaultargs") FindInstance;
		%feature("autodoc", "
Parameters
----------
NAUO: StepRepr_NextAssemblyUsageOccurrence
STool: XCAFDoc_ShapeTool
Tool: STEPConstruct_Tool
ShapeLabelMap: NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher>

Return
-------
TDF_Label

Description
-----------
Returns label of instance of an assembly component corresponding to a given NAUO.
") FindInstance;
		static TDF_Label FindInstance(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & NAUO, const opencascade::handle<XCAFDoc_ShapeTool> & STool, const STEPConstruct_Tool & Tool, const NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher> & ShapeLabelMap);

		/****** STEPCAFControl_Reader::GetColorMode ******/
		/****** md5 signature: 47aafb243dc0cf537a98e98687d6f205 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		bool GetColorMode();

		/****** STEPCAFControl_Reader::GetGDTMode ******/
		/****** md5 signature: bb19978904f38691c60fcf22eec7cb5d ******/
		%feature("compactdefaultargs") GetGDTMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetGDTMode;
		bool GetGDTMode();

		/****** STEPCAFControl_Reader::GetLayerMode ******/
		/****** md5 signature: 1f81bf4f7295796afc74e524a82c2b3b ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		bool GetLayerMode();

		/****** STEPCAFControl_Reader::GetMatMode ******/
		/****** md5 signature: fd53e606f08ba5e50ef590a23e9e0435 ******/
		%feature("compactdefaultargs") GetMatMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetMatMode;
		bool GetMatMode();

		/****** STEPCAFControl_Reader::GetMetaMode ******/
		/****** md5 signature: 1f065c17669bf7ed750c9197bb51bbbb ******/
		%feature("compactdefaultargs") GetMetaMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetMetaMode;
		bool GetMetaMode();

		/****** STEPCAFControl_Reader::GetNameMode ******/
		/****** md5 signature: 6f8d1c342487171700ccc3fdc91f526b ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		bool GetNameMode();

		/****** STEPCAFControl_Reader::GetProductMetaMode ******/
		/****** md5 signature: 421d070c00f14d137317363570db99cc ******/
		%feature("compactdefaultargs") GetProductMetaMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetProductMetaMode;
		bool GetProductMetaMode();

		/****** STEPCAFControl_Reader::GetPropsMode ******/
		/****** md5 signature: e09c754b46cda79463bec34c97679839 ******/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetPropsMode;
		bool GetPropsMode();

		/****** STEPCAFControl_Reader::GetSHUOMode ******/
		/****** md5 signature: 6c051f6deb501e4cd268d56a8b4680c7 ******/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetSHUOMode;
		bool GetSHUOMode();

		/****** STEPCAFControl_Reader::GetShapeFixParameters ******/
		/****** md5 signature: a8fc513b1f4da60e937ee021147ff2cb ******/
		%feature("compactdefaultargs") GetShapeFixParameters;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ParameterMap

Description
-----------
Returns parameters for shape processing that was set by SetParameters() method. 
Return: the parameters for shape processing. Empty map if no parameters were set.
") GetShapeFixParameters;
		const XSAlgo_ShapeProcessor::ParameterMap & GetShapeFixParameters();

		/****** STEPCAFControl_Reader::GetShapeLabelMap ******/
		/****** md5 signature: f83ef2e143db8e0ae32d043a1d35e142 ******/
		%feature("compactdefaultargs") GetShapeLabelMap;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") GetShapeLabelMap;
		const NCollection_DataMap<TopoDS_Shape, TDF_Label, TopTools_ShapeMapHasher> GetShapeLabelMap();

		/****** STEPCAFControl_Reader::GetShapeProcessFlags ******/
		/****** md5 signature: 33b1b591e99340c577e8d056ceb180c5 ******/
		%feature("compactdefaultargs") GetShapeProcessFlags;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ProcessingFlags

Description
-----------
Returns flags defining operations to be performed on shapes. 
Return: Pair of values defining operations to be performed on shapes and a boolean value that indicates whether the flags were set.
") GetShapeProcessFlags;
		const XSAlgo_ShapeProcessor::ProcessingFlags & GetShapeProcessFlags();

		/****** STEPCAFControl_Reader::GetViewMode ******/
		/****** md5 signature: ffb27ea97255df13d4f104c8b5afbabc ******/
		%feature("compactdefaultargs") GetViewMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get View mode.
") GetViewMode;
		bool GetViewMode();

		/****** STEPCAFControl_Reader::Init ******/
		/****** md5 signature: 82b78f9a8d5b2e7ae356a6eb3a342544 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Clears the internal data structures and attaches to a new session Clears the session if it was not yet set for STEP.
") Init;
		void Init(const opencascade::handle<XSControl_WorkSession> & WS, const bool scratch = true);

		/****** STEPCAFControl_Reader::NbRootsForTransfer ******/
		/****** md5 signature: 2e8cbaad3ad61c77df6d0b6eaa6073a9 ******/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of roots recognized for transfer Shortcut for Reader().NbRootsForTransfer().
") NbRootsForTransfer;
		int NbRootsForTransfer();

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: 14fef1b83bd87d2c89330cf8241d65c3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
filename: str
doc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
No available documentation.
") Perform;
		bool Perform(TCollection_AsciiString filename, const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: b739b2035a5265bd32be742c5c0c3b01 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
filename: str
doc: TDocStd_Document
theParams: DESTEP_Parameters
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
No available documentation.
") Perform;
		bool Perform(TCollection_AsciiString filename, const opencascade::handle<TDocStd_Document> & doc, const DESTEP_Parameters & theParams, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: 51dd8c1f66280c170af21f4352537276 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
filename: char *
doc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translate STEP file given by filename into the document Return True if succeeded, and False in case of fail.
") Perform;
		bool Perform(const char * const filename, const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: 576c768a07de0513b9908ed4fa030cff ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
filename: char *
doc: TDocStd_Document
theParams: DESTEP_Parameters
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translate STEP file given by filename into the document Return True if succeeded, and False in case of fail.
") Perform;
		bool Perform(const char * const filename, const opencascade::handle<TDocStd_Document> & doc, const DESTEP_Parameters & theParams, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::ReadFile ******/
		/****** md5 signature: a3cc5909d1a366b433cc458f88cee4bd ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFileName: char *

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file and returns the read status Provided for use like single-file reader. 
Input parameter: theFileName file to open 
Return: read status.
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * const theFileName);

		/****** STEPCAFControl_Reader::ReadFile ******/
		/****** md5 signature: 82d1410db31c834aa2bd82fb4547b709 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFileName: char *
theParams: DESTEP_Parameters

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file and returns the read status Provided for use like single-file reader. 
Input parameter: theFileName file to open 
Input parameter: theParams default configuration parameters 
Return: read status.
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * const theFileName, const DESTEP_Parameters & theParams);

		/****** STEPCAFControl_Reader::ReadStream ******/
		/****** md5 signature: 06334efe05f06eec7a1d1bfac9f23c44 ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theName: char *
theIStream: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file from stream and returns the read status. 
Input parameter: theName auxiliary stream name 
Input parameter: theIStream stream to read from 
Return: read status.
") ReadStream;
		IFSelect_ReturnStatus ReadStream(const char * const theName, std::istream & theIStream);

		/****** STEPCAFControl_Reader::Reader ******/
		/****** md5 signature: c54201c04d6a5ca89c65eb2fb14b8396 ******/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Return
-------
STEPControl_Reader

Description
-----------
Returns basic reader as const.
") Reader;
		const STEPControl_Reader & Reader();

		/****** STEPCAFControl_Reader::SetColorMode ******/
		/****** md5 signature: 30e8b787409ddb6f7d8546dbc2ad7253 ******/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "
Parameters
----------
colormode: bool

Return
-------
None

Description
-----------
Set ColorMode for indicate read Colors or not.
") SetColorMode;
		void SetColorMode(const bool colormode);

		/****** STEPCAFControl_Reader::SetGDTMode ******/
		/****** md5 signature: eb5a2e1158822f33af9db0239c62767d ******/
		%feature("compactdefaultargs") SetGDTMode;
		%feature("autodoc", "
Parameters
----------
gdtmode: bool

Return
-------
None

Description
-----------
Set GDT mode for indicate write GDT or not.
") SetGDTMode;
		void SetGDTMode(const bool gdtmode);

		/****** STEPCAFControl_Reader::SetLayerMode ******/
		/****** md5 signature: 92c9452fe5fa66a3bfc6885c311f49b8 ******/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "
Parameters
----------
layermode: bool

Return
-------
None

Description
-----------
Set LayerMode for indicate read Layers or not.
") SetLayerMode;
		void SetLayerMode(const bool layermode);

		/****** STEPCAFControl_Reader::SetMatMode ******/
		/****** md5 signature: 28d61f83fa868f4479bc10267b37d55b ******/
		%feature("compactdefaultargs") SetMatMode;
		%feature("autodoc", "
Parameters
----------
matmode: bool

Return
-------
None

Description
-----------
Set Material mode.
") SetMatMode;
		void SetMatMode(const bool matmode);

		/****** STEPCAFControl_Reader::SetMetaMode ******/
		/****** md5 signature: 85fa647994e863a0f1ef1373fb3a37e7 ******/
		%feature("compactdefaultargs") SetMetaMode;
		%feature("autodoc", "
Parameters
----------
theMetaMode: bool

Return
-------
None

Description
-----------
MetaMode for indicate read Metadata or not.
") SetMetaMode;
		void SetMetaMode(const bool theMetaMode);

		/****** STEPCAFControl_Reader::SetNameMode ******/
		/****** md5 signature: 1d94dc8e2546e21d290b9e471b582cde ******/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "
Parameters
----------
namemode: bool

Return
-------
None

Description
-----------
Set NameMode for indicate read Name or not.
") SetNameMode;
		void SetNameMode(const bool namemode);

		/****** STEPCAFControl_Reader::SetProductMetaMode ******/
		/****** md5 signature: ca186b13ef7d015a0ed8577f4d386f8a ******/
		%feature("compactdefaultargs") SetProductMetaMode;
		%feature("autodoc", "
Parameters
----------
theProductMetaMode: bool

Return
-------
None

Description
-----------
MetaMode for indicate whether to read Product Metadata or not.
") SetProductMetaMode;
		void SetProductMetaMode(const bool theProductMetaMode);

		/****** STEPCAFControl_Reader::SetPropsMode ******/
		/****** md5 signature: dd5af047d9aac4ba58d524012c8ad80a ******/
		%feature("compactdefaultargs") SetPropsMode;
		%feature("autodoc", "
Parameters
----------
propsmode: bool

Return
-------
None

Description
-----------
PropsMode for indicate read Validation properties or not.
") SetPropsMode;
		void SetPropsMode(const bool propsmode);

		/****** STEPCAFControl_Reader::SetSHUOMode ******/
		/****** md5 signature: d1f870124717622caa7d8c08eaac2809 ******/
		%feature("compactdefaultargs") SetSHUOMode;
		%feature("autodoc", "
Parameters
----------
shuomode: bool

Return
-------
None

Description
-----------
Set SHUO mode for indicate write SHUO or not.
") SetSHUOMode;
		void SetSHUOMode(const bool shuomode);

		/****** STEPCAFControl_Reader::SetShapeFixParameters ******/
		/****** md5 signature: c121f0c1a1bbbaa2d7732f28ec6b14f9 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** STEPCAFControl_Reader::SetShapeFixParameters ******/
		/****** md5 signature: 1db31276bf8a0d249a8011e0955a53e7 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters are moved from the input map. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** STEPCAFControl_Reader::SetShapeFixParameters ******/
		/****** md5 signature: e895be254466ec0dab7446ab439d8103 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: DE_ShapeFixParameters
theAdditionalParameters: XSAlgo_ShapeProcessor::ParameterMap (optional, default to {})

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters from @p theParameters are copied to the internal map. Parameters from @p theAdditionalParameters are copied to the internal map if they are not present in @p theParameters. 
Parameter theParameters the parameters for shape processing. 
Parameter theAdditionalParameters the additional parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const DE_ShapeFixParameters & theParameters, const XSAlgo_ShapeProcessor::ParameterMap & theAdditionalParameters = {});

		/****** STEPCAFControl_Reader::SetShapeProcessFlags ******/
		/****** md5 signature: 8994bc61257c564f18dec11d989eee9a ******/
		%feature("compactdefaultargs") SetShapeProcessFlags;
		%feature("autodoc", "
Parameters
----------
theFlags: ShapeProcess::OperationsFlags

Return
-------
None

Description
-----------
Sets flags defining operations to be performed on shapes. 
Parameter theFlags The flags defining operations to be performed on shapes.
") SetShapeProcessFlags;
		void SetShapeProcessFlags(const ShapeProcess::OperationsFlags & theFlags);

		/****** STEPCAFControl_Reader::SetViewMode ******/
		/****** md5 signature: 5ac61dce46ad699ee164bdd1f4debbe0 ******/
		%feature("compactdefaultargs") SetViewMode;
		%feature("autodoc", "
Parameters
----------
viewmode: bool

Return
-------
None

Description
-----------
Set View mode.
") SetViewMode;
		void SetViewMode(const bool viewmode);

		/****** STEPCAFControl_Reader::Transfer ******/
		/****** md5 signature: 5ab794241ab47932ed6daf0a674a15e3 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
doc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates currently loaded STEP file into the document Returns True if succeeded, and False in case of fail Provided for use like single-file reader.
") Transfer;
		bool Transfer(const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::TransferOneRoot ******/
		/****** md5 signature: 09ced8b0be55ca1348af0ad8f5c1d1cb ******/
		%feature("compactdefaultargs") TransferOneRoot;
		%feature("autodoc", "
Parameters
----------
num: int
doc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates currently loaded STEP file into the document Returns True if succeeded, and False in case of fail Provided for use like single-file reader.
") TransferOneRoot;
		bool TransferOneRoot(const int num, const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend STEPCAFControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class STEPCAFControl_Writer *
******************************/
class STEPCAFControl_Writer {
	public:
		/****** STEPCAFControl_Writer::STEPCAFControl_Writer ******/
		/****** md5 signature: b952f46e0b24216811a10c2153805fc2 ******/
		%feature("compactdefaultargs") STEPCAFControl_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer with an empty STEP model and sets ColorMode, LayerMode, NameMode and PropsMode to true.
") STEPCAFControl_Writer;
		 STEPCAFControl_Writer();

		/****** STEPCAFControl_Writer::STEPCAFControl_Writer ******/
		/****** md5 signature: 4fe6bce58bdaaa8652a8cefa20dbe054 ******/
		%feature("compactdefaultargs") STEPCAFControl_Writer;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
theScratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for STEP Clears the internal data structures.
") STEPCAFControl_Writer;
		 STEPCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & theWS, const bool theScratch = true);

		/****** STEPCAFControl_Writer::ChangeWriter ******/
		/****** md5 signature: acee09144e4dec42ed602fde52975129 ******/
		%feature("compactdefaultargs") ChangeWriter;
		%feature("autodoc", "Return
-------
STEPControl_Writer

Description
-----------
Returns basic reader for root file.
") ChangeWriter;
		STEPControl_Writer & ChangeWriter();

		/****** STEPCAFControl_Writer::ExternFile ******/
		/****** md5 signature: df4630461d7bd03901ef1fb747a7c735 ******/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theExtFile: STEPCAFControl_ExternFile

Return
-------
bool

Description
-----------
Returns data on external file by its original label Returns False if no external file with given name is read.
") ExternFile;
		bool ExternFile(const TDF_Label & theLabel, opencascade::handle<STEPCAFControl_ExternFile> & theExtFile);

		/****** STEPCAFControl_Writer::ExternFile ******/
		/****** md5 signature: c4c71ad5c57aeef46cdaa93015d3dafe ******/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "
Parameters
----------
theName: char *
theExtFile: STEPCAFControl_ExternFile

Return
-------
bool

Description
-----------
Returns data on external file by its name Returns False if no external file with given name is read.
") ExternFile;
		bool ExternFile(const char * const theName, opencascade::handle<STEPCAFControl_ExternFile> & theExtFile);

		/****** STEPCAFControl_Writer::ExternFiles ******/
		/****** md5 signature: 08a0b41df731275c7119f8910e47970c ******/
		%feature("compactdefaultargs") ExternFiles;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>>

Description
-----------
Returns data on external files Returns Null handle if no external files are read.
") ExternFiles;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>> & ExternFiles();

		/****** STEPCAFControl_Writer::GetCleanDuplicates ******/
		/****** md5 signature: 9ab180e5764b48f0ade434f8670c2846 ******/
		%feature("compactdefaultargs") GetCleanDuplicates;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag indicating whether duplicates should be removed from the model. 
Return: the flag indicating whether duplicates should be removed from the model.
") GetCleanDuplicates;
		bool GetCleanDuplicates();

		/****** STEPCAFControl_Writer::GetColorMode ******/
		/****** md5 signature: 4d12dea091429eeedb4bf6c71b34f3d6 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		bool GetColorMode();

		/****** STEPCAFControl_Writer::GetDimTolMode ******/
		/****** md5 signature: 9e4307dc64a8354e80e87bf8dce84267 ******/
		%feature("compactdefaultargs") GetDimTolMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDimTolMode;
		bool GetDimTolMode();

		/****** STEPCAFControl_Writer::GetLayerMode ******/
		/****** md5 signature: 58ee64d1f619e943de13f451cbd310a0 ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		bool GetLayerMode();

		/****** STEPCAFControl_Writer::GetMaterialMode ******/
		/****** md5 signature: 8c465922116bfd3e26dbc50f2c1f8285 ******/
		%feature("compactdefaultargs") GetMaterialMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetMaterialMode;
		bool GetMaterialMode();

		/****** STEPCAFControl_Writer::GetMetadataMode ******/
		/****** md5 signature: 8e39188cb615731eb5004249cac9f845 ******/
		%feature("compactdefaultargs") GetMetadataMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetMetadataMode;
		bool GetMetadataMode();

		/****** STEPCAFControl_Writer::GetNameMode ******/
		/****** md5 signature: bf2db5529449086fe5e7b5607565732f ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		bool GetNameMode();

		/****** STEPCAFControl_Writer::GetPropsMode ******/
		/****** md5 signature: 455924dda8541ffe580bfca286a91db5 ******/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetPropsMode;
		bool GetPropsMode();

		/****** STEPCAFControl_Writer::GetSHUOMode ******/
		/****** md5 signature: 5152f697454d8b551bbea3eda0f60c05 ******/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetSHUOMode;
		bool GetSHUOMode();

		/****** STEPCAFControl_Writer::GetShapeFixParameters ******/
		/****** md5 signature: a8fc513b1f4da60e937ee021147ff2cb ******/
		%feature("compactdefaultargs") GetShapeFixParameters;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ParameterMap

Description
-----------
Returns parameters for shape processing that was set by SetParameters() method. 
Return: the parameters for shape processing. Empty map if no parameters were set.
") GetShapeFixParameters;
		const XSAlgo_ShapeProcessor::ParameterMap & GetShapeFixParameters();

		/****** STEPCAFControl_Writer::GetShapeProcessFlags ******/
		/****** md5 signature: 33b1b591e99340c577e8d056ceb180c5 ******/
		%feature("compactdefaultargs") GetShapeProcessFlags;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ProcessingFlags

Description
-----------
Returns flags defining operations to be performed on shapes. 
Return: Pair of values defining operations to be performed on shapes and a boolean value that indicates whether the flags were set.
") GetShapeProcessFlags;
		const XSAlgo_ShapeProcessor::ProcessingFlags & GetShapeProcessFlags();

		/****** STEPCAFControl_Writer::GetVisualMaterialMode ******/
		/****** md5 signature: 8f0d1303fc3ca07c55f25932acf5f033 ******/
		%feature("compactdefaultargs") GetVisualMaterialMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetVisualMaterialMode;
		bool GetVisualMaterialMode();

		/****** STEPCAFControl_Writer::Init ******/
		/****** md5 signature: dedf7757ff01b71b852ebdf35e274617 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
theScratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Clears the internal data structures and attaches to a new session Clears the session if it was not yet set for STEP.
") Init;
		void Init(const opencascade::handle<XSControl_WorkSession> & theWS, const bool theScratch = true);

		/****** STEPCAFControl_Writer::Perform ******/
		/****** md5 signature: cb7d78da1021c7a134da1d4844576624 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theFileName: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
No available documentation.
") Perform;
		bool Perform(const opencascade::handle<TDocStd_Document> & theDoc, TCollection_AsciiString theFileName, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Perform ******/
		/****** md5 signature: 5e5e9c008a23fee387b6eaef58926e5d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theFileName: char *
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document and writes it to a STEP file Returns True if translation is OK.
") Perform;
		bool Perform(const opencascade::handle<TDocStd_Document> & theDoc, const char * const theFileName, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Perform ******/
		/****** md5 signature: ec5180da70f7b80e9818807a8f111643 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theFileName: char *
theParams: DESTEP_Parameters
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document and writes it to a STEP file This method is utilized if there's a need to set parameters avoiding initialization from Interface_Static Returns True if translation is OK.
") Perform;
		bool Perform(const opencascade::handle<TDocStd_Document> & theDoc, const char * const theFileName, const DESTEP_Parameters & theParams, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::SetCleanDuplicates ******/
		/****** md5 signature: c0ed1dec325532c5479f0a7071b3ac90 ******/
		%feature("compactdefaultargs") SetCleanDuplicates;
		%feature("autodoc", "
Parameters
----------
theCleanDuplicates: bool

Return
-------
None

Description
-----------
Set clean duplicates flag. If set to True, duplicates will be removed from the model. 
Parameter theCleanDuplicates the flag to set.
") SetCleanDuplicates;
		void SetCleanDuplicates(const bool theCleanDuplicates);

		/****** STEPCAFControl_Writer::SetColorMode ******/
		/****** md5 signature: 7013eedee400163ed0007466afb2d609 ******/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "
Parameters
----------
theColorMode: bool

Return
-------
None

Description
-----------
Set ColorMode for indicate write Colors or not.
") SetColorMode;
		void SetColorMode(const bool theColorMode);

		/****** STEPCAFControl_Writer::SetDimTolMode ******/
		/****** md5 signature: ecf41d77d9834a4f4ba465640e7bc351 ******/
		%feature("compactdefaultargs") SetDimTolMode;
		%feature("autodoc", "
Parameters
----------
theDimTolMode: bool

Return
-------
None

Description
-----------
Set dimtolmode for indicate write D&GTs or not.
") SetDimTolMode;
		void SetDimTolMode(const bool theDimTolMode);

		/****** STEPCAFControl_Writer::SetLayerMode ******/
		/****** md5 signature: 0c06368b2b6b1c580b0aa98f25875603 ******/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "
Parameters
----------
theLayerMode: bool

Return
-------
None

Description
-----------
Set LayerMode for indicate write Layers or not.
") SetLayerMode;
		void SetLayerMode(const bool theLayerMode);

		/****** STEPCAFControl_Writer::SetMaterialMode ******/
		/****** md5 signature: d8c79bcb4c9aa2ba6cfdfbbc0c5b8ef1 ******/
		%feature("compactdefaultargs") SetMaterialMode;
		%feature("autodoc", "
Parameters
----------
theMaterialMode: bool

Return
-------
None

Description
-----------
Set flag for indicate write material or not.
") SetMaterialMode;
		void SetMaterialMode(const bool theMaterialMode);

		/****** STEPCAFControl_Writer::SetMetadataMode ******/
		/****** md5 signature: 5032c7c0d5bde0564881c13bb3f52fb0 ******/
		%feature("compactdefaultargs") SetMetadataMode;
		%feature("autodoc", "
Parameters
----------
theMetadataMode: bool

Return
-------
None

Description
-----------
Set MetadataMode for indicate write metadata or not.
") SetMetadataMode;
		void SetMetadataMode(const bool theMetadataMode);

		/****** STEPCAFControl_Writer::SetNameMode ******/
		/****** md5 signature: 822a492ae252c85db0866108aee776a9 ******/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "
Parameters
----------
theNameMode: bool

Return
-------
None

Description
-----------
Set NameMode for indicate write Name or not.
") SetNameMode;
		void SetNameMode(const bool theNameMode);

		/****** STEPCAFControl_Writer::SetPropsMode ******/
		/****** md5 signature: 2726c3ccfee6193985cbd7d44de6edba ******/
		%feature("compactdefaultargs") SetPropsMode;
		%feature("autodoc", "
Parameters
----------
thePropsMode: bool

Return
-------
None

Description
-----------
PropsMode for indicate write Validation properties or not.
") SetPropsMode;
		void SetPropsMode(const bool thePropsMode);

		/****** STEPCAFControl_Writer::SetSHUOMode ******/
		/****** md5 signature: a816aef55f825707d461a8d8d69a65cf ******/
		%feature("compactdefaultargs") SetSHUOMode;
		%feature("autodoc", "
Parameters
----------
theSHUOMode: bool

Return
-------
None

Description
-----------
Set SHUO mode for indicate write SHUO or not.
") SetSHUOMode;
		void SetSHUOMode(const bool theSHUOMode);

		/****** STEPCAFControl_Writer::SetShapeFixParameters ******/
		/****** md5 signature: c121f0c1a1bbbaa2d7732f28ec6b14f9 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** STEPCAFControl_Writer::SetShapeFixParameters ******/
		/****** md5 signature: 1db31276bf8a0d249a8011e0955a53e7 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters are moved from the input map. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** STEPCAFControl_Writer::SetShapeFixParameters ******/
		/****** md5 signature: e895be254466ec0dab7446ab439d8103 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: DE_ShapeFixParameters
theAdditionalParameters: XSAlgo_ShapeProcessor::ParameterMap (optional, default to {})

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters from @p theParameters are copied to the internal map. Parameters from @p theAdditionalParameters are copied to the internal map if they are not present in @p theParameters. 
Parameter theParameters the parameters for shape processing. 
Parameter theAdditionalParameters the additional parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const DE_ShapeFixParameters & theParameters, const XSAlgo_ShapeProcessor::ParameterMap & theAdditionalParameters = {});

		/****** STEPCAFControl_Writer::SetShapeProcessFlags ******/
		/****** md5 signature: 8994bc61257c564f18dec11d989eee9a ******/
		%feature("compactdefaultargs") SetShapeProcessFlags;
		%feature("autodoc", "
Parameters
----------
theFlags: ShapeProcess::OperationsFlags

Return
-------
None

Description
-----------
Sets flags defining operations to be performed on shapes. 
Parameter theFlags The flags defining operations to be performed on shapes.
") SetShapeProcessFlags;
		void SetShapeProcessFlags(const ShapeProcess::OperationsFlags & theFlags);

		/****** STEPCAFControl_Writer::SetVisualMaterialMode ******/
		/****** md5 signature: c795f315e4423c5213c7f6d532d37aa0 ******/
		%feature("compactdefaultargs") SetVisualMaterialMode;
		%feature("autodoc", "
Parameters
----------
theVisualMaterialMode: bool

Return
-------
None

Description
-----------
Set flag for indicate write visual material or not.
") SetVisualMaterialMode;
		void SetVisualMaterialMode(const bool theVisualMaterialMode);

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 7fed3b6260f4134040216800de2586e3 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: char * (optional, default to nullptr)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document (or single label) to a STEP model The mode of translation of shape is AsIs If multi is not null pointer, it switches to multifile mode (with external refs), and string pointed by <multi> gives prefix for names of extern files (can be empty string) Returns True if translation is OK.
") Transfer;
		bool Transfer(const opencascade::handle<TDocStd_Document> & theDoc, const STEPControl_StepModelType theMode = STEPControl_AsIs, const char * const theIsMulti = nullptr, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 06c606179259aecc62c8b492e0f1cd2e ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theParams: DESTEP_Parameters
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: char * (optional, default to nullptr)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document (or single label) to a STEP model This method uses if need to set parameters avoiding initialization from Interface_Static 
Parameter theParams configuration parameters 
Parameter theMode mode of translation of shape is AsIs 
Parameter theIsMulti if multi is not null pointer, it switches to multifile  mode (with external refs), and string pointed by <multi>  gives prefix for names of extern files (can be empty string) 
Parameter theProgress progress indicator Returns True if translation is OK.
") Transfer;
		bool Transfer(const opencascade::handle<TDocStd_Document> & theDoc, const DESTEP_Parameters & theParams, const STEPControl_StepModelType theMode = STEPControl_AsIs, const char * const theIsMulti = nullptr, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: a218d8b7b3849d763b85cd754a975ddb ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: char * (optional, default to nullptr)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to transfer part of the document specified by label.
") Transfer;
		bool Transfer(const TDF_Label & theLabel, const STEPControl_StepModelType theMode = STEPControl_AsIs, const char * const theIsMulti = nullptr, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 858e8e3e221e4a77de51f6562b27a7c7 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theParams: DESTEP_Parameters
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: char * (optional, default to nullptr)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to transfer part of the document specified by label This method uses if need to set parameters avoiding initialization from Interface_Static.
") Transfer;
		bool Transfer(const TDF_Label & theLabel, const DESTEP_Parameters & theParams, const STEPControl_StepModelType theMode = STEPControl_AsIs, const char * const theIsMulti = nullptr, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 13c1ebe05aa9eb06646e98766e45038a ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabelSeq: NCollection_Sequence<TDF_Label>
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: char * (optional, default to nullptr)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to writing sequence of root assemblies or part of the file specified by use by one label.
") Transfer;
		bool Transfer(const NCollection_Sequence<TDF_Label> & theLabelSeq, const STEPControl_StepModelType theMode = STEPControl_AsIs, const char * const theIsMulti = nullptr, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 508718485e787554ea6a051492b4d382 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabelSeq: NCollection_Sequence<TDF_Label>
theParams: DESTEP_Parameters
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: char * (optional, default to nullptr)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to writing sequence of root assemblies or part of the file specified by use by one label. This method is utilized if there's a need to set parameters avoiding initialization from Interface_Static.
") Transfer;
		bool Transfer(const NCollection_Sequence<TDF_Label> & theLabelSeq, const DESTEP_Parameters & theParams, const STEPControl_StepModelType theMode = STEPControl_AsIs, const char * const theIsMulti = nullptr, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Write ******/
		/****** md5 signature: 599b126410ec48980a682c091be91941 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theFileName: char *

Return
-------
IFSelect_ReturnStatus

Description
-----------
Writes all the produced models into file In case of multimodel with extern references, filename will be a name of root file, all other files have names of corresponding parts Provided for use like single-file writer.
") Write;
		IFSelect_ReturnStatus Write(const char * const theFileName);

		/****** STEPCAFControl_Writer::WriteStream ******/
		/****** md5 signature: e58591412136b10e3743cbf1ab89de94 ******/
		%feature("compactdefaultargs") WriteStream;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: std::ostream

Description
-----------
Writes all the produced models into the stream. Provided for use like single-file writer.
") WriteStream;
		IFSelect_ReturnStatus WriteStream(std::ostream &OutValue);

		/****** STEPCAFControl_Writer::Writer ******/
		/****** md5 signature: 056d4f3221d283b7d58d92ddd5c40dd7 ******/
		%feature("compactdefaultargs") Writer;
		%feature("autodoc", "Return
-------
STEPControl_Writer

Description
-----------
Returns basic reader as const.
") Writer;
		const STEPControl_Writer & Writer();

};


%extend STEPCAFControl_Writer {
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
/* deprecated methods */
%pythoncode {
@deprecated
def STEPCAFControl_Controller_Init(*args):
	return STEPCAFControl_Controller.Init(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDatumRefModifiers(*args):
	return STEPCAFControl_GDTProperty.GetDatumRefModifiers(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDatumTargetName(*args):
	return STEPCAFControl_GDTProperty.GetDatumTargetName(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDatumTargetType(*args):
	return STEPCAFControl_GDTProperty.GetDatumTargetType(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDimClassOfTolerance(*args):
	return STEPCAFControl_GDTProperty.GetDimClassOfTolerance(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDimModifierName(*args):
	return STEPCAFControl_GDTProperty.GetDimModifierName(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDimModifiers(*args):
	return STEPCAFControl_GDTProperty.GetDimModifiers(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDimQualifierName(*args):
	return STEPCAFControl_GDTProperty.GetDimQualifierName(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDimQualifierType(*args):
	return STEPCAFControl_GDTProperty.GetDimQualifierType(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDimType(*args):
	return STEPCAFControl_GDTProperty.GetDimType(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetDimTypeName(*args):
	return STEPCAFControl_GDTProperty.GetDimTypeName(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetGeomTolerance(*args):
	return STEPCAFControl_GDTProperty.GetGeomTolerance(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetGeomToleranceModifier(*args):
	return STEPCAFControl_GDTProperty.GetGeomToleranceModifier(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetGeomToleranceType(*args):
	return STEPCAFControl_GDTProperty.GetGeomToleranceType(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetGeomToleranceType(*args):
	return STEPCAFControl_GDTProperty.GetGeomToleranceType(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetLimitsAndFits(*args):
	return STEPCAFControl_GDTProperty.GetLimitsAndFits(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetTessellation(*args):
	return STEPCAFControl_GDTProperty.GetTessellation(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetTolValueType(*args):
	return STEPCAFControl_GDTProperty.GetTolValueType(*args)

@deprecated
def STEPCAFControl_GDTProperty_GetTolValueType(*args):
	return STEPCAFControl_GDTProperty.GetTolValueType(*args)

@deprecated
def STEPCAFControl_Reader_FindInstance(*args):
	return STEPCAFControl_Reader.FindInstance(*args)

}
