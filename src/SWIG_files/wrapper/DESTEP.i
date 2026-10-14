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
%define DESTEPDOCSTRING
"DESTEP module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_destep.html"
%enddef
%module (package="OCC.Core", docstring=DESTEPDOCSTRING) DESTEP


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
#include<DESTEP_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<DE_module.hxx>
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<DE_module.hxx>
#include<CDF_module.hxx>
#include<TopTools_module.hxx>
#include<Transfer_module.hxx>
#include<TDF_module.hxx>
#include<PCDM_module.hxx>
#include<MoniTool_module.hxx>
#include<Interface_module.hxx>
#include<IFSelect_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
#include<OSD_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import DE.i
%import TCollection.i
%import TDocStd.i
%import XSControl.i
%import Message.i
%import TopoDS.i

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
%wrap_handle(DESTEP_ConfigurationNode)
%wrap_handle(DESTEP_Provider)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************************
* class DESTEP_ConfigurationNode *
*********************************/
class DESTEP_ConfigurationNode : public DE_ShapeFixConfigurationNode {
	public:
		/****** DESTEP_ConfigurationNode::DESTEP_ConfigurationNode ******/
		/****** md5 signature: b06d4e4af1e28f7f8fb9dc743e281d60 ******/
		%feature("compactdefaultargs") DESTEP_ConfigurationNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all field by default.
") DESTEP_ConfigurationNode;
		 DESTEP_ConfigurationNode();

		/****** DESTEP_ConfigurationNode::DESTEP_ConfigurationNode ******/
		/****** md5 signature: 00ad4561a800869d77154d8781c7ffd7 ******/
		%feature("compactdefaultargs") DESTEP_ConfigurationNode;
		%feature("autodoc", "
Parameters
----------
theNode: DESTEP_ConfigurationNode

Return
-------
None

Description
-----------
Copies values of all fields 
Input parameter: theNode object to copy.
") DESTEP_ConfigurationNode;
		 DESTEP_ConfigurationNode(const opencascade::handle<DESTEP_ConfigurationNode> & theNode);

		/****** DESTEP_ConfigurationNode::BuildProvider ******/
		/****** md5 signature: 87d6bc6211a7554664bc47d6e18a4e82 ******/
		%feature("compactdefaultargs") BuildProvider;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_Provider>

Description
-----------
Creates new provider for the own format 
Return: new created provider.
") BuildProvider;
		opencascade::handle<DE_Provider> BuildProvider();

		/****** DESTEP_ConfigurationNode::CheckContent ******/
		/****** md5 signature: 3420730fd5d57889d8e025918930b943 ******/
		%feature("compactdefaultargs") CheckContent;
		%feature("autodoc", "
Parameters
----------
theBuffer: NCollection_Buffer

Return
-------
bool

Description
-----------
Checks the file content to verify a format 
Input parameter: theBuffer read stream buffer to check content 
Return: true if file is supported by a current provider.
") CheckContent;
		bool CheckContent(const opencascade::handle<NCollection_Buffer> & theBuffer);

		/****** DESTEP_ConfigurationNode::Copy ******/
		/****** md5 signature: 534198c2cff87d64818c25edefcff80d ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_ConfigurationNode>

Description
-----------
Copies values of all fields 
Return: new object with the same field values.
") Copy;
		opencascade::handle<DE_ConfigurationNode> Copy();

		/****** DESTEP_ConfigurationNode::GetExtensions ******/
		/****** md5 signature: aea0ab27aef8c44f3c60172faa6aa87e ******/
		%feature("compactdefaultargs") GetExtensions;
		%feature("autodoc", "Return
-------
NCollection_List<TCollection_AsciiString >

Description
-----------
Gets list of supported file extensions 
Return: list of extensions.
") GetExtensions;
		NCollection_List<TCollection_AsciiString > GetExtensions();

		/****** DESTEP_ConfigurationNode::GetFormat ******/
		/****** md5 signature: ae454fe472bb46380baf4d2d523640cd ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets CAD format name of associated provider 
Return: provider CAD format.
") GetFormat;
		TCollection_AsciiString GetFormat();

		/****** DESTEP_ConfigurationNode::GetVendor ******/
		/****** md5 signature: 4ae72381dc7a23ca2635bbf39fe10a40 ******/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider 
Return: provider's vendor name.
") GetVendor;
		TCollection_AsciiString GetVendor();

		/****** DESTEP_ConfigurationNode::IsExportSupported ******/
		/****** md5 signature: cab985dafd6dc2f593f65308071ebec4 ******/
		%feature("compactdefaultargs") IsExportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the export supporting 
Return: true if export is supported.
") IsExportSupported;
		bool IsExportSupported();

		/****** DESTEP_ConfigurationNode::IsImportSupported ******/
		/****** md5 signature: 93f12033a77772522f231f57253bce2e ******/
		%feature("compactdefaultargs") IsImportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the import supporting 
Return: true if import is supported.
") IsImportSupported;
		bool IsImportSupported();

		/****** DESTEP_ConfigurationNode::IsStreamSupported ******/
		/****** md5 signature: e1fe821ad7663b1ad7969c3309a3b4c0 ******/
		%feature("compactdefaultargs") IsStreamSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks for stream support. 
Return: true if streams are supported.
") IsStreamSupported;
		bool IsStreamSupported();

		/****** DESTEP_ConfigurationNode::Load ******/
		/****** md5 signature: cb8d9f5c44ca24bfff6cfd104339c2c8 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResource: DE_ConfigurationContext

Return
-------
bool

Description
-----------
Updates values according the resource 
Input parameter: theResource input resource to use 
Return: true if theResource loading has ended correctly.
") Load;
		bool Load(const opencascade::handle<DE_ConfigurationContext> & theResource);

		/****** DESTEP_ConfigurationNode::Save ******/
		/****** md5 signature: 972ded6e05f14c55acb6d3bcf0f132a6 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Writes configuration to the string 
Return: result resource string.
") Save;
		TCollection_AsciiString Save();

};


%make_alias(DESTEP_ConfigurationNode)

%extend DESTEP_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class DESTEP_Parameters *
**************************/
class DESTEP_Parameters {
	public:
/* public enums */
enum ReadMode_BSplineContinuity {
	ReadMode_BSplineContinuity_C0 = 0,
	ReadMode_BSplineContinuity_C1 = 1,
	ReadMode_BSplineContinuity_C2 = 2,
};

enum ReadMode_Precision {
	ReadMode_Precision_File = 0,
	ReadMode_Precision_User = 1,
};

enum ReadMode_MaxPrecision {
	ReadMode_MaxPrecision_Preferred = 0,
	ReadMode_MaxPrecision_Forced = 1,
};

enum ReadMode_SurfaceCurve {
	ReadMode_SurfaceCurve_Default = 0,
	ReadMode_SurfaceCurve_2DUse_Preferred = 2,
	ReadMode_SurfaceCurve_2DUse_Forced = - 2,
	ReadMode_SurfaceCurve_3DUse_Preferred = 3,
	ReadMode_SurfaceCurve_3DUse_Forced = - 3,
};

enum AngleUnitMode {
	AngleUnitMode_File = 0,
	AngleUnitMode_Rad = 1,
	AngleUnitMode_Deg = 2,
};

enum ReadMode_ProductContext {
	ReadMode_ProductContext_All = 1,
	ReadMode_ProductContext_Design = 2,
	ReadMode_ProductContext_Analysis = 3,
};

enum ReadMode_ShapeRepr {
	ReadMode_ShapeRepr_All = 1,
	ReadMode_ShapeRepr_ABSR = 2,
	ReadMode_ShapeRepr_MSSR = 3,
	ReadMode_ShapeRepr_GBSSR = 4,
	ReadMode_ShapeRepr_FBSR = 5,
	ReadMode_ShapeRepr_EBWSR = 6,
	ReadMode_ShapeRepr_GBWSR = 7,
};

enum ReadMode_AssemblyLevel {
	ReadMode_AssemblyLevel_All = 1,
	ReadMode_AssemblyLevel_Assembly = 2,
	ReadMode_AssemblyLevel_Structure = 3,
	ReadMode_AssemblyLevel_Shape = 4,
};

enum RWMode_Tessellated {
	RWMode_Tessellated_Off = 0,
	RWMode_Tessellated_On = 1,
	RWMode_Tessellated_OnNoBRep = 2,
};

enum WriteMode_PrecisionMode {
	WriteMode_PrecisionMode_Least = - 1,
	WriteMode_PrecisionMode_Average = 0,
	WriteMode_PrecisionMode_Greatest = 1,
	WriteMode_PrecisionMode_Session = 2,
};

enum WriteMode_Assembly {
	WriteMode_Assembly_Off = 0,
	WriteMode_Assembly_On = 1,
	WriteMode_Assembly_Auto = 2,
};

enum WriteMode_StepSchema {
	WriteMode_StepSchema_AP214CD = 1,
	WriteMode_StepSchema_AP214DIS = 2,
	WriteMode_StepSchema_AP203 = 3,
	WriteMode_StepSchema_AP214IS = 4,
	WriteMode_StepSchema_AP242DIS = 5,
};

enum WriteMode_VertexMode {
	WriteMode_VertexMode_OneCompound = 0,
	WriteMode_VertexMode_SingleVertex = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class ReadMode_BSplineContinuity(IntEnum):
	ReadMode_BSplineContinuity_C0 = 0
	ReadMode_BSplineContinuity_C1 = 1
	ReadMode_BSplineContinuity_C2 = 2
ReadMode_BSplineContinuity_C0 = ReadMode_BSplineContinuity.ReadMode_BSplineContinuity_C0
ReadMode_BSplineContinuity_C1 = ReadMode_BSplineContinuity.ReadMode_BSplineContinuity_C1
ReadMode_BSplineContinuity_C2 = ReadMode_BSplineContinuity.ReadMode_BSplineContinuity_C2

class ReadMode_Precision(IntEnum):
	ReadMode_Precision_File = 0
	ReadMode_Precision_User = 1
ReadMode_Precision_File = ReadMode_Precision.ReadMode_Precision_File
ReadMode_Precision_User = ReadMode_Precision.ReadMode_Precision_User

class ReadMode_MaxPrecision(IntEnum):
	ReadMode_MaxPrecision_Preferred = 0
	ReadMode_MaxPrecision_Forced = 1
ReadMode_MaxPrecision_Preferred = ReadMode_MaxPrecision.ReadMode_MaxPrecision_Preferred
ReadMode_MaxPrecision_Forced = ReadMode_MaxPrecision.ReadMode_MaxPrecision_Forced

class ReadMode_SurfaceCurve(IntEnum):
	ReadMode_SurfaceCurve_Default = 0
	ReadMode_SurfaceCurve_2DUse_Preferred = 2
	ReadMode_SurfaceCurve_2DUse_Forced = - 2
	ReadMode_SurfaceCurve_3DUse_Preferred = 3
	ReadMode_SurfaceCurve_3DUse_Forced = - 3
ReadMode_SurfaceCurve_Default = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_Default
ReadMode_SurfaceCurve_2DUse_Preferred = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_2DUse_Preferred
ReadMode_SurfaceCurve_2DUse_Forced = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_2DUse_Forced
ReadMode_SurfaceCurve_3DUse_Preferred = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_3DUse_Preferred
ReadMode_SurfaceCurve_3DUse_Forced = ReadMode_SurfaceCurve.ReadMode_SurfaceCurve_3DUse_Forced

class AngleUnitMode(IntEnum):
	AngleUnitMode_File = 0
	AngleUnitMode_Rad = 1
	AngleUnitMode_Deg = 2
AngleUnitMode_File = AngleUnitMode.AngleUnitMode_File
AngleUnitMode_Rad = AngleUnitMode.AngleUnitMode_Rad
AngleUnitMode_Deg = AngleUnitMode.AngleUnitMode_Deg

class ReadMode_ProductContext(IntEnum):
	ReadMode_ProductContext_All = 1
	ReadMode_ProductContext_Design = 2
	ReadMode_ProductContext_Analysis = 3
ReadMode_ProductContext_All = ReadMode_ProductContext.ReadMode_ProductContext_All
ReadMode_ProductContext_Design = ReadMode_ProductContext.ReadMode_ProductContext_Design
ReadMode_ProductContext_Analysis = ReadMode_ProductContext.ReadMode_ProductContext_Analysis

class ReadMode_ShapeRepr(IntEnum):
	ReadMode_ShapeRepr_All = 1
	ReadMode_ShapeRepr_ABSR = 2
	ReadMode_ShapeRepr_MSSR = 3
	ReadMode_ShapeRepr_GBSSR = 4
	ReadMode_ShapeRepr_FBSR = 5
	ReadMode_ShapeRepr_EBWSR = 6
	ReadMode_ShapeRepr_GBWSR = 7
ReadMode_ShapeRepr_All = ReadMode_ShapeRepr.ReadMode_ShapeRepr_All
ReadMode_ShapeRepr_ABSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_ABSR
ReadMode_ShapeRepr_MSSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_MSSR
ReadMode_ShapeRepr_GBSSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_GBSSR
ReadMode_ShapeRepr_FBSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_FBSR
ReadMode_ShapeRepr_EBWSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_EBWSR
ReadMode_ShapeRepr_GBWSR = ReadMode_ShapeRepr.ReadMode_ShapeRepr_GBWSR

class ReadMode_AssemblyLevel(IntEnum):
	ReadMode_AssemblyLevel_All = 1
	ReadMode_AssemblyLevel_Assembly = 2
	ReadMode_AssemblyLevel_Structure = 3
	ReadMode_AssemblyLevel_Shape = 4
ReadMode_AssemblyLevel_All = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_All
ReadMode_AssemblyLevel_Assembly = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_Assembly
ReadMode_AssemblyLevel_Structure = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_Structure
ReadMode_AssemblyLevel_Shape = ReadMode_AssemblyLevel.ReadMode_AssemblyLevel_Shape

class RWMode_Tessellated(IntEnum):
	RWMode_Tessellated_Off = 0
	RWMode_Tessellated_On = 1
	RWMode_Tessellated_OnNoBRep = 2
RWMode_Tessellated_Off = RWMode_Tessellated.RWMode_Tessellated_Off
RWMode_Tessellated_On = RWMode_Tessellated.RWMode_Tessellated_On
RWMode_Tessellated_OnNoBRep = RWMode_Tessellated.RWMode_Tessellated_OnNoBRep

class WriteMode_PrecisionMode(IntEnum):
	WriteMode_PrecisionMode_Least = - 1
	WriteMode_PrecisionMode_Average = 0
	WriteMode_PrecisionMode_Greatest = 1
	WriteMode_PrecisionMode_Session = 2
WriteMode_PrecisionMode_Least = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Least
WriteMode_PrecisionMode_Average = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Average
WriteMode_PrecisionMode_Greatest = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Greatest
WriteMode_PrecisionMode_Session = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Session

class WriteMode_Assembly(IntEnum):
	WriteMode_Assembly_Off = 0
	WriteMode_Assembly_On = 1
	WriteMode_Assembly_Auto = 2
WriteMode_Assembly_Off = WriteMode_Assembly.WriteMode_Assembly_Off
WriteMode_Assembly_On = WriteMode_Assembly.WriteMode_Assembly_On
WriteMode_Assembly_Auto = WriteMode_Assembly.WriteMode_Assembly_Auto

class WriteMode_StepSchema(IntEnum):
	WriteMode_StepSchema_AP214CD = 1
	WriteMode_StepSchema_AP214DIS = 2
	WriteMode_StepSchema_AP203 = 3
	WriteMode_StepSchema_AP214IS = 4
	WriteMode_StepSchema_AP242DIS = 5
WriteMode_StepSchema_AP214CD = WriteMode_StepSchema.WriteMode_StepSchema_AP214CD
WriteMode_StepSchema_AP214DIS = WriteMode_StepSchema.WriteMode_StepSchema_AP214DIS
WriteMode_StepSchema_AP203 = WriteMode_StepSchema.WriteMode_StepSchema_AP203
WriteMode_StepSchema_AP214IS = WriteMode_StepSchema.WriteMode_StepSchema_AP214IS
WriteMode_StepSchema_AP242DIS = WriteMode_StepSchema.WriteMode_StepSchema_AP242DIS

class WriteMode_VertexMode(IntEnum):
	WriteMode_VertexMode_OneCompound = 0
	WriteMode_VertexMode_SingleVertex = 1
WriteMode_VertexMode_OneCompound = WriteMode_VertexMode.WriteMode_VertexMode_OneCompound
WriteMode_VertexMode_SingleVertex = WriteMode_VertexMode.WriteMode_VertexMode_SingleVertex
};
/* end python proxy for enums */

		/****** DESTEP_Parameters::DESTEP_Parameters ******/
		/****** md5 signature: b88464b97e49d1923ede59964e649635 ******/
		%feature("compactdefaultargs") DESTEP_Parameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DESTEP_Parameters;
		 DESTEP_Parameters();

		/****** DESTEP_Parameters::GetDefaultShapeFixParameters ******/
		/****** md5 signature: 0d8a324a66634cb588dbc33c4bcb4b7f ******/
		%feature("compactdefaultargs") GetDefaultShapeFixParameters;
		%feature("autodoc", "Return
-------
DE_ShapeFixParameters

Description
-----------
Returns default shape fix parameters for transferring STEP files.
") GetDefaultShapeFixParameters;
		static DE_ShapeFixParameters GetDefaultShapeFixParameters();

		/****** DESTEP_Parameters::GetString ******/
		/****** md5 signature: 0b97a9f1604c7e3c66fd073f257dbba1 ******/
		%feature("compactdefaultargs") GetString;
		%feature("autodoc", "
Parameters
----------
theMode: ReadMode_ProductContext

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetString;
		TCollection_AsciiString GetString(ReadMode_ProductContext theMode);

		/****** DESTEP_Parameters::InitFromStatic ******/
		/****** md5 signature: de21b82628fd5143cf3f7d14ba546a72 ******/
		%feature("compactdefaultargs") InitFromStatic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initialize parameters.
") InitFromStatic;
		void InitFromStatic();

		/****** DESTEP_Parameters::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset used parameters.
") Reset;
		void Reset();

};


%extend DESTEP_Parameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class DESTEP_Provider *
************************/
class DESTEP_Provider : public DE_Provider {
	public:
		/****** DESTEP_Provider::DESTEP_Provider ******/
		/****** md5 signature: 9ed96ea8697edc674f41625a36219870 ******/
		%feature("compactdefaultargs") DESTEP_Provider;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor Configure translation process with global configuration.
") DESTEP_Provider;
		 DESTEP_Provider();

		/****** DESTEP_Provider::DESTEP_Provider ******/
		/****** md5 signature: ed18f6309414e90abb38a022daf066bd ******/
		%feature("compactdefaultargs") DESTEP_Provider;
		%feature("autodoc", "
Parameters
----------
theNode: DE_ConfigurationNode

Return
-------
None

Description
-----------
Configure translation process 
Input parameter: theNode object to copy.
") DESTEP_Provider;
		 DESTEP_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DESTEP_Provider::GetFormat ******/
		/****** md5 signature: ae454fe472bb46380baf4d2d523640cd ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets CAD format name of associated provider 
Return: provider CAD format.
") GetFormat;
		TCollection_AsciiString GetFormat();

		/****** DESTEP_Provider::GetVendor ******/
		/****** md5 signature: 4ae72381dc7a23ca2635bbf39fe10a40 ******/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider 
Return: provider's vendor name.
") GetVendor;
		TCollection_AsciiString GetVendor();

		/****** DESTEP_Provider::Read ******/
		/****** md5 signature: 5dfd05e4ab141c275bc62a2950a11d4c ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theDocument document to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DESTEP_Provider::Read ******/
		/****** md5 signature: 709ad4b0727aa9a25cea9c379ebd49ec ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theDocument document to save result 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DESTEP_Provider::Read ******/
		/****** md5 signature: e82257a3579f9f2aa96e1fd763b7e316 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theShape shape to save result 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DESTEP_Provider::Read ******/
		/****** md5 signature: f765faed847e46ff8ea8e5ec14bf618e ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a CAD file, according internal configuration 
Input parameter: thePath path to the import CAD file @param[out] theShape shape to save result 
Input parameter: theProgress progress indicator 
Return: true if Read operation has ended correctly.
") Read;
		bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DESTEP_Provider::Write ******/
		/****** md5 signature: b94282d215815d5c400db8e48893a4b1 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theDocument document to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DESTEP_Provider::Write ******/
		/****** md5 signature: b4e3db7dcc64628db795ca055c99e9fc ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theDocument document to export 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DESTEP_Provider::Write ******/
		/****** md5 signature: ac3c8afa797290035b34029f1c902445 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theShape shape to export 
Input parameter: theWS current work session 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** DESTEP_Provider::Write ******/
		/****** md5 signature: fdd223daa29e61435fee950c6d4a87f7 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a CAD file, according internal configuration 
Input parameter: thePath path to the export CAD file @param[out] theShape shape to export 
Input parameter: theProgress progress indicator 
Return: true if Write operation has ended correctly.
") Write;
		bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(DESTEP_Provider)

%extend DESTEP_Provider {
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
def DESTEP_Parameters_GetDefaultShapeFixParameters(*args):
	return DESTEP_Parameters.GetDefaultShapeFixParameters(*args)

}
