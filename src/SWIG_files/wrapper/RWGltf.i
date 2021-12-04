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
%define RWGLTFDOCSTRING
"RWGltf module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwgltf.html"
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
#include<Poly_module.hxx>
#include<Quantity_module.hxx>
#include<Bnd_module.hxx>
#include<XCAFDoc_module.hxx>
#include<Image_module.hxx>
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
%import Poly.i
%import Quantity.i
%import Bnd.i
%import XCAFDoc.i
%import Image.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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

enum RWGltf_GltfBufferViewTarget {
	RWGltf_GltfBufferViewTarget_UNKNOWN = 0,
	RWGltf_GltfBufferViewTarget_ARRAY_BUFFER = 34962,
	RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER = 34963,
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

enum RWGltf_GltfAccessorCompType {
	RWGltf_GltfAccessorCompType_UNKNOWN = 0,
	RWGltf_GltfAccessorCompType_Int8 = 5120,
	RWGltf_GltfAccessorCompType_UInt8 = 5121,
	RWGltf_GltfAccessorCompType_Int16 = 5122,
	RWGltf_GltfAccessorCompType_UInt16 = 5123,
	RWGltf_GltfAccessorCompType_UInt32 = 5125,
	RWGltf_GltfAccessorCompType_Float32 = 5126,
};

enum RWGltf_GltfAlphaMode {
	RWGltf_GltfAlphaMode_Opaque = 0,
	RWGltf_GltfAlphaMode_Mask = 1,
	RWGltf_GltfAlphaMode_Blend = 2,
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

/* python proy classes for enums */
%pythoncode {

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

class RWGltf_GltfBufferViewTarget(IntEnum):
	RWGltf_GltfBufferViewTarget_UNKNOWN = 0
	RWGltf_GltfBufferViewTarget_ARRAY_BUFFER = 34962
	RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER = 34963
RWGltf_GltfBufferViewTarget_UNKNOWN = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_UNKNOWN
RWGltf_GltfBufferViewTarget_ARRAY_BUFFER = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_ARRAY_BUFFER
RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER = RWGltf_GltfBufferViewTarget.RWGltf_GltfBufferViewTarget_ELEMENT_ARRAY_BUFFER

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

class RWGltf_GltfAlphaMode(IntEnum):
	RWGltf_GltfAlphaMode_Opaque = 0
	RWGltf_GltfAlphaMode_Mask = 1
	RWGltf_GltfAlphaMode_Blend = 2
RWGltf_GltfAlphaMode_Opaque = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Opaque
RWGltf_GltfAlphaMode_Mask = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Mask
RWGltf_GltfAlphaMode_Blend = RWGltf_GltfAlphaMode.RWGltf_GltfAlphaMode_Blend

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
%wrap_handle(RWGltf_GltfLatePrimitiveArray)
%wrap_handle(RWGltf_MaterialCommon)
%wrap_handle(RWGltf_MaterialMetallicRoughness)
%wrap_handle(RWGltf_PrimitiveArrayReader)
%wrap_handle(RWGltf_TriangulationReader)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
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

		/****************** ToParallel ******************/
		/**** md5 signature: bf4527df56769064945cdf0919b0491e ****/
		%feature("compactdefaultargs") ToParallel;
		%feature("autodoc", "Return true if multithreaded optimizations are allowed; false by default.

Returns
-------
bool
") ToParallel;
		bool ToParallel();

		/****************** ToSkipEmptyNodes ******************/
		/**** md5 signature: aa5d3722c5c1c7fa9b1374eec1aebf9e ****/
		%feature("compactdefaultargs") ToSkipEmptyNodes;
		%feature("autodoc", "Return true if nodes without geometry should be ignored, true by default.

Returns
-------
bool
") ToSkipEmptyNodes;
		bool ToSkipEmptyNodes();

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
		/****************** RWGltf_CafWriter ******************/
		/**** md5 signature: ff99e81d575a475273adc594a6a9069b ****/
		%feature("compactdefaultargs") RWGltf_CafWriter;
		%feature("autodoc", "Main constructor. @param thefile [in] path to output gltf file @param theisbinary [in] flag to write into binary gltf format (.glb).

Parameters
----------
theFile: TCollection_AsciiString
theIsBinary: bool

Returns
-------
None
") RWGltf_CafWriter;
		 RWGltf_CafWriter(const TCollection_AsciiString & theFile, Standard_Boolean theIsBinary);

		/****************** ChangeCoordinateSystemConverter ******************/
		/**** md5 signature: fd10c9e3345c0c11d37ccaa13f77ec3f ****/
		%feature("compactdefaultargs") ChangeCoordinateSystemConverter;
		%feature("autodoc", "Return transformation from occt to gltf coordinate system.

Returns
-------
RWMesh_CoordinateSystemConverter
") ChangeCoordinateSystemConverter;
		RWMesh_CoordinateSystemConverter & ChangeCoordinateSystemConverter();

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
		/****************** RWGltf_GltfAccessor ******************/
		/**** md5 signature: 1ac0c993d4339614409d9c5e0ac9bdc9 ****/
		%feature("compactdefaultargs") RWGltf_GltfAccessor;
		%feature("autodoc", "Empty constructor.

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
		/**** md5 signature: 7f05f05ddf9d2f909355f94a9fbcef5d ****/
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
class RWGltf_GltfFace {
	public:
		RWGltf_GltfAccessor NodePos;
		RWGltf_GltfAccessor NodeNorm;
		RWGltf_GltfAccessor NodeUV;
		RWGltf_GltfAccessor Indices;
};


%extend RWGltf_GltfFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class RWGltf_GltfLatePrimitiveArray *
**************************************/
class RWGltf_GltfLatePrimitiveArray : public Poly_Triangulation {
	public:
		/****************** RWGltf_GltfLatePrimitiveArray ******************/
		/**** md5 signature: 7107dfd4e0698cb28650e1340d202186 ****/
		%feature("compactdefaultargs") RWGltf_GltfLatePrimitiveArray;
		%feature("autodoc", "Constructor.

Parameters
----------
theId: TCollection_AsciiString
theName: TCollection_AsciiString

Returns
-------
None
") RWGltf_GltfLatePrimitiveArray;
		 RWGltf_GltfLatePrimitiveArray(const TCollection_AsciiString & theId, const TCollection_AsciiString & theName);

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

		/****************** BoundingBox ******************/
		/**** md5 signature: 1be44ba2c9a538ffb30ddb049793a947 ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return bounding box defined within gltf file, or void if not specified.

Returns
-------
Bnd_Box
") BoundingBox;
		const Bnd_Box & BoundingBox();

		/****************** Data ******************/
		/**** md5 signature: 671d99c5b4ce7f7e5b939e40427e52b5 ****/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Return primitive array data elements.

Returns
-------
NCollection_Sequence<RWGltf_GltfPrimArrayData>
") Data;
		const NCollection_Sequence<RWGltf_GltfPrimArrayData> & Data();

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

		/****************** SetBoundingBox ******************/
		/**** md5 signature: 5279a00cfc27cd83f564390e960b6aa2 ****/
		%feature("compactdefaultargs") SetBoundingBox;
		%feature("autodoc", "This method sets input bounding box and assigns a fake data to underlying poly_triangulation as min/max corners of bounding box, so that standard tools like brepbndlib::add() can be used transparently for computing bounding box of this face.

Parameters
----------
theBox: Bnd_Box

Returns
-------
None
") SetBoundingBox;
		void SetBoundingBox(const Bnd_Box & theBox);

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
theName: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & theName);

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


%make_alias(RWGltf_GltfLatePrimitiveArray)

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
theFile: TCollection_AsciiString
theDefSamplerId: int

Returns
-------
None
") RWGltf_GltfMaterialMap;
		 RWGltf_GltfMaterialMap(const TCollection_AsciiString & theFile, const Standard_Integer theDefSamplerId);

		/****************** AddImages ******************/
		/**** md5 signature: 3aa5121db2a6a900aa23f78102a3d9de ****/
		%feature("compactdefaultargs") AddImages;
		%feature("autodoc", "Add material images.

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
		/**** md5 signature: 39e45338506e2d1a7664840241a7b472 ****/
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
		opencascade::handle<NCollection_Buffer > StreamData;
		TCollection_AsciiString StreamUri;
		int64_t StreamOffset;
		RWGltf_GltfAccessor Accessor;
		RWGltf_GltfArrayType Type;
		/****************** RWGltf_GltfPrimArrayData ******************/
		/**** md5 signature: 082773010cd7514b9dd09e3d44d4bec5 ****/
		%feature("compactdefaultargs") RWGltf_GltfPrimArrayData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RWGltf_GltfPrimArrayData;
		 RWGltf_GltfPrimArrayData();

		/****************** RWGltf_GltfPrimArrayData ******************/
		/**** md5 signature: 8b5a6513192f0ecb3cdb8caf0433eb34 ****/
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

/********************************
* class RWGltf_GltfSceneNodeMap *
********************************/
class RWGltf_GltfSceneNodeMap : public NCollection_IndexedMap<XCAFPrs_DocumentNode,XCAFPrs_DocumentNode> {
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
theNodeId: TCollection_AsciiString

Returns
-------
int
") FindIndex;
		Standard_Integer FindIndex(const TCollection_AsciiString & theNodeId);

};


%extend RWGltf_GltfSceneNodeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class RWGltf_GltfSharedIStream *
*********************************/
/******************************
* class RWGltf_MaterialCommon *
******************************/
class RWGltf_MaterialCommon : public Standard_Transient {
	public:
		opencascade::handle<Image_Texture > AmbientTexture;
		opencascade::handle<Image_Texture > DiffuseTexture;
		opencascade::handle<Image_Texture > SpecularTexture;
		TCollection_AsciiString Id;
		TCollection_AsciiString Name;
		Quantity_Color AmbientColor;
		Quantity_Color DiffuseColor;
		Quantity_Color SpecularColor;
		Quantity_Color EmissiveColor;
		Standard_ShortReal Shininess;
		Standard_ShortReal Transparency;
		/****************** RWGltf_MaterialCommon ******************/
		/**** md5 signature: 5f7db091e0ba1d4aaa046ad813cbb86f ****/
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
		opencascade::handle<Image_Texture > BaseColorTexture;
		opencascade::handle<Image_Texture > MetallicRoughnessTexture;
		opencascade::handle<Image_Texture > EmissiveTexture;
		opencascade::handle<Image_Texture > OcclusionTexture;
		opencascade::handle<Image_Texture > NormalTexture;
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
		/**** md5 signature: 3e7e7f6dcac2ab520e773c1e52d06831 ****/
		%feature("compactdefaultargs") RWGltf_MaterialMetallicRoughness;
		%feature("autodoc", "No available documentation.

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

/************************************
* class RWGltf_PrimitiveArrayReader *
************************************/
%nodefaultctor RWGltf_PrimitiveArrayReader;
class RWGltf_PrimitiveArrayReader : public Standard_Transient {
	public:
		/****************** CoordinateSystemConverter ******************/
		/**** md5 signature: ab88d1bd4b71da58aa0d6253db43d797 ****/
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "Return transformation from gltf to occt coordinate system.

Returns
-------
RWMesh_CoordinateSystemConverter
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter();

		/****************** ErrorPrefix ******************/
		/**** md5 signature: db3c97facd2cae1d01159991bd8fb159 ****/
		%feature("compactdefaultargs") ErrorPrefix;
		%feature("autodoc", "Return prefix for reporting issues.

Returns
-------
TCollection_AsciiString
") ErrorPrefix;
		const TCollection_AsciiString & ErrorPrefix();

		/****************** Load ******************/
		/**** md5 signature: ad8d7c937618957c49132de899f328f1 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Load primitive array.

Parameters
----------
theMesh: RWGltf_GltfLatePrimitiveArray

Returns
-------
opencascade::handle<Poly_Triangulation>
") Load;
		opencascade::handle<Poly_Triangulation> Load(const opencascade::handle<RWGltf_GltfLatePrimitiveArray> & theMesh);

		/****************** SetCoordinateSystemConverter ******************/
		/**** md5 signature: 8488d2b612c66076826cc33d2ac72536 ****/
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "Set transformation from gltf to occt coordinate system.

Parameters
----------
theConverter: RWMesh_CoordinateSystemConverter

Returns
-------
None
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter(const RWMesh_CoordinateSystemConverter & theConverter);

		/****************** SetErrorPrefix ******************/
		/**** md5 signature: 0b5039bffc7759d627c4e61bca05d578 ****/
		%feature("compactdefaultargs") SetErrorPrefix;
		%feature("autodoc", "Set prefix for reporting issues.

Parameters
----------
theErrPrefix: TCollection_AsciiString

Returns
-------
None
") SetErrorPrefix;
		void SetErrorPrefix(const TCollection_AsciiString & theErrPrefix);

};


%make_alias(RWGltf_PrimitiveArrayReader)

%extend RWGltf_PrimitiveArrayReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class RWGltf_TriangulationReader *
***********************************/
class RWGltf_TriangulationReader : public RWGltf_PrimitiveArrayReader {
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

};


%make_alias(RWGltf_TriangulationReader)

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
