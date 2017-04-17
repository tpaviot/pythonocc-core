/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Graphic3d

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Graphic3d_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef NCollection_Vec4 <Standard_Integer> Graphic3d_Vec4i;
typedef NCollection_Vec2 <Standard_Character> Graphic3d_Vec2b;
typedef NCollection_Vec2 <Standard_Real> Graphic3d_Vec2d;
typedef NCollection_Vec2 <Standard_Integer> Graphic3d_Vec2i;
typedef NCollection_Vec4 <Standard_Character> Graphic3d_Vec4b;
typedef Standard_Integer Graphic3d_TransModeFlags;
typedef NCollection_Vec3 <Standard_Character> Graphic3d_Vec3b;
typedef Graphic3d_CAspectText CALL_DEF_CONTEXTTEXT;
typedef Graphic3d_StructureManager * Graphic3d_StructureManagerPtr;
typedef NCollection_Vec2 <unsigned int> Graphic3d_Vec2u;
typedef NCollection_Vec3 <Standard_Real> Graphic3d_Vec3d;
typedef NCollection_Vec4 <unsigned int> Graphic3d_Vec4u;
typedef NCollection_Mat4 <Standard_Real> Graphic3d_Mat4d;
typedef Graphic3d_CStructure * Graphic3d_CStructurePtr;
typedef NCollection_Map <Handle_Graphic3d_Structure> Graphic3d_MapOfStructure;
typedef CALL_DEF_TRANSFORM_PERSISTENCE Graphic3d_CTransPersStruct;
typedef NCollection_Vec2 <Standard_ShortReal> Graphic3d_Vec2;
typedef NCollection_Vec3 <Standard_ShortReal> Graphic3d_Vec3;
typedef NCollection_Vec4 <Standard_ShortReal> Graphic3d_Vec4;
typedef Graphic3d_CAspectMarker CALL_DEF_CONTEXTMARKER;
typedef Graphic3d_CAspectFillArea CALL_DEF_CONTEXTFILLAREA;
typedef Graphic3d_UniformValue <Graphic3d_Vec3> Graphic3d_UniformVec3;
typedef Graphic3d_UniformValue <Graphic3d_Vec2> Graphic3d_UniformVec2;
typedef NCollection_Map <const Standard_Transient *> Graphic3d_NMapOfTransient;
typedef Graphic3d_UniformValue <Graphic3d_Vec4> Graphic3d_UniformVec4;
typedef Graphic3d_CAspectLine CALL_DEF_CONTEXTLINE;
typedef NCollection_Vec4 <Standard_Byte> Graphic3d_Vec4ub;
typedef Standard_Integer Graphic3d_ZLayerId;
typedef Graphic3d_FrameBuffer * Graphic3d_PtrFrameBuffer;
typedef NCollection_Vec3 <Standard_Integer> Graphic3d_Vec3i;
typedef NCollection_List <Handle_TCollection_HAsciiString> Graphic3d_NListOfHAsciiString;
typedef Graphic3d_UniformValue <Standard_Integer> Graphic3d_UniformInt;
typedef CALL_DEF_USERDRAW Graphic3d_CUserDraw;
typedef Graphic3d_UniformValue <Graphic3d_Vec3i> Graphic3d_UniformVec3i;
typedef NCollection_Vec4 <Standard_Real> Graphic3d_Vec4d;
typedef Graphic3d_Structure * Graphic3d_StructurePtr;
typedef NCollection_Mat4 <Standard_ShortReal> Graphic3d_Mat4;
typedef NCollection_Sequence <Handle_Graphic3d_ShaderObject> Graphic3d_ShaderObjectList;
typedef NCollection_Sequence <Handle_Graphic3d_ClipPlane> Graphic3d_SequenceOfHClipPlane;
typedef Graphic3d_UniformValue <Standard_ShortReal> Graphic3d_UniformFloat;
typedef NCollection_IndexedMap <const Standard_Address> Graphic3d_IndexedMapOfAddress;
typedef NCollection_Handle <Graphic3d_NMapOfTransient> Handle_Graphic3d_NMapOfTransient;
typedef BVH_Box <Standard_Real , 4> Graphic3d_BndBox4d;
typedef BVH_Box <Standard_ShortReal , 4> Graphic3d_BndBox4f;
typedef NCollection_Sequence <Handle_Graphic3d_ShaderVariable> Graphic3d_ShaderVariableList;
typedef NCollection_Sequence <Handle_Graphic3d_Group> Graphic3d_SequenceOfGroup;
typedef Graphic3d_UniformValue <Graphic3d_Vec4i> Graphic3d_UniformVec4i;
typedef NCollection_Vec2 <Standard_Byte> Graphic3d_Vec2ub;
typedef Graphic3d_MapOfStructure::Iterator Graphic3d_MapIteratorOfMapOfStructure;
typedef Graphic3d_UniformValue <Graphic3d_Vec2i> Graphic3d_UniformVec2i;
typedef NCollection_Vec3 <Standard_Byte> Graphic3d_Vec3ub;
typedef NCollection_DataMap <const Standard_Transient * , Handle_Graphic3d_ViewAffinity> Graphic3d_MapOfObject;
typedef NCollection_Vec3 <unsigned int> Graphic3d_Vec3u;
/* end typedefs declaration */

/* public enums */
enum Graphic3d_TypeOfAttribute {
	Graphic3d_TOA_POS = 0,
	Graphic3d_TOA_NORM = 1,
	Graphic3d_TOA_UV = 2,
	Graphic3d_TOA_COLOR = 3,
	Graphic3d_TOA_CUSTOM = 10,
};

enum Graphic3d_TypeOfData {
	Graphic3d_TOD_USHORT = 0,
	Graphic3d_TOD_UINT = 1,
	Graphic3d_TOD_VEC2 = 2,
	Graphic3d_TOD_VEC3 = 3,
	Graphic3d_TOD_VEC4 = 4,
	Graphic3d_TOD_VEC4UB = 5,
};

enum Graphic3d_BufferType {
	Graphic3d_BT_RGB = 0,
	Graphic3d_BT_RGBA = 1,
	Graphic3d_BT_Depth = 2,
};

enum Graphic3d_ExportFormat {
	Graphic3d_EF_PostScript = 0,
	Graphic3d_EF_EnhPostScript = 1,
	Graphic3d_EF_TEX = 2,
	Graphic3d_EF_PDF = 3,
	Graphic3d_EF_SVG = 4,
	Graphic3d_EF_PGF = 5,
	Graphic3d_EF_EMF = 6,
};

enum Graphic3d_GroupAspect {
	Graphic3d_ASPECT_LINE = 0,
	Graphic3d_ASPECT_TEXT = 1,
	Graphic3d_ASPECT_MARKER = 2,
	Graphic3d_ASPECT_FILL_AREA = 3,
};

enum Graphic3d_HorizontalTextAlignment {
	Graphic3d_HTA_LEFT = 0,
	Graphic3d_HTA_CENTER = 1,
	Graphic3d_HTA_RIGHT = 2,
};

enum Graphic3d_LevelOfTextureAnisotropy {
	Graphic3d_LOTA_OFF = 0,
	Graphic3d_LOTA_FAST = 1,
	Graphic3d_LOTA_MIDDLE = 2,
	Graphic3d_LOTA_QUALITY = 3,
};

enum Graphic3d_NameOfMaterial {
	Graphic3d_NOM_BRASS = 0,
	Graphic3d_NOM_BRONZE = 1,
	Graphic3d_NOM_COPPER = 2,
	Graphic3d_NOM_GOLD = 3,
	Graphic3d_NOM_PEWTER = 4,
	Graphic3d_NOM_PLASTER = 5,
	Graphic3d_NOM_PLASTIC = 6,
	Graphic3d_NOM_SILVER = 7,
	Graphic3d_NOM_STEEL = 8,
	Graphic3d_NOM_STONE = 9,
	Graphic3d_NOM_SHINY_PLASTIC = 10,
	Graphic3d_NOM_SATIN = 11,
	Graphic3d_NOM_METALIZED = 12,
	Graphic3d_NOM_NEON_GNC = 13,
	Graphic3d_NOM_CHROME = 14,
	Graphic3d_NOM_ALUMINIUM = 15,
	Graphic3d_NOM_OBSIDIAN = 16,
	Graphic3d_NOM_NEON_PHC = 17,
	Graphic3d_NOM_JADE = 18,
	Graphic3d_NOM_CHARCOAL = 19,
	Graphic3d_NOM_WATER = 20,
	Graphic3d_NOM_GLASS = 21,
	Graphic3d_NOM_DIAMOND = 22,
	Graphic3d_NOM_DEFAULT = 23,
	Graphic3d_NOM_UserDefined = 24,
};

enum Graphic3d_NameOfTexture1D {
	Graphic3d_NOT_1D_ELEVATION = 0,
	Graphic3d_NOT_1D_UNKNOWN = 1,
};

enum Graphic3d_NameOfTexture2D {
	Graphic3d_NOT_2D_MATRA = 0,
	Graphic3d_NOT_2D_ALIENSKIN = 1,
	Graphic3d_NOT_2D_BLUE_ROCK = 2,
	Graphic3d_NOT_2D_BLUEWHITE_PAPER = 3,
	Graphic3d_NOT_2D_BRUSHED = 4,
	Graphic3d_NOT_2D_BUBBLES = 5,
	Graphic3d_NOT_2D_BUMP = 6,
	Graphic3d_NOT_2D_CAST = 7,
	Graphic3d_NOT_2D_CHIPBD = 8,
	Graphic3d_NOT_2D_CLOUDS = 9,
	Graphic3d_NOT_2D_FLESH = 10,
	Graphic3d_NOT_2D_FLOOR = 11,
	Graphic3d_NOT_2D_GALVNISD = 12,
	Graphic3d_NOT_2D_GRASS = 13,
	Graphic3d_NOT_2D_ALUMINUM = 14,
	Graphic3d_NOT_2D_ROCK = 15,
	Graphic3d_NOT_2D_KNURL = 16,
	Graphic3d_NOT_2D_MAPLE = 17,
	Graphic3d_NOT_2D_MARBLE = 18,
	Graphic3d_NOT_2D_MOTTLED = 19,
	Graphic3d_NOT_2D_RAIN = 20,
	Graphic3d_NOT_2D_UNKNOWN = 21,
};

enum Graphic3d_NameOfTextureEnv {
	Graphic3d_NOT_ENV_CLOUDS = 0,
	Graphic3d_NOT_ENV_CV = 1,
	Graphic3d_NOT_ENV_MEDIT = 2,
	Graphic3d_NOT_ENV_PEARL = 3,
	Graphic3d_NOT_ENV_SKY1 = 4,
	Graphic3d_NOT_ENV_SKY2 = 5,
	Graphic3d_NOT_ENV_LINES = 6,
	Graphic3d_NOT_ENV_ROAD = 7,
	Graphic3d_NOT_ENV_UNKNOWN = 8,
};

enum Graphic3d_NameOfTexturePlane {
	Graphic3d_NOTP_XY = 0,
	Graphic3d_NOTP_YZ = 1,
	Graphic3d_NOTP_ZX = 2,
	Graphic3d_NOTP_UNKNOWN = 3,
};

enum Graphic3d_RenderingMode {
	Graphic3d_RM_RASTERIZATION = 0,
	Graphic3d_RM_RAYTRACING = 1,
};

enum Graphic3d_SortType {
	Graphic3d_ST_Simple = 0,
	Graphic3d_ST_BSP_Tree = 1,
};

enum Graphic3d_StereoMode {
	Graphic3d_StereoMode_QuadBuffer = 0,
	Graphic3d_StereoMode_Anaglyph = 1,
	Graphic3d_StereoMode_RowInterlaced = 2,
	Graphic3d_StereoMode_ColumnInterlaced = 3,
	Graphic3d_StereoMode_ChessBoard = 4,
	Graphic3d_StereoMode_SideBySide = 5,
	Graphic3d_StereoMode_OverUnder = 6,
	Graphic3d_StereoMode_SoftPageFlip = 7,
	Graphic3d_StereoMode_NB = 8,
};

enum Graphic3d_TextPath {
	Graphic3d_TP_UP = 0,
	Graphic3d_TP_DOWN = 1,
	Graphic3d_TP_LEFT = 2,
	Graphic3d_TP_RIGHT = 3,
};

enum  {
	Graphic3d_TMF_None = 0,
	Graphic3d_TMF_PanPers = 1,
	Graphic3d_TMF_ZoomPers = 2,
	Graphic3d_TMF_RotatePers = 8,
	Graphic3d_TMF_TriedronPers = 32,
	Graphic3d_TMF_2d = 64,
	Graphic3d_TMF_2d_IsTopDown = 65,
	Graphic3d_TMF_FullPers = Graphic3d_TMF_PanPers | Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers,
};

enum Graphic3d_TypeOfBackground {
	Graphic3d_TOB_NONE = 0,
	Graphic3d_TOB_GRADIENT = 1,
	Graphic3d_TOB_TEXTURE = 2,
};

enum Graphic3d_TypeOfComposition {
	Graphic3d_TOC_REPLACE = 0,
	Graphic3d_TOC_POSTCONCATENATE = 1,
};

enum Graphic3d_TypeOfConnection {
	Graphic3d_TOC_ANCESTOR = 0,
	Graphic3d_TOC_DESCENDANT = 1,
};

enum Graphic3d_TypeOfMaterial {
	Graphic3d_MATERIAL_ASPECT = 0,
	Graphic3d_MATERIAL_PHYSIC = 1,
};

enum Graphic3d_TypeOfPolygon {
	Graphic3d_TOP_UNKNOWN = 0,
	Graphic3d_TOP_COMPLEX = 1,
	Graphic3d_TOP_CONCAVE = 2,
	Graphic3d_TOP_CONVEX = 3,
};

enum Graphic3d_TypeOfPrimitive {
	Graphic3d_TOP_UNDEFINED = 0,
	Graphic3d_TOP_POLYLINE = 1,
	Graphic3d_TOP_POLYGON = 2,
	Graphic3d_TOP_TRIANGLEMESH = 3,
	Graphic3d_TOP_QUADRANGLEMESH = 4,
	Graphic3d_TOP_TEXT = 5,
	Graphic3d_TOP_MARKER = 6,
	Graphic3d_TOP_PARRAY = 7,
};

enum Graphic3d_TypeOfPrimitiveArray {
	Graphic3d_TOPA_UNDEFINED = 0,
	Graphic3d_TOPA_POINTS = 1,
	Graphic3d_TOPA_POLYLINES = 2,
	Graphic3d_TOPA_SEGMENTS = 3,
	Graphic3d_TOPA_POLYGONS = 4,
	Graphic3d_TOPA_TRIANGLES = 5,
	Graphic3d_TOPA_QUADRANGLES = 6,
	Graphic3d_TOPA_TRIANGLESTRIPS = 7,
	Graphic3d_TOPA_QUADRANGLESTRIPS = 8,
	Graphic3d_TOPA_TRIANGLEFANS = 9,
};

enum Graphic3d_TypeOfReflection {
	Graphic3d_TOR_AMBIENT = 0,
	Graphic3d_TOR_DIFFUSE = 1,
	Graphic3d_TOR_SPECULAR = 2,
	Graphic3d_TOR_EMISSION = 3,
};

enum Graphic3d_TypeOfShaderObject {
	Graphic3d_TOS_VERTEX = 0,
	Graphic3d_TOS_FRAGMENT = 1,
};

enum Graphic3d_TypeOfStructure {
	Graphic3d_TOS_WIREFRAME = 0,
	Graphic3d_TOS_SHADING = 1,
	Graphic3d_TOS_COMPUTED = 2,
	Graphic3d_TOS_ALL = 3,
};

enum Graphic3d_TypeOfTexture {
	Graphic3d_TOT_1D = 0,
	Graphic3d_TOT_2D = 1,
	Graphic3d_TOT_2D_MIPMAP = 2,
};

enum Graphic3d_TypeOfTextureFilter {
	Graphic3d_TOTF_NEAREST = 0,
	Graphic3d_TOTF_BILINEAR = 1,
	Graphic3d_TOTF_TRILINEAR = 2,
};

enum Graphic3d_TypeOfTextureMode {
	Graphic3d_TOTM_OBJECT = 0,
	Graphic3d_TOTM_SPHERE = 1,
	Graphic3d_TOTM_EYE = 2,
	Graphic3d_TOTM_MANUAL = 3,
	Graphic3d_TOTM_SPRITE = 4,
};

enum Graphic3d_VerticalTextAlignment {
	Graphic3d_VTA_BOTTOM = 0,
	Graphic3d_VTA_CENTER = 1,
	Graphic3d_VTA_TOP = 2,
};

enum  {
	Graphic3d_ZLayerId_UNKNOWN = - 1,
	Graphic3d_ZLayerId_Default = 0,
	Graphic3d_ZLayerId_Top = - 2,
	Graphic3d_ZLayerId_Topmost = - 3,
	Graphic3d_ZLayerId_TopOSD = - 4,
	Graphic3d_ZLayerId_BotOSD = - 5,
};

enum Graphic3d_ZLayerSetting {
	Graphic3d_ZLayerDepthTest = 1,
	Graphic3d_ZLayerDepthWrite = 2,
	Graphic3d_ZLayerDepthClear = 4,
	Graphic3d_ZLayerDepthOffset = 8,
};

/* end public enums declaration */

%nodefaultctor Graphic3d_Array1OfVector;
class Graphic3d_Array1OfVector {
	public:
		%feature("compactdefaultargs") Graphic3d_Array1OfVector;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Graphic3d_Array1OfVector;
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vector &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVector;
		 Graphic3d_Array1OfVector (const Graphic3d_Vector & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vector &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vector & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVector &
	:rtype: Graphic3d_Array1OfVector
") Assign;
		const Graphic3d_Array1OfVector & Assign (const Graphic3d_Array1OfVector & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVector &
	:rtype: Graphic3d_Array1OfVector
") operator =;
		const Graphic3d_Array1OfVector & operator = (const Graphic3d_Array1OfVector & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Graphic3d_Vector &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vector & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vector
") Value;
		const Graphic3d_Vector & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vector
") ChangeValue;
		Graphic3d_Vector & ChangeValue (const Standard_Integer Index);
};


%extend Graphic3d_Array1OfVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Array1OfVertex;
class Graphic3d_Array1OfVertex {
	public:
		%feature("compactdefaultargs") Graphic3d_Array1OfVertex;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Graphic3d_Array1OfVertex;
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vertex &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Graphic3d_Array1OfVertex;
		 Graphic3d_Array1OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vertex &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVertex &
	:rtype: Graphic3d_Array1OfVertex
") Assign;
		const Graphic3d_Array1OfVertex & Assign (const Graphic3d_Array1OfVertex & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array1OfVertex &
	:rtype: Graphic3d_Array1OfVertex
") operator =;
		const Graphic3d_Array1OfVertex & operator = (const Graphic3d_Array1OfVertex & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Graphic3d_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Graphic3d_Vertex & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vertex
") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Graphic3d_Vertex
") ChangeValue;
		Graphic3d_Vertex & ChangeValue (const Standard_Integer Index);
};


%extend Graphic3d_Array1OfVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Array2OfVertex;
class Graphic3d_Array2OfVertex {
	public:
		%feature("compactdefaultargs") Graphic3d_Array2OfVertex;
		%feature("autodoc", "	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Graphic3d_Array2OfVertex;
		%feature("autodoc", "	:param Item:
	:type Item: Graphic3d_Vertex &
	:param R1:
	:type R1: int
	:param R2:
	:type R2: int
	:param C1:
	:type C1: int
	:param C2:
	:type C2: int
	:rtype: None
") Graphic3d_Array2OfVertex;
		 Graphic3d_Array2OfVertex (const Graphic3d_Vertex & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Graphic3d_Vertex &
	:rtype: None
") Init;
		void Init (const Graphic3d_Vertex & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array2OfVertex &
	:rtype: Graphic3d_Array2OfVertex
") Assign;
		const Graphic3d_Array2OfVertex & Assign (const Graphic3d_Array2OfVertex & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_Array2OfVertex &
	:rtype: Graphic3d_Array2OfVertex
") operator =;
		const Graphic3d_Array2OfVertex & operator = (const Graphic3d_Array2OfVertex & Other);
		%feature("compactdefaultargs") ColLength;
		%feature("autodoc", "	:rtype: int
") ColLength;
		Standard_Integer ColLength ();
		%feature("compactdefaultargs") RowLength;
		%feature("autodoc", "	:rtype: int
") RowLength;
		Standard_Integer RowLength ();
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "	:rtype: int
") LowerCol;
		Standard_Integer LowerCol ();
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "	:rtype: int
") LowerRow;
		Standard_Integer LowerRow ();
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "	:rtype: int
") UpperCol;
		Standard_Integer UpperCol ();
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "	:rtype: int
") UpperRow;
		Standard_Integer UpperRow ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:param Value:
	:type Value: Graphic3d_Vertex &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const Graphic3d_Vertex & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Graphic3d_Vertex
") Value;
		const Graphic3d_Vertex & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: Graphic3d_Vertex
") ChangeValue;
		Graphic3d_Vertex & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%extend Graphic3d_Array2OfVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfPrimitives;
class Graphic3d_ArrayOfPrimitives : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param aVertice:
	:type aVertice: gp_Pnt
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	:param theVertex:
	:type theVertex: Graphic3d_Vec3 &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Graphic3d_Vec3 & theVertex);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. returns the actual vertex number. Warning: <aColor> is ignored when the <hasVColors> constructor parameter is False

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Quantity_Color & aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. returns the actual vertex number. Warning: <aColor> is ignored when the <hasVColors> constructor parameter is False aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aColor:
	:type aColor: int
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const Standard_Integer aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param NX:
	:type NX: float
	:param NY:
	:type NY: float
	:param NZ:
	:type NZ: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:param NX:
	:type NX: Standard_ShortReal
	:param NY:
	:type NY: Standard_ShortReal
	:param NZ:
	:type NZ: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal NX,const Standard_ShortReal NY,const Standard_ShortReal NZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and color in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aColor> is ignored when the <hasVColors> constructor parameter is False

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const Quantity_Color & aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and color in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aColor> is ignored when the <hasVColors> constructor parameter is False aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:param aColor:
	:type aColor: int
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const Standard_Integer aColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture in the vertex array. returns the actual vertex number. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Pnt2d & aTexel);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture coordinates in the vertex array. returns the actual vertex number. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param TX:
	:type TX: float
	:param TY:
	:type TY: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real TX,const Standard_Real TY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture coordinates in the vertex array. returns the actual vertex number. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:param TX:
	:type TX: Standard_ShortReal
	:param TY:
	:type TY: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal TX,const Standard_ShortReal TY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param aVertice:
	:type aVertice: gp_Pnt
	:param aNormal:
	:type aNormal: gp_Dir
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & aVertice,const gp_Dir & aNormal,const gp_Pnt2d & aTexel);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param NX:
	:type NX: float
	:param NY:
	:type NY: float
	:param NZ:
	:type NZ: float
	:param TX:
	:type TX: float
	:param TY:
	:type TY: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ,const Standard_Real TX,const Standard_Real TY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. returns the actual vertex number. Warning: <aNormal> is ignored when the <hasVNormals> constructor parameter is False. <aTexel> is ignored when the <hasVTexels> constructor parameter is False.

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:param NX:
	:type NX: Standard_ShortReal
	:param NY:
	:type NY: Standard_ShortReal
	:param NZ:
	:type NZ: Standard_ShortReal
	:param TX:
	:type TX: Standard_ShortReal
	:param TY:
	:type TY: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z,const Standard_ShortReal NX,const Standard_ShortReal NY,const Standard_ShortReal NZ,const Standard_ShortReal TX,const Standard_ShortReal TY);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> in the bound array returns the actual bounds number.

	:param edgeNumber:
	:type edgeNumber: int
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> and bound color <aBColor> in the bound array. returns the actual bounds number. Warning: <aBColor> is ignored when the <hasBColors> constructor parameter is False

	:param edgeNumber:
	:type edgeNumber: int
	:param aBColor:
	:type aBColor: Quantity_Color &
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Quantity_Color & aBColor);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length <edgeNumber> and bound color coordinates in the bound array. returns the actual bounds number. Warning: <R,G,B> are ignored when the <hasBColors> constructor parameter is False

	:param edgeNumber:
	:type edgeNumber: int
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer edgeNumber,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	* Adds an edge in the range [1,VertexNumber()] in the array. Returns the actual edges number.

	:param vertexIndex:
	:type vertexIndex: int
	:rtype: int
") AddEdge;
		Standard_Integer AddEdge (const Standard_Integer vertexIndex);
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "	* Change the vertice of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aVertice:
	:type aVertice: gp_Pnt
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const gp_Pnt & aVertice);
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "	* Change the vertice of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Z:
	:type Z: Standard_ShortReal
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer anIndex,const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Z);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank <anIndex> in the array. aColor = Alpha << 24 + Blue << 16 + Green << 8 + Red On all architecture proccers type (x86 or SPARC) you can use this byte order.

	:param anIndex:
	:type anIndex: int
	:param aColor:
	:type aColor: int
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer anIndex,const Standard_Integer aColor);
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "	* Change the vertex normal of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aNormal:
	:type aNormal: gp_Dir
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const gp_Dir & aNormal);
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "	* Change the vertex normal of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param NX:
	:type NX: float
	:param NY:
	:type NY: float
	:param NZ:
	:type NZ: float
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer anIndex,const Standard_Real NX,const Standard_Real NY,const Standard_Real NZ);
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "	* Change the vertex texel of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aTexel:
	:type aTexel: gp_Pnt2d
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const gp_Pnt2d & aTexel);
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "	* Change the vertex texel of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param TX:
	:type TX: float
	:param TY:
	:type TY: float
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer anIndex,const Standard_Real TX,const Standard_Real TY);
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "	* Change the bound color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param aColor:
	:type aColor: Quantity_Color &
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Quantity_Color & aColor);
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "	* Change the bound color of rank <anIndex> in the array.

	:param anIndex:
	:type anIndex: int
	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer anIndex,const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	* Returns optional index buffer.

	:rtype: Handle_Graphic3d_IndexBuffer
") Indices;
		Handle_Graphic3d_IndexBuffer Indices ();
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "	* Returns vertex attributes buffer (colors, normals, texture coordinates).

	:rtype: Handle_Graphic3d_Buffer
") Attributes;
		Handle_Graphic3d_Buffer Attributes ();
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* Returns optional bounds buffer.

	:rtype: Handle_Graphic3d_BoundBuffer
") Bounds;
		Handle_Graphic3d_BoundBuffer Bounds ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type of this primitive

	:rtype: Graphic3d_TypeOfPrimitiveArray
") Type;
		Graphic3d_TypeOfPrimitiveArray Type ();
		%feature("compactdefaultargs") StringType;
		%feature("autodoc", "	* Returns the string type of this primitive

	:rtype: char *
") StringType;
		const char * StringType ();
		%feature("compactdefaultargs") HasVertexNormals;
		%feature("autodoc", "	* Returns True when vertex normals array is defined.

	:rtype: bool
") HasVertexNormals;
		Standard_Boolean HasVertexNormals ();
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "	* Returns True when vertex colors array is defined.

	:rtype: bool
") HasVertexColors;
		Standard_Boolean HasVertexColors ();
		%feature("compactdefaultargs") HasVertexTexels;
		%feature("autodoc", "	* Returns True when vertex texels array is defined.

	:rtype: bool
") HasVertexTexels;
		Standard_Boolean HasVertexTexels ();
		%feature("compactdefaultargs") VertexNumber;
		%feature("autodoc", "	* Returns the number of defined vertex

	:rtype: int
") VertexNumber;
		Standard_Integer VertexNumber ();
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "	* Returns the vertice at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: gp_Pnt
") Vertice;
		gp_Pnt Vertice (const Standard_Integer aRank);
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "	* Returns the vertice coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Vertice;
		void Vertice (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: Quantity_Color
") VertexColor;
		Quantity_Color VertexColor (const Standard_Integer aRank);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color values at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color values at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param aColor:
	:type aColor: int &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer aRank,Standard_Integer &OutValue);
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "	* Returns the vertex normal at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: gp_Dir
") VertexNormal;
		gp_Dir VertexNormal (const Standard_Integer aRank);
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "	* Returns the vertex normal coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param NX:
	:type NX: float &
	:param NY:
	:type NY: float &
	:param NZ:
	:type NZ: float &
	:rtype: None
") VertexNormal;
		void VertexNormal (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "	* Returns the vertex texture at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:rtype: gp_Pnt2d
") VertexTexel;
		gp_Pnt2d VertexTexel (const Standard_Integer aRank);
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "	* Returns the vertex texture coordinates at rank <aRank> from the vertex table if defined.

	:param aRank:
	:type aRank: int
	:param TX:
	:type TX: float &
	:param TY:
	:type TY: float &
	:rtype: None
") VertexTexel;
		void VertexTexel (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "	* Returns the number of defined edges

	:rtype: int
") EdgeNumber;
		Standard_Integer EdgeNumber ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the vertex index at rank <aRank> in the range [1,VertexNumber()]

	:param aRank:
	:type aRank: int
	:rtype: int
") Edge;
		Standard_Integer Edge (const Standard_Integer aRank);
		%feature("compactdefaultargs") HasBoundColors;
		%feature("autodoc", "	* Returns True when bound colors array is defined.

	:rtype: bool
") HasBoundColors;
		Standard_Boolean HasBoundColors ();
		%feature("compactdefaultargs") BoundNumber;
		%feature("autodoc", "	* Returns the number of defined bounds

	:rtype: int
") BoundNumber;
		Standard_Integer BoundNumber ();
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "	* Returns the edge number at rank <aRank>.

	:param aRank:
	:type aRank: int
	:rtype: int
") Bound;
		Standard_Integer Bound (const Standard_Integer aRank);
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "	* Returns the bound color at rank <aRank> from the bound table if defined.

	:param aRank:
	:type aRank: int
	:rtype: Quantity_Color
") BoundColor;
		Quantity_Color BoundColor (const Standard_Integer aRank);
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "	* Returns the bound color values at rank <aRank> from the bound table if defined.

	:param aRank:
	:type aRank: int
	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: None
") BoundColor;
		void BoundColor (const Standard_Integer aRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ItemNumber;
		%feature("autodoc", "	* Returns the number of total items according to the array type.

	:rtype: int
") ItemNumber;
		Standard_Integer ItemNumber ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns True only when the contains of this array is available.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
};


%extend Graphic3d_ArrayOfPrimitives {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPrimitives(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPrimitives::Handle_Graphic3d_ArrayOfPrimitives %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPrimitives;
class Handle_Graphic3d_ArrayOfPrimitives : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPrimitives();
        Handle_Graphic3d_ArrayOfPrimitives(const Handle_Graphic3d_ArrayOfPrimitives &aHandle);
        Handle_Graphic3d_ArrayOfPrimitives(const Graphic3d_ArrayOfPrimitives *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPrimitives DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPrimitives {
    Graphic3d_ArrayOfPrimitives* _get_reference() {
    return (Graphic3d_ArrayOfPrimitives*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfPrimitives {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfPrimitives {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectFillArea3d;
class Graphic3d_AspectFillArea3d : public Aspect_AspectFillArea {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "	* Creates a context table for fill area primitives defined with the following default values: //! InteriorStyle : IS_EMPTY InteriorColor : NOC_CYAN1 EdgeColor  : NOC_WHITE EdgeLineType : TOL_SOLID EdgeWidth  : 1.0 FrontMaterial : NOM_BRASS BackMaterial : NOM_BRASS //! Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.

	:rtype: None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d ();
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "	* Creates a context table for fill area primitives defined with the specified values. //! Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0. Warning EdgeWidth is the 'line width scale factor'. The nominal line width is 1 pixel. The width of the line is determined by applying the line width scale factor to this nominal line width. The supported line widths vary by 1-pixel units.

	:param Interior:
	:type Interior: Aspect_InteriorStyle
	:param InteriorColor:
	:type InteriorColor: Quantity_Color &
	:param EdgeColor:
	:type EdgeColor: Quantity_Color &
	:param EdgeLineType:
	:type EdgeLineType: Aspect_TypeOfLine
	:param EdgeWidth:
	:type EdgeWidth: float
	:param FrontMaterial:
	:type FrontMaterial: Graphic3d_MaterialAspect &
	:param BackMaterial:
	:type BackMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d (const Aspect_InteriorStyle Interior,const Quantity_Color & InteriorColor,const Quantity_Color & EdgeColor,const Aspect_TypeOfLine EdgeLineType,const Standard_Real EdgeWidth,const Graphic3d_MaterialAspect & FrontMaterial,const Graphic3d_MaterialAspect & BackMaterial);
		%feature("compactdefaultargs") AllowBackFace;
		%feature("autodoc", "	* Allows the display of back-facing filled polygons.

	:rtype: None
") AllowBackFace;
		void AllowBackFace ();
		%feature("compactdefaultargs") SetBackMaterial;
		%feature("autodoc", "	* Modifies the surface material of internal faces

	:param AMaterial:
	:type AMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetBackMaterial;
		void SetBackMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("compactdefaultargs") SetDistinguishOn;
		%feature("autodoc", "	* Allows distinction between external and internal faces of FillAreas.

	:rtype: None
") SetDistinguishOn;
		void SetDistinguishOn ();
		%feature("compactdefaultargs") SetDistinguishOff;
		%feature("autodoc", "	* Forbids distinction between external and internal faces of FillAreas.

	:rtype: None
") SetDistinguishOff;
		void SetDistinguishOff ();
		%feature("compactdefaultargs") SetEdgeOn;
		%feature("autodoc", "	* The edges of FillAreas are drawn.

	:rtype: None
") SetEdgeOn;
		void SetEdgeOn ();
		%feature("compactdefaultargs") SetEdgeOff;
		%feature("autodoc", "	* The edges of FillAreas are not drawn.

	:rtype: None
") SetEdgeOff;
		void SetEdgeOff ();
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "	* Modifies the surface material of external faces

	:param AMaterial:
	:type AMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetFrontMaterial;
		void SetFrontMaterial (const Graphic3d_MaterialAspect & AMaterial);
		%feature("compactdefaultargs") SuppressBackFace;
		%feature("autodoc", "	* Suppress the display of back-facing filled polygons. A back-facing polygon is defined as a polygon whose vertices are in a clockwise order with respect to screen coordinates.

	:rtype: None
") SuppressBackFace;
		void SuppressBackFace ();
		%feature("compactdefaultargs") SetTextureMap;
		%feature("autodoc", "	:param ATexture:
	:type ATexture: Handle_Graphic3d_TextureMap &
	:rtype: None
") SetTextureMap;
		void SetTextureMap (const Handle_Graphic3d_TextureMap & ATexture);
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "	:rtype: None
") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "	:rtype: None
") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "	* Sets up OpenGL polygon offsets mechanism. <aMode> parameter can contain various combinations of Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means that polygon offsets are not changed). If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits> arguments are used by graphic renderer to calculate a depth offset value: //! offset = <aFactor> * m + <aUnits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific) //! Deafult settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0. //! Negative offset values move polygons closer to the viewport, while positive values shift polygons away. Consult OpenGL reference for details (glPolygonOffset function description).

	:param aMode:
	:type aMode: int
	:param aFactor: default value is 1.0
	:type aFactor: Standard_ShortReal
	:param aUnits: default value is 0.0
	:type aUnits: Standard_ShortReal
	:rtype: None
") SetPolygonOffsets;
		void SetPolygonOffsets (const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "	* Returns the Back Face Removal status. Standard_True if SuppressBackFace is activated.

	:rtype: bool
") BackFace;
		Standard_Boolean BackFace ();
		%feature("compactdefaultargs") Distinguish;
		%feature("autodoc", "	* Returns the Distinguish Mode status.

	:rtype: bool
") Distinguish;
		Standard_Boolean Distinguish ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns Standard_True if the edges are drawn and Standard_False if the edges are not drawn.

	:rtype: bool
") Edge;
		Standard_Boolean Edge ();
		%feature("compactdefaultargs") BackMaterial;
		%feature("autodoc", "	* Returns the surface material of internal faces

	:rtype: Graphic3d_MaterialAspect
") BackMaterial;
		const Graphic3d_MaterialAspect & BackMaterial ();
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "	* Returns the surface material of external faces

	:rtype: Graphic3d_MaterialAspect
") FrontMaterial;
		const Graphic3d_MaterialAspect & FrontMaterial ();
		%feature("compactdefaultargs") TextureMap;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_TextureMap
") TextureMap;
		Handle_Graphic3d_TextureMap TextureMap ();
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "	:rtype: bool
") TextureMapState;
		Standard_Boolean TextureMapState ();
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "	* Returns current polygon offsets settings.

	:param aMode:
	:type aMode: int &
	:param aFactor:
	:type aFactor: Standard_ShortReal &
	:param aUnits:
	:type aUnits: Standard_ShortReal &
	:rtype: None
") PolygonOffsets;
		void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
};


%extend Graphic3d_AspectFillArea3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectFillArea3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectFillArea3d::Handle_Graphic3d_AspectFillArea3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectFillArea3d;
class Handle_Graphic3d_AspectFillArea3d : public Handle_Aspect_AspectFillArea {

    public:
        // constructors
        Handle_Graphic3d_AspectFillArea3d();
        Handle_Graphic3d_AspectFillArea3d(const Handle_Graphic3d_AspectFillArea3d &aHandle);
        Handle_Graphic3d_AspectFillArea3d(const Graphic3d_AspectFillArea3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectFillArea3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectFillArea3d {
    Graphic3d_AspectFillArea3d* _get_reference() {
    return (Graphic3d_AspectFillArea3d*)$self->Access();
    }
};

%extend Handle_Graphic3d_AspectFillArea3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_AspectFillArea3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectLine3d;
class Graphic3d_AspectLine3d : public Aspect_AspectLine {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "	* Creates a context table for line primitives defined with the following default values: //! Colour	: NOC_YELLOW Line type	: TOL_SOLID Width	: 1.0

	:rtype: None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d ();
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "	* Creates a context table for line primitives defined with the specified values. Warning: <AWidth> is the 'linewidth scale factor'. The nominal line width is 1 pixel. The width of the line is determined by applying the linewidth scale factor to this nominal line width. The supported linewidths vary by 1-pixel units.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AType:
	:type AType: Aspect_TypeOfLine
	:param AWidth:
	:type AWidth: float
	:rtype: None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d (const Quantity_Color & AColor,const Aspect_TypeOfLine AType,const Standard_Real AWidth);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
};


%extend Graphic3d_AspectLine3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectLine3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectLine3d::Handle_Graphic3d_AspectLine3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectLine3d;
class Handle_Graphic3d_AspectLine3d : public Handle_Aspect_AspectLine {

    public:
        // constructors
        Handle_Graphic3d_AspectLine3d();
        Handle_Graphic3d_AspectLine3d(const Handle_Graphic3d_AspectLine3d &aHandle);
        Handle_Graphic3d_AspectLine3d(const Graphic3d_AspectLine3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectLine3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectLine3d {
    Graphic3d_AspectLine3d* _get_reference() {
    return (Graphic3d_AspectLine3d*)$self->Access();
    }
};

%extend Handle_Graphic3d_AspectLine3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_AspectLine3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectMarker3d;
class Graphic3d_AspectMarker3d : public Aspect_AspectMarker {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the following default values: //! Marker type : TOM_X Colour : YELLOW Scale factor: 1.0

	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d ();
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	:param theType:
	:type theType: Aspect_TypeOfMarker
	:param theColor:
	:type theColor: Quantity_Color &
	:param theScale:
	:type theScale: float
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Aspect_TypeOfMarker theType,const Quantity_Color & theColor,const Standard_Real theScale);
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the specified values.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theTextureBitmap:
	:type theTextureBitmap: Handle_TColStd_HArray1OfByte &
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Quantity_Color & theColor,const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTextureBitmap);
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the specified values.

	:param theTextureImage:
	:type theTextureImage: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Image_PixMap_Handle & theTextureImage);
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "	* Returns marker's texture size.

	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetMarkerImage;
		%feature("autodoc", "	* Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.

	:rtype: Handle_Graphic3d_MarkerImage
") GetMarkerImage;
		Handle_Graphic3d_MarkerImage GetMarkerImage ();
		%feature("compactdefaultargs") SetMarkerImage;
		%feature("autodoc", "	* Set marker's image texture.

	:param theImage:
	:type theImage: Handle_Graphic3d_MarkerImage &
	:rtype: None
") SetMarkerImage;
		void SetMarkerImage (const Handle_Graphic3d_MarkerImage & theImage);
		%feature("compactdefaultargs") SetBitMap;
		%feature("autodoc", "	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theTexture:
	:type theTexture: Handle_TColStd_HArray1OfByte &
	:rtype: None
") SetBitMap;
		void SetBitMap (const Standard_Integer theWidth,const Standard_Integer theHeight,const Handle_TColStd_HArray1OfByte & theTexture);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
};


%extend Graphic3d_AspectMarker3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectMarker3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectMarker3d::Handle_Graphic3d_AspectMarker3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectMarker3d;
class Handle_Graphic3d_AspectMarker3d : public Handle_Aspect_AspectMarker {

    public:
        // constructors
        Handle_Graphic3d_AspectMarker3d();
        Handle_Graphic3d_AspectMarker3d(const Handle_Graphic3d_AspectMarker3d &aHandle);
        Handle_Graphic3d_AspectMarker3d(const Graphic3d_AspectMarker3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectMarker3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectMarker3d {
    Graphic3d_AspectMarker3d* _get_reference() {
    return (Graphic3d_AspectMarker3d*)$self->Access();
    }
};

%extend Handle_Graphic3d_AspectMarker3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_AspectMarker3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectText3d;
class Graphic3d_AspectText3d : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "	* Creates a context table for text primitives defined with the following default values: //! Colour  : NOC_YELLOW Font  : NOF_ASCII_MONO Expansion factor : 1. Space between characters : 0. The style  : TOST_NORMAL The display type : TODT_NORMAL

	:rtype: None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d ();
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "	* Creates a context table for text primitives defined with the specified values. AFont may be to take means from User(example 'Courier New') or Font name defined in Font_NameOfFont(example Font_NOF_ASCII_MONO) or use default font('Courier')

	:param AColor:
	:type AColor: Quantity_Color &
	:param AFont:
	:type AFont: char *
	:param AExpansionFactor:
	:type AExpansionFactor: float
	:param ASpace:
	:type ASpace: float
	:param AStyle: default value is Aspect_TOST_NORMAL
	:type AStyle: Aspect_TypeOfStyleText
	:param ADisplayType: default value is Aspect_TODT_NORMAL
	:type ADisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d (const Quantity_Color & AColor,const char * AFont,const Standard_Real AExpansionFactor,const Standard_Real ASpace,const Aspect_TypeOfStyleText AStyle = Aspect_TOST_NORMAL,const Aspect_TypeOfDisplayText ADisplayType = Aspect_TODT_NORMAL);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the colour of <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetExpansionFactor;
		%feature("autodoc", "	* Modifies the expansion factor (height/width ratio) If the factor is less than 1, the characters will be higher than they are wide.

	:param AFactor:
	:type AFactor: float
	:rtype: None
") SetExpansionFactor;
		void SetExpansionFactor (const Standard_Real AFactor);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Modifies the font of <self>.

	:param AFont:
	:type AFont: char *
	:rtype: None
") SetFont;
		void SetFont (const char * AFont);
		%feature("compactdefaultargs") SetSpace;
		%feature("autodoc", "	* Modifies the space between the characters.

	:param ASpace:
	:type ASpace: float
	:rtype: None
") SetSpace;
		void SetSpace (const Standard_Real ASpace);
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "	* Modifies the style of the text. TOST_NORMAL Default text. The text is displayed like any other graphic object. This text can be hidden by another object that is nearest from the point of view. TOST_ANNOTATION The text is always visible. The texte is displayed over the other object according to the priority.

	:param AStyle:
	:type AStyle: Aspect_TypeOfStyleText
	:rtype: None
") SetStyle;
		void SetStyle (const Aspect_TypeOfStyleText AStyle);
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "	* Define the display type of the text. //! TODT_NORMAL Default display. Text only. TODT_SUBTITLE There is a subtitle under the text. TODT_DEKALE The text is displayed with a 3D style. TODT_BLEND The text is displayed in XOR. TODT_DIMENSION Dimension line under text will be invisible.

	:param ADisplayType:
	:type ADisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") SetDisplayType;
		void SetDisplayType (const Aspect_TypeOfDisplayText ADisplayType);
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "	* Modifies the colour of the subtitle for the TODT_SUBTITLE TextDisplayType and the colour of backgroubd for the TODT_DEKALE TextDisplayType.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetTextZoomable;
		%feature("autodoc", "	* Turns usage of text zoomable on/off

	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetTextZoomable;
		void SetTextZoomable (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") GetTextZoomable;
		%feature("autodoc", "	* Returns True when the Text Zoomable is on.

	:rtype: bool
") GetTextZoomable;
		Standard_Boolean GetTextZoomable ();
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "	* Turns usage of text rotated

	:param AAngle:
	:type AAngle: float
	:rtype: None
") SetTextAngle;
		void SetTextAngle (const Standard_Real AAngle);
		%feature("compactdefaultargs") GetTextAngle;
		%feature("autodoc", "	* Returns Angle of degree

	:rtype: float
") GetTextAngle;
		Standard_Real GetTextAngle ();
		%feature("compactdefaultargs") SetTextFontAspect;
		%feature("autodoc", "	* Turns usage of Aspect text

	:param AFontAspect:
	:type AFontAspect: Font_FontAspect
	:rtype: None
") SetTextFontAspect;
		void SetTextFontAspect (const Font_FontAspect AFontAspect);
		%feature("compactdefaultargs") GetTextFontAspect;
		%feature("autodoc", "	* Returns text FontAspect

	:rtype: Font_FontAspect
") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect ();
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AFont:
	:type AFont: char * &
	:param AnExpansionFactor:
	:type AnExpansionFactor: float &
	:param ASpace:
	:type ASpace: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & AColor,const char * & AFont,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AFont:
	:type AFont: char * &
	:param AnExpansionFactor:
	:type AnExpansionFactor: float &
	:param ASpace:
	:type ASpace: float &
	:param AStyle:
	:type AStyle: Aspect_TypeOfStyleText &
	:param ADisplayType:
	:type ADisplayType: Aspect_TypeOfDisplayText &
	:param AColorSubTitle:
	:type AColorSubTitle: Quantity_Color &
	:rtype: None
") Values;
		void Values (Quantity_Color & AColor,const char * & AFont,Standard_Real &OutValue,Standard_Real &OutValue,Aspect_TypeOfStyleText & AStyle,Aspect_TypeOfDisplayText & ADisplayType,Quantity_Color & AColorSubTitle);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AFont:
	:type AFont: char * &
	:param AnExpansionFactor:
	:type AnExpansionFactor: float &
	:param ASpace:
	:type ASpace: float &
	:param AStyle:
	:type AStyle: Aspect_TypeOfStyleText &
	:param ADisplayType:
	:type ADisplayType: Aspect_TypeOfDisplayText &
	:param AColorSubTitle:
	:type AColorSubTitle: Quantity_Color &
	:param ATextZoomable:
	:type ATextZoomable: bool
	:param ATextAngle:
	:type ATextAngle: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & AColor,const char * & AFont,Standard_Real &OutValue,Standard_Real &OutValue,Aspect_TypeOfStyleText & AStyle,Aspect_TypeOfDisplayText & ADisplayType,Quantity_Color & AColorSubTitle,Standard_Boolean &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group <self>.

	:param AColor:
	:type AColor: Quantity_Color &
	:param AFont:
	:type AFont: char * &
	:param AnExpansionFactor:
	:type AnExpansionFactor: float &
	:param ASpace:
	:type ASpace: float &
	:param AStyle:
	:type AStyle: Aspect_TypeOfStyleText &
	:param ADisplayType:
	:type ADisplayType: Aspect_TypeOfDisplayText &
	:param AColorSubTitle:
	:type AColorSubTitle: Quantity_Color &
	:param ATextZoomable:
	:type ATextZoomable: bool
	:param ATextAngle:
	:type ATextAngle: float &
	:param ATextFontAspect:
	:type ATextFontAspect: Font_FontAspect &
	:rtype: None
") Values;
		void Values (Quantity_Color & AColor,const char * & AFont,Standard_Real &OutValue,Standard_Real &OutValue,Aspect_TypeOfStyleText & AStyle,Aspect_TypeOfDisplayText & ADisplayType,Quantity_Color & AColorSubTitle,Standard_Boolean &OutValue,Standard_Real &OutValue,Font_FontAspect & ATextFontAspect);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
};


%extend Graphic3d_AspectText3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_AspectText3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_AspectText3d::Handle_Graphic3d_AspectText3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_AspectText3d;
class Handle_Graphic3d_AspectText3d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_AspectText3d();
        Handle_Graphic3d_AspectText3d(const Handle_Graphic3d_AspectText3d &aHandle);
        Handle_Graphic3d_AspectText3d(const Graphic3d_AspectText3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_AspectText3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_AspectText3d {
    Graphic3d_AspectText3d* _get_reference() {
    return (Graphic3d_AspectText3d*)$self->Access();
    }
};

%extend Handle_Graphic3d_AspectText3d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_AspectText3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Attribute;
class Graphic3d_Attribute {
	public:
		Graphic3d_TypeOfAttribute Id;
		Graphic3d_TypeOfData DataType;
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "	* //!< vec2,vec3,vec4,vec4ub

	:rtype: int
") Stride;
		Standard_Integer Stride ();
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "	* returns size of attribute of specified data type

	:param theType:
	:type theType: Graphic3d_TypeOfData
	:rtype: int
") Stride;
		static Standard_Integer Stride (const Graphic3d_TypeOfData theType);
};


%extend Graphic3d_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AxisAspect;
class Graphic3d_AxisAspect {
	public:
		%feature("compactdefaultargs") Graphic3d_AxisAspect;
		%feature("autodoc", "	:param theName: default value is ""
	:type theName: TCollection_ExtendedString
	:param theNameColor: default value is Quantity_NOC_BLACK
	:type theNameColor: Quantity_Color
	:param theColor: default value is Quantity_NOC_BLACK
	:type theColor: Quantity_Color
	:param theValuesOffset: default value is 10
	:type theValuesOffset: int
	:param theNameOffset: default value is 30
	:type theNameOffset: int
	:param theTickmarksNumber: default value is 5
	:type theTickmarksNumber: int
	:param theTickmarksLength: default value is 10
	:type theTickmarksLength: int
	:param theToDrawName: default value is Standard_True
	:type theToDrawName: bool
	:param theToDrawValues: default value is Standard_True
	:type theToDrawValues: bool
	:param theToDrawTickmarks: default value is Standard_True
	:type theToDrawTickmarks: bool
	:rtype: None
") Graphic3d_AxisAspect;
		 Graphic3d_AxisAspect (const TCollection_ExtendedString theName = "",const Quantity_Color theNameColor = Quantity_NOC_BLACK,const Quantity_Color theColor = Quantity_NOC_BLACK,const Standard_Integer theValuesOffset = 10,const Standard_Integer theNameOffset = 30,const Standard_Integer theTickmarksNumber = 5,const Standard_Integer theTickmarksLength = 10,const Standard_Boolean theToDrawName = Standard_True,const Standard_Boolean theToDrawValues = Standard_True,const Standard_Boolean theToDrawTickmarks = Standard_True);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: None
") SetName;
		void SetName (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Name;
		const TCollection_ExtendedString & Name ();
		%feature("compactdefaultargs") ToDrawName;
		%feature("autodoc", "	:rtype: bool
") ToDrawName;
		const Standard_Boolean ToDrawName ();
		%feature("compactdefaultargs") SetDrawName;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawName;
		void SetDrawName (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") ToDrawTickmarks;
		%feature("autodoc", "	:rtype: bool
") ToDrawTickmarks;
		const Standard_Boolean ToDrawTickmarks ();
		%feature("compactdefaultargs") SetDrawTickmarks;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawTickmarks;
		void SetDrawTickmarks (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") ToDrawValues;
		%feature("autodoc", "	:rtype: bool
") ToDrawValues;
		const Standard_Boolean ToDrawValues ();
		%feature("compactdefaultargs") SetDrawValues;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawValues;
		void SetDrawValues (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") NameColor;
		%feature("autodoc", "	:rtype: Quantity_Color
") NameColor;
		const Quantity_Color & NameColor ();
		%feature("compactdefaultargs") SetNameColor;
		%feature("autodoc", "	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetNameColor;
		void SetNameColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Color of axis and values

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets color of axis and values

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") TickmarksNumber;
		%feature("autodoc", "	:rtype: int
") TickmarksNumber;
		const Standard_Integer TickmarksNumber ();
		%feature("compactdefaultargs") SetTickmarksNumber;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetTickmarksNumber;
		void SetTickmarksNumber (const Standard_Integer theValue);
		%feature("compactdefaultargs") TickmarksLength;
		%feature("autodoc", "	:rtype: int
") TickmarksLength;
		const Standard_Integer TickmarksLength ();
		%feature("compactdefaultargs") SetTickmarksLength;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetTickmarksLength;
		void SetTickmarksLength (const Standard_Integer theValue);
		%feature("compactdefaultargs") ValuesOffset;
		%feature("autodoc", "	:rtype: int
") ValuesOffset;
		const Standard_Integer ValuesOffset ();
		%feature("compactdefaultargs") SetValuesOffset;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetValuesOffset;
		void SetValuesOffset (const Standard_Integer theValue);
		%feature("compactdefaultargs") NameOffset;
		%feature("autodoc", "	:rtype: int
") NameOffset;
		const Standard_Integer NameOffset ();
		%feature("compactdefaultargs") SetNameOffset;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetNameOffset;
		void SetNameOffset (const Standard_Integer theValue);
};


%extend Graphic3d_AxisAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_BoundBuffer;
class Graphic3d_BoundBuffer : public NCollection_Buffer {
	public:
		Graphic3d_Vec4 * Colors;
		int * Bounds;
		int NbBounds;
		%feature("compactdefaultargs") Graphic3d_BoundBuffer;
		%feature("autodoc", "	* Empty constructor.

	:param theAlloc:
	:type theAlloc: Handle_NCollection_BaseAllocator &
	:rtype: None
") Graphic3d_BoundBuffer;
		 Graphic3d_BoundBuffer (const Handle_NCollection_BaseAllocator & theAlloc);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Allocates new empty array

	:param theNbBounds:
	:type theNbBounds: int
	:param theHasColors:
	:type theHasColors: bool
	:rtype: bool
") Init;
		bool Init (const Standard_Integer theNbBounds,const Standard_Boolean theHasColors);
};


%extend Graphic3d_BoundBuffer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_BoundBuffer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_BoundBuffer::Handle_Graphic3d_BoundBuffer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_BoundBuffer;
class Handle_Graphic3d_BoundBuffer : public Handle_NCollection_Buffer {

    public:
        // constructors
        Handle_Graphic3d_BoundBuffer();
        Handle_Graphic3d_BoundBuffer(const Handle_Graphic3d_BoundBuffer &aHandle);
        Handle_Graphic3d_BoundBuffer(const Graphic3d_BoundBuffer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_BoundBuffer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_BoundBuffer {
    Graphic3d_BoundBuffer* _get_reference() {
    return (Graphic3d_BoundBuffer*)$self->Access();
    }
};

%extend Handle_Graphic3d_BoundBuffer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_BoundBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CAspectFillArea;
class Graphic3d_CAspectFillArea {
	public:
		int IsDef;
		int IsSet;
		int Style;
		CALL_DEF_COLOR IntColor;
		CALL_DEF_COLOR BackIntColor;
		CALL_DEF_COLOR EdgeColor;
		int LineType;
		float Width;
		int Hatch;
		int Distinguish;
		int BackFace;
		int Edge;
		CALL_DEF_MATERIAL Front;
		CALL_DEF_MATERIAL Back;
		Graphic3d_CTexture Texture;
		int PolygonOffsetMode;
		float PolygonOffsetFactor;
		float PolygonOffsetUnits;
		Handle_Graphic3d_ShaderProgram ShaderProgram;
		%feature("compactdefaultargs") Graphic3d_CAspectFillArea;
		%feature("autodoc", "	:rtype: None
") Graphic3d_CAspectFillArea;
		 Graphic3d_CAspectFillArea ();
};


%extend Graphic3d_CAspectFillArea {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CAspectLine;
class Graphic3d_CAspectLine {
	public:
		int IsDef;
		int IsSet;
		CALL_DEF_COLOR Color;
		int LineType;
		float Width;
		Handle_Graphic3d_ShaderProgram ShaderProgram;
};


%extend Graphic3d_CAspectLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CAspectMarker;
class Graphic3d_CAspectMarker {
	public:
		int IsDef;
		int IsSet;
		CALL_DEF_COLOR Color;
		Aspect_TypeOfMarker MarkerType;
		Standard_ShortReal Scale;
		Handle_Graphic3d_MarkerImage MarkerImage;
		Handle_Graphic3d_ShaderProgram ShaderProgram;
		%feature("compactdefaultargs") Graphic3d_CAspectMarker;
		%feature("autodoc", "	:rtype: None
") Graphic3d_CAspectMarker;
		 Graphic3d_CAspectMarker ();
};


%extend Graphic3d_CAspectMarker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CAspectText;
class Graphic3d_CAspectText {
	public:
		int IsDef;
		int IsSet;
		float Space;
		float Expan;
		CALL_DEF_COLOR Color;
		int Style;
		int DisplayType;
		CALL_DEF_COLOR ColorSubTitle;
		int TextZoomable;
		float TextAngle;
		int TextFontAspect;
		Handle_Graphic3d_ShaderProgram ShaderProgram;
};


%extend Graphic3d_CAspectText {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CBitFields16;
class Graphic3d_CBitFields16 {
	public:
		unsigned bool1;
		unsigned bool2;
		unsigned bool3;
		unsigned bool4;
		unsigned bool5;
		unsigned bool6;
		unsigned bool7;
		unsigned bool8;
		unsigned bool9;
		unsigned bool10;
		unsigned bool11;
		unsigned bool12;
		unsigned bool13;
		unsigned bool14;
		unsigned bool15;
		unsigned bool16;
};


%extend Graphic3d_CBitFields16 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CBitFields20;
class Graphic3d_CBitFields20 {
	public:
		unsigned bool1;
		unsigned bool2;
		unsigned bool3;
		unsigned bool4;
		unsigned bool5;
		unsigned bool6;
		unsigned bool7;
		unsigned bool8;
		unsigned bool9;
		unsigned bool10;
		unsigned bool11;
		unsigned bool12;
		unsigned bool13;
		unsigned bool14;
		unsigned bool15;
		unsigned bool16;
		unsigned bool17;
		unsigned bool18;
		unsigned bool19;
		unsigned bool20;
};


%extend Graphic3d_CBitFields20 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CBitFields4;
class Graphic3d_CBitFields4 {
	public:
		unsigned bool1;
		unsigned bool2;
		unsigned bool3;
		unsigned bool4;
};


%extend Graphic3d_CBitFields4 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CBitFields8;
class Graphic3d_CBitFields8 {
	public:
		unsigned bool1;
		unsigned bool2;
		unsigned bool3;
		unsigned bool4;
		unsigned bool5;
		unsigned bool6;
		unsigned bool7;
		unsigned bool8;
};


%extend Graphic3d_CBitFields8 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CLight;
class Graphic3d_CLight {
	public:
		Graphic3d_Vec4 Color;
		Graphic3d_Vec4 Position;
		Graphic3d_Vec4 Direction;
		Graphic3d_Vec4 Params;
		int Type;
		bool IsHeadlight;
		%feature("compactdefaultargs") ConstAttenuation;
		%feature("autodoc", "	* //!< flag to mark head light Const attenuation factor of positional light source

	:rtype: Standard_ShortReal
") ConstAttenuation;
		Standard_ShortReal ConstAttenuation ();
		%feature("compactdefaultargs") LinearAttenuation;
		%feature("autodoc", "	* Linear attenuation factor of positional light source

	:rtype: Standard_ShortReal
") LinearAttenuation;
		Standard_ShortReal LinearAttenuation ();
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "	* Const, Linear attenuation factors of positional light source

	:rtype: Graphic3d_Vec2
") Attenuation;
		Graphic3d_Vec2 Attenuation ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Angle in radians of the cone created by the spot

	:rtype: Standard_ShortReal
") Angle;
		Standard_ShortReal Angle ();
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "	* Intensity distribution of the spot light, with 0..1 range.

	:rtype: Standard_ShortReal
") Concentration;
		Standard_ShortReal Concentration ();
		%feature("compactdefaultargs") ChangeConstAttenuation;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConstAttenuation;
		Standard_ShortReal & ChangeConstAttenuation ();
		%feature("compactdefaultargs") ChangeLinearAttenuation;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeLinearAttenuation;
		Standard_ShortReal & ChangeLinearAttenuation ();
		%feature("compactdefaultargs") ChangeAttenuation;
		%feature("autodoc", "	:rtype: Graphic3d_Vec2
") ChangeAttenuation;
		Graphic3d_Vec2 & ChangeAttenuation ();
		%feature("compactdefaultargs") ChangeAngle;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeAngle;
		Standard_ShortReal & ChangeAngle ();
		%feature("compactdefaultargs") ChangeConcentration;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConcentration;
		Standard_ShortReal & ChangeConcentration ();
		%feature("compactdefaultargs") Graphic3d_CLight;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Graphic3d_CLight;
		 Graphic3d_CLight ();
};


%extend Graphic3d_CLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CStructure;
class Graphic3d_CStructure : public Standard_Transient {
	public:
		int Id;
		Graphic3d_ZLayerId myZLayer;
		int Priority;
		int PreviousPriority;
		CALL_DEF_CONTEXTLINE ContextLine;
		CALL_DEF_CONTEXTFILLAREA ContextFillArea;
		CALL_DEF_CONTEXTMARKER ContextMarker;
		CALL_DEF_CONTEXTTEXT ContextText;
		CALL_DEF_COLOR HighlightColor;
		float Transformation[16];
		Graphic3d_TypeOfComposition Composition;
		int ContainsFacet;
		Handle_Graphic3d_ViewAffinity ViewAffinity;
		unsigned IsInfinite;
		unsigned stick;
		unsigned highlight;
		unsigned visible;
		unsigned HLRValidation;
		unsigned IsForHighlight;
		unsigned IsMutable;
		unsigned Is2dText;
		CALL_DEF_TRANSFORM_PERSISTENCE TransformPersistence;
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "	* returns graphic driver created this structure

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		Handle_Graphic3d_GraphicDriver GraphicDriver ();
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "	* returns graphic groups

	:rtype: Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "	* returns associated clip planes

	:rtype: Graphic3d_SequenceOfHClipPlane
") ClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & ClipPlanes ();
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Pass clip planes to the associated graphic driver structure

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* returns bounding box of this presentation

	:rtype: Graphic3d_BndBox4f
") BoundingBox;
		const Graphic3d_BndBox4f & BoundingBox ();
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "	* returns bounding box of this presentation without transformation matrix applied

	:rtype: Graphic3d_BndBox4f
") ChangeBoundingBox;
		Graphic3d_BndBox4f & ChangeBoundingBox ();
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Return structure visibility flag

	:rtype: bool
") IsVisible;
		bool IsVisible ();
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set z layer ID to display the structure in specified layer

	:param theLayerIndex:
	:type theLayerIndex: Graphic3d_ZLayerId
	:rtype: None
") SetZLayer;
		void SetZLayer (const Graphic3d_ZLayerId theLayerIndex);
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "	* Get z layer ID

	:rtype: Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer ();
		%feature("compactdefaultargs") OnVisibilityChanged;
		%feature("autodoc", "	* Update structure visibility state

	:rtype: None
") OnVisibilityChanged;
		void OnVisibilityChanged ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear graphic data

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Connect other structure to this one

	:param theStructure:
	:type theStructure: Graphic3d_CStructure &
	:rtype: None
") Connect;
		void Connect (Graphic3d_CStructure & theStructure);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Disconnect other structure to this one

	:param theStructure:
	:type theStructure: Graphic3d_CStructure &
	:rtype: None
") Disconnect;
		void Disconnect (Graphic3d_CStructure & theStructure);
		%feature("compactdefaultargs") UpdateAspects;
		%feature("autodoc", "	* Synchronize structure aspects

	:rtype: None
") UpdateAspects;
		void UpdateAspects ();
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "	* Synchronize structure transformation

	:rtype: None
") UpdateTransformation;
		void UpdateTransformation ();
		%feature("compactdefaultargs") HighlightWithColor;
		%feature("autodoc", "	* Highlight entire structure with color

	:param theColor:
	:type theColor: Graphic3d_Vec3 &
	:param theToCreate:
	:type theToCreate: bool
	:rtype: None
") HighlightWithColor;
		void HighlightWithColor (const Graphic3d_Vec3 & theColor,const Standard_Boolean theToCreate);
		%feature("compactdefaultargs") HighlightWithBndBox;
		%feature("autodoc", "	* Highlight structure using boundary box

	:param theStruct:
	:type theStruct: Handle_Graphic3d_Structure &
	:param theToCreate:
	:type theToCreate: bool
	:rtype: None
") HighlightWithBndBox;
		void HighlightWithBndBox (const Handle_Graphic3d_Structure & theStruct,const Standard_Boolean theToCreate);
		%feature("compactdefaultargs") ShadowLink;
		%feature("autodoc", "	* Create shadow link to this structure

	:param theManager:
	:type theManager: Handle_Graphic3d_StructureManager &
	:rtype: Handle_Graphic3d_CStructure
") ShadowLink;
		Handle_Graphic3d_CStructure ShadowLink (const Handle_Graphic3d_StructureManager & theManager);
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "	* Create new group within this structure

	:param theStruct:
	:type theStruct: Handle_Graphic3d_Structure &
	:rtype: Handle_Graphic3d_Group
") NewGroup;
		Handle_Graphic3d_Group NewGroup (const Handle_Graphic3d_Structure & theStruct);
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "	* Remove group from this structure

	:param theGroup:
	:type theGroup: Handle_Graphic3d_Group &
	:rtype: None
") RemoveGroup;
		void RemoveGroup (const Handle_Graphic3d_Group & theGroup);
};


%extend Graphic3d_CStructure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_CStructure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_CStructure::Handle_Graphic3d_CStructure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_CStructure;
class Handle_Graphic3d_CStructure : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_CStructure();
        Handle_Graphic3d_CStructure(const Handle_Graphic3d_CStructure &aHandle);
        Handle_Graphic3d_CStructure(const Graphic3d_CStructure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_CStructure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_CStructure {
    Graphic3d_CStructure* _get_reference() {
    return (Graphic3d_CStructure*)$self->Access();
    }
};

%extend Handle_Graphic3d_CStructure {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_CStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CTexture;
class Graphic3d_CTexture {
	public:
		Handle_Graphic3d_TextureMap TextureMap;
		int doTextureMap;
		%feature("compactdefaultargs") Graphic3d_CTexture;
		%feature("autodoc", "	:rtype: None
") Graphic3d_CTexture;
		 Graphic3d_CTexture ();
};


%extend Graphic3d_CTexture {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CView;
class Graphic3d_CView {
	public:
		int WsId;
		int ViewId;
		void * ptrView;
		int IsDeleted;
		int IsOpen;
		int Active;
		CALL_DEF_VIEWCONTEXT Context;
		CALL_DEF_WINDOW DefWindow;
		void * ptrUnderLayer;
		void * ptrOverLayer;
		int Backfacing;
		Aspect_RenderingContext GContext;
		void * GClientData;
		void * ptrFBO;
		mutable int WasRedrawnGL;
		Graphic3d_RenderingParams RenderParams;
		bool IsCullingEnabled;
		%feature("compactdefaultargs") Graphic3d_CView;
		%feature("autodoc", "	:rtype: None
") Graphic3d_CView;
		 Graphic3d_CView ();
};


%extend Graphic3d_CView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Camera;
class Graphic3d_Camera : public Standard_Transient {
	public:
/* public enums */
enum Projection {
	Projection_Orthographic = 0,
	Projection_Perspective = 1,
	Projection_Stereo = 2,
	Projection_MonoLeftEye = 3,
	Projection_MonoRightEye = 4,
};

enum FocusType {
	FocusType_Absolute = 0,
	FocusType_Relative = 1,
};

enum IODType {
	IODType_Absolute = 0,
	IODType_Relative = 1,
};

/* end public enums declaration */

		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "	* Default constructor. Initializes camera with the following properties: Eye (0, 0, -2); Center (0, 0, 0); Up (0, 1, 0); Type (Orthographic); FOVy (45); Scale (1000); IsStereo(false); ZNear (0.001); ZFar (3000.0); Aspect(1); ZFocus(1.0); ZFocusType(Relative); IOD(0.05); IODType(Relative)

	:rtype: None
") Graphic3d_Camera;
		 Graphic3d_Camera ();
		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "	* Copy constructor. @param theOther [in] the camera to copy from.

	:param theOther:
	:type theOther: Handle_Graphic3d_Camera &
	:rtype: None
") Graphic3d_Camera;
		 Graphic3d_Camera (const Handle_Graphic3d_Camera & theOther);
		%feature("compactdefaultargs") CopyMappingData;
		%feature("autodoc", "	* Initialize mapping related parameters from other camera handle.

	:param theOtherCamera:
	:type theOtherCamera: Handle_Graphic3d_Camera &
	:rtype: None
") CopyMappingData;
		void CopyMappingData (const Handle_Graphic3d_Camera & theOtherCamera);
		%feature("compactdefaultargs") CopyOrientationData;
		%feature("autodoc", "	* Initialize orientation related parameters from other camera handle.

	:param theOtherCamera:
	:type theOtherCamera: Handle_Graphic3d_Camera &
	:rtype: None
") CopyOrientationData;
		void CopyOrientationData (const Handle_Graphic3d_Camera & theOtherCamera);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copy properties of another camera. @param theOther [in] the camera to copy from.

	:param theOther:
	:type theOther: Handle_Graphic3d_Camera &
	:rtype: None
") Copy;
		void Copy (const Handle_Graphic3d_Camera & theOther);
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "	* @name Public camera properties Sets camera Eye position. @param theEye [in] the location of camera's Eye.

	:param theEye:
	:type theEye: gp_Pnt
	:rtype: None
") SetEye;
		void SetEye (const gp_Pnt & theEye);
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "	* Get camera Eye position. returns camera eye location.

	:rtype: gp_Pnt
") Eye;
		const gp_Pnt  Eye ();
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	* Sets Center of the camera. @param theCenter [in] the point where the camera looks at.

	:param theCenter:
	:type theCenter: gp_Pnt
	:rtype: None
") SetCenter;
		void SetCenter (const gp_Pnt & theCenter);
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Get Center of the camera. returns the point where the camera looks at.

	:rtype: gp_Pnt
") Center;
		const gp_Pnt  Center ();
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "	* Sets camera Up direction vector, orthogonal to camera direction. @param theUp [in] the Up direction vector.

	:param theUp:
	:type theUp: gp_Dir
	:rtype: None
") SetUp;
		void SetUp (const gp_Dir & theUp);
		%feature("compactdefaultargs") OrthogonalizeUp;
		%feature("autodoc", "	* Orthogonalize up direction vector.

	:rtype: None
") OrthogonalizeUp;
		void OrthogonalizeUp ();
		%feature("compactdefaultargs") OrthogonalizedUp;
		%feature("autodoc", "	* Return a copy of orthogonalized up direction vector.

	:rtype: gp_Dir
") OrthogonalizedUp;
		gp_Dir OrthogonalizedUp ();
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "	* Get camera Up direction vector. returns Camera's Up direction vector.

	:rtype: gp_Dir
") Up;
		const gp_Dir  Up ();
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "	* Set camera axial scale. @param theAxialScale [in] the axial scale vector.

	:param theAxialScale:
	:type theAxialScale: gp_XYZ
	:rtype: None
") SetAxialScale;
		void SetAxialScale (const gp_XYZ & theAxialScale);
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "	* Get camera axial scale. returns Camera's axial scale.

	:rtype: gp_XYZ
") AxialScale;
		const gp_XYZ  AxialScale ();
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "	* Set distance of Eye from camera Center. @param theDistance [in] the distance.

	:param theDistance:
	:type theDistance: float
	:rtype: None
") SetDistance;
		void SetDistance (const Standard_Real theDistance);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Get distance of Eye from camera Center. returns the distance.

	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Sets camera look direction. @param theDir [in] the direction.

	:param theDir:
	:type theDir: gp_Dir
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir & theDir);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Get camera look direction. returns camera look direction.

	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Sets camera scale. For orthographic projection the scale factor corresponds to parallel scale of view mapping (i.e. size of viewport). For perspective camera scale is converted to distance. The scale specifies equal size of the view projection in both dimensions assuming that the aspect is 1.0. The projection height and width are specified with the scale and correspondingly multiplied by the aspect. @param theScale [in] the scale factor.

	:param theScale:
	:type theScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real theScale);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Get camera scale. returns camera scale factor.

	:rtype: float
") Scale;
		Standard_Real Scale ();
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "	* Change camera projection type. When switching to perspective projection from orthographic one, the ZNear and ZFar are reset to default values (0.001, 3000.0) if less than 0.0. @param theProjectionType [in] the camera projection type.

	:param theProjection:
	:type theProjection: Projection
	:rtype: None
") SetProjectionType;
		void SetProjectionType (const Projection theProjection);
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "	* returns camera projection type.

	:rtype: Projection
") ProjectionType;
		Projection ProjectionType ();
		%feature("compactdefaultargs") IsOrthographic;
		%feature("autodoc", "	* Check that the camera projection is orthographic. returns boolean flag that indicates whether the camera's projection is orthographic or not.

	:rtype: bool
") IsOrthographic;
		Standard_Boolean IsOrthographic ();
		%feature("compactdefaultargs") IsStereo;
		%feature("autodoc", "	* Check whether the camera projection is stereo. Please note that stereo rendering is now implemented with support of Quad buffering. returns boolean flag indicating whether the stereographic L/R projection is chosen.

	:rtype: bool
") IsStereo;
		Standard_Boolean IsStereo ();
		%feature("compactdefaultargs") SetFOVy;
		%feature("autodoc", "	* Set Field Of View (FOV) in y axis for perspective projection. @param theFOVy [in] the FOV in degrees.

	:param theFOVy:
	:type theFOVy: float
	:rtype: None
") SetFOVy;
		void SetFOVy (const Standard_Real theFOVy);
		%feature("compactdefaultargs") FOVy;
		%feature("autodoc", "	* Get Field Of View (FOV) in y axis. returns the FOV value in degrees.

	:rtype: float
") FOVy;
		Standard_Real FOVy ();
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "	* Change Z-min and Z-max planes of projection volume to match the displayed objects. The methods ensures that view volume will be close by depth range to the displayed objects. Fitting assumes that for orthogonal projection the view volume contains the displayed objects completely. For zoomed perspective view, the view volume is adjusted such that it contains the objects or their parts, located in front of the camera. @param theScaleFactor [in] the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed. @param theMinMax [in] applicative min max boundaries. @param theScaleFactor [in] real graphical boundaries (not accounting infinite flag).

	:param theScaleFactor:
	:type theScaleFactor: float
	:param theMinMax:
	:type theMinMax: Bnd_Box &
	:param theGraphicBB:
	:type theGraphicBB: Bnd_Box &
	:rtype: None
") ZFitAll;
		void ZFitAll (const Standard_Real theScaleFactor,const Bnd_Box & theMinMax,const Bnd_Box & theGraphicBB);
		%feature("compactdefaultargs") SetZRange;
		%feature("autodoc", "	* Change the Near and Far Z-clipping plane positions. For orthographic projection, theZNear, theZFar can be negative or positive. For perspective projection, only positive values are allowed. Program error exception is raised if non-positive values are specified for perspective projection or theZNear >= theZFar. @param theZNear [in] the distance of the plane from the Eye. @param theZFar [in] the distance of the plane from the Eye.

	:param theZNear:
	:type theZNear: float
	:param theZFar:
	:type theZFar: float
	:rtype: None
") SetZRange;
		void SetZRange (const Standard_Real theZNear,const Standard_Real theZFar);
		%feature("compactdefaultargs") ZNear;
		%feature("autodoc", "	* Get the Near Z-clipping plane position. returns the distance of the plane from the Eye.

	:rtype: float
") ZNear;
		Standard_Real ZNear ();
		%feature("compactdefaultargs") ZFar;
		%feature("autodoc", "	* Get the Far Z-clipping plane position. returns the distance of the plane from the Eye.

	:rtype: float
") ZFar;
		Standard_Real ZFar ();
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "	* Changes width / height display ratio. @param theAspect [in] the display ratio.

	:param theAspect:
	:type theAspect: float
	:rtype: None
") SetAspect;
		void SetAspect (const Standard_Real theAspect);
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	* Get camera display ratio. returns display ratio.

	:rtype: float
") Aspect;
		Standard_Real Aspect ();
		%feature("compactdefaultargs") SetZFocus;
		%feature("autodoc", "	* Sets stereographic focus distance. @param theType [in] the focus definition type. Focus can be defined as absolute value or relatively to (as coefficient of) coefficient of camera focal length. @param theZFocus [in] the focus absolute value or coefficient depending on the passed definition type.

	:param theType:
	:type theType: FocusType
	:param theZFocus:
	:type theZFocus: float
	:rtype: None
") SetZFocus;
		void SetZFocus (const FocusType theType,const Standard_Real theZFocus);
		%feature("compactdefaultargs") ZFocus;
		%feature("autodoc", "	* Get stereographic focus value. returns absolute or relative stereographic focus value depending on its definition type.

	:rtype: float
") ZFocus;
		Standard_Real ZFocus ();
		%feature("compactdefaultargs") ZFocusType;
		%feature("autodoc", "	* Get stereographic focus definition type. returns definition type used for stereographic focus.

	:rtype: FocusType
") ZFocusType;
		FocusType ZFocusType ();
		%feature("compactdefaultargs") SetIOD;
		%feature("autodoc", "	* Sets Intraocular distance. @param theType [in] the IOD definition type. IOD can be defined as absolute value or relatively to (as coefficient of) camera focal length. @param theIOD [in] the Intraocular distance.

	:param theType:
	:type theType: IODType
	:param theIOD:
	:type theIOD: float
	:rtype: None
") SetIOD;
		void SetIOD (const IODType theType,const Standard_Real theIOD);
		%feature("compactdefaultargs") IOD;
		%feature("autodoc", "	* Get Intraocular distance value. returns absolute or relative IOD value depending on its definition type.

	:rtype: float
") IOD;
		Standard_Real IOD ();
		%feature("compactdefaultargs") GetIODType;
		%feature("autodoc", "	* Get Intraocular distance definition type. returns definition type used for Intraocular distance.

	:rtype: IODType
") GetIODType;
		IODType GetIODType ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* @name Basic camera operations Transform orientation components of the camera: Eye, Up and Center points. @param theTrsf [in] the transformation to apply.

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & theTrsf);
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "	* Calculate view plane size at center (target) point and distance between ZFar and ZNear planes. returns values in form of gp_Pnt (Width, Height, Depth).

	:rtype: gp_XYZ
") ViewDimensions;
		gp_XYZ ViewDimensions ();
		%feature("compactdefaultargs") Frustum;
		%feature("autodoc", "	* Calculate WCS frustum planes for the camera projection volume. Frustum is a convex volume determined by six planes directing inwards. The frustum planes are usually used as inputs for camera algorithms. Thus, if any changes to projection matrix calculation are necessary, the frustum planes calculation should be also touched. @param theLeft [out] the frustum plane for left side of view. @param theRight [out] the frustum plane for right side of view. @param theBottom [out] the frustum plane for bottom side of view. @param theTop [out] the frustum plane for top side of view. @param theNear [out] the frustum plane for near side of view. @param theFar [out] the frustum plane for far side of view.

	:param theLeft:
	:type theLeft: gp_Pln
	:param theRight:
	:type theRight: gp_Pln
	:param theBottom:
	:type theBottom: gp_Pln
	:param theTop:
	:type theTop: gp_Pln
	:param theNear:
	:type theNear: gp_Pln
	:param theFar:
	:type theFar: gp_Pln
	:rtype: None
") Frustum;
		void Frustum (gp_Pln & theLeft,gp_Pln & theRight,gp_Pln & theBottom,gp_Pln & theTop,gp_Pln & theNear,gp_Pln & theFar);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* @name Projection methods Project point from world coordinate space to normalized device coordinates (mapping). @param thePnt [in] the 3D point in WCS. returns mapped point in NDC.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") Project;
		gp_Pnt Project (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") UnProject;
		%feature("autodoc", "	* Unproject point from normalized device coordinates to world coordinate space. @param thePnt [in] the NDC point. returns 3D point in WCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") UnProject;
		gp_Pnt UnProject (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ConvertView2Proj;
		%feature("autodoc", "	* Convert point from view coordinate space to projection coordinate space. @param thePnt [in] the point in VCS. returns point in NDC.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertView2Proj;
		gp_Pnt ConvertView2Proj (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ConvertProj2View;
		%feature("autodoc", "	* Convert point from projection coordinate space to view coordinate space. @param thePnt [in] the point in NDC. returns point in VCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertProj2View;
		gp_Pnt ConvertProj2View (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ConvertWorld2View;
		%feature("autodoc", "	* Convert point from world coordinate space to view coordinate space. @param thePnt [in] the 3D point in WCS. returns point in VCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertWorld2View;
		gp_Pnt ConvertWorld2View (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ConvertView2World;
		%feature("autodoc", "	* Convert point from view coordinate space to world coordinates. @param thePnt [in] the 3D point in VCS. returns point in WCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertView2World;
		gp_Pnt ConvertView2World (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "	* @name Camera modification state Returns modification state of camera projection matrix

	:rtype: Standard_Size
") ProjectionState;
		Standard_Size ProjectionState ();
		%feature("compactdefaultargs") ModelViewState;
		%feature("autodoc", "	* Returns modification state of camera model-view matrix

	:rtype: Standard_Size
") ModelViewState;
		Standard_Size ModelViewState ();
		%feature("compactdefaultargs") OrientationMatrix;
		%feature("autodoc", "	* @name Lazily-computed orientation and projection matrices derived from camera parameters Get orientation matrix. returns camera orientation matrix.

	:rtype: Graphic3d_Mat4d
") OrientationMatrix;
		const Graphic3d_Mat4d & OrientationMatrix ();
		%feature("compactdefaultargs") OrientationMatrixF;
		%feature("autodoc", "	* Get orientation matrix of Standard_ShortReal precision. returns camera orientation matrix.

	:rtype: Graphic3d_Mat4
") OrientationMatrixF;
		const Graphic3d_Mat4 & OrientationMatrixF ();
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "	* Get monographic or middle point projection matrix used for monographic rendering and for point projection / unprojection. returns monographic projection matrix.

	:rtype: Graphic3d_Mat4d
") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix ();
		%feature("compactdefaultargs") ProjectionMatrixF;
		%feature("autodoc", "	* Get monographic or middle point projection matrix of Standard_ShortReal precision used for monographic rendering and for point projection / unprojection. returns monographic projection matrix.

	:rtype: Graphic3d_Mat4
") ProjectionMatrixF;
		const Graphic3d_Mat4 & ProjectionMatrixF ();
		%feature("compactdefaultargs") ProjectionStereoLeft;
		%feature("autodoc", "	* returns stereographic matrix computed for left eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.

	:rtype: Graphic3d_Mat4d
") ProjectionStereoLeft;
		const Graphic3d_Mat4d & ProjectionStereoLeft ();
		%feature("compactdefaultargs") ProjectionStereoLeftF;
		%feature("autodoc", "	* returns stereographic matrix of Standard_ShortReal precision computed for left eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.

	:rtype: Graphic3d_Mat4
") ProjectionStereoLeftF;
		const Graphic3d_Mat4 & ProjectionStereoLeftF ();
		%feature("compactdefaultargs") ProjectionStereoRight;
		%feature("autodoc", "	* returns stereographic matrix computed for right eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.

	:rtype: Graphic3d_Mat4d
") ProjectionStereoRight;
		const Graphic3d_Mat4d & ProjectionStereoRight ();
		%feature("compactdefaultargs") ProjectionStereoRightF;
		%feature("autodoc", "	* returns stereographic matrix of Standard_ShortReal precision computed for right eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.

	:rtype: Graphic3d_Mat4
") ProjectionStereoRightF;
		const Graphic3d_Mat4 & ProjectionStereoRightF ();
		%feature("compactdefaultargs") InvalidateProjection;
		%feature("autodoc", "	* Invalidate state of projection matrix. The matrix will be updated on request.

	:rtype: None
") InvalidateProjection;
		void InvalidateProjection ();
		%feature("compactdefaultargs") InvalidateOrientation;
		%feature("autodoc", "	* Invalidate orientation matrix. The matrix will be updated on request.

	:rtype: None
") InvalidateOrientation;
		void InvalidateOrientation ();
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	:param :
	:type : Graphic3d_Camera
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (Graphic3d_Camera );
};


%extend Graphic3d_Camera {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Camera(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Camera::Handle_Graphic3d_Camera %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Camera;
class Handle_Graphic3d_Camera : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_Camera();
        Handle_Graphic3d_Camera(const Handle_Graphic3d_Camera &aHandle);
        Handle_Graphic3d_Camera(const Graphic3d_Camera *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Camera DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Camera {
    Graphic3d_Camera* _get_reference() {
    return (Graphic3d_Camera*)$self->Access();
    }
};

%extend Handle_Graphic3d_Camera {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Camera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ClipPlane;
class Graphic3d_ClipPlane : public Standard_Transient {
	public:
typedef NCollection_Vec4 <Standard_Real> Equation;
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "	* Default constructor. Initializes clip plane container with the following properties: - Equation (0.0, 0.0, 1.0, 0) - IsOn (True), - IsCapping (False), - Material (Graphic3d_NOM_DEFAULT), - Texture (NULL), - HatchStyle (Aspect_HS_HORIZONTAL), - IsHatchOn (False)

	:rtype: None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane ();
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "	* Copy constructor. @param theOther [in] the copied plane.

	:param theOther:
	:type theOther: Graphic3d_ClipPlane &
	:rtype: None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane (const Graphic3d_ClipPlane & theOther);
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "	* Construct clip plane for the passed equation. By default the plane is on, capping is turned off. @param theEquation [in] the plane equation.

	:param theEquation:
	:type theEquation: Equation &
	:rtype: None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane (const Equation & theEquation);
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "	* Construct clip plane from the passed geometrical definition. By default the plane is on, capping is turned off. @param thePlane [in] the plane.

	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane (const gp_Pln & thePlane);
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "	* Set plane equation by its geometrical definition. The equation is specified in 'world' coordinate system. @param thePlane [in] the plane.

	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None
") SetEquation;
		void SetEquation (const gp_Pln & thePlane);
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "	* Set 4-component equation vector for clipping plane. The equation is specified in 'world' coordinate system. @param theEquation [in] the XYZW (or 'ABCD') equation vector.

	:param theEquation:
	:type theEquation: Equation &
	:rtype: None
") SetEquation;
		void SetEquation (const Equation & theEquation);
		%feature("compactdefaultargs") GetEquation;
		%feature("autodoc", "	* Get 4-component equation vector for clipping plane. returns clipping plane equation vector.

	:rtype: Equation
") GetEquation;
		const Equation & GetEquation ();
		%feature("compactdefaultargs") IsOn;
		%feature("autodoc", "	* Check that the clipping plane is turned on. returns boolean flag indicating whether the plane is in on or off state.

	:rtype: bool
") IsOn;
		Standard_Boolean IsOn ();
		%feature("compactdefaultargs") SetOn;
		%feature("autodoc", "	* Change state of the clipping plane. @param theIsOn [in] the flag specifying whether the graphic driver clipping by this plane should be turned on or off.

	:param theIsOn:
	:type theIsOn: bool
	:rtype: None
") SetOn;
		void SetOn (const Standard_Boolean theIsOn);
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "	* Change state of capping surface rendering. @param theIsOn [in] the flag specifying whether the graphic driver should perform rendering of capping surface produced by this plane. The graphic driver produces this surface for convex graphics by means of stencil-test and multi-pass rendering.

	:param theIsOn:
	:type theIsOn: bool
	:rtype: None
") SetCapping;
		void SetCapping (const Standard_Boolean theIsOn);
		%feature("compactdefaultargs") IsCapping;
		%feature("autodoc", "	* Check state of capping surface rendering. returns true (turned on) or false depending on the state.

	:rtype: bool
") IsCapping;
		Standard_Boolean IsCapping ();
		%feature("compactdefaultargs") ToPlane;
		%feature("autodoc", "	* Get geometrical definition. The plane is built up from the equation clipping plane equation vector. returns geometrical definition of clipping plane.

	:rtype: gp_Pln
") ToPlane;
		gp_Pln ToPlane ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* Clone plane. Virtual method to simplify copying procedure if plane class is redefined at application level to add specific fields to it e.g. id, name, etc. returns new instance of clipping plane with same properties and attributes.

	:rtype: Handle_Graphic3d_ClipPlane
") Clone;
		virtual Handle_Graphic3d_ClipPlane Clone ();
		%feature("compactdefaultargs") SetCappingMaterial;
		%feature("autodoc", "	* Set material for rendering capping surface. @param theMat [in] the material.

	:param theMat:
	:type theMat: Graphic3d_MaterialAspect &
	:rtype: None
") SetCappingMaterial;
		void SetCappingMaterial (const Graphic3d_MaterialAspect & theMat);
		%feature("compactdefaultargs") CappingMaterial;
		%feature("autodoc", "	* returns capping material.

	:rtype: Graphic3d_MaterialAspect
") CappingMaterial;
		const Graphic3d_MaterialAspect & CappingMaterial ();
		%feature("compactdefaultargs") SetCappingTexture;
		%feature("autodoc", "	* Set texture to be applied on capping surface. @param theTexture [in] the texture.

	:param theTexture:
	:type theTexture: Handle_Graphic3d_TextureMap &
	:rtype: None
") SetCappingTexture;
		void SetCappingTexture (const Handle_Graphic3d_TextureMap & theTexture);
		%feature("compactdefaultargs") CappingTexture;
		%feature("autodoc", "	* returns capping texture map.

	:rtype: Handle_Graphic3d_TextureMap
") CappingTexture;
		Handle_Graphic3d_TextureMap CappingTexture ();
		%feature("compactdefaultargs") SetCappingHatch;
		%feature("autodoc", "	* Set hatch style (stipple) and turn hatching on. @param theStyle [in] the hatch style.

	:param theStyle:
	:type theStyle: Aspect_HatchStyle
	:rtype: None
") SetCappingHatch;
		void SetCappingHatch (const Aspect_HatchStyle theStyle);
		%feature("compactdefaultargs") CappingHatch;
		%feature("autodoc", "	* returns hatching style.

	:rtype: Aspect_HatchStyle
") CappingHatch;
		Aspect_HatchStyle CappingHatch ();
		%feature("compactdefaultargs") SetCappingHatchOn;
		%feature("autodoc", "	* Turn on hatching.

	:rtype: None
") SetCappingHatchOn;
		void SetCappingHatchOn ();
		%feature("compactdefaultargs") SetCappingHatchOff;
		%feature("autodoc", "	* Turn off hatching.

	:rtype: None
") SetCappingHatchOff;
		void SetCappingHatchOff ();
		%feature("compactdefaultargs") IsHatchOn;
		%feature("autodoc", "	* returns True if hatching mask is turned on.

	:rtype: bool
") IsHatchOn;
		Standard_Boolean IsHatchOn ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* This ID is used for managing associated resources in graphical driver. The clip plane can be assigned within a range of IO which can be displayed in separate OpenGl contexts. For each of the context an associated OpenGl resource for graphical aspects should be created and kept. The resources are stored in graphical driver for each of individual groups of shared context under the clip plane identifier. returns clip plane resource identifier string.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") CappingAspect;
		%feature("autodoc", "	* Compute and return capping aspect from the graphical attributes. returns capping surface rendering aspect.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") CappingAspect;
		Handle_Graphic3d_AspectFillArea3d CappingAspect ();
		%feature("compactdefaultargs") MCountEquation;
		%feature("autodoc", "	* returns modification counter for equation.

	:rtype: unsigned int
") MCountEquation;
		unsigned int MCountEquation ();
		%feature("compactdefaultargs") MCountAspect;
		%feature("autodoc", "	* returns modification counter for aspect.

	:rtype: unsigned int
") MCountAspect;
		unsigned int MCountAspect ();
		%feature("compactdefaultargs") DEFINE_STANDARD_RTTI;
		%feature("autodoc", "	* //!< Modification counter of aspect.

	:param :
	:type : Graphic3d_ClipPlane
	:rtype: None
") DEFINE_STANDARD_RTTI;
		 DEFINE_STANDARD_RTTI (Graphic3d_ClipPlane );
};


%extend Graphic3d_ClipPlane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ClipPlane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ClipPlane::Handle_Graphic3d_ClipPlane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ClipPlane;
class Handle_Graphic3d_ClipPlane : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_ClipPlane();
        Handle_Graphic3d_ClipPlane(const Handle_Graphic3d_ClipPlane &aHandle);
        Handle_Graphic3d_ClipPlane(const Graphic3d_ClipPlane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ClipPlane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ClipPlane {
    Graphic3d_ClipPlane* _get_reference() {
    return (Graphic3d_ClipPlane*)$self->Access();
    }
};

%extend Handle_Graphic3d_ClipPlane {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ClipPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_DataStructureManager;
class Graphic3d_DataStructureManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Deletes the manager <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
};


%extend Graphic3d_DataStructureManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_DataStructureManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_DataStructureManager::Handle_Graphic3d_DataStructureManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_DataStructureManager;
class Handle_Graphic3d_DataStructureManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_DataStructureManager();
        Handle_Graphic3d_DataStructureManager(const Handle_Graphic3d_DataStructureManager &aHandle);
        Handle_Graphic3d_DataStructureManager(const Graphic3d_DataStructureManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_DataStructureManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_DataStructureManager {
    Graphic3d_DataStructureManager* _get_reference() {
    return (Graphic3d_DataStructureManager*)$self->Access();
    }
};

%extend Handle_Graphic3d_DataStructureManager {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_DataStructureManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_GraduatedTrihedron;
class Graphic3d_GraduatedTrihedron {
	public:
		Visual3d_View * PtrVisual3dView;
		%feature("compactdefaultargs") Graphic3d_GraduatedTrihedron;
		%feature("autodoc", "	* Default constructor Constructs the default graduated trihedron with grid, X, Y, Z axes, and tickmarks

	:param theNamesFont: default value is 'Arial'
	:type theNamesFont: TCollection_AsciiString &
	:param theNamesStyle: default value is Font_FA_Bold
	:type theNamesStyle: Font_FontAspect &
	:param theNamesSize: default value is 12
	:type theNamesSize: int
	:param theValuesFont: default value is 'Arial'
	:type theValuesFont: TCollection_AsciiString &
	:param theValuesStyle: default value is Font_FA_Regular
	:type theValuesStyle: Font_FontAspect &
	:param theValuesSize: default value is 12
	:type theValuesSize: int
	:param theArrowsLength: default value is 30.0f
	:type theArrowsLength: Standard_ShortReal
	:param theGridColor: default value is Quantity_NOC_WHITE
	:type theGridColor: Quantity_Color
	:param theToDrawGrid: default value is Standard_True
	:type theToDrawGrid: bool
	:param theToDrawAxes: default value is Standard_True
	:type theToDrawAxes: bool
	:rtype: None
") Graphic3d_GraduatedTrihedron;
		 Graphic3d_GraduatedTrihedron (const TCollection_AsciiString & theNamesFont = "Arial",const Font_FontAspect & theNamesStyle = Font_FA_Bold,const Standard_Integer theNamesSize = 12,const TCollection_AsciiString & theValuesFont = "Arial",const Font_FontAspect & theValuesStyle = Font_FA_Regular,const Standard_Integer theValuesSize = 12,const Standard_ShortReal theArrowsLength = 30.0f,const Quantity_Color theGridColor = Quantity_NOC_WHITE,const Standard_Boolean theToDrawGrid = Standard_True,const Standard_Boolean theToDrawAxes = Standard_True);
		%feature("compactdefaultargs") ChangeXAxisAspect;
		%feature("autodoc", "	:rtype: Graphic3d_AxisAspect
") ChangeXAxisAspect;
		Graphic3d_AxisAspect & ChangeXAxisAspect ();
		%feature("compactdefaultargs") ChangeYAxisAspect;
		%feature("autodoc", "	:rtype: Graphic3d_AxisAspect
") ChangeYAxisAspect;
		Graphic3d_AxisAspect & ChangeYAxisAspect ();
		%feature("compactdefaultargs") ChangeZAxisAspect;
		%feature("autodoc", "	:rtype: Graphic3d_AxisAspect
") ChangeZAxisAspect;
		Graphic3d_AxisAspect & ChangeZAxisAspect ();
		%feature("compactdefaultargs") ChangeAxisAspect;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: Graphic3d_AxisAspect
") ChangeAxisAspect;
		Graphic3d_AxisAspect & ChangeAxisAspect (const Standard_Integer theIndex);
		%feature("compactdefaultargs") XAxisAspect;
		%feature("autodoc", "	:rtype: Graphic3d_AxisAspect
") XAxisAspect;
		const Graphic3d_AxisAspect & XAxisAspect ();
		%feature("compactdefaultargs") YAxisAspect;
		%feature("autodoc", "	:rtype: Graphic3d_AxisAspect
") YAxisAspect;
		const Graphic3d_AxisAspect & YAxisAspect ();
		%feature("compactdefaultargs") ZAxisAspect;
		%feature("autodoc", "	:rtype: Graphic3d_AxisAspect
") ZAxisAspect;
		const Graphic3d_AxisAspect & ZAxisAspect ();
		%feature("compactdefaultargs") AxisAspect;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: Graphic3d_AxisAspect
") AxisAspect;
		const Graphic3d_AxisAspect & AxisAspect (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ArrowsLength;
		const Standard_ShortReal ArrowsLength ();
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetArrowsLength;
		void SetArrowsLength (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") GridColor;
		%feature("autodoc", "	:rtype: Quantity_Color
") GridColor;
		const Quantity_Color & GridColor ();
		%feature("compactdefaultargs") SetGridColor;
		%feature("autodoc", "	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetGridColor;
		void SetGridColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") ToDrawGrid;
		%feature("autodoc", "	:rtype: bool
") ToDrawGrid;
		const Standard_Boolean ToDrawGrid ();
		%feature("compactdefaultargs") SetDrawGrid;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawGrid;
		void SetDrawGrid (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", "	:rtype: bool
") ToDrawAxes;
		const Standard_Boolean ToDrawAxes ();
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawAxes;
		void SetDrawAxes (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") NamesFont;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") NamesFont;
		const TCollection_AsciiString & NamesFont ();
		%feature("compactdefaultargs") SetNamesFont;
		%feature("autodoc", "	:param theFont:
	:type theFont: TCollection_AsciiString &
	:rtype: None
") SetNamesFont;
		void SetNamesFont (const TCollection_AsciiString & theFont);
		%feature("compactdefaultargs") NamesFontAspect;
		%feature("autodoc", "	:rtype: Font_FontAspect
") NamesFontAspect;
		Font_FontAspect NamesFontAspect ();
		%feature("compactdefaultargs") SetNamesFontAspect;
		%feature("autodoc", "	:param theAspect:
	:type theAspect: Font_FontAspect
	:rtype: None
") SetNamesFontAspect;
		void SetNamesFontAspect (Font_FontAspect theAspect);
		%feature("compactdefaultargs") NamesSize;
		%feature("autodoc", "	:rtype: int
") NamesSize;
		const Standard_Integer NamesSize ();
		%feature("compactdefaultargs") SetNamesSize;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetNamesSize;
		void SetNamesSize (const Standard_Integer theValue);
		%feature("compactdefaultargs") ValuesFont;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ValuesFont;
		const TCollection_AsciiString & ValuesFont ();
		%feature("compactdefaultargs") SetValuesFont;
		%feature("autodoc", "	:param theFont:
	:type theFont: TCollection_AsciiString &
	:rtype: None
") SetValuesFont;
		void SetValuesFont (const TCollection_AsciiString & theFont);
		%feature("compactdefaultargs") ValuesFontAspect;
		%feature("autodoc", "	:rtype: Font_FontAspect
") ValuesFontAspect;
		Font_FontAspect ValuesFontAspect ();
		%feature("compactdefaultargs") SetValuesFontAspect;
		%feature("autodoc", "	:param theAspect:
	:type theAspect: Font_FontAspect
	:rtype: None
") SetValuesFontAspect;
		void SetValuesFontAspect (Font_FontAspect theAspect);
		%feature("compactdefaultargs") ValuesSize;
		%feature("autodoc", "	:rtype: int
") ValuesSize;
		const Standard_Integer ValuesSize ();
		%feature("compactdefaultargs") SetValuesSize;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetValuesSize;
		void SetValuesSize (const Standard_Integer theValue);
};


%extend Graphic3d_GraduatedTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_GraphicDriver;
class Graphic3d_GraphicDriver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") InquireLightLimit;
		%feature("autodoc", "	* call_togl_inquirelight

	:rtype: int
") InquireLightLimit;
		virtual Standard_Integer InquireLightLimit ();
		%feature("compactdefaultargs") InquirePlaneLimit;
		%feature("autodoc", "	* call_togl_inquireplane

	:rtype: int
") InquirePlaneLimit;
		virtual Standard_Integer InquirePlaneLimit ();
		%feature("compactdefaultargs") InquireViewLimit;
		%feature("autodoc", "	* call_togl_inquireview

	:rtype: int
") InquireViewLimit;
		virtual Standard_Integer InquireViewLimit ();
		%feature("compactdefaultargs") DisplayStructure;
		%feature("autodoc", "	* call_togl_displaystructure

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param thePriority:
	:type thePriority: int
	:rtype: void
") DisplayStructure;
		virtual void DisplayStructure (const Graphic3d_CView & theCView,const Handle_Graphic3d_Structure & theStructure,const Standard_Integer thePriority);
		%feature("compactdefaultargs") EraseStructure;
		%feature("autodoc", "	* call_togl_erasestructure

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: void
") EraseStructure;
		virtual void EraseStructure (const Graphic3d_CView & theCView,const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") RemoveStructure;
		%feature("autodoc", "	* call_togl_removestructure

	:param theCStructure:
	:type theCStructure: Handle_Graphic3d_CStructure &
	:rtype: void
") RemoveStructure;
		virtual void RemoveStructure (Handle_Graphic3d_CStructure & theCStructure);
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "	* Creates new empty graphic structure

	:param theManager:
	:type theManager: Handle_Graphic3d_StructureManager &
	:rtype: Handle_Graphic3d_CStructure
") Structure;
		virtual Handle_Graphic3d_CStructure Structure (const Handle_Graphic3d_StructureManager & theManager);
		%feature("compactdefaultargs") ActivateView;
		%feature("autodoc", "	* call_togl_activateview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") ActivateView;
		virtual void ActivateView (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") AntiAliasing;
		%feature("autodoc", "	* call_togl_antialiasing

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") AntiAliasing;
		virtual void AntiAliasing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "	* call_togl_background

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") Background;
		virtual void Background (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* call_togl_gradient_background

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AColor1:
	:type AColor1: Quantity_Color &
	:param AColor2:
	:type AColor2: Quantity_Color &
	:param FillStyle:
	:type FillStyle: Aspect_GradientFillMethod
	:rtype: void
") GradientBackground;
		virtual void GradientBackground (const Graphic3d_CView & ACView,const Quantity_Color & AColor1,const Quantity_Color & AColor2,const Aspect_GradientFillMethod FillStyle);
		%feature("compactdefaultargs") BackgroundImage;
		%feature("autodoc", "	:param FileName:
	:type FileName: char *
	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:rtype: void
") BackgroundImage;
		virtual void BackgroundImage (const char * FileName,const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_FillMethod
	:rtype: void
") SetBgImageStyle;
		virtual void SetBgImageStyle (const Graphic3d_CView & ACView,const Aspect_FillMethod FillStyle);
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param FillStyle:
	:type FillStyle: Aspect_GradientFillMethod
	:rtype: void
") SetBgGradientStyle;
		virtual void SetBgGradientStyle (const Graphic3d_CView & ACView,const Aspect_GradientFillMethod FillStyle);
		%feature("compactdefaultargs") ClipLimit;
		%feature("autodoc", "	* call_togl_cliplimit

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AWait:
	:type AWait: bool
	:rtype: void
") ClipLimit;
		virtual void ClipLimit (const Graphic3d_CView & ACView,const Standard_Boolean AWait);
		%feature("compactdefaultargs") DeactivateView;
		%feature("autodoc", "	* call_togl_deactivateview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") DeactivateView;
		virtual void DeactivateView (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") DepthCueing;
		%feature("autodoc", "	* call_togl_cliplimit

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AFlag:
	:type AFlag: bool
	:rtype: void
") DepthCueing;
		virtual void DepthCueing (const Graphic3d_CView & ACView,const Standard_Boolean AFlag);
		%feature("compactdefaultargs") RatioWindow;
		%feature("autodoc", "	* call_togl_ratio_window

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") RatioWindow;
		virtual void RatioWindow (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redraw content of the view

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theCUnderLayer:
	:type theCUnderLayer: Aspect_CLayer2d &
	:param theCOverLayer:
	:type theCOverLayer: Aspect_CLayer2d &
	:param theX: default value is 0
	:type theX: int
	:param theY: default value is 0
	:type theY: int
	:param theWidth: default value is 0
	:type theWidth: int
	:param theHeight: default value is 0
	:type theHeight: int
	:rtype: void
") Redraw;
		virtual void Redraw (const Graphic3d_CView & theCView,const Aspect_CLayer2d & theCUnderLayer,const Aspect_CLayer2d & theCOverLayer,const Standard_Integer theX = 0,const Standard_Integer theY = 0,const Standard_Integer theWidth = 0,const Standard_Integer theHeight = 0);
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Redraw layer of immediate presentations

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theCUnderLayer:
	:type theCUnderLayer: Aspect_CLayer2d &
	:param theCOverLayer:
	:type theCOverLayer: Aspect_CLayer2d &
	:rtype: void
") RedrawImmediate;
		virtual void RedrawImmediate (const Graphic3d_CView & theCView,const Aspect_CLayer2d & theCUnderLayer,const Aspect_CLayer2d & theCOverLayer);
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Invalidates content of the view but does not redraw it

	:param theCView:
	:type theCView: Graphic3d_CView &
	:rtype: void
") Invalidate;
		virtual void Invalidate (const Graphic3d_CView & theCView);
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "	* call_togl_removeview

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") RemoveView;
		virtual void RemoveView (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") SetLight;
		%feature("autodoc", "	* call_togl_setlight

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") SetLight;
		virtual void SetLight (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Pass clip planes to the associated graphic driver view.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:rtype: void
") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_CView & theCView);
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	* Inform graphic driver if camera assigned to view changes.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:rtype: void
") SetCamera;
		virtual void SetCamera (const Graphic3d_CView & theCView);
		%feature("compactdefaultargs") SetVisualisation;
		%feature("autodoc", "	* call_togl_setvisualisation

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") SetVisualisation;
		virtual void SetVisualisation (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") View;
		%feature("autodoc", "	* call_togl_view

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: bool
") View;
		virtual Standard_Boolean View (Graphic3d_CView & ACView);
		%feature("compactdefaultargs") Environment;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") Environment;
		virtual void Environment (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") EnableVBO;
		%feature("autodoc", "	* enables/disables usage of OpenGL vertex buffer arrays while drawing primitiev arrays

	:param status:
	:type status: bool
	:rtype: void
") EnableVBO;
		virtual void EnableVBO (const Standard_Boolean status);
		%feature("compactdefaultargs") MemoryInfo;
		%feature("autodoc", "	* Returns information about GPU memory usage.

	:param theFreeBytes:
	:type theFreeBytes: Standard_Size &
	:param theInfo:
	:type theInfo: TCollection_AsciiString &
	:rtype: bool
") MemoryInfo;
		virtual Standard_Boolean MemoryInfo (Standard_Size & theFreeBytes,TCollection_AsciiString & theInfo);
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "	* call_togl_ztriedron_setup

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param XColor: default value is Quantity_NOC_RED
	:type XColor: Quantity_NameOfColor
	:param YColor: default value is Quantity_NOC_GREEN
	:type YColor: Quantity_NameOfColor
	:param ZColor: default value is Quantity_NOC_BLUE1
	:type ZColor: Quantity_NameOfColor
	:param SizeRatio: default value is 0.8
	:type SizeRatio: float
	:param AxisDiametr: default value is 0.05
	:type AxisDiametr: float
	:param NbFacettes: default value is 12
	:type NbFacettes: int
	:rtype: void
") ZBufferTriedronSetup;
		virtual void ZBufferTriedronSetup (const Graphic3d_CView & theCView,const Quantity_NameOfColor XColor = Quantity_NOC_RED,const Quantity_NameOfColor YColor = Quantity_NOC_GREEN,const Quantity_NameOfColor ZColor = Quantity_NOC_BLUE1,const Standard_Real SizeRatio = 0.8,const Standard_Real AxisDiametr = 0.05,const Standard_Integer NbFacettes = 12);
		%feature("compactdefaultargs") TriedronDisplay;
		%feature("autodoc", "	* call_togl_triedron_display

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param APosition: default value is Aspect_TOTP_CENTER
	:type APosition: Aspect_TypeOfTriedronPosition
	:param AColor: default value is Quantity_NOC_WHITE
	:type AColor: Quantity_NameOfColor
	:param AScale: default value is 0.02
	:type AScale: float
	:param AsWireframe: default value is Standard_True
	:type AsWireframe: bool
	:rtype: void
") TriedronDisplay;
		virtual void TriedronDisplay (const Graphic3d_CView & ACView,const Aspect_TypeOfTriedronPosition APosition = Aspect_TOTP_CENTER,const Quantity_NameOfColor AColor = Quantity_NOC_WHITE,const Standard_Real AScale = 0.02,const Standard_Boolean AsWireframe = Standard_True);
		%feature("compactdefaultargs") TriedronErase;
		%feature("autodoc", "	* call_togl_triedron_erase

	:param ACView:
	:type ACView: Graphic3d_CView &
	:rtype: void
") TriedronErase;
		virtual void TriedronErase (const Graphic3d_CView & ACView);
		%feature("compactdefaultargs") TriedronEcho;
		%feature("autodoc", "	* call_togl_triedron_echo

	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AType: default value is Aspect_TOTE_NONE
	:type AType: Aspect_TypeOfTriedronEcho
	:rtype: void
") TriedronEcho;
		virtual void TriedronEcho (const Graphic3d_CView & ACView,const Aspect_TypeOfTriedronEcho AType = Aspect_TOTE_NONE);
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "	* call_togl_graduatedtrihedron_display

	:param theView:
	:type theView: Graphic3d_CView &
	:param theCubic:
	:type theCubic: Graphic3d_GraduatedTrihedron &
	:rtype: void
") GraduatedTrihedronDisplay;
		virtual void GraduatedTrihedronDisplay (const Graphic3d_CView & theView,const Graphic3d_GraduatedTrihedron & theCubic);
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "	* call_togl_graduatedtrihedron_erase

	:param theView:
	:type theView: Graphic3d_CView &
	:rtype: void
") GraduatedTrihedronErase;
		virtual void GraduatedTrihedronErase (const Graphic3d_CView & theView);
		%feature("compactdefaultargs") GraduatedTrihedronMinMaxValues;
		%feature("autodoc", "	* Sets minimum and maximum points of scene bounding box for Graduated Trihedron stored in graphic view object. @param theView [in] current graphic view @param theMin [in] the minimum point of scene. @param theMax [in] the maximum point of scene.

	:param theView:
	:type theView: Graphic3d_CView &
	:param theMin:
	:type theMin: Graphic3d_Vec3
	:param theMax:
	:type theMax: Graphic3d_Vec3
	:rtype: void
") GraduatedTrihedronMinMaxValues;
		virtual void GraduatedTrihedronMinMaxValues (const Graphic3d_CView & theView,const Graphic3d_Vec3 theMin,const Graphic3d_Vec3 theMax);
		%feature("compactdefaultargs") SetImmediateModeDrawToFront;
		%feature("autodoc", "	* @param theDrawToFrontBuffer Advanced option to modify rendering mode: 1. True. Drawing immediate mode structures directly to the front buffer over the scene image. Fast, so preferred for interactive work (used by default). However these extra drawings will be missed in image dump since it is performed from back buffer. Notice that since no pre-buffering used the V-Sync will be ignored and rendering could be seen in run-time (in case of slow hardware) and/or tearing may appear. So this is strongly recommended to draw only simple (fast) structures. 2. False. Drawing immediate mode structures to the back buffer. The complete scene is redrawn first, so this mode is slower if scene contains complex data and/or V-Sync is turned on. But it works in any case and is especially useful for view dump because the dump image is read from the back buffer. returns previous mode.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theDrawToFrontBuffer:
	:type theDrawToFrontBuffer: bool
	:rtype: bool
") SetImmediateModeDrawToFront;
		virtual Standard_Boolean SetImmediateModeDrawToFront (const Graphic3d_CView & theCView,const Standard_Boolean theDrawToFrontBuffer);
		%feature("compactdefaultargs") DisplayImmediateStructure;
		%feature("autodoc", "	* Display structure in immediate mode on top of general presentation

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: void
") DisplayImmediateStructure;
		virtual void DisplayImmediateStructure (const Graphic3d_CView & theCView,const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") EraseImmediateStructure;
		%feature("autodoc", "	* Erases immediate structure

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:rtype: void
") EraseImmediateStructure;
		virtual void EraseImmediateStructure (const Graphic3d_CView & theCView,const Graphic3d_CStructure & theCStructure);
		%feature("compactdefaultargs") Layer;
		%feature("autodoc", "	* call_togl_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") Layer;
		virtual void Layer (Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") RemoveLayer;
		%feature("autodoc", "	* call_togl_removelayer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") RemoveLayer;
		virtual void RemoveLayer (const Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") BeginLayer;
		%feature("autodoc", "	* call_togl_begin_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") BeginLayer;
		virtual void BeginLayer (const Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") BeginPolygon2d;
		%feature("autodoc", "	* call_togl_begin_polygon2d

	:rtype: void
") BeginPolygon2d;
		virtual void BeginPolygon2d ();
		%feature("compactdefaultargs") BeginPolyline2d;
		%feature("autodoc", "	* call_togl_begin_polyline2d

	:rtype: void
") BeginPolyline2d;
		virtual void BeginPolyline2d ();
		%feature("compactdefaultargs") ClearLayer;
		%feature("autodoc", "	* call_togl_clear_layer2d

	:param ACLayer:
	:type ACLayer: Aspect_CLayer2d &
	:rtype: void
") ClearLayer;
		virtual void ClearLayer (const Aspect_CLayer2d & ACLayer);
		%feature("compactdefaultargs") Draw;
		%feature("autodoc", "	* call_togl_draw2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Draw;
		virtual void Draw (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* call_togl_edge2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Edge;
		virtual void Edge (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("compactdefaultargs") EndLayer;
		%feature("autodoc", "	* call_togl_end_layer2d

	:rtype: void
") EndLayer;
		virtual void EndLayer ();
		%feature("compactdefaultargs") EndPolygon2d;
		%feature("autodoc", "	* call_togl_end_polygon2d

	:rtype: void
") EndPolygon2d;
		virtual void EndPolygon2d ();
		%feature("compactdefaultargs") EndPolyline2d;
		%feature("autodoc", "	* call_togl_end_polyline2d

	:rtype: void
") EndPolyline2d;
		virtual void EndPolyline2d ();
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* call_togl_move2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:rtype: void
") Move;
		virtual void Move (const Standard_ShortReal X,const Standard_ShortReal Y);
		%feature("compactdefaultargs") Rectangle;
		%feature("autodoc", "	* call_togl_rectangle2d

	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param Width:
	:type Width: Standard_ShortReal
	:param Height:
	:type Height: Standard_ShortReal
	:rtype: void
") Rectangle;
		virtual void Rectangle (const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal Width,const Standard_ShortReal Height);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* call_togl_set_color

	:param R:
	:type R: Standard_ShortReal
	:param G:
	:type G: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:rtype: void
") SetColor;
		virtual void SetColor (const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* call_togl_set_transparency

	:param ATransparency:
	:type ATransparency: Standard_ShortReal
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_ShortReal ATransparency);
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "	* call_togl_unset_transparency

	:rtype: void
") UnsetTransparency;
		virtual void UnsetTransparency ();
		%feature("compactdefaultargs") SetLineAttributes;
		%feature("autodoc", "	* call_togl_set_line_attributes

	:param Type:
	:type Type: int
	:param Width:
	:type Width: Standard_ShortReal
	:rtype: void
") SetLineAttributes;
		virtual void SetLineAttributes (const Standard_Integer Type,const Standard_ShortReal Width);
		%feature("compactdefaultargs") SetTextAttributes;
		%feature("autodoc", "	* Set text attributes for under-/overlayer. <Font> argument defines the name of the font to be used, <Type> argument defines the display type of the text, <R> <G> <B> values define the color of decal or subtitle background. To set the color of the text you can use the SetColor method.

	:param Font:
	:type Font: char *
	:param Type:
	:type Type: int
	:param R:
	:type R: Standard_ShortReal
	:param G:
	:type G: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:rtype: void
") SetTextAttributes;
		virtual void SetTextAttributes (const char * Font,const Standard_Integer Type,const Standard_ShortReal R,const Standard_ShortReal G,const Standard_ShortReal B);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* call_togl_text2d If AHeight < 0 default text height is used by driver (DefaultTextHeight method)

	:param AText:
	:type AText: char *
	:param X:
	:type X: Standard_ShortReal
	:param Y:
	:type Y: Standard_ShortReal
	:param AHeight:
	:type AHeight: Standard_ShortReal
	:rtype: void
") Text;
		virtual void Text (const char * AText,const Standard_ShortReal X,const Standard_ShortReal Y,const Standard_ShortReal AHeight);
		%feature("compactdefaultargs") DefaultTextHeight;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") DefaultTextHeight;
		virtual Standard_ShortReal DefaultTextHeight ();
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "	* call_togl_textsize2d

	:param AText:
	:type AText: char *
	:param AHeight:
	:type AHeight: Standard_ShortReal
	:param AWidth:
	:type AWidth: Standard_ShortReal &
	:param AnAscent:
	:type AnAscent: Standard_ShortReal &
	:param ADescent:
	:type ADescent: Standard_ShortReal &
	:rtype: void
") TextSize;
		virtual void TextSize (const char * AText,const Standard_ShortReal AHeight,Standard_ShortReal & AWidth,Standard_ShortReal & AnAscent,Standard_ShortReal & ADescent);
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "	* call_togl_backfacing

	:param aView:
	:type aView: Graphic3d_CView &
	:rtype: void
") SetBackFacingModel;
		virtual void SetBackFacingModel (const Graphic3d_CView & aView);
		%feature("compactdefaultargs") SetDepthTestEnabled;
		%feature("autodoc", "	* call_togl_depthtest

	:param view:
	:type view: Graphic3d_CView &
	:param isEnabled:
	:type isEnabled: bool
	:rtype: void
") SetDepthTestEnabled;
		virtual void SetDepthTestEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("compactdefaultargs") IsDepthTestEnabled;
		%feature("autodoc", "	* call_togl_isdepthtest

	:param view:
	:type view: Graphic3d_CView &
	:rtype: bool
") IsDepthTestEnabled;
		virtual Standard_Boolean IsDepthTestEnabled (const Graphic3d_CView & view);
		%feature("compactdefaultargs") ReadDepths;
		%feature("autodoc", "	* Reads depths of shown pixels of the given rectangle (glReadPixels with GL_DEPTH_COMPONENT)

	:param view:
	:type view: Graphic3d_CView &
	:param x:
	:type x: int
	:param y:
	:type y: int
	:param width:
	:type width: int
	:param height:
	:type height: int
	:param buffer:
	:type buffer: Standard_Address
	:rtype: void
") ReadDepths;
		virtual void ReadDepths (const Graphic3d_CView & view,const Standard_Integer x,const Standard_Integer y,const Standard_Integer width,const Standard_Integer height,const Standard_Address buffer);
		%feature("compactdefaultargs") FBOCreate;
		%feature("autodoc", "	* Generate offscreen FBO in the graphic library. If not supported on hardware returns NULL.

	:param view:
	:type view: Graphic3d_CView &
	:param width:
	:type width: int
	:param height:
	:type height: int
	:rtype: Graphic3d_PtrFrameBuffer
") FBOCreate;
		virtual Graphic3d_PtrFrameBuffer FBOCreate (const Graphic3d_CView & view,const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") FBORelease;
		%feature("autodoc", "	* Remove offscreen FBO from the graphic library

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:rtype: void
") FBORelease;
		virtual void FBORelease (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr);
		%feature("compactdefaultargs") FBOGetDimensions;
		%feature("autodoc", "	* Read offscreen FBO configuration.

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer
	:param width:
	:type width: int &
	:param height:
	:type height: int &
	:param widthMax:
	:type widthMax: int &
	:param heightMax:
	:type heightMax: int &
	:rtype: void
") FBOGetDimensions;
		virtual void FBOGetDimensions (const Graphic3d_CView & view,const Graphic3d_PtrFrameBuffer fboPtr,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") FBOChangeViewport;
		%feature("autodoc", "	* Change offscreen FBO viewport.

	:param view:
	:type view: Graphic3d_CView &
	:param fboPtr:
	:type fboPtr: Graphic3d_PtrFrameBuffer &
	:param width:
	:type width: int
	:param height:
	:type height: int
	:rtype: void
") FBOChangeViewport;
		virtual void FBOChangeViewport (const Graphic3d_CView & view,Graphic3d_PtrFrameBuffer & fboPtr,const Standard_Integer width,const Standard_Integer height);
		%feature("compactdefaultargs") BufferDump;
		%feature("autodoc", "	* Dump active rendering buffer into specified memory buffer.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theImage:
	:type theImage: Image_PixMap &
	:param theBufferType:
	:type theBufferType: Graphic3d_BufferType &
	:rtype: bool
") BufferDump;
		virtual Standard_Boolean BufferDump (const Graphic3d_CView & theCView,Image_PixMap & theImage,const Graphic3d_BufferType & theBufferType);
		%feature("compactdefaultargs") SetGLLightEnabled;
		%feature("autodoc", "	* call_togl_gllight

	:param view:
	:type view: Graphic3d_CView &
	:param isEnabled:
	:type isEnabled: bool
	:rtype: void
") SetGLLightEnabled;
		virtual void SetGLLightEnabled (const Graphic3d_CView & view,const Standard_Boolean isEnabled);
		%feature("compactdefaultargs") IsGLLightEnabled;
		%feature("autodoc", "	* call_togl_isgllight

	:param view:
	:type view: Graphic3d_CView &
	:rtype: bool
") IsGLLightEnabled;
		virtual Standard_Boolean IsGLLightEnabled (const Graphic3d_CView & view);
		%feature("compactdefaultargs") Export;
		%feature("autodoc", "	* Export scene into the one of the Vector graphics formats (SVG, PS, PDF...). In contrast to Bitmaps, Vector graphics is scalable (so you may got quality benefits on printing to laser printer). Notice however that results may differ a lot and do not contain some elements.

	:param theFileName:
	:type theFileName: char *
	:param theFormat:
	:type theFormat: Graphic3d_ExportFormat
	:param theSortType:
	:type theSortType: Graphic3d_SortType
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theView:
	:type theView: Graphic3d_CView &
	:param theLayerUnder:
	:type theLayerUnder: Aspect_CLayer2d &
	:param theLayerOver:
	:type theLayerOver: Aspect_CLayer2d &
	:param thePrecision: default value is 0.005
	:type thePrecision: float
	:param theProgressBarFunc: default value is NULL
	:type theProgressBarFunc: Standard_Address
	:param theProgressObject: default value is NULL
	:type theProgressObject: Standard_Address
	:rtype: bool
") Export;
		virtual Standard_Boolean Export (const char * theFileName,const Graphic3d_ExportFormat theFormat,const Graphic3d_SortType theSortType,const Standard_Integer theWidth,const Standard_Integer theHeight,const Graphic3d_CView & theView,const Aspect_CLayer2d & theLayerUnder,const Aspect_CLayer2d & theLayerOver,const Standard_Real thePrecision = 0.005,const Standard_Address theProgressBarFunc = NULL,const Standard_Address theProgressObject = NULL);
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "	* Marks BVH tree and the set of BVH primitives of correspondent priority list with id theLayerId as outdated.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: int
	:rtype: void
") InvalidateBVHData;
		virtual void InvalidateBVHData (Graphic3d_CView & theCView,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level z layer with ID <theLayerId> for the view. Z layers allow drawing structures in higher layers in foreground of structures in lower layers. To add a structure to desired layer on display it is necessary to set the layer ID for the structure.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") AddZLayer;
		virtual void AddZLayer (const Graphic3d_CView & theCView,const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer from the specified view. All structures displayed at the moment in layer will be displayed in default layer ( the bottom-level z layer ). To unset layer ID from associated structures use method UnsetZLayer (...).

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") RemoveZLayer;
		virtual void RemoveZLayer (const Graphic3d_CView & theCView,const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") UnsetZLayer;
		%feature("autodoc", "	* Unset Z layer ID for all structures. The structure indexes will be set to default layer ( the bottom-level z layer with ID = 0 ).

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") UnsetZLayer;
		virtual void UnsetZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "	* Change Z layer of a structure already presented in view.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theNewLayerId:
	:type theNewLayerId: Graphic3d_ZLayerId
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Graphic3d_CStructure & theCStructure,const Graphic3d_CView & theCView,const Graphic3d_ZLayerId theNewLayerId);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer of specified view.

	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings &
	:rtype: void
") SetZLayerSettings;
		virtual void SetZLayerSettings (const Graphic3d_CView & theCView,const Graphic3d_ZLayerId theLayerId,const Graphic3d_ZLayerSettings & theSettings);
		%feature("compactdefaultargs") ChangePriority;
		%feature("autodoc", "	* Changes the priority of a structure within its Z layer in the specified view.

	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure &
	:param theCView:
	:type theCView: Graphic3d_CView &
	:param theNewPriority:
	:type theNewPriority: int
	:rtype: void
") ChangePriority;
		virtual void ChangePriority (const Graphic3d_CStructure & theCStructure,const Graphic3d_CView & theCView,const Standard_Integer theNewPriority);
		%feature("compactdefaultargs") PrintBoolean;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: bool
	:rtype: None
") PrintBoolean;
		void PrintBoolean (const char * AComment,const Standard_Boolean AValue);
		%feature("compactdefaultargs") PrintCLight;
		%feature("autodoc", "	:param ACLight:
	:type ACLight: Graphic3d_CLight &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCLight;
		void PrintCLight (const Graphic3d_CLight & ACLight,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintCStructure;
		%feature("autodoc", "	:param ACStructure:
	:type ACStructure: Graphic3d_CStructure &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCStructure;
		void PrintCStructure (const Graphic3d_CStructure & ACStructure,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintCView;
		%feature("autodoc", "	:param ACView:
	:type ACView: Graphic3d_CView &
	:param AField:
	:type AField: int
	:rtype: None
") PrintCView;
		void PrintCView (const Graphic3d_CView & ACView,const Standard_Integer AField);
		%feature("compactdefaultargs") PrintFunction;
		%feature("autodoc", "	:param AFunc:
	:type AFunc: char *
	:rtype: None
") PrintFunction;
		void PrintFunction (const char * AFunc);
		%feature("compactdefaultargs") PrintInteger;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: int
	:rtype: None
") PrintInteger;
		void PrintInteger (const char * AComment,const Standard_Integer AValue);
		%feature("compactdefaultargs") PrintIResult;
		%feature("autodoc", "	:param AFunc:
	:type AFunc: char *
	:param AResult:
	:type AResult: int
	:rtype: None
") PrintIResult;
		void PrintIResult (const char * AFunc,const Standard_Integer AResult);
		%feature("compactdefaultargs") PrintShortReal;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AValue:
	:type AValue: Standard_ShortReal
	:rtype: None
") PrintShortReal;
		void PrintShortReal (const char * AComment,const Standard_ShortReal AValue);
		%feature("compactdefaultargs") PrintMatrix;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") PrintMatrix;
		void PrintMatrix (const char * AComment,const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") PrintString;
		%feature("autodoc", "	:param AComment:
	:type AComment: char *
	:param AString:
	:type AString: char *
	:rtype: None
") PrintString;
		void PrintString (const char * AComment,const char * AString);
		%feature("compactdefaultargs") SetTrace;
		%feature("autodoc", "	:param ALevel:
	:type ALevel: int
	:rtype: None
") SetTrace;
		void SetTrace (const Standard_Integer ALevel);
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "	:rtype: int
") Trace;
		Standard_Integer Trace ();
		%feature("compactdefaultargs") GetDisplayConnection;
		%feature("autodoc", "	* returns Handle to display connection

	:rtype: Handle_Aspect_DisplayConnection
") GetDisplayConnection;
		Handle_Aspect_DisplayConnection GetDisplayConnection ();
		%feature("compactdefaultargs") IsDeviceLost;
		%feature("autodoc", "	:rtype: bool
") IsDeviceLost;
		Standard_Boolean IsDeviceLost ();
		%feature("compactdefaultargs") ResetDeviceLostFlag;
		%feature("autodoc", "	:rtype: None
") ResetDeviceLostFlag;
		void ResetDeviceLostFlag ();
};


%extend Graphic3d_GraphicDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_GraphicDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_GraphicDriver::Handle_Graphic3d_GraphicDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_GraphicDriver;
class Handle_Graphic3d_GraphicDriver : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_GraphicDriver();
        Handle_Graphic3d_GraphicDriver(const Handle_Graphic3d_GraphicDriver &aHandle);
        Handle_Graphic3d_GraphicDriver(const Graphic3d_GraphicDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_GraphicDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_GraphicDriver {
    Graphic3d_GraphicDriver* _get_reference() {
    return (Graphic3d_GraphicDriver*)$self->Access();
    }
};

%extend Handle_Graphic3d_GraphicDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_GraphicDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Group;
class Graphic3d_Group : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Supress all primitives and attributes of <self>. To clear group without update in Graphic3d_StructureManager pass Standard_False as <theUpdateStructureMgr>. This used on context and viewer destruction, when the pointer to structure manager in Graphic3d_Structure could be already released (pointers are used here to avoid handle cross-reference);

	:param theUpdateStructureMgr: default value is Standard_True
	:type theUpdateStructureMgr: bool
	:rtype: void
") Clear;
		virtual void Clear (const Standard_Boolean theUpdateStructureMgr = Standard_True);
		%feature("compactdefaultargs") UpdateAspectLine;
		%feature("autodoc", "	:param theIsGlobal:
	:type theIsGlobal: bool
	:rtype: void
") UpdateAspectLine;
		virtual void UpdateAspectLine (const Standard_Boolean theIsGlobal);
		%feature("compactdefaultargs") UpdateAspectFace;
		%feature("autodoc", "	:param theIsGlobal:
	:type theIsGlobal: bool
	:rtype: void
") UpdateAspectFace;
		virtual void UpdateAspectFace (const Standard_Boolean theIsGlobal);
		%feature("compactdefaultargs") UpdateAspectMarker;
		%feature("autodoc", "	:param theIsGlobal:
	:type theIsGlobal: bool
	:rtype: void
") UpdateAspectMarker;
		virtual void UpdateAspectMarker (const Standard_Boolean theIsGlobal);
		%feature("compactdefaultargs") UpdateAspectText;
		%feature("autodoc", "	:param theIsGlobal:
	:type theIsGlobal: bool
	:rtype: void
") UpdateAspectText;
		virtual void UpdateAspectText (const Standard_Boolean theIsGlobal);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Supress the group <self> in the structure.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Supress the group <self> in the structure. Warning: No more graphic operations in <self> after this call. Modifies the current modelling transform persistence (pan, zoom or rotate) Get the current modelling transform persistence (pan, zoom or rotate)

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the line primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the face primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the text primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the marker primitives created after this call in the group.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("compactdefaultargs") SetMinMaxValues;
		%feature("autodoc", "	* Sets the coordinates of the boundary box of the group <self>.

	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param ZMin:
	:type ZMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param ZMax:
	:type ZMax: float
	:rtype: None
") SetMinMaxValues;
		void SetMinMaxValues (const Standard_Real XMin,const Standard_Real YMin,const Standard_Real ZMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real ZMax);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). AAngle : Orientation of the text (with respect to the horizontal).

	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param AAngle:
	:type AAngle: Quantity_PlaneAngle
	:param ATp:
	:type ATp: Graphic3d_TextPath
	:param AHta:
	:type AHta: Graphic3d_HorizontalTextAlignment
	:param AVta:
	:type AVta: Graphic3d_VerticalTextAlignment
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: void
") Text;
		virtual void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). The other attributes have the following default values: AAngle : PI / 2. ATp : TP_RIGHT AHta : HTA_LEFT AVta : VTA_BOTTOM

	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") Text;
		void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). AAngle : Orientation of the text (with respect to the horizontal).

	:param AText:
	:type AText: TCollection_ExtendedString &
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param AAngle:
	:type AAngle: Quantity_PlaneAngle
	:param ATp:
	:type ATp: Graphic3d_TextPath
	:param AHta:
	:type AHta: Graphic3d_HorizontalTextAlignment
	:param AVta:
	:type AVta: Graphic3d_VerticalTextAlignment
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Quantity_PlaneAngle AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). The other attributes have the following default values: AAngle : PI / 2. ATp : TP_RIGHT AHta : HTA_LEFT AVta : VTA_BOTTOM

	:param AText:
	:type AText: TCollection_ExtendedString &
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None
") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "	* Adds an array of primitives for display

	:param theType:
	:type theType: Graphic3d_TypeOfPrimitiveArray
	:param theIndices:
	:type theIndices: Handle_Graphic3d_IndexBuffer &
	:param theAttribs:
	:type theAttribs: Handle_Graphic3d_Buffer &
	:param theBounds:
	:type theBounds: Handle_Graphic3d_BoundBuffer &
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: void
") AddPrimitiveArray;
		virtual void AddPrimitiveArray (const Graphic3d_TypeOfPrimitiveArray theType,const Handle_Graphic3d_IndexBuffer & theIndices,const Handle_Graphic3d_Buffer & theAttribs,const Handle_Graphic3d_BoundBuffer & theBounds,const Standard_Boolean theToEvalMinMax = Standard_True);
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "	* Adds an array of primitives for display

	:param thePrim:
	:type thePrim: Handle_Graphic3d_ArrayOfPrimitives &
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: None
") AddPrimitiveArray;
		void AddPrimitiveArray (const Handle_Graphic3d_ArrayOfPrimitives & thePrim,const Standard_Boolean theToEvalMinMax = Standard_True);
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "	* Creates a primitive array with single marker using AddPrimitiveArray().

	:param thePoint:
	:type thePoint: Graphic3d_Vertex &
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: None
") Marker;
		void Marker (const Graphic3d_Vertex & thePoint,const Standard_Boolean theToEvalMinMax = Standard_True);
		%feature("compactdefaultargs") UserDraw;
		%feature("autodoc", "	* Creates a UserDraw primitive using obsolete API.

	:param theObject:
	:type theObject: Standard_Address
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:param theContainsFacet: default value is Standard_False
	:type theContainsFacet: bool
	:rtype: void
") UserDraw;
		virtual void UserDraw (const Standard_Address theObject,const Standard_Boolean theToEvalMinMax = Standard_True,const Standard_Boolean theContainsFacet = Standard_False);
		%feature("compactdefaultargs") SetStencilTestOptions;
		%feature("autodoc", "	* sets the stencil test to theIsEnabled state;

	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: void
") SetStencilTestOptions;
		virtual void SetStencilTestOptions (const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") SetFlippingOptions;
		%feature("autodoc", "	* sets the flipping to theIsEnabled state.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:param theRefPlane:
	:type theRefPlane: gp_Ax2
	:rtype: void
") SetFlippingOptions;
		virtual void SetFlippingOptions (const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);
		%feature("compactdefaultargs") IsGroupPrimitivesAspectSet;
		%feature("autodoc", "	* Returns True if aspect is set for the group.

	:param theAspect:
	:type theAspect: Graphic3d_GroupAspect
	:rtype: bool
") IsGroupPrimitivesAspectSet;
		Standard_Boolean IsGroupPrimitivesAspectSet (const Graphic3d_GroupAspect theAspect);
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if the group <self> contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns Standard_True if the group <self> is deleted. <self> is deleted after the call Remove (me) or the associated structure is deleted.

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns Standard_True if the group <self> is empty.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of the group <self>.

	:param XMin:
	:type XMin: float &
	:param YMin:
	:type YMin: float &
	:param ZMin:
	:type ZMin: float &
	:param XMax:
	:type XMax: float &
	:param YMax:
	:type YMax: float &
	:param ZMax:
	:type ZMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns boundary box of the group <self> without transformation applied,

	:rtype: Graphic3d_BndBox4f
") BoundingBox;
		const Graphic3d_BndBox4f & BoundingBox ();
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "	* Returns non-const boundary box of the group <self> without transformation applied,

	:rtype: Graphic3d_BndBox4f
") ChangeBoundingBox;
		Graphic3d_BndBox4f & ChangeBoundingBox ();
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "	* Returns the structure containing the group <self>.

	:rtype: Handle_Graphic3d_Structure
") Structure;
		Handle_Graphic3d_Structure Structure ();
		%feature("compactdefaultargs") SetClosed;
		%feature("autodoc", "	* Changes property shown that primitive arrays within this group form closed volume (do no contain open shells).

	:param theIsClosed:
	:type theIsClosed: bool
	:rtype: None
") SetClosed;
		void SetClosed (const Standard_Boolean theIsClosed);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	* Return true if primitive arrays within this graphic group form closed volume (do no contain open shells).

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
};


%extend Graphic3d_Group {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Group(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Group::Handle_Graphic3d_Group %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Group;
class Handle_Graphic3d_Group : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_Group();
        Handle_Graphic3d_Group(const Handle_Graphic3d_Group &aHandle);
        Handle_Graphic3d_Group(const Graphic3d_Group *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Group DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Group {
    Graphic3d_Group* _get_reference() {
    return (Graphic3d_Group*)$self->Access();
    }
};

%extend Handle_Graphic3d_Group {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_HSequenceOfStructure;
class Graphic3d_HSequenceOfStructure : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_HSequenceOfStructure;
		%feature("autodoc", "	:rtype: None
") Graphic3d_HSequenceOfStructure;
		 Graphic3d_HSequenceOfStructure ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_Graphic3d_HSequenceOfStructure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_Graphic3d_HSequenceOfStructure & aSequence);
		%feature("compactdefaultargs") Exchange;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anOtherIndex:
	:type anOtherIndex: int
	:rtype: None
") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_HSequenceOfStructure
") Split;
		Handle_Graphic3d_HSequenceOfStructure Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_Graphic3d_Structure &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_Graphic3d_Structure & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_Structure
") Value;
		Handle_Graphic3d_Structure Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_Graphic3d_Structure
") ChangeValue;
		Handle_Graphic3d_Structure ChangeValue (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param fromIndex:
	:type fromIndex: int
	:param toIndex:
	:type toIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("compactdefaultargs") Sequence;
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfStructure
") Sequence;
		const Graphic3d_SequenceOfStructure & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: Graphic3d_SequenceOfStructure
") ChangeSequence;
		Graphic3d_SequenceOfStructure & ChangeSequence ();
};


%extend Graphic3d_HSequenceOfStructure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_HSequenceOfStructure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_HSequenceOfStructure::Handle_Graphic3d_HSequenceOfStructure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_HSequenceOfStructure;
class Handle_Graphic3d_HSequenceOfStructure : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_HSequenceOfStructure();
        Handle_Graphic3d_HSequenceOfStructure(const Handle_Graphic3d_HSequenceOfStructure &aHandle);
        Handle_Graphic3d_HSequenceOfStructure(const Graphic3d_HSequenceOfStructure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_HSequenceOfStructure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_HSequenceOfStructure {
    Graphic3d_HSequenceOfStructure* _get_reference() {
    return (Graphic3d_HSequenceOfStructure*)$self->Access();
    }
};

%extend Handle_Graphic3d_HSequenceOfStructure {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_HSequenceOfStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ListIteratorOfListOfShortReal;
class Graphic3d_ListIteratorOfListOfShortReal {
	public:
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfListOfShortReal;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal ();
		%feature("compactdefaultargs") Graphic3d_ListIteratorOfListOfShortReal;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfShortReal &
	:rtype: None
") Graphic3d_ListIteratorOfListOfShortReal;
		 Graphic3d_ListIteratorOfListOfShortReal (const Graphic3d_ListOfShortReal & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: Graphic3d_ListOfShortReal &
	:rtype: None
") Initialize;
		void Initialize (const Graphic3d_ListOfShortReal & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
		Standard_ShortReal & Value ();
};


%extend Graphic3d_ListIteratorOfListOfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ListNodeOfListOfShortReal;
class Graphic3d_ListNodeOfListOfShortReal : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") Graphic3d_ListNodeOfListOfShortReal;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") Graphic3d_ListNodeOfListOfShortReal;
		 Graphic3d_ListNodeOfListOfShortReal (const Standard_ShortReal & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Value;
		Standard_ShortReal & Value ();
};


%extend Graphic3d_ListNodeOfListOfShortReal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ListNodeOfListOfShortReal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ListNodeOfListOfShortReal::Handle_Graphic3d_ListNodeOfListOfShortReal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ListNodeOfListOfShortReal;
class Handle_Graphic3d_ListNodeOfListOfShortReal : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Graphic3d_ListNodeOfListOfShortReal();
        Handle_Graphic3d_ListNodeOfListOfShortReal(const Handle_Graphic3d_ListNodeOfListOfShortReal &aHandle);
        Handle_Graphic3d_ListNodeOfListOfShortReal(const Graphic3d_ListNodeOfListOfShortReal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ListNodeOfListOfShortReal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ListNodeOfListOfShortReal {
    Graphic3d_ListNodeOfListOfShortReal* _get_reference() {
    return (Graphic3d_ListNodeOfListOfShortReal*)$self->Access();
    }
};

%extend Handle_Graphic3d_ListNodeOfListOfShortReal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ListNodeOfListOfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ListOfShortReal;
class Graphic3d_ListOfShortReal {
	public:
		%feature("compactdefaultargs") Graphic3d_ListOfShortReal;
		%feature("autodoc", "	:rtype: None
") Graphic3d_ListOfShortReal;
		 Graphic3d_ListOfShortReal ();
		%feature("compactdefaultargs") Graphic3d_ListOfShortReal;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Graphic3d_ListOfShortReal;
		 Graphic3d_ListOfShortReal (const Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Assign;
		void Assign (const Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") operator =;
		void operator = (const Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param theIt:
	:type theIt: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Append;
		void Append (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:rtype: None
") Append;
		void Append (Graphic3d_ListOfShortReal & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") First;
		Standard_ShortReal & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Last;
		Standard_ShortReal & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") Remove;
		void Remove (Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertBefore;
		void InsertBefore (Graphic3d_ListOfShortReal & Other,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Standard_ShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_ShortReal & I,Graphic3d_ListIteratorOfListOfShortReal & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_ListOfShortReal &
	:param It:
	:type It: Graphic3d_ListIteratorOfListOfShortReal &
	:rtype: None
") InsertAfter;
		void InsertAfter (Graphic3d_ListOfShortReal & Other,Graphic3d_ListIteratorOfListOfShortReal & It);
};


%extend Graphic3d_ListOfShortReal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_MarkerImage;
class Graphic3d_MarkerImage : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "	* @param theImage - source image

	:param theImage:
	:type theImage: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_Image_PixMap & theImage);
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "	* Creates marker image from array of bytes (method for compatibility with old markers definition). @param theBitMap - source bitmap stored as array of bytes @param theWidth - number of bits in a row @param theHeight - number of bits in a column

	:param theBitMap:
	:type theBitMap: Handle_TColStd_HArray1OfByte &
	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const Handle_TColStd_HArray1OfByte & theBitMap,const Standard_Integer & theWidth,const Standard_Integer & theHeight);
		%feature("compactdefaultargs") GetBitMapArray;
		%feature("autodoc", "	* @param theAlphaValue pixels in the image that have alpha value greater than  or equal to this parameter will be stored in bitmap as '1',  others will be stored as '0' returns marker image as array of bytes. If an instance of the class has been initialized with image, it will be converted to bitmap based on the parameter theAlphaValue.

	:param theAlphaValue: default value is 0.5
	:type theAlphaValue: float &
	:rtype: Handle_TColStd_HArray1OfByte
") GetBitMapArray;
		Handle_TColStd_HArray1OfByte GetBitMapArray (const Standard_Real & theAlphaValue = 0.5);
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "	* returns marker image. If an instance of the class has been initialized with a bitmap, it will be converted to image.

	:rtype: Handle_Image_PixMap
") GetImage;
		Handle_Image_PixMap GetImage ();
		%feature("compactdefaultargs") GetImageAlpha;
		%feature("autodoc", "	* returns image alpha as grayscale image. Note that if an instance of the class has been initialized with a bitmap or with grayscale image this method will return exactly the same image as GetImage()

	:rtype: Handle_Image_PixMap
") GetImageAlpha;
		Handle_Image_PixMap GetImageAlpha ();
		%feature("compactdefaultargs") GetImageId;
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageId;
		const TCollection_AsciiString & GetImageId ();
		%feature("compactdefaultargs") GetImageAlphaId;
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId ();
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "	* returns texture size

	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend Graphic3d_MarkerImage {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_MarkerImage(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_MarkerImage::Handle_Graphic3d_MarkerImage %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_MarkerImage;
class Handle_Graphic3d_MarkerImage : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_MarkerImage();
        Handle_Graphic3d_MarkerImage(const Handle_Graphic3d_MarkerImage &aHandle);
        Handle_Graphic3d_MarkerImage(const Graphic3d_MarkerImage *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_MarkerImage DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_MarkerImage {
    Graphic3d_MarkerImage* _get_reference() {
    return (Graphic3d_MarkerImage*)$self->Access();
    }
};

%extend Handle_Graphic3d_MarkerImage {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_MarkerImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_MaterialAspect;
class Graphic3d_MaterialAspect {
	public:
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "	* Creates a material from default values.

	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect ();
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "	* Creates a generic material calls <AName>

	:param AName:
	:type AName: Graphic3d_NameOfMaterial
	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect (const Graphic3d_NameOfMaterial AName);
		%feature("compactdefaultargs") IncreaseShine;
		%feature("autodoc", "	* Increases or decreases the luminosity of <self>. <ADelta> is a signed percentage.

	:param ADelta:
	:type ADelta: float
	:rtype: None
") IncreaseShine;
		void IncreaseShine (const Standard_Real ADelta);
		%feature("compactdefaultargs") SetAmbient;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetAmbient;
		void SetAmbient (const Standard_Real AValue);
		%feature("compactdefaultargs") SetDiffuse;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetDiffuse;
		void SetDiffuse (const Standard_Real AValue);
		%feature("compactdefaultargs") SetEmissive;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetEmissive;
		void SetEmissive (const Standard_Real AValue);
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "	* Modifies the luminosity of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetShininess;
		void SetShininess (const Standard_Real AValue);
		%feature("compactdefaultargs") SetSpecular;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetSpecular;
		void SetSpecular (const Standard_Real AValue);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Modifies the transparency coefficient of the surface. <AValue> = 0. opaque. (default) <AValue> = 1. transparent. Transparency is applicable to materials that have at least one of reflection modes (ambient, diffuse, specular or emissive) enabled. See also SetReflectionModeOn() and SetReflectionModeOff() methods. //! NOTE: In order for transparency specified through this method to take effect, it is necessary to enable transparency in the viewer. This can be done either directly - see Visual3d_ViewManager::SetTransparency(Standard_Boolean), or indirectly - by calling AIS_InteractiveObject::SetTransparency() before an object is added to an interactive context, or by calling AIS_InteractiveContext::SetTransparency() for a given interactive object already displayed. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <AValue> is a negative value or greater than 1.0.

	:param AValue:
	:type AValue: float
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_Real AValue);
		%feature("compactdefaultargs") SetRefractionIndex;
		%feature("autodoc", "	* Modifies the refraction index of the material. Category: Methods to modify the class definition Warning: Raises MaterialDefinitionError if <theValue> is a lesser than 1.0.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetRefractionIndex;
		void SetRefractionIndex (const Standard_Real theValue);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the ambient and diffuse colour of the surface. Category: Methods to modify the class definition

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "	* Modifies the ambient colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetAmbientColor;
		void SetAmbientColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "	* Modifies the difuse colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetDiffuseColor;
		void SetDiffuseColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "	* Modifies the specular colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetSpecularColor;
		void SetSpecularColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "	* Modifies the emissive colour of the surface.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: None
") SetEmissiveColor;
		void SetEmissiveColor (const Quantity_Color & AColor);
		%feature("compactdefaultargs") SetReflectionModeOn;
		%feature("autodoc", "	* Activates the reflective properties of the surface <AType>. //! TypeOfReflection : TOR_AMBIENT TOR_DIFFUSE TOR_SPECULAR TOR_EMISSION 1, 2, 3 or 4 types of reflection can be set for a given surface.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOn;
		void SetReflectionModeOn (const Graphic3d_TypeOfReflection AType);
		%feature("compactdefaultargs") SetReflectionModeOff;
		%feature("autodoc", "	* Deactivates the reflective properties of the surface <AType>. //! TypeOfReflection : TOR_AMBIENT TOR_DIFFUSE TOR_SPECULAR TOR_EMISSION 1, 2, 3 or 4 types of reflection can be set off for a given surface. Disabling diffuse and specular reflectance is useful for efficient visualization of large amounts of data as definition of normals for graphic primitives is not needed when only 'all-directional' reflectance is active. //! NOTE: Disabling all four reflection modes also turns off the following effects: 1. Lighting. Colors of primitives are not affected by the material properties when lighting is off. 2. Transparency.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOff;
		void SetReflectionModeOff (const Graphic3d_TypeOfReflection AType);
		%feature("compactdefaultargs") SetMaterialType;
		%feature("autodoc", "	* Set MyMaterialType to the value of parameter <AType> //! TypeOfMaterial : MATERIAL_ASPECT MATERIAL_PHYSIC

	:param AType:
	:type AType: Graphic3d_TypeOfMaterial
	:rtype: None
") SetMaterialType;
		void SetMaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("compactdefaultargs") SetMaterialName;
		%feature("autodoc", "	* The current matarial become a 'UserDefined' material. Set the name of the 'UserDefined' material.

	:param AName:
	:type AName: char *
	:rtype: None
") SetMaterialName;
		void SetMaterialName (const char * AName);
		%feature("compactdefaultargs") SetEnvReflexion;
		%feature("autodoc", "	:param AValue:
	:type AValue: Standard_ShortReal
	:rtype: None
") SetEnvReflexion;
		void SetEnvReflexion (const Standard_ShortReal AValue);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Resets the material with the original values according to the material name but leave the current color values untouched for the material of type ASPECT.

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the diffuse colour of the surface.

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "	* Returns the ambient colour of the surface.

	:rtype: Quantity_Color
") AmbientColor;
		const Quantity_Color & AmbientColor ();
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "	* Returns the diffuse colour of the surface.

	:rtype: Quantity_Color
") DiffuseColor;
		const Quantity_Color & DiffuseColor ();
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "	* Returns the specular colour of the surface.

	:rtype: Quantity_Color
") SpecularColor;
		const Quantity_Color & SpecularColor ();
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "	* Returns the emissive colour of the surface.

	:rtype: Quantity_Color
") EmissiveColor;
		const Quantity_Color & EmissiveColor ();
		%feature("compactdefaultargs") Ambient;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Ambient;
		Standard_Real Ambient ();
		%feature("compactdefaultargs") Diffuse;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Diffuse;
		Standard_Real Diffuse ();
		%feature("compactdefaultargs") Specular;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: float
") Specular;
		Standard_Real Specular ();
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns the transparency coefficient of the surface.

	:rtype: float
") Transparency;
		Standard_Real Transparency ();
		%feature("compactdefaultargs") RefractionIndex;
		%feature("autodoc", "	* Returns the refraction index of the material

	:rtype: float
") RefractionIndex;
		Standard_Real RefractionIndex ();
		%feature("compactdefaultargs") Emissive;
		%feature("autodoc", "	* Returns the emissive coefficient of the surface.

	:rtype: float
") Emissive;
		Standard_Real Emissive ();
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "	* Returns the luminosity of the surface.

	:rtype: float
") Shininess;
		Standard_Real Shininess ();
		%feature("compactdefaultargs") ReflectionMode;
		%feature("autodoc", "	* Returns Standard_True if the reflection mode is active, Standard_False otherwise.

	:param AType:
	:type AType: Graphic3d_TypeOfReflection
	:rtype: bool
") ReflectionMode;
		Standard_Boolean ReflectionMode (const Graphic3d_TypeOfReflection AType);
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "	* Returns Standard_True if MyMaterialType equal the parameter AType, Standard_False otherwise.

	:param AType:
	:type AType: Graphic3d_TypeOfMaterial
	:rtype: bool
") MaterialType;
		Standard_Boolean MaterialType (const Graphic3d_TypeOfMaterial AType);
		%feature("compactdefaultargs") EnvReflexion;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") EnvReflexion;
		Standard_ShortReal EnvReflexion ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the material name.

	:rtype: Graphic3d_NameOfMaterial
") Name;
		Graphic3d_NameOfMaterial Name ();
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	* Returns Standard_True if the materials <self> and <Other> are different.

	:param Other:
	:type Other: Graphic3d_MaterialAspect &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const Graphic3d_MaterialAspect & Other);

        %extend{
            bool __ne_wrapper__(const Graphic3d_MaterialAspect  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns Standard_True if the materials <self> and <Other> are identical.

	:param Other:
	:type Other: Graphic3d_MaterialAspect &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Graphic3d_MaterialAspect & Other);

        %extend{
            bool __eq_wrapper__(const Graphic3d_MaterialAspect  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "	* Returns the name of the predefined material of rank <aRank> Trigger: when <aRank> is < 1 or > NumberOfMaterials.

	:param aRank:
	:type aRank: int
	:rtype: char *
") MaterialName;
		static const char * MaterialName (const Standard_Integer aRank);
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "	* Returns the name of this material

	:rtype: char *
") MaterialName;
		const char * MaterialName ();
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "	* Returns the type of the predefined material of rank <aRank> Trigger: when <aRank> is < 1 or > NumberOfMaterials.

	:param aRank:
	:type aRank: int
	:rtype: Graphic3d_TypeOfMaterial
") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType (const Standard_Integer aRank);
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "	* Returns the material for specified name or Graphic3d_NOM_DEFAULT if name is unknown.

	:param theName:
	:type theName: char *
	:rtype: Graphic3d_NameOfMaterial
") MaterialFromName;
		static Graphic3d_NameOfMaterial MaterialFromName (const char * theName);
};


%extend Graphic3d_MaterialAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_RenderingParams;
class Graphic3d_RenderingParams {
	public:
/* public enums */
enum Anaglyph {
	Anaglyph_RedCyan_Simple = 0,
	Anaglyph_RedCyan_Optimized = 1,
	Anaglyph_YellowBlue_Simple = 2,
	Anaglyph_YellowBlue_Optimized = 3,
	Anaglyph_GreenMagenta_Simple = 4,
	Anaglyph_UserDefined = 5,
};

/* end public enums declaration */

		Graphic3d_RenderingMode Method;
		int RaytracingDepth;
		bool IsShadowEnabled;
		bool IsReflectionEnabled;
		bool IsAntialiasingEnabled;
		bool IsTransparentShadowEnabled;
		Graphic3d_StereoMode StereoMode;
		Anaglyph AnaglyphFilter;
		Graphic3d_Mat4 AnaglyphLeft;
		Graphic3d_Mat4 AnaglyphRight;
		bool ToReverseStereo;
		%feature("compactdefaultargs") Graphic3d_RenderingParams;
		%feature("autodoc", "	* Creates default rendering parameters.

	:rtype: None
") Graphic3d_RenderingParams;
		 Graphic3d_RenderingParams ();
};


%extend Graphic3d_RenderingParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_SequenceNodeOfSequenceOfStructure;
class Graphic3d_SequenceNodeOfSequenceOfStructure : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceNodeOfSequenceOfStructure;
		%feature("autodoc", "	:param I:
	:type I: Handle_Graphic3d_Structure &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Graphic3d_SequenceNodeOfSequenceOfStructure;
		 Graphic3d_SequenceNodeOfSequenceOfStructure (const Handle_Graphic3d_Structure & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Value;
		Handle_Graphic3d_Structure Value ();
};


%extend Graphic3d_SequenceNodeOfSequenceOfStructure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_SequenceNodeOfSequenceOfStructure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_SequenceNodeOfSequenceOfStructure::Handle_Graphic3d_SequenceNodeOfSequenceOfStructure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_SequenceNodeOfSequenceOfStructure;
class Handle_Graphic3d_SequenceNodeOfSequenceOfStructure : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Graphic3d_SequenceNodeOfSequenceOfStructure();
        Handle_Graphic3d_SequenceNodeOfSequenceOfStructure(const Handle_Graphic3d_SequenceNodeOfSequenceOfStructure &aHandle);
        Handle_Graphic3d_SequenceNodeOfSequenceOfStructure(const Graphic3d_SequenceNodeOfSequenceOfStructure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_SequenceNodeOfSequenceOfStructure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_SequenceNodeOfSequenceOfStructure {
    Graphic3d_SequenceNodeOfSequenceOfStructure* _get_reference() {
    return (Graphic3d_SequenceNodeOfSequenceOfStructure*)$self->Access();
    }
};

%extend Handle_Graphic3d_SequenceNodeOfSequenceOfStructure {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_SequenceNodeOfSequenceOfStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_SequenceOfStructure;
class Graphic3d_SequenceOfStructure : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Graphic3d_SequenceOfStructure;
		%feature("autodoc", "	:rtype: None
") Graphic3d_SequenceOfStructure;
		 Graphic3d_SequenceOfStructure ();
		%feature("compactdefaultargs") Graphic3d_SequenceOfStructure;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfStructure &
	:rtype: None
") Graphic3d_SequenceOfStructure;
		 Graphic3d_SequenceOfStructure (const Graphic3d_SequenceOfStructure & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfStructure &
	:rtype: Graphic3d_SequenceOfStructure
") Assign;
		const Graphic3d_SequenceOfStructure & Assign (const Graphic3d_SequenceOfStructure & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Graphic3d_SequenceOfStructure &
	:rtype: Graphic3d_SequenceOfStructure
") operator =;
		const Graphic3d_SequenceOfStructure & operator = (const Graphic3d_SequenceOfStructure & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") Append;
		void Append (const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") Append;
		void Append (Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") Prepend;
		void Prepend (Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Graphic3d_Structure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Graphic3d_Structure & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Graphic3d_SequenceOfStructure &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Graphic3d_SequenceOfStructure & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") First;
		Handle_Graphic3d_Structure First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_Structure
") Last;
		Handle_Graphic3d_Structure Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Graphic3d_SequenceOfStructure &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Graphic3d_SequenceOfStructure & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Graphic3d_Structure
") Value;
		Handle_Graphic3d_Structure Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Graphic3d_Structure &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Graphic3d_Structure & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Graphic3d_Structure
") ChangeValue;
		Handle_Graphic3d_Structure ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Graphic3d_SequenceOfStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ShaderObject;
class Graphic3d_ShaderObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the shader object is valid or not.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	* Returns the full path to the shader source.

	:rtype: OSD_Path
") Path;
		const OSD_Path & Path ();
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns the source code of the shader object.

	:rtype: TCollection_AsciiString
") Source;
		const TCollection_AsciiString & Source ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns type of the shader object.

	:rtype: Graphic3d_TypeOfShaderObject
") Type;
		Graphic3d_TypeOfShaderObject Type ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") CreateFromFile;
		%feature("autodoc", "	* Creates new shader object from specified file.

	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param thePath:
	:type thePath: TCollection_AsciiString &
	:rtype: Handle_Graphic3d_ShaderObject
") CreateFromFile;
		static Handle_Graphic3d_ShaderObject CreateFromFile (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & thePath);
		%feature("compactdefaultargs") CreateFromSource;
		%feature("autodoc", "	* Creates new shader object from specified source.

	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param theSource:
	:type theSource: TCollection_AsciiString &
	:rtype: Handle_Graphic3d_ShaderObject
") CreateFromSource;
		static Handle_Graphic3d_ShaderObject CreateFromSource (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & theSource);
};


%extend Graphic3d_ShaderObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ShaderObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ShaderObject::Handle_Graphic3d_ShaderObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ShaderObject;
class Handle_Graphic3d_ShaderObject : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_ShaderObject();
        Handle_Graphic3d_ShaderObject(const Handle_Graphic3d_ShaderObject &aHandle);
        Handle_Graphic3d_ShaderObject(const Graphic3d_ShaderObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ShaderObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ShaderObject {
    Graphic3d_ShaderObject* _get_reference() {
    return (Graphic3d_ShaderObject*)$self->Access();
    }
};

%extend Handle_Graphic3d_ShaderObject {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ShaderObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ShaderProgram;
class Graphic3d_ShaderProgram : public Standard_Transient {
	public:
/* public enums */
enum ShaderName {
	ShaderName_UNKNOWN = 0,
	ShaderName_Phong = 1,
};

/* end public enums declaration */

		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "	* Creates new empty program object.

	:rtype: None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram ();
		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "	* Creates program object from pre-defined shaders. Raises Standard_Failure exception if shader resources are unavailable.

	:param theName:
	:type theName: Graphic3d_ShaderProgram::ShaderName
	:rtype: None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram (const Graphic3d_ShaderProgram::ShaderName theName);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Releases resources of program object.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the program object is valid or not.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "	* Returns GLSL header (version code and extensions).

	:rtype: TCollection_AsciiString
") Header;
		const TCollection_AsciiString & Header ();
		%feature("compactdefaultargs") SetHeader;
		%feature("autodoc", "	* Setup GLSL header containing language version code and used extensions. Will be prepended to the very beginning of the source code. Example: @code #version 300 es #extension GL_ARB_bindless_texture : require @endcode

	:param theHeader:
	:type theHeader: TCollection_AsciiString &
	:rtype: None
") SetHeader;
		void SetHeader (const TCollection_AsciiString & theHeader);
		%feature("compactdefaultargs") AttachShader;
		%feature("autodoc", "	* Attaches shader object to the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") AttachShader;
		Standard_Boolean AttachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("compactdefaultargs") DetachShader;
		%feature("autodoc", "	* Detaches shader object from the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") DetachShader;
		Standard_Boolean DetachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("compactdefaultargs") ShaderObjects;
		%feature("autodoc", "	* Returns list of attached shader objects.

	:rtype: Graphic3d_ShaderObjectList
") ShaderObjects;
		const Graphic3d_ShaderObjectList & ShaderObjects ();
		%feature("compactdefaultargs") Variables;
		%feature("autodoc", "	* Returns list of custom uniform variables.

	:rtype: Graphic3d_ShaderVariableList
") Variables;
		const Graphic3d_ShaderVariableList & Variables ();
		%feature("compactdefaultargs") ClearVariables;
		%feature("autodoc", "	* Removes all custom uniform variables from the program.

	:rtype: None
") ClearVariables;
		void ClearVariables ();
		%feature("compactdefaultargs") ShadersFolder;
		%feature("autodoc", "	* The path to GLSL programs determined from CSF_ShadersDirectory or CASROOT environment variables. returns the root folder with default GLSL programs.

	:rtype: TCollection_AsciiString
") ShadersFolder;
		static const TCollection_AsciiString & ShadersFolder ();
};


%extend Graphic3d_ShaderProgram {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ShaderProgram(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ShaderProgram::Handle_Graphic3d_ShaderProgram %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ShaderProgram;
class Handle_Graphic3d_ShaderProgram : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_ShaderProgram();
        Handle_Graphic3d_ShaderProgram(const Handle_Graphic3d_ShaderProgram &aHandle);
        Handle_Graphic3d_ShaderProgram(const Graphic3d_ShaderProgram *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ShaderProgram DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ShaderProgram {
    Graphic3d_ShaderProgram* _get_reference() {
    return (Graphic3d_ShaderProgram*)$self->Access();
    }
};

%extend Handle_Graphic3d_ShaderProgram {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ShaderProgram {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ShaderVariable;
class Graphic3d_ShaderVariable : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns name of shader variable.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the shader variable is valid or not.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns interface of shader variable value.

	:rtype: Graphic3d_ValueInterface *
") Value;
		Graphic3d_ValueInterface * Value ();
};


%extend Graphic3d_ShaderVariable {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ShaderVariable(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ShaderVariable::Handle_Graphic3d_ShaderVariable %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ShaderVariable;
class Handle_Graphic3d_ShaderVariable : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_ShaderVariable();
        Handle_Graphic3d_ShaderVariable(const Handle_Graphic3d_ShaderVariable &aHandle);
        Handle_Graphic3d_ShaderVariable(const Graphic3d_ShaderVariable *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ShaderVariable DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ShaderVariable {
    Graphic3d_ShaderVariable* _get_reference() {
    return (Graphic3d_ShaderVariable*)$self->Access();
    }
};

%extend Handle_Graphic3d_ShaderVariable {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ShaderVariable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Structure;
class Graphic3d_Structure : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Graphic3d_Structure;
		%feature("autodoc", "	* Creates a graphic object in the manager theManager. It will appear in all the views of the visualiser. Warning: The default values AspectLine, AspectFillArea, AspectText and AspectMarker are NOT applied to the structure. The structure is not displayed when it is created.

	:param theManager:
	:type theManager: Handle_Graphic3d_StructureManager &
	:rtype: None
") Graphic3d_Structure;
		 Graphic3d_Structure (const Handle_Graphic3d_StructureManager & theManager);
		%feature("compactdefaultargs") Graphic3d_Structure;
		%feature("autodoc", "	* Creates a shadow link to existing graphic object.

	:param theManager:
	:type theManager: Handle_Graphic3d_StructureManager &
	:param thePrs:
	:type thePrs: Handle_Graphic3d_Structure &
	:rtype: None
") Graphic3d_Structure;
		 Graphic3d_Structure (const Handle_Graphic3d_StructureManager & theManager,const Handle_Graphic3d_Structure & thePrs);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* if WithDestruction == Standard_True then suppress all the groups of primitives in the structure. and it is mandatory to create a new group in <self>. if WithDestruction == Standard_False then clears all the groups of primitives in the structure. and all the groups are conserved and empty. They will be erased at the next screen update. The structure itself is conserved. The transformation and the attributes of <self> are conserved. The childs of <self> are conserved.

	:param WithDestruction: default value is Standard_True
	:type WithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Standard_Boolean WithDestruction = Standard_True);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Suppresses the structure <self>. It will be erased at the next screen update.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Displays the structure <self> in all the views of the visualiser.

	:rtype: void
") Display;
		virtual void Display ();
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "	* Returns the current display priority for the structure <self>.

	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases the structure <self> in all the views of the visualiser.

	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the structure <self> in all the views of the visualiser, using the following methods: TOHM_COLOR = drawn in the highlight color TOHM_BOUNDBOX = enclosed by the boundary box

	:param theMethod:
	:type theMethod: Aspect_TypeOfHighlightMethod
	:param theColor:
	:type theColor: Quantity_Color &
	:param theToUpdateMgr: default value is Standard_True
	:type theToUpdateMgr: bool
	:rtype: None
") Highlight;
		void Highlight (const Aspect_TypeOfHighlightMethod theMethod,const Quantity_Color & theColor,const Standard_Boolean theToUpdateMgr = Standard_True);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppress the structure <self>. It will be erased at the next screen update. Warning: No more graphic operations in <self> after this call. Category: Methods to modify the class definition

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "	* Computes axis-aligned bounding box of a structure. Category: Methods to modify the class definition

	:rtype: None
") CalculateBoundBox;
		void CalculateBoundBox ();
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "	* If <theToSet> is Standard_True then <self> is infinite and the MinMaxValues method method return : theXMin = theYMin = theZMin = RealFirst(). theXMax = theYMax = theZMax = RealLast(). By default, <self> is not infinite but empty.

	:param theToSet:
	:type theToSet: bool
	:rtype: None
") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean theToSet);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Modifies the order of displaying the structure. Values are between 0 and 10. Structures are drawn according to their display priorities in ascending order. A structure of priority 10 is displayed the last and appears over the others. The default value is 5. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority method erase <self> and display <self> with the new priority. Raises PriorityDefinitionError if <Priority> is greater than 10 or a negative value.

	:param Priority:
	:type Priority: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Standard_Integer Priority);
		%feature("compactdefaultargs") ResetDisplayPriority;
		%feature("autodoc", "	* Reset the current priority of the structure to the previous priority. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority method erase <self> and display <self> with the previous priority.

	:rtype: None
") ResetDisplayPriority;
		void ResetDisplayPriority ();
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID for the structure. The Z layer mechanism allows to display structures presented in higher layers in overlay of structures in lower layers by switching off z buffer depth test between layers

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") SetZLayer;
		void SetZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID of displayed structure. The method returns -1 if the structure has no ID (deleted from graphic driver).

	:rtype: Graphic3d_ZLayerId
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer ();
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Changes a sequence of clip planes slicing the structure on rendering. @param thePlanes [in] the set of clip planes.

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") GetClipPlanes;
		%feature("autodoc", "	* Get clip planes slicing the structure on rendering. returns set of clip planes.

	:rtype: Graphic3d_SequenceOfHClipPlane
") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for lines in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for faces in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for text in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for markers in the structure <self>.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "	* Modifies the visibility indicator to Standard_True or Standard_False for the structure <self>. The default value at the definition of <self> is Standard_True.

	:param AValue:
	:type AValue: bool
	:rtype: None
") SetVisible;
		void SetVisible (const Standard_Boolean AValue);
		%feature("compactdefaultargs") SetVisual;
		%feature("autodoc", "	* Modifies the visualisation mode for the structure <self>.

	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: void
") SetVisual;
		virtual void SetVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("compactdefaultargs") SetZoomLimit;
		%feature("autodoc", "	* Modifies the minimum and maximum zoom coefficients for the structure <self>. The default value at the definition of <self> is unlimited. Category: Methods to modify the class definition Warning: Raises StructureDefinitionError if <LimitInf> is greater than <LimitSup> or if <LimitInf> or <LimitSup> is a negative value.

	:param LimitInf:
	:type LimitInf: float
	:param LimitSup:
	:type LimitSup: float
	:rtype: None
") SetZoomLimit;
		void SetZoomLimit (const Standard_Real LimitInf,const Standard_Real LimitSup);
		%feature("compactdefaultargs") SetIsForHighlight;
		%feature("autodoc", "	* marks the structure <self> representing wired structure needed for highlight only so it won't be added to BVH tree. Category: Methods to modify the class definition

	:param isForHighlight:
	:type isForHighlight: bool
	:rtype: None
") SetIsForHighlight;
		void SetIsForHighlight (const Standard_Boolean isForHighlight);
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppresses the highlight for the structure <self> in all the views of the visualiser.

	:rtype: None
") UnHighlight;
		void UnHighlight ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:rtype: void
") Compute;
		virtual void Compute ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & aStructure);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Returns the new Structure defined for the new visualization

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix,Handle_Graphic3d_Structure & aStructure);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <self> if <self> is displayed and TOS_COMPUTED.

	:rtype: None
") ReCompute;
		void ReCompute ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <self> if <self> is displayed in <aProjetor> and TOS_COMPUTED.

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("compactdefaultargs") FillArea3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "	* Returns the groups sequence included in the structure <self> (internal storage).

	:rtype: Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();
		%feature("compactdefaultargs") NumberOfGroups;
		%feature("autodoc", "	* Returns the current number of groups in the structure <self>.

	:rtype: int
") NumberOfGroups;
		Standard_Integer NumberOfGroups ();
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "	* Append new group to this structure.

	:rtype: Handle_Graphic3d_Group
") NewGroup;
		Handle_Graphic3d_Group NewGroup ();
		%feature("compactdefaultargs") HighlightColor;
		%feature("autodoc", "	* Returns the highlight color for the Highlight method with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.

	:rtype: Quantity_Color
") HighlightColor;
		const Quantity_Color & HighlightColor ();
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is deleted. <self> is deleted after the call Remove (me).

	:rtype: bool
") IsDeleted;
		Standard_Boolean IsDeleted ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns the display indicator for the structure <self>.

	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is empty. Warning: A structure is empty if : it do not have group or all the groups are empties and it do not have descendant or all the descendants are empties.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is infinite.

	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "	* Returns the highlight indicator for the structure <self>.

	:rtype: bool
") IsHighlighted;
		virtual Standard_Boolean IsHighlighted ();
		%feature("compactdefaultargs") IsRotated;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is rotated. <=> The transformation != Identity, != Scale, != Translation.

	:rtype: bool
") IsRotated;
		Standard_Boolean IsRotated ();
		%feature("compactdefaultargs") IsTransformed;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is transformed. <=> The transformation != Identity.

	:rtype: bool
") IsTransformed;
		Standard_Boolean IsTransformed ();
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Returns the visibility indicator for the structure <self>.

	:rtype: bool
") IsVisible;
		Standard_Boolean IsVisible ();
		%feature("compactdefaultargs") Line3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectLine3d
") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("compactdefaultargs") Marker3dAspect;
		%feature("autodoc", "	* Returns the current group of graphic attributes used for 3d marker primitives.

	:rtype: Handle_Graphic3d_AspectMarker3d
") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of the structure <self>. If <theToIgnoreInfiniteFlag> is True, the method returns actual graphical boundaries of the Graphic3d_Group components. Otherwise, the method returns boundaries taking into account infinite state of the structure. This approach generally used for application specific fit operation (e.g. fitting the model into screen, not taking into accout infinite helper elements). Warning: If the structure <self> is empty then the empty box is returned, If the structure <self> is infinite then the whole box is returned.

	:param theToIgnoreInfiniteFlag: default value is Standard_False
	:type theToIgnoreInfiniteFlag: bool
	:rtype: Bnd_Box
") MinMaxValues;
		Bnd_Box MinMaxValues (const Standard_Boolean theToIgnoreInfiniteFlag = Standard_False);
		%feature("compactdefaultargs") PrimitivesAspect;
		%feature("autodoc", "	* Returns the current values of the default attributes.

	:param CTXL:
	:type CTXL: Handle_Graphic3d_AspectLine3d &
	:param CTXT:
	:type CTXT: Handle_Graphic3d_AspectText3d &
	:param CTXM:
	:type CTXM: Handle_Graphic3d_AspectMarker3d &
	:param CTXF:
	:type CTXF: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") PrimitivesAspect;
		void PrimitivesAspect (Handle_Graphic3d_AspectLine3d & CTXL,Handle_Graphic3d_AspectText3d & CTXT,Handle_Graphic3d_AspectMarker3d & CTXM,Handle_Graphic3d_AspectFillArea3d & CTXF);
		%feature("compactdefaultargs") Text3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectText3d
") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("compactdefaultargs") Visual;
		%feature("autodoc", "	* Returns the visualisation mode for the structure <self>.

	:rtype: Graphic3d_TypeOfStructure
") Visual;
		Graphic3d_TypeOfStructure Visual ();
		%feature("compactdefaultargs") AcceptConnection;
		%feature("autodoc", "	* Returns Standard_True if the connection is possible between <AStructure1> and <AStructure2> without a creation of a cycle. //! It's not possible to call the method AStructure1->Connect (AStructure2, TypeOfConnection) if - the set of all ancestors of <AStructure1> contains <AStructure1> and if the TypeOfConnection == TOC_DESCENDANT - the set of all descendants of <AStructure1> contains <AStructure2> and if the TypeOfConnection == TOC_ANCESTOR

	:param AStructure1:
	:type AStructure1: Handle_Graphic3d_Structure &
	:param AStructure2:
	:type AStructure2: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: bool
") AcceptConnection;
		static Standard_Boolean AcceptConnection (const Handle_Graphic3d_Structure & AStructure1,const Handle_Graphic3d_Structure & AStructure2,const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "	* Returns the group of structures to which <self> is connected.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") Ancestors;
		void Ancestors (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* If Atype is TOC_DESCENDANT then add <AStructure> as a child structure of <self>. If Atype is TOC_ANCESTOR then add <AStructure> as a parent structure of <self>. The connection propagates Display, Highlight, Erase, Remove, and stacks the transformations. No connection if the graph of the structures contains a cycle and <WithCheck> is Standard_True;

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:param WithCheck: default value is Standard_False
	:type WithCheck: bool
	:rtype: None
") Connect;
		void Connect (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType,const Standard_Boolean WithCheck = Standard_False);
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "	* Returns the group of structures connected to <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") Descendants;
		void Descendants (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Suppress the connection between <AStructure> and <self>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Disconnect;
		void Disconnect (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "	* If Atype is TOC_DESCENDANT then suppress all the connections with the child structures of <self>. If Atype is TOC_ANCESTOR then suppress all the connections with the parent structures of <self>.

	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None
") DisconnectAll;
		void DisconnectAll (const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") Network;
		%feature("autodoc", "	* Returns <ASet> the group of structures : - directly or indirectly connected to <AStructure> if the TypeOfConnection == TOC_DESCENDANT - to which <AStructure> is directly or indirectly connected if the TypeOfConnection == TOC_ANCESTOR

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:param ASet:
	:type ASet: Graphic3d_MapOfStructure &
	:rtype: void
") Network;
		static void Network (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType,Graphic3d_MapOfStructure & ASet);
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "	:param Owner:
	:type Owner: Standard_Address
	:rtype: None
") SetOwner;
		void SetOwner (const Standard_Address Owner);
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "	:rtype: Standard_Address
") Owner;
		Standard_Address Owner ();
		%feature("compactdefaultargs") SetHLRValidation;
		%feature("autodoc", "	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetHLRValidation;
		void SetHLRValidation (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") HLRValidation;
		%feature("autodoc", "	:rtype: bool
") HLRValidation;
		Standard_Boolean HLRValidation ();
		%feature("compactdefaultargs") Composition;
		%feature("autodoc", "	* Returns the type of composition applied to matrices of transformation of <self>.

	:rtype: Graphic3d_TypeOfComposition
") Composition;
		Graphic3d_TypeOfComposition Composition ();
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	* Modifies the current local modelling transformation in the structure <self>. //! It is defined as a 4*4 real matrix. //! ------------------- | a11 a12 a13 t1 | | a21 a22 a23 t2 | | a31 a32 a33 t3 | | 0 0 0 1 | ------------------- //! TypeOfComposition : TOC_REPLACE TOC_POSTCONCATENATE //! Then the modified Local Modelling Transformation is composed with the current Global Modelling Transformation to create a new Composite Modelling Transformation. //! The compose type specifies the role of the current local modelling transformation (L) in composing the new value for the current local modelling transformation (L'), which is then combined with the current global modelling transforma- tion (G) to calculate the new composite modelling transfor- mation (C). //! TOC_REPLACE The transformation matrix (T) replaces the value of current local modelling transformation (L). //! L' <- T C <- G x L' //! TOC_POSTCONCATENATE The current local modelling transformation (L) is multiplied by the transformation matrix (T): //! L' <- T x L C <- G x L' //! Category: Methods to manage the structure transformation Warning: Raises TransformError if the matrix is not a 4x4 matrix.

	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:param AType:
	:type AType: Graphic3d_TypeOfComposition
	:rtype: None
") SetTransform;
		void SetTransform (const TColStd_Array2OfReal & AMatrix,const Graphic3d_TypeOfComposition AType);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Returns the transformation associated with the structure <self>.

	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") Transform;
		void Transform (TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Modifies the current modelling transform persistence (pan, zoom or rotate)

	:param AFlag:
	:type AFlag: Graphic3d_TransModeFlags &
	:param APoint:
	:type APoint: gp_Pnt
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag,const gp_Pnt & APoint);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	:param AFlag:
	:type AFlag: Graphic3d_TransModeFlags &
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & AFlag);
		%feature("compactdefaultargs") TransformPersistenceMode;
		%feature("autodoc", "	* Get the current modelling transform persistence (pan, zoom or rotate)

	:rtype: Graphic3d_TransModeFlags
") TransformPersistenceMode;
		Graphic3d_TransModeFlags TransformPersistenceMode ();
		%feature("compactdefaultargs") TransformPersistencePoint;
		%feature("autodoc", "	* Get the current point of relative modelling transform persistence

	:rtype: gp_Pnt
") TransformPersistencePoint;
		gp_Pnt TransformPersistencePoint ();
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "	* Sets if the structure location has mutable nature (content or location will be changed regularly).

	:param theIsMutable:
	:type theIsMutable: bool
	:rtype: None
") SetMutable;
		void SetMutable (const Standard_Boolean theIsMutable);
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "	* Returns true if structure has mutable nature (content or location are be changed regularly). Mutable structure will be managed in different way than static onces.

	:rtype: bool
") IsMutable;
		Standard_Boolean IsMutable ();
		%feature("compactdefaultargs") ComputeVisual;
		%feature("autodoc", "	:rtype: Graphic3d_TypeOfStructure
") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual ();
		%feature("compactdefaultargs") GraphicClear;
		%feature("autodoc", "	* Clears the structure <self>.

	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: None
") GraphicClear;
		void GraphicClear (const Standard_Boolean WithDestruction);
		%feature("compactdefaultargs") GraphicConnect;
		%feature("autodoc", "	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") GraphicConnect;
		void GraphicConnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") GraphicDisconnect;
		%feature("autodoc", "	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: None
") GraphicDisconnect;
		void GraphicDisconnect (const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") GraphicHighlight;
		%feature("autodoc", "	* Highlights the structure <self>.

	:param Method:
	:type Method: Aspect_TypeOfHighlightMethod
	:rtype: None
") GraphicHighlight;
		void GraphicHighlight (const Aspect_TypeOfHighlightMethod Method);
		%feature("compactdefaultargs") GraphicTransform;
		%feature("autodoc", "	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: None
") GraphicTransform;
		void GraphicTransform (const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") GraphicUnHighlight;
		%feature("autodoc", "	* Suppress the highlight for the structure <self>.

	:rtype: None
") GraphicUnHighlight;
		void GraphicUnHighlight ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the structure <self>.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
		%feature("compactdefaultargs") PrintNetwork;
		%feature("autodoc", "	* Prints informations about the network associated with the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: void
") PrintNetwork;
		static void PrintNetwork (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppress the adress <APtr> in the list of descendants or in the list of ancestors.

	:param APtr:
	:type APtr: Standard_Address
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None
") Remove;
		void Remove (const Standard_Address APtr,const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") SetComputeVisual;
		%feature("autodoc", "	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: None
") SetComputeVisual;
		void SetComputeVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms <X>, <Y>, <Z> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param NewX:
	:type NewX: float &
	:param NewY:
	:type NewY: float &
	:param NewZ:
	:type NewZ: float &
	:rtype: void
") Transforms;
		static void Transforms (const TColStd_Array2OfReal & ATrsf,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms <Coord> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param Coord:
	:type Coord: Graphic3d_Vector &
	:rtype: Graphic3d_Vector
") Transforms;
		static Graphic3d_Vector Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vector & Coord);
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms <Coord> with the transformation <ATrsf>.

	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:param Coord:
	:type Coord: Graphic3d_Vertex &
	:rtype: Graphic3d_Vertex
") Transforms;
		static Graphic3d_Vertex Transforms (const TColStd_Array2OfReal & ATrsf,const Graphic3d_Vertex & Coord);
		%feature("compactdefaultargs") CStructure;
		%feature("autodoc", "	* Returns the low-level structure

	:rtype: Handle_Graphic3d_CStructure
") CStructure;
		Handle_Graphic3d_CStructure CStructure ();
};


%extend Graphic3d_Structure {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Structure(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Structure::Handle_Graphic3d_Structure %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Structure;
class Handle_Graphic3d_Structure : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_Structure();
        Handle_Graphic3d_Structure(const Handle_Graphic3d_Structure &aHandle);
        Handle_Graphic3d_Structure(const Graphic3d_Structure *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Structure DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Structure {
    Graphic3d_Structure* _get_reference() {
    return (Graphic3d_Structure*)$self->Access();
    }
};

%extend Handle_Graphic3d_Structure {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Structure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_StructureManager;
class Graphic3d_StructureManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Deletes the manager <self>.

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for lines in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for faces in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for text in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & CTX);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the default attributes for markers in the visualiser.

	:param CTX:
	:type CTX: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & CTX);
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "	* Modifies the screen update mode. //! TOU_ASAP	as soon as possible TOU_WAIT	on demand (with the Update function) Note : Dynamic Operations and Update Mode Use SetUpdateMode to control when changes to the display are made. Use one of the following functions to update one or more views: - Update all views of the viewer: Visual3d_ViewManager::Update () - Update one view of the viewer: Visual3d_View::Update () Use one of the following functions to update the entire display: - Redraw all structures in all views: Visual3d_ViewManager::Redraw () - Redraw all structures in one view: Visual3d_View::Redraw () Update)

	:param AType:
	:type AType: Aspect_TypeOfUpdate
	:rtype: None
") SetUpdateMode;
		void SetUpdateMode (const Aspect_TypeOfUpdate AType);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates screen in function of modifications of the structures. Warning: Not necessary if the update mode is TOU_ASAP.

	:rtype: void
") Update;
		virtual void Update ();
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "	* Returns the set of structures displayed in visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") HighlightedStructures;
		%feature("autodoc", "	* Returns the set of highlighted structures in a visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") HighlightedStructures;
		void HighlightedStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") FillArea3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") FillArea3dAspect;
		Handle_Graphic3d_AspectFillArea3d FillArea3dAspect ();
		%feature("compactdefaultargs") Limit;
		%feature("autodoc", "	* Returns maximum number of managers defineable.

	:rtype: int
") Limit;
		static Standard_Integer Limit ();
		%feature("compactdefaultargs") Line3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectLine3d
") Line3dAspect;
		Handle_Graphic3d_AspectLine3d Line3dAspect ();
		%feature("compactdefaultargs") Marker3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectMarker3d
") Marker3dAspect;
		Handle_Graphic3d_AspectMarker3d Marker3dAspect ();
		%feature("compactdefaultargs") PrimitivesAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:param CTXL:
	:type CTXL: Handle_Graphic3d_AspectLine3d &
	:param CTXT:
	:type CTXT: Handle_Graphic3d_AspectText3d &
	:param CTXM:
	:type CTXM: Handle_Graphic3d_AspectMarker3d &
	:param CTXF:
	:type CTXF: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") PrimitivesAspect;
		void PrimitivesAspect (Handle_Graphic3d_AspectLine3d & CTXL,Handle_Graphic3d_AspectText3d & CTXT,Handle_Graphic3d_AspectMarker3d & CTXM,Handle_Graphic3d_AspectFillArea3d & CTXF);
		%feature("compactdefaultargs") Text3dAspect;
		%feature("autodoc", "	* Returns the values of the current default attributes.

	:rtype: Handle_Graphic3d_AspectText3d
") Text3dAspect;
		Handle_Graphic3d_AspectText3d Text3dAspect ();
		%feature("compactdefaultargs") UpdateMode;
		%feature("autodoc", "	* Returns the screen update mode. //! TOU_ASAP	as soon as possible TOU_WAIT	on demand (Update)

	:rtype: Aspect_TypeOfUpdate
") UpdateMode;
		Aspect_TypeOfUpdate UpdateMode ();
		%feature("compactdefaultargs") ChangeDisplayPriority;
		%feature("autodoc", "	* Changes the display priority of the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param OldPriority:
	:type OldPriority: int
	:param NewPriority:
	:type NewPriority: int
	:rtype: void
") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority (const Handle_Graphic3d_Structure & AStructure,const Standard_Integer OldPriority,const Standard_Integer NewPriority);
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "	* Change Z layer for structure. The z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer for all managed views.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings &
	:rtype: void
") SetZLayerSettings;
		virtual void SetZLayerSettings (const Graphic3d_ZLayerId theLayerId,const Graphic3d_ZLayerSettings & theSettings);
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		virtual Graphic3d_ZLayerSettings ZLayerSettings (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level Z layer and get its ID as <theLayerId> value. The method returns Standard_False if the layer can not be created. The z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId &
	:rtype: bool
") AddZLayer;
		virtual Standard_Boolean AddZLayer (Graphic3d_ZLayerId & theLayerId);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there is always a default bottom-level layer that can't be removed.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: bool
") RemoveZLayer;
		virtual Standard_Boolean RemoveZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "	* Return all Z layer ids in sequence ordered by level from lowest layer to highest. The first layer ID in sequence is the default layer that can't be removed.

	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger &
	:rtype: void
") GetAllZLayers;
		virtual void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("compactdefaultargs") CurrentId;
		%feature("autodoc", "	* Returns a current identifier available.

	:rtype: int
") CurrentId;
		static Standard_Integer CurrentId ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> if <AStructure> is displayed and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure <AStructure> if <AStructure> is displayed in <AProjector> and TOS_COMPUTED.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AProjector:
	:type AProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & AStructure,const Handle_Graphic3d_DataStructureManager & AProjector);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Handle_Graphic3d_Structure & AStructure,const Standard_Boolean WithDestruction);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Connects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Connect;
		virtual void Connect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Disconnects the structures <AMother> and <ADaughter>.

	:param AMother:
	:type AMother: Handle_Graphic3d_Structure &
	:param ADaughter:
	:type ADaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Disconnect;
		virtual void Disconnect (const Handle_Graphic3d_Structure & AMother,const Handle_Graphic3d_Structure & ADaughter);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Display;
		virtual void Display (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Erase;
		virtual void Erase (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AMethod:
	:type AMethod: Aspect_TypeOfHighlightMethod
	:rtype: void
") Highlight;
		virtual void Highlight (const Handle_Graphic3d_Structure & AStructure,const Aspect_TypeOfHighlightMethod AMethod);
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	* Transforms the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param ATrsf:
	:type ATrsf: TColStd_Array2OfReal &
	:rtype: void
") SetTransform;
		virtual void SetTransform (const Handle_Graphic3d_Structure & AStructure,const TColStd_Array2OfReal & ATrsf);
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "	* Returns the graphic driver of <self>.

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		Handle_Graphic3d_GraphicDriver GraphicDriver ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the manager.

	:rtype: int
") Identification;
		virtual Standard_Integer Identification ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the structure with the identification number <AId>.

	:param AId:
	:type AId: int
	:rtype: Handle_Graphic3d_Structure
") Identification;
		virtual Handle_Graphic3d_Structure Identification (const Standard_Integer AId);
		%feature("compactdefaultargs") NewIdentification;
		%feature("autodoc", "	* Returns a new identification number for a new structure in the manager.

	:rtype: int
") NewIdentification;
		Standard_Integer NewIdentification ();
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppresses the highlighting on all the structures in <self>.

	:rtype: void
") UnHighlight;
		virtual void UnHighlight ();
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppress the highlighting on the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") UnHighlight;
		virtual void UnHighlight (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "	:rtype: None
") RecomputeStructures;
		void RecomputeStructures ();
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "	* Recomputes all structures from theStructures.

	:param theStructures:
	:type theStructures: Graphic3d_MapOfStructure &
	:rtype: None
") RecomputeStructures;
		void RecomputeStructures (const Graphic3d_MapOfStructure & theStructures);
		%feature("compactdefaultargs") RegisterObject;
		%feature("autodoc", "	:param theObject:
	:type theObject: Handle_Standard_Transient &
	:rtype: Handle_Graphic3d_ViewAffinity
") RegisterObject;
		Handle_Graphic3d_ViewAffinity RegisterObject (const Handle_Standard_Transient & theObject);
		%feature("compactdefaultargs") UnregisterObject;
		%feature("autodoc", "	:param theObject:
	:type theObject: Handle_Standard_Transient &
	:rtype: None
") UnregisterObject;
		void UnregisterObject (const Handle_Standard_Transient & theObject);
		%feature("compactdefaultargs") ObjectAffinity;
		%feature("autodoc", "	:param theObject:
	:type theObject: Handle_Standard_Transient &
	:rtype: Handle_Graphic3d_ViewAffinity
") ObjectAffinity;
		Handle_Graphic3d_ViewAffinity ObjectAffinity (const Handle_Standard_Transient & theObject);
};


%extend Graphic3d_StructureManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_StructureManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_StructureManager::Handle_Graphic3d_StructureManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_StructureManager;
class Handle_Graphic3d_StructureManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_StructureManager();
        Handle_Graphic3d_StructureManager(const Handle_Graphic3d_StructureManager &aHandle);
        Handle_Graphic3d_StructureManager(const Graphic3d_StructureManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_StructureManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_StructureManager {
    Graphic3d_StructureManager* _get_reference() {
    return (Graphic3d_StructureManager*)$self->Access();
    }
};

%extend Handle_Graphic3d_StructureManager {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_StructureManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_TextureParams;
class Graphic3d_TextureParams : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Graphic3d_TextureParams;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") Graphic3d_TextureParams;
		 Graphic3d_TextureParams ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "	* returns True if the texture is modulate. Default value is False.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("compactdefaultargs") SetModulate;
		%feature("autodoc", "	* @param theToModulate turn modulation on/off.

	:param theToModulate:
	:type theToModulate: bool
	:rtype: None
") SetModulate;
		void SetModulate (const Standard_Boolean theToModulate);
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "	* returns True if the texture repeat is enabled. Default value is False.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("compactdefaultargs") SetRepeat;
		%feature("autodoc", "	* @param theToRepeat turn texture repeat mode ON or OFF (clamping).

	:param theToRepeat:
	:type theToRepeat: bool
	:rtype: None
") SetRepeat;
		void SetRepeat (const Standard_Boolean theToRepeat);
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	* returns texture interpolation filter. Default value is Graphic3d_TOTF_NEAREST.

	:rtype: Graphic3d_TypeOfTextureFilter
") Filter;
		Graphic3d_TypeOfTextureFilter Filter ();
		%feature("compactdefaultargs") SetFilter;
		%feature("autodoc", "	* @param theFilter texture interpolation filter.

	:param theFilter:
	:type theFilter: Graphic3d_TypeOfTextureFilter
	:rtype: None
") SetFilter;
		void SetFilter (const Graphic3d_TypeOfTextureFilter theFilter);
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* returns rotation angle in degrees Default value is 0.

	:rtype: Standard_ShortReal
") Rotation;
		Standard_ShortReal Rotation ();
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* @param theAngleDegrees rotation angle.

	:param theAngleDegrees:
	:type theAngleDegrees: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theAngleDegrees);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* returns scale factor Default value is no scaling (1.0; 1.0).

	:rtype: Graphic3d_Vec2
") Scale;
		const Graphic3d_Vec2 & Scale ();
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* @param theScale scale factor.

	:param theScale:
	:type theScale: Graphic3d_Vec2
	:rtype: None
") SetScale;
		void SetScale (const Graphic3d_Vec2 theScale);
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "	* returns translation vector Default value is no translation (0.0; 0.0).

	:rtype: Graphic3d_Vec2
") Translation;
		const Graphic3d_Vec2 & Translation ();
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	* @param theVec translation vector.

	:param theVec:
	:type theVec: Graphic3d_Vec2
	:rtype: None
") SetTranslation;
		void SetTranslation (const Graphic3d_Vec2 theVec);
		%feature("compactdefaultargs") GenMode;
		%feature("autodoc", "	* returns texture coordinates generation mode. Default value is Graphic3d_TOTM_MANUAL.

	:rtype: Graphic3d_TypeOfTextureMode
") GenMode;
		Graphic3d_TypeOfTextureMode GenMode ();
		%feature("compactdefaultargs") GenPlaneS;
		%feature("autodoc", "	* returns texture coordinates generation plane S.

	:rtype: Graphic3d_Vec4
") GenPlaneS;
		const Graphic3d_Vec4 & GenPlaneS ();
		%feature("compactdefaultargs") GenPlaneT;
		%feature("autodoc", "	* returns texture coordinates generation plane T.

	:rtype: Graphic3d_Vec4
") GenPlaneT;
		const Graphic3d_Vec4 & GenPlaneT ();
		%feature("compactdefaultargs") SetGenMode;
		%feature("autodoc", "	* Setup texture coordinates generation mode.

	:param theMode:
	:type theMode: Graphic3d_TypeOfTextureMode
	:param thePlaneS:
	:type thePlaneS: Graphic3d_Vec4
	:param thePlaneT:
	:type thePlaneT: Graphic3d_Vec4
	:rtype: None
") SetGenMode;
		void SetGenMode (const Graphic3d_TypeOfTextureMode theMode,const Graphic3d_Vec4 thePlaneS,const Graphic3d_Vec4 thePlaneT);
};


%extend Graphic3d_TextureParams {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureParams(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureParams::Handle_Graphic3d_TextureParams %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureParams;
class Handle_Graphic3d_TextureParams : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_TextureParams();
        Handle_Graphic3d_TextureParams(const Handle_Graphic3d_TextureParams &aHandle);
        Handle_Graphic3d_TextureParams(const Graphic3d_TextureParams *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureParams DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureParams {
    Graphic3d_TextureParams* _get_reference() {
    return (Graphic3d_TextureParams*)$self->Access();
    }
};

%extend Handle_Graphic3d_TextureParams {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_TextureParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_TextureRoot;
class Graphic3d_TextureRoot : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if a texture class is valid or not. returns true if the construction of the class is correct

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "	* Returns the full path of the defined texture. It could be empty path if GetImage() is overridden to load image not from file.

	:rtype: OSD_Path
") Path;
		const OSD_Path & Path ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* returns the texture type.

	:rtype: Graphic3d_TypeOfTexture
") Type;
		Graphic3d_TypeOfTexture Type ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* This ID will be used to manage resource in graphic driver. //! Default implementation generates unique ID although inheritors may re-initialize it. //! Multiple Graphic3d_TextureRoot instancies with same ID will be treated as single texture with different parameters to optimize memory usage though this will be more natural to use same instance of Graphic3d_TextureRoot when possible. //! Notice that inheritor may set this ID to empty string. In this case independent graphical resource will be created for each instance of Graphic3d_AspectFillArea3d where texture will be used. //! returns texture identifier.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "	* This method will be called by graphic driver each time when texture resource should be created. Default constructors allow defining the texture source as path to texture image or directly as pixmap. If the source is defined as path, then the image will be dynamically loaded when this method is called (and no copy will be preserved in this class instance). Inheritors may dynamically generate the image. Notice, image data should be in Bottom-Up order (see Image_PixMap::IsTopDown())! returns the image for texture.

	:rtype: Image_PixMap_Handle
") GetImage;
		virtual Image_PixMap_Handle GetImage ();
		%feature("compactdefaultargs") GetParams;
		%feature("autodoc", "	* returns low-level texture parameters

	:rtype: Handle_Graphic3d_TextureParams
") GetParams;
		Handle_Graphic3d_TextureParams GetParams ();
		%feature("compactdefaultargs") TexturesFolder;
		%feature("autodoc", "	* The path to textures determined from CSF_MDTVTexturesDirectory or CASROOT environment variables. returns the root folder with default textures.

	:rtype: TCollection_AsciiString
") TexturesFolder;
		static TCollection_AsciiString TexturesFolder ();
};


%extend Graphic3d_TextureRoot {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureRoot(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureRoot::Handle_Graphic3d_TextureRoot %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureRoot;
class Handle_Graphic3d_TextureRoot : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Graphic3d_TextureRoot();
        Handle_Graphic3d_TextureRoot(const Handle_Graphic3d_TextureRoot &aHandle);
        Handle_Graphic3d_TextureRoot(const Graphic3d_TextureRoot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureRoot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureRoot {
    Graphic3d_TextureRoot* _get_reference() {
    return (Graphic3d_TextureRoot*)$self->Access();
    }
};

%extend Handle_Graphic3d_TextureRoot {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_TextureRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec2>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec2> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec2i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec3>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec3> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec3i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec4>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec4> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Graphic3d_Vec4i>;
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Standard_Integer>;
class Graphic3d_UniformValueTypeID<Standard_Integer> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Standard_Integer> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_UniformValueTypeID<Standard_ShortReal>;
class Graphic3d_UniformValueTypeID<Standard_ShortReal> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Standard_ShortReal> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ValueInterface;
class Graphic3d_ValueInterface {
	public:
		%feature("compactdefaultargs") TypeID;
		%feature("autodoc", "	* Returns unique identifier of value type.

	:rtype: Standard_Size
") TypeID;
		Standard_Size TypeID ();
};


%extend Graphic3d_ValueInterface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Vector;
class Graphic3d_Vector {
	public:
		%feature("compactdefaultargs") Graphic3d_Vector;
		%feature("autodoc", "	* Creates a vector with 1.0, 0.0, 0.0 coordinates.

	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector ();
		%feature("compactdefaultargs") Graphic3d_Vector;
		%feature("autodoc", "	* Creates a vector with <AX>, <AY>, <AZ> coordinates.

	:param AX:
	:type AX: float
	:param AY:
	:type AY: float
	:param AZ:
	:type AZ: float
	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("compactdefaultargs") Graphic3d_Vector;
		%feature("autodoc", "	* Creates a vector from 2 points <APoint1> and <APoint2>.

	:param APoint1:
	:type APoint1: Graphic3d_Vertex &
	:param APoint2:
	:type APoint2: Graphic3d_Vertex &
	:rtype: None
") Graphic3d_Vector;
		 Graphic3d_Vector (const Graphic3d_Vertex & APoint1,const Graphic3d_Vertex & APoint2);
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* Normalises <self>. Category: Methods to modify the class definition Warning: Raises VectorError if <self> is null.

	:rtype: None
") Normalize;
		void Normalize ();
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Modifies the coordinates of the vector <self>.

	:param Xnew:
	:type Xnew: float
	:param Ynew:
	:type Ynew: float
	:param Znew:
	:type Znew: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real Xnew,const Standard_Real Ynew,const Standard_Real Znew);
		%feature("compactdefaultargs") SetXCoord;
		%feature("autodoc", "	* Modifies the X coordinate of the vector <self>.

	:param Xnew:
	:type Xnew: float
	:rtype: None
") SetXCoord;
		void SetXCoord (const Standard_Real Xnew);
		%feature("compactdefaultargs") SetYCoord;
		%feature("autodoc", "	* Modifies the Y coordinate of the vector <self>.

	:param Ynew:
	:type Ynew: float
	:rtype: None
") SetYCoord;
		void SetYCoord (const Standard_Real Ynew);
		%feature("compactdefaultargs") SetZCoord;
		%feature("autodoc", "	* Modifies the Z coordinate of the vector <self>.

	:param Znew:
	:type Znew: float
	:rtype: None
") SetZCoord;
		void SetZCoord (const Standard_Real Znew);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinates of the vector <self>.

	:param AX:
	:type AX: float &
	:param AY:
	:type AY: float &
	:param AZ:
	:type AZ: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsNormalized;
		%feature("autodoc", "	* Returns Standard_True if <self> has length 1.

	:rtype: bool
") IsNormalized;
		Standard_Boolean IsNormalized ();
		%feature("compactdefaultargs") LengthZero;
		%feature("autodoc", "	* Returns Standard_True if <self> has length zero.

	:rtype: bool
") LengthZero;
		Standard_Boolean LengthZero ();
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* Returns the X coordinates of the vector <self>.

	:rtype: float
") X;
		Standard_Real X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* Returns the Y coordinate of the vector <self>.

	:rtype: float
") Y;
		Standard_Real Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* Returns the Z coordinate of the vector <self>.

	:rtype: float
") Z;
		Standard_Real Z ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns Standard_True if the vector <AV1> and <AV2> are parallel.

	:param AV1:
	:type AV1: Graphic3d_Vector &
	:param AV2:
	:type AV2: Graphic3d_Vector &
	:rtype: bool
") IsParallel;
		static Standard_Boolean IsParallel (const Graphic3d_Vector & AV1,const Graphic3d_Vector & AV2);
		%feature("compactdefaultargs") NormeOf;
		%feature("autodoc", "	* Returns the norm of the vector <AX>, <AY>, <AZ>.

	:param AX:
	:type AX: float
	:param AY:
	:type AY: float
	:param AZ:
	:type AZ: float
	:rtype: float
") NormeOf;
		static Standard_Real NormeOf (const Standard_Real AX,const Standard_Real AY,const Standard_Real AZ);
		%feature("compactdefaultargs") NormeOf;
		%feature("autodoc", "	* Returns the norm of the vector <AVector>.

	:param AVector:
	:type AVector: Graphic3d_Vector &
	:rtype: float
") NormeOf;
		static Standard_Real NormeOf (const Graphic3d_Vector & AVector);
};


%extend Graphic3d_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Vertex;
class Graphic3d_Vertex : public TEL_POINT {
	public:
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with 0.0, 0.0, 0.0 coordinates.

	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex ();
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with coordinates identical to thePoint.

	:param thePoint:
	:type thePoint: Graphic3d_Vertex &
	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Graphic3d_Vertex & thePoint);
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with theX, theY and theZ coordinates.

	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "	* Creates a point with theX, theY and theZ coordinates.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None
") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Modifies the coordinates.

	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "	* Modifies the coordinates.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None
") SetCoord;
		void SetCoord (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinates.

	:param theX:
	:type theX: Standard_ShortReal &
	:param theY:
	:type theY: Standard_ShortReal &
	:param theZ:
	:type theZ: Standard_ShortReal &
	:rtype: None
") Coord;
		void Coord (Standard_ShortReal & theX,Standard_ShortReal & theY,Standard_ShortReal & theZ);
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	* Returns the coordinates.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: None
") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") X;
		%feature("autodoc", "	* Returns the X coordinates.

	:rtype: Standard_ShortReal
") X;
		Standard_ShortReal X ();
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "	* Returns the Y coordinate.

	:rtype: Standard_ShortReal
") Y;
		Standard_ShortReal Y ();
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "	* Returns the Z coordinate.

	:rtype: Standard_ShortReal
") Z;
		Standard_ShortReal Z ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Returns the distance between two points.

	:param theOther:
	:type theOther: Graphic3d_Vertex &
	:rtype: Standard_ShortReal
") Distance;
		Standard_ShortReal Distance (const Graphic3d_Vertex & theOther);
};


%extend Graphic3d_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ViewAffinity;
class Graphic3d_ViewAffinity : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Graphic3d_ViewAffinity;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Graphic3d_ViewAffinity;
		 Graphic3d_ViewAffinity ();
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Return visibility flag.

	:param theViewId:
	:type theViewId: int
	:rtype: bool
") IsVisible;
		bool IsVisible (const Standard_Integer theViewId);
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "	* Setup visibility flag.

	:param theViewId:
	:type theViewId: int
	:param theIsVisible:
	:type theIsVisible: bool
	:rtype: None
") SetVisible;
		void SetVisible (const Standard_Integer theViewId,const bool theIsVisible);
};


%extend Graphic3d_ViewAffinity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ViewAffinity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ViewAffinity::Handle_Graphic3d_ViewAffinity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ViewAffinity;
class Handle_Graphic3d_ViewAffinity : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Graphic3d_ViewAffinity();
        Handle_Graphic3d_ViewAffinity(const Handle_Graphic3d_ViewAffinity &aHandle);
        Handle_Graphic3d_ViewAffinity(const Graphic3d_ViewAffinity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ViewAffinity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ViewAffinity {
    Graphic3d_ViewAffinity* _get_reference() {
    return (Graphic3d_ViewAffinity*)$self->Access();
    }
};

%extend Handle_Graphic3d_ViewAffinity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ViewAffinity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ZLayerSettings;
class Graphic3d_ZLayerSettings {
	public:
		Standard_ShortReal DepthOffsetFactor;
		Standard_ShortReal DepthOffsetUnits;
		int Flags;
		bool IsImmediate;
		%feature("compactdefaultargs") Graphic3d_ZLayerSettings;
		%feature("autodoc", "	* Default settings.

	:rtype: None
") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings ();
		%feature("compactdefaultargs") IsSettingEnabled;
		%feature("autodoc", "	* Returns true if theSetting is enabled.

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: bool
") IsSettingEnabled;
		const Standard_Boolean IsSettingEnabled (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") EnableSetting;
		%feature("autodoc", "	* Enables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") EnableSetting;
		void EnableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") DisableSetting;
		%feature("autodoc", "	* Disables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") DisableSetting;
		void DisableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") SetDepthOffsetPositive;
		%feature("autodoc", "	* Sets minimal possible positive depth offset. Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.

	:rtype: None
") SetDepthOffsetPositive;
		void SetDepthOffsetPositive ();
		%feature("compactdefaultargs") SetDepthOffsetNegative;
		%feature("autodoc", "	* Sets minimal possible negative depth offset. Access DepthOffsetFactor and DepthOffsetUnits values for manual offset control.

	:rtype: None
") SetDepthOffsetNegative;
		void SetDepthOffsetNegative ();
};


%extend Graphic3d_ZLayerSettings {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfPoints;
class Graphic3d_ArrayOfPoints : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "	* Creates an array of points, a single pixel point is drawn at each vertex. The array must be filled using the AddVertex(Point) method. When <hasVColors> is True , you must use only AddVertex(Point,Color) method. When <hasVNormals> is True , you must use only AddVertex(Point,Normal) method.

	:param maxVertexs:
	:type maxVertexs: int
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:rtype: None
") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints (const Standard_Integer maxVertexs,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasVNormals = Standard_False);
};


%extend Graphic3d_ArrayOfPoints {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPoints(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPoints::Handle_Graphic3d_ArrayOfPoints %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPoints;
class Handle_Graphic3d_ArrayOfPoints : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPoints();
        Handle_Graphic3d_ArrayOfPoints(const Handle_Graphic3d_ArrayOfPoints &aHandle);
        Handle_Graphic3d_ArrayOfPoints(const Graphic3d_ArrayOfPoints *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPoints DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPoints {
    Graphic3d_ArrayOfPoints* _get_reference() {
    return (Graphic3d_ArrayOfPoints*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfPoints {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfPoints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfPolygons;
class Graphic3d_ArrayOfPolygons : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "	* Creates an array of polygons, a polygon can be filled as: 1) creating a single polygon defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfPolygons(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate polygons defined with a predefined number of bounds and the number of vertex per bound. i.e: myArray = Graphic3d_ArrayOfPolygons(7,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(3) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x7,y7,z7) 3) creating a single indexed polygon defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfPolygons(4,0,6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(4) 4) creating separate polygons defined with a predefined number of bounds and the number of edges per bound. i.e: myArray = Graphic3d_ArrayOfPolygons(6,4,14) myArray->AddBound(3) myArray->AddVertex(x1,y1,z1) myArray->AddVertex(x2,y2,z2) myArray->AddVertex(x3,y3,z3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddBound(3) myArray->AddVertex(x4,y4,z4) myArray->AddVertex(x5,y5,z5) myArray->AddVertex(x6,y6,z6) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(1) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(4) <maxVertexs> defined the maximun allowed vertex number in the array. <maxBounds> defined the maximun allowed bound number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasBColors> is True , <maxBounds> must be > 0 and you must use the AddBound(number,Color) method. Warning: the user is responsible about the orientation of the polygon depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxBounds: default value is 0
	:type maxBounds: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasBColors: default value is Standard_False
	:type hasBColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons (const Standard_Integer maxVertexs,const Standard_Integer maxBounds = 0,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasBColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfPolygons {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPolygons(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPolygons::Handle_Graphic3d_ArrayOfPolygons %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPolygons;
class Handle_Graphic3d_ArrayOfPolygons : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPolygons();
        Handle_Graphic3d_ArrayOfPolygons(const Handle_Graphic3d_ArrayOfPolygons &aHandle);
        Handle_Graphic3d_ArrayOfPolygons(const Graphic3d_ArrayOfPolygons *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPolygons DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPolygons {
    Graphic3d_ArrayOfPolygons* _get_reference() {
    return (Graphic3d_ArrayOfPolygons*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfPolygons {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfPolygons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfPolylines;
class Graphic3d_ArrayOfPolylines : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "	* Creates an array of polylines, a polyline can be filled as: 1) creating a single polyline defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfPolylines(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate polylines defined with a predefined number of bounds and the number of vertex per bound. i.e: myArray = Graphic3d_ArrayOfPolylines(7,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(3) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x7,y7,z7) 3) creating a single indexed polyline defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfPolylines(4,0,6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(4) 4) creating separate polylines defined with a predefined number of bounds and the number of edges per bound. i.e: myArray = Graphic3d_ArrayOfPolylines(6,4,14) myArray->AddBound(3) myArray->AddVertex(x1,y1,z1) myArray->AddVertex(x2,y2,z2) myArray->AddVertex(x3,y3,z3) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddBound(3) myArray->AddVertex(x4,y4,z4) myArray->AddVertex(x5,y5,z5) myArray->AddVertex(x6,y6,z6) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(6) myArray->AddBound(4) myArray->AddEdge(1) myArray->AddEdge(3) myArray->AddEdge(5) myArray->AddEdge(4) //! <maxVertexs> defined the maximun allowed vertex number in the array. <maxBounds> defined the maximun allowed bound number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasBColors> is True , <maxBounds> must be > 0 and you must use the AddBound(number,Color) method.

	:param maxVertexs:
	:type maxVertexs: int
	:param maxBounds: default value is 0
	:type maxBounds: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasBColors: default value is Standard_False
	:type hasBColors: bool
	:rtype: None
") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines (const Standard_Integer maxVertexs,const Standard_Integer maxBounds = 0,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasBColors = Standard_False);
};


%extend Graphic3d_ArrayOfPolylines {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfPolylines(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfPolylines::Handle_Graphic3d_ArrayOfPolylines %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfPolylines;
class Handle_Graphic3d_ArrayOfPolylines : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfPolylines();
        Handle_Graphic3d_ArrayOfPolylines(const Handle_Graphic3d_ArrayOfPolylines &aHandle);
        Handle_Graphic3d_ArrayOfPolylines(const Graphic3d_ArrayOfPolylines *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfPolylines DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfPolylines {
    Graphic3d_ArrayOfPolylines* _get_reference() {
    return (Graphic3d_ArrayOfPolylines*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfPolylines {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfPolylines {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfQuadrangleStrips;
class Graphic3d_ArrayOfQuadrangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "	* Creates an array of quadrangle strips, a polygon can be filled as: 1) creating a single strip defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfQuadrangleStrips(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip. i.e: myArray = Graphic3d_ArrayOfQuadrangleStrips(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x8,y8,z8) //! <maxVertexs> defined the maximun allowed vertex number in the array. <maxStrips> defined the maximun allowed strip number in the array. The number of quadrangle really drawn is : VertexNumber()/2-Min(1,BoundNumber())

	:param maxVertexs:
	:type maxVertexs: int
	:param maxStrips: default value is 0
	:type maxStrips: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasSColors: default value is Standard_False
	:type hasSColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips (const Standard_Integer maxVertexs,const Standard_Integer maxStrips = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasSColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfQuadrangleStrips {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfQuadrangleStrips(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfQuadrangleStrips::Handle_Graphic3d_ArrayOfQuadrangleStrips %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfQuadrangleStrips;
class Handle_Graphic3d_ArrayOfQuadrangleStrips : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfQuadrangleStrips();
        Handle_Graphic3d_ArrayOfQuadrangleStrips(const Handle_Graphic3d_ArrayOfQuadrangleStrips &aHandle);
        Handle_Graphic3d_ArrayOfQuadrangleStrips(const Graphic3d_ArrayOfQuadrangleStrips *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfQuadrangleStrips DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfQuadrangleStrips {
    Graphic3d_ArrayOfQuadrangleStrips* _get_reference() {
    return (Graphic3d_ArrayOfQuadrangleStrips*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfQuadrangleStrips {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfQuadrangleStrips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfQuadrangles;
class Graphic3d_ArrayOfQuadrangles : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "	* Creates an array of quadrangles, a quadrangle can be filled as: 1) creating a set of quadrangles defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfQuadrangles(8) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x8,y8,z8) 3) creating a set of indexed quadrangles defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfQuadrangles(6,8) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x6,y6,z6) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(5) myArray->AddEdge(6) //! <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. Warning: the user is responsible about the orientation of the quadrangle depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles (const Standard_Integer maxVertexs,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfQuadrangles {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfQuadrangles(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfQuadrangles::Handle_Graphic3d_ArrayOfQuadrangles %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfQuadrangles;
class Handle_Graphic3d_ArrayOfQuadrangles : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfQuadrangles();
        Handle_Graphic3d_ArrayOfQuadrangles(const Handle_Graphic3d_ArrayOfQuadrangles &aHandle);
        Handle_Graphic3d_ArrayOfQuadrangles(const Graphic3d_ArrayOfQuadrangles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfQuadrangles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfQuadrangles {
    Graphic3d_ArrayOfQuadrangles* _get_reference() {
    return (Graphic3d_ArrayOfQuadrangles*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfQuadrangles {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfQuadrangles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfSegments;
class Graphic3d_ArrayOfSegments : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "	* Creates an array of segments, a segment can be filled as: 1) creating a set of segments defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfSegments(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) 2) creating a set of indexed segments defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfSegments(4,0,8) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) myArray->AddEdge(2) myArray->AddEdge(4) myArray->AddEdge(1) myArray->AddEdge(3) //! <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVColors> is True , you must use only AddVertex(Point,Color) method

	:param maxVertexs:
	:type maxVertexs: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:rtype: None
") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments (const Standard_Integer maxVertexs,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVColors = Standard_False);
};


%extend Graphic3d_ArrayOfSegments {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfSegments(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfSegments::Handle_Graphic3d_ArrayOfSegments %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfSegments;
class Handle_Graphic3d_ArrayOfSegments : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfSegments();
        Handle_Graphic3d_ArrayOfSegments(const Handle_Graphic3d_ArrayOfSegments &aHandle);
        Handle_Graphic3d_ArrayOfSegments(const Graphic3d_ArrayOfSegments *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfSegments DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfSegments {
    Graphic3d_ArrayOfSegments* _get_reference() {
    return (Graphic3d_ArrayOfSegments*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfSegments {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfSegments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfTriangleFans;
class Graphic3d_ArrayOfTriangleFans : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "	* Creates an array of triangle fans, a polygon can be filled as: 1) creating a single fan defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangleFans(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate fans defined with a predefined number of fans and the number of vertex per fan. i.e: myArray = Graphic3d_ArrayOfTriangleFans(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x8,y8,z8) //! <maxVertexs> defined the maximun allowed vertex number in the array. <maxFans> defined the maximun allowed fan number in the array. The number of triangle really drawn is : VertexNumber()-2*Min(1,BoundNumber())

	:param maxVertexs:
	:type maxVertexs: int
	:param maxFans: default value is 0
	:type maxFans: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasFColors: default value is Standard_False
	:type hasFColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans (const Standard_Integer maxVertexs,const Standard_Integer maxFans = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasFColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfTriangleFans {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfTriangleFans(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfTriangleFans::Handle_Graphic3d_ArrayOfTriangleFans %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfTriangleFans;
class Handle_Graphic3d_ArrayOfTriangleFans : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfTriangleFans();
        Handle_Graphic3d_ArrayOfTriangleFans(const Handle_Graphic3d_ArrayOfTriangleFans &aHandle);
        Handle_Graphic3d_ArrayOfTriangleFans(const Graphic3d_ArrayOfTriangleFans *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfTriangleFans DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfTriangleFans {
    Graphic3d_ArrayOfTriangleFans* _get_reference() {
    return (Graphic3d_ArrayOfTriangleFans*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfTriangleFans {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfTriangleFans {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfTriangleStrips;
class Graphic3d_ArrayOfTriangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "	* Creates an array of triangle strips, a polygon can be filled as: 1) creating a single strip defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangleStrips(7) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x7,y7,z7) 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip. i.e: myArray = Graphic3d_ArrayOfTriangleStrips(8,2) myArray->AddBound(4) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddBound(4) myArray->AddVertex(x5,y5,z5) .... myArray->AddVertex(x8,y8,z8) //! <maxVertexs> defined the maximun allowed vertex number in the array. <maxStrips> defined the maximun allowed strip number in the array. The number of triangle really drawn is : VertexNumber()-2*Min(1,BoundNumber()) Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. When <hasBColors> is True , <maxBounds> must be > 0 and you must use the AddBound(number,Color) method. Warning: the user is responsible about the orientation of the strip depending of the order of the created vertex and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxStrips: default value is 0
	:type maxStrips: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasSColors: default value is Standard_False
	:type hasSColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips (const Standard_Integer maxVertexs,const Standard_Integer maxStrips = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasSColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfTriangleStrips {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfTriangleStrips(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfTriangleStrips::Handle_Graphic3d_ArrayOfTriangleStrips %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfTriangleStrips;
class Handle_Graphic3d_ArrayOfTriangleStrips : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfTriangleStrips();
        Handle_Graphic3d_ArrayOfTriangleStrips(const Handle_Graphic3d_ArrayOfTriangleStrips &aHandle);
        Handle_Graphic3d_ArrayOfTriangleStrips(const Graphic3d_ArrayOfTriangleStrips *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfTriangleStrips DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfTriangleStrips {
    Graphic3d_ArrayOfTriangleStrips* _get_reference() {
    return (Graphic3d_ArrayOfTriangleStrips*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfTriangleStrips {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfTriangleStrips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ArrayOfTriangles;
class Graphic3d_ArrayOfTriangles : public Graphic3d_ArrayOfPrimitives {
	public:
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "	* Creates an array of triangles, a triangle can be filled as: 1) creating a set of triangles defined with his vertexs. i.e: myArray = Graphic3d_ArrayOfTriangles(6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x6,y6,z6) 3) creating a set of indexed triangles defined with his vertex ans edges. i.e: myArray = Graphic3d_ArrayOfTriangles(4,6) myArray->AddVertex(x1,y1,z1) .... myArray->AddVertex(x4,y4,z4) myArray->AddEdge(1) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(2) myArray->AddEdge(3) myArray->AddEdge(4) //! <maxVertexs> defined the maximun allowed vertex number in the array. <maxEdges> defined the maximun allowed edge number in the array. Warning: When <hasVNormals> is True , you must use one of AddVertex(Point,Normal) or AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) methods. When <hasVColors> is True , you must use one of AddVertex(Point,Color) or AddVertex(Point,Normal,Color) methods. When <hasTexels> is True , you must use one of AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) methods. Warning: the user is responsible about the orientation of the triangle depending of the order of the created vertex or edges and this orientation must be coherent with the vertex normal optionnaly given at each vertex (See the Orientate() methods).

	:param maxVertexs:
	:type maxVertexs: int
	:param maxEdges: default value is 0
	:type maxEdges: int
	:param hasVNormals: default value is Standard_False
	:type hasVNormals: bool
	:param hasVColors: default value is Standard_False
	:type hasVColors: bool
	:param hasTexels: default value is Standard_False
	:type hasTexels: bool
	:rtype: None
") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles (const Standard_Integer maxVertexs,const Standard_Integer maxEdges = 0,const Standard_Boolean hasVNormals = Standard_False,const Standard_Boolean hasVColors = Standard_False,const Standard_Boolean hasTexels = Standard_False);
};


%extend Graphic3d_ArrayOfTriangles {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_ArrayOfTriangles(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_ArrayOfTriangles::Handle_Graphic3d_ArrayOfTriangles %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_ArrayOfTriangles;
class Handle_Graphic3d_ArrayOfTriangles : public Handle_Graphic3d_ArrayOfPrimitives {

    public:
        // constructors
        Handle_Graphic3d_ArrayOfTriangles();
        Handle_Graphic3d_ArrayOfTriangles(const Handle_Graphic3d_ArrayOfTriangles &aHandle);
        Handle_Graphic3d_ArrayOfTriangles(const Graphic3d_ArrayOfTriangles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_ArrayOfTriangles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_ArrayOfTriangles {
    Graphic3d_ArrayOfTriangles* _get_reference() {
    return (Graphic3d_ArrayOfTriangles*)$self->Access();
    }
};

%extend Handle_Graphic3d_ArrayOfTriangles {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_ArrayOfTriangles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_TextureEnv;
class Graphic3d_TextureEnv : public Graphic3d_TextureRoot {
	public:
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "	* Creates an environment texture from a file.

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "	* Creates an environment texture from a predefined texture name set.

	:param theName:
	:type theName: Graphic3d_NameOfTextureEnv
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const Graphic3d_NameOfTextureEnv theName);
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "	* Creates an environment texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const Image_PixMap_Handle & thePixMap);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_ENV_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTextureEnv
") Name;
		Graphic3d_NameOfTextureEnv Name ();
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param theRank:
	:type theRank: int
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);
};


%extend Graphic3d_TextureEnv {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureEnv(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureEnv::Handle_Graphic3d_TextureEnv %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureEnv;
class Handle_Graphic3d_TextureEnv : public Handle_Graphic3d_TextureRoot {

    public:
        // constructors
        Handle_Graphic3d_TextureEnv();
        Handle_Graphic3d_TextureEnv(const Handle_Graphic3d_TextureEnv &aHandle);
        Handle_Graphic3d_TextureEnv(const Graphic3d_TextureEnv *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureEnv DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureEnv {
    Graphic3d_TextureEnv* _get_reference() {
    return (Graphic3d_TextureEnv*)$self->Access();
    }
};

%extend Handle_Graphic3d_TextureEnv {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_TextureEnv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_TextureMap;
class Graphic3d_TextureMap : public Graphic3d_TextureRoot {
	public:
		%feature("compactdefaultargs") EnableSmooth;
		%feature("autodoc", "	* enable texture smoothing

	:rtype: None
") EnableSmooth;
		void EnableSmooth ();
		%feature("compactdefaultargs") IsSmoothed;
		%feature("autodoc", "	* Returns True if the texture is smoothed.

	:rtype: bool
") IsSmoothed;
		Standard_Boolean IsSmoothed ();
		%feature("compactdefaultargs") DisableSmooth;
		%feature("autodoc", "	* disable texture smoothing

	:rtype: None
") DisableSmooth;
		void DisableSmooth ();
		%feature("compactdefaultargs") EnableModulate;
		%feature("autodoc", "	* enable texture modulate mode. the image is modulate with the shading of the surface.

	:rtype: None
") EnableModulate;
		void EnableModulate ();
		%feature("compactdefaultargs") DisableModulate;
		%feature("autodoc", "	* disable texture modulate mode. the image is directly decal on the surface.

	:rtype: None
") DisableModulate;
		void DisableModulate ();
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "	* Returns True if the texture is modulate.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("compactdefaultargs") EnableRepeat;
		%feature("autodoc", "	* use this methods if you want to enable texture repetition on your objects.

	:rtype: None
") EnableRepeat;
		void EnableRepeat ();
		%feature("compactdefaultargs") DisableRepeat;
		%feature("autodoc", "	* use this methods if you want to disable texture repetition on your objects.

	:rtype: None
") DisableRepeat;
		void DisableRepeat ();
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "	* Returns True if the texture repeat is enable.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
};


%extend Graphic3d_TextureMap {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_TextureMap(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_TextureMap::Handle_Graphic3d_TextureMap %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_TextureMap;
class Handle_Graphic3d_TextureMap : public Handle_Graphic3d_TextureRoot {

    public:
        // constructors
        Handle_Graphic3d_TextureMap();
        Handle_Graphic3d_TextureMap(const Handle_Graphic3d_TextureMap &aHandle);
        Handle_Graphic3d_TextureMap(const Graphic3d_TextureMap *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_TextureMap DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_TextureMap {
    Graphic3d_TextureMap* _get_reference() {
    return (Graphic3d_TextureMap*)$self->Access();
    }
};

%extend Handle_Graphic3d_TextureMap {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_TextureMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture1D;
class Graphic3d_Texture1D : public Graphic3d_TextureMap {
	public:
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_1D_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTexture1D
") Name;
		Graphic3d_NameOfTexture1D Name ();
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param aRank:
	:type aRank: int
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer aRank);
};


%extend Graphic3d_Texture1D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture1D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture1D::Handle_Graphic3d_Texture1D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture1D;
class Handle_Graphic3d_Texture1D : public Handle_Graphic3d_TextureMap {

    public:
        // constructors
        Handle_Graphic3d_Texture1D();
        Handle_Graphic3d_Texture1D(const Handle_Graphic3d_Texture1D &aHandle);
        Handle_Graphic3d_Texture1D(const Graphic3d_Texture1D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture1D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture1D {
    Graphic3d_Texture1D* _get_reference() {
    return (Graphic3d_Texture1D*)$self->Access();
    }
};

%extend Handle_Graphic3d_Texture1D {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Texture1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture2D;
class Graphic3d_Texture2D : public Graphic3d_TextureMap {
	public:
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the predefined textures or NOT_2D_UNKNOWN when the name is given as a filename.

	:rtype: Graphic3d_NameOfTexture2D
") Name;
		Graphic3d_NameOfTexture2D Name ();
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param theRank:
	:type theRank: int
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);
};


%extend Graphic3d_Texture2D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture2D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture2D::Handle_Graphic3d_Texture2D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture2D;
class Handle_Graphic3d_Texture2D : public Handle_Graphic3d_TextureMap {

    public:
        // constructors
        Handle_Graphic3d_Texture2D();
        Handle_Graphic3d_Texture2D(const Handle_Graphic3d_Texture2D &aHandle);
        Handle_Graphic3d_Texture2D(const Graphic3d_Texture2D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture2D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture2D {
    Graphic3d_Texture2D* _get_reference() {
    return (Graphic3d_Texture2D*)$self->Access();
    }
};

%extend Handle_Graphic3d_Texture2D {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Texture2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture1Dmanual;
class Graphic3d_Texture1Dmanual : public Graphic3d_Texture1D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "	* Creates a texture from the file FileName.

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "	* Create a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Graphic3d_NameOfTexture1D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Image_PixMap_Handle & thePixMap);
};


%extend Graphic3d_Texture1Dmanual {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture1Dmanual(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture1Dmanual::Handle_Graphic3d_Texture1Dmanual %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture1Dmanual;
class Handle_Graphic3d_Texture1Dmanual : public Handle_Graphic3d_Texture1D {

    public:
        // constructors
        Handle_Graphic3d_Texture1Dmanual();
        Handle_Graphic3d_Texture1Dmanual(const Handle_Graphic3d_Texture1Dmanual &aHandle);
        Handle_Graphic3d_Texture1Dmanual(const Graphic3d_Texture1Dmanual *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture1Dmanual DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture1Dmanual {
    Graphic3d_Texture1Dmanual* _get_reference() {
    return (Graphic3d_Texture1Dmanual*)$self->Access();
    }
};

%extend Handle_Graphic3d_Texture1Dmanual {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Texture1Dmanual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture1Dsegment;
class Graphic3d_Texture1Dsegment : public Graphic3d_Texture1D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Graphic3d_NameOfTexture1D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Image_PixMap_Handle & thePixMap);
		%feature("compactdefaultargs") SetSegment;
		%feature("autodoc", "	* Sets the texture application bounds. Defines the way the texture is stretched across facets. Default values are <0.0, 0.0, 0.0> , <0.0, 0.0, 1.0>

	:param theX1:
	:type theX1: Standard_ShortReal
	:param theY1:
	:type theY1: Standard_ShortReal
	:param theZ1:
	:type theZ1: Standard_ShortReal
	:param theX2:
	:type theX2: Standard_ShortReal
	:param theY2:
	:type theY2: Standard_ShortReal
	:param theZ2:
	:type theZ2: Standard_ShortReal
	:rtype: None
") SetSegment;
		void SetSegment (const Standard_ShortReal theX1,const Standard_ShortReal theY1,const Standard_ShortReal theZ1,const Standard_ShortReal theX2,const Standard_ShortReal theY2,const Standard_ShortReal theZ2);
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns the values of the current segment X1, Y1, Z1 , X2, Y2, Z2.

	:param theX1:
	:type theX1: Standard_ShortReal &
	:param theY1:
	:type theY1: Standard_ShortReal &
	:param theZ1:
	:type theZ1: Standard_ShortReal &
	:param theX2:
	:type theX2: Standard_ShortReal &
	:param theY2:
	:type theY2: Standard_ShortReal &
	:param theZ2:
	:type theZ2: Standard_ShortReal &
	:rtype: None
") Segment;
		void Segment (Standard_ShortReal & theX1,Standard_ShortReal & theY1,Standard_ShortReal & theZ1,Standard_ShortReal & theX2,Standard_ShortReal & theY2,Standard_ShortReal & theZ2);
};


%extend Graphic3d_Texture1Dsegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture1Dsegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture1Dsegment::Handle_Graphic3d_Texture1Dsegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture1Dsegment;
class Handle_Graphic3d_Texture1Dsegment : public Handle_Graphic3d_Texture1D {

    public:
        // constructors
        Handle_Graphic3d_Texture1Dsegment();
        Handle_Graphic3d_Texture1Dsegment(const Handle_Graphic3d_Texture1Dsegment &aHandle);
        Handle_Graphic3d_Texture1Dsegment(const Graphic3d_Texture1Dsegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture1Dsegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture1Dsegment {
    Graphic3d_Texture1Dsegment* _get_reference() {
    return (Graphic3d_Texture1Dsegment*)$self->Access();
    }
};

%extend Handle_Graphic3d_Texture1Dsegment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Texture1Dsegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture2Dmanual;
class Graphic3d_Texture2Dmanual : public Graphic3d_Texture2D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Graphic3d_NameOfTexture2D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Image_PixMap_Handle & thePixMap);
};


%extend Graphic3d_Texture2Dmanual {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture2Dmanual(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture2Dmanual::Handle_Graphic3d_Texture2Dmanual %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture2Dmanual;
class Handle_Graphic3d_Texture2Dmanual : public Handle_Graphic3d_Texture2D {

    public:
        // constructors
        Handle_Graphic3d_Texture2Dmanual();
        Handle_Graphic3d_Texture2Dmanual(const Handle_Graphic3d_Texture2Dmanual &aHandle);
        Handle_Graphic3d_Texture2Dmanual(const Graphic3d_Texture2Dmanual *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture2Dmanual DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture2Dmanual {
    Graphic3d_Texture2Dmanual* _get_reference() {
    return (Graphic3d_Texture2Dmanual*)$self->Access();
    }
};

%extend Handle_Graphic3d_Texture2Dmanual {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Texture2Dmanual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture2Dplane;
class Graphic3d_Texture2Dplane : public Graphic3d_Texture2D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "	* Creates a texture from a file

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "	* Creates a texture from a predefined texture name set.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Graphic3d_NameOfTexture2D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "	* Creates a texture from the pixmap.

	:param thePixMap:
	:type thePixMap: Image_PixMap_Handle &
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Image_PixMap_Handle & thePixMap);
		%feature("compactdefaultargs") SetPlaneS;
		%feature("autodoc", "	* Defines the texture projection plane for texture coordinate S default is <1.0, 0.0, 0.0, 0.0>

	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None
") SetPlaneS;
		void SetPlaneS (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);
		%feature("compactdefaultargs") SetPlaneT;
		%feature("autodoc", "	* Defines the texture projection plane for texture coordinate T default is <0.0, 1.0, 0.0, 0.0>

	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None
") SetPlaneT;
		void SetPlaneT (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Defines the texture projection plane for both S and T texture coordinate default is NOTP_XY meaning: <1.0, 0.0, 0.0, 0.0> for S and <0.0, 1.0, 0.0, 0.0> for T

	:param thePlane:
	:type thePlane: Graphic3d_NameOfTexturePlane
	:rtype: None
") SetPlane;
		void SetPlane (const Graphic3d_NameOfTexturePlane thePlane);
		%feature("compactdefaultargs") SetScaleS;
		%feature("autodoc", "	* Defines the texture scale for the S texture coordinate much easier than recomputing the S plane equation but the result is the same default to 1.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetScaleS;
		void SetScaleS (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetScaleT;
		%feature("autodoc", "	* Defines the texture scale for the T texture coordinate much easier than recompution the T plane equation but the result is the same default to 1.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetScaleT;
		void SetScaleT (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetTranslateS;
		%feature("autodoc", "	* Defines the texture translation for the S texture coordinate you can obtain the same effect by modifying the S plane equation but its not easier. default to 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetTranslateS;
		void SetTranslateS (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetTranslateT;
		%feature("autodoc", "	* Defines the texture translation for the T texture coordinate you can obtain the same effect by modifying the T plane equation but its not easier. default to 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetTranslateT;
		void SetTranslateT (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Sets the rotation angle of the whole texture. the same result might be achieved by recomputing the S and T plane equation but it's not the easiest way... the angle is expressed in degrees default is 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theVal);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the current texture plane name or NOTP_UNKNOWN when the plane is user defined.

	:rtype: Graphic3d_NameOfTexturePlane
") Plane;
		Graphic3d_NameOfTexturePlane Plane ();
		%feature("compactdefaultargs") PlaneS;
		%feature("autodoc", "	* Returns the current texture plane S equation

	:param A:
	:type A: Standard_ShortReal &
	:param B:
	:type B: Standard_ShortReal &
	:param C:
	:type C: Standard_ShortReal &
	:param D:
	:type D: Standard_ShortReal &
	:rtype: None
") PlaneS;
		void PlaneS (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);
		%feature("compactdefaultargs") PlaneT;
		%feature("autodoc", "	* Returns the current texture plane T equation

	:param A:
	:type A: Standard_ShortReal &
	:param B:
	:type B: Standard_ShortReal &
	:param C:
	:type C: Standard_ShortReal &
	:param D:
	:type D: Standard_ShortReal &
	:rtype: None
") PlaneT;
		void PlaneT (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);
		%feature("compactdefaultargs") TranslateS;
		%feature("autodoc", "	* Returns the current texture S translation value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") TranslateS;
		void TranslateS (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") TranslateT;
		%feature("autodoc", "	* Returns the current texture T translation value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") TranslateT;
		void TranslateT (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") ScaleS;
		%feature("autodoc", "	* Returns the current texture S scale value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") ScaleS;
		void ScaleS (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") ScaleT;
		%feature("autodoc", "	* Returns the current texture T scale value

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") ScaleT;
		void ScaleT (Standard_ShortReal & theVal);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* Returns the current texture rotation angle

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") Rotation;
		void Rotation (Standard_ShortReal & theVal);
};


%extend Graphic3d_Texture2Dplane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Graphic3d_Texture2Dplane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Graphic3d_Texture2Dplane::Handle_Graphic3d_Texture2Dplane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Graphic3d_Texture2Dplane;
class Handle_Graphic3d_Texture2Dplane : public Handle_Graphic3d_Texture2D {

    public:
        // constructors
        Handle_Graphic3d_Texture2Dplane();
        Handle_Graphic3d_Texture2Dplane(const Handle_Graphic3d_Texture2Dplane &aHandle);
        Handle_Graphic3d_Texture2Dplane(const Graphic3d_Texture2Dplane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Graphic3d_Texture2Dplane DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Graphic3d_Texture2Dplane {
    Graphic3d_Texture2Dplane* _get_reference() {
    return (Graphic3d_Texture2Dplane*)$self->Access();
    }
};

%extend Handle_Graphic3d_Texture2Dplane {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Graphic3d_Texture2Dplane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
