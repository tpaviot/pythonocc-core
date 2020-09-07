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
%define STEPCAFCONTROLDOCSTRING
"STEPCAFControl module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepcafcontrol.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<STEPCAFControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepShape_module.hxx>
#include<StepBasic_module.hxx>
#include<STEPControl_module.hxx>
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
#include<Resource_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepShape.i
%import StepBasic.i
%import STEPControl.i
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
%import Resource.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(STEPCAFControl_ActorWrite)
%wrap_handle(STEPCAFControl_Controller)
%wrap_handle(STEPCAFControl_ExternFile)
/* end handles declaration */

/* templates */
%template(STEPCAFControl_DataMapOfLabelExternFile) NCollection_DataMap<TDF_Label,opencascade::handle<STEPCAFControl_ExternFile>,TDF_LabelMapHasher>;
%template(STEPCAFControl_DataMapOfLabelShape) NCollection_DataMap<TDF_Label,TopoDS_Shape,TDF_LabelMapHasher>;
%template(STEPCAFControl_DataMapOfPDExternFile) NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>,opencascade::handle<STEPCAFControl_ExternFile>,TColStd_MapTransientHasher>;
%template(STEPCAFControl_DataMapOfSDRExternFile) NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>,opencascade::handle<STEPCAFControl_ExternFile>,TColStd_MapTransientHasher>;
%template(STEPCAFControl_DataMapOfShapePD) NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepBasic_ProductDefinition>,TopTools_ShapeMapHasher>;
%template(STEPCAFControl_DataMapOfShapeSDR) NCollection_DataMap<TopoDS_Shape,opencascade::handle<StepShape_ShapeDefinitionRepresentation>,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TDF_Label, opencascade::handle<STEPCAFControl_ExternFile>, TDF_LabelMapHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfLabelExternFile;
typedef NCollection_DataMap<TDF_Label, TopoDS_Shape, TDF_LabelMapHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfLabelShape;
typedef NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>, opencascade::handle<STEPCAFControl_ExternFile>, TColStd_MapTransientHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfPDExternFile;
typedef NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>, opencascade::handle<STEPCAFControl_ExternFile>, TColStd_MapTransientHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfSDRExternFile;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepBasic_ProductDefinition>, TopTools_ShapeMapHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfShapePD;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepShape_ShapeDefinitionRepresentation>, TopTools_ShapeMapHasher>::Iterator STEPCAFControl_DataMapIteratorOfDataMapOfShapeSDR;
typedef NCollection_DataMap<TDF_Label, opencascade::handle<STEPCAFControl_ExternFile>, TDF_LabelMapHasher> STEPCAFControl_DataMapOfLabelExternFile;
typedef NCollection_DataMap<TDF_Label, TopoDS_Shape, TDF_LabelMapHasher> STEPCAFControl_DataMapOfLabelShape;
typedef NCollection_DataMap<opencascade::handle<StepBasic_ProductDefinition>, opencascade::handle<STEPCAFControl_ExternFile>, TColStd_MapTransientHasher> STEPCAFControl_DataMapOfPDExternFile;
typedef NCollection_DataMap<opencascade::handle<StepShape_ShapeDefinitionRepresentation>, opencascade::handle<STEPCAFControl_ExternFile>, TColStd_MapTransientHasher> STEPCAFControl_DataMapOfSDRExternFile;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepBasic_ProductDefinition>, TopTools_ShapeMapHasher> STEPCAFControl_DataMapOfShapePD;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<StepShape_ShapeDefinitionRepresentation>, TopTools_ShapeMapHasher> STEPCAFControl_DataMapOfShapeSDR;
/* end typedefs declaration */

/**********************************
* class STEPCAFControl_ActorWrite *
**********************************/
class STEPCAFControl_ActorWrite : public STEPControl_ActorWrite {
	public:
		/****************** STEPCAFControl_ActorWrite ******************/
		/**** md5 signature: 55d2eef5460035edc16a241d250d3133 ****/
		%feature("compactdefaultargs") STEPCAFControl_ActorWrite;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPCAFControl_ActorWrite;
		 STEPCAFControl_ActorWrite();

		/****************** ClearMap ******************/
		/**** md5 signature: 9356b49e3e18c060604ef62eda302963 ****/
		%feature("compactdefaultargs") ClearMap;
		%feature("autodoc", "Clears map of shapes registered as assemblies.

Returns
-------
None
") ClearMap;
		void ClearMap();

		/****************** IsAssembly ******************/
		/**** md5 signature: 30d578b0e9cf9ae797fce09e72f62fcb ****/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "Check whether shape s is assembly returns true if shape is registered in assemblies map.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsAssembly;
		virtual Standard_Boolean IsAssembly(TopoDS_Shape & S);

		/****************** RegisterAssembly ******************/
		/**** md5 signature: 622c0a9708d57976d3998396359aa735 ****/
		%feature("compactdefaultargs") RegisterAssembly;
		%feature("autodoc", "Registers shape to be written as assembly the shape should be topods_compound (else does nothing).

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") RegisterAssembly;
		void RegisterAssembly(const TopoDS_Shape & S);

		/****************** SetStdMode ******************/
		/**** md5 signature: 2640024529e09e71f4f773fb40c093b1 ****/
		%feature("compactdefaultargs") SetStdMode;
		%feature("autodoc", "Set standard mode of work in standard mode actor (default) behaves exactly as its ancestor, also map is cleared.

Parameters
----------
stdmode: bool,optional
	default value is Standard_True

Returns
-------
None
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
		/****************** STEPCAFControl_Controller ******************/
		/**** md5 signature: c38d16414f889d4e9baae781f84816ac ****/
		%feature("compactdefaultargs") STEPCAFControl_Controller;
		%feature("autodoc", "Initializes the use of step norm (the first time).

Returns
-------
None
") STEPCAFControl_Controller;
		 STEPCAFControl_Controller();

		/****************** Init ******************/
		/**** md5 signature: 7a4f426a7cdbf379be5e43123bb3383c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Standard initialisation. it creates a controller for step-xcaf and records it to various names, available to select it later returns true when done, false if could not be done.

Returns
-------
bool
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
		/****************** STEPCAFControl_ExternFile ******************/
		/**** md5 signature: 95a1646a349451e9888226d759085e3c ****/
		%feature("compactdefaultargs") STEPCAFControl_ExternFile;
		%feature("autodoc", "Creates an empty structure.

Returns
-------
None
") STEPCAFControl_ExternFile;
		 STEPCAFControl_ExternFile();

		/****************** GetLabel ******************/
		/**** md5 signature: b7ae9617d4db4ef8a9995ea610f01207 ****/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") GetLabel;
		TDF_Label GetLabel();

		/****************** GetLoadStatus ******************/
		/**** md5 signature: bc4940b5da3f2280c94edf2abc353902 ****/
		%feature("compactdefaultargs") GetLoadStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
IFSelect_ReturnStatus
") GetLoadStatus;
		IFSelect_ReturnStatus GetLoadStatus();

		/****************** GetName ******************/
		/**** md5 signature: 23aadc9cd2e3411b58fb02d3fd2db5c9 ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** GetTransferStatus ******************/
		/**** md5 signature: 82b8d29758d7277ab7009cfe6b3cf9ac ****/
		%feature("compactdefaultargs") GetTransferStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetTransferStatus;
		Standard_Boolean GetTransferStatus();

		/****************** GetWS ******************/
		/**** md5 signature: 89119193724f5e891a5efe59451eb38a ****/
		%feature("compactdefaultargs") GetWS;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<XSControl_WorkSession>
") GetWS;
		opencascade::handle<XSControl_WorkSession> GetWS();

		/****************** GetWriteStatus ******************/
		/**** md5 signature: 66e6176228b73c95062726edf2c9ad96 ****/
		%feature("compactdefaultargs") GetWriteStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
IFSelect_ReturnStatus
") GetWriteStatus;
		IFSelect_ReturnStatus GetWriteStatus();

		/****************** SetLabel ******************/
		/**** md5 signature: b2ac78b1b3d88a69001417281367a04a ****/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TDF_Label

Returns
-------
None
") SetLabel;
		void SetLabel(const TDF_Label & L);

		/****************** SetLoadStatus ******************/
		/**** md5 signature: f78974970f26eb42b7750584cdcf240c ****/
		%feature("compactdefaultargs") SetLoadStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
stat: IFSelect_ReturnStatus

Returns
-------
None
") SetLoadStatus;
		void SetLoadStatus(const IFSelect_ReturnStatus stat);

		/****************** SetName ******************/
		/**** md5 signature: 1a85c1f4dd446039f14efe98df7aeb03 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
") SetName;
		void SetName(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetTransferStatus ******************/
		/**** md5 signature: cafb7a2cdbfce82cc195c6c67c8f81e3 ****/
		%feature("compactdefaultargs") SetTransferStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
isok: bool

Returns
-------
None
") SetTransferStatus;
		void SetTransferStatus(const Standard_Boolean isok);

		/****************** SetWS ******************/
		/**** md5 signature: 7321af252c520042078e4ef9dc264ab1 ****/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "No available documentation.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS);

		/****************** SetWriteStatus ******************/
		/**** md5 signature: 62a6099bda817c6e3c4520b4373f839f ****/
		%feature("compactdefaultargs") SetWriteStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
stat: IFSelect_ReturnStatus

Returns
-------
None
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
		/****************** STEPCAFControl_GDTProperty ******************/
		/**** md5 signature: 7e91729793c518285f94e991723ef350 ****/
		%feature("compactdefaultargs") STEPCAFControl_GDTProperty;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPCAFControl_GDTProperty;
		 STEPCAFControl_GDTProperty();

		/****************** GetDatumRefModifiers ******************/
		/**** md5 signature: fdb8258d358004e855c446ee4070ea01 ****/
		%feature("compactdefaultargs") GetDatumRefModifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theModifiers: XCAFDimTolObjects_DatumModifiersSequence
theModifWithVal: XCAFDimTolObjects_DatumModifWithValue
theValue: float
theUnit: StepBasic_Unit

Returns
-------
opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier>
") GetDatumRefModifiers;
		static opencascade::handle<StepDimTol_HArray1OfDatumReferenceModifier> GetDatumRefModifiers(const XCAFDimTolObjects_DatumModifiersSequence theModifiers, const XCAFDimTolObjects_DatumModifWithValue theModifWithVal, const Standard_Real theValue, const StepBasic_Unit theUnit);

		/****************** GetDatumTargetName ******************/
		/**** md5 signature: b72f88dd48cee3c7fded9891ceb0cee6 ****/
		%feature("compactdefaultargs") GetDatumTargetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDatumType: XCAFDimTolObjects_DatumTargetType

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDatumTargetName;
		static opencascade::handle<TCollection_HAsciiString> GetDatumTargetName(const XCAFDimTolObjects_DatumTargetType theDatumType);

		/****************** GetDatumTargetType ******************/
		/**** md5 signature: f061b884567ffb88b73b7b9eb4dbba78 ****/
		%feature("compactdefaultargs") GetDatumTargetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDescription: TCollection_HAsciiString
theType: XCAFDimTolObjects_DatumTargetType

Returns
-------
bool
") GetDatumTargetType;
		static Standard_Boolean GetDatumTargetType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_DatumTargetType & theType);

		/****************** GetDimClassOfTolerance ******************/
		/**** md5 signature: ef6490f81a506f3768ac8675b310839a ****/
		%feature("compactdefaultargs") GetDimClassOfTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLAF: StepShape_LimitsAndFits
theFV: XCAFDimTolObjects_DimensionFormVariance
theG: XCAFDimTolObjects_DimensionGrade

Returns
-------
theHolle: bool
") GetDimClassOfTolerance;
		static void GetDimClassOfTolerance(const opencascade::handle<StepShape_LimitsAndFits> & theLAF, Standard_Boolean &OutValue, XCAFDimTolObjects_DimensionFormVariance & theFV, XCAFDimTolObjects_DimensionGrade & theG);

		/****************** GetDimModifierName ******************/
		/**** md5 signature: 7409a4f0a6428922b61125f11f349438 ****/
		%feature("compactdefaultargs") GetDimModifierName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theModifier: XCAFDimTolObjects_DimensionModif

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDimModifierName;
		static opencascade::handle<TCollection_HAsciiString> GetDimModifierName(const XCAFDimTolObjects_DimensionModif theModifier);

		/****************** GetDimModifiers ******************/
		/**** md5 signature: a5e82546f1eb397e6cde50fe36fda47f ****/
		%feature("compactdefaultargs") GetDimModifiers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCRI: StepRepr_CompoundRepresentationItem
theModifiers: XCAFDimTolObjects_DimensionModifiersSequence

Returns
-------
None
") GetDimModifiers;
		static void GetDimModifiers(const opencascade::handle<StepRepr_CompoundRepresentationItem> & theCRI, XCAFDimTolObjects_DimensionModifiersSequence & theModifiers);

		/****************** GetDimQualifierName ******************/
		/**** md5 signature: 890a7f31264ca13488974d61b161392e ****/
		%feature("compactdefaultargs") GetDimQualifierName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theQualifier: XCAFDimTolObjects_DimensionQualifier

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDimQualifierName;
		static opencascade::handle<TCollection_HAsciiString> GetDimQualifierName(const XCAFDimTolObjects_DimensionQualifier theQualifier);

		/****************** GetDimQualifierType ******************/
		/**** md5 signature: 2858212ae20285d70294a48d1135ff38 ****/
		%feature("compactdefaultargs") GetDimQualifierType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDescription: TCollection_HAsciiString
theType: XCAFDimTolObjects_DimensionQualifier

Returns
-------
bool
") GetDimQualifierType;
		static Standard_Boolean GetDimQualifierType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_DimensionQualifier & theType);

		/****************** GetDimType ******************/
		/**** md5 signature: 788b6cc24db4fba94bcd10595830a80e ****/
		%feature("compactdefaultargs") GetDimType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_HAsciiString
theType: XCAFDimTolObjects_DimensionType

Returns
-------
bool
") GetDimType;
		static Standard_Boolean GetDimType(const opencascade::handle<TCollection_HAsciiString> & theName, XCAFDimTolObjects_DimensionType & theType);

		/****************** GetDimTypeName ******************/
		/**** md5 signature: d0af1b6c0d21c8b4d43ead92ca12a38a ****/
		%feature("compactdefaultargs") GetDimTypeName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: XCAFDimTolObjects_DimensionType

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetDimTypeName;
		static opencascade::handle<TCollection_HAsciiString> GetDimTypeName(const XCAFDimTolObjects_DimensionType theType);

		/****************** GetGeomTolerance ******************/
		/**** md5 signature: 2f7cd26e1cef6ded0c741c54e526bca5 ****/
		%feature("compactdefaultargs") GetGeomTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: XCAFDimTolObjects_GeomToleranceType

Returns
-------
opencascade::handle<StepDimTol_GeometricTolerance>
") GetGeomTolerance;
		static opencascade::handle<StepDimTol_GeometricTolerance> GetGeomTolerance(const XCAFDimTolObjects_GeomToleranceType theType);

		/****************** GetGeomToleranceModifier ******************/
		/**** md5 signature: 2570e746e1f91a405972220afaf304e0 ****/
		%feature("compactdefaultargs") GetGeomToleranceModifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
theModifier: XCAFDimTolObjects_GeomToleranceModif

Returns
-------
StepDimTol_GeometricToleranceModifier
") GetGeomToleranceModifier;
		static StepDimTol_GeometricToleranceModifier GetGeomToleranceModifier(const XCAFDimTolObjects_GeomToleranceModif theModifier);

		/****************** GetGeomToleranceType ******************/
		/**** md5 signature: 0b3446ba942436a2907b19cdd9bb98da ****/
		%feature("compactdefaultargs") GetGeomToleranceType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: XCAFDimTolObjects_GeomToleranceType

Returns
-------
StepDimTol_GeometricToleranceType
") GetGeomToleranceType;
		static StepDimTol_GeometricToleranceType GetGeomToleranceType(const XCAFDimTolObjects_GeomToleranceType theType);

		/****************** GetGeomToleranceType ******************/
		/**** md5 signature: 0b9e83ac47e5d63026fdc0df256ed92f ****/
		%feature("compactdefaultargs") GetGeomToleranceType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: StepDimTol_GeometricToleranceType

Returns
-------
XCAFDimTolObjects_GeomToleranceType
") GetGeomToleranceType;
		static XCAFDimTolObjects_GeomToleranceType GetGeomToleranceType(const StepDimTol_GeometricToleranceType theType);

		/****************** GetLimitsAndFits ******************/
		/**** md5 signature: a91d35e36a4ad93dc63af08f67fbe494 ****/
		%feature("compactdefaultargs") GetLimitsAndFits;
		%feature("autodoc", "No available documentation.

Parameters
----------
theHole: bool
theFormVariance: XCAFDimTolObjects_DimensionFormVariance
theGrade: XCAFDimTolObjects_DimensionGrade

Returns
-------
opencascade::handle<StepShape_LimitsAndFits>
") GetLimitsAndFits;
		static opencascade::handle<StepShape_LimitsAndFits> GetLimitsAndFits(Standard_Boolean theHole, XCAFDimTolObjects_DimensionFormVariance theFormVariance, XCAFDimTolObjects_DimensionGrade theGrade);

		/****************** GetTessellation ******************/
		/**** md5 signature: 85ed91fa7a6e1973202f735dbc048395 ****/
		%feature("compactdefaultargs") GetTessellation;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
opencascade::handle<StepVisual_TessellatedGeometricSet>
") GetTessellation;
		static opencascade::handle<StepVisual_TessellatedGeometricSet> GetTessellation(const TopoDS_Shape theShape);

		/****************** GetTolValueType ******************/
		/**** md5 signature: c48b39a90222f2f7713bf5bd61c69b57 ****/
		%feature("compactdefaultargs") GetTolValueType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDescription: TCollection_HAsciiString
theType: XCAFDimTolObjects_GeomToleranceTypeValue

Returns
-------
bool
") GetTolValueType;
		static Standard_Boolean GetTolValueType(const opencascade::handle<TCollection_HAsciiString> & theDescription, XCAFDimTolObjects_GeomToleranceTypeValue & theType);

		/****************** GetTolValueType ******************/
		/**** md5 signature: 1c9751f63b6898c001757a599f0da519 ****/
		%feature("compactdefaultargs") GetTolValueType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: XCAFDimTolObjects_GeomToleranceTypeValue

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetTolValueType;
		static opencascade::handle<TCollection_HAsciiString> GetTolValueType(const XCAFDimTolObjects_GeomToleranceTypeValue & theType);

		/****************** IsDimensionalLocation ******************/
		/**** md5 signature: ebe49a11e8b45ed94b2cb383d0e34204 ****/
		%feature("compactdefaultargs") IsDimensionalLocation;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: XCAFDimTolObjects_DimensionType

Returns
-------
bool
") IsDimensionalLocation;
		static Standard_Boolean IsDimensionalLocation(const XCAFDimTolObjects_DimensionType theType);

		/****************** IsDimensionalSize ******************/
		/**** md5 signature: 4b04a8b91d46eda495ee2842501635d7 ****/
		%feature("compactdefaultargs") IsDimensionalSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: XCAFDimTolObjects_DimensionType

Returns
-------
bool
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
		/****************** STEPCAFControl_Reader ******************/
		/**** md5 signature: 10ea06c63a87bb835e9684b6441da268 ****/
		%feature("compactdefaultargs") STEPCAFControl_Reader;
		%feature("autodoc", "Creates a reader with an empty step model and sets colormode, layermode, namemode and propsmode to standard_true.

Returns
-------
None
") STEPCAFControl_Reader;
		 STEPCAFControl_Reader();

		/****************** STEPCAFControl_Reader ******************/
		/**** md5 signature: ec7cb3250e2df6297f9dc3aff96a6378 ****/
		%feature("compactdefaultargs") STEPCAFControl_Reader;
		%feature("autodoc", "Creates a reader tool and attaches it to an already existing session clears the session if it was not yet set for step.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") STEPCAFControl_Reader;
		 STEPCAFControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** ChangeReader ******************/
		/**** md5 signature: e5175f7e2460ff7f3db947662febd54a ****/
		%feature("compactdefaultargs") ChangeReader;
		%feature("autodoc", "Returns basic reader.

Returns
-------
STEPControl_Reader
") ChangeReader;
		STEPControl_Reader & ChangeReader();

		/****************** ExternFile ******************/
		/**** md5 signature: ad0d6b0b3be01575d180dd24c55cd264 ****/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "Returns data on external file by its name returns false if no external file with given name is read.

Parameters
----------
name: char *
ef: STEPCAFControl_ExternFile

Returns
-------
bool
") ExternFile;
		Standard_Boolean ExternFile(const char * name, opencascade::handle<STEPCAFControl_ExternFile> & ef);

		/****************** ExternFiles ******************/
		/**** md5 signature: 1154c88bc3253c7291077317c11363ab ****/
		%feature("compactdefaultargs") ExternFiles;
		%feature("autodoc", "Returns data on external files returns null handle if no external files are read.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>>
") ExternFiles;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>> & ExternFiles();

		/****************** FindInstance ******************/
		/**** md5 signature: 203c231e7643ced58be1d88666ced879 ****/
		%feature("compactdefaultargs") FindInstance;
		%feature("autodoc", "Returns label of instance of an assembly component corresponding to a given nauo.

Parameters
----------
NAUO: StepRepr_NextAssemblyUsageOccurrence
STool: XCAFDoc_ShapeTool
Tool: STEPConstruct_Tool
ShapeLabelMap: XCAFDoc_DataMapOfShapeLabel

Returns
-------
TDF_Label
") FindInstance;
		static TDF_Label FindInstance(const opencascade::handle<StepRepr_NextAssemblyUsageOccurrence> & NAUO, const opencascade::handle<XCAFDoc_ShapeTool> & STool, const STEPConstruct_Tool & Tool, const XCAFDoc_DataMapOfShapeLabel & ShapeLabelMap);

		/****************** GetColorMode ******************/
		/**** md5 signature: 010da6a8a0e8a61fdb607fd6faba2b56 ****/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****************** GetGDTMode ******************/
		/**** md5 signature: 55b51ed927a6915343b17b7c1634a445 ****/
		%feature("compactdefaultargs") GetGDTMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetGDTMode;
		Standard_Boolean GetGDTMode();

		/****************** GetLayerMode ******************/
		/**** md5 signature: d677385c303e067613f92bc738509727 ****/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****************** GetMatMode ******************/
		/**** md5 signature: bfbb3f8c569d9550ca6565f2d11e50e9 ****/
		%feature("compactdefaultargs") GetMatMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetMatMode;
		Standard_Boolean GetMatMode();

		/****************** GetNameMode ******************/
		/**** md5 signature: 2dd32a893d6f5f4666ac3752ace2d12f ****/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****************** GetPropsMode ******************/
		/**** md5 signature: 3b2f4c2b61084d1e067d83421e0ea81d ****/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetPropsMode;
		Standard_Boolean GetPropsMode();

		/****************** GetSHUOMode ******************/
		/**** md5 signature: 74c5f048b04741ef5abfe259b5c453cd ****/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetSHUOMode;
		Standard_Boolean GetSHUOMode();

		/****************** GetViewMode ******************/
		/**** md5 signature: a843d1c8dafb9fee3990369ff0e366ba ****/
		%feature("compactdefaultargs") GetViewMode;
		%feature("autodoc", "Get view mode.

Returns
-------
bool
") GetViewMode;
		Standard_Boolean GetViewMode();

		/****************** Init ******************/
		/**** md5 signature: 13544ae418c98602c6eaed6faea8f526 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Clears the internal data structures and attaches to a new session clears the session if it was not yet set for step.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** NbRootsForTransfer ******************/
		/**** md5 signature: 2b3065b08038f7cd7537c1ad0730579e ****/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Returns number of roots recognized for transfer shortcut for reader().nbrootsfortransfer().

Returns
-------
int
") NbRootsForTransfer;
		Standard_Integer NbRootsForTransfer();

		/****************** Perform ******************/
		/**** md5 signature: 59b71ea88dcd2b3bd203180711997b7b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
filename: TCollection_AsciiString
doc: TDocStd_Document

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const TCollection_AsciiString & filename, opencascade::handle<TDocStd_Document> & doc);

		/****************** Perform ******************/
		/**** md5 signature: 0c7242f646ab395dbb2c841dfb6a918f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Translate step file given by filename into the document return true if succeeded, and false in case of fail.

Parameters
----------
filename: char *
doc: TDocStd_Document

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const char * filename, opencascade::handle<TDocStd_Document> & doc);

		/****************** ReadFile ******************/
		/**** md5 signature: 0c5675761cd6df0c5f286882695ad872 ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Loads a file and returns the read status provided for use like single-file reader.

Parameters
----------
filename: char *

Returns
-------
IFSelect_ReturnStatus
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * filename);

		/****************** Reader ******************/
		/**** md5 signature: c54201c04d6a5ca89c65eb2fb14b8396 ****/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns basic reader as const.

Returns
-------
STEPControl_Reader
") Reader;
		const STEPControl_Reader & Reader();

		/****************** SetColorMode ******************/
		/**** md5 signature: e8d41838c31a9460a1c83d84b1f572a1 ****/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "Set colormode for indicate read colors or not.

Parameters
----------
colormode: bool

Returns
-------
None
") SetColorMode;
		void SetColorMode(const Standard_Boolean colormode);

		/****************** SetGDTMode ******************/
		/**** md5 signature: 26501b5d4b403d5cdc2f7f47bdd108a7 ****/
		%feature("compactdefaultargs") SetGDTMode;
		%feature("autodoc", "Set gdt mode for indicate write gdt or not.

Parameters
----------
gdtmode: bool

Returns
-------
None
") SetGDTMode;
		void SetGDTMode(const Standard_Boolean gdtmode);

		/****************** SetLayerMode ******************/
		/**** md5 signature: 3ec21c8de4b114a83bb0b34cb3b98662 ****/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "Set layermode for indicate read layers or not.

Parameters
----------
layermode: bool

Returns
-------
None
") SetLayerMode;
		void SetLayerMode(const Standard_Boolean layermode);

		/****************** SetMatMode ******************/
		/**** md5 signature: a4e85f2c1802858b34ebf1de2281b0d3 ****/
		%feature("compactdefaultargs") SetMatMode;
		%feature("autodoc", "Set material mode.

Parameters
----------
matmode: bool

Returns
-------
None
") SetMatMode;
		void SetMatMode(const Standard_Boolean matmode);

		/****************** SetNameMode ******************/
		/**** md5 signature: 43ccb5d3fb024d8191f251ee74d0f6ba ****/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "Set namemode for indicate read name or not.

Parameters
----------
namemode: bool

Returns
-------
None
") SetNameMode;
		void SetNameMode(const Standard_Boolean namemode);

		/****************** SetPropsMode ******************/
		/**** md5 signature: 97f3b34eb7a1e38c6cf17d5c26f938a6 ****/
		%feature("compactdefaultargs") SetPropsMode;
		%feature("autodoc", "Propsmode for indicate read validation properties or not.

Parameters
----------
propsmode: bool

Returns
-------
None
") SetPropsMode;
		void SetPropsMode(const Standard_Boolean propsmode);

		/****************** SetSHUOMode ******************/
		/**** md5 signature: ad06ed8b923731ee7b75bf3d7074f299 ****/
		%feature("compactdefaultargs") SetSHUOMode;
		%feature("autodoc", "Set shuo mode for indicate write shuo or not.

Parameters
----------
shuomode: bool

Returns
-------
None
") SetSHUOMode;
		void SetSHUOMode(const Standard_Boolean shuomode);

		/****************** SetSourceCodePage ******************/
		/**** md5 signature: aa588b60c23e4bbb2537b739d5a43a57 ****/
		%feature("compactdefaultargs") SetSourceCodePage;
		%feature("autodoc", "Return the encoding of step file for converting names into unicode.

Parameters
----------
theCode: Resource_FormatType

Returns
-------
None
") SetSourceCodePage;
		void SetSourceCodePage(Resource_FormatType theCode);

		/****************** SetViewMode ******************/
		/**** md5 signature: 86451933a668d6b4666beb6106f5e28f ****/
		%feature("compactdefaultargs") SetViewMode;
		%feature("autodoc", "Set view mode.

Parameters
----------
viewmode: bool

Returns
-------
None
") SetViewMode;
		void SetViewMode(const Standard_Boolean viewmode);

		/****************** SourceCodePage ******************/
		/**** md5 signature: e194da071972a41e58548e424201cc2c ****/
		%feature("compactdefaultargs") SourceCodePage;
		%feature("autodoc", "Return the encoding of step file for converting names into unicode. initialized from 'read.stepcaf.codepage' variable by constructor, which is resource_utf8 by default.

Returns
-------
Resource_FormatType
") SourceCodePage;
		Resource_FormatType SourceCodePage();

		/****************** Transfer ******************/
		/**** md5 signature: d7f719b3dd92a9fa3fed0a317b68dc8b ****/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Translates currently loaded step file into the document returns true if succeeded, and false in case of fail provided for use like single-file reader.

Parameters
----------
doc: TDocStd_Document

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(opencascade::handle<TDocStd_Document> & doc);

		/****************** TransferOneRoot ******************/
		/**** md5 signature: c1c131bc8dbfdac8edd776c9d8a17c2c ****/
		%feature("compactdefaultargs") TransferOneRoot;
		%feature("autodoc", "Translates currently loaded step file into the document returns true if succeeded, and false in case of fail provided for use like single-file reader.

Parameters
----------
num: int
doc: TDocStd_Document

Returns
-------
bool
") TransferOneRoot;
		Standard_Boolean TransferOneRoot(const Standard_Integer num, opencascade::handle<TDocStd_Document> & doc);

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
		/****************** STEPCAFControl_Writer ******************/
		/**** md5 signature: b952f46e0b24216811a10c2153805fc2 ****/
		%feature("compactdefaultargs") STEPCAFControl_Writer;
		%feature("autodoc", "Creates a writer with an empty step model and sets colormode, layermode, namemode and propsmode to standard_true.

Returns
-------
None
") STEPCAFControl_Writer;
		 STEPCAFControl_Writer();

		/****************** STEPCAFControl_Writer ******************/
		/**** md5 signature: 70a513d4d628947fa1e98ed8e35359d9 ****/
		%feature("compactdefaultargs") STEPCAFControl_Writer;
		%feature("autodoc", "Creates a reader tool and attaches it to an already existing session clears the session if it was not yet set for step clears the internal data structures.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") STEPCAFControl_Writer;
		 STEPCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** ChangeWriter ******************/
		/**** md5 signature: 9719ebc8336482d007d450c0e3b00713 ****/
		%feature("compactdefaultargs") ChangeWriter;
		%feature("autodoc", "Returns basic reader for root file.

Returns
-------
STEPControl_Writer
") ChangeWriter;
		STEPControl_Writer & ChangeWriter();

		/****************** ExternFile ******************/
		/**** md5 signature: 4f90b7104efa0649e14f70ad09ab8e61 ****/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "Returns data on external file by its original label returns false if no external file with given name is read.

Parameters
----------
L: TDF_Label
ef: STEPCAFControl_ExternFile

Returns
-------
bool
") ExternFile;
		Standard_Boolean ExternFile(const TDF_Label & L, opencascade::handle<STEPCAFControl_ExternFile> & ef);

		/****************** ExternFile ******************/
		/**** md5 signature: ad0d6b0b3be01575d180dd24c55cd264 ****/
		%feature("compactdefaultargs") ExternFile;
		%feature("autodoc", "Returns data on external file by its name returns false if no external file with given name is read.

Parameters
----------
name: char *
ef: STEPCAFControl_ExternFile

Returns
-------
bool
") ExternFile;
		Standard_Boolean ExternFile(const char * name, opencascade::handle<STEPCAFControl_ExternFile> & ef);

		/****************** ExternFiles ******************/
		/**** md5 signature: 1154c88bc3253c7291077317c11363ab ****/
		%feature("compactdefaultargs") ExternFiles;
		%feature("autodoc", "Returns data on external files returns null handle if no external files are read.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>>
") ExternFiles;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>> & ExternFiles();

		/****************** GetColorMode ******************/
		/**** md5 signature: 010da6a8a0e8a61fdb607fd6faba2b56 ****/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****************** GetDimTolMode ******************/
		/**** md5 signature: 2eed8e0bb30a6f85d0c500a8d4b9e16c ****/
		%feature("compactdefaultargs") GetDimTolMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDimTolMode;
		Standard_Boolean GetDimTolMode();

		/****************** GetLayerMode ******************/
		/**** md5 signature: d677385c303e067613f92bc738509727 ****/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****************** GetMaterialMode ******************/
		/**** md5 signature: cda125e3ff8f835393b9894e3f229aea ****/
		%feature("compactdefaultargs") GetMaterialMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetMaterialMode;
		Standard_Boolean GetMaterialMode();

		/****************** GetNameMode ******************/
		/**** md5 signature: 2dd32a893d6f5f4666ac3752ace2d12f ****/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****************** GetPropsMode ******************/
		/**** md5 signature: 3b2f4c2b61084d1e067d83421e0ea81d ****/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetPropsMode;
		Standard_Boolean GetPropsMode();

		/****************** GetSHUOMode ******************/
		/**** md5 signature: 74c5f048b04741ef5abfe259b5c453cd ****/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetSHUOMode;
		Standard_Boolean GetSHUOMode();

		/****************** Init ******************/
		/**** md5 signature: 13544ae418c98602c6eaed6faea8f526 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Clears the internal data structures and attaches to a new session clears the session if it was not yet set for step.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: 568905c89cd5500b59795a9f3620e181 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
doc: TDocStd_Document
filename: TCollection_AsciiString

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & doc, const TCollection_AsciiString & filename);

		/****************** Perform ******************/
		/**** md5 signature: 9c7d09eb0ac5c8058bfcbfedd53d6de8 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Transfers a document and writes it to a step file returns true if translation is ok.

Parameters
----------
doc: TDocStd_Document
filename: char *

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & doc, const char * filename);

		/****************** SetColorMode ******************/
		/**** md5 signature: e8d41838c31a9460a1c83d84b1f572a1 ****/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "Set colormode for indicate write colors or not.

Parameters
----------
colormode: bool

Returns
-------
None
") SetColorMode;
		void SetColorMode(const Standard_Boolean colormode);

		/****************** SetDimTolMode ******************/
		/**** md5 signature: 18d408609aea9a67d1d1e15d923773db ****/
		%feature("compactdefaultargs") SetDimTolMode;
		%feature("autodoc", "Set dimtolmode for indicate write d&gts or not.

Parameters
----------
dimtolmode: bool

Returns
-------
None
") SetDimTolMode;
		void SetDimTolMode(const Standard_Boolean dimtolmode);

		/****************** SetLayerMode ******************/
		/**** md5 signature: 3ec21c8de4b114a83bb0b34cb3b98662 ****/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "Set layermode for indicate write layers or not.

Parameters
----------
layermode: bool

Returns
-------
None
") SetLayerMode;
		void SetLayerMode(const Standard_Boolean layermode);

		/****************** SetMaterialMode ******************/
		/**** md5 signature: ef4abdfa06b076742a69b17150f91d88 ****/
		%feature("compactdefaultargs") SetMaterialMode;
		%feature("autodoc", "Set dimtolmode for indicate write d&gts or not.

Parameters
----------
matmode: bool

Returns
-------
None
") SetMaterialMode;
		void SetMaterialMode(const Standard_Boolean matmode);

		/****************** SetNameMode ******************/
		/**** md5 signature: 43ccb5d3fb024d8191f251ee74d0f6ba ****/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "Set namemode for indicate write name or not.

Parameters
----------
namemode: bool

Returns
-------
None
") SetNameMode;
		void SetNameMode(const Standard_Boolean namemode);

		/****************** SetPropsMode ******************/
		/**** md5 signature: 97f3b34eb7a1e38c6cf17d5c26f938a6 ****/
		%feature("compactdefaultargs") SetPropsMode;
		%feature("autodoc", "Propsmode for indicate write validation properties or not.

Parameters
----------
propsmode: bool

Returns
-------
None
") SetPropsMode;
		void SetPropsMode(const Standard_Boolean propsmode);

		/****************** SetSHUOMode ******************/
		/**** md5 signature: ad06ed8b923731ee7b75bf3d7074f299 ****/
		%feature("compactdefaultargs") SetSHUOMode;
		%feature("autodoc", "Set shuo mode for indicate write shuo or not.

Parameters
----------
shuomode: bool

Returns
-------
None
") SetSHUOMode;
		void SetSHUOMode(const Standard_Boolean shuomode);

		/****************** Transfer ******************/
		/**** md5 signature: 938b13db7f061e7677f1c3954cb8b65e ****/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfers a document (or single label) to a step model the mode of translation of shape is asis if multi is not null pointer, it switches to multifile mode (with external refs), and string pointed by <multi> gives prefix for names of extern files (can be empty string) returns true if translation is ok.

Parameters
----------
doc: TDocStd_Document
mode: STEPControl_StepModelType,optional
	default value is STEPControl_AsIs
multi: char *,optional
	default value is 0

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(const opencascade::handle<TDocStd_Document> & doc, const STEPControl_StepModelType mode = STEPControl_AsIs, const char * multi = 0);

		/****************** Transfer ******************/
		/**** md5 signature: a2dee1edd4b8aa133f9891ecdf1273a8 ****/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Method to transfer part of the document specified by label.

Parameters
----------
L: TDF_Label
mode: STEPControl_StepModelType,optional
	default value is STEPControl_AsIs
multi: char *,optional
	default value is 0

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(const TDF_Label & L, const STEPControl_StepModelType mode = STEPControl_AsIs, const char * multi = 0);

		/****************** Write ******************/
		/**** md5 signature: a2c63443529fcf2508727dc0010cba46 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes all the produced models into file in case of multimodel with extern references, filename will be a name of root file, all other files have names of corresponding parts provided for use like single-file writer.

Parameters
----------
filename: char *

Returns
-------
IFSelect_ReturnStatus
") Write;
		IFSelect_ReturnStatus Write(const char * filename);

		/****************** Writer ******************/
		/**** md5 signature: 70b6d632350a5ba6ff972c4b437432a0 ****/
		%feature("compactdefaultargs") Writer;
		%feature("autodoc", "Returns basic reader as const.

Returns
-------
STEPControl_Writer
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
