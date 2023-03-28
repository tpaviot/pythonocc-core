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
%define RWGLTFDOCSTRING
"RWGltf module, see official documentation at
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_rwgltf.html"
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
#include<XSControl_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
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
%import XSControl.i
%import TopoDS.i
%import TopTools.i
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
typedef NCollection_Shared <NCollection_List <opencascade::handle <RWGltf_GltfFace>>> RWGltf_GltfFaceList;
typedef rapidjson::Document::ValueType RWGltf_JsonValue;
/* end typedefs declaration */

/*************************
* class RWGltf_CafReader *
*************************/
class RWGltf_CafReader : public RWMesh_CafReader {
	public:
		/****************** RWGltf_CafReader ******************/
		/**** md5 signature: b49d51924e7e037097c2ebd9d2d54ff2 ****/
		%feature("compactdefaultargs") RWGltf_CafReader;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWGltf_CafReader;
		 RWGltf_CafReader();

		/****************** IsDoublePrecision ******************/
		/**** md5 signature: c768d26054fe7836c133ffb1451dd7cd ****/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return flag to fill in triangulation using double or single precision; false by default.

Returns
-------
bool
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****************** SetDoublePrecision ******************/
		/**** md5 signature: 2fee9d611d346cc1324a9f63e1c71f99 ****/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "Set flag to fill in triangulation using double or single precision.

Parameters
----------
theIsDouble: bool

Returns
-------
None
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****************** SetLoadAllScenes ******************/
		/**** md5 signature: f7e7895811cadb8899b959afc63acc0d ****/
		%feature("compactdefaultargs") SetLoadAllScenes;
		%feature("autodoc", "Set flag to flag to load all scenes in the document, false by default which means only main (default) scene will be loaded.

Parameters
----------
theToLoadAll: bool

Returns
-------
None
") SetLoadAllScenes;
		void SetLoadAllScenes(bool theToLoadAll);

		/****************** SetMeshNameAsFallback ******************/
		/**** md5 signature: 8bcbe5f3e17e020b0661e880c51f5245 ****/
		%feature("compactdefaultargs") SetMeshNameAsFallback;
		%feature("autodoc", "Set flag to use mesh name in case if node name is empty.

Parameters
----------
theToFallback: bool

Returns
-------
None
") SetMeshNameAsFallback;
		void SetMeshNameAsFallback(bool theToFallback);

		/****************** SetParallel ******************/
		/**** md5 signature: 298b1fbcc88b83d7071890cceab0869e ****/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "Setup multithreaded execution.

Parameters
----------
theToParallel: bool

Returns
-------
None
") SetParallel;
		void SetParallel(bool theToParallel);

		/****************** SetSkipEmptyNodes ******************/
		/**** md5 signature: a7a153b4100df7de6ec47b025f5904c9 ****/
		%feature("compactdefaultargs") SetSkipEmptyNodes;
		%feature("autodoc", "Set flag to ignore nodes without geometry.

Parameters
----------
theToSkip: bool

Returns
-------
None
") SetSkipEmptyNodes;
		void SetSkipEmptyNodes(bool theToSkip);

		/****************** SetToKeepLateData ******************/
		/**** md5 signature: bf1347d776ae6167c6e96d6e182f1af6 ****/
		%feature("compactdefaultargs") SetToKeepLateData;
		%feature("autodoc", "Sets flag to keep information about deferred storage to load/unload data later.

Parameters
----------
theToKeep: bool

Returns
-------
None
") SetToKeepLateData;
		void SetToKeepLateData(bool theToKeep);

		/****************** SetToPrintDebugMessages ******************/
		/**** md5 signature: dcbcbd79fdeab4f6976a1573fd9e5905 ****/
		%feature("compactdefaultargs") SetToPrintDebugMessages;
		%feature("autodoc", "Sets flag to print debug information.

Parameters
----------
theToPrint: bool

Returns
-------
None
") SetToPrintDebugMessages;
		void SetToPrintDebugMessages(const Standard_Boolean theToPrint);

		/****************** SetToSkipLateDataLoading ******************/
		/**** md5 signature: 69a6c7a7b6fdbd3dfbc1b2ba14c99da9 ****/
		%feature("compactdefaultargs") SetToSkipLateDataLoading;
		%feature("autodoc", "Sets flag to skip data loading.

Parameters
----------
theToSkip: bool

Returns
-------
None
") SetToSkipLateDataLoading;
		void SetToSkipLateDataLoading(bool theToSkip);

		/****************** ToKeepLateData ******************/
		/**** md5 signature: 2fd9c6b4aa6b4a6fcd0142c7db0dd364 ****/
		%feature("compactdefaultargs") ToKeepLateData;
		%feature("autodoc", "Returns true if data should be loaded into itself without its transfering to new structure. it allows to keep information about deferred storage to load/unload this data later. true by default.

Returns
-------
bool
") ToKeepLateData;
		bool ToKeepLateData();

		/****************** ToLoadAllScenes ******************/
		/**** md5 signature: c496cd858c8cf67d041c2580f24e2e5f ****/
		%feature("compactdefaultargs") ToLoadAllScenes;
		%feature("autodoc", "Return true if all scenes in the document should be loaded, false by default which means only main (default) scene will be loaded.

Returns
-------
bool
") ToLoadAllScenes;
		bool ToLoadAllScenes();

		/****************** ToParallel ******************/
		/**** md5 signature: bf4527df56769064945cdf0919b0491e ****/
		%feature("compactdefaultargs") ToParallel;
		%feature("autodoc", "Return true if multithreaded optimizations are allowed; false by default.

Returns
-------
bool
") ToParallel;
		bool ToParallel();

		/****************** ToPrintDebugMessages ******************/
		/**** md5 signature: 807c07787e3c5595045ec8c134e0077e ****/
		%feature("compactdefaultargs") ToPrintDebugMessages;
		%feature("autodoc", "Returns true if additional debug information should be print; false by default.

Returns
-------
bool
") ToPrintDebugMessages;
		bool ToPrintDebugMessages();

		/****************** ToSkipEmptyNodes ******************/
		/**** md5 signature: aa5d3722c5c1c7fa9b1374eec1aebf9e ****/
		%feature("compactdefaultargs") ToSkipEmptyNodes;
		%feature("autodoc", "Return true if nodes without geometry should be ignored, true by default.

Returns
-------
bool
") ToSkipEmptyNodes;
		bool ToSkipEmptyNodes();

		/****************** ToSkipLateDataLoading ******************/
		/**** md5 signature: 9cd0a4011a4f568fa4da7fd837164e31 ****/
		%feature("compactdefaultargs") ToSkipLateDataLoading;
		%feature("autodoc", "Returns true if data loading should be skipped and can be performed later; false by default.

Returns
-------
bool
") ToSkipLateDataLoading;
		bool ToSkipLateDataLoading();

		/****************** ToUseMeshNameAsFallback ******************/
		/**** md5 signature: db6080fd37887a51344b071137921164 ****/
		%feature("compactdefaultargs") ToUseMeshNameAsFallback;
		%feature("autodoc", "Set flag to use mesh name in case if node name is empty, true by default.

Returns
-------
bool
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
		/****************** RWGltf_CafWriter ******************/
		/**** md5 signature: ff99e81d575a475273adc594a6a9069b ****/
		%feature("compactdefaultargs") RWGltf_CafWriter;
		%feature("autodoc", "//!< vector for mesh indices main constructor. @param thefile [in] path to output gltf file @param theisbinary [in] flag to write into binary gltf format (.glb).

Parameters
----------
theFile: str
theIsBinary: bool

Returns
-------
None
") RWGltf_CafWriter;
		 RWGltf_CafWriter(TCollection_AsciiString theFile, Standard_Boolean theIsBinary);

		/****************** ChangeCoordinateSystemConverter ******************/
		/**** md5 signature: fd10c9e3345c0c11d37ccaa13f77ec3f ****/
		%feature("compactdefaultargs") ChangeCoordinateSystemConverter;
		%feature("autodoc", "Return transformation from occt to gltf coordinate system.

Returns
-------
RWMesh_CoordinateSystemConverter
") ChangeCoordinateSystemConverter;
		RWMesh_CoordinateSystemConverter & ChangeCoordinateSystemConverter();

		/****************** CompressionParameters ******************/
		/**** md5 signature: 9fe18683c5b8a0eebc3a8d3b41d20c50 ****/
		%feature("compactdefaultargs") CompressionParameters;
		%feature("autodoc", "Return draco parameters.

Returns
-------
RWGltf_DracoParameters
") CompressionParameters;
		const RWGltf_DracoParameters & CompressionParameters();

		/****************** CoordinateSystemConverter ******************/
		/**** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ****/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return transformation from occt to gltf coordinate system.

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

		/****************** IsBinary ******************/
		/**** md5 signature: 9ce3d7357ed748dba6cdb9f4404b8e7d ****/
		%feature("compactdefaultargs") IsBinary;
		%feature("autodoc", "Return flag to write into binary gltf format (.glb), specified within class constructor.

Returns
-------
bool
") IsBinary;
		bool IsBinary();

		/****************** IsForcedUVExport ******************/
		/**** md5 signature: 80e5400de801ae56f3f4e21529ac07e5 ****/
		%feature("compactdefaultargs") IsForcedUVExport;
		%feature("autodoc", "Return true to export uv coordinates even if there are no mapped texture; false by default.

Returns
-------
bool
") IsForcedUVExport;
		bool IsForcedUVExport();

		/****************** MeshNameFormat ******************/
		/**** md5 signature: 76ba76586b298c522ad8b92a37a0a9e1 ****/
		%feature("compactdefaultargs") MeshNameFormat;
		%feature("autodoc", "Return name format for exporting meshes; rwmesh_nameformat_product by default.

Returns
-------
RWMesh_NameFormat
") MeshNameFormat;
		RWMesh_NameFormat MeshNameFormat();

		/****************** NodeNameFormat ******************/
		/**** md5 signature: 6157d7986a7da93fd8b9409e290045be ****/
		%feature("compactdefaultargs") NodeNameFormat;
		%feature("autodoc", "Return name format for exporting nodes; rwmesh_nameformat_instanceorproduct by default.

Returns
-------
RWMesh_NameFormat
") NodeNameFormat;
		RWMesh_NameFormat NodeNameFormat();

		/****************** Perform ******************/
		/**** md5 signature: b3c8698b77ac74b0d206a2448964d2ac ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Write gltf file and associated binary file. triangulation data should be precomputed within shapes! @param thedocument [in] input document @param therootlabels [in] list of root shapes to export @param thelabelfilter [in] optional filter with document nodes to export,  with keys defined by xcafprs_documentexplorer::definechildid() and filled recursively  (leaves and parent assembly nodes at all levels);  when not null, all nodes not included into the map will be ignored @param thefileinfo [in] map with file metadata to put into gltf header section @param theprogress [in] optional progress indicator returns false on file writing failure.

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
		%feature("autodoc", "Write gltf file and associated binary file. triangulation data should be precomputed within shapes! @param thedocument [in] input document @param thefileinfo [in] map with file metadata to put into gltf header section @param theprogress [in] optional progress indicator returns false on file writing failure.

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

		/****************** SetCompressionParameters ******************/
		/**** md5 signature: f822f9c1b83a8bd720a91827f059b8c1 ****/
		%feature("compactdefaultargs") SetCompressionParameters;
		%feature("autodoc", "Set draco parameters.

Parameters
----------
theDracoParameters: RWGltf_DracoParameters

Returns
-------
None
") SetCompressionParameters;
		void SetCompressionParameters(const RWGltf_DracoParameters & theDracoParameters);

		/****************** SetCoordinateSystemConverter ******************/
		/**** md5 signature: 8488d2b612c66076826cc33d2ac72536 ****/
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "Set transformation from occt to gltf coordinate system.

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

		/****************** SetForcedUVExport ******************/
		/**** md5 signature: f1b443576e23f97537145ae3cb746348 ****/
		%feature("compactdefaultargs") SetForcedUVExport;
		%feature("autodoc", "Set flag to export uv coordinates even if there are no mapped texture; false by default.

Parameters
----------
theToForce: bool

Returns
-------
None
") SetForcedUVExport;
		void SetForcedUVExport(bool theToForce);

		/****************** SetMergeFaces ******************/
		/**** md5 signature: ceae01520c794775cb258dde9c353037 ****/
		%feature("compactdefaultargs") SetMergeFaces;
		%feature("autodoc", "Set flag to merge faces within a single part. may reduce json size thanks to smaller number of primitive arrays.

Parameters
----------
theToMerge: bool

Returns
-------
None
") SetMergeFaces;
		void SetMergeFaces(bool theToMerge);

		/****************** SetMeshNameFormat ******************/
		/**** md5 signature: 15211207f69e0393dff98ff72d228452 ****/
		%feature("compactdefaultargs") SetMeshNameFormat;
		%feature("autodoc", "Set name format for exporting meshes.

Parameters
----------
theFormat: RWMesh_NameFormat

Returns
-------
None
") SetMeshNameFormat;
		void SetMeshNameFormat(RWMesh_NameFormat theFormat);

		/****************** SetNodeNameFormat ******************/
		/**** md5 signature: ab08236a14a52776b2440a4a780bd571 ****/
		%feature("compactdefaultargs") SetNodeNameFormat;
		%feature("autodoc", "Set name format for exporting nodes.

Parameters
----------
theFormat: RWMesh_NameFormat

Returns
-------
None
") SetNodeNameFormat;
		void SetNodeNameFormat(RWMesh_NameFormat theFormat);

		/****************** SetParallel ******************/
		/**** md5 signature: 298b1fbcc88b83d7071890cceab0869e ****/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "Setup multithreaded execution.

Parameters
----------
theToParallel: bool

Returns
-------
None
") SetParallel;
		void SetParallel(bool theToParallel);

		/****************** SetSplitIndices16 ******************/
		/**** md5 signature: 1288dab228d4bf876dcdee8ef6eed613 ****/
		%feature("compactdefaultargs") SetSplitIndices16;
		%feature("autodoc", "Set flag to prefer keeping 16-bit indexes while merging face. has effect only with tomergefaces() option turned on. may reduce binary data size thanks to smaller triangle indexes.

Parameters
----------
theToSplit: bool

Returns
-------
None
") SetSplitIndices16;
		void SetSplitIndices16(bool theToSplit);

		/****************** SetToEmbedTexturesInGlb ******************/
		/**** md5 signature: 3ebdf9ec402608f87c7a254baf5a2ed3 ****/
		%feature("compactdefaultargs") SetToEmbedTexturesInGlb;
		%feature("autodoc", "Set flag to write image textures into glb file (binary gltf export).

Parameters
----------
theToEmbedTexturesInGlb: bool

Returns
-------
None
") SetToEmbedTexturesInGlb;
		void SetToEmbedTexturesInGlb(Standard_Boolean theToEmbedTexturesInGlb);

		/****************** SetTransformationFormat ******************/
		/**** md5 signature: 9c5e4763a1df6fe364556ff7a71dcfa0 ****/
		%feature("compactdefaultargs") SetTransformationFormat;
		%feature("autodoc", "Set preferred transformation format for writing into gltf file.

Parameters
----------
theFormat: RWGltf_WriterTrsfFormat

Returns
-------
None
") SetTransformationFormat;
		void SetTransformationFormat(RWGltf_WriterTrsfFormat theFormat);

		/****************** ToEmbedTexturesInGlb ******************/
		/**** md5 signature: 929a783c967f4321720edabef49cbd9e ****/
		%feature("compactdefaultargs") ToEmbedTexturesInGlb;
		%feature("autodoc", "Return flag to write image textures into glb file (binary gltf export); true by default. when set to false, texture images will be written as separate files. has no effect on writing into non-binary format.

Returns
-------
bool
") ToEmbedTexturesInGlb;
		Standard_Boolean ToEmbedTexturesInGlb();

		/****************** ToMergeFaces ******************/
		/**** md5 signature: 0d4ced3de8f6fb910d4ed5ea927a1a6a ****/
		%feature("compactdefaultargs") ToMergeFaces;
		%feature("autodoc", "Return flag to merge faces within a single part; false by default.

Returns
-------
bool
") ToMergeFaces;
		bool ToMergeFaces();

		/****************** ToParallel ******************/
		/**** md5 signature: bf4527df56769064945cdf0919b0491e ****/
		%feature("compactdefaultargs") ToParallel;
		%feature("autodoc", "Return true if multithreaded optimizations are allowed; false by default.

Returns
-------
bool
") ToParallel;
		bool ToParallel();

		/****************** ToSplitIndices16 ******************/
		/**** md5 signature: fcc04d89915d622c0004d458ccc2b398 ****/
		%feature("compactdefaultargs") ToSplitIndices16;
		%feature("autodoc", "Return flag to prefer keeping 16-bit indexes while merging face; false by default.

Returns
-------
bool
") ToSplitIndices16;
		bool ToSplitIndices16();

		/****************** TransformationFormat ******************/
		/**** md5 signature: bbeefb2300588d1a6143500ba5adaede ****/
		%feature("compactdefaultargs") TransformationFormat;
		%feature("autodoc", "Return preferred transformation format for writing into gltf file; rwgltf_writertrsfformat_compact by default.

Returns
-------
RWGltf_WriterTrsfFormat
") TransformationFormat;
		RWGltf_WriterTrsfFormat TransformationFormat();

};


%make_alias(RWGltf_CafWriter)

%extend RWGltf_CafWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWGltf_ConfigurationNode *
*********************************/
class RWGltf_ConfigurationNode : public DE_ConfigurationNode {
	public:
		class RWGltf_InternalSection {};
		RWGltf_InternalSection InternalParameters;
		/****************** RWGltf_ConfigurationNode ******************/
		/**** md5 signature: 14e887512a71c60f441f6ed16bddc421 ****/
		%feature("compactdefaultargs") RWGltf_ConfigurationNode;
		%feature("autodoc", "Initializes all field by default.

Returns
-------
None
") RWGltf_ConfigurationNode;
		 RWGltf_ConfigurationNode();

		/****************** RWGltf_ConfigurationNode ******************/
		/**** md5 signature: 4ddc7b467952767fb2dd4acd9f0e95e2 ****/
		%feature("compactdefaultargs") RWGltf_ConfigurationNode;
		%feature("autodoc", "Copies values of all fields @param[in] thenode object to copy.

Parameters
----------
theNode: RWGltf_ConfigurationNode

Returns
-------
None
") RWGltf_ConfigurationNode;
		 RWGltf_ConfigurationNode(const opencascade::handle<RWGltf_ConfigurationNode> & theNode);

		/****************** BuildProvider ******************/
		/**** md5 signature: 732af66bf7bddbff6fa20c9629ec35a7 ****/
		%feature("compactdefaultargs") BuildProvider;
		%feature("autodoc", "Creates new provider for the own format returns new created provider.

Returns
-------
opencascade::handle<DE_Provider>
") BuildProvider;
		virtual opencascade::handle<DE_Provider> BuildProvider();

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


%extend RWGltf_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class RWGltf_DracoParameters *
*******************************/
class RWGltf_DracoParameters {
	public:
		bool DracoCompression;
		int CompressionLevel;
		int QuantizePositionBits;
		int QuantizeNormalBits;
		int QuantizeTexcoordBits;
		int QuantizeColorBits;
		int QuantizeGenericBits;
		bool UnifiedQuantization;
		/****************** RWGltf_DracoParameters ******************/
		/**** md5 signature: e2a35d429a406f18e3426e240f63bc03 ****/
		%feature("compactdefaultargs") RWGltf_DracoParameters;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		int Id;
		int64_t ByteOffset;
		int64_t Count;
		int32_t ByteStride;
		RWGltf_GltfAccessorLayout Type;
		RWGltf_GltfAccessorCompType ComponentType;
		Graphic3d_BndBox3d BndBox;
		bool IsCompressed;
		/****************** RWGltf_GltfAccessor ******************/
		/**** md5 signature: 8b64f4715da5fd8f33ed5f4530632dac ****/
		%feature("compactdefaultargs") RWGltf_GltfAccessor;
		%feature("autodoc", "//!< flag indicating khr_draco_mesh_compression empty constructor.

Returns
-------
None
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
		int Id;
		int64_t ByteOffset;
		int64_t ByteLength;
		int32_t ByteStride;
		RWGltf_GltfBufferViewTarget Target;
		/****************** RWGltf_GltfBufferView ******************/
		/**** md5 signature: 171ffbab0b9bba1a9b041af6abac9026 ****/
		%feature("compactdefaultargs") RWGltf_GltfBufferView;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		RWGltf_GltfAccessor NodePos;
		RWGltf_GltfAccessor NodeNorm;
		RWGltf_GltfAccessor NodeUV;
		RWGltf_GltfAccessor Indices;
		TopoDS_Shape Shape;
		XCAFPrs_Style Style;
		int NbIndexedNodes;
		/****************** RWGltf_GltfFace ******************/
		/**** md5 signature: 0c019620b8976a45d6a9f402e00cd960 ****/
		%feature("compactdefaultargs") RWGltf_GltfFace;
		%feature("autodoc", "//!< transient variable for merging several faces into one while writing indices.

Returns
-------
None
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
		/****************** RWGltf_GltfLatePrimitiveArray ******************/
		/**** md5 signature: 7107dfd4e0698cb28650e1340d202186 ****/
		%feature("compactdefaultargs") RWGltf_GltfLatePrimitiveArray;
		%feature("autodoc", "Constructor.

Parameters
----------
theId: str
theName: str

Returns
-------
None
") RWGltf_GltfLatePrimitiveArray;
		 RWGltf_GltfLatePrimitiveArray(TCollection_AsciiString theId, TCollection_AsciiString theName);

		/****************** AddPrimArrayData ******************/
		/**** md5 signature: 6b00508c9622c6f7b8308c0e8ee7efd5 ****/
		%feature("compactdefaultargs") AddPrimArrayData;
		%feature("autodoc", "Add primitive array data element.

Parameters
----------
theType: RWGltf_GltfArrayType

Returns
-------
RWGltf_GltfPrimArrayData
") AddPrimArrayData;
		RWGltf_GltfPrimArrayData & AddPrimArrayData(RWGltf_GltfArrayType theType);

		/****************** BaseColor ******************/
		/**** md5 signature: f8585c32bce71447f36243b6bcd6baa9 ****/
		%feature("compactdefaultargs") BaseColor;
		%feature("autodoc", "Return base color.

Returns
-------
Quantity_ColorRGBA
") BaseColor;
		Quantity_ColorRGBA BaseColor();

		/****************** Data ******************/
		/**** md5 signature: 671d99c5b4ce7f7e5b939e40427e52b5 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return primitive array data elements.

Returns
-------
NCollection_Sequence<RWGltf_GltfPrimArrayData>
") Data;
		const NCollection_Sequence<RWGltf_GltfPrimArrayData> & Data();

		/****************** HasDeferredData ******************/
		/**** md5 signature: 2e68cb99f0a96431d1e289930b5a3662 ****/
		%feature("compactdefaultargs") HasDeferredData;
		%feature("autodoc", "Return true if there is deferred storage and some triangulation data that can be loaded using loaddeferreddata().

Returns
-------
bool
") HasDeferredData;
		virtual Standard_Boolean HasDeferredData();

		/****************** HasStyle ******************/
		/**** md5 signature: 0269e4556c7e0b5145883ad478e02061 ****/
		%feature("compactdefaultargs") HasStyle;
		%feature("autodoc", "Return true if primitive array has assigned material.

Returns
-------
bool
") HasStyle;
		bool HasStyle();

		/****************** Id ******************/
		/**** md5 signature: 932272b78b9184cc2485436a72cc2df4 ****/
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "Entity id.

Returns
-------
TCollection_AsciiString
") Id;
		const TCollection_AsciiString & Id();

		/****************** LoadStreamData ******************/
		/**** md5 signature: c873deb6e325607ba01a0a4af1d6d353 ****/
		%feature("compactdefaultargs") LoadStreamData;
		%feature("autodoc", "Load primitive array saved as stream buffer to new triangulation object.

Returns
-------
opencascade::handle<Poly_Triangulation>
") LoadStreamData;
		opencascade::handle<Poly_Triangulation> LoadStreamData();

		/****************** MaterialCommon ******************/
		/**** md5 signature: 85b380ad63e6ef92cb904824c21269fb ****/
		%feature("compactdefaultargs") MaterialCommon;
		%feature("autodoc", "Return common (obsolete) material definition.

Returns
-------
opencascade::handle<RWGltf_MaterialCommon>
") MaterialCommon;
		const opencascade::handle<RWGltf_MaterialCommon> & MaterialCommon();

		/****************** MaterialPbr ******************/
		/**** md5 signature: 0e13967206ad8a2eb39ea88324416ad3 ****/
		%feature("compactdefaultargs") MaterialPbr;
		%feature("autodoc", "Return pbr material definition.

Returns
-------
opencascade::handle<RWGltf_MaterialMetallicRoughness>
") MaterialPbr;
		const opencascade::handle<RWGltf_MaterialMetallicRoughness> & MaterialPbr();

		/****************** Name ******************/
		/**** md5 signature: efed61b92683387cd746fb27e0376505 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Entity name.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** PrimitiveMode ******************/
		/**** md5 signature: 1388d87831822c6f2201fbc4bc4ec619 ****/
		%feature("compactdefaultargs") PrimitiveMode;
		%feature("autodoc", "Return type of primitive array.

Returns
-------
RWGltf_GltfPrimitiveMode
") PrimitiveMode;
		RWGltf_GltfPrimitiveMode PrimitiveMode();

		/****************** SetMaterialCommon ******************/
		/**** md5 signature: eb324aa6f8f3dcad75f93a5311e95086 ****/
		%feature("compactdefaultargs") SetMaterialCommon;
		%feature("autodoc", "Set common (obsolete) material definition.

Parameters
----------
theMat: RWGltf_MaterialCommon

Returns
-------
None
") SetMaterialCommon;
		void SetMaterialCommon(const opencascade::handle<RWGltf_MaterialCommon> & theMat);

		/****************** SetMaterialPbr ******************/
		/**** md5 signature: 3e0bf5941a300faa04272f3890b437a5 ****/
		%feature("compactdefaultargs") SetMaterialPbr;
		%feature("autodoc", "Set pbr material definition.

Parameters
----------
theMat: RWGltf_MaterialMetallicRoughness

Returns
-------
None
") SetMaterialPbr;
		void SetMaterialPbr(const opencascade::handle<RWGltf_MaterialMetallicRoughness> & theMat);

		/****************** SetName ******************/
		/**** md5 signature: 273df384551aa519beda71c20cd913ae ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Assign entity name.

Parameters
----------
theName: str

Returns
-------
None
") SetName;
		void SetName(TCollection_AsciiString theName);

		/****************** SetPrimitiveMode ******************/
		/**** md5 signature: 9f225fc36e5fa984961bb4bfa76b0b80 ****/
		%feature("compactdefaultargs") SetPrimitiveMode;
		%feature("autodoc", "Set type of primitive array.

Parameters
----------
theMode: RWGltf_GltfPrimitiveMode

Returns
-------
None
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
		/****************** RWGltf_GltfMaterialMap ******************/
		/**** md5 signature: 72d42c8ae7b75c180626db034ae283e4 ****/
		%feature("compactdefaultargs") RWGltf_GltfMaterialMap;
		%feature("autodoc", "Main constructor.

Parameters
----------
theFile: str
theDefSamplerId: int

Returns
-------
None
") RWGltf_GltfMaterialMap;
		 RWGltf_GltfMaterialMap(TCollection_AsciiString theFile, const Standard_Integer theDefSamplerId);

		/****************** AddGlbImages ******************/
		/**** md5 signature: 8f702f135cd650ff90bbfd94f352532d ****/
		%feature("compactdefaultargs") AddGlbImages;
		%feature("autodoc", "Add material images into glb stream. @param thebinfile [in] [out] output file stream @param thestyle [in] material images to add.

Parameters
----------
theBinFile: std::ostream
theStyle: XCAFPrs_Style

Returns
-------
None
") AddGlbImages;
		void AddGlbImages(std::ostream & theBinFile, const XCAFPrs_Style & theStyle);

		/****************** AddImages ******************/
		/**** md5 signature: 3aa5121db2a6a900aa23f78102a3d9de ****/
		%feature("compactdefaultargs") AddImages;
		%feature("autodoc", "Add material images in case of non-glb file (an alternative to addimagestoglb() + flushbufferviews() + flushimagesglb()).

Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theStyle: XCAFPrs_Style

Returns
-------
theIsStarted: bool
") AddImages;
		void AddImages(RWGltf_GltfOStreamWriter * theWriter, const XCAFPrs_Style & theStyle, Standard_Boolean &OutValue);

		/****************** AddMaterial ******************/
		/**** md5 signature: f00566a55f97100149cb0a32887c56e2 ****/
		%feature("compactdefaultargs") AddMaterial;
		%feature("autodoc", "Add material.

Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theStyle: XCAFPrs_Style

Returns
-------
theIsStarted: bool
") AddMaterial;
		void AddMaterial(RWGltf_GltfOStreamWriter * theWriter, const XCAFPrs_Style & theStyle, Standard_Boolean &OutValue);

		/****************** AddTextures ******************/
		/**** md5 signature: e7f7e21ca77d944a33d6f85cccc4fadf ****/
		%feature("compactdefaultargs") AddTextures;
		%feature("autodoc", "Add material textures.

Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theStyle: XCAFPrs_Style

Returns
-------
theIsStarted: bool
") AddTextures;
		void AddTextures(RWGltf_GltfOStreamWriter * theWriter, const XCAFPrs_Style & theStyle, Standard_Boolean &OutValue);

		/****************** FlushGlbBufferViews ******************/
		/**** md5 signature: 6637f05a69ee314b2da8453cf1e79868 ****/
		%feature("compactdefaultargs") FlushGlbBufferViews;
		%feature("autodoc", "Add bufferview's into rwgltf_gltfrootelement_bufferviews section with images collected by addimagestoglb().

Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *
theBinDataBufferId: int

Returns
-------
theBuffViewId: int
") FlushGlbBufferViews;
		void FlushGlbBufferViews(RWGltf_GltfOStreamWriter * theWriter, const Standard_Integer theBinDataBufferId, Standard_Integer &OutValue);

		/****************** FlushGlbImages ******************/
		/**** md5 signature: 0b5d6da57d2a5e07a4250fe93451c613 ****/
		%feature("compactdefaultargs") FlushGlbImages;
		%feature("autodoc", "Write rwgltf_gltfrootelement_images section with images collected by addimagestoglb().

Parameters
----------
theWriter: RWGltf_GltfOStreamWriter *

Returns
-------
None
") FlushGlbImages;
		void FlushGlbImages(RWGltf_GltfOStreamWriter * theWriter);

		/****************** NbImages ******************/
		/**** md5 signature: 287f9b24a015fc67da1fac6d39501fc7 ****/
		%feature("compactdefaultargs") NbImages;
		%feature("autodoc", "Return extent of images map.

Returns
-------
int
") NbImages;
		Standard_Integer NbImages();

		/****************** NbTextures ******************/
		/**** md5 signature: efcc0445631a819a279f5a21b5f29bcb ****/
		%feature("compactdefaultargs") NbTextures;
		%feature("autodoc", "Return extent of textures map.

Returns
-------
int
") NbTextures;
		Standard_Integer NbTextures();

		/****************** baseColorTexture ******************/
		/**** md5 signature: dfff25579f1db3e6f1635a79761ecf6f ****/
		%feature("compactdefaultargs") baseColorTexture;
		%feature("autodoc", "Return base color texture.

Parameters
----------
theMat: XCAFDoc_VisMaterial

Returns
-------
opencascade::handle<Image_Texture>
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
		/****************** RWGltf_GltfOStreamWriter ******************/
		/**** md5 signature: c76faa3a857a139fb40148b7372451f3 ****/
		%feature("compactdefaultargs") RWGltf_GltfOStreamWriter;
		%feature("autodoc", "Main constructor.

Parameters
----------
theOStream: rapidjson::OStreamWrapper

Returns
-------
None
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
		opencascade::handle<NCollection_Buffer> StreamData;
		TCollection_AsciiString StreamUri;
		int64_t StreamOffset;
		int64_t StreamLength;
		RWGltf_GltfAccessor Accessor;
		RWGltf_GltfArrayType Type;
		/****************** RWGltf_GltfPrimArrayData ******************/
		/**** md5 signature: dc51df7b6af2448771c820ecc7c99284 ****/
		%feature("compactdefaultargs") RWGltf_GltfPrimArrayData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWGltf_GltfPrimArrayData;
		 RWGltf_GltfPrimArrayData();

		/****************** RWGltf_GltfPrimArrayData ******************/
		/**** md5 signature: 62850d19979b91363aacdc838848b7b6 ****/
		%feature("compactdefaultargs") RWGltf_GltfPrimArrayData;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: RWGltf_GltfArrayType

Returns
-------
None
") RWGltf_GltfPrimArrayData;
		 RWGltf_GltfPrimArrayData(RWGltf_GltfArrayType theType);

};


%extend RWGltf_GltfPrimArrayData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class RWGltf_MaterialCommon *
******************************/
class RWGltf_MaterialCommon : public Standard_Transient {
	public:
		opencascade::handle<Image_Texture> AmbientTexture;
		opencascade::handle<Image_Texture> DiffuseTexture;
		opencascade::handle<Image_Texture> SpecularTexture;
		TCollection_AsciiString Id;
		TCollection_AsciiString Name;
		Quantity_Color AmbientColor;
		Quantity_Color DiffuseColor;
		Quantity_Color SpecularColor;
		Quantity_Color EmissiveColor;
		Standard_ShortReal Shininess;
		Standard_ShortReal Transparency;
		/****************** RWGltf_MaterialCommon ******************/
		/**** md5 signature: f0af89af2fc01791794c2523c116ec25 ****/
		%feature("compactdefaultargs") RWGltf_MaterialCommon;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		opencascade::handle<Image_Texture> BaseColorTexture;
		opencascade::handle<Image_Texture> MetallicRoughnessTexture;
		opencascade::handle<Image_Texture> EmissiveTexture;
		opencascade::handle<Image_Texture> OcclusionTexture;
		opencascade::handle<Image_Texture> NormalTexture;
		TCollection_AsciiString Id;
		TCollection_AsciiString Name;
		Quantity_ColorRGBA BaseColor;
		Graphic3d_Vec3 EmissiveFactor;
		Standard_ShortReal Metallic;
		Standard_ShortReal Roughness;
		Standard_ShortReal AlphaCutOff;
		RWGltf_GltfAlphaMode AlphaMode;
		bool IsDoubleSided;
		/****************** RWGltf_MaterialMetallicRoughness ******************/
		/**** md5 signature: 147599a43d3c4e3ea77a9db46b5f3632 ****/
		%feature("compactdefaultargs") RWGltf_MaterialMetallicRoughness;
		%feature("autodoc", "//!< specifies whether the material is double sided; false by default.

Returns
-------
None
") RWGltf_MaterialMetallicRoughness;
		 RWGltf_MaterialMetallicRoughness();

};


%make_alias(RWGltf_MaterialMetallicRoughness)

%extend RWGltf_MaterialMetallicRoughness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class RWGltf_Provider *
************************/
class RWGltf_Provider : public DE_Provider {
	public:
		/****************** RWGltf_Provider ******************/
		/**** md5 signature: d33a24325ebd5722c4be1e067b191549 ****/
		%feature("compactdefaultargs") RWGltf_Provider;
		%feature("autodoc", "Default constructor configure translation process with global configuration.

Returns
-------
None
") RWGltf_Provider;
		 RWGltf_Provider();

		/****************** RWGltf_Provider ******************/
		/**** md5 signature: 7b018d854a0f1e613fd1cd054123f0a3 ****/
		%feature("compactdefaultargs") RWGltf_Provider;
		%feature("autodoc", "Configure translation process @param[in] thenode object to copy.

Parameters
----------
theNode: DE_ConfigurationNode

Returns
-------
None
") RWGltf_Provider;
		 RWGltf_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

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
		/**** md5 signature: 5da3d196d6292385962a1e60f3dec8a0 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param[in] thews current work session @param theprogress[in] progress indicator returns true if read operation has ended correctly.

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
") Read;
		virtual bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: ec9914af037216c0502c72d0c8784072 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param theprogress[in] progress indicator returns true if read operation has ended correctly.

Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Read;
		virtual bool Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: f5c487132f5fe207a43ed7a7e7ce6afc ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param[in] thews current work session @param theprogress[in] progress indicator returns true if read operation has ended correctly.

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
") Read;
		virtual bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** Read ******************/
		/**** md5 signature: 25ccf35b1d33bce5d3311fc0dff44615 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param theprogress[in] progress indicator returns true if read operation has ended correctly.

Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") Read;
		virtual bool Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

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


%extend RWGltf_Provider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWGltf_TriangulationReader *
***********************************/
class RWGltf_TriangulationReader : public RWMesh_TriangulationReader {
	public:
		/****************** RWGltf_TriangulationReader ******************/
		/**** md5 signature: 13fc434c88256ab85cd744519fc5e86f ****/
		%feature("compactdefaultargs") RWGltf_TriangulationReader;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWGltf_TriangulationReader;
		 RWGltf_TriangulationReader();

		/****************** LoadStreamData ******************/
		/**** md5 signature: 46d61db1bac4243ed0d2e1650f5f0bfc ****/
		%feature("compactdefaultargs") LoadStreamData;
		%feature("autodoc", "Loads only primitive arrays saved as stream buffer (it is primarily gltf data encoded in base64 saved to temporary buffer during gltf file reading).

Parameters
----------
theSourceMesh: RWMesh_TriangulationSource
theDestMesh: Poly_Triangulation

Returns
-------
bool
") LoadStreamData;
		bool LoadStreamData(const opencascade::handle<RWMesh_TriangulationSource> & theSourceMesh, const opencascade::handle<Poly_Triangulation> & theDestMesh);

};


%extend RWGltf_TriangulationReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWGltf_GltfSceneNodeMap *
********************************/
class RWGltf_GltfSceneNodeMap : public NCollection_IndexedMap<XCAFPrs_DocumentNode, XCAFPrs_DocumentNode > {
	public:
		/****************** RWGltf_GltfSceneNodeMap ******************/
		/**** md5 signature: 7eb6a53ba949dbdb457796ba63fb4a03 ****/
		%feature("compactdefaultargs") RWGltf_GltfSceneNodeMap;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") RWGltf_GltfSceneNodeMap;
		 RWGltf_GltfSceneNodeMap();

		/****************** FindIndex ******************/
		/**** md5 signature: 47457616668af339aa3d60c8b18b08d5 ****/
		%feature("compactdefaultargs") FindIndex;
		%feature("autodoc", "Find index from document node string identifier.

Parameters
----------
theNodeId: str

Returns
-------
int
") FindIndex;
		Standard_Integer FindIndex(TCollection_AsciiString theNodeId);

};


%extend RWGltf_GltfSceneNodeMap {
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
