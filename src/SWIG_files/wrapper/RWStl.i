/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
%define RWSTLDOCSTRING
"RWStl module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_rwstl.html"
%enddef
%module (package="OCC.Core", docstring=RWSTLDOCSTRING) RWStl


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


%{
#include<RWStl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<OSD_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<TopoDS_module.hxx>
#include<TShort_module.hxx>
#include<Bnd_module.hxx>
#include<IFSelect_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<MoniTool_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import OSD.i
%import Message.i
%import Poly.i
%import TColStd.i
%import TCollection.i
%import TDocStd.i
%import XSControl.i
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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class RWStl *
**************/
%rename(rwstl) RWStl;
class RWStl {
	public:
		/****************** ReadAscii ******************/
		/**** md5 signature: a4082bfc34c1229bc435c44951da6960 ****/
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "Read triangulation from an ascii stl file in case of error, returns null handle.

Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadAscii;
		static opencascade::handle<Poly_Triangulation> ReadAscii(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadBinary ******************/
		/**** md5 signature: 715829aa852a6829b2792b5ff41018e6 ****/
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "Read triangulation from a binary stl file in case of error, returns null handle.

Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadBinary;
		static opencascade::handle<Poly_Triangulation> ReadBinary(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadFile ******************/
		/**** md5 signature: 64c7a7ea1e7b324b70672cedadb30bca ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and returns its content as triangulation. in case of error, returns null handle.

Parameters
----------
theFile: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const OSD_Path & theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadFile ******************/
		/**** md5 signature: 742addde06afd9d8130198556696e689 ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and returns its content as triangulation. in case of error, returns null handle.

Parameters
----------
theFile: char *
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const char * theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadFile ******************/
		/**** md5 signature: 752aa6341824937d3d7f5d58f0ca70e0 ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and returns its content as triangulation. @param[in] thefile file path to read @param[in] themergeangle maximum angle in radians between triangles to merge equal nodes; m_pi/2 means ignore angle @param[in] theprogress progress indicator returns result triangulation or null in case of error.

Parameters
----------
theFile: char *
theMergeAngle: float
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const char * theFile, const Standard_Real theMergeAngle, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadFile ******************/
		/**** md5 signature: c6a3a71adb575f87eef05ec5d74e495a ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and fills triangulation list for multi-domain case. @param[in] thefile file path to read @param[in] themergeangle maximum angle in radians between triangles to merge equal nodes; m_pi/2 means ignore angle @param[out] thetrianglist triangulation list for multi-domain case @param[in] theprogress progress indicator.

Parameters
----------
theFile: char *
theMergeAngle: float
theTriangList: Poly_Triangulation
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
None
") ReadFile;
		static void ReadFile(const char * theFile, const Standard_Real theMergeAngle, NCollection_Sequence<opencascade::handle<Poly_Triangulation> > & theTriangList, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** WriteAscii ******************/
		/**** md5 signature: 8cb39ba5b5c9e3b27f4e1ec1bd12de9c ****/
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "Write the meshing in a file following the ascii format of an stl file. returns false if the cannot be opened;.

Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") WriteAscii;
		static Standard_Boolean WriteAscii(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** WriteBinary ******************/
		/**** md5 signature: 3a7e5b47e0a20ed5065a6f3593a90ac4 ****/
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "Write triangulation to binary stl file. binary format of an stl file. returns false if the cannot be opened;.

Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") WriteBinary;
		static Standard_Boolean WriteBinary(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend RWStl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStl_ConfigurationNode *
********************************/
class RWStl_ConfigurationNode : public DE_ConfigurationNode {
	public:
		class RWStl_InternalSection {};
		RWStl_InternalSection InternalParameters;
		/****************** RWStl_ConfigurationNode ******************/
		/**** md5 signature: d26af6e8353fcb13772912acf02ff7f2 ****/
		%feature("compactdefaultargs") RWStl_ConfigurationNode;
		%feature("autodoc", "Initializes all field by default.

Returns
-------
None
") RWStl_ConfigurationNode;
		 RWStl_ConfigurationNode();

		/****************** RWStl_ConfigurationNode ******************/
		/**** md5 signature: 6922c706819602fe0b180cba8a90d054 ****/
		%feature("compactdefaultargs") RWStl_ConfigurationNode;
		%feature("autodoc", "Copies values of all fields @param[in] thenode object to copy.

Parameters
----------
theNode: RWStl_ConfigurationNode

Returns
-------
None
") RWStl_ConfigurationNode;
		 RWStl_ConfigurationNode(const opencascade::handle<RWStl_ConfigurationNode> & theNode);

		/****************** BuildProvider ******************/
		/**** md5 signature: 732af66bf7bddbff6fa20c9629ec35a7 ****/
		%feature("compactdefaultargs") BuildProvider;
		%feature("autodoc", "Creates new provider for the own format returns new created provider.

Returns
-------
opencascade::handle<DE_Provider>
") BuildProvider;
		virtual opencascade::handle<DE_Provider> BuildProvider();

		/****************** CheckContent ******************/
		/**** md5 signature: 2a770b41fb754bfe0ef0260c549f4919 ****/
		%feature("compactdefaultargs") CheckContent;
		%feature("autodoc", "Checks the file content to verify a format @param[in] thebuffer read stream buffer to check content returns standard_true if file is supported by a current provider.

Parameters
----------
theBuffer: NCollection_Buffer

Returns
-------
bool
") CheckContent;
		virtual bool CheckContent(const opencascade::handle<NCollection_Buffer> & theBuffer);

		/****************** Copy ******************/
		/**** md5 signature: 4559608ebdab2961e97de40732291656 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copies values of all fields returns new object with the same field values.

Returns
-------
opencascade::handle<DE_ConfigurationNode>
") Copy;
		virtual opencascade::handle<DE_ConfigurationNode> Copy();

		/****************** GetExtensions ******************/
		/**** md5 signature: a58fd9c22a501a38d695eed6406f94bb ****/
		%feature("compactdefaultargs") GetExtensions;
		%feature("autodoc", "Gets list of supported file extensions returns list of extensions.

Returns
-------
TColStd_ListOfAsciiString
") GetExtensions;
		virtual TColStd_ListOfAsciiString GetExtensions();

		/****************** GetFormat ******************/
		/**** md5 signature: 3a7e97ac1131aefae2f717c160d31ca9 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Gets cad format name of associated provider returns provider cad format.

Returns
-------
TCollection_AsciiString
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****************** GetVendor ******************/
		/**** md5 signature: dec3ae3842639c0f3f7b51f11891135d ****/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Gets provider's vendor name of associated provider returns provider's vendor name.

Returns
-------
TCollection_AsciiString
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****************** IsExportSupported ******************/
		/**** md5 signature: 7b5a27f839d52b595deb06dd28df5230 ****/
		%feature("compactdefaultargs") IsExportSupported;
		%feature("autodoc", "Checks the export supporting returns true if export is supported.

Returns
-------
bool
") IsExportSupported;
		virtual bool IsExportSupported();

		/****************** IsImportSupported ******************/
		/**** md5 signature: 54f008ecb7de4dd5dcaeefb3d1d06abc ****/
		%feature("compactdefaultargs") IsImportSupported;
		%feature("autodoc", "Checks the import supporting returns true if import is supported.

Returns
-------
bool
") IsImportSupported;
		virtual bool IsImportSupported();

		/****************** Load ******************/
		/**** md5 signature: 994009254510d81a5f0f9a326a356850 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Updates values according the resource @param[in] theresource input resource to use returns true if theresource loading has ended correctly.

Parameters
----------
theResource: DE_ConfigurationContext

Returns
-------
bool
") Load;
		virtual bool Load(const opencascade::handle<DE_ConfigurationContext> & theResource);

		/****************** Save ******************/
		/**** md5 signature: d6023e92d8565d8e19b0fc2ce7e2a326 ****/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Writes configuration to the string returns result resource string.

Returns
-------
TCollection_AsciiString
") Save;
		virtual TCollection_AsciiString Save();

};


%extend RWStl_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWStl_Provider *
***********************/
class RWStl_Provider : public DE_Provider {
	public:
		/****************** RWStl_Provider ******************/
		/**** md5 signature: 20621107f2f8b09b43296b222bf5c8bf ****/
		%feature("compactdefaultargs") RWStl_Provider;
		%feature("autodoc", "Default constructor configure translation process with global configuration.

Returns
-------
None
") RWStl_Provider;
		 RWStl_Provider();

		/****************** RWStl_Provider ******************/
		/**** md5 signature: d142e250a518828dbec2e4ea13799236 ****/
		%feature("compactdefaultargs") RWStl_Provider;
		%feature("autodoc", "Configure translation process @param[in] thenode object to copy.

Parameters
----------
theNode: DE_ConfigurationNode

Returns
-------
None
") RWStl_Provider;
		 RWStl_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****************** GetFormat ******************/
		/**** md5 signature: 3a7e97ac1131aefae2f717c160d31ca9 ****/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Gets cad format name of associated provider returns provider cad format.

Returns
-------
TCollection_AsciiString
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****************** GetVendor ******************/
		/**** md5 signature: dec3ae3842639c0f3f7b51f11891135d ****/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Gets provider's vendor name of associated provider returns provider's vendor name.

Returns
-------
TCollection_AsciiString
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****************** Read ******************/
		/**** md5 signature: 16f3a93c0e43348246bb95e8cba55754 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param[in] thews current work session @param theprogress[in] progress indicator returns true if read operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Read;
		virtual Standard_Boolean Read(const TCollection_AsciiString & thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 80a7afaed992615710ff04f2244e58af ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param theprogress[in] progress indicator returns true if read operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theDocument: TDocStd_Document
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Read;
		virtual Standard_Boolean Read(const TCollection_AsciiString & thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 160b9f8794c7839a593c81d8887e0933 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param[in] thews current work session @param theprogress[in] progress indicator returns true if read operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Read;
		virtual Standard_Boolean Read(const TCollection_AsciiString & thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 3008ec75ea1c7dea0f617472523275db ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param theprogress[in] progress indicator returns true if read operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theShape: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Read;
		virtual Standard_Boolean Read(const TCollection_AsciiString & thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 93e394221df3c4afc5c4770a04336d3a ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param[in] thews current work session @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual Standard_Boolean Write(const TCollection_AsciiString & thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: f2990aef87163af009a5f37c83657fdd ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theDocument: TDocStd_Document
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual Standard_Boolean Write(const TCollection_AsciiString & thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 6079000f342ac160d056ffb0a9360302 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param[in] thews current work session @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual Standard_Boolean Write(const TCollection_AsciiString & thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 3b6e60d4eb25fa5818fa82e89a4fc295 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: TCollection_AsciiString
theShape: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual Standard_Boolean Write(const TCollection_AsciiString & thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend RWStl_Provider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class RWStl_Reader *
*********************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class RWStl_Reader:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
