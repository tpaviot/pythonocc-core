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
		%feature("compactdefaultargs") STEPCAFControl_ActorWrite;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPCAFControl_ActorWrite;
		 STEPCAFControl_ActorWrite();

		/****************** ClearMap ******************/
		%feature("compactdefaultargs") ClearMap;
		%feature("autodoc", "Clears map of shapes registered as assemblies.

Returns
-------
None
") ClearMap;
		void ClearMap();

		/****************** IsAssembly ******************/
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
		%feature("compactdefaultargs") STEPCAFControl_Controller;
		%feature("autodoc", "Initializes the use of step norm (the first time).

Returns
-------
None
") STEPCAFControl_Controller;
		 STEPCAFControl_Controller();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") STEPCAFControl_ExternFile;
		%feature("autodoc", "Creates an empty structure.

Returns
-------
None
") STEPCAFControl_ExternFile;
		 STEPCAFControl_ExternFile();

		/****************** GetLabel ******************/
		%feature("compactdefaultargs") GetLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") GetLabel;
		TDF_Label GetLabel();

		/****************** GetLoadStatus ******************/
		%feature("compactdefaultargs") GetLoadStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
IFSelect_ReturnStatus
") GetLoadStatus;
		IFSelect_ReturnStatus GetLoadStatus();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") GetName;
		opencascade::handle<TCollection_HAsciiString> GetName();

		/****************** GetTransferStatus ******************/
		%feature("compactdefaultargs") GetTransferStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetTransferStatus;
		Standard_Boolean GetTransferStatus();

		/****************** GetWS ******************/
		%feature("compactdefaultargs") GetWS;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<XSControl_WorkSession>
") GetWS;
		opencascade::handle<XSControl_WorkSession> GetWS();

		/****************** GetWriteStatus ******************/
		%feature("compactdefaultargs") GetWriteStatus;
		%feature("autodoc", "No available documentation.

Returns
-------
IFSelect_ReturnStatus
") GetWriteStatus;
		IFSelect_ReturnStatus GetWriteStatus();

		/****************** SetLabel ******************/
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
		%feature("compactdefaultargs") STEPCAFControl_GDTProperty;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPCAFControl_GDTProperty;
		 STEPCAFControl_GDTProperty();

		/****************** GetDatumRefModifiers ******************/
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
		%feature("compactdefaultargs") STEPCAFControl_Reader;
		%feature("autodoc", "Creates a reader with an empty step model and sets colormode, layermode, namemode and propsmode to standard_true.

Returns
-------
None
") STEPCAFControl_Reader;
		 STEPCAFControl_Reader();

		/****************** STEPCAFControl_Reader ******************/
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
		%feature("compactdefaultargs") ChangeReader;
		%feature("autodoc", "Returns basic reader.

Returns
-------
STEPControl_Reader
") ChangeReader;
		STEPControl_Reader & ChangeReader();

		/****************** ExternFile ******************/
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
		%feature("compactdefaultargs") ExternFiles;
		%feature("autodoc", "Returns data on external files returns null handle if no external files are read.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>>
") ExternFiles;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>> & ExternFiles();

		/****************** FindInstance ******************/
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
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****************** GetGDTMode ******************/
		%feature("compactdefaultargs") GetGDTMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetGDTMode;
		Standard_Boolean GetGDTMode();

		/****************** GetLayerMode ******************/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****************** GetMatMode ******************/
		%feature("compactdefaultargs") GetMatMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetMatMode;
		Standard_Boolean GetMatMode();

		/****************** GetNameMode ******************/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****************** GetPropsMode ******************/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetPropsMode;
		Standard_Boolean GetPropsMode();

		/****************** GetSHUOMode ******************/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetSHUOMode;
		Standard_Boolean GetSHUOMode();

		/****************** GetViewMode ******************/
		%feature("compactdefaultargs") GetViewMode;
		%feature("autodoc", "Get view mode.

Returns
-------
bool
") GetViewMode;
		Standard_Boolean GetViewMode();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Returns number of roots recognized for transfer shortcut for reader().nbrootsfortransfer().

Returns
-------
int
") NbRootsForTransfer;
		Standard_Integer NbRootsForTransfer();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns basic reader as const.

Returns
-------
STEPControl_Reader
") Reader;
		const STEPControl_Reader & Reader();

		/****************** SetColorMode ******************/
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
		%feature("compactdefaultargs") SourceCodePage;
		%feature("autodoc", "Return the encoding of step file for converting names into unicode. initialized from 'read.stepcaf.codepage' variable by constructor, which is resource_utf8 by default.

Returns
-------
Resource_FormatType
") SourceCodePage;
		Resource_FormatType SourceCodePage();

		/****************** Transfer ******************/
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
		%feature("compactdefaultargs") STEPCAFControl_Writer;
		%feature("autodoc", "Creates a writer with an empty step model and sets colormode, layermode, namemode and propsmode to standard_true.

Returns
-------
None
") STEPCAFControl_Writer;
		 STEPCAFControl_Writer();

		/****************** STEPCAFControl_Writer ******************/
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
		%feature("compactdefaultargs") ChangeWriter;
		%feature("autodoc", "Returns basic reader for root file.

Returns
-------
STEPControl_Writer
") ChangeWriter;
		STEPControl_Writer & ChangeWriter();

		/****************** ExternFile ******************/
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
		%feature("compactdefaultargs") ExternFiles;
		%feature("autodoc", "Returns data on external files returns null handle if no external files are read.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>>
") ExternFiles;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<STEPCAFControl_ExternFile>> & ExternFiles();

		/****************** GetColorMode ******************/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****************** GetDimTolMode ******************/
		%feature("compactdefaultargs") GetDimTolMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetDimTolMode;
		Standard_Boolean GetDimTolMode();

		/****************** GetLayerMode ******************/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****************** GetMaterialMode ******************/
		%feature("compactdefaultargs") GetMaterialMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetMaterialMode;
		Standard_Boolean GetMaterialMode();

		/****************** GetNameMode ******************/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****************** GetPropsMode ******************/
		%feature("compactdefaultargs") GetPropsMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetPropsMode;
		Standard_Boolean GetPropsMode();

		/****************** GetSHUOMode ******************/
		%feature("compactdefaultargs") GetSHUOMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetSHUOMode;
		Standard_Boolean GetSHUOMode();

		/****************** Init ******************/
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
