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
%define RWPLYDOCSTRING
"RWPly module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_rwply.html"
%enddef
%module (package="OCC.Core", docstring=RWPLYDOCSTRING) RWPly


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
#include<RWPly_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<RWMesh_module.hxx>
#include<XCAFPrs_module.hxx>
#include<TDocStd_module.hxx>
#include<TDF_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<XSControl_module.hxx>
#include<TopoDS_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<Aspect_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<Message_module.hxx>
#include<Media_module.hxx>
#include<SelectMgr_module.hxx>
#include<AIS_module.hxx>
#include<TPrsStd_module.hxx>
#include<TDataStd_module.hxx>
#include<Prs3d_module.hxx>
#include<XCAFDoc_module.hxx>
#include<Select3D_module.hxx>
#include<StdSelect_module.hxx>
#include<TopTools_module.hxx>
#include<V3d_module.hxx>
#include<TDataXtd_module.hxx>
#include<TNaming_module.hxx>
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
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import RWMesh.i
%import XCAFPrs.i
%import TDocStd.i
%import TDF.i
%import TColStd.i
%import Message.i
%import Graphic3d.i
%import gp.i
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
%wrap_handle(RWPly_CafWriter)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class RWPly_CafWriter *
************************/
class RWPly_CafWriter : public Standard_Transient {
	public:
		/****************** RWPly_CafWriter ******************/
		/**** md5 signature: 7661adcd345800ddea46b4833fab1685 ****/
		%feature("compactdefaultargs") RWPly_CafWriter;
		%feature("autodoc", "Main constructor. @param[in] thefile path to output ply file.

Parameters
----------
theFile: str

Returns
-------
None
") RWPly_CafWriter;
		 RWPly_CafWriter(TCollection_AsciiString theFile);

		/****************** ChangeCoordinateSystemConverter ******************/
		/**** md5 signature: fd10c9e3345c0c11d37ccaa13f77ec3f ****/
		%feature("compactdefaultargs") ChangeCoordinateSystemConverter;
		%feature("autodoc", "Return transformation from occt to ply coordinate system.

Returns
-------
RWMesh_CoordinateSystemConverter
") ChangeCoordinateSystemConverter;
		RWMesh_CoordinateSystemConverter & ChangeCoordinateSystemConverter();

		/****************** CoordinateSystemConverter ******************/
		/**** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ****/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return transformation from occt to ply coordinate system.

Returns
-------
RWMesh_CoordinateSystemConverter
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****************** DefaultStyle ******************/
		/**** md5 signature: 0cce26cdd3c825de33af4373c0cf99e8 ****/
		%feature("compactdefaultargs") DefaultStyle;
		%feature("autodoc", "Return default material definition to be used for nodes with only color defined.

Returns
-------
XCAFPrs_Style
") DefaultStyle;
		const XCAFPrs_Style & DefaultStyle();

		/****************** HasColors ******************/
		/**** md5 signature: 712f2254ec70a61013d7074011cd5139 ****/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "Return true if point colors should be written; true by default.

Returns
-------
bool
") HasColors;
		bool HasColors();

		/****************** HasFaceId ******************/
		/**** md5 signature: ff6f108da4a312e26c94c269aec89a64 ****/
		%feature("compactdefaultargs") HasFaceId;
		%feature("autodoc", "Return true if face id should be written as element attribute; false by default.

Returns
-------
bool
") HasFaceId;
		bool HasFaceId();

		/****************** HasNormals ******************/
		/**** md5 signature: cebae9ec3e325d610c43710c6d20c302 ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return true if normals should be written; true by default.

Returns
-------
bool
") HasNormals;
		bool HasNormals();

		/****************** HasPartId ******************/
		/**** md5 signature: ce7912932485481d01bf78dff644e6b1 ****/
		%feature("compactdefaultargs") HasPartId;
		%feature("autodoc", "Return true if part id should be written as element attribute; true by default.

Returns
-------
bool
") HasPartId;
		bool HasPartId();

		/****************** HasTexCoords ******************/
		/**** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ****/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return true if uv / texture coordinates should be written; false by default.

Returns
-------
bool
") HasTexCoords;
		bool HasTexCoords();

		/****************** IsDoublePrecision ******************/
		/**** md5 signature: c768d26054fe7836c133ffb1451dd7cd ****/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return true if vertex position should be stored with double floating point precision; false by default.

Returns
-------
bool
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****************** Perform ******************/
		/**** md5 signature: b3c8698b77ac74b0d206a2448964d2ac ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Write ply file and associated mtl material file. triangulation data should be precomputed within shapes! @param[in] thedocument input document @param[in] therootlabels list of root shapes to export @param[in] thelabelfilter optional filter with document nodes to export,  with keys defined by xcafprs_documentexplorer::definechildid() and filled recursively  (leaves and parent assembly nodes at all levels);  when not null, all nodes not included into the map will be ignored @param[in] thefileinfo map with file metadata to put into ply header section @param[in] theprogress optional progress indicator returns false on file writing failure.

Parameters
----------
theDocument: TDocStd_Document
theRootLabels: TDF_LabelSequence
theLabelFilter: TColStd_MapOfAsciiString *
theFileInfo: TColStd_IndexedDataMapOfStringString
theProgress: Message_ProgressRange

Returns
-------
bool
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRootLabels, const TColStd_MapOfAsciiString * theLabelFilter, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****************** Perform ******************/
		/**** md5 signature: 1b913d1bf9a15143b50ebedc5b820192 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Write ply file and associated mtl material file. triangulation data should be precomputed within shapes! @param[in] thedocument input document @param[in] thefileinfo map with file metadata to put into ply header section @param[in] theprogress optional progress indicator returns false on file writing failure.

Parameters
----------
theDocument: TDocStd_Document
theFileInfo: TColStd_IndexedDataMapOfStringString
theProgress: Message_ProgressRange

Returns
-------
bool
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****************** SetColors ******************/
		/**** md5 signature: ba154b7155d7a27211ce6b222d360537 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "Set if point colors should be written.

Parameters
----------
theToWrite: bool

Returns
-------
None
") SetColors;
		void SetColors(bool theToWrite);

		/****************** SetCoordinateSystemConverter ******************/
		/**** md5 signature: 8488d2b612c66076826cc33d2ac72536 ****/
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "Set transformation from occt to ply coordinate system.

Parameters
----------
theConverter: RWMesh_CoordinateSystemConverter

Returns
-------
None
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****************** SetDefaultStyle ******************/
		/**** md5 signature: 69b73a5756eee96becb5ddbe7670a837 ****/
		%feature("compactdefaultargs") SetDefaultStyle;
		%feature("autodoc", "Set default material definition to be used for nodes with only color defined.

Parameters
----------
theStyle: XCAFPrs_Style

Returns
-------
None
") SetDefaultStyle;
		void SetDefaultStyle(const XCAFPrs_Style & theStyle);

		/****************** SetDoublePrecision ******************/
		/**** md5 signature: 87f899aebadbaf3c77ac480419c2a513 ****/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "Set if vertex position should be stored with double floating point precision.

Parameters
----------
theDoublePrec: bool

Returns
-------
None
") SetDoublePrecision;
		void SetDoublePrecision(bool theDoublePrec);

		/****************** SetFaceId ******************/
		/**** md5 signature: ef237c04b3b19f455778705d5f7bd51c ****/
		%feature("compactdefaultargs") SetFaceId;
		%feature("autodoc", "Set if face id should be written as element attribute; false by default. cannot be combined with haspartid().

Parameters
----------
theSurfId: bool

Returns
-------
None
") SetFaceId;
		void SetFaceId(bool theSurfId);

		/****************** SetNormals ******************/
		/**** md5 signature: c17e8893570a40ab30ed9c9800b14305 ****/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "Set if normals are defined.

Parameters
----------
theHasNormals: bool

Returns
-------
None
") SetNormals;
		void SetNormals(const bool theHasNormals);

		/****************** SetPartId ******************/
		/**** md5 signature: 80dd08549ed4fc61f3bd1130862f0b61 ****/
		%feature("compactdefaultargs") SetPartId;
		%feature("autodoc", "Set if part id should be written as element attribute; false by default. cannot be combined with hasfaceid().

Parameters
----------
theSurfId: bool

Returns
-------
None
") SetPartId;
		void SetPartId(bool theSurfId);

		/****************** SetTexCoords ******************/
		/**** md5 signature: 1ccc8f9785a944bcf850c64e7095429d ****/
		%feature("compactdefaultargs") SetTexCoords;
		%feature("autodoc", "Set if uv / texture coordinates should be written.

Parameters
----------
theHasTexCoords: bool

Returns
-------
None
") SetTexCoords;
		void SetTexCoords(const bool theHasTexCoords);

};


%make_alias(RWPly_CafWriter)

%extend RWPly_CafWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWPly_ConfigurationNode *
********************************/
class RWPly_ConfigurationNode : public DE_ConfigurationNode {
	public:
		class RWPly_InternalSection {};
		RWPly_InternalSection InternalParameters;
		/****************** RWPly_ConfigurationNode ******************/
		/**** md5 signature: 122eb8f7fe95688fbf89fba50434510b ****/
		%feature("compactdefaultargs") RWPly_ConfigurationNode;
		%feature("autodoc", "Initializes all field by default.

Returns
-------
None
") RWPly_ConfigurationNode;
		 RWPly_ConfigurationNode();

		/****************** RWPly_ConfigurationNode ******************/
		/**** md5 signature: 4a8817e7dde67848475c0ea90afcfa74 ****/
		%feature("compactdefaultargs") RWPly_ConfigurationNode;
		%feature("autodoc", "Copies values of all fields @param[in] thenode object to copy.

Parameters
----------
theNode: RWPly_ConfigurationNode

Returns
-------
None
") RWPly_ConfigurationNode;
		 RWPly_ConfigurationNode(const opencascade::handle<RWPly_ConfigurationNode> & theNode);

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


%extend RWPly_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWPly_PlyWriterContext *
*******************************/
class RWPly_PlyWriterContext {
	public:
		/****************** RWPly_PlyWriterContext ******************/
		/**** md5 signature: 0095ac9359582033889154c7b0a2951a ****/
		%feature("compactdefaultargs") RWPly_PlyWriterContext;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWPly_PlyWriterContext;
		 RWPly_PlyWriterContext();

		/****************** Close ******************/
		/**** md5 signature: 72688dacad445840522982ccaf6d1fc3 ****/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Correctly close the file. returns false in case of writing error.

Parameters
----------
theIsAborted: bool,optional
	default value is false

Returns
-------
bool
") Close;
		bool Close(bool theIsAborted = false);

		/****************** HasColors ******************/
		/**** md5 signature: 712f2254ec70a61013d7074011cd5139 ****/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "Return true if point colors should be written as vertex attribute; false by default.

Returns
-------
bool
") HasColors;
		bool HasColors();

		/****************** HasNormals ******************/
		/**** md5 signature: cebae9ec3e325d610c43710c6d20c302 ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return true if normals should be written as vertex attribute; false by default.

Returns
-------
bool
") HasNormals;
		bool HasNormals();

		/****************** HasSurfaceId ******************/
		/**** md5 signature: 06476969015b7cfc83bfb928b3eaadfb ****/
		%feature("compactdefaultargs") HasSurfaceId;
		%feature("autodoc", "@name element attributes parameters return true if surface id should be written as element attribute; false by default.

Returns
-------
bool
") HasSurfaceId;
		bool HasSurfaceId();

		/****************** HasTexCoords ******************/
		/**** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ****/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return true if uv / texture coordinates should be written as vertex attribute; false by default.

Returns
-------
bool
") HasTexCoords;
		bool HasTexCoords();

		/****************** IsDoublePrecision ******************/
		/**** md5 signature: c768d26054fe7836c133ffb1451dd7cd ****/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "@name vertex attributes parameters return true if vertex position should be stored with double floating point precision; false by default.

Returns
-------
bool
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****************** IsOpened ******************/
		/**** md5 signature: d6d5671acf3a396e5229c08ea66ce77f ****/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "@name writing into file return true if file has been opened.

Returns
-------
bool
") IsOpened;
		bool IsOpened();

		/****************** NbWrittenElements ******************/
		/**** md5 signature: ecc0b264e1a3bb8d301c86ecffb2c674 ****/
		%feature("compactdefaultargs") NbWrittenElements;
		%feature("autodoc", "Return number of written elements.

Returns
-------
int
") NbWrittenElements;
		Standard_Integer NbWrittenElements();

		/****************** NbWrittenVertices ******************/
		/**** md5 signature: 458f3601ac5013f5a9e9bddd66fefbf5 ****/
		%feature("compactdefaultargs") NbWrittenVertices;
		%feature("autodoc", "Return number of written vertices.

Returns
-------
int
") NbWrittenVertices;
		Standard_Integer NbWrittenVertices();

		/****************** Open ******************/
		/**** md5 signature: 8602e84f6acfb0cc325e9d67eb1ded24 ****/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "Open file for writing.

Parameters
----------
theName: str
theStream: std::shared_ptr<std::ostream>,optional
	default value is std::shared_ptr<std::ostream>()

Returns
-------
bool
") Open;
		bool Open(TCollection_AsciiString theName, const std::shared_ptr<std::ostream> & theStream = std::shared_ptr<std::ostream>());

		/****************** SetColors ******************/
		/**** md5 signature: ba154b7155d7a27211ce6b222d360537 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "Set if point colors should be written.

Parameters
----------
theToWrite: bool

Returns
-------
None
") SetColors;
		void SetColors(bool theToWrite);

		/****************** SetDoublePrecision ******************/
		/**** md5 signature: 87f899aebadbaf3c77ac480419c2a513 ****/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "Set if vertex position should be stored with double floating point precision.

Parameters
----------
theDoublePrec: bool

Returns
-------
None
") SetDoublePrecision;
		void SetDoublePrecision(bool theDoublePrec);

		/****************** SetNormals ******************/
		/**** md5 signature: c17e8893570a40ab30ed9c9800b14305 ****/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "Set if normals should be written.

Parameters
----------
theHasNormals: bool

Returns
-------
None
") SetNormals;
		void SetNormals(const bool theHasNormals);

		/****************** SetSurfaceId ******************/
		/**** md5 signature: dcafc2be1c309fec0b8f815a88dcdca3 ****/
		%feature("compactdefaultargs") SetSurfaceId;
		%feature("autodoc", "Set if surface id should be written as element attribute; false by default.

Parameters
----------
theSurfId: bool

Returns
-------
None
") SetSurfaceId;
		void SetSurfaceId(bool theSurfId);

		/****************** SetSurfaceId ******************/
		/**** md5 signature: ed8fc26aef086d397edb955a4204f8df ****/
		%feature("compactdefaultargs") SetSurfaceId;
		%feature("autodoc", "Set surface id to write with element.

Parameters
----------
theSurfId: int

Returns
-------
None
") SetSurfaceId;
		void SetSurfaceId(Standard_Integer theSurfId);

		/****************** SetTexCoords ******************/
		/**** md5 signature: 1ccc8f9785a944bcf850c64e7095429d ****/
		%feature("compactdefaultargs") SetTexCoords;
		%feature("autodoc", "Set if uv / texture coordinates should be written.

Parameters
----------
theHasTexCoords: bool

Returns
-------
None
") SetTexCoords;
		void SetTexCoords(const bool theHasTexCoords);

		/****************** SetVertexOffset ******************/
		/**** md5 signature: 5670959c498d4f9994771a46e7478e48 ****/
		%feature("compactdefaultargs") SetVertexOffset;
		%feature("autodoc", "Set vertex offset to be applied to element indices.

Parameters
----------
theOffset: int

Returns
-------
None
") SetVertexOffset;
		void SetVertexOffset(Standard_Integer theOffset);

		/****************** SurfaceId ******************/
		/**** md5 signature: ad3e324fc8217dd4e403e63f2070e2a3 ****/
		%feature("compactdefaultargs") SurfaceId;
		%feature("autodoc", "Return surface id to write with element; 0 by default.

Returns
-------
int
") SurfaceId;
		Standard_Integer SurfaceId();

		/****************** VertexOffset ******************/
		/**** md5 signature: 73942f395a32c5fba1ef0d292a102ade ****/
		%feature("compactdefaultargs") VertexOffset;
		%feature("autodoc", "Return vertex offset to be applied to element indices; 0 by default.

Returns
-------
int
") VertexOffset;
		Standard_Integer VertexOffset();

		/****************** WriteHeader ******************/
		/**** md5 signature: 69c697919712d5a86d0d3a637c7dfb3a ****/
		%feature("compactdefaultargs") WriteHeader;
		%feature("autodoc", "Write the header. @param[in] thenbnodes number of vertex nodes @param[in] thenbelems number of mesh elements @param[in] thefileinfo optional comments.

Parameters
----------
theNbNodes: int
theNbElems: int
theFileInfo: TColStd_IndexedDataMapOfStringString

Returns
-------
bool
") WriteHeader;
		bool WriteHeader(const Standard_Integer theNbNodes, const Standard_Integer theNbElems, const TColStd_IndexedDataMapOfStringString & theFileInfo);

		/****************** WriteQuad ******************/
		/**** md5 signature: 6ec1ecdd2b0fdcce6c29fc362c45dad1 ****/
		%feature("compactdefaultargs") WriteQuad;
		%feature("autodoc", "Writing a quad.

Parameters
----------
theQuad: Graphic3d_Vec4i

Returns
-------
bool
") WriteQuad;
		bool WriteQuad(const Graphic3d_Vec4i & theQuad);

		/****************** WriteTriangle ******************/
		/**** md5 signature: 7386d86fd240dee0a67bac21ae95cc21 ****/
		%feature("compactdefaultargs") WriteTriangle;
		%feature("autodoc", "Writing a triangle.

Parameters
----------
theTri: Graphic3d_Vec3i

Returns
-------
bool
") WriteTriangle;
		bool WriteTriangle(const Graphic3d_Vec3i & theTri);

		/****************** WriteVertex ******************/
		/**** md5 signature: 7558b6ad6baeec647d11f7cdfc88e01f ****/
		%feature("compactdefaultargs") WriteVertex;
		%feature("autodoc", "Write single point with all attributes. @param[in] thepoint 3d point coordinates @param[in] thenorm surface normal direction at the point @param[in] theuv surface/texture uv coordinates @param[in] thecolor rgb color values.

Parameters
----------
thePoint: gp_Pnt
theNorm: Graphic3d_Vec3
theUV: Graphic3d_Vec2
theColor: Graphic3d_Vec4ub

Returns
-------
bool
") WriteVertex;
		bool WriteVertex(const gp_Pnt & thePoint, const Graphic3d_Vec3 & theNorm, const Graphic3d_Vec2 & theUV, const Graphic3d_Vec4ub & theColor);

};


%extend RWPly_PlyWriterContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWPly_Provider *
***********************/
class RWPly_Provider : public DE_Provider {
	public:
		/****************** RWPly_Provider ******************/
		/**** md5 signature: 6771db1194c61e7bef3f10a1cc580658 ****/
		%feature("compactdefaultargs") RWPly_Provider;
		%feature("autodoc", "Default constructor configure translation process with global configuration.

Returns
-------
None
") RWPly_Provider;
		 RWPly_Provider();

		/****************** RWPly_Provider ******************/
		/**** md5 signature: e76197b0008bdcfe2baa88e2ac114a8a ****/
		%feature("compactdefaultargs") RWPly_Provider;
		%feature("autodoc", "Configure translation process @param[in] thenode object to copy.

Parameters
----------
theNode: DE_ConfigurationNode

Returns
-------
None
") RWPly_Provider;
		 RWPly_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

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

		/****************** Write ******************/
		/**** md5 signature: d1d3f520ef648333a2d1d51e7ecf7636 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param[in] thews current work session @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 5d65a8a954decd50174318516f7bc4f8 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 0d58c2b5e69c703850ad85ac36436410 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param[in] thews current work session @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Write ******************/
		/**** md5 signature: 2e3eef7d4e677163a76bbbdf8a15c79f ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param theprogress[in] progress indicator returns true if write operation has ended correctly.

Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Write;
		virtual bool Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend RWPly_Provider {
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
