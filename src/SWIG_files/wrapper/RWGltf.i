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
%define RWGLTFDOCSTRING
"RWGltf module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_rwgltf.html"
%enddef
%module (package="OCC.Core", docstring=RWGLTFDOCSTRING) RWGltf


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
#include<RWGltf_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<RWMesh_module.hxx>
#include<TCollection_module.hxx>
#include<XCAFPrs_module.hxx>
#include<TDocStd_module.hxx>
#include<TDF_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<Quantity_module.hxx>
#include<Poly_module.hxx>
#include<XCAFDoc_module.hxx>
#include<Image_module.hxx>
#include<TopTools_module.hxx>
#include<TopoDS_module.hxx>
#include<TDataStd_module.hxx>
#include<TopLoc_module.hxx>
#include<Graphic3d_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<Aspect_module.hxx>
#include<TDataStd_module.hxx>
#include<TPrsStd_module.hxx>
#include<AIS_module.hxx>
#include<V3d_module.hxx>
#include<BRep_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<Prs3d_module.hxx>
#include<Select3D_module.hxx>
#include<TopTools_module.hxx>
#include<TNaming_module.hxx>
#include<StdSelect_module.hxx>
#include<TopoDS_module.hxx>
#include<TDataXtd_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Media_module.hxx>
#include<SelectMgr_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
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
%import RWMesh.i
%import TCollection.i
%import XCAFPrs.i
%import TDocStd.i
%import TDF.i
%import TColStd.i
%import Message.i
%import Quantity.i
%import Poly.i
%import XCAFDoc.i
%import Image.i
%import TopTools.i
%import TopoDS.i
%import TDataStd.i
%import TopLoc.i
%import Graphic3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum RWGltf_GltfAccessorCompType {
	RWGltf_GltfAccessorCompType_UNKNOWN = 0,
	RWGltf_GltfAccessorCompType_Int8 = 5120,
	RWGltf_GltfAccessorCompType_UInt8 = 5121,
	RWGltf_GltfAccessorCompType_Int16 = 5122,
	RWGltf_GltfAccessorCompType_UInt16 = 5123,
	RWGltf_GltfAccessorCompType_UInt32 = 5125,
	RWGltf_GltfAccessorCompType_Float32 = 5126,
};

enum RWGltf_GltfAccessorLayout {
	RWGltf_GltfAccessorLayout_UNKNOWN = 0,
	RWGltf_GltfAccessorLayout_Scalar = 1,
	RWGltf_GltfAccessorLayout_Vec2 = 2,
	RWGltf_GltfAccessorLayout_Vec3 = 3,
	RWGltf_GltfAccessorLayout_Vec4 = 4,
	RWGltf_GltfAccessorLayout_Mat2 = 5,
	RWGltf_GltfAccessorLayout_Mat3 = 6,
	RWGltf_GltfAccessorLayout_Mat4 = 7,
};

enum RWGltf_GltfAlphaMode {
	RWGltf_GltfAlphaMode_Opaque = 0,
	RWGltf_GltfAlphaMode_Mask = 1,
	RWGltf_GltfAlphaMode_Blend = 2,
};

enum RWGltf_GltfArrayType {
	RWGltf_GltfArrayType_UNKNOWN = 0,
	RWGltf_GltfArrayType_Indices = 1,
	RWGltf_GltfArrayType_Position = 2,
	RWGltf_GltfArrayType_Normal = 3,
	RWGltf_GltfArrayType_Color = 4,
	RWGltf_GltfArrayType_TCoord0 = 5,
	RWGltf_GltfArrayType_TCoord1 = 6,
	RWGltf_GltfArrayType_Joint = 7,
	RWGltf_GltfArrayType_Weight = 8,
};

enum RWGltf_GltfBufferViewTarget {
	RWGltf_GltfBufferViewTarget_UNKNOWN = 0,
	RWGltf_GltfBufferViewTarget_ARRAY_BUFFER = 34962,
	RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER = 34963,
};

enum RWGltf_GltfPrimitiveMode {
	RWGltf_GltfPrimitiveMode_UNKNOWN = - 1,
	RWGltf_GltfPrimitiveMode_Points = 0,
	RWGltf_GltfPrimitiveMode_Lines = 1,
	RWGltf_GltfPrimitiveMode_LineLoop = 2,
	RWGltf_GltfPrimitiveMode_LineStrip = 3,
	RWGltf_GltfPrimitiveMode_Triangles = 4,
	RWGltf_GltfPrimitiveMode_TriangleStrip = 5,
	RWGltf_GltfPrimitiveMode_TriangleFan = 6,
};

enum RWGltf_GltfRootElement {
	RWGltf_GltfRootElement_Asset = 0,
	RWGltf_GltfRootElement_Scenes = 1,
	RWGltf_GltfRootElement_Scene = 2,
	RWGltf_GltfRootElement_Nodes = 3,
	RWGltf_GltfRootElement_Meshes = 4,
	RWGltf_GltfRootElement_Accessors = 5,
	RWGltf_GltfRootElement_BufferViews = 6,
	RWGltf_GltfRootElement_Buffers = 7,
	RWGltf_GltfRootElement_NB_MANDATORY = 8,
	RWGltf_GltfRootElement_Animations = RWGltf_GltfRootElement_NB_MANDATORY,
	RWGltf_GltfRootElement_Materials = 10,
	RWGltf_GltfRootElement_Programs = 11,
	RWGltf_GltfRootElement_Samplers = 12,
	RWGltf_GltfRootElement_Shaders = 13,
	RWGltf_GltfRootElement_Skins = 14,
	RWGltf_GltfRootElement_Techniques = 15,
	RWGltf_GltfRootElement_Textures = 16,
	RWGltf_GltfRootElement_Images = 17,
	RWGltf_GltfRootElement_ExtensionsUsed = 18,
	RWGltf_GltfRootElement_ExtensionsRequired = 19,
	RWGltf_GltfRootElement_NB = 20,
};

enum RWGltf_WriterTrsfFormat {
	RWGltf_WriterTrsfFormat_Compact = 0,
	RWGltf_WriterTrsfFormat_Mat4 = 1,
	RWGltf_WriterTrsfFormat_TRS = 2,
};

enum  {
	RWGltf_WriterTrsfFormat_LOWER = 0,
	RWGltf_WriterTrsfFormat_UPPER = RWGltf_WriterTrsfFormat_TRS,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class RWGltf_GltfAccessorCompType(IntEnum):
	RWGltf_GltfAccessorCompType_UNKNOWN = 0
	RWGltf_GltfAccessorCompType_Int8 = 5120
	RWGltf_GltfAccessorCompType_UInt8 = 5121
	RWGltf_GltfAccessorCompType_Int16 = 5122
	RWGltf_GltfAccessorCompType_UInt16 = 5123
	RWGltf_GltfAccessorCompType_UInt32 = 5125
	RWGltf_GltfAccessorCompType_Float32 = 5126
RWGltf_GltfAccessorCompType_UNKNOWN = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UNKNOWN
RWGltf_GltfAccessorCompType_Int8 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_Int8
RWGltf_GltfAccessorCompType_UInt8 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UInt8
RWGltf_GltfAccessorCompType_Int16 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_Int16
RWGltf_GltfAccessorCompType_UInt16 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UInt16
RWGltf_GltfAccessorCompType_UInt32 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_UInt32
RWGltf_GltfAccessorCompType_Float32 = RWGltf_GltfAccessorCompType.RWGltf_GltfAccessorCompType_Float32

class RWGltf_GltfAccessorLayout(IntEnum):
	RWGltf_GltfAccessorLayout_UNKNOWN = 0
	RWGltf_GltfAccessorLayout_Scalar = 1
	RWGltf_GltfAccessorLayout_Vec2 = 2
	RWGltf_GltfAccessorLayout_Vec3 = 3
	RWGltf_GltfAccessorLayout_Vec4 = 4
	RWGltf_GltfAccessorLayout_Mat2 = 5
	RWGltf_GltfAccessorLayout_Mat3 = 6
	RWGltf_GltfAccessorLayout_Mat4 = 7
RWGltf_GltfAccessorLayout_UNKNOWN = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_UNKNOWN
RWGltf_GltfAccessorLayout_Scalar = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Scalar
RWGltf_GltfAccessorLayout_Vec2 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Vec2
RWGltf_GltfAccessorLayout_Vec3 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Vec3
RWGltf_GltfAccessorLayout_Vec4 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Vec4
RWGltf_GltfAccessorLayout_Mat2 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Mat2
RWGltf_GltfAccessorLayout_Mat3 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Mat3
RWGltf_GltfAccessorLayout_Mat4 = RWGltf_GltfAccessorLayout.RWGltf_GltfAccessorLayout_Mat4

class RWGltf_GltfAlphaMode(IntEnum):
	RWGltf_GltfAlphaMode_Opaque = 0
	RWGltf_GltfAlphaMode_Mask = 1
	RWGltf_GltfAlphaMode_Blend = 2
RWGltf_GltfAlphaMode_Opaque = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Opaque
RWGltf_GltfAlphaMode_Mask = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Mask
RWGltf_GltfAlphaMode_Blend = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Blend

class RWGltf_GltfArrayType(IntEnum):
	RWGltf_GltfArrayType_UNKNOWN = 0
	RWGltf_GltfArrayType_Indices = 1
	RWGltf_GltfArrayType_Position = 2
	RWGltf_GltfArrayType_Normal = 3
	RWGltf_GltfArrayType_Color = 4
	RWGltf_GltfArrayType_TCoord0 = 5
	RWGltf_GltfArrayType_TCoord1 = 6
	RWGltf_GltfArrayType_Joint = 7
	RWGltf_GltfArrayType_Weight = 8
RWGltf_GltfArrayType_UNKNOWN = RWGltf_GltfArrayType.RWGltf_GltfArrayType_UNKNOWN
RWGltf_GltfArrayType_Indices = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Indices
RWGltf_GltfArrayType_Position = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Position
RWGltf_GltfArrayType_Normal = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Normal
RWGltf_GltfArrayType_Color = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Color
RWGltf_GltfArrayType_TCoord0 = RWGltf_GltfArrayType.RWGltf_GltfArrayType_TCoord0
RWGltf_GltfArrayType_TCoord1 = RWGltf_GltfArrayType.RWGltf_GltfArrayType_TCoord1
RWGltf_GltfArrayType_Joint = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Joint
RWGltf_GltfArrayType_Weight = RWGltf_GltfArrayType.RWGltf_GltfArrayType_Weight

class RWGltf_GltfBufferViewTarget(IntEnum):
	RWGltf_GltfBufferViewTarget_UNKNOWN = 0
	RWGltf_GltfBufferViewTarget_ARRAY_BUFFER = 34962
	RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER = 34963
RWGltf_GltfBufferViewTarget_UNKNOWN = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_UNKNOWN
RWGltf_GltfBufferViewTarget_ARRAY_BUFFER = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_ARRAY_BUFFER
RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER

class RWGltf_GltfPrimitiveMode(IntEnum):
	RWGltf_GltfPrimitiveMode_UNKNOWN = - 1
	RWGltf_GltfPrimitiveMode_Points = 0
	RWGltf_GltfPrimitiveMode_Lines = 1
	RWGltf_GltfPrimitiveMode_LineLoop = 2
	RWGltf_GltfPrimitiveMode_LineStrip = 3
	RWGltf_GltfPrimitiveMode_Triangles = 4
	RWGltf_GltfPrimitiveMode_TriangleStrip = 5
	RWGltf_GltfPrimitiveMode_TriangleFan = 6
RWGltf_GltfPrimitiveMode_UNKNOWN = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_UNKNOWN
RWGltf_GltfPrimitiveMode_Points = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_Points
RWGltf_GltfPrimitiveMode_Lines = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_Lines
RWGltf_GltfPrimitiveMode_LineLoop = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_LineLoop
RWGltf_GltfPrimitiveMode_LineStrip = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_LineStrip
RWGltf_GltfPrimitiveMode_Triangles = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_Triangles
RWGltf_GltfPrimitiveMode_TriangleStrip = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_TriangleStrip
RWGltf_GltfPrimitiveMode_TriangleFan = RWGltf_GltfPrimitiveMode.RWGltf_GltfPrimitiveMode_TriangleFan

class RWGltf_GltfRootElement(IntEnum):
	RWGltf_GltfRootElement_Asset = 0
	RWGltf_GltfRootElement_Scenes = 1
	RWGltf_GltfRootElement_Scene = 2
	RWGltf_GltfRootElement_Nodes = 3
	RWGltf_GltfRootElement_Meshes = 4
	RWGltf_GltfRootElement_Accessors = 5
	RWGltf_GltfRootElement_BufferViews = 6
	RWGltf_GltfRootElement_Buffers = 7
	RWGltf_GltfRootElement_NB_MANDATORY = 8
	RWGltf_GltfRootElement_Animations = RWGltf_GltfRootElement_NB_MANDATORY
	RWGltf_GltfRootElement_Materials = 10
	RWGltf_GltfRootElement_Programs = 11
	RWGltf_GltfRootElement_Samplers = 12
	RWGltf_GltfRootElement_Shaders = 13
	RWGltf_GltfRootElement_Skins = 14
	RWGltf_GltfRootElement_Techniques = 15
	RWGltf_GltfRootElement_Textures = 16
	RWGltf_GltfRootElement_Images = 17
	RWGltf_GltfRootElement_ExtensionsUsed = 18
	RWGltf_GltfRootElement_ExtensionsRequired = 19
	RWGltf_GltfRootElement_NB = 20
RWGltf_GltfRootElement_Asset = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Asset
RWGltf_GltfRootElement_Scenes = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Scenes
RWGltf_GltfRootElement_Scene = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Scene
RWGltf_GltfRootElement_Nodes = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Nodes
RWGltf_GltfRootElement_Meshes = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Meshes
RWGltf_GltfRootElement_Accessors = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Accessors
RWGltf_GltfRootElement_BufferViews = RWGltf_GltfRootElement.RWGltf_GltfRootElement_BufferViews
RWGltf_GltfRootElement_Buffers = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Buffers
RWGltf_GltfRootElement_NB_MANDATORY = RWGltf_GltfRootElement.RWGltf_GltfRootElement_NB_MANDATORY
RWGltf_GltfRootElement_Animations = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Animations
RWGltf_GltfRootElement_Materials = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Materials
RWGltf_GltfRootElement_Programs = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Programs
RWGltf_GltfRootElement_Samplers = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Samplers
RWGltf_GltfRootElement_Shaders = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Shaders
RWGltf_GltfRootElement_Skins = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Skins
RWGltf_GltfRootElement_Techniques = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Techniques
RWGltf_GltfRootElement_Textures = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Textures
RWGltf_GltfRootElement_Images = RWGltf_GltfRootElement.RWGltf_GltfRootElement_Images
RWGltf_GltfRootElement_ExtensionsUsed = RWGltf_GltfRootElement.RWGltf_GltfRootElement_ExtensionsUsed
RWGltf_GltfRootElement_ExtensionsRequired = RWGltf_GltfRootElement.RWGltf_GltfRootElement_ExtensionsRequired
RWGltf_GltfRootElement_NB = RWGltf_GltfRootElement.RWGltf_GltfRootElement_NB

class RWGltf_WriterTrsfFormat(IntEnum):
	RWGltf_WriterTrsfFormat_Compact = 0
	RWGltf_WriterTrsfFormat_Mat4 = 1
	RWGltf_WriterTrsfFormat_TRS = 2
RWGltf_WriterTrsfFormat_Compact = RWGltf_WriterTrsfFormat.RWGltf_WriterTrsfFormat_Compact
RWGltf_WriterTrsfFormat_Mat4 = RWGltf_WriterTrsfFormat.RWGltf_WriterTrsfFormat_Mat4
RWGltf_WriterTrsfFormat_TRS = RWGltf_WriterTrsfFormat.RWGltf_WriterTrsfFormat_TRS
};
/* end python proxy for enums */

/* handles */
%wrap_handle(RWGltf_CafWriter)
%wrap_handle(RWGltf_GltfFace)
%wrap_handle(RWGltf_MaterialCommon)
%wrap_handle(RWGltf_MaterialMetallicRoughness)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef NCollection_Shared<NCollection_List<opencascade::handle<RWGltf_GltfFace>>> RWGltf_GltfFaceList;
typedef rapidjson::Document::ValueType RWGltf_JsonValue;
/* end typedefs declaration */

/***********************
* class GltfElementMap *
***********************/
/*************************
* class RWGltf_CafReader *
*************************/
class RWGltf_CafReader : public RWMesh_CafReader {
	public:
		/****** RWGltf_CafReader::RWGltf_CafReader ******/
		/****** md5 signature: b49d51924e7e037097c2ebd9d2d54ff2 ******/
		%feature("compactdefaultargs") RWGltf_CafReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWGltf_CafReader;
		 RWGltf_CafReader();

		/****** RWGltf_CafReader::IsDoublePrecision ******/
		/****** md5 signature: c768d26054fe7836c133ffb1451dd7cd ******/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to fill in triangulation using double or single precision; False by default.
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****** RWGltf_CafReader::SetDoublePrecision ******/
		/****** md5 signature: 2fee9d611d346cc1324a9f63e1c71f99 ******/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "
Parameters
----------
theIsDouble: bool

Return
-------
None

Description
-----------
Set flag to fill in triangulation using double or single precision.
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****** RWGltf_CafReader::SetLoadAllScenes ******/
		/****** md5 signature: f7e7895811cadb8899b959afc63acc0d ******/
		%feature("compactdefaultargs") SetLoadAllScenes;
		%feature("autodoc", "
Parameters
----------
theToLoadAll: bool

Return
-------
None

Description
-----------
Set flag to flag to load all scenes in the document, False by default which means only main (default) scene will be loaded.
") SetLoadAllScenes;
		void SetLoadAllScenes(bool theToLoadAll);

		/****** RWGltf_CafReader::SetMeshNameAsFallback ******/
		/****** md5 signature: 8bcbe5f3e17e020b0661e880c51f5245 ******/
		%feature("compactdefaultargs") SetMeshNameAsFallback;
		%feature("autodoc", "
Parameters
----------
theToFallback: bool

Return
-------
None

Description
-----------
Set flag to use Mesh name in case if Node name is empty.
") SetMeshNameAsFallback;
		void SetMeshNameAsFallback(bool theToFallback);

		/****** RWGltf_CafReader::SetParallel ******/
		/****** md5 signature: 298b1fbcc88b83d7071890cceab0869e ******/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "
Parameters
----------
theToParallel: bool

Return
-------
None

Description
-----------
Setup multithreaded execution.
") SetParallel;
		void SetParallel(bool theToParallel);

		/****** RWGltf_CafReader::SetSkipEmptyNodes ******/
		/****** md5 signature: a7a153b4100df7de6ec47b025f5904c9 ******/
		%feature("compactdefaultargs") SetSkipEmptyNodes;
		%feature("autodoc", "
Parameters
----------
theToSkip: bool

Return
-------
None

Description
-----------
Set flag to ignore nodes without Geometry.
") SetSkipEmptyNodes;
		void SetSkipEmptyNodes(bool theToSkip);

		/****** RWGltf_CafReader::SetToKeepLateData ******/
		/****** md5 signature: bf1347d776ae6167c6e96d6e182f1af6 ******/
		%feature("compactdefaultargs") SetToKeepLateData;
		%feature("autodoc", "
Parameters
----------
theToKeep: bool

Return
-------
None

Description
-----------
Sets flag to keep information about deferred storage to load/unload data later.
") SetToKeepLateData;
		void SetToKeepLateData(bool theToKeep);

		/****** RWGltf_CafReader::SetToPrintDebugMessages ******/
		/****** md5 signature: dcbcbd79fdeab4f6976a1573fd9e5905 ******/
		%feature("compactdefaultargs") SetToPrintDebugMessages;
		%feature("autodoc", "
Parameters
----------
theToPrint: bool

Return
-------
None

Description
-----------
Sets flag to print debug information.
") SetToPrintDebugMessages;
		void SetToPrintDebugMessages(const Standard_Boolean theToPrint);

		/****** RWGltf_CafReader::SetToSkipLateDataLoading ******/
		/****** md5 signature: 69a6c7a7b6fdbd3dfbc1b2ba14c99da9 ******/
		%feature("compactdefaultargs") SetToSkipLateDataLoading;
		%feature("autodoc", "
Parameters
----------
theToSkip: bool

Return
-------
None

Description
-----------
Sets flag to skip data loading.
") SetToSkipLateDataLoading;
		void SetToSkipLateDataLoading(bool theToSkip);

		/****** RWGltf_CafReader::ToKeepLateData ******/
		/****** md5 signature: 2fd9c6b4aa6b4a6fcd0142c7db0dd364 ******/
		%feature("compactdefaultargs") ToKeepLateData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if data should be loaded into itself without its transferring to new structure. It allows to keep information about deferred storage to load/unload this data later. True by default.
") ToKeepLateData;
		bool ToKeepLateData();

		/****** RWGltf_CafReader::ToLoadAllScenes ******/
		/****** md5 signature: c496cd858c8cf67d041c2580f24e2e5f ******/
		%feature("compactdefaultargs") ToLoadAllScenes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if all scenes in the document should be loaded, False by default which means only main (default) scene will be loaded.
") ToLoadAllScenes;
		bool ToLoadAllScenes();

		/****** RWGltf_CafReader::ToParallel ******/
		/****** md5 signature: bf4527df56769064945cdf0919b0491e ******/
		%feature("compactdefaultargs") ToParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if multithreaded optimizations are allowed; False by default.
") ToParallel;
		bool ToParallel();

		/****** RWGltf_CafReader::ToPrintDebugMessages ******/
		/****** md5 signature: 807c07787e3c5595045ec8c134e0077e ******/
		%feature("compactdefaultargs") ToPrintDebugMessages;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if additional debug information should be print; False by default.
") ToPrintDebugMessages;
		bool ToPrintDebugMessages();

		/****** RWGltf_CafReader::ToSkipEmptyNodes ******/
		/****** md5 signature: aa5d3722c5c1c7fa9b1374eec1aebf9e ******/
		%feature("compactdefaultargs") ToSkipEmptyNodes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if Nodes without Geometry should be ignored, True by default.
") ToSkipEmptyNodes;
		bool ToSkipEmptyNodes();

		/****** RWGltf_CafReader::ToSkipLateDataLoading ******/
		/****** md5 signature: 9cd0a4011a4f568fa4da7fd837164e31 ******/
		%feature("compactdefaultargs") ToSkipLateDataLoading;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if data loading should be skipped and can be performed later; False by default.
") ToSkipLateDataLoading;
		bool ToSkipLateDataLoading();

		/****** RWGltf_CafReader::ToUseMeshNameAsFallback ******/
		/****** md5 signature: db6080fd37887a51344b071137921164 ******/
		%feature("compactdefaultargs") ToUseMeshNameAsFallback;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Set flag to use Mesh name in case if Node name is empty, True by default.
") ToUseMeshNameAsFallback;
		bool ToUseMeshNameAsFallback();

};


%extend RWGltf_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class RWGltf_CafWriter *
*************************/
class RWGltf_CafWriter : public Standard_Transient {
	public:
		class Mesh {};
		class RWGltf_StyledShape {};
		class Hasher {};
		/****** RWGltf_CafWriter::RWGltf_CafWriter ******/
		/****** md5 signature: ff99e81d575a475273adc594a6a9069b ******/
		%feature("compactdefaultargs") RWGltf_CafWriter;
		%feature("autodoc", "
Parameters
----------
theFile: str
theIsBinary: bool

Return
-------
None

Description
-----------
Main constructor. 
Input parameter: theFile path to output glTF file 
Input parameter: theIsBinary flag to write into binary glTF format (.glb).
") RWGltf_CafWriter;
		 RWGltf_CafWriter(TCollection_AsciiString theFile, Standard_Boolean theIsBinary);

		/****** RWGltf_CafWriter::ChangeCoordinateSystemConverter ******/
		/****** md5 signature: fd10c9e3345c0c11d37ccaa13f77ec3f ******/
		%feature("compactdefaultargs") ChangeCoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from OCCT to glTF coordinate system.
") ChangeCoordinateSystemConverter;
		RWMesh_CoordinateSystemConverter & ChangeCoordinateSystemConverter();

		/****** RWGltf_CafWriter::CompressionParameters ******/
		/****** md5 signature: 9fe18683c5b8a0eebc3a8d3b41d20c50 ******/
		%feature("compactdefaultargs") CompressionParameters;
		%feature("autodoc", "Return
-------
RWGltf_DracoParameters

Description
-----------
Return Draco parameters.
") CompressionParameters;
		const RWGltf_DracoParameters & CompressionParameters();

		/****** RWGltf_CafWriter::CoordinateSystemConverter ******/
		/****** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ******/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return
-------
RWMesh_CoordinateSystemConverter

Description
-----------
Return transformation from OCCT to glTF coordinate system.
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****** RWGltf_CafWriter::DefaultStyle ******/
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

		/****** RWGltf_CafWriter::IsBinary ******/
		/****** md5 signature: 9ce3d7357ed748dba6cdb9f4404b8e7d ******/
		%feature("compactdefaultargs") IsBinary;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to write into binary glTF format (.glb), specified within class constructor.
") IsBinary;
		bool IsBinary();

		/****** RWGltf_CafWriter::IsForcedUVExport ******/
		/****** md5 signature: 80e5400de801ae56f3f4e21529ac07e5 ******/
		%feature("compactdefaultargs") IsForcedUVExport;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True to export UV coordinates even if there are no mapped texture; False by default.
") IsForcedUVExport;
		bool IsForcedUVExport();

		/****** RWGltf_CafWriter::MeshNameFormat ******/
		/****** md5 signature: 76ba76586b298c522ad8b92a37a0a9e1 ******/
		%feature("compactdefaultargs") MeshNameFormat;
		%feature("autodoc", "Return
-------
RWMesh_NameFormat

Description
-----------
Return name format for exporting Meshes; RWMesh_NameFormat_Product by default.
") MeshNameFormat;
		RWMesh_NameFormat MeshNameFormat();

		/****** RWGltf_CafWriter::NodeNameFormat ******/
		/****** md5 signature: 6157d7986a7da93fd8b9409e290045be ******/
		%feature("compactdefaultargs") NodeNameFormat;
		%feature("autodoc", "Return
-------
RWMesh_NameFormat

Description
-----------
Return name format for exporting Nodes; RWMesh_NameFormat_InstanceOrProduct by default.
") NodeNameFormat;
		RWMesh_NameFormat NodeNameFormat();

		/****** RWGltf_CafWriter::Perform ******/
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
Write glTF file and associated binary file. Triangulation data should be precomputed within shapes! 
Input parameter: theDocument input document 
Input parameter: theRootLabels list of root shapes to export 
Input parameter: theLabelFilter optional filter with document nodes to export,  with keys defined by XCAFPrs_DocumentExplorer::DefineChildId() and  filled recursively (leaves and parent assembly nodes at all  levels); when not NULL, all nodes not included into the map will be  ignored 
Input parameter: theFileInfo map with file metadata to put into glTF header section 
Input parameter: theProgress optional progress indicator 
Return: False on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TDF_LabelSequence & theRootLabels, const TColStd_MapOfAsciiString * theLabelFilter, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****** RWGltf_CafWriter::Perform ******/
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
Write glTF file and associated binary file. Triangulation data should be precomputed within shapes! 
Input parameter: theDocument input document 
Input parameter: theFileInfo map with file metadata to put into glTF header section 
Input parameter: theProgress optional progress indicator 
Return: False on file writing failure.
") Perform;
		virtual bool Perform(const opencascade::handle<TDocStd_Document> & theDocument, const TColStd_IndexedDataMapOfStringString & theFileInfo, const Message_ProgressRange & theProgress);

		/****** RWGltf_CafWriter::SetCompressionParameters ******/
		/****** md5 signature: f822f9c1b83a8bd720a91827f059b8c1 ******/
		%feature("compactdefaultargs") SetCompressionParameters;
		%feature("autodoc", "
Parameters
----------
theDracoParameters: RWGltf_DracoParameters

Return
-------
None

Description
-----------
Set Draco parameters.
") SetCompressionParameters;
		void SetCompressionParameters(const RWGltf_DracoParameters & theDracoParameters);

		/****** RWGltf_CafWriter::SetCoordinateSystemConverter ******/
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
Set transformation from OCCT to glTF coordinate system.
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****** RWGltf_CafWriter::SetDefaultStyle ******/
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

		/****** RWGltf_CafWriter::SetForcedUVExport ******/
		/****** md5 signature: f1b443576e23f97537145ae3cb746348 ******/
		%feature("compactdefaultargs") SetForcedUVExport;
		%feature("autodoc", "
Parameters
----------
theToForce: bool

Return
-------
None

Description
-----------
Set flag to export UV coordinates even if there are no mapped texture; False by default.
") SetForcedUVExport;
		void SetForcedUVExport(bool theToForce);

		/****** RWGltf_CafWriter::SetMergeFaces ******/
		/****** md5 signature: ceae01520c794775cb258dde9c353037 ******/
		%feature("compactdefaultargs") SetMergeFaces;
		%feature("autodoc", "
Parameters
----------
theToMerge: bool

Return
-------
None

Description
-----------
Set flag to merge faces within a single part. May reduce JSON size thanks to smaller number of primitive arrays.
") SetMergeFaces;
		void SetMergeFaces(bool theToMerge);

		/****** RWGltf_CafWriter::SetMeshNameFormat ******/
		/****** md5 signature: 15211207f69e0393dff98ff72d228452 ******/
		%feature("compactdefaultargs") SetMeshNameFormat;
		%feature("autodoc", "
Parameters
----------
theFormat: RWMesh_NameFormat

Return
-------
None

Description
-----------
Set name format for exporting Meshes.
") SetMeshNameFormat;
		void SetMeshNameFormat(RWMesh_NameFormat theFormat);

		/****** RWGltf_CafWriter::SetNodeNameFormat ******/
		/****** md5 signature: ab08236a14a52776b2440a4a780bd571 ******/
		%feature("compactdefaultargs") SetNodeNameFormat;
		%feature("autodoc", "
Parameters
----------
theFormat: RWMesh_NameFormat

Return
-------
None

Description
-----------
Set name format for exporting Nodes.
") SetNodeNameFormat;
		void SetNodeNameFormat(RWMesh_NameFormat theFormat);

		/****** RWGltf_CafWriter::SetParallel ******/
		/****** md5 signature: 298b1fbcc88b83d7071890cceab0869e ******/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "
Parameters
----------
theToParallel: bool

Return
-------
None

Description
-----------
Setup multithreaded execution.
") SetParallel;
		void SetParallel(bool theToParallel);

		/****** RWGltf_CafWriter::SetSplitIndices16 ******/
		/****** md5 signature: 1288dab228d4bf876dcdee8ef6eed613 ******/
		%feature("compactdefaultargs") SetSplitIndices16;
		%feature("autodoc", "
Parameters
----------
theToSplit: bool

Return
-------
None

Description
-----------
Set flag to prefer keeping 16-bit indexes while merging face. Has effect only with ToMergeFaces() option turned ON. May reduce binary data size thanks to smaller triangle indexes.
") SetSplitIndices16;
		void SetSplitIndices16(bool theToSplit);

		/****** RWGltf_CafWriter::SetToEmbedTexturesInGlb ******/
		/****** md5 signature: 3ebdf9ec402608f87c7a254baf5a2ed3 ******/
		%feature("compactdefaultargs") SetToEmbedTexturesInGlb;
		%feature("autodoc", "
Parameters
----------
theToEmbedTexturesInGlb: bool

Return
-------
None

Description
-----------
Set flag to write image textures into GLB file (binary gltf export).
") SetToEmbedTexturesInGlb;
		void SetToEmbedTexturesInGlb(Standard_Boolean theToEmbedTexturesInGlb);

		/****** RWGltf_CafWriter::SetTransformationFormat ******/
		/****** md5 signature: 9c5e4763a1df6fe364556ff7a71dcfa0 ******/
		%feature("compactdefaultargs") SetTransformationFormat;
		%feature("autodoc", "
Parameters
----------
theFormat: RWGltf_WriterTrsfFormat

Return
-------
None

Description
-----------
Set preferred transformation format for writing into glTF file.
") SetTransformationFormat;
		void SetTransformationFormat(RWGltf_WriterTrsfFormat theFormat);

		/****** RWGltf_CafWriter::ToEmbedTexturesInGlb ******/
		/****** md5 signature: 929a783c967f4321720edabef49cbd9e ******/
		%feature("compactdefaultargs") ToEmbedTexturesInGlb;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to write image textures into GLB file (binary gltf export); True by default. When set to False, texture images will be written as separate files. Has no effect on writing into non-binary format.
") ToEmbedTexturesInGlb;
		Standard_Boolean ToEmbedTexturesInGlb();

		/****** RWGltf_CafWriter::ToMergeFaces ******/
		/****** md5 signature: 0d4ced3de8f6fb910d4ed5ea927a1a6a ******/
		%feature("compactdefaultargs") ToMergeFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to merge faces within a single part; False by default.
") ToMergeFaces;
		bool ToMergeFaces();

		/****** RWGltf_CafWriter::ToParallel ******/
		/****** md5 signature: bf4527df56769064945cdf0919b0491e ******/
		%feature("compactdefaultargs") ToParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if multithreaded optimizations are allowed; False by default.
") ToParallel;
		bool ToParallel();

		/****** RWGltf_CafWriter::ToSplitIndices16 ******/
		/****** md5 signature: fcc04d89915d622c0004d458ccc2b398 ******/
		%feature("compactdefaultargs") ToSplitIndices16;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to prefer keeping 16-bit indexes while merging face; False by default.
") ToSplitIndices16;
		bool ToSplitIndices16();

		/****** RWGltf_CafWriter::TransformationFormat ******/
		/****** md5 signature: bbeefb2300588d1a6143500ba5adaede ******/
		%feature("compactdefaultargs") TransformationFormat;
		%feature("autodoc", "Return
-------
RWGltf_WriterTrsfFormat

Description
-----------
Return preferred transformation format for writing into glTF file; RWGltf_WriterTrsfFormat_Compact by default.
") TransformationFormat;
		RWGltf_WriterTrsfFormat TransformationFormat();

};


%make_alias(RWGltf_CafWriter)

%extend RWGltf_CafWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWGltf_DracoParameters *
*******************************/
class RWGltf_DracoParameters {
	public:
		/****** RWGltf_DracoParameters::RWGltf_DracoParameters ******/
		/****** md5 signature: d5dfa6304b51c9885dba464f263b6e30 ******/
		%feature("compactdefaultargs") RWGltf_DracoParameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWGltf_DracoParameters;
		 RWGltf_DracoParameters();

};


%extend RWGltf_DracoParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class RWGltf_GltfAccessor *
****************************/
class RWGltf_GltfAccessor {
	public:
		/****** RWGltf_GltfAccessor::RWGltf_GltfAccessor ******/
		/****** md5 signature: 1ac0c993d4339614409d9c5e0ac9bdc9 ******/
		%feature("compactdefaultargs") RWGltf_GltfAccessor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWGltf_GltfAccessor;
		 RWGltf_GltfAccessor();

};


%extend RWGltf_GltfAccessor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWGltf_GltfBufferView *
******************************/
class RWGltf_GltfBufferView {
	public:
		/****** RWGltf_GltfBufferView::RWGltf_GltfBufferView ******/
		/****** md5 signature: 7f05f05ddf9d2f909355f94a9fbcef5d ******/
		%feature("compactdefaultargs") RWGltf_GltfBufferView;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWGltf_GltfBufferView;
		 RWGltf_GltfBufferView();

};


%extend RWGltf_GltfBufferView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWGltf_GltfFace *
************************/
class RWGltf_GltfFace : public Standard_Transient {
	public:
		/****** RWGltf_GltfFace::RWGltf_GltfFace ******/
		/****** md5 signature: f1d3a933cb06de89e0a1c4e714a35b6f ******/
		%feature("compactdefaultargs") RWGltf_GltfFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWGltf_GltfFace;
		 RWGltf_GltfFace();

};


%make_alias(RWGltf_GltfFace)

%extend RWGltf_GltfFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWGltf_GltfLatePrimitiveArray *
**************************************/
class RWGltf_GltfLatePrimitiveArray : public RWMesh_TriangulationSource {
	public:
		/****** RWGltf_GltfLatePrimitiveArray::RWGltf_GltfLatePrimitiveArray ******/
		/****** md5 signature: 7107dfd4e0698cb28650e1340d202186 ******/
		%feature("compactdefaultargs") RWGltf_GltfLatePrimitiveArray;
		%feature("autodoc", "
Parameters
----------
theId: str
theName: str

Return
-------
None

Description
-----------
Constructor.
") RWGltf_GltfLatePrimitiveArray;
		 RWGltf_GltfLatePrimitiveArray(TCollection_AsciiString theId, TCollection_AsciiString theName);

		/****** RWGltf_GltfLatePrimitiveArray::AddPrimArrayData ******/
		/****** md5 signature: 6b00508c9622c6f7b8308c0e8ee7efd5 ******/
		%feature("compactdefaultargs") AddPrimArrayData;
		%feature("autodoc", "
Parameters
----------
theType: RWGltf_GltfArrayType

Return
-------
RWGltf_GltfPrimArrayData

Description
-----------
Add primitive array data element.
") AddPrimArrayData;
		RWGltf_GltfPrimArrayData & AddPrimArrayData(RWGltf_GltfArrayType theType);

		/****** RWGltf_GltfLatePrimitiveArray::BaseColor ******/
		/****** md5 signature: f8585c32bce71447f36243b6bcd6baa9 ******/
		%feature("compactdefaultargs") BaseColor;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return base color.
") BaseColor;
		Quantity_ColorRGBA BaseColor();

		/****** RWGltf_GltfLatePrimitiveArray::Data ******/
		/****** md5 signature: 671d99c5b4ce7f7e5b939e40427e52b5 ******/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return
-------
NCollection_Sequence<RWGltf_GltfPrimArrayData>

Description
-----------
Return primitive array data elements.
") Data;
		const NCollection_Sequence<RWGltf_GltfPrimArrayData> & Data();

		/****** RWGltf_GltfLatePrimitiveArray::HasDeferredData ******/
		/****** md5 signature: 2e68cb99f0a96431d1e289930b5a3662 ******/
		%feature("compactdefaultargs") HasDeferredData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if there is deferred storage and some triangulation data that can be loaded using LoadDeferredData().
") HasDeferredData;
		virtual Standard_Boolean HasDeferredData();

		/****** RWGltf_GltfLatePrimitiveArray::HasStyle ******/
		/****** md5 signature: 0269e4556c7e0b5145883ad478e02061 ******/
		%feature("compactdefaultargs") HasStyle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if primitive array has assigned material.
") HasStyle;
		bool HasStyle();

		/****** RWGltf_GltfLatePrimitiveArray::Id ******/
		/****** md5 signature: 932272b78b9184cc2485436a72cc2df4 ******/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Entity id.
") Id;
		const TCollection_AsciiString & Id();

		/****** RWGltf_GltfLatePrimitiveArray::LoadStreamData ******/
		/****** md5 signature: c873deb6e325607ba01a0a4af1d6d353 ******/
		%feature("compactdefaultargs") LoadStreamData;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Load primitive array saved as stream buffer to new triangulation object.
") LoadStreamData;
		opencascade::handle<Poly_Triangulation> LoadStreamData();

		/****** RWGltf_GltfLatePrimitiveArray::MaterialCommon ******/
		/****** md5 signature: 85b380ad63e6ef92cb904824c21269fb ******/
		%feature("compactdefaultargs") MaterialCommon;
		%feature("autodoc", "Return
-------
opencascade::handle<RWGltf_MaterialCommon>

Description
-----------
Return common (obsolete) material definition.
") MaterialCommon;
		const opencascade::handle<RWGltf_MaterialCommon> & MaterialCommon();

		/****** RWGltf_GltfLatePrimitiveArray::MaterialPbr ******/
		/****** md5 signature: 0e13967206ad8a2eb39ea88324416ad3 ******/
		%feature("compactdefaultargs") MaterialPbr;
		%feature("autodoc", "Return
-------
opencascade::handle<RWGltf_MaterialMetallicRoughness>

Description
-----------
Return PBR material definition.
") MaterialPbr;
		const opencascade::handle<RWGltf_MaterialMetallicRoughness> & MaterialPbr();

		/****** RWGltf_GltfLatePrimitiveArray::Name ******/
		/****** md5 signature: efed61b92683387cd746fb27e0376505 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Entity name.
") Name;
		const TCollection_AsciiString & Name();

		/****** RWGltf_GltfLatePrimitiveArray::PrimitiveMode ******/
		/****** md5 signature: 1388d87831822c6f2201fbc4bc4ec619 ******/
		%feature("compactdefaultargs") PrimitiveMode;
		%feature("autodoc", "Return
-------
RWGltf_GltfPrimitiveMode

Description
-----------
Return type of primitive array.
") PrimitiveMode;
		RWGltf_GltfPrimitiveMode PrimitiveMode();

		/****** RWGltf_GltfLatePrimitiveArray::SetMaterialCommon ******/
		/****** md5 signature: eb324aa6f8f3dcad75f93a5311e95086 ******/
		%feature("compactdefaultargs") SetMaterialCommon;
		%feature("autodoc", "
Parameters
----------
theMat: RWGltf_MaterialCommon

Return
-------
None

Description
-----------
Set common (obsolete) material definition.
") SetMaterialCommon;
		void SetMaterialCommon(const opencascade::handle<RWGltf_MaterialCommon> & theMat);

		/****** RWGltf_GltfLatePrimitiveArray::SetMaterialPbr ******/
		/****** md5 signature: 3e0bf5941a300faa04272f3890b437a5 ******/
		%feature("compactdefaultargs") SetMaterialPbr;
		%feature("autodoc", "
Parameters
----------
theMat: RWGltf_MaterialMetallicRoughness

Return
-------
None

Description
-----------
Set PBR material definition.
") SetMaterialPbr;
		void SetMaterialPbr(const opencascade::handle<RWGltf_MaterialMetallicRoughness> & theMat);

		/****** RWGltf_GltfLatePrimitiveArray::SetName ******/
		/****** md5 signature: 273df384551aa519beda71c20cd913ae ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
Assign entity name.
") SetName;
		void SetName(TCollection_AsciiString theName);

		/****** RWGltf_GltfLatePrimitiveArray::SetPrimitiveMode ******/
		/****** md5 signature: 9f225fc36e5fa984961bb4bfa76b0b80 ******/
		%feature("compactdefaultargs") SetPrimitiveMode;
		%feature("autodoc", "
Parameters
----------
theMode: RWGltf_GltfPrimitiveMode

Return
-------
None

Description
-----------
Set type of primitive array.
") SetPrimitiveMode;
		void SetPrimitiveMode(RWGltf_GltfPrimitiveMode theMode);

};


%extend RWGltf_GltfLatePrimitiveArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWGltf_GltfMaterialMap *
*******************************/
class RWGltf_GltfMaterialMap : public RWMesh_MaterialMap {
	public:
		/****** RWGltf_GltfMaterialMap::RWGltf_GltfMaterialMap ******/
		/****** md5 signature: 72d42c8ae7b75c180626db034ae283e4 ******/
		%feature("compactdefaultargs") RWGltf_GltfMaterialMap;
		%feature("autodoc", "
Parameters
----------
theFile: str
theDefSamplerId: int

Return
-------
None

Description
-----------
Main constructor.
") RWGltf_GltfMaterialMap;
		 RWGltf_GltfMaterialMap(TCollection_AsciiString theFile, const Standard_Integer theDefSamplerId);

		/****** RWGltf_GltfMaterialMap::AddGlbImages ******/
		/****** md5 signature: 8f702f135cd650ff90bbfd94f352532d ******/
		%feature("compactdefaultargs") AddGlbImages;
		%feature("autodoc", "
Parameters
----------
theStyle: XCAFPrs_Style

Return
-------
theBinFile: std::ostream

Description
-----------
Add material images into GLB stream. 
Input parameter:[out] theBinFile output file stream 
Input parameter: theStyle material images to add.
") AddGlbImages;
		void AddGlbImages(std::ostream &OutValue, const XCAFPrs_Style & theStyle);

		/****** RWGltf_GltfMaterialMap::AddImages ******/
		/****** md5 signature: 3aa5121db2a6a900aa23f78102a3d9de ******/
		%feature("compactdefaultargs") AddImages;
		%feature("autodoc", "
Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theStyle: XCAFPrs_Style

Return
-------
theIsStarted: bool

Description
-----------
Add material images in case of non-GLB file (an alternative to AddImagesToGlb() + FlushBufferViews() + FlushImagesGlb()).
") AddImages;
		void AddImages(RWGltf_GltfOStreamWriter * theWriter, const XCAFPrs_Style & theStyle, Standard_Boolean &OutValue);

		/****** RWGltf_GltfMaterialMap::AddMaterial ******/
		/****** md5 signature: f00566a55f97100149cb0a32887c56e2 ******/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "
Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theStyle: XCAFPrs_Style

Return
-------
theIsStarted: bool

Description
-----------
Add material.
") AddMaterial;
		void AddMaterial(RWGltf_GltfOStreamWriter * theWriter, const XCAFPrs_Style & theStyle, Standard_Boolean &OutValue);

		/****** RWGltf_GltfMaterialMap::AddTextures ******/
		/****** md5 signature: e7f7e21ca77d944a33d6f85cccc4fadf ******/
		%feature("compactdefaultargs") AddTextures;
		%feature("autodoc", "
Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theStyle: XCAFPrs_Style

Return
-------
theIsStarted: bool

Description
-----------
Add material textures.
") AddTextures;
		void AddTextures(RWGltf_GltfOStreamWriter * theWriter, const XCAFPrs_Style & theStyle, Standard_Boolean &OutValue);

		/****** RWGltf_GltfMaterialMap::FlushGlbBufferViews ******/
		/****** md5 signature: 6637f05a69ee314b2da8453cf1e79868 ******/
		%feature("compactdefaultargs") FlushGlbBufferViews;
		%feature("autodoc", "
Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theBinDataBufferId: int

Return
-------
theBuffViewId: int

Description
-----------
Add bufferView's into RWGltf_GltfRootElement_BufferViews section with images collected by AddImagesToGlb().
") FlushGlbBufferViews;
		void FlushGlbBufferViews(RWGltf_GltfOStreamWriter * theWriter, const Standard_Integer theBinDataBufferId, Standard_Integer &OutValue);

		/****** RWGltf_GltfMaterialMap::FlushGlbImages ******/
		/****** md5 signature: 0b5d6da57d2a5e07a4250fe93451c613 ******/
		%feature("compactdefaultargs") FlushGlbImages;
		%feature("autodoc", "
Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *

Return
-------
None

Description
-----------
Write RWGltf_GltfRootElement_Images section with images collected by AddImagesToGlb().
") FlushGlbImages;
		void FlushGlbImages(RWGltf_GltfOStreamWriter * theWriter);

		/****** RWGltf_GltfMaterialMap::NbImages ******/
		/****** md5 signature: 287f9b24a015fc67da1fac6d39501fc7 ******/
		%feature("compactdefaultargs") NbImages;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return extent of images map.
") NbImages;
		Standard_Integer NbImages();

		/****** RWGltf_GltfMaterialMap::NbTextures ******/
		/****** md5 signature: efcc0445631a819a279f5a21b5f29bcb ******/
		%feature("compactdefaultargs") NbTextures;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return extent of textures map.
") NbTextures;
		Standard_Integer NbTextures();

		/****** RWGltf_GltfMaterialMap::baseColorTexture ******/
		/****** md5 signature: dfff25579f1db3e6f1635a79761ecf6f ******/
		%feature("compactdefaultargs") baseColorTexture;
		%feature("autodoc", "
Parameters
----------
theMat: XCAFDoc_VisMaterial

Return
-------
opencascade::handle<Image_Texture>

Description
-----------
Return base color texture.
") baseColorTexture;
		static const opencascade::handle<Image_Texture> & baseColorTexture(const opencascade::handle<XCAFDoc_VisMaterial> & theMat);

};


%extend RWGltf_GltfMaterialMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWGltf_GltfOStreamWriter *
*********************************/
class RWGltf_GltfOStreamWriter : public rapidjson::Writer<rapidjson::OStreamWrapper> {
	public:
		/****** RWGltf_GltfOStreamWriter::RWGltf_GltfOStreamWriter ******/
		/****** md5 signature: 39e45338506e2d1a7664840241a7b472 ******/
		%feature("compactdefaultargs") RWGltf_GltfOStreamWriter;
		%feature("autodoc", "
Parameters
----------
theOStream: rapidjson::OStreamWrapper

Return
-------
None

Description
-----------
Main constructor.
") RWGltf_GltfOStreamWriter;
		 RWGltf_GltfOStreamWriter(rapidjson::OStreamWrapper & theOStream);

};


%extend RWGltf_GltfOStreamWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWGltf_GltfPrimArrayData *
*********************************/
class RWGltf_GltfPrimArrayData {
	public:
		/****** RWGltf_GltfPrimArrayData::RWGltf_GltfPrimArrayData ******/
		/****** md5 signature: 082773010cd7514b9dd09e3d44d4bec5 ******/
		%feature("compactdefaultargs") RWGltf_GltfPrimArrayData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWGltf_GltfPrimArrayData;
		 RWGltf_GltfPrimArrayData();

		/****** RWGltf_GltfPrimArrayData::RWGltf_GltfPrimArrayData ******/
		/****** md5 signature: 8b5a6513192f0ecb3cdb8caf0433eb34 ******/
		%feature("compactdefaultargs") RWGltf_GltfPrimArrayData;
		%feature("autodoc", "
Parameters
----------
theType: RWGltf_GltfArrayType

Return
-------
None

Description
-----------
No available documentation.
") RWGltf_GltfPrimArrayData;
		 RWGltf_GltfPrimArrayData(RWGltf_GltfArrayType theType);

};


%extend RWGltf_GltfPrimArrayData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWGltf_GltfSceneNodeMap *
********************************/
class RWGltf_GltfSceneNodeMap : public NCollection_IndexedMap<XCAFPrs_DocumentNode> {
	public:
		/****** RWGltf_GltfSceneNodeMap::RWGltf_GltfSceneNodeMap ******/
		/****** md5 signature: 7eb6a53ba949dbdb457796ba63fb4a03 ******/
		%feature("compactdefaultargs") RWGltf_GltfSceneNodeMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWGltf_GltfSceneNodeMap;
		 RWGltf_GltfSceneNodeMap();

		/****** RWGltf_GltfSceneNodeMap::FindIndex ******/
		/****** md5 signature: 47457616668af339aa3d60c8b18b08d5 ******/
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "
Parameters
----------
theNodeId: str

Return
-------
int

Description
-----------
Find index from document node string identifier.
") FindIndex;
		Standard_Integer FindIndex(TCollection_AsciiString theNodeId);

};


%extend RWGltf_GltfSceneNodeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWGltf_MaterialCommon *
******************************/
class RWGltf_MaterialCommon : public Standard_Transient {
	public:
		/****** RWGltf_MaterialCommon::RWGltf_MaterialCommon ******/
		/****** md5 signature: 5f7db091e0ba1d4aaa046ad813cbb86f ******/
		%feature("compactdefaultargs") RWGltf_MaterialCommon;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWGltf_MaterialCommon;
		 RWGltf_MaterialCommon();

};


%make_alias(RWGltf_MaterialCommon)

%extend RWGltf_MaterialCommon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class RWGltf_MaterialMetallicRoughness *
*****************************************/
class RWGltf_MaterialMetallicRoughness : public Standard_Transient {
	public:
		/****** RWGltf_MaterialMetallicRoughness::RWGltf_MaterialMetallicRoughness ******/
		/****** md5 signature: 3e7e7f6dcac2ab520e773c1e52d06831 ******/
		%feature("compactdefaultargs") RWGltf_MaterialMetallicRoughness;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RWGltf_MaterialMetallicRoughness;
		 RWGltf_MaterialMetallicRoughness();

};


%make_alias(RWGltf_MaterialMetallicRoughness)

%extend RWGltf_MaterialMetallicRoughness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWGltf_TriangulationReader *
***********************************/
class RWGltf_TriangulationReader : public RWMesh_TriangulationReader {
	public:
		/****** RWGltf_TriangulationReader::RWGltf_TriangulationReader ******/
		/****** md5 signature: 13fc434c88256ab85cd744519fc5e86f ******/
		%feature("compactdefaultargs") RWGltf_TriangulationReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") RWGltf_TriangulationReader;
		 RWGltf_TriangulationReader();

		/****** RWGltf_TriangulationReader::LoadStreamData ******/
		/****** md5 signature: 46d61db1bac4243ed0d2e1650f5f0bfc ******/
		%feature("compactdefaultargs") LoadStreamData;
		%feature("autodoc", "
Parameters
----------
theSourceMesh: RWMesh_TriangulationSource
theDestMesh: Poly_Triangulation

Return
-------
bool

Description
-----------
Loads only primitive arrays saved as stream buffer (it is primarily glTF data encoded in base64 saved to temporary buffer during glTF file reading).
") LoadStreamData;
		bool LoadStreamData(const opencascade::handle<RWMesh_TriangulationSource> & theSourceMesh, const opencascade::handle<Poly_Triangulation> & theDestMesh);

};


%extend RWGltf_TriangulationReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class RWGltf_GltfSharedIStream:
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
def RWGltf_GltfMaterialMap_baseColorTexture(*args):
	return RWGltf_GltfMaterialMap.baseColorTexture(*args)

}
