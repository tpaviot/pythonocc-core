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
%define STEPCAFCONTROLDOCSTRING
"STEPCAFControl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepcafcontrol.html"
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
#include<StepDimTol_module.hxx>
#include<StepRepr_module.hxx>
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
%import StepDimTol.i
%import StepRepr.i
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
%wrap_handle(STEPCAFControl_ActorWrite)
%wrap_handle(STEPCAFControl_Controller)
%wrap_handle(STEPCAFControl_ExternFile)
/* end handles declaration */

/* templates */
%template(STEPCAFControl_DataMapOfLabelExternFile) NCollection_DataMap<TDF_Label,opencascade::handle<STEPCAFControl_ExternFile>>;
%template(STEPCAFControl_DataMapOfLabelShape) NCollection_DataMap<TDF_Label,TopoDS_Shape>;
%template(STEPCAFControl_DataMapOfPDExternFile) NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>,opencascade::handle<STEPCAFControl_ExternFile>>;
%template(STEPCAFControl_DataMapOfSDRExternFile) NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>,opencascade::handle<STEPCAFControl_ExternFile>>;
%template(STEPCAFControl_DataMapOfShapePD) NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepBasic_ProductDefinition>,TopTools_ShapeMapHasher>;
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
		/****** md5 signature: d21c3d42bc73d26bc8a22aa2065c7dc4 ******/
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
		virtual Standard_Boolean IsAssembly(const opencascade::handle<StepData_StepModel> & theModel, TopoDS_Shape & S);

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
		/****** md5 signature: 2640024529e09e71f4f773fb40c093b1 ******/
		%feature("compactdefaultargs") SetStdMode;
		%feature("autodoc", "
Parameters
----------
stdmode: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Set standard mode of work In standard mode Actor (default) behaves exactly as its ancestor, also map is cleared.
") SetStdMode;
		void SetStdMode(const Standard_Boolean stdmode = Standard_True);

};


%make_alias(STEPCAFControl_ActorWrite)

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
		/****** md5 signature: 7a4f426a7cdbf379be5e43123bb3383c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Standard Initialisation. It creates a Controller for STEP-XCAF and records it to various names, available to select it later Returns True when done, False if could not be done.
") Init;
		static Standard_Boolean Init();

};


%make_alias(STEPCAFControl_Controller)

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
		/****** md5 signature: 82b8d29758d7277ab7009cfe6b3cf9ac ******/
		%feature("compactdefaultargs") GetTransferStatus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetTransferStatus;
		Standard_Boolean GetTransferStatus();

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
		/****** md5 signature: cafb7a2cdbfce82cc195c6c67c8f81e3 ******/
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
		void SetTransferStatus(const Standard_Boolean isok);

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
		/****** md5 signature: 91654d4a61d0460385cafb3d0786834b ******/
		%feature("compactdefaultargs") GetDatumRefModifiers;
		%feature("autodoc", "
Parameters
----------
theModifiers: XCAFDimTolObjects_DatumModifiersSequence
theModifWithVal: XCAFDimTolObjects_DatumModifWithValue
theValue: float
theUnit: StepBasic_Unit

Return
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier>

Description
-----------
No available documentation.
") GetDatumRefModifiers;
		static opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> GetDatumRefModifiers(const XCAFDimTolObjects_DatumModifiersSequence & theModifiers, const XCAFDimTolObjects_DatumModifWithValue & theModifWithVal, const Standard_Real theValue, const StepBasic_Unit & theUnit);

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
		/****** md5 signature: f061b884567ffb88b73b7b9eb4dbba78 ******/
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
		static Standard_Boolean GetDatumTargetType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_DatumTargetType &OutValue);

		/****** STEPCAFControl_GDTProperty::GetDimClassOfTolerance ******/
		/****** md5 signature: ef6490f81a506f3768ac8675b310839a ******/
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
		/****** md5 signature: a5e82546f1eb397e6cde50fe36fda47f ******/
		%feature("compactdefaultargs") GetDimModifiers;
		%feature("autodoc", "
Parameters
----------
theCRI: StepRepr_CompoundRepresentationItem
theModifiers: XCAFDimTolObjects_DimensionModifiersSequence

Return
-------
None

Description
-----------
No available documentation.
") GetDimModifiers;
		static void GetDimModifiers(const opencascade::handle<StepRepr_CompoundRepresentationItem> & theCRI, XCAFDimTolObjects_DimensionModifiersSequence & theModifiers);

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
		/****** md5 signature: 2858212ae20285d70294a48d1135ff38 ******/
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
		static Standard_Boolean GetDimQualifierType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_DimensionQualifier &OutValue);

		/****** STEPCAFControl_GDTProperty::GetDimType ******/
		/****** md5 signature: 788b6cc24db4fba94bcd10595830a80e ******/
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
		static Standard_Boolean GetDimType(const opencascade::handle<TCollection_HAsciiString> & theName, XCAFDimTolObjects_DimensionType &OutValue);

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
		/****** md5 signature: a91d35e36a4ad93dc63af08f67fbe494 ******/
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
		static opencascade::handle<StepShape_LimitsAndFits> GetLimitsAndFits(Standard_Boolean theHole, XCAFDimTolObjects_DimensionFormVariance theFormVariance, XCAFDimTolObjects_DimensionGrade theGrade);

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
		/****** md5 signature: c48b39a90222f2f7713bf5bd61c69b57 ******/
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
		static Standard_Boolean GetTolValueType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_GeomToleranceTypeValue &OutValue);

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

		/****** STEPCAFControl_GDTProperty::IsDimensionalLocation ******/
		/****** md5 signature: ebe49a11e8b45ed94b2cb383d0e34204 ******/
		%feature("compactdefaultargs") IsDimensionalLocation;
		%feature("autodoc", "
Parameters
----------
theType: XCAFDimTolObjects_DimensionType

Return
-------
bool

Description
-----------
No available documentation.
") IsDimensionalLocation;
		static Standard_Boolean IsDimensionalLocation(const XCAFDimTolObjects_DimensionType theType);

		/****** STEPCAFControl_GDTProperty::IsDimensionalSize ******/
		/****** md5 signature: 4b04a8b91d46eda495ee2842501635d7 ******/
		%feature("compactdefaultargs") IsDimensionalSize;
		%feature("autodoc", "
Parameters
----------
theType: XCAFDimTolObjects_DimensionType

Return
-------
bool

Description
-----------
No available documentation.
") IsDimensionalSize;
		static Standard_Boolean IsDimensionalSize(const XCAFDimTolObjects_DimensionType theType);

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
Creates a reader with an empty STEP model and sets ColorMode, LayerMode, NameMode and PropsMode to Standard_True.
") STEPCAFControl_Reader;
		 STEPCAFControl_Reader();

		/****** STEPCAFControl_Reader::STEPCAFControl_Reader ******/
		/****** md5 signature: ec7cb3250e2df6297f9dc3aff96a6378 ******/
		%feature("compactdefaultargs") STEPCAFControl_Reader;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for STEP.
") STEPCAFControl_Reader;
		 STEPCAFControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

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
		/****** md5 signature: ad0d6b0b3be01575d180dd24c55cd264 ******/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "
Parameters
----------
name: str
ef: STEPCAFControl_ExternFile

Return
-------
bool

Description
-----------
Returns data on external file by its name Returns False if no external file with given name is read.
") ExternFile;
		Standard_Boolean ExternFile(Standard_CString name, opencascade::handle<STEPCAFControl_ExternFile> & ef);

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
		/****** md5 signature: 203c231e7643ced58be1d88666ced879 ******/
		%feature("compactdefaultargs") FindInstance;
		%feature("autodoc", "
Parameters
----------
NAUO: StepRepr_NextAssemblyUsageOccurrence
STool: XCAFDoc_ShapeTool
Tool: STEPConstruct_Tool
ShapeLabelMap: XCAFDoc_DataMapOfShapeLabel

Return
-------
TDF_Label

Description
-----------
Returns label of instance of an assembly component corresponding to a given NAUO.
") FindInstance;
		static TDF_Label FindInstance(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & NAUO, const opencascade::handle<XCAFDoc_ShapeTool> & STool, const STEPConstruct_Tool & Tool, const XCAFDoc_DataMapOfShapeLabel & ShapeLabelMap);

		/****** STEPCAFControl_Reader::GetColorMode ******/
		/****** md5 signature: 010da6a8a0e8a61fdb607fd6faba2b56 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****** STEPCAFControl_Reader::GetGDTMode ******/
		/****** md5 signature: 55b51ed927a6915343b17b7c1634a445 ******/
		%feature("compactdefaultargs") GetGDTMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetGDTMode;
		Standard_Boolean GetGDTMode();

		/****** STEPCAFControl_Reader::GetLayerMode ******/
		/****** md5 signature: d677385c303e067613f92bc738509727 ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****** STEPCAFControl_Reader::GetMatMode ******/
		/****** md5 signature: bfbb3f8c569d9550ca6565f2d11e50e9 ******/
		%feature("compactdefaultargs") GetMatMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetMatMode;
		Standard_Boolean GetMatMode();

		/****** STEPCAFControl_Reader::GetMetaMode ******/
		/****** md5 signature: c475992e7c1b78aeea70c3d9a92229e1 ******/
		%feature("compactdefaultargs") GetMetaMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetMetaMode;
		Standard_Boolean GetMetaMode();

		/****** STEPCAFControl_Reader::GetNameMode ******/
		/****** md5 signature: 2dd32a893d6f5f4666ac3752ace2d12f ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****** STEPCAFControl_Reader::GetProductMetaMode ******/
		/****** md5 signature: effb911707d95754c4f29ff50407edc7 ******/
		%feature("compactdefaultargs") GetProductMetaMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetProductMetaMode;
		Standard_Boolean GetProductMetaMode();

		/****** STEPCAFControl_Reader::GetPropsMode ******/
		/****** md5 signature: 3b2f4c2b61084d1e067d83421e0ea81d ******/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetPropsMode;
		Standard_Boolean GetPropsMode();

		/****** STEPCAFControl_Reader::GetSHUOMode ******/
		/****** md5 signature: 74c5f048b04741ef5abfe259b5c453cd ******/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetSHUOMode;
		Standard_Boolean GetSHUOMode();

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
		/****** md5 signature: a27551a2f74ec801c8cbaeeebce293a4 ******/
		%feature("compactdefaultargs") GetShapeLabelMap;
		%feature("autodoc", "Return
-------
XCAFDoc_DataMapOfShapeLabel

Description
-----------
No available documentation.
") GetShapeLabelMap;
		const XCAFDoc_DataMapOfShapeLabel & GetShapeLabelMap();

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
		/****** md5 signature: a843d1c8dafb9fee3990369ff0e366ba ******/
		%feature("compactdefaultargs") GetViewMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get View mode.
") GetViewMode;
		Standard_Boolean GetViewMode();

		/****** STEPCAFControl_Reader::Init ******/
		/****** md5 signature: 13544ae418c98602c6eaed6faea8f526 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Clears the internal data structures and attaches to a new session Clears the session if it was not yet set for STEP.
") Init;
		void Init(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** STEPCAFControl_Reader::NbRootsForTransfer ******/
		/****** md5 signature: 2b3065b08038f7cd7537c1ad0730579e ******/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of roots recognized for transfer Shortcut for Reader().NbRootsForTransfer().
") NbRootsForTransfer;
		Standard_Integer NbRootsForTransfer();

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: 038a674a14ffeea66b522dd74c593d9c ******/
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
		Standard_Boolean Perform(TCollection_AsciiString filename, const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: 45200eead1b2bea9448df9457b4779bf ******/
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
		Standard_Boolean Perform(TCollection_AsciiString filename, const opencascade::handle<TDocStd_Document> & doc, const DESTEP_Parameters & theParams, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: a4a2998dbb462f3822a286fdffd32a42 ******/
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
Translate STEP file given by filename into the document Return True if succeeded, and False in case of fail.
") Perform;
		Standard_Boolean Perform(Standard_CString filename, const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::Perform ******/
		/****** md5 signature: 167ebdd8bc261e07ca15f7be7fdb9944 ******/
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
Translate STEP file given by filename into the document Return True if succeeded, and False in case of fail.
") Perform;
		Standard_Boolean Perform(Standard_CString filename, const opencascade::handle<TDocStd_Document> & doc, const DESTEP_Parameters & theParams, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::ReadFile ******/
		/****** md5 signature: d86a92113a329cc8dabf010061f31392 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file and returns the read status Provided for use like single-file reader. 
Input parameter: theFileName file to open 
Return: read status.
") ReadFile;
		IFSelect_ReturnStatus ReadFile(Standard_CString theFileName);

		/****** STEPCAFControl_Reader::ReadFile ******/
		/****** md5 signature: d06da18c6ecebe694fe658b2e8edc0fb ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFileName: str
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
		IFSelect_ReturnStatus ReadFile(Standard_CString theFileName, const DESTEP_Parameters & theParams);

		/****** STEPCAFControl_Reader::ReadStream ******/
		/****** md5 signature: ee73b79142d0bdf122db2d304fa9d6f3 ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theName: str
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
		IFSelect_ReturnStatus ReadStream(Standard_CString theName, std::istream & theIStream);

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
		/****** md5 signature: e8d41838c31a9460a1c83d84b1f572a1 ******/
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
		void SetColorMode(const Standard_Boolean colormode);

		/****** STEPCAFControl_Reader::SetGDTMode ******/
		/****** md5 signature: 26501b5d4b403d5cdc2f7f47bdd108a7 ******/
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
		void SetGDTMode(const Standard_Boolean gdtmode);

		/****** STEPCAFControl_Reader::SetLayerMode ******/
		/****** md5 signature: 3ec21c8de4b114a83bb0b34cb3b98662 ******/
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
		void SetLayerMode(const Standard_Boolean layermode);

		/****** STEPCAFControl_Reader::SetMatMode ******/
		/****** md5 signature: a4e85f2c1802858b34ebf1de2281b0d3 ******/
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
		void SetMatMode(const Standard_Boolean matmode);

		/****** STEPCAFControl_Reader::SetMetaMode ******/
		/****** md5 signature: ff54065e7b3fd3d833c70428323b12fe ******/
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
		void SetMetaMode(const Standard_Boolean theMetaMode);

		/****** STEPCAFControl_Reader::SetNameMode ******/
		/****** md5 signature: 43ccb5d3fb024d8191f251ee74d0f6ba ******/
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
		void SetNameMode(const Standard_Boolean namemode);

		/****** STEPCAFControl_Reader::SetProductMetaMode ******/
		/****** md5 signature: 46bf66e2a9096142722392a3d790d830 ******/
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
		void SetProductMetaMode(const Standard_Boolean theProductMetaMode);

		/****** STEPCAFControl_Reader::SetPropsMode ******/
		/****** md5 signature: 97f3b34eb7a1e38c6cf17d5c26f938a6 ******/
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
		void SetPropsMode(const Standard_Boolean propsmode);

		/****** STEPCAFControl_Reader::SetSHUOMode ******/
		/****** md5 signature: ad06ed8b923731ee7b75bf3d7074f299 ******/
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
		void SetSHUOMode(const Standard_Boolean shuomode);

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
		/****** md5 signature: 86451933a668d6b4666beb6106f5e28f ******/
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
		void SetViewMode(const Standard_Boolean viewmode);

		/****** STEPCAFControl_Reader::Transfer ******/
		/****** md5 signature: 31249612d40a7a08f4519552635fb88d ******/
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
		Standard_Boolean Transfer(const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Reader::TransferOneRoot ******/
		/****** md5 signature: aa429310a76644e6f8262a806c04d28e ******/
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
		Standard_Boolean TransferOneRoot(const Standard_Integer num, const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
Creates a writer with an empty STEP model and sets ColorMode, LayerMode, NameMode and PropsMode to Standard_True.
") STEPCAFControl_Writer;
		 STEPCAFControl_Writer();

		/****** STEPCAFControl_Writer::STEPCAFControl_Writer ******/
		/****** md5 signature: dedf68dbebf4d519616966632e9764a8 ******/
		%feature("compactdefaultargs") STEPCAFControl_Writer;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
theScratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for STEP Clears the internal data structures.
") STEPCAFControl_Writer;
		 STEPCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & theWS, const Standard_Boolean theScratch = Standard_True);

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
		/****** md5 signature: 0769b22e71152aabd75dace01164fc2b ******/
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
		Standard_Boolean ExternFile(const TDF_Label & theLabel, opencascade::handle<STEPCAFControl_ExternFile> & theExtFile);

		/****** STEPCAFControl_Writer::ExternFile ******/
		/****** md5 signature: f77e0b8157371b505bc136b8bd33443e ******/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "
Parameters
----------
theName: str
theExtFile: STEPCAFControl_ExternFile

Return
-------
bool

Description
-----------
Returns data on external file by its name Returns False if no external file with given name is read.
") ExternFile;
		Standard_Boolean ExternFile(Standard_CString theName, opencascade::handle<STEPCAFControl_ExternFile> & theExtFile);

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

		/****** STEPCAFControl_Writer::GetColorMode ******/
		/****** md5 signature: cddb885e605f1794a5a6486023f65736 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****** STEPCAFControl_Writer::GetDimTolMode ******/
		/****** md5 signature: 5f3c2fc2e581a2ea711f9607cd0a817a ******/
		%feature("compactdefaultargs") GetDimTolMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetDimTolMode;
		Standard_Boolean GetDimTolMode();

		/****** STEPCAFControl_Writer::GetLayerMode ******/
		/****** md5 signature: b6b1458608d2429d13e63a07c0b392d8 ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****** STEPCAFControl_Writer::GetMaterialMode ******/
		/****** md5 signature: 2057a4ef866086868ba91cb34e6ad09a ******/
		%feature("compactdefaultargs") GetMaterialMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetMaterialMode;
		Standard_Boolean GetMaterialMode();

		/****** STEPCAFControl_Writer::GetNameMode ******/
		/****** md5 signature: 1097f532a68b4625a0108cddc8366238 ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****** STEPCAFControl_Writer::GetPropsMode ******/
		/****** md5 signature: 99cee0ed60040ac88dbf6e950f82a10e ******/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetPropsMode;
		Standard_Boolean GetPropsMode();

		/****** STEPCAFControl_Writer::GetSHUOMode ******/
		/****** md5 signature: 4e3a3a7f89647ad6b4f35f24a42234d6 ******/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetSHUOMode;
		Standard_Boolean GetSHUOMode();

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

		/****** STEPCAFControl_Writer::Init ******/
		/****** md5 signature: e7d3f870615865a6686f75c3aa077ff3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
theScratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Clears the internal data structures and attaches to a new session Clears the session if it was not yet set for STEP.
") Init;
		void Init(const opencascade::handle<XSControl_WorkSession> & theWS, const Standard_Boolean theScratch = Standard_True);

		/****** STEPCAFControl_Writer::Perform ******/
		/****** md5 signature: 624f8c3670df66af47c4a9af2967eb2a ******/
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
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & theDoc, TCollection_AsciiString theFileName, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Perform ******/
		/****** md5 signature: 90b76d8d692f1926baa1d9dd3db9018b ******/
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
Transfers a document and writes it to a STEP file Returns True if translation is OK.
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & theDoc, Standard_CString theFileName, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Perform ******/
		/****** md5 signature: 6ea5bb21f21d5cf9a7b38dc922f1ac30 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theFileName: str
theParams: DESTEP_Parameters
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document and writes it to a STEP file This method is utilized if there's a need to set parameters avoiding initialization from Interface_Static Returns True if translation is OK.
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & theDoc, Standard_CString theFileName, const DESTEP_Parameters & theParams, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::SetColorMode ******/
		/****** md5 signature: f341158b4cc5262e2e5cb7b941cc9031 ******/
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
		void SetColorMode(const Standard_Boolean theColorMode);

		/****** STEPCAFControl_Writer::SetDimTolMode ******/
		/****** md5 signature: 08cd53498196841f3c3a5c0e281a464f ******/
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
		void SetDimTolMode(const Standard_Boolean theDimTolMode);

		/****** STEPCAFControl_Writer::SetLayerMode ******/
		/****** md5 signature: d164352478699d01fe5d59c680c2a74d ******/
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
		void SetLayerMode(const Standard_Boolean theLayerMode);

		/****** STEPCAFControl_Writer::SetMaterialMode ******/
		/****** md5 signature: 932571d6d0df2e34fd2487f6025f4956 ******/
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
Set dimtolmode for indicate write D&GTs or not.
") SetMaterialMode;
		void SetMaterialMode(const Standard_Boolean theMaterialMode);

		/****** STEPCAFControl_Writer::SetNameMode ******/
		/****** md5 signature: a24984c6ce274882f02601c13cf73b9a ******/
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
		void SetNameMode(const Standard_Boolean theNameMode);

		/****** STEPCAFControl_Writer::SetPropsMode ******/
		/****** md5 signature: fbb288fb7a76bf6b9cd3acd70d056a7f ******/
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
		void SetPropsMode(const Standard_Boolean thePropsMode);

		/****** STEPCAFControl_Writer::SetSHUOMode ******/
		/****** md5 signature: 39955bf97fe8d6a6d6b3b211a859f216 ******/
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
		void SetSHUOMode(const Standard_Boolean theSHUOMode);

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

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: dd7ebbdc1c22d7845ad531885273adee ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: str (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document (or single label) to a STEP model The mode of translation of shape is AsIs If multi is not null pointer, it switches to multifile mode (with external refs), and string pointed by <multi> gives prefix for names of extern files (can be empty string) Returns True if translation is OK.
") Transfer;
		Standard_Boolean Transfer(const opencascade::handle<TDocStd_Document> & theDoc, const STEPControl_StepModelType theMode = STEPControl_AsIs, Standard_CString theIsMulti = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: d72ae6720afafe83b8fd48e7c4185603 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theParams: DESTEP_Parameters
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: str (optional, default to 0)
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
		Standard_Boolean Transfer(const opencascade::handle<TDocStd_Document> & theDoc, const DESTEP_Parameters & theParams, const STEPControl_StepModelType theMode = STEPControl_AsIs, Standard_CString theIsMulti = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 40f710aeab310ab1eff9bbdbe733b162 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: str (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to transfer part of the document specified by label.
") Transfer;
		Standard_Boolean Transfer(const TDF_Label & theLabel, const STEPControl_StepModelType theMode = STEPControl_AsIs, Standard_CString theIsMulti = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: b498040e8d3e1f0c433522af434ffefe ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabel: TDF_Label
theParams: DESTEP_Parameters
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: str (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to transfer part of the document specified by label This method uses if need to set parameters avoiding initialization from Interface_Static.
") Transfer;
		Standard_Boolean Transfer(const TDF_Label & theLabel, const DESTEP_Parameters & theParams, const STEPControl_StepModelType theMode = STEPControl_AsIs, Standard_CString theIsMulti = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 4e3f0900d966cc07a5e2191b2b4ba7a6 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabelSeq: TDF_LabelSequence
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: str (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to writing sequence of root assemblies or part of the file specified by use by one label.
") Transfer;
		Standard_Boolean Transfer(const TDF_LabelSequence & theLabelSeq, const STEPControl_StepModelType theMode = STEPControl_AsIs, Standard_CString theIsMulti = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Transfer ******/
		/****** md5 signature: 3348000692fdc2d71de30f72c620ad0d ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
theLabelSeq: TDF_LabelSequence
theParams: DESTEP_Parameters
theMode: STEPControl_StepModelType (optional, default to STEPControl_AsIs)
theIsMulti: str (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Method to writing sequence of root assemblies or part of the file specified by use by one label. This method is utilized if there's a need to set parameters avoiding initialization from Interface_Static.
") Transfer;
		Standard_Boolean Transfer(const TDF_LabelSequence & theLabelSeq, const DESTEP_Parameters & theParams, const STEPControl_StepModelType theMode = STEPControl_AsIs, Standard_CString theIsMulti = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPCAFControl_Writer::Write ******/
		/****** md5 signature: 14544d6ececf228a5871ef6afa0279ae ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Writes all the produced models into file In case of multimodel with extern references, filename will be a name of root file, all other files have names of corresponding parts Provided for use like single-file writer.
") Write;
		IFSelect_ReturnStatus Write(Standard_CString theFileName);

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
def STEPCAFControl_GDTProperty_IsDimensionalLocation(*args):
	return STEPCAFControl_GDTProperty.IsDimensionalLocation(*args)

@deprecated
def STEPCAFControl_GDTProperty_IsDimensionalSize(*args):
	return STEPCAFControl_GDTProperty.IsDimensionalSize(*args)

@deprecated
def STEPCAFControl_Reader_FindInstance(*args):
	return STEPCAFControl_Reader.FindInstance(*args)

}
