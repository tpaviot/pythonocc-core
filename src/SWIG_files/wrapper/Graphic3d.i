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
"Graphic3d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_graphic3d.html"
%enddef
%module (package="OCC.Core", docstring=GRAPHIC3DDOCSTRING) Graphic3d


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
#include<Graphic3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BVH_module.hxx>
#include<Quantity_module.hxx>
#include<gp_module.hxx>
#include<Aspect_module.hxx>
#include<TCollection_module.hxx>
#include<Geom_module.hxx>
#include<Bnd_module.hxx>
#include<TColStd_module.hxx>
#include<Image_module.hxx>
#include<OSD_module.hxx>
#include<TShort_module.hxx>
#include<TColQuantity_module.hxx>
#include<BVH_module.hxx>
#include<TopTools_module.hxx>
#include<SelectMgr_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
#include<V3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BVH.i
%import Quantity.i
%import gp.i
%import Aspect.i
%import TCollection.i
%import Geom.i
%import Bnd.i
%import TColStd.i
%import Image.i
%import OSD.i

%define Handle_Graphic3d_TextureSet Handle(Graphic3d_TextureSet)
%enddef
%define Handle_Aspect_DisplayConnection Handle(Aspect_DisplayConnection)
%enddef
%define Handle_Graphic3d_NMapOfTransient Handle(Graphic3d_NMapOfTransient)
%enddef
/* public enums */
enum Graphic3d_ClipState {
	Graphic3d_ClipState_Out = 0,
	Graphic3d_ClipState_In = 1,
	Graphic3d_ClipState_On = 2,
};

enum Graphic3d_BufferType {
	Graphic3d_BT_RGB = 0,
	Graphic3d_BT_RGBA = 1,
	Graphic3d_BT_Depth = 2,
	Graphic3d_BT_RGB_RayTraceHdrLeft = 3,
};

enum Graphic3d_FrameStatsTimer {
	Graphic3d_FrameStatsTimer_ElapsedFrame = 0,
	Graphic3d_FrameStatsTimer_CpuFrame = 1,
	Graphic3d_FrameStatsTimer_CpuCulling = 2,
	Graphic3d_FrameStatsTimer_CpuPicking = 3,
	Graphic3d_FrameStatsTimer_CpuDynamics = 4,
};

enum  {
	Graphic3d_FrameStatsTimer_NB = Graphic3d_FrameStatsTimer_CpuDynamics + 1,
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
	Graphic3d_TypeOfLimit_MaxViewDumpSizeX = 4,
	Graphic3d_TypeOfLimit_MaxViewDumpSizeY = 5,
	Graphic3d_TypeOfLimit_MaxCombinedTextureUnits = 6,
	Graphic3d_TypeOfLimit_MaxMsaa = 7,
	Graphic3d_TypeOfLimit_HasRayTracing = 8,
	Graphic3d_TypeOfLimit_HasRayTracingTextures = 9,
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling = 10,
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic = 11,
	Graphic3d_TypeOfLimit_HasBlendedOit = 12,
	Graphic3d_TypeOfLimit_HasBlendedOitMsaa = 13,
	Graphic3d_TypeOfLimit_HasFlatShading = 14,
	Graphic3d_TypeOfLimit_HasMeshEdges = 15,
	Graphic3d_TypeOfLimit_IsWorkaroundFBO = 16,
	Graphic3d_TypeOfLimit_NB = 17,
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

enum Graphic3d_AlphaMode {
	Graphic3d_AlphaMode_Opaque = 0,
	Graphic3d_AlphaMode_Mask = 1,
	Graphic3d_AlphaMode_Blend = 2,
	Graphic3d_AlphaMode_BlendAuto = - 1,
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

enum Graphic3d_FrameStatsCounter {
	Graphic3d_FrameStatsCounter_NbLayers = 0,
	Graphic3d_FrameStatsCounter_NbLayersNotCulled = 1,
	Graphic3d_FrameStatsCounter_NbStructs = 2,
	Graphic3d_FrameStatsCounter_NbStructsNotCulled = 3,
	Graphic3d_FrameStatsCounter_NbGroupsNotCulled = 4,
	Graphic3d_FrameStatsCounter_NbElemsNotCulled = 5,
	Graphic3d_FrameStatsCounter_NbElemsFillNotCulled = 6,
	Graphic3d_FrameStatsCounter_NbElemsLineNotCulled = 7,
	Graphic3d_FrameStatsCounter_NbElemsPointNotCulled = 8,
	Graphic3d_FrameStatsCounter_NbElemsTextNotCulled = 9,
	Graphic3d_FrameStatsCounter_NbTrianglesNotCulled = 10,
	Graphic3d_FrameStatsCounter_NbPointsNotCulled = 11,
	Graphic3d_FrameStatsCounter_EstimatedBytesGeom = 12,
	Graphic3d_FrameStatsCounter_EstimatedBytesFbos = 13,
	Graphic3d_FrameStatsCounter_EstimatedBytesTextures = 14,
};

enum  {
	Graphic3d_FrameStatsCounter_NB = Graphic3d_FrameStatsCounter_EstimatedBytesTextures + 1,
};

enum Graphic3d_TypeOfBackground {
	Graphic3d_TOB_NONE = - 1,
	Graphic3d_TOB_GRADIENT = 1,
	Graphic3d_TOB_TEXTURE = 2,
	Graphic3d_TOB_CUBEMAP = 3,
};

enum  {
	Graphic3d_TypeOfBackground_NB = Graphic3d_TOB_CUBEMAP + 1,
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
	Graphic3d_TOS_VERTEX = 1,
	Graphic3d_TOS_TESS_CONTROL = 2,
	Graphic3d_TOS_TESS_EVALUATION = 4,
	Graphic3d_TOS_GEOMETRY = 8,
	Graphic3d_TOS_FRAGMENT = 16,
	Graphic3d_TOS_COMPUTE = 32,
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
	Graphic3d_TOSM_DEFAULT = - 1,
	Graphic3d_TOSM_UNLIT = 0,
	Graphic3d_TOSM_FACET = 1,
	Graphic3d_TOSM_VERTEX = 2,
	Graphic3d_TOSM_FRAGMENT = 3,
	Graphic3d_TOSM_NONE = Graphic3d_TOSM_UNLIT,
	V3d_COLOR = Graphic3d_TOSM_NONE,
	V3d_FLAT = Graphic3d_TOSM_FACET,
	V3d_GOURAUD = Graphic3d_TOSM_VERTEX,
	V3d_PHONG = Graphic3d_TOSM_FRAGMENT,
};

enum  {
	Graphic3d_TypeOfShadingModel_NB = Graphic3d_TOSM_FRAGMENT + 1,
};

enum Graphic3d_TypeOfPrimitiveArray {
	Graphic3d_TOPA_UNDEFINED = 0,
	Graphic3d_TOPA_POINTS = 1,
	Graphic3d_TOPA_SEGMENTS = 2,
	Graphic3d_TOPA_POLYLINES = 3,
	Graphic3d_TOPA_TRIANGLES = 4,
	Graphic3d_TOPA_TRIANGLESTRIPS = 5,
	Graphic3d_TOPA_TRIANGLEFANS = 6,
	Graphic3d_TOPA_LINES_ADJACENCY = 7,
	Graphic3d_TOPA_LINE_STRIP_ADJACENCY = 8,
	Graphic3d_TOPA_TRIANGLES_ADJACENCY = 9,
	Graphic3d_TOPA_TRIANGLE_STRIP_ADJACENCY = 10,
	Graphic3d_TOPA_QUADRANGLES = 11,
	Graphic3d_TOPA_QUADRANGLESTRIPS = 12,
	Graphic3d_TOPA_POLYGONS = 13,
};

enum Graphic3d_ToneMappingMethod {
	Graphic3d_ToneMappingMethod_Disabled = 0,
	Graphic3d_ToneMappingMethod_Filmic = 1,
};

enum Graphic3d_TypeOfTexture {
	Graphic3d_TOT_1D = 0,
	Graphic3d_TOT_2D = 1,
	Graphic3d_TOT_2D_MIPMAP = 2,
	Graphic3d_TOT_CUBEMAP = 3,
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

enum  {
	Graphic3d_ArrayFlags_None = 0,
	Graphic3d_ArrayFlags_VertexNormal = 1,
	Graphic3d_ArrayFlags_VertexColor = 2,
	Graphic3d_ArrayFlags_VertexTexel = 4,
	Graphic3d_ArrayFlags_BoundColor = 16,
	Graphic3d_ArrayFlags_AttribsMutable = 32,
	Graphic3d_ArrayFlags_AttribsDeinterleaved = 64,
	Graphic3d_ArrayFlags_IndexesMutable = 128,
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
	Graphic3d_TextureUnit_EnvMap = Graphic3d_TextureUnit_0,
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

enum Graphic3d_CubeMapSide {
	Graphic3d_CMS_POS_X = 0,
	Graphic3d_CMS_NEG_X = 1,
	Graphic3d_CMS_POS_Y = 2,
	Graphic3d_CMS_NEG_Y = 3,
	Graphic3d_CMS_POS_Z = 4,
	Graphic3d_CMS_NEG_Z = 5,
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
	V3d_AMBIENT = Graphic3d_TOLS_AMBIENT,
	V3d_DIRECTIONAL = Graphic3d_TOLS_DIRECTIONAL,
	V3d_POSITIONAL = Graphic3d_TOLS_POSITIONAL,
	V3d_SPOT = Graphic3d_TOLS_SPOT,
};

enum  {
	Graphic3d_TypeOfLightSource_NB = Graphic3d_TOLS_SPOT + 1,
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

/* handles */
%wrap_handle(Graphic3d_ArrayOfPrimitives)
%wrap_handle(Graphic3d_Aspects)
%wrap_handle(Graphic3d_BoundBuffer)
%wrap_handle(Graphic3d_CLight)
%wrap_handle(Graphic3d_CStructure)
%wrap_handle(Graphic3d_Camera)
%wrap_handle(Graphic3d_ClipPlane)
%wrap_handle(Graphic3d_DataStructureManager)
%wrap_handle(Graphic3d_FrameStats)
%wrap_handle(Graphic3d_GraphicDriver)
%wrap_handle(Graphic3d_Group)
%wrap_handle(Graphic3d_HatchStyle)
%wrap_handle(Graphic3d_Layer)
%wrap_handle(Graphic3d_LightSet)
%wrap_handle(Graphic3d_MarkerImage)
%wrap_handle(Graphic3d_PresentationAttributes)
%wrap_handle(Graphic3d_SequenceOfHClipPlane)
%wrap_handle(Graphic3d_ShaderAttribute)
%wrap_handle(Graphic3d_ShaderObject)
%wrap_handle(Graphic3d_ShaderProgram)
%wrap_handle(Graphic3d_ShaderVariable)
%wrap_handle(Graphic3d_Structure)
%wrap_handle(Graphic3d_StructureManager)
%wrap_handle(Graphic3d_Text)
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
%wrap_handle(Graphic3d_AspectFillArea3d)
%wrap_handle(Graphic3d_AspectLine3d)
%wrap_handle(Graphic3d_AspectMarker3d)
%wrap_handle(Graphic3d_AspectText3d)
%wrap_handle(Graphic3d_CView)
%wrap_handle(Graphic3d_MediaTextureSet)
%wrap_handle(Graphic3d_TextureEnv)
%wrap_handle(Graphic3d_TextureMap)
%wrap_handle(Graphic3d_CubeMap)
%wrap_handle(Graphic3d_Texture1D)
%wrap_handle(Graphic3d_Texture2D)
%wrap_handle(Graphic3d_CubeMapSeparate)
%wrap_handle(Graphic3d_MediaTexture)
%wrap_handle(Graphic3d_Texture1Dmanual)
%wrap_handle(Graphic3d_Texture1Dsegment)
%wrap_handle(Graphic3d_Texture2Dmanual)
%wrap_handle(Graphic3d_Texture2Dplane)
/* end handles declaration */

/* templates */
%template(Graphic3d_IndexedMapOfStructure) NCollection_IndexedMap <const Graphic3d_CStructure *>;
%template(Graphic3d_ArrayOfIndexedMapOfStructure) NCollection_Array1 <Graphic3d_IndexedMapOfStructure>;

%extend NCollection_Array1 <Graphic3d_IndexedMapOfStructure> {
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
%template(Graphic3d_CameraLerp) NCollection_Lerp <opencascade::handle <Graphic3d_Camera>>;
%template(Graphic3d_SequenceOfGroup) NCollection_Sequence <opencascade::handle <Graphic3d_Group>>;
%template(Graphic3d_Mat4) NCollection_Mat4 <Standard_ShortReal>;
%template(Graphic3d_IndexedMapOfView) NCollection_IndexedMap <Graphic3d_CView *>;
%template(Graphic3d_BndBox4f) BVH_Box <Standard_ShortReal , 4>;
%template(Graphic3d_SequenceOfStructure) NCollection_Sequence <opencascade::handle <Graphic3d_Structure>>;
%template(Graphic3d_Vec2) NCollection_Vec2 <Standard_ShortReal>;
%template(Graphic3d_Vec2d) NCollection_Vec2 <Standard_Real>;
%template(Graphic3d_Vec2i) NCollection_Vec2 <Standard_Integer>;
%template(Graphic3d_Vec2ub) NCollection_Vec2 <Standard_Byte>;
%template(Graphic3d_Vec2b) NCollection_Vec2 <Standard_Character>;
%template(Graphic3d_ShaderObjectList) NCollection_Sequence <opencascade::handle <Graphic3d_ShaderObject>>;
%template(Graphic3d_ShaderVariableList) NCollection_Sequence <opencascade::handle <Graphic3d_ShaderVariable>>;
%template(Graphic3d_ShaderAttributeList) NCollection_Sequence <opencascade::handle <Graphic3d_ShaderAttribute>>;
%template(Graphic3d_MapOfAspectsToAspects) NCollection_DataMap <opencascade::handle <Graphic3d_Aspects>, opencascade::handle <Graphic3d_Aspects>>;
%template(Graphic3d_Vec4) NCollection_Vec4 <Standard_ShortReal>;
%template(Graphic3d_Vec4d) NCollection_Vec4 <Standard_Real>;
%template(Graphic3d_Vec4i) NCollection_Vec4 <Standard_Integer>;
%template(Graphic3d_Vec4ub) NCollection_Vec4 <Standard_Byte>;
%template(Graphic3d_Vec4b) NCollection_Vec4 <Standard_Character>;
%template(Graphic3d_BndBox4d) BVH_Box <Standard_Real , 4>;
%template(Graphic3d_MapOfStructure) NCollection_Map <opencascade::handle <Graphic3d_Structure>>;
%template(Graphic3d_Vec3) NCollection_Vec3 <Standard_ShortReal>;
%template(Graphic3d_Vec3d) NCollection_Vec3 <Standard_Real>;
%template(Graphic3d_Vec3i) NCollection_Vec3 <Standard_Integer>;
%template(Graphic3d_Vec3ub) NCollection_Vec3 <Standard_Byte>;
%template(Graphic3d_Vec3b) NCollection_Vec3 <Standard_Character>;
%template(Graphic3d_MapOfZLayerSettings) NCollection_DataMap <Graphic3d_ZLayerId , Graphic3d_ZLayerSettings>;
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
typedef NCollection_IndexedMap <const Graphic3d_CStructure *> Graphic3d_IndexedMapOfStructure;
typedef NCollection_Array1 <Graphic3d_IndexedMapOfStructure> Graphic3d_ArrayOfIndexedMapOfStructure;
typedef Graphic3d_MapOfStructure::Iterator Graphic3d_MapIteratorOfMapOfStructure;
typedef NCollection_Lerp <opencascade::handle <Graphic3d_Camera>> Graphic3d_CameraLerp;
typedef NCollection_Sequence <opencascade::handle <Graphic3d_Group>> Graphic3d_SequenceOfGroup;
typedef NCollection_Mat4 <Standard_ShortReal> Graphic3d_Mat4;
typedef NCollection_IndexedMap <Graphic3d_CView *> Graphic3d_IndexedMapOfView;
typedef BVH_Box <Standard_ShortReal , 4> Graphic3d_BndBox4f;
typedef NCollection_Sequence <opencascade::handle <Graphic3d_Structure>> Graphic3d_SequenceOfStructure;
typedef NCollection_Vec2 <Standard_ShortReal> Graphic3d_Vec2;
typedef NCollection_Vec2 <Standard_Real> Graphic3d_Vec2d;
typedef NCollection_Vec2 <Standard_Integer> Graphic3d_Vec2i;
typedef NCollection_Vec2 <Standard_Byte> Graphic3d_Vec2ub;
typedef NCollection_Vec2 <Standard_Character> Graphic3d_Vec2b;
typedef NCollection_Sequence <opencascade::handle <Graphic3d_ShaderObject>> Graphic3d_ShaderObjectList;
typedef NCollection_Sequence <opencascade::handle <Graphic3d_ShaderVariable>> Graphic3d_ShaderVariableList;
typedef NCollection_Sequence <opencascade::handle <Graphic3d_ShaderAttribute>> Graphic3d_ShaderAttributeList;
typedef NCollection_Shared <Standard_Mutex> Media_HMutex;
typedef NCollection_DataMap <opencascade::handle <Graphic3d_Aspects>, opencascade::handle <Graphic3d_Aspects>> Graphic3d_MapOfAspectsToAspects;
typedef NCollection_Vec4 <Standard_ShortReal> Graphic3d_Vec4;
typedef NCollection_Vec4 <Standard_Real> Graphic3d_Vec4d;
typedef NCollection_Vec4 <Standard_Integer> Graphic3d_Vec4i;
typedef NCollection_Vec4 <Standard_Byte> Graphic3d_Vec4ub;
typedef NCollection_Vec4 <Standard_Character> Graphic3d_Vec4b;
typedef Standard_Integer Graphic3d_ArrayFlags;
typedef BVH_Box <Standard_Real , 4> Graphic3d_BndBox4d;
typedef NCollection_Map <opencascade::handle <Graphic3d_Structure>> Graphic3d_MapOfStructure;
typedef NCollection_Vec3 <Standard_ShortReal> Graphic3d_Vec3;
typedef NCollection_Vec3 <Standard_Real> Graphic3d_Vec3d;
typedef NCollection_Vec3 <Standard_Integer> Graphic3d_Vec3i;
typedef NCollection_Vec3 <Standard_Byte> Graphic3d_Vec3ub;
typedef NCollection_Vec3 <Standard_Character> Graphic3d_Vec3b;
typedef Standard_Integer Graphic3d_ZLayerId;
typedef NCollection_DataMap <Graphic3d_ZLayerId , Graphic3d_ZLayerSettings> Graphic3d_MapOfZLayerSettings;
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

/************************************
* class Graphic3d_ArrayOfPrimitives *
************************************/
%nodefaultctor Graphic3d_ArrayOfPrimitives;
class Graphic3d_ArrayOfPrimitives : public Standard_Transient {
	public:
		/****************** AddBound ******************/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "* Adds a bound of length theEdgeNumber in the bound array returns the actual bounds number
	:param theEdgeNumber:
	:type theEdgeNumber: int
	:rtype: int") AddBound;
		Standard_Integer AddBound (const Standard_Integer theEdgeNumber);

		/****************** AddBound ******************/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "* Adds a bound of length theEdgeNumber and bound color theBColor in the bound array. Warning: theBColor is ignored when the hasBColors constructor parameter is False returns the actual bounds number
	:param theEdgeNumber:
	:type theEdgeNumber: int
	:param theBColor:
	:type theBColor: Quantity_Color
	:rtype: int") AddBound;
		Standard_Integer AddBound (const Standard_Integer theEdgeNumber,const Quantity_Color & theBColor);

		/****************** AddBound ******************/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "* Adds a bound of length theEdgeNumber and bound color coordinates in the bound array. Warning: <theR,theG,theB> are ignored when the hasBColors constructor parameter is False returns the actual bounds number
	:param theEdgeNumber:
	:type theEdgeNumber: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: int") AddBound;
		Standard_Integer AddBound (const Standard_Integer theEdgeNumber,const Standard_Real theR,const Standard_Real theG,const Standard_Real theB);

		/****************** AddEdge ******************/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "* Adds an edge in the range [1,VertexNumber()] in the array. returns the actual edges number
	:param theVertexIndex:
	:type theVertexIndex: int
	:rtype: int") AddEdge;
		Standard_Integer AddEdge (const Standard_Integer theVertexIndex);

		/****************** AddEdges ******************/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "* Convenience method, adds two vertex indices (a segment) in the range [1,VertexNumber()] in the array. returns the actual edges number
	:param theVertexIndex1:
	:type theVertexIndex1: int
	:param theVertexIndex2:
	:type theVertexIndex2: int
	:rtype: int") AddEdges;
		Standard_Integer AddEdges (Standard_Integer theVertexIndex1,Standard_Integer theVertexIndex2);

		/****************** AddEdges ******************/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "* Convenience method, adds three vertex indices (a triangle) in the range [1,VertexNumber()] in the array. returns the actual edges number
	:param theVertexIndex1:
	:type theVertexIndex1: int
	:param theVertexIndex2:
	:type theVertexIndex2: int
	:param theVertexIndex3:
	:type theVertexIndex3: int
	:rtype: int") AddEdges;
		Standard_Integer AddEdges (Standard_Integer theVertexIndex1,Standard_Integer theVertexIndex2,Standard_Integer theVertexIndex3);

		/****************** AddEdges ******************/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "* Convenience method, adds four vertex indices (a quad) in the range [1,VertexNumber()] in the array. returns the actual edges number
	:param theVertexIndex1:
	:type theVertexIndex1: int
	:param theVertexIndex2:
	:type theVertexIndex2: int
	:param theVertexIndex3:
	:type theVertexIndex3: int
	:param theVertexIndex4:
	:type theVertexIndex4: int
	:rtype: int") AddEdges;
		Standard_Integer AddEdges (Standard_Integer theVertexIndex1,Standard_Integer theVertexIndex2,Standard_Integer theVertexIndex3,Standard_Integer theVertexIndex4);

		/****************** AddPolylineEdges ******************/
		%feature("compactdefaultargs") AddPolylineEdges;
		%feature("autodoc", "* Add line strip (polyline) into indexed segments array. N-1 segments are added from N input nodes (or N with closed flag). Raises exception if array is not of type Graphic3d_TOPA_SEGMENTS. @param theVertexLower [in] index of first node defining line strip fun (center) @param theVertexUpper [in] index of last node defining triangle fun @param theToClose [in] close triangle fan (connect first and last points)
	:param theVertexLower:
	:type theVertexLower: int
	:param theVertexUpper:
	:type theVertexUpper: int
	:param theToClose:
	:type theToClose: bool
	:rtype: None") AddPolylineEdges;
		void AddPolylineEdges (Standard_Integer theVertexLower,Standard_Integer theVertexUpper,Standard_Boolean theToClose);

		/****************** AddQuadEdges ******************/
		%feature("compactdefaultargs") AddQuadEdges;
		%feature("autodoc", "* Convenience method, adds four vertex indices (a quad) in the range [1,VertexNumber()] in the array of quads. Raises exception if array is not of type Graphic3d_TOPA_QUADRANGLES. returns the actual edges number
	:param theVertexIndex1:
	:type theVertexIndex1: int
	:param theVertexIndex2:
	:type theVertexIndex2: int
	:param theVertexIndex3:
	:type theVertexIndex3: int
	:param theVertexIndex4:
	:type theVertexIndex4: int
	:rtype: int") AddQuadEdges;
		Standard_Integer AddQuadEdges (Standard_Integer theVertexIndex1,Standard_Integer theVertexIndex2,Standard_Integer theVertexIndex3,Standard_Integer theVertexIndex4);

		/****************** AddQuadTriangleEdges ******************/
		%feature("compactdefaultargs") AddQuadTriangleEdges;
		%feature("autodoc", "* Convenience method, adds quad indices in the range [1,VertexNumber()] into array or triangles as two triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. returns the actual edges number
	:param theVertexIndex1:
	:type theVertexIndex1: int
	:param theVertexIndex2:
	:type theVertexIndex2: int
	:param theVertexIndex3:
	:type theVertexIndex3: int
	:param theVertexIndex4:
	:type theVertexIndex4: int
	:rtype: int") AddQuadTriangleEdges;
		Standard_Integer AddQuadTriangleEdges (Standard_Integer theVertexIndex1,Standard_Integer theVertexIndex2,Standard_Integer theVertexIndex3,Standard_Integer theVertexIndex4);

		/****************** AddQuadTriangleEdges ******************/
		%feature("compactdefaultargs") AddQuadTriangleEdges;
		%feature("autodoc", "* Convenience method, adds quad indices in the range [1,VertexNumber()] into array or triangles as two triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. returns the actual edges number
	:param theIndexes:
	:type theIndexes: Graphic3d_Vec4i
	:rtype: int") AddQuadTriangleEdges;
		Standard_Integer AddQuadTriangleEdges (const Graphic3d_Vec4i & theIndexes);

		/****************** AddSegmentEdges ******************/
		%feature("compactdefaultargs") AddSegmentEdges;
		%feature("autodoc", "* Convenience method, adds two vertex indices (a segment) in the range [1,VertexNumber()] in the array of segments (Graphic3d_TOPA_SEGMENTS). Raises exception if array is not of type Graphic3d_TOPA_SEGMENTS. returns the actual edges number
	:param theVertexIndex1:
	:type theVertexIndex1: int
	:param theVertexIndex2:
	:type theVertexIndex2: int
	:rtype: int") AddSegmentEdges;
		Standard_Integer AddSegmentEdges (Standard_Integer theVertexIndex1,Standard_Integer theVertexIndex2);

		/****************** AddTriangleEdges ******************/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "* Convenience method, adds three vertex indices of triangle in the range [1,VertexNumber()] in the array of triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. returns the actual edges number
	:param theVertexIndex1:
	:type theVertexIndex1: int
	:param theVertexIndex2:
	:type theVertexIndex2: int
	:param theVertexIndex3:
	:type theVertexIndex3: int
	:rtype: int") AddTriangleEdges;
		Standard_Integer AddTriangleEdges (Standard_Integer theVertexIndex1,Standard_Integer theVertexIndex2,Standard_Integer theVertexIndex3);

		/****************** AddTriangleEdges ******************/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "* Convenience method, adds three vertex indices of triangle in the range [1,VertexNumber()] in the array of triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. returns the actual edges number
	:param theIndexes:
	:type theIndexes: Graphic3d_Vec3i
	:rtype: int") AddTriangleEdges;
		Standard_Integer AddTriangleEdges (const Graphic3d_Vec3i & theIndexes);

		/****************** AddTriangleEdges ******************/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "* Convenience method, adds three vertex indices (4th component is ignored) of triangle in the range [1,VertexNumber()] in the array of triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. returns the actual edges number
	:param theIndexes:
	:type theIndexes: Graphic3d_Vec4i
	:rtype: int") AddTriangleEdges;
		Standard_Integer AddTriangleEdges (const Graphic3d_Vec4i & theIndexes);

		/****************** AddTriangleFanEdges ******************/
		%feature("compactdefaultargs") AddTriangleFanEdges;
		%feature("autodoc", "* Add triangle fan into indexed triangulation array. N-2 triangles are added from N input nodes (or N-1 with closed flag). Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. @param theVertexLower [in] index of first node defining triangle fun (center) @param theVertexUpper [in] index of last node defining triangle fun @param theToClose [in] close triangle fan (connect first and last points)
	:param theVertexLower:
	:type theVertexLower: int
	:param theVertexUpper:
	:type theVertexUpper: int
	:param theToClose:
	:type theToClose: bool
	:rtype: None") AddTriangleFanEdges;
		void AddTriangleFanEdges (Standard_Integer theVertexLower,Standard_Integer theVertexUpper,Standard_Boolean theToClose);

		/****************** AddTriangleStripEdges ******************/
		%feature("compactdefaultargs") AddTriangleStripEdges;
		%feature("autodoc", "* Add triangle strip into indexed triangulation array. N-2 triangles are added from N input nodes. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. @param theVertexLower [in] index of first node defining triangle strip @param theVertexUpper [in] index of last node defining triangle strip
	:param theVertexLower:
	:type theVertexLower: int
	:param theVertexUpper:
	:type theVertexUpper: int
	:rtype: None") AddTriangleStripEdges;
		void AddTriangleStripEdges (Standard_Integer theVertexLower,Standard_Integer theVertexUpper);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice in the array. returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice in the array. returns the actual vertex number
	:param theVertex:
	:type theVertex: Graphic3d_Vec3
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Graphic3d_Vec3 & theVertex);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice in the array. returns the actual vertex number
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice in the array. returns the actual vertex number.
	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const Quantity_Color & theColor);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theColor32:
	:type theColor32: int
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const Standard_Integer theColor32);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theColor:
	:type theColor: Graphic3d_Vec4ub
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const Graphic3d_Vec4ub & theColor);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex normal in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False. returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex normal in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False. returns the actual vertex number
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
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theNX,const Standard_Real theNY,const Standard_Real theNZ);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex normal in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False. returns the actual vertex number
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
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ,const Standard_ShortReal theNX,const Standard_ShortReal theNY,const Standard_ShortReal theNZ);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice,vertex normal and color in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theColor is ignored when the hasVColors constructor parameter is False. returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal,const Quantity_Color & theColor);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice,vertex normal and color in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theColor is ignored when the hasVColors constructor parameter is False. @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:param theColor32:
	:type theColor32: int
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal,const Standard_Integer theColor32);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex texture in the vertex array. theTexel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theTexel:
	:type theTexel: gp_Pnt2d
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Pnt2d & theTexel);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex texture coordinates in the vertex array. Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number
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
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theTX,const Standard_Real theTY);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice and vertex texture coordinates in the vertex array. Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number
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
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ,const Standard_ShortReal theTX,const Standard_ShortReal theTY);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice,vertex normal and texture in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theTexel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number
	:param theVertex:
	:type theVertex: gp_Pnt
	:param theNormal:
	:type theNormal: gp_Dir
	:param theTexel:
	:type theTexel: gp_Pnt2d
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const gp_Pnt & theVertex,const gp_Dir & theNormal,const gp_Pnt2d & theTexel);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice,vertex normal and texture in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False and Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number
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
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theNX,const Standard_Real theNY,const Standard_Real theNZ,const Standard_Real theTX,const Standard_Real theTY);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertice,vertex normal and texture in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False and Texel is ignored when the hasVTexels constructor parameter is False. returns the actual vertex number
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
	:rtype: int") AddVertex;
		Standard_Integer AddVertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ,const Standard_ShortReal theNX,const Standard_ShortReal theNY,const Standard_ShortReal theNZ,const Standard_ShortReal theTX,const Standard_ShortReal theTY);

		/****************** Attributes ******************/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "* Returns vertex attributes buffer (colors, normals, texture coordinates).
	:rtype: opencascade::handle<Graphic3d_Buffer>") Attributes;
		const opencascade::handle<Graphic3d_Buffer> & Attributes ();

		/****************** Bound ******************/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "* Returns the edge number at rank theRank.
	:param theRank:
	:type theRank: int
	:rtype: int") Bound;
		Standard_Integer Bound (const Standard_Integer theRank);

		/****************** BoundColor ******************/
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "* Returns the bound color at rank theRank from the bound table if defined.
	:param theRank:
	:type theRank: int
	:rtype: Quantity_Color") BoundColor;
		Quantity_Color BoundColor (const Standard_Integer theRank);

		/****************** BoundColor ******************/
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "* Returns the bound color values at rank theRank from the bound table if defined.
	:param theRank:
	:type theRank: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: None") BoundColor;
		void BoundColor (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** BoundNumber ******************/
		%feature("compactdefaultargs") BoundNumber;
		%feature("autodoc", "* Returns the number of defined bounds
	:rtype: int") BoundNumber;
		Standard_Integer BoundNumber ();

		/****************** BoundNumberAllocated ******************/
		%feature("compactdefaultargs") BoundNumberAllocated;
		%feature("autodoc", "* Returns the number of allocated bounds
	:rtype: int") BoundNumberAllocated;
		Standard_Integer BoundNumberAllocated ();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* @name optional array of Bounds/Subgroups within primitive array (e.g. restarting primitives / assigning colors) Returns optional bounds buffer.
	:rtype: opencascade::handle<Graphic3d_BoundBuffer>") Bounds;
		const opencascade::handle<Graphic3d_BoundBuffer> & Bounds ();

		/****************** CreateArray ******************/
		%feature("compactdefaultargs") CreateArray;
		%feature("autodoc", "* Create an array of specified type.
	:param theType:
	:type theType: Graphic3d_TypeOfPrimitiveArray
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxEdges:
	:type theMaxEdges: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: opencascade::handle<Graphic3d_ArrayOfPrimitives>") CreateArray;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> CreateArray (Graphic3d_TypeOfPrimitiveArray theType,Standard_Integer theMaxVertexs,Standard_Integer theMaxEdges,int theArrayFlags);

		/****************** CreateArray ******************/
		%feature("compactdefaultargs") CreateArray;
		%feature("autodoc", "* Create an array of specified type.
	:param theType:
	:type theType: Graphic3d_TypeOfPrimitiveArray
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxBounds:
	:type theMaxBounds: int
	:param theMaxEdges:
	:type theMaxEdges: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: opencascade::handle<Graphic3d_ArrayOfPrimitives>") CreateArray;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> CreateArray (Graphic3d_TypeOfPrimitiveArray theType,Standard_Integer theMaxVertexs,Standard_Integer theMaxBounds,Standard_Integer theMaxEdges,int theArrayFlags);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the vertex index at rank theRank in the range [1,EdgeNumber()]
	:param theRank:
	:type theRank: int
	:rtype: int") Edge;
		Standard_Integer Edge (const Standard_Integer theRank);

		/****************** EdgeNumber ******************/
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "* Returns the number of defined edges
	:rtype: int") EdgeNumber;
		Standard_Integer EdgeNumber ();

		/****************** EdgeNumberAllocated ******************/
		%feature("compactdefaultargs") EdgeNumberAllocated;
		%feature("autodoc", "* Returns the number of allocated edges
	:rtype: int") EdgeNumberAllocated;
		Standard_Integer EdgeNumberAllocated ();

		/****************** HasBoundColors ******************/
		%feature("compactdefaultargs") HasBoundColors;
		%feature("autodoc", "* Returns True when bound colors array is defined.
	:rtype: bool") HasBoundColors;
		Standard_Boolean HasBoundColors ();

		/****************** HasVertexColors ******************/
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "* Returns True when vertex colors array is defined.
	:rtype: bool") HasVertexColors;
		Standard_Boolean HasVertexColors ();

		/****************** HasVertexNormals ******************/
		%feature("compactdefaultargs") HasVertexNormals;
		%feature("autodoc", "* Returns True when vertex normals array is defined.
	:rtype: bool") HasVertexNormals;
		Standard_Boolean HasVertexNormals ();

		/****************** HasVertexTexels ******************/
		%feature("compactdefaultargs") HasVertexTexels;
		%feature("autodoc", "* Returns True when vertex texels array is defined.
	:rtype: bool") HasVertexTexels;
		Standard_Boolean HasVertexTexels ();

		/****************** Indices ******************/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "* @name optional array of Indices/Edges for using shared Vertex data Returns optional index buffer.
	:rtype: opencascade::handle<Graphic3d_IndexBuffer>") Indices;
		const opencascade::handle<Graphic3d_IndexBuffer> & Indices ();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Returns True only when the contains of this array is available.
	:rtype: bool") IsValid;
		Standard_Boolean IsValid ();

		/****************** ItemNumber ******************/
		%feature("compactdefaultargs") ItemNumber;
		%feature("autodoc", "* Returns the number of total items according to the array type.
	:rtype: int") ItemNumber;
		Standard_Integer ItemNumber ();

		/****************** SetBoundColor ******************/
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "* Change the bound color of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetBoundColor;
		void SetBoundColor (const Standard_Integer theIndex,const Quantity_Color & theColor);

		/****************** SetBoundColor ******************/
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "* Change the bound color of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: None") SetBoundColor;
		void SetBoundColor (const Standard_Integer theIndex,const Standard_Real theR,const Standard_Real theG,const Standard_Real theB);

		/****************** SetVertexColor ******************/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "* Change the vertex color of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Quantity_Color & theColor);

		/****************** SetVertexColor ******************/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "* Change the vertex color of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: None") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Standard_Real theR,const Standard_Real theG,const Standard_Real theB);

		/****************** SetVertexColor ******************/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "* Change the vertex color of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Graphic3d_Vec4ub
	:rtype: None") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Graphic3d_Vec4ub & theColor);

		/****************** SetVertexColor ******************/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "* Change the vertex color of rank theIndex> in the array. @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode
	:param theIndex:
	:type theIndex: int
	:param theColor32:
	:type theColor32: int
	:rtype: None") SetVertexColor;
		void SetVertexColor (const Standard_Integer theIndex,const Standard_Integer theColor32);

		/****************** SetVertexNormal ******************/
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "* Change the vertex normal of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theNormal:
	:type theNormal: gp_Dir
	:rtype: None") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer theIndex,const gp_Dir & theNormal);

		/****************** SetVertexNormal ******************/
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "* Change the vertex normal of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theNX:
	:type theNX: float
	:param theNY:
	:type theNY: float
	:param theNZ:
	:type theNZ: float
	:rtype: None") SetVertexNormal;
		void SetVertexNormal (const Standard_Integer theIndex,const Standard_Real theNX,const Standard_Real theNY,const Standard_Real theNZ);

		/****************** SetVertexTexel ******************/
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "* Change the vertex texel of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theTexel:
	:type theTexel: gp_Pnt2d
	:rtype: None") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer theIndex,const gp_Pnt2d & theTexel);

		/****************** SetVertexTexel ******************/
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "* Change the vertex texel of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theTX:
	:type theTX: float
	:param theTY:
	:type theTY: float
	:rtype: None") SetVertexTexel;
		void SetVertexTexel (const Standard_Integer theIndex,const Standard_Real theTX,const Standard_Real theTY);

		/****************** SetVertice ******************/
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "* Change the vertice of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theVertex:
	:type theVertex: gp_Pnt
	:rtype: None") SetVertice;
		void SetVertice (const Standard_Integer theIndex,const gp_Pnt & theVertex);

		/****************** SetVertice ******************/
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "* Change the vertice of rank theIndex in the array.
	:param theIndex:
	:type theIndex: int
	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: None") SetVertice;
		void SetVertice (const Standard_Integer theIndex,const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);

		/****************** StringType ******************/
		%feature("compactdefaultargs") StringType;
		%feature("autodoc", "* Returns the string type of this primitive
	:rtype: char *") StringType;
		const char * StringType ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of this primitive
	:rtype: Graphic3d_TypeOfPrimitiveArray") Type;
		Graphic3d_TypeOfPrimitiveArray Type ();

		/****************** VertexColor ******************/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "* Returns the vertex color at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:rtype: Quantity_Color") VertexColor;
		Quantity_Color VertexColor (const Standard_Integer theRank);

		/****************** VertexColor ******************/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "* Returns the vertex color at rank theIndex from the vertex table if defined.
	:param theIndex:
	:type theIndex: int
	:param theColor:
	:type theColor: Graphic3d_Vec4ub
	:rtype: None") VertexColor;
		void VertexColor (const Standard_Integer theIndex,Graphic3d_Vec4ub & theColor);

		/****************** VertexColor ******************/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "* Returns the vertex color values at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:param theR:
	:type theR: float
	:param theG:
	:type theG: float
	:param theB:
	:type theB: float
	:rtype: None") VertexColor;
		void VertexColor (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** VertexColor ******************/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "* Returns the vertex color values at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:param theColor:
	:type theColor: int
	:rtype: None") VertexColor;
		void VertexColor (const Standard_Integer theRank,Standard_Integer &OutValue);

		/****************** VertexNormal ******************/
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "* Returns the vertex normal at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:rtype: gp_Dir") VertexNormal;
		gp_Dir VertexNormal (const Standard_Integer theRank);

		/****************** VertexNormal ******************/
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "* Returns the vertex normal coordinates at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:param theNX:
	:type theNX: float
	:param theNY:
	:type theNY: float
	:param theNZ:
	:type theNZ: float
	:rtype: None") VertexNormal;
		void VertexNormal (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** VertexNumber ******************/
		%feature("compactdefaultargs") VertexNumber;
		%feature("autodoc", "* Returns the number of defined vertex
	:rtype: int") VertexNumber;
		Standard_Integer VertexNumber ();

		/****************** VertexNumberAllocated ******************/
		%feature("compactdefaultargs") VertexNumberAllocated;
		%feature("autodoc", "* Returns the number of allocated vertex
	:rtype: int") VertexNumberAllocated;
		Standard_Integer VertexNumberAllocated ();

		/****************** VertexTexel ******************/
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "* Returns the vertex texture at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:rtype: gp_Pnt2d") VertexTexel;
		gp_Pnt2d VertexTexel (const Standard_Integer theRank);

		/****************** VertexTexel ******************/
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "* Returns the vertex texture coordinates at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:param theTX:
	:type theTX: float
	:param theTY:
	:type theTY: float
	:rtype: None") VertexTexel;
		void VertexTexel (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Vertice ******************/
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "* Returns the vertice at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:rtype: gp_Pnt") Vertice;
		gp_Pnt Vertice (const Standard_Integer theRank);

		/****************** Vertice ******************/
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "* Returns the vertice coordinates at rank theRank from the vertex table if defined.
	:param theRank:
	:type theRank: int
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None") Vertice;
		void Vertice (const Standard_Integer theRank,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

};


%make_alias(Graphic3d_ArrayOfPrimitives)

%extend Graphic3d_ArrayOfPrimitives {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Graphic3d_Aspects *
**************************/
class Graphic3d_Aspects : public Standard_Transient {
	public:
		/****************** AllowBackFace ******************/
		%feature("compactdefaultargs") AllowBackFace;
		%feature("autodoc", "* Allows the display of back-facing filled polygons.
	:rtype: None") AllowBackFace;
		void AllowBackFace ();

		/****************** AlphaCutoff ******************/
		%feature("compactdefaultargs") AlphaCutoff;
		%feature("autodoc", "* Returns alpha cutoff threshold, for discarding fragments within Graphic3d_AlphaMode_Mask mode (0.5 by default). If the alpha value is greater than or equal to this value then it is rendered as fully opaque, otherwise, it is rendered as fully transparent.
	:rtype: Standard_ShortReal") AlphaCutoff;
		Standard_ShortReal AlphaCutoff ();

		/****************** AlphaMode ******************/
		%feature("compactdefaultargs") AlphaMode;
		%feature("autodoc", "* Returns the way how alpha value should be treated (Graphic3d_AlphaMode_BlendAuto by default, for backward compatibility).
	:rtype: Graphic3d_AlphaMode") AlphaMode;
		Graphic3d_AlphaMode AlphaMode ();

		/****************** BackFace ******************/
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "* Returns true if back faces should be suppressed (true by default).
	:rtype: bool") BackFace;
		bool BackFace ();

		/****************** BackInteriorColor ******************/
		%feature("compactdefaultargs") BackInteriorColor;
		%feature("autodoc", "* Return back interior color.
	:rtype: Quantity_Color") BackInteriorColor;
		const Quantity_Color & BackInteriorColor ();

		/****************** BackInteriorColorRGBA ******************/
		%feature("compactdefaultargs") BackInteriorColorRGBA;
		%feature("autodoc", "* Return back interior color.
	:rtype: Quantity_ColorRGBA") BackInteriorColorRGBA;
		const Quantity_ColorRGBA & BackInteriorColorRGBA ();

		/****************** BackMaterial ******************/
		%feature("compactdefaultargs") BackMaterial;
		%feature("autodoc", "* Returns the surface material of internal faces
	:rtype: Graphic3d_MaterialAspect") BackMaterial;
		const Graphic3d_MaterialAspect & BackMaterial ();

		/****************** ChangeBackMaterial ******************/
		%feature("compactdefaultargs") ChangeBackMaterial;
		%feature("autodoc", "* Returns the surface material of internal faces
	:rtype: Graphic3d_MaterialAspect") ChangeBackMaterial;
		Graphic3d_MaterialAspect & ChangeBackMaterial ();

		/****************** ChangeFrontMaterial ******************/
		%feature("compactdefaultargs") ChangeFrontMaterial;
		%feature("autodoc", "* Returns the surface material of external faces
	:rtype: Graphic3d_MaterialAspect") ChangeFrontMaterial;
		Graphic3d_MaterialAspect & ChangeFrontMaterial ();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Return the color.
	:rtype: Quantity_Color") Color;
		const Quantity_Color & Color ();

		/****************** ColorRGBA ******************/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "* Return color
	:rtype: Quantity_ColorRGBA") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA ();

		/****************** ColorSubTitle ******************/
		%feature("compactdefaultargs") ColorSubTitle;
		%feature("autodoc", "* Return text background/shadow color; equals to EdgeColor() property.
	:rtype: Quantity_Color") ColorSubTitle;
		const Quantity_Color & ColorSubTitle ();

		/****************** ColorSubTitleRGBA ******************/
		%feature("compactdefaultargs") ColorSubTitleRGBA;
		%feature("autodoc", "* Returns text background/shadow color; equals to EdgeColor() property.
	:rtype: Quantity_ColorRGBA") ColorSubTitleRGBA;
		const Quantity_ColorRGBA & ColorSubTitleRGBA ();

		/****************** Distinguish ******************/
		%feature("compactdefaultargs") Distinguish;
		%feature("autodoc", "* Returns true if material properties should be distinguished for back and front faces (false by default).
	:rtype: bool") Distinguish;
		bool Distinguish ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** EdgeColor ******************/
		%feature("compactdefaultargs") EdgeColor;
		%feature("autodoc", "* Return color of edges.
	:rtype: Quantity_Color") EdgeColor;
		const Quantity_Color & EdgeColor ();

		/****************** EdgeColorRGBA ******************/
		%feature("compactdefaultargs") EdgeColorRGBA;
		%feature("autodoc", "* Return color of edges.
	:rtype: Quantity_ColorRGBA") EdgeColorRGBA;
		const Quantity_ColorRGBA & EdgeColorRGBA ();

		/****************** EdgeLineType ******************/
		%feature("compactdefaultargs") EdgeLineType;
		%feature("autodoc", "* Return edges line type (same as LineType()).
	:rtype: Aspect_TypeOfLine") EdgeLineType;
		Aspect_TypeOfLine EdgeLineType ();

		/****************** EdgeWidth ******************/
		%feature("compactdefaultargs") EdgeWidth;
		%feature("autodoc", "* Return width for edges in pixels (same as LineWidth()).
	:rtype: Standard_ShortReal") EdgeWidth;
		Standard_ShortReal EdgeWidth ();

		/****************** FrontMaterial ******************/
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "* Returns the surface material of external faces
	:rtype: Graphic3d_MaterialAspect") FrontMaterial;
		const Graphic3d_MaterialAspect & FrontMaterial ();

		/****************** Graphic3d_Aspects ******************/
		%feature("compactdefaultargs") Graphic3d_Aspects;
		%feature("autodoc", "* Creates a context table for drawing primitives defined with the following default values:
	:rtype: None") Graphic3d_Aspects;
		 Graphic3d_Aspects ();

		/****************** HatchStyle ******************/
		%feature("compactdefaultargs") HatchStyle;
		%feature("autodoc", "* Returns the hatch type used when InteriorStyle is IS_HATCH
	:rtype: opencascade::handle<Graphic3d_HatchStyle>") HatchStyle;
		const opencascade::handle<Graphic3d_HatchStyle> & HatchStyle ();

		/****************** InteriorColor ******************/
		%feature("compactdefaultargs") InteriorColor;
		%feature("autodoc", "* Return interior color.
	:rtype: Quantity_Color") InteriorColor;
		const Quantity_Color & InteriorColor ();

		/****************** InteriorColorRGBA ******************/
		%feature("compactdefaultargs") InteriorColorRGBA;
		%feature("autodoc", "* Return interior color.
	:rtype: Quantity_ColorRGBA") InteriorColorRGBA;
		const Quantity_ColorRGBA & InteriorColorRGBA ();

		/****************** InteriorStyle ******************/
		%feature("compactdefaultargs") InteriorStyle;
		%feature("autodoc", "* Return interior rendering style; Aspect_IS_SOLID by default.
	:rtype: Aspect_InteriorStyle") InteriorStyle;
		Aspect_InteriorStyle InteriorStyle ();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Check for equality with another aspects.
	:param theOther:
	:type theOther: Graphic3d_Aspects
	:rtype: bool") IsEqual;
		bool IsEqual (const Graphic3d_Aspects & theOther);

		/****************** IsMarkerSprite ******************/
		%feature("compactdefaultargs") IsMarkerSprite;
		%feature("autodoc", "* Returns True if marker should be drawn using marker sprite (either user-provided or generated).
	:rtype: bool") IsMarkerSprite;
		bool IsMarkerSprite ();

		/****************** IsTextZoomable ******************/
		%feature("compactdefaultargs") IsTextZoomable;
		%feature("autodoc", "* Returns True when the Text Zoomable is on.
	:rtype: bool") IsTextZoomable;
		bool IsTextZoomable ();

		/****************** LineType ******************/
		%feature("compactdefaultargs") LineType;
		%feature("autodoc", "* @name parameters specific to Line primitive rendering Return line type; Aspect_TOL_SOLID by default.
	:rtype: Aspect_TypeOfLine") LineType;
		Aspect_TypeOfLine LineType ();

		/****************** LineWidth ******************/
		%feature("compactdefaultargs") LineWidth;
		%feature("autodoc", "* Return width for edges in pixels; 1.0 by default.
	:rtype: Standard_ShortReal") LineWidth;
		Standard_ShortReal LineWidth ();

		/****************** MarkerImage ******************/
		%feature("compactdefaultargs") MarkerImage;
		%feature("autodoc", "* Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.
	:rtype: opencascade::handle<Graphic3d_MarkerImage>") MarkerImage;
		const opencascade::handle<Graphic3d_MarkerImage> & MarkerImage ();

		/****************** MarkerScale ******************/
		%feature("compactdefaultargs") MarkerScale;
		%feature("autodoc", "* Return marker scale factor; 1.0 by default.
	:rtype: Standard_ShortReal") MarkerScale;
		Standard_ShortReal MarkerScale ();

		/****************** MarkerType ******************/
		%feature("compactdefaultargs") MarkerType;
		%feature("autodoc", "* @name parameters specific to Point (Marker) primitive rendering Return marker type; Aspect_TOM_POINT by default.
	:rtype: Aspect_TypeOfMarker") MarkerType;
		Aspect_TypeOfMarker MarkerType ();

		/****************** PolygonOffset ******************/
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "* Returns current polygon offsets settings.
	:rtype: Graphic3d_PolygonOffset") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset ();

		/****************** PolygonOffsets ******************/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "* Returns current polygon offsets settings.
	:param theMode:
	:type theMode: int
	:param theFactor:
	:type theFactor: Standard_ShortReal
	:param theUnits:
	:type theUnits: Standard_ShortReal
	:rtype: None") PolygonOffsets;
		void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & theFactor,Standard_ShortReal & theUnits);

		/****************** SetAlphaMode ******************/
		%feature("compactdefaultargs") SetAlphaMode;
		%feature("autodoc", "* Defines the way how alpha value should be treated.
	:param theMode:
	:type theMode: Graphic3d_AlphaMode
	:param theAlphaCutoff: default value is 0.5f
	:type theAlphaCutoff: Standard_ShortReal
	:rtype: None") SetAlphaMode;
		void SetAlphaMode (Graphic3d_AlphaMode theMode,Standard_ShortReal theAlphaCutoff = 0.5f);

		/****************** SetBackInteriorColor ******************/
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "* Modifies the color of the interior of the back face
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetBackInteriorColor;
		void SetBackInteriorColor (const Quantity_Color & theColor);

		/****************** SetBackInteriorColor ******************/
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "* Modifies the color of the interior of the back face
	:param theColor:
	:type theColor: Quantity_ColorRGBA
	:rtype: None") SetBackInteriorColor;
		void SetBackInteriorColor (const Quantity_ColorRGBA & theColor);

		/****************** SetBackMaterial ******************/
		%feature("compactdefaultargs") SetBackMaterial;
		%feature("autodoc", "* Modifies the surface material of internal faces
	:param theMaterial:
	:type theMaterial: Graphic3d_MaterialAspect
	:rtype: None") SetBackMaterial;
		void SetBackMaterial (const Graphic3d_MaterialAspect & theMaterial);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Modifies the color.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetColorSubTitle ******************/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "* Modifies text background/shadow color; equals to EdgeColor() property.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_Color & theColor);

		/****************** SetColorSubTitle ******************/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "* Modifies text background/shadow color; equals to EdgeColor() property.
	:param theColor:
	:type theColor: Quantity_ColorRGBA
	:rtype: None") SetColorSubTitle;
		void SetColorSubTitle (const Quantity_ColorRGBA & theColor);

		/****************** SetDistinguish ******************/
		%feature("compactdefaultargs") SetDistinguish;
		%feature("autodoc", "* Set material distinction between front and back faces.
	:param toDistinguish:
	:type toDistinguish: bool
	:rtype: None") SetDistinguish;
		void SetDistinguish (bool toDistinguish);

		/****************** SetDistinguishOff ******************/
		%feature("compactdefaultargs") SetDistinguishOff;
		%feature("autodoc", "* Forbids material distinction between front and back faces.
	:rtype: None") SetDistinguishOff;
		void SetDistinguishOff ();

		/****************** SetDistinguishOn ******************/
		%feature("compactdefaultargs") SetDistinguishOn;
		%feature("autodoc", "* Allows material distinction between front and back faces.
	:rtype: None") SetDistinguishOn;
		void SetDistinguishOn ();

		/****************** SetDrawEdges ******************/
		%feature("compactdefaultargs") SetDrawEdges;
		%feature("autodoc", "* Set if mesh edges should be drawn or not.
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawEdges;
		void SetDrawEdges (bool theToDraw);

		/****************** SetDrawSilhouette ******************/
		%feature("compactdefaultargs") SetDrawSilhouette;
		%feature("autodoc", "* Enables/disables drawing silhouette (outline).
	:param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawSilhouette;
		void SetDrawSilhouette (bool theToDraw);

		/****************** SetEdgeColor ******************/
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "* Modifies the color of the edge of the face
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetEdgeColor;
		void SetEdgeColor (const Quantity_Color & theColor);

		/****************** SetEdgeColor ******************/
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "* Modifies the color of the edge of the face
	:param theColor:
	:type theColor: Quantity_ColorRGBA
	:rtype: None") SetEdgeColor;
		void SetEdgeColor (const Quantity_ColorRGBA & theColor);

		/****************** SetEdgeLineType ******************/
		%feature("compactdefaultargs") SetEdgeLineType;
		%feature("autodoc", "* Modifies the edge line type (same as SetLineType())
	:param theType:
	:type theType: Aspect_TypeOfLine
	:rtype: None") SetEdgeLineType;
		void SetEdgeLineType (Aspect_TypeOfLine theType);

		/****************** SetEdgeOff ******************/
		%feature("compactdefaultargs") SetEdgeOff;
		%feature("autodoc", "* The edges of FillAreas are not drawn.
	:rtype: None") SetEdgeOff;
		void SetEdgeOff ();

		/****************** SetEdgeOn ******************/
		%feature("compactdefaultargs") SetEdgeOn;
		%feature("autodoc", "* The edges of FillAreas are drawn.
	:rtype: None") SetEdgeOn;
		void SetEdgeOn ();

		/****************** SetEdgeWidth ******************/
		%feature("compactdefaultargs") SetEdgeWidth;
		%feature("autodoc", "* Modifies the edge thickness (same as SetLineWidth())
	:param theWidth:
	:type theWidth: float
	:rtype: None") SetEdgeWidth;
		void SetEdgeWidth (Standard_Real theWidth);

		/****************** SetFrontMaterial ******************/
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "* Modifies the surface material of external faces
	:param theMaterial:
	:type theMaterial: Graphic3d_MaterialAspect
	:rtype: None") SetFrontMaterial;
		void SetFrontMaterial (const Graphic3d_MaterialAspect & theMaterial);

		/****************** SetHatchStyle ******************/
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "* Modifies the hatch type used when InteriorStyle is IS_HATCH
	:param theStyle:
	:type theStyle: Graphic3d_HatchStyle
	:rtype: None") SetHatchStyle;
		void SetHatchStyle (const opencascade::handle<Graphic3d_HatchStyle> & theStyle);

		/****************** SetHatchStyle ******************/
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "* Modifies the hatch type used when InteriorStyle is IS_HATCH @warning This method always creates a new handle for a given hatch style
	:param theStyle:
	:type theStyle: Aspect_HatchStyle
	:rtype: None") SetHatchStyle;
		void SetHatchStyle (const Aspect_HatchStyle theStyle);

		/****************** SetInteriorColor ******************/
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "* Modifies the color of the interior of the face
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetInteriorColor;
		void SetInteriorColor (const Quantity_Color & theColor);

		/****************** SetInteriorColor ******************/
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "* Modifies the color of the interior of the face
	:param theColor:
	:type theColor: Quantity_ColorRGBA
	:rtype: None") SetInteriorColor;
		void SetInteriorColor (const Quantity_ColorRGBA & theColor);

		/****************** SetInteriorStyle ******************/
		%feature("compactdefaultargs") SetInteriorStyle;
		%feature("autodoc", "* Modifies the interior type used for rendering
	:param theStyle:
	:type theStyle: Aspect_InteriorStyle
	:rtype: None") SetInteriorStyle;
		void SetInteriorStyle (const Aspect_InteriorStyle theStyle);

		/****************** SetLineType ******************/
		%feature("compactdefaultargs") SetLineType;
		%feature("autodoc", "* Modifies the line type
	:param theType:
	:type theType: Aspect_TypeOfLine
	:rtype: None") SetLineType;
		void SetLineType (Aspect_TypeOfLine theType);

		/****************** SetLineWidth ******************/
		%feature("compactdefaultargs") SetLineWidth;
		%feature("autodoc", "* Modifies the line thickness Warning: Raises Standard_OutOfRange if the width is a negative value.
	:param theWidth:
	:type theWidth: Standard_ShortReal
	:rtype: None") SetLineWidth;
		void SetLineWidth (Standard_ShortReal theWidth);

		/****************** SetMarkerImage ******************/
		%feature("compactdefaultargs") SetMarkerImage;
		%feature("autodoc", "* Set marker's image texture.
	:param theImage:
	:type theImage: Graphic3d_MarkerImage
	:rtype: None") SetMarkerImage;
		void SetMarkerImage (const opencascade::handle<Graphic3d_MarkerImage> & theImage);

		/****************** SetMarkerScale ******************/
		%feature("compactdefaultargs") SetMarkerScale;
		%feature("autodoc", "* Modifies the scale factor. Marker type Aspect_TOM_POINT is not affected by the marker size scale factor. It is always the smallest displayable dot. Warning: Raises Standard_OutOfRange if the scale is a negative value.
	:param theScale:
	:type theScale: Standard_ShortReal
	:rtype: None") SetMarkerScale;
		void SetMarkerScale (const Standard_ShortReal theScale);

		/****************** SetMarkerType ******************/
		%feature("compactdefaultargs") SetMarkerType;
		%feature("autodoc", "* Modifies the type of marker.
	:param theType:
	:type theType: Aspect_TypeOfMarker
	:rtype: None") SetMarkerType;
		void SetMarkerType (Aspect_TypeOfMarker theType);

		/****************** SetPolygonOffset ******************/
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "* Sets polygon offsets settings.
	:param theOffset:
	:type theOffset: Graphic3d_PolygonOffset
	:rtype: None") SetPolygonOffset;
		void SetPolygonOffset (const Graphic3d_PolygonOffset & theOffset);

		/****************** SetPolygonOffsets ******************/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "* Sets up OpenGL polygon offsets mechanism. <aMode> parameter can contain various combinations of Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means that polygon offsets are not changed). If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits> arguments are used by graphic renderer to calculate a depth offset value: //! offset = <aFactor> * m + <aUnits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific) //! Default settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 0. //! Negative offset values move polygons closer to the viewport, while positive values shift polygons away. Consult OpenGL reference for details (glPolygonOffset function description).
	:param theMode:
	:type theMode: int
	:param theFactor: default value is 1.0f
	:type theFactor: Standard_ShortReal
	:param theUnits: default value is 0.0f
	:type theUnits: Standard_ShortReal
	:rtype: None") SetPolygonOffsets;
		void SetPolygonOffsets (const Standard_Integer theMode,const Standard_ShortReal theFactor = 1.0f,const Standard_ShortReal theUnits = 0.0f);

		/****************** SetShaderProgram ******************/
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "* Sets up OpenGL/GLSL shader program.
	:param theProgram:
	:type theProgram: Graphic3d_ShaderProgram
	:rtype: None") SetShaderProgram;
		void SetShaderProgram (const opencascade::handle<Graphic3d_ShaderProgram> & theProgram);

		/****************** SetShadingModel ******************/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "* Sets shading model
	:param theShadingModel:
	:type theShadingModel: Graphic3d_TypeOfShadingModel
	:rtype: None") SetShadingModel;
		void SetShadingModel (const Graphic3d_TypeOfShadingModel theShadingModel);

		/****************** SetSkipFirstEdge ******************/
		%feature("compactdefaultargs") SetSkipFirstEdge;
		%feature("autodoc", "* Set skip first triangle edge flag for drawing wireframe presentation of quads array split into triangles.
	:param theToSkipFirstEdge:
	:type theToSkipFirstEdge: bool
	:rtype: None") SetSkipFirstEdge;
		void SetSkipFirstEdge (bool theToSkipFirstEdge);

		/****************** SetSuppressBackFaces ******************/
		%feature("compactdefaultargs") SetSuppressBackFaces;
		%feature("autodoc", "* Assign back faces culling flag.
	:param theToSuppress:
	:type theToSuppress: bool
	:rtype: None") SetSuppressBackFaces;
		void SetSuppressBackFaces (bool theToSuppress);

		/****************** SetTextAngle ******************/
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "* Turns usage of text rotated
	:param theAngle:
	:type theAngle: Standard_ShortReal
	:rtype: None") SetTextAngle;
		void SetTextAngle (Standard_ShortReal theAngle);

		/****************** SetTextDisplayType ******************/
		%feature("compactdefaultargs") SetTextDisplayType;
		%feature("autodoc", "* Sets display type.
	:param theType:
	:type theType: Aspect_TypeOfDisplayText
	:rtype: None") SetTextDisplayType;
		void SetTextDisplayType (Aspect_TypeOfDisplayText theType);

		/****************** SetTextFont ******************/
		%feature("compactdefaultargs") SetTextFont;
		%feature("autodoc", "* Modifies the font.
	:param theFont:
	:type theFont: TCollection_HAsciiString
	:rtype: None") SetTextFont;
		void SetTextFont (const opencascade::handle<TCollection_HAsciiString> & theFont);

		/****************** SetTextFontAspect ******************/
		%feature("compactdefaultargs") SetTextFontAspect;
		%feature("autodoc", "* Turns usage of Aspect text
	:param theFontAspect:
	:type theFontAspect: Font_FontAspect
	:rtype: None") SetTextFontAspect;
		void SetTextFontAspect (Font_FontAspect theFontAspect);

		/****************** SetTextStyle ******************/
		%feature("compactdefaultargs") SetTextStyle;
		%feature("autodoc", "* Modifies the style of the text.
	:param theStyle:
	:type theStyle: Aspect_TypeOfStyleText
	:rtype: None") SetTextStyle;
		void SetTextStyle (Aspect_TypeOfStyleText theStyle);

		/****************** SetTextZoomable ******************/
		%feature("compactdefaultargs") SetTextZoomable;
		%feature("autodoc", "* Turns usage of text zoomable on/off
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetTextZoomable;
		void SetTextZoomable (bool theFlag);

		/****************** SetTextureMap ******************/
		%feature("compactdefaultargs") SetTextureMap;
		%feature("autodoc", "* Assign texture to be mapped. See also SetTextureMapOn() to actually activate texture mapping. ////Standard_DEPRECATED('Deprecated method, SetTextureSet() should be used instead')
	:param theTexture:
	:type theTexture: Graphic3d_TextureMap
	:rtype: None") SetTextureMap;
		void SetTextureMap (const opencascade::handle<Graphic3d_TextureMap> & theTexture);

		/****************** SetTextureMapOff ******************/
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "* Disable texture mapping.
	:rtype: None") SetTextureMapOff;
		void SetTextureMapOff ();

		/****************** SetTextureMapOn ******************/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "* Enable or disable texture mapping (has no effect if texture is not set).
	:param theToMap:
	:type theToMap: bool
	:rtype: None") SetTextureMapOn;
		void SetTextureMapOn (bool theToMap);

		/****************** SetTextureMapOn ******************/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "* Enable texture mapping (has no effect if texture is not set).
	:rtype: None") SetTextureMapOn;
		void SetTextureMapOn ();

		/****************** SetTextureSet ******************/
		%feature("compactdefaultargs") SetTextureSet;
		%feature("autodoc", "* Setup texture array to be mapped.
	:param theTextures:
	:type theTextures: Graphic3d_TextureSet
	:rtype: None") SetTextureSet;
		void SetTextureSet (const opencascade::handle<Graphic3d_TextureSet> & theTextures);

		/****************** ShaderProgram ******************/
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "* Return shader program.
	:rtype: opencascade::handle<Graphic3d_ShaderProgram>") ShaderProgram;
		const opencascade::handle<Graphic3d_ShaderProgram> & ShaderProgram ();

		/****************** ShadingModel ******************/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "* Returns shading model; Graphic3d_TOSM_DEFAULT by default. Graphic3d_TOSM_DEFAULT means that Shading Model set as default for entire Viewer will be used.
	:rtype: Graphic3d_TypeOfShadingModel") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel ();

		/****************** SuppressBackFace ******************/
		%feature("compactdefaultargs") SuppressBackFace;
		%feature("autodoc", "* Suppress the display of back-facing filled polygons. A back-facing polygon is defined as a polygon whose vertices are in a clockwise order with respect to screen coordinates.
	:rtype: None") SuppressBackFace;
		void SuppressBackFace ();

		/****************** TextAngle ******************/
		%feature("compactdefaultargs") TextAngle;
		%feature("autodoc", "* Returns Angle of degree
	:rtype: Standard_ShortReal") TextAngle;
		Standard_ShortReal TextAngle ();

		/****************** TextDisplayType ******************/
		%feature("compactdefaultargs") TextDisplayType;
		%feature("autodoc", "* Returns display type; Aspect_TODT_NORMAL by default.
	:rtype: Aspect_TypeOfDisplayText") TextDisplayType;
		Aspect_TypeOfDisplayText TextDisplayType ();

		/****************** TextFont ******************/
		%feature("compactdefaultargs") TextFont;
		%feature("autodoc", "* @name parameters specific to text rendering Returns the font; NULL string by default.
	:rtype: opencascade::handle<TCollection_HAsciiString>") TextFont;
		const opencascade::handle<TCollection_HAsciiString> & TextFont ();

		/****************** TextFontAspect ******************/
		%feature("compactdefaultargs") TextFontAspect;
		%feature("autodoc", "* Returns text FontAspect
	:rtype: Font_FontAspect") TextFontAspect;
		Font_FontAspect TextFontAspect ();

		/****************** TextStyle ******************/
		%feature("compactdefaultargs") TextStyle;
		%feature("autodoc", "* Returns the text style; Aspect_TOST_NORMAL by default.
	:rtype: Aspect_TypeOfStyleText") TextStyle;
		Aspect_TypeOfStyleText TextStyle ();

		/****************** TextureMap ******************/
		%feature("compactdefaultargs") TextureMap;
		%feature("autodoc", "* Return texture to be mapped. ////Standard_DEPRECATED('Deprecated method, TextureSet() should be used instead')
	:rtype: opencascade::handle<Graphic3d_TextureMap>") TextureMap;
		opencascade::handle<Graphic3d_TextureMap> TextureMap ();

		/****************** TextureMapState ******************/
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "* Return true if texture mapping is enabled (false by default).
	:rtype: bool") TextureMapState;
		bool TextureMapState ();

		/****************** TextureSet ******************/
		%feature("compactdefaultargs") TextureSet;
		%feature("autodoc", "* Return texture array to be mapped.
	:rtype: opencascade::handle<Graphic3d_TextureSet>") TextureSet;
		const opencascade::handle<Graphic3d_TextureSet> & TextureSet ();

		/****************** ToDrawEdges ******************/
		%feature("compactdefaultargs") ToDrawEdges;
		%feature("autodoc", "* @name parameters specific to Mesh Edges (of triangulation primitive) rendering Returns true if mesh edges should be drawn (false by default).
	:rtype: bool") ToDrawEdges;
		bool ToDrawEdges ();

		/****************** ToDrawSilhouette ******************/
		%feature("compactdefaultargs") ToDrawSilhouette;
		%feature("autodoc", "* Returns True if silhouette (outline) should be drawn (with edge color and width); False by default.
	:rtype: bool") ToDrawSilhouette;
		bool ToDrawSilhouette ();

		/****************** ToMapTexture ******************/
		%feature("compactdefaultargs") ToMapTexture;
		%feature("autodoc", "* Return true if texture mapping is enabled (false by default).
	:rtype: bool") ToMapTexture;
		bool ToMapTexture ();

		/****************** ToSkipFirstEdge ******************/
		%feature("compactdefaultargs") ToSkipFirstEdge;
		%feature("autodoc", "* Returns True if drawing element edges should discard first edge in triangle; False by default. Graphics hardware works mostly with triangles, so that wireframe presentation will draw triangle edges by default. This flag allows rendering wireframe presentation of quad-only array split into triangles. For this, quads should be split in specific order, so that the quad diagonal (to be NOT rendered) goes first: 1------2 / / Triangle #1: 2-0-1; Triangle #2: 0-2-3 0------3
	:rtype: bool") ToSkipFirstEdge;
		bool ToSkipFirstEdge ();

		/****************** ToSuppressBackFaces ******************/
		%feature("compactdefaultargs") ToSuppressBackFaces;
		%feature("autodoc", "* Returns true if back faces should be suppressed (true by default).
	:rtype: bool") ToSuppressBackFaces;
		bool ToSuppressBackFaces ();

};


%make_alias(Graphic3d_Aspects)

%extend Graphic3d_Aspects {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Graphic3d_Attribute *
****************************/
class Graphic3d_Attribute {
	public:
		Graphic3d_TypeOfAttribute Id;
		Graphic3d_TypeOfData DataType;
		/****************** Stride ******************/
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "* //!< vec2,vec3,vec4,vec4ub
	:rtype: int") Stride;
		Standard_Integer Stride ();

		/****************** Stride ******************/
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "* returns size of attribute of specified data type
	:param theType:
	:type theType: Graphic3d_TypeOfData
	:rtype: int") Stride;
		static Standard_Integer Stride (const Graphic3d_TypeOfData theType);

};


%extend Graphic3d_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Graphic3d_AxisAspect *
*****************************/
class Graphic3d_AxisAspect {
	public:
		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Color of axis and values
	:rtype: Quantity_Color") Color;
		const Quantity_Color & Color ();

		/****************** Graphic3d_AxisAspect ******************/
		%feature("compactdefaultargs") Graphic3d_AxisAspect;
		%feature("autodoc", ":param theName: default value is ""
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
	:rtype: None") Graphic3d_AxisAspect;
		 Graphic3d_AxisAspect (const TCollection_ExtendedString theName = "",const Quantity_Color theNameColor = Quantity_NOC_BLACK,const Quantity_Color theColor = Quantity_NOC_BLACK,const Standard_Integer theValuesOffset = 10,const Standard_Integer theNameOffset = 30,const Standard_Integer theTickmarksNumber = 5,const Standard_Integer theTickmarksLength = 10,const Standard_Boolean theToDrawName = Standard_True,const Standard_Boolean theToDrawValues = Standard_True,const Standard_Boolean theToDrawTickmarks = Standard_True);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", ":rtype: TCollection_ExtendedString") Name;
		const TCollection_ExtendedString & Name ();

		/****************** NameColor ******************/
		%feature("compactdefaultargs") NameColor;
		%feature("autodoc", ":rtype: Quantity_Color") NameColor;
		const Quantity_Color & NameColor ();

		/****************** NameOffset ******************/
		%feature("compactdefaultargs") NameOffset;
		%feature("autodoc", ":rtype: int") NameOffset;
		Standard_Integer NameOffset ();

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Sets color of axis and values
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetDrawName ******************/
		%feature("compactdefaultargs") SetDrawName;
		%feature("autodoc", ":param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawName;
		void SetDrawName (const Standard_Boolean theToDraw);

		/****************** SetDrawTickmarks ******************/
		%feature("compactdefaultargs") SetDrawTickmarks;
		%feature("autodoc", ":param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawTickmarks;
		void SetDrawTickmarks (const Standard_Boolean theToDraw);

		/****************** SetDrawValues ******************/
		%feature("compactdefaultargs") SetDrawValues;
		%feature("autodoc", ":param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawValues;
		void SetDrawValues (const Standard_Boolean theToDraw);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", ":param theName:
	:type theName: TCollection_ExtendedString
	:rtype: None") SetName;
		void SetName (const TCollection_ExtendedString & theName);

		/****************** SetNameColor ******************/
		%feature("compactdefaultargs") SetNameColor;
		%feature("autodoc", ":param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetNameColor;
		void SetNameColor (const Quantity_Color & theColor);

		/****************** SetNameOffset ******************/
		%feature("compactdefaultargs") SetNameOffset;
		%feature("autodoc", ":param theValue:
	:type theValue: int
	:rtype: None") SetNameOffset;
		void SetNameOffset (const Standard_Integer theValue);

		/****************** SetTickmarksLength ******************/
		%feature("compactdefaultargs") SetTickmarksLength;
		%feature("autodoc", ":param theValue:
	:type theValue: int
	:rtype: None") SetTickmarksLength;
		void SetTickmarksLength (const Standard_Integer theValue);

		/****************** SetTickmarksNumber ******************/
		%feature("compactdefaultargs") SetTickmarksNumber;
		%feature("autodoc", ":param theValue:
	:type theValue: int
	:rtype: None") SetTickmarksNumber;
		void SetTickmarksNumber (const Standard_Integer theValue);

		/****************** SetValuesOffset ******************/
		%feature("compactdefaultargs") SetValuesOffset;
		%feature("autodoc", ":param theValue:
	:type theValue: int
	:rtype: None") SetValuesOffset;
		void SetValuesOffset (const Standard_Integer theValue);

		/****************** TickmarksLength ******************/
		%feature("compactdefaultargs") TickmarksLength;
		%feature("autodoc", ":rtype: int") TickmarksLength;
		Standard_Integer TickmarksLength ();

		/****************** TickmarksNumber ******************/
		%feature("compactdefaultargs") TickmarksNumber;
		%feature("autodoc", ":rtype: int") TickmarksNumber;
		Standard_Integer TickmarksNumber ();

		/****************** ToDrawName ******************/
		%feature("compactdefaultargs") ToDrawName;
		%feature("autodoc", ":rtype: bool") ToDrawName;
		Standard_Boolean ToDrawName ();

		/****************** ToDrawTickmarks ******************/
		%feature("compactdefaultargs") ToDrawTickmarks;
		%feature("autodoc", ":rtype: bool") ToDrawTickmarks;
		Standard_Boolean ToDrawTickmarks ();

		/****************** ToDrawValues ******************/
		%feature("compactdefaultargs") ToDrawValues;
		%feature("autodoc", ":rtype: bool") ToDrawValues;
		Standard_Boolean ToDrawValues ();

		/****************** ValuesOffset ******************/
		%feature("compactdefaultargs") ValuesOffset;
		%feature("autodoc", ":rtype: int") ValuesOffset;
		Standard_Integer ValuesOffset ();

};


%extend Graphic3d_AxisAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Graphic3d_BSDF *
***********************/
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
		/****************** CreateDiffuse ******************/
		%feature("compactdefaultargs") CreateDiffuse;
		%feature("autodoc", "* Creates BSDF describing diffuse (Lambertian) surface.
	:param theWeight:
	:type theWeight: Graphic3d_Vec3
	:rtype: Graphic3d_BSDF") CreateDiffuse;
		static Graphic3d_BSDF CreateDiffuse (const Graphic3d_Vec3 & theWeight);

		/****************** CreateGlass ******************/
		%feature("compactdefaultargs") CreateGlass;
		%feature("autodoc", "* Creates BSDF describing glass-like object. Glass-like BSDF mixes refraction and reflection effects at grazing angles using physically-based Fresnel dielectric model.
	:param theWeight:
	:type theWeight: Graphic3d_Vec3
	:param theAbsorptionColor:
	:type theAbsorptionColor: Graphic3d_Vec3
	:param theAbsorptionCoeff:
	:type theAbsorptionCoeff: Standard_ShortReal
	:param theRefractionIndex:
	:type theRefractionIndex: Standard_ShortReal
	:rtype: Graphic3d_BSDF") CreateGlass;
		static Graphic3d_BSDF CreateGlass (const Graphic3d_Vec3 & theWeight,const Graphic3d_Vec3 & theAbsorptionColor,const Standard_ShortReal theAbsorptionCoeff,const Standard_ShortReal theRefractionIndex);

		/****************** CreateMetallic ******************/
		%feature("compactdefaultargs") CreateMetallic;
		%feature("autodoc", "* Creates BSDF describing polished metallic-like surface.
	:param theWeight:
	:type theWeight: Graphic3d_Vec3
	:param theFresnel:
	:type theFresnel: Graphic3d_Fresnel
	:param theRoughness:
	:type theRoughness: Standard_ShortReal
	:rtype: Graphic3d_BSDF") CreateMetallic;
		static Graphic3d_BSDF CreateMetallic (const Graphic3d_Vec3 & theWeight,const Graphic3d_Fresnel & theFresnel,const Standard_ShortReal theRoughness);

		/****************** CreateTransparent ******************/
		%feature("compactdefaultargs") CreateTransparent;
		%feature("autodoc", "* Creates BSDF describing transparent object. Transparent BSDF models simple transparency without refraction (the ray passes straight through the surface).
	:param theWeight:
	:type theWeight: Graphic3d_Vec3
	:param theAbsorptionColor:
	:type theAbsorptionColor: Graphic3d_Vec3
	:param theAbsorptionCoeff:
	:type theAbsorptionCoeff: Standard_ShortReal
	:rtype: Graphic3d_BSDF") CreateTransparent;
		static Graphic3d_BSDF CreateTransparent (const Graphic3d_Vec3 & theWeight,const Graphic3d_Vec3 & theAbsorptionColor,const Standard_ShortReal theAbsorptionCoeff);

		/****************** Graphic3d_BSDF ******************/
		%feature("compactdefaultargs") Graphic3d_BSDF;
		%feature("autodoc", "* Creates uninitialized BSDF.
	:rtype: None") Graphic3d_BSDF;
		 Graphic3d_BSDF ();

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "* Normalizes BSDF components.
	:rtype: None") Normalize;
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

/******************************
* class Graphic3d_BoundBuffer *
******************************/
class Graphic3d_BoundBuffer : public NCollection_Buffer {
	public:
		Graphic3d_Vec4 * Colors;
		int * Bounds;
		int NbBounds;
		int NbMaxBounds;
		/****************** Graphic3d_BoundBuffer ******************/
		%feature("compactdefaultargs") Graphic3d_BoundBuffer;
		%feature("autodoc", "* Empty constructor.
	:param theAlloc:
	:type theAlloc: NCollection_BaseAllocator
	:rtype: None") Graphic3d_BoundBuffer;
		 Graphic3d_BoundBuffer (const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Allocates new empty array
	:param theNbBounds:
	:type theNbBounds: int
	:param theHasColors:
	:type theHasColors: bool
	:rtype: bool") Init;
		bool Init (const Standard_Integer theNbBounds,const Standard_Boolean theHasColors);

};


%make_alias(Graphic3d_BoundBuffer)

%extend Graphic3d_BoundBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Graphic3d_Buffer *
*************************/
/******************************
* class Graphic3d_BufferRange *
******************************/
class Graphic3d_BufferRange {
	public:
		int Start;
		int Length;
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clear the range.
	:rtype: None") Clear;
		void Clear ();

		/****************** Graphic3d_BufferRange ******************/
		%feature("compactdefaultargs") Graphic3d_BufferRange;
		%feature("autodoc", "* //!< number of elements within the range Empty constructor.
	:rtype: None") Graphic3d_BufferRange;
		 Graphic3d_BufferRange ();

		/****************** Graphic3d_BufferRange ******************/
		%feature("compactdefaultargs") Graphic3d_BufferRange;
		%feature("autodoc", "* Constructor.
	:param theStart:
	:type theStart: int
	:param theLength:
	:type theLength: int
	:rtype: None") Graphic3d_BufferRange;
		 Graphic3d_BufferRange (Standard_Integer theStart,Standard_Integer theLength);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Return True if range is empty.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Unite ******************/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "* Add another range to this one.
	:param theRange:
	:type theRange: Graphic3d_BufferRange
	:rtype: None") Unite;
		void Unite (const Graphic3d_BufferRange & theRange);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "* Return the Upper element within the range
	:rtype: int") Upper;
		Standard_Integer Upper ();

};


%extend Graphic3d_BufferRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Graphic3d_BvhCStructureSet *
***********************************/
%nodefaultctor Graphic3d_BvhCStructureSet;
class Graphic3d_BvhCStructureSet : public BVH_PrimitiveSet3d {
	public:
		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns AABB of the structure.
	:param theIdx:
	:type theIdx: int
	:rtype: Graphic3d_BndBox3d") Box;
		Graphic3d_BndBox3d Box (const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Calculates center of the AABB along given axis.
	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float") Center;
		Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns total number of structures.
	:rtype: int") Size;
		Standard_Integer Size ();

		/****************** Structures ******************/
		%feature("compactdefaultargs") Structures;
		%feature("autodoc", "* Access directly a collection of structures.
	:rtype: NCollection_IndexedMap< Graphic3d_CStructure *>") Structures;
		const NCollection_IndexedMap<const Graphic3d_CStructure *> & Structures ();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "* Swaps structures with the given indices.
	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: None") Swap;
		void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);

};


%extend Graphic3d_BvhCStructureSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Graphic3d_CLight *
*************************/
class Graphic3d_CLight : public Standard_Transient {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "* @name spotlight additional definition parameters Returns an angle in radians of the cone created by the spot; 30 degrees by default.
	:rtype: Standard_ShortReal") Angle;
		Standard_ShortReal Angle ();

		/****************** Attenuation ******************/
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "* Returns the attenuation factors.
	:param theConstAttenuation:
	:type theConstAttenuation: float
	:param theLinearAttenuation:
	:type theLinearAttenuation: float
	:rtype: None") Attenuation;
		void Attenuation (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Returns the color of the light source; WHITE by default.
	:rtype: Quantity_Color") Color;
		const Quantity_Color & Color ();

		/****************** Concentration ******************/
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "* Returns intensity distribution of the spot light, within [0.0, 1.0] range; 1.0 by default. This coefficient should be converted into spotlight exponent within [0.0, 128.0] range: @code float aSpotExponent = Concentration() * 128.0; anAttenuation *= pow (aCosA, aSpotExponent);' @endcode The concentration factor determines the dispersion of the light on the surface, the default value (1.0) corresponds to a minimum of dispersion.
	:rtype: Standard_ShortReal") Concentration;
		Standard_ShortReal Concentration ();

		/****************** ConstAttenuation ******************/
		%feature("compactdefaultargs") ConstAttenuation;
		%feature("autodoc", "* Returns constant attenuation factor of positional/spot light source; 1.0f by default. Distance attenuation factors of reducing positional/spot light intensity depending on the distance from its position: @code float anAttenuation = 1.0 / (ConstAttenuation() + LinearAttenuation() * theDistance + QuadraticAttenuation() * theDistance * theDistance); @endcode
	:rtype: Standard_ShortReal") ConstAttenuation;
		Standard_ShortReal ConstAttenuation ();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* @name directional/spot light additional properties Returns direction of directional/spot light.
	:rtype: gp_Dir") Direction;
		gp_Dir Direction ();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* Returns the theVx, theVy, theVz direction of the light source.
	:param theVx:
	:type theVx: float
	:param theVy:
	:type theVy: float
	:param theVz:
	:type theVz: float
	:rtype: None") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetId ******************/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "* @name low-level access methods returns light resource identifier string
	:rtype: TCollection_AsciiString") GetId;
		const TCollection_AsciiString & GetId ();

		/****************** Graphic3d_CLight ******************/
		%feature("compactdefaultargs") Graphic3d_CLight;
		%feature("autodoc", "* Empty constructor, which should be followed by light source properties configuration.
	:param theType:
	:type theType: Graphic3d_TypeOfLightSource
	:rtype: None") Graphic3d_CLight;
		 Graphic3d_CLight (Graphic3d_TypeOfLightSource theType);

		/****************** Headlight ******************/
		%feature("compactdefaultargs") Headlight;
		%feature("autodoc", "* Alias for IsHeadlight().
	:rtype: bool") Headlight;
		Standard_Boolean Headlight ();

		/****************** Intensity ******************/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "* @name Ray-Tracing / Path-Tracing light properties Returns the intensity of light source; 1.0 by default.
	:rtype: Standard_ShortReal") Intensity;
		Standard_ShortReal Intensity ();

		/****************** IsEnabled ******************/
		%feature("compactdefaultargs") IsEnabled;
		%feature("autodoc", "* Check that the light source is turned on; True by default. This flag affects all occurrences of light sources, where it was registered and activated; so that it is possible defining an active light in View which is actually in disabled state.
	:rtype: bool") IsEnabled;
		Standard_Boolean IsEnabled ();

		/****************** IsHeadlight ******************/
		%feature("compactdefaultargs") IsHeadlight;
		%feature("autodoc", "* Returns true if the light is a headlight; False by default. Headlight flag means that light position/direction are defined not in a World coordinate system, but relative to the camera orientation.
	:rtype: bool") IsHeadlight;
		Standard_Boolean IsHeadlight ();

		/****************** LinearAttenuation ******************/
		%feature("compactdefaultargs") LinearAttenuation;
		%feature("autodoc", "* Returns linear attenuation factor of positional/spot light source; 0.0 by default. Distance attenuation factors of reducing positional/spot light intensity depending on the distance from its position: @code float anAttenuation = 1.0 / (ConstAttenuation() + LinearAttenuation() * theDistance + QuadraticAttenuation() * theDistance * theDistance); @endcode
	:rtype: Standard_ShortReal") LinearAttenuation;
		Standard_ShortReal LinearAttenuation ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns light source name; empty string by default.
	:rtype: TCollection_AsciiString") Name;
		const TCollection_AsciiString & Name ();

		/****************** PackedColor ******************/
		%feature("compactdefaultargs") PackedColor;
		%feature("autodoc", "* Returns the color of the light source with dummy Alpha component, which should be ignored.
	:rtype: Graphic3d_Vec4") PackedColor;
		const Graphic3d_Vec4 & PackedColor ();

		/****************** PackedDirection ******************/
		%feature("compactdefaultargs") PackedDirection;
		%feature("autodoc", "* Returns direction of directional/spot light.
	:rtype: Graphic3d_Vec4") PackedDirection;
		const Graphic3d_Vec4 & PackedDirection ();

		/****************** PackedParams ******************/
		%feature("compactdefaultargs") PackedParams;
		%feature("autodoc", "* Packed light parameters.
	:rtype: Graphic3d_Vec4") PackedParams;
		const Graphic3d_Vec4 & PackedParams ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* @name positional/spot light properties Returns location of positional/spot light; (0, 0, 0) by default.
	:rtype: gp_Pnt") Position;
		const gp_Pnt  Position ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns location of positional/spot light.
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None") Position;
		void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Revision ******************/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "* returns modification counter
	:rtype: Standard_Size") Revision;
		Standard_Size Revision ();

		/****************** SetAngle ******************/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "* Angle in radians of the cone created by the spot, should be within range (0.0, M_PI).
	:param theAngle:
	:type theAngle: Standard_ShortReal
	:rtype: None") SetAngle;
		void SetAngle (Standard_ShortReal theAngle);

		/****************** SetAttenuation ******************/
		%feature("compactdefaultargs") SetAttenuation;
		%feature("autodoc", "* Defines the coefficients of attenuation; values should be >= 0.0 and their summ should not be equal to 0.
	:param theConstAttenuation:
	:type theConstAttenuation: Standard_ShortReal
	:param theLinearAttenuation:
	:type theLinearAttenuation: Standard_ShortReal
	:rtype: None") SetAttenuation;
		void SetAttenuation (Standard_ShortReal theConstAttenuation,Standard_ShortReal theLinearAttenuation);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Defines the color of a light source by giving the basic color.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetConcentration ******************/
		%feature("compactdefaultargs") SetConcentration;
		%feature("autodoc", "* Defines the coefficient of concentration; value should be within range [0.0, 1.0].
	:param theConcentration:
	:type theConcentration: Standard_ShortReal
	:rtype: None") SetConcentration;
		void SetConcentration (Standard_ShortReal theConcentration);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Sets direction of directional/spot light.
	:param theDir:
	:type theDir: gp_Dir
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir & theDir);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Sets direction of directional/spot light.
	:param theVx:
	:type theVx: float
	:param theVy:
	:type theVy: float
	:param theVz:
	:type theVz: float
	:rtype: None") SetDirection;
		void SetDirection (Standard_Real theVx,Standard_Real theVy,Standard_Real theVz);

		/****************** SetEnabled ******************/
		%feature("compactdefaultargs") SetEnabled;
		%feature("autodoc", "* Change enabled state of the light state. This call does not remove or deactivate light source in Views/Viewers; instead it turns it OFF so that it just have no effect.
	:param theIsOn:
	:type theIsOn: bool
	:rtype: None") SetEnabled;
		void SetEnabled (Standard_Boolean theIsOn);

		/****************** SetHeadlight ******************/
		%feature("compactdefaultargs") SetHeadlight;
		%feature("autodoc", "* Setup headlight flag.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetHeadlight;
		void SetHeadlight (Standard_Boolean theValue);

		/****************** SetIntensity ******************/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "* Modifies the intensity of light source, which should be > 0.0.
	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetIntensity;
		void SetIntensity (Standard_ShortReal theValue);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Sets light source name.
	:param theName:
	:type theName: TCollection_AsciiString
	:rtype: None") SetName;
		void SetName (const TCollection_AsciiString & theName);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Setup location of positional/spot light.
	:param thePosition:
	:type thePosition: gp_Pnt
	:rtype: None") SetPosition;
		void SetPosition (const gp_Pnt & thePosition);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Setup location of positional/spot light.
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None") SetPosition;
		void SetPosition (Standard_Real theX,Standard_Real theY,Standard_Real theZ);

		/****************** SetSmoothAngle ******************/
		%feature("compactdefaultargs") SetSmoothAngle;
		%feature("autodoc", "* Modifies the smoothing angle (in radians) of directional light source; should be within range [0.0, M_PI/2].
	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetSmoothAngle;
		void SetSmoothAngle (Standard_ShortReal theValue);

		/****************** SetSmoothRadius ******************/
		%feature("compactdefaultargs") SetSmoothRadius;
		%feature("autodoc", "* Modifies the smoothing radius of positional/spot light; should be >= 0.0.
	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetSmoothRadius;
		void SetSmoothRadius (Standard_ShortReal theValue);

		/****************** Smoothness ******************/
		%feature("compactdefaultargs") Smoothness;
		%feature("autodoc", "* Returns the smoothness of light source (either smoothing angle for directional light or smoothing radius in case of positional light); 0.0 by default.
	:rtype: Standard_ShortReal") Smoothness;
		Standard_ShortReal Smoothness ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the Type of the Light, cannot be changed after object construction.
	:rtype: Graphic3d_TypeOfLightSource") Type;
		Graphic3d_TypeOfLightSource Type ();

};


%make_alias(Graphic3d_CLight)

%extend Graphic3d_CLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Graphic3d_CStructure *
*****************************/
%nodefaultctor Graphic3d_CStructure;
class Graphic3d_CStructure : public Standard_Transient {
	public:
		class SubclassStructIterator {};
		class SubclassGroupIterator {};
		int Id;
		Graphic3d_ZLayerId myZLayer;
		int Priority;
		int PreviousPriority;
		int ContainsFacet;
		opencascade::handle<Graphic3d_ViewAffinity> ViewAffinity;
		unsigned IsInfinite;
		unsigned stick;
		unsigned highlight;
		unsigned visible;
		unsigned HLRValidation;
		unsigned IsForHighlight;
		unsigned IsMutable;
		unsigned Is2dText;
		/****************** BndBoxClipCheck ******************/
		%feature("compactdefaultargs") BndBoxClipCheck;
		%feature("autodoc", "* Returns whether check of object's bounding box clipping is enabled before drawing of object; True by default.
	:rtype: bool") BndBoxClipCheck;
		Standard_Boolean BndBoxClipCheck ();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* returns bounding box of this presentation
	:rtype: Graphic3d_BndBox3d") BoundingBox;
		const Graphic3d_BndBox3d & BoundingBox ();

		/****************** ChangeBoundingBox ******************/
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "* returns bounding box of this presentation without transformation matrix applied
	:rtype: Graphic3d_BndBox3d") ChangeBoundingBox;
		Graphic3d_BndBox3d & ChangeBoundingBox ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clear graphic data
	:rtype: None") Clear;
		void Clear ();

		/****************** ClipPlanes ******************/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "* returns associated clip planes
	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes ();

		/****************** Connect ******************/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "* Connect other structure to this one
	:param theStructure:
	:type theStructure: Graphic3d_CStructure
	:rtype: None") Connect;
		void Connect (Graphic3d_CStructure & theStructure);

		/****************** Disconnect ******************/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "* Disconnect other structure to this one
	:param theStructure:
	:type theStructure: Graphic3d_CStructure
	:rtype: None") Disconnect;
		void Disconnect (Graphic3d_CStructure & theStructure);

		/****************** GraphicDriver ******************/
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "* returns graphic driver created this structure
	:rtype: opencascade::handle<Graphic3d_GraphicDriver>") GraphicDriver;
		const opencascade::handle<Graphic3d_GraphicDriver> & GraphicDriver ();

		/****************** GraphicHighlight ******************/
		%feature("compactdefaultargs") GraphicHighlight;
		%feature("autodoc", "* Highlights structure with the given style
	:param theStyle:
	:type theStyle: Graphic3d_PresentationAttributes
	:rtype: None") GraphicHighlight;
		void GraphicHighlight (const opencascade::handle<Graphic3d_PresentationAttributes> & theStyle);

		/****************** GraphicUnhighlight ******************/
		%feature("compactdefaultargs") GraphicUnhighlight;
		%feature("autodoc", "* Unhighlights the structure and invalidates pointer to structure's highlight style
	:rtype: None") GraphicUnhighlight;
		void GraphicUnhighlight ();

		/****************** Groups ******************/
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "* returns graphic groups
	:rtype: Graphic3d_SequenceOfGroup") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();

		/****************** HighlightStyle ******************/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "* Returns valid handle to highlight style of the structure in case if highlight flag is set to true
	:rtype: opencascade::handle<Graphic3d_PresentationAttributes>") HighlightStyle;
		const opencascade::handle<Graphic3d_PresentationAttributes> & HighlightStyle ();

		/****************** IsAlwaysRendered ******************/
		%feature("compactdefaultargs") IsAlwaysRendered;
		%feature("autodoc", "* Checks if the structure should be included into BVH tree or not.
	:rtype: bool") IsAlwaysRendered;
		Standard_Boolean IsAlwaysRendered ();

		/****************** IsCulled ******************/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "* Returns False if the structure hits the current view volume, otherwise returns True.
	:rtype: bool") IsCulled;
		Standard_Boolean IsCulled ();

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "* Return structure visibility flag
	:rtype: bool") IsVisible;
		bool IsVisible ();

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "* Return structure visibility considering both View Affinity and global visibility state.
	:param theViewId:
	:type theViewId: int
	:rtype: bool") IsVisible;
		bool IsVisible (const Standard_Integer theViewId);

		/****************** MarkAsNotCulled ******************/
		%feature("compactdefaultargs") MarkAsNotCulled;
		%feature("autodoc", "* Marks structure as overlapping the current view volume one. The method is called during traverse of BVH tree.
	:rtype: None") MarkAsNotCulled;
		void MarkAsNotCulled ();

		/****************** NewGroup ******************/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "* Create new group within this structure
	:param theStruct:
	:type theStruct: Graphic3d_Structure
	:rtype: opencascade::handle<Graphic3d_Group>") NewGroup;
		opencascade::handle<Graphic3d_Group> NewGroup (const opencascade::handle<Graphic3d_Structure> & theStruct);

		/****************** OnVisibilityChanged ******************/
		%feature("compactdefaultargs") OnVisibilityChanged;
		%feature("autodoc", "* Update structure visibility state
	:rtype: None") OnVisibilityChanged;
		void OnVisibilityChanged ();

		/****************** RemoveGroup ******************/
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "* Remove group from this structure
	:param theGroup:
	:type theGroup: Graphic3d_Group
	:rtype: None") RemoveGroup;
		void RemoveGroup (const opencascade::handle<Graphic3d_Group> & theGroup);

		/****************** SetBndBoxClipCheck ******************/
		%feature("compactdefaultargs") SetBndBoxClipCheck;
		%feature("autodoc", "* Enable/disable check of object's bounding box clipping before drawing of object.
	:param theBndBoxClipCheck:
	:type theBndBoxClipCheck: bool
	:rtype: None") SetBndBoxClipCheck;
		void SetBndBoxClipCheck (Standard_Boolean theBndBoxClipCheck);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "* Pass clip planes to the associated graphic driver structure
	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None") SetClipPlanes;
		void SetClipPlanes (const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetCulled ******************/
		%feature("compactdefaultargs") SetCulled;
		%feature("autodoc", "* Marks structure as culled/not culled - note that IsAlwaysRendered() is ignored here!
	:param theIsCulled:
	:type theIsCulled: bool
	:rtype: None") SetCulled;
		void SetCulled (Standard_Boolean theIsCulled);

		/****************** SetTransformPersistence ******************/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "* Set transformation persistence.
	:param theTrsfPers:
	:type theTrsfPers: Graphic3d_TransformPers
	:rtype: None") SetTransformPersistence;
		void SetTransformPersistence (const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "* Assign transformation.
	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: None") SetTransformation;
		void SetTransformation (const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "* Set z layer ID to display the structure in specified layer
	:param theLayerIndex:
	:type theLayerIndex: int
	:rtype: None") SetZLayer;
		void SetZLayer (int theLayerIndex);

		/****************** ShadowLink ******************/
		%feature("compactdefaultargs") ShadowLink;
		%feature("autodoc", "* Create shadow link to this structure
	:param theManager:
	:type theManager: Graphic3d_StructureManager
	:rtype: opencascade::handle<Graphic3d_CStructure>") ShadowLink;
		opencascade::handle<Graphic3d_CStructure> ShadowLink (const opencascade::handle<Graphic3d_StructureManager> & theManager);

		/****************** TransformPersistence ******************/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "* Return transformation persistence.
	:rtype: opencascade::handle<Graphic3d_TransformPers>") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence ();

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "* Return transformation.
	:rtype: opencascade::handle<Geom_Transformation>") Transformation;
		const opencascade::handle<Geom_Transformation> & Transformation ();

		/****************** ZLayer ******************/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "* Get z layer ID
	:rtype: Graphic3d_ZLayerId") ZLayer;
		Graphic3d_ZLayerId ZLayer ();

		/****************** updateLayerTransformation ******************/
		%feature("compactdefaultargs") updateLayerTransformation;
		%feature("autodoc", "* Update render transformation matrix.
	:rtype: None") updateLayerTransformation;
		void updateLayerTransformation ();

};


%make_alias(Graphic3d_CStructure)

%extend Graphic3d_CStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Graphic3d_CTexture *
***************************/
class Graphic3d_CTexture {
	public:
		opencascade::handle<Graphic3d_TextureMap> TextureMap;
		int doTextureMap;
		/****************** Graphic3d_CTexture ******************/
		%feature("compactdefaultargs") Graphic3d_CTexture;
		%feature("autodoc", ":rtype: None") Graphic3d_CTexture;
		 Graphic3d_CTexture ();

};


%extend Graphic3d_CTexture {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Graphic3d_Camera *
*************************/
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

enum  {
	FrustumVert_LeftBottomNear = 0,
	FrustumVert_LeftBottomFar = 1,
	FrustumVert_LeftTopNear = 2,
	FrustumVert_LeftTopFar = 3,
	FrustumVert_RightBottomNear = 4,
	FrustumVert_RightBottomFar = 5,
	FrustumVert_RightTopNear = 6,
	FrustumVert_RightTopFar = 7,
	FrustumVerticesNB = 8,
};

/* end public enums declaration */

		/****************** Aspect ******************/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "* Get camera display ratio. returns display ratio.
	:rtype: float") Aspect;
		Standard_Real Aspect ();

		/****************** AxialScale ******************/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "* Get camera axial scale. returns Camera's axial scale.
	:rtype: gp_XYZ") AxialScale;
		const gp_XYZ  AxialScale ();

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Get Center of the camera, e.g. the point where camera looks at. This point is computed as Eye() translated along Direction() at Distance(). returns the point where the camera looks at.
	:rtype: gp_Pnt") Center;
		gp_Pnt Center ();

		/****************** ConvertProj2View ******************/
		%feature("compactdefaultargs") ConvertProj2View;
		%feature("autodoc", "* Convert point from projection coordinate space to view coordinate space. @param thePnt [in] the point in NDC. returns point in VCS.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt") ConvertProj2View;
		gp_Pnt ConvertProj2View (const gp_Pnt & thePnt);

		/****************** ConvertView2Proj ******************/
		%feature("compactdefaultargs") ConvertView2Proj;
		%feature("autodoc", "* Convert point from view coordinate space to projection coordinate space. @param thePnt [in] the point in VCS. returns point in NDC.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt") ConvertView2Proj;
		gp_Pnt ConvertView2Proj (const gp_Pnt & thePnt);

		/****************** ConvertView2World ******************/
		%feature("compactdefaultargs") ConvertView2World;
		%feature("autodoc", "* Convert point from view coordinate space to world coordinates. @param thePnt [in] the 3D point in VCS. returns point in WCS.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt") ConvertView2World;
		gp_Pnt ConvertView2World (const gp_Pnt & thePnt);

		/****************** ConvertWorld2View ******************/
		%feature("compactdefaultargs") ConvertWorld2View;
		%feature("autodoc", "* Convert point from world coordinate space to view coordinate space. @param thePnt [in] the 3D point in WCS. returns point in VCS.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt") ConvertWorld2View;
		gp_Pnt ConvertWorld2View (const gp_Pnt & thePnt);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Copy properties of another camera. @param theOther [in] the camera to copy from.
	:param theOther:
	:type theOther: Graphic3d_Camera
	:rtype: None") Copy;
		void Copy (const opencascade::handle<Graphic3d_Camera> & theOther);

		/****************** CopyMappingData ******************/
		%feature("compactdefaultargs") CopyMappingData;
		%feature("autodoc", "* Initialize mapping related parameters from other camera handle.
	:param theOtherCamera:
	:type theOtherCamera: Graphic3d_Camera
	:rtype: None") CopyMappingData;
		void CopyMappingData (const opencascade::handle<Graphic3d_Camera> & theOtherCamera);

		/****************** CopyOrientationData ******************/
		%feature("compactdefaultargs") CopyOrientationData;
		%feature("autodoc", "* Initialize orientation related parameters from other camera handle.
	:param theOtherCamera:
	:type theOtherCamera: Graphic3d_Camera
	:rtype: None") CopyOrientationData;
		void CopyOrientationData (const opencascade::handle<Graphic3d_Camera> & theOtherCamera);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "* @name Public camera properties Get camera look direction. returns camera look direction.
	:rtype: gp_Dir") Direction;
		const gp_Dir  Direction ();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Get distance of Eye from camera Center. returns the distance.
	:rtype: float") Distance;
		Standard_Real Distance ();

		/****************** Eye ******************/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "* Get camera Eye position. returns camera eye location.
	:rtype: gp_Pnt") Eye;
		const gp_Pnt  Eye ();

		/****************** FOVy ******************/
		%feature("compactdefaultargs") FOVy;
		%feature("autodoc", "* Get Field Of View (FOV) in y axis. returns the FOV value in degrees.
	:rtype: float") FOVy;
		Standard_Real FOVy ();

		/****************** Frustum ******************/
		%feature("compactdefaultargs") Frustum;
		%feature("autodoc", "* Calculate WCS frustum planes for the camera projection volume. Frustum is a convex volume determined by six planes directing inwards. The frustum planes are usually used as inputs for camera algorithms. Thus, if any changes to projection matrix calculation are necessary, the frustum planes calculation should be also touched. @param theLeft [out] the frustum plane for left side of view. @param theRight [out] the frustum plane for right side of view. @param theBottom [out] the frustum plane for bottom side of view. @param theTop [out] the frustum plane for top side of view. @param theNear [out] the frustum plane for near side of view. @param theFar [out] the frustum plane for far side of view.
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
	:rtype: None") Frustum;
		void Frustum (gp_Pln & theLeft,gp_Pln & theRight,gp_Pln & theBottom,gp_Pln & theTop,gp_Pln & theNear,gp_Pln & theFar);

		/****************** FrustumPoints ******************/
		%feature("compactdefaultargs") FrustumPoints;
		%feature("autodoc", "* Fill array of current view frustum corners. The size of this array is equal to FrustumVerticesNB. The order of vertices is as defined in FrustumVert_* enumeration.
	:param thePoints:
	:type thePoints: NCollection_Array1<Graphic3d_Vec3d>
	:rtype: None") FrustumPoints;
		void FrustumPoints (NCollection_Array1<Graphic3d_Vec3d> & thePoints);

		/****************** GetIODType ******************/
		%feature("compactdefaultargs") GetIODType;
		%feature("autodoc", "* Get Intraocular distance definition type. returns definition type used for Intraocular distance.
	:rtype: IODType") GetIODType;
		IODType GetIODType ();

		/****************** Graphic3d_Camera ******************/
		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "* Default constructor. Initializes camera with the following properties: Eye (0, 0, -2); Center (0, 0, 0); Up (0, 1, 0); Type (Orthographic); FOVy (45); Scale (1000); IsStereo(false); ZNear (0.001); ZFar (3000.0); Aspect(1); ZFocus(1.0); ZFocusType(Relative); IOD(0.05); IODType(Relative)
	:rtype: None") Graphic3d_Camera;
		 Graphic3d_Camera ();

		/****************** Graphic3d_Camera ******************/
		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "* Copy constructor. @param theOther [in] the camera to copy from.
	:param theOther:
	:type theOther: Graphic3d_Camera
	:rtype: None") Graphic3d_Camera;
		 Graphic3d_Camera (const opencascade::handle<Graphic3d_Camera> & theOther);

		/****************** IOD ******************/
		%feature("compactdefaultargs") IOD;
		%feature("autodoc", "* Get Intraocular distance value. returns absolute or relative IOD value depending on its definition type.
	:rtype: float") IOD;
		Standard_Real IOD ();

		/****************** InvalidateOrientation ******************/
		%feature("compactdefaultargs") InvalidateOrientation;
		%feature("autodoc", "* Invalidate orientation matrix. The matrix will be updated on request.
	:rtype: None") InvalidateOrientation;
		void InvalidateOrientation ();

		/****************** InvalidateProjection ******************/
		%feature("compactdefaultargs") InvalidateProjection;
		%feature("autodoc", "* Invalidate state of projection matrix. The matrix will be updated on request.
	:rtype: None") InvalidateProjection;
		void InvalidateProjection ();

		/****************** IsOrthographic ******************/
		%feature("compactdefaultargs") IsOrthographic;
		%feature("autodoc", "* Check that the camera projection is orthographic. returns boolean flag that indicates whether the camera's projection is orthographic or not.
	:rtype: bool") IsOrthographic;
		Standard_Boolean IsOrthographic ();

		/****************** IsStereo ******************/
		%feature("compactdefaultargs") IsStereo;
		%feature("autodoc", "* Check whether the camera projection is stereo. Please note that stereo rendering is now implemented with support of Quad buffering. returns boolean flag indicating whether the stereographic L/R projection is chosen.
	:rtype: bool") IsStereo;
		Standard_Boolean IsStereo ();

		/****************** MoveEyeTo ******************/
		%feature("compactdefaultargs") MoveEyeTo;
		%feature("autodoc", "* Sets camera Eye position. Unlike SetEye(), this method only changes Eye point and preserves camera direction. @param theEye [in] the location of camera's Eye. @sa SetEye()
	:param theEye:
	:type theEye: gp_Pnt
	:rtype: None") MoveEyeTo;
		void MoveEyeTo (const gp_Pnt & theEye);

		/****************** OrientationMatrix ******************/
		%feature("compactdefaultargs") OrientationMatrix;
		%feature("autodoc", "* @name Lazily-computed orientation and projection matrices derived from camera parameters Get orientation matrix. returns camera orientation matrix.
	:rtype: Graphic3d_Mat4d") OrientationMatrix;
		const Graphic3d_Mat4d & OrientationMatrix ();

		/****************** OrientationMatrixF ******************/
		%feature("compactdefaultargs") OrientationMatrixF;
		%feature("autodoc", "* Get orientation matrix of Standard_ShortReal precision. returns camera orientation matrix.
	:rtype: Graphic3d_Mat4") OrientationMatrixF;
		const Graphic3d_Mat4 & OrientationMatrixF ();

		/****************** OrthogonalizeUp ******************/
		%feature("compactdefaultargs") OrthogonalizeUp;
		%feature("autodoc", "* Orthogonalize up direction vector.
	:rtype: None") OrthogonalizeUp;
		void OrthogonalizeUp ();

		/****************** OrthogonalizedUp ******************/
		%feature("compactdefaultargs") OrthogonalizedUp;
		%feature("autodoc", "* Return a copy of orthogonalized up direction vector.
	:rtype: gp_Dir") OrthogonalizedUp;
		gp_Dir OrthogonalizedUp ();

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* @name Projection methods Project point from world coordinate space to normalized device coordinates (mapping). @param thePnt [in] the 3D point in WCS. returns mapped point in NDC.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt") Project;
		gp_Pnt Project (const gp_Pnt & thePnt);

		/****************** ProjectionMatrix ******************/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "* Get monographic or middle point projection matrix used for monographic rendering and for point projection / unprojection. returns monographic projection matrix.
	:rtype: Graphic3d_Mat4d") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix ();

		/****************** ProjectionMatrixF ******************/
		%feature("compactdefaultargs") ProjectionMatrixF;
		%feature("autodoc", "* Get monographic or middle point projection matrix of Standard_ShortReal precision used for monographic rendering and for point projection / unprojection. returns monographic projection matrix.
	:rtype: Graphic3d_Mat4") ProjectionMatrixF;
		const Graphic3d_Mat4 & ProjectionMatrixF ();

		/****************** ProjectionState ******************/
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "* Returns modification state of camera projection matrix
	:rtype: Standard_Size") ProjectionState;
		Standard_Size ProjectionState ();

		/****************** ProjectionStereoLeft ******************/
		%feature("compactdefaultargs") ProjectionStereoLeft;
		%feature("autodoc", "* returns stereographic matrix computed for left eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
	:rtype: Graphic3d_Mat4d") ProjectionStereoLeft;
		const Graphic3d_Mat4d & ProjectionStereoLeft ();

		/****************** ProjectionStereoLeftF ******************/
		%feature("compactdefaultargs") ProjectionStereoLeftF;
		%feature("autodoc", "* returns stereographic matrix of Standard_ShortReal precision computed for left eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
	:rtype: Graphic3d_Mat4") ProjectionStereoLeftF;
		const Graphic3d_Mat4 & ProjectionStereoLeftF ();

		/****************** ProjectionStereoRight ******************/
		%feature("compactdefaultargs") ProjectionStereoRight;
		%feature("autodoc", "* returns stereographic matrix computed for right eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
	:rtype: Graphic3d_Mat4d") ProjectionStereoRight;
		const Graphic3d_Mat4d & ProjectionStereoRight ();

		/****************** ProjectionStereoRightF ******************/
		%feature("compactdefaultargs") ProjectionStereoRightF;
		%feature("autodoc", "* returns stereographic matrix of Standard_ShortReal precision computed for right eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
	:rtype: Graphic3d_Mat4") ProjectionStereoRightF;
		const Graphic3d_Mat4 & ProjectionStereoRightF ();

		/****************** ProjectionType ******************/
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "* returns camera projection type.
	:rtype: Projection") ProjectionType;
		Projection ProjectionType ();

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "* Get camera scale. returns camera scale factor.
	:rtype: float") Scale;
		Standard_Real Scale ();

		/****************** SetAspect ******************/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "* Changes width / height display ratio. @param theAspect [in] the display ratio.
	:param theAspect:
	:type theAspect: float
	:rtype: None") SetAspect;
		void SetAspect (const Standard_Real theAspect);

		/****************** SetAxialScale ******************/
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "* Set camera axial scale. @param theAxialScale [in] the axial scale vector.
	:param theAxialScale:
	:type theAxialScale: gp_XYZ
	:rtype: None") SetAxialScale;
		void SetAxialScale (const gp_XYZ & theAxialScale);

		/****************** SetCenter ******************/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "* Sets Center of the camera, e.g. the point where camera looks at. This methods changes camera direction, so that the new direction is computed from current Eye position to specified Center position. @param theCenter [in] the point where the camera looks at.
	:param theCenter:
	:type theCenter: gp_Pnt
	:rtype: None") SetCenter;
		void SetCenter (const gp_Pnt & theCenter);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "* Sets camera look direction and computes the new Eye position relative to current Center. WARNING! This method does NOT verify that the current Up() vector is orthogonal to the new Direction. @param theDir [in] the direction.
	:param theDir:
	:type theDir: gp_Dir
	:rtype: None") SetDirection;
		void SetDirection (const gp_Dir & theDir);

		/****************** SetDirectionFromEye ******************/
		%feature("compactdefaultargs") SetDirectionFromEye;
		%feature("autodoc", "* Sets camera look direction preserving the current Eye() position. WARNING! This method does NOT verify that the current Up() vector is orthogonal to the new Direction. @param theDir [in] the direction.
	:param theDir:
	:type theDir: gp_Dir
	:rtype: None") SetDirectionFromEye;
		void SetDirectionFromEye (const gp_Dir & theDir);

		/****************** SetDistance ******************/
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "* Set distance of Eye from camera Center. @param theDistance [in] the distance.
	:param theDistance:
	:type theDistance: float
	:rtype: None") SetDistance;
		void SetDistance (const Standard_Real theDistance);

		/****************** SetEye ******************/
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "* Sets camera Eye position. WARNING! For backward compatibility reasons, this method also changes view direction, so that the new direction is computed from new Eye position to old Center position. @param theEye [in] the location of camera's Eye. @sa MoveEyeTo(), SetEyeAndCenter()
	:param theEye:
	:type theEye: gp_Pnt
	:rtype: None") SetEye;
		void SetEye (const gp_Pnt & theEye);

		/****************** SetEyeAndCenter ******************/
		%feature("compactdefaultargs") SetEyeAndCenter;
		%feature("autodoc", "* Sets camera Eye and Center positions. @param theEye [in] the location of camera's Eye @param theCenter [in] the location of camera's Center
	:param theEye:
	:type theEye: gp_Pnt
	:param theCenter:
	:type theCenter: gp_Pnt
	:rtype: None") SetEyeAndCenter;
		void SetEyeAndCenter (const gp_Pnt & theEye,const gp_Pnt & theCenter);

		/****************** SetFOVy ******************/
		%feature("compactdefaultargs") SetFOVy;
		%feature("autodoc", "* Set Field Of View (FOV) in y axis for perspective projection. @param theFOVy [in] the FOV in degrees.
	:param theFOVy:
	:type theFOVy: float
	:rtype: None") SetFOVy;
		void SetFOVy (const Standard_Real theFOVy);

		/****************** SetIOD ******************/
		%feature("compactdefaultargs") SetIOD;
		%feature("autodoc", "* Sets Intraocular distance. @param theType [in] the IOD definition type. IOD can be defined as absolute value or relatively to (as coefficient of) camera focal length. @param theIOD [in] the Intraocular distance.
	:param theType:
	:type theType: IODType
	:param theIOD:
	:type theIOD: float
	:rtype: None") SetIOD;
		void SetIOD (const IODType theType,const Standard_Real theIOD);

		/****************** SetProjectionType ******************/
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "* Change camera projection type. When switching to perspective projection from orthographic one, the ZNear and ZFar are reset to default values (0.001, 3000.0) if less than 0.0. @param theProjectionType [in] the camera projection type.
	:param theProjection:
	:type theProjection: Projection
	:rtype: None") SetProjectionType;
		void SetProjectionType (const Projection theProjection);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Sets camera scale. For orthographic projection the scale factor corresponds to parallel scale of view mapping (i.e. size of viewport). For perspective camera scale is converted to distance. The scale specifies equal size of the view projection in both dimensions assuming that the aspect is 1.0. The projection height and width are specified with the scale and correspondingly multiplied by the aspect. @param theScale [in] the scale factor.
	:param theScale:
	:type theScale: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real theScale);

		/****************** SetTile ******************/
		%feature("compactdefaultargs") SetTile;
		%feature("autodoc", "* Sets the Tile defining the drawing sub-area within View. Note that tile defining a region outside the view boundaries is also valid - use method Graphic3d_CameraTile::Cropped() to assign a cropped copy. @param theTile tile definition
	:param theTile:
	:type theTile: Graphic3d_CameraTile
	:rtype: None") SetTile;
		void SetTile (const Graphic3d_CameraTile & theTile);

		/****************** SetUp ******************/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "* Sets camera Up direction vector, orthogonal to camera direction. WARNING! This method does NOT verify that the new Up vector is orthogonal to the current Direction(). @param theUp [in] the Up direction vector. @sa OrthogonalizeUp().
	:param theUp:
	:type theUp: gp_Dir
	:rtype: None") SetUp;
		void SetUp (const gp_Dir & theUp);

		/****************** SetZFocus ******************/
		%feature("compactdefaultargs") SetZFocus;
		%feature("autodoc", "* Sets stereographic focus distance. @param theType [in] the focus definition type. Focus can be defined as absolute value or relatively to (as coefficient of) coefficient of camera focal length. @param theZFocus [in] the focus absolute value or coefficient depending on the passed definition type.
	:param theType:
	:type theType: FocusType
	:param theZFocus:
	:type theZFocus: float
	:rtype: None") SetZFocus;
		void SetZFocus (const FocusType theType,const Standard_Real theZFocus);

		/****************** SetZRange ******************/
		%feature("compactdefaultargs") SetZRange;
		%feature("autodoc", "* Change the Near and Far Z-clipping plane positions. For orthographic projection, theZNear, theZFar can be negative or positive. For perspective projection, only positive values are allowed. Program error exception is raised if non-positive values are specified for perspective projection or theZNear >= theZFar. @param theZNear [in] the distance of the plane from the Eye. @param theZFar [in] the distance of the plane from the Eye.
	:param theZNear:
	:type theZNear: float
	:param theZFar:
	:type theZFar: float
	:rtype: None") SetZRange;
		void SetZRange (const Standard_Real theZNear,const Standard_Real theZFar);

		/****************** Tile ******************/
		%feature("compactdefaultargs") Tile;
		%feature("autodoc", "* Get current tile.
	:rtype: Graphic3d_CameraTile") Tile;
		const Graphic3d_CameraTile & Tile ();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* @name Basic camera operations Transform orientation components of the camera: Eye, Up and Center points. @param theTrsf [in] the transformation to apply.
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None") Transform;
		void Transform (const gp_Trsf & theTrsf);

		/****************** UnProject ******************/
		%feature("compactdefaultargs") UnProject;
		%feature("autodoc", "* Unproject point from normalized device coordinates to world coordinate space. @param thePnt [in] the NDC point. returns 3D point in WCS.
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt") UnProject;
		gp_Pnt UnProject (const gp_Pnt & thePnt);

		/****************** Up ******************/
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "* Get camera Up direction vector. returns Camera's Up direction vector.
	:rtype: gp_Dir") Up;
		const gp_Dir  Up ();

		/****************** ViewDimensions ******************/
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "* Calculate view plane size at center (target) point and distance between ZFar and ZNear planes. returns values in form of gp_Pnt (Width, Height, Depth).
	:rtype: gp_XYZ") ViewDimensions;
		gp_XYZ ViewDimensions ();

		/****************** ViewDimensions ******************/
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "* Calculate view plane size at center point with specified Z offset and distance between ZFar and ZNear planes. @param theZValue [in] the distance from the eye in eye-to-center direction returns values in form of gp_Pnt (Width, Height, Depth).
	:param theZValue:
	:type theZValue: float
	:rtype: gp_XYZ") ViewDimensions;
		gp_XYZ ViewDimensions (const Standard_Real theZValue);

		/****************** WorldViewProjState ******************/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "* @name Camera modification state returns projection modification state of the camera.
	:rtype: Graphic3d_WorldViewProjState") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState ();

		/****************** WorldViewState ******************/
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "* Returns modification state of camera world view transformation matrix.
	:rtype: Standard_Size") WorldViewState;
		Standard_Size WorldViewState ();

		/****************** ZFar ******************/
		%feature("compactdefaultargs") ZFar;
		%feature("autodoc", "* Get the Far Z-clipping plane position. returns the distance of the plane from the Eye.
	:rtype: float") ZFar;
		Standard_Real ZFar ();

		/****************** ZFitAll ******************/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "* Estimate Z-min and Z-max planes of projection volume to match the displayed objects. The methods ensures that view volume will be close by depth range to the displayed objects. Fitting assumes that for orthogonal projection the view volume contains the displayed objects completely. For zoomed perspective view, the view volume is adjusted such that it contains the objects or their parts, located in front of the camera. @param theScaleFactor [in] the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed. @param theMinMax [in] applicative min max boundaries. @param theScaleFactor [in] real graphical boundaries (not accounting infinite flag).
	:param theScaleFactor:
	:type theScaleFactor: float
	:param theMinMax:
	:type theMinMax: Bnd_Box
	:param theGraphicBB:
	:type theGraphicBB: Bnd_Box
	:param theZNear:
	:type theZNear: float
	:param theZFar:
	:type theZFar: float
	:rtype: bool") ZFitAll;
		bool ZFitAll (const Standard_Real theScaleFactor,const Bnd_Box & theMinMax,const Bnd_Box & theGraphicBB,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ZFitAll ******************/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "* Change Z-min and Z-max planes of projection volume to match the displayed objects.
	:param theScaleFactor:
	:type theScaleFactor: float
	:param theMinMax:
	:type theMinMax: Bnd_Box
	:param theGraphicBB:
	:type theGraphicBB: Bnd_Box
	:rtype: None") ZFitAll;
		void ZFitAll (const Standard_Real theScaleFactor,const Bnd_Box & theMinMax,const Bnd_Box & theGraphicBB);

		/****************** ZFocus ******************/
		%feature("compactdefaultargs") ZFocus;
		%feature("autodoc", "* Get stereographic focus value. returns absolute or relative stereographic focus value depending on its definition type.
	:rtype: float") ZFocus;
		Standard_Real ZFocus ();

		/****************** ZFocusType ******************/
		%feature("compactdefaultargs") ZFocusType;
		%feature("autodoc", "* Get stereographic focus definition type. returns definition type used for stereographic focus.
	:rtype: FocusType") ZFocusType;
		FocusType ZFocusType ();

		/****************** ZNear ******************/
		%feature("compactdefaultargs") ZNear;
		%feature("autodoc", "* Get the Near Z-clipping plane position. returns the distance of the plane from the Eye.
	:rtype: float") ZNear;
		Standard_Real ZNear ();

};


%make_alias(Graphic3d_Camera)

%extend Graphic3d_Camera {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Graphic3d_CameraTile *
*****************************/
class Graphic3d_CameraTile {
	public:
		Graphic3d_Vec2i TotalSize;
		Graphic3d_Vec2i TileSize;
		Graphic3d_Vec2i Offset;
		bool IsTopDown;
		/****************** Cropped ******************/
		%feature("compactdefaultargs") Cropped;
		%feature("autodoc", "* Return the copy cropped by total size
	:rtype: Graphic3d_CameraTile") Cropped;
		Graphic3d_CameraTile Cropped ();

		/****************** Graphic3d_CameraTile ******************/
		%feature("compactdefaultargs") Graphic3d_CameraTile;
		%feature("autodoc", "* //!< indicate the offset coordinate system - lower-left (default) or top-down Default constructor. Initializes the empty Tile of zero size and lower-left offset orientation. Such Tile is considered uninitialized (invalid).
	:rtype: None") Graphic3d_CameraTile;
		 Graphic3d_CameraTile ();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Return true if Tile has been defined.
	:rtype: bool") IsValid;
		bool IsValid ();

		/****************** OffsetLowerLeft ******************/
		%feature("compactdefaultargs") OffsetLowerLeft;
		%feature("autodoc", "* Return offset position from lower-left corner.
	:rtype: Graphic3d_Vec2i") OffsetLowerLeft;
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

/****************************
* class Graphic3d_ClipPlane *
****************************/
class Graphic3d_ClipPlane : public Standard_Transient {
	public:
typedef Graphic3d_Vec4d Equation;
		/****************** CappingAspect ******************/
		%feature("compactdefaultargs") CappingAspect;
		%feature("autodoc", "* Return capping aspect. returns capping surface rendering aspect.
	:rtype: opencascade::handle<Graphic3d_AspectFillArea3d>") CappingAspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & CappingAspect ();

		/****************** CappingColor ******************/
		%feature("compactdefaultargs") CappingColor;
		%feature("autodoc", "* Return color for rendering capping surface.
	:rtype: Quantity_Color") CappingColor;
		Quantity_Color CappingColor ();

		/****************** CappingCustomHatch ******************/
		%feature("compactdefaultargs") CappingCustomHatch;
		%feature("autodoc", "* returns hatching style.
	:rtype: opencascade::handle<Graphic3d_HatchStyle>") CappingCustomHatch;
		const opencascade::handle<Graphic3d_HatchStyle> & CappingCustomHatch ();

		/****************** CappingHatch ******************/
		%feature("compactdefaultargs") CappingHatch;
		%feature("autodoc", "* returns hatching style.
	:rtype: Aspect_HatchStyle") CappingHatch;
		Aspect_HatchStyle CappingHatch ();

		/****************** CappingMaterial ******************/
		%feature("compactdefaultargs") CappingMaterial;
		%feature("autodoc", "* returns capping material.
	:rtype: Graphic3d_MaterialAspect") CappingMaterial;
		const Graphic3d_MaterialAspect & CappingMaterial ();

		/****************** CappingTexture ******************/
		%feature("compactdefaultargs") CappingTexture;
		%feature("autodoc", "* returns capping texture map.
	:rtype: opencascade::handle<Graphic3d_TextureMap>") CappingTexture;
		opencascade::handle<Graphic3d_TextureMap> CappingTexture ();

		/****************** ChainNextPlane ******************/
		%feature("compactdefaultargs") ChainNextPlane;
		%feature("autodoc", "* Return the next plane in a Chain of Planes defining logical AND operation, or NULL if there is no chain or it is a last element in chain.
	:rtype: opencascade::handle<Graphic3d_ClipPlane>") ChainNextPlane;
		const opencascade::handle<Graphic3d_ClipPlane> & ChainNextPlane ();

		/****************** ChainPreviousPlane ******************/
		%feature("compactdefaultargs") ChainPreviousPlane;
		%feature("autodoc", "* Return the previous plane in a Chain of Planes defining logical AND operation, or NULL if there is no Chain or it is a first element in Chain. When clipping is defined by a Chain of Planes, it cuts a space only in case if check fails for all Planes in Chain.
	:rtype: opencascade::handle<Graphic3d_ClipPlane>") ChainPreviousPlane;
		opencascade::handle<Graphic3d_ClipPlane> ChainPreviousPlane ();

		/****************** Clone ******************/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "* Clone plane. Virtual method to simplify copying procedure if plane class is redefined at application level to add specific fields to it e.g. id, name, etc. returns new instance of clipping plane with same properties and attributes.
	:rtype: opencascade::handle<Graphic3d_ClipPlane>") Clone;
		virtual opencascade::handle<Graphic3d_ClipPlane> Clone ();

		/****************** GetEquation ******************/
		%feature("compactdefaultargs") GetEquation;
		%feature("autodoc", "* Get 4-component equation vector for clipping plane. returns clipping plane equation vector.
	:rtype: Graphic3d_Vec4d") GetEquation;
		const Graphic3d_Vec4d & GetEquation ();

		/****************** GetId ******************/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "* This ID is used for managing associated resources in graphical driver. The clip plane can be assigned within a range of IO which can be displayed in separate OpenGl contexts. For each of the context an associated OpenGl resource for graphical aspects should be created and kept. The resources are stored in graphical driver for each of individual groups of shared context under the clip plane identifier. returns clip plane resource identifier string.
	:rtype: TCollection_AsciiString") GetId;
		const TCollection_AsciiString & GetId ();

		/****************** Graphic3d_ClipPlane ******************/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "* Default constructor. Initializes clip plane container with the following properties: - Equation (0.0, 0.0, 1.0, 0) - IsOn (True), - IsCapping (False), - Material (Graphic3d_NOM_DEFAULT), - Texture (NULL), - HatchStyle (Aspect_HS_HORIZONTAL), - IsHatchOn (False)
	:rtype: None") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane ();

		/****************** Graphic3d_ClipPlane ******************/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "* Copy constructor. @param theOther [in] the copied plane.
	:param theOther:
	:type theOther: Graphic3d_ClipPlane
	:rtype: None") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane (const Graphic3d_ClipPlane & theOther);

		/****************** Graphic3d_ClipPlane ******************/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "* Construct clip plane for the passed equation. By default the plane is on, capping is turned off. @param theEquation [in] the plane equation.
	:param theEquation:
	:type theEquation: Graphic3d_Vec4d
	:rtype: None") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane (const Graphic3d_Vec4d & theEquation);

		/****************** Graphic3d_ClipPlane ******************/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "* Construct clip plane from the passed geometrical definition. By default the plane is on, capping is turned off. @param thePlane [in] the plane.
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane (const gp_Pln & thePlane);

		/****************** IsBoxFullInHalfspace ******************/
		%feature("compactdefaultargs") IsBoxFullInHalfspace;
		%feature("autodoc", "* Check if the given bounding box is fully inside (or touches from inside) the half-space (e.g. NOT discarded by clipping plane).
	:param theBox:
	:type theBox: Graphic3d_BndBox3d
	:rtype: bool") IsBoxFullInHalfspace;
		bool IsBoxFullInHalfspace (const Graphic3d_BndBox3d & theBox);

		/****************** IsBoxFullOutHalfspace ******************/
		%feature("compactdefaultargs") IsBoxFullOutHalfspace;
		%feature("autodoc", "* Check if the given bounding box is fully outside of the half-space (e.g. should be discarded by clipping plane).
	:param theBox:
	:type theBox: Graphic3d_BndBox3d
	:rtype: bool") IsBoxFullOutHalfspace;
		bool IsBoxFullOutHalfspace (const Graphic3d_BndBox3d & theBox);

		/****************** IsCapping ******************/
		%feature("compactdefaultargs") IsCapping;
		%feature("autodoc", "* Check state of capping surface rendering. returns true (turned on) or false depending on the state.
	:rtype: bool") IsCapping;
		Standard_Boolean IsCapping ();

		/****************** IsChain ******************/
		%feature("compactdefaultargs") IsChain;
		%feature("autodoc", "* Return True if this item defines a conjunction (logical AND) between a set of Planes. Graphic3d_ClipPlane item defines either a Clipping halfspace (single Clipping Plane) or a Clipping volume defined by a logical AND (conjunction) operation between a set of Planes defined as a Chain (so that the volume cuts a space only in case if check fails for ALL Planes in the Chain). //! Note that Graphic3d_ClipPlane item cannot: - Define a Chain with logical OR (disjunction) operation; this should be done through Graphic3d_SequenceOfHClipPlane. - Define nested Chains. - Disable Chain items; only entire Chain can be disabled (by disabled a head of Chain). //! The head of a Chain defines all visual properties of the Chain, so that Graphic3d_ClipPlane of next items in a Chain merely defines only geometrical definition of the plane.
	:rtype: bool") IsChain;
		Standard_Boolean IsChain ();

		/****************** IsHatchOn ******************/
		%feature("compactdefaultargs") IsHatchOn;
		%feature("autodoc", "* returns True if hatching mask is turned on.
	:rtype: bool") IsHatchOn;
		Standard_Boolean IsHatchOn ();

		/****************** IsOn ******************/
		%feature("compactdefaultargs") IsOn;
		%feature("autodoc", "* Check that the clipping plane is turned on. returns boolean flag indicating whether the plane is in on or off state.
	:rtype: bool") IsOn;
		Standard_Boolean IsOn ();

		/****************** IsPointOutHalfspace ******************/
		%feature("compactdefaultargs") IsPointOutHalfspace;
		%feature("autodoc", "* Check if the given point is outside of the half-space (e.g. should be discarded by clipping plane).
	:param thePoint:
	:type thePoint: Graphic3d_Vec4d
	:rtype: bool") IsPointOutHalfspace;
		bool IsPointOutHalfspace (const Graphic3d_Vec4d & thePoint);

		/****************** MCountAspect ******************/
		%feature("compactdefaultargs") MCountAspect;
		%feature("autodoc", "* returns modification counter for aspect.
	:rtype: unsigned int") MCountAspect;
		unsigned int MCountAspect ();

		/****************** MCountEquation ******************/
		%feature("compactdefaultargs") MCountEquation;
		%feature("autodoc", "* returns modification counter for equation.
	:rtype: unsigned int") MCountEquation;
		unsigned int MCountEquation ();

		/****************** NbChainNextPlanes ******************/
		%feature("compactdefaultargs") NbChainNextPlanes;
		%feature("autodoc", "* Return the number of chains in forward direction (including this item, so it is always >= 1). For a head of Chain - returns the length of entire Chain.
	:rtype: int") NbChainNextPlanes;
		Standard_Integer NbChainNextPlanes ();

		/****************** ProbeBox ******************/
		%feature("compactdefaultargs") ProbeBox;
		%feature("autodoc", "* Check if the given bounding box is fully outside / fully inside.
	:param theBox:
	:type theBox: Graphic3d_BndBox3d
	:rtype: Graphic3d_ClipState") ProbeBox;
		Graphic3d_ClipState ProbeBox (const Graphic3d_BndBox3d & theBox);

		/****************** ProbeBoxHalfspace ******************/
		%feature("compactdefaultargs") ProbeBoxHalfspace;
		%feature("autodoc", "* Check if the given bounding box is fully outside / fully inside the half-space.
	:param theBox:
	:type theBox: Graphic3d_BndBox3d
	:rtype: Graphic3d_ClipState") ProbeBoxHalfspace;
		Graphic3d_ClipState ProbeBoxHalfspace (const Graphic3d_BndBox3d & theBox);

		/****************** ProbeBoxMaxPointHalfspace ******************/
		%feature("compactdefaultargs") ProbeBoxMaxPointHalfspace;
		%feature("autodoc", "* Check if the given bounding box is fully outside of the half-space (e.g. should be discarded by clipping plane).
	:param theBox:
	:type theBox: Graphic3d_BndBox3d
	:rtype: Graphic3d_ClipState") ProbeBoxMaxPointHalfspace;
		Graphic3d_ClipState ProbeBoxMaxPointHalfspace (const Graphic3d_BndBox3d & theBox);

		/****************** ProbeBoxTouch ******************/
		%feature("compactdefaultargs") ProbeBoxTouch;
		%feature("autodoc", "* Check if the given bounding box is In and touch the clipping planes
	:param theBox:
	:type theBox: Graphic3d_BndBox3d
	:rtype: bool") ProbeBoxTouch;
		Standard_Boolean ProbeBoxTouch (const Graphic3d_BndBox3d & theBox);

		/****************** ProbePoint ******************/
		%feature("compactdefaultargs") ProbePoint;
		%feature("autodoc", "* Check if the given point is outside / inside / on section.
	:param thePoint:
	:type thePoint: Graphic3d_Vec4d
	:rtype: Graphic3d_ClipState") ProbePoint;
		Graphic3d_ClipState ProbePoint (const Graphic3d_Vec4d & thePoint);

		/****************** ProbePointHalfspace ******************/
		%feature("compactdefaultargs") ProbePointHalfspace;
		%feature("autodoc", "* Check if the given point is outside of the half-space (e.g. should be discarded by clipping plane).
	:param thePoint:
	:type thePoint: Graphic3d_Vec4d
	:rtype: Graphic3d_ClipState") ProbePointHalfspace;
		Graphic3d_ClipState ProbePointHalfspace (const Graphic3d_Vec4d & thePoint);

		/****************** ReversedEquation ******************/
		%feature("compactdefaultargs") ReversedEquation;
		%feature("autodoc", "* Get 4-component equation vector for clipping plane. returns clipping plane equation vector.
	:rtype: Graphic3d_Vec4d") ReversedEquation;
		const Graphic3d_Vec4d & ReversedEquation ();

		/****************** SetCapping ******************/
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "* Change state of capping surface rendering. @param theIsOn [in] the flag specifying whether the graphic driver should perform rendering of capping surface produced by this plane. The graphic driver produces this surface for convex graphics by means of stencil-test and multi-pass rendering.
	:param theIsOn:
	:type theIsOn: bool
	:rtype: None") SetCapping;
		void SetCapping (const Standard_Boolean theIsOn);

		/****************** SetCappingAspect ******************/
		%feature("compactdefaultargs") SetCappingAspect;
		%feature("autodoc", "* Assign capping aspect.
	:param theAspect:
	:type theAspect: Graphic3d_AspectFillArea3d
	:rtype: None") SetCappingAspect;
		void SetCappingAspect (const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** SetCappingColor ******************/
		%feature("compactdefaultargs") SetCappingColor;
		%feature("autodoc", "* Set color for rendering capping surface.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetCappingColor;
		void SetCappingColor (const Quantity_Color & theColor);

		/****************** SetCappingCustomHatch ******************/
		%feature("compactdefaultargs") SetCappingCustomHatch;
		%feature("autodoc", "* Set custom hatch style (stipple) and turn hatching on. @param theStyle [in] the hatch pattern.
	:param theStyle:
	:type theStyle: Graphic3d_HatchStyle
	:rtype: None") SetCappingCustomHatch;
		void SetCappingCustomHatch (const opencascade::handle<Graphic3d_HatchStyle> & theStyle);

		/****************** SetCappingHatch ******************/
		%feature("compactdefaultargs") SetCappingHatch;
		%feature("autodoc", "* Set hatch style (stipple) and turn hatching on. @param theStyle [in] the hatch style.
	:param theStyle:
	:type theStyle: Aspect_HatchStyle
	:rtype: None") SetCappingHatch;
		void SetCappingHatch (const Aspect_HatchStyle theStyle);

		/****************** SetCappingHatchOff ******************/
		%feature("compactdefaultargs") SetCappingHatchOff;
		%feature("autodoc", "* Turn off hatching.
	:rtype: None") SetCappingHatchOff;
		void SetCappingHatchOff ();

		/****************** SetCappingHatchOn ******************/
		%feature("compactdefaultargs") SetCappingHatchOn;
		%feature("autodoc", "* Turn on hatching.
	:rtype: None") SetCappingHatchOn;
		void SetCappingHatchOn ();

		/****************** SetCappingMaterial ******************/
		%feature("compactdefaultargs") SetCappingMaterial;
		%feature("autodoc", "* Set material for rendering capping surface. @param theMat [in] the material.
	:param theMat:
	:type theMat: Graphic3d_MaterialAspect
	:rtype: None") SetCappingMaterial;
		void SetCappingMaterial (const Graphic3d_MaterialAspect & theMat);

		/****************** SetCappingTexture ******************/
		%feature("compactdefaultargs") SetCappingTexture;
		%feature("autodoc", "* Set texture to be applied on capping surface. @param theTexture [in] the texture.
	:param theTexture:
	:type theTexture: Graphic3d_TextureMap
	:rtype: None") SetCappingTexture;
		void SetCappingTexture (const opencascade::handle<Graphic3d_TextureMap> & theTexture);

		/****************** SetChainNextPlane ******************/
		%feature("compactdefaultargs") SetChainNextPlane;
		%feature("autodoc", "* Set the next plane in a Chain of Planes. This operation also updates relationship between chains (Previous/Next items), so that the previously set Next plane is cut off.
	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane
	:rtype: None") SetChainNextPlane;
		void SetChainNextPlane (const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** SetEquation ******************/
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "* Set plane equation by its geometrical definition. The equation is specified in 'world' coordinate system. @param thePlane [in] the plane.
	:param thePlane:
	:type thePlane: gp_Pln
	:rtype: None") SetEquation;
		void SetEquation (const gp_Pln & thePlane);

		/****************** SetEquation ******************/
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "* Set 4-component equation vector for clipping plane. The equation is specified in 'world' coordinate system. @param theEquation [in] the XYZW (or 'ABCD') equation vector.
	:param theEquation:
	:type theEquation: Graphic3d_Vec4d
	:rtype: None") SetEquation;
		void SetEquation (const Graphic3d_Vec4d & theEquation);

		/****************** SetOn ******************/
		%feature("compactdefaultargs") SetOn;
		%feature("autodoc", "* Change state of the clipping plane. @param theIsOn [in] the flag specifying whether the graphic driver clipping by this plane should be turned on or off.
	:param theIsOn:
	:type theIsOn: bool
	:rtype: None") SetOn;
		void SetOn (const Standard_Boolean theIsOn);

		/****************** SetUseObjectMaterial ******************/
		%feature("compactdefaultargs") SetUseObjectMaterial;
		%feature("autodoc", "* Set flag for controlling the source of capping plane material.
	:param theToUse:
	:type theToUse: bool
	:rtype: None") SetUseObjectMaterial;
		void SetUseObjectMaterial (bool theToUse);

		/****************** SetUseObjectShader ******************/
		%feature("compactdefaultargs") SetUseObjectShader;
		%feature("autodoc", "* Set flag for controlling the source of capping plane shader program.
	:param theToUse:
	:type theToUse: bool
	:rtype: None") SetUseObjectShader;
		void SetUseObjectShader (bool theToUse);

		/****************** SetUseObjectTexture ******************/
		%feature("compactdefaultargs") SetUseObjectTexture;
		%feature("autodoc", "* Set flag for controlling the source of capping plane texture.
	:param theToUse:
	:type theToUse: bool
	:rtype: None") SetUseObjectTexture;
		void SetUseObjectTexture (bool theToUse);

		/****************** ToPlane ******************/
		%feature("compactdefaultargs") ToPlane;
		%feature("autodoc", "* Get geometrical definition. returns geometrical definition of clipping plane
	:rtype: gp_Pln") ToPlane;
		const gp_Pln  ToPlane ();

		/****************** ToUseObjectMaterial ******************/
		%feature("compactdefaultargs") ToUseObjectMaterial;
		%feature("autodoc", "* Flag indicating whether material for capping plane should be taken from object. Default value: False (use dedicated capping plane material).
	:rtype: bool") ToUseObjectMaterial;
		bool ToUseObjectMaterial ();

		/****************** ToUseObjectProperties ******************/
		%feature("compactdefaultargs") ToUseObjectProperties;
		%feature("autodoc", "* Return true if some fill area aspect properties should be taken from object.
	:rtype: bool") ToUseObjectProperties;
		bool ToUseObjectProperties ();

		/****************** ToUseObjectShader ******************/
		%feature("compactdefaultargs") ToUseObjectShader;
		%feature("autodoc", "* Flag indicating whether shader program for capping plane should be taken from object. Default value: False.
	:rtype: bool") ToUseObjectShader;
		bool ToUseObjectShader ();

		/****************** ToUseObjectTexture ******************/
		%feature("compactdefaultargs") ToUseObjectTexture;
		%feature("autodoc", "* Flag indicating whether texture for capping plane should be taken from object. Default value: False.
	:rtype: bool") ToUseObjectTexture;
		bool ToUseObjectTexture ();

};


%make_alias(Graphic3d_ClipPlane)

%extend Graphic3d_ClipPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_CubeMapOrder *
*******************************/
/******************************
* class Graphic3d_CullingTool *
******************************/
class Graphic3d_CullingTool {
	public:
		class CullingContext {};
		class Plane {};
		/****************** CacheClipPtsProjections ******************/
		%feature("compactdefaultargs") CacheClipPtsProjections;
		%feature("autodoc", "* Caches view volume's vertices projections along its normals and AABBs dimensions. Must be called at the beginning of each BVH tree traverse loop.
	:rtype: None") CacheClipPtsProjections;
		void CacheClipPtsProjections ();

		/****************** Camera ******************/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "* Return the camera definition.
	:rtype: opencascade::handle<Graphic3d_Camera>") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera ();

		/****************** Graphic3d_CullingTool ******************/
		%feature("compactdefaultargs") Graphic3d_CullingTool;
		%feature("autodoc", "* Creates an empty selector object with parallel projection type by default.
	:rtype: None") Graphic3d_CullingTool;
		 Graphic3d_CullingTool ();

		/****************** IsCulled ******************/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "* Checks whether given AABB should be entirely culled or not. @param theCtx [in] culling properties @param theMinPt [in] maximum point of AABB @param theMaxPt [in] minimum point of AABB returns Standard_True, if AABB is in viewing area, Standard_False otherwise
	:param theCtx:
	:type theCtx: CullingContext
	:param theMinPt:
	:type theMinPt: Graphic3d_Vec3d
	:param theMaxPt:
	:type theMaxPt: Graphic3d_Vec3d
	:rtype: bool") IsCulled;
		bool IsCulled (const CullingContext & theCtx,const Graphic3d_Vec3d & theMinPt,const Graphic3d_Vec3d & theMaxPt);

		/****************** ProjectionMatrix ******************/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "* Returns current projection matrix.
	:rtype: Graphic3d_Mat4d") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix ();

		/****************** SetCullingDistance ******************/
		%feature("compactdefaultargs") SetCullingDistance;
		%feature("autodoc", "* Setup distance culling.
	:param theCtx:
	:type theCtx: CullingContext
	:param theDistance:
	:type theDistance: float
	:rtype: None") SetCullingDistance;
		void SetCullingDistance (CullingContext & theCtx,Standard_Real theDistance);

		/****************** SetCullingSize ******************/
		%feature("compactdefaultargs") SetCullingSize;
		%feature("autodoc", "* Setup size culling.
	:param theCtx:
	:type theCtx: CullingContext
	:param theSize:
	:type theSize: float
	:rtype: None") SetCullingSize;
		void SetCullingSize (CullingContext & theCtx,Standard_Real theSize);

		/****************** SetViewVolume ******************/
		%feature("compactdefaultargs") SetViewVolume;
		%feature("autodoc", "* Retrieves view volume's planes equations and its vertices from projection and world-view matrices.
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:rtype: None") SetViewVolume;
		void SetViewVolume (const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****************** SetViewportSize ******************/
		%feature("compactdefaultargs") SetViewportSize;
		%feature("autodoc", ":param theViewportWidth:
	:type theViewportWidth: int
	:param theViewportHeight:
	:type theViewportHeight: int
	:param theResolutionRatio:
	:type theResolutionRatio: float
	:rtype: None") SetViewportSize;
		void SetViewportSize (Standard_Integer theViewportWidth,Standard_Integer theViewportHeight,Standard_Real theResolutionRatio);

		/****************** ViewportHeight ******************/
		%feature("compactdefaultargs") ViewportHeight;
		%feature("autodoc", ":rtype: int") ViewportHeight;
		Standard_Integer ViewportHeight ();

		/****************** ViewportWidth ******************/
		%feature("compactdefaultargs") ViewportWidth;
		%feature("autodoc", ":rtype: int") ViewportWidth;
		Standard_Integer ViewportWidth ();

		/****************** WorldViewMatrix ******************/
		%feature("compactdefaultargs") WorldViewMatrix;
		%feature("autodoc", "* Returns current world view transformation matrix.
	:rtype: Graphic3d_Mat4d") WorldViewMatrix;
		const Graphic3d_Mat4d & WorldViewMatrix ();

		/****************** WorldViewProjState ******************/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "* Returns state of current world view projection transformation matrices.
	:rtype: Graphic3d_WorldViewProjState") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState ();

};


%extend Graphic3d_CullingTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Graphic3d_DataStructureManager *
***************************************/
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

/*****************************
* class Graphic3d_FrameStats *
*****************************/
%nodefaultctor Graphic3d_FrameStats;
class Graphic3d_FrameStats : public Standard_Transient {
	public:
		/****************** ActiveDataFrame ******************/
		%feature("compactdefaultargs") ActiveDataFrame;
		%feature("autodoc", "* Returns currently filling data frame for modification, should be called between ::FrameStart() and ::FrameEnd() calls.
	:rtype: Graphic3d_FrameStatsDataTmp") ActiveDataFrame;
		Graphic3d_FrameStatsDataTmp & ActiveDataFrame ();

		/****************** ChangeCounter ******************/
		%feature("compactdefaultargs") ChangeCounter;
		%feature("autodoc", "* Returns value of specified counter for modification, should be called between ::FrameStart() and ::FrameEnd() calls.
	:param theCounter:
	:type theCounter: Graphic3d_FrameStatsCounter
	:rtype: Standard_Size") ChangeCounter;
		Standard_Size & ChangeCounter (Graphic3d_FrameStatsCounter theCounter);

		/****************** ChangeDataFrames ******************/
		%feature("compactdefaultargs") ChangeDataFrames;
		%feature("autodoc", "* Returns data frames.
	:rtype: NCollection_Array1<Graphic3d_FrameStatsData>") ChangeDataFrames;
		NCollection_Array1<Graphic3d_FrameStatsData> & ChangeDataFrames ();


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeTimer(Graphic3d_FrameStatsTimer theTimer) {
            return (Standard_Real) $self->ChangeTimer(theTimer);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeTimer(Graphic3d_FrameStatsTimer theTimer,Standard_Real value) {
            $self->ChangeTimer(theTimer)=value;
            }
        };
		/****************** CounterValue ******************/
		%feature("compactdefaultargs") CounterValue;
		%feature("autodoc", "* Returns value of specified counter, cached between stats updates. Should NOT be called between ::FrameStart() and ::FrameEnd() calls.
	:param theCounter:
	:type theCounter: Graphic3d_FrameStatsCounter
	:rtype: Standard_Size") CounterValue;
		Standard_Size CounterValue (Graphic3d_FrameStatsCounter theCounter);

		/****************** DataFrames ******************/
		%feature("compactdefaultargs") DataFrames;
		%feature("autodoc", "* Returns data frames.
	:rtype: NCollection_Array1<Graphic3d_FrameStatsData>") DataFrames;
		const NCollection_Array1<Graphic3d_FrameStatsData> & DataFrames ();

		/****************** FormatStats ******************/
		%feature("compactdefaultargs") FormatStats;
		%feature("autodoc", "* Returns formatted string.
	:param theFlags:
	:type theFlags: Graphic3d_RenderingParams::PerfCounters
	:rtype: TCollection_AsciiString") FormatStats;
		virtual TCollection_AsciiString FormatStats (Graphic3d_RenderingParams::PerfCounters theFlags);

		/****************** FormatStats ******************/
		%feature("compactdefaultargs") FormatStats;
		%feature("autodoc", "* Fill in the dictionary with formatted statistic info.
	:param theDict:
	:type theDict: TColStd_IndexedDataMapOfStringString
	:param theFlags:
	:type theFlags: Graphic3d_RenderingParams::PerfCounters
	:rtype: void") FormatStats;
		virtual void FormatStats (TColStd_IndexedDataMapOfStringString & theDict,Graphic3d_RenderingParams::PerfCounters theFlags);

		/****************** FrameDuration ******************/
		%feature("compactdefaultargs") FrameDuration;
		%feature("autodoc", "* Returns duration of the last frame in seconds.
	:rtype: float") FrameDuration;
		Standard_Real FrameDuration ();

		/****************** FrameEnd ******************/
		%feature("compactdefaultargs") FrameEnd;
		%feature("autodoc", "* Frame redraw finished.
	:param theView:
	:type theView: Graphic3d_CView
	:param theIsImmediateOnly:
	:type theIsImmediateOnly: bool
	:rtype: void") FrameEnd;
		virtual void FrameEnd (const opencascade::handle<Graphic3d_CView> & theView,bool theIsImmediateOnly);

		/****************** FrameRate ******************/
		%feature("compactdefaultargs") FrameRate;
		%feature("autodoc", "* Returns FPS (frames per seconds, elapsed time). This number indicates an actual frame rate averaged for several frames within UpdateInterval() duration, basing on a real elapsed time between updates.
	:rtype: float") FrameRate;
		Standard_Real FrameRate ();

		/****************** FrameRateCpu ******************/
		%feature("compactdefaultargs") FrameRateCpu;
		%feature("autodoc", "* Returns CPU FPS (frames per seconds, CPU time). This number indicates a PREDICTED frame rate, basing on CPU elapsed time between updates and NOT real elapsed time (which might include periods of CPU inactivity). Number is expected to be greater then actual frame rate returned by FrameRate(). Values significantly greater actual frame rate indicate that rendering is limited by GPU performance (CPU is stalled in-between), while values around actual frame rate indicate rendering being limited by CPU performance (GPU is stalled in-between).
	:rtype: float") FrameRateCpu;
		Standard_Real FrameRateCpu ();

		/****************** FrameStart ******************/
		%feature("compactdefaultargs") FrameStart;
		%feature("autodoc", "* Frame redraw started.
	:param theView:
	:type theView: Graphic3d_CView
	:param theIsImmediateOnly:
	:type theIsImmediateOnly: bool
	:rtype: void") FrameStart;
		virtual void FrameStart (const opencascade::handle<Graphic3d_CView> & theView,bool theIsImmediateOnly);

		/****************** HasCulledLayers ******************/
		%feature("compactdefaultargs") HasCulledLayers;
		%feature("autodoc", "* Returns True if some Layers have been culled.
	:rtype: bool") HasCulledLayers;
		Standard_Boolean HasCulledLayers ();

		/****************** HasCulledStructs ******************/
		%feature("compactdefaultargs") HasCulledStructs;
		%feature("autodoc", "* Returns True if some structures have been culled.
	:rtype: bool") HasCulledStructs;
		Standard_Boolean HasCulledStructs ();

		/****************** IsLongLineFormat ******************/
		%feature("compactdefaultargs") IsLongLineFormat;
		%feature("autodoc", "* Prefer longer lines over more greater of lines.
	:rtype: bool") IsLongLineFormat;
		Standard_Boolean IsLongLineFormat ();

		/****************** LastDataFrame ******************/
		%feature("compactdefaultargs") LastDataFrame;
		%feature("autodoc", "* Returns last data frame, cached between stats updates. Should NOT be called between ::FrameStart() and ::FrameEnd() calls.
	:rtype: Graphic3d_FrameStatsData") LastDataFrame;
		const Graphic3d_FrameStatsData & LastDataFrame ();

		/****************** LastDataFrameIndex ******************/
		%feature("compactdefaultargs") LastDataFrameIndex;
		%feature("autodoc", "* Returns last data frame index.
	:rtype: int") LastDataFrameIndex;
		Standard_Integer LastDataFrameIndex ();

		/****************** SetLongLineFormat ******************/
		%feature("compactdefaultargs") SetLongLineFormat;
		%feature("autodoc", "* Set if format should prefer longer lines over greater number of lines.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetLongLineFormat;
		void SetLongLineFormat (Standard_Boolean theValue);

		/****************** SetUpdateInterval ******************/
		%feature("compactdefaultargs") SetUpdateInterval;
		%feature("autodoc", "* Sets interval in seconds for updating values.
	:param theInterval:
	:type theInterval: float
	:rtype: None") SetUpdateInterval;
		void SetUpdateInterval (Standard_Real theInterval);

		/****************** TimerValue ******************/
		%feature("compactdefaultargs") TimerValue;
		%feature("autodoc", "* Returns value of specified timer for modification, should be called between ::FrameStart() and ::FrameEnd() calls. Should NOT be called between ::FrameStart() and ::FrameEnd() calls.
	:param theTimer:
	:type theTimer: Graphic3d_FrameStatsTimer
	:rtype: float") TimerValue;
		Standard_Real TimerValue (Graphic3d_FrameStatsTimer theTimer);

		/****************** UpdateInterval ******************/
		%feature("compactdefaultargs") UpdateInterval;
		%feature("autodoc", "* Returns interval in seconds for updating meters across several frames; 1 second by default.
	:rtype: float") UpdateInterval;
		Standard_Real UpdateInterval ();

};


%make_alias(Graphic3d_FrameStats)

%extend Graphic3d_FrameStats {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Graphic3d_FrameStatsData *
*********************************/
class Graphic3d_FrameStatsData {
	public:
		/****************** CounterValue ******************/
		%feature("compactdefaultargs") CounterValue;
		%feature("autodoc", "* Get counter value.
	:param theIndex:
	:type theIndex: Graphic3d_FrameStatsCounter
	:rtype: Standard_Size") CounterValue;
		Standard_Size CounterValue (Graphic3d_FrameStatsCounter theIndex);

		/****************** FillMax ******************/
		%feature("compactdefaultargs") FillMax;
		%feature("autodoc", "* Fill with maximum values.
	:param theOther:
	:type theOther: Graphic3d_FrameStatsData
	:rtype: None") FillMax;
		void FillMax (const Graphic3d_FrameStatsData & theOther);

		/****************** FrameRate ******************/
		%feature("compactdefaultargs") FrameRate;
		%feature("autodoc", "* Returns FPS (frames per seconds, elapsed time). This number indicates an actual frame rate averaged for several frames within UpdateInterval() duration, basing on a real elapsed time between updates.
	:rtype: float") FrameRate;
		Standard_Real FrameRate ();

		/****************** FrameRateCpu ******************/
		%feature("compactdefaultargs") FrameRateCpu;
		%feature("autodoc", "* Returns CPU FPS (frames per seconds, CPU time). This number indicates a PREDICTED frame rate, basing on CPU elapsed time between updates and NOT real elapsed time (which might include periods of CPU inactivity). Number is expected to be greater then actual frame rate returned by FrameRate(). Values significantly greater actual frame rate indicate that rendering is limited by GPU performance (CPU is stalled in-between), while values around actual frame rate indicate rendering being limited by CPU performance (GPU is stalled in-between).
	:rtype: float") FrameRateCpu;
		Standard_Real FrameRateCpu ();

		/****************** Graphic3d_FrameStatsData ******************/
		%feature("compactdefaultargs") Graphic3d_FrameStatsData;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_FrameStatsData;
		 Graphic3d_FrameStatsData ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset data.
	:rtype: None") Reset;
		void Reset ();

		/****************** TimerValue ******************/
		%feature("compactdefaultargs") TimerValue;
		%feature("autodoc", "* Get timer value.
	:param theIndex:
	:type theIndex: Graphic3d_FrameStatsTimer
	:rtype: float") TimerValue;
		Standard_Real TimerValue (Graphic3d_FrameStatsTimer theIndex);

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "* Assignment operator.
	:param theOther:
	:type theOther: Graphic3d_FrameStatsData
	:rtype: Graphic3d_FrameStatsData") operator =;
		Graphic3d_FrameStatsData & operator = (const Graphic3d_FrameStatsData & theOther);

};


%extend Graphic3d_FrameStatsData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Graphic3d_Fresnel *
**************************/
class Graphic3d_Fresnel {
	public:
		/****************** CreateConductor ******************/
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "* Creates Fresnel factor for physical-based conductor model.
	:param theRefractionIndex:
	:type theRefractionIndex: Standard_ShortReal
	:param theAbsorptionIndex:
	:type theAbsorptionIndex: Standard_ShortReal
	:rtype: Graphic3d_Fresnel") CreateConductor;
		static Graphic3d_Fresnel CreateConductor (Standard_ShortReal theRefractionIndex,Standard_ShortReal theAbsorptionIndex);

		/****************** CreateConductor ******************/
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "* Creates Fresnel factor for physical-based conductor model (spectral version).
	:param theRefractionIndex:
	:type theRefractionIndex: Graphic3d_Vec3
	:param theAbsorptionIndex:
	:type theAbsorptionIndex: Graphic3d_Vec3
	:rtype: Graphic3d_Fresnel") CreateConductor;
		static Graphic3d_Fresnel CreateConductor (const Graphic3d_Vec3 & theRefractionIndex,const Graphic3d_Vec3 & theAbsorptionIndex);

		/****************** CreateConstant ******************/
		%feature("compactdefaultargs") CreateConstant;
		%feature("autodoc", "* Creates Fresnel factor for constant reflection.
	:param theReflection:
	:type theReflection: Standard_ShortReal
	:rtype: Graphic3d_Fresnel") CreateConstant;
		static Graphic3d_Fresnel CreateConstant (const Standard_ShortReal theReflection);

		/****************** CreateDielectric ******************/
		%feature("compactdefaultargs") CreateDielectric;
		%feature("autodoc", "* Creates Fresnel factor for physical-based dielectric model.
	:param theRefractionIndex:
	:type theRefractionIndex: Standard_ShortReal
	:rtype: Graphic3d_Fresnel") CreateDielectric;
		static Graphic3d_Fresnel CreateDielectric (Standard_ShortReal theRefractionIndex);

		/****************** CreateSchlick ******************/
		%feature("compactdefaultargs") CreateSchlick;
		%feature("autodoc", "* Creates Schlick's approximation of Fresnel factor.
	:param theSpecularColor:
	:type theSpecularColor: Graphic3d_Vec3
	:rtype: Graphic3d_Fresnel") CreateSchlick;
		static Graphic3d_Fresnel CreateSchlick (const Graphic3d_Vec3 & theSpecularColor);

		/****************** FresnelType ******************/
		%feature("compactdefaultargs") FresnelType;
		%feature("autodoc", "* Returns type of Fresnel.
	:rtype: Graphic3d_FresnelModel") FresnelType;
		Graphic3d_FresnelModel FresnelType ();

		/****************** Graphic3d_Fresnel ******************/
		%feature("compactdefaultargs") Graphic3d_Fresnel;
		%feature("autodoc", "* Creates uninitialized Fresnel factor.
	:rtype: None") Graphic3d_Fresnel;
		 Graphic3d_Fresnel ();

		/****************** Serialize ******************/
		%feature("compactdefaultargs") Serialize;
		%feature("autodoc", "* Returns serialized representation of Fresnel factor.
	:rtype: Graphic3d_Vec4") Serialize;
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

/*************************************
* class Graphic3d_GraduatedTrihedron *
*************************************/
class Graphic3d_GraduatedTrihedron {
	public:
		Graphic3d_CView * PtrView;
		/****************** ArrowsLength ******************/
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", ":rtype: Standard_ShortReal") ArrowsLength;
		Standard_ShortReal ArrowsLength ();

		/****************** AxisAspect ******************/
		%feature("compactdefaultargs") AxisAspect;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:rtype: Graphic3d_AxisAspect") AxisAspect;
		const Graphic3d_AxisAspect & AxisAspect (const Standard_Integer theIndex);

		/****************** ChangeAxisAspect ******************/
		%feature("compactdefaultargs") ChangeAxisAspect;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:rtype: Graphic3d_AxisAspect") ChangeAxisAspect;
		Graphic3d_AxisAspect & ChangeAxisAspect (const Standard_Integer theIndex);

		/****************** ChangeXAxisAspect ******************/
		%feature("compactdefaultargs") ChangeXAxisAspect;
		%feature("autodoc", ":rtype: Graphic3d_AxisAspect") ChangeXAxisAspect;
		Graphic3d_AxisAspect & ChangeXAxisAspect ();

		/****************** ChangeYAxisAspect ******************/
		%feature("compactdefaultargs") ChangeYAxisAspect;
		%feature("autodoc", ":rtype: Graphic3d_AxisAspect") ChangeYAxisAspect;
		Graphic3d_AxisAspect & ChangeYAxisAspect ();

		/****************** ChangeZAxisAspect ******************/
		%feature("compactdefaultargs") ChangeZAxisAspect;
		%feature("autodoc", ":rtype: Graphic3d_AxisAspect") ChangeZAxisAspect;
		Graphic3d_AxisAspect & ChangeZAxisAspect ();

		/****************** Graphic3d_GraduatedTrihedron ******************/
		%feature("compactdefaultargs") Graphic3d_GraduatedTrihedron;
		%feature("autodoc", "* Default constructor Constructs the default graduated trihedron with grid, X, Y, Z axes, and tickmarks
	:param theNamesFont: default value is 'Arial'
	:type theNamesFont: TCollection_AsciiString
	:param theNamesStyle: default value is Font_FA_Bold
	:type theNamesStyle: Font_FontAspect
	:param theNamesSize: default value is 12
	:type theNamesSize: int
	:param theValuesFont: default value is 'Arial'
	:type theValuesFont: TCollection_AsciiString
	:param theValuesStyle: default value is Font_FA_Regular
	:type theValuesStyle: Font_FontAspect
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
	:rtype: None") Graphic3d_GraduatedTrihedron;
		 Graphic3d_GraduatedTrihedron (const TCollection_AsciiString & theNamesFont = "Arial",const Font_FontAspect & theNamesStyle = Font_FA_Bold,const Standard_Integer theNamesSize = 12,const TCollection_AsciiString & theValuesFont = "Arial",const Font_FontAspect & theValuesStyle = Font_FA_Regular,const Standard_Integer theValuesSize = 12,const Standard_ShortReal theArrowsLength = 30.0f,const Quantity_Color theGridColor = Quantity_NOC_WHITE,const Standard_Boolean theToDrawGrid = Standard_True,const Standard_Boolean theToDrawAxes = Standard_True);

		/****************** GridColor ******************/
		%feature("compactdefaultargs") GridColor;
		%feature("autodoc", ":rtype: Quantity_Color") GridColor;
		const Quantity_Color & GridColor ();

		/****************** NamesFont ******************/
		%feature("compactdefaultargs") NamesFont;
		%feature("autodoc", ":rtype: TCollection_AsciiString") NamesFont;
		const TCollection_AsciiString & NamesFont ();

		/****************** NamesFontAspect ******************/
		%feature("compactdefaultargs") NamesFontAspect;
		%feature("autodoc", ":rtype: Font_FontAspect") NamesFontAspect;
		Font_FontAspect NamesFontAspect ();

		/****************** NamesSize ******************/
		%feature("compactdefaultargs") NamesSize;
		%feature("autodoc", ":rtype: int") NamesSize;
		Standard_Integer NamesSize ();

		/****************** SetArrowsLength ******************/
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", ":param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetArrowsLength;
		void SetArrowsLength (const Standard_ShortReal theValue);

		/****************** SetDrawAxes ******************/
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", ":param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawAxes;
		void SetDrawAxes (const Standard_Boolean theToDraw);

		/****************** SetDrawGrid ******************/
		%feature("compactdefaultargs") SetDrawGrid;
		%feature("autodoc", ":param theToDraw:
	:type theToDraw: bool
	:rtype: None") SetDrawGrid;
		void SetDrawGrid (const Standard_Boolean theToDraw);

		/****************** SetGridColor ******************/
		%feature("compactdefaultargs") SetGridColor;
		%feature("autodoc", ":param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetGridColor;
		void SetGridColor (const Quantity_Color & theColor);

		/****************** SetNamesFont ******************/
		%feature("compactdefaultargs") SetNamesFont;
		%feature("autodoc", ":param theFont:
	:type theFont: TCollection_AsciiString
	:rtype: None") SetNamesFont;
		void SetNamesFont (const TCollection_AsciiString & theFont);

		/****************** SetNamesFontAspect ******************/
		%feature("compactdefaultargs") SetNamesFontAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Font_FontAspect
	:rtype: None") SetNamesFontAspect;
		void SetNamesFontAspect (Font_FontAspect theAspect);

		/****************** SetNamesSize ******************/
		%feature("compactdefaultargs") SetNamesSize;
		%feature("autodoc", ":param theValue:
	:type theValue: int
	:rtype: None") SetNamesSize;
		void SetNamesSize (const Standard_Integer theValue);

		/****************** SetValuesFont ******************/
		%feature("compactdefaultargs") SetValuesFont;
		%feature("autodoc", ":param theFont:
	:type theFont: TCollection_AsciiString
	:rtype: None") SetValuesFont;
		void SetValuesFont (const TCollection_AsciiString & theFont);

		/****************** SetValuesFontAspect ******************/
		%feature("compactdefaultargs") SetValuesFontAspect;
		%feature("autodoc", ":param theAspect:
	:type theAspect: Font_FontAspect
	:rtype: None") SetValuesFontAspect;
		void SetValuesFontAspect (Font_FontAspect theAspect);

		/****************** SetValuesSize ******************/
		%feature("compactdefaultargs") SetValuesSize;
		%feature("autodoc", ":param theValue:
	:type theValue: int
	:rtype: None") SetValuesSize;
		void SetValuesSize (const Standard_Integer theValue);

		/****************** ToDrawAxes ******************/
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", ":rtype: bool") ToDrawAxes;
		Standard_Boolean ToDrawAxes ();

		/****************** ToDrawGrid ******************/
		%feature("compactdefaultargs") ToDrawGrid;
		%feature("autodoc", ":rtype: bool") ToDrawGrid;
		Standard_Boolean ToDrawGrid ();

		/****************** ValuesFont ******************/
		%feature("compactdefaultargs") ValuesFont;
		%feature("autodoc", ":rtype: TCollection_AsciiString") ValuesFont;
		const TCollection_AsciiString & ValuesFont ();

		/****************** ValuesFontAspect ******************/
		%feature("compactdefaultargs") ValuesFontAspect;
		%feature("autodoc", ":rtype: Font_FontAspect") ValuesFontAspect;
		Font_FontAspect ValuesFontAspect ();

		/****************** ValuesSize ******************/
		%feature("compactdefaultargs") ValuesSize;
		%feature("autodoc", ":rtype: int") ValuesSize;
		Standard_Integer ValuesSize ();

		/****************** XAxisAspect ******************/
		%feature("compactdefaultargs") XAxisAspect;
		%feature("autodoc", ":rtype: Graphic3d_AxisAspect") XAxisAspect;
		const Graphic3d_AxisAspect & XAxisAspect ();

		/****************** YAxisAspect ******************/
		%feature("compactdefaultargs") YAxisAspect;
		%feature("autodoc", ":rtype: Graphic3d_AxisAspect") YAxisAspect;
		const Graphic3d_AxisAspect & YAxisAspect ();

		/****************** ZAxisAspect ******************/
		%feature("compactdefaultargs") ZAxisAspect;
		%feature("autodoc", ":rtype: Graphic3d_AxisAspect") ZAxisAspect;
		const Graphic3d_AxisAspect & ZAxisAspect ();

};


%extend Graphic3d_GraduatedTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Graphic3d_GraphicDriver *
********************************/
%nodefaultctor Graphic3d_GraphicDriver;
class Graphic3d_GraphicDriver : public Standard_Transient {
	public:
		/****************** CreateStructure ******************/
		%feature("compactdefaultargs") CreateStructure;
		%feature("autodoc", "* Creates new empty graphic structure
	:param theManager:
	:type theManager: Graphic3d_StructureManager
	:rtype: opencascade::handle<Graphic3d_CStructure>") CreateStructure;
		opencascade::handle<Graphic3d_CStructure> CreateStructure (const opencascade::handle<Graphic3d_StructureManager> & theManager);

		/****************** CreateView ******************/
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "* Creates new view for this graphic driver.
	:param theMgr:
	:type theMgr: Graphic3d_StructureManager
	:rtype: opencascade::handle<Graphic3d_CView>") CreateView;
		opencascade::handle<Graphic3d_CView> CreateView (const opencascade::handle<Graphic3d_StructureManager> & theMgr);

		/****************** DefaultTextHeight ******************/
		%feature("compactdefaultargs") DefaultTextHeight;
		%feature("autodoc", ":rtype: Standard_ShortReal") DefaultTextHeight;
		Standard_ShortReal DefaultTextHeight ();

		/****************** EnableVBO ******************/
		%feature("compactdefaultargs") EnableVBO;
		%feature("autodoc", "* enables/disables usage of OpenGL vertex buffer arrays while drawing primitiev arrays
	:param status:
	:type status: bool
	:rtype: None") EnableVBO;
		void EnableVBO (const Standard_Boolean status);

		/****************** GetDisplayConnection ******************/
		%feature("compactdefaultargs") GetDisplayConnection;
		%feature("autodoc", "* returns Handle to display connection
	:rtype: opencascade::handle<Aspect_DisplayConnection>") GetDisplayConnection;
		const opencascade::handle<Aspect_DisplayConnection> & GetDisplayConnection ();

		/****************** InquireLightLimit ******************/
		%feature("compactdefaultargs") InquireLightLimit;
		%feature("autodoc", "* Request maximum number of active light sources supported by driver and hardware.
	:rtype: int") InquireLightLimit;
		Standard_Integer InquireLightLimit ();

		/****************** InquireLimit ******************/
		%feature("compactdefaultargs") InquireLimit;
		%feature("autodoc", "* Request limit of graphic resource of specific type.
	:param theType:
	:type theType: Graphic3d_TypeOfLimit
	:rtype: int") InquireLimit;
		Standard_Integer InquireLimit (const Graphic3d_TypeOfLimit theType);

		/****************** InquirePlaneLimit ******************/
		%feature("compactdefaultargs") InquirePlaneLimit;
		%feature("autodoc", "* Request maximum number of active clipping planes supported by driver and hardware.
	:rtype: int") InquirePlaneLimit;
		Standard_Integer InquirePlaneLimit ();

		/****************** InquireViewLimit ******************/
		%feature("compactdefaultargs") InquireViewLimit;
		%feature("autodoc", "* Request maximum number of views supported by driver.
	:rtype: int") InquireViewLimit;
		Standard_Integer InquireViewLimit ();

		/****************** InsertLayerAfter ******************/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "* Adds a layer to all views. @param theNewLayerId [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param theSettings [in] new layer settings @param theLayerBefore [in] id of layer to append new layer after
	:param theNewLayerId:
	:type theNewLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:param theLayerBefore:
	:type theLayerBefore: int
	:rtype: void") InsertLayerAfter;
		virtual void InsertLayerAfter (int theNewLayerId,const Graphic3d_ZLayerSettings & theSettings,int theLayerBefore);

		/****************** InsertLayerBefore ******************/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "* Adds a layer to all views. To add a structure to desired layer on display it is necessary to set the layer ID for the structure. @param theNewLayerId [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param theSettings [in] new layer settings @param theLayerAfter [in] id of layer to append new layer before
	:param theNewLayerId:
	:type theNewLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:param theLayerAfter:
	:type theLayerAfter: int
	:rtype: void") InsertLayerBefore;
		virtual void InsertLayerBefore (int theNewLayerId,const Graphic3d_ZLayerSettings & theSettings,int theLayerAfter);

		/****************** MemoryInfo ******************/
		%feature("compactdefaultargs") MemoryInfo;
		%feature("autodoc", "* Returns information about GPU memory usage.
	:param theFreeBytes:
	:type theFreeBytes: Standard_Size
	:param theInfo:
	:type theInfo: TCollection_AsciiString
	:rtype: bool") MemoryInfo;
		Standard_Boolean MemoryInfo (Standard_Size & theFreeBytes,TCollection_AsciiString & theInfo);

		/****************** NewIdentification ******************/
		%feature("compactdefaultargs") NewIdentification;
		%feature("autodoc", "* Returns a new identification number for a new structure.
	:rtype: int") NewIdentification;
		Standard_Integer NewIdentification ();

		/****************** RemoveIdentification ******************/
		%feature("compactdefaultargs") RemoveIdentification;
		%feature("autodoc", "* Frees the identifier of a structure.
	:param theId:
	:type theId: int
	:rtype: None") RemoveIdentification;
		void RemoveIdentification (const Standard_Integer theId);

		/****************** RemoveStructure ******************/
		%feature("compactdefaultargs") RemoveStructure;
		%feature("autodoc", "* Removes structure from graphic driver and releases its resources.
	:param theCStructure:
	:type theCStructure: Graphic3d_CStructure
	:rtype: None") RemoveStructure;
		void RemoveStructure (opencascade::handle<Graphic3d_CStructure> & theCStructure);

		/****************** RemoveView ******************/
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "* Removes view from graphic driver and releases its resources.
	:param theView:
	:type theView: Graphic3d_CView
	:rtype: None") RemoveView;
		void RemoveView (const opencascade::handle<Graphic3d_CView> & theView);

		/****************** RemoveZLayer ******************/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "* Removes Z layer. All structures displayed at the moment in layer will be displayed in default layer (the bottom-level z layer). By default, there are always default bottom-level layer that can't be removed. The passed theLayerId should be not less than 0 (reserved for default layers that can not be removed).
	:param theLayerId:
	:type theLayerId: int
	:rtype: void") RemoveZLayer;
		virtual void RemoveZLayer (int theLayerId);

		/****************** SetZLayerSettings ******************/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "* Sets the settings for a single Z layer.
	:param theLayerId:
	:type theLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: void") SetZLayerSettings;
		virtual void SetZLayerSettings (int theLayerId,const Graphic3d_ZLayerSettings & theSettings);

		/****************** TextSize ******************/
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "* Computes text width.
	:param theView:
	:type theView: Graphic3d_CView
	:param theText:
	:type theText: char *
	:param theHeight:
	:type theHeight: Standard_ShortReal
	:param theWidth:
	:type theWidth: Standard_ShortReal
	:param theAscent:
	:type theAscent: Standard_ShortReal
	:param theDescent:
	:type theDescent: Standard_ShortReal
	:rtype: None") TextSize;
		void TextSize (const opencascade::handle<Graphic3d_CView> & theView,const char * theText,const Standard_ShortReal theHeight,Standard_ShortReal & theWidth,Standard_ShortReal & theAscent,Standard_ShortReal & theDescent);

		/****************** ViewExists ******************/
		%feature("compactdefaultargs") ViewExists;
		%feature("autodoc", "* Returns view associated with the window if it is exists and is activated. Returns Standard_True if the view associated to the window exists.
	:param theWindow:
	:type theWindow: Aspect_Window
	:param theView:
	:type theView: Graphic3d_CView
	:rtype: bool") ViewExists;
		Standard_Boolean ViewExists (const opencascade::handle<Aspect_Window> & theWindow,opencascade::handle<Graphic3d_CView> & theView);

		/****************** ZLayerSettings ******************/
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "* Returns the settings of a single Z layer.
	:param theLayerId:
	:type theLayerId: int
	:rtype: Graphic3d_ZLayerSettings") ZLayerSettings;
		virtual const Graphic3d_ZLayerSettings & ZLayerSettings (int theLayerId);

		/****************** ZLayers ******************/
		%feature("compactdefaultargs") ZLayers;
		%feature("autodoc", "* Returns list of Z layers defined for the graphical driver.
	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger
	:rtype: void") ZLayers;
		virtual void ZLayers (TColStd_SequenceOfInteger & theLayerSeq);

};


%make_alias(Graphic3d_GraphicDriver)

%extend Graphic3d_GraphicDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Graphic3d_Group *
************************/
%nodefaultctor Graphic3d_Group;
class Graphic3d_Group : public Standard_Transient {
	public:
		/****************** AddPrimitiveArray ******************/
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "* Adds an array of primitives for display
	:param theType:
	:type theType: Graphic3d_TypeOfPrimitiveArray
	:param theIndices:
	:type theIndices: Graphic3d_IndexBuffer
	:param theAttribs:
	:type theAttribs: Graphic3d_Buffer
	:param theBounds:
	:type theBounds: Graphic3d_BoundBuffer
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: void") AddPrimitiveArray;
		virtual void AddPrimitiveArray (const Graphic3d_TypeOfPrimitiveArray theType,const opencascade::handle<Graphic3d_IndexBuffer> & theIndices,const opencascade::handle<Graphic3d_Buffer> & theAttribs,const opencascade::handle<Graphic3d_BoundBuffer> & theBounds,const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** AddPrimitiveArray ******************/
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "* Adds an array of primitives for display
	:param thePrim:
	:type thePrim: Graphic3d_ArrayOfPrimitives
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: None") AddPrimitiveArray;
		void AddPrimitiveArray (const opencascade::handle<Graphic3d_ArrayOfPrimitives> & thePrim,const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** AddText ******************/
		%feature("compactdefaultargs") AddText;
		%feature("autodoc", "* Adds a text for display
	:param theTextParams:
	:type theTextParams: Graphic3d_Text
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: void") AddText;
		virtual void AddText (const opencascade::handle<Graphic3d_Text> & theTextParams,const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** Aspects ******************/
		%feature("compactdefaultargs") Aspects;
		%feature("autodoc", "* Return fill area aspect.
	:rtype: opencascade::handle<Graphic3d_Aspects>") Aspects;
		opencascade::handle<Graphic3d_Aspects> Aspects ();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns boundary box of the group <self> without transformation applied,
	:rtype: Graphic3d_BndBox4f") BoundingBox;
		const Graphic3d_BndBox4f & BoundingBox ();

		/****************** ChangeBoundingBox ******************/
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "* Returns non-const boundary box of the group <self> without transformation applied,
	:rtype: Graphic3d_BndBox4f") ChangeBoundingBox;
		Graphic3d_BndBox4f & ChangeBoundingBox ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Supress all primitives and attributes of <self>. To clear group without update in Graphic3d_StructureManager pass Standard_False as <theUpdateStructureMgr>. This used on context and viewer destruction, when the pointer to structure manager in Graphic3d_Structure could be already released (pointers are used here to avoid handle cross-reference);
	:param theUpdateStructureMgr: default value is Standard_True
	:type theUpdateStructureMgr: bool
	:rtype: void") Clear;
		virtual void Clear (const Standard_Boolean theUpdateStructureMgr = Standard_True);

		/****************** ContainsFacet ******************/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "* Returns true if the group contains Polygons, Triangles or Quadrangles.
	:rtype: bool") ContainsFacet;
		bool ContainsFacet ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Return true if primitive arrays within this graphic group form closed volume (do no contain open shells).
	:rtype: bool") IsClosed;
		bool IsClosed ();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* Returns Standard_True if the group <self> is deleted. <self> is deleted after the call Remove (me) or the associated structure is deleted.
	:rtype: bool") IsDeleted;
		Standard_Boolean IsDeleted ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns Standard_True if the group <self> is empty.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Marker ******************/
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "* Creates a primitive array with single marker using AddPrimitiveArray().
	:param thePoint:
	:type thePoint: Graphic3d_Vertex
	:param theToEvalMinMax: default value is Standard_True
	:type theToEvalMinMax: bool
	:rtype: None") Marker;
		void Marker (const Graphic3d_Vertex & thePoint,const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** MinMaxValues ******************/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "* Returns the coordinates of the boundary box of the group.
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
	:rtype: None") MinMaxValues;
		void MinMaxValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Supress the group <self> in the structure. Warning: No more graphic operations in <self> after this call. Modifies the current modelling transform persistence (pan, zoom or rotate) Get the current modelling transform persistence (pan, zoom or rotate)
	:rtype: None") Remove;
		void Remove ();

		/****************** ReplaceAspects ******************/
		%feature("compactdefaultargs") ReplaceAspects;
		%feature("autodoc", "* Replace aspects specified in the replacement map.
	:param theMap:
	:type theMap: Graphic3d_MapOfAspectsToAspects
	:rtype: None") ReplaceAspects;
		void ReplaceAspects (const Graphic3d_MapOfAspectsToAspects & theMap);

		/****************** SetClosed ******************/
		%feature("compactdefaultargs") SetClosed;
		%feature("autodoc", "* Changes property shown that primitive arrays within this group form closed volume (do no contain open shells).
	:param theIsClosed:
	:type theIsClosed: bool
	:rtype: None") SetClosed;
		void SetClosed (const bool theIsClosed);

		/****************** SetFlippingOptions ******************/
		%feature("compactdefaultargs") SetFlippingOptions;
		%feature("autodoc", "* sets the flipping to theIsEnabled state.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:param theRefPlane:
	:type theRefPlane: gp_Ax2
	:rtype: void") SetFlippingOptions;
		virtual void SetFlippingOptions (const Standard_Boolean theIsEnabled,const gp_Ax2 & theRefPlane);

		/****************** SetMinMaxValues ******************/
		%feature("compactdefaultargs") SetMinMaxValues;
		%feature("autodoc", "* Sets the coordinates of the boundary box of the group.
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
	:rtype: None") SetMinMaxValues;
		void SetMinMaxValues (const Standard_Real theXMin,const Standard_Real theYMin,const Standard_Real theZMin,const Standard_Real theXMax,const Standard_Real theYMax,const Standard_Real theZMax);

		/****************** SetPrimitivesAspect ******************/
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "* Modifies the current context of the group to give another aspect for all the primitives created after this call in the group.
	:param theAspect:
	:type theAspect: Graphic3d_Aspects
	:rtype: None") SetPrimitivesAspect;
		void SetPrimitivesAspect (const opencascade::handle<Graphic3d_Aspects> & theAspect);

		/****************** SetStencilTestOptions ******************/
		%feature("compactdefaultargs") SetStencilTestOptions;
		%feature("autodoc", "* sets the stencil test to theIsEnabled state;
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: void") SetStencilTestOptions;
		virtual void SetStencilTestOptions (const Standard_Boolean theIsEnabled);

		/****************** Structure ******************/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "* Returns the structure containing the group <self>.
	:rtype: opencascade::handle<Graphic3d_Structure>") Structure;
		opencascade::handle<Graphic3d_Structure> Structure ();

		/****************** SynchronizeAspects ******************/
		%feature("compactdefaultargs") SynchronizeAspects;
		%feature("autodoc", "* Update presentation aspects after their modification.
	:rtype: None") SynchronizeAspects;
		void SynchronizeAspects ();

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* @name obsolete methods Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). AAngle : Orientation of the text (with respect to the horizontal).
	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex
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
	:rtype: void") Text;
		virtual void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Real AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). The other attributes have the following default values: AAngle : PI / 2. ATp : TP_RIGHT AHta : HTA_LEFT AVta : VTA_BOTTOM
	:param AText:
	:type AText: char *
	:param APoint:
	:type APoint: Graphic3d_Vertex
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None") Text;
		void Text (const char * AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). AAngle : Orientation of the text (with respect to the horizontal).
	:param AText:
	:type AText: TCollection_ExtendedString
	:param APoint:
	:type APoint: Graphic3d_Vertex
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
	:rtype: None") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Real AAngle,const Graphic3d_TextPath ATp,const Graphic3d_HorizontalTextAlignment AHta,const Graphic3d_VerticalTextAlignment AVta,const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Creates the string <AText> at position <APoint>. The 3D point of attachment is projected. The text is written in the plane of projection. The attributes are given with respect to the plane of projection. AHeight : Height of text. (Relative to the Normalized Projection Coordinates (NPC) Space). The other attributes have the following default values: AAngle : PI / 2. ATp : TP_RIGHT AHta : HTA_LEFT AVta : VTA_BOTTOM
	:param AText:
	:type AText: TCollection_ExtendedString
	:param APoint:
	:type APoint: Graphic3d_Vertex
	:param AHeight:
	:type AHeight: float
	:param EvalMinMax: default value is Standard_True
	:type EvalMinMax: bool
	:rtype: None") Text;
		void Text (const TCollection_ExtendedString & AText,const Graphic3d_Vertex & APoint,const Standard_Real AHeight,const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Creates the string <theText> at orientation <theOrientation> in 3D space.
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
	:rtype: void") Text;
		virtual void Text (const char * theTextUtf,const gp_Ax2 & theOrientation,const Standard_Real theHeight,const Standard_Real theAngle,const Graphic3d_TextPath theTp,const Graphic3d_HorizontalTextAlignment theHTA,const Graphic3d_VerticalTextAlignment theVTA,const Standard_Boolean theToEvalMinMax = Standard_True,const Standard_Boolean theHasOwnAnchor = Standard_True);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Creates the string <theText> at orientation <theOrientation> in 3D space.
	:param theText:
	:type theText: TCollection_ExtendedString
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
	:rtype: void") Text;
		virtual void Text (const TCollection_ExtendedString & theText,const gp_Ax2 & theOrientation,const Standard_Real theHeight,const Standard_Real theAngle,const Graphic3d_TextPath theTp,const Graphic3d_HorizontalTextAlignment theHTA,const Graphic3d_VerticalTextAlignment theVTA,const Standard_Boolean theToEvalMinMax = Standard_True,const Standard_Boolean theHasOwnAnchor = Standard_True);

};


%make_alias(Graphic3d_Group)

%extend Graphic3d_Group {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Graphic3d_HatchStyle *
*****************************/
class Graphic3d_HatchStyle : public Standard_Transient {
	public:
		/****************** Graphic3d_HatchStyle ******************/
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "* Creates a new custom hatch style with the given pattern and unique style id @warning Raises a program error if given pattern image is not a valid 32*32 bitmap
	:param thePattern:
	:type thePattern: Image_PixMap
	:rtype: None") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle (const opencascade::handle<Image_PixMap> & thePattern);

		/****************** Graphic3d_HatchStyle ******************/
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "* Creates a new predefined hatch style with the given id in Aspect_HatchStyle enum. GPU memory for the pattern will not be allocated.
	:param theType:
	:type theType: Aspect_HatchStyle
	:rtype: None") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle (const Aspect_HatchStyle theType);

		/****************** HatchType ******************/
		%feature("compactdefaultargs") HatchType;
		%feature("autodoc", "* In case if predefined OCCT style is used, returns index in Aspect_HatchStyle enumeration. If the style is custom, returns unique index of the style
	:rtype: int") HatchType;
		Standard_Integer HatchType ();

		/****************** Pattern ******************/
		%feature("compactdefaultargs") Pattern;
		%feature("autodoc", "* Returns the pattern of custom hatch style
	:rtype: Standard_Byte *") Pattern;
		const Standard_Byte * Pattern ();

};


%make_alias(Graphic3d_HatchStyle)

%extend Graphic3d_HatchStyle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Graphic3d_Layer *
************************/
%nodefaultctor Graphic3d_Layer;
class Graphic3d_Layer : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param theStruct:
	:type theStruct: Graphic3d_CStructure *
	:param thePriority:
	:type thePriority: int
	:param isForChangePriority: default value is Standard_False
	:type isForChangePriority: bool
	:rtype: None") Add;
		void Add (const Graphic3d_CStructure * theStruct,Standard_Integer thePriority,Standard_Boolean isForChangePriority = Standard_False);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Append layer of acceptable type (with similar number of priorities or less). Returns Standard_False if the list can not be accepted.
	:param theOther:
	:type theOther: Graphic3d_Layer
	:rtype: bool") Append;
		Standard_Boolean Append (const Graphic3d_Layer & theOther);

		/****************** ArrayOfStructures ******************/
		%feature("compactdefaultargs") ArrayOfStructures;
		%feature("autodoc", "* Returns array of structures.
	:rtype: Graphic3d_ArrayOfIndexedMapOfStructure") ArrayOfStructures;
		const Graphic3d_ArrayOfIndexedMapOfStructure & ArrayOfStructures ();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns layer bounding box. @param theViewId view index to consider View Affinity in structure @param theCamera camera definition @param theWindowWidth viewport width (for applying transformation-persistence) @param theWindowHeight viewport height (for applying transformation-persistence) @param theToIncludeAuxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) returns computed bounding box
	:param theViewId:
	:type theViewId: int
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:param theWindowWidth:
	:type theWindowWidth: int
	:param theWindowHeight:
	:type theWindowHeight: int
	:param theToIncludeAuxiliary:
	:type theToIncludeAuxiliary: bool
	:rtype: Bnd_Box") BoundingBox;
		Bnd_Box BoundingBox (Standard_Integer theViewId,const opencascade::handle<Graphic3d_Camera> & theCamera,Standard_Integer theWindowWidth,Standard_Integer theWindowHeight,Standard_Boolean theToIncludeAuxiliary);

		/****************** CullableStructuresBVH ******************/
		%feature("compactdefaultargs") CullableStructuresBVH;
		%feature("autodoc", "* Returns set of Graphic3d_CStructures structures for building BVH tree.
	:rtype: Graphic3d_BvhCStructureSet") CullableStructuresBVH;
		const Graphic3d_BvhCStructureSet & CullableStructuresBVH ();

		/****************** CullableTrsfPersStructuresBVH ******************/
		%feature("compactdefaultargs") CullableTrsfPersStructuresBVH;
		%feature("autodoc", "* Returns set of transform persistent Graphic3d_CStructures for building BVH tree.
	:rtype: Graphic3d_BvhCStructureSetTrsfPers") CullableTrsfPersStructuresBVH;
		const Graphic3d_BvhCStructureSetTrsfPers & CullableTrsfPersStructuresBVH ();

		/****************** InvalidateBVHData ******************/
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "* Marks BVH tree for given priority list as dirty and marks primitive set for rebuild.
	:rtype: None") InvalidateBVHData;
		void InvalidateBVHData ();

		/****************** InvalidateBoundingBox ******************/
		%feature("compactdefaultargs") InvalidateBoundingBox;
		%feature("autodoc", "* Marks cached bounding box as obsolete.
	:rtype: None") InvalidateBoundingBox;
		void InvalidateBoundingBox ();

		/****************** IsCulled ******************/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "* Returns True if layer is empty or has been discarded entirely by culling test.
	:rtype: bool") IsCulled;
		bool IsCulled ();

		/****************** IsImmediate ******************/
		%feature("compactdefaultargs") IsImmediate;
		%feature("autodoc", "* Return true if layer was marked with immediate flag.
	:rtype: bool") IsImmediate;
		Standard_Boolean IsImmediate ();

		/****************** LayerId ******************/
		%feature("compactdefaultargs") LayerId;
		%feature("autodoc", "* Return layer id.
	:rtype: Graphic3d_ZLayerId") LayerId;
		Graphic3d_ZLayerId LayerId ();

		/****************** LayerSettings ******************/
		%feature("compactdefaultargs") LayerSettings;
		%feature("autodoc", "* Returns settings of the layer object.
	:rtype: Graphic3d_ZLayerSettings") LayerSettings;
		const Graphic3d_ZLayerSettings & LayerSettings ();

		/****************** NbOfTransformPersistenceObjects ******************/
		%feature("compactdefaultargs") NbOfTransformPersistenceObjects;
		%feature("autodoc", "* Returns number of transform persistence objects.
	:rtype: int") NbOfTransformPersistenceObjects;
		Standard_Integer NbOfTransformPersistenceObjects ();

		/****************** NbPriorities ******************/
		%feature("compactdefaultargs") NbPriorities;
		%feature("autodoc", "* Returns the number of available priority levels
	:rtype: int") NbPriorities;
		Standard_Integer NbPriorities ();

		/****************** NbStructures ******************/
		%feature("compactdefaultargs") NbStructures;
		%feature("autodoc", "* returns the number of structures
	:rtype: int") NbStructures;
		Standard_Integer NbStructures ();

		/****************** NbStructuresNotCulled ******************/
		%feature("compactdefaultargs") NbStructuresNotCulled;
		%feature("autodoc", "* Number of NOT culled structures in the layer.
	:rtype: int") NbStructuresNotCulled;
		Standard_Integer NbStructuresNotCulled ();

		/****************** NonCullableStructures ******************/
		%feature("compactdefaultargs") NonCullableStructures;
		%feature("autodoc", "* Returns indexed map of always rendered structures.
	:rtype: NCollection_IndexedMap< Graphic3d_CStructure *>") NonCullableStructures;
		const NCollection_IndexedMap<const Graphic3d_CStructure *> & NonCullableStructures ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Remove structure and returns its priority, if the structure is not found, method returns negative value
	:param theStruct:
	:type theStruct: Graphic3d_CStructure *
	:param thePriority:
	:type thePriority: int
	:param isForChangePriority: default value is Standard_False
	:type isForChangePriority: bool
	:rtype: bool") Remove;
		bool Remove (const Graphic3d_CStructure * theStruct,Standard_Integer &OutValue,Standard_Boolean isForChangePriority = Standard_False);

		/****************** SetLayerSettings ******************/
		%feature("compactdefaultargs") SetLayerSettings;
		%feature("autodoc", "* Sets settings of the layer object.
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: None") SetLayerSettings;
		void SetLayerSettings (const Graphic3d_ZLayerSettings & theSettings);

		/****************** UpdateCulling ******************/
		%feature("compactdefaultargs") UpdateCulling;
		%feature("autodoc", "* Update culling state - should be called before rendering. Traverses through BVH tree to determine which structures are in view volume.
	:param theViewId:
	:type theViewId: int
	:param theSelector:
	:type theSelector: Graphic3d_CullingTool
	:param theFrustumCullingState:
	:type theFrustumCullingState: Graphic3d_RenderingParams::FrustumCulling
	:rtype: None") UpdateCulling;
		void UpdateCulling (Standard_Integer theViewId,const Graphic3d_CullingTool & theSelector,const Graphic3d_RenderingParams::FrustumCulling theFrustumCullingState);

		/****************** considerZoomPersistenceObjects ******************/
		%feature("compactdefaultargs") considerZoomPersistenceObjects;
		%feature("autodoc", "* Returns zoom-scale factor.
	:param theViewId:
	:type theViewId: int
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:param theWindowWidth:
	:type theWindowWidth: int
	:param theWindowHeight:
	:type theWindowHeight: int
	:rtype: float") considerZoomPersistenceObjects;
		Standard_Real considerZoomPersistenceObjects (Standard_Integer theViewId,const opencascade::handle<Graphic3d_Camera> & theCamera,Standard_Integer theWindowWidth,Standard_Integer theWindowHeight);

};


%make_alias(Graphic3d_Layer)

%extend Graphic3d_Layer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Graphic3d_LightSet *
***************************/
class Graphic3d_LightSet : public Standard_Transient {
	public:
		class Iterator {};
/* public enums */
enum IterationFilter {
	IterationFilter_None = 0,
	IterationFilter_ExcludeAmbient = 2,
	IterationFilter_ExcludeDisabled = 4,
	IterationFilter_ExcludeDisabledAndAmbient = IterationFilter_ExcludeAmbient | IterationFilter_ExcludeDisabled,
};

/* end public enums declaration */

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Append new light source.
	:param theLight:
	:type theLight: Graphic3d_CLight
	:rtype: bool") Add;
		Standard_Boolean Add (const opencascade::handle<Graphic3d_CLight> & theLight);

		/****************** AmbientColor ******************/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "* Returns cumulative ambient color, which is computed as sum of all enabled ambient light sources. Values are NOT clamped (can be greater than 1.0f) and alpha component is fixed to 1.0f. @sa UpdateRevision()
	:rtype: Graphic3d_Vec4") AmbientColor;
		const Graphic3d_Vec4 & AmbientColor ();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Return True if light source is defined in this set.
	:param theLight:
	:type theLight: Graphic3d_CLight
	:rtype: bool") Contains;
		Standard_Boolean Contains (const opencascade::handle<Graphic3d_CLight> & theLight);

		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "* Return number of light sources.
	:rtype: int") Extent;
		Standard_Integer Extent ();

		/****************** Graphic3d_LightSet ******************/
		%feature("compactdefaultargs") Graphic3d_LightSet;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_LightSet;
		 Graphic3d_LightSet ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Return True if lights list is empty.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** KeyEnabledLong ******************/
		%feature("compactdefaultargs") KeyEnabledLong;
		%feature("autodoc", "* Returns a string defining a list of enabled light sources as concatenation of letters 'd' (Directional), 'p' (Point), 's' (Spot) depending on the type of light source in the list. Example: 'dppp'. @sa UpdateRevision()
	:rtype: TCollection_AsciiString") KeyEnabledLong;
		const TCollection_AsciiString & KeyEnabledLong ();

		/****************** KeyEnabledShort ******************/
		%feature("compactdefaultargs") KeyEnabledShort;
		%feature("autodoc", "* Returns a string defining a list of enabled light sources as concatenation of letters 'd' (Directional), 'p' (Point), 's' (Spot) depending on the type of light source in the list, specified only once. Example: 'dp'. @sa UpdateRevision()
	:rtype: TCollection_AsciiString") KeyEnabledShort;
		const TCollection_AsciiString & KeyEnabledShort ();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "* Return lower light index.
	:rtype: int") Lower;
		Standard_Integer Lower ();

		/****************** NbEnabled ******************/
		%feature("compactdefaultargs") NbEnabled;
		%feature("autodoc", "* Returns total amount of enabled lights EXCLUDING ambient. @sa UpdateRevision()
	:rtype: int") NbEnabled;
		Standard_Integer NbEnabled ();

		/****************** NbEnabledLightsOfType ******************/
		%feature("compactdefaultargs") NbEnabledLightsOfType;
		%feature("autodoc", "* Returns total amount of enabled lights of specified type. @sa UpdateRevision()
	:param theType:
	:type theType: Graphic3d_TypeOfLightSource
	:rtype: int") NbEnabledLightsOfType;
		Standard_Integer NbEnabledLightsOfType (Graphic3d_TypeOfLightSource theType);

		/****************** NbLightsOfType ******************/
		%feature("compactdefaultargs") NbLightsOfType;
		%feature("autodoc", "* Returns total amount of lights of specified type.
	:param theType:
	:type theType: Graphic3d_TypeOfLightSource
	:rtype: int") NbLightsOfType;
		Standard_Integer NbLightsOfType (Graphic3d_TypeOfLightSource theType);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Remove light source.
	:param theLight:
	:type theLight: Graphic3d_CLight
	:rtype: bool") Remove;
		Standard_Boolean Remove (const opencascade::handle<Graphic3d_CLight> & theLight);

		/****************** Revision ******************/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "* Return light sources revision. @sa UpdateRevision()
	:rtype: Standard_Size") Revision;
		Standard_Size Revision ();

		/****************** UpdateRevision ******************/
		%feature("compactdefaultargs") UpdateRevision;
		%feature("autodoc", "* @name cached state of lights set updated by UpdateRevision() Update light sources revision.
	:rtype: Standard_Size") UpdateRevision;
		Standard_Size UpdateRevision ();

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "* Return upper light index.
	:rtype: int") Upper;
		Standard_Integer Upper ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Return the light source for specified index within range [Lower(), Upper()].
	:param theIndex:
	:type theIndex: int
	:rtype: opencascade::handle<Graphic3d_CLight>") Value;
		const opencascade::handle<Graphic3d_CLight> & Value (Standard_Integer theIndex);

};


%make_alias(Graphic3d_LightSet)

%extend Graphic3d_LightSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Graphic3d_MarkerImage *
******************************/
class Graphic3d_MarkerImage : public Standard_Transient {
	public:
		/****************** GetBitMapArray ******************/
		%feature("compactdefaultargs") GetBitMapArray;
		%feature("autodoc", "* @param theAlphaValue pixels in the image that have alpha value greater than  or equal to this parameter will be stored in bitmap as '1',  others will be stored as '0' returns marker image as array of bytes. If an instance of the class has been initialized with image, it will be converted to bitmap based on the parameter theAlphaValue.
	:param theAlphaValue: default value is 0.5
	:type theAlphaValue: float
	:rtype: opencascade::handle<TColStd_HArray1OfByte>") GetBitMapArray;
		opencascade::handle<TColStd_HArray1OfByte> GetBitMapArray (const Standard_Real & theAlphaValue = 0.5);

		/****************** GetImage ******************/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "* returns marker image. If an instance of the class has been initialized with a bitmap, it will be converted to image.
	:rtype: opencascade::handle<Image_PixMap>") GetImage;
		const opencascade::handle<Image_PixMap> & GetImage ();

		/****************** GetImageAlpha ******************/
		%feature("compactdefaultargs") GetImageAlpha;
		%feature("autodoc", "* returns image alpha as grayscale image. Note that if an instance of the class has been initialized with a bitmap or with grayscale image this method will return exactly the same image as GetImage()
	:rtype: opencascade::handle<Image_PixMap>") GetImageAlpha;
		const opencascade::handle<Image_PixMap> & GetImageAlpha ();

		/****************** GetImageAlphaId ******************/
		%feature("compactdefaultargs") GetImageAlphaId;
		%feature("autodoc", "* returns an unique ID. This ID will be used to manage resource in graphic driver.
	:rtype: TCollection_AsciiString") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId ();

		/****************** GetImageId ******************/
		%feature("compactdefaultargs") GetImageId;
		%feature("autodoc", "* returns an unique ID. This ID will be used to manage resource in graphic driver.
	:rtype: TCollection_AsciiString") GetImageId;
		const TCollection_AsciiString & GetImageId ();

		/****************** GetTextureSize ******************/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "* returns texture size
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Graphic3d_MarkerImage ******************/
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "* @param theImage - source image
	:param theImage:
	:type theImage: Image_PixMap
	:rtype: None") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const opencascade::handle<Image_PixMap> & theImage);

		/****************** Graphic3d_MarkerImage ******************/
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "* Creates marker image from array of bytes (method for compatibility with old markers definition). @param theBitMap - source bitmap stored as array of bytes @param theWidth - number of bits in a row @param theHeight - number of bits in a column
	:param theBitMap:
	:type theBitMap: TColStd_HArray1OfByte
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage (const opencascade::handle<TColStd_HArray1OfByte> & theBitMap,const Standard_Integer & theWidth,const Standard_Integer & theHeight);

};


%make_alias(Graphic3d_MarkerImage)

%extend Graphic3d_MarkerImage {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Graphic3d_MaterialAspect *
*********************************/
class Graphic3d_MaterialAspect {
	public:
		/****************** Alpha ******************/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "* Returns the alpha coefficient of the surface (1.0 - Transparency); 1.0 means opaque.
	:rtype: Standard_ShortReal") Alpha;
		Standard_ShortReal Alpha ();

		/****************** AmbientColor ******************/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "* Returns the ambient color of the surface.
	:rtype: Quantity_Color") AmbientColor;
		const Quantity_Color & AmbientColor ();

		/****************** BSDF ******************/
		%feature("compactdefaultargs") BSDF;
		%feature("autodoc", "* Returns BSDF (bidirectional scattering distribution function).
	:rtype: Graphic3d_BSDF") BSDF;
		const Graphic3d_BSDF & BSDF ();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Returns the diffuse color of the surface. WARNING! This method does NOT return color for Graphic3d_MATERIAL_ASPECT material (color is defined by Graphic3d_Aspects::InteriorColor()).
	:rtype: Quantity_Color") Color;
		const Quantity_Color & Color ();

		/****************** DiffuseColor ******************/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "* Returns the diffuse color of the surface.
	:rtype: Quantity_Color") DiffuseColor;
		const Quantity_Color & DiffuseColor ();

		/****************** EmissiveColor ******************/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "* Returns the emissive color of the surface.
	:rtype: Quantity_Color") EmissiveColor;
		const Quantity_Color & EmissiveColor ();

		/****************** Graphic3d_MaterialAspect ******************/
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "* Creates a material from default values.
	:rtype: None") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect ();

		/****************** Graphic3d_MaterialAspect ******************/
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "* Creates a generic material.
	:param theName:
	:type theName: Graphic3d_NameOfMaterial
	:rtype: None") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect (const Graphic3d_NameOfMaterial theName);

		/****************** IncreaseShine ******************/
		%feature("compactdefaultargs") IncreaseShine;
		%feature("autodoc", "* Increases or decreases the luminosity. @param theDelta a signed percentage
	:param theDelta:
	:type theDelta: Standard_ShortReal
	:rtype: None") IncreaseShine;
		void IncreaseShine (const Standard_ShortReal theDelta);

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "* Returns True if this material differs from specified one.
	:param theOther:
	:type theOther: Graphic3d_MaterialAspect
	:rtype: bool") IsDifferent;
		Standard_Boolean IsDifferent (const Graphic3d_MaterialAspect & theOther);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "* Returns True if this material is identical to specified one.
	:param theOther:
	:type theOther: Graphic3d_MaterialAspect
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const Graphic3d_MaterialAspect & theOther);

		/****************** MaterialFromName ******************/
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "* Finds the material for specified name. @param theName [in] name to find @param theMat [out] found material returns False if name was unrecognized
	:param theName:
	:type theName: char *
	:param theMat:
	:type theMat: Graphic3d_NameOfMaterial
	:rtype: bool") MaterialFromName;
		static Standard_Boolean MaterialFromName (const char * theName,Graphic3d_NameOfMaterial & theMat);

		/****************** MaterialFromName ******************/
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "* Returns the material for specified name or Graphic3d_NOM_DEFAULT if name is unknown.
	:param theName:
	:type theName: char *
	:rtype: Graphic3d_NameOfMaterial") MaterialFromName;
		static Graphic3d_NameOfMaterial MaterialFromName (const char * theName);

		/****************** MaterialName ******************/
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "* Returns the name of the predefined material of specified rank within range [1, NumberOfMaterials()].
	:param theRank:
	:type theRank: int
	:rtype: char *") MaterialName;
		static const char * MaterialName (const Standard_Integer theRank);

		/****************** MaterialName ******************/
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "* Returns the given name of this material. This might be:
	:rtype: char *") MaterialName;
		const char * MaterialName ();

		/****************** MaterialType ******************/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "* Returns the type of the predefined material of specified rank within range [1, NumberOfMaterials()].
	:param theRank:
	:type theRank: int
	:rtype: Graphic3d_TypeOfMaterial") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType (const Standard_Integer theRank);

		/****************** MaterialType ******************/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "* Returns material type.
	:rtype: Graphic3d_TypeOfMaterial") MaterialType;
		Graphic3d_TypeOfMaterial MaterialType ();

		/****************** MaterialType ******************/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "* Returns True if type of this material is equal to specified type.
	:param theType:
	:type theType: Graphic3d_TypeOfMaterial
	:rtype: bool") MaterialType;
		Standard_Boolean MaterialType (const Graphic3d_TypeOfMaterial theType);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the material name (within predefined enumeration).
	:rtype: Graphic3d_NameOfMaterial") Name;
		Graphic3d_NameOfMaterial Name ();

		/****************** NumberOfMaterials ******************/
		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "* Returns the number of predefined textures.
	:rtype: int") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials ();

		/****************** ReflectionMode ******************/
		%feature("compactdefaultargs") ReflectionMode;
		%feature("autodoc", "* Returns True if the reflection mode is active, False otherwise.
	:param theType:
	:type theType: Graphic3d_TypeOfReflection
	:rtype: bool") ReflectionMode;
		Standard_Boolean ReflectionMode (const Graphic3d_TypeOfReflection theType);

		/****************** RefractionIndex ******************/
		%feature("compactdefaultargs") RefractionIndex;
		%feature("autodoc", "* Returns the refraction index of the material
	:rtype: Standard_ShortReal") RefractionIndex;
		Standard_ShortReal RefractionIndex ();

		/****************** RequestedName ******************/
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "* Returns the material name within predefined enumeration which has been requested (before modifications).
	:rtype: Graphic3d_NameOfMaterial") RequestedName;
		Graphic3d_NameOfMaterial RequestedName ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Resets the material with the original values according to the material name but leave the current color values untouched for the material of type ASPECT.
	:rtype: None") Reset;
		void Reset ();

		/****************** SetAlpha ******************/
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "* Modifies the alpha coefficient of the surface, where 1.0 is opaque and 0.0 is fully transparent.
	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetAlpha;
		void SetAlpha (Standard_ShortReal theValue);

		/****************** SetAmbientColor ******************/
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "* Modifies the ambient color of the surface.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetAmbientColor;
		void SetAmbientColor (const Quantity_Color & theColor);

		/****************** SetBSDF ******************/
		%feature("compactdefaultargs") SetBSDF;
		%feature("autodoc", "* Modifies the BSDF (bidirectional scattering distribution function).
	:param theBSDF:
	:type theBSDF: Graphic3d_BSDF
	:rtype: None") SetBSDF;
		void SetBSDF (const Graphic3d_BSDF & theBSDF);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Modifies the ambient and diffuse color of the surface. WARNING! Has no effect for Graphic3d_MATERIAL_ASPECT material (color should be set to Graphic3d_Aspects::SetInteriorColor()).
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetDiffuseColor ******************/
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "* Modifies the diffuse color of the surface.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetDiffuseColor;
		void SetDiffuseColor (const Quantity_Color & theColor);

		/****************** SetEmissiveColor ******************/
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "* Modifies the emissive color of the surface.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetEmissiveColor;
		void SetEmissiveColor (const Quantity_Color & theColor);

		/****************** SetMaterialName ******************/
		%feature("compactdefaultargs") SetMaterialName;
		%feature("autodoc", "* The current material become a 'UserDefined' material. Set the name of the 'UserDefined' material.
	:param theName:
	:type theName: TCollection_AsciiString
	:rtype: None") SetMaterialName;
		void SetMaterialName (const TCollection_AsciiString & theName);

		/****************** SetMaterialType ******************/
		%feature("compactdefaultargs") SetMaterialType;
		%feature("autodoc", "* Set material type.
	:param theType:
	:type theType: Graphic3d_TypeOfMaterial
	:rtype: None") SetMaterialType;
		void SetMaterialType (const Graphic3d_TypeOfMaterial theType);

		/****************** SetReflectionModeOff ******************/
		%feature("compactdefaultargs") SetReflectionModeOff;
		%feature("autodoc", "* Deactivates the reflective properties of the surface with specified reflection type.
	:param theType:
	:type theType: Graphic3d_TypeOfReflection
	:rtype: None") SetReflectionModeOff;
		void SetReflectionModeOff (const Graphic3d_TypeOfReflection theType);

		/****************** SetRefractionIndex ******************/
		%feature("compactdefaultargs") SetRefractionIndex;
		%feature("autodoc", "* Modifies the refraction index of the material. Warning: Raises MaterialDefinitionError if given value is a lesser than 1.0.
	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetRefractionIndex;
		void SetRefractionIndex (const Standard_ShortReal theValue);

		/****************** SetShininess ******************/
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "* Modifies the luminosity of the surface. Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.
	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetShininess;
		void SetShininess (const Standard_ShortReal theValue);

		/****************** SetSpecularColor ******************/
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "* Modifies the specular color of the surface.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetSpecularColor;
		void SetSpecularColor (const Quantity_Color & theColor);

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "* Modifies the transparency coefficient of the surface, where 0 is opaque and 1 is fully transparent. Transparency is applicable to materials that have at least one of reflection modes (ambient, diffuse, specular or emissive) enabled. See also SetReflectionModeOn() and SetReflectionModeOff() methods. //! Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.
	:param theValue:
	:type theValue: Standard_ShortReal
	:rtype: None") SetTransparency;
		void SetTransparency (const Standard_ShortReal theValue);

		/****************** Shininess ******************/
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "* Returns the luminosity of the surface.
	:rtype: Standard_ShortReal") Shininess;
		Standard_ShortReal Shininess ();

		/****************** SpecularColor ******************/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "* Returns the specular color of the surface.
	:rtype: Quantity_Color") SpecularColor;
		const Quantity_Color & SpecularColor ();

		/****************** StringName ******************/
		%feature("compactdefaultargs") StringName;
		%feature("autodoc", "* Returns the given name of this material. This might be: - given name set by method ::SetMaterialName() - standard name for a material within enumeration - 'UserDefined' for non-standard material without name specified externally.
	:rtype: TCollection_AsciiString") StringName;
		const TCollection_AsciiString & StringName ();

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "* Returns the transparency coefficient of the surface (1.0 - Alpha); 0.0 means opaque.
	:rtype: Standard_ShortReal") Transparency;
		Standard_ShortReal Transparency ();


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

/********************************
* class Graphic3d_PolygonOffset *
********************************/
class Graphic3d_PolygonOffset {
	public:
		Aspect_PolygonOffsetMode Mode;
		Standard_ShortReal Factor;
		Standard_ShortReal Units;

        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** Graphic3d_PolygonOffset ******************/
		%feature("compactdefaultargs") Graphic3d_PolygonOffset;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_PolygonOffset;
		 Graphic3d_PolygonOffset ();


        %extend{
            bool __eq_wrapper__(const Graphic3d_PolygonOffset  other) {
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


%extend Graphic3d_PolygonOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Graphic3d_PresentationAttributes *
*****************************************/
class Graphic3d_PresentationAttributes : public Standard_Transient {
	public:
		/****************** BasicFillAreaAspect ******************/
		%feature("compactdefaultargs") BasicFillAreaAspect;
		%feature("autodoc", "* Return basic presentation fill area aspect, NULL by default. When set, might be used instead of Color() property.
	:rtype: opencascade::handle<Graphic3d_AspectFillArea3d>") BasicFillAreaAspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & BasicFillAreaAspect ();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Returns basic presentation color, Quantity_NOC_WHITE by default.
	:rtype: Quantity_Color") Color;
		const Quantity_Color & Color ();

		/****************** ColorRGBA ******************/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "* Returns basic presentation color (including alpha channel).
	:rtype: Quantity_ColorRGBA") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA ();

		/****************** DisplayMode ******************/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "* Returns display mode, 0 by default. -1 means undefined (main display mode of presentation to be used).
	:rtype: int") DisplayMode;
		Standard_Integer DisplayMode ();

		/****************** Graphic3d_PresentationAttributes ******************/
		%feature("compactdefaultargs") Graphic3d_PresentationAttributes;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_PresentationAttributes;
		 Graphic3d_PresentationAttributes ();

		/****************** Method ******************/
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "* Returns highlight method, Aspect_TOHM_COLOR by default.
	:rtype: Aspect_TypeOfHighlightMethod") Method;
		Aspect_TypeOfHighlightMethod Method ();

		/****************** SetBasicFillAreaAspect ******************/
		%feature("compactdefaultargs") SetBasicFillAreaAspect;
		%feature("autodoc", "* Sets basic presentation fill area aspect.
	:param theAspect:
	:type theAspect: Graphic3d_AspectFillArea3d
	:rtype: None") SetBasicFillAreaAspect;
		void SetBasicFillAreaAspect (const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Sets basic presentation color (RGB components, does not modifies transparency).
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetDisplayMode ******************/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "* Sets display mode.
	:param theMode:
	:type theMode: int
	:rtype: None") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer theMode);

		/****************** SetMethod ******************/
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "* Changes highlight method to the given one.
	:param theMethod:
	:type theMethod: Aspect_TypeOfHighlightMethod
	:rtype: None") SetMethod;
		void SetMethod (const Aspect_TypeOfHighlightMethod theMethod);

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "* Sets basic presentation transparency (0 - opaque, 1 - fully transparent).
	:param theTranspCoef:
	:type theTranspCoef: Standard_ShortReal
	:rtype: None") SetTransparency;
		void SetTransparency (const Standard_ShortReal theTranspCoef);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "* Sets presentation Zlayer.
	:param theLayer:
	:type theLayer: int
	:rtype: None") SetZLayer;
		void SetZLayer (int theLayer);

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "* Returns basic presentation transparency (0 - opaque, 1 - fully transparent), 0 by default (opaque).
	:rtype: Standard_ShortReal") Transparency;
		Standard_ShortReal Transparency ();

		/****************** ZLayer ******************/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "* Returns presentation Zlayer, Graphic3d_ZLayerId_Default by default. Graphic3d_ZLayerId_UNKNOWN means undefined (a layer of main presentation to be used).
	:rtype: Graphic3d_ZLayerId") ZLayer;
		Graphic3d_ZLayerId ZLayer ();

};


%make_alias(Graphic3d_PresentationAttributes)

%extend Graphic3d_PresentationAttributes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Graphic3d_RenderingParams *
**********************************/
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

enum PerfCounters {
	PerfCounters_NONE = 0,
	PerfCounters_FrameRate = 1,
	PerfCounters_CPU = 2,
	PerfCounters_Layers = 4,
	PerfCounters_Structures = 8,
	PerfCounters_Groups = 16,
	PerfCounters_GroupArrays = 32,
	PerfCounters_Triangles = 64,
	PerfCounters_Points = 128,
	PerfCounters_EstimMem = 256,
	PerfCounters_FrameTime = 512,
	PerfCounters_FrameTimeMax = 1024,
	PerfCounters_SkipImmediate = 2048,
	PerfCounters_Basic = PerfCounters_FrameRate | PerfCounters_CPU | PerfCounters_Layers | PerfCounters_Structures,
	PerfCounters_Extended = PerfCounters_Basic | PerfCounters_Groups | PerfCounters_GroupArrays | PerfCounters_Triangles | PerfCounters_Points | PerfCounters_EstimMem,
	PerfCounters_All = PerfCounters_Extended | PerfCounters_FrameTime | PerfCounters_FrameTimeMax,
};

enum FrustumCulling {
	FrustumCulling_Off = 0,
	FrustumCulling_On = 1,
	FrustumCulling_NoUpdate = 2,
};

/* end public enums declaration */

		Graphic3d_RenderingMode Method;
		Graphic3d_RenderTransparentMethod TransparencyMethod;
		Standard_ShortReal LineFeather;
		Standard_ShortReal OitDepthFactor;
		int NbMsaaSamples;
		Standard_ShortReal RenderResolutionScale;
		bool ToEnableDepthPrepass;
		bool ToEnableAlphaToCoverage;
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
		bool AdaptiveScreenSamplingAtomic;
		bool ShowSamplingTiles;
		bool TwoSidedBsdfModels;
		Standard_ShortReal RadianceClampingValue;
		bool RebuildRayTracingShaders;
		int RayTracingTileSize;
		int NbRayTracingTiles;
		Standard_ShortReal CameraApertureRadius;
		Standard_ShortReal CameraFocalPlaneDist;
		FrustumCulling FrustumCullingState;
		Graphic3d_ToneMappingMethod ToneMappingMethod;
		Standard_ShortReal Exposure;
		Standard_ShortReal WhitePoint;
		Graphic3d_StereoMode StereoMode;
		Anaglyph AnaglyphFilter;
		Graphic3d_Mat4 AnaglyphLeft;
		Graphic3d_Mat4 AnaglyphRight;
		bool ToReverseStereo;
		opencascade::handle<Graphic3d_TransformPers> StatsPosition;
		opencascade::handle<Graphic3d_TransformPers> ChartPosition;
		Graphic3d_Vec2i ChartSize;
		opencascade::handle<Graphic3d_AspectText3d> StatsTextAspect;
		Standard_ShortReal StatsUpdateInterval;
		int StatsTextHeight;
		int StatsNbFrames;
		Standard_ShortReal StatsMaxChartTime;
		PerfCounters CollectedStats;
		bool ToShowStats;
		unsigned int Resolution;
		/****************** Graphic3d_RenderingParams ******************/
		%feature("compactdefaultargs") Graphic3d_RenderingParams;
		%feature("autodoc", "* Creates default rendering parameters.
	:rtype: None") Graphic3d_RenderingParams;
		 Graphic3d_RenderingParams ();

		/****************** ResolutionRatio ******************/
		%feature("compactdefaultargs") ResolutionRatio;
		%feature("autodoc", "* Returns resolution ratio.
	:rtype: Standard_ShortReal") ResolutionRatio;
		Standard_ShortReal ResolutionRatio ();

};


%extend Graphic3d_RenderingParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class Graphic3d_SequenceOfHClipPlane *
***************************************/
class Graphic3d_SequenceOfHClipPlane : public Standard_Transient {
	public:
		class Iterator {};
		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "* Append a plane. returns True if new item has been added (False if item already existed)
	:param theItem:
	:type theItem: Graphic3d_ClipPlane
	:rtype: bool") Append;
		bool Append (const opencascade::handle<Graphic3d_ClipPlane> & theItem);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clear the items out.
	:rtype: None") Clear;
		void Clear ();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "* Return the first item in sequence.
	:rtype: opencascade::handle<Graphic3d_ClipPlane>") First;
		const opencascade::handle<Graphic3d_ClipPlane> & First ();

		/****************** Graphic3d_SequenceOfHClipPlane ******************/
		%feature("compactdefaultargs") Graphic3d_SequenceOfHClipPlane;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_SequenceOfHClipPlane;
		 Graphic3d_SequenceOfHClipPlane ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Return True if sequence is empty.
	:rtype: bool") IsEmpty;
		bool IsEmpty ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Remove a plane. returns True if item has been found and removed
	:param theItem:
	:type theItem: Graphic3d_ClipPlane
	:rtype: bool") Remove;
		bool Remove (const opencascade::handle<Graphic3d_ClipPlane> & theItem);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Remove a plane.
	:param theItem:
	:type theItem: Iterator
	:rtype: None") Remove;
		void Remove (Iterator & theItem);

		/****************** SetOverrideGlobal ******************/
		%feature("compactdefaultargs") SetOverrideGlobal;
		%feature("autodoc", "* Setup flag defining if local properties should override global properties.
	:param theToOverride:
	:type theToOverride: bool
	:rtype: None") SetOverrideGlobal;
		void SetOverrideGlobal (const Standard_Boolean theToOverride);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Return the number of items in sequence.
	:rtype: int") Size;
		Standard_Integer Size ();

		/****************** ToOverrideGlobal ******************/
		%feature("compactdefaultargs") ToOverrideGlobal;
		%feature("autodoc", "* Return true if local properties should override global properties.
	:rtype: bool") ToOverrideGlobal;
		Standard_Boolean ToOverrideGlobal ();

};


%make_alias(Graphic3d_SequenceOfHClipPlane)

%extend Graphic3d_SequenceOfHClipPlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Graphic3d_ShaderAttribute *
**********************************/
class Graphic3d_ShaderAttribute : public Standard_Transient {
	public:
		/****************** Graphic3d_ShaderAttribute ******************/
		%feature("compactdefaultargs") Graphic3d_ShaderAttribute;
		%feature("autodoc", "* Creates new attribute.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theLocation:
	:type theLocation: int
	:rtype: None") Graphic3d_ShaderAttribute;
		 Graphic3d_ShaderAttribute (const TCollection_AsciiString & theName,const int theLocation);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "* Returns attribute location to be bound on GLSL program linkage stage.
	:rtype: int") Location;
		int Location ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns name of shader variable.
	:rtype: TCollection_AsciiString") Name;
		const TCollection_AsciiString & Name ();

};


%make_alias(Graphic3d_ShaderAttribute)

%extend Graphic3d_ShaderAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_ShaderObject *
*******************************/
%nodefaultctor Graphic3d_ShaderObject;
class Graphic3d_ShaderObject : public Standard_Transient {
	public:
		/****************** CreateFromFile ******************/
		%feature("compactdefaultargs") CreateFromFile;
		%feature("autodoc", "* Creates new shader object from specified file.
	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param thePath:
	:type thePath: TCollection_AsciiString
	:rtype: opencascade::handle<Graphic3d_ShaderObject>") CreateFromFile;
		static opencascade::handle<Graphic3d_ShaderObject> CreateFromFile (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & thePath);

		/****************** CreateFromSource ******************/
		%feature("compactdefaultargs") CreateFromSource;
		%feature("autodoc", "* Creates new shader object from specified source.
	:param theType:
	:type theType: Graphic3d_TypeOfShaderObject
	:param theSource:
	:type theSource: TCollection_AsciiString
	:rtype: opencascade::handle<Graphic3d_ShaderObject>") CreateFromSource;
		static opencascade::handle<Graphic3d_ShaderObject> CreateFromSource (const Graphic3d_TypeOfShaderObject theType,const TCollection_AsciiString & theSource);

		/****************** GetId ******************/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "* Returns unique ID used to manage resource in graphic driver.
	:rtype: TCollection_AsciiString") GetId;
		const TCollection_AsciiString & GetId ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Checks if the shader object is valid or not.
	:rtype: bool") IsDone;
		virtual Standard_Boolean IsDone ();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "* Returns the full path to the shader source.
	:rtype: OSD_Path") Path;
		const OSD_Path & Path ();

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "* Returns the source code of the shader object.
	:rtype: TCollection_AsciiString") Source;
		const TCollection_AsciiString & Source ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns type of the shader object.
	:rtype: Graphic3d_TypeOfShaderObject") Type;
		Graphic3d_TypeOfShaderObject Type ();

};


%make_alias(Graphic3d_ShaderObject)

%extend Graphic3d_ShaderObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Graphic3d_ShaderProgram *
********************************/
class Graphic3d_ShaderProgram : public Standard_Transient {
	public:
		/****************** AppendToHeader ******************/
		%feature("compactdefaultargs") AppendToHeader;
		%feature("autodoc", "* Append line to GLSL header.
	:param theHeaderLine:
	:type theHeaderLine: TCollection_AsciiString
	:rtype: None") AppendToHeader;
		void AppendToHeader (const TCollection_AsciiString & theHeaderLine);

		/****************** AttachShader ******************/
		%feature("compactdefaultargs") AttachShader;
		%feature("autodoc", "* Attaches shader object to the program object.
	:param theShader:
	:type theShader: Graphic3d_ShaderObject
	:rtype: bool") AttachShader;
		Standard_Boolean AttachShader (const opencascade::handle<Graphic3d_ShaderObject> & theShader);

		/****************** ClearVariables ******************/
		%feature("compactdefaultargs") ClearVariables;
		%feature("autodoc", "* Removes all custom uniform variables from the program.
	:rtype: None") ClearVariables;
		void ClearVariables ();

		/****************** DetachShader ******************/
		%feature("compactdefaultargs") DetachShader;
		%feature("autodoc", "* Detaches shader object from the program object.
	:param theShader:
	:type theShader: Graphic3d_ShaderObject
	:rtype: bool") DetachShader;
		Standard_Boolean DetachShader (const opencascade::handle<Graphic3d_ShaderObject> & theShader);

		/****************** GetId ******************/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "* Returns unique ID used to manage resource in graphic driver.
	:rtype: TCollection_AsciiString") GetId;
		const TCollection_AsciiString & GetId ();

		/****************** Graphic3d_ShaderProgram ******************/
		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "* Creates new empty program object.
	:rtype: None") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram ();

		/****************** HasAlphaTest ******************/
		%feature("compactdefaultargs") HasAlphaTest;
		%feature("autodoc", "* Return true if Fragment Shader should perform alpha test; False by default.
	:rtype: bool") HasAlphaTest;
		Standard_Boolean HasAlphaTest ();

		/****************** HasDefaultSampler ******************/
		%feature("compactdefaultargs") HasDefaultSampler;
		%feature("autodoc", "* Return True if standard program header should define default texture sampler occSampler0; True by default for compatibility.
	:rtype: bool") HasDefaultSampler;
		Standard_Boolean HasDefaultSampler ();

		/****************** HasWeightOitOutput ******************/
		%feature("compactdefaultargs") HasWeightOitOutput;
		%feature("autodoc", "* Return true if Fragment Shader color should output the weighted OIT coverage; False by default.
	:rtype: bool") HasWeightOitOutput;
		Standard_Boolean HasWeightOitOutput ();

		/****************** Header ******************/
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "* Returns GLSL header (version code and extensions).
	:rtype: TCollection_AsciiString") Header;
		const TCollection_AsciiString & Header ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Checks if the program object is valid or not.
	:rtype: bool") IsDone;
		virtual Standard_Boolean IsDone ();

		/****************** NbClipPlanesMax ******************/
		%feature("compactdefaultargs") NbClipPlanesMax;
		%feature("autodoc", "* Return the length of array of clipping planes (THE_MAX_CLIP_PLANES), to be used for initialization occClipPlaneEquations. Default value is THE_MAX_CLIP_PLANES_DEFAULT.
	:rtype: int") NbClipPlanesMax;
		Standard_Integer NbClipPlanesMax ();

		/****************** NbFragmentOutputs ******************/
		%feature("compactdefaultargs") NbFragmentOutputs;
		%feature("autodoc", "* Returns the number (1+) of Fragment Shader outputs to be written to (more than 1 can be in case of multiple draw buffers); 1 by default.
	:rtype: int") NbFragmentOutputs;
		Standard_Integer NbFragmentOutputs ();

		/****************** NbLightsMax ******************/
		%feature("compactdefaultargs") NbLightsMax;
		%feature("autodoc", "* Return the length of array of light sources (THE_MAX_LIGHTS), to be used for initialization occLightSources. Default value is THE_MAX_LIGHTS_DEFAULT.
	:rtype: int") NbLightsMax;
		Standard_Integer NbLightsMax ();

		/****************** PushVariableFloat ******************/
		%feature("compactdefaultargs") PushVariableFloat;
		%feature("autodoc", "* Pushes float uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: float
	:rtype: bool") PushVariableFloat;
		Standard_Boolean PushVariableFloat (const TCollection_AsciiString & theName,const float theValue);

		/****************** PushVariableInt ******************/
		%feature("compactdefaultargs") PushVariableInt;
		%feature("autodoc", "* Pushes int uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: int
	:rtype: bool") PushVariableInt;
		Standard_Boolean PushVariableInt (const TCollection_AsciiString & theName,const int theValue);

		/****************** PushVariableVec2 ******************/
		%feature("compactdefaultargs") PushVariableVec2;
		%feature("autodoc", "* Pushes vec2 uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: Graphic3d_Vec2
	:rtype: bool") PushVariableVec2;
		Standard_Boolean PushVariableVec2 (const TCollection_AsciiString & theName,const Graphic3d_Vec2 & theValue);

		/****************** PushVariableVec2i ******************/
		%feature("compactdefaultargs") PushVariableVec2i;
		%feature("autodoc", "* Pushes vec2i uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: Graphic3d_Vec2i
	:rtype: bool") PushVariableVec2i;
		Standard_Boolean PushVariableVec2i (const TCollection_AsciiString & theName,const Graphic3d_Vec2i & theValue);

		/****************** PushVariableVec3 ******************/
		%feature("compactdefaultargs") PushVariableVec3;
		%feature("autodoc", "* Pushes vec3 uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: Graphic3d_Vec3
	:rtype: bool") PushVariableVec3;
		Standard_Boolean PushVariableVec3 (const TCollection_AsciiString & theName,const Graphic3d_Vec3 & theValue);

		/****************** PushVariableVec3i ******************/
		%feature("compactdefaultargs") PushVariableVec3i;
		%feature("autodoc", "* Pushes vec3i uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: Graphic3d_Vec3i
	:rtype: bool") PushVariableVec3i;
		Standard_Boolean PushVariableVec3i (const TCollection_AsciiString & theName,const Graphic3d_Vec3i & theValue);

		/****************** PushVariableVec4 ******************/
		%feature("compactdefaultargs") PushVariableVec4;
		%feature("autodoc", "* Pushes vec4 uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: Graphic3d_Vec4
	:rtype: bool") PushVariableVec4;
		Standard_Boolean PushVariableVec4 (const TCollection_AsciiString & theName,const Graphic3d_Vec4 & theValue);

		/****************** PushVariableVec4i ******************/
		%feature("compactdefaultargs") PushVariableVec4i;
		%feature("autodoc", "* Pushes vec4i uniform.
	:param theName:
	:type theName: TCollection_AsciiString
	:param theValue:
	:type theValue: Graphic3d_Vec4i
	:rtype: bool") PushVariableVec4i;
		Standard_Boolean PushVariableVec4i (const TCollection_AsciiString & theName,const Graphic3d_Vec4i & theValue);

		/****************** SetAlphaTest ******************/
		%feature("compactdefaultargs") SetAlphaTest;
		%feature("autodoc", "* Set if Fragment Shader should perform alpha test. Note that this flag is designed for usage with - custom shader program may discard fragment regardless this flag.
	:param theAlphaTest:
	:type theAlphaTest: bool
	:rtype: None") SetAlphaTest;
		void SetAlphaTest (Standard_Boolean theAlphaTest);

		/****************** SetDefaultSampler ******************/
		%feature("compactdefaultargs") SetDefaultSampler;
		%feature("autodoc", "* Set if standard program header should define default texture sampler occSampler0.
	:param theHasDefSampler:
	:type theHasDefSampler: bool
	:rtype: None") SetDefaultSampler;
		void SetDefaultSampler (Standard_Boolean theHasDefSampler);

		/****************** SetHeader ******************/
		%feature("compactdefaultargs") SetHeader;
		%feature("autodoc", "* Setup GLSL header containing language version code and used extensions. Will be prepended to the very beginning of the source code. Example: @code #version 300 es #extension GL_ARB_bindless_texture : require @endcode
	:param theHeader:
	:type theHeader: TCollection_AsciiString
	:rtype: None") SetHeader;
		void SetHeader (const TCollection_AsciiString & theHeader);

		/****************** SetId ******************/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "* Sets unique ID used to manage resource in graphic driver. WARNING! Graphic3d_ShaderProgram constructor generates a unique id for proper resource management; however if application overrides it, it is responsibility of application to avoid name collisions.
	:param theId:
	:type theId: TCollection_AsciiString
	:rtype: None") SetId;
		void SetId (const TCollection_AsciiString & theId);

		/****************** SetNbClipPlanesMax ******************/
		%feature("compactdefaultargs") SetNbClipPlanesMax;
		%feature("autodoc", "* Specify the length of array of clipping planes (THE_MAX_CLIP_PLANES).
	:param theNbPlanes:
	:type theNbPlanes: int
	:rtype: None") SetNbClipPlanesMax;
		void SetNbClipPlanesMax (Standard_Integer theNbPlanes);

		/****************** SetNbFragmentOutputs ******************/
		%feature("compactdefaultargs") SetNbFragmentOutputs;
		%feature("autodoc", "* Sets the number of Fragment Shader outputs to be written to. Should be done before GLSL program initialization.
	:param theNbOutputs:
	:type theNbOutputs: int
	:rtype: None") SetNbFragmentOutputs;
		void SetNbFragmentOutputs (const Standard_Integer theNbOutputs);

		/****************** SetNbLightsMax ******************/
		%feature("compactdefaultargs") SetNbLightsMax;
		%feature("autodoc", "* Specify the length of array of light sources (THE_MAX_LIGHTS).
	:param theNbLights:
	:type theNbLights: int
	:rtype: None") SetNbLightsMax;
		void SetNbLightsMax (Standard_Integer theNbLights);

		/****************** SetVertexAttributes ******************/
		%feature("compactdefaultargs") SetVertexAttributes;
		%feature("autodoc", "* Assign the list of custom vertex attributes. Should be done before GLSL program initialization.
	:param theAttributes:
	:type theAttributes: Graphic3d_ShaderAttributeList
	:rtype: None") SetVertexAttributes;
		void SetVertexAttributes (const Graphic3d_ShaderAttributeList & theAttributes);

		/****************** SetWeightOitOutput ******************/
		%feature("compactdefaultargs") SetWeightOitOutput;
		%feature("autodoc", "* Set if Fragment Shader color should output the weighted OIT coverage. Note that weighted OIT also requires at least 2 Fragment Outputs (color + coverage).
	:param theOutput:
	:type theOutput: bool
	:rtype: None") SetWeightOitOutput;
		void SetWeightOitOutput (Standard_Boolean theOutput);

		/****************** ShaderObjects ******************/
		%feature("compactdefaultargs") ShaderObjects;
		%feature("autodoc", "* Returns list of attached shader objects.
	:rtype: Graphic3d_ShaderObjectList") ShaderObjects;
		const Graphic3d_ShaderObjectList & ShaderObjects ();

		/****************** ShadersFolder ******************/
		%feature("compactdefaultargs") ShadersFolder;
		%feature("autodoc", "* The path to GLSL programs determined from CSF_ShadersDirectory or CASROOT environment variables. returns the root folder with default GLSL programs.
	:rtype: TCollection_AsciiString") ShadersFolder;
		static const TCollection_AsciiString & ShadersFolder ();

		/****************** Variables ******************/
		%feature("compactdefaultargs") Variables;
		%feature("autodoc", "* The list of currently pushed but not applied custom uniform variables. This list is automatically cleared after applying to GLSL program.
	:rtype: Graphic3d_ShaderVariableList") Variables;
		const Graphic3d_ShaderVariableList & Variables ();

		/****************** VertexAttributes ******************/
		%feature("compactdefaultargs") VertexAttributes;
		%feature("autodoc", "* Return the list of custom vertex attributes.
	:rtype: Graphic3d_ShaderAttributeList") VertexAttributes;
		const Graphic3d_ShaderAttributeList & VertexAttributes ();

};


%make_alias(Graphic3d_ShaderProgram)

%extend Graphic3d_ShaderProgram {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Graphic3d_ShaderVariable *
*********************************/
%nodefaultctor Graphic3d_ShaderVariable;
class Graphic3d_ShaderVariable : public Standard_Transient {
	public:
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Checks if the shader variable is valid or not.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns name of shader variable.
	:rtype: TCollection_AsciiString") Name;
		const TCollection_AsciiString & Name ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns interface of shader variable value.
	:rtype: Graphic3d_ValueInterface *") Value;
		Graphic3d_ValueInterface * Value ();

};


%make_alias(Graphic3d_ShaderVariable)

%extend Graphic3d_ShaderVariable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Graphic3d_Structure *
****************************/
class Graphic3d_Structure : public Standard_Transient {
	public:
		/****************** AcceptConnection ******************/
		%feature("compactdefaultargs") AcceptConnection;
		%feature("autodoc", "* Returns Standard_True if the connection is possible between <AStructure1> and <AStructure2> without a creation of a cycle. //! It's not possible to call the method AStructure1->Connect (AStructure2, TypeOfConnection) if - the set of all ancestors of <AStructure1> contains <AStructure1> and if the TypeOfConnection == TOC_DESCENDANT - the set of all descendants of <AStructure1> contains <AStructure2> and if the TypeOfConnection == TOC_ANCESTOR
	:param theStructure1:
	:type theStructure1: Graphic3d_Structure *
	:param theStructure2:
	:type theStructure2: Graphic3d_Structure *
	:param theType:
	:type theType: Graphic3d_TypeOfConnection
	:rtype: bool") AcceptConnection;
		static Standard_Boolean AcceptConnection (Graphic3d_Structure * theStructure1,Graphic3d_Structure * theStructure2,Graphic3d_TypeOfConnection theType);

		/****************** Ancestors ******************/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "* Returns the group of structures to which <self> is connected.
	:param SG:
	:type SG: Graphic3d_MapOfStructure
	:rtype: None") Ancestors;
		void Ancestors (Graphic3d_MapOfStructure & SG);

		/****************** CStructure ******************/
		%feature("compactdefaultargs") CStructure;
		%feature("autodoc", "* Returns the low-level structure
	:rtype: opencascade::handle<Graphic3d_CStructure>") CStructure;
		const opencascade::handle<Graphic3d_CStructure> & CStructure ();

		/****************** CalculateBoundBox ******************/
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "* Computes axis-aligned bounding box of a structure.
	:rtype: void") CalculateBoundBox;
		virtual void CalculateBoundBox ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* if WithDestruction == Standard_True then suppress all the groups of primitives in the structure. and it is mandatory to create a new group in <self>. if WithDestruction == Standard_False then clears all the groups of primitives in the structure. and all the groups are conserved and empty. They will be erased at the next screen update. The structure itself is conserved. The transformation and the attributes of <self> are conserved. The childs of <self> are conserved.
	:param WithDestruction: default value is Standard_True
	:type WithDestruction: bool
	:rtype: void") Clear;
		virtual void Clear (const Standard_Boolean WithDestruction = Standard_True);

		/****************** ClipPlanes ******************/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "* Get clip planes slicing the structure on rendering. returns set of clip planes.
	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes ();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", ":rtype: None") Compute;
		void Compute ();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Returns the new Structure defined for the new visualization
	:param theProjector:
	:type theProjector: Graphic3d_DataStructureManager
	:rtype: opencascade::handle<Graphic3d_Structure>") Compute;
		opencascade::handle<Graphic3d_Structure> Compute (const opencascade::handle<Graphic3d_DataStructureManager> & theProjector);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Returns the new Structure defined for the new visualization
	:param theProjector:
	:type theProjector: Graphic3d_DataStructureManager
	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: opencascade::handle<Graphic3d_Structure>") Compute;
		opencascade::handle<Graphic3d_Structure> Compute (const opencascade::handle<Graphic3d_DataStructureManager> & theProjector,const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Returns the new Structure defined for the new visualization
	:param theProjector:
	:type theProjector: Graphic3d_DataStructureManager
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:rtype: None") Compute;
		void Compute (const opencascade::handle<Graphic3d_DataStructureManager> & theProjector,opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Returns the new Structure defined for the new visualization
	:param theProjector:
	:type theProjector: Graphic3d_DataStructureManager
	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:rtype: None") Compute;
		void Compute (const opencascade::handle<Graphic3d_DataStructureManager> & theProjector,const opencascade::handle<Geom_Transformation> & theTrsf,opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** ComputeVisual ******************/
		%feature("compactdefaultargs") ComputeVisual;
		%feature("autodoc", ":rtype: Graphic3d_TypeOfStructure") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual ();

		/****************** Connect ******************/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "* If Atype is TOC_DESCENDANT then add <AStructure> as a child structure of <self>. If Atype is TOC_ANCESTOR then add <AStructure> as a parent structure of <self>. The connection propagates Display, Highlight, Erase, Remove, and stacks the transformations. No connection if the graph of the structures contains a cycle and <WithCheck> is Standard_True;
	:param theStructure:
	:type theStructure: Graphic3d_Structure *
	:param theType:
	:type theType: Graphic3d_TypeOfConnection
	:param theWithCheck: default value is Standard_False
	:type theWithCheck: bool
	:rtype: None") Connect;
		void Connect (Graphic3d_Structure * theStructure,Graphic3d_TypeOfConnection theType,Standard_Boolean theWithCheck = Standard_False);

		/****************** Connect ******************/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", ":param thePrs:
	:type thePrs: Graphic3d_Structure
	:rtype: None") Connect;
		void Connect (const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****************** ContainsFacet ******************/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "* Returns Standard_True if the structure <self> contains Polygons, Triangles or Quadrangles.
	:rtype: bool") ContainsFacet;
		Standard_Boolean ContainsFacet ();

		/****************** CurrentGroup ******************/
		%feature("compactdefaultargs") CurrentGroup;
		%feature("autodoc", "* Returns the last created group or creates new one if list is empty.
	:rtype: opencascade::handle<Graphic3d_Group>") CurrentGroup;
		opencascade::handle<Graphic3d_Group> CurrentGroup ();

		/****************** Descendants ******************/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "* Returns the group of structures connected to <self>.
	:param SG:
	:type SG: Graphic3d_MapOfStructure
	:rtype: None") Descendants;
		void Descendants (Graphic3d_MapOfStructure & SG);

		/****************** Disconnect ******************/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "* Suppress the connection between <AStructure> and <self>.
	:param theStructure:
	:type theStructure: Graphic3d_Structure *
	:rtype: None") Disconnect;
		void Disconnect (Graphic3d_Structure * theStructure);

		/****************** DisconnectAll ******************/
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "* If Atype is TOC_DESCENDANT then suppress all the connections with the child structures of <self>. If Atype is TOC_ANCESTOR then suppress all the connections with the parent structures of <self>.
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: None") DisconnectAll;
		void DisconnectAll (const Graphic3d_TypeOfConnection AType);

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "* Displays the structure <self> in all the views of the visualiser.
	:rtype: void") Display;
		virtual void Display ();

		/****************** DisplayPriority ******************/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "* Returns the current display priority for this structure.
	:rtype: int") DisplayPriority;
		Standard_Integer DisplayPriority ();

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* Erases the structure <self> in all the views of the visualiser.
	:rtype: void") Erase;
		virtual void Erase ();

		/****************** GetZLayer ******************/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "* Get Z layer ID of displayed structure. The method returns -1 if the structure has no ID (deleted from graphic driver).
	:rtype: Graphic3d_ZLayerId") GetZLayer;
		Graphic3d_ZLayerId GetZLayer ();

		/****************** Graphic3d_Structure ******************/
		%feature("compactdefaultargs") Graphic3d_Structure;
		%feature("autodoc", "* Creates a graphic object in the manager theManager. It will appear in all the views of the visualiser. The structure is not displayed when it is created. @param theManager structure manager holding this structure @param theLinkPrs another structure for creating a shadow (linked) structure
	:param theManager:
	:type theManager: Graphic3d_StructureManager
	:param theLinkPrs: default value is opencascade::handle<Graphic3d_Structure>()
	:type theLinkPrs: Graphic3d_Structure
	:rtype: None") Graphic3d_Structure;
		 Graphic3d_Structure (const opencascade::handle<Graphic3d_StructureManager> & theManager,const opencascade::handle<Graphic3d_Structure> & theLinkPrs = opencascade::handle<Graphic3d_Structure>());

		/****************** GraphicClear ******************/
		%feature("compactdefaultargs") GraphicClear;
		%feature("autodoc", "* Clears the structure <self>.
	:param WithDestruction:
	:type WithDestruction: bool
	:rtype: None") GraphicClear;
		void GraphicClear (const Standard_Boolean WithDestruction);

		/****************** GraphicConnect ******************/
		%feature("compactdefaultargs") GraphicConnect;
		%feature("autodoc", ":param theDaughter:
	:type theDaughter: Graphic3d_Structure
	:rtype: None") GraphicConnect;
		void GraphicConnect (const opencascade::handle<Graphic3d_Structure> & theDaughter);

		/****************** GraphicDisconnect ******************/
		%feature("compactdefaultargs") GraphicDisconnect;
		%feature("autodoc", ":param theDaughter:
	:type theDaughter: Graphic3d_Structure
	:rtype: None") GraphicDisconnect;
		void GraphicDisconnect (const opencascade::handle<Graphic3d_Structure> & theDaughter);

		/****************** GraphicTransform ******************/
		%feature("compactdefaultargs") GraphicTransform;
		%feature("autodoc", "* Internal method which sets new transformation without calling graphic manager callbacks.
	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: None") GraphicTransform;
		void GraphicTransform (const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** Groups ******************/
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "* Returns the groups sequence included in this structure.
	:rtype: Graphic3d_SequenceOfGroup") Groups;
		const Graphic3d_SequenceOfGroup & Groups ();

		/****************** HLRValidation ******************/
		%feature("compactdefaultargs") HLRValidation;
		%feature("autodoc", "* Hidden parts stored in this structure are valid if: 1) the owner is defined. 2) they are not invalid.
	:rtype: bool") HLRValidation;
		Standard_Boolean HLRValidation ();

		/****************** Highlight ******************/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "* Highlights the structure in all the views with the given style @param theStyle [in] the style (type of highlighting: box/color, color and opacity) @param theToUpdateMgr [in] defines whether related computed structures will be highlighted via structure manager or not
	:param theStyle:
	:type theStyle: Graphic3d_PresentationAttributes
	:param theToUpdateMgr: default value is Standard_True
	:type theToUpdateMgr: bool
	:rtype: None") Highlight;
		void Highlight (const opencascade::handle<Graphic3d_PresentationAttributes> & theStyle,const Standard_Boolean theToUpdateMgr = Standard_True);

		/****************** HighlightStyle ******************/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "* Returns the highlight attributes.
	:rtype: opencascade::handle<Graphic3d_PresentationAttributes>") HighlightStyle;
		const opencascade::handle<Graphic3d_PresentationAttributes> & HighlightStyle ();

		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "* Returns the identification number of this structure.
	:rtype: int") Identification;
		Standard_Integer Identification ();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "* Returns True if this structure is deleted (after Remove() call).
	:rtype: bool") IsDeleted;
		Standard_Boolean IsDeleted ();

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "* Returns the display indicator for this structure.
	:rtype: bool") IsDisplayed;
		Standard_Boolean IsDisplayed ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns Standard_True if the structure <self> is empty. Warning: A structure is empty if : it do not have group or all the groups are empties and it do not have descendant or all the descendants are empties.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** IsHighlighted ******************/
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "* Returns the highlight indicator for this structure.
	:rtype: bool") IsHighlighted;
		Standard_Boolean IsHighlighted ();

		/****************** IsInfinite ******************/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "* Returns Standard_True if the structure <self> is infinite.
	:rtype: bool") IsInfinite;
		Standard_Boolean IsInfinite ();

		/****************** IsMutable ******************/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "* Returns true if structure has mutable nature (content or location are be changed regularly). Mutable structure will be managed in different way than static onces.
	:rtype: bool") IsMutable;
		Standard_Boolean IsMutable ();

		/****************** IsTransformed ******************/
		%feature("compactdefaultargs") IsTransformed;
		%feature("autodoc", "* Returns True if the structure is transformed.
	:rtype: bool") IsTransformed;
		Standard_Boolean IsTransformed ();

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "* Returns the visibility indicator for this structure.
	:rtype: bool") IsVisible;
		Standard_Boolean IsVisible ();

		/****************** MinMaxValues ******************/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "* Returns the coordinates of the boundary box of the structure <self>. If <theToIgnoreInfiniteFlag> is True, the method returns actual graphical boundaries of the Graphic3d_Group components. Otherwise, the method returns boundaries taking into account infinite state of the structure. This approach generally used for application specific fit operation (e.g. fitting the model into screen, not taking into accout infinite helper elements). Warning: If the structure <self> is empty then the empty box is returned, If the structure <self> is infinite then the whole box is returned.
	:param theToIgnoreInfiniteFlag: default value is Standard_False
	:type theToIgnoreInfiniteFlag: bool
	:rtype: Bnd_Box") MinMaxValues;
		Bnd_Box MinMaxValues (const Standard_Boolean theToIgnoreInfiniteFlag = Standard_False);

		/****************** Network ******************/
		%feature("compactdefaultargs") Network;
		%feature("autodoc", "* Returns <ASet> the group of structures : - directly or indirectly connected to <AStructure> if the TypeOfConnection == TOC_DESCENDANT - to which <AStructure> is directly or indirectly connected if the TypeOfConnection == TOC_ANCESTOR
	:param theStructure:
	:type theStructure: Graphic3d_Structure *
	:param theType:
	:type theType: Graphic3d_TypeOfConnection
	:param theSet:
	:type theSet: NCollection_Map<Graphic3d_Structure *>
	:rtype: void") Network;
		static void Network (Graphic3d_Structure * theStructure,const Graphic3d_TypeOfConnection theType,NCollection_Map<Graphic3d_Structure *> & theSet);

		/****************** NewGroup ******************/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "* Append new group to this structure.
	:rtype: opencascade::handle<Graphic3d_Group>") NewGroup;
		opencascade::handle<Graphic3d_Group> NewGroup ();

		/****************** NumberOfGroups ******************/
		%feature("compactdefaultargs") NumberOfGroups;
		%feature("autodoc", "* Returns the current number of groups in this structure.
	:rtype: int") NumberOfGroups;
		Standard_Integer NumberOfGroups ();

		/****************** Owner ******************/
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", ":rtype: Standard_Address") Owner;
		Standard_Address Owner ();

		/****************** PrintNetwork ******************/
		%feature("compactdefaultargs") PrintNetwork;
		%feature("autodoc", "* Prints informations about the network associated with the structure <AStructure>.
	:param AStructure:
	:type AStructure: Graphic3d_Structure
	:param AType:
	:type AType: Graphic3d_TypeOfConnection
	:rtype: void") PrintNetwork;
		static void PrintNetwork (const opencascade::handle<Graphic3d_Structure> & AStructure,const Graphic3d_TypeOfConnection AType);

		/****************** ReCompute ******************/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "* Forces a new construction of the structure <self> if <self> is displayed and TOS_COMPUTED.
	:rtype: None") ReCompute;
		void ReCompute ();

		/****************** ReCompute ******************/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "* Forces a new construction of the structure <self> if <self> is displayed in <aProjetor> and TOS_COMPUTED.
	:param aProjector:
	:type aProjector: Graphic3d_DataStructureManager
	:rtype: None") ReCompute;
		void ReCompute (const opencascade::handle<Graphic3d_DataStructureManager> & aProjector);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Suppress the structure <self>. It will be erased at the next screen update. Warning: No more graphic operations in <self> after this call. Category: Methods to modify the class definition
	:rtype: None") Remove;
		void Remove ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", ":param thePrs:
	:type thePrs: Graphic3d_Structure
	:rtype: None") Remove;
		void Remove (const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Suppress the structure in the list of descendants or in the list of ancestors.
	:param thePtr:
	:type thePtr: Graphic3d_Structure *
	:param theType:
	:type theType: Graphic3d_TypeOfConnection
	:rtype: None") Remove;
		void Remove (Graphic3d_Structure * thePtr,const Graphic3d_TypeOfConnection theType);

		/****************** RemoveAll ******************/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", ":rtype: None") RemoveAll;
		void RemoveAll ();

		/****************** ResetDisplayPriority ******************/
		%feature("compactdefaultargs") ResetDisplayPriority;
		%feature("autodoc", "* Reset the current priority of the structure to the previous priority. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority method erase <self> and display <self> with the previous priority.
	:rtype: None") ResetDisplayPriority;
		void ResetDisplayPriority ();

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "* Changes a sequence of clip planes slicing the structure on rendering. @param thePlanes [in] the set of clip planes.
	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None") SetClipPlanes;
		void SetClipPlanes (const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetComputeVisual ******************/
		%feature("compactdefaultargs") SetComputeVisual;
		%feature("autodoc", ":param theVisual:
	:type theVisual: Graphic3d_TypeOfStructure
	:rtype: None") SetComputeVisual;
		void SetComputeVisual (const Graphic3d_TypeOfStructure theVisual);

		/****************** SetDisplayPriority ******************/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "* Modifies the order of displaying the structure. Values are between 0 and 10. Structures are drawn according to their display priorities in ascending order. A structure of priority 10 is displayed the last and appears over the others. The default value is 5. Category: Methods to modify the class definition Warning: If <self> is displayed then the SetDisplayPriority method erase <self> and display <self> with the new priority. Raises PriorityDefinitionError if <Priority> is greater than 10 or a negative value.
	:param Priority:
	:type Priority: int
	:rtype: None") SetDisplayPriority;
		void SetDisplayPriority (const Standard_Integer Priority);

		/****************** SetHLRValidation ******************/
		%feature("compactdefaultargs") SetHLRValidation;
		%feature("autodoc", ":param theFlag:
	:type theFlag: bool
	:rtype: None") SetHLRValidation;
		void SetHLRValidation (const Standard_Boolean theFlag);

		/****************** SetInfiniteState ******************/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "* Sets infinite flag. When True, the MinMaxValues method returns: theXMin = theYMin = theZMin = RealFirst(). theXMax = theYMax = theZMax = RealLast(). By default, structure is created not infinite but empty.
	:param theToSet:
	:type theToSet: bool
	:rtype: None") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean theToSet);

		/****************** SetIsForHighlight ******************/
		%feature("compactdefaultargs") SetIsForHighlight;
		%feature("autodoc", "* Marks the structure <self> representing wired structure needed for highlight only so it won't be added to BVH tree.
	:param isForHighlight:
	:type isForHighlight: bool
	:rtype: None") SetIsForHighlight;
		void SetIsForHighlight (const Standard_Boolean isForHighlight);

		/****************** SetMutable ******************/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "* Sets if the structure location has mutable nature (content or location will be changed regularly).
	:param theIsMutable:
	:type theIsMutable: bool
	:rtype: None") SetMutable;
		void SetMutable (const Standard_Boolean theIsMutable);

		/****************** SetOwner ******************/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", ":param theOwner:
	:type theOwner: Standard_Address
	:rtype: None") SetOwner;
		void SetOwner (const Standard_Address theOwner);

		/****************** SetTransformPersistence ******************/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "* Modifies the current transform persistence (pan, zoom or rotate)
	:param theTrsfPers:
	:type theTrsfPers: Graphic3d_TransformPers
	:rtype: None") SetTransformPersistence;
		void SetTransformPersistence (const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "* Modifies the current local transformation
	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: None") SetTransformation;
		void SetTransformation (const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** SetVisible ******************/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "* Modifies the visibility indicator to Standard_True or Standard_False for the structure <self>. The default value at the definition of <self> is Standard_True.
	:param AValue:
	:type AValue: bool
	:rtype: None") SetVisible;
		void SetVisible (const Standard_Boolean AValue);

		/****************** SetVisual ******************/
		%feature("compactdefaultargs") SetVisual;
		%feature("autodoc", "* Modifies the visualisation mode for the structure <self>.
	:param AVisual:
	:type AVisual: Graphic3d_TypeOfStructure
	:rtype: void") SetVisual;
		virtual void SetVisual (const Graphic3d_TypeOfStructure AVisual);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "* Set Z layer ID for the structure. The Z layer mechanism allows to display structures presented in higher layers in overlay of structures in lower layers by switching off z buffer depth test between layers
	:param theLayerId:
	:type theLayerId: int
	:rtype: None") SetZLayer;
		void SetZLayer (int theLayerId);

		/****************** SetZoomLimit ******************/
		%feature("compactdefaultargs") SetZoomLimit;
		%feature("autodoc", "* Modifies the minimum and maximum zoom coefficients for the structure <self>. The default value at the definition of <self> is unlimited. Category: Methods to modify the class definition Warning: Raises StructureDefinitionError if <LimitInf> is greater than <LimitSup> or if <LimitInf> or <LimitSup> is a negative value.
	:param LimitInf:
	:type LimitInf: float
	:param LimitSup:
	:type LimitSup: float
	:rtype: None") SetZoomLimit;
		void SetZoomLimit (const Standard_Real LimitInf,const Standard_Real LimitSup);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", ":param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: None") Transform;
		void Transform (const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** TransformPersistence ******************/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "* returns transform persistence of the presentable object.
	:rtype: opencascade::handle<Graphic3d_TransformPers>") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence ();

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "* Return local transformation.
	:rtype: opencascade::handle<Geom_Transformation>") Transformation;
		const opencascade::handle<Geom_Transformation> & Transformation ();

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "* Transforms theX, theY, theZ with the transformation theTrsf.
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theNewX:
	:type theNewX: float
	:param theNewY:
	:type theNewY: float
	:param theNewZ:
	:type theNewZ: float
	:rtype: void") Transforms;
		static void Transforms (const gp_Trsf & theTrsf,const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** UnHighlight ******************/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "* Suppresses the highlight for the structure <self> in all the views of the visualiser.
	:rtype: None") UnHighlight;
		void UnHighlight ();

		/****************** Visual ******************/
		%feature("compactdefaultargs") Visual;
		%feature("autodoc", "* Returns the visualisation mode for the structure <self>.
	:rtype: Graphic3d_TypeOfStructure") Visual;
		Graphic3d_TypeOfStructure Visual ();

};


%make_alias(Graphic3d_Structure)

%extend Graphic3d_Structure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Graphic3d_StructureManager *
***********************************/
class Graphic3d_StructureManager : public Standard_Transient {
	public:
		/****************** ChangeDisplayPriority ******************/
		%feature("compactdefaultargs") ChangeDisplayPriority;
		%feature("autodoc", "* Changes the display priority of the structure <AStructure>.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:param theOldPriority:
	:type theOldPriority: int
	:param theNewPriority:
	:type theNewPriority: int
	:rtype: void") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority (const opencascade::handle<Graphic3d_Structure> & theStructure,const Standard_Integer theOldPriority,const Standard_Integer theNewPriority);

		/****************** ChangeZLayer ******************/
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "* Change Z layer for structure. The Z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:param theLayerId:
	:type theLayerId: int
	:rtype: void") ChangeZLayer;
		virtual void ChangeZLayer (const opencascade::handle<Graphic3d_Structure> & theStructure,int theLayerId);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the structure.
	:param theStructure:
	:type theStructure: Graphic3d_Structure *
	:param theWithDestruction:
	:type theWithDestruction: bool
	:rtype: void") Clear;
		virtual void Clear (Graphic3d_Structure * theStructure,const Standard_Boolean theWithDestruction);

		/****************** Connect ******************/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "* Connects the structures.
	:param theMother:
	:type theMother: Graphic3d_Structure *
	:param theDaughter:
	:type theDaughter: Graphic3d_Structure *
	:rtype: void") Connect;
		virtual void Connect (const Graphic3d_Structure * theMother,const Graphic3d_Structure * theDaughter);

		/****************** DefinedViews ******************/
		%feature("compactdefaultargs") DefinedViews;
		%feature("autodoc", "* Returns the group of views defined in the structure manager.
	:rtype: Graphic3d_IndexedMapOfView") DefinedViews;
		const Graphic3d_IndexedMapOfView & DefinedViews ();

		/****************** Disconnect ******************/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "* Disconnects the structures.
	:param theMother:
	:type theMother: Graphic3d_Structure *
	:param theDaughter:
	:type theDaughter: Graphic3d_Structure *
	:rtype: void") Disconnect;
		virtual void Disconnect (const Graphic3d_Structure * theMother,const Graphic3d_Structure * theDaughter);

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "* Display the structure.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:rtype: void") Display;
		virtual void Display (const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** DisplayedStructures ******************/
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "* Returns the set of structures displayed in visualiser <self>.
	:param SG:
	:type SG: Graphic3d_MapOfStructure
	:rtype: None") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & SG);

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* Erases all the structures.
	:rtype: void") Erase;
		virtual void Erase ();

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* Erases the structure.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:rtype: void") Erase;
		virtual void Erase (const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** Graphic3d_StructureManager ******************/
		%feature("compactdefaultargs") Graphic3d_StructureManager;
		%feature("autodoc", "* Initializes the ViewManager. Currently creating of more than 100 viewer instances is not supported and leads to InitializationError and initialization failure. This limitation might be addressed in some future OCCT releases. Warning: Raises InitialisationError if the initialization of the ViewManager failed.
	:param theDriver:
	:type theDriver: Graphic3d_GraphicDriver
	:rtype: None") Graphic3d_StructureManager;
		 Graphic3d_StructureManager (const opencascade::handle<Graphic3d_GraphicDriver> & theDriver);

		/****************** GraphicDriver ******************/
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "* Returns the graphic driver of <self>.
	:rtype: opencascade::handle<Graphic3d_GraphicDriver>") GraphicDriver;
		const opencascade::handle<Graphic3d_GraphicDriver> & GraphicDriver ();

		/****************** Highlight ******************/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "* Highlights the structure.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:rtype: void") Highlight;
		virtual void Highlight (const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** HighlightedStructures ******************/
		%feature("compactdefaultargs") HighlightedStructures;
		%feature("autodoc", "* Returns the set of highlighted structures in a visualiser <self>.
	:param SG:
	:type SG: Graphic3d_MapOfStructure
	:rtype: None") HighlightedStructures;
		void HighlightedStructures (Graphic3d_MapOfStructure & SG);

		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "* Attaches the view to this structure manager and sets its identification number within the manager.
	:param theView:
	:type theView: Graphic3d_CView *
	:rtype: int") Identification;
		Standard_Integer Identification (Graphic3d_CView * theView);

		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "* Returns the structure with the identification number <AId>.
	:param AId:
	:type AId: int
	:rtype: opencascade::handle<Graphic3d_Structure>") Identification;
		virtual opencascade::handle<Graphic3d_Structure> Identification (const Standard_Integer AId);

		/****************** IsDeviceLost ******************/
		%feature("compactdefaultargs") IsDeviceLost;
		%feature("autodoc", "* Returns True if Device Lost flag has been set and presentation data should be reuploaded onto graphics driver.
	:rtype: bool") IsDeviceLost;
		Standard_Boolean IsDeviceLost ();

		/****************** MaxNumOfViews ******************/
		%feature("compactdefaultargs") MaxNumOfViews;
		%feature("autodoc", "* Returns the theoretical maximum number of definable views in the manager. Warning: It's not possible to accept an infinite number of definable views because each view must have an identification and we have different managers.
	:rtype: int") MaxNumOfViews;
		Standard_Integer MaxNumOfViews ();

		/****************** ObjectAffinity ******************/
		%feature("compactdefaultargs") ObjectAffinity;
		%feature("autodoc", ":param theObject:
	:type theObject: Standard_Transient
	:rtype: opencascade::handle<Graphic3d_ViewAffinity>") ObjectAffinity;
		opencascade::handle<Graphic3d_ViewAffinity> ObjectAffinity (const opencascade::handle<Standard_Transient> & theObject);

		/****************** ReCompute ******************/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "* Forces a new construction of the structure. if <theStructure> is displayed and TOS_COMPUTED.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:rtype: void") ReCompute;
		virtual void ReCompute (const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** ReCompute ******************/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "* Forces a new construction of the structure. if <theStructure> is displayed in <theProjector> and TOS_COMPUTED.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:param theProjector:
	:type theProjector: Graphic3d_DataStructureManager
	:rtype: void") ReCompute;
		virtual void ReCompute (const opencascade::handle<Graphic3d_Structure> & theStructure,const opencascade::handle<Graphic3d_DataStructureManager> & theProjector);

		/****************** RecomputeStructures ******************/
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "* Recomputes all structures in the manager. Resets Device Lost flag.
	:rtype: None") RecomputeStructures;
		void RecomputeStructures ();

		/****************** RecomputeStructures ******************/
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "* Recomputes all structures from theStructures.
	:param theStructures:
	:type theStructures: NCollection_Map<Graphic3d_Structure *>
	:rtype: None") RecomputeStructures;
		void RecomputeStructures (const NCollection_Map<Graphic3d_Structure *> & theStructures);

		/****************** RegisterObject ******************/
		%feature("compactdefaultargs") RegisterObject;
		%feature("autodoc", ":param theObject:
	:type theObject: Standard_Transient
	:rtype: opencascade::handle<Graphic3d_ViewAffinity>") RegisterObject;
		opencascade::handle<Graphic3d_ViewAffinity> RegisterObject (const opencascade::handle<Standard_Transient> & theObject);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Deletes and erases the 3D structure manager.
	:rtype: void") Remove;
		virtual void Remove ();

		/****************** SetDeviceLost ******************/
		%feature("compactdefaultargs") SetDeviceLost;
		%feature("autodoc", "* Sets Device Lost flag.
	:rtype: None") SetDeviceLost;
		void SetDeviceLost ();

		/****************** SetTransform ******************/
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "* Transforms the structure.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: void") SetTransform;
		virtual void SetTransform (const opencascade::handle<Graphic3d_Structure> & theStructure,const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** UnHighlight ******************/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "* Suppress the highlighting on the structure <AStructure>.
	:param AStructure:
	:type AStructure: Graphic3d_Structure
	:rtype: void") UnHighlight;
		virtual void UnHighlight (const opencascade::handle<Graphic3d_Structure> & AStructure);

		/****************** UnHighlight ******************/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "* Suppresses the highlighting on all the structures in <self>.
	:rtype: void") UnHighlight;
		virtual void UnHighlight ();

		/****************** UnIdentification ******************/
		%feature("compactdefaultargs") UnIdentification;
		%feature("autodoc", "* Detach the view from this structure manager and release its identification.
	:param theView:
	:type theView: Graphic3d_CView *
	:rtype: None") UnIdentification;
		void UnIdentification (Graphic3d_CView * theView);

		/****************** UnregisterObject ******************/
		%feature("compactdefaultargs") UnregisterObject;
		%feature("autodoc", ":param theObject:
	:type theObject: Standard_Transient
	:rtype: None") UnregisterObject;
		void UnregisterObject (const opencascade::handle<Standard_Transient> & theObject);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Invalidates bounding box of specified ZLayerId.
	:param theLayerId: default value is Graphic3d_ZLayerId_UNKNOWN
	:type theLayerId: int
	:rtype: void") Update;
		virtual void Update (int theLayerId = Graphic3d_ZLayerId_UNKNOWN);

};


%make_alias(Graphic3d_StructureManager)

%extend Graphic3d_StructureManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Graphic3d_Text *
***********************/
class Graphic3d_Text : public Standard_Transient {
	public:
		/****************** Graphic3d_Text ******************/
		%feature("compactdefaultargs") Graphic3d_Text;
		%feature("autodoc", "* Creates default text parameters.
	:param theHeight:
	:type theHeight: Standard_ShortReal
	:rtype: None") Graphic3d_Text;
		 Graphic3d_Text (const Standard_ShortReal theHeight);

		/****************** HasOwnAnchorPoint ******************/
		%feature("compactdefaultargs") HasOwnAnchorPoint;
		%feature("autodoc", "* Returns true if the text has an anchor point
	:rtype: bool") HasOwnAnchorPoint;
		Standard_Boolean HasOwnAnchorPoint ();

		/****************** HasPlane ******************/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "* Returns true if the text is filled by a point
	:rtype: bool") HasPlane;
		Standard_Boolean HasPlane ();

		/****************** Height ******************/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "* Sets height of text. (Relative to the Normalized Projection Coordinates (NPC) Space).
	:rtype: Standard_ShortReal") Height;
		Standard_ShortReal Height ();

		/****************** HorizontalAlignment ******************/
		%feature("compactdefaultargs") HorizontalAlignment;
		%feature("autodoc", "* Returns horizontal alignment of text.
	:rtype: Graphic3d_HorizontalTextAlignment") HorizontalAlignment;
		Graphic3d_HorizontalTextAlignment HorizontalAlignment ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns text orientation in 3D space.
	:rtype: gp_Ax2") Orientation;
		const gp_Ax2  Orientation ();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* The 3D point of attachment is projected. If the orientation is defined, the text is written in the plane of projection.
	:rtype: gp_Pnt") Position;
		const gp_Pnt  Position ();

		/****************** ResetOrientation ******************/
		%feature("compactdefaultargs") ResetOrientation;
		%feature("autodoc", "* Reset text orientation in 3D space.
	:rtype: None") ResetOrientation;
		void ResetOrientation ();

		/****************** SetHeight ******************/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "* Returns height of text
	:param theHeight:
	:type theHeight: Standard_ShortReal
	:rtype: None") SetHeight;
		void SetHeight (const Standard_ShortReal theHeight);

		/****************** SetHorizontalAlignment ******************/
		%feature("compactdefaultargs") SetHorizontalAlignment;
		%feature("autodoc", "* Sets horizontal alignment of text.
	:param theJustification:
	:type theJustification: Graphic3d_HorizontalTextAlignment
	:rtype: None") SetHorizontalAlignment;
		void SetHorizontalAlignment (const Graphic3d_HorizontalTextAlignment theJustification);

		/****************** SetOrientation ******************/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "* Sets text orientation in 3D space.
	:param theOrientation:
	:type theOrientation: gp_Ax2
	:rtype: None") SetOrientation;
		void SetOrientation (const gp_Ax2 & theOrientation);

		/****************** SetOwnAnchorPoint ******************/
		%feature("compactdefaultargs") SetOwnAnchorPoint;
		%feature("autodoc", "* Returns true if the text has an anchor point
	:param theHasOwnAnchor:
	:type theHasOwnAnchor: bool
	:rtype: None") SetOwnAnchorPoint;
		void SetOwnAnchorPoint (const Standard_Boolean theHasOwnAnchor);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Sets text point.
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None") SetPosition;
		void SetPosition (const gp_Pnt & thePoint);

		/****************** SetText ******************/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "* Sets text value.
	:param theText:
	:type theText: NCollection_String
	:rtype: None") SetText;
		void SetText (const NCollection_String & theText);

		/****************** SetText ******************/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "* Sets text value.
	:param theText:
	:type theText: TCollection_AsciiString
	:rtype: None") SetText;
		void SetText (const TCollection_AsciiString & theText);

		/****************** SetText ******************/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "* Sets text value.
	:param theText:
	:type theText: char *
	:rtype: None") SetText;
		void SetText (const char * theText);

		/****************** SetVerticalAlignment ******************/
		%feature("compactdefaultargs") SetVerticalAlignment;
		%feature("autodoc", "* Sets vertical alignment of text.
	:param theJustification:
	:type theJustification: Graphic3d_VerticalTextAlignment
	:rtype: None") SetVerticalAlignment;
		void SetVerticalAlignment (const Graphic3d_VerticalTextAlignment theJustification);

		/****************** Text ******************/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "* Returns text value.
	:rtype: NCollection_String") Text;
		const NCollection_String & Text ();

		/****************** VerticalAlignment ******************/
		%feature("compactdefaultargs") VerticalAlignment;
		%feature("autodoc", "* Returns vertical alignment of text.
	:rtype: Graphic3d_VerticalTextAlignment") VerticalAlignment;
		Graphic3d_VerticalTextAlignment VerticalAlignment ();

};


%make_alias(Graphic3d_Text)

%extend Graphic3d_Text {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Graphic3d_TextureParams *
********************************/
class Graphic3d_TextureParams : public Standard_Transient {
	public:
		/****************** AnisoFilter ******************/
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.
	:rtype: Graphic3d_LevelOfTextureAnisotropy") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "* returns texture interpolation filter. Default value is Graphic3d_TOTF_NEAREST.
	:rtype: Graphic3d_TypeOfTextureFilter") Filter;
		Graphic3d_TypeOfTextureFilter Filter ();

		/****************** GenMode ******************/
		%feature("compactdefaultargs") GenMode;
		%feature("autodoc", "* returns texture coordinates generation mode. Default value is Graphic3d_TOTM_MANUAL.
	:rtype: Graphic3d_TypeOfTextureMode") GenMode;
		Graphic3d_TypeOfTextureMode GenMode ();

		/****************** GenPlaneS ******************/
		%feature("compactdefaultargs") GenPlaneS;
		%feature("autodoc", "* returns texture coordinates generation plane S.
	:rtype: Graphic3d_Vec4") GenPlaneS;
		const Graphic3d_Vec4 & GenPlaneS ();

		/****************** GenPlaneT ******************/
		%feature("compactdefaultargs") GenPlaneT;
		%feature("autodoc", "* returns texture coordinates generation plane T.
	:rtype: Graphic3d_Vec4") GenPlaneT;
		const Graphic3d_Vec4 & GenPlaneT ();

		/****************** Graphic3d_TextureParams ******************/
		%feature("compactdefaultargs") Graphic3d_TextureParams;
		%feature("autodoc", "* Default constructor.
	:rtype: None") Graphic3d_TextureParams;
		 Graphic3d_TextureParams ();

		/****************** IsModulate ******************/
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "* returns True if the texture is modulate. Default value is False.
	:rtype: bool") IsModulate;
		Standard_Boolean IsModulate ();

		/****************** IsRepeat ******************/
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "* returns True if the texture repeat is enabled. Default value is False.
	:rtype: bool") IsRepeat;
		Standard_Boolean IsRepeat ();

		/****************** Rotation ******************/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "* returns rotation angle in degrees Default value is 0.
	:rtype: Standard_ShortReal") Rotation;
		Standard_ShortReal Rotation ();

		/****************** SamplerRevision ******************/
		%feature("compactdefaultargs") SamplerRevision;
		%feature("autodoc", "* Return modification counter of parameters related to sampler state.
	:rtype: unsigned int") SamplerRevision;
		unsigned int SamplerRevision ();

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "* returns scale factor Default value is no scaling (1.0; 1.0).
	:rtype: Graphic3d_Vec2") Scale;
		const Graphic3d_Vec2 & Scale ();

		/****************** SetAnisoFilter ******************/
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "* @param theLevel level of anisontropy texture filter.
	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);

		/****************** SetFilter ******************/
		%feature("compactdefaultargs") SetFilter;
		%feature("autodoc", "* @param theFilter texture interpolation filter.
	:param theFilter:
	:type theFilter: Graphic3d_TypeOfTextureFilter
	:rtype: None") SetFilter;
		void SetFilter (const Graphic3d_TypeOfTextureFilter theFilter);

		/****************** SetGenMode ******************/
		%feature("compactdefaultargs") SetGenMode;
		%feature("autodoc", "* Setup texture coordinates generation mode.
	:param theMode:
	:type theMode: Graphic3d_TypeOfTextureMode
	:param thePlaneS:
	:type thePlaneS: Graphic3d_Vec4
	:param thePlaneT:
	:type thePlaneT: Graphic3d_Vec4
	:rtype: None") SetGenMode;
		void SetGenMode (const Graphic3d_TypeOfTextureMode theMode,const Graphic3d_Vec4 thePlaneS,const Graphic3d_Vec4 thePlaneT);

		/****************** SetModulate ******************/
		%feature("compactdefaultargs") SetModulate;
		%feature("autodoc", "* @param theToModulate turn modulation on/off.
	:param theToModulate:
	:type theToModulate: bool
	:rtype: None") SetModulate;
		void SetModulate (const Standard_Boolean theToModulate);

		/****************** SetRepeat ******************/
		%feature("compactdefaultargs") SetRepeat;
		%feature("autodoc", "* @param theToRepeat turn texture repeat mode ON or OFF (clamping).
	:param theToRepeat:
	:type theToRepeat: bool
	:rtype: None") SetRepeat;
		void SetRepeat (const Standard_Boolean theToRepeat);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* @param theAngleDegrees rotation angle.
	:param theAngleDegrees:
	:type theAngleDegrees: Standard_ShortReal
	:rtype: None") SetRotation;
		void SetRotation (const Standard_ShortReal theAngleDegrees);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* @param theScale scale factor.
	:param theScale:
	:type theScale: Graphic3d_Vec2
	:rtype: None") SetScale;
		void SetScale (const Graphic3d_Vec2 theScale);

		/****************** SetTextureUnit ******************/
		%feature("compactdefaultargs") SetTextureUnit;
		%feature("autodoc", "* Setup default texture unit.
	:param theUnit:
	:type theUnit: Graphic3d_TextureUnit
	:rtype: None") SetTextureUnit;
		void SetTextureUnit (Graphic3d_TextureUnit theUnit);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "* @param theVec translation vector.
	:param theVec:
	:type theVec: Graphic3d_Vec2
	:rtype: None") SetTranslation;
		void SetTranslation (const Graphic3d_Vec2 theVec);

		/****************** TextureUnit ******************/
		%feature("compactdefaultargs") TextureUnit;
		%feature("autodoc", "* Default texture unit to be used, default is Graphic3d_TextureUnit_BaseColor.
	:rtype: Graphic3d_TextureUnit") TextureUnit;
		Graphic3d_TextureUnit TextureUnit ();

		/****************** Translation ******************/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "* returns translation vector Default value is no translation (0.0; 0.0).
	:rtype: Graphic3d_Vec2") Translation;
		const Graphic3d_Vec2 & Translation ();

};


%make_alias(Graphic3d_TextureParams)

%extend Graphic3d_TextureParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Graphic3d_TextureRoot *
******************************/
%nodefaultctor Graphic3d_TextureRoot;
class Graphic3d_TextureRoot : public Standard_Transient {
	public:
		/****************** GetId ******************/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "* This ID will be used to manage resource in graphic driver. //! Default implementation generates unique ID within constructor; inheritors may re-initialize it within their constructor, but should never modify it afterwards. //! Multiple Graphic3d_TextureRoot instances with same ID will be treated as single texture with different parameters to optimize memory usage though this will be more natural to use same instance of Graphic3d_TextureRoot when possible. //! If this ID is set to empty string by inheritor, then independent graphical resource will be created for each instance of Graphic3d_AspectFillArea3d where texture will be used. //! returns texture identifier.
	:rtype: TCollection_AsciiString") GetId;
		const TCollection_AsciiString & GetId ();

		/****************** GetImage ******************/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "* This method will be called by graphic driver each time when texture resource should be created. Default constructors allow defining the texture source as path to texture image or directly as pixmap. If the source is defined as path, then the image will be dynamically loaded when this method is called (and no copy will be preserved in this class instance). Inheritors may dynamically generate the image. Notice, image data should be in Bottom-Up order (see Image_PixMap::IsTopDown())! returns the image for texture.
	:rtype: opencascade::handle<Image_PixMap>") GetImage;
		virtual opencascade::handle<Image_PixMap> GetImage ();

		/****************** GetParams ******************/
		%feature("compactdefaultargs") GetParams;
		%feature("autodoc", "* returns low-level texture parameters
	:rtype: opencascade::handle<Graphic3d_TextureParams>") GetParams;
		const opencascade::handle<Graphic3d_TextureParams> & GetParams ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Checks if a texture class is valid or not. returns true if the construction of the class is correct
	:rtype: bool") IsDone;
		virtual Standard_Boolean IsDone ();

		/****************** Path ******************/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "* Returns the full path of the defined texture. It could be empty path if GetImage() is overridden to load image not from file.
	:rtype: OSD_Path") Path;
		const OSD_Path & Path ();

		/****************** Revision ******************/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "* Return image revision.
	:rtype: Standard_Size") Revision;
		Standard_Size Revision ();

		/****************** TexturesFolder ******************/
		%feature("compactdefaultargs") TexturesFolder;
		%feature("autodoc", "* The path to textures determined from CSF_MDTVTexturesDirectory or CASROOT environment variables. returns the root folder with default textures.
	:rtype: TCollection_AsciiString") TexturesFolder;
		static TCollection_AsciiString TexturesFolder ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* returns the texture type.
	:rtype: Graphic3d_TypeOfTexture") Type;
		Graphic3d_TypeOfTexture Type ();

		/****************** UpdateRevision ******************/
		%feature("compactdefaultargs") UpdateRevision;
		%feature("autodoc", "* Update image revision. Can be used for signaling changes in the texture source (e.g. file update, pixmap update) without re-creating texture source itself (since unique id should be never modified).
	:rtype: None") UpdateRevision;
		void UpdateRevision ();

};


%make_alias(Graphic3d_TextureRoot)

%extend Graphic3d_TextureRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Graphic3d_TextureSet *
*****************************/
/********************************
* class Graphic3d_TransformPers *
********************************/
/*************************************
* class Graphic3d_UniformValueTypeID *
*************************************/
/*****************************************************
* class Graphic3d_UniformValueTypeID<Graphic3d_Vec2> *
*****************************************************/
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec2> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> *
******************************************************/
class Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec2i> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class Graphic3d_UniformValueTypeID<Graphic3d_Vec3> *
*****************************************************/
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec3> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> *
******************************************************/
class Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec3i> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class Graphic3d_UniformValueTypeID<Graphic3d_Vec4> *
*****************************************************/
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec4> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************
* class Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> *
******************************************************/
class Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Graphic3d_Vec4i> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************
* class Graphic3d_UniformValueTypeID<Standard_Integer> *
*******************************************************/
class Graphic3d_UniformValueTypeID<Standard_Integer> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Standard_Integer> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class Graphic3d_UniformValueTypeID<Standard_ShortReal> *
*********************************************************/
class Graphic3d_UniformValueTypeID<Standard_ShortReal> {
	public:
};


%extend Graphic3d_UniformValueTypeID<Standard_ShortReal> {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class Graphic3d_ValidatedCubeMapOrder *
****************************************/
%nodefaultctor Graphic3d_ValidatedCubeMapOrder;
class Graphic3d_ValidatedCubeMapOrder {
	public:
		/****************** operator -> ******************/
		%feature("compactdefaultargs") operator ->;
		%feature("autodoc", "* Allows skip access to 'Order' field and work directly.
	:rtype: Graphic3d_CubeMapOrder *") operator ->;
		const Graphic3d_CubeMapOrder * operator -> ();

};


%extend Graphic3d_ValidatedCubeMapOrder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Graphic3d_ValueInterface *
*********************************/
%nodefaultctor Graphic3d_ValueInterface;
class Graphic3d_ValueInterface {
	public:
		/****************** TypeID ******************/
		%feature("compactdefaultargs") TypeID;
		%feature("autodoc", "* Returns unique identifier of value type.
	:rtype: Standard_Size") TypeID;
		Standard_Size TypeID ();

};


%extend Graphic3d_ValueInterface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Graphic3d_Vertex *
*************************/
class Graphic3d_Vertex {
	public:
		float xyz[3];
		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns the coordinates.
	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: None") Coord;
		void Coord (Standard_ShortReal & theX,Standard_ShortReal & theY,Standard_ShortReal & theZ);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "* Returns the coordinates.
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None") Coord;
		void Coord (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "* Returns the distance between two points.
	:param theOther:
	:type theOther: Graphic3d_Vertex
	:rtype: Standard_ShortReal") Distance;
		Standard_ShortReal Distance (const Graphic3d_Vertex & theOther);

		/****************** Graphic3d_Vertex ******************/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "* Creates a point with 0.0, 0.0, 0.0 coordinates.
	:rtype: None") Graphic3d_Vertex;
		 Graphic3d_Vertex ();

		/****************** Graphic3d_Vertex ******************/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "* Creates a point with coordinates identical to thePoint.
	:param thePoint:
	:type thePoint: Graphic3d_Vertex
	:rtype: None") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Graphic3d_Vertex & thePoint);

		/****************** Graphic3d_Vertex ******************/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "* Creates a point with theX, theY and theZ coordinates.
	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: None") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);

		/****************** Graphic3d_Vertex ******************/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "* Creates a point with theX, theY and theZ coordinates.
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None") Graphic3d_Vertex;
		 Graphic3d_Vertex (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* Modifies the coordinates.
	:param theX:
	:type theX: Standard_ShortReal
	:param theY:
	:type theY: Standard_ShortReal
	:param theZ:
	:type theZ: Standard_ShortReal
	:rtype: None") SetCoord;
		void SetCoord (const Standard_ShortReal theX,const Standard_ShortReal theY,const Standard_ShortReal theZ);

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "* Modifies the coordinates.
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None") SetCoord;
		void SetCoord (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "* Returns the X coordinates.
	:rtype: Standard_ShortReal") X;
		Standard_ShortReal X ();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "* Returns the Y coordinate.
	:rtype: Standard_ShortReal") Y;
		Standard_ShortReal Y ();

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "* Returns the Z coordinate.
	:rtype: Standard_ShortReal") Z;
		Standard_ShortReal Z ();

};


%extend Graphic3d_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_ViewAffinity *
*******************************/
class Graphic3d_ViewAffinity : public Standard_Transient {
	public:
		/****************** Graphic3d_ViewAffinity ******************/
		%feature("compactdefaultargs") Graphic3d_ViewAffinity;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_ViewAffinity;
		 Graphic3d_ViewAffinity ();

		/****************** IsVisible ******************/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "* Return visibility flag.
	:param theViewId:
	:type theViewId: int
	:rtype: bool") IsVisible;
		bool IsVisible (const Standard_Integer theViewId);

		/****************** SetVisible ******************/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "* Setup visibility flag for all views.
	:param theIsVisible:
	:type theIsVisible: bool
	:rtype: None") SetVisible;
		void SetVisible (const Standard_Boolean theIsVisible);

		/****************** SetVisible ******************/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "* Setup visibility flag.
	:param theViewId:
	:type theViewId: int
	:param theIsVisible:
	:type theIsVisible: bool
	:rtype: None") SetVisible;
		void SetVisible (const Standard_Integer theViewId,const bool theIsVisible);

};


%make_alias(Graphic3d_ViewAffinity)

%extend Graphic3d_ViewAffinity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Graphic3d_WorldViewProjState *
*************************************/
class Graphic3d_WorldViewProjState {
	public:
		/****************** Graphic3d_WorldViewProjState ******************/
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "* Default constructor.
	:rtype: None") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState ();

		/****************** Graphic3d_WorldViewProjState ******************/
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "* Constructor for custom projector type. @param theProjectionState [in] the projection state. @param theWorldViewState [in] the world view state. @param theCamera [in] the pointer to the class supplying projection and  world view matrices (camera).
	:param theProjectionState:
	:type theProjectionState: Standard_Size
	:param theWorldViewState:
	:type theWorldViewState: Standard_Size
	:param theCamera: default value is NULL
	:type theCamera: Standard_Transient *
	:rtype: None") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState (const Standard_Size theProjectionState,const Standard_Size theWorldViewState,const Standard_Transient * theCamera = NULL);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize world view projection state.
	:param theProjectionState:
	:type theProjectionState: Standard_Size
	:param theWorldViewState:
	:type theWorldViewState: Standard_Size
	:param theCamera: default value is NULL
	:type theCamera: Standard_Transient *
	:rtype: None") Initialize;
		void Initialize (const Standard_Size theProjectionState,const Standard_Size theWorldViewState,const Standard_Transient * theCamera = NULL);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize world view projection state.
	:param theCamera: default value is NULL
	:type theCamera: Standard_Transient *
	:rtype: None") Initialize;
		void Initialize (const Standard_Transient * theCamera = NULL);

		/****************** IsChanged ******************/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "* Compare with other world view projection state. returns true when the projection of the given camera state differs from this one.
	:param theState:
	:type theState: Graphic3d_WorldViewProjState
	:rtype: bool") IsChanged;
		Standard_Boolean IsChanged (const Graphic3d_WorldViewProjState & theState);

		/****************** IsProjectionChanged ******************/
		%feature("compactdefaultargs") IsProjectionChanged;
		%feature("autodoc", "* Compare projection with other state. returns true when the projection of the given camera state differs from this one.
	:param theState:
	:type theState: Graphic3d_WorldViewProjState
	:rtype: bool") IsProjectionChanged;
		Standard_Boolean IsProjectionChanged (const Graphic3d_WorldViewProjState & theState);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Check state validity. returns true if state is set.
	:rtype: bool") IsValid;
		Standard_Boolean IsValid ();

		/****************** IsWorldViewChanged ******************/
		%feature("compactdefaultargs") IsWorldViewChanged;
		%feature("autodoc", "* Compare world view transformation with other state. returns true when the orientation of the given camera state differs from this one.
	:param theState:
	:type theState: Graphic3d_WorldViewProjState
	:rtype: bool") IsWorldViewChanged;
		Standard_Boolean IsWorldViewChanged (const Graphic3d_WorldViewProjState & theState);

		/****************** ProjectionState ******************/
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "* returns projection state counter.
	:rtype: Standard_Size") ProjectionState;
		Standard_Size & ProjectionState ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Invalidate world view projection state.
	:rtype: None") Reset;
		void Reset ();

		/****************** WorldViewState ******************/
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "* returns world view state counter.
	:rtype: Standard_Size") WorldViewState;
		Standard_Size & WorldViewState ();

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "* Copy world view projection state.
	:param theOther:
	:type theOther: Graphic3d_WorldViewProjState
	:rtype: None") operator =;
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

/*********************************
* class Graphic3d_ZLayerSettings *
*********************************/
class Graphic3d_ZLayerSettings {
	public:
		/****************** ChangePolygonOffset ******************/
		%feature("compactdefaultargs") ChangePolygonOffset;
		%feature("autodoc", "* Modify glPolygonOffset() arguments.
	:rtype: Graphic3d_PolygonOffset") ChangePolygonOffset;
		Graphic3d_PolygonOffset & ChangePolygonOffset ();

		/****************** CullingDistance ******************/
		%feature("compactdefaultargs") CullingDistance;
		%feature("autodoc", "* Return the distance to discard drawing of distant objects (distance from camera Eye point); by default it is Infinite (distance culling is disabled). Since camera eye definition has no strong meaning within orthographic projection, option is considered only within perspective projection. Note also that this option has effect only when frustum culling is enabled.
	:rtype: float") CullingDistance;
		Standard_Real CullingDistance ();

		/****************** CullingSize ******************/
		%feature("compactdefaultargs") CullingSize;
		%feature("autodoc", "* Return the size to discard drawing of small objects; by default it is Infinite (size culling is disabled). Current implementation checks the length of projected diagonal of bounding box in pixels for discarding. Note that this option has effect only when frustum culling is enabled.
	:rtype: float") CullingSize;
		Standard_Real CullingSize ();

		/****************** DisableSetting ******************/
		%feature("compactdefaultargs") DisableSetting;
		%feature("autodoc", "* Disables theSetting
	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None") DisableSetting;
		void DisableSetting (const Graphic3d_ZLayerSetting theSetting);

		/****************** EnableSetting ******************/
		%feature("compactdefaultargs") EnableSetting;
		%feature("autodoc", "* Enables theSetting
	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: None") EnableSetting;
		void EnableSetting (const Graphic3d_ZLayerSetting theSetting);

		/****************** Graphic3d_ZLayerSettings ******************/
		%feature("compactdefaultargs") Graphic3d_ZLayerSettings;
		%feature("autodoc", "* Default settings.
	:rtype: None") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings ();

		/****************** HasCullingDistance ******************/
		%feature("compactdefaultargs") HasCullingDistance;
		%feature("autodoc", "* Return True, if culling of distant objects (distance culling) should be performed; False by default. @sa CullingDistance()
	:rtype: bool") HasCullingDistance;
		Standard_Boolean HasCullingDistance ();

		/****************** HasCullingSize ******************/
		%feature("compactdefaultargs") HasCullingSize;
		%feature("autodoc", "* Return True, if culling of small objects (size culling) should be performed; False by default. @sa CullingSize()
	:rtype: bool") HasCullingSize;
		Standard_Boolean HasCullingSize ();

		/****************** IsImmediate ******************/
		%feature("compactdefaultargs") IsImmediate;
		%feature("autodoc", "* Return true if this layer should be drawn after all normal (non-immediate) layers.
	:rtype: bool") IsImmediate;
		Standard_Boolean IsImmediate ();

		/****************** IsRaytracable ******************/
		%feature("compactdefaultargs") IsRaytracable;
		%feature("autodoc", "* Returns True if layer should be processed by ray-tracing renderer; True by default. Note that this flag is IGNORED for layers with IsImmediate() flag.
	:rtype: bool") IsRaytracable;
		Standard_Boolean IsRaytracable ();

		/****************** IsSettingEnabled ******************/
		%feature("compactdefaultargs") IsSettingEnabled;
		%feature("autodoc", "* Returns true if theSetting is enabled.
	:param theSetting:
	:type theSetting: Graphic3d_ZLayerSetting
	:rtype: bool") IsSettingEnabled;
		Standard_Boolean IsSettingEnabled (const Graphic3d_ZLayerSetting theSetting);

		/****************** Lights ******************/
		%feature("compactdefaultargs") Lights;
		%feature("autodoc", "* Return lights list to be used for rendering presentations within this Z-Layer; NULL by default. NULL list (but not empty list!) means that default lights assigned to the View should be used instead of per-layer lights.
	:rtype: opencascade::handle<Graphic3d_LightSet>") Lights;
		const opencascade::handle<Graphic3d_LightSet> & Lights ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Return user-provided name.
	:rtype: TCollection_AsciiString") Name;
		const TCollection_AsciiString & Name ();

		/****************** Origin ******************/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "* Return the origin of all objects within the layer.
	:rtype: gp_XYZ") Origin;
		const gp_XYZ  Origin ();

		/****************** OriginTransformation ******************/
		%feature("compactdefaultargs") OriginTransformation;
		%feature("autodoc", "* Return the transformation to the origin.
	:rtype: opencascade::handle<Geom_Transformation>") OriginTransformation;
		const opencascade::handle<Geom_Transformation> & OriginTransformation ();

		/****************** PolygonOffset ******************/
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "* Return glPolygonOffset() arguments.
	:rtype: Graphic3d_PolygonOffset") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset ();

		/****************** SetClearDepth ******************/
		%feature("compactdefaultargs") SetClearDepth;
		%feature("autodoc", "* Set if depth values should be cleared before drawing the layer.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetClearDepth;
		void SetClearDepth (const Standard_Boolean theValue);

		/****************** SetCullingDistance ******************/
		%feature("compactdefaultargs") SetCullingDistance;
		%feature("autodoc", "* Set the distance to discard drawing objects.
	:param theDistance:
	:type theDistance: float
	:rtype: None") SetCullingDistance;
		void SetCullingDistance (Standard_Real theDistance);

		/****************** SetCullingSize ******************/
		%feature("compactdefaultargs") SetCullingSize;
		%feature("autodoc", "* Set the distance to discard drawing objects.
	:param theSize:
	:type theSize: float
	:rtype: None") SetCullingSize;
		void SetCullingSize (Standard_Real theSize);

		/****************** SetDepthOffsetNegative ******************/
		%feature("compactdefaultargs") SetDepthOffsetNegative;
		%feature("autodoc", "* Sets minimal possible negative depth offset.
	:rtype: None") SetDepthOffsetNegative;
		void SetDepthOffsetNegative ();

		/****************** SetDepthOffsetPositive ******************/
		%feature("compactdefaultargs") SetDepthOffsetPositive;
		%feature("autodoc", "* Sets minimal possible positive depth offset.
	:rtype: None") SetDepthOffsetPositive;
		void SetDepthOffsetPositive ();

		/****************** SetEnableDepthTest ******************/
		%feature("compactdefaultargs") SetEnableDepthTest;
		%feature("autodoc", "* Set if depth test should be enabled.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetEnableDepthTest;
		void SetEnableDepthTest (const Standard_Boolean theValue);

		/****************** SetEnableDepthWrite ******************/
		%feature("compactdefaultargs") SetEnableDepthWrite;
		%feature("autodoc", "* Set if depth values should be written during rendering.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetEnableDepthWrite;
		void SetEnableDepthWrite (const Standard_Boolean theValue);

		/****************** SetEnvironmentTexture ******************/
		%feature("compactdefaultargs") SetEnvironmentTexture;
		%feature("autodoc", "* Set the flag to allow/prevent environment texture mapping usage for specific layer.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetEnvironmentTexture;
		void SetEnvironmentTexture (const Standard_Boolean theValue);

		/****************** SetImmediate ******************/
		%feature("compactdefaultargs") SetImmediate;
		%feature("autodoc", "* Set the flag indicating the immediate layer, which should be drawn after all normal (non-immediate) layers.
	:param theValue:
	:type theValue: bool
	:rtype: None") SetImmediate;
		void SetImmediate (const Standard_Boolean theValue);

		/****************** SetLights ******************/
		%feature("compactdefaultargs") SetLights;
		%feature("autodoc", "* Assign lights list to be used.
	:param theLights:
	:type theLights: Graphic3d_LightSet
	:rtype: None") SetLights;
		void SetLights (const opencascade::handle<Graphic3d_LightSet> & theLights);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Set custom name.
	:param theName:
	:type theName: TCollection_AsciiString
	:rtype: None") SetName;
		void SetName (const TCollection_AsciiString & theName);

		/****************** SetOrigin ******************/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "* Set the origin of all objects within the layer.
	:param theOrigin:
	:type theOrigin: gp_XYZ
	:rtype: None") SetOrigin;
		void SetOrigin (const gp_XYZ & theOrigin);

		/****************** SetPolygonOffset ******************/
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "* Setup glPolygonOffset() arguments.
	:param theParams:
	:type theParams: Graphic3d_PolygonOffset
	:rtype: None") SetPolygonOffset;
		void SetPolygonOffset (const Graphic3d_PolygonOffset & theParams);

		/****************** SetRaytracable ******************/
		%feature("compactdefaultargs") SetRaytracable;
		%feature("autodoc", "* Sets if layer should be processed by ray-tracing renderer.
	:param theToRaytrace:
	:type theToRaytrace: bool
	:rtype: None") SetRaytracable;
		void SetRaytracable (Standard_Boolean theToRaytrace);

		/****************** SetRenderInDepthPrepass ******************/
		%feature("compactdefaultargs") SetRenderInDepthPrepass;
		%feature("autodoc", "* Set if layer should be rendered within depth pre-pass.
	:param theToRender:
	:type theToRender: bool
	:rtype: None") SetRenderInDepthPrepass;
		void SetRenderInDepthPrepass (Standard_Boolean theToRender);

		/****************** ToClearDepth ******************/
		%feature("compactdefaultargs") ToClearDepth;
		%feature("autodoc", "* Return true if depth values should be cleared before drawing the layer.
	:rtype: bool") ToClearDepth;
		Standard_Boolean ToClearDepth ();

		/****************** ToEnableDepthTest ******************/
		%feature("compactdefaultargs") ToEnableDepthTest;
		%feature("autodoc", "* Return true if depth test should be enabled.
	:rtype: bool") ToEnableDepthTest;
		Standard_Boolean ToEnableDepthTest ();

		/****************** ToEnableDepthWrite ******************/
		%feature("compactdefaultargs") ToEnableDepthWrite;
		%feature("autodoc", "* Return true depth values should be written during rendering.
	:rtype: bool") ToEnableDepthWrite;
		Standard_Boolean ToEnableDepthWrite ();

		/****************** ToRenderInDepthPrepass ******************/
		%feature("compactdefaultargs") ToRenderInDepthPrepass;
		%feature("autodoc", "* Return True if layer should be rendered within depth pre-pass; True by default.
	:rtype: bool") ToRenderInDepthPrepass;
		Standard_Boolean ToRenderInDepthPrepass ();

		/****************** UseEnvironmentTexture ******************/
		%feature("compactdefaultargs") UseEnvironmentTexture;
		%feature("autodoc", "* Return flag to allow/prevent environment texture mapping usage for specific layer.
	:rtype: bool") UseEnvironmentTexture;
		Standard_Boolean UseEnvironmentTexture ();

};


%extend Graphic3d_ZLayerSettings {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class MatrixType *
*******************/
/**********************************
* class MatrixType<Standard_Real> *
**********************************/
/***************************************
* class MatrixType<Standard_ShortReal> *
***************************************/
/*******************
* class VectorType *
*******************/
/**********************************
* class VectorType<Standard_Real> *
**********************************/
/***************************************
* class VectorType<Standard_ShortReal> *
***************************************/
/********************************
* class Graphic3d_ArrayOfPoints *
********************************/
class Graphic3d_ArrayOfPoints : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfPoints ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "* Creates an array of points (Graphic3d_TOPA_POINTS). The array must be filled using the AddVertex(Point) method. @param theMaxVertexs maximum number of points @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints (Standard_Integer theMaxVertexs,int theArrayFlags);

		/****************** Graphic3d_ArrayOfPoints ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "* Creates an array of points (Graphic3d_TOPA_POINTS). The array must be filled using the AddVertex(Point) method. @param theMaxVertexs maximum number of points @param theHasVColors when True, AddVertex(Point,Color) should be used for specifying vertex color @param theHasVNormals when True, AddVertex(Point,Normal) should be used for specifying vertex normal
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasVNormals: default value is Standard_False
	:type theHasVNormals: bool
	:rtype: None") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints (Standard_Integer theMaxVertexs,Standard_Boolean theHasVColors = Standard_False,Standard_Boolean theHasVNormals = Standard_False);

};


%make_alias(Graphic3d_ArrayOfPoints)

%extend Graphic3d_ArrayOfPoints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Graphic3d_ArrayOfPolygons *
**********************************/
class Graphic3d_ArrayOfPolygons : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfPolygons ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "* Creates an array of polygons (Graphic3d_TOPA_POLYGONS), a polygon can be filled as: 1) Creating a single polygon defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfPolygons (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate polygons defined with a predefined number of bounds and the number of vertex per bound, i.e: @code myArray = Graphic3d_ArrayOfPolygons (7, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (3); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x7, y7, z7); @endcode 3) Creating a single indexed polygon defined with his vertex ans edges, i.e: @code myArray = Graphic3d_ArrayOfPolygons (4, 0, 6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (4); @endcode 4) Creating separate polygons defined with a predefined number of bounds and the number of edges per bound, i.e: @code myArray = Graphic3d_ArrayOfPolygons (6, 4, 14); myArray->AddBound (3); myArray->AddVertex (x1, y1, z1); myArray->AddVertex (x2, y2, z2); myArray->AddVertex (x3, y3, z3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddBound (3); myArray->AddVertex (x4, y4, z4); myArray->AddVertex (x5, y5, z5); myArray->AddVertex (x6, y6, z6); myArray->AddEdge (4); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (1); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (4); @endcode @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxBounds defines the maximum allowed bound number in the array @param theMaxEdges defines the maximum allowed edge number in the array @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxBounds:
	:type theMaxBounds: int
	:param theMaxEdges:
	:type theMaxEdges: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons (Standard_Integer theMaxVertexs,Standard_Integer theMaxBounds,Standard_Integer theMaxEdges,int theArrayFlags);

		/****************** Graphic3d_ArrayOfPolygons ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "* Creates an array of polygons (Graphic3d_TOPA_POLYGONS): @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxBounds defines the maximum allowed bound number in the array @param theMaxEdges defines the maximum allowed edge number in the array
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxBounds: default value is 0
	:type theMaxBounds: int
	:param theMaxEdges: default value is 0
	:type theMaxEdges: int
	:param theHasVNormals: default value is Standard_False
	:type theHasVNormals: bool
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasBColors: default value is Standard_False
	:type theHasBColors: bool
	:param theHasVTexels: default value is Standard_False
	:type theHasVTexels: bool
	:rtype: None") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons (const Standard_Integer theMaxVertexs,const Standard_Integer theMaxBounds = 0,const Standard_Integer theMaxEdges = 0,const Standard_Boolean theHasVNormals = Standard_False,const Standard_Boolean theHasVColors = Standard_False,const Standard_Boolean theHasBColors = Standard_False,const Standard_Boolean theHasVTexels = Standard_False);

};


%make_alias(Graphic3d_ArrayOfPolygons)

%extend Graphic3d_ArrayOfPolygons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Graphic3d_ArrayOfPolylines *
***********************************/
class Graphic3d_ArrayOfPolylines : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfPolylines ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "* Creates an array of polylines (Graphic3d_TOPA_POLYLINES), a polyline can be filled as: 1) Creating a single polyline defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfPolylines (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate polylines defined with a predefined number of bounds and the number of vertex per bound, i.e: @code myArray = Graphic3d_ArrayOfPolylines (7, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (3); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x7, y7, z7); @endcode 3) Creating a single indexed polyline defined with his vertex and edges, i.e: @code myArray = Graphic3d_ArrayOfPolylines (4, 0, 6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (4); @endcode 4) creating separate polylines defined with a predefined number of bounds and the number of edges per bound, i.e: @code myArray = Graphic3d_ArrayOfPolylines (6, 4, 14); myArray->AddBound (3); myArray->AddVertex (x1, y1, z1); myArray->AddVertex (x2, y2, z2); myArray->AddVertex (x3, y3, z3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddBound (3); myArray->AddVertex (x4, y4, z4); myArray->AddVertex (x5, y5, z5); myArray->AddVertex (x6, y6, z6); myArray->AddEdge (4); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (1); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (4); @endcode @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxBounds defines the maximum allowed bound number in the array @param theMaxEdges defines the maximum allowed edge number in the array @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxBounds:
	:type theMaxBounds: int
	:param theMaxEdges:
	:type theMaxEdges: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines (Standard_Integer theMaxVertexs,Standard_Integer theMaxBounds,Standard_Integer theMaxEdges,int theArrayFlags);

		/****************** Graphic3d_ArrayOfPolylines ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "* Creates an array of polylines (Graphic3d_TOPA_POLYLINES). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxBounds defines the maximum allowed bound number in the array @param theMaxEdges defines the maximum allowed edge number in the array @param theHasVColors when True AddVertex(Point,Color) or AddVertex(Point,Normal,Color) should be used to specify per-vertex color values @param theHasBColors when True AddBound(number,Color) should be used to specify sub-group color
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxBounds: default value is 0
	:type theMaxBounds: int
	:param theMaxEdges: default value is 0
	:type theMaxEdges: int
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasBColors: default value is Standard_False
	:type theHasBColors: bool
	:rtype: None") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines (Standard_Integer theMaxVertexs,Standard_Integer theMaxBounds = 0,Standard_Integer theMaxEdges = 0,Standard_Boolean theHasVColors = Standard_False,Standard_Boolean theHasBColors = Standard_False);

};


%make_alias(Graphic3d_ArrayOfPolylines)

%extend Graphic3d_ArrayOfPolylines {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class Graphic3d_ArrayOfQuadrangleStrips *
******************************************/
class Graphic3d_ArrayOfQuadrangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfQuadrangleStrips ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "* Creates an array of quadrangle strips (Graphic3d_TOPA_QUADRANGLESTRIPS), a polygon can be filled as: 1) Creating a single strip defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfQuadrangleStrips (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate strips defined with a predefined number of strips and the number of vertex per strip, i.e: @code myArray = Graphic3d_ArrayOfQuadrangleStrips (8, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (4); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x8, y8, z8); @endcode The number of quadrangle really drawn is: VertexNumber()/2 - Min(1, BoundNumber()). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxStrips defines the maximum allowed strip number in the array @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxStrips:
	:type theMaxStrips: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips (Standard_Integer theMaxVertexs,Standard_Integer theMaxStrips,int theArrayFlags);

		/****************** Graphic3d_ArrayOfQuadrangleStrips ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "* Creates an array of quadrangle strips (Graphic3d_TOPA_QUADRANGLESTRIPS). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxStrips defines the maximum allowed strip number in the array
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxStrips: default value is 0
	:type theMaxStrips: int
	:param theHasVNormals: default value is Standard_False
	:type theHasVNormals: bool
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasSColors: default value is Standard_False
	:type theHasSColors: bool
	:param theHasVTexels: default value is Standard_False
	:type theHasVTexels: bool
	:rtype: None") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips (Standard_Integer theMaxVertexs,Standard_Integer theMaxStrips = 0,Standard_Boolean theHasVNormals = Standard_False,Standard_Boolean theHasVColors = Standard_False,Standard_Boolean theHasSColors = Standard_False,Standard_Boolean theHasVTexels = Standard_False);

};


%make_alias(Graphic3d_ArrayOfQuadrangleStrips)

%extend Graphic3d_ArrayOfQuadrangleStrips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Graphic3d_ArrayOfQuadrangles *
*************************************/
class Graphic3d_ArrayOfQuadrangles : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfQuadrangles ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "* Creates an array of quadrangles (Graphic3d_TOPA_QUADRANGLES), a quadrangle can be filled as: 1) Creating a set of quadrangles defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfQuadrangles (8); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x8, y8, z8); @endcode 2) Creating a set of indexed quadrangles defined with his vertex ans edges, i.e: @code myArray = Graphic3d_ArrayOfQuadrangles (6, 8); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x6, y6, z6); myArray->AddEdges (1, 2, 3, 4); myArray->AddEdges (3, 4, 5, 6); @endcode @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxEdges defines the maximum allowed edge number in the array (for indexed array) @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxEdges:
	:type theMaxEdges: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles (Standard_Integer theMaxVertexs,Standard_Integer theMaxEdges,int theArrayFlags);

		/****************** Graphic3d_ArrayOfQuadrangles ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "* Creates an array of quadrangles (Graphic3d_TOPA_QUADRANGLES). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxEdges defines the maximum allowed edge number in the array (for indexed array)
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxEdges: default value is 0
	:type theMaxEdges: int
	:param theHasVNormals: default value is Standard_False
	:type theHasVNormals: bool
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasVTexels: default value is Standard_False
	:type theHasVTexels: bool
	:rtype: None") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles (Standard_Integer theMaxVertexs,Standard_Integer theMaxEdges = 0,Standard_Boolean theHasVNormals = Standard_False,Standard_Boolean theHasVColors = Standard_False,Standard_Boolean theHasVTexels = Standard_False);

};


%make_alias(Graphic3d_ArrayOfQuadrangles)

%extend Graphic3d_ArrayOfQuadrangles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Graphic3d_ArrayOfSegments *
**********************************/
class Graphic3d_ArrayOfSegments : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfSegments ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "* Creates an array of segments (Graphic3d_TOPA_SEGMENTS), a segment can be filled as: 1) Creating a set of segments defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfSegments (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); @endcode 2) Creating a set of indexed segments defined with his vertex and edges, i.e: @code myArray = Graphic3d_ArrayOfSegments (4, 8); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdges (1, 2); myArray->AddEdges (3, 4); myArray->AddEdges (2, 4); myArray->AddEdges (1, 3); @endcode @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxEdges defines the maximum allowed edge number in the array @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxEdges:
	:type theMaxEdges: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments (Standard_Integer theMaxVertexs,Standard_Integer theMaxEdges,int theArrayFlags);

		/****************** Graphic3d_ArrayOfSegments ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "* Creates an array of segments (Graphic3d_TOPA_SEGMENTS). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxEdges defines the maximum allowed edge number in the array @param theHasVColors when True, AddVertex(Point,Color) should be used for specifying vertex color
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxEdges: default value is 0
	:type theMaxEdges: int
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:rtype: None") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments (Standard_Integer theMaxVertexs,Standard_Integer theMaxEdges = 0,Standard_Boolean theHasVColors = Standard_False);

};


%make_alias(Graphic3d_ArrayOfSegments)

%extend Graphic3d_ArrayOfSegments {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class Graphic3d_ArrayOfTriangleFans *
**************************************/
class Graphic3d_ArrayOfTriangleFans : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfTriangleFans ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "* Creates an array of triangle fans (Graphic3d_TOPA_TRIANGLEFANS), a polygon can be filled as: 1) Creating a single fan defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfTriangleFans (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) creating separate fans defined with a predefined number of fans and the number of vertex per fan, i.e: @code myArray = Graphic3d_ArrayOfTriangleFans (8, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (4); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x8, y8, z8); @endcode The number of triangle really drawn is: VertexNumber() - 2 * Min(1, BoundNumber()) @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxFans defines the maximum allowed fan number in the array @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxFans:
	:type theMaxFans: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans (Standard_Integer theMaxVertexs,Standard_Integer theMaxFans,int theArrayFlags);

		/****************** Graphic3d_ArrayOfTriangleFans ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "* Creates an array of triangle fans (Graphic3d_TOPA_TRIANGLEFANS). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxFans defines the maximum allowed fan number in the array
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxFans: default value is 0
	:type theMaxFans: int
	:param theHasVNormals: default value is Standard_False
	:type theHasVNormals: bool
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasBColors: default value is Standard_False
	:type theHasBColors: bool
	:param theHasVTexels: default value is Standard_False
	:type theHasVTexels: bool
	:rtype: None") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans (Standard_Integer theMaxVertexs,Standard_Integer theMaxFans = 0,Standard_Boolean theHasVNormals = Standard_False,Standard_Boolean theHasVColors = Standard_False,Standard_Boolean theHasBColors = Standard_False,Standard_Boolean theHasVTexels = Standard_False);

};


%make_alias(Graphic3d_ArrayOfTriangleFans)

%extend Graphic3d_ArrayOfTriangleFans {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class Graphic3d_ArrayOfTriangleStrips *
****************************************/
class Graphic3d_ArrayOfTriangleStrips : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfTriangleStrips ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "* Creates an array of triangle strips (Graphic3d_TOPA_TRIANGLESTRIPS), a polygon can be filled as: 1) Creating a single strip defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfTriangleStrips (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate strips defined with a predefined number of strips and the number of vertex per strip, i.e: @code myArray = Graphic3d_ArrayOfTriangleStrips (8, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (4); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x8, y8, z8); @endcode @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxStrips defines the maximum allowed strip number in the array;  the number of triangle really drawn is: VertexNumber() - 2 * Min(1, BoundNumber()) @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxStrips:
	:type theMaxStrips: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips (Standard_Integer theMaxVertexs,Standard_Integer theMaxStrips,int theArrayFlags);

		/****************** Graphic3d_ArrayOfTriangleStrips ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "* Creates an array of triangle strips (Graphic3d_TOPA_TRIANGLESTRIPS). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxStrips defines the maximum allowed strip number in the array;  the number of triangle really drawn is: VertexNumber() - 2 * Min(1, BoundNumber()) @param theHasVNormals when True, AddVertex(Point,Normal), AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) should be used to specify vertex normal;  vertex normals should be specified coherent to triangle orientation (defined by order of vertexes within triangle) for proper rendering @param theHasVColors when True, AddVertex(Point,Color) or AddVertex(Point,Normal,Color) should be used to specify vertex color @param theHasBColors when True, AddBound(number,Color) should be used to specify sub-group color @param theHasVTexels when True, AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) should be used to specify vertex UV coordinates
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxStrips: default value is 0
	:type theMaxStrips: int
	:param theHasVNormals: default value is Standard_False
	:type theHasVNormals: bool
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasBColors: default value is Standard_False
	:type theHasBColors: bool
	:param theHasVTexels: default value is Standard_False
	:type theHasVTexels: bool
	:rtype: None") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips (Standard_Integer theMaxVertexs,Standard_Integer theMaxStrips = 0,Standard_Boolean theHasVNormals = Standard_False,Standard_Boolean theHasVColors = Standard_False,Standard_Boolean theHasBColors = Standard_False,Standard_Boolean theHasVTexels = Standard_False);

};


%make_alias(Graphic3d_ArrayOfTriangleStrips)

%extend Graphic3d_ArrayOfTriangleStrips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Graphic3d_ArrayOfTriangles *
***********************************/
class Graphic3d_ArrayOfTriangles : public Graphic3d_ArrayOfPrimitives {
	public:
		/****************** Graphic3d_ArrayOfTriangles ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "* Creates an array of triangles (Graphic3d_TOPA_TRIANGLES), a triangle can be filled as: 1) Creating a set of triangles defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfTriangles (6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x6, y6, z6); @endcode 3) Creating a set of indexed triangles defined with his vertex and edges, i.e: @code myArray = Graphic3d_ArrayOfTriangles (4, 6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdges (1, 2, 3); myArray->AddEdges (2, 3, 4); @endcode @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxEdges defines the maximum allowed edge number in the array @param theArrayFlags array flags
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxEdges:
	:type theMaxEdges: int
	:param theArrayFlags:
	:type theArrayFlags: int
	:rtype: None") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles (Standard_Integer theMaxVertexs,Standard_Integer theMaxEdges,int theArrayFlags);

		/****************** Graphic3d_ArrayOfTriangles ******************/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "* Creates an array of triangles (Graphic3d_TOPA_TRIANGLES). @param theMaxVertexs defines the maximum allowed vertex number in the array @param theMaxEdges defines the maximum allowed edge number in the array @param theHasVNormals when True, AddVertex(Point,Normal), AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) should be used to specify vertex normal;  vertex normals should be specified coherent to triangle orientation (defined by order of vertexes within triangle) for proper rendering @param theHasVColors when True, AddVertex(Point,Color) or AddVertex(Point,Normal,Color) should be used to specify vertex color @param theHasVTexels when True, AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) should be used to specify vertex UV coordinates
	:param theMaxVertexs:
	:type theMaxVertexs: int
	:param theMaxEdges: default value is 0
	:type theMaxEdges: int
	:param theHasVNormals: default value is Standard_False
	:type theHasVNormals: bool
	:param theHasVColors: default value is Standard_False
	:type theHasVColors: bool
	:param theHasVTexels: default value is Standard_False
	:type theHasVTexels: bool
	:rtype: None") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles (Standard_Integer theMaxVertexs,Standard_Integer theMaxEdges = 0,Standard_Boolean theHasVNormals = Standard_False,Standard_Boolean theHasVColors = Standard_False,Standard_Boolean theHasVTexels = Standard_False);

};


%make_alias(Graphic3d_ArrayOfTriangles)

%extend Graphic3d_ArrayOfTriangles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Graphic3d_AspectFillArea3d *
***********************************/
class Graphic3d_AspectFillArea3d : public Graphic3d_Aspects {
	public:
		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: bool") Edge;
		bool Edge ();

		/****************** Graphic3d_AspectFillArea3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "* Creates a context table for fill area primitives defined with the following default values: //! InteriorStyle : Aspect_IS_EMPTY InteriorColor : Quantity_NOC_CYAN1 EdgeColor : Quantity_NOC_WHITE EdgeLineType : Aspect_TOL_SOLID EdgeWidth : 1.0 FrontMaterial : NOM_BRASS BackMaterial : NOM_BRASS HatchStyle : Aspect_HS_SOLID //! Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.
	:rtype: None") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d ();

		/****************** Graphic3d_AspectFillArea3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "* Creates a context table for fill area primitives defined with the specified values. Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.
	:param theInterior:
	:type theInterior: Aspect_InteriorStyle
	:param theInteriorColor:
	:type theInteriorColor: Quantity_Color
	:param theEdgeColor:
	:type theEdgeColor: Quantity_Color
	:param theEdgeLineType:
	:type theEdgeLineType: Aspect_TypeOfLine
	:param theEdgeWidth:
	:type theEdgeWidth: float
	:param theFrontMaterial:
	:type theFrontMaterial: Graphic3d_MaterialAspect
	:param theBackMaterial:
	:type theBackMaterial: Graphic3d_MaterialAspect
	:rtype: None") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d (const Aspect_InteriorStyle theInterior,const Quantity_Color & theInteriorColor,const Quantity_Color & theEdgeColor,const Aspect_TypeOfLine theEdgeLineType,const Standard_Real theEdgeWidth,const Graphic3d_MaterialAspect & theFrontMaterial,const Graphic3d_MaterialAspect & theBackMaterial);

};


%make_alias(Graphic3d_AspectFillArea3d)

%extend Graphic3d_AspectFillArea3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_AspectLine3d *
*******************************/
class Graphic3d_AspectLine3d : public Graphic3d_Aspects {
	public:
		/****************** Graphic3d_AspectLine3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "* Creates a context table for line primitives defined with the following default values: //! Color = Quantity_NOC_YELLOW; Type = Aspect_TOL_SOLID; Width = 1.0;
	:rtype: None") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d ();

		/****************** Graphic3d_AspectLine3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "* Creates a context table for line primitives defined with the specified values. Warning: theWidth is the 'line width scale factor'. The nominal line width is 1 pixel. The width of the line is determined by applying the line width scale factor to this nominal line width. The supported line widths vary by 1-pixel units.
	:param theColor:
	:type theColor: Quantity_Color
	:param theType:
	:type theType: Aspect_TypeOfLine
	:param theWidth:
	:type theWidth: float
	:rtype: None") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d (const Quantity_Color & theColor,Aspect_TypeOfLine theType,Standard_Real theWidth);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Modifies the type of line.
	:param theType:
	:type theType: Aspect_TypeOfLine
	:rtype: None") SetType;
		void SetType (const Aspect_TypeOfLine theType);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "* Modifies the line thickness. Warning: Raises Standard_OutOfRange if the width is a negative value.
	:param theWidth:
	:type theWidth: float
	:rtype: None") SetWidth;
		void SetWidth (const Standard_Real theWidth);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "* Modifies the line thickness. Warning: Raises Standard_OutOfRange if the width is a negative value.
	:param theWidth:
	:type theWidth: Standard_ShortReal
	:rtype: None") SetWidth;
		void SetWidth (Standard_ShortReal theWidth);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Return line type.
	:rtype: Aspect_TypeOfLine") Type;
		Aspect_TypeOfLine Type ();

		/****************** Width ******************/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "* Return line width.
	:rtype: Standard_ShortReal") Width;
		Standard_ShortReal Width ();

};


%make_alias(Graphic3d_AspectLine3d)

%extend Graphic3d_AspectLine3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Graphic3d_AspectMarker3d *
*********************************/
class Graphic3d_AspectMarker3d : public Graphic3d_Aspects {
	public:
		/****************** GetMarkerImage ******************/
		%feature("compactdefaultargs") GetMarkerImage;
		%feature("autodoc", "* Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.
	:rtype: opencascade::handle<Graphic3d_MarkerImage>") GetMarkerImage;
		const opencascade::handle<Graphic3d_MarkerImage> & GetMarkerImage ();

		/****************** GetTextureSize ******************/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "* Returns marker's texture size.
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None") GetTextureSize;
		void GetTextureSize (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Graphic3d_AspectMarker3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "* Creates a context table for marker primitives defined with the following default values: //! Marker type : TOM_X Color : YELLOW Scale factor: 1.0
	:rtype: None") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d ();

		/****************** Graphic3d_AspectMarker3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", ":param theType:
	:type theType: Aspect_TypeOfMarker
	:param theColor:
	:type theColor: Quantity_Color
	:param theScale:
	:type theScale: float
	:rtype: None") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Aspect_TypeOfMarker theType,const Quantity_Color & theColor,const Standard_Real theScale);

		/****************** Graphic3d_AspectMarker3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "* Creates a context table for marker primitives defined with the specified values.
	:param theColor:
	:type theColor: Quantity_Color
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theTextureBitmap:
	:type theTextureBitmap: TColStd_HArray1OfByte
	:rtype: None") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const Quantity_Color & theColor,const Standard_Integer theWidth,const Standard_Integer theHeight,const opencascade::handle<TColStd_HArray1OfByte> & theTextureBitmap);

		/****************** Graphic3d_AspectMarker3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "* Creates a context table for marker primitives defined with the specified values.
	:param theTextureImage:
	:type theTextureImage: Image_PixMap
	:rtype: None") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d (const opencascade::handle<Image_PixMap> & theTextureImage);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "* Return scale factor.
	:rtype: Standard_ShortReal") Scale;
		Standard_ShortReal Scale ();

		/****************** SetBitMap ******************/
		%feature("compactdefaultargs") SetBitMap;
		%feature("autodoc", ":param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theTexture:
	:type theTexture: TColStd_HArray1OfByte
	:rtype: None") SetBitMap;
		void SetBitMap (const Standard_Integer theWidth,const Standard_Integer theHeight,const opencascade::handle<TColStd_HArray1OfByte> & theTexture);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Modifies the scale factor. Marker type Aspect_TOM_POINT is not affected by the marker size scale factor. It is always the smallest displayable dot. Warning: Raises Standard_OutOfRange if the scale is a negative value.
	:param theScale:
	:type theScale: Standard_ShortReal
	:rtype: None") SetScale;
		void SetScale (const Standard_ShortReal theScale);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "* Assign scale factor.
	:param theScale:
	:type theScale: float
	:rtype: None") SetScale;
		void SetScale (const Standard_Real theScale);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Modifies the type of marker.
	:param theType:
	:type theType: Aspect_TypeOfMarker
	:rtype: None") SetType;
		void SetType (const Aspect_TypeOfMarker theType);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Return marker type.
	:rtype: Aspect_TypeOfMarker") Type;
		Aspect_TypeOfMarker Type ();

};


%make_alias(Graphic3d_AspectMarker3d)

%extend Graphic3d_AspectMarker3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_AspectText3d *
*******************************/
class Graphic3d_AspectText3d : public Graphic3d_Aspects {
	public:
		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Return the text color.
	:rtype: Quantity_Color") Color;
		const Quantity_Color & Color ();

		/****************** ColorRGBA ******************/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "* Return the text color.
	:rtype: Quantity_ColorRGBA") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA ();

		/****************** DisplayType ******************/
		%feature("compactdefaultargs") DisplayType;
		%feature("autodoc", "* Return display type.
	:rtype: Aspect_TypeOfDisplayText") DisplayType;
		Aspect_TypeOfDisplayText DisplayType ();

		/****************** Font ******************/
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "* Return the font.
	:rtype: TCollection_AsciiString") Font;
		const TCollection_AsciiString & Font ();

		/****************** GetTextAngle ******************/
		%feature("compactdefaultargs") GetTextAngle;
		%feature("autodoc", "* Returns Angle of degree
	:rtype: Standard_ShortReal") GetTextAngle;
		Standard_ShortReal GetTextAngle ();

		/****************** GetTextFontAspect ******************/
		%feature("compactdefaultargs") GetTextFontAspect;
		%feature("autodoc", "* Returns text FontAspect
	:rtype: Font_FontAspect") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect ();

		/****************** GetTextZoomable ******************/
		%feature("compactdefaultargs") GetTextZoomable;
		%feature("autodoc", "* Returns True when the Text Zoomable is on.
	:rtype: bool") GetTextZoomable;
		bool GetTextZoomable ();

		/****************** Graphic3d_AspectText3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "* Creates a context table for text primitives defined with the following default values: Color : Quantity_NOC_YELLOW Font : Font_NOF_ASCII_MONO The style : Aspect_TOST_NORMAL The display type : Aspect_TODT_NORMAL
	:rtype: None") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d ();

		/****************** Graphic3d_AspectText3d ******************/
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "* Creates a context table for text primitives defined with the specified values. @param theColor [in] text color @param theFont [in] font family name or alias like Font_NOF_ASCII_MONO @param theExpansionFactor [in] deprecated parameter, has no effect @param theSpace [in] deprecated parameter, has no effect @param theStyle [in] font style @param theDisplayType [in] display mode
	:param theColor:
	:type theColor: Quantity_Color
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
	:rtype: None") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d (const Quantity_Color & theColor,const char * theFont,Standard_Real theExpansionFactor,Standard_Real theSpace,Aspect_TypeOfStyleText theStyle = Aspect_TOST_NORMAL,Aspect_TypeOfDisplayText theDisplayType = Aspect_TODT_NORMAL);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Modifies the color.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Modifies the color.
	:param theColor:
	:type theColor: Quantity_ColorRGBA
	:rtype: None") SetColor;
		void SetColor (const Quantity_ColorRGBA & theColor);

		/****************** SetDisplayType ******************/
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "* Define the display type of the text.
	:param theDisplayType:
	:type theDisplayType: Aspect_TypeOfDisplayText
	:rtype: None") SetDisplayType;
		void SetDisplayType (Aspect_TypeOfDisplayText theDisplayType);

		/****************** SetFont ******************/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "* Modifies the font.
	:param theFont:
	:type theFont: TCollection_AsciiString
	:rtype: None") SetFont;
		void SetFont (const TCollection_AsciiString & theFont);

		/****************** SetFont ******************/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "* Modifies the font.
	:param theFont:
	:type theFont: char *
	:rtype: None") SetFont;
		void SetFont (const char * theFont);

		/****************** SetStyle ******************/
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "* Modifies the style of the text.
	:param theStyle:
	:type theStyle: Aspect_TypeOfStyleText
	:rtype: None") SetStyle;
		void SetStyle (Aspect_TypeOfStyleText theStyle);

		/****************** SetTextAngle ******************/
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "* Turns usage of text rotated
	:param theAngle:
	:type theAngle: float
	:rtype: None") SetTextAngle;
		void SetTextAngle (const Standard_Real theAngle);

		/****************** Style ******************/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "* Return the text style.
	:rtype: Aspect_TypeOfStyleText") Style;
		Aspect_TypeOfStyleText Style ();

};


%make_alias(Graphic3d_AspectText3d)

%extend Graphic3d_AspectText3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_AttribBuffer *
*******************************/
class Graphic3d_AttribBuffer : public Graphic3d_Buffer {
	public:
		/****************** Graphic3d_AttribBuffer ******************/
		%feature("compactdefaultargs") Graphic3d_AttribBuffer;
		%feature("autodoc", "* Empty constructor.
	:param theAlloc:
	:type theAlloc: NCollection_BaseAllocator
	:rtype: None") Graphic3d_AttribBuffer;
		 Graphic3d_AttribBuffer (const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Allocates new empty array
	:param theNbElems:
	:type theNbElems: int
	:param theAttribs:
	:type theAttribs: Graphic3d_Attribute *
	:param theNbAttribs:
	:type theNbAttribs: int
	:rtype: bool") Init;
		bool Init (const Standard_Integer theNbElems,const Graphic3d_Attribute * theAttribs,const Standard_Integer theNbAttribs);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Allocates new empty array
	:param theNbElems:
	:type theNbElems: int
	:param theAttribs:
	:type theAttribs: Graphic3d_Array1OfAttribute
	:rtype: bool") Init;
		bool Init (const Standard_Integer theNbElems,const Graphic3d_Array1OfAttribute & theAttribs);

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidate the entire buffer data.
	:rtype: void") Invalidate;
		virtual void Invalidate ();

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidate the entire attribute data.
	:param theAttributeIndex:
	:type theAttributeIndex: int
	:rtype: None") Invalidate;
		void Invalidate (Standard_Integer theAttributeIndex);

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidate attribute data within specified sub-range (starting from 0).
	:param theAttributeIndex:
	:type theAttributeIndex: int
	:param theVertexLower:
	:type theVertexLower: int
	:param theVertexUpper:
	:type theVertexUpper: int
	:rtype: None") Invalidate;
		void Invalidate (Standard_Integer theAttributeIndex,Standard_Integer theVertexLower,Standard_Integer theVertexUpper);

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidate all attribute data within specified vertex sub-range (starting from 0).
	:param theVertexLower:
	:type theVertexLower: int
	:param theVertexUpper:
	:type theVertexUpper: int
	:rtype: None") Invalidate;
		void Invalidate (Standard_Integer theVertexLower,Standard_Integer theVertexUpper);

		/****************** InvalidatedRange ******************/
		%feature("compactdefaultargs") InvalidatedRange;
		%feature("autodoc", "* Return invalidated range.
	:rtype: Graphic3d_BufferRange") InvalidatedRange;
		Graphic3d_BufferRange InvalidatedRange ();

		/****************** IsInterleaved ******************/
		%feature("compactdefaultargs") IsInterleaved;
		%feature("autodoc", "* Return True for interleaved array; True by default.
	:rtype: bool") IsInterleaved;
		Standard_Boolean IsInterleaved ();

		/****************** IsMutable ******************/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "* Return True if data can be invalidated; False by default.
	:rtype: bool") IsMutable;
		Standard_Boolean IsMutable ();

		/****************** SetInterleaved ******************/
		%feature("compactdefaultargs") SetInterleaved;
		%feature("autodoc", "* Setup interleaved/non-interleaved array. WARNING! Filling non-interleaved buffer should be implemented on user side without Graphic3d_Buffer auxiliary methods designed for interleaved data.
	:param theIsInterleaved:
	:type theIsInterleaved: bool
	:rtype: None") SetInterleaved;
		void SetInterleaved (Standard_Boolean theIsInterleaved);

		/****************** SetMutable ******************/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "* Set if data can be invalidated.
	:param theMutable:
	:type theMutable: bool
	:rtype: None") SetMutable;
		void SetMutable (Standard_Boolean theMutable);

		/****************** Validate ******************/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "* Reset invalidated range.
	:rtype: None") Validate;
		void Validate ();

		/****************** invalidate ******************/
		%feature("compactdefaultargs") invalidate;
		%feature("autodoc", "* Invalidate specified sub-range of data (as byte offsets).
	:param theRange:
	:type theRange: Graphic3d_BufferRange
	:rtype: None") invalidate;
		void invalidate (const Graphic3d_BufferRange & theRange);

};


%extend Graphic3d_AttribBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class Graphic3d_BvhCStructureSetTrsfPers *
*******************************************/
/************************
* class Graphic3d_CView *
************************/
%nodefaultctor Graphic3d_CView;
class Graphic3d_CView : public Graphic3d_DataStructureManager {
	public:
		/****************** Activate ******************/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "* Activates the view. Maps presentations defined within structure manager onto this view.
	:rtype: void") Activate;
		virtual void Activate ();

		/****************** BackfacingModel ******************/
		%feature("compactdefaultargs") BackfacingModel;
		%feature("autodoc", "* Return backfacing model used for the view.
	:rtype: Graphic3d_TypeOfBackfacingModel") BackfacingModel;
		Graphic3d_TypeOfBackfacingModel BackfacingModel ();

		/****************** Background ******************/
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "* Returns background fill color.
	:rtype: Aspect_Background") Background;
		Aspect_Background Background ();

		/****************** BackgroundCubeMap ******************/
		%feature("compactdefaultargs") BackgroundCubeMap;
		%feature("autodoc", "* Returns cubemap being setted last time on background.
	:rtype: opencascade::handle<Graphic3d_CubeMap>") BackgroundCubeMap;
		opencascade::handle<Graphic3d_CubeMap> BackgroundCubeMap ();

		/****************** BackgroundImage ******************/
		%feature("compactdefaultargs") BackgroundImage;
		%feature("autodoc", "* Returns background image texture file path.
	:rtype: TCollection_AsciiString") BackgroundImage;
		TCollection_AsciiString BackgroundImage ();

		/****************** BackgroundImageStyle ******************/
		%feature("compactdefaultargs") BackgroundImageStyle;
		%feature("autodoc", "* Returns background image fill style.
	:rtype: Aspect_FillMethod") BackgroundImageStyle;
		Aspect_FillMethod BackgroundImageStyle ();

		/****************** BufferDump ******************/
		%feature("compactdefaultargs") BufferDump;
		%feature("autodoc", "* Dump active rendering buffer into specified memory buffer.
	:param theImage:
	:type theImage: Image_PixMap
	:param theBufferType:
	:type theBufferType: Graphic3d_BufferType
	:rtype: bool") BufferDump;
		Standard_Boolean BufferDump (Image_PixMap & theImage,const Graphic3d_BufferType & theBufferType);

		/****************** Camera ******************/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "* Returns camera object of the view.
	:rtype: opencascade::handle<Graphic3d_Camera>") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera ();

		/****************** ChangeHiddenObjects ******************/
		%feature("compactdefaultargs") ChangeHiddenObjects;
		%feature("autodoc", "* Returns map of objects hidden within this specific view (not viewer-wise).
	:rtype: opencascade::handle<Graphic3d_NMapOfTransient>") ChangeHiddenObjects;
		opencascade::handle<Graphic3d_NMapOfTransient> & ChangeHiddenObjects ();

		/****************** ChangeRenderingParams ******************/
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "* Returns reference to current rendering parameters and effect settings.
	:rtype: Graphic3d_RenderingParams") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams ();

		/****************** ClipPlanes ******************/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "* Returns list of clip planes set for the view.
	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes ();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Computes the new presentation of the structures displayed in this view with the type Graphic3d_TOS_COMPUTED.
	:rtype: None") Compute;
		void Compute ();

		/****************** ComputedMode ******************/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "* Returns the computed HLR mode state
	:rtype: bool") ComputedMode;
		Standard_Boolean ComputedMode ();

		/****************** ConsiderZoomPersistenceObjects ******************/
		%feature("compactdefaultargs") ConsiderZoomPersistenceObjects;
		%feature("autodoc", "* Returns zoom-scale factor.
	:rtype: float") ConsiderZoomPersistenceObjects;
		Standard_Real ConsiderZoomPersistenceObjects ();

		/****************** ContainsFacet ******************/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "* Returns Standard_True if one of the structures displayed in the view contains Polygons, Triangles or Quadrangles.
	:rtype: bool") ContainsFacet;
		Standard_Boolean ContainsFacet ();

		/****************** ContainsFacet ******************/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "* Returns Standard_True if one of the structures in the set contains Polygons, Triangles or Quadrangles.
	:param theSet:
	:type theSet: Graphic3d_MapOfStructure
	:rtype: bool") ContainsFacet;
		Standard_Boolean ContainsFacet (const Graphic3d_MapOfStructure & theSet);

		/****************** CopySettings ******************/
		%feature("compactdefaultargs") CopySettings;
		%feature("autodoc", "* Copy visualization settings from another view. Method is used for cloning views in viewer when its required to create view with same view properties.
	:param theOther:
	:type theOther: Graphic3d_CView
	:rtype: void") CopySettings;
		virtual void CopySettings (const opencascade::handle<Graphic3d_CView> & theOther);

		/****************** Deactivate ******************/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "* Deactivates the view. Unmaps presentations defined within structure manager. The view in deactivated state will ignore actions on structures such as Display().
	:rtype: void") Deactivate;
		virtual void Deactivate ();

		/****************** DiagnosticInformation ******************/
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "* Fill in the dictionary with diagnostic info. Should be called within rendering thread. //! This API should be used only for user output or for creating automated reports. The format of returned information (e.g. key-value layout) is NOT part of this API and can be changed at any time. Thus application should not parse returned information to weed out specific parameters.
	:param theDict:
	:type theDict: TColStd_IndexedDataMapOfStringString
	:param theFlags:
	:type theFlags: Graphic3d_DiagnosticInfo
	:rtype: None") DiagnosticInformation;
		void DiagnosticInformation (TColStd_IndexedDataMapOfStringString & theDict,Graphic3d_DiagnosticInfo theFlags);

		/****************** DisplayedStructures ******************/
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "* Returns the set of structures displayed in this view.
	:param theStructures:
	:type theStructures: Graphic3d_MapOfStructure
	:rtype: None") DisplayedStructures;
		void DisplayedStructures (Graphic3d_MapOfStructure & theStructures);

		/****************** FBO ******************/
		%feature("compactdefaultargs") FBO;
		%feature("autodoc", "* Returns pointer to an assigned framebuffer object.
	:rtype: opencascade::handle<Standard_Transient>") FBO;
		opencascade::handle<Standard_Transient> FBO ();

		/****************** FBOChangeViewport ******************/
		%feature("compactdefaultargs") FBOChangeViewport;
		%feature("autodoc", "* Change offscreen FBO viewport.
	:param theFbo:
	:type theFbo: Standard_Transient
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: None") FBOChangeViewport;
		void FBOChangeViewport (const opencascade::handle<Standard_Transient> & theFbo,const Standard_Integer theWidth,const Standard_Integer theHeight);

		/****************** FBOCreate ******************/
		%feature("compactdefaultargs") FBOCreate;
		%feature("autodoc", "* Generate offscreen FBO in the graphic library. If not supported on hardware returns NULL.
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:rtype: opencascade::handle<Standard_Transient>") FBOCreate;
		opencascade::handle<Standard_Transient> FBOCreate (const Standard_Integer theWidth,const Standard_Integer theHeight);

		/****************** FBOGetDimensions ******************/
		%feature("compactdefaultargs") FBOGetDimensions;
		%feature("autodoc", "* Read offscreen FBO configuration.
	:param theFbo:
	:type theFbo: Standard_Transient
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theWidthMax:
	:type theWidthMax: int
	:param theHeightMax:
	:type theHeightMax: int
	:rtype: None") FBOGetDimensions;
		void FBOGetDimensions (const opencascade::handle<Standard_Transient> & theFbo,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** FBORelease ******************/
		%feature("compactdefaultargs") FBORelease;
		%feature("autodoc", "* Remove offscreen FBO from the graphic library
	:param theFbo:
	:type theFbo: Standard_Transient
	:rtype: None") FBORelease;
		void FBORelease (opencascade::handle<Standard_Transient> & theFbo);

		/****************** GetGraduatedTrihedron ******************/
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "* @name obsolete Graduated Trihedron functionality Returns data of a graduated trihedron
	:rtype: Graphic3d_GraduatedTrihedron") GetGraduatedTrihedron;
		const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron ();

		/****************** GradientBackground ******************/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "* Returns gradient background fill colors.
	:rtype: Aspect_GradientBackground") GradientBackground;
		Aspect_GradientBackground GradientBackground ();

		/****************** GraduatedTrihedronDisplay ******************/
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "* Displays Graduated Trihedron.
	:param theTrihedronData:
	:type theTrihedronData: Graphic3d_GraduatedTrihedron
	:rtype: None") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const Graphic3d_GraduatedTrihedron & theTrihedronData);

		/****************** GraduatedTrihedronErase ******************/
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "* Erases Graduated Trihedron.
	:rtype: None") GraduatedTrihedronErase;
		void GraduatedTrihedronErase ();

		/****************** GraduatedTrihedronMinMaxValues ******************/
		%feature("compactdefaultargs") GraduatedTrihedronMinMaxValues;
		%feature("autodoc", "* Sets minimum and maximum points of scene bounding box for Graduated Trihedron stored in graphic view object. @param theMin [in] the minimum point of scene. @param theMax [in] the maximum point of scene.
	:param theMin:
	:type theMin: Graphic3d_Vec3
	:param theMax:
	:type theMax: Graphic3d_Vec3
	:rtype: None") GraduatedTrihedronMinMaxValues;
		void GraduatedTrihedronMinMaxValues (const Graphic3d_Vec3 theMin,const Graphic3d_Vec3 theMax);

		/****************** HiddenObjects ******************/
		%feature("compactdefaultargs") HiddenObjects;
		%feature("autodoc", "* Returns map of objects hidden within this specific view (not viewer-wise).
	:rtype: opencascade::handle<Graphic3d_NMapOfTransient>") HiddenObjects;
		const opencascade::handle<Graphic3d_NMapOfTransient> & HiddenObjects ();

		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "* Returns the identification number of the view.
	:rtype: int") Identification;
		Standard_Integer Identification ();

		/****************** InsertLayerAfter ******************/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "* Add a layer to the view. @param theNewLayerId [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param theSettings [in] new layer settings @param theLayerBefore [in] id of layer to append new layer after
	:param theNewLayerId:
	:type theNewLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:param theLayerBefore:
	:type theLayerBefore: int
	:rtype: None") InsertLayerAfter;
		void InsertLayerAfter (int theNewLayerId,const Graphic3d_ZLayerSettings & theSettings,int theLayerBefore);

		/****************** InsertLayerBefore ******************/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "* Add a layer to the view. @param theNewLayerId [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param theSettings [in] new layer settings @param theLayerAfter [in] id of layer to append new layer before
	:param theNewLayerId:
	:type theNewLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:param theLayerAfter:
	:type theLayerAfter: int
	:rtype: None") InsertLayerBefore;
		void InsertLayerBefore (int theNewLayerId,const Graphic3d_ZLayerSettings & theSettings,int theLayerAfter);

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidates content of the view but does not redraw it.
	:rtype: None") Invalidate;
		void Invalidate ();

		/****************** InvalidateBVHData ******************/
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "* Marks BVH tree and the set of BVH primitives of correspondent priority list with id theLayerId as outdated.
	:param theLayerId:
	:type theLayerId: int
	:rtype: None") InvalidateBVHData;
		void InvalidateBVHData (int theLayerId);

		/****************** InvalidateZLayerBoundingBox ******************/
		%feature("compactdefaultargs") InvalidateZLayerBoundingBox;
		%feature("autodoc", "* Returns the bounding box of all structures displayed in the Z layer.
	:param theLayerId:
	:type theLayerId: int
	:rtype: void") InvalidateZLayerBoundingBox;
		virtual void InvalidateZLayerBoundingBox (int theLayerId);

		/****************** IsActive ******************/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "* Returns the activity flag of the view.
	:rtype: bool") IsActive;
		Standard_Boolean IsActive ();

		/****************** IsComputed ******************/
		%feature("compactdefaultargs") IsComputed;
		%feature("autodoc", "* Returns Standard_True in case if the structure with the given <theStructId> is in list of structures to be computed and stores computed struct to <theComputedStruct>.
	:param theStructId:
	:type theStructId: int
	:param theComputedStruct:
	:type theComputedStruct: Graphic3d_Structure
	:rtype: bool") IsComputed;
		Standard_Boolean IsComputed (const Standard_Integer theStructId,opencascade::handle<Graphic3d_Structure> & theComputedStruct);

		/****************** IsDefined ******************/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "* Returns True if the window associated to the view is defined.
	:rtype: bool") IsDefined;
		Standard_Boolean IsDefined ();

		/****************** IsInvalidated ******************/
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "* Return true if view content cache has been invalidated.
	:rtype: bool") IsInvalidated;
		Standard_Boolean IsInvalidated ();

		/****************** IsRemoved ******************/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "* Returns true if the view was removed.
	:rtype: bool") IsRemoved;
		Standard_Boolean IsRemoved ();

		/****************** Layer ******************/
		%feature("compactdefaultargs") Layer;
		%feature("autodoc", "* Returns layer with given ID or NULL if undefined.
	:param theLayerId:
	:type theLayerId: int
	:rtype: opencascade::handle<Graphic3d_Layer>") Layer;
		opencascade::handle<Graphic3d_Layer> Layer (int theLayerId);

		/****************** Layers ******************/
		%feature("compactdefaultargs") Layers;
		%feature("autodoc", "* Returns the list of layers.
	:rtype: NCollection_List<opencascade::handle<Graphic3d_Layer> >") Layers;
		const NCollection_List<opencascade::handle<Graphic3d_Layer> > & Layers ();

		/****************** Lights ******************/
		%feature("compactdefaultargs") Lights;
		%feature("autodoc", "* Returns list of lights of the view.
	:rtype: opencascade::handle<Graphic3d_LightSet>") Lights;
		const opencascade::handle<Graphic3d_LightSet> & Lights ();

		/****************** MinMaxValues ******************/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "* Returns the bounding box of all structures displayed in the view. If theToIncludeAuxiliary is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite and other auxiliary structures. @param theToIncludeAuxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) returns computed bounding box
	:param theToIncludeAuxiliary: default value is Standard_False
	:type theToIncludeAuxiliary: bool
	:rtype: Bnd_Box") MinMaxValues;
		virtual Bnd_Box MinMaxValues (const Standard_Boolean theToIncludeAuxiliary = Standard_False);

		/****************** MinMaxValues ******************/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "* Returns the coordinates of the boundary box of all structures in the set <theSet>. If <theToIgnoreInfiniteFlag> is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite structures.
	:param theSet:
	:type theSet: Graphic3d_MapOfStructure
	:param theToIncludeAuxiliary: default value is Standard_False
	:type theToIncludeAuxiliary: bool
	:rtype: Bnd_Box") MinMaxValues;
		Bnd_Box MinMaxValues (const Graphic3d_MapOfStructure & theSet,const Standard_Boolean theToIncludeAuxiliary = Standard_False);

		/****************** NumberOfDisplayedStructures ******************/
		%feature("compactdefaultargs") NumberOfDisplayedStructures;
		%feature("autodoc", "* Returns number of displayed structures in the view.
	:rtype: int") NumberOfDisplayedStructures;
		Standard_Integer NumberOfDisplayedStructures ();

		/****************** ReCompute ******************/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "* Computes the new presentation of the structure displayed in this view with the type Graphic3d_TOS_COMPUTED.
	:param theStructure:
	:type theStructure: Graphic3d_Structure
	:rtype: None") ReCompute;
		void ReCompute (const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** Redraw ******************/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "* Redraw content of the view.
	:rtype: None") Redraw;
		void Redraw ();

		/****************** RedrawImmediate ******************/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "* Redraw immediate content of the view.
	:rtype: None") RedrawImmediate;
		void RedrawImmediate ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Erases the view and removes from graphic driver. No more graphic operations are allowed in this view after the call.
	:rtype: void") Remove;
		virtual void Remove ();

		/****************** RemoveZLayer ******************/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "* Remove Z layer from the specified view. All structures displayed at the moment in layer will be displayed in default layer ( the bottom-level z layer ). To unset layer ID from associated structures use method UnsetZLayer (...).
	:param theLayerId:
	:type theLayerId: int
	:rtype: None") RemoveZLayer;
		void RemoveZLayer (int theLayerId);

		/****************** RenderingParams ******************/
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "* Returns current rendering parameters and effect settings.
	:rtype: Graphic3d_RenderingParams") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams ();

		/****************** Resized ******************/
		%feature("compactdefaultargs") Resized;
		%feature("autodoc", "* Handle changing size of the rendering window.
	:rtype: None") Resized;
		void Resized ();

		/****************** SetBackfacingModel ******************/
		%feature("compactdefaultargs") SetBackfacingModel;
		%feature("autodoc", "* Sets backfacing model for the view.
	:param theModel:
	:type theModel: Graphic3d_TypeOfBackfacingModel
	:rtype: None") SetBackfacingModel;
		void SetBackfacingModel (const Graphic3d_TypeOfBackfacingModel theModel);

		/****************** SetBackground ******************/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "* Sets background fill color.
	:param theBackground:
	:type theBackground: Aspect_Background
	:rtype: None") SetBackground;
		void SetBackground (const Aspect_Background & theBackground);

		/****************** SetBackgroundCubeMap ******************/
		%feature("compactdefaultargs") SetBackgroundCubeMap;
		%feature("autodoc", "* Sets environment cubemap as background.
	:param theCubeMap:
	:type theCubeMap: Graphic3d_CubeMap
	:rtype: None") SetBackgroundCubeMap;
		void SetBackgroundCubeMap (const opencascade::handle<Graphic3d_CubeMap> & theCubeMap);

		/****************** SetBackgroundImage ******************/
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "* Sets background image texture file path.
	:param theFilePath:
	:type theFilePath: TCollection_AsciiString
	:rtype: None") SetBackgroundImage;
		void SetBackgroundImage (const TCollection_AsciiString & theFilePath);

		/****************** SetBackgroundImageStyle ******************/
		%feature("compactdefaultargs") SetBackgroundImageStyle;
		%feature("autodoc", "* Sets background image fill style.
	:param theFillStyle:
	:type theFillStyle: Aspect_FillMethod
	:rtype: None") SetBackgroundImageStyle;
		void SetBackgroundImageStyle (const Aspect_FillMethod theFillStyle);

		/****************** SetCamera ******************/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "* Sets camera used by the view.
	:param theCamera:
	:type theCamera: Graphic3d_Camera
	:rtype: None") SetCamera;
		void SetCamera (const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "* Sets list of clip planes for the view.
	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None") SetClipPlanes;
		void SetClipPlanes (const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetComputedMode ******************/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "* Switches computed HLR mode in the view
	:param theMode:
	:type theMode: bool
	:rtype: None") SetComputedMode;
		void SetComputedMode (const Standard_Boolean theMode);

		/****************** SetFBO ******************/
		%feature("compactdefaultargs") SetFBO;
		%feature("autodoc", "* Sets framebuffer object for offscreen rendering.
	:param theFbo:
	:type theFbo: Standard_Transient
	:rtype: None") SetFBO;
		void SetFBO (const opencascade::handle<Standard_Transient> & theFbo);

		/****************** SetGradientBackground ******************/
		%feature("compactdefaultargs") SetGradientBackground;
		%feature("autodoc", "* Sets gradient background fill colors.
	:param theBackground:
	:type theBackground: Aspect_GradientBackground
	:rtype: None") SetGradientBackground;
		void SetGradientBackground (const Aspect_GradientBackground & theBackground);

		/****************** SetImmediateModeDrawToFront ******************/
		%feature("compactdefaultargs") SetImmediateModeDrawToFront;
		%feature("autodoc", "* @param theDrawToFrontBuffer Advanced option to modify rendering mode: 1. True. Drawing immediate mode structures directly to the front buffer over the scene image. Fast, so preferred for interactive work (used by default). However these extra drawings will be missed in image dump since it is performed from back buffer. Notice that since no pre-buffering used the V-Sync will be ignored and rendering could be seen in run-time (in case of slow hardware) and/or tearing may appear. So this is strongly recommended to draw only simple (fast) structures. 2. False. Drawing immediate mode structures to the back buffer. The complete scene is redrawn first, so this mode is slower if scene contains complex data and/or V-Sync is turned on. But it works in any case and is especially useful for view dump because the dump image is read from the back buffer. returns previous mode.
	:param theDrawToFrontBuffer:
	:type theDrawToFrontBuffer: bool
	:rtype: bool") SetImmediateModeDrawToFront;
		Standard_Boolean SetImmediateModeDrawToFront (const Standard_Boolean theDrawToFrontBuffer);

		/****************** SetLights ******************/
		%feature("compactdefaultargs") SetLights;
		%feature("autodoc", "* Sets list of lights for the view.
	:param theLights:
	:type theLights: Graphic3d_LightSet
	:rtype: None") SetLights;
		void SetLights (const opencascade::handle<Graphic3d_LightSet> & theLights);

		/****************** SetShadingModel ******************/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "* Sets default Shading Model of the view. Will throw an exception on attempt to set Graphic3d_TOSM_DEFAULT.
	:param theModel:
	:type theModel: Graphic3d_TypeOfShadingModel
	:rtype: None") SetShadingModel;
		void SetShadingModel (Graphic3d_TypeOfShadingModel theModel);

		/****************** SetTextureEnv ******************/
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "* Sets environment texture for the view.
	:param theTextureEnv:
	:type theTextureEnv: Graphic3d_TextureEnv
	:rtype: None") SetTextureEnv;
		void SetTextureEnv (const opencascade::handle<Graphic3d_TextureEnv> & theTextureEnv);

		/****************** SetVisualizationType ******************/
		%feature("compactdefaultargs") SetVisualizationType;
		%feature("autodoc", "* Sets visualization type of the view.
	:param theType:
	:type theType: Graphic3d_TypeOfVisualization
	:rtype: None") SetVisualizationType;
		void SetVisualizationType (const Graphic3d_TypeOfVisualization theType);

		/****************** SetWindow ******************/
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "* Creates and maps rendering window to the view. @param theWindow [in] the window. @param theContext [in] the rendering context. If NULL the context will be created internally.
	:param theWindow:
	:type theWindow: Aspect_Window
	:param theContext: default value is NULL
	:type theContext: Aspect_RenderingContext
	:rtype: None") SetWindow;
		void SetWindow (const opencascade::handle<Aspect_Window> & theWindow,const Aspect_RenderingContext theContext = NULL);

		/****************** SetZLayerSettings ******************/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "* Sets the settings for a single Z layer of specified view.
	:param theLayerId:
	:type theLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings
	:rtype: None") SetZLayerSettings;
		void SetZLayerSettings (int theLayerId,const Graphic3d_ZLayerSettings & theSettings);

		/****************** ShadingModel ******************/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "* Returns default Shading Model of the view; Graphic3d_TOSM_FRAGMENT by default.
	:rtype: Graphic3d_TypeOfShadingModel") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel ();

		/****************** StatisticInformation ******************/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "* Returns string with statistic performance info.
	:rtype: TCollection_AsciiString") StatisticInformation;
		TCollection_AsciiString StatisticInformation ();

		/****************** StatisticInformation ******************/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "* Fills in the dictionary with statistic performance info.
	:param theDict:
	:type theDict: TColStd_IndexedDataMapOfStringString
	:rtype: None") StatisticInformation;
		void StatisticInformation (TColStd_IndexedDataMapOfStringString & theDict);

		/****************** StructureManager ******************/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "* Returns the structure manager handle which manage structures associated with this view.
	:rtype: opencascade::handle<Graphic3d_StructureManager>") StructureManager;
		const opencascade::handle<Graphic3d_StructureManager> & StructureManager ();

		/****************** TextureEnv ******************/
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "* Returns environment texture set for the view.
	:rtype: opencascade::handle<Graphic3d_TextureEnv>") TextureEnv;
		opencascade::handle<Graphic3d_TextureEnv> TextureEnv ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Invalidates bounding box of specified ZLayerId.
	:param theLayerId: default value is Graphic3d_ZLayerId_UNKNOWN
	:type theLayerId: int
	:rtype: None") Update;
		void Update (int theLayerId = Graphic3d_ZLayerId_UNKNOWN);

		/****************** VisualizationType ******************/
		%feature("compactdefaultargs") VisualizationType;
		%feature("autodoc", "* Returns visualization type of the view.
	:rtype: Graphic3d_TypeOfVisualization") VisualizationType;
		Graphic3d_TypeOfVisualization VisualizationType ();

		/****************** Window ******************/
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "* Returns the window associated to the view.
	:rtype: opencascade::handle<Aspect_Window>") Window;
		opencascade::handle<Aspect_Window> Window ();

		/****************** ZLayerMax ******************/
		%feature("compactdefaultargs") ZLayerMax;
		%feature("autodoc", "* Returns the maximum Z layer ID. First layer ID is Graphic3d_ZLayerId_Default, last ID is ZLayerMax().
	:rtype: int") ZLayerMax;
		Standard_Integer ZLayerMax ();

};


%make_alias(Graphic3d_CView)

%extend Graphic3d_CView {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Graphic3d_FrameStatsDataTmp *
************************************/
class Graphic3d_FrameStatsDataTmp : public Graphic3d_FrameStatsData {
	public:
		/****************** ChangeCounterValue ******************/
		%feature("compactdefaultargs") ChangeCounterValue;
		%feature("autodoc", "* Get counter value.
	:param theIndex:
	:type theIndex: Graphic3d_FrameStatsCounter
	:rtype: Standard_Size") ChangeCounterValue;
		Standard_Size & ChangeCounterValue (Graphic3d_FrameStatsCounter theIndex);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeFrameRate() {
            return (Standard_Real) $self->ChangeFrameRate();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeFrameRate(Standard_Real value) {
            $self->ChangeFrameRate()=value;
            }
        };

        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeFrameRateCpu() {
            return (Standard_Real) $self->ChangeFrameRateCpu();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeFrameRateCpu(Standard_Real value) {
            $self->ChangeFrameRateCpu()=value;
            }
        };
		/****************** ChangeTimer ******************/
		%feature("compactdefaultargs") ChangeTimer;
		%feature("autodoc", "* Return a timer object for time measurements.
	:param theTimer:
	:type theTimer: Graphic3d_FrameStatsTimer
	:rtype: OSD_Timer") ChangeTimer;
		OSD_Timer & ChangeTimer (Graphic3d_FrameStatsTimer theTimer);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeTimerValue(Graphic3d_FrameStatsTimer theIndex) {
            return (Standard_Real) $self->ChangeTimerValue(theIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeTimerValue(Graphic3d_FrameStatsTimer theIndex,Standard_Real value) {
            $self->ChangeTimerValue(theIndex)=value;
            }
        };
		/****************** FlushTimers ******************/
		%feature("compactdefaultargs") FlushTimers;
		%feature("autodoc", "* Compute average data considering the amount of rendered frames.
	:param theNbFrames:
	:type theNbFrames: Standard_Size
	:param theIsFinal:
	:type theIsFinal: bool
	:rtype: None") FlushTimers;
		void FlushTimers (Standard_Size theNbFrames,bool theIsFinal);

		/****************** Graphic3d_FrameStatsDataTmp ******************/
		%feature("compactdefaultargs") Graphic3d_FrameStatsDataTmp;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_FrameStatsDataTmp;
		 Graphic3d_FrameStatsDataTmp ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset data.
	:rtype: None") Reset;
		void Reset ();

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "* Assignment operator (skip copying irrelevant properties).
	:param theOther:
	:type theOther: Graphic3d_FrameStatsData
	:rtype: None") operator =;
		void operator = (const Graphic3d_FrameStatsData & theOther);

};


%extend Graphic3d_FrameStatsDataTmp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Graphic3d_IndexBuffer *
******************************/
/**********************************
* class Graphic3d_MediaTextureSet *
**********************************/
class Graphic3d_MediaTextureSet : public Graphic3d_TextureSet, public Media_IFrameQueue {
	public:
		/****************** Duration ******************/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "* Return duration in seconds.
	:rtype: double") Duration;
		double Duration ();

		/****************** FrameSize ******************/
		%feature("compactdefaultargs") FrameSize;
		%feature("autodoc", "* Return front frame dimensions.
	:rtype: Graphic3d_Vec2i") FrameSize;
		Graphic3d_Vec2i FrameSize ();

		/****************** Graphic3d_MediaTextureSet ******************/
		%feature("compactdefaultargs") Graphic3d_MediaTextureSet;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") Graphic3d_MediaTextureSet;
		 Graphic3d_MediaTextureSet ();

		/****************** Input ******************/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "* Return input media.
	:rtype: TCollection_AsciiString") Input;
		const TCollection_AsciiString & Input ();

		/****************** IsFullRangeYUV ******************/
		%feature("compactdefaultargs") IsFullRangeYUV;
		%feature("autodoc", "* Return True if YUV range is full.
	:rtype: bool") IsFullRangeYUV;
		Standard_Boolean IsFullRangeYUV ();

		/****************** IsPlanarYUV ******************/
		%feature("compactdefaultargs") IsPlanarYUV;
		%feature("autodoc", "* Return True if texture set defined 3 YUV planes.
	:rtype: bool") IsPlanarYUV;
		Standard_Boolean IsPlanarYUV ();

		/****************** Notify ******************/
		%feature("compactdefaultargs") Notify;
		%feature("autodoc", "* Call callback.
	:rtype: None") Notify;
		void Notify ();

		/****************** OpenInput ******************/
		%feature("compactdefaultargs") OpenInput;
		%feature("autodoc", "* Open specified file. Passing an empty path would close current input.
	:param thePath:
	:type thePath: TCollection_AsciiString
	:param theToWait:
	:type theToWait: bool
	:rtype: None") OpenInput;
		void OpenInput (const TCollection_AsciiString & thePath,Standard_Boolean theToWait);

		/****************** PlayerContext ******************/
		%feature("compactdefaultargs") PlayerContext;
		%feature("autodoc", "* Return player context; it can be NULL until first OpenInput().
	:rtype: opencascade::handle<Media_PlayerContext>") PlayerContext;
		const opencascade::handle<Media_PlayerContext> & PlayerContext ();

		/****************** Progress ******************/
		%feature("compactdefaultargs") Progress;
		%feature("autodoc", "* Return playback progress in seconds.
	:rtype: double") Progress;
		double Progress ();

		/****************** ShaderProgram ******************/
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "* Return shader program for displaying texture set.
	:rtype: opencascade::handle<Graphic3d_ShaderProgram>") ShaderProgram;
		opencascade::handle<Graphic3d_ShaderProgram> ShaderProgram ();

		/****************** SwapFrames ******************/
		%feature("compactdefaultargs") SwapFrames;
		%feature("autodoc", "* Swap front/back frames.
	:rtype: bool") SwapFrames;
		Standard_Boolean SwapFrames ();

};


%make_alias(Graphic3d_MediaTextureSet)

%extend Graphic3d_MediaTextureSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Graphic3d_TextureEnv *
*****************************/
class Graphic3d_TextureEnv : public Graphic3d_TextureRoot {
	public:
		/****************** Graphic3d_TextureEnv ******************/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "* Creates an environment texture from a file.
	:param theFileName:
	:type theFileName: TCollection_AsciiString
	:rtype: None") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_TextureEnv ******************/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "* Creates an environment texture from a predefined texture name set.
	:param theName:
	:type theName: Graphic3d_NameOfTextureEnv
	:rtype: None") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const Graphic3d_NameOfTextureEnv theName);

		/****************** Graphic3d_TextureEnv ******************/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "* Creates an environment texture from the pixmap.
	:param thePixMap:
	:type thePixMap: Image_PixMap
	:rtype: None") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv (const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of the predefined textures or NOT_ENV_UNKNOWN when the name is given as a filename.
	:rtype: Graphic3d_NameOfTextureEnv") Name;
		Graphic3d_NameOfTextureEnv Name ();

		/****************** NumberOfTextures ******************/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "* Returns the number of predefined textures.
	:rtype: int") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();

		/****************** TextureName ******************/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "* Returns the name of the predefined texture of rank <aRank>
	:param theRank:
	:type theRank: int
	:rtype: TCollection_AsciiString") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);

};


%make_alias(Graphic3d_TextureEnv)

%extend Graphic3d_TextureEnv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Graphic3d_TextureMap *
*****************************/
%nodefaultctor Graphic3d_TextureMap;
class Graphic3d_TextureMap : public Graphic3d_TextureRoot {
	public:
		/****************** AnisoFilter ******************/
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "* returns level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.
	:rtype: Graphic3d_LevelOfTextureAnisotropy") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter ();

		/****************** DisableModulate ******************/
		%feature("compactdefaultargs") DisableModulate;
		%feature("autodoc", "* disable texture modulate mode. the image is directly decal on the surface.
	:rtype: None") DisableModulate;
		void DisableModulate ();

		/****************** DisableRepeat ******************/
		%feature("compactdefaultargs") DisableRepeat;
		%feature("autodoc", "* use this methods if you want to disable texture repetition on your objects.
	:rtype: None") DisableRepeat;
		void DisableRepeat ();

		/****************** DisableSmooth ******************/
		%feature("compactdefaultargs") DisableSmooth;
		%feature("autodoc", "* disable texture smoothing
	:rtype: None") DisableSmooth;
		void DisableSmooth ();

		/****************** EnableModulate ******************/
		%feature("compactdefaultargs") EnableModulate;
		%feature("autodoc", "* enable texture modulate mode. the image is modulate with the shading of the surface.
	:rtype: None") EnableModulate;
		void EnableModulate ();

		/****************** EnableRepeat ******************/
		%feature("compactdefaultargs") EnableRepeat;
		%feature("autodoc", "* use this methods if you want to enable texture repetition on your objects.
	:rtype: None") EnableRepeat;
		void EnableRepeat ();

		/****************** EnableSmooth ******************/
		%feature("compactdefaultargs") EnableSmooth;
		%feature("autodoc", "* enable texture smoothing
	:rtype: None") EnableSmooth;
		void EnableSmooth ();

		/****************** IsModulate ******************/
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "* Returns True if the texture is modulate.
	:rtype: bool") IsModulate;
		Standard_Boolean IsModulate ();

		/****************** IsRepeat ******************/
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "* Returns True if the texture repeat is enable.
	:rtype: bool") IsRepeat;
		Standard_Boolean IsRepeat ();

		/****************** IsSmoothed ******************/
		%feature("compactdefaultargs") IsSmoothed;
		%feature("autodoc", "* Returns True if the texture is smoothed.
	:rtype: bool") IsSmoothed;
		Standard_Boolean IsSmoothed ();

		/****************** SetAnisoFilter ******************/
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "* @param theLevel level of anisontropy texture filter.
	:param theLevel:
	:type theLevel: Graphic3d_LevelOfTextureAnisotropy
	:rtype: None") SetAnisoFilter;
		void SetAnisoFilter (const Graphic3d_LevelOfTextureAnisotropy theLevel);

};


%make_alias(Graphic3d_TextureMap)

%extend Graphic3d_TextureMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_UniformValue *
*******************************/
/**************************
* class Graphic3d_CubeMap *
**************************/
%nodefaultctor Graphic3d_CubeMap;
class Graphic3d_CubeMap : public Graphic3d_TextureMap {
	public:
		/****************** CurrentSide ******************/
		%feature("compactdefaultargs") CurrentSide;
		%feature("autodoc", "* Returns current cubemap side (iterator state).
	:rtype: Graphic3d_CubeMapSide") CurrentSide;
		Graphic3d_CubeMapSide CurrentSide ();

		/****************** IsTopDown ******************/
		%feature("compactdefaultargs") IsTopDown;
		%feature("autodoc", "* Returns whether row's memory layout is top-down.
	:rtype: bool") IsTopDown;
		Standard_Boolean IsTopDown ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns whether the iterator has reached the end (true if it hasn't).
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Moves iterator to the next cubemap side. Uses OpenGL cubemap sides order +X -> -X -> +Y -> -Y -> +Z -> -Z.
	:rtype: None") Next;
		void Next ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Sets iterator state to +X cubemap side.
	:rtype: Graphic3d_CubeMap") Reset;
		Graphic3d_CubeMap & Reset ();

		/****************** SetZInversion ******************/
		%feature("compactdefaultargs") SetZInversion;
		%feature("autodoc", "* Sets Z axis inversion (vertical flipping).
	:param theZIsInverted:
	:type theZIsInverted: bool
	:rtype: None") SetZInversion;
		void SetZInversion (Standard_Boolean theZIsInverted);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns PixMap containing current side of cubemap. Returns null handle if current side is invalid.
	:rtype: opencascade::handle<Image_PixMap>") Value;
		opencascade::handle<Image_PixMap> Value ();

		/****************** ZIsInverted ******************/
		%feature("compactdefaultargs") ZIsInverted;
		%feature("autodoc", "* Returns whether Z axis is inverted.
	:rtype: bool") ZIsInverted;
		Standard_Boolean ZIsInverted ();

};


%make_alias(Graphic3d_CubeMap)

%extend Graphic3d_CubeMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Graphic3d_MutableIndexBuffer *
*************************************/
class Graphic3d_MutableIndexBuffer : public Graphic3d_IndexBuffer {
	public:
		/****************** Graphic3d_MutableIndexBuffer ******************/
		%feature("compactdefaultargs") Graphic3d_MutableIndexBuffer;
		%feature("autodoc", "* Empty constructor.
	:param theAlloc:
	:type theAlloc: NCollection_BaseAllocator
	:rtype: None") Graphic3d_MutableIndexBuffer;
		 Graphic3d_MutableIndexBuffer (const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidate the entire buffer data.
	:rtype: None") Invalidate;
		void Invalidate ();

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "* Invalidate the given indexes (starting from 0)
	:param theIndexLower:
	:type theIndexLower: int
	:param theIndexUpper:
	:type theIndexUpper: int
	:rtype: None") Invalidate;
		void Invalidate (Standard_Integer theIndexLower,Standard_Integer theIndexUpper);

		/****************** InvalidatedRange ******************/
		%feature("compactdefaultargs") InvalidatedRange;
		%feature("autodoc", "* Return invalidated range.
	:rtype: Graphic3d_BufferRange") InvalidatedRange;
		Graphic3d_BufferRange InvalidatedRange ();

		/****************** IsMutable ******************/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "* Return True if data can be invalidated.
	:rtype: bool") IsMutable;
		Standard_Boolean IsMutable ();

		/****************** Validate ******************/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "* Reset invalidated range.
	:rtype: None") Validate;
		void Validate ();

		/****************** invalidate ******************/
		%feature("compactdefaultargs") invalidate;
		%feature("autodoc", "* Invalidate specified sub-range of data (as byte offsets).
	:param theRange:
	:type theRange: Graphic3d_BufferRange
	:rtype: None") invalidate;
		void invalidate (const Graphic3d_BufferRange & theRange);

};


%extend Graphic3d_MutableIndexBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Graphic3d_Texture1D *
****************************/
%nodefaultctor Graphic3d_Texture1D;
class Graphic3d_Texture1D : public Graphic3d_TextureMap {
	public:
		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of the predefined textures or NOT_1D_UNKNOWN when the name is given as a filename.
	:rtype: Graphic3d_NameOfTexture1D") Name;
		Graphic3d_NameOfTexture1D Name ();

		/****************** NumberOfTextures ******************/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "* Returns the number of predefined textures.
	:rtype: int") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();

		/****************** TextureName ******************/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "* Returns the name of the predefined texture of rank <aRank>
	:param aRank:
	:type aRank: int
	:rtype: TCollection_AsciiString") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer aRank);

};


%make_alias(Graphic3d_Texture1D)

%extend Graphic3d_Texture1D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Graphic3d_Texture2D *
****************************/
%nodefaultctor Graphic3d_Texture2D;
class Graphic3d_Texture2D : public Graphic3d_TextureMap {
	public:
		/****************** HasMipMaps ******************/
		%feature("compactdefaultargs") HasMipMaps;
		%feature("autodoc", "* Return true if mip-maps should be used.
	:rtype: bool") HasMipMaps;
		Standard_Boolean HasMipMaps ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of the predefined textures or NOT_2D_UNKNOWN when the name is given as a filename.
	:rtype: Graphic3d_NameOfTexture2D") Name;
		Graphic3d_NameOfTexture2D Name ();

		/****************** NumberOfTextures ******************/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "* Returns the number of predefined textures.
	:rtype: int") NumberOfTextures;
		static Standard_Integer NumberOfTextures ();

		/****************** SetImage ******************/
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "* Assign new image to the texture. Note that this method does not invalidate already uploaded resources - consider calling ::UpdateRevision() if needed.
	:param thePixMap:
	:type thePixMap: Image_PixMap
	:rtype: None") SetImage;
		void SetImage (const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** SetMipMaps ******************/
		%feature("compactdefaultargs") SetMipMaps;
		%feature("autodoc", "* Set if mip-maps should be used (generated if needed). Note that this method should be called before loading / using the texture.
	:param theToUse:
	:type theToUse: bool
	:rtype: None") SetMipMaps;
		void SetMipMaps (const Standard_Boolean theToUse);

		/****************** TextureName ******************/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "* Returns the name of the predefined texture of rank <aRank>
	:param theRank:
	:type theRank: int
	:rtype: TCollection_AsciiString") TextureName;
		static TCollection_AsciiString TextureName (const Standard_Integer theRank);

};


%make_alias(Graphic3d_Texture2D)

%extend Graphic3d_Texture2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Graphic3d_CubeMapPacked *
********************************/
/**********************************
* class Graphic3d_CubeMapSeparate *
**********************************/
class Graphic3d_CubeMapSeparate : public Graphic3d_CubeMap {
	public:
		/****************** GetImage ******************/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "* Returns NULL.
	:rtype: opencascade::handle<Image_PixMap>") GetImage;
		opencascade::handle<Image_PixMap> GetImage ();

		/****************** Graphic3d_CubeMapSeparate ******************/
		%feature("compactdefaultargs") Graphic3d_CubeMapSeparate;
		%feature("autodoc", "* Initializes cubemap to be loaded from file. @thePaths - array of paths to separate image files (has to have size equal 6).
	:param thePaths:
	:type thePaths: NCollection_Array1<TCollection_AsciiString>
	:rtype: None") Graphic3d_CubeMapSeparate;
		 Graphic3d_CubeMapSeparate (const NCollection_Array1<TCollection_AsciiString> & thePaths);

		/****************** Graphic3d_CubeMapSeparate ******************/
		%feature("compactdefaultargs") Graphic3d_CubeMapSeparate;
		%feature("autodoc", "* Initializes cubemap to be setted directly from PixMaps. @theImages - array if PixMaps (has to have size equal 6).
	:param theImages:
	:type theImages: Image_PixMap
	:rtype: None") Graphic3d_CubeMapSeparate;
		 Graphic3d_CubeMapSeparate (const NCollection_Array1<opencascade::handle<Image_PixMap> > & theImages);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Checks if a texture class is valid or not. Returns true if the construction of the class is correct.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns current side of cubemap as PixMap. Returns null handle if current side or whole cubemap is invalid. All origin images have to have the same sizes, format and quad shapes to form valid cubemap.
	:rtype: opencascade::handle<Image_PixMap>") Value;
		opencascade::handle<Image_PixMap> Value ();

};


%make_alias(Graphic3d_CubeMapSeparate)

%extend Graphic3d_CubeMapSeparate {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Graphic3d_MediaTexture *
*******************************/
class Graphic3d_MediaTexture : public Graphic3d_Texture2D {
	public:
		/****************** Frame ******************/
		%feature("compactdefaultargs") Frame;
		%feature("autodoc", "* Return the frame.
	:rtype: opencascade::handle<Media_Frame>") Frame;
		const opencascade::handle<Media_Frame> & Frame ();

		/****************** GenerateNewId ******************/
		%feature("compactdefaultargs") GenerateNewId;
		%feature("autodoc", "* Regenerate a new texture id
	:rtype: None") GenerateNewId;
		void GenerateNewId ();

		/****************** GetImage ******************/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "* Image reader.
	:rtype: opencascade::handle<Image_PixMap>") GetImage;
		virtual opencascade::handle<Image_PixMap> GetImage ();

		/****************** Graphic3d_MediaTexture ******************/
		%feature("compactdefaultargs") Graphic3d_MediaTexture;
		%feature("autodoc", "* Main constructor.
	:param theMutex:
	:type theMutex: Media_HMutex
	:param thePlane: default value is -1
	:type thePlane: int
	:rtype: None") Graphic3d_MediaTexture;
		 Graphic3d_MediaTexture (const opencascade::handle<Media_HMutex> & theMutex,Standard_Integer thePlane = -1);

		/****************** SetFrame ******************/
		%feature("compactdefaultargs") SetFrame;
		%feature("autodoc", "* Set the frame.
	:param theFrame:
	:type theFrame: Media_Frame
	:rtype: None") SetFrame;
		void SetFrame (const opencascade::handle<Media_Frame> & theFrame);

};


%make_alias(Graphic3d_MediaTexture)

%extend Graphic3d_MediaTexture {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Graphic3d_Texture1Dmanual *
**********************************/
class Graphic3d_Texture1Dmanual : public Graphic3d_Texture1D {
	public:
		/****************** Graphic3d_Texture1Dmanual ******************/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "* Creates a texture from the file FileName.
	:param theFileName:
	:type theFileName: TCollection_AsciiString
	:rtype: None") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture1Dmanual ******************/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "* Create a texture from a predefined texture name set.
	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const Graphic3d_NameOfTexture1D theNOT);

		/****************** Graphic3d_Texture1Dmanual ******************/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "* Creates a texture from the pixmap.
	:param thePixMap:
	:type thePixMap: Image_PixMap
	:rtype: None") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual (const opencascade::handle<Image_PixMap> & thePixMap);

};


%make_alias(Graphic3d_Texture1Dmanual)

%extend Graphic3d_Texture1Dmanual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Graphic3d_Texture1Dsegment *
***********************************/
class Graphic3d_Texture1Dsegment : public Graphic3d_Texture1D {
	public:
		/****************** Graphic3d_Texture1Dsegment ******************/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "* Creates a texture from a file
	:param theFileName:
	:type theFileName: TCollection_AsciiString
	:rtype: None") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture1Dsegment ******************/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "* Creates a texture from a predefined texture name set.
	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture1D
	:rtype: None") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const Graphic3d_NameOfTexture1D theNOT);

		/****************** Graphic3d_Texture1Dsegment ******************/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "* Creates a texture from the pixmap.
	:param thePixMap:
	:type thePixMap: Image_PixMap
	:rtype: None") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment (const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns the values of the current segment X1, Y1, Z1 , X2, Y2, Z2.
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
	:rtype: None") Segment;
		void Segment (Standard_ShortReal & theX1,Standard_ShortReal & theY1,Standard_ShortReal & theZ1,Standard_ShortReal & theX2,Standard_ShortReal & theY2,Standard_ShortReal & theZ2);

		/****************** SetSegment ******************/
		%feature("compactdefaultargs") SetSegment;
		%feature("autodoc", "* Sets the texture application bounds. Defines the way the texture is stretched across facets. Default values are <0.0, 0.0, 0.0> , <0.0, 0.0, 1.0>
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
	:rtype: None") SetSegment;
		void SetSegment (const Standard_ShortReal theX1,const Standard_ShortReal theY1,const Standard_ShortReal theZ1,const Standard_ShortReal theX2,const Standard_ShortReal theY2,const Standard_ShortReal theZ2);

};


%make_alias(Graphic3d_Texture1Dsegment)

%extend Graphic3d_Texture1Dsegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Graphic3d_Texture2Dmanual *
**********************************/
class Graphic3d_Texture2Dmanual : public Graphic3d_Texture2D {
	public:
		/****************** Graphic3d_Texture2Dmanual ******************/
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "* Creates a texture from a file. MipMaps levels will be automatically generated if needed.
	:param theFileName:
	:type theFileName: TCollection_AsciiString
	:rtype: None") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture2Dmanual ******************/
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "* Creates a texture from a predefined texture name set. MipMaps levels will be automatically generated if needed.
	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const Graphic3d_NameOfTexture2D theNOT);

		/****************** Graphic3d_Texture2Dmanual ******************/
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "* Creates a texture from the pixmap. MipMaps levels will be automatically generated if needed.
	:param thePixMap:
	:type thePixMap: Image_PixMap
	:rtype: None") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual (const opencascade::handle<Image_PixMap> & thePixMap);

};


%make_alias(Graphic3d_Texture2Dmanual)

%extend Graphic3d_Texture2Dmanual {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Graphic3d_Texture2Dplane *
*********************************/
class Graphic3d_Texture2Dplane : public Graphic3d_Texture2D {
	public:
		/****************** Graphic3d_Texture2Dplane ******************/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "* Creates a texture from a file
	:param theFileName:
	:type theFileName: TCollection_AsciiString
	:rtype: None") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture2Dplane ******************/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "* Creates a texture from a predefined texture name set.
	:param theNOT:
	:type theNOT: Graphic3d_NameOfTexture2D
	:rtype: None") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const Graphic3d_NameOfTexture2D theNOT);

		/****************** Graphic3d_Texture2Dplane ******************/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "* Creates a texture from the pixmap.
	:param thePixMap:
	:type thePixMap: Image_PixMap
	:rtype: None") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane (const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "* Returns the current texture plane name or NOTP_UNKNOWN when the plane is user defined.
	:rtype: Graphic3d_NameOfTexturePlane") Plane;
		Graphic3d_NameOfTexturePlane Plane ();

		/****************** PlaneS ******************/
		%feature("compactdefaultargs") PlaneS;
		%feature("autodoc", "* Returns the current texture plane S equation
	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None") PlaneS;
		void PlaneS (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);

		/****************** PlaneT ******************/
		%feature("compactdefaultargs") PlaneT;
		%feature("autodoc", "* Returns the current texture plane T equation
	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None") PlaneT;
		void PlaneT (Standard_ShortReal & A,Standard_ShortReal & B,Standard_ShortReal & C,Standard_ShortReal & D);

		/****************** Rotation ******************/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "* Returns the current texture rotation angle
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") Rotation;
		void Rotation (Standard_ShortReal & theVal);

		/****************** ScaleS ******************/
		%feature("compactdefaultargs") ScaleS;
		%feature("autodoc", "* Returns the current texture S scale value
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") ScaleS;
		void ScaleS (Standard_ShortReal & theVal);

		/****************** ScaleT ******************/
		%feature("compactdefaultargs") ScaleT;
		%feature("autodoc", "* Returns the current texture T scale value
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") ScaleT;
		void ScaleT (Standard_ShortReal & theVal);

		/****************** SetPlane ******************/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "* Defines the texture projection plane for both S and T texture coordinate default is NOTP_XY meaning: <1.0, 0.0, 0.0, 0.0> for S and <0.0, 1.0, 0.0, 0.0> for T
	:param thePlane:
	:type thePlane: Graphic3d_NameOfTexturePlane
	:rtype: None") SetPlane;
		void SetPlane (const Graphic3d_NameOfTexturePlane thePlane);

		/****************** SetPlaneS ******************/
		%feature("compactdefaultargs") SetPlaneS;
		%feature("autodoc", "* Defines the texture projection plane for texture coordinate S default is <1.0, 0.0, 0.0, 0.0>
	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None") SetPlaneS;
		void SetPlaneS (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);

		/****************** SetPlaneT ******************/
		%feature("compactdefaultargs") SetPlaneT;
		%feature("autodoc", "* Defines the texture projection plane for texture coordinate T default is <0.0, 1.0, 0.0, 0.0>
	:param A:
	:type A: Standard_ShortReal
	:param B:
	:type B: Standard_ShortReal
	:param C:
	:type C: Standard_ShortReal
	:param D:
	:type D: Standard_ShortReal
	:rtype: None") SetPlaneT;
		void SetPlaneT (const Standard_ShortReal A,const Standard_ShortReal B,const Standard_ShortReal C,const Standard_ShortReal D);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "* Sets the rotation angle of the whole texture. the same result might be achieved by recomputing the S and T plane equation but it's not the easiest way... the angle is expressed in degrees default is 0.0
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") SetRotation;
		void SetRotation (const Standard_ShortReal theVal);

		/****************** SetScaleS ******************/
		%feature("compactdefaultargs") SetScaleS;
		%feature("autodoc", "* Defines the texture scale for the S texture coordinate much easier than recomputing the S plane equation but the result is the same default to 1.0
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") SetScaleS;
		void SetScaleS (const Standard_ShortReal theVal);

		/****************** SetScaleT ******************/
		%feature("compactdefaultargs") SetScaleT;
		%feature("autodoc", "* Defines the texture scale for the T texture coordinate much easier than recompution the T plane equation but the result is the same default to 1.0
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") SetScaleT;
		void SetScaleT (const Standard_ShortReal theVal);

		/****************** SetTranslateS ******************/
		%feature("compactdefaultargs") SetTranslateS;
		%feature("autodoc", "* Defines the texture translation for the S texture coordinate you can obtain the same effect by modifying the S plane equation but its not easier. default to 0.0
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") SetTranslateS;
		void SetTranslateS (const Standard_ShortReal theVal);

		/****************** SetTranslateT ******************/
		%feature("compactdefaultargs") SetTranslateT;
		%feature("autodoc", "* Defines the texture translation for the T texture coordinate you can obtain the same effect by modifying the T plane equation but its not easier. default to 0.0
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") SetTranslateT;
		void SetTranslateT (const Standard_ShortReal theVal);

		/****************** TranslateS ******************/
		%feature("compactdefaultargs") TranslateS;
		%feature("autodoc", "* Returns the current texture S translation value
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") TranslateS;
		void TranslateS (Standard_ShortReal & theVal);

		/****************** TranslateT ******************/
		%feature("compactdefaultargs") TranslateT;
		%feature("autodoc", "* Returns the current texture T translation value
	:param theVal:
	:type theVal: Standard_ShortReal
	:rtype: None") TranslateT;
		void TranslateT (Standard_ShortReal & theVal);

};


%make_alias(Graphic3d_Texture2Dplane)

%extend Graphic3d_Texture2Dplane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
