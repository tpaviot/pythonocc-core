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
%define RWPLYDOCSTRING
"RWPly module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_rwply.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<XCAFPrs_module.hxx>
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
#include<TopoDS_module.hxx>
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
		/****** RWPly_CafWriter::RWPly_CafWriter ******/
		/****** md5 signature: 7661adcd345800ddea46b4833fab1685 ******/
		%feature("compactdefaultargs") RWPly_CafWriter;
		%feature("autodoc", "
Parameters
----------
theFile: str

Return
-------
None

Description
-----------
Main constructor. 
Input parameter: theFile path to output PLY file.
") RWPly_CafWriter;
		 RWPly_CafWriter(TCollection_AsciiString theFile);

		/****** RWPly_CafWriter::ChangeCoordinateSystemConverter ******/
		/****** md5 signature: fd10c9e3345c0c11d37ccaa13f77ec3f ******/
		%feature("compactdefaultargs") ChangeCoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from OCCT to PLY coordinate system.
") ChangeCoordinateSystemConverter;
		RWMesh_CoordinateSystemConverter & ChangeCoordinateSystemConverter();

		/****** RWPly_CafWriter::CoordinateSystemConverter ******/
		/****** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ******/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from OCCT to PLY coordinate system.
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****** RWPly_CafWriter::DefaultStyle ******/
		/****** md5 signature: 0cce26cdd3c825de33af4373c0cf99e8 ******/
		%feature("compactdefaultargs") DefaultStyle;
		%feature("autodoc", "Return
-------
XCAFPrs_Style

Description
-----------
Return default material definition to be used for nodes with only color defined.
") DefaultStyle;
		const XCAFPrs_Style & DefaultStyle();

		/****** RWPly_CafWriter::HasColors ******/
		/****** md5 signature: 712f2254ec70a61013d7074011cd5139 ******/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if point colors should be written; True by default.
") HasColors;
		bool HasColors();

		/****** RWPly_CafWriter::HasFaceId ******/
		/****** md5 signature: ff6f108da4a312e26c94c269aec89a64 ******/
		%feature("compactdefaultargs") HasFaceId;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if face Id should be written as element attribute; False by default.
") HasFaceId;
		bool HasFaceId();

		/****** RWPly_CafWriter::HasNormals ******/
		/****** md5 signature: cebae9ec3e325d610c43710c6d20c302 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if normals should be written; True by default.
") HasNormals;
		bool HasNormals();

		/****** RWPly_CafWriter::HasPartId ******/
		/****** md5 signature: ce7912932485481d01bf78dff644e6b1 ******/
		%feature("compactdefaultargs") HasPartId;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if part Id should be written as element attribute; True by default.
") HasPartId;
		bool HasPartId();

		/****** RWPly_CafWriter::HasTexCoords ******/
		/****** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ******/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if UV / texture coordinates should be written; False by default.
") HasTexCoords;
		bool HasTexCoords();

		/****** RWPly_CafWriter::IsDoublePrecision ******/
		/****** md5 signature: c768d26054fe7836c133ffb1451dd7cd ******/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if vertex position should be stored with double floating point precision; False by default.
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****** RWPly_CafWriter::Perform ******/
		/****** md5 signature: b3c8698b77ac74b0d206a2448964d2ac ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theRootLabels: TDF_LabelSequence
theLabelFilter: TColStd_MapOfAsciiString *
theFileInfo: TColStd_IndexedDataMapOfStringString
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Write PLY file and associated MTL material file. Triangulation data should be precomputed within shapes! 
Input parameter: theDocument input document 
Input parameter: theRootLabels list of root shapes to export 
Input parameter: theLabelFilter optional filter with document nodes to export,  with keys defined by XCAFPrs_DocumentExplorer::DefineChildId() and  filled recursively (leaves and parent assembly nodes at all levels);  when not NULL, all nodes not included into the map will be ignored 
Input parameter: theFileInfo map with file metadata to put into PLY header section 
Input parameter: theProgress optional progress indicator 
Return: False on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRootLabels, const TColStd_MapOfAsciiString * theLabelFilter, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****** RWPly_CafWriter::Perform ******/
		/****** md5 signature: 1b913d1bf9a15143b50ebedc5b820192 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theDocument: TDocStd_Document
theFileInfo: TColStd_IndexedDataMapOfStringString
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Write PLY file and associated MTL material file. Triangulation data should be precomputed within shapes! 
Input parameter: theDocument input document 
Input parameter: theFileInfo map with file metadata to put into PLY header section 
Input parameter: theProgress optional progress indicator 
Return: False on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****** RWPly_CafWriter::SetColors ******/
		/****** md5 signature: ba154b7155d7a27211ce6b222d360537 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
theToWrite: bool

Return
-------
None

Description
-----------
Set if point colors should be written.
") SetColors;
		void SetColors(bool theToWrite);

		/****** RWPly_CafWriter::SetCoordinateSystemConverter ******/
		/****** md5 signature: 8488d2b612c66076826cc33d2ac72536 ******/
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "
Parameters
----------
theConverter: RWMesh_CoordinateSystemConverter

Return
-------
None

Description
-----------
Set transformation from OCCT to PLY coordinate system.
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****** RWPly_CafWriter::SetDefaultStyle ******/
		/****** md5 signature: 69b73a5756eee96becb5ddbe7670a837 ******/
		%feature("compactdefaultargs") SetDefaultStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style

Return
-------
None

Description
-----------
Set default material definition to be used for nodes with only color defined.
") SetDefaultStyle;
		void SetDefaultStyle(const XCAFPrs_Style & theStyle);

		/****** RWPly_CafWriter::SetDoublePrecision ******/
		/****** md5 signature: 87f899aebadbaf3c77ac480419c2a513 ******/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "
Parameters
----------
theDoublePrec: bool

Return
-------
None

Description
-----------
Set if vertex position should be stored with double floating point precision.
") SetDoublePrecision;
		void SetDoublePrecision(bool theDoublePrec);

		/****** RWPly_CafWriter::SetFaceId ******/
		/****** md5 signature: ef237c04b3b19f455778705d5f7bd51c ******/
		%feature("compactdefaultargs") SetFaceId;
		%feature("autodoc", "
Parameters
----------
theSurfId: bool

Return
-------
None

Description
-----------
Set if face Id should be written as element attribute; False by default. Cannot be combined with HasPartId().
") SetFaceId;
		void SetFaceId(bool theSurfId);

		/****** RWPly_CafWriter::SetNormals ******/
		/****** md5 signature: c17e8893570a40ab30ed9c9800b14305 ******/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "
Parameters
----------
theHasNormals: bool

Return
-------
None

Description
-----------
Set if normals are defined.
") SetNormals;
		void SetNormals(const bool theHasNormals);

		/****** RWPly_CafWriter::SetPartId ******/
		/****** md5 signature: 80dd08549ed4fc61f3bd1130862f0b61 ******/
		%feature("compactdefaultargs") SetPartId;
		%feature("autodoc", "
Parameters
----------
theSurfId: bool

Return
-------
None

Description
-----------
Set if part Id should be written as element attribute; False by default. Cannot be combined with HasFaceId().
") SetPartId;
		void SetPartId(bool theSurfId);

		/****** RWPly_CafWriter::SetTexCoords ******/
		/****** md5 signature: 1ccc8f9785a944bcf850c64e7095429d ******/
		%feature("compactdefaultargs") SetTexCoords;
		%feature("autodoc", "
Parameters
----------
theHasTexCoords: bool

Return
-------
None

Description
-----------
Set if UV / texture coordinates should be written.
") SetTexCoords;
		void SetTexCoords(const bool theHasTexCoords);

};


%make_alias(RWPly_CafWriter)

%extend RWPly_CafWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWPly_PlyWriterContext *
*******************************/
class RWPly_PlyWriterContext {
	public:
		/****** RWPly_PlyWriterContext::RWPly_PlyWriterContext ******/
		/****** md5 signature: 0095ac9359582033889154c7b0a2951a ******/
		%feature("compactdefaultargs") RWPly_PlyWriterContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWPly_PlyWriterContext;
		 RWPly_PlyWriterContext();

		/****** RWPly_PlyWriterContext::Close ******/
		/****** md5 signature: 72688dacad445840522982ccaf6d1fc3 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "
Parameters
----------
theIsAborted: bool (optional, default to false)

Return
-------
bool

Description
-----------
Correctly close the file. 
Return: False in case of writing error.
") Close;
		bool Close(bool theIsAborted = false);

		/****** RWPly_PlyWriterContext::HasColors ******/
		/****** md5 signature: 712f2254ec70a61013d7074011cd5139 ******/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if point colors should be written as vertex attribute; False by default.
") HasColors;
		bool HasColors();

		/****** RWPly_PlyWriterContext::HasNormals ******/
		/****** md5 signature: cebae9ec3e325d610c43710c6d20c302 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if normals should be written as vertex attribute; False by default.
") HasNormals;
		bool HasNormals();

		/****** RWPly_PlyWriterContext::HasSurfaceId ******/
		/****** md5 signature: 06476969015b7cfc83bfb928b3eaadfb ******/
		%feature("compactdefaultargs") HasSurfaceId;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if surface Id should be written as element attribute; False by default.
") HasSurfaceId;
		bool HasSurfaceId();

		/****** RWPly_PlyWriterContext::HasTexCoords ******/
		/****** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ******/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if UV / texture coordinates should be written as vertex attribute; False by default.
") HasTexCoords;
		bool HasTexCoords();

		/****** RWPly_PlyWriterContext::IsDoublePrecision ******/
		/****** md5 signature: c768d26054fe7836c133ffb1451dd7cd ******/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if vertex position should be stored with double floating point precision; False by default.
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****** RWPly_PlyWriterContext::IsOpened ******/
		/****** md5 signature: d6d5671acf3a396e5229c08ea66ce77f ******/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if file has been opened.
") IsOpened;
		bool IsOpened();

		/****** RWPly_PlyWriterContext::NbWrittenElements ******/
		/****** md5 signature: ecc0b264e1a3bb8d301c86ecffb2c674 ******/
		%feature("compactdefaultargs") NbWrittenElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of written elements.
") NbWrittenElements;
		Standard_Integer NbWrittenElements();

		/****** RWPly_PlyWriterContext::NbWrittenVertices ******/
		/****** md5 signature: 458f3601ac5013f5a9e9bddd66fefbf5 ******/
		%feature("compactdefaultargs") NbWrittenVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of written vertices.
") NbWrittenVertices;
		Standard_Integer NbWrittenVertices();

		/****** RWPly_PlyWriterContext::SetColors ******/
		/****** md5 signature: ba154b7155d7a27211ce6b222d360537 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
theToWrite: bool

Return
-------
None

Description
-----------
Set if point colors should be written.
") SetColors;
		void SetColors(bool theToWrite);

		/****** RWPly_PlyWriterContext::SetDoublePrecision ******/
		/****** md5 signature: 87f899aebadbaf3c77ac480419c2a513 ******/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "
Parameters
----------
theDoublePrec: bool

Return
-------
None

Description
-----------
Set if vertex position should be stored with double floating point precision.
") SetDoublePrecision;
		void SetDoublePrecision(bool theDoublePrec);

		/****** RWPly_PlyWriterContext::SetNormals ******/
		/****** md5 signature: c17e8893570a40ab30ed9c9800b14305 ******/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "
Parameters
----------
theHasNormals: bool

Return
-------
None

Description
-----------
Set if normals should be written.
") SetNormals;
		void SetNormals(const bool theHasNormals);

		/****** RWPly_PlyWriterContext::SetSurfaceId ******/
		/****** md5 signature: dcafc2be1c309fec0b8f815a88dcdca3 ******/
		%feature("compactdefaultargs") SetSurfaceId;
		%feature("autodoc", "
Parameters
----------
theSurfId: bool

Return
-------
None

Description
-----------
Set if surface Id should be written as element attribute; False by default.
") SetSurfaceId;
		void SetSurfaceId(bool theSurfId);

		/****** RWPly_PlyWriterContext::SetSurfaceId ******/
		/****** md5 signature: ed8fc26aef086d397edb955a4204f8df ******/
		%feature("compactdefaultargs") SetSurfaceId;
		%feature("autodoc", "
Parameters
----------
theSurfId: int

Return
-------
None

Description
-----------
Set surface id to write with element.
") SetSurfaceId;
		void SetSurfaceId(Standard_Integer theSurfId);

		/****** RWPly_PlyWriterContext::SetTexCoords ******/
		/****** md5 signature: 1ccc8f9785a944bcf850c64e7095429d ******/
		%feature("compactdefaultargs") SetTexCoords;
		%feature("autodoc", "
Parameters
----------
theHasTexCoords: bool

Return
-------
None

Description
-----------
Set if UV / texture coordinates should be written.
") SetTexCoords;
		void SetTexCoords(const bool theHasTexCoords);

		/****** RWPly_PlyWriterContext::SetVertexOffset ******/
		/****** md5 signature: 5670959c498d4f9994771a46e7478e48 ******/
		%feature("compactdefaultargs") SetVertexOffset;
		%feature("autodoc", "
Parameters
----------
theOffset: int

Return
-------
None

Description
-----------
Set vertex offset to be applied to element indices.
") SetVertexOffset;
		void SetVertexOffset(Standard_Integer theOffset);

		/****** RWPly_PlyWriterContext::SurfaceId ******/
		/****** md5 signature: ad3e324fc8217dd4e403e63f2070e2a3 ******/
		%feature("compactdefaultargs") SurfaceId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return surface id to write with element; 0 by default.
") SurfaceId;
		Standard_Integer SurfaceId();

		/****** RWPly_PlyWriterContext::VertexOffset ******/
		/****** md5 signature: 73942f395a32c5fba1ef0d292a102ade ******/
		%feature("compactdefaultargs") VertexOffset;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return vertex offset to be applied to element indices; 0 by default.
") VertexOffset;
		Standard_Integer VertexOffset();

		/****** RWPly_PlyWriterContext::WriteHeader ******/
		/****** md5 signature: 69c697919712d5a86d0d3a637c7dfb3a ******/
		%feature("compactdefaultargs") WriteHeader;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int
theNbElems: int
theFileInfo: TColStd_IndexedDataMapOfStringString

Return
-------
bool

Description
-----------
Write the header. 
Input parameter: theNbNodes number of vertex nodes 
Input parameter: theNbElems number of mesh elements 
Input parameter: theFileInfo optional comments.
") WriteHeader;
		bool WriteHeader(const Standard_Integer theNbNodes, const Standard_Integer theNbElems, const TColStd_IndexedDataMapOfStringString & theFileInfo);

		/****** RWPly_PlyWriterContext::WriteQuad ******/
		/****** md5 signature: 6ec1ecdd2b0fdcce6c29fc362c45dad1 ******/
		%feature("compactdefaultargs") WriteQuad;
		%feature("autodoc", "
Parameters
----------
theQuad: Graphic3d_Vec4i

Return
-------
bool

Description
-----------
Writing a quad.
") WriteQuad;
		bool WriteQuad(const Graphic3d_Vec4i & theQuad);

		/****** RWPly_PlyWriterContext::WriteTriangle ******/
		/****** md5 signature: 7386d86fd240dee0a67bac21ae95cc21 ******/
		%feature("compactdefaultargs") WriteTriangle;
		%feature("autodoc", "
Parameters
----------
theTri: Graphic3d_Vec3i

Return
-------
bool

Description
-----------
Writing a triangle.
") WriteTriangle;
		bool WriteTriangle(const Graphic3d_Vec3i & theTri);

		/****** RWPly_PlyWriterContext::WriteVertex ******/
		/****** md5 signature: 7558b6ad6baeec647d11f7cdfc88e01f ******/
		%feature("compactdefaultargs") WriteVertex;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theNorm: Graphic3d_Vec3
theUV: Graphic3d_Vec2
theColor: Graphic3d_Vec4ub

Return
-------
bool

Description
-----------
Write single point with all attributes. 
Input parameter: thePoint 3D point coordinates 
Input parameter: theNorm surface normal direction at the point 
Input parameter: theUV surface/texture UV coordinates 
Input parameter: theColor RGB color values.
") WriteVertex;
		bool WriteVertex(const gp_Pnt & thePoint, const Graphic3d_Vec3 & theNorm, const Graphic3d_Vec2 & theUV, const Graphic3d_Vec4ub & theColor);

};


%extend RWPly_PlyWriterContext {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Open(self):
		pass
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
