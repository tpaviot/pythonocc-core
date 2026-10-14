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
%define DEXCAFDOCSTRING
"DEXCAF module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_dexcaf.html"
%enddef
%module (package="OCC.Core", docstring=DEXCAFDOCSTRING) DEXCAF


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
#include<DEXCAF_module.hxx>

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
// nested classes wrapped as top level classes
typedef DEXCAF_ConfigurationNode::XCAFDoc_InternalSection DEXCAF_ConfigurationNode_XCAFDoc_InternalSection;
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
%wrap_handle(DEXCAF_ConfigurationNode)
%wrap_handle(DEXCAF_Provider)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************************
* class DEXCAF_ConfigurationNode *
*********************************/
class DEXCAF_ConfigurationNode : public DE_ConfigurationNode {
	public:
		DEXCAF_ConfigurationNode_XCAFDoc_InternalSection InternalParameters;
		/****** DEXCAF_ConfigurationNode::DEXCAF_ConfigurationNode ******/
		/****** md5 signature: 64ab8fe2f0a013e2e1ca5fbfcddae220 ******/
		%feature("compactdefaultargs") DEXCAF_ConfigurationNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all field by default.
") DEXCAF_ConfigurationNode;
		 DEXCAF_ConfigurationNode();

		/****** DEXCAF_ConfigurationNode::DEXCAF_ConfigurationNode ******/
		/****** md5 signature: b07d0f6725f76701026898b2f2648769 ******/
		%feature("compactdefaultargs") DEXCAF_ConfigurationNode;
		%feature("autodoc", "
Parameters
----------
theNode: DEXCAF_ConfigurationNode

Return
-------
None

Description
-----------
Copies values of all fields 
Input parameter: theNode object to copy.
") DEXCAF_ConfigurationNode;
		 DEXCAF_ConfigurationNode(const opencascade::handle<DEXCAF_ConfigurationNode> & theNode);

		/****** DEXCAF_ConfigurationNode::BuildProvider ******/
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

		/****** DEXCAF_ConfigurationNode::CheckContent ******/
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

		/****** DEXCAF_ConfigurationNode::Copy ******/
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

		/****** DEXCAF_ConfigurationNode::GetExtensions ******/
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

		/****** DEXCAF_ConfigurationNode::GetFormat ******/
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

		/****** DEXCAF_ConfigurationNode::GetVendor ******/
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

		/****** DEXCAF_ConfigurationNode::IsExportSupported ******/
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

		/****** DEXCAF_ConfigurationNode::IsImportSupported ******/
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

		/****** DEXCAF_ConfigurationNode::Load ******/
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

		/****** DEXCAF_ConfigurationNode::Save ******/
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


%make_alias(DEXCAF_ConfigurationNode)

%extend DEXCAF_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class DEXCAF_ConfigurationNode_XCAFDoc_InternalSection *
*********************************************************/
class DEXCAF_ConfigurationNode_XCAFDoc_InternalSection {
	public:
};


%extend DEXCAF_ConfigurationNode_XCAFDoc_InternalSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class DEXCAF_Provider *
************************/
class DEXCAF_Provider : public DE_Provider {
	public:
		/****** DEXCAF_Provider::DEXCAF_Provider ******/
		/****** md5 signature: 1745b81b10f1c05f68d8626be937bf92 ******/
		%feature("compactdefaultargs") DEXCAF_Provider;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor Configure translation process with global configuration.
") DEXCAF_Provider;
		 DEXCAF_Provider();

		/****** DEXCAF_Provider::DEXCAF_Provider ******/
		/****** md5 signature: 094a56ab9349fc2bb592127578001e64 ******/
		%feature("compactdefaultargs") DEXCAF_Provider;
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
") DEXCAF_Provider;
		 DEXCAF_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** DEXCAF_Provider::GetFormat ******/
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

		/****** DEXCAF_Provider::GetVendor ******/
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

		/****** DEXCAF_Provider::Read ******/
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

		/****** DEXCAF_Provider::Read ******/
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

		/****** DEXCAF_Provider::Read ******/
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

		/****** DEXCAF_Provider::Read ******/
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

		/****** DEXCAF_Provider::Write ******/
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

		/****** DEXCAF_Provider::Write ******/
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

		/****** DEXCAF_Provider::Write ******/
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

		/****** DEXCAF_Provider::Write ******/
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


%make_alias(DEXCAF_Provider)

%extend DEXCAF_Provider {
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
