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
%define DEIGESDOCSTRING
"DEIGES module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_deiges.html"
%enddef
%module (package="OCC.Core", docstring=DEIGESDOCSTRING) DEIGES


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
#include<DEIGES_module.hxx>

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
%wrap_handle(DEIGES_ConfigurationNode)
%wrap_handle(DEIGES_Provider)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************************
* class DEIGES_ConfigurationNode *
*********************************/
class DEIGES_ConfigurationNode : public DE_ShapeFixConfigurationNode {
	public:
		DEIGES_Parameters InternalParameters;
		/****** DEIGES_ConfigurationNode::DEIGES_ConfigurationNode ******/
		/****** md5 signature: eaf9a3e4765e010bbdcf9cc1cbc34fee ******/
		%feature("compactdefaultargs") DEIGES_ConfigurationNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all fields by default.
") DEIGES_ConfigurationNode;
		 DEIGES_ConfigurationNode();

		/****** DEIGES_ConfigurationNode::DEIGES_ConfigurationNode ******/
		/****** md5 signature: fdf2534edad5408547e8dfdd6fec25be ******/
		%feature("compactdefaultargs") DEIGES_ConfigurationNode;
		%feature("autodoc", "
Parameters
----------
theNode: DEIGES_ConfigurationNode

Return
-------
None

Description
-----------
Copies values of all fields 
Input parameter: theNode object to copy.
") DEIGES_ConfigurationNode;
		 DEIGES_ConfigurationNode(const opencascade::handle<DEIGES_ConfigurationNode> & theNode);

		/****** DEIGES_ConfigurationNode::BuildProvider ******/
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

		/****** DEIGES_ConfigurationNode::CheckContent ******/
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

		/****** DEIGES_ConfigurationNode::Copy ******/
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

		/****** DEIGES_ConfigurationNode::GetExtensions ******/
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

		/****** DEIGES_ConfigurationNode::GetFormat ******/
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

		/****** DEIGES_ConfigurationNode::GetVendor ******/
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

		/****** DEIGES_ConfigurationNode::IsExportSupported ******/
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

		/****** DEIGES_ConfigurationNode::IsImportSupported ******/
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

		/****** DEIGES_ConfigurationNode::Load ******/
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

		/****** DEIGES_ConfigurationNode::Save ******/
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


%make_alias(DEIGES_ConfigurationNode)

%extend DEIGES_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class DEIGES_Parameters *
**************************/
class DEIGES_Parameters {
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

enum WriteMode_BRep {
	WriteMode_BRep_Faces = 0,
	WriteMode_BRep_BRep = 1,
};

enum WriteMode_ConvertSurface {
	WriteMode_ConvertSurface_Off = 0,
	WriteMode_ConvertSurface_On = 1,
};

enum WriteMode_PrecisionMode {
	WriteMode_PrecisionMode_Least = - 1,
	WriteMode_PrecisionMode_Average = 0,
	WriteMode_PrecisionMode_Greatest = 1,
	WriteMode_PrecisionMode_Session = 2,
};

enum WriteMode_PlaneMode {
	WriteMode_PlaneMode_Plane = 0,
	WriteMode_PlaneMode_BSpline = 1,
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

class WriteMode_BRep(IntEnum):
	WriteMode_BRep_Faces = 0
	WriteMode_BRep_BRep = 1
WriteMode_BRep_Faces = WriteMode_BRep.WriteMode_BRep_Faces
WriteMode_BRep_BRep = WriteMode_BRep.WriteMode_BRep_BRep

class WriteMode_ConvertSurface(IntEnum):
	WriteMode_ConvertSurface_Off = 0
	WriteMode_ConvertSurface_On = 1
WriteMode_ConvertSurface_Off = WriteMode_ConvertSurface.WriteMode_ConvertSurface_Off
WriteMode_ConvertSurface_On = WriteMode_ConvertSurface.WriteMode_ConvertSurface_On

class WriteMode_PrecisionMode(IntEnum):
	WriteMode_PrecisionMode_Least = - 1
	WriteMode_PrecisionMode_Average = 0
	WriteMode_PrecisionMode_Greatest = 1
	WriteMode_PrecisionMode_Session = 2
WriteMode_PrecisionMode_Least = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Least
WriteMode_PrecisionMode_Average = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Average
WriteMode_PrecisionMode_Greatest = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Greatest
WriteMode_PrecisionMode_Session = WriteMode_PrecisionMode.WriteMode_PrecisionMode_Session

class WriteMode_PlaneMode(IntEnum):
	WriteMode_PlaneMode_Plane = 0
	WriteMode_PlaneMode_BSpline = 1
WriteMode_PlaneMode_Plane = WriteMode_PlaneMode.WriteMode_PlaneMode_Plane
WriteMode_PlaneMode_BSpline = WriteMode_PlaneMode.WriteMode_PlaneMode_BSpline
};
/* end python proxy for enums */

		ReadMode_BSplineContinuity ReadBSplineContinuity;
		ReadMode_Precision ReadPrecisionMode;
		double ReadPrecisionVal;
		ReadMode_MaxPrecision ReadMaxPrecisionMode;
		double ReadMaxPrecisionVal;
		bool ReadSameParamMode;
		ReadMode_SurfaceCurve ReadSurfaceCurveMode;
		double EncodeRegAngle;
		bool ReadApproxd1;
		bool ReadFaultyEntities;
		bool ReadOnlyVisible;
		bool ReadColor;
		bool ReadName;
		bool ReadLayer;
		WriteMode_BRep WriteBRepMode;
		WriteMode_ConvertSurface WriteConvertSurfaceMode;
		%extend {
			TCollection_AsciiString _get_WriteHeaderAuthor() { return $self->WriteHeaderAuthor; }
			void _set_WriteHeaderAuthor(TCollection_AsciiString theValue) { $self->WriteHeaderAuthor = theValue; }
		}
		%pythoncode {
			WriteHeaderAuthor = property(_get_WriteHeaderAuthor, _set_WriteHeaderAuthor)
		}
		%extend {
			TCollection_AsciiString _get_WriteHeaderCompany() { return $self->WriteHeaderCompany; }
			void _set_WriteHeaderCompany(TCollection_AsciiString theValue) { $self->WriteHeaderCompany = theValue; }
		}
		%pythoncode {
			WriteHeaderCompany = property(_get_WriteHeaderCompany, _set_WriteHeaderCompany)
		}
		%extend {
			TCollection_AsciiString _get_WriteHeaderProduct() { return $self->WriteHeaderProduct; }
			void _set_WriteHeaderProduct(TCollection_AsciiString theValue) { $self->WriteHeaderProduct = theValue; }
		}
		%pythoncode {
			WriteHeaderProduct = property(_get_WriteHeaderProduct, _set_WriteHeaderProduct)
		}
		%extend {
			TCollection_AsciiString _get_WriteHeaderReciever() { return $self->WriteHeaderReciever; }
			void _set_WriteHeaderReciever(TCollection_AsciiString theValue) { $self->WriteHeaderReciever = theValue; }
		}
		%pythoncode {
			WriteHeaderReciever = property(_get_WriteHeaderReciever, _set_WriteHeaderReciever)
		}
		WriteMode_PrecisionMode WritePrecisionMode;
		double WritePrecisionVal;
		WriteMode_PlaneMode WritePlaneMode;
		bool WriteOffsetMode;
		bool WriteColor;
		bool WriteName;
		bool WriteLayer;
		/****** DEIGES_Parameters::DEIGES_Parameters ******/
		/****** md5 signature: bbe3fc1ad85d9e6ea8d9ee31cc0b2af5 ******/
		%feature("compactdefaultargs") DEIGES_Parameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") DEIGES_Parameters;
		 DEIGES_Parameters();

		/****** DEIGES_Parameters::GetDefaultShapeFixParameters ******/
		/****** md5 signature: 0d8a324a66634cb588dbc33c4bcb4b7f ******/
		%feature("compactdefaultargs") GetDefaultShapeFixParameters;
		%feature("autodoc", "Return
-------
DE_ShapeFixParameters

Description
-----------
Returns default shape fix parameters for transferring IGES files.
") GetDefaultShapeFixParameters;
		static DE_ShapeFixParameters GetDefaultShapeFixParameters();

		/****** DEIGES_Parameters::InitFromStatic ******/
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

		/****** DEIGES_Parameters::Reset ******/
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


%extend DEIGES_Parameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class DEIGES_Provider *
************************/
class DEIGES_Provider : public DE_Provider {
	public:
		/****** DEIGES_Provider::DEIGES_Provider ******/
		/****** md5 signature: 6925f19252d321177c34373852c318b1 ******/
		%feature("compactdefaultargs") DEIGES_Provider;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor Configure translation process with global configuration.
") DEIGES_Provider;
		 DEIGES_Provider();

		/****** DEIGES_Provider::DEIGES_Provider ******/
		/****** md5 signature: b784464218e04073dd6079f0fe44cb1f ******/
		%feature("compactdefaultargs") DEIGES_Provider;
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
") DEIGES_Provider;
		 DEIGES_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DEIGES_Provider::GetFormat ******/
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

		/****** DEIGES_Provider::GetVendor ******/
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

		/****** DEIGES_Provider::Read ******/
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

		/****** DEIGES_Provider::Read ******/
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

		/****** DEIGES_Provider::Read ******/
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

		/****** DEIGES_Provider::Read ******/
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

		/****** DEIGES_Provider::Write ******/
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

		/****** DEIGES_Provider::Write ******/
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

		/****** DEIGES_Provider::Write ******/
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

		/****** DEIGES_Provider::Write ******/
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


%make_alias(DEIGES_Provider)

%extend DEIGES_Provider {
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
def DEIGES_Parameters_GetDefaultShapeFixParameters(*args):
	return DEIGES_Parameters.GetDefaultShapeFixParameters(*args)

}
