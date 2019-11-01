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
%define GRAPHIC3DDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=GRAPHIC3DDOCSTRING) Graphic3d

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


%include Graphic3d_headers.i


/* templates */
%template(Graphic3d_CameraLerp) NCollection_Lerp <Handle_Graphic3d_Camera>;
%template(Graphic3d_SequenceOfGroup) NCollection_Sequence <Handle_Graphic3d_Group>;
%template(Graphic3d_Mat4) NCollection_Mat4 <Standard_ShortReal>;
%template(Graphic3d_IndexedMapOfView) NCollection_IndexedMap <Graphic3d_CView *>;
%template(Graphic3d_BndBox4f) BVH_Box <Standard_ShortReal , 4>;
%template(Graphic3d_SequenceOfStructure) NCollection_Sequence <Handle_Graphic3d_Structure>;
%template(Graphic3d_Vec2) NCollection_Vec2 <Standard_ShortReal>;
%template(Graphic3d_Vec2d) NCollection_Vec2 <Standard_Real>;
%template(Graphic3d_Vec2i) NCollection_Vec2 <Standard_Integer>;
%template(Graphic3d_Vec2ub) NCollection_Vec2 <Standard_Byte>;
%template(Graphic3d_Vec2b) NCollection_Vec2 <Standard_Character>;
%template(Graphic3d_ShaderObjectList) NCollection_Sequence <Handle_Graphic3d_ShaderObject>;
%template(Graphic3d_ShaderVariableList) NCollection_Sequence <Handle_Graphic3d_ShaderVariable>;
%template(Graphic3d_ShaderAttributeList) NCollection_Sequence <Handle_Graphic3d_ShaderAttribute>;
%template(Graphic3d_Vec4) NCollection_Vec4 <Standard_ShortReal>;
%template(Graphic3d_Vec4d) NCollection_Vec4 <Standard_Real>;
%template(Graphic3d_Vec4i) NCollection_Vec4 <Standard_Integer>;
%template(Graphic3d_Vec4ub) NCollection_Vec4 <Standard_Byte>;
%template(Graphic3d_Vec4b) NCollection_Vec4 <Standard_Character>;
%template(Graphic3d_BndBox4d) BVH_Box <Standard_Real , 4>;
%template(Graphic3d_MapOfStructure) NCollection_Map <Handle_Graphic3d_Structure>;
%template(Graphic3d_ListOfCLight) NCollection_List <Graphic3d_CLight>;
%template(Graphic3d_Vec3) NCollection_Vec3 <Standard_ShortReal>;
%template(Graphic3d_Vec3d) NCollection_Vec3 <Standard_Real>;
%template(Graphic3d_Vec3i) NCollection_Vec3 <Standard_Integer>;
%template(Graphic3d_Vec3ub) NCollection_Vec3 <Standard_Byte>;
%template(Graphic3d_Vec3b) NCollection_Vec3 <Standard_Character>;
%template(Graphic3d_BndBox3d) BVH_Box <Standard_Real , 3>;
%template(Graphic3d_Array1OfAttribute) NCollection_Array1 <Graphic3d_Attribute>;

%extend NCollection_Array1 <Graphic3d_Attribute> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Graphic3d_Mat4d) NCollection_Mat4 <Standard_Real>;
/* end templates declaration */


/* typedefs */
typedef Graphic3d_MapOfStructure::Iterator Graphic3d_MapIteratorOfMapOfStructure;
typedef NCollection_Lerp <Handle_Graphic3d_Camera> Graphic3d_CameraLerp;
typedef NCollection_Sequence <Handle_Graphic3d_Group> Graphic3d_SequenceOfGroup;
typedef NCollection_Mat4 <Standard_ShortReal> Graphic3d_Mat4;
typedef NCollection_IndexedMap <Graphic3d_CView *> Graphic3d_IndexedMapOfView;
typedef BVH_Box <Standard_ShortReal , 4> Graphic3d_BndBox4f;
typedef NCollection_Sequence <Handle_Graphic3d_Structure> Graphic3d_SequenceOfStructure;
typedef NCollection_Vec2 <Standard_ShortReal> Graphic3d_Vec2;
typedef NCollection_Vec2 <Standard_Real> Graphic3d_Vec2d;
typedef NCollection_Vec2 <Standard_Integer> Graphic3d_Vec2i;
typedef NCollection_Vec2 <Standard_Byte> Graphic3d_Vec2ub;
typedef NCollection_Vec2 <Standard_Character> Graphic3d_Vec2b;
typedef NCollection_Sequence <Handle_Graphic3d_ShaderObject> Graphic3d_ShaderObjectList;
typedef NCollection_Sequence <Handle_Graphic3d_ShaderVariable> Graphic3d_ShaderVariableList;
typedef NCollection_Sequence <Handle_Graphic3d_ShaderAttribute> Graphic3d_ShaderAttributeList;
typedef NCollection_Vec4 <Standard_ShortReal> Graphic3d_Vec4;
typedef NCollection_Vec4 <Standard_Real> Graphic3d_Vec4d;
typedef NCollection_Vec4 <Standard_Integer> Graphic3d_Vec4i;
typedef NCollection_Vec4 <Standard_Byte> Graphic3d_Vec4ub;
typedef NCollection_Vec4 <Standard_Character> Graphic3d_Vec4b;
typedef BVH_Box <Standard_Real , 4> Graphic3d_BndBox4d;
typedef NCollection_Map <Handle_Graphic3d_Structure> Graphic3d_MapOfStructure;
typedef NCollection_List <Graphic3d_CLight> Graphic3d_ListOfCLight;
typedef NCollection_Vec3 <Standard_ShortReal> Graphic3d_Vec3;
typedef NCollection_Vec3 <Standard_Real> Graphic3d_Vec3d;
typedef NCollection_Vec3 <Standard_Integer> Graphic3d_Vec3i;
typedef NCollection_Vec3 <Standard_Byte> Graphic3d_Vec3ub;
typedef NCollection_Vec3 <Standard_Character> Graphic3d_Vec3b;
typedef Standard_Integer Graphic3d_ZLayerId;
typedef Graphic3d_UniformValue <Standard_Integer> Graphic3d_UniformInt;
typedef Graphic3d_UniformValue <Graphic3d_Vec2i> Graphic3d_UniformVec2i;
typedef Graphic3d_UniformValue <Graphic3d_Vec3i> Graphic3d_UniformVec3i;
typedef Graphic3d_UniformValue <Graphic3d_Vec4i> Graphic3d_UniformVec4i;
typedef Graphic3d_UniformValue <Standard_ShortReal> Graphic3d_UniformFloat;
typedef Graphic3d_UniformValue <Graphic3d_Vec2> Graphic3d_UniformVec2;
typedef Graphic3d_UniformValue <Graphic3d_Vec3> Graphic3d_UniformVec3;
typedef Graphic3d_UniformValue <Graphic3d_Vec4> Graphic3d_UniformVec4;
typedef BVH_Box <Standard_Real , 3> Graphic3d_BndBox3d;
typedef NCollection_Array1 <Graphic3d_Attribute> Graphic3d_Array1OfAttribute;
typedef NCollection_Mat4 <Standard_Real> Graphic3d_Mat4d;
typedef NCollection_Shared<NCollection_Map <const Standard_Transient *>> Graphic3d_NMapOfTransient;
/* end typedefs declaration */

/* public enums */
enum Graphic3d_BufferType {
	Graphic3d_BT_RGB = 0,
	Graphic3d_BT_RGBA = 1,
	Graphic3d_BT_Depth = 2,
	Graphic3d_BT_RGB_RayTraceHdrLeft = 3,
};

enum Graphic3d_SortType {
	Graphic3d_ST_Simple = 0,
	Graphic3d_ST_BSP_Tree = 1,
};

enum Graphic3d_VerticalTextAlignment {
	Graphic3d_VTA_BOTTOM = 0,
	Graphic3d_VTA_CENTER = 1,
	Graphic3d_VTA_TOP = 2,
	Graphic3d_VTA_TOPFIRSTLINE = 3,
};

enum Graphic3d_LevelOfTextureAnisotropy {
	Graphic3d_LOTA_OFF = 0,
	Graphic3d_LOTA_FAST = 1,
	Graphic3d_LOTA_MIDDLE = 2,
	Graphic3d_LOTA_QUALITY = 3,
};

enum Graphic3d_TypeOfLimit {
	Graphic3d_TypeOfLimit_MaxNbLights = 0,
	Graphic3d_TypeOfLimit_MaxNbClipPlanes = 1,
	Graphic3d_TypeOfLimit_MaxNbViews = 2,
	Graphic3d_TypeOfLimit_MaxTextureSize = 3,
	Graphic3d_TypeOfLimit_MaxCombinedTextureUnits = 4,
	Graphic3d_TypeOfLimit_MaxMsaa = 5,
	Graphic3d_TypeOfLimit_HasRayTracing = 6,
	Graphic3d_TypeOfLimit_HasRayTracingTextures = 7,
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling = 8,
	Graphic3d_TypeOfLimit_HasBlendedOit = 9,
	Graphic3d_TypeOfLimit_HasBlendedOitMsaa = 10,
	Graphic3d_TypeOfLimit_NB = 11,
};

enum Graphic3d_DiagnosticInfo {
	Graphic3d_DiagnosticInfo_Device = 1,
	Graphic3d_DiagnosticInfo_FrameBuffer = 2,
	Graphic3d_DiagnosticInfo_Limits = 4,
	Graphic3d_DiagnosticInfo_Memory = 8,
	Graphic3d_DiagnosticInfo_NativePlatform = 16,
	Graphic3d_DiagnosticInfo_Extensions = 32,
	Graphic3d_DiagnosticInfo_Short = Graphic3d_DiagnosticInfo_Device | Graphic3d_DiagnosticInfo_FrameBuffer | Graphic3d_DiagnosticInfo_Limits,
	Graphic3d_DiagnosticInfo_Basic = Graphic3d_DiagnosticInfo_Short | Graphic3d_DiagnosticInfo_NativePlatform | Graphic3d_DiagnosticInfo_Memory,
	Graphic3d_DiagnosticInfo_Complete = Graphic3d_DiagnosticInfo_Basic | Graphic3d_DiagnosticInfo_Extensions,
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

enum Graphic3d_FresnelModel {
	Graphic3d_FM_SCHLICK = 0,
	Graphic3d_FM_CONSTANT = 1,
	Graphic3d_FM_CONDUCTOR = 2,
	Graphic3d_FM_DIELECTRIC = 3,
};

enum Graphic3d_TypeOfReflection {
	Graphic3d_TOR_AMBIENT = 0,
	Graphic3d_TOR_DIFFUSE = 1,
	Graphic3d_TOR_SPECULAR = 2,
	Graphic3d_TOR_EMISSION = 3,
};

enum  {
	Graphic3d_TypeOfReflection_NB = 4,
};

enum Graphic3d_RenderTransparentMethod {
	Graphic3d_RTM_BLEND_UNORDERED = 0,
	Graphic3d_RTM_BLEND_OIT = 1,
};

enum Graphic3d_RenderingMode {
	Graphic3d_RM_RASTERIZATION = 0,
	Graphic3d_RM_RAYTRACING = 1,
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

enum Graphic3d_TypeOfBackground {
	Graphic3d_TOB_NONE = 0,
	Graphic3d_TOB_GRADIENT = 1,
	Graphic3d_TOB_TEXTURE = 2,
};

enum Graphic3d_TypeOfStructure {
	Graphic3d_TOS_WIREFRAME = 0,
	Graphic3d_TOS_SHADING = 1,
	Graphic3d_TOS_COMPUTED = 2,
	Graphic3d_TOS_ALL = 3,
};

enum Graphic3d_TypeOfTextureMode {
	Graphic3d_TOTM_OBJECT = 0,
	Graphic3d_TOTM_SPHERE = 1,
	Graphic3d_TOTM_EYE = 2,
	Graphic3d_TOTM_MANUAL = 3,
	Graphic3d_TOTM_SPRITE = 4,
};

enum Graphic3d_TypeOfShaderObject {
	Graphic3d_TOS_VERTEX = 0,
	Graphic3d_TOS_FRAGMENT = 1,
};

enum Graphic3d_ZLayerSetting {
	Graphic3d_ZLayerDepthTest = 1,
	Graphic3d_ZLayerDepthWrite = 2,
	Graphic3d_ZLayerDepthClear = 4,
	Graphic3d_ZLayerDepthOffset = 8,
};

enum Graphic3d_CappingFlags {
	Graphic3d_CappingFlags_None = 0,
	Graphic3d_CappingFlags_ObjectMaterial = 1,
	Graphic3d_CappingFlags_ObjectTexture = 2,
	Graphic3d_CappingFlags_ObjectShader = 8,
	Graphic3d_CappingFlags_ObjectAspect = Graphic3d_CappingFlags_ObjectMaterial | Graphic3d_CappingFlags_ObjectTexture | Graphic3d_CappingFlags_ObjectShader,
};

enum Graphic3d_NameOfTexturePlane {
	Graphic3d_NOTP_XY = 0,
	Graphic3d_NOTP_YZ = 1,
	Graphic3d_NOTP_ZX = 2,
	Graphic3d_NOTP_UNKNOWN = 3,
};

enum Graphic3d_TypeOfShadingModel {
	Graphic3d_TOSM_NONE = 0,
	Graphic3d_TOSM_FACET = 1,
	Graphic3d_TOSM_VERTEX = 2,
	Graphic3d_TOSM_FRAGMENT = 3,
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

enum Graphic3d_ToneMappingMethod {
	Graphic3d_ToneMappingMethod_Disabled = 0,
	Graphic3d_ToneMappingMethod_Filmic = 1,
};

enum Graphic3d_TypeOfTexture {
	Graphic3d_TOT_1D = 0,
	Graphic3d_TOT_2D = 1,
	Graphic3d_TOT_2D_MIPMAP = 2,
};

enum Graphic3d_TypeOfMaterial {
	Graphic3d_MATERIAL_ASPECT = 0,
	Graphic3d_MATERIAL_PHYSIC = 1,
};

enum Graphic3d_TypeOfBackfacingModel {
	Graphic3d_TOBM_AUTOMATIC = 0,
	Graphic3d_TOBM_FORCE = 1,
	Graphic3d_TOBM_DISABLE = 2,
};

enum Graphic3d_HorizontalTextAlignment {
	Graphic3d_HTA_LEFT = 0,
	Graphic3d_HTA_CENTER = 1,
	Graphic3d_HTA_RIGHT = 2,
};

enum Graphic3d_TransModeFlags {
	Graphic3d_TMF_None = 0,
	Graphic3d_TMF_ZoomPers = 2,
	Graphic3d_TMF_RotatePers = 8,
	Graphic3d_TMF_TriedronPers = 32,
	Graphic3d_TMF_2d = 64,
	Graphic3d_TMF_ZoomRotatePers = Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers,
};

enum Graphic3d_TypeOfAnswer {
	Graphic3d_TOA_YES = 0,
	Graphic3d_TOA_NO = 1,
	Graphic3d_TOA_COMPUTE = 2,
};

enum Graphic3d_GroupAspect {
	Graphic3d_ASPECT_LINE = 0,
	Graphic3d_ASPECT_TEXT = 1,
	Graphic3d_ASPECT_MARKER = 2,
	Graphic3d_ASPECT_FILL_AREA = 3,
};

enum Graphic3d_TextureUnit {
	Graphic3d_TextureUnit_0 = 0,
	Graphic3d_TextureUnit_1 = 1,
	Graphic3d_TextureUnit_2 = 2,
	Graphic3d_TextureUnit_3 = 3,
	Graphic3d_TextureUnit_4 = 4,
	Graphic3d_TextureUnit_5 = 5,
	Graphic3d_TextureUnit_6 = 6,
	Graphic3d_TextureUnit_7 = 7,
	Graphic3d_TextureUnit_8 = 8,
	Graphic3d_TextureUnit_9 = 9,
	Graphic3d_TextureUnit_10 = 10,
	Graphic3d_TextureUnit_11 = 11,
	Graphic3d_TextureUnit_12 = 12,
	Graphic3d_TextureUnit_13 = 13,
	Graphic3d_TextureUnit_14 = 14,
	Graphic3d_TextureUnit_15 = 15,
	Graphic3d_TextureUnit_BaseColor = Graphic3d_TextureUnit_0,
};

enum  {
	Graphic3d_TextureUnit_NB = Graphic3d_TextureUnit_15 + 1,
};

enum Graphic3d_TypeOfConnection {
	Graphic3d_TOC_ANCESTOR = 0,
	Graphic3d_TOC_DESCENDANT = 1,
};

enum Graphic3d_NameOfTexture1D {
	Graphic3d_NOT_1D_ELEVATION = 0,
	Graphic3d_NOT_1D_UNKNOWN = 1,
};

enum Graphic3d_TextPath {
	Graphic3d_TP_UP = 0,
	Graphic3d_TP_DOWN = 1,
	Graphic3d_TP_LEFT = 2,
	Graphic3d_TP_RIGHT = 3,
};

enum  {
	Graphic3d_ZLayerId_UNKNOWN = - 1,
	Graphic3d_ZLayerId_Default = 0,
	Graphic3d_ZLayerId_Top = - 2,
	Graphic3d_ZLayerId_Topmost = - 3,
	Graphic3d_ZLayerId_TopOSD = - 4,
	Graphic3d_ZLayerId_BotOSD = - 5,
};

enum Graphic3d_TypeOfComposition {
	Graphic3d_TOC_REPLACE = 0,
	Graphic3d_TOC_POSTCONCATENATE = 1,
};

enum Graphic3d_TypeOfAttribute {
	Graphic3d_TOA_POS = 0,
	Graphic3d_TOA_NORM = 1,
	Graphic3d_TOA_UV = 2,
	Graphic3d_TOA_COLOR = 3,
	Graphic3d_TOA_CUSTOM = 4,
};

enum Graphic3d_TypeOfData {
	Graphic3d_TOD_USHORT = 0,
	Graphic3d_TOD_UINT = 1,
	Graphic3d_TOD_VEC2 = 2,
	Graphic3d_TOD_VEC3 = 3,
	Graphic3d_TOD_VEC4 = 4,
	Graphic3d_TOD_VEC4UB = 5,
	Graphic3d_TOD_FLOAT = 6,
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
	Graphic3d_NOT_2D_CHESS = 21,
	Graphic3d_NOT_2D_UNKNOWN = 22,
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
	Graphic3d_NOM_TRANSPARENT = 23,
	Graphic3d_NOM_DEFAULT = 24,
	Graphic3d_NOM_UserDefined = 25,
};

enum Graphic3d_TypeOfTextureFilter {
	Graphic3d_TOTF_NEAREST = 0,
	Graphic3d_TOTF_BILINEAR = 1,
	Graphic3d_TOTF_TRILINEAR = 2,
};

enum Graphic3d_TypeOfVisualization {
	Graphic3d_TOV_WIREFRAME = 0,
	Graphic3d_TOV_SHADING = 1,
};

enum Graphic3d_TypeOfLightSource {
	Graphic3d_TOLS_AMBIENT = 0,
	Graphic3d_TOLS_DIRECTIONAL = 1,
	Graphic3d_TOLS_POSITIONAL = 2,
	Graphic3d_TOLS_SPOT = 3,
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

/* end public enums declaration */

%wrap_handle(Graphic3d_ArrayOfPrimitives)
%wrap_handle(Graphic3d_AspectFillArea3d)
%wrap_handle(Graphic3d_AspectLine3d)
%wrap_handle(Graphic3d_AspectMarker3d)
%wrap_handle(Graphic3d_AspectText3d)
%wrap_handle(Graphic3d_BoundBuffer)
%wrap_handle(Graphic3d_CStructure)
%wrap_handle(Graphic3d_Camera)
%wrap_handle(Graphic3d_ClipPlane)
%wrap_handle(Graphic3d_DataStructureManager)
%wrap_handle(Graphic3d_GraphicDriver)
%wrap_handle(Graphic3d_Group)
%wrap_handle(Graphic3d_HatchStyle)
%wrap_handle(Graphic3d_MarkerImage)
%wrap_handle(Graphic3d_PresentationAttributes)
%wrap_handle(Graphic3d_ShaderAttribute)
%wrap_handle(Graphic3d_ShaderObject)
%wrap_handle(Graphic3d_ShaderProgram)
%wrap_handle(Graphic3d_ShaderVariable)
%wrap_handle(Graphic3d_Structure)
%wrap_handle(Graphic3d_StructureManager)
%wrap_handle(Graphic3d_TextureParams)
%wrap_handle(Graphic3d_TextureRoot)
%wrap_handle(Graphic3d_ViewAffinity)
%wrap_handle(Graphic3d_ArrayOfPoints)
%wrap_handle(Graphic3d_ArrayOfPolygons)
%wrap_handle(Graphic3d_ArrayOfPolylines)
%wrap_handle(Graphic3d_ArrayOfQuadrangleStrips)
%wrap_handle(Graphic3d_ArrayOfQuadrangles)
%wrap_handle(Graphic3d_ArrayOfSegments)
%wrap_handle(Graphic3d_ArrayOfTriangleFans)
%wrap_handle(Graphic3d_ArrayOfTriangleStrips)
%wrap_handle(Graphic3d_ArrayOfTriangles)
%wrap_handle(Graphic3d_CView)
%wrap_handle(Graphic3d_TextureEnv)
%wrap_handle(Graphic3d_TextureMap)
%wrap_handle(Graphic3d_Texture1D)
%wrap_handle(Graphic3d_Texture2D)
%wrap_handle(Graphic3d_Texture1Dmanual)
%wrap_handle(Graphic3d_Texture1Dsegment)
%wrap_handle(Graphic3d_Texture2Dmanual)
%wrap_handle(Graphic3d_Texture2Dplane)

%nodefaultctor Graphic3d_ArrayOfPrimitives;
class Graphic3d_ArrayOfPrimitives : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length theEdgeNumber in the bound array returns the actual bounds number

	:param theEdgeNumber:
	:type theEdgeNumber: int
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer theEdgeNumber);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length theEdgeNumber and bound color theBColor in the bound array. Warning: theBColor is ignored when the hasBColors constructor parameter is False returns the actual bounds number

	:param theEdgeNumber:
	:type theEdgeNumber: int
	:param theBColor:
	:type theBColor: Quantity_Color &
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer theEdgeNumber,const Quantity_Color & theBColor);
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "	* Adds a bound of length theEdgeNumber and bound color coordinates in the bound array. Warning: <theR,theG,theB> are ignored when the hasBColors constructor parameter is False returns the actual bounds number

	:param theEdgeNumber:
	:type theEdgeNumber: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: int
") AddBound;
		Standard_Integer AddBound (const Standard_Integer theEdgeNumber,const Standard_Real theR,const Standard_Real theG,const Standard_Real theB);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	* Adds an edge in the range [1,VertexNumber()] in the array. returns the actual edges number

	:param theVertexIndex:
	:type theVertexIndex: int
	:rtype: int
") AddEdge;
		Standard_Integer AddEdge (const Standard_Integer theVertexIndex);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number

	:param theVertex:
	:type theVertex: Graphic3d_Vec3 &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Graphic3d_Vec3 & theVertex);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice in the array. returns the actual vertex number.

	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const Quantity_Color & theColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theColor32:
	:type theColor32: int
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const Standard_Integer theColor32);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theColor:
	:type theColor: Graphic3d_Vec4ub &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const Graphic3d_Vec4ub & theColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False. returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False. returns the actual vertex number

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theNX:
	:type theNX: float
	:param theNY:
	:type theNY: float
	:param theNZ:
	:type theNZ: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theNX,const Standard_Real theNY,const Standard_Real theNZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex normal in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False. returns the actual vertex number

	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:param theNX:
	:type theNX: Standard_ShortReal
	:param theNY:
	:type theNY: Standard_ShortReal
	:param theNZ:
	:type theNZ: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ,const Standard_ShortReal theNX,const Standard_ShortReal theNY,const Standard_ShortReal theNZ);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and color in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theColor is ignored when the hasVColors constructor parameter is False. returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal,const Quantity_Color & theColor);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and color in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theColor is ignored when the hasVColors constructor parameter is False. @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:param theColor32:
	:type theColor32: int
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal,const Standard_Integer theColor32);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture in the vertex array. theTexel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theTexel:
	:type theTexel: gp_Pnt2d
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Pnt2d & theTexel);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture coordinates in the vertex array. Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theTX:
	:type theTX: float
	:param theTY:
	:type theTY: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theTX,const Standard_Real theTY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice and vertex texture coordinates in the vertex array. Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number

	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:param theTX:
	:type theTX: Standard_ShortReal
	:param theTY:
	:type theTY: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ,const Standard_ShortReal theTX,const Standard_ShortReal theTY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theTexel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number

	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:param theTexel:
	:type theTexel: gp_Pnt2d
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal,const gp_Pnt2d & theTexel);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False and Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theNX:
	:type theNX: float
	:param theNY:
	:type theNY: float
	:param theNZ:
	:type theNZ: float
	:param theTX:
	:type theTX: float
	:param theTY:
	:type theTY: float
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theNX,const Standard_Real theNY,const Standard_Real theNZ,const Standard_Real theTX,const Standard_Real theTY);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertice,vertex normal and texture in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False and Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number

	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:param theNX:
	:type theNX: Standard_ShortReal
	:param theNY:
	:type theNY: Standard_ShortReal
	:param theNZ:
	:type theNZ: Standard_ShortReal
	:param theTX:
	:type theTX: Standard_ShortReal
	:param theTY:
	:type theTY: Standard_ShortReal
	:rtype: int
") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ,const Standard_ShortReal theNX,const Standard_ShortReal theNY,const Standard_ShortReal theNZ,const Standard_ShortReal theTX,const Standard_ShortReal theTY);
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "	* Returns vertex attributes buffer (colors, normals, texture coordinates).

	:rtype: Handle_Graphic3d_Buffer
") Attributes;
		Handle_Graphic3d_Buffer Attributes ();
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "	* Returns the edge number at rank theRank.

	:param theRank:
	:type theRank: int
	:rtype: int
") Bound;
		Standard_Integer Bound (const Standard_Integer theRank);
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "	* Returns the bound color at rank theRank from the bound table if defined.

	:param theRank:
	:type theRank: int
	:rtype: Quantity_Color
") BoundColor;
		Quantity_Color BoundColor (const Standard_Integer theRank);
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "	* Returns the bound color values at rank theRank from the bound table if defined.

	:param theRank:
	:type theRank: int
	:param theR:
	:type theR: float &
	:param theG:
	:type theG: float &
	:param theB:
	:type theB: float &
	:rtype: None
") BoundColor;
		void BoundColor (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") BoundNumber;
		%feature("autodoc", "	* Returns the number of defined bounds

	:rtype: int
") BoundNumber;
		Standard_Integer BoundNumber ();
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* @name optional array of Bounds/Subgroups within primitive array (e.g. restarting primitives / assigning colors) Returns optional bounds buffer.

	:rtype: Handle_Graphic3d_BoundBuffer
") Bounds;
		Handle_Graphic3d_BoundBuffer Bounds ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns the vertex index at rank theRank in the range [1,EdgeNumber()]

	:param theRank:
	:type theRank: int
	:rtype: int
") Edge;
		Standard_Integer Edge (const Standard_Integer theRank);
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "	* Returns the number of defined edges

	:rtype: int
") EdgeNumber;
		Standard_Integer EdgeNumber ();
		%feature("compactdefaultargs") HasBoundColors;
		%feature("autodoc", "	* Returns True when bound colors array is defined.

	:rtype: bool
") HasBoundColors;
		Standard_Boolean HasBoundColors ();
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "	* Returns True when vertex colors array is defined.

	:rtype: bool
") HasVertexColors;
		Standard_Boolean HasVertexColors ();
		%feature("compactdefaultargs") HasVertexNormals;
		%feature("autodoc", "	* Returns True when vertex normals array is defined.

	:rtype: bool
") HasVertexNormals;
		Standard_Boolean HasVertexNormals ();
		%feature("compactdefaultargs") HasVertexTexels;
		%feature("autodoc", "	* Returns True when vertex texels array is defined.

	:rtype: bool
") HasVertexTexels;
		Standard_Boolean HasVertexTexels ();
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	* @name optional array of Indices/Edges for using shared Vertex data Returns optional index buffer.

	:rtype: Handle_Graphic3d_IndexBuffer
") Indices;
		Handle_Graphic3d_IndexBuffer Indices ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Returns True only when the contains of this array is available.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") ItemNumber;
		%feature("autodoc", "	* Returns the number of total items according to the array type.

	:rtype: int
") ItemNumber;
		Standard_Integer ItemNumber ();
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "	* Change the bound color of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer theIndex,const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "	* Change the bound color of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: None
") SetBoundColor;
		void SetBoundColor (const Standard_Integer theIndex,const Standard_Real theR,const Standard_Real theG,const Standard_Real theB);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Standard_Real theR,const Standard_Real theG,const Standard_Real theB);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Graphic3d_Vec4ub &
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Graphic3d_Vec4ub & theColor);
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "	* Change the vertex color of rank theIndex> in the array. @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode

	:param theIndex:
	:type theIndex: int
	:param theColor32:
	:type theColor32: int
	:rtype: None
") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Standard_Integer theColor32);
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "	* Change the vertex normal of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theNormal:
	:type theNormal: gp_Dir
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer theIndex,const gp_Dir & theNormal);
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "	* Change the vertex normal of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theNX:
	:type theNX: float
	:param theNY:
	:type theNY: float
	:param theNZ:
	:type theNZ: float
	:rtype: None
") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer theIndex,const Standard_Real theNX,const Standard_Real theNY,const Standard_Real theNZ);
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "	* Change the vertex texel of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theTexel:
	:type theTexel: gp_Pnt2d
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer theIndex,const gp_Pnt2d & theTexel);
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "	* Change the vertex texel of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theTX:
	:type theTX: float
	:param theTY:
	:type theTY: float
	:rtype: None
") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer theIndex,const Standard_Real theTX,const Standard_Real theTY);
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "	* Change the vertice of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theVertex:
	:type theVertex: gp_Pnt
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer theIndex,const gp_Pnt & theVertex);
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "	* Change the vertice of rank theIndex in the array.

	:param theIndex:
	:type theIndex: int
	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: None
") SetVertice;
		void SetVertice (const Standard_Integer theIndex,const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);
		%feature("compactdefaultargs") StringType;
		%feature("autodoc", "	* Returns the string type of this primitive

	:rtype: char *
") StringType;
		const char * StringType ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the type of this primitive

	:rtype: Graphic3d_TypeOfPrimitiveArray
") Type;
		Graphic3d_TypeOfPrimitiveArray Type ();
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:rtype: Quantity_Color
") VertexColor;
		Quantity_Color VertexColor (const Standard_Integer theRank);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color at rank theIndex from the vertex table if defined.

	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Graphic3d_Vec4ub &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer theIndex,Graphic3d_Vec4ub & theColor);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color values at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:param theR:
	:type theR: float &
	:param theG:
	:type theG: float &
	:param theB:
	:type theB: float &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "	* Returns the vertex color values at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:param theColor:
	:type theColor: int &
	:rtype: None
") VertexColor;
		void VertexColor (const Standard_Integer theRank,Standard_Integer &OutValue);
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "	* Returns the vertex normal at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:rtype: gp_Dir
") VertexNormal;
		gp_Dir VertexNormal (const Standard_Integer theRank);
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "	* Returns the vertex normal coordinates at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:param theNX:
	:type theNX: float &
	:param theNY:
	:type theNY: float &
	:param theNZ:
	:type theNZ: float &
	:rtype: None
") VertexNormal;
		void VertexNormal (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") VertexNumber;
		%feature("autodoc", "	* Returns the number of defined vertex

	:rtype: int
") VertexNumber;
		Standard_Integer VertexNumber ();
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "	* Returns the vertex texture at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:rtype: gp_Pnt2d
") VertexTexel;
		gp_Pnt2d VertexTexel (const Standard_Integer theRank);
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "	* Returns the vertex texture coordinates at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:param theTX:
	:type theTX: float &
	:param theTY:
	:type theTY: float &
	:rtype: None
") VertexTexel;
		void VertexTexel (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "	* Returns the vertice at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:rtype: gp_Pnt
") Vertice;
		gp_Pnt Vertice (const Standard_Integer theRank);
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "	* Returns the vertice coordinates at rank theRank from the vertex table if defined.

	:param theRank:
	:type theRank: int
	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: None
") Vertice;
		void Vertice (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%make_alias(Graphic3d_ArrayOfPrimitives)

%extend Graphic3d_ArrayOfPrimitives {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectFillArea3d;
class Graphic3d_AspectFillArea3d : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AllowBackFace;
		%feature("autodoc", "	* Allows the display of back-facing filled polygons.

	:rtype: None
") AllowBackFace;
		void AllowBackFace ();
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "	* Returns true if back faces should be suppressed (true by default).

	:rtype: bool
") BackFace;
		bool BackFace ();
		%feature("compactdefaultargs") BackInteriorColor;
		%feature("autodoc", "	* Return back interior color.

	:rtype: Quantity_Color
") BackInteriorColor;
		const Quantity_Color & BackInteriorColor ();
		%feature("compactdefaultargs") BackInteriorColorRGBA;
		%feature("autodoc", "	* Return back interior color.

	:rtype: Quantity_ColorRGBA
") BackInteriorColorRGBA;
		const Quantity_ColorRGBA & BackInteriorColorRGBA ();
		%feature("compactdefaultargs") BackMaterial;
		%feature("autodoc", "	* Returns the surface material of internal faces

	:rtype: Graphic3d_MaterialAspect
") BackMaterial;
		const Graphic3d_MaterialAspect & BackMaterial ();
		%feature("compactdefaultargs") ChangeBackMaterial;
		%feature("autodoc", "	* Returns the surface material of internal faces

	:rtype: Graphic3d_MaterialAspect
") ChangeBackMaterial;
		Graphic3d_MaterialAspect & ChangeBackMaterial ();
		%feature("compactdefaultargs") ChangeFrontMaterial;
		%feature("autodoc", "	* Returns the surface material of external faces

	:rtype: Graphic3d_MaterialAspect
") ChangeFrontMaterial;
		Graphic3d_MaterialAspect & ChangeFrontMaterial ();
		%feature("compactdefaultargs") Distinguish;
		%feature("autodoc", "	* Returns true if material properties should be distinguished for back and front faces (false by default).

	:rtype: bool
") Distinguish;
		bool Distinguish ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Returns true if edges should be drawn.

	:rtype: bool
") Edge;
		bool Edge ();
		%feature("compactdefaultargs") EdgeColor;
		%feature("autodoc", "	* Return color of edges.

	:rtype: Quantity_Color
") EdgeColor;
		const Quantity_Color & EdgeColor ();
		%feature("compactdefaultargs") EdgeColorRGBA;
		%feature("autodoc", "	* Return color of edges.

	:rtype: Quantity_ColorRGBA
") EdgeColorRGBA;
		const Quantity_ColorRGBA & EdgeColorRGBA ();
		%feature("compactdefaultargs") EdgeLineType;
		%feature("autodoc", "	* Return edges line type.

	:rtype: Aspect_TypeOfLine
") EdgeLineType;
		Aspect_TypeOfLine EdgeLineType ();
		%feature("compactdefaultargs") EdgeWidth;
		%feature("autodoc", "	* Return width for edges in pixels.

	:rtype: Standard_ShortReal
") EdgeWidth;
		Standard_ShortReal EdgeWidth ();
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "	* Returns the surface material of external faces

	:rtype: Graphic3d_MaterialAspect
") FrontMaterial;
		const Graphic3d_MaterialAspect & FrontMaterial ();
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "	* Creates a context table for fill area primitives defined with the following default values: //! InteriorStyle : Aspect_IS_EMPTY InteriorColor : Quantity_NOC_CYAN1 EdgeColor : Quantity_NOC_WHITE EdgeLineType : Aspect_TOL_SOLID EdgeWidth : 1.0 FrontMaterial : NOM_BRASS BackMaterial : NOM_BRASS HatchStyle : Aspect_HS_SOLID //! Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.

	:rtype: None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d ();
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "	* Creates a context table for fill area primitives defined with the specified values. Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.

	:param theInterior:
	:type theInterior: Aspect_InteriorStyle
	:param theInteriorColor:
	:type theInteriorColor: Quantity_Color &
	:param theEdgeColor:
	:type theEdgeColor: Quantity_Color &
	:param theEdgeLineType:
	:type theEdgeLineType: Aspect_TypeOfLine
	:param theEdgeWidth:
	:type theEdgeWidth: float
	:param theFrontMaterial:
	:type theFrontMaterial: Graphic3d_MaterialAspect &
	:param theBackMaterial:
	:type theBackMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d (const Aspect_InteriorStyle theInterior,const Quantity_Color & theInteriorColor,const Quantity_Color & theEdgeColor,const Aspect_TypeOfLine theEdgeLineType,const Standard_Real theEdgeWidth,const Graphic3d_MaterialAspect & theFrontMaterial,const Graphic3d_MaterialAspect & theBackMaterial);
		%feature("compactdefaultargs") HatchStyle;
		%feature("autodoc", "	* Returns the hatch type used when InteriorStyle is IS_HATCH

	:rtype: Handle_Graphic3d_HatchStyle
") HatchStyle;
		Handle_Graphic3d_HatchStyle HatchStyle ();
		%feature("compactdefaultargs") InteriorColor;
		%feature("autodoc", "	* Return interior color.

	:rtype: Quantity_Color
") InteriorColor;
		const Quantity_Color & InteriorColor ();
		%feature("compactdefaultargs") InteriorColorRGBA;
		%feature("autodoc", "	* Return interior color.

	:rtype: Quantity_ColorRGBA
") InteriorColorRGBA;
		const Quantity_ColorRGBA & InteriorColorRGBA ();
		%feature("compactdefaultargs") InteriorStyle;
		%feature("autodoc", "	* Return interior rendering style (Aspect_IS_EMPTY by default, which means nothing will be rendered!).

	:rtype: Aspect_InteriorStyle
") InteriorStyle;
		Aspect_InteriorStyle InteriorStyle ();
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "	* Returns current polygon offsets settings.

	:rtype: Graphic3d_PolygonOffset
") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset ();
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "	* Returns current polygon offsets settings.

	:param theMode:
	:type theMode: int &
	:param theFactor:
	:type theFactor: Standard_ShortReal &
	:param theUnits:
	:type theUnits: Standard_ShortReal &
	:rtype: None
") PolygonOffsets;
		void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & theFactor,Standard_ShortReal & theUnits);
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "	* Modifies the color of the interior of the back face

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetBackInteriorColor;
		void SetBackInteriorColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "	* Modifies the color of the interior of the back face

	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:rtype: None
") SetBackInteriorColor;
		void SetBackInteriorColor (const Quantity_ColorRGBA & theColor);
		%feature("compactdefaultargs") SetBackMaterial;
		%feature("autodoc", "	* Modifies the surface material of internal faces

	:param theMaterial:
	:type theMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetBackMaterial;
		void SetBackMaterial (const Graphic3d_MaterialAspect & theMaterial);
		%feature("compactdefaultargs") SetDistinguish;
		%feature("autodoc", "	* Set material distinction between front and back faces.

	:param toDistinguish:
	:type toDistinguish: bool
	:rtype: None
") SetDistinguish;
		void SetDistinguish (bool toDistinguish);
		%feature("compactdefaultargs") SetDistinguishOff;
		%feature("autodoc", "	* Forbids material distinction between front and back faces.

	:rtype: None
") SetDistinguishOff;
		void SetDistinguishOff ();
		%feature("compactdefaultargs") SetDistinguishOn;
		%feature("autodoc", "	* Allows material distinction between front and back faces.

	:rtype: None
") SetDistinguishOn;
		void SetDistinguishOn ();
		%feature("compactdefaultargs") SetDrawEdges;
		%feature("autodoc", "	* Set if edges should be drawn or not.

	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawEdges;
		void SetDrawEdges (bool theToDraw);
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "	* Modifies the color of the edge of the face

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetEdgeColor;
		void SetEdgeColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetEdgeLineType;
		%feature("autodoc", "	* Modifies the edge line type

	:param theType:
	:type theType: Aspect_TypeOfLine
	:rtype: None
") SetEdgeLineType;
		void SetEdgeLineType (const Aspect_TypeOfLine theType);
		%feature("compactdefaultargs") SetEdgeOff;
		%feature("autodoc", "	* The edges of FillAreas are not drawn.

	:rtype: None
") SetEdgeOff;
		void SetEdgeOff ();
		%feature("compactdefaultargs") SetEdgeOn;
		%feature("autodoc", "	* The edges of FillAreas are drawn.

	:rtype: None
") SetEdgeOn;
		void SetEdgeOn ();
		%feature("compactdefaultargs") SetEdgeWidth;
		%feature("autodoc", "	* Modifies the edge thickness Warning: Raises AspectFillAreaDefinitionError if the width is a negative value.

	:param theWidth:
	:type theWidth: float
	:rtype: None
") SetEdgeWidth;
		void SetEdgeWidth (const Standard_Real theWidth);
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "	* Modifies the surface material of external faces

	:param theMaterial:
	:type theMaterial: Graphic3d_MaterialAspect &
	:rtype: None
") SetFrontMaterial;
		void SetFrontMaterial (const Graphic3d_MaterialAspect & theMaterial);
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "	* Modifies the hatch type used when InteriorStyle is IS_HATCH

	:param theStyle:
	:type theStyle: Handle_Graphic3d_HatchStyle &
	:rtype: None
") SetHatchStyle;
		void SetHatchStyle (const Handle_Graphic3d_HatchStyle & theStyle);
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "	* Modifies the hatch type used when InteriorStyle is IS_HATCH @warning This method always creates a new handle for a given hatch style

	:param theStyle:
	:type theStyle: Aspect_HatchStyle
	:rtype: None
") SetHatchStyle;
		void SetHatchStyle (const Aspect_HatchStyle theStyle);
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "	* Modifies the color of the interior of the face

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetInteriorColor;
		void SetInteriorColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "	* Modifies the color of the interior of the face

	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:rtype: None
") SetInteriorColor;
		void SetInteriorColor (const Quantity_ColorRGBA & theColor);
		%feature("compactdefaultargs") SetInteriorStyle;
		%feature("autodoc", "	* Modifies the interior type used for rendering

	:param theStyle:
	:type theStyle: Aspect_InteriorStyle
	:rtype: None
") SetInteriorStyle;
		void SetInteriorStyle (const Aspect_InteriorStyle theStyle);
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "	* Sets up OpenGL polygon offsets mechanism. <aMode> parameter can contain various combinations of Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means that polygon offsets are not changed). If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits> arguments are used by graphic renderer to calculate a depth offset value: //! offset = <aFactor> * m + <aUnits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific) //! Default settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0. //! Negative offset values move polygons closer to the viewport, while positive values shift polygons away. Consult OpenGL reference for details (glPolygonOffset function description).

	:param theMode:
	:type theMode: int
	:param theFactor: default value is 1.0f
	:type theFactor: Standard_ShortReal
	:param theUnits: default value is 0.0f
	:type theUnits: Standard_ShortReal
	:rtype: None
") SetPolygonOffsets;
		void SetPolygonOffsets (const Standard_Integer theMode,const Standard_ShortReal theFactor = 1.0f,const Standard_ShortReal theUnits = 0.0f);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") SetSuppressBackFaces;
		%feature("autodoc", "	* Assign back faces culling flag.

	:param theToSuppress:
	:type theToSuppress: bool
	:rtype: None
") SetSuppressBackFaces;
		void SetSuppressBackFaces (bool theToSuppress);
		%feature("compactdefaultargs") SetTextureMap;
		%feature("autodoc", "	* Assign texture to be mapped. See also SetTextureMapOn() to actually activate texture mapping. ////Standard_DEPRECATED('Deprecated method, SetTextureSet() should be used instead')

	:param theTexture:
	:type theTexture: Handle_Graphic3d_TextureMap &
	:rtype: None
") SetTextureMap;
		void SetTextureMap (const Handle_Graphic3d_TextureMap & theTexture);
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "	* Disable texture mapping.

	:rtype: None
") SetTextureMapOff;
		void SetTextureMapOff ();
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "	* Enable or disable texture mapping (has no effect if texture is not set).

	:param theToMap:
	:type theToMap: bool
	:rtype: None
") SetTextureMapOn;
		void SetTextureMapOn (bool theToMap);
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "	* Enable texture mapping (has no effect if texture is not set).

	:rtype: None
") SetTextureMapOn;
		void SetTextureMapOn ();
		%feature("compactdefaultargs") SetTextureSet;
		%feature("autodoc", "	* Setup texture array to be mapped.

	:param theTextures:
	:type theTextures: Handle_Graphic3d_TextureSet &
	:rtype: None
") SetTextureSet;
		void SetTextureSet (const Handle_Graphic3d_TextureSet & theTextures);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	* Return shader program.

	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
		%feature("compactdefaultargs") SuppressBackFace;
		%feature("autodoc", "	* Suppress the display of back-facing filled polygons. A back-facing polygon is defined as a polygon whose vertices are in a clockwise order with respect to screen coordinates.

	:rtype: None
") SuppressBackFace;
		void SuppressBackFace ();
		%feature("compactdefaultargs") TextureMap;
		%feature("autodoc", "	* Return texture to be mapped. ////Standard_DEPRECATED('Deprecated method, TextureSet() should be used instead')

	:rtype: Handle_Graphic3d_TextureMap
") TextureMap;
		Handle_Graphic3d_TextureMap TextureMap ();
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "	* Return true if texture mapping is enabled (false by default).

	:rtype: bool
") TextureMapState;
		bool TextureMapState ();
		%feature("compactdefaultargs") TextureSet;
		%feature("autodoc", "	* Return texture array to be mapped.

	:rtype: Handle_Graphic3d_TextureSet
") TextureSet;
		Handle_Graphic3d_TextureSet TextureSet ();
		%feature("compactdefaultargs") ToDrawEdges;
		%feature("autodoc", "	* Returns true if edges should be drawn (false by default).

	:rtype: bool
") ToDrawEdges;
		bool ToDrawEdges ();
		%feature("compactdefaultargs") ToMapTexture;
		%feature("autodoc", "	* Return true if texture mapping is enabled (false by default).

	:rtype: bool
") ToMapTexture;
		bool ToMapTexture ();
		%feature("compactdefaultargs") ToSuppressBackFaces;
		%feature("autodoc", "	* Returns true if back faces should be suppressed (true by default).

	:rtype: bool
") ToSuppressBackFaces;
		bool ToSuppressBackFaces ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values.

	:param theStyle:
	:type theStyle: Aspect_InteriorStyle &
	:param theIntColor:
	:type theIntColor: Quantity_Color &
	:param theEdgeColor:
	:type theEdgeColor: Quantity_Color &
	:param theType:
	:type theType: Aspect_TypeOfLine &
	:param theWidth:
	:type theWidth: float &
	:rtype: None
") Values;
		void Values (Aspect_InteriorStyle & theStyle,Quantity_Color & theIntColor,Quantity_Color & theEdgeColor,Aspect_TypeOfLine & theType,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values.

	:param theStyle:
	:type theStyle: Aspect_InteriorStyle &
	:param theIntColor:
	:type theIntColor: Quantity_Color &
	:param theBackIntColor:
	:type theBackIntColor: Quantity_Color &
	:param theEdgeColor:
	:type theEdgeColor: Quantity_Color &
	:param theType:
	:type theType: Aspect_TypeOfLine &
	:param theWidth:
	:type theWidth: float &
	:rtype: None
") Values;
		void Values (Aspect_InteriorStyle & theStyle,Quantity_Color & theIntColor,Quantity_Color & theBackIntColor,Quantity_Color & theEdgeColor,Aspect_TypeOfLine & theType,Standard_Real &OutValue);
};


%make_alias(Graphic3d_AspectFillArea3d)

%extend Graphic3d_AspectFillArea3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectLine3d;
class Graphic3d_AspectLine3d : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Return color.

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "	* Return color.

	:rtype: Quantity_ColorRGBA
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA ();
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "	* Creates a context table for line primitives defined with the following default values: //! Color = Quantity_NOC_YELLOW; Type = Aspect_TOL_SOLID; Width = 1.0;

	:rtype: None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d ();
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "	* Creates a context table for line primitives defined with the specified values. Warning: theWidth is the 'line width scale factor'. The nominal line width is 1 pixel. The width of the line is determined by applying the line width scale factor to this nominal line width. The supported line widths vary by 1-pixel units.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theType:
	:type theType: Aspect_TypeOfLine
	:param theWidth:
	:type theWidth: float
	:rtype: None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d (const Quantity_Color & theColor,const Aspect_TypeOfLine theType,const Standard_Real theWidth);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Check for equality with another line aspect.

	:param theOther:
	:type theOther: Graphic3d_AspectLine3d &
	:rtype: bool
") IsEqual;
		bool IsEqual (const Graphic3d_AspectLine3d & theOther);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Modifies the type of line.

	:param theType:
	:type theType: Aspect_TypeOfLine
	:rtype: None
") SetType;
		void SetType (const Aspect_TypeOfLine theType);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Modifies the line thickness. Warning: Raises AspectLineDefinitionError if the width is a negative value.

	:param theWidth:
	:type theWidth: float
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_Real theWidth);
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "	* Modifies the line thickness. Warning: Raises AspectLineDefinitionError if the width is a negative value.

	:param theWidth:
	:type theWidth: Standard_ShortReal
	:rtype: None
") SetWidth;
		void SetWidth (const Standard_ShortReal theWidth);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	* Return shader program.

	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Return line type.

	:rtype: Aspect_TypeOfLine
") Type;
		Aspect_TypeOfLine Type ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theType:
	:type theType: Aspect_TypeOfLine &
	:param theWidth:
	:type theWidth: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & theColor,Aspect_TypeOfLine & theType,Standard_Real &OutValue);
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "	* Return line width.

	:rtype: Standard_ShortReal
") Width;
		Standard_ShortReal Width ();
};


%make_alias(Graphic3d_AspectLine3d)

%extend Graphic3d_AspectLine3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectMarker3d;
class Graphic3d_AspectMarker3d : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Return the color.

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "	* Return color.

	:rtype: Quantity_ColorRGBA
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA ();
		%feature("compactdefaultargs") GetMarkerImage;
		%feature("autodoc", "	* Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.

	:rtype: Handle_Graphic3d_MarkerImage
") GetMarkerImage;
		Handle_Graphic3d_MarkerImage GetMarkerImage ();
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "	* Returns marker's texture size.

	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "	* Creates a context table for marker primitives defined with the following default values: //! Marker type : TOM_X Color : YELLOW Scale factor: 1.0

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
	:type theTextureImage: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Handle_Image_PixMap & theTextureImage);
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Return scale factor.

	:rtype: Standard_ShortReal
") Scale;
		Standard_ShortReal Scale ();
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
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetMarkerImage;
		%feature("autodoc", "	* Set marker's image texture.

	:param theImage:
	:type theImage: Handle_Graphic3d_MarkerImage &
	:rtype: None
") SetMarkerImage;
		void SetMarkerImage (const Handle_Graphic3d_MarkerImage & theImage);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Modifies the scale factor. Marker type Aspect_TOM_POINT is not affected by the marker size scale factor. It is always the smallest displayable dot. Warning: Raises AspectMarkerDefinitionError if the scale is a negative value.

	:param theScale:
	:type theScale: Standard_ShortReal
	:rtype: None
") SetScale;
		void SetScale (const Standard_ShortReal theScale);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Assign scale factor.

	:param theScale:
	:type theScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real theScale);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Modifies the type of marker.

	:param theType:
	:type theType: Aspect_TypeOfMarker
	:rtype: None
") SetType;
		void SetType (const Aspect_TypeOfMarker theType);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	* Return the program.

	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Return marker type.

	:rtype: Aspect_TypeOfMarker
") Type;
		Aspect_TypeOfMarker Type ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theType:
	:type theType: Aspect_TypeOfMarker &
	:param theScale:
	:type theScale: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & theColor,Aspect_TypeOfMarker & theType,Standard_Real &OutValue);
};


%make_alias(Graphic3d_AspectMarker3d)

%extend Graphic3d_AspectMarker3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_AspectText3d;
class Graphic3d_AspectText3d : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Return the text color.

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "	* Return the text color.

	:rtype: Quantity_ColorRGBA
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA ();
		%feature("compactdefaultargs") ColorSubTitle;
		%feature("autodoc", "	* Return subtitle color.

	:rtype: Quantity_Color
") ColorSubTitle;
		const Quantity_Color & ColorSubTitle ();
		%feature("compactdefaultargs") ColorSubTitleRGBA;
		%feature("autodoc", "	* Return subtitle color.

	:rtype: Quantity_ColorRGBA
") ColorSubTitleRGBA;
		const Quantity_ColorRGBA & ColorSubTitleRGBA ();
		%feature("compactdefaultargs") DisplayType;
		%feature("autodoc", "	* Return display type.

	:rtype: Aspect_TypeOfDisplayText
") DisplayType;
		Aspect_TypeOfDisplayText DisplayType ();
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "	* Return the font.

	:rtype: TCollection_AsciiString
") Font;
		const TCollection_AsciiString & Font ();
		%feature("compactdefaultargs") GetTextAngle;
		%feature("autodoc", "	* Returns Angle of degree

	:rtype: float
") GetTextAngle;
		Standard_Real GetTextAngle ();
		%feature("compactdefaultargs") GetTextFontAspect;
		%feature("autodoc", "	* Returns text FontAspect

	:rtype: Font_FontAspect
") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect ();
		%feature("compactdefaultargs") GetTextZoomable;
		%feature("autodoc", "	* Returns True when the Text Zoomable is on.

	:rtype: bool
") GetTextZoomable;
		bool GetTextZoomable ();
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "	* Creates a context table for text primitives defined with the following default values: //! Color : NOC_YELLOW Font  : NOF_ASCII_MONO Expansion factor : 1. Space between characters : 0. The style  : TOST_NORMAL The display type : TODT_NORMAL

	:rtype: None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d ();
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "	* Creates a context table for text primitives defined with the specified values. AFont may be to take means from User(example 'Courier New') or Font name defined in Font_NameOfFont(example Font_NOF_ASCII_MONO) or use default font('Courier')

	:param theColor:
	:type theColor: Quantity_Color &
	:param theFont:
	:type theFont: char *
	:param theExpansionFactor:
	:type theExpansionFactor: float
	:param theSpace:
	:type theSpace: float
	:param theStyle: default value is Aspect_TOST_NORMAL
	:type theStyle: Aspect_TypeOfStyleText
	:param theDisplayType: default value is Aspect_TODT_NORMAL
	:type theDisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d (const Quantity_Color & theColor,const char * theFont,const Standard_Real theExpansionFactor,const Standard_Real theSpace,const Aspect_TypeOfStyleText theStyle = Aspect_TOST_NORMAL,const Aspect_TypeOfDisplayText theDisplayType = Aspect_TODT_NORMAL);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the color.

	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_ColorRGBA & theColor);
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "	* Modifies the color of the subtitle for the TODT_SUBTITLE TextDisplayType and the color of background for the TODT_DEKALE TextDisplayType.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "	* Modifies the color of the subtitle for the TODT_SUBTITLE TextDisplayType and the color of background for the TODT_DEKALE TextDisplayType.

	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:rtype: None
") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_ColorRGBA & theColor);
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "	* Define the display type of the text. //! TODT_NORMAL Default display. Text only. TODT_SUBTITLE There is a subtitle under the text. TODT_DEKALE The text is displayed with a 3D style. TODT_BLEND The text is displayed in XOR. TODT_DIMENSION Dimension line under text will be invisible.

	:param theDisplayType:
	:type theDisplayType: Aspect_TypeOfDisplayText
	:rtype: None
") SetDisplayType;
		void SetDisplayType (const Aspect_TypeOfDisplayText theDisplayType);
		%feature("compactdefaultargs") SetExpansionFactor;
		%feature("autodoc", "	* Modifies the expansion factor (height/width ratio) If the factor is less than 1, the characters will be higher than they are wide.

	:param theFactor:
	:type theFactor: float
	:rtype: None
") SetExpansionFactor;
		void SetExpansionFactor (const Standard_Real theFactor);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Modifies the font.

	:param theFont:
	:type theFont: TCollection_AsciiString &
	:rtype: None
") SetFont;
		void SetFont (const TCollection_AsciiString & theFont);
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "	* Modifies the font.

	:param theFont:
	:type theFont: char *
	:rtype: None
") SetFont;
		void SetFont (const char * theFont);
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "	* Sets up OpenGL/GLSL shader program.

	:param theProgram:
	:type theProgram: Handle_Graphic3d_ShaderProgram &
	:rtype: None
") SetShaderProgram;
		void SetShaderProgram (const Handle_Graphic3d_ShaderProgram & theProgram);
		%feature("compactdefaultargs") SetSpace;
		%feature("autodoc", "	* Modifies the space between the characters.

	:param theSpace:
	:type theSpace: float
	:rtype: None
") SetSpace;
		void SetSpace (const Standard_Real theSpace);
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "	* Modifies the style of the text. * TOST_NORMAL Default text. The text is displayed like any other graphic object. This text can be hidden by another object that is nearest from the point of view. * TOST_ANNOTATION The text is always visible. The text is displayed over the other object according to the priority.

	:param theStyle:
	:type theStyle: Aspect_TypeOfStyleText
	:rtype: None
") SetStyle;
		void SetStyle (const Aspect_TypeOfStyleText theStyle);
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "	* Turns usage of text rotated

	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetTextAngle;
		void SetTextAngle (const Standard_Real theAngle);
		%feature("compactdefaultargs") SetTextFontAspect;
		%feature("autodoc", "	* Turns usage of Aspect text

	:param theFontAspect:
	:type theFontAspect: Font_FontAspect
	:rtype: None
") SetTextFontAspect;
		void SetTextFontAspect (const Font_FontAspect theFontAspect);
		%feature("compactdefaultargs") SetTextZoomable;
		%feature("autodoc", "	* Turns usage of text zoomable on/off

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetTextZoomable;
		void SetTextZoomable (const bool theFlag);
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "	* Return the shader program.

	:rtype: Handle_Graphic3d_ShaderProgram
") ShaderProgram;
		Handle_Graphic3d_ShaderProgram ShaderProgram ();
		%feature("compactdefaultargs") Space;
		%feature("autodoc", "	* Return the space between characters.

	:rtype: float
") Space;
		Standard_Real Space ();
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "	* Return the text style.

	:rtype: Aspect_TypeOfStyleText
") Style;
		Aspect_TypeOfStyleText Style ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theFont:
	:type theFont: char * &
	:param theExpansionFactor:
	:type theExpansionFactor: float &
	:param theSpace:
	:type theSpace: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & theColor,const char * & theFont,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theFont:
	:type theFont: char * &
	:param theExpansionFactor:
	:type theExpansionFactor: float &
	:param theSpace:
	:type theSpace: float &
	:param theStyle:
	:type theStyle: Aspect_TypeOfStyleText &
	:param theDisplayType:
	:type theDisplayType: Aspect_TypeOfDisplayText &
	:param theColorSubTitle:
	:type theColorSubTitle: Quantity_Color &
	:rtype: None
") Values;
		void Values (Quantity_Color & theColor,const char * & theFont,Standard_Real &OutValue,Standard_Real &OutValue,Aspect_TypeOfStyleText & theStyle,Aspect_TypeOfDisplayText & theDisplayType,Quantity_Color & theColorSubTitle);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theFont:
	:type theFont: char * &
	:param theExpansionFactor:
	:type theExpansionFactor: float &
	:param theSpace:
	:type theSpace: float &
	:param theStyle:
	:type theStyle: Aspect_TypeOfStyleText &
	:param theDisplayType:
	:type theDisplayType: Aspect_TypeOfDisplayText &
	:param theColorSubTitle:
	:type theColorSubTitle: Quantity_Color &
	:param theTextZoomable:
	:type theTextZoomable: bool
	:param theTextAngle:
	:type theTextAngle: float &
	:rtype: None
") Values;
		void Values (Quantity_Color & theColor,const char * & theFont,Standard_Real &OutValue,Standard_Real &OutValue,Aspect_TypeOfStyleText & theStyle,Aspect_TypeOfDisplayText & theDisplayType,Quantity_Color & theColorSubTitle,Standard_Boolean &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the current values of the group.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theFont:
	:type theFont: char * &
	:param theExpansionFactor:
	:type theExpansionFactor: float &
	:param theSpace:
	:type theSpace: float &
	:param theStyle:
	:type theStyle: Aspect_TypeOfStyleText &
	:param theDisplayType:
	:type theDisplayType: Aspect_TypeOfDisplayText &
	:param theColorSubTitle:
	:type theColorSubTitle: Quantity_Color &
	:param theTextZoomable:
	:type theTextZoomable: bool
	:param theTextAngle:
	:type theTextAngle: float &
	:param theTextFontAspect:
	:type theTextFontAspect: Font_FontAspect &
	:rtype: None
") Values;
		void Values (Quantity_Color & theColor,const char * & theFont,Standard_Real &OutValue,Standard_Real &OutValue,Aspect_TypeOfStyleText & theStyle,Aspect_TypeOfDisplayText & theDisplayType,Quantity_Color & theColorSubTitle,Standard_Boolean &OutValue,Standard_Real &OutValue,Font_FontAspect & theTextFontAspect);
};


%make_alias(Graphic3d_AspectText3d)

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
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Color of axis and values

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
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
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") Name;
		const TCollection_ExtendedString & Name ();
		%feature("compactdefaultargs") NameColor;
		%feature("autodoc", "	:rtype: Quantity_Color
") NameColor;
		const Quantity_Color & NameColor ();
		%feature("compactdefaultargs") NameOffset;
		%feature("autodoc", "	:rtype: int
") NameOffset;
		Standard_Integer NameOffset ();
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets color of axis and values

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetDrawName;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawName;
		void SetDrawName (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") SetDrawTickmarks;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawTickmarks;
		void SetDrawTickmarks (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") SetDrawValues;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawValues;
		void SetDrawValues (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	:param theName:
	:type theName: TCollection_ExtendedString &
	:rtype: None
") SetName;
		void SetName (const TCollection_ExtendedString & theName);
		%feature("compactdefaultargs") SetNameColor;
		%feature("autodoc", "	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetNameColor;
		void SetNameColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetNameOffset;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetNameOffset;
		void SetNameOffset (const Standard_Integer theValue);
		%feature("compactdefaultargs") SetTickmarksLength;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetTickmarksLength;
		void SetTickmarksLength (const Standard_Integer theValue);
		%feature("compactdefaultargs") SetTickmarksNumber;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetTickmarksNumber;
		void SetTickmarksNumber (const Standard_Integer theValue);
		%feature("compactdefaultargs") SetValuesOffset;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetValuesOffset;
		void SetValuesOffset (const Standard_Integer theValue);
		%feature("compactdefaultargs") TickmarksLength;
		%feature("autodoc", "	:rtype: int
") TickmarksLength;
		Standard_Integer TickmarksLength ();
		%feature("compactdefaultargs") TickmarksNumber;
		%feature("autodoc", "	:rtype: int
") TickmarksNumber;
		Standard_Integer TickmarksNumber ();
		%feature("compactdefaultargs") ToDrawName;
		%feature("autodoc", "	:rtype: bool
") ToDrawName;
		Standard_Boolean ToDrawName ();
		%feature("compactdefaultargs") ToDrawTickmarks;
		%feature("autodoc", "	:rtype: bool
") ToDrawTickmarks;
		Standard_Boolean ToDrawTickmarks ();
		%feature("compactdefaultargs") ToDrawValues;
		%feature("autodoc", "	:rtype: bool
") ToDrawValues;
		Standard_Boolean ToDrawValues ();
		%feature("compactdefaultargs") ValuesOffset;
		%feature("autodoc", "	:rtype: int
") ValuesOffset;
		Standard_Integer ValuesOffset ();
};


%extend Graphic3d_AxisAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_BSDF;
class Graphic3d_BSDF {
	public:
		Graphic3d_Vec4 Kc;
		Graphic3d_Vec3 Kd;
		Graphic3d_Vec4 Ks;
		Graphic3d_Vec3 Kt;
		Graphic3d_Vec3 Le;
		Graphic3d_Vec4 Absorption;
		Graphic3d_Fresnel FresnelCoat;
		Graphic3d_Fresnel FresnelBase;
		%feature("compactdefaultargs") CreateDiffuse;
		%feature("autodoc", "	* Creates BSDF describing diffuse (Lambertian) surface.

	:param theWeight:
	:type theWeight: Graphic3d_Vec3 &
	:rtype: Graphic3d_BSDF
") CreateDiffuse;
		static Graphic3d_BSDF CreateDiffuse (const Graphic3d_Vec3 & theWeight);
		%feature("compactdefaultargs") CreateGlass;
		%feature("autodoc", "	* Creates BSDF describing glass-like object. Glass-like BSDF mixes refraction and reflection effects at grazing angles using physically-based Fresnel dielectric model.

	:param theWeight:
	:type theWeight: Graphic3d_Vec3 &
	:param theAbsorptionColor:
	:type theAbsorptionColor: Graphic3d_Vec3 &
	:param theAbsorptionCoeff:
	:type theAbsorptionCoeff: Standard_ShortReal
	:param theRefractionIndex:
	:type theRefractionIndex: Standard_ShortReal
	:rtype: Graphic3d_BSDF
") CreateGlass;
		static Graphic3d_BSDF CreateGlass (const Graphic3d_Vec3 & theWeight,const Graphic3d_Vec3 & theAbsorptionColor,const Standard_ShortReal theAbsorptionCoeff,const Standard_ShortReal theRefractionIndex);
		%feature("compactdefaultargs") CreateMetallic;
		%feature("autodoc", "	* Creates BSDF describing polished metallic-like surface.

	:param theWeight:
	:type theWeight: Graphic3d_Vec3 &
	:param theFresnel:
	:type theFresnel: Graphic3d_Fresnel &
	:param theRoughness:
	:type theRoughness: Standard_ShortReal
	:rtype: Graphic3d_BSDF
") CreateMetallic;
		static Graphic3d_BSDF CreateMetallic (const Graphic3d_Vec3 & theWeight,const Graphic3d_Fresnel & theFresnel,const Standard_ShortReal theRoughness);
		%feature("compactdefaultargs") CreateTransparent;
		%feature("autodoc", "	* Creates BSDF describing transparent object. Transparent BSDF models simple transparency without refraction (the ray passes straight through the surface).

	:param theWeight:
	:type theWeight: Graphic3d_Vec3 &
	:param theAbsorptionColor:
	:type theAbsorptionColor: Graphic3d_Vec3 &
	:param theAbsorptionCoeff:
	:type theAbsorptionCoeff: Standard_ShortReal
	:rtype: Graphic3d_BSDF
") CreateTransparent;
		static Graphic3d_BSDF CreateTransparent (const Graphic3d_Vec3 & theWeight,const Graphic3d_Vec3 & theAbsorptionColor,const Standard_ShortReal theAbsorptionCoeff);
		%feature("compactdefaultargs") Graphic3d_BSDF;
		%feature("autodoc", "	* Creates uninitialized BSDF.

	:rtype: None
") Graphic3d_BSDF;
		 Graphic3d_BSDF ();
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* Normalizes BSDF components.

	:rtype: None
") Normalize;
		void Normalize ();

        %extend{
            bool __eq_wrapper__(const Graphic3d_BSDF  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Graphic3d_BSDF {
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


%make_alias(Graphic3d_BoundBuffer)

%extend Graphic3d_BoundBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CLight;
class Graphic3d_CLight {
	public:
		Graphic3d_Vec3d Position;
		Graphic3d_Vec4 Color;
		Graphic3d_Vec4 Direction;
		Graphic3d_Vec4 Params;
		Standard_ShortReal Smoothness;
		Standard_ShortReal Intensity;
		Graphic3d_TypeOfLightSource Type;
		bool IsHeadlight;
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Angle in radians of the cone created by the spot

	:rtype: Standard_ShortReal
") Angle;
		Standard_ShortReal Angle ();
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "	* Const, Linear attenuation factors of positional light source

	:rtype: Graphic3d_Vec2
") Attenuation;
		Graphic3d_Vec2 Attenuation ();
		%feature("compactdefaultargs") ChangeAngle;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeAngle;
		Standard_ShortReal & ChangeAngle ();
		%feature("compactdefaultargs") ChangeAttenuation;
		%feature("autodoc", "	:rtype: Graphic3d_Vec2
") ChangeAttenuation;
		Graphic3d_Vec2 & ChangeAttenuation ();
		%feature("compactdefaultargs") ChangeConcentration;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConcentration;
		Standard_ShortReal & ChangeConcentration ();
		%feature("compactdefaultargs") ChangeConstAttenuation;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeConstAttenuation;
		Standard_ShortReal & ChangeConstAttenuation ();
		%feature("compactdefaultargs") ChangeLinearAttenuation;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ChangeLinearAttenuation;
		Standard_ShortReal & ChangeLinearAttenuation ();
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "	* Intensity distribution of the spot light, with 0..1 range.

	:rtype: Standard_ShortReal
") Concentration;
		Standard_ShortReal Concentration ();
		%feature("compactdefaultargs") ConstAttenuation;
		%feature("autodoc", "	* //!< flag to mark head light Const attenuation factor of positional light source

	:rtype: Standard_ShortReal
") ConstAttenuation;
		Standard_ShortReal ConstAttenuation ();
		%feature("compactdefaultargs") Graphic3d_CLight;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") Graphic3d_CLight;
		 Graphic3d_CLight ();
		%feature("compactdefaultargs") LinearAttenuation;
		%feature("autodoc", "	* Linear attenuation factor of positional light source

	:rtype: Standard_ShortReal
") LinearAttenuation;
		Standard_ShortReal LinearAttenuation ();
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
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* returns bounding box of this presentation

	:rtype: Graphic3d_BndBox3d
") BoundingBox;
		const Graphic3d_BndBox3d & BoundingBox ();
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "	* returns bounding box of this presentation without transformation matrix applied

	:rtype: Graphic3d_BndBox3d
") ChangeBoundingBox;
		Graphic3d_BndBox3d & ChangeBoundingBox ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear graphic data

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "	* returns associated clip planes

	:rtype: Handle_Graphic3d_SequenceOfHClipPlane
") ClipPlanes;
		Handle_Graphic3d_SequenceOfHClipPlane ClipPlanes ();
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
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "	* returns graphic driver created this structure

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		Handle_Graphic3d_GraphicDriver GraphicDriver ();
		%feature("compactdefaultargs") GraphicHighlight;
		%feature("autodoc", "	* Highlights structure with the given style

	:param theStyle:
	:type theStyle: Handle_Graphic3d_PresentationAttributes &
	:param theStruct:
	:type theStruct: Handle_Graphic3d_Structure &
	:rtype: None
") GraphicHighlight;
		void GraphicHighlight (const Handle_Graphic3d_PresentationAttributes & theStyle,const Handle_Graphic3d_Structure & theStruct);
		%feature("compactdefaultargs") GraphicUnhighlight;
		%feature("autodoc", "	* Unhighlights the structure and invalidates pointer to structure's highlight style

	:rtype: None
") GraphicUnhighlight;
		void GraphicUnhighlight ();
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "	* returns graphic groups

	:rtype: Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "	* Returns valid handle to highlight style of the structure in case if highlight flag is set to true

	:rtype: Handle_Graphic3d_PresentationAttributes
") HighlightStyle;
		Handle_Graphic3d_PresentationAttributes HighlightStyle ();
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Return structure visibility flag

	:rtype: bool
") IsVisible;
		bool IsVisible ();
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "	* Return structure visibility considering both View Affinity and global visibility state.

	:param theViewId:
	:type theViewId: int
	:rtype: bool
") IsVisible;
		bool IsVisible (const Standard_Integer theViewId);
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "	* Create new group within this structure

	:param theStruct:
	:type theStruct: Handle_Graphic3d_Structure &
	:rtype: Handle_Graphic3d_Group
") NewGroup;
		Handle_Graphic3d_Group NewGroup (const Handle_Graphic3d_Structure & theStruct);
		%feature("compactdefaultargs") OnVisibilityChanged;
		%feature("autodoc", "	* Update structure visibility state

	:rtype: None
") OnVisibilityChanged;
		void OnVisibilityChanged ();
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "	* Remove group from this structure

	:param theGroup:
	:type theGroup: Handle_Graphic3d_Group &
	:rtype: None
") RemoveGroup;
		void RemoveGroup (const Handle_Graphic3d_Group & theGroup);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Pass clip planes to the associated graphic driver structure

	:param thePlanes:
	:type thePlanes: Handle_Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Handle_Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Set transformation persistence.

	:param theTrsfPers:
	:type theTrsfPers: Handle_Graphic3d_TransformPers &
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Handle_Graphic3d_TransformPers & theTrsfPers);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* Assign transformation.

	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: None
") SetTransformation;
		void SetTransformation (const Handle_Geom_Transformation & theTrsf);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set z layer ID to display the structure in specified layer

	:param theLayerIndex:
	:type theLayerIndex: Graphic3d_ZLayerId
	:rtype: None
") SetZLayer;
		void SetZLayer (const Graphic3d_ZLayerId theLayerIndex);
		%feature("compactdefaultargs") ShadowLink;
		%feature("autodoc", "	* Create shadow link to this structure

	:param theManager:
	:type theManager: Handle_Graphic3d_StructureManager &
	:rtype: Handle_Graphic3d_CStructure
") ShadowLink;
		Handle_Graphic3d_CStructure ShadowLink (const Handle_Graphic3d_StructureManager & theManager);
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "	* Return transformation persistence.

	:rtype: Handle_Graphic3d_TransformPers
") TransformPersistence;
		Handle_Graphic3d_TransformPers TransformPersistence ();
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Return transformation.

	:rtype: Handle_Geom_Transformation
") Transformation;
		Handle_Geom_Transformation Transformation ();
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "	* Get z layer ID

	:rtype: Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer ();
};


%make_alias(Graphic3d_CStructure)

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
%nodefaultctor Graphic3d_Camera;
class Graphic3d_Camera : public Standard_Transient {
	public:
		class TransformMatrices {};
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

		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "	* Get camera display ratio. returns display ratio.

	:rtype: float
") Aspect;
		Standard_Real Aspect ();
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "	* Get camera axial scale. returns Camera's axial scale.

	:rtype: gp_XYZ
") AxialScale;
		const gp_XYZ  AxialScale ();
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Get Center of the camera. returns the point where the camera looks at.

	:rtype: gp_Pnt
") Center;
		const gp_Pnt  Center ();
		%feature("compactdefaultargs") ConvertProj2View;
		%feature("autodoc", "	* Convert point from projection coordinate space to view coordinate space. @param thePnt [in] the point in NDC. returns point in VCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertProj2View;
		gp_Pnt ConvertProj2View (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ConvertView2Proj;
		%feature("autodoc", "	* Convert point from view coordinate space to projection coordinate space. @param thePnt [in] the point in VCS. returns point in NDC.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertView2Proj;
		gp_Pnt ConvertView2Proj (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ConvertView2World;
		%feature("autodoc", "	* Convert point from view coordinate space to world coordinates. @param thePnt [in] the 3D point in VCS. returns point in WCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertView2World;
		gp_Pnt ConvertView2World (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") ConvertWorld2View;
		%feature("autodoc", "	* Convert point from world coordinate space to view coordinate space. @param thePnt [in] the 3D point in WCS. returns point in VCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") ConvertWorld2View;
		gp_Pnt ConvertWorld2View (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Copy properties of another camera. @param theOther [in] the camera to copy from.

	:param theOther:
	:type theOther: Handle_Graphic3d_Camera &
	:rtype: None
") Copy;
		void Copy (const Handle_Graphic3d_Camera & theOther);
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
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Get camera look direction. returns camera look direction.

	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Get distance of Eye from camera Center. returns the distance.

	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "	* Get camera Eye position. returns camera eye location.

	:rtype: gp_Pnt
") Eye;
		const gp_Pnt  Eye ();
		%feature("compactdefaultargs") FOVy;
		%feature("autodoc", "	* Get Field Of View (FOV) in y axis. returns the FOV value in degrees.

	:rtype: float
") FOVy;
		Standard_Real FOVy ();
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
		%feature("compactdefaultargs") GetIODType;
		%feature("autodoc", "	* Get Intraocular distance definition type. returns definition type used for Intraocular distance.

	:rtype: IODType
") GetIODType;
		IODType GetIODType ();
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
		%feature("compactdefaultargs") IOD;
		%feature("autodoc", "	* Get Intraocular distance value. returns absolute or relative IOD value depending on its definition type.

	:rtype: float
") IOD;
		Standard_Real IOD ();
		%feature("compactdefaultargs") InvalidateOrientation;
		%feature("autodoc", "	* Invalidate orientation matrix. The matrix will be updated on request.

	:rtype: None
") InvalidateOrientation;
		void InvalidateOrientation ();
		%feature("compactdefaultargs") InvalidateProjection;
		%feature("autodoc", "	* Invalidate state of projection matrix. The matrix will be updated on request.

	:rtype: None
") InvalidateProjection;
		void InvalidateProjection ();
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
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* @name Projection methods Project point from world coordinate space to normalized device coordinates (mapping). @param thePnt [in] the 3D point in WCS. returns mapped point in NDC.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") Project;
		gp_Pnt Project (const gp_Pnt & thePnt);
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
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "	* Returns modification state of camera projection matrix

	:rtype: Standard_Size
") ProjectionState;
		Standard_Size ProjectionState ();
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
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "	* returns camera projection type.

	:rtype: Projection
") ProjectionType;
		Projection ProjectionType ();
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Get camera scale. returns camera scale factor.

	:rtype: float
") Scale;
		Standard_Real Scale ();
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "	* Changes width / height display ratio. @param theAspect [in] the display ratio.

	:param theAspect:
	:type theAspect: float
	:rtype: None
") SetAspect;
		void SetAspect (const Standard_Real theAspect);
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "	* Set camera axial scale. @param theAxialScale [in] the axial scale vector.

	:param theAxialScale:
	:type theAxialScale: gp_XYZ
	:rtype: None
") SetAxialScale;
		void SetAxialScale (const gp_XYZ & theAxialScale);
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	* Sets Center of the camera. @param theCenter [in] the point where the camera looks at.

	:param theCenter:
	:type theCenter: gp_Pnt
	:rtype: None
") SetCenter;
		void SetCenter (const gp_Pnt & theCenter);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Sets camera look direction. @param theDir [in] the direction.

	:param theDir:
	:type theDir: gp_Dir
	:rtype: None
") SetDirection;
		void SetDirection (const gp_Dir & theDir);
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "	* Set distance of Eye from camera Center. @param theDistance [in] the distance.

	:param theDistance:
	:type theDistance: float
	:rtype: None
") SetDistance;
		void SetDistance (const Standard_Real theDistance);
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "	* @name Public camera properties Sets camera Eye position. @param theEye [in] the location of camera's Eye.

	:param theEye:
	:type theEye: gp_Pnt
	:rtype: None
") SetEye;
		void SetEye (const gp_Pnt & theEye);
		%feature("compactdefaultargs") SetFOVy;
		%feature("autodoc", "	* Set Field Of View (FOV) in y axis for perspective projection. @param theFOVy [in] the FOV in degrees.

	:param theFOVy:
	:type theFOVy: float
	:rtype: None
") SetFOVy;
		void SetFOVy (const Standard_Real theFOVy);
		%feature("compactdefaultargs") SetIOD;
		%feature("autodoc", "	* Sets Intraocular distance. @param theType [in] the IOD definition type. IOD can be defined as absolute value or relatively to (as coefficient of) camera focal length. @param theIOD [in] the Intraocular distance.

	:param theType:
	:type theType: IODType
	:param theIOD:
	:type theIOD: float
	:rtype: None
") SetIOD;
		void SetIOD (const IODType theType,const Standard_Real theIOD);
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "	* Change camera projection type. When switching to perspective projection from orthographic one, the ZNear and ZFar are reset to default values (0.001, 3000.0) if less than 0.0. @param theProjectionType [in] the camera projection type.

	:param theProjection:
	:type theProjection: Projection
	:rtype: None
") SetProjectionType;
		void SetProjectionType (const Projection theProjection);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Sets camera scale. For orthographic projection the scale factor corresponds to parallel scale of view mapping (i.e. size of viewport). For perspective camera scale is converted to distance. The scale specifies equal size of the view projection in both dimensions assuming that the aspect is 1.0. The projection height and width are specified with the scale and correspondingly multiplied by the aspect. @param theScale [in] the scale factor.

	:param theScale:
	:type theScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real theScale);
		%feature("compactdefaultargs") SetTile;
		%feature("autodoc", "	* Sets the Tile defining the drawing sub-area within View. Note that tile defining a region outside the view boundaries is also valid - use method Graphic3d_CameraTile::Cropped() to assign a cropped copy. @param theTile tile definition

	:param theTile:
	:type theTile: Graphic3d_CameraTile &
	:rtype: None
") SetTile;
		void SetTile (const Graphic3d_CameraTile & theTile);
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "	* Sets camera Up direction vector, orthogonal to camera direction. @param theUp [in] the Up direction vector.

	:param theUp:
	:type theUp: gp_Dir
	:rtype: None
") SetUp;
		void SetUp (const gp_Dir & theUp);
		%feature("compactdefaultargs") SetZFocus;
		%feature("autodoc", "	* Sets stereographic focus distance. @param theType [in] the focus definition type. Focus can be defined as absolute value or relatively to (as coefficient of) coefficient of camera focal length. @param theZFocus [in] the focus absolute value or coefficient depending on the passed definition type.

	:param theType:
	:type theType: FocusType
	:param theZFocus:
	:type theZFocus: float
	:rtype: None
") SetZFocus;
		void SetZFocus (const FocusType theType,const Standard_Real theZFocus);
		%feature("compactdefaultargs") SetZRange;
		%feature("autodoc", "	* Change the Near and Far Z-clipping plane positions. For orthographic projection, theZNear, theZFar can be negative or positive. For perspective projection, only positive values are allowed. Program error exception is raised if non-positive values are specified for perspective projection or theZNear >= theZFar. @param theZNear [in] the distance of the plane from the Eye. @param theZFar [in] the distance of the plane from the Eye.

	:param theZNear:
	:type theZNear: float
	:param theZFar:
	:type theZFar: float
	:rtype: None
") SetZRange;
		void SetZRange (const Standard_Real theZNear,const Standard_Real theZFar);
		%feature("compactdefaultargs") Tile;
		%feature("autodoc", "	* Get current tile.

	:rtype: Graphic3d_CameraTile
") Tile;
		const Graphic3d_CameraTile & Tile ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* @name Basic camera operations Transform orientation components of the camera: Eye, Up and Center points. @param theTrsf [in] the transformation to apply.

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None
") Transform;
		void Transform (const gp_Trsf & theTrsf);
		%feature("compactdefaultargs") UnProject;
		%feature("autodoc", "	* Unproject point from normalized device coordinates to world coordinate space. @param thePnt [in] the NDC point. returns 3D point in WCS.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt
") UnProject;
		gp_Pnt UnProject (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "	* Get camera Up direction vector. returns Camera's Up direction vector.

	:rtype: gp_Dir
") Up;
		const gp_Dir  Up ();
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "	* Calculate view plane size at center (target) point and distance between ZFar and ZNear planes. returns values in form of gp_Pnt (Width, Height, Depth).

	:rtype: gp_XYZ
") ViewDimensions;
		gp_XYZ ViewDimensions ();
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "	* Calculate view plane size at center point with specified Z offset and distance between ZFar and ZNear planes. @param theZValue [in] the distance from the eye in eye-to-center direction returns values in form of gp_Pnt (Width, Height, Depth).

	:param theZValue:
	:type theZValue: float
	:rtype: gp_XYZ
") ViewDimensions;
		gp_XYZ ViewDimensions (const Standard_Real theZValue);
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "	* @name Camera modification state returns projection modification state of the camera.

	:rtype: Graphic3d_WorldViewProjState
") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState ();
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "	* Returns modification state of camera world view transformation matrix.

	:rtype: Standard_Size
") WorldViewState;
		Standard_Size WorldViewState ();
		%feature("compactdefaultargs") ZFar;
		%feature("autodoc", "	* Get the Far Z-clipping plane position. returns the distance of the plane from the Eye.

	:rtype: float
") ZFar;
		Standard_Real ZFar ();
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "	* Estimate Z-min and Z-max planes of projection volume to match the displayed objects. The methods ensures that view volume will be close by depth range to the displayed objects. Fitting assumes that for orthogonal projection the view volume contains the displayed objects completely. For zoomed perspective view, the view volume is adjusted such that it contains the objects or their parts, located in front of the camera. @param theScaleFactor [in] the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed. @param theMinMax [in] applicative min max boundaries. @param theScaleFactor [in] real graphical boundaries (not accounting infinite flag).

	:param theScaleFactor:
	:type theScaleFactor: float
	:param theMinMax:
	:type theMinMax: Bnd_Box &
	:param theGraphicBB:
	:type theGraphicBB: Bnd_Box &
	:param theZNear:
	:type theZNear: float &
	:param theZFar:
	:type theZFar: float &
	:rtype: bool
") ZFitAll;
		bool ZFitAll (const Standard_Real theScaleFactor,const Bnd_Box & theMinMax,const Bnd_Box & theGraphicBB,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "	* Change Z-min and Z-max planes of projection volume to match the displayed objects.

	:param theScaleFactor:
	:type theScaleFactor: float
	:param theMinMax:
	:type theMinMax: Bnd_Box &
	:param theGraphicBB:
	:type theGraphicBB: Bnd_Box &
	:rtype: None
") ZFitAll;
		void ZFitAll (const Standard_Real theScaleFactor,const Bnd_Box & theMinMax,const Bnd_Box & theGraphicBB);
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
		%feature("compactdefaultargs") ZNear;
		%feature("autodoc", "	* Get the Near Z-clipping plane position. returns the distance of the plane from the Eye.

	:rtype: float
") ZNear;
		Standard_Real ZNear ();
};


%make_alias(Graphic3d_Camera)

%extend Graphic3d_Camera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CameraTile;
class Graphic3d_CameraTile {
	public:
		Graphic3d_Vec2i TotalSize;
		Graphic3d_Vec2i TileSize;
		Graphic3d_Vec2i Offset;
		bool IsTopDown;
		%feature("compactdefaultargs") Cropped;
		%feature("autodoc", "	* Return the copy cropped by total size

	:rtype: Graphic3d_CameraTile
") Cropped;
		Graphic3d_CameraTile Cropped ();
		%feature("compactdefaultargs") Graphic3d_CameraTile;
		%feature("autodoc", "	* //!< indicate the offset coordinate system - lower-left (default) or top-down Default constructor. Initializes the empty Tile of zero size and lower-left offset orientation. Such Tile is considered uninitialized (invalid).

	:rtype: None
") Graphic3d_CameraTile;
		 Graphic3d_CameraTile ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Return true if Tile has been defined.

	:rtype: bool
") IsValid;
		bool IsValid ();
		%feature("compactdefaultargs") OffsetLowerLeft;
		%feature("autodoc", "	* Return offset position from lower-left corner.

	:rtype: Graphic3d_Vec2i
") OffsetLowerLeft;
		Graphic3d_Vec2i OffsetLowerLeft ();

        %extend{
            bool __eq_wrapper__(const Graphic3d_CameraTile  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Graphic3d_CameraTile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ClipPlane;
class Graphic3d_ClipPlane : public Standard_Transient {
	public:
typedef NCollection_Vec4 <Standard_Real> Equation;
		%feature("compactdefaultargs") CappingAspect;
		%feature("autodoc", "	* Return capping aspect. returns capping surface rendering aspect.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") CappingAspect;
		Handle_Graphic3d_AspectFillArea3d CappingAspect ();
		%feature("compactdefaultargs") CappingCustomHatch;
		%feature("autodoc", "	* returns hatching style.

	:rtype: Handle_Graphic3d_HatchStyle
") CappingCustomHatch;
		Handle_Graphic3d_HatchStyle CappingCustomHatch ();
		%feature("compactdefaultargs") CappingHatch;
		%feature("autodoc", "	* returns hatching style.

	:rtype: Aspect_HatchStyle
") CappingHatch;
		Aspect_HatchStyle CappingHatch ();
		%feature("compactdefaultargs") CappingMaterial;
		%feature("autodoc", "	* returns capping material.

	:rtype: Graphic3d_MaterialAspect
") CappingMaterial;
		const Graphic3d_MaterialAspect & CappingMaterial ();
		%feature("compactdefaultargs") CappingTexture;
		%feature("autodoc", "	* returns capping texture map.

	:rtype: Handle_Graphic3d_TextureMap
") CappingTexture;
		Handle_Graphic3d_TextureMap CappingTexture ();
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "	* Clone plane. Virtual method to simplify copying procedure if plane class is redefined at application level to add specific fields to it e.g. id, name, etc. returns new instance of clipping plane with same properties and attributes.

	:rtype: Handle_Graphic3d_ClipPlane
") Clone;
		virtual Handle_Graphic3d_ClipPlane Clone ();
		%feature("compactdefaultargs") GetEquation;
		%feature("autodoc", "	* Get 4-component equation vector for clipping plane. returns clipping plane equation vector.

	:rtype: Equation
") GetEquation;
		const Equation & GetEquation ();
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* This ID is used for managing associated resources in graphical driver. The clip plane can be assigned within a range of IO which can be displayed in separate OpenGl contexts. For each of the context an associated OpenGl resource for graphical aspects should be created and kept. The resources are stored in graphical driver for each of individual groups of shared context under the clip plane identifier. returns clip plane resource identifier string.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
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
		%feature("compactdefaultargs") IsCapping;
		%feature("autodoc", "	* Check state of capping surface rendering. returns true (turned on) or false depending on the state.

	:rtype: bool
") IsCapping;
		Standard_Boolean IsCapping ();
		%feature("compactdefaultargs") IsHatchOn;
		%feature("autodoc", "	* returns True if hatching mask is turned on.

	:rtype: bool
") IsHatchOn;
		Standard_Boolean IsHatchOn ();
		%feature("compactdefaultargs") IsOn;
		%feature("autodoc", "	* Check that the clipping plane is turned on. returns boolean flag indicating whether the plane is in on or off state.

	:rtype: bool
") IsOn;
		Standard_Boolean IsOn ();
		%feature("compactdefaultargs") MCountAspect;
		%feature("autodoc", "	* returns modification counter for aspect.

	:rtype: unsigned int
") MCountAspect;
		unsigned int MCountAspect ();
		%feature("compactdefaultargs") MCountEquation;
		%feature("autodoc", "	* returns modification counter for equation.

	:rtype: unsigned int
") MCountEquation;
		unsigned int MCountEquation ();
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "	* Change state of capping surface rendering. @param theIsOn [in] the flag specifying whether the graphic driver should perform rendering of capping surface produced by this plane. The graphic driver produces this surface for convex graphics by means of stencil-test and multi-pass rendering.

	:param theIsOn:
	:type theIsOn: bool
	:rtype: None
") SetCapping;
		void SetCapping (const Standard_Boolean theIsOn);
		%feature("compactdefaultargs") SetCappingAspect;
		%feature("autodoc", "	* Assign capping aspect.

	:param theAspect:
	:type theAspect: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetCappingAspect;
		void SetCappingAspect (const Handle_Graphic3d_AspectFillArea3d & theAspect);
		%feature("compactdefaultargs") SetCappingCustomHatch;
		%feature("autodoc", "	* Set custom hatch style (stipple) and turn hatching on. @param theStyle [in] the hatch pattern.

	:param theStyle:
	:type theStyle: Handle_Graphic3d_HatchStyle &
	:rtype: None
") SetCappingCustomHatch;
		void SetCappingCustomHatch (const Handle_Graphic3d_HatchStyle & theStyle);
		%feature("compactdefaultargs") SetCappingHatch;
		%feature("autodoc", "	* Set hatch style (stipple) and turn hatching on. @param theStyle [in] the hatch style.

	:param theStyle:
	:type theStyle: Aspect_HatchStyle
	:rtype: None
") SetCappingHatch;
		void SetCappingHatch (const Aspect_HatchStyle theStyle);
		%feature("compactdefaultargs") SetCappingHatchOff;
		%feature("autodoc", "	* Turn off hatching.

	:rtype: None
") SetCappingHatchOff;
		void SetCappingHatchOff ();
		%feature("compactdefaultargs") SetCappingHatchOn;
		%feature("autodoc", "	* Turn on hatching.

	:rtype: None
") SetCappingHatchOn;
		void SetCappingHatchOn ();
		%feature("compactdefaultargs") SetCappingMaterial;
		%feature("autodoc", "	* Set material for rendering capping surface. @param theMat [in] the material.

	:param theMat:
	:type theMat: Graphic3d_MaterialAspect &
	:rtype: None
") SetCappingMaterial;
		void SetCappingMaterial (const Graphic3d_MaterialAspect & theMat);
		%feature("compactdefaultargs") SetCappingTexture;
		%feature("autodoc", "	* Set texture to be applied on capping surface. @param theTexture [in] the texture.

	:param theTexture:
	:type theTexture: Handle_Graphic3d_TextureMap &
	:rtype: None
") SetCappingTexture;
		void SetCappingTexture (const Handle_Graphic3d_TextureMap & theTexture);
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
		%feature("compactdefaultargs") SetOn;
		%feature("autodoc", "	* Change state of the clipping plane. @param theIsOn [in] the flag specifying whether the graphic driver clipping by this plane should be turned on or off.

	:param theIsOn:
	:type theIsOn: bool
	:rtype: None
") SetOn;
		void SetOn (const Standard_Boolean theIsOn);
		%feature("compactdefaultargs") SetUseObjectMaterial;
		%feature("autodoc", "	* Set flag for controlling the source of capping plane material.

	:param theToUse:
	:type theToUse: bool
	:rtype: None
") SetUseObjectMaterial;
		void SetUseObjectMaterial (bool theToUse);
		%feature("compactdefaultargs") SetUseObjectShader;
		%feature("autodoc", "	* Set flag for controlling the source of capping plane shader program.

	:param theToUse:
	:type theToUse: bool
	:rtype: None
") SetUseObjectShader;
		void SetUseObjectShader (bool theToUse);
		%feature("compactdefaultargs") SetUseObjectTexture;
		%feature("autodoc", "	* Set flag for controlling the source of capping plane texture.

	:param theToUse:
	:type theToUse: bool
	:rtype: None
") SetUseObjectTexture;
		void SetUseObjectTexture (bool theToUse);
		%feature("compactdefaultargs") ToPlane;
		%feature("autodoc", "	* Get geometrical definition. returns geometrical definition of clipping plane

	:rtype: gp_Pln
") ToPlane;
		const gp_Pln  ToPlane ();
		%feature("compactdefaultargs") ToUseObjectMaterial;
		%feature("autodoc", "	* Flag indicating whether material for capping plane should be taken from object. Default value: False (use dedicated capping plane material).

	:rtype: bool
") ToUseObjectMaterial;
		bool ToUseObjectMaterial ();
		%feature("compactdefaultargs") ToUseObjectProperties;
		%feature("autodoc", "	* Return true if some fill area aspect properties should be taken from object.

	:rtype: bool
") ToUseObjectProperties;
		bool ToUseObjectProperties ();
		%feature("compactdefaultargs") ToUseObjectShader;
		%feature("autodoc", "	* Flag indicating whether shader program for capping plane should be taken from object. Default value: False.

	:rtype: bool
") ToUseObjectShader;
		bool ToUseObjectShader ();
		%feature("compactdefaultargs") ToUseObjectTexture;
		%feature("autodoc", "	* Flag indicating whether texture for capping plane should be taken from object. Default value: False.

	:rtype: bool
") ToUseObjectTexture;
		bool ToUseObjectTexture ();
};


%make_alias(Graphic3d_ClipPlane)

%extend Graphic3d_ClipPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_DataStructureManager;
class Graphic3d_DataStructureManager : public Standard_Transient {
	public:
};


%make_alias(Graphic3d_DataStructureManager)

%extend Graphic3d_DataStructureManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Fresnel;
class Graphic3d_Fresnel {
	public:
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "	* Creates Fresnel factor for physical-based conductor model.

	:param theRefractionIndex:
	:type theRefractionIndex: Standard_ShortReal
	:param theAbsorptionIndex:
	:type theAbsorptionIndex: Standard_ShortReal
	:rtype: Graphic3d_Fresnel
") CreateConductor;
		static Graphic3d_Fresnel CreateConductor (Standard_ShortReal theRefractionIndex,Standard_ShortReal theAbsorptionIndex);
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "	* Creates Fresnel factor for physical-based conductor model (spectral version).

	:param theRefractionIndex:
	:type theRefractionIndex: Graphic3d_Vec3 &
	:param theAbsorptionIndex:
	:type theAbsorptionIndex: Graphic3d_Vec3 &
	:rtype: Graphic3d_Fresnel
") CreateConductor;
		static Graphic3d_Fresnel CreateConductor (const Graphic3d_Vec3 & theRefractionIndex,const Graphic3d_Vec3 & theAbsorptionIndex);
		%feature("compactdefaultargs") CreateConstant;
		%feature("autodoc", "	* Creates Fresnel factor for constant reflection.

	:param theReflection:
	:type theReflection: Standard_ShortReal
	:rtype: Graphic3d_Fresnel
") CreateConstant;
		static Graphic3d_Fresnel CreateConstant (const Standard_ShortReal theReflection);
		%feature("compactdefaultargs") CreateDielectric;
		%feature("autodoc", "	* Creates Fresnel factor for physical-based dielectric model.

	:param theRefractionIndex:
	:type theRefractionIndex: Standard_ShortReal
	:rtype: Graphic3d_Fresnel
") CreateDielectric;
		static Graphic3d_Fresnel CreateDielectric (Standard_ShortReal theRefractionIndex);
		%feature("compactdefaultargs") CreateSchlick;
		%feature("autodoc", "	* Creates Schlick's approximation of Fresnel factor.

	:param theSpecularColor:
	:type theSpecularColor: Graphic3d_Vec3 &
	:rtype: Graphic3d_Fresnel
") CreateSchlick;
		static Graphic3d_Fresnel CreateSchlick (const Graphic3d_Vec3 & theSpecularColor);
		%feature("compactdefaultargs") FresnelType;
		%feature("autodoc", "	* Returns type of Fresnel.

	:rtype: Graphic3d_FresnelModel
") FresnelType;
		Graphic3d_FresnelModel FresnelType ();
		%feature("compactdefaultargs") Graphic3d_Fresnel;
		%feature("autodoc", "	* Creates uninitialized Fresnel factor.

	:rtype: None
") Graphic3d_Fresnel;
		 Graphic3d_Fresnel ();
		%feature("compactdefaultargs") Serialize;
		%feature("autodoc", "	* Returns serialized representation of Fresnel factor.

	:rtype: Graphic3d_Vec4
") Serialize;
		Graphic3d_Vec4 Serialize ();

        %extend{
            bool __eq_wrapper__(const Graphic3d_Fresnel  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Graphic3d_Fresnel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_GraduatedTrihedron;
class Graphic3d_GraduatedTrihedron {
	public:
		Graphic3d_CView * PtrView;
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") ArrowsLength;
		Standard_ShortReal ArrowsLength ();
		%feature("compactdefaultargs") AxisAspect;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: Graphic3d_AxisAspect
") AxisAspect;
		const Graphic3d_AxisAspect & AxisAspect (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ChangeAxisAspect;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: Graphic3d_AxisAspect
") ChangeAxisAspect;
		Graphic3d_AxisAspect & ChangeAxisAspect (const Standard_Integer theIndex);
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
		%feature("compactdefaultargs") GridColor;
		%feature("autodoc", "	:rtype: Quantity_Color
") GridColor;
		const Quantity_Color & GridColor ();
		%feature("compactdefaultargs") NamesFont;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") NamesFont;
		const TCollection_AsciiString & NamesFont ();
		%feature("compactdefaultargs") NamesFontAspect;
		%feature("autodoc", "	:rtype: Font_FontAspect
") NamesFontAspect;
		Font_FontAspect NamesFontAspect ();
		%feature("compactdefaultargs") NamesSize;
		%feature("autodoc", "	:rtype: int
") NamesSize;
		Standard_Integer NamesSize ();
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", "	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetArrowsLength;
		void SetArrowsLength (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawAxes;
		void SetDrawAxes (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") SetDrawGrid;
		%feature("autodoc", "	:param theToDraw:
	:type theToDraw: bool
	:rtype: None
") SetDrawGrid;
		void SetDrawGrid (const Standard_Boolean theToDraw);
		%feature("compactdefaultargs") SetGridColor;
		%feature("autodoc", "	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetGridColor;
		void SetGridColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetNamesFont;
		%feature("autodoc", "	:param theFont:
	:type theFont: TCollection_AsciiString &
	:rtype: None
") SetNamesFont;
		void SetNamesFont (const TCollection_AsciiString & theFont);
		%feature("compactdefaultargs") SetNamesFontAspect;
		%feature("autodoc", "	:param theAspect:
	:type theAspect: Font_FontAspect
	:rtype: None
") SetNamesFontAspect;
		void SetNamesFontAspect (Font_FontAspect theAspect);
		%feature("compactdefaultargs") SetNamesSize;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetNamesSize;
		void SetNamesSize (const Standard_Integer theValue);
		%feature("compactdefaultargs") SetValuesFont;
		%feature("autodoc", "	:param theFont:
	:type theFont: TCollection_AsciiString &
	:rtype: None
") SetValuesFont;
		void SetValuesFont (const TCollection_AsciiString & theFont);
		%feature("compactdefaultargs") SetValuesFontAspect;
		%feature("autodoc", "	:param theAspect:
	:type theAspect: Font_FontAspect
	:rtype: None
") SetValuesFontAspect;
		void SetValuesFontAspect (Font_FontAspect theAspect);
		%feature("compactdefaultargs") SetValuesSize;
		%feature("autodoc", "	:param theValue:
	:type theValue: int
	:rtype: None
") SetValuesSize;
		void SetValuesSize (const Standard_Integer theValue);
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", "	:rtype: bool
") ToDrawAxes;
		Standard_Boolean ToDrawAxes ();
		%feature("compactdefaultargs") ToDrawGrid;
		%feature("autodoc", "	:rtype: bool
") ToDrawGrid;
		Standard_Boolean ToDrawGrid ();
		%feature("compactdefaultargs") ValuesFont;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") ValuesFont;
		const TCollection_AsciiString & ValuesFont ();
		%feature("compactdefaultargs") ValuesFontAspect;
		%feature("autodoc", "	:rtype: Font_FontAspect
") ValuesFontAspect;
		Font_FontAspect ValuesFontAspect ();
		%feature("compactdefaultargs") ValuesSize;
		%feature("autodoc", "	:rtype: int
") ValuesSize;
		Standard_Integer ValuesSize ();
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
};


%extend Graphic3d_GraduatedTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_GraphicDriver;
class Graphic3d_GraphicDriver : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level z layer with ID <theLayerId> for the view. Z layers allow drawing structures in higher layers in foreground of structures in lower layers. To add a structure to desired layer on display it is necessary to set the layer ID for the structure.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") AddZLayer;
		void AddZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") CreateStructure;
		%feature("autodoc", "	* Creates new empty graphic structure

	:param theManager:
	:type theManager: Handle_Graphic3d_StructureManager &
	:rtype: Handle_Graphic3d_CStructure
") CreateStructure;
		Handle_Graphic3d_CStructure CreateStructure (const Handle_Graphic3d_StructureManager & theManager);
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "	* Creates new view for this graphic driver.

	:param theMgr:
	:type theMgr: Handle_Graphic3d_StructureManager &
	:rtype: Handle_Graphic3d_CView
") CreateView;
		Handle_Graphic3d_CView CreateView (const Handle_Graphic3d_StructureManager & theMgr);
		%feature("compactdefaultargs") DefaultTextHeight;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") DefaultTextHeight;
		Standard_ShortReal DefaultTextHeight ();
		%feature("compactdefaultargs") EnableVBO;
		%feature("autodoc", "	* enables/disables usage of OpenGL vertex buffer arrays while drawing primitiev arrays

	:param status:
	:type status: bool
	:rtype: None
") EnableVBO;
		void EnableVBO (const Standard_Boolean status);
		%feature("compactdefaultargs") GetDisplayConnection;
		%feature("autodoc", "	* returns Handle to display connection

	:rtype: Handle_Aspect_DisplayConnection
") GetDisplayConnection;
		Handle_Aspect_DisplayConnection GetDisplayConnection ();
		%feature("compactdefaultargs") InquireLightLimit;
		%feature("autodoc", "	* Request maximum number of active light sources supported by driver and hardware.

	:rtype: int
") InquireLightLimit;
		Standard_Integer InquireLightLimit ();
		%feature("compactdefaultargs") InquireLimit;
		%feature("autodoc", "	* Request limit of graphic resource of specific type.

	:param theType:
	:type theType: Graphic3d_TypeOfLimit
	:rtype: int
") InquireLimit;
		Standard_Integer InquireLimit (const Graphic3d_TypeOfLimit theType);
		%feature("compactdefaultargs") InquirePlaneLimit;
		%feature("autodoc", "	* Request maximum number of active clipping planes supported by driver and hardware.

	:rtype: int
") InquirePlaneLimit;
		Standard_Integer InquirePlaneLimit ();
		%feature("compactdefaultargs") InquireViewLimit;
		%feature("autodoc", "	* Request maximum number of views supported by driver.

	:rtype: int
") InquireViewLimit;
		Standard_Integer InquireViewLimit ();
		%feature("compactdefaultargs") MemoryInfo;
		%feature("autodoc", "	* Returns information about GPU memory usage.

	:param theFreeBytes:
	:type theFreeBytes: Standard_Size &
	:param theInfo:
	:type theInfo: TCollection_AsciiString &
	:rtype: bool
") MemoryInfo;
		Standard_Boolean MemoryInfo (Standard_Size & theFreeBytes,TCollection_AsciiString & theInfo);
		%feature("compactdefaultargs") NewIdentification;
		%feature("autodoc", "	* Returns a new identification number for a new structure.

	:rtype: int
") NewIdentification;
		Standard_Integer NewIdentification ();
		%feature("compactdefaultargs") RemoveIdentification;
		%feature("autodoc", "	* Frees the identifier of a structure.

	:param theId:
	:type theId: int
	:rtype: None
") RemoveIdentification;
		void RemoveIdentification (const Standard_Integer theId);
		%feature("compactdefaultargs") RemoveStructure;
		%feature("autodoc", "	* Removes structure from graphic driver and releases its resources.

	:param theCStructure:
	:type theCStructure: Handle_Graphic3d_CStructure &
	:rtype: None
") RemoveStructure;
		void RemoveStructure (Handle_Graphic3d_CStructure & theCStructure);
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "	* Removes view from graphic driver and releases its resources.

	:param theView:
	:type theView: Handle_Graphic3d_CView &
	:rtype: None
") RemoveView;
		void RemoveView (const Handle_Graphic3d_CView & theView);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Removes Z layer. All structures displayed at the moment in layer will be displayed in default layer (the bottom-level z layer). By default, there are always default bottom-level layer that can't be removed. The passed theLayerId should be not less than 0 (reserved for default layers that can not be removed).

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") RemoveZLayer;
		void RemoveZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings &
	:rtype: None
") SetZLayerSettings;
		void SetZLayerSettings (const Graphic3d_ZLayerId theLayerId,const Graphic3d_ZLayerSettings & theSettings);
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "	* Computes text width.

	:param theView:
	:type theView: Handle_Graphic3d_CView &
	:param theText:
	:type theText: char *
	:param theHeight:
	:type theHeight: Standard_ShortReal
	:param theWidth:
	:type theWidth: Standard_ShortReal &
	:param theAscent:
	:type theAscent: Standard_ShortReal &
	:param theDescent:
	:type theDescent: Standard_ShortReal &
	:rtype: None
") TextSize;
		void TextSize (const Handle_Graphic3d_CView & theView,const char * theText,const Standard_ShortReal theHeight,Standard_ShortReal & theWidth,Standard_ShortReal & theAscent,Standard_ShortReal & theDescent);
		%feature("compactdefaultargs") ViewExists;
		%feature("autodoc", "	* Returns view associated with the window if it is exists and is activated. Returns Standard_True if the view associated to the window exists.

	:param theWindow:
	:type theWindow: Handle_Aspect_Window &
	:param theView:
	:type theView: Handle_Graphic3d_CView &
	:rtype: bool
") ViewExists;
		Standard_Boolean ViewExists (const Handle_Aspect_Window & theWindow,Handle_Graphic3d_CView & theView);
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		const Graphic3d_ZLayerSettings & ZLayerSettings (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") ZLayers;
		%feature("autodoc", "	* Returns list of Z layers defined for the graphical driver.

	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger &
	:rtype: None
") ZLayers;
		void ZLayers (TColStd_SequenceOfInteger & theLayerSeq);
};


%make_alias(Graphic3d_GraphicDriver)

%extend Graphic3d_GraphicDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Group;
class Graphic3d_Group : public Standard_Transient {
	public:
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Supress all primitives and attributes of <self>. To clear group without update in Graphic3d_StructureManager pass Standard_False as <theUpdateStructureMgr>. This used on context and viewer destruction, when the pointer to structure manager in Graphic3d_Structure could be already released (pointers are used here to avoid handle cross-reference);

	:param theUpdateStructureMgr: default value is Standard_True
	:type theUpdateStructureMgr: bool
	:rtype: void
") Clear;
		virtual void Clear (const Standard_Boolean theUpdateStructureMgr = Standard_True);
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns true if the group contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		bool ContainsFacet ();
		%feature("compactdefaultargs") FillAreaAspect;
		%feature("autodoc", "	* Return fill area aspect.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") FillAreaAspect;
		Handle_Graphic3d_AspectFillArea3d FillAreaAspect ();
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	* Return true if primitive arrays within this graphic group form closed volume (do no contain open shells).

	:rtype: bool
") IsClosed;
		bool IsClosed ();
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
		%feature("compactdefaultargs") IsGroupPrimitivesAspectSet;
		%feature("autodoc", "	* Returns True if aspect is set for the group.

	:param theAspect:
	:type theAspect: Graphic3d_GroupAspect
	:rtype: bool
") IsGroupPrimitivesAspectSet;
		Standard_Boolean IsGroupPrimitivesAspectSet (const Graphic3d_GroupAspect theAspect);
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "	* Return line aspect.

	:rtype: Handle_Graphic3d_AspectLine3d
") LineAspect;
		Handle_Graphic3d_AspectLine3d LineAspect ();
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "	* Creates a primitive array with single marker using AddPrimitiveArray().

	:param thePoint:
	:type thePoint: Graphic3d_Vertex &
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: None
") Marker;
		void Marker (const Graphic3d_Vertex & thePoint,const Standard_Boolean theToEvalMinMax = Standard_True);
		%feature("compactdefaultargs") MarkerAspect;
		%feature("autodoc", "	* Return marker aspect.

	:rtype: Handle_Graphic3d_AspectMarker3d
") MarkerAspect;
		Handle_Graphic3d_AspectMarker3d MarkerAspect ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of the group.

	:param theXMin:
	:type theXMin: float &
	:param theYMin:
	:type theYMin: float &
	:param theZMin:
	:type theZMin: float &
	:param theXMax:
	:type theXMax: float &
	:param theYMax:
	:type theYMax: float &
	:param theZMax:
	:type theZMax: float &
	:rtype: None
") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Supress the group <self> in the structure. Warning: No more graphic operations in <self> after this call. Modifies the current modelling transform persistence (pan, zoom or rotate) Get the current modelling transform persistence (pan, zoom or rotate)

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") SetClosed;
		%feature("autodoc", "	* Changes property shown that primitive arrays within this group form closed volume (do no contain open shells).

	:param theIsClosed:
	:type theIsClosed: bool
	:rtype: None
") SetClosed;
		void SetClosed (const bool theIsClosed);
		%feature("compactdefaultargs") SetFlippingOptions;
		%feature("autodoc", "	* sets the flipping to theIsEnabled state.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:param theRefPlane:
	:type theRefPlane: gp_Ax2
	:rtype: void
") SetFlippingOptions;
		virtual void SetFlippingOptions (const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);
		%feature("compactdefaultargs") SetMinMaxValues;
		%feature("autodoc", "	* Sets the coordinates of the boundary box of the group.

	:param theXMin:
	:type theXMin: float
	:param theYMin:
	:type theYMin: float
	:param theZMin:
	:type theZMin: float
	:param theXMax:
	:type theXMax: float
	:param theYMax:
	:type theYMax: float
	:param theZMax:
	:type theZMax: float
	:rtype: None
") SetMinMaxValues;
		void SetMinMaxValues (const Standard_Real theXMin,const Standard_Real theYMin,const Standard_Real theZMin,const Standard_Real theXMax,const Standard_Real theYMax,const Standard_Real theZMax);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the line primitives created after this call in the group.

	:param theAspect:
	:type theAspect: Handle_Graphic3d_AspectLine3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectLine3d & theAspect);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the face primitives created after this call in the group.

	:param theAspect:
	:type theAspect: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectFillArea3d & theAspect);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the text primitives created after this call in the group.

	:param theAspect:
	:type theAspect: Handle_Graphic3d_AspectText3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectText3d & theAspect);
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "	* Modifies the current context of the group to give another aspect for all the marker primitives created after this call in the group.

	:param theAspect:
	:type theAspect: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetPrimitivesAspect;
		void SetPrimitivesAspect (const Handle_Graphic3d_AspectMarker3d & theAspect);
		%feature("compactdefaultargs") SetStencilTestOptions;
		%feature("autodoc", "	* sets the stencil test to theIsEnabled state;

	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: void
") SetStencilTestOptions;
		virtual void SetStencilTestOptions (const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "	* Returns the structure containing the group <self>.

	:rtype: Handle_Graphic3d_Structure
") Structure;
		Handle_Graphic3d_Structure Structure ();
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). AAngle : Orientation of the text (with respect to the horizontal).

	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex &
	:param AHeight:
	:type AHeight: float
	:param AAngle:
	:type AAngle: float
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
		virtual void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Real AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
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
	:type AAngle: float
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
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Real AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);
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
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <theText> at orientation <theOrientation> in 3D space.

	:param theTextUtf:
	:type theTextUtf: char *
	:param theOrientation:
	:type theOrientation: gp_Ax2
	:param theHeight:
	:type theHeight: float
	:param theAngle:
	:type theAngle: float
	:param theTp:
	:type theTp: Graphic3d_TextPath
	:param theHTA:
	:type theHTA: Graphic3d_HorizontalTextAlignment
	:param theVTA:
	:type theVTA: Graphic3d_VerticalTextAlignment
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:param theHasOwnAnchor: default value is Standard_True
	:type theHasOwnAnchor: bool
	:rtype: void
") Text;
		virtual void Text (const char * theTextUtf,const gp_Ax2 & theOrientation,const Standard_Real theHeight,const Standard_Real theAngle,const Graphic3d_TextPath theTp,const Graphic3d_HorizontalTextAlignment theHTA,const Graphic3d_VerticalTextAlignment theVTA,const Standard_Boolean theToEvalMinMax = Standard_True,const Standard_Boolean theHasOwnAnchor = Standard_True);
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "	* Creates the string <theText> at orientation <theOrientation> in 3D space.

	:param theText:
	:type theText: TCollection_ExtendedString &
	:param theOrientation:
	:type theOrientation: gp_Ax2
	:param theHeight:
	:type theHeight: float
	:param theAngle:
	:type theAngle: float
	:param theTp:
	:type theTp: Graphic3d_TextPath
	:param theHTA:
	:type theHTA: Graphic3d_HorizontalTextAlignment
	:param theVTA:
	:type theVTA: Graphic3d_VerticalTextAlignment
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:param theHasOwnAnchor: default value is Standard_True
	:type theHasOwnAnchor: bool
	:rtype: void
") Text;
		virtual void Text (const TCollection_ExtendedString & theText,const gp_Ax2 & theOrientation,const Standard_Real theHeight,const Standard_Real theAngle,const Graphic3d_TextPath theTp,const Graphic3d_HorizontalTextAlignment theHTA,const Graphic3d_VerticalTextAlignment theVTA,const Standard_Boolean theToEvalMinMax = Standard_True,const Standard_Boolean theHasOwnAnchor = Standard_True);
		%feature("compactdefaultargs") TextAspect;
		%feature("autodoc", "	* Return text aspect.

	:rtype: Handle_Graphic3d_AspectText3d
") TextAspect;
		Handle_Graphic3d_AspectText3d TextAspect ();
};


%make_alias(Graphic3d_Group)

%extend Graphic3d_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_HatchStyle;
class Graphic3d_HatchStyle : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "	* Creates a new custom hatch style with the given pattern and unique style id @warning Raises a program error if given pattern image is not a valid 32*32 bitmap

	:param thePattern:
	:type thePattern: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle (const Handle_Image_PixMap & thePattern);
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "	* Creates a new predefined hatch style with the given id in Aspect_HatchStyle enum. GPU memory for the pattern will not be allocated.

	:param theType:
	:type theType: Aspect_HatchStyle
	:rtype: None
") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle (const Aspect_HatchStyle theType);
		%feature("compactdefaultargs") HatchType;
		%feature("autodoc", "	* In case if predefined OCCT style is used, returns index in Aspect_HatchStyle enumeration. If the style is custom, returns unique index of the style

	:rtype: int
") HatchType;
		Standard_Integer HatchType ();
		%feature("compactdefaultargs") Pattern;
		%feature("autodoc", "	* Returns the pattern of custom hatch style

	:rtype: Standard_Byte *
") Pattern;
		const Standard_Byte * Pattern ();
};


%make_alias(Graphic3d_HatchStyle)

%extend Graphic3d_HatchStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_MarkerImage;
class Graphic3d_MarkerImage : public Standard_Transient {
	public:
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
		%feature("compactdefaultargs") GetImageAlphaId;
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId ();
		%feature("compactdefaultargs") GetImageId;
		%feature("autodoc", "	* returns an unique ID. This ID will be used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetImageId;
		const TCollection_AsciiString & GetImageId ();
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "	* returns texture size

	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:rtype: None
") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);
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
};


%make_alias(Graphic3d_MarkerImage)

%extend Graphic3d_MarkerImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Graphic3d_MaterialAspect {
	public:
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "	* Returns the alpha coefficient of the surface (1.0 - Transparency); 1.0 means opaque.

	:rtype: Standard_ShortReal
") Alpha;
		Standard_ShortReal Alpha ();
		%feature("compactdefaultargs") Ambient;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: Standard_ShortReal
") Ambient;
		Standard_ShortReal Ambient ();
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "	* Returns the ambient color of the surface.

	:rtype: Quantity_Color
") AmbientColor;
		const Quantity_Color & AmbientColor ();
		%feature("compactdefaultargs") BSDF;
		%feature("autodoc", "	* Returns BSDF (bidirectional scattering distribution function).

	:rtype: Graphic3d_BSDF
") BSDF;
		const Graphic3d_BSDF & BSDF ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the diffuse color of the surface.

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("compactdefaultargs") Diffuse;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: Standard_ShortReal
") Diffuse;
		Standard_ShortReal Diffuse ();
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "	* Returns the diffuse color of the surface.

	:rtype: Quantity_Color
") DiffuseColor;
		const Quantity_Color & DiffuseColor ();
		%feature("compactdefaultargs") Emissive;
		%feature("autodoc", "	* Returns the emissive coefficient of the surface.

	:rtype: Standard_ShortReal
") Emissive;
		Standard_ShortReal Emissive ();
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "	* Returns the emissive color of the surface.

	:rtype: Quantity_Color
") EmissiveColor;
		const Quantity_Color & EmissiveColor ();
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "	* Creates a material from default values.

	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect ();
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "	* Creates a generic material.

	:param theName:
	:type theName: Graphic3d_NameOfMaterial
	:rtype: None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect (const Graphic3d_NameOfMaterial theName);
		%feature("compactdefaultargs") IncreaseShine;
		%feature("autodoc", "	* Increases or decreases the luminosity. @param theDelta a signed percentage

	:param theDelta:
	:type theDelta: Standard_ShortReal
	:rtype: None
") IncreaseShine;
		void IncreaseShine (const Standard_ShortReal theDelta);
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	* Returns True if this material differs from specified one.

	:param theOther:
	:type theOther: Graphic3d_MaterialAspect &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const Graphic3d_MaterialAspect & theOther);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if this material is identical to specified one.

	:param theOther:
	:type theOther: Graphic3d_MaterialAspect &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Graphic3d_MaterialAspect & theOther);
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "	* Returns the material for specified name or Graphic3d_NOM_DEFAULT if name is unknown.

	:param theName:
	:type theName: char *
	:rtype: Graphic3d_NameOfMaterial
") MaterialFromName;
		static Graphic3d_NameOfMaterial MaterialFromName (const char * theName);
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "	* Returns the name of the predefined material of specified rank within range [1, NumberOfMaterials()].

	:param theRank:
	:type theRank: int
	:rtype: char *
") MaterialName;
		static const char * MaterialName (const Standard_Integer theRank);
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "	* Returns the given name of this material. This might be:

	:rtype: char *
") MaterialName;
		const char * MaterialName ();
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "	* Returns the type of the predefined material of specified rank within range [1, NumberOfMaterials()].

	:param theRank:
	:type theRank: int
	:rtype: Graphic3d_TypeOfMaterial
") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType (const Standard_Integer theRank);
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "	* Returns True if type of this material is equal to specified type.

	:param theType:
	:type theType: Graphic3d_TypeOfMaterial
	:rtype: bool
") MaterialType;
		Standard_Boolean MaterialType (const Graphic3d_TypeOfMaterial theType);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the material name (within predefined enumeration).

	:rtype: Graphic3d_NameOfMaterial
") Name;
		Graphic3d_NameOfMaterial Name ();
		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "	* Returns the number of predefined textures.

	:rtype: int
") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();
		%feature("compactdefaultargs") ReflectionMode;
		%feature("autodoc", "	* Returns True if the reflection mode is active, False otherwise.

	:param theType:
	:type theType: Graphic3d_TypeOfReflection
	:rtype: bool
") ReflectionMode;
		Standard_Boolean ReflectionMode (const Graphic3d_TypeOfReflection theType);
		%feature("compactdefaultargs") RefractionIndex;
		%feature("autodoc", "	* Returns the refraction index of the material

	:rtype: Standard_ShortReal
") RefractionIndex;
		Standard_ShortReal RefractionIndex ();
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "	* Returns the material name within predefined enumeration which has been requested (before modifications).

	:rtype: Graphic3d_NameOfMaterial
") RequestedName;
		Graphic3d_NameOfMaterial RequestedName ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Resets the material with the original values according to the material name but leave the current color values untouched for the material of type ASPECT.

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "	* Modifies the alpha coefficient of the surface, where 1.0 is opaque and 0.0 is fully transparent.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetAlpha;
		void SetAlpha (Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetAmbient;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetAmbient;
		void SetAmbient (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "	* Modifies the ambient color of the surface.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetAmbientColor;
		void SetAmbientColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetBSDF;
		%feature("autodoc", "	* Modifies the BSDF (bidirectional scattering distribution function).

	:param theBSDF:
	:type theBSDF: Graphic3d_BSDF &
	:rtype: None
") SetBSDF;
		void SetBSDF (const Graphic3d_BSDF & theBSDF);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Modifies the ambient and diffuse color of the surface.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetDiffuse;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetDiffuse;
		void SetDiffuse (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "	* Modifies the diffuse color of the surface.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetDiffuseColor;
		void SetDiffuseColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetEmissive;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetEmissive;
		void SetEmissive (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "	* Modifies the emissive color of the surface.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetEmissiveColor;
		void SetEmissiveColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetMaterialName;
		%feature("autodoc", "	* The current material become a 'UserDefined' material. Set the name of the 'UserDefined' material.

	:param theName:
	:type theName: TCollection_AsciiString &
	:rtype: None
") SetMaterialName;
		void SetMaterialName (const TCollection_AsciiString & theName);
		%feature("compactdefaultargs") SetMaterialType;
		%feature("autodoc", "	* Set material type.

	:param theType:
	:type theType: Graphic3d_TypeOfMaterial
	:rtype: None
") SetMaterialType;
		void SetMaterialType (const Graphic3d_TypeOfMaterial theType);
		%feature("compactdefaultargs") SetReflectionMode;
		%feature("autodoc", "	* Activates or deactivates the reflective properties of the surface with specified reflection type. //! Disabling diffuse and specular reflectance is useful for efficient visualization of large amounts of data as definition of normals for graphic primitives is not needed when only 'all-directional' reflectance is active. //! NOTE: Disabling all four reflection modes also turns off the following effects: 1. Lighting. Colors of primitives are not affected by the material properties when lighting is off. 2. Transparency.

	:param theType:
	:type theType: Graphic3d_TypeOfReflection
	:param theValue:
	:type theValue: bool
	:rtype: None
") SetReflectionMode;
		void SetReflectionMode (const Graphic3d_TypeOfReflection theType,const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetReflectionModeOff;
		%feature("autodoc", "	* Deactivates the reflective properties of the surface with specified reflection type.

	:param theType:
	:type theType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOff;
		void SetReflectionModeOff (const Graphic3d_TypeOfReflection theType);
		%feature("compactdefaultargs") SetReflectionModeOn;
		%feature("autodoc", "	* Activates the reflective properties of the surface with specified reflection type.

	:param theType:
	:type theType: Graphic3d_TypeOfReflection
	:rtype: None
") SetReflectionModeOn;
		void SetReflectionModeOn (const Graphic3d_TypeOfReflection theType);
		%feature("compactdefaultargs") SetRefractionIndex;
		%feature("autodoc", "	* Modifies the refraction index of the material. Warning: Raises MaterialDefinitionError if given value is a lesser than 1.0.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetRefractionIndex;
		void SetRefractionIndex (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "	* Modifies the luminosity of the surface. Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetShininess;
		void SetShininess (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetSpecular;
		%feature("autodoc", "	* Modifies the reflection properties of the surface. Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetSpecular;
		void SetSpecular (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "	* Modifies the specular color of the surface.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetSpecularColor;
		void SetSpecularColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Modifies the transparency coefficient of the surface, where 0 is opaque and 1 is fully transparent. Transparency is applicable to materials that have at least one of reflection modes (ambient, diffuse, specular or emissive) enabled. See also SetReflectionModeOn() and SetReflectionModeOff() methods. //! Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.

	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_ShortReal theValue);
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "	* Returns the luminosity of the surface.

	:rtype: Standard_ShortReal
") Shininess;
		Standard_ShortReal Shininess ();
		%feature("compactdefaultargs") Specular;
		%feature("autodoc", "	* Returns the reflection properties of the surface.

	:rtype: Standard_ShortReal
") Specular;
		Standard_ShortReal Specular ();
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "	* Returns the specular color of the surface.

	:rtype: Quantity_Color
") SpecularColor;
		const Quantity_Color & SpecularColor ();
		%feature("compactdefaultargs") StringName;
		%feature("autodoc", "	* Returns the given name of this material. This might be: - given name set by method ::SetMaterialName() - standard name for a material within enumeration - 'UserDefined' for non-standard material without name specified externally.

	:rtype: TCollection_AsciiString
") StringName;
		const TCollection_AsciiString & StringName ();
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns the transparency coefficient of the surface (1.0 - Alpha); 0.0 means opaque.

	:rtype: Standard_ShortReal
") Transparency;
		Standard_ShortReal Transparency ();

        %extend{
            bool __ne_wrapper__(const Graphic3d_MaterialAspect  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self, right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        
        %extend{
            bool __eq_wrapper__(const Graphic3d_MaterialAspect  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Graphic3d_MaterialAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_PolygonOffset;
class Graphic3d_PolygonOffset {
	public:
		Aspect_PolygonOffsetMode Mode;
		Standard_ShortReal Factor;
		Standard_ShortReal Units;
		%feature("compactdefaultargs") Graphic3d_PolygonOffset;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Graphic3d_PolygonOffset;
		 Graphic3d_PolygonOffset ();
};


%extend Graphic3d_PolygonOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_PresentationAttributes;
class Graphic3d_PresentationAttributes : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BasicFillAreaAspect;
		%feature("autodoc", "	* Return basic presentation fill area aspect, NULL by default. When set, might be used instead of Color() property.

	:rtype: Handle_Graphic3d_AspectFillArea3d
") BasicFillAreaAspect;
		Handle_Graphic3d_AspectFillArea3d BasicFillAreaAspect ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns basic presentation color, Quantity_NOC_WHITE by default.

	:rtype: Quantity_Color
") Color;
		const Quantity_Color & Color ();
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "	* Returns basic presentation color (including alpha channel).

	:rtype: Quantity_ColorRGBA
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA ();
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "	* Returns display mode, 0 by default. -1 means undefined (main display mode of presentation to be used).

	:rtype: int
") DisplayMode;
		Standard_Integer DisplayMode ();
		%feature("compactdefaultargs") Graphic3d_PresentationAttributes;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") Graphic3d_PresentationAttributes;
		 Graphic3d_PresentationAttributes ();
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "	* Returns highlight method, Aspect_TOHM_COLOR by default.

	:rtype: Aspect_TypeOfHighlightMethod
") Method;
		Aspect_TypeOfHighlightMethod Method ();
		%feature("compactdefaultargs") SetBasicFillAreaAspect;
		%feature("autodoc", "	* Sets basic presentation fill area aspect.

	:param theAspect:
	:type theAspect: Handle_Graphic3d_AspectFillArea3d &
	:rtype: None
") SetBasicFillAreaAspect;
		void SetBasicFillAreaAspect (const Handle_Graphic3d_AspectFillArea3d & theAspect);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Sets basic presentation color (RGB components, does not modifies transparency).

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets display mode.

	:param theMode:
	:type theMode: int
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "	* Changes highlight method to the given one.

	:param theMethod:
	:type theMethod: Aspect_TypeOfHighlightMethod
	:rtype: None
") SetMethod;
		void SetMethod (const Aspect_TypeOfHighlightMethod theMethod);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Sets basic presentation transparency (0 - opaque, 1 - fully transparent).

	:param theTranspCoef:
	:type theTranspCoef: Standard_ShortReal
	:rtype: None
") SetTransparency;
		void SetTransparency (const Standard_ShortReal theTranspCoef);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Sets presentation Zlayer.

	:param theLayer:
	:type theLayer: Graphic3d_ZLayerId
	:rtype: None
") SetZLayer;
		void SetZLayer (const Graphic3d_ZLayerId theLayer);
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "	* Returns basic presentation transparency (0 - opaque, 1 - fully transparent), 0 by default (opaque).

	:rtype: Standard_ShortReal
") Transparency;
		Standard_ShortReal Transparency ();
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "	* Returns presentation Zlayer, Graphic3d_ZLayerId_Default by default. Graphic3d_ZLayerId_UNKNOWN means undefined (a layer of main presentation to be used).

	:rtype: Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer ();
};


%make_alias(Graphic3d_PresentationAttributes)

%extend Graphic3d_PresentationAttributes {
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
		Graphic3d_RenderTransparentMethod TransparencyMethod;
		Standard_ShortReal OitDepthFactor;
		int NbMsaaSamples;
		Standard_ShortReal RenderResolutionScale;
		bool IsGlobalIlluminationEnabled;
		int SamplesPerPixel;
		int RaytracingDepth;
		bool IsShadowEnabled;
		bool IsReflectionEnabled;
		bool IsAntialiasingEnabled;
		bool IsTransparentShadowEnabled;
		bool UseEnvironmentMapBackground;
		bool CoherentPathTracingMode;
		bool AdaptiveScreenSampling;
		bool ShowSamplingTiles;
		bool TwoSidedBsdfModels;
		Standard_ShortReal RadianceClampingValue;
		bool RebuildRayTracingShaders;
		int NbRayTracingTiles;
		Standard_ShortReal CameraApertureRadius;
		Standard_ShortReal CameraFocalPlaneDist;
		Graphic3d_ToneMappingMethod ToneMappingMethod;
		Standard_ShortReal Exposure;
		Standard_ShortReal WhitePoint;
		Graphic3d_StereoMode StereoMode;
		Anaglyph AnaglyphFilter;
		Graphic3d_Mat4 AnaglyphLeft;
		Graphic3d_Mat4 AnaglyphRight;
		bool ToReverseStereo;
		unsigned int Resolution;
		%feature("compactdefaultargs") Graphic3d_RenderingParams;
		%feature("autodoc", "	* Creates default rendering parameters.

	:rtype: None
") Graphic3d_RenderingParams;
		 Graphic3d_RenderingParams ();
		%feature("compactdefaultargs") ResolutionRatio;
		%feature("autodoc", "	* Returns resolution ratio.

	:rtype: Standard_ShortReal
") ResolutionRatio;
		Standard_ShortReal ResolutionRatio ();
};


%extend Graphic3d_RenderingParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ShaderAttribute;
class Graphic3d_ShaderAttribute : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Graphic3d_ShaderAttribute;
		%feature("autodoc", "	* Creates new attribute.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theLocation:
	:type theLocation: int
	:rtype: None
") Graphic3d_ShaderAttribute;
		 Graphic3d_ShaderAttribute (const TCollection_AsciiString & theName,const int theLocation);
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns attribute location to be bound on GLSL program linkage stage.

	:rtype: int
") Location;
		int Location ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns name of shader variable.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
};


%make_alias(Graphic3d_ShaderAttribute)

%extend Graphic3d_ShaderAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ShaderObject;
class Graphic3d_ShaderObject : public Standard_Transient {
	public:
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
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
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
};


%make_alias(Graphic3d_ShaderObject)

%extend Graphic3d_ShaderObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ShaderProgram;
class Graphic3d_ShaderProgram : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AttachShader;
		%feature("autodoc", "	* Attaches shader object to the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") AttachShader;
		Standard_Boolean AttachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("compactdefaultargs") ClearVariables;
		%feature("autodoc", "	* Removes all custom uniform variables from the program.

	:rtype: None
") ClearVariables;
		void ClearVariables ();
		%feature("compactdefaultargs") DetachShader;
		%feature("autodoc", "	* Detaches shader object from the program object.

	:param theShader:
	:type theShader: Handle_Graphic3d_ShaderObject &
	:rtype: bool
") DetachShader;
		Standard_Boolean DetachShader (const Handle_Graphic3d_ShaderObject & theShader);
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* Returns unique ID used to manage resource in graphic driver.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "	* Creates new empty program object.

	:rtype: None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram ();
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "	* Returns GLSL header (version code and extensions).

	:rtype: TCollection_AsciiString
") Header;
		const TCollection_AsciiString & Header ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the program object is valid or not.

	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("compactdefaultargs") PushVariableFloat;
		%feature("autodoc", "	* Pushes float uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: float
	:rtype: bool
") PushVariableFloat;
		Standard_Boolean PushVariableFloat (const TCollection_AsciiString & theName,const float theValue);
		%feature("compactdefaultargs") PushVariableInt;
		%feature("autodoc", "	* Pushes int uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: int
	:rtype: bool
") PushVariableInt;
		Standard_Boolean PushVariableInt (const TCollection_AsciiString & theName,const int theValue);
		%feature("compactdefaultargs") PushVariableVec2;
		%feature("autodoc", "	* Pushes vec2 uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: Graphic3d_Vec2 &
	:rtype: bool
") PushVariableVec2;
		Standard_Boolean PushVariableVec2 (const TCollection_AsciiString & theName,const Graphic3d_Vec2 & theValue);
		%feature("compactdefaultargs") PushVariableVec2i;
		%feature("autodoc", "	* Pushes vec2i uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: Graphic3d_Vec2i &
	:rtype: bool
") PushVariableVec2i;
		Standard_Boolean PushVariableVec2i (const TCollection_AsciiString & theName,const Graphic3d_Vec2i & theValue);
		%feature("compactdefaultargs") PushVariableVec3;
		%feature("autodoc", "	* Pushes vec3 uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: Graphic3d_Vec3 &
	:rtype: bool
") PushVariableVec3;
		Standard_Boolean PushVariableVec3 (const TCollection_AsciiString & theName,const Graphic3d_Vec3 & theValue);
		%feature("compactdefaultargs") PushVariableVec3i;
		%feature("autodoc", "	* Pushes vec3i uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: Graphic3d_Vec3i &
	:rtype: bool
") PushVariableVec3i;
		Standard_Boolean PushVariableVec3i (const TCollection_AsciiString & theName,const Graphic3d_Vec3i & theValue);
		%feature("compactdefaultargs") PushVariableVec4;
		%feature("autodoc", "	* Pushes vec4 uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: Graphic3d_Vec4 &
	:rtype: bool
") PushVariableVec4;
		Standard_Boolean PushVariableVec4 (const TCollection_AsciiString & theName,const Graphic3d_Vec4 & theValue);
		%feature("compactdefaultargs") PushVariableVec4i;
		%feature("autodoc", "	* Pushes vec4i uniform.

	:param theName:
	:type theName: TCollection_AsciiString &
	:param theValue:
	:type theValue: Graphic3d_Vec4i &
	:rtype: bool
") PushVariableVec4i;
		Standard_Boolean PushVariableVec4i (const TCollection_AsciiString & theName,const Graphic3d_Vec4i & theValue);
		%feature("compactdefaultargs") SetHeader;
		%feature("autodoc", "	* Setup GLSL header containing language version code and used extensions. Will be prepended to the very beginning of the source code. Example: @code #version 300 es #extension GL_ARB_bindless_texture : require @endcode

	:param theHeader:
	:type theHeader: TCollection_AsciiString &
	:rtype: None
") SetHeader;
		void SetHeader (const TCollection_AsciiString & theHeader);
		%feature("compactdefaultargs") SetVertexAttributes;
		%feature("autodoc", "	* Assign the list of custom vertex attributes. Should be done before GLSL program initialization.

	:param theAttributes:
	:type theAttributes: Graphic3d_ShaderAttributeList &
	:rtype: None
") SetVertexAttributes;
		void SetVertexAttributes (const Graphic3d_ShaderAttributeList & theAttributes);
		%feature("compactdefaultargs") ShaderObjects;
		%feature("autodoc", "	* Returns list of attached shader objects.

	:rtype: Graphic3d_ShaderObjectList
") ShaderObjects;
		const Graphic3d_ShaderObjectList & ShaderObjects ();
		%feature("compactdefaultargs") ShadersFolder;
		%feature("autodoc", "	* The path to GLSL programs determined from CSF_ShadersDirectory or CASROOT environment variables. returns the root folder with default GLSL programs.

	:rtype: TCollection_AsciiString
") ShadersFolder;
		static const TCollection_AsciiString & ShadersFolder ();
		%feature("compactdefaultargs") Variables;
		%feature("autodoc", "	* The list of currently pushed but not applied custom uniform variables. This list is automatically cleared after applying to GLSL program.

	:rtype: Graphic3d_ShaderVariableList
") Variables;
		const Graphic3d_ShaderVariableList & Variables ();
		%feature("compactdefaultargs") VertexAttributes;
		%feature("autodoc", "	* Return the list of custom vertex attributes.

	:rtype: Graphic3d_ShaderAttributeList
") VertexAttributes;
		const Graphic3d_ShaderAttributeList & VertexAttributes ();
};


%make_alias(Graphic3d_ShaderProgram)

%extend Graphic3d_ShaderProgram {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ShaderVariable;
class Graphic3d_ShaderVariable : public Standard_Transient {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Checks if the shader variable is valid or not.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns name of shader variable.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns interface of shader variable value.

	:rtype: Graphic3d_ValueInterface *
") Value;
		Graphic3d_ValueInterface * Value ();
};


%make_alias(Graphic3d_ShaderVariable)

%extend Graphic3d_ShaderVariable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Structure;
class Graphic3d_Structure : public Standard_Transient {
	public:
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
		%feature("compactdefaultargs") CStructure;
		%feature("autodoc", "	* Returns the low-level structure

	:rtype: Handle_Graphic3d_CStructure
") CStructure;
		Handle_Graphic3d_CStructure CStructure ();
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "	* Computes axis-aligned bounding box of a structure.

	:rtype: void
") CalculateBoundBox;
		virtual void CalculateBoundBox ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* if WithDestruction == Standard_True then suppress all the groups of primitives in the structure. and it is mandatory to create a new group in <self>. if WithDestruction == Standard_False then clears all the groups of primitives in the structure. and all the groups are conserved and empty. They will be erased at the next screen update. The structure itself is conserved. The transformation and the attributes of <self> are conserved. The childs of <self> are conserved.

	:param WithDestruction: default value is Standard_True
	:type WithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Standard_Boolean WithDestruction = Standard_True);
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "	* Get clip planes slicing the structure on rendering. returns set of clip planes.

	:rtype: Handle_Graphic3d_SequenceOfHClipPlane
") ClipPlanes;
		Handle_Graphic3d_SequenceOfHClipPlane ClipPlanes ();
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

	:param theProjector:
	:type theProjector: Handle_Graphic3d_DataStructureManager &
	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		virtual Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & theProjector,const Handle_Geom_Transformation & theTrsf);
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

	:param theProjector:
	:type theProjector: Handle_Graphic3d_DataStructureManager &
	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Compute;
		virtual void Compute (const Handle_Graphic3d_DataStructureManager & theProjector,const Handle_Geom_Transformation & theTrsf,Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") ComputeVisual;
		%feature("autodoc", "	:rtype: Graphic3d_TypeOfStructure
") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual ();
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
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
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
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID of displayed structure. The method returns -1 if the structure has no ID (deleted from graphic driver).

	:rtype: Graphic3d_ZLayerId
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer ();
		%feature("compactdefaultargs") Graphic3d_Structure;
		%feature("autodoc", "	* Creates a graphic object in the manager theManager. It will appear in all the views of the visualiser. The structure is not displayed when it is created.

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
		%feature("compactdefaultargs") GraphicTransform;
		%feature("autodoc", "	* Internal method which sets new transformation without calling graphic manager callbacks.

	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: None
") GraphicTransform;
		void GraphicTransform (const Handle_Geom_Transformation & theTrsf);
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "	* Returns the groups sequence included in the structure <self> (internal storage).

	:rtype: Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();
		%feature("compactdefaultargs") HLRValidation;
		%feature("autodoc", "	:rtype: bool
") HLRValidation;
		Standard_Boolean HLRValidation ();
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the structure in all the views with the given style @param theStyle [in] the style (type of highlighting: box/color, color and opacity) @param theToUpdateMgr [in] defines whether related computed structures will be highlighted via structure manager or not

	:param theStyle:
	:type theStyle: Handle_Graphic3d_PresentationAttributes &
	:param theToUpdateMgr: default value is Standard_True
	:type theToUpdateMgr: bool
	:rtype: None
") Highlight;
		void Highlight (const Handle_Graphic3d_PresentationAttributes & theStyle,const Standard_Boolean theToUpdateMgr = Standard_True);
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "	* Returns the highlight color for the Highlight method with the highlight method TOHM_COLOR or TOHM_BOUNDBOX.

	:rtype: Handle_Graphic3d_PresentationAttributes
") HighlightStyle;
		Handle_Graphic3d_PresentationAttributes HighlightStyle ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the structure <self>.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
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
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "	* Returns the highlight indicator for the structure <self>.

	:rtype: bool
") IsHighlighted;
		virtual Standard_Boolean IsHighlighted ();
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	* Returns Standard_True if the structure <self> is infinite.

	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "	* Returns true if structure has mutable nature (content or location are be changed regularly). Mutable structure will be managed in different way than static onces.

	:rtype: bool
") IsMutable;
		Standard_Boolean IsMutable ();
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
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of the structure <self>. If <theToIgnoreInfiniteFlag> is True, the method returns actual graphical boundaries of the Graphic3d_Group components. Otherwise, the method returns boundaries taking into account infinite state of the structure. This approach generally used for application specific fit operation (e.g. fitting the model into screen, not taking into accout infinite helper elements). Warning: If the structure <self> is empty then the empty box is returned, If the structure <self> is infinite then the whole box is returned.

	:param theToIgnoreInfiniteFlag: default value is Standard_False
	:type theToIgnoreInfiniteFlag: bool
	:rtype: Bnd_Box
") MinMaxValues;
		Bnd_Box MinMaxValues (const Standard_Boolean theToIgnoreInfiniteFlag = Standard_False);
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
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "	* Append new group to this structure.

	:rtype: Handle_Graphic3d_Group
") NewGroup;
		Handle_Graphic3d_Group NewGroup ();
		%feature("compactdefaultargs") NumberOfGroups;
		%feature("autodoc", "	* Returns the current number of groups in the structure <self>.

	:rtype: int
") NumberOfGroups;
		Standard_Integer NumberOfGroups ();
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "	:rtype: Standard_Address
") Owner;
		Standard_Address Owner ();
		%feature("compactdefaultargs") PrintNetwork;
		%feature("autodoc", "	* Prints informations about the network associated with the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: void
") PrintNetwork;
		static void PrintNetwork (const Handle_Graphic3d_Structure & AStructure,const Graphic3d_TypeOfConnection AType);
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppress the structure <self>. It will be erased at the next screen update. Warning: No more graphic operations in <self> after this call. Category: Methods to modify the class definition

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppress the adress <APtr> in the list of descendants or in the list of ancestors.

	:param APtr:
	:type APtr: Standard_Address
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None
") Remove;
		void Remove (const Standard_Address APtr,const Graphic3d_TypeOfConnection AType);
		%feature("compactdefaultargs") ResetDisplayPriority;
		%feature("autodoc", "	* Reset the current priority of the structure to the previous priority. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority method erase <self> and display <self> with the previous priority.

	:rtype: None
") ResetDisplayPriority;
		void ResetDisplayPriority ();
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Changes a sequence of clip planes slicing the structure on rendering. @param thePlanes [in] the set of clip planes.

	:param thePlanes:
	:type thePlanes: Handle_Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Handle_Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") SetComputeVisual;
		%feature("autodoc", "	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: None
") SetComputeVisual;
		void SetComputeVisual (const Graphic3d_TypeOfStructure AVisual);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Modifies the order of displaying the structure. Values are between 0 and 10. Structures are drawn according to their display priorities in ascending order. A structure of priority 10 is displayed the last and appears over the others. The default value is 5. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority method erase <self> and display <self> with the new priority. Raises PriorityDefinitionError if <Priority> is greater than 10 or a negative value.

	:param Priority:
	:type Priority: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Standard_Integer Priority);
		%feature("compactdefaultargs") SetHLRValidation;
		%feature("autodoc", "	:param AFlag:
	:type AFlag: bool
	:rtype: None
") SetHLRValidation;
		void SetHLRValidation (const Standard_Boolean AFlag);
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "	* If <theToSet> is Standard_True then <self> is infinite and the MinMaxValues method method return : theXMin = theYMin = theZMin = RealFirst(). theXMax = theYMax = theZMax = RealLast(). By default, <self> is not infinite but empty.

	:param theToSet:
	:type theToSet: bool
	:rtype: None
") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean theToSet);
		%feature("compactdefaultargs") SetIsForHighlight;
		%feature("autodoc", "	* marks the structure <self> representing wired structure needed for highlight only so it won't be added to BVH tree. Category: Methods to modify the class definition

	:param isForHighlight:
	:type isForHighlight: bool
	:rtype: None
") SetIsForHighlight;
		void SetIsForHighlight (const Standard_Boolean isForHighlight);
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "	* Sets if the structure location has mutable nature (content or location will be changed regularly).

	:param theIsMutable:
	:type theIsMutable: bool
	:rtype: None
") SetMutable;
		void SetMutable (const Standard_Boolean theIsMutable);
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "	:param Owner:
	:type Owner: Standard_Address
	:rtype: None
") SetOwner;
		void SetOwner (const Standard_Address Owner);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Modifies the current transform persistence (pan, zoom or rotate)

	:param theTrsfPers:
	:type theTrsfPers: Handle_Graphic3d_TransformPers &
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Handle_Graphic3d_TransformPers & theTrsfPers);
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "	* Modifies the current local transformation

	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: None
") SetTransformation;
		void SetTransformation (const Handle_Geom_Transformation & theTrsf);
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
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID for the structure. The Z layer mechanism allows to display structures presented in higher layers in overlay of structures in lower layers by switching off z buffer depth test between layers

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") SetZLayer;
		void SetZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") SetZoomLimit;
		%feature("autodoc", "	* Modifies the minimum and maximum zoom coefficients for the structure <self>. The default value at the definition of <self> is unlimited. Category: Methods to modify the class definition Warning: Raises StructureDefinitionError if <LimitInf> is greater than <LimitSup> or if <LimitInf> or <LimitSup> is a negative value.

	:param LimitInf:
	:type LimitInf: float
	:param LimitSup:
	:type LimitSup: float
	:rtype: None
") SetZoomLimit;
		void SetZoomLimit (const Standard_Real LimitInf,const Standard_Real LimitSup);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: None
") Transform;
		void Transform (const Handle_Geom_Transformation & theTrsf);
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "	* returns transform persistence of the presentable object.

	:rtype: Handle_Graphic3d_TransformPers
") TransformPersistence;
		Handle_Graphic3d_TransformPers TransformPersistence ();
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Return local transformation.

	:rtype: Handle_Geom_Transformation
") Transformation;
		Handle_Geom_Transformation Transformation ();
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "	* Transforms theX, theY, theZ with the transformation theTrsf.

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theNewX:
	:type theNewX: float &
	:param theNewY:
	:type theNewY: float &
	:param theNewZ:
	:type theNewZ: float &
	:rtype: void
") Transforms;
		static void Transforms (const gp_Trsf & theTrsf,const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppresses the highlight for the structure <self> in all the views of the visualiser.

	:rtype: None
") UnHighlight;
		void UnHighlight ();
		%feature("compactdefaultargs") Visual;
		%feature("autodoc", "	* Returns the visualisation mode for the structure <self>.

	:rtype: Graphic3d_TypeOfStructure
") Visual;
		Graphic3d_TypeOfStructure Visual ();
};


%make_alias(Graphic3d_Structure)

%extend Graphic3d_Structure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_StructureManager;
class Graphic3d_StructureManager : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ChangeDisplayPriority;
		%feature("autodoc", "	* Changes the display priority of the structure <AStructure>.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theOldPriority:
	:type theOldPriority: int
	:param theNewPriority:
	:type theNewPriority: int
	:rtype: void
") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority (const Handle_Graphic3d_Structure & theStructure,const Standard_Integer theOldPriority,const Standard_Integer theNewPriority);
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "	* Change Z layer for structure. The Z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") ChangeZLayer;
		virtual void ChangeZLayer (const Handle_Graphic3d_Structure & theStructure,const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the structure.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theWithDestruction:
	:type theWithDestruction: bool
	:rtype: void
") Clear;
		virtual void Clear (const Handle_Graphic3d_Structure & theStructure,const Standard_Boolean theWithDestruction);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	* Connects the structures.

	:param theMother:
	:type theMother: Handle_Graphic3d_Structure &
	:param theDaughter:
	:type theDaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Connect;
		virtual void Connect (const Handle_Graphic3d_Structure & theMother,const Handle_Graphic3d_Structure & theDaughter);
		%feature("compactdefaultargs") DefinedViews;
		%feature("autodoc", "	* Returns the group of views defined in the structure manager.

	:rtype: Graphic3d_IndexedMapOfView
") DefinedViews;
		const Graphic3d_IndexedMapOfView & DefinedViews ();
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "	* Disconnects the structures.

	:param theMother:
	:type theMother: Handle_Graphic3d_Structure &
	:param theDaughter:
	:type theDaughter: Handle_Graphic3d_Structure &
	:rtype: void
") Disconnect;
		virtual void Disconnect (const Handle_Graphic3d_Structure & theMother,const Handle_Graphic3d_Structure & theDaughter);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the structure.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Display;
		virtual void Display (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "	* Returns the set of structures displayed in visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases all the structures.

	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erases the structure.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Erase;
		virtual void Erase (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") Graphic3d_StructureManager;
		%feature("autodoc", "	* Initializes the ViewManager. Currently creating of more than 100 viewer instances is not supported and leads to InitializationError and initialization failure. This limitation might be addressed in some future OCCT releases. Warning: Raises InitialisationError if the initialization of the ViewManager failed.

	:param theDriver:
	:type theDriver: Handle_Graphic3d_GraphicDriver &
	:rtype: None
") Graphic3d_StructureManager;
		 Graphic3d_StructureManager (const Handle_Graphic3d_GraphicDriver & theDriver);
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "	* Returns the graphic driver of <self>.

	:rtype: Handle_Graphic3d_GraphicDriver
") GraphicDriver;
		Handle_Graphic3d_GraphicDriver GraphicDriver ();
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the structure.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: void
") Highlight;
		virtual void Highlight (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") HighlightedStructures;
		%feature("autodoc", "	* Returns the set of highlighted structures in a visualiser <self>.

	:param SG:
	:type SG: Graphic3d_MapOfStructure &
	:rtype: None
") HighlightedStructures;
		void HighlightedStructures (Graphic3d_MapOfStructure & SG);
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Attaches the view to this structure manager and sets its identification number within the manager.

	:param theView:
	:type theView: Graphic3d_CView *
	:rtype: int
") Identification;
		Standard_Integer Identification (Graphic3d_CView * theView);
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the structure with the identification number <AId>.

	:param AId:
	:type AId: int
	:rtype: Handle_Graphic3d_Structure
") Identification;
		virtual Handle_Graphic3d_Structure Identification (const Standard_Integer AId);
		%feature("compactdefaultargs") IsDeviceLost;
		%feature("autodoc", "	* Returns True if Device Lost flag has been set and presentation data should be reuploaded onto graphics driver.

	:rtype: bool
") IsDeviceLost;
		Standard_Boolean IsDeviceLost ();
		%feature("compactdefaultargs") MaxNumOfViews;
		%feature("autodoc", "	* Returns the theoretical maximum number of definable views in the manager. Warning: It's not possible to accept an infinite number of definable views because each view must have an identification and we have different managers.

	:rtype: int
") MaxNumOfViews;
		Standard_Integer MaxNumOfViews ();
		%feature("compactdefaultargs") ObjectAffinity;
		%feature("autodoc", "	:param theObject:
	:type theObject: Handle_Standard_Transient &
	:rtype: Handle_Graphic3d_ViewAffinity
") ObjectAffinity;
		Handle_Graphic3d_ViewAffinity ObjectAffinity (const Handle_Standard_Transient & theObject);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure. if <theStructure> is displayed and TOS_COMPUTED.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Forces a new construction of the structure. if <theStructure> is displayed in <theProjector> and TOS_COMPUTED.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theProjector:
	:type theProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: void
") ReCompute;
		virtual void ReCompute (const Handle_Graphic3d_Structure & theStructure,const Handle_Graphic3d_DataStructureManager & theProjector);
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "	* Recomputes all structures in the manager. Resets Device Lost flag.

	:rtype: None
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
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Deletes and erases the 3D structure manager.

	:rtype: void
") Remove;
		virtual void Remove ();
		%feature("compactdefaultargs") SetDeviceLost;
		%feature("autodoc", "	* Sets Device Lost flag.

	:rtype: None
") SetDeviceLost;
		void SetDeviceLost ();
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "	* Transforms the structure.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: void
") SetTransform;
		virtual void SetTransform (const Handle_Graphic3d_Structure & theStructure,const Handle_Geom_Transformation & theTrsf);
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppress the highlighting on the structure <AStructure>.

	:param AStructure:
	:type AStructure: Handle_Graphic3d_Structure &
	:rtype: void
") UnHighlight;
		virtual void UnHighlight (const Handle_Graphic3d_Structure & AStructure);
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* Suppresses the highlighting on all the structures in <self>.

	:rtype: void
") UnHighlight;
		virtual void UnHighlight ();
		%feature("compactdefaultargs") UnIdentification;
		%feature("autodoc", "	* Detach the view from this structure manager and release its identification.

	:param theView:
	:type theView: Graphic3d_CView *
	:rtype: None
") UnIdentification;
		void UnIdentification (Graphic3d_CView * theView);
		%feature("compactdefaultargs") UnregisterObject;
		%feature("autodoc", "	:param theObject:
	:type theObject: Handle_Standard_Transient &
	:rtype: None
") UnregisterObject;
		void UnregisterObject (const Handle_Standard_Transient & theObject);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Invalidates bounding box of specified ZLayerId.

	:param theLayerId: default value is Graphic3d_ZLayerId_UNKNOWN
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") Update;
		virtual void Update (const Graphic3d_ZLayerId theLayerId = Graphic3d_ZLayerId_UNKNOWN);
};


%make_alias(Graphic3d_StructureManager)

%extend Graphic3d_StructureManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_TextureParams;
class Graphic3d_TextureParams : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	* returns texture interpolation filter. Default value is Graphic3d_TOTF_NEAREST.

	:rtype: Graphic3d_TypeOfTextureFilter
") Filter;
		Graphic3d_TypeOfTextureFilter Filter ();
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
		%feature("compactdefaultargs") Graphic3d_TextureParams;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") Graphic3d_TextureParams;
		 Graphic3d_TextureParams ();
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "	* returns True if the texture is modulate. Default value is False.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "	* returns True if the texture repeat is enabled. Default value is False.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* returns rotation angle in degrees Default value is 0.

	:rtype: Standard_ShortReal
") Rotation;
		Standard_ShortReal Rotation ();
		%feature("compactdefaultargs") SamplerRevision;
		%feature("autodoc", "	* Return modification counter of parameters related to sampler state.

	:rtype: unsigned int
") SamplerRevision;
		unsigned int SamplerRevision ();
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* returns scale factor Default value is no scaling (1.0; 1.0).

	:rtype: Graphic3d_Vec2
") Scale;
		const Graphic3d_Vec2 & Scale ();
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
		%feature("compactdefaultargs") SetFilter;
		%feature("autodoc", "	* @param theFilter texture interpolation filter.

	:param theFilter:
	:type theFilter: Graphic3d_TypeOfTextureFilter
	:rtype: None
") SetFilter;
		void SetFilter (const Graphic3d_TypeOfTextureFilter theFilter);
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
		%feature("compactdefaultargs") SetModulate;
		%feature("autodoc", "	* @param theToModulate turn modulation on/off.

	:param theToModulate:
	:type theToModulate: bool
	:rtype: None
") SetModulate;
		void SetModulate (const Standard_Boolean theToModulate);
		%feature("compactdefaultargs") SetRepeat;
		%feature("autodoc", "	* @param theToRepeat turn texture repeat mode ON or OFF (clamping).

	:param theToRepeat:
	:type theToRepeat: bool
	:rtype: None
") SetRepeat;
		void SetRepeat (const Standard_Boolean theToRepeat);
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* @param theAngleDegrees rotation angle.

	:param theAngleDegrees:
	:type theAngleDegrees: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theAngleDegrees);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* @param theScale scale factor.

	:param theScale:
	:type theScale: Graphic3d_Vec2
	:rtype: None
") SetScale;
		void SetScale (const Graphic3d_Vec2 theScale);
		%feature("compactdefaultargs") SetTextureUnit;
		%feature("autodoc", "	* Setup default texture unit.

	:param theUnit:
	:type theUnit: Graphic3d_TextureUnit
	:rtype: None
") SetTextureUnit;
		void SetTextureUnit (Graphic3d_TextureUnit theUnit);
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "	* @param theVec translation vector.

	:param theVec:
	:type theVec: Graphic3d_Vec2
	:rtype: None
") SetTranslation;
		void SetTranslation (const Graphic3d_Vec2 theVec);
		%feature("compactdefaultargs") TextureUnit;
		%feature("autodoc", "	* Default texture unit to be used, default is Graphic3d_TextureUnit_BaseColor.

	:rtype: Graphic3d_TextureUnit
") TextureUnit;
		Graphic3d_TextureUnit TextureUnit ();
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "	* returns translation vector Default value is no translation (0.0; 0.0).

	:rtype: Graphic3d_Vec2
") Translation;
		const Graphic3d_Vec2 & Translation ();
};


%make_alias(Graphic3d_TextureParams)

%extend Graphic3d_TextureParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_TextureRoot;
class Graphic3d_TextureRoot : public Standard_Transient {
	public:
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "	* This ID will be used to manage resource in graphic driver. //! Default implementation generates unique ID within constructor; inheritors may re-initialize it within their constructor, but should never modify it afterwards. //! Multiple Graphic3d_TextureRoot instances with same ID will be treated as single texture with different parameters to optimize memory usage though this will be more natural to use same instance of Graphic3d_TextureRoot when possible. //! If this ID is set to empty string by inheritor, then independent graphical resource will be created for each instance of Graphic3d_AspectFillArea3d where texture will be used. //! returns texture identifier.

	:rtype: TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId ();
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "	* This method will be called by graphic driver each time when texture resource should be created. Default constructors allow defining the texture source as path to texture image or directly as pixmap. If the source is defined as path, then the image will be dynamically loaded when this method is called (and no copy will be preserved in this class instance). Inheritors may dynamically generate the image. Notice, image data should be in Bottom-Up order (see Image_PixMap::IsTopDown())! returns the image for texture.

	:rtype: Handle_Image_PixMap
") GetImage;
		virtual Handle_Image_PixMap GetImage ();
		%feature("compactdefaultargs") GetParams;
		%feature("autodoc", "	* returns low-level texture parameters

	:rtype: Handle_Graphic3d_TextureParams
") GetParams;
		Handle_Graphic3d_TextureParams GetParams ();
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
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "	* Return image revision.

	:rtype: Standard_Size
") Revision;
		Standard_Size Revision ();
		%feature("compactdefaultargs") TexturesFolder;
		%feature("autodoc", "	* The path to textures determined from CSF_MDTVTexturesDirectory or CASROOT environment variables. returns the root folder with default textures.

	:rtype: TCollection_AsciiString
") TexturesFolder;
		static TCollection_AsciiString TexturesFolder ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* returns the texture type.

	:rtype: Graphic3d_TypeOfTexture
") Type;
		Graphic3d_TypeOfTexture Type ();
		%feature("compactdefaultargs") UpdateRevision;
		%feature("autodoc", "	* Update image revision. Can be used for signaling changes in the texture source (e.g. file update, pixmap update) without re-creating texture source itself (since unique id should be never modified).

	:rtype: None
") UpdateRevision;
		void UpdateRevision ();
};


%make_alias(Graphic3d_TextureRoot)

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
		%feature("compactdefaultargs") IsNormalized;
		%feature("autodoc", "	* Returns Standard_True if <self> has length 1.

	:rtype: bool
") IsNormalized;
		Standard_Boolean IsNormalized ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns Standard_True if the vector <AV1> and <AV2> are parallel.

	:param AV1:
	:type AV1: Graphic3d_Vector &
	:param AV2:
	:type AV2: Graphic3d_Vector &
	:rtype: bool
") IsParallel;
		static Standard_Boolean IsParallel (const Graphic3d_Vector & AV1,const Graphic3d_Vector & AV2);
		%feature("compactdefaultargs") LengthZero;
		%feature("autodoc", "	* Returns Standard_True if <self> has length zero.

	:rtype: bool
") LengthZero;
		Standard_Boolean LengthZero ();
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "	* Normalises <self>. Category: Methods to modify the class definition Warning: Raises VectorError if <self> is null.

	:rtype: None
") Normalize;
		void Normalize ();
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
};


%extend Graphic3d_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Vertex;
class Graphic3d_Vertex {
	public:
		float xyz[3];
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
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Returns the distance between two points.

	:param theOther:
	:type theOther: Graphic3d_Vertex &
	:rtype: Standard_ShortReal
") Distance;
		Standard_ShortReal Distance (const Graphic3d_Vertex & theOther);
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
		%feature("autodoc", "	* Setup visibility flag for all views.

	:param theIsVisible:
	:type theIsVisible: bool
	:rtype: None
") SetVisible;
		void SetVisible (const Standard_Boolean theIsVisible);
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


%make_alias(Graphic3d_ViewAffinity)

%extend Graphic3d_ViewAffinity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_WorldViewProjState;
class Graphic3d_WorldViewProjState {
	public:
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "	* Default constructor.

	:rtype: None
") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState ();
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "	* Constructor for custom projector type. @param theProjectionState [in] the projection state. @param theWorldViewState [in] the world view state. @param theCamera [in] the pointer to the class supplying projection and  world view matrices (camera).

	:param theProjectionState:
	:type theProjectionState: Standard_Size
	:param theWorldViewState:
	:type theWorldViewState: Standard_Size
	:param theCamera: default value is NULL
	:type theCamera: Standard_Transient *
	:rtype: None
") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState (const Standard_Size theProjectionState,const Standard_Size theWorldViewState,const Standard_Transient * theCamera = NULL);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize world view projection state.

	:param theProjectionState:
	:type theProjectionState: Standard_Size
	:param theWorldViewState:
	:type theWorldViewState: Standard_Size
	:param theCamera: default value is NULL
	:type theCamera: Standard_Transient *
	:rtype: None
") Initialize;
		void Initialize (const Standard_Size theProjectionState,const Standard_Size theWorldViewState,const Standard_Transient * theCamera = NULL);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialize world view projection state.

	:param theCamera: default value is NULL
	:type theCamera: Standard_Transient *
	:rtype: None
") Initialize;
		void Initialize (const Standard_Transient * theCamera = NULL);
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "	* Compare with other world view projection state. returns true when the projection of the given camera state differs from this one.

	:param theState:
	:type theState: Graphic3d_WorldViewProjState &
	:rtype: bool
") IsChanged;
		Standard_Boolean IsChanged (const Graphic3d_WorldViewProjState & theState);
		%feature("compactdefaultargs") IsProjectionChanged;
		%feature("autodoc", "	* Compare projection with other state. returns true when the projection of the given camera state differs from this one.

	:param theState:
	:type theState: Graphic3d_WorldViewProjState &
	:rtype: bool
") IsProjectionChanged;
		Standard_Boolean IsProjectionChanged (const Graphic3d_WorldViewProjState & theState);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Check state validity. returns true if state is set.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") IsWorldViewChanged;
		%feature("autodoc", "	* Compare world view transformation with other state. returns true when the orientation of the given camera state differs from this one.

	:param theState:
	:type theState: Graphic3d_WorldViewProjState &
	:rtype: bool
") IsWorldViewChanged;
		Standard_Boolean IsWorldViewChanged (const Graphic3d_WorldViewProjState & theState);
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "	* returns projection state counter.

	:rtype: Standard_Size
") ProjectionState;
		Standard_Size & ProjectionState ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Invalidate world view projection state.

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "	* returns world view state counter.

	:rtype: Standard_Size
") WorldViewState;
		Standard_Size & WorldViewState ();

        %extend{
            bool __ne_wrapper__(const Graphic3d_WorldViewProjState  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self, right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	* Copy world view projection state.

	:param theOther:
	:type theOther: Graphic3d_WorldViewProjState &
	:rtype: None
") operator =;
		void operator = (const Graphic3d_WorldViewProjState & theOther);

        %extend{
            bool __eq_wrapper__(const Graphic3d_WorldViewProjState  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Graphic3d_WorldViewProjState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_ZLayerSettings;
class Graphic3d_ZLayerSettings {
	public:
		%feature("compactdefaultargs") ChangePolygonOffset;
		%feature("autodoc", "	* Modify glPolygonOffset() arguments.

	:rtype: Graphic3d_PolygonOffset
") ChangePolygonOffset;
		Graphic3d_PolygonOffset & ChangePolygonOffset ();
		%feature("compactdefaultargs") DisableSetting;
		%feature("autodoc", "	* Disables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") DisableSetting;
		void DisableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") EnableSetting;
		%feature("autodoc", "	* Enables theSetting

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None
") EnableSetting;
		void EnableSetting (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") Graphic3d_ZLayerSettings;
		%feature("autodoc", "	* Default settings.

	:rtype: None
") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings ();
		%feature("compactdefaultargs") IsImmediate;
		%feature("autodoc", "	* Return true if this layer should be drawn after all normal (non-immediate) layers.

	:rtype: bool
") IsImmediate;
		Standard_Boolean IsImmediate ();
		%feature("compactdefaultargs") IsSettingEnabled;
		%feature("autodoc", "	* Returns true if theSetting is enabled.

	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: bool
") IsSettingEnabled;
		Standard_Boolean IsSettingEnabled (const Graphic3d_ZLayerSetting theSetting);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Return user-provided name.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name ();
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "	* Return the origin of all objects within the layer.

	:rtype: gp_XYZ
") Origin;
		const gp_XYZ  Origin ();
		%feature("compactdefaultargs") OriginTransformation;
		%feature("autodoc", "	* Return the transformation to the origin.

	:rtype: Handle_Geom_Transformation
") OriginTransformation;
		Handle_Geom_Transformation OriginTransformation ();
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "	* Return glPolygonOffset() arguments.

	:rtype: Graphic3d_PolygonOffset
") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset ();
		%feature("compactdefaultargs") SetClearDepth;
		%feature("autodoc", "	* Set if depth values should be cleared before drawing the layer.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetClearDepth;
		void SetClearDepth (const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetDepthOffsetNegative;
		%feature("autodoc", "	* Sets minimal possible negative depth offset.

	:rtype: None
") SetDepthOffsetNegative;
		void SetDepthOffsetNegative ();
		%feature("compactdefaultargs") SetDepthOffsetPositive;
		%feature("autodoc", "	* Sets minimal possible positive depth offset.

	:rtype: None
") SetDepthOffsetPositive;
		void SetDepthOffsetPositive ();
		%feature("compactdefaultargs") SetEnableDepthTest;
		%feature("autodoc", "	* Set if depth test should be enabled.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetEnableDepthTest;
		void SetEnableDepthTest (const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetEnableDepthWrite;
		%feature("autodoc", "	* Set if depth values should be written during rendering.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetEnableDepthWrite;
		void SetEnableDepthWrite (const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetEnvironmentTexture;
		%feature("autodoc", "	* Set the flag to allow/prevent environment texture mapping usage for specific layer.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetEnvironmentTexture;
		void SetEnvironmentTexture (const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetImmediate;
		%feature("autodoc", "	* Set the flag indicating the immediate layer, which should be drawn after all normal (non-immediate) layers.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetImmediate;
		void SetImmediate (const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Set custom name.

	:param theName:
	:type theName: TCollection_AsciiString &
	:rtype: None
") SetName;
		void SetName (const TCollection_AsciiString & theName);
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "	* Set the origin of all objects within the layer.

	:param theOrigin:
	:type theOrigin: gp_XYZ
	:rtype: None
") SetOrigin;
		void SetOrigin (const gp_XYZ & theOrigin);
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "	* Setup glPolygonOffset() arguments.

	:param theParams:
	:type theParams: Graphic3d_PolygonOffset &
	:rtype: None
") SetPolygonOffset;
		void SetPolygonOffset (const Graphic3d_PolygonOffset & theParams);
		%feature("compactdefaultargs") ToClearDepth;
		%feature("autodoc", "	* Return true if depth values should be cleared before drawing the layer.

	:rtype: bool
") ToClearDepth;
		Standard_Boolean ToClearDepth ();
		%feature("compactdefaultargs") ToEnableDepthTest;
		%feature("autodoc", "	* Return true if depth test should be enabled.

	:rtype: bool
") ToEnableDepthTest;
		Standard_Boolean ToEnableDepthTest ();
		%feature("compactdefaultargs") ToEnableDepthWrite;
		%feature("autodoc", "	* Return true depth values should be written during rendering.

	:rtype: bool
") ToEnableDepthWrite;
		Standard_Boolean ToEnableDepthWrite ();
		%feature("compactdefaultargs") UseEnvironmentTexture;
		%feature("autodoc", "	* Return flag to allow/prevent environment texture mapping usage for specific layer.

	:rtype: bool
") UseEnvironmentTexture;
		Standard_Boolean UseEnvironmentTexture ();
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


%make_alias(Graphic3d_ArrayOfPoints)

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


%make_alias(Graphic3d_ArrayOfPolygons)

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


%make_alias(Graphic3d_ArrayOfPolylines)

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


%make_alias(Graphic3d_ArrayOfQuadrangleStrips)

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


%make_alias(Graphic3d_ArrayOfQuadrangles)

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


%make_alias(Graphic3d_ArrayOfSegments)

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


%make_alias(Graphic3d_ArrayOfTriangleFans)

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


%make_alias(Graphic3d_ArrayOfTriangleStrips)

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


%make_alias(Graphic3d_ArrayOfTriangles)

%extend Graphic3d_ArrayOfTriangles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_CView;
class Graphic3d_CView : public Graphic3d_DataStructureManager {
	public:
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "	* Activates the view. Maps presentations defined within structure manager onto this view.

	:rtype: void
") Activate;
		virtual void Activate ();
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level z layer with ID <theLayerId> for the view. Z layers allow drawing structures in higher layers in foreground of structures in lower layers. To add a structure to desired layer on display it is necessary to set the layer ID for the structure.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") AddZLayer;
		void AddZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") BackfacingModel;
		%feature("autodoc", "	* Return backfacing model used for the view.

	:rtype: Graphic3d_TypeOfBackfacingModel
") BackfacingModel;
		Graphic3d_TypeOfBackfacingModel BackfacingModel ();
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "	* Returns background fill color.

	:rtype: Aspect_Background
") Background;
		Aspect_Background Background ();
		%feature("compactdefaultargs") BackgroundImage;
		%feature("autodoc", "	* Returns background image texture file path.

	:rtype: TCollection_AsciiString
") BackgroundImage;
		TCollection_AsciiString BackgroundImage ();
		%feature("compactdefaultargs") BackgroundImageStyle;
		%feature("autodoc", "	* Returns background image fill style.

	:rtype: Aspect_FillMethod
") BackgroundImageStyle;
		Aspect_FillMethod BackgroundImageStyle ();
		%feature("compactdefaultargs") BufferDump;
		%feature("autodoc", "	* Dump active rendering buffer into specified memory buffer.

	:param theImage:
	:type theImage: Image_PixMap &
	:param theBufferType:
	:type theBufferType: Graphic3d_BufferType &
	:rtype: bool
") BufferDump;
		Standard_Boolean BufferDump (Image_PixMap & theImage,const Graphic3d_BufferType & theBufferType);
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "	* Returns camera object of the view.

	:rtype: Handle_Graphic3d_Camera
") Camera;
		Handle_Graphic3d_Camera Camera ();
		%feature("compactdefaultargs") ChangeHiddenObjects;
		%feature("autodoc", "	* Returns map of objects hidden within this specific view (not viewer-wise).

	:rtype: Handle_Graphic3d_NMapOfTransient
") ChangeHiddenObjects;
		Handle_Graphic3d_NMapOfTransient ChangeHiddenObjects ();
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "	* Returns reference to current rendering parameters and effect settings.

	:rtype: Graphic3d_RenderingParams
") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams ();
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "	* Returns list of clip planes set for the view.

	:rtype: Handle_Graphic3d_SequenceOfHClipPlane
") ClipPlanes;
		Handle_Graphic3d_SequenceOfHClipPlane ClipPlanes ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the new presentation of the structures displayed in this view with the type Graphic3d_TOS_COMPUTED.

	:rtype: None
") Compute;
		void Compute ();
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "	* Returns the computed HLR mode state

	:rtype: bool
") ComputedMode;
		Standard_Boolean ComputedMode ();
		%feature("compactdefaultargs") ConsiderZoomPersistenceObjects;
		%feature("autodoc", "	* Returns zoom-scale factor.

	:rtype: float
") ConsiderZoomPersistenceObjects;
		Standard_Real ConsiderZoomPersistenceObjects ();
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if one of the structures displayed in the view contains Polygons, Triangles or Quadrangles.

	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet ();
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "	* Returns Standard_True if one of the structures in the set contains Polygons, Triangles or Quadrangles.

	:param theSet:
	:type theSet: Graphic3d_MapOfStructure &
	:rtype: bool
") ContainsFacet;
		Standard_Boolean ContainsFacet (const Graphic3d_MapOfStructure & theSet);
		%feature("compactdefaultargs") CopySettings;
		%feature("autodoc", "	* Copy visualization settings from another view. Method is used for cloning views in viewer when its required to create view with same view properties.

	:param theOther:
	:type theOther: Handle_Graphic3d_CView &
	:rtype: void
") CopySettings;
		virtual void CopySettings (const Handle_Graphic3d_CView & theOther);
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "	* Deactivates the view. Unmaps presentations defined within structure manager. The view in deactivated state will ignore actions on structures such as Display().

	:rtype: void
") Deactivate;
		virtual void Deactivate ();
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "	* Fill in the dictionary with diagnostic info. Should be called within rendering thread. //! This API should be used only for user output or for creating automated reports. The format of returned information (e.g. key-value layout) is NOT part of this API and can be changed at any time. Thus application should not parse returned information to weed out specific parameters.

	:param theDict:
	:type theDict: TColStd_IndexedDataMapOfStringString &
	:param theFlags:
	:type theFlags: Graphic3d_DiagnosticInfo
	:rtype: None
") DiagnosticInformation;
		void DiagnosticInformation (TColStd_IndexedDataMapOfStringString & theDict,Graphic3d_DiagnosticInfo theFlags);
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "	* Returns the set of structures displayed in this view.

	:param theStructures:
	:type theStructures: Graphic3d_MapOfStructure &
	:rtype: None
") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & theStructures);
		%feature("compactdefaultargs") Export;
		%feature("autodoc", "	* Export scene into the one of the Vector graphics formats (SVG, PS, PDF...). In contrast to Bitmaps, Vector graphics is scalable (so you may got quality benefits on printing to laser printer). Notice however that results may differ a lot and do not contain some elements.

	:param theFileName:
	:type theFileName: char *
	:param theFormat:
	:type theFormat: Graphic3d_ExportFormat
	:param theSortType: default value is Graphic3d_ST_BSP_Tree
	:type theSortType: Graphic3d_SortType
	:rtype: bool
") Export;
		Standard_Boolean Export (const char * theFileName,const Graphic3d_ExportFormat theFormat,const Graphic3d_SortType theSortType = Graphic3d_ST_BSP_Tree);
		%feature("compactdefaultargs") FBO;
		%feature("autodoc", "	* Returns pointer to an assigned framebuffer object.

	:rtype: Handle_Standard_Transient
") FBO;
		Handle_Standard_Transient FBO ();
		%feature("compactdefaultargs") FBOChangeViewport;
		%feature("autodoc", "	* Change offscreen FBO viewport.

	:param theFbo:
	:type theFbo: Handle_Standard_Transient &
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None
") FBOChangeViewport;
		void FBOChangeViewport (const Handle_Standard_Transient & theFbo,const Standard_Integer theWidth,const Standard_Integer theHeight);
		%feature("compactdefaultargs") FBOCreate;
		%feature("autodoc", "	* Generate offscreen FBO in the graphic library. If not supported on hardware returns NULL.

	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: Handle_Standard_Transient
") FBOCreate;
		Handle_Standard_Transient FBOCreate (const Standard_Integer theWidth,const Standard_Integer theHeight);
		%feature("compactdefaultargs") FBOGetDimensions;
		%feature("autodoc", "	* Read offscreen FBO configuration.

	:param theFbo:
	:type theFbo: Handle_Standard_Transient &
	:param theWidth:
	:type theWidth: int &
	:param theHeight:
	:type theHeight: int &
	:param theWidthMax:
	:type theWidthMax: int &
	:param theHeightMax:
	:type theHeightMax: int &
	:rtype: None
") FBOGetDimensions;
		void FBOGetDimensions (const Handle_Standard_Transient & theFbo,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") FBORelease;
		%feature("autodoc", "	* Remove offscreen FBO from the graphic library

	:param theFbo:
	:type theFbo: Handle_Standard_Transient &
	:rtype: None
") FBORelease;
		void FBORelease (Handle_Standard_Transient & theFbo);
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "	* Returns data of a graduated trihedron

	:rtype: Graphic3d_GraduatedTrihedron
") GetGraduatedTrihedron;
		const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron ();
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* Returns gradient background fill colors.

	:rtype: Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "	* Displays Graduated Trihedron.

	:param theTrihedronData:
	:type theTrihedronData: Graphic3d_GraduatedTrihedron &
	:rtype: None
") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const Graphic3d_GraduatedTrihedron & theTrihedronData);
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "	* Erases Graduated Trihedron.

	:rtype: None
") GraduatedTrihedronErase;
		void GraduatedTrihedronErase ();
		%feature("compactdefaultargs") GraduatedTrihedronMinMaxValues;
		%feature("autodoc", "	* Sets minimum and maximum points of scene bounding box for Graduated Trihedron stored in graphic view object. @param theMin [in] the minimum point of scene. @param theMax [in] the maximum point of scene.

	:param theMin:
	:type theMin: Graphic3d_Vec3
	:param theMax:
	:type theMax: Graphic3d_Vec3
	:rtype: None
") GraduatedTrihedronMinMaxValues;
		void GraduatedTrihedronMinMaxValues (const Graphic3d_Vec3 theMin,const Graphic3d_Vec3 theMax);
		%feature("compactdefaultargs") HiddenObjects;
		%feature("autodoc", "	* Returns map of objects hidden within this specific view (not viewer-wise).

	:rtype: Handle_Graphic3d_NMapOfTransient
") HiddenObjects;
		Handle_Graphic3d_NMapOfTransient HiddenObjects ();
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	* Returns the identification number of the view.

	:rtype: int
") Identification;
		Standard_Integer Identification ();
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Invalidates content of the view but does not redraw it.

	:rtype: None
") Invalidate;
		void Invalidate ();
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "	* Marks BVH tree and the set of BVH primitives of correspondent priority list with id theLayerId as outdated.

	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") InvalidateBVHData;
		void InvalidateBVHData (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") InvalidateZLayerBoundingBox;
		%feature("autodoc", "	* Returns the bounding box of all structures displayed in the Z layer.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") InvalidateZLayerBoundingBox;
		void InvalidateZLayerBoundingBox (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	* Returns the activity flag of the view.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("compactdefaultargs") IsComputed;
		%feature("autodoc", "	* Returns Standard_True in case if the structure with the given <theStructId> is in list of structures to be computed and stores computed struct to <theComputedStruct>.

	:param theStructId:
	:type theStructId: int
	:param theComputedStruct:
	:type theComputedStruct: Handle_Graphic3d_Structure &
	:rtype: bool
") IsComputed;
		Standard_Boolean IsComputed (const Standard_Integer theStructId,Handle_Graphic3d_Structure & theComputedStruct);
		%feature("compactdefaultargs") IsCullingEnabled;
		%feature("autodoc", "	* Returns the state of frustum culling optimization.

	:rtype: bool
") IsCullingEnabled;
		Standard_Boolean IsCullingEnabled ();
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "	* Returns True if the window associated to the view is defined.

	:rtype: bool
") IsDefined;
		Standard_Boolean IsDefined ();
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "	* Return true if view content cache has been invalidated.

	:rtype: bool
") IsInvalidated;
		Standard_Boolean IsInvalidated ();
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "	* Returns true if the view was removed.

	:rtype: bool
") IsRemoved;
		Standard_Boolean IsRemoved ();
		%feature("compactdefaultargs") Lights;
		%feature("autodoc", "	* Returns list of lights of the view.

	:rtype: Graphic3d_ListOfCLight
") Lights;
		const Graphic3d_ListOfCLight & Lights ();
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the bounding box of all structures displayed in the view. If theToIncludeAuxiliary is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite and other auxiliary structures. @param theToIncludeAuxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) returns computed bounding box

	:param theToIncludeAuxiliary: default value is Standard_False
	:type theToIncludeAuxiliary: bool
	:rtype: Bnd_Box
") MinMaxValues;
		virtual Bnd_Box MinMaxValues (const Standard_Boolean theToIncludeAuxiliary = Standard_False);
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "	* Returns the coordinates of the boundary box of all structures in the set <theSet>. If <theToIgnoreInfiniteFlag> is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite structures.

	:param theSet:
	:type theSet: Graphic3d_MapOfStructure &
	:param theToIncludeAuxiliary: default value is Standard_False
	:type theToIncludeAuxiliary: bool
	:rtype: Bnd_Box
") MinMaxValues;
		Bnd_Box MinMaxValues (const Graphic3d_MapOfStructure & theSet,const Standard_Boolean theToIncludeAuxiliary = Standard_False);
		%feature("compactdefaultargs") NumberOfDisplayedStructures;
		%feature("autodoc", "	* Returns number of displayed structures in the view.

	:rtype: int
") NumberOfDisplayedStructures;
		Standard_Integer NumberOfDisplayedStructures ();
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "	* Computes the new presentation of the structure displayed in this view with the type Graphic3d_TOS_COMPUTED.

	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: None
") ReCompute;
		void ReCompute (const Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redraw content of the view.

	:rtype: None
") Redraw;
		void Redraw ();
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Redraw immediate content of the view.

	:rtype: None
") RedrawImmediate;
		void RedrawImmediate ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Erases the view and removes from graphic driver. No more graphic operations are allowed in this view after the call.

	:rtype: void
") Remove;
		virtual void Remove ();
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer from the specified view. All structures displayed at the moment in layer will be displayed in default layer ( the bottom-level z layer ). To unset layer ID from associated structures use method UnsetZLayer (...).

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") RemoveZLayer;
		void RemoveZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "	* Returns current rendering parameters and effect settings.

	:rtype: Graphic3d_RenderingParams
") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams ();
		%feature("compactdefaultargs") Resized;
		%feature("autodoc", "	* Handle changing size of the rendering window.

	:rtype: None
") Resized;
		void Resized ();
		%feature("compactdefaultargs") SetBackfacingModel;
		%feature("autodoc", "	* Sets backfacing model for the view.

	:param theModel:
	:type theModel: Graphic3d_TypeOfBackfacingModel
	:rtype: None
") SetBackfacingModel;
		void SetBackfacingModel (const Graphic3d_TypeOfBackfacingModel theModel);
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "	* Sets background fill color.

	:param theBackground:
	:type theBackground: Aspect_Background &
	:rtype: None
") SetBackground;
		void SetBackground (const Aspect_Background & theBackground);
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "	* Sets background image texture file path.

	:param theFilePath:
	:type theFilePath: TCollection_AsciiString &
	:rtype: None
") SetBackgroundImage;
		void SetBackgroundImage (const TCollection_AsciiString & theFilePath);
		%feature("compactdefaultargs") SetBackgroundImageStyle;
		%feature("autodoc", "	* Sets background image fill style.

	:param theFillStyle:
	:type theFillStyle: Aspect_FillMethod
	:rtype: None
") SetBackgroundImageStyle;
		void SetBackgroundImageStyle (const Aspect_FillMethod theFillStyle);
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	* Sets camera used by the view.

	:param theCamera:
	:type theCamera: Handle_Graphic3d_Camera &
	:rtype: None
") SetCamera;
		void SetCamera (const Handle_Graphic3d_Camera & theCamera);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Sets list of clip planes for the view.

	:param thePlanes:
	:type thePlanes: Handle_Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Handle_Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "	* Switches computed HLR mode in the view

	:param theMode:
	:type theMode: bool
	:rtype: None
") SetComputedMode;
		void SetComputedMode (const Standard_Boolean theMode);
		%feature("compactdefaultargs") SetCullingEnabled;
		%feature("autodoc", "	* Enables or disables frustum culling optimization.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None
") SetCullingEnabled;
		void SetCullingEnabled (const Standard_Boolean theIsEnabled);
		%feature("compactdefaultargs") SetFBO;
		%feature("autodoc", "	* Sets framebuffer object for offscreen rendering.

	:param theFbo:
	:type theFbo: Handle_Standard_Transient &
	:rtype: None
") SetFBO;
		void SetFBO (const Handle_Standard_Transient & theFbo);
		%feature("compactdefaultargs") SetGradientBackground;
		%feature("autodoc", "	* Sets gradient background fill colors.

	:param theBackground:
	:type theBackground: Aspect_GradientBackground &
	:rtype: None
") SetGradientBackground;
		void SetGradientBackground (const Aspect_GradientBackground & theBackground);
		%feature("compactdefaultargs") SetImmediateModeDrawToFront;
		%feature("autodoc", "	* @param theDrawToFrontBuffer Advanced option to modify rendering mode: 1. True. Drawing immediate mode structures directly to the front buffer over the scene image. Fast, so preferred for interactive work (used by default). However these extra drawings will be missed in image dump since it is performed from back buffer. Notice that since no pre-buffering used the V-Sync will be ignored and rendering could be seen in run-time (in case of slow hardware) and/or tearing may appear. So this is strongly recommended to draw only simple (fast) structures. 2. False. Drawing immediate mode structures to the back buffer. The complete scene is redrawn first, so this mode is slower if scene contains complex data and/or V-Sync is turned on. But it works in any case and is especially useful for view dump because the dump image is read from the back buffer. returns previous mode.

	:param theDrawToFrontBuffer:
	:type theDrawToFrontBuffer: bool
	:rtype: bool
") SetImmediateModeDrawToFront;
		Standard_Boolean SetImmediateModeDrawToFront (const Standard_Boolean theDrawToFrontBuffer);
		%feature("compactdefaultargs") SetLights;
		%feature("autodoc", "	* Sets list of lights for the view.

	:param theLights:
	:type theLights: Graphic3d_ListOfCLight &
	:rtype: None
") SetLights;
		void SetLights (const Graphic3d_ListOfCLight & theLights);
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "	* Sets shading model of the view.

	:param theModel:
	:type theModel: Graphic3d_TypeOfShadingModel
	:rtype: None
") SetShadingModel;
		void SetShadingModel (const Graphic3d_TypeOfShadingModel theModel);
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "	* Sets environment texture for the view.

	:param theTextureEnv:
	:type theTextureEnv: Handle_Graphic3d_TextureEnv &
	:rtype: None
") SetTextureEnv;
		void SetTextureEnv (const Handle_Graphic3d_TextureEnv & theTextureEnv);
		%feature("compactdefaultargs") SetVisualizationType;
		%feature("autodoc", "	* Sets visualization type of the view.

	:param theType:
	:type theType: Graphic3d_TypeOfVisualization
	:rtype: None
") SetVisualizationType;
		void SetVisualizationType (const Graphic3d_TypeOfVisualization theType);
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Creates and maps rendering window to the view. @param theWindow [in] the window. @param theContext [in] the rendering context. If NULL the context will be created internally.

	:param theWindow:
	:type theWindow: Handle_Aspect_Window &
	:param theContext: default value is NULL
	:type theContext: Aspect_RenderingContext
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & theWindow,const Aspect_RenderingContext theContext = NULL);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer of specified view.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings &
	:rtype: None
") SetZLayerSettings;
		void SetZLayerSettings (const Graphic3d_ZLayerId theLayerId,const Graphic3d_ZLayerSettings & theSettings);
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "	* Returns shading model of the view.

	:rtype: Graphic3d_TypeOfShadingModel
") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel ();
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "	* Returns the structure manager handle which manage structures associated with this view.

	:rtype: Handle_Graphic3d_StructureManager
") StructureManager;
		Handle_Graphic3d_StructureManager StructureManager ();
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "	* Returns environment texture set for the view.

	:rtype: Handle_Graphic3d_TextureEnv
") TextureEnv;
		Handle_Graphic3d_TextureEnv TextureEnv ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Invalidates bounding box of specified ZLayerId.

	:param theLayerId: default value is Graphic3d_ZLayerId_UNKNOWN
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: None
") Update;
		void Update (const Graphic3d_ZLayerId theLayerId = Graphic3d_ZLayerId_UNKNOWN);
		%feature("compactdefaultargs") VisualizationType;
		%feature("autodoc", "	* Returns visualization type of the view.

	:rtype: Graphic3d_TypeOfVisualization
") VisualizationType;
		Graphic3d_TypeOfVisualization VisualizationType ();
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "	* Returns the window associated to the view.

	:rtype: Handle_Aspect_Window
") Window;
		Handle_Aspect_Window Window ();
		%feature("compactdefaultargs") ZLayerBoundingBox;
		%feature("autodoc", "	* Returns the bounding box of all structures displayed in the Z layer. @param theLayerId layer identifier @param theCamera camera definition @param theWindowWidth viewport width (for applying transformation-persistence) @param theWindowHeight viewport height (for applying transformation-persistence) @param theToIncludeAuxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) returns computed bounding box

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:param theCamera:
	:type theCamera: Handle_Graphic3d_Camera &
	:param theWindowWidth:
	:type theWindowWidth: int
	:param theWindowHeight:
	:type theWindowHeight: int
	:param theToIncludeAuxiliary:
	:type theToIncludeAuxiliary: bool
	:rtype: Bnd_Box
") ZLayerBoundingBox;
		Bnd_Box ZLayerBoundingBox (const Graphic3d_ZLayerId theLayerId,const Handle_Graphic3d_Camera & theCamera,const Standard_Integer theWindowWidth,const Standard_Integer theWindowHeight,const Standard_Boolean theToIncludeAuxiliary);
		%feature("compactdefaultargs") ZLayerMax;
		%feature("autodoc", "	* Returns the maximum Z layer ID. First layer ID is Graphic3d_ZLayerId_Default, last ID is ZLayerMax().

	:rtype: int
") ZLayerMax;
		Standard_Integer ZLayerMax ();
};


%make_alias(Graphic3d_CView)

%extend Graphic3d_CView {
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
	:type thePixMap: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const Handle_Image_PixMap & thePixMap);
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


%make_alias(Graphic3d_TextureEnv)

%extend Graphic3d_TextureEnv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_TextureMap;
class Graphic3d_TextureMap : public Graphic3d_TextureRoot {
	public:
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "	* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.

	:rtype: Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();
		%feature("compactdefaultargs") DisableModulate;
		%feature("autodoc", "	* disable texture modulate mode. the image is directly decal on the surface.

	:rtype: None
") DisableModulate;
		void DisableModulate ();
		%feature("compactdefaultargs") DisableRepeat;
		%feature("autodoc", "	* use this methods if you want to disable texture repetition on your objects.

	:rtype: None
") DisableRepeat;
		void DisableRepeat ();
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
		%feature("compactdefaultargs") EnableRepeat;
		%feature("autodoc", "	* use this methods if you want to enable texture repetition on your objects.

	:rtype: None
") EnableRepeat;
		void EnableRepeat ();
		%feature("compactdefaultargs") EnableSmooth;
		%feature("autodoc", "	* enable texture smoothing

	:rtype: None
") EnableSmooth;
		void EnableSmooth ();
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "	* Returns True if the texture is modulate.

	:rtype: bool
") IsModulate;
		Standard_Boolean IsModulate ();
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "	* Returns True if the texture repeat is enable.

	:rtype: bool
") IsRepeat;
		Standard_Boolean IsRepeat ();
		%feature("compactdefaultargs") IsSmoothed;
		%feature("autodoc", "	* Returns True if the texture is smoothed.

	:rtype: bool
") IsSmoothed;
		Standard_Boolean IsSmoothed ();
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "	* @param theLevel level of anisontropy texture filter.

	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None
") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);
};


%make_alias(Graphic3d_TextureMap)

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


%make_alias(Graphic3d_Texture1D)

%extend Graphic3d_Texture1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture2D;
class Graphic3d_Texture2D : public Graphic3d_TextureMap {
	public:
		%feature("compactdefaultargs") HasMipMaps;
		%feature("autodoc", "	* Return true if mip-maps should be used.

	:rtype: bool
") HasMipMaps;
		Standard_Boolean HasMipMaps ();
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
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "	* Assign new image to the texture. Note that this method does not invalidate already uploaded resources - consider calling ::UpdateRevision() if needed.

	:param thePixMap:
	:type thePixMap: Handle_Image_PixMap &
	:rtype: None
") SetImage;
		void SetImage (const Handle_Image_PixMap & thePixMap);
		%feature("compactdefaultargs") SetMipMaps;
		%feature("autodoc", "	* Set if mip-maps should be used (generated if needed). Note that this method should be called before loading / using the texture.

	:param theToUse:
	:type theToUse: bool
	:rtype: None
") SetMipMaps;
		void SetMipMaps (const Standard_Boolean theToUse);
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "	* Returns the name of the predefined texture of rank <aRank>

	:param theRank:
	:type theRank: int
	:rtype: TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);
};


%make_alias(Graphic3d_Texture2D)

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
	:type thePixMap: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Handle_Image_PixMap & thePixMap);
};


%make_alias(Graphic3d_Texture1Dmanual)

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
	:type thePixMap: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Handle_Image_PixMap & thePixMap);
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
};


%make_alias(Graphic3d_Texture1Dsegment)

%extend Graphic3d_Texture1Dsegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Graphic3d_Texture2Dmanual;
class Graphic3d_Texture2Dmanual : public Graphic3d_Texture2D {
	public:
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from a file. MipMaps levels will be automatically generated if needed.

	:param theFileName:
	:type theFileName: TCollection_AsciiString &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const TCollection_AsciiString & theFileName);
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from a predefined texture name set. MipMaps levels will be automatically generated if needed.

	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Graphic3d_NameOfTexture2D theNOT);
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "	* Creates a texture from the pixmap. MipMaps levels will be automatically generated if needed.

	:param thePixMap:
	:type thePixMap: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Handle_Image_PixMap & thePixMap);
};


%make_alias(Graphic3d_Texture2Dmanual)

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
	:type thePixMap: Handle_Image_PixMap &
	:rtype: None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Handle_Image_PixMap & thePixMap);
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
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* Returns the current texture rotation angle

	:param theVal:
	:type theVal: Standard_ShortReal &
	:rtype: None
") Rotation;
		void Rotation (Standard_ShortReal & theVal);
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
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Defines the texture projection plane for both S and T texture coordinate default is NOTP_XY meaning: <1.0, 0.0, 0.0, 0.0> for S and <0.0, 1.0, 0.0, 0.0> for T

	:param thePlane:
	:type thePlane: Graphic3d_NameOfTexturePlane
	:rtype: None
") SetPlane;
		void SetPlane (const Graphic3d_NameOfTexturePlane thePlane);
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
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "	* Sets the rotation angle of the whole texture. the same result might be achieved by recomputing the S and T plane equation but it's not the easiest way... the angle is expressed in degrees default is 0.0

	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None
") SetRotation;
		void SetRotation (const Standard_ShortReal theVal);
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
};


%make_alias(Graphic3d_Texture2Dplane)

%extend Graphic3d_Texture2Dplane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
