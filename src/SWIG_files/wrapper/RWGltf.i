/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define RWGLTFDOCSTRING
"RWGltf module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_RWGltf.html"
%enddef
%module (package="OCC.Core", docstring=RWGLTFDOCSTRING) RWGltf

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
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
%import Bnd.i
%import TCollection.i
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

/* handles */
%wrap_handle(RWGltf_GltfLatePrimitiveArray)
%wrap_handle(RWGltf_MaterialCommon)
%wrap_handle(RWGltf_MaterialMetallicRoughness)
%wrap_handle(RWGltf_PrimitiveArrayReader)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%nodefaultctor RWGltf_CafReader;
class RWGltf_CafReader : public RWMesh_CafReader {
	public:
		%feature("compactdefaultargs") SetMeshNameAsFallback;
		%feature("autodoc", "	* Set flag to use Mesh name in case if Node name is empty.

	:param theToFallback:
	:type theToFallback: bool
	:rtype: None
") SetMeshNameAsFallback;
		void SetMeshNameAsFallback (bool theToFallback);
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "	* Setup multithreaded execution.

	:param theToParallel:
	:type theToParallel: bool
	:rtype: None
") SetParallel;
		void SetParallel (bool theToParallel);
		%feature("compactdefaultargs") SetSkipEmptyNodes;
		%feature("autodoc", "	* Set flag to ignore nodes without Geometry.

	:param theToSkip:
	:type theToSkip: bool
	:rtype: None
") SetSkipEmptyNodes;
		void SetSkipEmptyNodes (bool theToSkip);
		%feature("compactdefaultargs") ToParallel;
		%feature("autodoc", "	* Return True if multithreaded optimizations are allowed; False by default.

	:rtype: bool
") ToParallel;
		bool ToParallel ();
		%feature("compactdefaultargs") ToSkipEmptyNodes;
		%feature("autodoc", "	* Return True if Nodes without Geometry should be ignored, True by default.

	:rtype: bool
") ToSkipEmptyNodes;
		bool ToSkipEmptyNodes ();
		%feature("compactdefaultargs") ToUseMeshNameAsFallback;
		%feature("autodoc", "	* Set flag to use Mesh name in case if Node name is empty, True by default.

	:rtype: bool
") ToUseMeshNameAsFallback;
		bool ToUseMeshNameAsFallback ();
};


%extend RWGltf_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWGltf_GltfAccessor;
class RWGltf_GltfAccessor {
	public:
		int Id;
		int64_t ByteOffset;
		int64_t Count;
		int32_t ByteStride;
		RWGltf_GltfAccessorLayout Type;
		RWGltf_GltfAccessorCompType ComponentType;
		Graphic3d_BndBox3d BndBox;
		%feature("compactdefaultargs") RWGltf_GltfAccessor;
		%feature("autodoc", "	* //!< bounding box Empty constructor.

	:rtype: None
") RWGltf_GltfAccessor;
		 RWGltf_GltfAccessor ();
};


%extend RWGltf_GltfAccessor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWGltf_GltfBufferView;
class RWGltf_GltfBufferView {
	public:
		int Id;
		int64_t ByteOffset;
		int64_t ByteLength;
		int32_t ByteStride;
		RWGltf_GltfBufferViewTarget Target;
		%feature("compactdefaultargs") RWGltf_GltfBufferView;
		%feature("autodoc", "	:rtype: None
") RWGltf_GltfBufferView;
		 RWGltf_GltfBufferView ();
};


%extend RWGltf_GltfBufferView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWGltf_GltfFace;
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
%nodefaultctor RWGltf_GltfLatePrimitiveArray;
class RWGltf_GltfLatePrimitiveArray : public Poly_Triangulation {
	public:
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Return bounding box defined within glTF file, or VOID if not specified.

	:rtype: Bnd_Box
") BoundingBox;
		const Bnd_Box & BoundingBox ();
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "	* Return primitive array data elements.

	:rtype: NCollection_Sequence<RWGltf_GltfPrimArrayData>
") Data;
		const NCollection_Sequence<RWGltf_GltfPrimArrayData> & Data ();
		%feature("compactdefaultargs") HasStyle;
		%feature("autodoc", "	* Return true if primitive array has assigned material

	:rtype: bool
") HasStyle;
		bool HasStyle ();
		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Entity id.

	:rtype: TCollection_AsciiString
") Id;
		const TCollection_AsciiString & Id ();
		%feature("compactdefaultargs") MaterialCommon;
		%feature("autodoc", "	* Return common (obsolete) material definition.

	:rtype: opencascade::handle<RWGltf_MaterialCommon>
") MaterialCommon;
		const opencascade::handle<RWGltf_MaterialCommon> & MaterialCommon ();
		%feature("compactdefaultargs") MaterialPbr;
		%feature("autodoc", "	* Return PBR material definition.

	:rtype: opencascade::handle<RWGltf_MaterialMetallicRoughness>
") MaterialPbr;
		const opencascade::handle<RWGltf_MaterialMetallicRoughness> & MaterialPbr ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Entity name.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") PrimitiveMode;
		%feature("autodoc", "	* Return type of primitive array.

	:rtype: RWGltf_GltfPrimitiveMode
") PrimitiveMode;
		RWGltf_GltfPrimitiveMode PrimitiveMode ();
		%feature("compactdefaultargs") SetMaterialCommon;
		%feature("autodoc", "	* Set common (obsolete) material definition.

	:param theMat:
	:type theMat: opencascade::handle<RWGltf_MaterialCommon> &
	:rtype: None
") SetMaterialCommon;
		void SetMaterialCommon (const opencascade::handle<RWGltf_MaterialCommon> & theMat);
		%feature("compactdefaultargs") SetMaterialPbr;
		%feature("autodoc", "	* Set PBR material definition.

	:param theMat:
	:type theMat: opencascade::handle<RWGltf_MaterialMetallicRoughness> &
	:rtype: None
") SetMaterialPbr;
		void SetMaterialPbr (const opencascade::handle<RWGltf_MaterialMetallicRoughness> & theMat);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Assign entity name.

	:param theName:
	:type theName: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & theName);
		%feature("compactdefaultargs") SetPrimitiveMode;
		%feature("autodoc", "	* Set type of primitive array.

	:param theMode:
	:type theMode: RWGltf_GltfPrimitiveMode
	:rtype: None
") SetPrimitiveMode;
		void SetPrimitiveMode (RWGltf_GltfPrimitiveMode theMode);
};


%make_alias(RWGltf_GltfLatePrimitiveArray)

%extend RWGltf_GltfLatePrimitiveArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWGltf_GltfPrimArrayData;
class RWGltf_GltfPrimArrayData {
	public:
		opencascade::handle<NCollection_Buffer> StreamData;
		TCollection_AsciiString StreamUri;
		int64_t StreamOffset;
		RWGltf_GltfAccessor Accessor;
		RWGltf_GltfArrayType Type;
		%feature("compactdefaultargs") RWGltf_GltfPrimArrayData;
		%feature("autodoc", "	:rtype: None
") RWGltf_GltfPrimArrayData;
		 RWGltf_GltfPrimArrayData ();
		%feature("compactdefaultargs") RWGltf_GltfPrimArrayData;
		%feature("autodoc", "	:param theType:
	:type theType: RWGltf_GltfArrayType
	:rtype: None
") RWGltf_GltfPrimArrayData;
		 RWGltf_GltfPrimArrayData (RWGltf_GltfArrayType theType);
};


%extend RWGltf_GltfPrimArrayData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWGltf_MaterialCommon;
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
		%feature("compactdefaultargs") RWGltf_MaterialCommon;
		%feature("autodoc", "	:rtype: None
") RWGltf_MaterialCommon;
		 RWGltf_MaterialCommon ();
};


%make_alias(RWGltf_MaterialCommon)

%extend RWGltf_MaterialCommon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWGltf_MaterialMetallicRoughness;
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
		%feature("compactdefaultargs") RWGltf_MaterialMetallicRoughness;
		%feature("autodoc", "	* //!< roughness (or scale factor to the texture) within range [0.0, 1.0]; 1.0 by default

	:rtype: None
") RWGltf_MaterialMetallicRoughness;
		 RWGltf_MaterialMetallicRoughness ();
};


%make_alias(RWGltf_MaterialMetallicRoughness)

%extend RWGltf_MaterialMetallicRoughness {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWGltf_PrimitiveArrayReader;
class RWGltf_PrimitiveArrayReader : public Standard_Transient {
	public:
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "	* Return transformation from glTF to OCCT coordinate system.

	:rtype: RWMesh_CoordinateSystemConverter
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter ();
		%feature("compactdefaultargs") ErrorPrefix;
		%feature("autodoc", "	* Return prefix for reporting issues.

	:rtype: TCollection_AsciiString
") ErrorPrefix;
		const TCollection_AsciiString & ErrorPrefix ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Load primitive array.

	:param theMesh:
	:type theMesh: opencascade::handle<RWGltf_GltfLatePrimitiveArray> &
	:rtype: opencascade::handle<Poly_Triangulation>
") Load;
		opencascade::handle<Poly_Triangulation> Load (const opencascade::handle<RWGltf_GltfLatePrimitiveArray> & theMesh);
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "	* Set transformation from glTF to OCCT coordinate system.

	:param theConverter:
	:type theConverter: RWMesh_CoordinateSystemConverter &
	:rtype: None
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter (const RWMesh_CoordinateSystemConverter & theConverter);
		%feature("compactdefaultargs") SetErrorPrefix;
		%feature("autodoc", "	* Set prefix for reporting issues.

	:param theErrPrefix:
	:type theErrPrefix: TCollection_AsciiString &
	:rtype: None
") SetErrorPrefix;
		void SetErrorPrefix (const TCollection_AsciiString & theErrPrefix);
};


%make_alias(RWGltf_PrimitiveArrayReader)

%extend RWGltf_PrimitiveArrayReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
