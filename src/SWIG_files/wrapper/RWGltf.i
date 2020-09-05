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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<RWGltf_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Poly_module.hxx>
#include<TCollection_module.hxx>
#include<Quantity_module.hxx>
#include<Bnd_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<Graphic3d_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<Aspect_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Poly.i
%import TCollection.i
%import Quantity.i
%import Bnd.i

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
};
/* end python proxy for enums */

/* handles */
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
