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
%define RWOBJDOCSTRING
"RWObj module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_rwobj.html"
%enddef
%module (package="OCC.Core", docstring=RWOBJDOCSTRING) RWObj


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
#include<RWObj_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TCollection_module.hxx>
#include<RWMesh_module.hxx>
#include<XCAFPrs_module.hxx>
#include<TDocStd_module.hxx>
#include<TDF_module.hxx>
#include<TColStd_module.hxx>
#include<TopoDS_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import Poly.i
%import TCollection.i
%import RWMesh.i
%import XCAFPrs.i
%import TDocStd.i
%import TDF.i
%import TColStd.i
%import TopoDS.i
%import Graphic3d.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum RWObj_SubMeshReason {
	RWObj_SubMeshReason_NewObject = 0,
	RWObj_SubMeshReason_NewGroup = 1,
	RWObj_SubMeshReason_NewMaterial = 2,
	RWObj_SubMeshReason_NewSmoothGroup = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class RWObj_SubMeshReason(IntEnum):
	RWObj_SubMeshReason_NewObject = 0
	RWObj_SubMeshReason_NewGroup = 1
	RWObj_SubMeshReason_NewMaterial = 2
	RWObj_SubMeshReason_NewSmoothGroup = 3
RWObj_SubMeshReason_NewObject = RWObj_SubMeshReason.RWObj_SubMeshReason_NewObject
RWObj_SubMeshReason_NewGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewGroup
RWObj_SubMeshReason_NewMaterial = RWObj_SubMeshReason.RWObj_SubMeshReason_NewMaterial
RWObj_SubMeshReason_NewSmoothGroup = RWObj_SubMeshReason.RWObj_SubMeshReason_NewSmoothGroup
};
/* end python proxy for enums */

/* handles */
%wrap_handle(RWObj_CafWriter)
%wrap_handle(RWObj_ObjMaterialMap)
%wrap_handle(RWObj_Reader)
%wrap_handle(RWObj_CafReader)
%wrap_handle(RWObj_TriangulationReader)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class RWObj *
**************/
%rename(rwobj) RWObj;
class RWObj {
	public:
		/****** RWObj::ReadFile ******/
		/****** md5 signature: 9db0a5dcbc0cfb32dbb5943d609412ad ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: str
aProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified OBJ file and returns its content as triangulation. In case of error, returns Null handle.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(Standard_CString theFile, const Message_ProgressRange & aProgress = Message_ProgressRange());

};


%extend RWObj {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_CafWriter *
************************/
class RWObj_CafWriter : public Standard_Transient {
	public:
		/****** RWObj_CafWriter::RWObj_CafWriter ******/
		/****** md5 signature: 9183f2e4f1660ece2639704d8c151644 ******/
		%feature("compactdefaultargs") RWObj_CafWriter;
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
Input parameter: theFile path to output OBJ file.
") RWObj_CafWriter;
		 RWObj_CafWriter(TCollection_AsciiString theFile);

		/****** RWObj_CafWriter::ChangeCoordinateSystemConverter ******/
		/****** md5 signature: fd10c9e3345c0c11d37ccaa13f77ec3f ******/
		%feature("compactdefaultargs") ChangeCoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from OCCT to OBJ coordinate system.
") ChangeCoordinateSystemConverter;
		RWMesh_CoordinateSystemConverter & ChangeCoordinateSystemConverter();

		/****** RWObj_CafWriter::CoordinateSystemConverter ******/
		/****** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ******/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from OCCT to OBJ coordinate system.
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****** RWObj_CafWriter::DefaultStyle ******/
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

		/****** RWObj_CafWriter::Perform ******/
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
Write OBJ file and associated MTL material file. Triangulation data should be precomputed within shapes! 
Input parameter: theDocument input document 
Input parameter: theRootLabels list of root shapes to export 
Input parameter: theLabelFilter optional filter with document nodes to export,  with keys defined by XCAFPrs_DocumentExplorer::DefineChildId() and  filled recursively (leaves and parent assembly nodes at all  levels); when not NULL, all nodes not included into the map will be  ignored 
Input parameter: theFileInfo map with file metadata to put into OBJ header section 
Input parameter: theProgress optional progress indicator 
Return: False on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRootLabels, const TColStd_MapOfAsciiString * theLabelFilter, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****** RWObj_CafWriter::Perform ******/
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
Write OBJ file and associated MTL material file. Triangulation data should be precomputed within shapes! 
Input parameter: theDocument input document 
Input parameter: theFileInfo map with file metadata to put into glTF header section 
Input parameter: theProgress optional progress indicator 
Return: False on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****** RWObj_CafWriter::SetCoordinateSystemConverter ******/
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
Set transformation from OCCT to OBJ coordinate system.
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****** RWObj_CafWriter::SetDefaultStyle ******/
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

};


%make_alias(RWObj_CafWriter)

%extend RWObj_CafWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class RWObj_IShapeReceiver *
*****************************/
%nodefaultctor RWObj_IShapeReceiver;
class RWObj_IShapeReceiver {
	public:
		/****** RWObj_IShapeReceiver::BindNamedShape ******/
		/****** md5 signature: c4a7e1b6b51bf16257e0884d8678f1e6 ******/
		%feature("compactdefaultargs") BindNamedShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theName: str
theMaterial: RWObj_Material *
theIsRootShape: bool

Return
-------
None

Description
-----------
Parameter theShape shape to register 
Parameter theName shape name 
Parameter theMaterial shape material 
Parameter theIsRootShape indicates that this is a root object (free shape).
") BindNamedShape;
		virtual void BindNamedShape(const TopoDS_Shape & theShape, TCollection_AsciiString theName, const RWObj_Material * theMaterial, const Standard_Boolean theIsRootShape);

};


%extend RWObj_IShapeReceiver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWObj_Material *
***********************/
class RWObj_Material {
	public:
		/****** RWObj_Material::RWObj_Material ******/
		/****** md5 signature: e824e5ca5d324e17a53317770dbbc543 ******/
		%feature("compactdefaultargs") RWObj_Material;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWObj_Material;
		 RWObj_Material();

};


%extend RWObj_Material {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_MtlReader *
************************/
/*****************************
* class RWObj_ObjMaterialMap *
*****************************/
class RWObj_ObjMaterialMap : public RWMesh_MaterialMap {
	public:
		/****** RWObj_ObjMaterialMap::RWObj_ObjMaterialMap ******/
		/****** md5 signature: 43c6a416fb61d11b4dd03cc05283f455 ******/
		%feature("compactdefaultargs") RWObj_ObjMaterialMap;
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
") RWObj_ObjMaterialMap;
		 RWObj_ObjMaterialMap(TCollection_AsciiString theFile);

		/****** RWObj_ObjMaterialMap::AddMaterial ******/
		/****** md5 signature: a65de496eac4b0afca748cbe0920fca0 ******/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style

Return
-------
TCollection_AsciiString

Description
-----------
Add material.
") AddMaterial;
		virtual TCollection_AsciiString AddMaterial(const XCAFPrs_Style & theStyle);

		/****** RWObj_ObjMaterialMap::DefineMaterial ******/
		/****** md5 signature: 0d9f2bc2c43292ec61ca304ec31c1fa0 ******/
		%feature("compactdefaultargs") DefineMaterial;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style
theKey: str
theName: str

Return
-------
None

Description
-----------
Virtual method actually defining the material (e.g. export to the file).
") DefineMaterial;
		virtual void DefineMaterial(const XCAFPrs_Style & theStyle, TCollection_AsciiString theKey, TCollection_AsciiString theName);

};


%make_alias(RWObj_ObjMaterialMap)

%extend RWObj_ObjMaterialMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWObj_ObjWriterContext *
*******************************/
class RWObj_ObjWriterContext {
	public:
		/****** RWObj_ObjWriterContext::RWObj_ObjWriterContext ******/
		/****** md5 signature: 4d2a3a7dd08df290512cc8f3ee97b068 ******/
		%feature("compactdefaultargs") RWObj_ObjWriterContext;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
Main constructor.
") RWObj_ObjWriterContext;
		 RWObj_ObjWriterContext(TCollection_AsciiString theName);

		/****** RWObj_ObjWriterContext::ActiveMaterial ******/
		/****** md5 signature: 5863ab1f6ab96ae1abb4503ebc57e2c2 ******/
		%feature("compactdefaultargs") ActiveMaterial;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return active material or empty string if not set.
") ActiveMaterial;
		const TCollection_AsciiString & ActiveMaterial();

		/****** RWObj_ObjWriterContext::Close ******/
		/****** md5 signature: c16f96eb62ef68503b626b43a99eafc0 ******/
		%feature("compactdefaultargs") Close;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Correctly close the file.
") Close;
		bool Close();

		/****** RWObj_ObjWriterContext::FlushFace ******/
		/****** md5 signature: 4918a9b4883feed992536e8ba2dbd23f ******/
		%feature("compactdefaultargs") FlushFace;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int

Return
-------
None

Description
-----------
Increment indices shift.
") FlushFace;
		void FlushFace(Standard_Integer theNbNodes);

		/****** RWObj_ObjWriterContext::HasNormals ******/
		/****** md5 signature: cebae9ec3e325d610c43710c6d20c302 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if normals are defined.
") HasNormals;
		bool HasNormals();

		/****** RWObj_ObjWriterContext::HasTexCoords ******/
		/****** md5 signature: f5f5a85a7931cb9e0f30d5c5519dc79e ******/
		%feature("compactdefaultargs") HasTexCoords;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if normals are defined.
") HasTexCoords;
		bool HasTexCoords();

		/****** RWObj_ObjWriterContext::IsOpened ******/
		/****** md5 signature: d6d5671acf3a396e5229c08ea66ce77f ******/
		%feature("compactdefaultargs") IsOpened;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if file has been opened.
") IsOpened;
		bool IsOpened();

		/****** RWObj_ObjWriterContext::SetNormals ******/
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

		/****** RWObj_ObjWriterContext::SetTexCoords ******/
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
Set if normals are defined.
") SetTexCoords;
		void SetTexCoords(const bool theHasTexCoords);

		/****** RWObj_ObjWriterContext::WriteActiveMaterial ******/
		/****** md5 signature: c23019ca84fa7deac83aa86f83157c48 ******/
		%feature("compactdefaultargs") WriteActiveMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: str

Return
-------
bool

Description
-----------
Set active material.
") WriteActiveMaterial;
		bool WriteActiveMaterial(TCollection_AsciiString theMaterial);

		/****** RWObj_ObjWriterContext::WriteGroup ******/
		/****** md5 signature: d33f0a10b0910de5ab5748574f48f32d ******/
		%feature("compactdefaultargs") WriteGroup;
		%feature("autodoc", "
Parameters
----------
theValue: str

Return
-------
bool

Description
-----------
Writing a group name.
") WriteGroup;
		bool WriteGroup(TCollection_AsciiString theValue);

		/****** RWObj_ObjWriterContext::WriteHeader ******/
		/****** md5 signature: 145306955b9203346c019851d530ffab ******/
		%feature("compactdefaultargs") WriteHeader;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int
theNbElems: int
theMatLib: str
theFileInfo: TColStd_IndexedDataMapOfStringString

Return
-------
bool

Description
-----------
Write the header.
") WriteHeader;
		bool WriteHeader(const Standard_Integer theNbNodes, const Standard_Integer theNbElems, TCollection_AsciiString theMatLib, const TColStd_IndexedDataMapOfStringString & theFileInfo);

		/****** RWObj_ObjWriterContext::WriteNormal ******/
		/****** md5 signature: e50c1b6f5ea1daef7e39690e78a55c3f ******/
		%feature("compactdefaultargs") WriteNormal;
		%feature("autodoc", "
Parameters
----------
theValue: Graphic3d_Vec3

Return
-------
bool

Description
-----------
Writing a vector.
") WriteNormal;
		bool WriteNormal(const Graphic3d_Vec3 & theValue);

		/****** RWObj_ObjWriterContext::WriteQuad ******/
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

		/****** RWObj_ObjWriterContext::WriteTexCoord ******/
		/****** md5 signature: f8fa5dcc72781a1705ad419b00eedb5a ******/
		%feature("compactdefaultargs") WriteTexCoord;
		%feature("autodoc", "
Parameters
----------
theValue: Graphic3d_Vec2

Return
-------
bool

Description
-----------
Writing a vector.
") WriteTexCoord;
		bool WriteTexCoord(const Graphic3d_Vec2 & theValue);

		/****** RWObj_ObjWriterContext::WriteTriangle ******/
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

		/****** RWObj_ObjWriterContext::WriteVertex ******/
		/****** md5 signature: a036bc8f2676c9bd108f1b4aaa49033e ******/
		%feature("compactdefaultargs") WriteVertex;
		%feature("autodoc", "
Parameters
----------
theValue: Graphic3d_Vec3

Return
-------
bool

Description
-----------
Writing a vector.
") WriteVertex;
		bool WriteVertex(const Graphic3d_Vec3 & theValue);

};


%extend RWObj_ObjWriterContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class RWObj_Reader *
*********************/
%nodefaultctor RWObj_Reader;
class RWObj_Reader : public Standard_Transient {
	public:
		class ObjVec3iHasher {};
		class VectorOfVertices {};
		/****** RWObj_Reader::ExternalFiles ******/
		/****** md5 signature: 1100efdc16f5df4da63f3649f3bae2f1 ******/
		%feature("compactdefaultargs") ExternalFiles;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<TCollection_AsciiString>

Description
-----------
Return the list of external file references.
") ExternalFiles;
		const NCollection_IndexedMap<TCollection_AsciiString> & ExternalFiles();

		/****** RWObj_Reader::FileComments ******/
		/****** md5 signature: 5907111e18d42fb1ae04fda50f8a0338 ******/
		%feature("compactdefaultargs") FileComments;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns file comments (lines starting with # at the beginning of file).
") FileComments;
		const TCollection_AsciiString & FileComments();

		/****** RWObj_Reader::IsSinglePrecision ******/
		/****** md5 signature: 3d9bd168ea3086792839d0ab7bd5e36e ******/
		%feature("compactdefaultargs") IsSinglePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return single precision flag for reading vertex data (coordinates); False by default.
") IsSinglePrecision;
		Standard_Boolean IsSinglePrecision();

		/****** RWObj_Reader::MemoryLimit ******/
		/****** md5 signature: 497f9f79bb3dc4c92ac3499c3f934cca ******/
		%feature("compactdefaultargs") MemoryLimit;
		%feature("autodoc", "Return
-------
Standard_Size

Description
-----------
Returns memory limit in bytes; -1 (no limit) by default.
") MemoryLimit;
		Standard_Size MemoryLimit();

		/****** RWObj_Reader::NbProbeElems ******/
		/****** md5 signature: c59d60ae4f689662b396b03b87801ea5 ******/
		%feature("compactdefaultargs") NbProbeElems;
		%feature("autodoc", "Return
-------
int

Description
-----------
//!< number of probed polygon elements (of unknown size).
") NbProbeElems;
		Standard_Integer NbProbeElems();

		/****** RWObj_Reader::NbProbeNodes ******/
		/****** md5 signature: a00db32de75db319aa32d1b94016db1a ******/
		%feature("compactdefaultargs") NbProbeNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of probed nodes.
") NbProbeNodes;
		Standard_Integer NbProbeNodes();

		/****** RWObj_Reader::Probe ******/
		/****** md5 signature: 26f3d0cdb02ea1bf9a52b60912c48df8 ******/
		%feature("compactdefaultargs") Probe;
		%feature("autodoc", "
Parameters
----------
theFile: str
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Open stream and pass it to Probe method. 
Parameter theFile path to the file 
Parameter theProgress progress indicator 
Return: True if success, False on error or user break. 
See also: FileComments(), ExternalFiles(), NbProbeNodes(), NbProbeElems().
") Probe;
		Standard_Boolean Probe(TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****** RWObj_Reader::Probe ******/
		/****** md5 signature: 8376516956f14db4066de53fb560bbd8 ******/
		%feature("compactdefaultargs") Probe;
		%feature("autodoc", "
Parameters
----------
theStream: str
theFile: str
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Probe data from OBJ file (comments, external references) without actually reading mesh data. Although mesh data will not be collected, the full file content will be parsed, due to OBJ format limitations. 
Parameter theStream input stream 
Parameter theFile path to the file 
Parameter theProgress progress indicator 
Return: True if success, False on error or user break. 
See also: FileComments(), ExternalFiles(), NbProbeNodes(), NbProbeElems().
") Probe;
		Standard_Boolean Probe(std::istream & theStream, TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****** RWObj_Reader::Read ******/
		/****** md5 signature: 22d0a4b3b93a1e3452e7be9b291128a7 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theFile: str
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Open stream and pass it to Read method Returns true if success, false on error.
") Read;
		Standard_Boolean Read(TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****** RWObj_Reader::Read ******/
		/****** md5 signature: fdd87a6a5d4e606e047cd74101908aae ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theStream: str
theFile: str
theProgress: Message_ProgressRange

Return
-------
bool

Description
-----------
Reads data from OBJ file. Unicode paths can be given in UTF-8 encoding. Returns true if success, false on error or user break.
") Read;
		Standard_Boolean Read(std::istream & theStream, TCollection_AsciiString theFile, const Message_ProgressRange & theProgress);

		/****** RWObj_Reader::SetMemoryLimit ******/
		/****** md5 signature: 6570682bb3b681c7b6ede732333556b3 ******/
		%feature("compactdefaultargs") SetMemoryLimit;
		%feature("autodoc", "
Parameters
----------
theMemLimit: Standard_Size

Return
-------
None

Description
-----------
Specify memory limit in bytes, so that import will be aborted by specified limit before memory allocation error occurs.
") SetMemoryLimit;
		void SetMemoryLimit(Standard_Size theMemLimit);

		/****** RWObj_Reader::SetSinglePrecision ******/
		/****** md5 signature: 99984d661982e5c23a64361939c67a89 ******/
		%feature("compactdefaultargs") SetSinglePrecision;
		%feature("autodoc", "
Parameters
----------
theIsSinglePrecision: bool

Return
-------
None

Description
-----------
Setup single/double precision flag for reading vertex data (coordinates).
") SetSinglePrecision;
		void SetSinglePrecision(Standard_Boolean theIsSinglePrecision);

		/****** RWObj_Reader::SetTransformation ******/
		/****** md5 signature: e3e728f65ab2c16f510366aff5821cf5 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theCSConverter: RWMesh_CoordinateSystemConverter

Return
-------
None

Description
-----------
Setup transformation from one coordinate system to another. OBJ file might be exported following various coordinate system conventions, so that it might be useful automatically transform data during file reading.
") SetTransformation;
		void SetTransformation(const RWMesh_CoordinateSystemConverter & theCSConverter);

		/****** RWObj_Reader::Transformation ******/
		/****** md5 signature: 71feef5f1946dae77a000bd50a820aec ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from one coordinate system to another; no transformation by default.
") Transformation;
		const RWMesh_CoordinateSystemConverter & Transformation();

};


%make_alias(RWObj_Reader)

%extend RWObj_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class RWObj_SubMesh *
**********************/
class RWObj_SubMesh {
	public:
};


%extend RWObj_SubMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWObj_CafReader *
************************/
class RWObj_CafReader : public RWMesh_CafReader, protected RWObj_IShapeReceiver {
	public:
		/****** RWObj_CafReader::RWObj_CafReader ******/
		/****** md5 signature: abe4f70bfb71b45929fc0ef0b7d4c19d ******/
		%feature("compactdefaultargs") RWObj_CafReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWObj_CafReader;
		 RWObj_CafReader();

		/****** RWObj_CafReader::IsSinglePrecision ******/
		/****** md5 signature: 3d9bd168ea3086792839d0ab7bd5e36e ******/
		%feature("compactdefaultargs") IsSinglePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return single precision flag for reading vertex data (coordinates); False by default.
") IsSinglePrecision;
		Standard_Boolean IsSinglePrecision();

		/****** RWObj_CafReader::SetSinglePrecision ******/
		/****** md5 signature: 99984d661982e5c23a64361939c67a89 ******/
		%feature("compactdefaultargs") SetSinglePrecision;
		%feature("autodoc", "
Parameters
----------
theIsSinglePrecision: bool

Return
-------
None

Description
-----------
Setup single/double precision flag for reading vertex data (coordinates).
") SetSinglePrecision;
		void SetSinglePrecision(Standard_Boolean theIsSinglePrecision);

};


%make_alias(RWObj_CafReader)

%extend RWObj_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class RWObj_TriangulationReader *
**********************************/
class RWObj_TriangulationReader : public RWObj_Reader {
	public:
		/****** RWObj_TriangulationReader::RWObj_TriangulationReader ******/
		/****** md5 signature: 3c004fcddd264c3577c6f2cb0d444634 ******/
		%feature("compactdefaultargs") RWObj_TriangulationReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") RWObj_TriangulationReader;
		 RWObj_TriangulationReader();

		/****** RWObj_TriangulationReader::GetTriangulation ******/
		/****** md5 signature: c78dd6225813894d19d3b8c88964d3eb ******/
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Create Poly_Triangulation from collected data.
") GetTriangulation;
		virtual opencascade::handle<Poly_Triangulation> GetTriangulation();

		/****** RWObj_TriangulationReader::ResultShape ******/
		/****** md5 signature: 2cda1838bd6e38f0292afee2ec85f65a ******/
		%feature("compactdefaultargs") ResultShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return result shape.
") ResultShape;
		TopoDS_Shape ResultShape();

		/****** RWObj_TriangulationReader::SetCreateShapes ******/
		/****** md5 signature: 4c73f709306991520386237767d81b43 ******/
		%feature("compactdefaultargs") SetCreateShapes;
		%feature("autodoc", "
Parameters
----------
theToCreateShapes: bool

Return
-------
None

Description
-----------
Set flag to create shapes.
") SetCreateShapes;
		void SetCreateShapes(Standard_Boolean theToCreateShapes);

		/****** RWObj_TriangulationReader::SetShapeReceiver ******/
		/****** md5 signature: 66b62525eaf3c6d46991dcbfa30569e4 ******/
		%feature("compactdefaultargs") SetShapeReceiver;
		%feature("autodoc", "
Parameters
----------
theReceiver: RWObj_IShapeReceiver *

Return
-------
None

Description
-----------
Set shape receiver callback.
") SetShapeReceiver;
		void SetShapeReceiver(RWObj_IShapeReceiver * theReceiver);

};


%make_alias(RWObj_TriangulationReader)

%extend RWObj_TriangulationReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class RWObj_MtlReader:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def rwobj_ReadFile(*args):
	return rwobj.ReadFile(*args)

}
