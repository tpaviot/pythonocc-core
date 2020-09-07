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
#include<Media_module.hxx>
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
%import Media.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};


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

/* python proy classes for enums */
%pythoncode {

class Graphic3d_ClipState(IntEnum):
	Graphic3d_ClipState_Out = 0
	Graphic3d_ClipState_In = 1
	Graphic3d_ClipState_On = 2
Graphic3d_ClipState_Out = Graphic3d_ClipState.Graphic3d_ClipState_Out
Graphic3d_ClipState_In = Graphic3d_ClipState.Graphic3d_ClipState_In
Graphic3d_ClipState_On = Graphic3d_ClipState.Graphic3d_ClipState_On

class Graphic3d_BufferType(IntEnum):
	Graphic3d_BT_RGB = 0
	Graphic3d_BT_RGBA = 1
	Graphic3d_BT_Depth = 2
	Graphic3d_BT_RGB_RayTraceHdrLeft = 3
Graphic3d_BT_RGB = Graphic3d_BufferType.Graphic3d_BT_RGB
Graphic3d_BT_RGBA = Graphic3d_BufferType.Graphic3d_BT_RGBA
Graphic3d_BT_Depth = Graphic3d_BufferType.Graphic3d_BT_Depth
Graphic3d_BT_RGB_RayTraceHdrLeft = Graphic3d_BufferType.Graphic3d_BT_RGB_RayTraceHdrLeft

class Graphic3d_FrameStatsTimer(IntEnum):
	Graphic3d_FrameStatsTimer_ElapsedFrame = 0
	Graphic3d_FrameStatsTimer_CpuFrame = 1
	Graphic3d_FrameStatsTimer_CpuCulling = 2
	Graphic3d_FrameStatsTimer_CpuPicking = 3
	Graphic3d_FrameStatsTimer_CpuDynamics = 4
Graphic3d_FrameStatsTimer_ElapsedFrame = Graphic3d_FrameStatsTimer.Graphic3d_FrameStatsTimer_ElapsedFrame
Graphic3d_FrameStatsTimer_CpuFrame = Graphic3d_FrameStatsTimer.Graphic3d_FrameStatsTimer_CpuFrame
Graphic3d_FrameStatsTimer_CpuCulling = Graphic3d_FrameStatsTimer.Graphic3d_FrameStatsTimer_CpuCulling
Graphic3d_FrameStatsTimer_CpuPicking = Graphic3d_FrameStatsTimer.Graphic3d_FrameStatsTimer_CpuPicking
Graphic3d_FrameStatsTimer_CpuDynamics = Graphic3d_FrameStatsTimer.Graphic3d_FrameStatsTimer_CpuDynamics

class Graphic3d_VerticalTextAlignment(IntEnum):
	Graphic3d_VTA_BOTTOM = 0
	Graphic3d_VTA_CENTER = 1
	Graphic3d_VTA_TOP = 2
	Graphic3d_VTA_TOPFIRSTLINE = 3
Graphic3d_VTA_BOTTOM = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_BOTTOM
Graphic3d_VTA_CENTER = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_CENTER
Graphic3d_VTA_TOP = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_TOP
Graphic3d_VTA_TOPFIRSTLINE = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_TOPFIRSTLINE

class Graphic3d_LevelOfTextureAnisotropy(IntEnum):
	Graphic3d_LOTA_OFF = 0
	Graphic3d_LOTA_FAST = 1
	Graphic3d_LOTA_MIDDLE = 2
	Graphic3d_LOTA_QUALITY = 3
Graphic3d_LOTA_OFF = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_OFF
Graphic3d_LOTA_FAST = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_FAST
Graphic3d_LOTA_MIDDLE = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_MIDDLE
Graphic3d_LOTA_QUALITY = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_QUALITY

class Graphic3d_TypeOfLimit(IntEnum):
	Graphic3d_TypeOfLimit_MaxNbLights = 0
	Graphic3d_TypeOfLimit_MaxNbClipPlanes = 1
	Graphic3d_TypeOfLimit_MaxNbViews = 2
	Graphic3d_TypeOfLimit_MaxTextureSize = 3
	Graphic3d_TypeOfLimit_MaxViewDumpSizeX = 4
	Graphic3d_TypeOfLimit_MaxViewDumpSizeY = 5
	Graphic3d_TypeOfLimit_MaxCombinedTextureUnits = 6
	Graphic3d_TypeOfLimit_MaxMsaa = 7
	Graphic3d_TypeOfLimit_HasRayTracing = 8
	Graphic3d_TypeOfLimit_HasRayTracingTextures = 9
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling = 10
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic = 11
	Graphic3d_TypeOfLimit_HasBlendedOit = 12
	Graphic3d_TypeOfLimit_HasBlendedOitMsaa = 13
	Graphic3d_TypeOfLimit_HasFlatShading = 14
	Graphic3d_TypeOfLimit_HasMeshEdges = 15
	Graphic3d_TypeOfLimit_IsWorkaroundFBO = 16
	Graphic3d_TypeOfLimit_NB = 17
Graphic3d_TypeOfLimit_MaxNbLights = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxNbLights
Graphic3d_TypeOfLimit_MaxNbClipPlanes = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxNbClipPlanes
Graphic3d_TypeOfLimit_MaxNbViews = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxNbViews
Graphic3d_TypeOfLimit_MaxTextureSize = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxTextureSize
Graphic3d_TypeOfLimit_MaxViewDumpSizeX = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxViewDumpSizeX
Graphic3d_TypeOfLimit_MaxViewDumpSizeY = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxViewDumpSizeY
Graphic3d_TypeOfLimit_MaxCombinedTextureUnits = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxCombinedTextureUnits
Graphic3d_TypeOfLimit_MaxMsaa = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxMsaa
Graphic3d_TypeOfLimit_HasRayTracing = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracing
Graphic3d_TypeOfLimit_HasRayTracingTextures = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracingTextures
Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling
Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic
Graphic3d_TypeOfLimit_HasBlendedOit = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasBlendedOit
Graphic3d_TypeOfLimit_HasBlendedOitMsaa = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasBlendedOitMsaa
Graphic3d_TypeOfLimit_HasFlatShading = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasFlatShading
Graphic3d_TypeOfLimit_HasMeshEdges = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasMeshEdges
Graphic3d_TypeOfLimit_IsWorkaroundFBO = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_IsWorkaroundFBO
Graphic3d_TypeOfLimit_NB = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_NB

class Graphic3d_DiagnosticInfo(IntEnum):
	Graphic3d_DiagnosticInfo_Device = 1
	Graphic3d_DiagnosticInfo_FrameBuffer = 2
	Graphic3d_DiagnosticInfo_Limits = 4
	Graphic3d_DiagnosticInfo_Memory = 8
	Graphic3d_DiagnosticInfo_NativePlatform = 16
	Graphic3d_DiagnosticInfo_Extensions = 32
	Graphic3d_DiagnosticInfo_Short = Graphic3d_DiagnosticInfo_Device | Graphic3d_DiagnosticInfo_FrameBuffer | Graphic3d_DiagnosticInfo_Limits
	Graphic3d_DiagnosticInfo_Basic = Graphic3d_DiagnosticInfo_Short | Graphic3d_DiagnosticInfo_NativePlatform | Graphic3d_DiagnosticInfo_Memory
	Graphic3d_DiagnosticInfo_Complete = Graphic3d_DiagnosticInfo_Basic | Graphic3d_DiagnosticInfo_Extensions
Graphic3d_DiagnosticInfo_Device = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_Device
Graphic3d_DiagnosticInfo_FrameBuffer = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_FrameBuffer
Graphic3d_DiagnosticInfo_Limits = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_Limits
Graphic3d_DiagnosticInfo_Memory = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_Memory
Graphic3d_DiagnosticInfo_NativePlatform = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_NativePlatform
Graphic3d_DiagnosticInfo_Extensions = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_Extensions
Graphic3d_DiagnosticInfo_Short = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_Short
Graphic3d_DiagnosticInfo_Basic = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_Basic
Graphic3d_DiagnosticInfo_Complete = Graphic3d_DiagnosticInfo.Graphic3d_DiagnosticInfo_Complete

class Graphic3d_StereoMode(IntEnum):
	Graphic3d_StereoMode_QuadBuffer = 0
	Graphic3d_StereoMode_Anaglyph = 1
	Graphic3d_StereoMode_RowInterlaced = 2
	Graphic3d_StereoMode_ColumnInterlaced = 3
	Graphic3d_StereoMode_ChessBoard = 4
	Graphic3d_StereoMode_SideBySide = 5
	Graphic3d_StereoMode_OverUnder = 6
	Graphic3d_StereoMode_SoftPageFlip = 7
	Graphic3d_StereoMode_NB = 8
Graphic3d_StereoMode_QuadBuffer = Graphic3d_StereoMode.Graphic3d_StereoMode_QuadBuffer
Graphic3d_StereoMode_Anaglyph = Graphic3d_StereoMode.Graphic3d_StereoMode_Anaglyph
Graphic3d_StereoMode_RowInterlaced = Graphic3d_StereoMode.Graphic3d_StereoMode_RowInterlaced
Graphic3d_StereoMode_ColumnInterlaced = Graphic3d_StereoMode.Graphic3d_StereoMode_ColumnInterlaced
Graphic3d_StereoMode_ChessBoard = Graphic3d_StereoMode.Graphic3d_StereoMode_ChessBoard
Graphic3d_StereoMode_SideBySide = Graphic3d_StereoMode.Graphic3d_StereoMode_SideBySide
Graphic3d_StereoMode_OverUnder = Graphic3d_StereoMode.Graphic3d_StereoMode_OverUnder
Graphic3d_StereoMode_SoftPageFlip = Graphic3d_StereoMode.Graphic3d_StereoMode_SoftPageFlip
Graphic3d_StereoMode_NB = Graphic3d_StereoMode.Graphic3d_StereoMode_NB

class Graphic3d_AlphaMode(IntEnum):
	Graphic3d_AlphaMode_Opaque = 0
	Graphic3d_AlphaMode_Mask = 1
	Graphic3d_AlphaMode_Blend = 2
	Graphic3d_AlphaMode_BlendAuto = - 1
Graphic3d_AlphaMode_Opaque = Graphic3d_AlphaMode.Graphic3d_AlphaMode_Opaque
Graphic3d_AlphaMode_Mask = Graphic3d_AlphaMode.Graphic3d_AlphaMode_Mask
Graphic3d_AlphaMode_Blend = Graphic3d_AlphaMode.Graphic3d_AlphaMode_Blend
Graphic3d_AlphaMode_BlendAuto = Graphic3d_AlphaMode.Graphic3d_AlphaMode_BlendAuto

class Graphic3d_FresnelModel(IntEnum):
	Graphic3d_FM_SCHLICK = 0
	Graphic3d_FM_CONSTANT = 1
	Graphic3d_FM_CONDUCTOR = 2
	Graphic3d_FM_DIELECTRIC = 3
Graphic3d_FM_SCHLICK = Graphic3d_FresnelModel.Graphic3d_FM_SCHLICK
Graphic3d_FM_CONSTANT = Graphic3d_FresnelModel.Graphic3d_FM_CONSTANT
Graphic3d_FM_CONDUCTOR = Graphic3d_FresnelModel.Graphic3d_FM_CONDUCTOR
Graphic3d_FM_DIELECTRIC = Graphic3d_FresnelModel.Graphic3d_FM_DIELECTRIC

class Graphic3d_TypeOfReflection(IntEnum):
	Graphic3d_TOR_AMBIENT = 0
	Graphic3d_TOR_DIFFUSE = 1
	Graphic3d_TOR_SPECULAR = 2
	Graphic3d_TOR_EMISSION = 3
Graphic3d_TOR_AMBIENT = Graphic3d_TypeOfReflection.Graphic3d_TOR_AMBIENT
Graphic3d_TOR_DIFFUSE = Graphic3d_TypeOfReflection.Graphic3d_TOR_DIFFUSE
Graphic3d_TOR_SPECULAR = Graphic3d_TypeOfReflection.Graphic3d_TOR_SPECULAR
Graphic3d_TOR_EMISSION = Graphic3d_TypeOfReflection.Graphic3d_TOR_EMISSION

class Graphic3d_RenderTransparentMethod(IntEnum):
	Graphic3d_RTM_BLEND_UNORDERED = 0
	Graphic3d_RTM_BLEND_OIT = 1
Graphic3d_RTM_BLEND_UNORDERED = Graphic3d_RenderTransparentMethod.Graphic3d_RTM_BLEND_UNORDERED
Graphic3d_RTM_BLEND_OIT = Graphic3d_RenderTransparentMethod.Graphic3d_RTM_BLEND_OIT

class Graphic3d_RenderingMode(IntEnum):
	Graphic3d_RM_RASTERIZATION = 0
	Graphic3d_RM_RAYTRACING = 1
Graphic3d_RM_RASTERIZATION = Graphic3d_RenderingMode.Graphic3d_RM_RASTERIZATION
Graphic3d_RM_RAYTRACING = Graphic3d_RenderingMode.Graphic3d_RM_RAYTRACING

class Graphic3d_FrameStatsCounter(IntEnum):
	Graphic3d_FrameStatsCounter_NbLayers = 0
	Graphic3d_FrameStatsCounter_NbLayersNotCulled = 1
	Graphic3d_FrameStatsCounter_NbStructs = 2
	Graphic3d_FrameStatsCounter_NbStructsNotCulled = 3
	Graphic3d_FrameStatsCounter_NbGroupsNotCulled = 4
	Graphic3d_FrameStatsCounter_NbElemsNotCulled = 5
	Graphic3d_FrameStatsCounter_NbElemsFillNotCulled = 6
	Graphic3d_FrameStatsCounter_NbElemsLineNotCulled = 7
	Graphic3d_FrameStatsCounter_NbElemsPointNotCulled = 8
	Graphic3d_FrameStatsCounter_NbElemsTextNotCulled = 9
	Graphic3d_FrameStatsCounter_NbTrianglesNotCulled = 10
	Graphic3d_FrameStatsCounter_NbPointsNotCulled = 11
	Graphic3d_FrameStatsCounter_EstimatedBytesGeom = 12
	Graphic3d_FrameStatsCounter_EstimatedBytesFbos = 13
	Graphic3d_FrameStatsCounter_EstimatedBytesTextures = 14
Graphic3d_FrameStatsCounter_NbLayers = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbLayers
Graphic3d_FrameStatsCounter_NbLayersNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbLayersNotCulled
Graphic3d_FrameStatsCounter_NbStructs = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbStructs
Graphic3d_FrameStatsCounter_NbStructsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbStructsNotCulled
Graphic3d_FrameStatsCounter_NbGroupsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbGroupsNotCulled
Graphic3d_FrameStatsCounter_NbElemsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsNotCulled
Graphic3d_FrameStatsCounter_NbElemsFillNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsFillNotCulled
Graphic3d_FrameStatsCounter_NbElemsLineNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsLineNotCulled
Graphic3d_FrameStatsCounter_NbElemsPointNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsPointNotCulled
Graphic3d_FrameStatsCounter_NbElemsTextNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsTextNotCulled
Graphic3d_FrameStatsCounter_NbTrianglesNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbTrianglesNotCulled
Graphic3d_FrameStatsCounter_NbPointsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbPointsNotCulled
Graphic3d_FrameStatsCounter_EstimatedBytesGeom = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_EstimatedBytesGeom
Graphic3d_FrameStatsCounter_EstimatedBytesFbos = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_EstimatedBytesFbos
Graphic3d_FrameStatsCounter_EstimatedBytesTextures = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_EstimatedBytesTextures

class Graphic3d_TypeOfBackground(IntEnum):
	Graphic3d_TOB_NONE = - 1
	Graphic3d_TOB_GRADIENT = 1
	Graphic3d_TOB_TEXTURE = 2
	Graphic3d_TOB_CUBEMAP = 3
Graphic3d_TOB_NONE = Graphic3d_TypeOfBackground.Graphic3d_TOB_NONE
Graphic3d_TOB_GRADIENT = Graphic3d_TypeOfBackground.Graphic3d_TOB_GRADIENT
Graphic3d_TOB_TEXTURE = Graphic3d_TypeOfBackground.Graphic3d_TOB_TEXTURE
Graphic3d_TOB_CUBEMAP = Graphic3d_TypeOfBackground.Graphic3d_TOB_CUBEMAP

class Graphic3d_TypeOfStructure(IntEnum):
	Graphic3d_TOS_WIREFRAME = 0
	Graphic3d_TOS_SHADING = 1
	Graphic3d_TOS_COMPUTED = 2
	Graphic3d_TOS_ALL = 3
Graphic3d_TOS_WIREFRAME = Graphic3d_TypeOfStructure.Graphic3d_TOS_WIREFRAME
Graphic3d_TOS_SHADING = Graphic3d_TypeOfStructure.Graphic3d_TOS_SHADING
Graphic3d_TOS_COMPUTED = Graphic3d_TypeOfStructure.Graphic3d_TOS_COMPUTED
Graphic3d_TOS_ALL = Graphic3d_TypeOfStructure.Graphic3d_TOS_ALL

class Graphic3d_TypeOfTextureMode(IntEnum):
	Graphic3d_TOTM_OBJECT = 0
	Graphic3d_TOTM_SPHERE = 1
	Graphic3d_TOTM_EYE = 2
	Graphic3d_TOTM_MANUAL = 3
	Graphic3d_TOTM_SPRITE = 4
Graphic3d_TOTM_OBJECT = Graphic3d_TypeOfTextureMode.Graphic3d_TOTM_OBJECT
Graphic3d_TOTM_SPHERE = Graphic3d_TypeOfTextureMode.Graphic3d_TOTM_SPHERE
Graphic3d_TOTM_EYE = Graphic3d_TypeOfTextureMode.Graphic3d_TOTM_EYE
Graphic3d_TOTM_MANUAL = Graphic3d_TypeOfTextureMode.Graphic3d_TOTM_MANUAL
Graphic3d_TOTM_SPRITE = Graphic3d_TypeOfTextureMode.Graphic3d_TOTM_SPRITE

class Graphic3d_TypeOfShaderObject(IntEnum):
	Graphic3d_TOS_VERTEX = 1
	Graphic3d_TOS_TESS_CONTROL = 2
	Graphic3d_TOS_TESS_EVALUATION = 4
	Graphic3d_TOS_GEOMETRY = 8
	Graphic3d_TOS_FRAGMENT = 16
	Graphic3d_TOS_COMPUTE = 32
Graphic3d_TOS_VERTEX = Graphic3d_TypeOfShaderObject.Graphic3d_TOS_VERTEX
Graphic3d_TOS_TESS_CONTROL = Graphic3d_TypeOfShaderObject.Graphic3d_TOS_TESS_CONTROL
Graphic3d_TOS_TESS_EVALUATION = Graphic3d_TypeOfShaderObject.Graphic3d_TOS_TESS_EVALUATION
Graphic3d_TOS_GEOMETRY = Graphic3d_TypeOfShaderObject.Graphic3d_TOS_GEOMETRY
Graphic3d_TOS_FRAGMENT = Graphic3d_TypeOfShaderObject.Graphic3d_TOS_FRAGMENT
Graphic3d_TOS_COMPUTE = Graphic3d_TypeOfShaderObject.Graphic3d_TOS_COMPUTE

class Graphic3d_ZLayerSetting(IntEnum):
	Graphic3d_ZLayerDepthTest = 1
	Graphic3d_ZLayerDepthWrite = 2
	Graphic3d_ZLayerDepthClear = 4
	Graphic3d_ZLayerDepthOffset = 8
Graphic3d_ZLayerDepthTest = Graphic3d_ZLayerSetting.Graphic3d_ZLayerDepthTest
Graphic3d_ZLayerDepthWrite = Graphic3d_ZLayerSetting.Graphic3d_ZLayerDepthWrite
Graphic3d_ZLayerDepthClear = Graphic3d_ZLayerSetting.Graphic3d_ZLayerDepthClear
Graphic3d_ZLayerDepthOffset = Graphic3d_ZLayerSetting.Graphic3d_ZLayerDepthOffset

class Graphic3d_CappingFlags(IntEnum):
	Graphic3d_CappingFlags_None = 0
	Graphic3d_CappingFlags_ObjectMaterial = 1
	Graphic3d_CappingFlags_ObjectTexture = 2
	Graphic3d_CappingFlags_ObjectShader = 8
	Graphic3d_CappingFlags_ObjectAspect = Graphic3d_CappingFlags_ObjectMaterial | Graphic3d_CappingFlags_ObjectTexture | Graphic3d_CappingFlags_ObjectShader
Graphic3d_CappingFlags_None = Graphic3d_CappingFlags.Graphic3d_CappingFlags_None
Graphic3d_CappingFlags_ObjectMaterial = Graphic3d_CappingFlags.Graphic3d_CappingFlags_ObjectMaterial
Graphic3d_CappingFlags_ObjectTexture = Graphic3d_CappingFlags.Graphic3d_CappingFlags_ObjectTexture
Graphic3d_CappingFlags_ObjectShader = Graphic3d_CappingFlags.Graphic3d_CappingFlags_ObjectShader
Graphic3d_CappingFlags_ObjectAspect = Graphic3d_CappingFlags.Graphic3d_CappingFlags_ObjectAspect

class Graphic3d_NameOfTexturePlane(IntEnum):
	Graphic3d_NOTP_XY = 0
	Graphic3d_NOTP_YZ = 1
	Graphic3d_NOTP_ZX = 2
	Graphic3d_NOTP_UNKNOWN = 3
Graphic3d_NOTP_XY = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_XY
Graphic3d_NOTP_YZ = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_YZ
Graphic3d_NOTP_ZX = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_ZX
Graphic3d_NOTP_UNKNOWN = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_UNKNOWN

class Graphic3d_TypeOfShadingModel(IntEnum):
	Graphic3d_TOSM_DEFAULT = - 1
	Graphic3d_TOSM_UNLIT = 0
	Graphic3d_TOSM_FACET = 1
	Graphic3d_TOSM_VERTEX = 2
	Graphic3d_TOSM_FRAGMENT = 3
	Graphic3d_TOSM_NONE = Graphic3d_TOSM_UNLIT
	V3d_COLOR = Graphic3d_TOSM_NONE
	V3d_FLAT = Graphic3d_TOSM_FACET
	V3d_GOURAUD = Graphic3d_TOSM_VERTEX
	V3d_PHONG = Graphic3d_TOSM_FRAGMENT
Graphic3d_TOSM_DEFAULT = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_DEFAULT
Graphic3d_TOSM_UNLIT = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_UNLIT
Graphic3d_TOSM_FACET = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_FACET
Graphic3d_TOSM_VERTEX = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_VERTEX
Graphic3d_TOSM_FRAGMENT = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_FRAGMENT
Graphic3d_TOSM_NONE = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_NONE
V3d_COLOR = Graphic3d_TypeOfShadingModel.V3d_COLOR
V3d_FLAT = Graphic3d_TypeOfShadingModel.V3d_FLAT
V3d_GOURAUD = Graphic3d_TypeOfShadingModel.V3d_GOURAUD
V3d_PHONG = Graphic3d_TypeOfShadingModel.V3d_PHONG

class Graphic3d_TypeOfPrimitiveArray(IntEnum):
	Graphic3d_TOPA_UNDEFINED = 0
	Graphic3d_TOPA_POINTS = 1
	Graphic3d_TOPA_SEGMENTS = 2
	Graphic3d_TOPA_POLYLINES = 3
	Graphic3d_TOPA_TRIANGLES = 4
	Graphic3d_TOPA_TRIANGLESTRIPS = 5
	Graphic3d_TOPA_TRIANGLEFANS = 6
	Graphic3d_TOPA_LINES_ADJACENCY = 7
	Graphic3d_TOPA_LINE_STRIP_ADJACENCY = 8
	Graphic3d_TOPA_TRIANGLES_ADJACENCY = 9
	Graphic3d_TOPA_TRIANGLE_STRIP_ADJACENCY = 10
	Graphic3d_TOPA_QUADRANGLES = 11
	Graphic3d_TOPA_QUADRANGLESTRIPS = 12
	Graphic3d_TOPA_POLYGONS = 13
Graphic3d_TOPA_UNDEFINED = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_UNDEFINED
Graphic3d_TOPA_POINTS = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_POINTS
Graphic3d_TOPA_SEGMENTS = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_SEGMENTS
Graphic3d_TOPA_POLYLINES = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_POLYLINES
Graphic3d_TOPA_TRIANGLES = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_TRIANGLES
Graphic3d_TOPA_TRIANGLESTRIPS = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_TRIANGLESTRIPS
Graphic3d_TOPA_TRIANGLEFANS = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_TRIANGLEFANS
Graphic3d_TOPA_LINES_ADJACENCY = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_LINES_ADJACENCY
Graphic3d_TOPA_LINE_STRIP_ADJACENCY = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_LINE_STRIP_ADJACENCY
Graphic3d_TOPA_TRIANGLES_ADJACENCY = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_TRIANGLES_ADJACENCY
Graphic3d_TOPA_TRIANGLE_STRIP_ADJACENCY = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_TRIANGLE_STRIP_ADJACENCY
Graphic3d_TOPA_QUADRANGLES = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_QUADRANGLES
Graphic3d_TOPA_QUADRANGLESTRIPS = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_QUADRANGLESTRIPS
Graphic3d_TOPA_POLYGONS = Graphic3d_TypeOfPrimitiveArray.Graphic3d_TOPA_POLYGONS

class Graphic3d_ToneMappingMethod(IntEnum):
	Graphic3d_ToneMappingMethod_Disabled = 0
	Graphic3d_ToneMappingMethod_Filmic = 1
Graphic3d_ToneMappingMethod_Disabled = Graphic3d_ToneMappingMethod.Graphic3d_ToneMappingMethod_Disabled
Graphic3d_ToneMappingMethod_Filmic = Graphic3d_ToneMappingMethod.Graphic3d_ToneMappingMethod_Filmic

class Graphic3d_TypeOfTexture(IntEnum):
	Graphic3d_TOT_1D = 0
	Graphic3d_TOT_2D = 1
	Graphic3d_TOT_2D_MIPMAP = 2
	Graphic3d_TOT_CUBEMAP = 3
Graphic3d_TOT_1D = Graphic3d_TypeOfTexture.Graphic3d_TOT_1D
Graphic3d_TOT_2D = Graphic3d_TypeOfTexture.Graphic3d_TOT_2D
Graphic3d_TOT_2D_MIPMAP = Graphic3d_TypeOfTexture.Graphic3d_TOT_2D_MIPMAP
Graphic3d_TOT_CUBEMAP = Graphic3d_TypeOfTexture.Graphic3d_TOT_CUBEMAP

class Graphic3d_TypeOfMaterial(IntEnum):
	Graphic3d_MATERIAL_ASPECT = 0
	Graphic3d_MATERIAL_PHYSIC = 1
Graphic3d_MATERIAL_ASPECT = Graphic3d_TypeOfMaterial.Graphic3d_MATERIAL_ASPECT
Graphic3d_MATERIAL_PHYSIC = Graphic3d_TypeOfMaterial.Graphic3d_MATERIAL_PHYSIC

class Graphic3d_TypeOfBackfacingModel(IntEnum):
	Graphic3d_TOBM_AUTOMATIC = 0
	Graphic3d_TOBM_FORCE = 1
	Graphic3d_TOBM_DISABLE = 2
Graphic3d_TOBM_AUTOMATIC = Graphic3d_TypeOfBackfacingModel.Graphic3d_TOBM_AUTOMATIC
Graphic3d_TOBM_FORCE = Graphic3d_TypeOfBackfacingModel.Graphic3d_TOBM_FORCE
Graphic3d_TOBM_DISABLE = Graphic3d_TypeOfBackfacingModel.Graphic3d_TOBM_DISABLE

class Graphic3d_HorizontalTextAlignment(IntEnum):
	Graphic3d_HTA_LEFT = 0
	Graphic3d_HTA_CENTER = 1
	Graphic3d_HTA_RIGHT = 2
Graphic3d_HTA_LEFT = Graphic3d_HorizontalTextAlignment.Graphic3d_HTA_LEFT
Graphic3d_HTA_CENTER = Graphic3d_HorizontalTextAlignment.Graphic3d_HTA_CENTER
Graphic3d_HTA_RIGHT = Graphic3d_HorizontalTextAlignment.Graphic3d_HTA_RIGHT

class Graphic3d_TransModeFlags(IntEnum):
	Graphic3d_TMF_None = 0
	Graphic3d_TMF_ZoomPers = 2
	Graphic3d_TMF_RotatePers = 8
	Graphic3d_TMF_TriedronPers = 32
	Graphic3d_TMF_2d = 64
	Graphic3d_TMF_ZoomRotatePers = Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers
Graphic3d_TMF_None = Graphic3d_TransModeFlags.Graphic3d_TMF_None
Graphic3d_TMF_ZoomPers = Graphic3d_TransModeFlags.Graphic3d_TMF_ZoomPers
Graphic3d_TMF_RotatePers = Graphic3d_TransModeFlags.Graphic3d_TMF_RotatePers
Graphic3d_TMF_TriedronPers = Graphic3d_TransModeFlags.Graphic3d_TMF_TriedronPers
Graphic3d_TMF_2d = Graphic3d_TransModeFlags.Graphic3d_TMF_2d
Graphic3d_TMF_ZoomRotatePers = Graphic3d_TransModeFlags.Graphic3d_TMF_ZoomRotatePers

class Graphic3d_TypeOfAnswer(IntEnum):
	Graphic3d_TOA_YES = 0
	Graphic3d_TOA_NO = 1
	Graphic3d_TOA_COMPUTE = 2
Graphic3d_TOA_YES = Graphic3d_TypeOfAnswer.Graphic3d_TOA_YES
Graphic3d_TOA_NO = Graphic3d_TypeOfAnswer.Graphic3d_TOA_NO
Graphic3d_TOA_COMPUTE = Graphic3d_TypeOfAnswer.Graphic3d_TOA_COMPUTE

class Graphic3d_GroupAspect(IntEnum):
	Graphic3d_ASPECT_LINE = 0
	Graphic3d_ASPECT_TEXT = 1
	Graphic3d_ASPECT_MARKER = 2
	Graphic3d_ASPECT_FILL_AREA = 3
Graphic3d_ASPECT_LINE = Graphic3d_GroupAspect.Graphic3d_ASPECT_LINE
Graphic3d_ASPECT_TEXT = Graphic3d_GroupAspect.Graphic3d_ASPECT_TEXT
Graphic3d_ASPECT_MARKER = Graphic3d_GroupAspect.Graphic3d_ASPECT_MARKER
Graphic3d_ASPECT_FILL_AREA = Graphic3d_GroupAspect.Graphic3d_ASPECT_FILL_AREA

class Graphic3d_TextureUnit(IntEnum):
	Graphic3d_TextureUnit_0 = 0
	Graphic3d_TextureUnit_1 = 1
	Graphic3d_TextureUnit_2 = 2
	Graphic3d_TextureUnit_3 = 3
	Graphic3d_TextureUnit_4 = 4
	Graphic3d_TextureUnit_5 = 5
	Graphic3d_TextureUnit_6 = 6
	Graphic3d_TextureUnit_7 = 7
	Graphic3d_TextureUnit_8 = 8
	Graphic3d_TextureUnit_9 = 9
	Graphic3d_TextureUnit_10 = 10
	Graphic3d_TextureUnit_11 = 11
	Graphic3d_TextureUnit_12 = 12
	Graphic3d_TextureUnit_13 = 13
	Graphic3d_TextureUnit_14 = 14
	Graphic3d_TextureUnit_15 = 15
	Graphic3d_TextureUnit_BaseColor = Graphic3d_TextureUnit_0
	Graphic3d_TextureUnit_EnvMap = Graphic3d_TextureUnit_0
Graphic3d_TextureUnit_0 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_0
Graphic3d_TextureUnit_1 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_1
Graphic3d_TextureUnit_2 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_2
Graphic3d_TextureUnit_3 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_3
Graphic3d_TextureUnit_4 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_4
Graphic3d_TextureUnit_5 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_5
Graphic3d_TextureUnit_6 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_6
Graphic3d_TextureUnit_7 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_7
Graphic3d_TextureUnit_8 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_8
Graphic3d_TextureUnit_9 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_9
Graphic3d_TextureUnit_10 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_10
Graphic3d_TextureUnit_11 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_11
Graphic3d_TextureUnit_12 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_12
Graphic3d_TextureUnit_13 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_13
Graphic3d_TextureUnit_14 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_14
Graphic3d_TextureUnit_15 = Graphic3d_TextureUnit.Graphic3d_TextureUnit_15
Graphic3d_TextureUnit_BaseColor = Graphic3d_TextureUnit.Graphic3d_TextureUnit_BaseColor
Graphic3d_TextureUnit_EnvMap = Graphic3d_TextureUnit.Graphic3d_TextureUnit_EnvMap

class Graphic3d_TypeOfConnection(IntEnum):
	Graphic3d_TOC_ANCESTOR = 0
	Graphic3d_TOC_DESCENDANT = 1
Graphic3d_TOC_ANCESTOR = Graphic3d_TypeOfConnection.Graphic3d_TOC_ANCESTOR
Graphic3d_TOC_DESCENDANT = Graphic3d_TypeOfConnection.Graphic3d_TOC_DESCENDANT

class Graphic3d_NameOfTexture1D(IntEnum):
	Graphic3d_NOT_1D_ELEVATION = 0
	Graphic3d_NOT_1D_UNKNOWN = 1
Graphic3d_NOT_1D_ELEVATION = Graphic3d_NameOfTexture1D.Graphic3d_NOT_1D_ELEVATION
Graphic3d_NOT_1D_UNKNOWN = Graphic3d_NameOfTexture1D.Graphic3d_NOT_1D_UNKNOWN

class Graphic3d_TextPath(IntEnum):
	Graphic3d_TP_UP = 0
	Graphic3d_TP_DOWN = 1
	Graphic3d_TP_LEFT = 2
	Graphic3d_TP_RIGHT = 3
Graphic3d_TP_UP = Graphic3d_TextPath.Graphic3d_TP_UP
Graphic3d_TP_DOWN = Graphic3d_TextPath.Graphic3d_TP_DOWN
Graphic3d_TP_LEFT = Graphic3d_TextPath.Graphic3d_TP_LEFT
Graphic3d_TP_RIGHT = Graphic3d_TextPath.Graphic3d_TP_RIGHT

class Graphic3d_CubeMapSide(IntEnum):
	Graphic3d_CMS_POS_X = 0
	Graphic3d_CMS_NEG_X = 1
	Graphic3d_CMS_POS_Y = 2
	Graphic3d_CMS_NEG_Y = 3
	Graphic3d_CMS_POS_Z = 4
	Graphic3d_CMS_NEG_Z = 5
Graphic3d_CMS_POS_X = Graphic3d_CubeMapSide.Graphic3d_CMS_POS_X
Graphic3d_CMS_NEG_X = Graphic3d_CubeMapSide.Graphic3d_CMS_NEG_X
Graphic3d_CMS_POS_Y = Graphic3d_CubeMapSide.Graphic3d_CMS_POS_Y
Graphic3d_CMS_NEG_Y = Graphic3d_CubeMapSide.Graphic3d_CMS_NEG_Y
Graphic3d_CMS_POS_Z = Graphic3d_CubeMapSide.Graphic3d_CMS_POS_Z
Graphic3d_CMS_NEG_Z = Graphic3d_CubeMapSide.Graphic3d_CMS_NEG_Z

class Graphic3d_TypeOfComposition(IntEnum):
	Graphic3d_TOC_REPLACE = 0
	Graphic3d_TOC_POSTCONCATENATE = 1
Graphic3d_TOC_REPLACE = Graphic3d_TypeOfComposition.Graphic3d_TOC_REPLACE
Graphic3d_TOC_POSTCONCATENATE = Graphic3d_TypeOfComposition.Graphic3d_TOC_POSTCONCATENATE

class Graphic3d_TypeOfAttribute(IntEnum):
	Graphic3d_TOA_POS = 0
	Graphic3d_TOA_NORM = 1
	Graphic3d_TOA_UV = 2
	Graphic3d_TOA_COLOR = 3
	Graphic3d_TOA_CUSTOM = 4
Graphic3d_TOA_POS = Graphic3d_TypeOfAttribute.Graphic3d_TOA_POS
Graphic3d_TOA_NORM = Graphic3d_TypeOfAttribute.Graphic3d_TOA_NORM
Graphic3d_TOA_UV = Graphic3d_TypeOfAttribute.Graphic3d_TOA_UV
Graphic3d_TOA_COLOR = Graphic3d_TypeOfAttribute.Graphic3d_TOA_COLOR
Graphic3d_TOA_CUSTOM = Graphic3d_TypeOfAttribute.Graphic3d_TOA_CUSTOM

class Graphic3d_TypeOfData(IntEnum):
	Graphic3d_TOD_USHORT = 0
	Graphic3d_TOD_UINT = 1
	Graphic3d_TOD_VEC2 = 2
	Graphic3d_TOD_VEC3 = 3
	Graphic3d_TOD_VEC4 = 4
	Graphic3d_TOD_VEC4UB = 5
	Graphic3d_TOD_FLOAT = 6
Graphic3d_TOD_USHORT = Graphic3d_TypeOfData.Graphic3d_TOD_USHORT
Graphic3d_TOD_UINT = Graphic3d_TypeOfData.Graphic3d_TOD_UINT
Graphic3d_TOD_VEC2 = Graphic3d_TypeOfData.Graphic3d_TOD_VEC2
Graphic3d_TOD_VEC3 = Graphic3d_TypeOfData.Graphic3d_TOD_VEC3
Graphic3d_TOD_VEC4 = Graphic3d_TypeOfData.Graphic3d_TOD_VEC4
Graphic3d_TOD_VEC4UB = Graphic3d_TypeOfData.Graphic3d_TOD_VEC4UB
Graphic3d_TOD_FLOAT = Graphic3d_TypeOfData.Graphic3d_TOD_FLOAT

class Graphic3d_NameOfTexture2D(IntEnum):
	Graphic3d_NOT_2D_MATRA = 0
	Graphic3d_NOT_2D_ALIENSKIN = 1
	Graphic3d_NOT_2D_BLUE_ROCK = 2
	Graphic3d_NOT_2D_BLUEWHITE_PAPER = 3
	Graphic3d_NOT_2D_BRUSHED = 4
	Graphic3d_NOT_2D_BUBBLES = 5
	Graphic3d_NOT_2D_BUMP = 6
	Graphic3d_NOT_2D_CAST = 7
	Graphic3d_NOT_2D_CHIPBD = 8
	Graphic3d_NOT_2D_CLOUDS = 9
	Graphic3d_NOT_2D_FLESH = 10
	Graphic3d_NOT_2D_FLOOR = 11
	Graphic3d_NOT_2D_GALVNISD = 12
	Graphic3d_NOT_2D_GRASS = 13
	Graphic3d_NOT_2D_ALUMINUM = 14
	Graphic3d_NOT_2D_ROCK = 15
	Graphic3d_NOT_2D_KNURL = 16
	Graphic3d_NOT_2D_MAPLE = 17
	Graphic3d_NOT_2D_MARBLE = 18
	Graphic3d_NOT_2D_MOTTLED = 19
	Graphic3d_NOT_2D_RAIN = 20
	Graphic3d_NOT_2D_CHESS = 21
	Graphic3d_NOT_2D_UNKNOWN = 22
Graphic3d_NOT_2D_MATRA = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_MATRA
Graphic3d_NOT_2D_ALIENSKIN = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_ALIENSKIN
Graphic3d_NOT_2D_BLUE_ROCK = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_BLUE_ROCK
Graphic3d_NOT_2D_BLUEWHITE_PAPER = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_BLUEWHITE_PAPER
Graphic3d_NOT_2D_BRUSHED = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_BRUSHED
Graphic3d_NOT_2D_BUBBLES = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_BUBBLES
Graphic3d_NOT_2D_BUMP = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_BUMP
Graphic3d_NOT_2D_CAST = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_CAST
Graphic3d_NOT_2D_CHIPBD = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_CHIPBD
Graphic3d_NOT_2D_CLOUDS = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_CLOUDS
Graphic3d_NOT_2D_FLESH = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_FLESH
Graphic3d_NOT_2D_FLOOR = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_FLOOR
Graphic3d_NOT_2D_GALVNISD = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_GALVNISD
Graphic3d_NOT_2D_GRASS = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_GRASS
Graphic3d_NOT_2D_ALUMINUM = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_ALUMINUM
Graphic3d_NOT_2D_ROCK = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_ROCK
Graphic3d_NOT_2D_KNURL = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_KNURL
Graphic3d_NOT_2D_MAPLE = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_MAPLE
Graphic3d_NOT_2D_MARBLE = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_MARBLE
Graphic3d_NOT_2D_MOTTLED = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_MOTTLED
Graphic3d_NOT_2D_RAIN = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_RAIN
Graphic3d_NOT_2D_CHESS = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_CHESS
Graphic3d_NOT_2D_UNKNOWN = Graphic3d_NameOfTexture2D.Graphic3d_NOT_2D_UNKNOWN

class Graphic3d_NameOfMaterial(IntEnum):
	Graphic3d_NOM_BRASS = 0
	Graphic3d_NOM_BRONZE = 1
	Graphic3d_NOM_COPPER = 2
	Graphic3d_NOM_GOLD = 3
	Graphic3d_NOM_PEWTER = 4
	Graphic3d_NOM_PLASTER = 5
	Graphic3d_NOM_PLASTIC = 6
	Graphic3d_NOM_SILVER = 7
	Graphic3d_NOM_STEEL = 8
	Graphic3d_NOM_STONE = 9
	Graphic3d_NOM_SHINY_PLASTIC = 10
	Graphic3d_NOM_SATIN = 11
	Graphic3d_NOM_METALIZED = 12
	Graphic3d_NOM_NEON_GNC = 13
	Graphic3d_NOM_CHROME = 14
	Graphic3d_NOM_ALUMINIUM = 15
	Graphic3d_NOM_OBSIDIAN = 16
	Graphic3d_NOM_NEON_PHC = 17
	Graphic3d_NOM_JADE = 18
	Graphic3d_NOM_CHARCOAL = 19
	Graphic3d_NOM_WATER = 20
	Graphic3d_NOM_GLASS = 21
	Graphic3d_NOM_DIAMOND = 22
	Graphic3d_NOM_TRANSPARENT = 23
	Graphic3d_NOM_DEFAULT = 24
	Graphic3d_NOM_UserDefined = 25
Graphic3d_NOM_BRASS = Graphic3d_NameOfMaterial.Graphic3d_NOM_BRASS
Graphic3d_NOM_BRONZE = Graphic3d_NameOfMaterial.Graphic3d_NOM_BRONZE
Graphic3d_NOM_COPPER = Graphic3d_NameOfMaterial.Graphic3d_NOM_COPPER
Graphic3d_NOM_GOLD = Graphic3d_NameOfMaterial.Graphic3d_NOM_GOLD
Graphic3d_NOM_PEWTER = Graphic3d_NameOfMaterial.Graphic3d_NOM_PEWTER
Graphic3d_NOM_PLASTER = Graphic3d_NameOfMaterial.Graphic3d_NOM_PLASTER
Graphic3d_NOM_PLASTIC = Graphic3d_NameOfMaterial.Graphic3d_NOM_PLASTIC
Graphic3d_NOM_SILVER = Graphic3d_NameOfMaterial.Graphic3d_NOM_SILVER
Graphic3d_NOM_STEEL = Graphic3d_NameOfMaterial.Graphic3d_NOM_STEEL
Graphic3d_NOM_STONE = Graphic3d_NameOfMaterial.Graphic3d_NOM_STONE
Graphic3d_NOM_SHINY_PLASTIC = Graphic3d_NameOfMaterial.Graphic3d_NOM_SHINY_PLASTIC
Graphic3d_NOM_SATIN = Graphic3d_NameOfMaterial.Graphic3d_NOM_SATIN
Graphic3d_NOM_METALIZED = Graphic3d_NameOfMaterial.Graphic3d_NOM_METALIZED
Graphic3d_NOM_NEON_GNC = Graphic3d_NameOfMaterial.Graphic3d_NOM_NEON_GNC
Graphic3d_NOM_CHROME = Graphic3d_NameOfMaterial.Graphic3d_NOM_CHROME
Graphic3d_NOM_ALUMINIUM = Graphic3d_NameOfMaterial.Graphic3d_NOM_ALUMINIUM
Graphic3d_NOM_OBSIDIAN = Graphic3d_NameOfMaterial.Graphic3d_NOM_OBSIDIAN
Graphic3d_NOM_NEON_PHC = Graphic3d_NameOfMaterial.Graphic3d_NOM_NEON_PHC
Graphic3d_NOM_JADE = Graphic3d_NameOfMaterial.Graphic3d_NOM_JADE
Graphic3d_NOM_CHARCOAL = Graphic3d_NameOfMaterial.Graphic3d_NOM_CHARCOAL
Graphic3d_NOM_WATER = Graphic3d_NameOfMaterial.Graphic3d_NOM_WATER
Graphic3d_NOM_GLASS = Graphic3d_NameOfMaterial.Graphic3d_NOM_GLASS
Graphic3d_NOM_DIAMOND = Graphic3d_NameOfMaterial.Graphic3d_NOM_DIAMOND
Graphic3d_NOM_TRANSPARENT = Graphic3d_NameOfMaterial.Graphic3d_NOM_TRANSPARENT
Graphic3d_NOM_DEFAULT = Graphic3d_NameOfMaterial.Graphic3d_NOM_DEFAULT
Graphic3d_NOM_UserDefined = Graphic3d_NameOfMaterial.Graphic3d_NOM_UserDefined

class Graphic3d_TypeOfTextureFilter(IntEnum):
	Graphic3d_TOTF_NEAREST = 0
	Graphic3d_TOTF_BILINEAR = 1
	Graphic3d_TOTF_TRILINEAR = 2
Graphic3d_TOTF_NEAREST = Graphic3d_TypeOfTextureFilter.Graphic3d_TOTF_NEAREST
Graphic3d_TOTF_BILINEAR = Graphic3d_TypeOfTextureFilter.Graphic3d_TOTF_BILINEAR
Graphic3d_TOTF_TRILINEAR = Graphic3d_TypeOfTextureFilter.Graphic3d_TOTF_TRILINEAR

class Graphic3d_TypeOfVisualization(IntEnum):
	Graphic3d_TOV_WIREFRAME = 0
	Graphic3d_TOV_SHADING = 1
Graphic3d_TOV_WIREFRAME = Graphic3d_TypeOfVisualization.Graphic3d_TOV_WIREFRAME
Graphic3d_TOV_SHADING = Graphic3d_TypeOfVisualization.Graphic3d_TOV_SHADING

class Graphic3d_TypeOfLightSource(IntEnum):
	Graphic3d_TOLS_AMBIENT = 0
	Graphic3d_TOLS_DIRECTIONAL = 1
	Graphic3d_TOLS_POSITIONAL = 2
	Graphic3d_TOLS_SPOT = 3
	V3d_AMBIENT = Graphic3d_TOLS_AMBIENT
	V3d_DIRECTIONAL = Graphic3d_TOLS_DIRECTIONAL
	V3d_POSITIONAL = Graphic3d_TOLS_POSITIONAL
	V3d_SPOT = Graphic3d_TOLS_SPOT
Graphic3d_TOLS_AMBIENT = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_AMBIENT
Graphic3d_TOLS_DIRECTIONAL = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_DIRECTIONAL
Graphic3d_TOLS_POSITIONAL = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_POSITIONAL
Graphic3d_TOLS_SPOT = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_SPOT
V3d_AMBIENT = Graphic3d_TypeOfLightSource.V3d_AMBIENT
V3d_DIRECTIONAL = Graphic3d_TypeOfLightSource.V3d_DIRECTIONAL
V3d_POSITIONAL = Graphic3d_TypeOfLightSource.V3d_POSITIONAL
V3d_SPOT = Graphic3d_TypeOfLightSource.V3d_SPOT

class Graphic3d_NameOfTextureEnv(IntEnum):
	Graphic3d_NOT_ENV_CLOUDS = 0
	Graphic3d_NOT_ENV_CV = 1
	Graphic3d_NOT_ENV_MEDIT = 2
	Graphic3d_NOT_ENV_PEARL = 3
	Graphic3d_NOT_ENV_SKY1 = 4
	Graphic3d_NOT_ENV_SKY2 = 5
	Graphic3d_NOT_ENV_LINES = 6
	Graphic3d_NOT_ENV_ROAD = 7
	Graphic3d_NOT_ENV_UNKNOWN = 8
Graphic3d_NOT_ENV_CLOUDS = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_CLOUDS
Graphic3d_NOT_ENV_CV = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_CV
Graphic3d_NOT_ENV_MEDIT = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_MEDIT
Graphic3d_NOT_ENV_PEARL = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_PEARL
Graphic3d_NOT_ENV_SKY1 = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_SKY1
Graphic3d_NOT_ENV_SKY2 = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_SKY2
Graphic3d_NOT_ENV_LINES = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_LINES
Graphic3d_NOT_ENV_ROAD = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_ROAD
Graphic3d_NOT_ENV_UNKNOWN = Graphic3d_NameOfTextureEnv.Graphic3d_NOT_ENV_UNKNOWN
};
/* end python proxy for enums */

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
%template(Graphic3d_Array1OfAttribute) NCollection_Array1<Graphic3d_Attribute>;

%extend NCollection_Array1<Graphic3d_Attribute> {
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
%template(Graphic3d_ArrayOfIndexedMapOfStructure) NCollection_Array1<Graphic3d_IndexedMapOfStructure>;

%extend NCollection_Array1<Graphic3d_IndexedMapOfStructure> {
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
%template(Graphic3d_BndBox3d) BVH_Box<Standard_Real,3>;
%template(Graphic3d_BndBox4d) BVH_Box<Standard_Real,4>;
%template(Graphic3d_BndBox4f) BVH_Box<Standard_ShortReal,4>;
%template(Graphic3d_CameraLerp) NCollection_Lerp<opencascade::handle<Graphic3d_Camera>>;
%template(Graphic3d_IndexedMapOfStructure) NCollection_IndexedMap<const Graphic3d_CStructure *>;
%template(Graphic3d_IndexedMapOfView) NCollection_IndexedMap<Graphic3d_CView*>;
%template(Graphic3d_MapOfAspectsToAspects) NCollection_DataMap<opencascade::handle<Graphic3d_Aspects>,opencascade::handle<Graphic3d_Aspects>>;
%template(Graphic3d_MapOfStructure) NCollection_Map<opencascade::handle<Graphic3d_Structure>>;
%template(Graphic3d_MapOfZLayerSettings) NCollection_DataMap<Graphic3d_ZLayerId,Graphic3d_ZLayerSettings>;
%template(Graphic3d_Mat4) NCollection_Mat4<Standard_ShortReal>;
%template(Graphic3d_Mat4d) NCollection_Mat4<Standard_Real>;
%template(Graphic3d_SequenceOfGroup) NCollection_Sequence<opencascade::handle<Graphic3d_Group>>;

%extend NCollection_Sequence<opencascade::handle<Graphic3d_Group>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Graphic3d_SequenceOfStructure) NCollection_Sequence<opencascade::handle<Graphic3d_Structure>>;

%extend NCollection_Sequence<opencascade::handle<Graphic3d_Structure>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Graphic3d_ShaderAttributeList) NCollection_Sequence<opencascade::handle<Graphic3d_ShaderAttribute>>;

%extend NCollection_Sequence<opencascade::handle<Graphic3d_ShaderAttribute>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Graphic3d_ShaderObjectList) NCollection_Sequence<opencascade::handle<Graphic3d_ShaderObject>>;

%extend NCollection_Sequence<opencascade::handle<Graphic3d_ShaderObject>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Graphic3d_ShaderVariableList) NCollection_Sequence<opencascade::handle<Graphic3d_ShaderVariable>>;

%extend NCollection_Sequence<opencascade::handle<Graphic3d_ShaderVariable>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Graphic3d_Vec2) NCollection_Vec2<Standard_ShortReal>;
%template(Graphic3d_Vec2b) NCollection_Vec2<Standard_Character>;
%template(Graphic3d_Vec2d) NCollection_Vec2<Standard_Real>;
%template(Graphic3d_Vec2i) NCollection_Vec2<Standard_Integer>;
%template(Graphic3d_Vec2ub) NCollection_Vec2<Standard_Byte>;
%template(Graphic3d_Vec3) NCollection_Vec3<Standard_ShortReal>;
%template(Graphic3d_Vec3b) NCollection_Vec3<Standard_Character>;
%template(Graphic3d_Vec3d) NCollection_Vec3<Standard_Real>;
%template(Graphic3d_Vec3i) NCollection_Vec3<Standard_Integer>;
%template(Graphic3d_Vec3ub) NCollection_Vec3<Standard_Byte>;
%template(Graphic3d_Vec4) NCollection_Vec4<Standard_ShortReal>;
%template(Graphic3d_Vec4b) NCollection_Vec4<Standard_Character>;
%template(Graphic3d_Vec4d) NCollection_Vec4<Standard_Real>;
%template(Graphic3d_Vec4i) NCollection_Vec4<Standard_Integer>;
%template(Graphic3d_Vec4ub) NCollection_Vec4<Standard_Byte>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Graphic3d_Attribute> Graphic3d_Array1OfAttribute;
typedef Standard_Integer Graphic3d_ArrayFlags;
typedef NCollection_Array1<Graphic3d_IndexedMapOfStructure> Graphic3d_ArrayOfIndexedMapOfStructure;
typedef BVH_Box<Standard_Real, 3> Graphic3d_BndBox3d;
typedef BVH_Box<Standard_Real, 4> Graphic3d_BndBox4d;
typedef BVH_Box<Standard_ShortReal, 4> Graphic3d_BndBox4f;
typedef NCollection_Lerp<opencascade::handle<Graphic3d_Camera>> Graphic3d_CameraLerp;
typedef NCollection_IndexedMap<const Graphic3d_CStructure *> Graphic3d_IndexedMapOfStructure;
typedef NCollection_IndexedMap<Graphic3d_CView *> Graphic3d_IndexedMapOfView;
typedef Graphic3d_MapOfStructure::Iterator Graphic3d_MapIteratorOfMapOfStructure;
typedef NCollection_DataMap<opencascade::handle<Graphic3d_Aspects>, opencascade::handle<Graphic3d_Aspects>> Graphic3d_MapOfAspectsToAspects;
typedef NCollection_Map<opencascade::handle<Graphic3d_Structure>> Graphic3d_MapOfStructure;
typedef NCollection_DataMap<Graphic3d_ZLayerId, Graphic3d_ZLayerSettings> Graphic3d_MapOfZLayerSettings;
typedef NCollection_Mat4<Standard_ShortReal> Graphic3d_Mat4;
typedef NCollection_Mat4<Standard_Real> Graphic3d_Mat4d;
typedef NCollection_Shared<NCollection_Map<const Standard_Transient *>> Graphic3d_NMapOfTransient;
typedef NCollection_Sequence<opencascade::handle<Graphic3d_Group>> Graphic3d_SequenceOfGroup;
typedef NCollection_Sequence<opencascade::handle<Graphic3d_Structure>> Graphic3d_SequenceOfStructure;
typedef NCollection_Sequence<opencascade::handle<Graphic3d_ShaderAttribute>> Graphic3d_ShaderAttributeList;
typedef NCollection_Sequence<opencascade::handle<Graphic3d_ShaderObject>> Graphic3d_ShaderObjectList;
typedef NCollection_Sequence<opencascade::handle<Graphic3d_ShaderVariable>> Graphic3d_ShaderVariableList;
typedef Graphic3d_UniformValue<Standard_ShortReal> Graphic3d_UniformFloat;
typedef Graphic3d_UniformValue<Standard_Integer> Graphic3d_UniformInt;
typedef Graphic3d_UniformValue<Graphic3d_Vec2> Graphic3d_UniformVec2;
typedef Graphic3d_UniformValue<Graphic3d_Vec2i> Graphic3d_UniformVec2i;
typedef Graphic3d_UniformValue<Graphic3d_Vec3> Graphic3d_UniformVec3;
typedef Graphic3d_UniformValue<Graphic3d_Vec3i> Graphic3d_UniformVec3i;
typedef Graphic3d_UniformValue<Graphic3d_Vec4> Graphic3d_UniformVec4;
typedef Graphic3d_UniformValue<Graphic3d_Vec4i> Graphic3d_UniformVec4i;
typedef NCollection_Vec2<Standard_ShortReal> Graphic3d_Vec2;
typedef NCollection_Vec2<Standard_Character> Graphic3d_Vec2b;
typedef NCollection_Vec2<Standard_Real> Graphic3d_Vec2d;
typedef NCollection_Vec2<Standard_Integer> Graphic3d_Vec2i;
typedef NCollection_Vec2<Standard_Byte> Graphic3d_Vec2ub;
typedef NCollection_Vec3<Standard_ShortReal> Graphic3d_Vec3;
typedef NCollection_Vec3<Standard_Character> Graphic3d_Vec3b;
typedef NCollection_Vec3<Standard_Real> Graphic3d_Vec3d;
typedef NCollection_Vec3<Standard_Integer> Graphic3d_Vec3i;
typedef NCollection_Vec3<Standard_Byte> Graphic3d_Vec3ub;
typedef NCollection_Vec4<Standard_ShortReal> Graphic3d_Vec4;
typedef NCollection_Vec4<Standard_Character> Graphic3d_Vec4b;
typedef NCollection_Vec4<Standard_Real> Graphic3d_Vec4d;
typedef NCollection_Vec4<Standard_Integer> Graphic3d_Vec4i;
typedef NCollection_Vec4<Standard_Byte> Graphic3d_Vec4ub;
typedef Standard_Integer Graphic3d_ZLayerId;
typedef NCollection_Shared<Standard_Mutex> Media_HMutex;
/* end typedefs declaration */

/************************************
* class Graphic3d_ArrayOfPrimitives *
************************************/
%nodefaultctor Graphic3d_ArrayOfPrimitives;
class Graphic3d_ArrayOfPrimitives : public Standard_Transient {
	public:
		/****************** AddBound ******************/
		/**** md5 signature: 45f5d59342e3b9c57d19fd15d8eac485 ****/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "Adds a bound of length theedgenumber in the bound array returns the actual bounds number.

Parameters
----------
theEdgeNumber: int

Returns
-------
int
") AddBound;
		Standard_Integer AddBound(const Standard_Integer theEdgeNumber);

		/****************** AddBound ******************/
		/**** md5 signature: 88f0391d52dc6680cf337e34aa631b82 ****/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "Adds a bound of length theedgenumber and bound color thebcolor in the bound array. warning: thebcolor is ignored when the hasbcolors constructor parameter is false returns the actual bounds number.

Parameters
----------
theEdgeNumber: int
theBColor: Quantity_Color

Returns
-------
int
") AddBound;
		Standard_Integer AddBound(const Standard_Integer theEdgeNumber, const Quantity_Color & theBColor);

		/****************** AddBound ******************/
		/**** md5 signature: 9d345aea4491437a2c630cf48fc5736d ****/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "Adds a bound of length theedgenumber and bound color coordinates in the bound array. warning: <ther,theg,theb> are ignored when the hasbcolors constructor parameter is false returns the actual bounds number.

Parameters
----------
theEdgeNumber: int
theR: float
theG: float
theB: float

Returns
-------
int
") AddBound;
		Standard_Integer AddBound(const Standard_Integer theEdgeNumber, const Standard_Real theR, const Standard_Real theG, const Standard_Real theB);

		/****************** AddEdge ******************/
		/**** md5 signature: a337180540a69a89c433701f71109d97 ****/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "Adds an edge in the range [1,vertexnumber()] in the array. returns the actual edges number.

Parameters
----------
theVertexIndex: int

Returns
-------
int
") AddEdge;
		Standard_Integer AddEdge(const Standard_Integer theVertexIndex);

		/****************** AddEdges ******************/
		/**** md5 signature: c159e024359f7e072df55602f0b31ca0 ****/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "Convenience method, adds two vertex indices (a segment) in the range [1,vertexnumber()] in the array. returns the actual edges number.

Parameters
----------
theVertexIndex1: int
theVertexIndex2: int

Returns
-------
int
") AddEdges;
		Standard_Integer AddEdges(Standard_Integer theVertexIndex1, Standard_Integer theVertexIndex2);

		/****************** AddEdges ******************/
		/**** md5 signature: 9de790c6ce21825c622a6c76faec42c2 ****/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "Convenience method, adds three vertex indices (a triangle) in the range [1,vertexnumber()] in the array. returns the actual edges number.

Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int

Returns
-------
int
") AddEdges;
		Standard_Integer AddEdges(Standard_Integer theVertexIndex1, Standard_Integer theVertexIndex2, Standard_Integer theVertexIndex3);

		/****************** AddEdges ******************/
		/**** md5 signature: 065757fab0a76be2253c1620408a24bb ****/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "Convenience method, adds four vertex indices (a quad) in the range [1,vertexnumber()] in the array. returns the actual edges number.

Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int
theVertexIndex4: int

Returns
-------
int
") AddEdges;
		Standard_Integer AddEdges(Standard_Integer theVertexIndex1, Standard_Integer theVertexIndex2, Standard_Integer theVertexIndex3, Standard_Integer theVertexIndex4);

		/****************** AddPolylineEdges ******************/
		/**** md5 signature: 749e22dfb377d41dc2b585bd080e46e7 ****/
		%feature("compactdefaultargs") AddPolylineEdges;
		%feature("autodoc", "Add line strip (polyline) into indexed segments array. n-1 segments are added from n input nodes (or n with closed flag). raises exception if array is not of type graphic3d_topa_segments. @param thevertexlower [in] index of first node defining line strip fun (center) @param thevertexupper [in] index of last node defining triangle fun @param thetoclose [in] close triangle fan (connect first and last points).

Parameters
----------
theVertexLower: int
theVertexUpper: int
theToClose: bool

Returns
-------
None
") AddPolylineEdges;
		void AddPolylineEdges(Standard_Integer theVertexLower, Standard_Integer theVertexUpper, Standard_Boolean theToClose);

		/****************** AddQuadEdges ******************/
		/**** md5 signature: 7b670bbbf06f7a015e96240c3f52ae53 ****/
		%feature("compactdefaultargs") AddQuadEdges;
		%feature("autodoc", "Convenience method, adds four vertex indices (a quad) in the range [1,vertexnumber()] in the array of quads. raises exception if array is not of type graphic3d_topa_quadrangles. returns the actual edges number.

Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int
theVertexIndex4: int

Returns
-------
int
") AddQuadEdges;
		Standard_Integer AddQuadEdges(Standard_Integer theVertexIndex1, Standard_Integer theVertexIndex2, Standard_Integer theVertexIndex3, Standard_Integer theVertexIndex4);

		/****************** AddQuadTriangleEdges ******************/
		/**** md5 signature: 08a6ca10f8c05b6f3d0ed729fa1c7717 ****/
		%feature("compactdefaultargs") AddQuadTriangleEdges;
		%feature("autodoc", "Convenience method, adds quad indices in the range [1,vertexnumber()] into array or triangles as two triangles. raises exception if array is not of type graphic3d_topa_triangles. returns the actual edges number.

Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int
theVertexIndex4: int

Returns
-------
int
") AddQuadTriangleEdges;
		Standard_Integer AddQuadTriangleEdges(Standard_Integer theVertexIndex1, Standard_Integer theVertexIndex2, Standard_Integer theVertexIndex3, Standard_Integer theVertexIndex4);

		/****************** AddQuadTriangleEdges ******************/
		/**** md5 signature: 93b4fa18236aa40b6729b06a213db528 ****/
		%feature("compactdefaultargs") AddQuadTriangleEdges;
		%feature("autodoc", "Convenience method, adds quad indices in the range [1,vertexnumber()] into array or triangles as two triangles. raises exception if array is not of type graphic3d_topa_triangles. returns the actual edges number.

Parameters
----------
theIndexes: Graphic3d_Vec4i

Returns
-------
int
") AddQuadTriangleEdges;
		Standard_Integer AddQuadTriangleEdges(const Graphic3d_Vec4i & theIndexes);

		/****************** AddSegmentEdges ******************/
		/**** md5 signature: 812cf610cd5921290f6119742ec1aa5d ****/
		%feature("compactdefaultargs") AddSegmentEdges;
		%feature("autodoc", "Convenience method, adds two vertex indices (a segment) in the range [1,vertexnumber()] in the array of segments (graphic3d_topa_segments). raises exception if array is not of type graphic3d_topa_segments. returns the actual edges number.

Parameters
----------
theVertexIndex1: int
theVertexIndex2: int

Returns
-------
int
") AddSegmentEdges;
		Standard_Integer AddSegmentEdges(Standard_Integer theVertexIndex1, Standard_Integer theVertexIndex2);

		/****************** AddTriangleEdges ******************/
		/**** md5 signature: ae138feffd3cec4d9fbb1a4013327b5c ****/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "Convenience method, adds three vertex indices of triangle in the range [1,vertexnumber()] in the array of triangles. raises exception if array is not of type graphic3d_topa_triangles. returns the actual edges number.

Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int

Returns
-------
int
") AddTriangleEdges;
		Standard_Integer AddTriangleEdges(Standard_Integer theVertexIndex1, Standard_Integer theVertexIndex2, Standard_Integer theVertexIndex3);

		/****************** AddTriangleEdges ******************/
		/**** md5 signature: 6163a4915340f6513dbdb76707d4a0b4 ****/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "Convenience method, adds three vertex indices of triangle in the range [1,vertexnumber()] in the array of triangles. raises exception if array is not of type graphic3d_topa_triangles. returns the actual edges number.

Parameters
----------
theIndexes: Graphic3d_Vec3i

Returns
-------
int
") AddTriangleEdges;
		Standard_Integer AddTriangleEdges(const Graphic3d_Vec3i & theIndexes);

		/****************** AddTriangleEdges ******************/
		/**** md5 signature: c5131d7ede1221a7cae3ab2062568237 ****/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "Convenience method, adds three vertex indices (4th component is ignored) of triangle in the range [1,vertexnumber()] in the array of triangles. raises exception if array is not of type graphic3d_topa_triangles. returns the actual edges number.

Parameters
----------
theIndexes: Graphic3d_Vec4i

Returns
-------
int
") AddTriangleEdges;
		Standard_Integer AddTriangleEdges(const Graphic3d_Vec4i & theIndexes);

		/****************** AddTriangleFanEdges ******************/
		/**** md5 signature: e6d862393c3f57833b04578f4c4193bc ****/
		%feature("compactdefaultargs") AddTriangleFanEdges;
		%feature("autodoc", "Add triangle fan into indexed triangulation array. n-2 triangles are added from n input nodes (or n-1 with closed flag). raises exception if array is not of type graphic3d_topa_triangles. @param thevertexlower [in] index of first node defining triangle fun (center) @param thevertexupper [in] index of last node defining triangle fun @param thetoclose [in] close triangle fan (connect first and last points).

Parameters
----------
theVertexLower: int
theVertexUpper: int
theToClose: bool

Returns
-------
None
") AddTriangleFanEdges;
		void AddTriangleFanEdges(Standard_Integer theVertexLower, Standard_Integer theVertexUpper, Standard_Boolean theToClose);

		/****************** AddTriangleStripEdges ******************/
		/**** md5 signature: 106a3dbd089917972c1de2620e13e7bf ****/
		%feature("compactdefaultargs") AddTriangleStripEdges;
		%feature("autodoc", "Add triangle strip into indexed triangulation array. n-2 triangles are added from n input nodes. raises exception if array is not of type graphic3d_topa_triangles. @param thevertexlower [in] index of first node defining triangle strip @param thevertexupper [in] index of last node defining triangle strip.

Parameters
----------
theVertexLower: int
theVertexUpper: int

Returns
-------
None
") AddTriangleStripEdges;
		void AddTriangleStripEdges(Standard_Integer theVertexLower, Standard_Integer theVertexUpper);

		/****************** AddVertex ******************/
		/**** md5 signature: d3ee5a248d80d53a0bcf8b586e80b0a4 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice in the array. returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex);

		/****************** AddVertex ******************/
		/**** md5 signature: fcfc56a216df20b766d90f52a30148f5 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice in the array. returns the actual vertex number.

Parameters
----------
theVertex: Graphic3d_Vec3

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Graphic3d_Vec3 & theVertex);

		/****************** AddVertex ******************/
		/**** md5 signature: 77f6f198f3626a49348ea76447a25e28 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice in the array. returns the actual vertex number.

Parameters
----------
theX: float
theY: float
theZ: float

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ);

		/****************** AddVertex ******************/
		/**** md5 signature: 04746c940ff6f95c88b267613db887f8 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice in the array. returns the actual vertex number.

Parameters
----------
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_ShortReal theX, const Standard_ShortReal theY, const Standard_ShortReal theZ);

		/****************** AddVertex ******************/
		/**** md5 signature: 701dea54fa31ef19ea6b2b542758d8bb ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex color in the vertex array. warning: thecolor is ignored when the hasvcolors constructor parameter is false returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theColor: Quantity_Color

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const Quantity_Color & theColor);

		/****************** AddVertex ******************/
		/**** md5 signature: 9a535b3a9cf6bbd6d8548b7278d90ea0 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex color in the vertex array. warning: thecolor is ignored when the hasvcolors constructor parameter is false @code thecolor32 = alpha << 24 + blue << 16 + green << 8 + red @endcode returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theColor32: int

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const Standard_Integer theColor32);

		/****************** AddVertex ******************/
		/**** md5 signature: a0fa023c09c610f286353c31554b4d64 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex color in the vertex array. warning: thecolor is ignored when the hasvcolors constructor parameter is false returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theColor: Graphic3d_Vec4ub

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const Graphic3d_Vec4ub & theColor);

		/****************** AddVertex ******************/
		/**** md5 signature: a7443c39b4f7ca8918bca32bb7015cdc ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex normal in the vertex array. warning: thenormal is ignored when the hasvnormals constructor parameter is false. returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal);

		/****************** AddVertex ******************/
		/**** md5 signature: ef48b0ea76122595143cb8054d85115d ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex normal in the vertex array. warning: normal is ignored when the hasvnormals constructor parameter is false. returns the actual vertex number.

Parameters
----------
theX: float
theY: float
theZ: float
theNX: float
theNY: float
theNZ: float

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theNX, const Standard_Real theNY, const Standard_Real theNZ);

		/****************** AddVertex ******************/
		/**** md5 signature: e8be3cef3c1140a0f0ab1df6c25d8ca7 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex normal in the vertex array. warning: normal is ignored when the hasvnormals constructor parameter is false. returns the actual vertex number.

Parameters
----------
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal
theNX: Standard_ShortReal
theNY: Standard_ShortReal
theNZ: Standard_ShortReal

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_ShortReal theX, const Standard_ShortReal theY, const Standard_ShortReal theZ, const Standard_ShortReal theNX, const Standard_ShortReal theNY, const Standard_ShortReal theNZ);

		/****************** AddVertex ******************/
		/**** md5 signature: 99cd346a0e12c323c7277fc8a5be3f68 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice,vertex normal and color in the vertex array. warning: thenormal is ignored when the hasvnormals constructor parameter is false and thecolor is ignored when the hasvcolors constructor parameter is false. returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir
theColor: Quantity_Color

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal, const Quantity_Color & theColor);

		/****************** AddVertex ******************/
		/**** md5 signature: c8947445d0b06c4fed7b9d9a2a659c76 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice,vertex normal and color in the vertex array. warning: thenormal is ignored when the hasvnormals constructor parameter is false and thecolor is ignored when the hasvcolors constructor parameter is false. @code thecolor32 = alpha << 24 + blue << 16 + green << 8 + red @endcode returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir
theColor32: int

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal, const Standard_Integer theColor32);

		/****************** AddVertex ******************/
		/**** md5 signature: f70849cdbf2fca1ec18460230e2280f5 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex texture in the vertex array. thetexel is ignored when the hasvtexels constructor parameter is false. returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theTexel: gp_Pnt2d

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const gp_Pnt2d & theTexel);

		/****************** AddVertex ******************/
		/**** md5 signature: 29a6b26750e79323531699b1cd47f410 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex texture coordinates in the vertex array. texel is ignored when the hasvtexels constructor parameter is false. returns the actual vertex number.

Parameters
----------
theX: float
theY: float
theZ: float
theTX: float
theTY: float

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theTX, const Standard_Real theTY);

		/****************** AddVertex ******************/
		/**** md5 signature: 6132710dd06cefe09ea61ba7231572dd ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice and vertex texture coordinates in the vertex array. texel is ignored when the hasvtexels constructor parameter is false. returns the actual vertex number.

Parameters
----------
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal
theTX: Standard_ShortReal
theTY: Standard_ShortReal

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_ShortReal theX, const Standard_ShortReal theY, const Standard_ShortReal theZ, const Standard_ShortReal theTX, const Standard_ShortReal theTY);

		/****************** AddVertex ******************/
		/**** md5 signature: c979e838840e23ee6185c18334d02ad0 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice,vertex normal and texture in the vertex array. warning: thenormal is ignored when the hasvnormals constructor parameter is false and thetexel is ignored when the hasvtexels constructor parameter is false. returns the actual vertex number.

Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir
theTexel: gp_Pnt2d

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal, const gp_Pnt2d & theTexel);

		/****************** AddVertex ******************/
		/**** md5 signature: c02664b5a8ddaf04d99cd78fbc93c537 ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice,vertex normal and texture in the vertex array. warning: normal is ignored when the hasvnormals constructor parameter is false and texel is ignored when the hasvtexels constructor parameter is false. returns the actual vertex number.

Parameters
----------
theX: float
theY: float
theZ: float
theNX: float
theNY: float
theNZ: float
theTX: float
theTY: float

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theNX, const Standard_Real theNY, const Standard_Real theNZ, const Standard_Real theTX, const Standard_Real theTY);

		/****************** AddVertex ******************/
		/**** md5 signature: 491a14da93bc4d1f38f3a182fe553c5b ****/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertice,vertex normal and texture in the vertex array. warning: normal is ignored when the hasvnormals constructor parameter is false and texel is ignored when the hasvtexels constructor parameter is false. returns the actual vertex number.

Parameters
----------
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal
theNX: Standard_ShortReal
theNY: Standard_ShortReal
theNZ: Standard_ShortReal
theTX: Standard_ShortReal
theTY: Standard_ShortReal

Returns
-------
int
") AddVertex;
		Standard_Integer AddVertex(const Standard_ShortReal theX, const Standard_ShortReal theY, const Standard_ShortReal theZ, const Standard_ShortReal theNX, const Standard_ShortReal theNY, const Standard_ShortReal theNZ, const Standard_ShortReal theTX, const Standard_ShortReal theTY);

		/****************** Attributes ******************/
		/**** md5 signature: 1610a8a8ea9ac2d06e2257d3ddc49edd ****/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Returns vertex attributes buffer (colors, normals, texture coordinates).

Returns
-------
opencascade::handle<Graphic3d_Buffer>
") Attributes;
		const opencascade::handle<Graphic3d_Buffer> & Attributes();

		/****************** Bound ******************/
		/**** md5 signature: 3b1056ea4935cbc39e9e500b5504c00f ****/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "Returns the edge number at rank therank.

Parameters
----------
theRank: int

Returns
-------
int
") Bound;
		Standard_Integer Bound(const Standard_Integer theRank);

		/****************** BoundColor ******************/
		/**** md5 signature: 5e034e4401a51a2792a514433b5c1f4e ****/
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "Returns the bound color at rank therank from the bound table if defined.

Parameters
----------
theRank: int

Returns
-------
Quantity_Color
") BoundColor;
		Quantity_Color BoundColor(const Standard_Integer theRank);

		/****************** BoundColor ******************/
		/**** md5 signature: 9bb86279f4d1437684b86975ec15944c ****/
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "Returns the bound color values at rank therank from the bound table if defined.

Parameters
----------
theRank: int

Returns
-------
theR: float
theG: float
theB: float
") BoundColor;
		void BoundColor(const Standard_Integer theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** BoundNumber ******************/
		/**** md5 signature: 47733e681c876fb95a4e7500f3b4f8aa ****/
		%feature("compactdefaultargs") BoundNumber;
		%feature("autodoc", "Returns the number of defined bounds.

Returns
-------
int
") BoundNumber;
		Standard_Integer BoundNumber();

		/****************** BoundNumberAllocated ******************/
		/**** md5 signature: 078f355b4b64c8e7c909a9a09c143f3b ****/
		%feature("compactdefaultargs") BoundNumberAllocated;
		%feature("autodoc", "Returns the number of allocated bounds.

Returns
-------
int
") BoundNumberAllocated;
		Standard_Integer BoundNumberAllocated();

		/****************** Bounds ******************/
		/**** md5 signature: aa4b6d27ab81123f0a7d91851b604a91 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns optional bounds buffer.

Returns
-------
opencascade::handle<Graphic3d_BoundBuffer>
") Bounds;
		const opencascade::handle<Graphic3d_BoundBuffer> & Bounds();

		/****************** CreateArray ******************/
		/**** md5 signature: 397c1bd22f23a2bbf1d4fb56b6294022 ****/
		%feature("compactdefaultargs") CreateArray;
		%feature("autodoc", "Create an array of specified type.

Parameters
----------
theType: Graphic3d_TypeOfPrimitiveArray
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Returns
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>
") CreateArray;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> CreateArray(Graphic3d_TypeOfPrimitiveArray theType, Standard_Integer theMaxVertexs, Standard_Integer theMaxEdges, int theArrayFlags);

		/****************** CreateArray ******************/
		/**** md5 signature: 065b84c5ccc6d4353c689d650e2a71c7 ****/
		%feature("compactdefaultargs") CreateArray;
		%feature("autodoc", "Create an array of specified type.

Parameters
----------
theType: Graphic3d_TypeOfPrimitiveArray
theMaxVertexs: int
theMaxBounds: int
theMaxEdges: int
theArrayFlags: int

Returns
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>
") CreateArray;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> CreateArray(Graphic3d_TypeOfPrimitiveArray theType, Standard_Integer theMaxVertexs, Standard_Integer theMaxBounds, Standard_Integer theMaxEdges, int theArrayFlags);

		/****************** Edge ******************/
		/**** md5 signature: 109d05368b034560c8c45295acff88b7 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the vertex index at rank therank in the range [1,edgenumber()].

Parameters
----------
theRank: int

Returns
-------
int
") Edge;
		Standard_Integer Edge(const Standard_Integer theRank);

		/****************** EdgeNumber ******************/
		/**** md5 signature: 898d7eb3e12f6c69ff0badaf7425349f ****/
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "Returns the number of defined edges.

Returns
-------
int
") EdgeNumber;
		Standard_Integer EdgeNumber();

		/****************** EdgeNumberAllocated ******************/
		/**** md5 signature: 139f246b08a8ce0f55c6095b947cd3fa ****/
		%feature("compactdefaultargs") EdgeNumberAllocated;
		%feature("autodoc", "Returns the number of allocated edges.

Returns
-------
int
") EdgeNumberAllocated;
		Standard_Integer EdgeNumberAllocated();

		/****************** HasBoundColors ******************/
		/**** md5 signature: df286c44188250f686e57a7dd18d920b ****/
		%feature("compactdefaultargs") HasBoundColors;
		%feature("autodoc", "Returns true when bound colors array is defined.

Returns
-------
bool
") HasBoundColors;
		Standard_Boolean HasBoundColors();

		/****************** HasVertexColors ******************/
		/**** md5 signature: fa868ff9e1fa2eafb8056b01f75d6453 ****/
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "Returns true when vertex colors array is defined.

Returns
-------
bool
") HasVertexColors;
		Standard_Boolean HasVertexColors();

		/****************** HasVertexNormals ******************/
		/**** md5 signature: f69d9e0b50cc347b8c12d527538021e3 ****/
		%feature("compactdefaultargs") HasVertexNormals;
		%feature("autodoc", "Returns true when vertex normals array is defined.

Returns
-------
bool
") HasVertexNormals;
		Standard_Boolean HasVertexNormals();

		/****************** HasVertexTexels ******************/
		/**** md5 signature: 189ef2b540a7aeb886d9e42f911a79f4 ****/
		%feature("compactdefaultargs") HasVertexTexels;
		%feature("autodoc", "Returns true when vertex texels array is defined.

Returns
-------
bool
") HasVertexTexels;
		Standard_Boolean HasVertexTexels();

		/****************** Indices ******************/
		/**** md5 signature: 1bb8a727555fded0b4938a4c1f24b002 ****/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "Returns optional index buffer.

Returns
-------
opencascade::handle<Graphic3d_IndexBuffer>
") Indices;
		const opencascade::handle<Graphic3d_IndexBuffer> & Indices();

		/****************** IsValid ******************/
		/**** md5 signature: 184ccb4a09475d4c8f058e2d3ed097b2 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns true only when the contains of this array is available.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** ItemNumber ******************/
		/**** md5 signature: 27fb333f2c63f512e18325a79deeb603 ****/
		%feature("compactdefaultargs") ItemNumber;
		%feature("autodoc", "Returns the number of total items according to the array type.

Returns
-------
int
") ItemNumber;
		Standard_Integer ItemNumber();

		/****************** SetBoundColor ******************/
		/**** md5 signature: 0293a9c310b80e98889b74c21981c4c8 ****/
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "Change the bound color of rank theindex in the array.

Parameters
----------
theIndex: int
theColor: Quantity_Color

Returns
-------
None
") SetBoundColor;
		void SetBoundColor(const Standard_Integer theIndex, const Quantity_Color & theColor);

		/****************** SetBoundColor ******************/
		/**** md5 signature: 1a706fdd93611a8eafb16a5f7330adfc ****/
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "Change the bound color of rank theindex in the array.

Parameters
----------
theIndex: int
theR: float
theG: float
theB: float

Returns
-------
None
") SetBoundColor;
		void SetBoundColor(const Standard_Integer theIndex, const Standard_Real theR, const Standard_Real theG, const Standard_Real theB);

		/****************** SetVertexColor ******************/
		/**** md5 signature: 5e3741ae404c07188cda0cf2c04c1af9 ****/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "Change the vertex color of rank theindex in the array.

Parameters
----------
theIndex: int
theColor: Quantity_Color

Returns
-------
None
") SetVertexColor;
		void SetVertexColor(const Standard_Integer theIndex, const Quantity_Color & theColor);

		/****************** SetVertexColor ******************/
		/**** md5 signature: 7af065799323ec7bfb7d70ea95f7628d ****/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "Change the vertex color of rank theindex in the array.

Parameters
----------
theIndex: int
theR: float
theG: float
theB: float

Returns
-------
None
") SetVertexColor;
		void SetVertexColor(const Standard_Integer theIndex, const Standard_Real theR, const Standard_Real theG, const Standard_Real theB);

		/****************** SetVertexColor ******************/
		/**** md5 signature: 365ecc2a1256e9e4dfce4691a873708a ****/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "Change the vertex color of rank theindex in the array.

Parameters
----------
theIndex: int
theColor: Graphic3d_Vec4ub

Returns
-------
None
") SetVertexColor;
		void SetVertexColor(const Standard_Integer theIndex, const Graphic3d_Vec4ub & theColor);

		/****************** SetVertexColor ******************/
		/**** md5 signature: eeeed96e9c367036c67cad249943f072 ****/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "Change the vertex color of rank theindex> in the array. @code thecolor32 = alpha << 24 + blue << 16 + green << 8 + red @endcode.

Parameters
----------
theIndex: int
theColor32: int

Returns
-------
None
") SetVertexColor;
		void SetVertexColor(const Standard_Integer theIndex, const Standard_Integer theColor32);

		/****************** SetVertexNormal ******************/
		/**** md5 signature: 56e59c0948b5301def0a7eca1379fd17 ****/
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "Change the vertex normal of rank theindex in the array.

Parameters
----------
theIndex: int
theNormal: gp_Dir

Returns
-------
None
") SetVertexNormal;
		void SetVertexNormal(const Standard_Integer theIndex, const gp_Dir & theNormal);

		/****************** SetVertexNormal ******************/
		/**** md5 signature: 63c2e7dcdaea066bc49bcf66ad7ca7f6 ****/
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "Change the vertex normal of rank theindex in the array.

Parameters
----------
theIndex: int
theNX: float
theNY: float
theNZ: float

Returns
-------
None
") SetVertexNormal;
		void SetVertexNormal(const Standard_Integer theIndex, const Standard_Real theNX, const Standard_Real theNY, const Standard_Real theNZ);

		/****************** SetVertexTexel ******************/
		/**** md5 signature: d290b59df93ca78d439630a79c10fb96 ****/
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "Change the vertex texel of rank theindex in the array.

Parameters
----------
theIndex: int
theTexel: gp_Pnt2d

Returns
-------
None
") SetVertexTexel;
		void SetVertexTexel(const Standard_Integer theIndex, const gp_Pnt2d & theTexel);

		/****************** SetVertexTexel ******************/
		/**** md5 signature: 591a2402f51c2d9464abbf0004c2aab8 ****/
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "Change the vertex texel of rank theindex in the array.

Parameters
----------
theIndex: int
theTX: float
theTY: float

Returns
-------
None
") SetVertexTexel;
		void SetVertexTexel(const Standard_Integer theIndex, const Standard_Real theTX, const Standard_Real theTY);

		/****************** SetVertice ******************/
		/**** md5 signature: 2b9b1a547f8ab7430320d077f7134a28 ****/
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "Change the vertice of rank theindex in the array.

Parameters
----------
theIndex: int
theVertex: gp_Pnt

Returns
-------
None
") SetVertice;
		void SetVertice(const Standard_Integer theIndex, const gp_Pnt & theVertex);

		/****************** SetVertice ******************/
		/**** md5 signature: df303311bc01466daff43a98c2282220 ****/
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "Change the vertice of rank theindex in the array.

Parameters
----------
theIndex: int
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal

Returns
-------
None
") SetVertice;
		void SetVertice(const Standard_Integer theIndex, const Standard_ShortReal theX, const Standard_ShortReal theY, const Standard_ShortReal theZ);

		/****************** StringType ******************/
		/**** md5 signature: 7838785945a0a28ff90576bc900c0fc9 ****/
		%feature("compactdefaultargs") StringType;
		%feature("autodoc", "Returns the string type of this primitive.

Returns
-------
char *
") StringType;
		const char * StringType();

		/****************** Type ******************/
		/**** md5 signature: 766ba92896e370dd36bb18b553d14b69 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of this primitive.

Returns
-------
Graphic3d_TypeOfPrimitiveArray
") Type;
		Graphic3d_TypeOfPrimitiveArray Type();

		/****************** VertexColor ******************/
		/**** md5 signature: 894c541db7b41bdf5464eb184c84acbc ****/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "Returns the vertex color at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
Quantity_Color
") VertexColor;
		Quantity_Color VertexColor(const Standard_Integer theRank);

		/****************** VertexColor ******************/
		/**** md5 signature: 7de9a853ec7251d7d89a341ebd53d5cb ****/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "Returns the vertex color at rank theindex from the vertex table if defined.

Parameters
----------
theIndex: int
theColor: Graphic3d_Vec4ub

Returns
-------
None
") VertexColor;
		void VertexColor(const Standard_Integer theIndex, Graphic3d_Vec4ub & theColor);

		/****************** VertexColor ******************/
		/**** md5 signature: da4a7941920a5d3bfbc05b00562a2a98 ****/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "Returns the vertex color values at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
theR: float
theG: float
theB: float
") VertexColor;
		void VertexColor(const Standard_Integer theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** VertexColor ******************/
		/**** md5 signature: 40aea0b0194d19a40dd5ce23e97b877c ****/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "Returns the vertex color values at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
theColor: int
") VertexColor;
		void VertexColor(const Standard_Integer theRank, Standard_Integer &OutValue);

		/****************** VertexNormal ******************/
		/**** md5 signature: 23971fdb573e3fdf90a1785d18fde66e ****/
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "Returns the vertex normal at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
gp_Dir
") VertexNormal;
		gp_Dir VertexNormal(const Standard_Integer theRank);

		/****************** VertexNormal ******************/
		/**** md5 signature: 9cb8eef363df84964f026aeed71d96a7 ****/
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "Returns the vertex normal coordinates at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
theNX: float
theNY: float
theNZ: float
") VertexNormal;
		void VertexNormal(const Standard_Integer theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** VertexNumber ******************/
		/**** md5 signature: 36051493accf9c2cd1057f35d93097d9 ****/
		%feature("compactdefaultargs") VertexNumber;
		%feature("autodoc", "Returns the number of defined vertex.

Returns
-------
int
") VertexNumber;
		Standard_Integer VertexNumber();

		/****************** VertexNumberAllocated ******************/
		/**** md5 signature: dff3d562e375cc252acecbd0a6f9e318 ****/
		%feature("compactdefaultargs") VertexNumberAllocated;
		%feature("autodoc", "Returns the number of allocated vertex.

Returns
-------
int
") VertexNumberAllocated;
		Standard_Integer VertexNumberAllocated();

		/****************** VertexTexel ******************/
		/**** md5 signature: 01f81ccb106fdd8a29d253220a7a126e ****/
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "Returns the vertex texture at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
gp_Pnt2d
") VertexTexel;
		gp_Pnt2d VertexTexel(const Standard_Integer theRank);

		/****************** VertexTexel ******************/
		/**** md5 signature: 91f5db91f39ec84c9ae06927d6fc5937 ****/
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "Returns the vertex texture coordinates at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
theTX: float
theTY: float
") VertexTexel;
		void VertexTexel(const Standard_Integer theRank, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Vertice ******************/
		/**** md5 signature: 39ce48129cb147a713a12c21a8e35a55 ****/
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "Returns the vertice at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
gp_Pnt
") Vertice;
		gp_Pnt Vertice(const Standard_Integer theRank);

		/****************** Vertice ******************/
		/**** md5 signature: 9a4d98ac80934cdba48966df4fecbe00 ****/
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "Returns the vertice coordinates at rank therank from the vertex table if defined.

Parameters
----------
theRank: int

Returns
-------
theX: float
theY: float
theZ: float
") Vertice;
		void Vertice(const Standard_Integer theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****************** Graphic3d_Aspects ******************/
		/**** md5 signature: e28433a8ce967ebeaba5ca07028bdd70 ****/
		%feature("compactdefaultargs") Graphic3d_Aspects;
		%feature("autodoc", "Creates a context table for drawing primitives defined with the following default values:.

Returns
-------
None
") Graphic3d_Aspects;
		 Graphic3d_Aspects();

		/****************** AllowBackFace ******************/
		/**** md5 signature: c90f5a2b43fff04968eb4dde02cb190f ****/
		%feature("compactdefaultargs") AllowBackFace;
		%feature("autodoc", "Allows the display of back-facing filled polygons.

Returns
-------
None
") AllowBackFace;
		void AllowBackFace();

		/****************** AlphaCutoff ******************/
		/**** md5 signature: 24016059420e9e5c6d337d7b29b53858 ****/
		%feature("compactdefaultargs") AlphaCutoff;
		%feature("autodoc", "Returns alpha cutoff threshold, for discarding fragments within graphic3d_alphamode_mask mode (0.5 by default). if the alpha value is greater than or equal to this value then it is rendered as fully opaque, otherwise, it is rendered as fully transparent.

Returns
-------
Standard_ShortReal
") AlphaCutoff;
		Standard_ShortReal AlphaCutoff();

		/****************** AlphaMode ******************/
		/**** md5 signature: c141b940ccd51adaa91c404b4d4a5d76 ****/
		%feature("compactdefaultargs") AlphaMode;
		%feature("autodoc", "Returns the way how alpha value should be treated (graphic3d_alphamode_blendauto by default, for backward compatibility).

Returns
-------
Graphic3d_AlphaMode
") AlphaMode;
		Graphic3d_AlphaMode AlphaMode();

		/****************** BackFace ******************/
		/**** md5 signature: d634528b3c0ee7a40c5cedfafb5cbf5c ****/
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "Returns true if back faces should be suppressed (true by default).

Returns
-------
bool
") BackFace;
		bool BackFace();

		/****************** BackInteriorColor ******************/
		/**** md5 signature: e43c9444d80ba6362541272eb09b8d61 ****/
		%feature("compactdefaultargs") BackInteriorColor;
		%feature("autodoc", "Return back interior color.

Returns
-------
Quantity_Color
") BackInteriorColor;
		const Quantity_Color & BackInteriorColor();

		/****************** BackInteriorColorRGBA ******************/
		/**** md5 signature: fd87b0cbfd66e53bad2724623161e871 ****/
		%feature("compactdefaultargs") BackInteriorColorRGBA;
		%feature("autodoc", "Return back interior color.

Returns
-------
Quantity_ColorRGBA
") BackInteriorColorRGBA;
		const Quantity_ColorRGBA & BackInteriorColorRGBA();

		/****************** BackMaterial ******************/
		/**** md5 signature: d61ddc63820fda6c18f961c1b8f4fac2 ****/
		%feature("compactdefaultargs") BackMaterial;
		%feature("autodoc", "Returns the surface material of internal faces.

Returns
-------
Graphic3d_MaterialAspect
") BackMaterial;
		const Graphic3d_MaterialAspect & BackMaterial();

		/****************** ChangeBackMaterial ******************/
		/**** md5 signature: bf42bcce6fb2c7cbca5951a18913d8b2 ****/
		%feature("compactdefaultargs") ChangeBackMaterial;
		%feature("autodoc", "Returns the surface material of internal faces.

Returns
-------
Graphic3d_MaterialAspect
") ChangeBackMaterial;
		Graphic3d_MaterialAspect & ChangeBackMaterial();

		/****************** ChangeFrontMaterial ******************/
		/**** md5 signature: 896bb6b9197226375817929795f577c8 ****/
		%feature("compactdefaultargs") ChangeFrontMaterial;
		%feature("autodoc", "Returns the surface material of external faces.

Returns
-------
Graphic3d_MaterialAspect
") ChangeFrontMaterial;
		Graphic3d_MaterialAspect & ChangeFrontMaterial();

		/****************** Color ******************/
		/**** md5 signature: 7cec116411eb20e52d1fabf3015346da ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return the color.

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color & Color();

		/****************** ColorRGBA ******************/
		/**** md5 signature: 615b6d48d8bc4764a07d0e2ff837764b ****/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "Return color.

Returns
-------
Quantity_ColorRGBA
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA();

		/****************** ColorSubTitle ******************/
		/**** md5 signature: ec9fb7d73de227b76a49a632255940a1 ****/
		%feature("compactdefaultargs") ColorSubTitle;
		%feature("autodoc", "Return text background/shadow color; equals to edgecolor() property.

Returns
-------
Quantity_Color
") ColorSubTitle;
		const Quantity_Color & ColorSubTitle();

		/****************** ColorSubTitleRGBA ******************/
		/**** md5 signature: 19c99bba7072d8a37082e5e5db18e02f ****/
		%feature("compactdefaultargs") ColorSubTitleRGBA;
		%feature("autodoc", "Returns text background/shadow color; equals to edgecolor() property.

Returns
-------
Quantity_ColorRGBA
") ColorSubTitleRGBA;
		const Quantity_ColorRGBA & ColorSubTitleRGBA();

		/****************** Distinguish ******************/
		/**** md5 signature: 0454cac171c21f4684edced692b81ef0 ****/
		%feature("compactdefaultargs") Distinguish;
		%feature("autodoc", "Returns true if material properties should be distinguished for back and front faces (false by default).

Returns
-------
bool
") Distinguish;
		bool Distinguish();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** EdgeColor ******************/
		/**** md5 signature: e3bf049881e7a42425197782f2de2754 ****/
		%feature("compactdefaultargs") EdgeColor;
		%feature("autodoc", "Return color of edges.

Returns
-------
Quantity_Color
") EdgeColor;
		const Quantity_Color & EdgeColor();

		/****************** EdgeColorRGBA ******************/
		/**** md5 signature: 7f6e351360a662eeb14730bdbc180102 ****/
		%feature("compactdefaultargs") EdgeColorRGBA;
		%feature("autodoc", "Return color of edges.

Returns
-------
Quantity_ColorRGBA
") EdgeColorRGBA;
		const Quantity_ColorRGBA & EdgeColorRGBA();

		/****************** EdgeLineType ******************/
		/**** md5 signature: 88c19f6858297c0d6ca1eb0808721938 ****/
		%feature("compactdefaultargs") EdgeLineType;
		%feature("autodoc", "Return edges line type (same as linetype()).

Returns
-------
Aspect_TypeOfLine
") EdgeLineType;
		Aspect_TypeOfLine EdgeLineType();

		/****************** EdgeWidth ******************/
		/**** md5 signature: a6059e81322b478bfe4e887cc682adeb ****/
		%feature("compactdefaultargs") EdgeWidth;
		%feature("autodoc", "Return width for edges in pixels (same as linewidth()).

Returns
-------
Standard_ShortReal
") EdgeWidth;
		Standard_ShortReal EdgeWidth();

		/****************** FrontMaterial ******************/
		/**** md5 signature: 41b8cfff159c56853a21e11111805499 ****/
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "Returns the surface material of external faces.

Returns
-------
Graphic3d_MaterialAspect
") FrontMaterial;
		const Graphic3d_MaterialAspect & FrontMaterial();

		/****************** HatchStyle ******************/
		/**** md5 signature: 07b62677450d3df62f68cd2f20b612da ****/
		%feature("compactdefaultargs") HatchStyle;
		%feature("autodoc", "Returns the hatch type used when interiorstyle is is_hatch.

Returns
-------
opencascade::handle<Graphic3d_HatchStyle>
") HatchStyle;
		const opencascade::handle<Graphic3d_HatchStyle> & HatchStyle();

		/****************** InteriorColor ******************/
		/**** md5 signature: 257c7e47a9943279e873d8c441621100 ****/
		%feature("compactdefaultargs") InteriorColor;
		%feature("autodoc", "Return interior color.

Returns
-------
Quantity_Color
") InteriorColor;
		const Quantity_Color & InteriorColor();

		/****************** InteriorColorRGBA ******************/
		/**** md5 signature: 384d675ce829aa2e285b913e4365eb79 ****/
		%feature("compactdefaultargs") InteriorColorRGBA;
		%feature("autodoc", "Return interior color.

Returns
-------
Quantity_ColorRGBA
") InteriorColorRGBA;
		const Quantity_ColorRGBA & InteriorColorRGBA();

		/****************** InteriorStyle ******************/
		/**** md5 signature: 45d0297b03618fc24ff5055820bfb55e ****/
		%feature("compactdefaultargs") InteriorStyle;
		%feature("autodoc", "Return interior rendering style; aspect_is_solid by default.

Returns
-------
Aspect_InteriorStyle
") InteriorStyle;
		Aspect_InteriorStyle InteriorStyle();

		/****************** IsEqual ******************/
		/**** md5 signature: 9c6c9deb326013434fe87e965e640203 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Check for equality with another aspects.

Parameters
----------
theOther: Graphic3d_Aspects

Returns
-------
bool
") IsEqual;
		bool IsEqual(const Graphic3d_Aspects & theOther);

		/****************** IsMarkerSprite ******************/
		/**** md5 signature: 37db8501fdef81ffca82c4ea0edb64df ****/
		%feature("compactdefaultargs") IsMarkerSprite;
		%feature("autodoc", "Returns true if marker should be drawn using marker sprite (either user-provided or generated).

Returns
-------
bool
") IsMarkerSprite;
		bool IsMarkerSprite();

		/****************** IsTextZoomable ******************/
		/**** md5 signature: eb038d91f0438c94d940691891b24f36 ****/
		%feature("compactdefaultargs") IsTextZoomable;
		%feature("autodoc", "Returns true when the text zoomable is on.

Returns
-------
bool
") IsTextZoomable;
		bool IsTextZoomable();

		/****************** LineType ******************/
		/**** md5 signature: 6ae68230b33e9e754a59131adc3dc5c1 ****/
		%feature("compactdefaultargs") LineType;
		%feature("autodoc", "Return line type; aspect_tol_solid by default.

Returns
-------
Aspect_TypeOfLine
") LineType;
		Aspect_TypeOfLine LineType();

		/****************** LineWidth ******************/
		/**** md5 signature: 525ec9e8ba2d3cc4dafdb10c0f3d85f8 ****/
		%feature("compactdefaultargs") LineWidth;
		%feature("autodoc", "Return width for edges in pixels; 1.0 by default.

Returns
-------
Standard_ShortReal
") LineWidth;
		Standard_ShortReal LineWidth();

		/****************** MarkerImage ******************/
		/**** md5 signature: f83a5773dd88984525c91de89afe25a4 ****/
		%feature("compactdefaultargs") MarkerImage;
		%feature("autodoc", "Returns marker's image texture. could be null handle if marker aspect has been initialized as default type of marker.

Returns
-------
opencascade::handle<Graphic3d_MarkerImage>
") MarkerImage;
		const opencascade::handle<Graphic3d_MarkerImage> & MarkerImage();

		/****************** MarkerScale ******************/
		/**** md5 signature: aad2097b5af4a9b644438f7144b91d17 ****/
		%feature("compactdefaultargs") MarkerScale;
		%feature("autodoc", "Return marker scale factor; 1.0 by default.

Returns
-------
Standard_ShortReal
") MarkerScale;
		Standard_ShortReal MarkerScale();

		/****************** MarkerType ******************/
		/**** md5 signature: 191ac2efa41e30b533cb10620a7a11df ****/
		%feature("compactdefaultargs") MarkerType;
		%feature("autodoc", "Return marker type; aspect_tom_point by default.

Returns
-------
Aspect_TypeOfMarker
") MarkerType;
		Aspect_TypeOfMarker MarkerType();

		/****************** PolygonOffset ******************/
		/**** md5 signature: 5bc0db1ff0ef7eec07c4eb78b80f6cca ****/
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "Returns current polygon offsets settings.

Returns
-------
Graphic3d_PolygonOffset
") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset();

		/****************** PolygonOffsets ******************/
		/**** md5 signature: 73eaf06610be37df77e4abd92c14e4d2 ****/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "Returns current polygon offsets settings.

Parameters
----------
theFactor: Standard_ShortReal
theUnits: Standard_ShortReal

Returns
-------
theMode: int
") PolygonOffsets;
		void PolygonOffsets(Standard_Integer &OutValue, Standard_ShortReal & theFactor, Standard_ShortReal & theUnits);

		/****************** SetAlphaMode ******************/
		/**** md5 signature: b84cdd4cb6d53fa03454718b7ba18032 ****/
		%feature("compactdefaultargs") SetAlphaMode;
		%feature("autodoc", "Defines the way how alpha value should be treated.

Parameters
----------
theMode: Graphic3d_AlphaMode
theAlphaCutoff: Standard_ShortReal,optional
	default value is 0.5f

Returns
-------
None
") SetAlphaMode;
		void SetAlphaMode(Graphic3d_AlphaMode theMode, Standard_ShortReal theAlphaCutoff = 0.5f);

		/****************** SetBackInteriorColor ******************/
		/**** md5 signature: 0eb222f94cb4cedfb4675fc7a778c746 ****/
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "Modifies the color of the interior of the back face.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetBackInteriorColor;
		void SetBackInteriorColor(const Quantity_Color & theColor);

		/****************** SetBackInteriorColor ******************/
		/**** md5 signature: 1ac4b62834b23720aa71ec554afa2b42 ****/
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "Modifies the color of the interior of the back face.

Parameters
----------
theColor: Quantity_ColorRGBA

Returns
-------
None
") SetBackInteriorColor;
		void SetBackInteriorColor(const Quantity_ColorRGBA & theColor);

		/****************** SetBackMaterial ******************/
		/**** md5 signature: 0796d7a91bd9fded95bfe550066edd54 ****/
		%feature("compactdefaultargs") SetBackMaterial;
		%feature("autodoc", "Modifies the surface material of internal faces.

Parameters
----------
theMaterial: Graphic3d_MaterialAspect

Returns
-------
None
") SetBackMaterial;
		void SetBackMaterial(const Graphic3d_MaterialAspect & theMaterial);

		/****************** SetColor ******************/
		/**** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Modifies the color.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetColorSubTitle ******************/
		/**** md5 signature: b8dff86a23c012bf0fc166e089f32797 ****/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "Modifies text background/shadow color; equals to edgecolor() property.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColorSubTitle;
		void SetColorSubTitle(const Quantity_Color & theColor);

		/****************** SetColorSubTitle ******************/
		/**** md5 signature: 366032eddc73ad7164a54cb28550c2e6 ****/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "Modifies text background/shadow color; equals to edgecolor() property.

Parameters
----------
theColor: Quantity_ColorRGBA

Returns
-------
None
") SetColorSubTitle;
		void SetColorSubTitle(const Quantity_ColorRGBA & theColor);

		/****************** SetDistinguish ******************/
		/**** md5 signature: 76455feae8e798c74be25ad0b45d935f ****/
		%feature("compactdefaultargs") SetDistinguish;
		%feature("autodoc", "Set material distinction between front and back faces.

Parameters
----------
toDistinguish: bool

Returns
-------
None
") SetDistinguish;
		void SetDistinguish(bool toDistinguish);

		/****************** SetDistinguishOff ******************/
		/**** md5 signature: 63b9d9d34afec45ea7929fa232816c0a ****/
		%feature("compactdefaultargs") SetDistinguishOff;
		%feature("autodoc", "Forbids material distinction between front and back faces.

Returns
-------
None
") SetDistinguishOff;
		void SetDistinguishOff();

		/****************** SetDistinguishOn ******************/
		/**** md5 signature: 11cab8d2ed03315d6cef72413a6f2c0e ****/
		%feature("compactdefaultargs") SetDistinguishOn;
		%feature("autodoc", "Allows material distinction between front and back faces.

Returns
-------
None
") SetDistinguishOn;
		void SetDistinguishOn();

		/****************** SetDrawEdges ******************/
		/**** md5 signature: ed098dddd2db1cbebf5f0f5b7faab252 ****/
		%feature("compactdefaultargs") SetDrawEdges;
		%feature("autodoc", "Set if mesh edges should be drawn or not.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawEdges;
		void SetDrawEdges(bool theToDraw);

		/****************** SetDrawSilhouette ******************/
		/**** md5 signature: 97a46083210a65f184ecb83925fdec43 ****/
		%feature("compactdefaultargs") SetDrawSilhouette;
		%feature("autodoc", "Enables/disables drawing silhouette (outline).

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawSilhouette;
		void SetDrawSilhouette(bool theToDraw);

		/****************** SetEdgeColor ******************/
		/**** md5 signature: d00577edf69caa0380c91743cfde58a3 ****/
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "Modifies the color of the edge of the face.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetEdgeColor;
		void SetEdgeColor(const Quantity_Color & theColor);

		/****************** SetEdgeColor ******************/
		/**** md5 signature: 4dc69c28314e0005ef63bdc261ea2d54 ****/
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "Modifies the color of the edge of the face.

Parameters
----------
theColor: Quantity_ColorRGBA

Returns
-------
None
") SetEdgeColor;
		void SetEdgeColor(const Quantity_ColorRGBA & theColor);

		/****************** SetEdgeLineType ******************/
		/**** md5 signature: b1791fa33e1cb77a340b2371826e303d ****/
		%feature("compactdefaultargs") SetEdgeLineType;
		%feature("autodoc", "Modifies the edge line type (same as setlinetype()).

Parameters
----------
theType: Aspect_TypeOfLine

Returns
-------
None
") SetEdgeLineType;
		void SetEdgeLineType(Aspect_TypeOfLine theType);

		/****************** SetEdgeOff ******************/
		/**** md5 signature: 209653f93a4a475b948b658dadb3c5b8 ****/
		%feature("compactdefaultargs") SetEdgeOff;
		%feature("autodoc", "The edges of fillareas are not drawn.

Returns
-------
None
") SetEdgeOff;
		void SetEdgeOff();

		/****************** SetEdgeOn ******************/
		/**** md5 signature: 12716e13a8bcb1a1053a2855ca9739e1 ****/
		%feature("compactdefaultargs") SetEdgeOn;
		%feature("autodoc", "The edges of fillareas are drawn.

Returns
-------
None
") SetEdgeOn;
		void SetEdgeOn();

		/****************** SetEdgeWidth ******************/
		/**** md5 signature: 1b9374e10baaa83634a6a4139bb9f9f7 ****/
		%feature("compactdefaultargs") SetEdgeWidth;
		%feature("autodoc", "Modifies the edge thickness (same as setlinewidth()).

Parameters
----------
theWidth: float

Returns
-------
None
") SetEdgeWidth;
		void SetEdgeWidth(Standard_Real theWidth);

		/****************** SetFrontMaterial ******************/
		/**** md5 signature: 14c2813796ead5a225d907bc718417d2 ****/
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "Modifies the surface material of external faces.

Parameters
----------
theMaterial: Graphic3d_MaterialAspect

Returns
-------
None
") SetFrontMaterial;
		void SetFrontMaterial(const Graphic3d_MaterialAspect & theMaterial);

		/****************** SetHatchStyle ******************/
		/**** md5 signature: b0caa9e27048ee8a4af14f32988bab5a ****/
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "Modifies the hatch type used when interiorstyle is is_hatch.

Parameters
----------
theStyle: Graphic3d_HatchStyle

Returns
-------
None
") SetHatchStyle;
		void SetHatchStyle(const opencascade::handle<Graphic3d_HatchStyle> & theStyle);

		/****************** SetHatchStyle ******************/
		/**** md5 signature: 571c2e2029ec1961c6be66b9697ae219 ****/
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "Modifies the hatch type used when interiorstyle is is_hatch @warning this method always creates a new handle for a given hatch style.

Parameters
----------
theStyle: Aspect_HatchStyle

Returns
-------
None
") SetHatchStyle;
		void SetHatchStyle(const Aspect_HatchStyle theStyle);

		/****************** SetInteriorColor ******************/
		/**** md5 signature: a5ea883367163149052e810bf49eda6b ****/
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "Modifies the color of the interior of the face.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetInteriorColor;
		void SetInteriorColor(const Quantity_Color & theColor);

		/****************** SetInteriorColor ******************/
		/**** md5 signature: 167ecffce763f5a546bc032caffcc7be ****/
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "Modifies the color of the interior of the face.

Parameters
----------
theColor: Quantity_ColorRGBA

Returns
-------
None
") SetInteriorColor;
		void SetInteriorColor(const Quantity_ColorRGBA & theColor);

		/****************** SetInteriorStyle ******************/
		/**** md5 signature: a275ca9769f814a82eb74f1486e02ca5 ****/
		%feature("compactdefaultargs") SetInteriorStyle;
		%feature("autodoc", "Modifies the interior type used for rendering.

Parameters
----------
theStyle: Aspect_InteriorStyle

Returns
-------
None
") SetInteriorStyle;
		void SetInteriorStyle(const Aspect_InteriorStyle theStyle);

		/****************** SetLineType ******************/
		/**** md5 signature: 62e1ffe971a62e7ffb6bed2fec770aa5 ****/
		%feature("compactdefaultargs") SetLineType;
		%feature("autodoc", "Modifies the line type.

Parameters
----------
theType: Aspect_TypeOfLine

Returns
-------
None
") SetLineType;
		void SetLineType(Aspect_TypeOfLine theType);

		/****************** SetLineWidth ******************/
		/**** md5 signature: 0eb60d9fdb84bb68cf3a753adfe98805 ****/
		%feature("compactdefaultargs") SetLineWidth;
		%feature("autodoc", "Modifies the line thickness warning: raises standard_outofrange if the width is a negative value.

Parameters
----------
theWidth: Standard_ShortReal

Returns
-------
None
") SetLineWidth;
		void SetLineWidth(Standard_ShortReal theWidth);

		/****************** SetMarkerImage ******************/
		/**** md5 signature: 8819a7c66f25d37dc3c3b63f7a6e58bd ****/
		%feature("compactdefaultargs") SetMarkerImage;
		%feature("autodoc", "Set marker's image texture.

Parameters
----------
theImage: Graphic3d_MarkerImage

Returns
-------
None
") SetMarkerImage;
		void SetMarkerImage(const opencascade::handle<Graphic3d_MarkerImage> & theImage);

		/****************** SetMarkerScale ******************/
		/**** md5 signature: 60ed397efaf31205c838730941f1b45b ****/
		%feature("compactdefaultargs") SetMarkerScale;
		%feature("autodoc", "Modifies the scale factor. marker type aspect_tom_point is not affected by the marker size scale factor. it is always the smallest displayable dot. warning: raises standard_outofrange if the scale is a negative value.

Parameters
----------
theScale: Standard_ShortReal

Returns
-------
None
") SetMarkerScale;
		void SetMarkerScale(const Standard_ShortReal theScale);

		/****************** SetMarkerType ******************/
		/**** md5 signature: 4c156fccf7ff437b07f34c3e68fc8687 ****/
		%feature("compactdefaultargs") SetMarkerType;
		%feature("autodoc", "Modifies the type of marker.

Parameters
----------
theType: Aspect_TypeOfMarker

Returns
-------
None
") SetMarkerType;
		void SetMarkerType(Aspect_TypeOfMarker theType);

		/****************** SetPolygonOffset ******************/
		/**** md5 signature: de9a863ce5dbd13394cd0a5ee6099e7d ****/
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "Sets polygon offsets settings.

Parameters
----------
theOffset: Graphic3d_PolygonOffset

Returns
-------
None
") SetPolygonOffset;
		void SetPolygonOffset(const Graphic3d_PolygonOffset & theOffset);

		/****************** SetPolygonOffsets ******************/
		/**** md5 signature: 875b08faf986672214b47ef3a8042de0 ****/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "Sets up opengl polygon offsets mechanism. <amode> parameter can contain various combinations of aspect_polygonoffsetmode enumeration elements (aspect_pom_none means that polygon offsets are not changed). if <amode> is different from aspect_pom_off and aspect_pom_none, then <afactor> and <aunits> arguments are used by graphic renderer to calculate a depth offset value: //! offset = <afactor> * m + <aunits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific) //! default settings for occ 3d viewer: mode = aspect_pom_fill, factor = 1., units = 0. //! negative offset values move polygons closer to the viewport, while positive values shift polygons away. consult opengl reference for details (glpolygonoffset function description).

Parameters
----------
theMode: int
theFactor: Standard_ShortReal,optional
	default value is 1.0f
theUnits: Standard_ShortReal,optional
	default value is 0.0f

Returns
-------
None
") SetPolygonOffsets;
		void SetPolygonOffsets(const Standard_Integer theMode, const Standard_ShortReal theFactor = 1.0f, const Standard_ShortReal theUnits = 0.0f);

		/****************** SetShaderProgram ******************/
		/**** md5 signature: c84389c506ab3fabe77cf1234a780afa ****/
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "Sets up opengl/glsl shader program.

Parameters
----------
theProgram: Graphic3d_ShaderProgram

Returns
-------
None
") SetShaderProgram;
		void SetShaderProgram(const opencascade::handle<Graphic3d_ShaderProgram> & theProgram);

		/****************** SetShadingModel ******************/
		/**** md5 signature: b67fea2d2f670ea5a35640bade585ab6 ****/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "Sets shading model.

Parameters
----------
theShadingModel: Graphic3d_TypeOfShadingModel

Returns
-------
None
") SetShadingModel;
		void SetShadingModel(const Graphic3d_TypeOfShadingModel theShadingModel);

		/****************** SetSkipFirstEdge ******************/
		/**** md5 signature: f2d4f63e4a0ad4c4929bcef0cec93d44 ****/
		%feature("compactdefaultargs") SetSkipFirstEdge;
		%feature("autodoc", "Set skip first triangle edge flag for drawing wireframe presentation of quads array split into triangles.

Parameters
----------
theToSkipFirstEdge: bool

Returns
-------
None
") SetSkipFirstEdge;
		void SetSkipFirstEdge(bool theToSkipFirstEdge);

		/****************** SetSuppressBackFaces ******************/
		/**** md5 signature: 564c9f4e84c67aeaced26807dd97d26a ****/
		%feature("compactdefaultargs") SetSuppressBackFaces;
		%feature("autodoc", "Assign back faces culling flag.

Parameters
----------
theToSuppress: bool

Returns
-------
None
") SetSuppressBackFaces;
		void SetSuppressBackFaces(bool theToSuppress);

		/****************** SetTextAngle ******************/
		/**** md5 signature: 3ee52ff3f2c11f29011661351a275d89 ****/
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "Turns usage of text rotated.

Parameters
----------
theAngle: Standard_ShortReal

Returns
-------
None
") SetTextAngle;
		void SetTextAngle(Standard_ShortReal theAngle);

		/****************** SetTextDisplayType ******************/
		/**** md5 signature: 2e96c2145c3c7f0b188d92bddea3f5af ****/
		%feature("compactdefaultargs") SetTextDisplayType;
		%feature("autodoc", "Sets display type.

Parameters
----------
theType: Aspect_TypeOfDisplayText

Returns
-------
None
") SetTextDisplayType;
		void SetTextDisplayType(Aspect_TypeOfDisplayText theType);

		/****************** SetTextFont ******************/
		/**** md5 signature: c18c74f455bd2b8d768cc533264b5e0c ****/
		%feature("compactdefaultargs") SetTextFont;
		%feature("autodoc", "Modifies the font.

Parameters
----------
theFont: TCollection_HAsciiString

Returns
-------
None
") SetTextFont;
		void SetTextFont(const opencascade::handle<TCollection_HAsciiString> & theFont);

		/****************** SetTextFontAspect ******************/
		/**** md5 signature: e898525ff5b5d8c72752eab8f189cfaf ****/
		%feature("compactdefaultargs") SetTextFontAspect;
		%feature("autodoc", "Turns usage of aspect text.

Parameters
----------
theFontAspect: Font_FontAspect

Returns
-------
None
") SetTextFontAspect;
		void SetTextFontAspect(Font_FontAspect theFontAspect);

		/****************** SetTextStyle ******************/
		/**** md5 signature: e039456428ed8ebe7153ce18e9ea6326 ****/
		%feature("compactdefaultargs") SetTextStyle;
		%feature("autodoc", "Modifies the style of the text.

Parameters
----------
theStyle: Aspect_TypeOfStyleText

Returns
-------
None
") SetTextStyle;
		void SetTextStyle(Aspect_TypeOfStyleText theStyle);

		/****************** SetTextZoomable ******************/
		/**** md5 signature: 799263abda100ba563c33475ad702060 ****/
		%feature("compactdefaultargs") SetTextZoomable;
		%feature("autodoc", "Turns usage of text zoomable on/off.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetTextZoomable;
		void SetTextZoomable(bool theFlag);

		/****************** SetTextureMap ******************/
		/**** md5 signature: 4d0afcd350d6e9df864d41b902c76518 ****/
		%feature("compactdefaultargs") SetTextureMap;
		%feature("autodoc", "Assign texture to be mapped. see also settexturemapon() to actually activate texture mapping. ////standard_deprecated('deprecated method, settextureset() should be used instead').

Parameters
----------
theTexture: Graphic3d_TextureMap

Returns
-------
None
") SetTextureMap;
		void SetTextureMap(const opencascade::handle<Graphic3d_TextureMap> & theTexture);

		/****************** SetTextureMapOff ******************/
		/**** md5 signature: 3c272f8a19f195db8799bfd674501adc ****/
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "Disable texture mapping.

Returns
-------
None
") SetTextureMapOff;
		void SetTextureMapOff();

		/****************** SetTextureMapOn ******************/
		/**** md5 signature: 8125d601fb4d3e18193da8566d56acf6 ****/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "Enable or disable texture mapping (has no effect if texture is not set).

Parameters
----------
theToMap: bool

Returns
-------
None
") SetTextureMapOn;
		void SetTextureMapOn(bool theToMap);

		/****************** SetTextureMapOn ******************/
		/**** md5 signature: 0d7467974fbdade3c449a3231166dff5 ****/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "Enable texture mapping (has no effect if texture is not set).

Returns
-------
None
") SetTextureMapOn;
		void SetTextureMapOn();

		/****************** SetTextureSet ******************/
		/**** md5 signature: 944fc8551c5f0eb6dce05b79e6b27914 ****/
		%feature("compactdefaultargs") SetTextureSet;
		%feature("autodoc", "Setup texture array to be mapped.

Parameters
----------
theTextures: Graphic3d_TextureSet

Returns
-------
None
") SetTextureSet;
		void SetTextureSet(const opencascade::handle<Graphic3d_TextureSet> & theTextures);

		/****************** ShaderProgram ******************/
		/**** md5 signature: 857f7359f9600b740c8753a620f5d3f1 ****/
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "Return shader program.

Returns
-------
opencascade::handle<Graphic3d_ShaderProgram>
") ShaderProgram;
		const opencascade::handle<Graphic3d_ShaderProgram> & ShaderProgram();

		/****************** ShadingModel ******************/
		/**** md5 signature: abf83d7e5f232094cc54f18d79b6661e ****/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "Returns shading model; graphic3d_tosm_default by default. graphic3d_tosm_default means that shading model set as default for entire viewer will be used.

Returns
-------
Graphic3d_TypeOfShadingModel
") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel();

		/****************** SuppressBackFace ******************/
		/**** md5 signature: 40795a90417758ffefc9ee3a73a12893 ****/
		%feature("compactdefaultargs") SuppressBackFace;
		%feature("autodoc", "Suppress the display of back-facing filled polygons. a back-facing polygon is defined as a polygon whose vertices are in a clockwise order with respect to screen coordinates.

Returns
-------
None
") SuppressBackFace;
		void SuppressBackFace();

		/****************** TextAngle ******************/
		/**** md5 signature: 6861f63feeea7d00ebdaeb2dcaa31bb6 ****/
		%feature("compactdefaultargs") TextAngle;
		%feature("autodoc", "Returns angle of degree.

Returns
-------
Standard_ShortReal
") TextAngle;
		Standard_ShortReal TextAngle();

		/****************** TextDisplayType ******************/
		/**** md5 signature: ea1f820655d16faac3b1a1ea22eee6dd ****/
		%feature("compactdefaultargs") TextDisplayType;
		%feature("autodoc", "Returns display type; aspect_todt_normal by default.

Returns
-------
Aspect_TypeOfDisplayText
") TextDisplayType;
		Aspect_TypeOfDisplayText TextDisplayType();

		/****************** TextFont ******************/
		/**** md5 signature: 5136fe0c05487d07cd0e4d290be5ba22 ****/
		%feature("compactdefaultargs") TextFont;
		%feature("autodoc", "Returns the font; null string by default.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TextFont;
		const opencascade::handle<TCollection_HAsciiString> & TextFont();

		/****************** TextFontAspect ******************/
		/**** md5 signature: a701b63eb2707cde117bd21c1051e309 ****/
		%feature("compactdefaultargs") TextFontAspect;
		%feature("autodoc", "Returns text fontaspect.

Returns
-------
Font_FontAspect
") TextFontAspect;
		Font_FontAspect TextFontAspect();

		/****************** TextStyle ******************/
		/**** md5 signature: 5b8dce3790d8c9a8bbe5b487fc4173d7 ****/
		%feature("compactdefaultargs") TextStyle;
		%feature("autodoc", "Returns the text style; aspect_tost_normal by default.

Returns
-------
Aspect_TypeOfStyleText
") TextStyle;
		Aspect_TypeOfStyleText TextStyle();

		/****************** TextureMap ******************/
		/**** md5 signature: d3f3eab9972845b733ae189c505c62cb ****/
		%feature("compactdefaultargs") TextureMap;
		%feature("autodoc", "Return texture to be mapped. ////standard_deprecated('deprecated method, textureset() should be used instead').

Returns
-------
opencascade::handle<Graphic3d_TextureMap>
") TextureMap;
		opencascade::handle<Graphic3d_TextureMap> TextureMap();

		/****************** TextureMapState ******************/
		/**** md5 signature: c311bbaba192ed972f153a49cf92dd65 ****/
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "Return true if texture mapping is enabled (false by default).

Returns
-------
bool
") TextureMapState;
		bool TextureMapState();

		/****************** TextureSet ******************/
		/**** md5 signature: 2ff25b571bcd3bc16bd831d38b3d247c ****/
		%feature("compactdefaultargs") TextureSet;
		%feature("autodoc", "Return texture array to be mapped.

Returns
-------
opencascade::handle<Graphic3d_TextureSet>
") TextureSet;
		const opencascade::handle<Graphic3d_TextureSet> & TextureSet();

		/****************** ToDrawEdges ******************/
		/**** md5 signature: ebb13a2795fd190f68dd5ad205901719 ****/
		%feature("compactdefaultargs") ToDrawEdges;
		%feature("autodoc", "Returns true if mesh edges should be drawn (false by default).

Returns
-------
bool
") ToDrawEdges;
		bool ToDrawEdges();

		/****************** ToDrawSilhouette ******************/
		/**** md5 signature: 2c0c0fd754c64cc57f345fc665cc8f33 ****/
		%feature("compactdefaultargs") ToDrawSilhouette;
		%feature("autodoc", "Returns true if silhouette (outline) should be drawn (with edge color and width); false by default.

Returns
-------
bool
") ToDrawSilhouette;
		bool ToDrawSilhouette();

		/****************** ToMapTexture ******************/
		/**** md5 signature: a39a45bca6ada99b43c1aa203f766447 ****/
		%feature("compactdefaultargs") ToMapTexture;
		%feature("autodoc", "Return true if texture mapping is enabled (false by default).

Returns
-------
bool
") ToMapTexture;
		bool ToMapTexture();

		/****************** ToSkipFirstEdge ******************/
		/**** md5 signature: ba01086b9308813c90b7110fc2f4ac55 ****/
		%feature("compactdefaultargs") ToSkipFirstEdge;
		%feature("autodoc", "Returns true if drawing element edges should discard first edge in triangle; false by default. graphics hardware works mostly with triangles, so that wireframe presentation will draw triangle edges by default. this flag allows rendering wireframe presentation of quad-only array split into triangles. for this, quads should be split in specific order, so that the quad diagonal (to be not rendered) goes first: 1------2 / / triangle #1: 2-0-1; triangle #2: 0-2-3 0------3.

Returns
-------
bool
") ToSkipFirstEdge;
		bool ToSkipFirstEdge();

		/****************** ToSuppressBackFaces ******************/
		/**** md5 signature: 291ab01b16ecdd1cdd1cbdf740311643 ****/
		%feature("compactdefaultargs") ToSuppressBackFaces;
		%feature("autodoc", "Returns true if back faces should be suppressed (true by default).

Returns
-------
bool
") ToSuppressBackFaces;
		bool ToSuppressBackFaces();

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
		/**** md5 signature: a77b679b88eb698b5f0f9ecff72ba9ba ****/
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Stride;
		Standard_Integer Stride();

		/****************** Stride ******************/
		/**** md5 signature: 7575368fa3b9ff6936d85d9a182b40a3 ****/
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "Returns size of attribute of specified data type.

Parameters
----------
theType: Graphic3d_TypeOfData

Returns
-------
int
") Stride;
		static Standard_Integer Stride(const Graphic3d_TypeOfData theType);

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
		/****************** Graphic3d_AxisAspect ******************/
		/**** md5 signature: 4ea4a435a2d6931062e4467f5e084cd5 ****/
		%feature("compactdefaultargs") Graphic3d_AxisAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_ExtendedString,optional
	default value is ""
theNameColor: Quantity_Color,optional
	default value is Quantity_NOC_BLACK
theColor: Quantity_Color,optional
	default value is Quantity_NOC_BLACK
theValuesOffset: int,optional
	default value is 10
theNameOffset: int,optional
	default value is 30
theTickmarksNumber: int,optional
	default value is 5
theTickmarksLength: int,optional
	default value is 10
theToDrawName: bool,optional
	default value is Standard_True
theToDrawValues: bool,optional
	default value is Standard_True
theToDrawTickmarks: bool,optional
	default value is Standard_True

Returns
-------
None
") Graphic3d_AxisAspect;
		 Graphic3d_AxisAspect(const TCollection_ExtendedString theName = "", const Quantity_Color theNameColor = Quantity_NOC_BLACK, const Quantity_Color theColor = Quantity_NOC_BLACK, const Standard_Integer theValuesOffset = 10, const Standard_Integer theNameOffset = 30, const Standard_Integer theTickmarksNumber = 5, const Standard_Integer theTickmarksLength = 10, const Standard_Boolean theToDrawName = Standard_True, const Standard_Boolean theToDrawValues = Standard_True, const Standard_Boolean theToDrawTickmarks = Standard_True);

		/****************** Color ******************/
		/**** md5 signature: 7cec116411eb20e52d1fabf3015346da ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Color of axis and values.

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color & Color();

		/****************** Name ******************/
		/**** md5 signature: ded670f8c959c700ee5b649851616506 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_ExtendedString
") Name;
		const TCollection_ExtendedString & Name();

		/****************** NameColor ******************/
		/**** md5 signature: 1bf8facd7a4ba2083dd1b64cd920b968 ****/
		%feature("compactdefaultargs") NameColor;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") NameColor;
		const Quantity_Color & NameColor();

		/****************** NameOffset ******************/
		/**** md5 signature: d485aa83e35b31eb318e24da05db54c2 ****/
		%feature("compactdefaultargs") NameOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NameOffset;
		Standard_Integer NameOffset();

		/****************** SetColor ******************/
		/**** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets color of axis and values.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetDrawName ******************/
		/**** md5 signature: 3ee89854bd128ec955c2273669b07f9b ****/
		%feature("compactdefaultargs") SetDrawName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawName;
		void SetDrawName(const Standard_Boolean theToDraw);

		/****************** SetDrawTickmarks ******************/
		/**** md5 signature: ade4444adbb386df0453b8df25a61a25 ****/
		%feature("compactdefaultargs") SetDrawTickmarks;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawTickmarks;
		void SetDrawTickmarks(const Standard_Boolean theToDraw);

		/****************** SetDrawValues ******************/
		/**** md5 signature: 692149c3a71de71e782e99dd6cb5f034 ****/
		%feature("compactdefaultargs") SetDrawValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawValues;
		void SetDrawValues(const Standard_Boolean theToDraw);

		/****************** SetName ******************/
		/**** md5 signature: ea685ef0c0867da956c74657595f5dd9 ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "No available documentation.

Parameters
----------
theName: TCollection_ExtendedString

Returns
-------
None
") SetName;
		void SetName(const TCollection_ExtendedString & theName);

		/****************** SetNameColor ******************/
		/**** md5 signature: 6b3f0e3ef95cd72b668ced4bbb4dc39a ****/
		%feature("compactdefaultargs") SetNameColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetNameColor;
		void SetNameColor(const Quantity_Color & theColor);

		/****************** SetNameOffset ******************/
		/**** md5 signature: 39e06e5cc312be922a7118d1d3e2dd7d ****/
		%feature("compactdefaultargs") SetNameOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
None
") SetNameOffset;
		void SetNameOffset(const Standard_Integer theValue);

		/****************** SetTickmarksLength ******************/
		/**** md5 signature: b323b591bea750c0ec1724c0691bf803 ****/
		%feature("compactdefaultargs") SetTickmarksLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
None
") SetTickmarksLength;
		void SetTickmarksLength(const Standard_Integer theValue);

		/****************** SetTickmarksNumber ******************/
		/**** md5 signature: 724c2a562f7632df94ddd9c5a375f1d1 ****/
		%feature("compactdefaultargs") SetTickmarksNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
None
") SetTickmarksNumber;
		void SetTickmarksNumber(const Standard_Integer theValue);

		/****************** SetValuesOffset ******************/
		/**** md5 signature: 43182c8cd81d0be321cc1e01ec405954 ****/
		%feature("compactdefaultargs") SetValuesOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
None
") SetValuesOffset;
		void SetValuesOffset(const Standard_Integer theValue);

		/****************** TickmarksLength ******************/
		/**** md5 signature: 2aa03627d5803e8330017f85d763b09e ****/
		%feature("compactdefaultargs") TickmarksLength;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TickmarksLength;
		Standard_Integer TickmarksLength();

		/****************** TickmarksNumber ******************/
		/**** md5 signature: 7a2a42e1740320790ae83fffb400a679 ****/
		%feature("compactdefaultargs") TickmarksNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") TickmarksNumber;
		Standard_Integer TickmarksNumber();

		/****************** ToDrawName ******************/
		/**** md5 signature: aea292672474d11f477b530d0bd2b618 ****/
		%feature("compactdefaultargs") ToDrawName;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ToDrawName;
		Standard_Boolean ToDrawName();

		/****************** ToDrawTickmarks ******************/
		/**** md5 signature: cc80ef81fea8024f206f1155ae3c871c ****/
		%feature("compactdefaultargs") ToDrawTickmarks;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ToDrawTickmarks;
		Standard_Boolean ToDrawTickmarks();

		/****************** ToDrawValues ******************/
		/**** md5 signature: 9ee5b6720a41562cb3d98fef0a6c294f ****/
		%feature("compactdefaultargs") ToDrawValues;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ToDrawValues;
		Standard_Boolean ToDrawValues();

		/****************** ValuesOffset ******************/
		/**** md5 signature: 9d010d056cb425f5962bfaaa3c5e6f29 ****/
		%feature("compactdefaultargs") ValuesOffset;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ValuesOffset;
		Standard_Integer ValuesOffset();

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
		/****************** Graphic3d_BSDF ******************/
		/**** md5 signature: ef3e719f8cae4402739eaa9a4c4dfb45 ****/
		%feature("compactdefaultargs") Graphic3d_BSDF;
		%feature("autodoc", "Creates uninitialized bsdf.

Returns
-------
None
") Graphic3d_BSDF;
		 Graphic3d_BSDF();

		/****************** CreateDiffuse ******************/
		/**** md5 signature: c45c01d44b9511054d6d111c7ff8e5c1 ****/
		%feature("compactdefaultargs") CreateDiffuse;
		%feature("autodoc", "Creates bsdf describing diffuse (lambertian) surface.

Parameters
----------
theWeight: Graphic3d_Vec3

Returns
-------
Graphic3d_BSDF
") CreateDiffuse;
		static Graphic3d_BSDF CreateDiffuse(const Graphic3d_Vec3 & theWeight);

		/****************** CreateGlass ******************/
		/**** md5 signature: 8ed0e5780bcdc30c99e1d934e7dd310a ****/
		%feature("compactdefaultargs") CreateGlass;
		%feature("autodoc", "Creates bsdf describing glass-like object. glass-like bsdf mixes refraction and reflection effects at grazing angles using physically-based fresnel dielectric model.

Parameters
----------
theWeight: Graphic3d_Vec3
theAbsorptionColor: Graphic3d_Vec3
theAbsorptionCoeff: Standard_ShortReal
theRefractionIndex: Standard_ShortReal

Returns
-------
Graphic3d_BSDF
") CreateGlass;
		static Graphic3d_BSDF CreateGlass(const Graphic3d_Vec3 & theWeight, const Graphic3d_Vec3 & theAbsorptionColor, const Standard_ShortReal theAbsorptionCoeff, const Standard_ShortReal theRefractionIndex);

		/****************** CreateMetallic ******************/
		/**** md5 signature: 07a0b4d54faa0c1ac4d80864cbfcef9e ****/
		%feature("compactdefaultargs") CreateMetallic;
		%feature("autodoc", "Creates bsdf describing polished metallic-like surface.

Parameters
----------
theWeight: Graphic3d_Vec3
theFresnel: Graphic3d_Fresnel
theRoughness: Standard_ShortReal

Returns
-------
Graphic3d_BSDF
") CreateMetallic;
		static Graphic3d_BSDF CreateMetallic(const Graphic3d_Vec3 & theWeight, const Graphic3d_Fresnel & theFresnel, const Standard_ShortReal theRoughness);

		/****************** CreateTransparent ******************/
		/**** md5 signature: 52d78d15959bff96f6cccedb7f40bfd1 ****/
		%feature("compactdefaultargs") CreateTransparent;
		%feature("autodoc", "Creates bsdf describing transparent object. transparent bsdf models simple transparency without refraction (the ray passes straight through the surface).

Parameters
----------
theWeight: Graphic3d_Vec3
theAbsorptionColor: Graphic3d_Vec3
theAbsorptionCoeff: Standard_ShortReal

Returns
-------
Graphic3d_BSDF
") CreateTransparent;
		static Graphic3d_BSDF CreateTransparent(const Graphic3d_Vec3 & theWeight, const Graphic3d_Vec3 & theAbsorptionColor, const Standard_ShortReal theAbsorptionCoeff);

		/****************** Normalize ******************/
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Normalizes bsdf components.

Returns
-------
None
") Normalize;
		void Normalize();


            %extend{
                bool __eq_wrapper__(const Graphic3d_BSDF other) {
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
		/**** md5 signature: bc430c6678816ed8a40cb9c1495ede84 ****/
		%feature("compactdefaultargs") Graphic3d_BoundBuffer;
		%feature("autodoc", "Empty constructor.

Parameters
----------
theAlloc: NCollection_BaseAllocator

Returns
-------
None
") Graphic3d_BoundBuffer;
		 Graphic3d_BoundBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** Init ******************/
		/**** md5 signature: 694bf4addd159e7bda9f19dbe5cbf854 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Allocates new empty array.

Parameters
----------
theNbBounds: int
theHasColors: bool

Returns
-------
bool
") Init;
		bool Init(const Standard_Integer theNbBounds, const Standard_Boolean theHasColors);

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
		/****************** Graphic3d_BufferRange ******************/
		/**** md5 signature: 94437812d48eee6ddb30061db0a9b246 ****/
		%feature("compactdefaultargs") Graphic3d_BufferRange;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_BufferRange;
		 Graphic3d_BufferRange();

		/****************** Graphic3d_BufferRange ******************/
		/**** md5 signature: c2f9b36c74e0c3ead5cea47fd1098635 ****/
		%feature("compactdefaultargs") Graphic3d_BufferRange;
		%feature("autodoc", "Constructor.

Parameters
----------
theStart: int
theLength: int

Returns
-------
None
") Graphic3d_BufferRange;
		 Graphic3d_BufferRange(Standard_Integer theStart, Standard_Integer theLength);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear the range.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if range is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Unite ******************/
		/**** md5 signature: 29f02a09e87c574e51a3b11bdb6d001b ****/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "Add another range to this one.

Parameters
----------
theRange: Graphic3d_BufferRange

Returns
-------
None
") Unite;
		void Unite(const Graphic3d_BufferRange & theRange);

		/****************** Upper ******************/
		/**** md5 signature: 621f04fab59b49711e54299100973c4e ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return the upper element within the range.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

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
		/**** md5 signature: a5f68fc9201d04910b61f3ac1f69fb22 ****/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns aabb of the structure.

Parameters
----------
theIdx: int

Returns
-------
Graphic3d_BndBox3d
") Box;
		virtual Graphic3d_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		/**** md5 signature: 82dec1d5725b85fd9fe04818aa66dc03 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Calculates center of the aabb along given axis.

Parameters
----------
theIdx: int
theAxis: int

Returns
-------
float
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** Size ******************/
		/**** md5 signature: 8b9290cdf9c653fc150b9b31776f3f21 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns total number of structures.

Returns
-------
int
") Size;
		virtual Standard_Integer Size();

		/****************** Structures ******************/
		/**** md5 signature: 0247b44b3928398f253d7072dc172188 ****/
		%feature("compactdefaultargs") Structures;
		%feature("autodoc", "Access directly a collection of structures.

Returns
-------
NCollection_IndexedMap< Graphic3d_CStructure *>
") Structures;
		const NCollection_IndexedMap<const Graphic3d_CStructure *> & Structures();

		/****************** Swap ******************/
		/**** md5 signature: 19b601a9d7acdae056493eb6f9eb0b63 ****/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps structures with the given indices.

Parameters
----------
theIdx1: int
theIdx2: int

Returns
-------
None
") Swap;
		virtual void Swap(const Standard_Integer theIdx1, const Standard_Integer theIdx2);

};


%extend Graphic3d_BvhCStructureSet {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Graphic3d_BvhCStructureSet(self):
		pass

	@methodnotwrapped
	def Add(self):
		pass

	@methodnotwrapped
	def Clear(self):
		pass

	@methodnotwrapped
	def GetStructureById(self):
		pass

	@methodnotwrapped
	def Remove(self):
		pass
	}
};

/*******************************************
* class Graphic3d_BvhCStructureSetTrsfPers *
*******************************************/
/*************************
* class Graphic3d_CLight *
*************************/
class Graphic3d_CLight : public Standard_Transient {
	public:
		/****************** Graphic3d_CLight ******************/
		/**** md5 signature: b809aefcc1870097241707b7d23d4549 ****/
		%feature("compactdefaultargs") Graphic3d_CLight;
		%feature("autodoc", "Empty constructor, which should be followed by light source properties configuration.

Parameters
----------
theType: Graphic3d_TypeOfLightSource

Returns
-------
None
") Graphic3d_CLight;
		 Graphic3d_CLight(Graphic3d_TypeOfLightSource theType);

		/****************** Angle ******************/
		/**** md5 signature: 41b2615139437164740cbeacae4fe9f5 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns an angle in radians of the cone created by the spot; 30 degrees by default.

Returns
-------
Standard_ShortReal
") Angle;
		Standard_ShortReal Angle();

		/****************** Attenuation ******************/
		/**** md5 signature: 138ad3e86d9e999df0a2cc8e1a95f005 ****/
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "Returns the attenuation factors.

Parameters
----------

Returns
-------
theConstAttenuation: float
theLinearAttenuation: float
") Attenuation;
		void Attenuation(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Color ******************/
		/**** md5 signature: 7cec116411eb20e52d1fabf3015346da ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the color of the light source; white by default.

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color & Color();

		/****************** Concentration ******************/
		/**** md5 signature: 00797319ff62613b378edbbcb740c6c3 ****/
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "Returns intensity distribution of the spot light, within [0.0, 1.0] range; 1.0 by default. this coefficient should be converted into spotlight exponent within [0.0, 128.0] range: @code float aspotexponent = concentration() * 128.0; anattenuation *= pow (acosa, aspotexponent);' @endcode the concentration factor determines the dispersion of the light on the surface, the default value (1.0) corresponds to a minimum of dispersion.

Returns
-------
Standard_ShortReal
") Concentration;
		Standard_ShortReal Concentration();

		/****************** ConstAttenuation ******************/
		/**** md5 signature: 955df55921c2d7f944ed3a5b85ed3da8 ****/
		%feature("compactdefaultargs") ConstAttenuation;
		%feature("autodoc", "Returns constant attenuation factor of positional/spot light source; 1.0f by default. distance attenuation factors of reducing positional/spot light intensity depending on the distance from its position: @code float anattenuation = 1.0 / (constattenuation() + linearattenuation() * thedistance + quadraticattenuation() * thedistance * thedistance); @endcode.

Returns
-------
Standard_ShortReal
") ConstAttenuation;
		Standard_ShortReal ConstAttenuation();

		/****************** Direction ******************/
		/**** md5 signature: 2b0a515c17ee028a8b572032cfbdfabb ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns direction of directional/spot light.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** Direction ******************/
		/**** md5 signature: f9a9767b8636b03f1d308f2bf07ba8ee ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the thevx, thevy, thevz direction of the light source.

Parameters
----------

Returns
-------
theVx: float
theVy: float
theVz: float
") Direction;
		void Direction(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetId ******************/
		/**** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Returns light resource identifier string.

Returns
-------
TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId();

		/****************** Headlight ******************/
		/**** md5 signature: 222c71e1f3cae4705cc3b43c4928858f ****/
		%feature("compactdefaultargs") Headlight;
		%feature("autodoc", "Alias for isheadlight().

Returns
-------
bool
") Headlight;
		Standard_Boolean Headlight();

		/****************** Intensity ******************/
		/**** md5 signature: 3cd894ea98a6fd6919aeb71739e682b4 ****/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "Returns the intensity of light source; 1.0 by default.

Returns
-------
Standard_ShortReal
") Intensity;
		Standard_ShortReal Intensity();

		/****************** IsEnabled ******************/
		/**** md5 signature: cf6340b5d1701025377d42db5601a57b ****/
		%feature("compactdefaultargs") IsEnabled;
		%feature("autodoc", "Check that the light source is turned on; true by default. this flag affects all occurrences of light sources, where it was registered and activated; so that it is possible defining an active light in view which is actually in disabled state.

Returns
-------
bool
") IsEnabled;
		Standard_Boolean IsEnabled();

		/****************** IsHeadlight ******************/
		/**** md5 signature: ed9492c7a2018410826cfd476ac03601 ****/
		%feature("compactdefaultargs") IsHeadlight;
		%feature("autodoc", "Returns true if the light is a headlight; false by default. headlight flag means that light position/direction are defined not in a world coordinate system, but relative to the camera orientation.

Returns
-------
bool
") IsHeadlight;
		Standard_Boolean IsHeadlight();

		/****************** LinearAttenuation ******************/
		/**** md5 signature: 337763593f2aac7ec6e7b3cec0582a66 ****/
		%feature("compactdefaultargs") LinearAttenuation;
		%feature("autodoc", "Returns linear attenuation factor of positional/spot light source; 0.0 by default. distance attenuation factors of reducing positional/spot light intensity depending on the distance from its position: @code float anattenuation = 1.0 / (constattenuation() + linearattenuation() * thedistance + quadraticattenuation() * thedistance * thedistance); @endcode.

Returns
-------
Standard_ShortReal
") LinearAttenuation;
		Standard_ShortReal LinearAttenuation();

		/****************** Name ******************/
		/**** md5 signature: efed61b92683387cd746fb27e0376505 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns light source name; empty string by default.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** PackedColor ******************/
		/**** md5 signature: 22ee208bf99f0966d5f098e6a42171f3 ****/
		%feature("compactdefaultargs") PackedColor;
		%feature("autodoc", "Returns the color of the light source with dummy alpha component, which should be ignored.

Returns
-------
Graphic3d_Vec4
") PackedColor;
		const Graphic3d_Vec4 & PackedColor();

		/****************** PackedDirection ******************/
		/**** md5 signature: 570ea6336cce8d53dc8ec53afc9f24d5 ****/
		%feature("compactdefaultargs") PackedDirection;
		%feature("autodoc", "Returns direction of directional/spot light.

Returns
-------
Graphic3d_Vec4
") PackedDirection;
		const Graphic3d_Vec4 & PackedDirection();

		/****************** PackedParams ******************/
		/**** md5 signature: f2247bd3e1bb49038fe7d24d792f8d76 ****/
		%feature("compactdefaultargs") PackedParams;
		%feature("autodoc", "Packed light parameters.

Returns
-------
Graphic3d_Vec4
") PackedParams;
		const Graphic3d_Vec4 & PackedParams();

		/****************** Position ******************/
		/**** md5 signature: 0ab08d371c89be0cb1eecbddf304bb77 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns location of positional/spot light; (0, 0, 0) by default.

Returns
-------
gp_Pnt
") Position;
		const gp_Pnt Position();

		/****************** Position ******************/
		/**** md5 signature: 1e2d12f55e7683cd829717411e07e0be ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns location of positional/spot light.

Parameters
----------

Returns
-------
theX: float
theY: float
theZ: float
") Position;
		void Position(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Revision ******************/
		/**** md5 signature: dfd4fb672d125a081a8b5a357ac81453 ****/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "Returns modification counter.

Returns
-------
Standard_Size
") Revision;
		Standard_Size Revision();

		/****************** SetAngle ******************/
		/**** md5 signature: 700ce7b7721533c8d8ed689aadbfaf50 ****/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "Angle in radians of the cone created by the spot, should be within range (0.0, m_pi).

Parameters
----------
theAngle: Standard_ShortReal

Returns
-------
None
") SetAngle;
		void SetAngle(Standard_ShortReal theAngle);

		/****************** SetAttenuation ******************/
		/**** md5 signature: a6bf04efd7505ff51d24f2c2a49aacac ****/
		%feature("compactdefaultargs") SetAttenuation;
		%feature("autodoc", "Defines the coefficients of attenuation; values should be >= 0.0 and their summ should not be equal to 0.

Parameters
----------
theConstAttenuation: Standard_ShortReal
theLinearAttenuation: Standard_ShortReal

Returns
-------
None
") SetAttenuation;
		void SetAttenuation(Standard_ShortReal theConstAttenuation, Standard_ShortReal theLinearAttenuation);

		/****************** SetColor ******************/
		/**** md5 signature: 4493bec663df9e92c429e56b9c76a307 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Defines the color of a light source by giving the basic color.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetConcentration ******************/
		/**** md5 signature: baf57a4fee917494a62ee102134e1147 ****/
		%feature("compactdefaultargs") SetConcentration;
		%feature("autodoc", "Defines the coefficient of concentration; value should be within range [0.0, 1.0].

Parameters
----------
theConcentration: Standard_ShortReal

Returns
-------
None
") SetConcentration;
		void SetConcentration(Standard_ShortReal theConcentration);

		/****************** SetDirection ******************/
		/**** md5 signature: cefc66d5cea733e39294753286bacaa0 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Sets direction of directional/spot light.

Parameters
----------
theDir: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & theDir);

		/****************** SetDirection ******************/
		/**** md5 signature: 73ed886e97258b8835579cb8f83a633a ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Sets direction of directional/spot light.

Parameters
----------
theVx: float
theVy: float
theVz: float

Returns
-------
None
") SetDirection;
		void SetDirection(Standard_Real theVx, Standard_Real theVy, Standard_Real theVz);

		/****************** SetEnabled ******************/
		/**** md5 signature: 5a0e19770edfe90c320cb0dfe22869f5 ****/
		%feature("compactdefaultargs") SetEnabled;
		%feature("autodoc", "Change enabled state of the light state. this call does not remove or deactivate light source in views/viewers; instead it turns it off so that it just have no effect.

Parameters
----------
theIsOn: bool

Returns
-------
None
") SetEnabled;
		void SetEnabled(Standard_Boolean theIsOn);

		/****************** SetHeadlight ******************/
		/**** md5 signature: ccf6c26d8d11ba1f2e65e8364abea4f8 ****/
		%feature("compactdefaultargs") SetHeadlight;
		%feature("autodoc", "Setup headlight flag.

Parameters
----------
theValue: bool

Returns
-------
None
") SetHeadlight;
		void SetHeadlight(Standard_Boolean theValue);

		/****************** SetIntensity ******************/
		/**** md5 signature: aee63a4d018b5d87eda97195df2aebb0 ****/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "Modifies the intensity of light source, which should be > 0.0.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetIntensity;
		void SetIntensity(Standard_ShortReal theValue);

		/****************** SetName ******************/
		/**** md5 signature: 273df384551aa519beda71c20cd913ae ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets light source name.

Parameters
----------
theName: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & theName);

		/****************** SetPosition ******************/
		/**** md5 signature: 6cd7cdcecb59ee7f74eb9c342f464f4d ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Setup location of positional/spot light.

Parameters
----------
thePosition: gp_Pnt

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Pnt & thePosition);

		/****************** SetPosition ******************/
		/**** md5 signature: b21299d058cfd78669786aee2c76c273 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Setup location of positional/spot light.

Parameters
----------
theX: float
theY: float
theZ: float

Returns
-------
None
") SetPosition;
		void SetPosition(Standard_Real theX, Standard_Real theY, Standard_Real theZ);

		/****************** SetSmoothAngle ******************/
		/**** md5 signature: 1d78f5070c438d17265af49cce69d5d4 ****/
		%feature("compactdefaultargs") SetSmoothAngle;
		%feature("autodoc", "Modifies the smoothing angle (in radians) of directional light source; should be within range [0.0, m_pi/2].

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetSmoothAngle;
		void SetSmoothAngle(Standard_ShortReal theValue);

		/****************** SetSmoothRadius ******************/
		/**** md5 signature: 3ac37530c050d4e84740bc9c813cb909 ****/
		%feature("compactdefaultargs") SetSmoothRadius;
		%feature("autodoc", "Modifies the smoothing radius of positional/spot light; should be >= 0.0.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetSmoothRadius;
		void SetSmoothRadius(Standard_ShortReal theValue);

		/****************** Smoothness ******************/
		/**** md5 signature: 14c83a1aa47eeaff0bfc5d8551bb92fb ****/
		%feature("compactdefaultargs") Smoothness;
		%feature("autodoc", "Returns the smoothness of light source (either smoothing angle for directional light or smoothing radius in case of positional light); 0.0 by default.

Returns
-------
Standard_ShortReal
") Smoothness;
		Standard_ShortReal Smoothness();

		/****************** Type ******************/
		/**** md5 signature: d146d133611b424d902f31165fccb442 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of the light, cannot be changed after object construction.

Returns
-------
Graphic3d_TypeOfLightSource
") Type;
		Graphic3d_TypeOfLightSource Type();

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
		opencascade::handle<Graphic3d_ViewAffinity > ViewAffinity;
		unsigned IsInfinite;
		unsigned stick;
		unsigned highlight;
		unsigned visible;
		unsigned HLRValidation;
		unsigned IsForHighlight;
		unsigned IsMutable;
		unsigned Is2dText;
		/****************** BndBoxClipCheck ******************/
		/**** md5 signature: ba16999388552eb20836b46e7cf59d0f ****/
		%feature("compactdefaultargs") BndBoxClipCheck;
		%feature("autodoc", "Returns whether check of object's bounding box clipping is enabled before drawing of object; true by default.

Returns
-------
bool
") BndBoxClipCheck;
		Standard_Boolean BndBoxClipCheck();

		/****************** BoundingBox ******************/
		/**** md5 signature: ec5ef849abfa47e8ebee30a0057dc18a ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of this presentation.

Returns
-------
Graphic3d_BndBox3d
") BoundingBox;
		const Graphic3d_BndBox3d & BoundingBox();

		/****************** ChangeBoundingBox ******************/
		/**** md5 signature: 2730d3d1929f140f237adc334ee1f48d ****/
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "Returns bounding box of this presentation without transformation matrix applied.

Returns
-------
Graphic3d_BndBox3d
") ChangeBoundingBox;
		Graphic3d_BndBox3d & ChangeBoundingBox();

		/****************** Clear ******************/
		/**** md5 signature: d67699716a1d70f3f12e5a2b1d81e2d9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear graphic data.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ClipPlanes ******************/
		/**** md5 signature: 26ab80085e76b6f03b64af6598080486 ****/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Returns associated clip planes.

Returns
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****************** Connect ******************/
		/**** md5 signature: 3c18c412a5529a81d24ebc61ca8f72d3 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Connect other structure to this one.

Parameters
----------
theStructure: Graphic3d_CStructure

Returns
-------
None
") Connect;
		virtual void Connect(Graphic3d_CStructure & theStructure);

		/****************** Disconnect ******************/
		/**** md5 signature: e59d6dd5eef3e2f62b99a476301243d1 ****/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "Disconnect other structure to this one.

Parameters
----------
theStructure: Graphic3d_CStructure

Returns
-------
None
") Disconnect;
		virtual void Disconnect(Graphic3d_CStructure & theStructure);

		/****************** GraphicDriver ******************/
		/**** md5 signature: 92aa99aef6bae4d6a3fd285cb7eb38ce ****/
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "Returns graphic driver created this structure.

Returns
-------
opencascade::handle<Graphic3d_GraphicDriver>
") GraphicDriver;
		const opencascade::handle<Graphic3d_GraphicDriver> & GraphicDriver();

		/****************** GraphicHighlight ******************/
		/**** md5 signature: be2986c2bc05d7038f912626e0a46896 ****/
		%feature("compactdefaultargs") GraphicHighlight;
		%feature("autodoc", "Highlights structure with the given style.

Parameters
----------
theStyle: Graphic3d_PresentationAttributes

Returns
-------
None
") GraphicHighlight;
		virtual void GraphicHighlight(const opencascade::handle<Graphic3d_PresentationAttributes> & theStyle);

		/****************** GraphicUnhighlight ******************/
		/**** md5 signature: b264492d04a5b76206f1040464d0e471 ****/
		%feature("compactdefaultargs") GraphicUnhighlight;
		%feature("autodoc", "Unhighlights the structure and invalidates pointer to structure's highlight style.

Returns
-------
None
") GraphicUnhighlight;
		virtual void GraphicUnhighlight();

		/****************** Groups ******************/
		/**** md5 signature: d58f58de9bde8c9bb93737989f881ace ****/
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "Returns graphic groups.

Returns
-------
Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups();

		/****************** HighlightStyle ******************/
		/**** md5 signature: 8178b69ba5e9aec0fad5df24b6a36d07 ****/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Returns valid handle to highlight style of the structure in case if highlight flag is set to true.

Returns
-------
opencascade::handle<Graphic3d_PresentationAttributes>
") HighlightStyle;
		const opencascade::handle<Graphic3d_PresentationAttributes> & HighlightStyle();

		/****************** IsAlwaysRendered ******************/
		/**** md5 signature: d6f70384d08093407d656cc6da2cd218 ****/
		%feature("compactdefaultargs") IsAlwaysRendered;
		%feature("autodoc", "Checks if the structure should be included into bvh tree or not.

Returns
-------
bool
") IsAlwaysRendered;
		Standard_Boolean IsAlwaysRendered();

		/****************** IsCulled ******************/
		/**** md5 signature: 89cdc36c57aff6236faae7db404fe552 ****/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "Returns false if the structure hits the current view volume, otherwise returns true.

Returns
-------
bool
") IsCulled;
		Standard_Boolean IsCulled();

		/****************** IsVisible ******************/
		/**** md5 signature: 6d47e4fe91edc0d54b9a3b231c878799 ****/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return structure visibility flag.

Returns
-------
bool
") IsVisible;
		bool IsVisible();

		/****************** IsVisible ******************/
		/**** md5 signature: fde091b526f03186c5a82e89779d5e52 ****/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return structure visibility considering both view affinity and global visibility state.

Parameters
----------
theViewId: int

Returns
-------
bool
") IsVisible;
		bool IsVisible(const Standard_Integer theViewId);

		/****************** MarkAsNotCulled ******************/
		/**** md5 signature: 897aa286c42261d59dc236206e1c43d7 ****/
		%feature("compactdefaultargs") MarkAsNotCulled;
		%feature("autodoc", "Marks structure as overlapping the current view volume one. the method is called during traverse of bvh tree.

Returns
-------
None
") MarkAsNotCulled;
		void MarkAsNotCulled();

		/****************** NewGroup ******************/
		/**** md5 signature: b29eff19261565b2197170e2fddd4a01 ****/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "Create new group within this structure.

Parameters
----------
theStruct: Graphic3d_Structure

Returns
-------
opencascade::handle<Graphic3d_Group>
") NewGroup;
		virtual opencascade::handle<Graphic3d_Group> NewGroup(const opencascade::handle<Graphic3d_Structure> & theStruct);

		/****************** OnVisibilityChanged ******************/
		/**** md5 signature: f939450daae8a4e0791763dd0796b996 ****/
		%feature("compactdefaultargs") OnVisibilityChanged;
		%feature("autodoc", "Update structure visibility state.

Returns
-------
None
") OnVisibilityChanged;
		virtual void OnVisibilityChanged();

		/****************** RemoveGroup ******************/
		/**** md5 signature: 5306031610a77c3eda50a31cbc46b00d ****/
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "Remove group from this structure.

Parameters
----------
theGroup: Graphic3d_Group

Returns
-------
None
") RemoveGroup;
		virtual void RemoveGroup(const opencascade::handle<Graphic3d_Group> & theGroup);

		/****************** SetBndBoxClipCheck ******************/
		/**** md5 signature: 0046cc05b019a8f9300c74bddba97a52 ****/
		%feature("compactdefaultargs") SetBndBoxClipCheck;
		%feature("autodoc", "Enable/disable check of object's bounding box clipping before drawing of object.

Parameters
----------
theBndBoxClipCheck: bool

Returns
-------
None
") SetBndBoxClipCheck;
		void SetBndBoxClipCheck(Standard_Boolean theBndBoxClipCheck);

		/****************** SetClipPlanes ******************/
		/**** md5 signature: e4333b4a8793a61136630719405f0b4b ****/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "Pass clip planes to the associated graphic driver structure.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetClipPlanes;
		void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetCulled ******************/
		/**** md5 signature: c6355e8b8015481c20219430f581b8c9 ****/
		%feature("compactdefaultargs") SetCulled;
		%feature("autodoc", "Marks structure as culled/not culled - note that isalwaysrendered() is ignored here!.

Parameters
----------
theIsCulled: bool

Returns
-------
None
") SetCulled;
		void SetCulled(Standard_Boolean theIsCulled);

		/****************** SetTransformPersistence ******************/
		/**** md5 signature: ebaa62acbe8ec5abd3805f5c94502bd2 ****/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Set transformation persistence.

Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Returns
-------
None
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformation ******************/
		/**** md5 signature: 913d7cc4eba329bb39e7d4acdf11c0e2 ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Assign transformation.

Parameters
----------
theTrsf: Geom_Transformation

Returns
-------
None
") SetTransformation;
		virtual void SetTransformation(const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** SetZLayer ******************/
		/**** md5 signature: ce2e4a880a4e9d0bd19b68aa8a0ed6bd ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id to display the structure in specified layer.

Parameters
----------
theLayerIndex: int

Returns
-------
None
") SetZLayer;
		virtual void SetZLayer(int theLayerIndex);

		/****************** ShadowLink ******************/
		/**** md5 signature: 79e4828e5441bba02c128c277a5e9ce4 ****/
		%feature("compactdefaultargs") ShadowLink;
		%feature("autodoc", "Create shadow link to this structure.

Parameters
----------
theManager: Graphic3d_StructureManager

Returns
-------
opencascade::handle<Graphic3d_CStructure>
") ShadowLink;
		virtual opencascade::handle<Graphic3d_CStructure> ShadowLink(const opencascade::handle<Graphic3d_StructureManager> & theManager);

		/****************** TransformPersistence ******************/
		/**** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ****/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Return transformation persistence.

Returns
-------
opencascade::handle<Graphic3d_TransformPers>
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****************** Transformation ******************/
		/**** md5 signature: 11ffe13bd65c76d8962d14d3b1eb956a ****/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") Transformation;
		const opencascade::handle<Geom_Transformation> & Transformation();

		/****************** ZLayer ******************/
		/**** md5 signature: 7420fa5788bb824c02345ee38be45933 ****/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Get z layer id.

Returns
-------
Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer();

		/****************** updateLayerTransformation ******************/
		/**** md5 signature: 2021ed30aa6033d5b3430e3eb071c124 ****/
		%feature("compactdefaultargs") updateLayerTransformation;
		%feature("autodoc", "Update render transformation matrix.

Returns
-------
None
") updateLayerTransformation;
		virtual void updateLayerTransformation();

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
		opencascade::handle<Graphic3d_TextureMap > TextureMap;
		int doTextureMap;
		/****************** Graphic3d_CTexture ******************/
		/**** md5 signature: d4565acda8033732a03f25c2ffd8d531 ****/
		%feature("compactdefaultargs") Graphic3d_CTexture;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Graphic3d_CTexture;
		 Graphic3d_CTexture();

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

/* python proy classes for enums */
%pythoncode {

class Projection(IntEnum):
	Projection_Orthographic = 0
	Projection_Perspective = 1
	Projection_Stereo = 2
	Projection_MonoLeftEye = 3
	Projection_MonoRightEye = 4
Projection_Orthographic = Projection.Projection_Orthographic
Projection_Perspective = Projection.Projection_Perspective
Projection_Stereo = Projection.Projection_Stereo
Projection_MonoLeftEye = Projection.Projection_MonoLeftEye
Projection_MonoRightEye = Projection.Projection_MonoRightEye

class FocusType(IntEnum):
	FocusType_Absolute = 0
	FocusType_Relative = 1
FocusType_Absolute = FocusType.FocusType_Absolute
FocusType_Relative = FocusType.FocusType_Relative

class IODType(IntEnum):
	IODType_Absolute = 0
	IODType_Relative = 1
IODType_Absolute = IODType.IODType_Absolute
IODType_Relative = IODType.IODType_Relative
};
/* end python proxy for enums */

		/****************** Graphic3d_Camera ******************/
		/**** md5 signature: df0f7364c3262676d798db4877bc89d1 ****/
		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "Default constructor. initializes camera with the following properties: eye (0, 0, -2); center (0, 0, 0); up (0, 1, 0); type (orthographic); fovy (45); scale (1000); isstereo(false); znear (0.001); zfar (3000.0); aspect(1); zfocus(1.0); zfocustype(relative); iod(0.05); iodtype(relative).

Returns
-------
None
") Graphic3d_Camera;
		 Graphic3d_Camera();

		/****************** Graphic3d_Camera ******************/
		/**** md5 signature: 1a7bd2806a6306d0308f2ffa1ae2ea8b ****/
		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "Copy constructor. @param theother [in] the camera to copy from.

Parameters
----------
theOther: Graphic3d_Camera

Returns
-------
None
") Graphic3d_Camera;
		 Graphic3d_Camera(const opencascade::handle<Graphic3d_Camera> & theOther);

		/****************** Aspect ******************/
		/**** md5 signature: 2e31d5d4e9d98682a1043fbc438ab30a ****/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Get camera display ratio. returns display ratio.

Returns
-------
float
") Aspect;
		Standard_Real Aspect();

		/****************** AxialScale ******************/
		/**** md5 signature: a34dc3fbf3c0151be08f9ddac5ac6f5c ****/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "Get camera axial scale. returns camera's axial scale.

Returns
-------
gp_XYZ
") AxialScale;
		const gp_XYZ AxialScale();

		/****************** Center ******************/
		/**** md5 signature: 6e010c335ea3ad7f510ab4dc46be6265 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Get center of the camera, e.g. the point where camera looks at. this point is computed as eye() translated along direction() at distance(). returns the point where the camera looks at.

Returns
-------
gp_Pnt
") Center;
		gp_Pnt Center();

		/****************** ConvertProj2View ******************/
		/**** md5 signature: 61f7cc7d630b6fa50bfb62f8bba100e4 ****/
		%feature("compactdefaultargs") ConvertProj2View;
		%feature("autodoc", "Convert point from projection coordinate space to view coordinate space. @param thepnt [in] the point in ndc. returns point in vcs.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
gp_Pnt
") ConvertProj2View;
		gp_Pnt ConvertProj2View(const gp_Pnt & thePnt);

		/****************** ConvertView2Proj ******************/
		/**** md5 signature: 9b7fb83ada635448d430e47d15684c73 ****/
		%feature("compactdefaultargs") ConvertView2Proj;
		%feature("autodoc", "Convert point from view coordinate space to projection coordinate space. @param thepnt [in] the point in vcs. returns point in ndc.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
gp_Pnt
") ConvertView2Proj;
		gp_Pnt ConvertView2Proj(const gp_Pnt & thePnt);

		/****************** ConvertView2World ******************/
		/**** md5 signature: b33cff606a6ff19c9474ccbac1b3618c ****/
		%feature("compactdefaultargs") ConvertView2World;
		%feature("autodoc", "Convert point from view coordinate space to world coordinates. @param thepnt [in] the 3d point in vcs. returns point in wcs.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
gp_Pnt
") ConvertView2World;
		gp_Pnt ConvertView2World(const gp_Pnt & thePnt);

		/****************** ConvertWorld2View ******************/
		/**** md5 signature: d48a0df358800a049be17a0e29f01828 ****/
		%feature("compactdefaultargs") ConvertWorld2View;
		%feature("autodoc", "Convert point from world coordinate space to view coordinate space. @param thepnt [in] the 3d point in wcs. returns point in vcs.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
gp_Pnt
") ConvertWorld2View;
		gp_Pnt ConvertWorld2View(const gp_Pnt & thePnt);

		/****************** Copy ******************/
		/**** md5 signature: a197e78409862ab70e2f4b022adc6706 ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy properties of another camera. @param theother [in] the camera to copy from.

Parameters
----------
theOther: Graphic3d_Camera

Returns
-------
None
") Copy;
		void Copy(const opencascade::handle<Graphic3d_Camera> & theOther);

		/****************** CopyMappingData ******************/
		/**** md5 signature: fa827f178d7b4e25e2c784fd749a08d9 ****/
		%feature("compactdefaultargs") CopyMappingData;
		%feature("autodoc", "Initialize mapping related parameters from other camera handle.

Parameters
----------
theOtherCamera: Graphic3d_Camera

Returns
-------
None
") CopyMappingData;
		void CopyMappingData(const opencascade::handle<Graphic3d_Camera> & theOtherCamera);

		/****************** CopyOrientationData ******************/
		/**** md5 signature: a3dee68836d129923d0ab58babe72b9f ****/
		%feature("compactdefaultargs") CopyOrientationData;
		%feature("autodoc", "Initialize orientation related parameters from other camera handle.

Parameters
----------
theOtherCamera: Graphic3d_Camera

Returns
-------
None
") CopyOrientationData;
		void CopyOrientationData(const opencascade::handle<Graphic3d_Camera> & theOtherCamera);

		/****************** Direction ******************/
		/**** md5 signature: fe17f01a1a479d7628e85d427dbda641 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Get camera look direction. returns camera look direction.

Returns
-------
gp_Dir
") Direction;
		const gp_Dir Direction();

		/****************** Distance ******************/
		/**** md5 signature: d47317206a0fb34e540004324dbfafd8 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Get distance of eye from camera center. returns the distance.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Eye ******************/
		/**** md5 signature: 5d89a7e69918722c78431c69f97cda69 ****/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "Get camera eye position. returns camera eye location.

Returns
-------
gp_Pnt
") Eye;
		const gp_Pnt Eye();

		/****************** FOVy ******************/
		/**** md5 signature: 2e66b09969f86dd4b5d2b9a3c09837f5 ****/
		%feature("compactdefaultargs") FOVy;
		%feature("autodoc", "Get field of view (fov) in y axis. returns the fov value in degrees.

Returns
-------
float
") FOVy;
		Standard_Real FOVy();

		/****************** Frustum ******************/
		/**** md5 signature: cf93be954a6467b83bd07e5a762a6fe9 ****/
		%feature("compactdefaultargs") Frustum;
		%feature("autodoc", "Calculate wcs frustum planes for the camera projection volume. frustum is a convex volume determined by six planes directing inwards. the frustum planes are usually used as inputs for camera algorithms. thus, if any changes to projection matrix calculation are necessary, the frustum planes calculation should be also touched. @param theleft [out] the frustum plane for left side of view. @param theright [out] the frustum plane for right side of view. @param thebottom [out] the frustum plane for bottom side of view. @param thetop [out] the frustum plane for top side of view. @param thenear [out] the frustum plane for near side of view. @param thefar [out] the frustum plane for far side of view.

Parameters
----------
theLeft: gp_Pln
theRight: gp_Pln
theBottom: gp_Pln
theTop: gp_Pln
theNear: gp_Pln
theFar: gp_Pln

Returns
-------
None
") Frustum;
		void Frustum(gp_Pln & theLeft, gp_Pln & theRight, gp_Pln & theBottom, gp_Pln & theTop, gp_Pln & theNear, gp_Pln & theFar);

		/****************** FrustumPoints ******************/
		/**** md5 signature: 783289ba13644d7e7ff729bdd470b00e ****/
		%feature("compactdefaultargs") FrustumPoints;
		%feature("autodoc", "Fill array of current view frustum corners. the size of this array is equal to frustumverticesnb. the order of vertices is as defined in frustumvert_* enumeration.

Parameters
----------
thePoints: NCollection_Array1<Graphic3d_Vec3d>

Returns
-------
None
") FrustumPoints;
		void FrustumPoints(NCollection_Array1<Graphic3d_Vec3d> & thePoints);

		/****************** GetIODType ******************/
		/**** md5 signature: 930a27532abcc8fe5dc7b294192f1acf ****/
		%feature("compactdefaultargs") GetIODType;
		%feature("autodoc", "Get intraocular distance definition type. returns definition type used for intraocular distance.

Returns
-------
Graphic3d_Camera::IODType
") GetIODType;
		Graphic3d_Camera::IODType GetIODType();

		/****************** IOD ******************/
		/**** md5 signature: 0cc7208beeec9544d745fd8edb710bd8 ****/
		%feature("compactdefaultargs") IOD;
		%feature("autodoc", "Get intraocular distance value. returns absolute or relative iod value depending on its definition type.

Returns
-------
float
") IOD;
		Standard_Real IOD();

		/****************** InvalidateOrientation ******************/
		/**** md5 signature: db406d3073ea0c1be275948df298cd3b ****/
		%feature("compactdefaultargs") InvalidateOrientation;
		%feature("autodoc", "Invalidate orientation matrix. the matrix will be updated on request.

Returns
-------
None
") InvalidateOrientation;
		void InvalidateOrientation();

		/****************** InvalidateProjection ******************/
		/**** md5 signature: 0d6d6b15fdde9614d7c09fbbef20f7af ****/
		%feature("compactdefaultargs") InvalidateProjection;
		%feature("autodoc", "Invalidate state of projection matrix. the matrix will be updated on request.

Returns
-------
None
") InvalidateProjection;
		void InvalidateProjection();

		/****************** IsOrthographic ******************/
		/**** md5 signature: 318f821f87d8d72003d6a5bc300749dd ****/
		%feature("compactdefaultargs") IsOrthographic;
		%feature("autodoc", "Check that the camera projection is orthographic. returns boolean flag that indicates whether the camera's projection is orthographic or not.

Returns
-------
bool
") IsOrthographic;
		Standard_Boolean IsOrthographic();

		/****************** IsStereo ******************/
		/**** md5 signature: 1afd17937fddc58ff897af57df66cb75 ****/
		%feature("compactdefaultargs") IsStereo;
		%feature("autodoc", "Check whether the camera projection is stereo. please note that stereo rendering is now implemented with support of quad buffering. returns boolean flag indicating whether the stereographic l/r projection is chosen.

Returns
-------
bool
") IsStereo;
		Standard_Boolean IsStereo();

		/****************** MoveEyeTo ******************/
		/**** md5 signature: 8805118f8cd5bdfe0afd4ef0aee46699 ****/
		%feature("compactdefaultargs") MoveEyeTo;
		%feature("autodoc", "Sets camera eye position. unlike seteye(), this method only changes eye point and preserves camera direction. @param theeye [in] the location of camera's eye. @sa seteye().

Parameters
----------
theEye: gp_Pnt

Returns
-------
None
") MoveEyeTo;
		void MoveEyeTo(const gp_Pnt & theEye);

		/****************** OrientationMatrix ******************/
		/**** md5 signature: 88de92cfa5006e361a76bdeda10d31c1 ****/
		%feature("compactdefaultargs") OrientationMatrix;
		%feature("autodoc", "Get orientation matrix. returns camera orientation matrix.

Returns
-------
Graphic3d_Mat4d
") OrientationMatrix;
		const Graphic3d_Mat4d & OrientationMatrix();

		/****************** OrientationMatrixF ******************/
		/**** md5 signature: 3b95faa8431d412ddc01f1835005fa73 ****/
		%feature("compactdefaultargs") OrientationMatrixF;
		%feature("autodoc", "Get orientation matrix of standard_shortreal precision. returns camera orientation matrix.

Returns
-------
Graphic3d_Mat4
") OrientationMatrixF;
		const Graphic3d_Mat4 & OrientationMatrixF();

		/****************** OrthogonalizeUp ******************/
		/**** md5 signature: e85fd67d4179af26c6f84c4298353c05 ****/
		%feature("compactdefaultargs") OrthogonalizeUp;
		%feature("autodoc", "Orthogonalize up direction vector.

Returns
-------
None
") OrthogonalizeUp;
		void OrthogonalizeUp();

		/****************** OrthogonalizedUp ******************/
		/**** md5 signature: 8e9cca336a7e02481013c3c654a54700 ****/
		%feature("compactdefaultargs") OrthogonalizedUp;
		%feature("autodoc", "Return a copy of orthogonalized up direction vector.

Returns
-------
gp_Dir
") OrthogonalizedUp;
		gp_Dir OrthogonalizedUp();

		/****************** Project ******************/
		/**** md5 signature: abd4a94d8c8aae54509e94ad36fb4ac1 ****/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Project point from world coordinate space to normalized device coordinates (mapping). @param thepnt [in] the 3d point in wcs. returns mapped point in ndc.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
gp_Pnt
") Project;
		gp_Pnt Project(const gp_Pnt & thePnt);

		/****************** ProjectionMatrix ******************/
		/**** md5 signature: ba648dd7b6de7cfe7eaed2ae24ad2b05 ****/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "Get monographic or middle point projection matrix used for monographic rendering and for point projection / unprojection. returns monographic projection matrix.

Returns
-------
Graphic3d_Mat4d
") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix();

		/****************** ProjectionMatrixF ******************/
		/**** md5 signature: a5f82f5f68117e11b8e5eece1ad9d98b ****/
		%feature("compactdefaultargs") ProjectionMatrixF;
		%feature("autodoc", "Get monographic or middle point projection matrix of standard_shortreal precision used for monographic rendering and for point projection / unprojection. returns monographic projection matrix.

Returns
-------
Graphic3d_Mat4
") ProjectionMatrixF;
		const Graphic3d_Mat4 & ProjectionMatrixF();

		/****************** ProjectionState ******************/
		/**** md5 signature: dbf784bf5fda4e30033e082dc2260fff ****/
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "Returns modification state of camera projection matrix.

Returns
-------
Standard_Size
") ProjectionState;
		Standard_Size ProjectionState();

		/****************** ProjectionStereoLeft ******************/
		/**** md5 signature: ec4a0e24a0c232fcdfa1c6284ceac296 ****/
		%feature("compactdefaultargs") ProjectionStereoLeft;
		%feature("autodoc", "Returns stereographic matrix computed for left eye. please note that this method is used for rendering for <i>projection_stereo</i>.

Returns
-------
Graphic3d_Mat4d
") ProjectionStereoLeft;
		const Graphic3d_Mat4d & ProjectionStereoLeft();

		/****************** ProjectionStereoLeftF ******************/
		/**** md5 signature: 5f258843e5dfdded67d0927b47976d1e ****/
		%feature("compactdefaultargs") ProjectionStereoLeftF;
		%feature("autodoc", "Returns stereographic matrix of standard_shortreal precision computed for left eye. please note that this method is used for rendering for <i>projection_stereo</i>.

Returns
-------
Graphic3d_Mat4
") ProjectionStereoLeftF;
		const Graphic3d_Mat4 & ProjectionStereoLeftF();

		/****************** ProjectionStereoRight ******************/
		/**** md5 signature: 3a9e2a1d2a659fd2dc60749ffc3d8e8f ****/
		%feature("compactdefaultargs") ProjectionStereoRight;
		%feature("autodoc", "Returns stereographic matrix computed for right eye. please note that this method is used for rendering for <i>projection_stereo</i>.

Returns
-------
Graphic3d_Mat4d
") ProjectionStereoRight;
		const Graphic3d_Mat4d & ProjectionStereoRight();

		/****************** ProjectionStereoRightF ******************/
		/**** md5 signature: 7020498144994c8b5300275ef6765553 ****/
		%feature("compactdefaultargs") ProjectionStereoRightF;
		%feature("autodoc", "Returns stereographic matrix of standard_shortreal precision computed for right eye. please note that this method is used for rendering for <i>projection_stereo</i>.

Returns
-------
Graphic3d_Mat4
") ProjectionStereoRightF;
		const Graphic3d_Mat4 & ProjectionStereoRightF();

		/****************** ProjectionType ******************/
		/**** md5 signature: bbd21df5398364c0e880bd19f5b180dd ****/
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "Returns camera projection type.

Returns
-------
Graphic3d_Camera::Projection
") ProjectionType;
		Graphic3d_Camera::Projection ProjectionType();

		/****************** Scale ******************/
		/**** md5 signature: 4c0fd48707c01e5a42b2a639ca08da30 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Get camera scale. returns camera scale factor.

Returns
-------
float
") Scale;
		Standard_Real Scale();

		/****************** SetAspect ******************/
		/**** md5 signature: eeb63fa0e0a34af2268b36c5ae66d337 ****/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "Changes width / height display ratio. @param theaspect [in] the display ratio.

Parameters
----------
theAspect: float

Returns
-------
None
") SetAspect;
		void SetAspect(const Standard_Real theAspect);

		/****************** SetAxialScale ******************/
		/**** md5 signature: 3a595f07bdcb576462e6ff2b1385e904 ****/
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "Set camera axial scale. @param theaxialscale [in] the axial scale vector.

Parameters
----------
theAxialScale: gp_XYZ

Returns
-------
None
") SetAxialScale;
		void SetAxialScale(const gp_XYZ & theAxialScale);

		/****************** SetCenter ******************/
		/**** md5 signature: d37eaee629aacdd36ba1b49cba7ff093 ****/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "Sets center of the camera, e.g. the point where camera looks at. this methods changes camera direction, so that the new direction is computed from current eye position to specified center position. @param thecenter [in] the point where the camera looks at.

Parameters
----------
theCenter: gp_Pnt

Returns
-------
None
") SetCenter;
		void SetCenter(const gp_Pnt & theCenter);

		/****************** SetDirection ******************/
		/**** md5 signature: cefc66d5cea733e39294753286bacaa0 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Sets camera look direction and computes the new eye position relative to current center. warning! this method does not verify that the current up() vector is orthogonal to the new direction. @param thedir [in] the direction.

Parameters
----------
theDir: gp_Dir

Returns
-------
None
") SetDirection;
		void SetDirection(const gp_Dir & theDir);

		/****************** SetDirectionFromEye ******************/
		/**** md5 signature: bdeb39a6f9bad4d21e8fd65f1dd48e35 ****/
		%feature("compactdefaultargs") SetDirectionFromEye;
		%feature("autodoc", "Sets camera look direction preserving the current eye() position. warning! this method does not verify that the current up() vector is orthogonal to the new direction. @param thedir [in] the direction.

Parameters
----------
theDir: gp_Dir

Returns
-------
None
") SetDirectionFromEye;
		void SetDirectionFromEye(const gp_Dir & theDir);

		/****************** SetDistance ******************/
		/**** md5 signature: c8c6fc158515b5750dd8a9adb08f4b0c ****/
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "Set distance of eye from camera center. @param thedistance [in] the distance.

Parameters
----------
theDistance: float

Returns
-------
None
") SetDistance;
		void SetDistance(const Standard_Real theDistance);

		/****************** SetEye ******************/
		/**** md5 signature: 087ce1b13605c60b90cb65401431043b ****/
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "Sets camera eye position. warning! for backward compatibility reasons, this method also changes view direction, so that the new direction is computed from new eye position to old center position. @param theeye [in] the location of camera's eye. @sa moveeyeto(), seteyeandcenter().

Parameters
----------
theEye: gp_Pnt

Returns
-------
None
") SetEye;
		void SetEye(const gp_Pnt & theEye);

		/****************** SetEyeAndCenter ******************/
		/**** md5 signature: 9fba3596e320aa26e99834ae5f012844 ****/
		%feature("compactdefaultargs") SetEyeAndCenter;
		%feature("autodoc", "Sets camera eye and center positions. @param theeye [in] the location of camera's eye @param thecenter [in] the location of camera's center.

Parameters
----------
theEye: gp_Pnt
theCenter: gp_Pnt

Returns
-------
None
") SetEyeAndCenter;
		void SetEyeAndCenter(const gp_Pnt & theEye, const gp_Pnt & theCenter);

		/****************** SetFOVy ******************/
		/**** md5 signature: 7e8348c77345d30f965072441cac49c1 ****/
		%feature("compactdefaultargs") SetFOVy;
		%feature("autodoc", "Set field of view (fov) in y axis for perspective projection. @param thefovy [in] the fov in degrees.

Parameters
----------
theFOVy: float

Returns
-------
None
") SetFOVy;
		void SetFOVy(const Standard_Real theFOVy);

		/****************** SetIOD ******************/
		/**** md5 signature: c0bcc11ae79e6b07a1734b3b75fd3b31 ****/
		%feature("compactdefaultargs") SetIOD;
		%feature("autodoc", "Sets intraocular distance. @param thetype [in] the iod definition type. iod can be defined as absolute value or relatively to (as coefficient of) camera focal length. @param theiod [in] the intraocular distance.

Parameters
----------
theType: IODType
theIOD: float

Returns
-------
None
") SetIOD;
		void SetIOD(IODType theType, const Standard_Real theIOD);

		/****************** SetProjectionType ******************/
		/**** md5 signature: 500231e331fd3294fa2c82d618e95738 ****/
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "Change camera projection type. when switching to perspective projection from orthographic one, the znear and zfar are reset to default values (0.001, 3000.0) if less than 0.0. @param theprojectiontype [in] the camera projection type.

Parameters
----------
theProjection: Projection

Returns
-------
None
") SetProjectionType;
		void SetProjectionType(Projection theProjection);

		/****************** SetScale ******************/
		/**** md5 signature: 91bbbb1646dedfb8018b2c1849bc71ad ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Sets camera scale. for orthographic projection the scale factor corresponds to parallel scale of view mapping (i.e. size of viewport). for perspective camera scale is converted to distance. the scale specifies equal size of the view projection in both dimensions assuming that the aspect is 1.0. the projection height and width are specified with the scale and correspondingly multiplied by the aspect. @param thescale [in] the scale factor.

Parameters
----------
theScale: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real theScale);

		/****************** SetTile ******************/
		/**** md5 signature: abe7d7a3bf0a3dd2a74a1495dad37c06 ****/
		%feature("compactdefaultargs") SetTile;
		%feature("autodoc", "Sets the tile defining the drawing sub-area within view. note that tile defining a region outside the view boundaries is also valid - use method graphic3d_cameratile::cropped() to assign a cropped copy. @param thetile tile definition.

Parameters
----------
theTile: Graphic3d_CameraTile

Returns
-------
None
") SetTile;
		void SetTile(const Graphic3d_CameraTile & theTile);

		/****************** SetUp ******************/
		/**** md5 signature: 0db426f44d387a8cf5f78ad20e6deab6 ****/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "Sets camera up direction vector, orthogonal to camera direction. warning! this method does not verify that the new up vector is orthogonal to the current direction(). @param theup [in] the up direction vector. @sa orthogonalizeup().

Parameters
----------
theUp: gp_Dir

Returns
-------
None
") SetUp;
		void SetUp(const gp_Dir & theUp);

		/****************** SetZFocus ******************/
		/**** md5 signature: 0e26f1b989f88503e97c491f84f52385 ****/
		%feature("compactdefaultargs") SetZFocus;
		%feature("autodoc", "Sets stereographic focus distance. @param thetype [in] the focus definition type. focus can be defined as absolute value or relatively to (as coefficient of) coefficient of camera focal length. @param thezfocus [in] the focus absolute value or coefficient depending on the passed definition type.

Parameters
----------
theType: FocusType
theZFocus: float

Returns
-------
None
") SetZFocus;
		void SetZFocus(FocusType theType, const Standard_Real theZFocus);

		/****************** SetZRange ******************/
		/**** md5 signature: 6d876323f01ef4ad68156548ad5ee5cf ****/
		%feature("compactdefaultargs") SetZRange;
		%feature("autodoc", "Change the near and far z-clipping plane positions. for orthographic projection, theznear, thezfar can be negative or positive. for perspective projection, only positive values are allowed. program error exception is raised if non-positive values are specified for perspective projection or theznear >= thezfar. @param theznear [in] the distance of the plane from the eye. @param thezfar [in] the distance of the plane from the eye.

Parameters
----------
theZNear: float
theZFar: float

Returns
-------
None
") SetZRange;
		void SetZRange(const Standard_Real theZNear, const Standard_Real theZFar);

		/****************** Tile ******************/
		/**** md5 signature: 0a39fc9b82eb1069228eaa7fbe821f43 ****/
		%feature("compactdefaultargs") Tile;
		%feature("autodoc", "Get current tile.

Returns
-------
Graphic3d_CameraTile
") Tile;
		const Graphic3d_CameraTile & Tile();

		/****************** Transform ******************/
		/**** md5 signature: b1d3d70da15a244a49acf6a481c2ab71 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transform orientation components of the camera: eye, up and center points. @param thetrsf [in] the transformation to apply.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
None
") Transform;
		void Transform(const gp_Trsf & theTrsf);

		/****************** UnProject ******************/
		/**** md5 signature: 4a3a5e034749d6ce0dd134e64f4b1f61 ****/
		%feature("compactdefaultargs") UnProject;
		%feature("autodoc", "Unproject point from normalized device coordinates to world coordinate space. @param thepnt [in] the ndc point. returns 3d point in wcs.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
gp_Pnt
") UnProject;
		gp_Pnt UnProject(const gp_Pnt & thePnt);

		/****************** Up ******************/
		/**** md5 signature: 41ad6369dbf47f223fab4663017e77bb ****/
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "Get camera up direction vector. returns camera's up direction vector.

Returns
-------
gp_Dir
") Up;
		const gp_Dir Up();

		/****************** ViewDimensions ******************/
		/**** md5 signature: 661ee1816a495608297e7b53f28eb6a6 ****/
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "Calculate view plane size at center (target) point and distance between zfar and znear planes. returns values in form of gp_pnt (width, height, depth).

Returns
-------
gp_XYZ
") ViewDimensions;
		gp_XYZ ViewDimensions();

		/****************** ViewDimensions ******************/
		/**** md5 signature: 6c498c72fa3574ad8e37572fce939564 ****/
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "Calculate view plane size at center point with specified z offset and distance between zfar and znear planes. @param thezvalue [in] the distance from the eye in eye-to-center direction returns values in form of gp_pnt (width, height, depth).

Parameters
----------
theZValue: float

Returns
-------
gp_XYZ
") ViewDimensions;
		gp_XYZ ViewDimensions(const Standard_Real theZValue);

		/****************** WorldViewProjState ******************/
		/**** md5 signature: 84fd216afc4c582ff7d76c1c302180f8 ****/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "Returns projection modification state of the camera.

Returns
-------
Graphic3d_WorldViewProjState
") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState();

		/****************** WorldViewState ******************/
		/**** md5 signature: dd48ecc3dd461f96c04674477cae89e2 ****/
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "Returns modification state of camera world view transformation matrix.

Returns
-------
Standard_Size
") WorldViewState;
		Standard_Size WorldViewState();

		/****************** ZFar ******************/
		/**** md5 signature: 964ffb86c4f0761cc30f6df7df4f03e2 ****/
		%feature("compactdefaultargs") ZFar;
		%feature("autodoc", "Get the far z-clipping plane position. returns the distance of the plane from the eye.

Returns
-------
float
") ZFar;
		Standard_Real ZFar();

		/****************** ZFitAll ******************/
		/**** md5 signature: 05d966459b935643d69af2cf50829645 ****/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "Estimate z-min and z-max planes of projection volume to match the displayed objects. the methods ensures that view volume will be close by depth range to the displayed objects. fitting assumes that for orthogonal projection the view volume contains the displayed objects completely. for zoomed perspective view, the view volume is adjusted such that it contains the objects or their parts, located in front of the camera. @param thescalefactor [in] the scale factor for z-range. the range between z-min, z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. program error exception is thrown if negative or zero value is passed. @param theminmax [in] applicative min max boundaries. @param thescalefactor [in] real graphical boundaries (not accounting infinite flag).

Parameters
----------
theScaleFactor: float
theMinMax: Bnd_Box
theGraphicBB: Bnd_Box

Returns
-------
theZNear: float
theZFar: float
") ZFitAll;
		bool ZFitAll(const Standard_Real theScaleFactor, const Bnd_Box & theMinMax, const Bnd_Box & theGraphicBB, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ZFitAll ******************/
		/**** md5 signature: 431aafb7dcaaeeaea4d2b662cebd3417 ****/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "Change z-min and z-max planes of projection volume to match the displayed objects.

Parameters
----------
theScaleFactor: float
theMinMax: Bnd_Box
theGraphicBB: Bnd_Box

Returns
-------
None
") ZFitAll;
		void ZFitAll(const Standard_Real theScaleFactor, const Bnd_Box & theMinMax, const Bnd_Box & theGraphicBB);

		/****************** ZFocus ******************/
		/**** md5 signature: 09048d726d0db5df6fad62567f583796 ****/
		%feature("compactdefaultargs") ZFocus;
		%feature("autodoc", "Get stereographic focus value. returns absolute or relative stereographic focus value depending on its definition type.

Returns
-------
float
") ZFocus;
		Standard_Real ZFocus();

		/****************** ZFocusType ******************/
		/**** md5 signature: d91de11345e7927a542a3d871a961945 ****/
		%feature("compactdefaultargs") ZFocusType;
		%feature("autodoc", "Get stereographic focus definition type. returns definition type used for stereographic focus.

Returns
-------
Graphic3d_Camera::FocusType
") ZFocusType;
		Graphic3d_Camera::FocusType ZFocusType();

		/****************** ZNear ******************/
		/**** md5 signature: 064fcaad895c76398a583e8c5a72378d ****/
		%feature("compactdefaultargs") ZNear;
		%feature("autodoc", "Get the near z-clipping plane position. returns the distance of the plane from the eye.

Returns
-------
float
") ZNear;
		Standard_Real ZNear();

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
		/****************** Graphic3d_CameraTile ******************/
		/**** md5 signature: a7ff85bc9b9a5b07dcd347f9ff8a974a ****/
		%feature("compactdefaultargs") Graphic3d_CameraTile;
		%feature("autodoc", "Default constructor. initializes the empty tile of zero size and lower-left offset orientation. such tile is considered uninitialized (invalid).

Returns
-------
None
") Graphic3d_CameraTile;
		 Graphic3d_CameraTile();

		/****************** Cropped ******************/
		/**** md5 signature: a5617e2e92bfe0db3d15d224e16314ae ****/
		%feature("compactdefaultargs") Cropped;
		%feature("autodoc", "Return the copy cropped by total size.

Returns
-------
Graphic3d_CameraTile
") Cropped;
		Graphic3d_CameraTile Cropped();

		/****************** IsValid ******************/
		/**** md5 signature: 735088818cf24ebe0ebc7005a507da69 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return true if tile has been defined.

Returns
-------
bool
") IsValid;
		bool IsValid();

		/****************** OffsetLowerLeft ******************/
		/**** md5 signature: 168ce1d0b9d01a1cdfe047346bf9efa6 ****/
		%feature("compactdefaultargs") OffsetLowerLeft;
		%feature("autodoc", "Return offset position from lower-left corner.

Returns
-------
Graphic3d_Vec2i
") OffsetLowerLeft;
		Graphic3d_Vec2i OffsetLowerLeft();


            %extend{
                bool __eq_wrapper__(const Graphic3d_CameraTile other) {
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
		/****************** Graphic3d_ClipPlane ******************/
		/**** md5 signature: 3b2ca438d53477ffa620c2e2afb936dd ****/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "Default constructor. initializes clip plane container with the following properties: - equation (0.0, 0.0, 1.0, 0) - ison (true), - iscapping (false), - material (graphic3d_nom_default), - texture (null), - hatchstyle (aspect_hs_horizontal), - ishatchon (false).

Returns
-------
None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane();

		/****************** Graphic3d_ClipPlane ******************/
		/**** md5 signature: 0062f35ffc7c667c1c200b3134c67513 ****/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "Copy constructor. @param theother [in] the copied plane.

Parameters
----------
theOther: Graphic3d_ClipPlane

Returns
-------
None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane(const Graphic3d_ClipPlane & theOther);

		/****************** Graphic3d_ClipPlane ******************/
		/**** md5 signature: 9db5d38753759a147c1721425903054b ****/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "Construct clip plane for the passed equation. by default the plane is on, capping is turned off. @param theequation [in] the plane equation.

Parameters
----------
theEquation: Graphic3d_Vec4d

Returns
-------
None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane(const Graphic3d_Vec4d & theEquation);

		/****************** Graphic3d_ClipPlane ******************/
		/**** md5 signature: ce150c029c2679d13f4817496ec71dce ****/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "Construct clip plane from the passed geometrical definition. by default the plane is on, capping is turned off. @param theplane [in] the plane.

Parameters
----------
thePlane: gp_Pln

Returns
-------
None
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane(const gp_Pln & thePlane);

		/****************** CappingAspect ******************/
		/**** md5 signature: 089018478933d1873fb8c8f77f715460 ****/
		%feature("compactdefaultargs") CappingAspect;
		%feature("autodoc", "Return capping aspect. returns capping surface rendering aspect.

Returns
-------
opencascade::handle<Graphic3d_AspectFillArea3d>
") CappingAspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & CappingAspect();

		/****************** CappingColor ******************/
		/**** md5 signature: 33f268077fa3eff9a8efe1dfdb8ff254 ****/
		%feature("compactdefaultargs") CappingColor;
		%feature("autodoc", "Return color for rendering capping surface.

Returns
-------
Quantity_Color
") CappingColor;
		Quantity_Color CappingColor();

		/****************** CappingCustomHatch ******************/
		/**** md5 signature: 532100c1eaf8f2f7678ae86555b0dbce ****/
		%feature("compactdefaultargs") CappingCustomHatch;
		%feature("autodoc", "Returns hatching style.

Returns
-------
opencascade::handle<Graphic3d_HatchStyle>
") CappingCustomHatch;
		const opencascade::handle<Graphic3d_HatchStyle> & CappingCustomHatch();

		/****************** CappingHatch ******************/
		/**** md5 signature: fae6085bab7c0cb9f8a29bfa1408219e ****/
		%feature("compactdefaultargs") CappingHatch;
		%feature("autodoc", "Returns hatching style.

Returns
-------
Aspect_HatchStyle
") CappingHatch;
		Aspect_HatchStyle CappingHatch();

		/****************** CappingMaterial ******************/
		/**** md5 signature: ec7378d4d0978973feaf4727f2ab39ab ****/
		%feature("compactdefaultargs") CappingMaterial;
		%feature("autodoc", "Returns capping material.

Returns
-------
Graphic3d_MaterialAspect
") CappingMaterial;
		const Graphic3d_MaterialAspect & CappingMaterial();

		/****************** CappingTexture ******************/
		/**** md5 signature: c85811b236f28b12f8dac89a1840ec99 ****/
		%feature("compactdefaultargs") CappingTexture;
		%feature("autodoc", "Returns capping texture map.

Returns
-------
opencascade::handle<Graphic3d_TextureMap>
") CappingTexture;
		opencascade::handle<Graphic3d_TextureMap> CappingTexture();

		/****************** ChainNextPlane ******************/
		/**** md5 signature: 590a5956e7c7383ad373846e3c900c1a ****/
		%feature("compactdefaultargs") ChainNextPlane;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Graphic3d_ClipPlane>
") ChainNextPlane;
		const opencascade::handle<Graphic3d_ClipPlane> & ChainNextPlane();

		/****************** ChainPreviousPlane ******************/
		/**** md5 signature: 56fcbd3157911ddbf4ff1e520118af54 ****/
		%feature("compactdefaultargs") ChainPreviousPlane;
		%feature("autodoc", "Return the previous plane in a chain of planes defining logical and operation, or null if there is no chain or it is a first element in chain. when clipping is defined by a chain of planes, it cuts a space only in case if check fails for all planes in chain.

Returns
-------
opencascade::handle<Graphic3d_ClipPlane>
") ChainPreviousPlane;
		opencascade::handle<Graphic3d_ClipPlane> ChainPreviousPlane();

		/****************** Clone ******************/
		/**** md5 signature: ee5ee1ed8f05ee0371050d9c2ee0b36e ****/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "Clone plane. virtual method to simplify copying procedure if plane class is redefined at application level to add specific fields to it e.g. id, name, etc. returns new instance of clipping plane with same properties and attributes.

Returns
-------
opencascade::handle<Graphic3d_ClipPlane>
") Clone;
		virtual opencascade::handle<Graphic3d_ClipPlane> Clone();

		/****************** GetEquation ******************/
		/**** md5 signature: f90e88f602ccaf023d48ae4419875876 ****/
		%feature("compactdefaultargs") GetEquation;
		%feature("autodoc", "Get 4-component equation vector for clipping plane. returns clipping plane equation vector.

Returns
-------
Graphic3d_Vec4d
") GetEquation;
		const Graphic3d_Vec4d & GetEquation();

		/****************** GetId ******************/
		/**** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "This id is used for managing associated resources in graphical driver. the clip plane can be assigned within a range of io which can be displayed in separate opengl contexts. for each of the context an associated opengl resource for graphical aspects should be created and kept. the resources are stored in graphical driver for each of individual groups of shared context under the clip plane identifier. returns clip plane resource identifier string.

Returns
-------
TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId();

		/****************** IsBoxFullInHalfspace ******************/
		/**** md5 signature: a0b159cba8922ee1b65ffbd9144c8d82 ****/
		%feature("compactdefaultargs") IsBoxFullInHalfspace;
		%feature("autodoc", "Check if the given bounding box is fully inside (or touches from inside) the half-space (e.g. not discarded by clipping plane).

Parameters
----------
theBox: Graphic3d_BndBox3d

Returns
-------
bool
") IsBoxFullInHalfspace;
		bool IsBoxFullInHalfspace(const Graphic3d_BndBox3d & theBox);

		/****************** IsBoxFullOutHalfspace ******************/
		/**** md5 signature: 31a9362d0ef14fb2257bdbe2be1a2f5b ****/
		%feature("compactdefaultargs") IsBoxFullOutHalfspace;
		%feature("autodoc", "Check if the given bounding box is fully outside of the half-space (e.g. should be discarded by clipping plane).

Parameters
----------
theBox: Graphic3d_BndBox3d

Returns
-------
bool
") IsBoxFullOutHalfspace;
		bool IsBoxFullOutHalfspace(const Graphic3d_BndBox3d & theBox);

		/****************** IsCapping ******************/
		/**** md5 signature: 3852d09ed857ea6f90093e3c0e886998 ****/
		%feature("compactdefaultargs") IsCapping;
		%feature("autodoc", "Check state of capping surface rendering. returns true (turned on) or false depending on the state.

Returns
-------
bool
") IsCapping;
		Standard_Boolean IsCapping();

		/****************** IsChain ******************/
		/**** md5 signature: 275327d8619ec098030c75aff4fc4255 ****/
		%feature("compactdefaultargs") IsChain;
		%feature("autodoc", "Return true if this item defines a conjunction (logical and) between a set of planes. graphic3d_clipplane item defines either a clipping halfspace (single clipping plane) or a clipping volume defined by a logical and (conjunction) operation between a set of planes defined as a chain (so that the volume cuts a space only in case if check fails for all planes in the chain). //! note that graphic3d_clipplane item cannot: - define a chain with logical or (disjunction) operation; this should be done through graphic3d_sequenceofhclipplane. - define nested chains. - disable chain items; only entire chain can be disabled (by disabled a head of chain). //! the head of a chain defines all visual properties of the chain, so that graphic3d_clipplane of next items in a chain merely defines only geometrical definition of the plane.

Returns
-------
bool
") IsChain;
		Standard_Boolean IsChain();

		/****************** IsHatchOn ******************/
		/**** md5 signature: dfc03a237b0a94fee4556bb97c33045d ****/
		%feature("compactdefaultargs") IsHatchOn;
		%feature("autodoc", "Returns true if hatching mask is turned on.

Returns
-------
bool
") IsHatchOn;
		Standard_Boolean IsHatchOn();

		/****************** IsOn ******************/
		/**** md5 signature: 29d4dc3f4d3c0bb2a5278d3fd8f2ab9d ****/
		%feature("compactdefaultargs") IsOn;
		%feature("autodoc", "Check that the clipping plane is turned on. returns boolean flag indicating whether the plane is in on or off state.

Returns
-------
bool
") IsOn;
		Standard_Boolean IsOn();

		/****************** IsPointOutHalfspace ******************/
		/**** md5 signature: 8a146bb3e10718f0de2b2c154345d96b ****/
		%feature("compactdefaultargs") IsPointOutHalfspace;
		%feature("autodoc", "Check if the given point is outside of the half-space (e.g. should be discarded by clipping plane).

Parameters
----------
thePoint: Graphic3d_Vec4d

Returns
-------
bool
") IsPointOutHalfspace;
		bool IsPointOutHalfspace(const Graphic3d_Vec4d & thePoint);

		/****************** MCountAspect ******************/
		/**** md5 signature: 8830fdfa4d09c90a999edeb3eb87701e ****/
		%feature("compactdefaultargs") MCountAspect;
		%feature("autodoc", "Returns modification counter for aspect.

Returns
-------
unsigned int
") MCountAspect;
		unsigned int MCountAspect();

		/****************** MCountEquation ******************/
		/**** md5 signature: 5832a40d63cc226fe20b6b671be705a3 ****/
		%feature("compactdefaultargs") MCountEquation;
		%feature("autodoc", "Returns modification counter for equation.

Returns
-------
unsigned int
") MCountEquation;
		unsigned int MCountEquation();

		/****************** NbChainNextPlanes ******************/
		/**** md5 signature: 0f33e85ff6ff914d2afb4e187d3c047f ****/
		%feature("compactdefaultargs") NbChainNextPlanes;
		%feature("autodoc", "Return the number of chains in forward direction (including this item, so it is always >= 1). for a head of chain - returns the length of entire chain.

Returns
-------
int
") NbChainNextPlanes;
		Standard_Integer NbChainNextPlanes();

		/****************** ProbeBox ******************/
		/**** md5 signature: 5f3d2825cbe32814ce21e29efaeda1a2 ****/
		%feature("compactdefaultargs") ProbeBox;
		%feature("autodoc", "Check if the given bounding box is fully outside / fully inside.

Parameters
----------
theBox: Graphic3d_BndBox3d

Returns
-------
Graphic3d_ClipState
") ProbeBox;
		Graphic3d_ClipState ProbeBox(const Graphic3d_BndBox3d & theBox);

		/****************** ProbeBoxHalfspace ******************/
		/**** md5 signature: 464d13bf3a5e166ddc73317866dccf1c ****/
		%feature("compactdefaultargs") ProbeBoxHalfspace;
		%feature("autodoc", "Check if the given bounding box is fully outside / fully inside the half-space.

Parameters
----------
theBox: Graphic3d_BndBox3d

Returns
-------
Graphic3d_ClipState
") ProbeBoxHalfspace;
		Graphic3d_ClipState ProbeBoxHalfspace(const Graphic3d_BndBox3d & theBox);

		/****************** ProbeBoxMaxPointHalfspace ******************/
		/**** md5 signature: 812d9878fe277ef39844dc7ca7f3512f ****/
		%feature("compactdefaultargs") ProbeBoxMaxPointHalfspace;
		%feature("autodoc", "Check if the given bounding box is fully outside of the half-space (e.g. should be discarded by clipping plane).

Parameters
----------
theBox: Graphic3d_BndBox3d

Returns
-------
Graphic3d_ClipState
") ProbeBoxMaxPointHalfspace;
		Graphic3d_ClipState ProbeBoxMaxPointHalfspace(const Graphic3d_BndBox3d & theBox);

		/****************** ProbeBoxTouch ******************/
		/**** md5 signature: b61cbdfec61b407c0ced5644de804cd2 ****/
		%feature("compactdefaultargs") ProbeBoxTouch;
		%feature("autodoc", "Check if the given bounding box is in and touch the clipping planes.

Parameters
----------
theBox: Graphic3d_BndBox3d

Returns
-------
bool
") ProbeBoxTouch;
		Standard_Boolean ProbeBoxTouch(const Graphic3d_BndBox3d & theBox);

		/****************** ProbePoint ******************/
		/**** md5 signature: 79a1751e98637e715e52c2e577918dba ****/
		%feature("compactdefaultargs") ProbePoint;
		%feature("autodoc", "Check if the given point is outside / inside / on section.

Parameters
----------
thePoint: Graphic3d_Vec4d

Returns
-------
Graphic3d_ClipState
") ProbePoint;
		Graphic3d_ClipState ProbePoint(const Graphic3d_Vec4d & thePoint);

		/****************** ProbePointHalfspace ******************/
		/**** md5 signature: 2f148cbbb313492af2c494bd6fc47f5e ****/
		%feature("compactdefaultargs") ProbePointHalfspace;
		%feature("autodoc", "Check if the given point is outside of the half-space (e.g. should be discarded by clipping plane).

Parameters
----------
thePoint: Graphic3d_Vec4d

Returns
-------
Graphic3d_ClipState
") ProbePointHalfspace;
		Graphic3d_ClipState ProbePointHalfspace(const Graphic3d_Vec4d & thePoint);

		/****************** ReversedEquation ******************/
		/**** md5 signature: 5b2a254a5180a1d8c2b1c1e8fbc9ec71 ****/
		%feature("compactdefaultargs") ReversedEquation;
		%feature("autodoc", "Get 4-component equation vector for clipping plane. returns clipping plane equation vector.

Returns
-------
Graphic3d_Vec4d
") ReversedEquation;
		const Graphic3d_Vec4d & ReversedEquation();

		/****************** SetCapping ******************/
		/**** md5 signature: 54c220d994e44dfef27b51e5ce974f8c ****/
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "Change state of capping surface rendering. @param theison [in] the flag specifying whether the graphic driver should perform rendering of capping surface produced by this plane. the graphic driver produces this surface for convex graphics by means of stencil-test and multi-pass rendering.

Parameters
----------
theIsOn: bool

Returns
-------
None
") SetCapping;
		void SetCapping(const Standard_Boolean theIsOn);

		/****************** SetCappingAspect ******************/
		/**** md5 signature: 05e5452fa2f16c42f53e07e167e0c74c ****/
		%feature("compactdefaultargs") SetCappingAspect;
		%feature("autodoc", "Assign capping aspect.

Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Returns
-------
None
") SetCappingAspect;
		void SetCappingAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** SetCappingColor ******************/
		/**** md5 signature: 10386b0387534dee2103d52514974548 ****/
		%feature("compactdefaultargs") SetCappingColor;
		%feature("autodoc", "Set color for rendering capping surface.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetCappingColor;
		void SetCappingColor(const Quantity_Color & theColor);

		/****************** SetCappingCustomHatch ******************/
		/**** md5 signature: ecfc6c86b835ff55c032e0a8aac2b943 ****/
		%feature("compactdefaultargs") SetCappingCustomHatch;
		%feature("autodoc", "Set custom hatch style (stipple) and turn hatching on. @param thestyle [in] the hatch pattern.

Parameters
----------
theStyle: Graphic3d_HatchStyle

Returns
-------
None
") SetCappingCustomHatch;
		void SetCappingCustomHatch(const opencascade::handle<Graphic3d_HatchStyle> & theStyle);

		/****************** SetCappingHatch ******************/
		/**** md5 signature: a50e75b7fcb29f11c28ec851617bdfed ****/
		%feature("compactdefaultargs") SetCappingHatch;
		%feature("autodoc", "Set hatch style (stipple) and turn hatching on. @param thestyle [in] the hatch style.

Parameters
----------
theStyle: Aspect_HatchStyle

Returns
-------
None
") SetCappingHatch;
		void SetCappingHatch(const Aspect_HatchStyle theStyle);

		/****************** SetCappingHatchOff ******************/
		/**** md5 signature: f2dd155c48ac58bb23b0a9c116a086ef ****/
		%feature("compactdefaultargs") SetCappingHatchOff;
		%feature("autodoc", "Turn off hatching.

Returns
-------
None
") SetCappingHatchOff;
		void SetCappingHatchOff();

		/****************** SetCappingHatchOn ******************/
		/**** md5 signature: e5893da8bdba3236c35ccb5c4adce968 ****/
		%feature("compactdefaultargs") SetCappingHatchOn;
		%feature("autodoc", "Turn on hatching.

Returns
-------
None
") SetCappingHatchOn;
		void SetCappingHatchOn();

		/****************** SetCappingMaterial ******************/
		/**** md5 signature: b5325c1f11df13050b1636f8016bf728 ****/
		%feature("compactdefaultargs") SetCappingMaterial;
		%feature("autodoc", "Set material for rendering capping surface. @param themat [in] the material.

Parameters
----------
theMat: Graphic3d_MaterialAspect

Returns
-------
None
") SetCappingMaterial;
		void SetCappingMaterial(const Graphic3d_MaterialAspect & theMat);

		/****************** SetCappingTexture ******************/
		/**** md5 signature: 35e14b782b0f235bd0b0178b374ee4ed ****/
		%feature("compactdefaultargs") SetCappingTexture;
		%feature("autodoc", "Set texture to be applied on capping surface. @param thetexture [in] the texture.

Parameters
----------
theTexture: Graphic3d_TextureMap

Returns
-------
None
") SetCappingTexture;
		void SetCappingTexture(const opencascade::handle<Graphic3d_TextureMap> & theTexture);

		/****************** SetChainNextPlane ******************/
		/**** md5 signature: ee3b0bf19a25924a1f50d8bbe82b3864 ****/
		%feature("compactdefaultargs") SetChainNextPlane;
		%feature("autodoc", "Set the next plane in a chain of planes. this operation also updates relationship between chains (previous/next items), so that the previously set next plane is cut off.

Parameters
----------
thePlane: Graphic3d_ClipPlane

Returns
-------
None
") SetChainNextPlane;
		void SetChainNextPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** SetEquation ******************/
		/**** md5 signature: 98d9ebe26ccc7ae757c1c0c2fbd0deac ****/
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "Set plane equation by its geometrical definition. the equation is specified in 'world' coordinate system. @param theplane [in] the plane.

Parameters
----------
thePlane: gp_Pln

Returns
-------
None
") SetEquation;
		void SetEquation(const gp_Pln & thePlane);

		/****************** SetEquation ******************/
		/**** md5 signature: 8c7f72ef1ff7ce47b30f7e955727c798 ****/
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "Set 4-component equation vector for clipping plane. the equation is specified in 'world' coordinate system. @param theequation [in] the xyzw (or 'abcd') equation vector.

Parameters
----------
theEquation: Graphic3d_Vec4d

Returns
-------
None
") SetEquation;
		void SetEquation(const Graphic3d_Vec4d & theEquation);

		/****************** SetOn ******************/
		/**** md5 signature: 438c4d087bc93b9978e14cf889d92523 ****/
		%feature("compactdefaultargs") SetOn;
		%feature("autodoc", "Change state of the clipping plane. @param theison [in] the flag specifying whether the graphic driver clipping by this plane should be turned on or off.

Parameters
----------
theIsOn: bool

Returns
-------
None
") SetOn;
		void SetOn(const Standard_Boolean theIsOn);

		/****************** SetUseObjectMaterial ******************/
		/**** md5 signature: e51a3e4f157cf6f18a41a74204f89d3c ****/
		%feature("compactdefaultargs") SetUseObjectMaterial;
		%feature("autodoc", "Set flag for controlling the source of capping plane material.

Parameters
----------
theToUse: bool

Returns
-------
None
") SetUseObjectMaterial;
		void SetUseObjectMaterial(bool theToUse);

		/****************** SetUseObjectShader ******************/
		/**** md5 signature: 08936a5622e7e6c690bcd0fdc6728577 ****/
		%feature("compactdefaultargs") SetUseObjectShader;
		%feature("autodoc", "Set flag for controlling the source of capping plane shader program.

Parameters
----------
theToUse: bool

Returns
-------
None
") SetUseObjectShader;
		void SetUseObjectShader(bool theToUse);

		/****************** SetUseObjectTexture ******************/
		/**** md5 signature: a821504e886ab26fbcd6787ec057f6d3 ****/
		%feature("compactdefaultargs") SetUseObjectTexture;
		%feature("autodoc", "Set flag for controlling the source of capping plane texture.

Parameters
----------
theToUse: bool

Returns
-------
None
") SetUseObjectTexture;
		void SetUseObjectTexture(bool theToUse);

		/****************** ToPlane ******************/
		/**** md5 signature: ced66f82ed6e4053653d7c0e8408465b ****/
		%feature("compactdefaultargs") ToPlane;
		%feature("autodoc", "Get geometrical definition. returns geometrical definition of clipping plane.

Returns
-------
gp_Pln
") ToPlane;
		const gp_Pln ToPlane();

		/****************** ToUseObjectMaterial ******************/
		/**** md5 signature: 7deeaffbde57fcf043e1072b354f79d2 ****/
		%feature("compactdefaultargs") ToUseObjectMaterial;
		%feature("autodoc", "Flag indicating whether material for capping plane should be taken from object. default value: false (use dedicated capping plane material).

Returns
-------
bool
") ToUseObjectMaterial;
		bool ToUseObjectMaterial();

		/****************** ToUseObjectProperties ******************/
		/**** md5 signature: b739e66c383bfb4362cc7ca9e1937819 ****/
		%feature("compactdefaultargs") ToUseObjectProperties;
		%feature("autodoc", "Return true if some fill area aspect properties should be taken from object.

Returns
-------
bool
") ToUseObjectProperties;
		bool ToUseObjectProperties();

		/****************** ToUseObjectShader ******************/
		/**** md5 signature: c8a22f1ea268d72862ff604db660d838 ****/
		%feature("compactdefaultargs") ToUseObjectShader;
		%feature("autodoc", "Flag indicating whether shader program for capping plane should be taken from object. default value: false.

Returns
-------
bool
") ToUseObjectShader;
		bool ToUseObjectShader();

		/****************** ToUseObjectTexture ******************/
		/**** md5 signature: 36cf8eff8e41cb2efc2bfc6ef994b489 ****/
		%feature("compactdefaultargs") ToUseObjectTexture;
		%feature("autodoc", "Flag indicating whether texture for capping plane should be taken from object. default value: false.

Returns
-------
bool
") ToUseObjectTexture;
		bool ToUseObjectTexture();

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
		/****************** Graphic3d_CullingTool ******************/
		/**** md5 signature: 5f02547bbbbc6c5cc18b9c6bb32866ba ****/
		%feature("compactdefaultargs") Graphic3d_CullingTool;
		%feature("autodoc", "Creates an empty selector object with parallel projection type by default.

Returns
-------
None
") Graphic3d_CullingTool;
		 Graphic3d_CullingTool();

		/****************** CacheClipPtsProjections ******************/
		/**** md5 signature: c6a5b8ea56ba980df85f6ba6c94374cb ****/
		%feature("compactdefaultargs") CacheClipPtsProjections;
		%feature("autodoc", "Caches view volume's vertices projections along its normals and aabbs dimensions. must be called at the beginning of each bvh tree traverse loop.

Returns
-------
None
") CacheClipPtsProjections;
		void CacheClipPtsProjections();

		/****************** Camera ******************/
		/**** md5 signature: 9722357b74290d4bf6f13f9113469012 ****/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return the camera definition.

Returns
-------
opencascade::handle<Graphic3d_Camera>
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****************** IsCulled ******************/
		/**** md5 signature: e81e46c36264ee44ad5cae9367165426 ****/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "Checks whether given aabb should be entirely culled or not. @param thectx [in] culling properties @param theminpt [in] maximum point of aabb @param themaxpt [in] minimum point of aabb returns standard_true, if aabb is in viewing area, standard_false otherwise.

Parameters
----------
theCtx: CullingContext
theMinPt: Graphic3d_Vec3d
theMaxPt: Graphic3d_Vec3d

Returns
-------
bool
") IsCulled;
		bool IsCulled(CullingContext theCtx, const Graphic3d_Vec3d & theMinPt, const Graphic3d_Vec3d & theMaxPt);

		/****************** ProjectionMatrix ******************/
		/**** md5 signature: 74099661eed9cbb71b1b28e0d2bc7ed7 ****/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "Returns current projection matrix.

Returns
-------
Graphic3d_Mat4d
") ProjectionMatrix;
		const Graphic3d_Mat4d & ProjectionMatrix();

		/****************** SetCullingDistance ******************/
		/**** md5 signature: 2c124390ed1785355c4fc42a9d178ce1 ****/
		%feature("compactdefaultargs") SetCullingDistance;
		%feature("autodoc", "Setup distance culling.

Parameters
----------
theCtx: CullingContext
theDistance: float

Returns
-------
None
") SetCullingDistance;
		void SetCullingDistance(CullingContext theCtx, Standard_Real theDistance);

		/****************** SetCullingSize ******************/
		/**** md5 signature: 1674520241dff328a7784cfe9a955a47 ****/
		%feature("compactdefaultargs") SetCullingSize;
		%feature("autodoc", "Setup size culling.

Parameters
----------
theCtx: CullingContext
theSize: float

Returns
-------
None
") SetCullingSize;
		void SetCullingSize(CullingContext theCtx, Standard_Real theSize);

		/****************** SetViewVolume ******************/
		/**** md5 signature: 8e02be505f21dd37d1bcc12ba216dcef ****/
		%feature("compactdefaultargs") SetViewVolume;
		%feature("autodoc", "Retrieves view volume's planes equations and its vertices from projection and world-view matrices.

Parameters
----------
theCamera: Graphic3d_Camera

Returns
-------
None
") SetViewVolume;
		void SetViewVolume(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****************** SetViewportSize ******************/
		/**** md5 signature: 0ebb6bfbf02f6ffd9190084c8511593a ****/
		%feature("compactdefaultargs") SetViewportSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
theViewportWidth: int
theViewportHeight: int
theResolutionRatio: float

Returns
-------
None
") SetViewportSize;
		void SetViewportSize(Standard_Integer theViewportWidth, Standard_Integer theViewportHeight, Standard_Real theResolutionRatio);

		/****************** ViewportHeight ******************/
		/**** md5 signature: c197043069d1304d1eeb77ca9ae3a846 ****/
		%feature("compactdefaultargs") ViewportHeight;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ViewportHeight;
		Standard_Integer ViewportHeight();

		/****************** ViewportWidth ******************/
		/**** md5 signature: b2bf685bf2a0b5a187dd849825582a14 ****/
		%feature("compactdefaultargs") ViewportWidth;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ViewportWidth;
		Standard_Integer ViewportWidth();

		/****************** WorldViewMatrix ******************/
		/**** md5 signature: fa375b9f28a3a5704ed8ad4248bd49d3 ****/
		%feature("compactdefaultargs") WorldViewMatrix;
		%feature("autodoc", "Returns current world view transformation matrix.

Returns
-------
Graphic3d_Mat4d
") WorldViewMatrix;
		const Graphic3d_Mat4d & WorldViewMatrix();

		/****************** WorldViewProjState ******************/
		/**** md5 signature: 84fd216afc4c582ff7d76c1c302180f8 ****/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "Returns state of current world view projection transformation matrices.

Returns
-------
Graphic3d_WorldViewProjState
") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState();

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
		/**** md5 signature: e89e1c4808bb7032e3058fd748c2ba1e ****/
		%feature("compactdefaultargs") ActiveDataFrame;
		%feature("autodoc", "Returns currently filling data frame for modification, should be called between ::framestart() and ::frameend() calls.

Returns
-------
Graphic3d_FrameStatsDataTmp
") ActiveDataFrame;
		Graphic3d_FrameStatsDataTmp & ActiveDataFrame();

		/****************** ChangeCounter ******************/
		/**** md5 signature: 6c6f58c1a9759b9295d132d8096def96 ****/
		%feature("compactdefaultargs") ChangeCounter;
		%feature("autodoc", "Returns value of specified counter for modification, should be called between ::framestart() and ::frameend() calls.

Parameters
----------
theCounter: Graphic3d_FrameStatsCounter

Returns
-------
Standard_Size
") ChangeCounter;
		Standard_Size & ChangeCounter(Graphic3d_FrameStatsCounter theCounter);

		/****************** ChangeDataFrames ******************/
		/**** md5 signature: 9486d6288d46f6501e052e63e78363a5 ****/
		%feature("compactdefaultargs") ChangeDataFrames;
		%feature("autodoc", "Returns data frames.

Returns
-------
NCollection_Array1<Graphic3d_FrameStatsData>
") ChangeDataFrames;
		NCollection_Array1<Graphic3d_FrameStatsData> & ChangeDataFrames();


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
		/**** md5 signature: 8ed1805ec25d6c758e5e1db19f97ff24 ****/
		%feature("compactdefaultargs") CounterValue;
		%feature("autodoc", "Returns value of specified counter, cached between stats updates. should not be called between ::framestart() and ::frameend() calls.

Parameters
----------
theCounter: Graphic3d_FrameStatsCounter

Returns
-------
Standard_Size
") CounterValue;
		Standard_Size CounterValue(Graphic3d_FrameStatsCounter theCounter);

		/****************** DataFrames ******************/
		/**** md5 signature: 00192e1420bc8aaf54d99dc695bc8868 ****/
		%feature("compactdefaultargs") DataFrames;
		%feature("autodoc", "Returns data frames.

Returns
-------
NCollection_Array1<Graphic3d_FrameStatsData>
") DataFrames;
		const NCollection_Array1<Graphic3d_FrameStatsData> & DataFrames();

		/****************** FormatStats ******************/
		/**** md5 signature: 5b9dead4afc40b78e32eab45fce6ef06 ****/
		%feature("compactdefaultargs") FormatStats;
		%feature("autodoc", "Returns formatted string.

Parameters
----------
theFlags: Graphic3d_RenderingParams::PerfCounters

Returns
-------
TCollection_AsciiString
") FormatStats;
		virtual TCollection_AsciiString FormatStats(Graphic3d_RenderingParams::PerfCounters theFlags);

		/****************** FormatStats ******************/
		/**** md5 signature: 71153f3ccc3724ca46659b9cf568545a ****/
		%feature("compactdefaultargs") FormatStats;
		%feature("autodoc", "Fill in the dictionary with formatted statistic info.

Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString
theFlags: Graphic3d_RenderingParams::PerfCounters

Returns
-------
None
") FormatStats;
		virtual void FormatStats(TColStd_IndexedDataMapOfStringString & theDict, Graphic3d_RenderingParams::PerfCounters theFlags);

		/****************** FrameDuration ******************/
		/**** md5 signature: 7570137c484d67bab578be1e30a71da6 ****/
		%feature("compactdefaultargs") FrameDuration;
		%feature("autodoc", "Returns duration of the last frame in seconds.

Returns
-------
float
") FrameDuration;
		Standard_Real FrameDuration();

		/****************** FrameEnd ******************/
		/**** md5 signature: a1a62d3a296e8bc083bd2a2e33e0b401 ****/
		%feature("compactdefaultargs") FrameEnd;
		%feature("autodoc", "Frame redraw finished.

Parameters
----------
theView: Graphic3d_CView
theIsImmediateOnly: bool

Returns
-------
None
") FrameEnd;
		virtual void FrameEnd(const opencascade::handle<Graphic3d_CView> & theView, bool theIsImmediateOnly);

		/****************** FrameRate ******************/
		/**** md5 signature: db6b7e7c7a863be8aaa983bb362e35a4 ****/
		%feature("compactdefaultargs") FrameRate;
		%feature("autodoc", "Returns fps (frames per seconds, elapsed time). this number indicates an actual frame rate averaged for several frames within updateinterval() duration, basing on a real elapsed time between updates.

Returns
-------
float
") FrameRate;
		Standard_Real FrameRate();

		/****************** FrameRateCpu ******************/
		/**** md5 signature: 9cfad4d801704890362508e1c186ca95 ****/
		%feature("compactdefaultargs") FrameRateCpu;
		%feature("autodoc", "Returns cpu fps (frames per seconds, cpu time). this number indicates a predicted frame rate, basing on cpu elapsed time between updates and not real elapsed time (which might include periods of cpu inactivity). number is expected to be greater then actual frame rate returned by framerate(). values significantly greater actual frame rate indicate that rendering is limited by gpu performance (cpu is stalled in-between), while values around actual frame rate indicate rendering being limited by cpu performance (gpu is stalled in-between).

Returns
-------
float
") FrameRateCpu;
		Standard_Real FrameRateCpu();

		/****************** FrameStart ******************/
		/**** md5 signature: 4321aa56927dd15c9aa2049a53d48d01 ****/
		%feature("compactdefaultargs") FrameStart;
		%feature("autodoc", "Frame redraw started.

Parameters
----------
theView: Graphic3d_CView
theIsImmediateOnly: bool

Returns
-------
None
") FrameStart;
		virtual void FrameStart(const opencascade::handle<Graphic3d_CView> & theView, bool theIsImmediateOnly);

		/****************** HasCulledLayers ******************/
		/**** md5 signature: 07d35cdfa68362efadd4c5c6defc91ab ****/
		%feature("compactdefaultargs") HasCulledLayers;
		%feature("autodoc", "Returns true if some layers have been culled.

Returns
-------
bool
") HasCulledLayers;
		Standard_Boolean HasCulledLayers();

		/****************** HasCulledStructs ******************/
		/**** md5 signature: 30345793eefb3ed2b862dde8ff60a65c ****/
		%feature("compactdefaultargs") HasCulledStructs;
		%feature("autodoc", "Returns true if some structures have been culled.

Returns
-------
bool
") HasCulledStructs;
		Standard_Boolean HasCulledStructs();

		/****************** IsLongLineFormat ******************/
		/**** md5 signature: abc47073f1604f901c805b2df31306d1 ****/
		%feature("compactdefaultargs") IsLongLineFormat;
		%feature("autodoc", "Prefer longer lines over more greater of lines.

Returns
-------
bool
") IsLongLineFormat;
		Standard_Boolean IsLongLineFormat();

		/****************** LastDataFrame ******************/
		/**** md5 signature: 43a5ae643ec463959ba072b87a1e8878 ****/
		%feature("compactdefaultargs") LastDataFrame;
		%feature("autodoc", "Returns last data frame, cached between stats updates. should not be called between ::framestart() and ::frameend() calls.

Returns
-------
Graphic3d_FrameStatsData
") LastDataFrame;
		const Graphic3d_FrameStatsData & LastDataFrame();

		/****************** LastDataFrameIndex ******************/
		/**** md5 signature: 8d078e5e0a649cb271949b10cabbffff ****/
		%feature("compactdefaultargs") LastDataFrameIndex;
		%feature("autodoc", "Returns last data frame index.

Returns
-------
int
") LastDataFrameIndex;
		Standard_Integer LastDataFrameIndex();

		/****************** SetLongLineFormat ******************/
		/**** md5 signature: 7c2dae77684bf1fd79c5bdc9baac3daa ****/
		%feature("compactdefaultargs") SetLongLineFormat;
		%feature("autodoc", "Set if format should prefer longer lines over greater number of lines.

Parameters
----------
theValue: bool

Returns
-------
None
") SetLongLineFormat;
		void SetLongLineFormat(Standard_Boolean theValue);

		/****************** SetUpdateInterval ******************/
		/**** md5 signature: 3a384af54fceff3c5ab5cf3b5ae9bba1 ****/
		%feature("compactdefaultargs") SetUpdateInterval;
		%feature("autodoc", "Sets interval in seconds for updating values.

Parameters
----------
theInterval: float

Returns
-------
None
") SetUpdateInterval;
		void SetUpdateInterval(Standard_Real theInterval);

		/****************** TimerValue ******************/
		/**** md5 signature: cc2d4e10fff345f6e76c0ca736f6baba ****/
		%feature("compactdefaultargs") TimerValue;
		%feature("autodoc", "Returns value of specified timer for modification, should be called between ::framestart() and ::frameend() calls. should not be called between ::framestart() and ::frameend() calls.

Parameters
----------
theTimer: Graphic3d_FrameStatsTimer

Returns
-------
float
") TimerValue;
		Standard_Real TimerValue(Graphic3d_FrameStatsTimer theTimer);

		/****************** UpdateInterval ******************/
		/**** md5 signature: a2231f8474a76de156ff0cd51bd23440 ****/
		%feature("compactdefaultargs") UpdateInterval;
		%feature("autodoc", "Returns interval in seconds for updating meters across several frames; 1 second by default.

Returns
-------
float
") UpdateInterval;
		Standard_Real UpdateInterval();

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
		/****************** Graphic3d_FrameStatsData ******************/
		/**** md5 signature: cb20320dae57ead2c8bcffdd55733e51 ****/
		%feature("compactdefaultargs") Graphic3d_FrameStatsData;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_FrameStatsData;
		 Graphic3d_FrameStatsData();

		/****************** CounterValue ******************/
		/**** md5 signature: ea9c1c4755f5d30677125656248b20e1 ****/
		%feature("compactdefaultargs") CounterValue;
		%feature("autodoc", "Get counter value.

Parameters
----------
theIndex: Graphic3d_FrameStatsCounter

Returns
-------
Standard_Size
") CounterValue;
		Standard_Size CounterValue(Graphic3d_FrameStatsCounter theIndex);

		/****************** FillMax ******************/
		/**** md5 signature: aba2493eb7aceb56692dcd34d61c14d1 ****/
		%feature("compactdefaultargs") FillMax;
		%feature("autodoc", "Fill with maximum values.

Parameters
----------
theOther: Graphic3d_FrameStatsData

Returns
-------
None
") FillMax;
		void FillMax(const Graphic3d_FrameStatsData & theOther);

		/****************** FrameRate ******************/
		/**** md5 signature: db6b7e7c7a863be8aaa983bb362e35a4 ****/
		%feature("compactdefaultargs") FrameRate;
		%feature("autodoc", "Returns fps (frames per seconds, elapsed time). this number indicates an actual frame rate averaged for several frames within updateinterval() duration, basing on a real elapsed time between updates.

Returns
-------
float
") FrameRate;
		Standard_Real FrameRate();

		/****************** FrameRateCpu ******************/
		/**** md5 signature: 9cfad4d801704890362508e1c186ca95 ****/
		%feature("compactdefaultargs") FrameRateCpu;
		%feature("autodoc", "Returns cpu fps (frames per seconds, cpu time). this number indicates a predicted frame rate, basing on cpu elapsed time between updates and not real elapsed time (which might include periods of cpu inactivity). number is expected to be greater then actual frame rate returned by framerate(). values significantly greater actual frame rate indicate that rendering is limited by gpu performance (cpu is stalled in-between), while values around actual frame rate indicate rendering being limited by cpu performance (gpu is stalled in-between).

Returns
-------
float
") FrameRateCpu;
		Standard_Real FrameRateCpu();

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset data.

Returns
-------
None
") Reset;
		void Reset();

		/****************** TimerValue ******************/
		/**** md5 signature: 06c524b566bfa85e501093ca7529ef04 ****/
		%feature("compactdefaultargs") TimerValue;
		%feature("autodoc", "Get timer value.

Parameters
----------
theIndex: Graphic3d_FrameStatsTimer

Returns
-------
float
") TimerValue;
		Standard_Real TimerValue(Graphic3d_FrameStatsTimer theIndex);

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
		/****************** Graphic3d_Fresnel ******************/
		/**** md5 signature: 9be7b9d3e911d9507c81ff78fff65010 ****/
		%feature("compactdefaultargs") Graphic3d_Fresnel;
		%feature("autodoc", "Creates uninitialized fresnel factor.

Returns
-------
None
") Graphic3d_Fresnel;
		 Graphic3d_Fresnel();

		/****************** CreateConductor ******************/
		/**** md5 signature: 3896ad59ad90a71df054ecc6356058e5 ****/
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "Creates fresnel factor for physical-based conductor model.

Parameters
----------
theRefractionIndex: Standard_ShortReal
theAbsorptionIndex: Standard_ShortReal

Returns
-------
Graphic3d_Fresnel
") CreateConductor;
		static Graphic3d_Fresnel CreateConductor(Standard_ShortReal theRefractionIndex, Standard_ShortReal theAbsorptionIndex);

		/****************** CreateConductor ******************/
		/**** md5 signature: abc67701a99807361ff15bbaf583e29d ****/
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "Creates fresnel factor for physical-based conductor model (spectral version).

Parameters
----------
theRefractionIndex: Graphic3d_Vec3
theAbsorptionIndex: Graphic3d_Vec3

Returns
-------
Graphic3d_Fresnel
") CreateConductor;
		static Graphic3d_Fresnel CreateConductor(const Graphic3d_Vec3 & theRefractionIndex, const Graphic3d_Vec3 & theAbsorptionIndex);

		/****************** CreateConstant ******************/
		/**** md5 signature: 21995c7091d353b4a89830b625704749 ****/
		%feature("compactdefaultargs") CreateConstant;
		%feature("autodoc", "Creates fresnel factor for constant reflection.

Parameters
----------
theReflection: Standard_ShortReal

Returns
-------
Graphic3d_Fresnel
") CreateConstant;
		static Graphic3d_Fresnel CreateConstant(const Standard_ShortReal theReflection);

		/****************** CreateDielectric ******************/
		/**** md5 signature: 489a65bd3502f304c610256e94f153d5 ****/
		%feature("compactdefaultargs") CreateDielectric;
		%feature("autodoc", "Creates fresnel factor for physical-based dielectric model.

Parameters
----------
theRefractionIndex: Standard_ShortReal

Returns
-------
Graphic3d_Fresnel
") CreateDielectric;
		static Graphic3d_Fresnel CreateDielectric(Standard_ShortReal theRefractionIndex);

		/****************** CreateSchlick ******************/
		/**** md5 signature: 960e03655e99f98cc62d846358f21995 ****/
		%feature("compactdefaultargs") CreateSchlick;
		%feature("autodoc", "Creates schlick's approximation of fresnel factor.

Parameters
----------
theSpecularColor: Graphic3d_Vec3

Returns
-------
Graphic3d_Fresnel
") CreateSchlick;
		static Graphic3d_Fresnel CreateSchlick(const Graphic3d_Vec3 & theSpecularColor);

		/****************** FresnelType ******************/
		/**** md5 signature: 98c0c74d03fd3aa57b6d6ab4409e1720 ****/
		%feature("compactdefaultargs") FresnelType;
		%feature("autodoc", "Returns type of fresnel.

Returns
-------
Graphic3d_FresnelModel
") FresnelType;
		Graphic3d_FresnelModel FresnelType();

		/****************** Serialize ******************/
		/**** md5 signature: 5c6373d91e665c9ae95dd301c1660748 ****/
		%feature("compactdefaultargs") Serialize;
		%feature("autodoc", "Returns serialized representation of fresnel factor.

Returns
-------
Graphic3d_Vec4
") Serialize;
		Graphic3d_Vec4 Serialize();


            %extend{
                bool __eq_wrapper__(const Graphic3d_Fresnel other) {
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
		/****************** Graphic3d_GraduatedTrihedron ******************/
		/**** md5 signature: ec9c13b0c8c821bbf378eaa07133baa4 ****/
		%feature("compactdefaultargs") Graphic3d_GraduatedTrihedron;
		%feature("autodoc", "Default constructor constructs the default graduated trihedron with grid, x, y, z axes, and tickmarks.

Parameters
----------
theNamesFont: TCollection_AsciiString,optional
	default value is 'Arial'
theNamesStyle: Font_FontAspect,optional
	default value is Font_FA_Bold
theNamesSize: int,optional
	default value is 12
theValuesFont: TCollection_AsciiString,optional
	default value is 'Arial'
theValuesStyle: Font_FontAspect,optional
	default value is Font_FA_Regular
theValuesSize: int,optional
	default value is 12
theArrowsLength: Standard_ShortReal,optional
	default value is 30.0f
theGridColor: Quantity_Color,optional
	default value is Quantity_NOC_WHITE
theToDrawGrid: bool,optional
	default value is Standard_True
theToDrawAxes: bool,optional
	default value is Standard_True

Returns
-------
None
") Graphic3d_GraduatedTrihedron;
		 Graphic3d_GraduatedTrihedron(const TCollection_AsciiString & theNamesFont = "Arial", const Font_FontAspect & theNamesStyle = Font_FA_Bold, const Standard_Integer theNamesSize = 12, const TCollection_AsciiString & theValuesFont = "Arial", const Font_FontAspect & theValuesStyle = Font_FA_Regular, const Standard_Integer theValuesSize = 12, const Standard_ShortReal theArrowsLength = 30.0f, const Quantity_Color theGridColor = Quantity_NOC_WHITE, const Standard_Boolean theToDrawGrid = Standard_True, const Standard_Boolean theToDrawAxes = Standard_True);

		/****************** ArrowsLength ******************/
		/**** md5 signature: 436b8e7aca635cad334a456158318fd2 ****/
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") ArrowsLength;
		Standard_ShortReal ArrowsLength();

		/****************** AxisAspect ******************/
		/**** md5 signature: f2f44ba31c6f431b905db6db80868bf4 ****/
		%feature("compactdefaultargs") AxisAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
Graphic3d_AxisAspect
") AxisAspect;
		const Graphic3d_AxisAspect & AxisAspect(const Standard_Integer theIndex);

		/****************** ChangeAxisAspect ******************/
		/**** md5 signature: ec1bdc207f774477c7923fb81a4d46b7 ****/
		%feature("compactdefaultargs") ChangeAxisAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
Graphic3d_AxisAspect
") ChangeAxisAspect;
		Graphic3d_AxisAspect & ChangeAxisAspect(const Standard_Integer theIndex);

		/****************** ChangeXAxisAspect ******************/
		/**** md5 signature: cdc049f35f986f9b8665bbfd1b6d302c ****/
		%feature("compactdefaultargs") ChangeXAxisAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Graphic3d_AxisAspect
") ChangeXAxisAspect;
		Graphic3d_AxisAspect & ChangeXAxisAspect();

		/****************** ChangeYAxisAspect ******************/
		/**** md5 signature: 4c4f18e9c7240d7a33c10928e7b7f0f6 ****/
		%feature("compactdefaultargs") ChangeYAxisAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Graphic3d_AxisAspect
") ChangeYAxisAspect;
		Graphic3d_AxisAspect & ChangeYAxisAspect();

		/****************** ChangeZAxisAspect ******************/
		/**** md5 signature: 5239dd92fa0d582990cf78fe9d02181e ****/
		%feature("compactdefaultargs") ChangeZAxisAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Graphic3d_AxisAspect
") ChangeZAxisAspect;
		Graphic3d_AxisAspect & ChangeZAxisAspect();

		/****************** GridColor ******************/
		/**** md5 signature: 0a94080e9f8d07e2f072c1b5c94f2339 ****/
		%feature("compactdefaultargs") GridColor;
		%feature("autodoc", "No available documentation.

Returns
-------
Quantity_Color
") GridColor;
		const Quantity_Color & GridColor();

		/****************** NamesFont ******************/
		/**** md5 signature: fff09ee152b933c30f0bd84d05698758 ****/
		%feature("compactdefaultargs") NamesFont;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") NamesFont;
		const TCollection_AsciiString & NamesFont();

		/****************** NamesFontAspect ******************/
		/**** md5 signature: 24ee92075d6b91f3b6cd462739a1b92f ****/
		%feature("compactdefaultargs") NamesFontAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Font_FontAspect
") NamesFontAspect;
		Font_FontAspect NamesFontAspect();

		/****************** NamesSize ******************/
		/**** md5 signature: 17215cfa08f82381387f9dfe83f61587 ****/
		%feature("compactdefaultargs") NamesSize;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NamesSize;
		Standard_Integer NamesSize();

		/****************** SetArrowsLength ******************/
		/**** md5 signature: 38ff5a23220c65a1f862b638e9fac6ff ****/
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetArrowsLength;
		void SetArrowsLength(const Standard_ShortReal theValue);

		/****************** SetDrawAxes ******************/
		/**** md5 signature: 8cf33b2c06e2ff3c55144a9ba910b0bc ****/
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawAxes;
		void SetDrawAxes(const Standard_Boolean theToDraw);

		/****************** SetDrawGrid ******************/
		/**** md5 signature: fa65b49e26273d355a2f5ff328b4c492 ****/
		%feature("compactdefaultargs") SetDrawGrid;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToDraw: bool

Returns
-------
None
") SetDrawGrid;
		void SetDrawGrid(const Standard_Boolean theToDraw);

		/****************** SetGridColor ******************/
		/**** md5 signature: 9f70fd93cff9ed9f03df433cb59530c7 ****/
		%feature("compactdefaultargs") SetGridColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetGridColor;
		void SetGridColor(const Quantity_Color & theColor);

		/****************** SetNamesFont ******************/
		/**** md5 signature: 04ce69c162ca06059e2e9948b6c7a5d5 ****/
		%feature("compactdefaultargs") SetNamesFont;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFont: TCollection_AsciiString

Returns
-------
None
") SetNamesFont;
		void SetNamesFont(const TCollection_AsciiString & theFont);

		/****************** SetNamesFontAspect ******************/
		/**** md5 signature: 95599011b4aa83f2326f3a73b956d72c ****/
		%feature("compactdefaultargs") SetNamesFontAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Font_FontAspect

Returns
-------
None
") SetNamesFontAspect;
		void SetNamesFontAspect(Font_FontAspect theAspect);

		/****************** SetNamesSize ******************/
		/**** md5 signature: 5197b3ebdbe16bf2e7f2bb37243c892c ****/
		%feature("compactdefaultargs") SetNamesSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
None
") SetNamesSize;
		void SetNamesSize(const Standard_Integer theValue);

		/****************** SetValuesFont ******************/
		/**** md5 signature: 51c17c292b99eeb2899776619385aecc ****/
		%feature("compactdefaultargs") SetValuesFont;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFont: TCollection_AsciiString

Returns
-------
None
") SetValuesFont;
		void SetValuesFont(const TCollection_AsciiString & theFont);

		/****************** SetValuesFontAspect ******************/
		/**** md5 signature: d802052a96e2bd0dacd9adf90fe293cd ****/
		%feature("compactdefaultargs") SetValuesFontAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAspect: Font_FontAspect

Returns
-------
None
") SetValuesFontAspect;
		void SetValuesFontAspect(Font_FontAspect theAspect);

		/****************** SetValuesSize ******************/
		/**** md5 signature: 8c13262fe0c038d5e2de60a7db47d290 ****/
		%feature("compactdefaultargs") SetValuesSize;
		%feature("autodoc", "No available documentation.

Parameters
----------
theValue: int

Returns
-------
None
") SetValuesSize;
		void SetValuesSize(const Standard_Integer theValue);

		/****************** ToDrawAxes ******************/
		/**** md5 signature: cf79dcc6451b48c9e4ca8d3f257bcc8d ****/
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ToDrawAxes;
		Standard_Boolean ToDrawAxes();

		/****************** ToDrawGrid ******************/
		/**** md5 signature: e0c0dc60660d64e816c5cc0aa0d56cbe ****/
		%feature("compactdefaultargs") ToDrawGrid;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ToDrawGrid;
		Standard_Boolean ToDrawGrid();

		/****************** ValuesFont ******************/
		/**** md5 signature: fb3c190dc717e90b8fb6d2d17f5e867a ****/
		%feature("compactdefaultargs") ValuesFont;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") ValuesFont;
		const TCollection_AsciiString & ValuesFont();

		/****************** ValuesFontAspect ******************/
		/**** md5 signature: b14f920e832d04b2a45fcad2054971b1 ****/
		%feature("compactdefaultargs") ValuesFontAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Font_FontAspect
") ValuesFontAspect;
		Font_FontAspect ValuesFontAspect();

		/****************** ValuesSize ******************/
		/**** md5 signature: 2e3346ad769be956d03b5627833824b5 ****/
		%feature("compactdefaultargs") ValuesSize;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") ValuesSize;
		Standard_Integer ValuesSize();

		/****************** XAxisAspect ******************/
		/**** md5 signature: 1eebfbd9cfccaf5eb022857d4c5009cc ****/
		%feature("compactdefaultargs") XAxisAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Graphic3d_AxisAspect
") XAxisAspect;
		const Graphic3d_AxisAspect & XAxisAspect();

		/****************** YAxisAspect ******************/
		/**** md5 signature: 40cfd8708b945c7998815b6d6a8ef1be ****/
		%feature("compactdefaultargs") YAxisAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Graphic3d_AxisAspect
") YAxisAspect;
		const Graphic3d_AxisAspect & YAxisAspect();

		/****************** ZAxisAspect ******************/
		/**** md5 signature: c43e4b61858272d00c4cb284f159c2ae ****/
		%feature("compactdefaultargs") ZAxisAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
Graphic3d_AxisAspect
") ZAxisAspect;
		const Graphic3d_AxisAspect & ZAxisAspect();

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
		/**** md5 signature: a36ec42089c49a5b3cd014c42cce26aa ****/
		%feature("compactdefaultargs") CreateStructure;
		%feature("autodoc", "Creates new empty graphic structure.

Parameters
----------
theManager: Graphic3d_StructureManager

Returns
-------
opencascade::handle<Graphic3d_CStructure>
") CreateStructure;
		virtual opencascade::handle<Graphic3d_CStructure> CreateStructure(const opencascade::handle<Graphic3d_StructureManager> & theManager);

		/****************** CreateView ******************/
		/**** md5 signature: efb7ebf01d81afbe1ea2502c9f4f1c84 ****/
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "Creates new view for this graphic driver.

Parameters
----------
theMgr: Graphic3d_StructureManager

Returns
-------
opencascade::handle<Graphic3d_CView>
") CreateView;
		virtual opencascade::handle<Graphic3d_CView> CreateView(const opencascade::handle<Graphic3d_StructureManager> & theMgr);

		/****************** DefaultTextHeight ******************/
		/**** md5 signature: 3468b2d78c3f72d41f67a14efead2574 ****/
		%feature("compactdefaultargs") DefaultTextHeight;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") DefaultTextHeight;
		virtual Standard_ShortReal DefaultTextHeight();

		/****************** EnableVBO ******************/
		/**** md5 signature: 6811071ed08bc9212270309c90e38f22 ****/
		%feature("compactdefaultargs") EnableVBO;
		%feature("autodoc", "Enables/disables usage of opengl vertex buffer arrays while drawing primitiev arrays.

Parameters
----------
status: bool

Returns
-------
None
") EnableVBO;
		virtual void EnableVBO(const Standard_Boolean status);

		/****************** GetDisplayConnection ******************/
		/**** md5 signature: 23fb6073a1974917a907039ad426bbdd ****/
		%feature("compactdefaultargs") GetDisplayConnection;
		%feature("autodoc", "Returns handle to display connection.

Returns
-------
opencascade::handle<Aspect_DisplayConnection>
") GetDisplayConnection;
		const opencascade::handle<Aspect_DisplayConnection> & GetDisplayConnection();

		/****************** InquireLightLimit ******************/
		/**** md5 signature: 5ff4f7fa144f2d6e14ce9b9d5c238660 ****/
		%feature("compactdefaultargs") InquireLightLimit;
		%feature("autodoc", "Request maximum number of active light sources supported by driver and hardware.

Returns
-------
int
") InquireLightLimit;
		Standard_Integer InquireLightLimit();

		/****************** InquireLimit ******************/
		/**** md5 signature: f47665093e68deaf2e3b6fd6b18ed76a ****/
		%feature("compactdefaultargs") InquireLimit;
		%feature("autodoc", "Request limit of graphic resource of specific type.

Parameters
----------
theType: Graphic3d_TypeOfLimit

Returns
-------
int
") InquireLimit;
		virtual Standard_Integer InquireLimit(const Graphic3d_TypeOfLimit theType);

		/****************** InquirePlaneLimit ******************/
		/**** md5 signature: 7edec336d772e2570a4950bec285d141 ****/
		%feature("compactdefaultargs") InquirePlaneLimit;
		%feature("autodoc", "Request maximum number of active clipping planes supported by driver and hardware.

Returns
-------
int
") InquirePlaneLimit;
		Standard_Integer InquirePlaneLimit();

		/****************** InquireViewLimit ******************/
		/**** md5 signature: cd87f9a9e2cdd455e23f74b19c9d84ce ****/
		%feature("compactdefaultargs") InquireViewLimit;
		%feature("autodoc", "Request maximum number of views supported by driver.

Returns
-------
int
") InquireViewLimit;
		Standard_Integer InquireViewLimit();

		/****************** InsertLayerAfter ******************/
		/**** md5 signature: cd9549addd4543aedd353e8c4428d456 ****/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "Adds a layer to all views. @param thenewlayerid [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param thesettings [in] new layer settings @param thelayerbefore [in] id of layer to append new layer after.

Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerBefore: int

Returns
-------
None
") InsertLayerAfter;
		virtual void InsertLayerAfter(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerBefore);

		/****************** InsertLayerBefore ******************/
		/**** md5 signature: 9598fd696d1336a754aefafafac0a974 ****/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "Adds a layer to all views. to add a structure to desired layer on display it is necessary to set the layer id for the structure. @param thenewlayerid [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param thesettings [in] new layer settings @param thelayerafter [in] id of layer to append new layer before.

Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerAfter: int

Returns
-------
None
") InsertLayerBefore;
		virtual void InsertLayerBefore(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerAfter);

		/****************** MemoryInfo ******************/
		/**** md5 signature: 394a73f4371f143116eaf8ac960ff9af ****/
		%feature("compactdefaultargs") MemoryInfo;
		%feature("autodoc", "Returns information about gpu memory usage.

Parameters
----------
theFreeBytes: Standard_Size
theInfo: TCollection_AsciiString

Returns
-------
bool
") MemoryInfo;
		virtual Standard_Boolean MemoryInfo(Standard_Size & theFreeBytes, TCollection_AsciiString & theInfo);

		/****************** NewIdentification ******************/
		/**** md5 signature: 2dc1eb68ffc5fa05f6b6a65a989a6f86 ****/
		%feature("compactdefaultargs") NewIdentification;
		%feature("autodoc", "Returns a new identification number for a new structure.

Returns
-------
int
") NewIdentification;
		Standard_Integer NewIdentification();

		/****************** RemoveIdentification ******************/
		/**** md5 signature: 6e9ebbb4dfc46f8a838ef1eb899d886e ****/
		%feature("compactdefaultargs") RemoveIdentification;
		%feature("autodoc", "Frees the identifier of a structure.

Parameters
----------
theId: int

Returns
-------
None
") RemoveIdentification;
		void RemoveIdentification(const Standard_Integer theId);

		/****************** RemoveStructure ******************/
		/**** md5 signature: 374b074d13ec64b455e2c467ed5728e5 ****/
		%feature("compactdefaultargs") RemoveStructure;
		%feature("autodoc", "Removes structure from graphic driver and releases its resources.

Parameters
----------
theCStructure: Graphic3d_CStructure

Returns
-------
None
") RemoveStructure;
		virtual void RemoveStructure(opencascade::handle<Graphic3d_CStructure> & theCStructure);

		/****************** RemoveView ******************/
		/**** md5 signature: a2826f043434590367fb0ea3fe65f310 ****/
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "Removes view from graphic driver and releases its resources.

Parameters
----------
theView: Graphic3d_CView

Returns
-------
None
") RemoveView;
		virtual void RemoveView(const opencascade::handle<Graphic3d_CView> & theView);

		/****************** RemoveZLayer ******************/
		/**** md5 signature: 50d5f44e4a544e7ce1c8003cf95dee16 ****/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "Removes z layer. all structures displayed at the moment in layer will be displayed in default layer (the bottom-level z layer). by default, there are always default bottom-level layer that can't be removed. the passed thelayerid should be not less than 0 (reserved for default layers that can not be removed).

Parameters
----------
theLayerId: int

Returns
-------
None
") RemoveZLayer;
		virtual void RemoveZLayer(int theLayerId);

		/****************** SetZLayerSettings ******************/
		/**** md5 signature: 526c66f52cf13826d826173b0d84d35e ****/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "Sets the settings for a single z layer.

Parameters
----------
theLayerId: int
theSettings: Graphic3d_ZLayerSettings

Returns
-------
None
") SetZLayerSettings;
		virtual void SetZLayerSettings(int theLayerId, const Graphic3d_ZLayerSettings & theSettings);

		/****************** TextSize ******************/
		/**** md5 signature: 3929c24ac11029eb0d5ad88ea3a802ba ****/
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "Computes text width.

Parameters
----------
theView: Graphic3d_CView
theText: char *
theHeight: Standard_ShortReal
theWidth: Standard_ShortReal
theAscent: Standard_ShortReal
theDescent: Standard_ShortReal

Returns
-------
None
") TextSize;
		virtual void TextSize(const opencascade::handle<Graphic3d_CView> & theView, const char * theText, const Standard_ShortReal theHeight, Standard_ShortReal & theWidth, Standard_ShortReal & theAscent, Standard_ShortReal & theDescent);

		/****************** ViewExists ******************/
		/**** md5 signature: af8cd22ce3ec7eb123e125bb1c41a940 ****/
		%feature("compactdefaultargs") ViewExists;
		%feature("autodoc", "Returns view associated with the window if it is exists and is activated. returns standard_true if the view associated to the window exists.

Parameters
----------
theWindow: Aspect_Window
theView: Graphic3d_CView

Returns
-------
bool
") ViewExists;
		virtual Standard_Boolean ViewExists(const opencascade::handle<Aspect_Window> & theWindow, opencascade::handle<Graphic3d_CView> & theView);

		/****************** ZLayerSettings ******************/
		/**** md5 signature: e38c9e174f323fbe425dc9e1a52d5a50 ****/
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "Returns the settings of a single z layer.

Parameters
----------
theLayerId: int

Returns
-------
Graphic3d_ZLayerSettings
") ZLayerSettings;
		virtual const Graphic3d_ZLayerSettings & ZLayerSettings(int theLayerId);

		/****************** ZLayers ******************/
		/**** md5 signature: 2c5d352609ae944ae5b005c305c126b7 ****/
		%feature("compactdefaultargs") ZLayers;
		%feature("autodoc", "Returns list of z layers defined for the graphical driver.

Parameters
----------
theLayerSeq: TColStd_SequenceOfInteger

Returns
-------
None
") ZLayers;
		virtual void ZLayers(TColStd_SequenceOfInteger & theLayerSeq);

};


%make_alias(Graphic3d_GraphicDriver)

%extend Graphic3d_GraphicDriver {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Print(self):
		pass
	}
};

/************************
* class Graphic3d_Group *
************************/
%nodefaultctor Graphic3d_Group;
class Graphic3d_Group : public Standard_Transient {
	public:
		/****************** AddPrimitiveArray ******************/
		/**** md5 signature: 648b1531454ce3d80607126cfde5e856 ****/
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "Adds an array of primitives for display.

Parameters
----------
theType: Graphic3d_TypeOfPrimitiveArray
theIndices: Graphic3d_IndexBuffer
theAttribs: Graphic3d_Buffer
theBounds: Graphic3d_BoundBuffer
theToEvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") AddPrimitiveArray;
		virtual void AddPrimitiveArray(const Graphic3d_TypeOfPrimitiveArray theType, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const opencascade::handle<Graphic3d_Buffer> & theAttribs, const opencascade::handle<Graphic3d_BoundBuffer> & theBounds, const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** AddPrimitiveArray ******************/
		/**** md5 signature: 483cbcc8915e618f81f2f6d4fe35c560 ****/
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "Adds an array of primitives for display.

Parameters
----------
thePrim: Graphic3d_ArrayOfPrimitives
theToEvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") AddPrimitiveArray;
		void AddPrimitiveArray(const opencascade::handle<Graphic3d_ArrayOfPrimitives> & thePrim, const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** AddText ******************/
		/**** md5 signature: 19b3326e1331f5e87bbd213aa947b55f ****/
		%feature("compactdefaultargs") AddText;
		%feature("autodoc", "Adds a text for display.

Parameters
----------
theTextParams: Graphic3d_Text
theToEvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") AddText;
		virtual void AddText(const opencascade::handle<Graphic3d_Text> & theTextParams, const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** Aspects ******************/
		/**** md5 signature: 04e82c25c53238d777eaf039de6caaf9 ****/
		%feature("compactdefaultargs") Aspects;
		%feature("autodoc", "Return fill area aspect.

Returns
-------
opencascade::handle<Graphic3d_Aspects>
") Aspects;
		virtual opencascade::handle<Graphic3d_Aspects> Aspects();

		/****************** BoundingBox ******************/
		/**** md5 signature: e41af9b36a07039d2315bd8651dda9c4 ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns boundary box of the group <self> without transformation applied,.

Returns
-------
Graphic3d_BndBox4f
") BoundingBox;
		const Graphic3d_BndBox4f & BoundingBox();

		/****************** ChangeBoundingBox ******************/
		/**** md5 signature: cc4a360d34add196038ff35d6beec779 ****/
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "Returns non-const boundary box of the group <self> without transformation applied,.

Returns
-------
Graphic3d_BndBox4f
") ChangeBoundingBox;
		Graphic3d_BndBox4f & ChangeBoundingBox();

		/****************** Clear ******************/
		/**** md5 signature: 0e2f50fd5440bc5f4814bdd0ad5f3eb9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Supress all primitives and attributes of <self>. to clear group without update in graphic3d_structuremanager pass standard_false as <theupdatestructuremgr>. this used on context and viewer destruction, when the pointer to structure manager in graphic3d_structure could be already released (pointers are used here to avoid handle cross-reference);.

Parameters
----------
theUpdateStructureMgr: bool,optional
	default value is Standard_True

Returns
-------
None
") Clear;
		virtual void Clear(const Standard_Boolean theUpdateStructureMgr = Standard_True);

		/****************** ContainsFacet ******************/
		/**** md5 signature: 4c181c9b014b3fa37004bc92ff243a15 ****/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "Returns true if the group contains polygons, triangles or quadrangles.

Returns
-------
bool
") ContainsFacet;
		bool ContainsFacet();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** IsClosed ******************/
		/**** md5 signature: 87cef9bebf52c7a89467bdbada7b297e ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return true if primitive arrays within this graphic group form closed volume (do no contain open shells).

Returns
-------
bool
") IsClosed;
		bool IsClosed();

		/****************** IsDeleted ******************/
		/**** md5 signature: 6c5c2d96a6fd32f5afc5a8404c4309ad ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns standard_true if the group <self> is deleted. <self> is deleted after the call remove (me) or the associated structure is deleted.

Returns
-------
bool
") IsDeleted;
		Standard_Boolean IsDeleted();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns standard_true if the group <self> is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Marker ******************/
		/**** md5 signature: 05c6752a3af35606f6018312dff052b6 ****/
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "Creates a primitive array with single marker using addprimitivearray().

Parameters
----------
thePoint: Graphic3d_Vertex
theToEvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") Marker;
		void Marker(const Graphic3d_Vertex & thePoint, const Standard_Boolean theToEvalMinMax = Standard_True);

		/****************** MinMaxValues ******************/
		/**** md5 signature: 3ca31dabd208b1ca1f2662d7711e5336 ****/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "Returns the coordinates of the boundary box of the group.

Parameters
----------

Returns
-------
theXMin: float
theYMin: float
theZMin: float
theXMax: float
theYMax: float
theZMax: float
") MinMaxValues;
		void MinMaxValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Remove ******************/
		/**** md5 signature: 0346504d7ac570fc8960fb72d5ad5f20 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Supress the group <self> in the structure. warning: no more graphic operations in <self> after this call. modifies the current modelling transform persistence (pan, zoom or rotate) get the current modelling transform persistence (pan, zoom or rotate).

Returns
-------
None
") Remove;
		void Remove();

		/****************** ReplaceAspects ******************/
		/**** md5 signature: f7cf00115e0ec4403854bdfa90338928 ****/
		%feature("compactdefaultargs") ReplaceAspects;
		%feature("autodoc", "Replace aspects specified in the replacement map.

Parameters
----------
theMap: Graphic3d_MapOfAspectsToAspects

Returns
-------
None
") ReplaceAspects;
		virtual void ReplaceAspects(const Graphic3d_MapOfAspectsToAspects & theMap);

		/****************** SetClosed ******************/
		/**** md5 signature: 1b75d364558b57c72138f423e78d6873 ****/
		%feature("compactdefaultargs") SetClosed;
		%feature("autodoc", "Changes property shown that primitive arrays within this group form closed volume (do no contain open shells).

Parameters
----------
theIsClosed: bool

Returns
-------
None
") SetClosed;
		void SetClosed(const bool theIsClosed);

		/****************** SetFlippingOptions ******************/
		/**** md5 signature: 1c9508224229b51123afcc9bf23d24b8 ****/
		%feature("compactdefaultargs") SetFlippingOptions;
		%feature("autodoc", "Sets the flipping to theisenabled state.

Parameters
----------
theIsEnabled: bool
theRefPlane: gp_Ax2

Returns
-------
None
") SetFlippingOptions;
		virtual void SetFlippingOptions(const Standard_Boolean theIsEnabled, const gp_Ax2 & theRefPlane);

		/****************** SetMinMaxValues ******************/
		/**** md5 signature: 8f1b3603bf0ea239a49c1aaa9521120e ****/
		%feature("compactdefaultargs") SetMinMaxValues;
		%feature("autodoc", "Sets the coordinates of the boundary box of the group.

Parameters
----------
theXMin: float
theYMin: float
theZMin: float
theXMax: float
theYMax: float
theZMax: float

Returns
-------
None
") SetMinMaxValues;
		void SetMinMaxValues(const Standard_Real theXMin, const Standard_Real theYMin, const Standard_Real theZMin, const Standard_Real theXMax, const Standard_Real theYMax, const Standard_Real theZMax);

		/****************** SetPrimitivesAspect ******************/
		/**** md5 signature: 3da7a768fd766aa68016939deaeb98d8 ****/
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "Modifies the current context of the group to give another aspect for all the primitives created after this call in the group.

Parameters
----------
theAspect: Graphic3d_Aspects

Returns
-------
None
") SetPrimitivesAspect;
		virtual void SetPrimitivesAspect(const opencascade::handle<Graphic3d_Aspects> & theAspect);

		/****************** SetStencilTestOptions ******************/
		/**** md5 signature: 6457feb9f8a1394b8d573403c194ddb8 ****/
		%feature("compactdefaultargs") SetStencilTestOptions;
		%feature("autodoc", "Sets the stencil test to theisenabled state;.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetStencilTestOptions;
		virtual void SetStencilTestOptions(const Standard_Boolean theIsEnabled);

		/****************** Structure ******************/
		/**** md5 signature: 81c8bb8d3594116a073834f280567560 ****/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "Returns the structure containing the group <self>.

Returns
-------
opencascade::handle<Graphic3d_Structure>
") Structure;
		opencascade::handle<Graphic3d_Structure> Structure();

		/****************** SynchronizeAspects ******************/
		/**** md5 signature: bdb913d6b6228a4dc1b27616e05ced5a ****/
		%feature("compactdefaultargs") SynchronizeAspects;
		%feature("autodoc", "Update presentation aspects after their modification.

Returns
-------
None
") SynchronizeAspects;
		virtual void SynchronizeAspects();

		/****************** Text ******************/
		/**** md5 signature: 5bc384ee5866377b1906b786bf720d9f ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Creates the string <atext> at position <apoint>. the 3d point of attachment is projected. the text is written in the plane of projection. the attributes are given with respect to the plane of projection. aheight : height of text. (relative to the normalized projection coordinates (npc) space). aangle : orientation of the text (with respect to the horizontal).

Parameters
----------
AText: char *
APoint: Graphic3d_Vertex
AHeight: float
AAngle: float
ATp: Graphic3d_TextPath
AHta: Graphic3d_HorizontalTextAlignment
AVta: Graphic3d_VerticalTextAlignment
EvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") Text;
		virtual void Text(const char * AText, const Graphic3d_Vertex & APoint, const Standard_Real AHeight, const Standard_Real AAngle, const Graphic3d_TextPath ATp, const Graphic3d_HorizontalTextAlignment AHta, const Graphic3d_VerticalTextAlignment AVta, const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		/**** md5 signature: be90bceed3d1f9ecfe73fb5d7eec2212 ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Creates the string <atext> at position <apoint>. the 3d point of attachment is projected. the text is written in the plane of projection. the attributes are given with respect to the plane of projection. aheight : height of text. (relative to the normalized projection coordinates (npc) space). the other attributes have the following default values: aangle : pi / 2. atp : tp_right ahta : hta_left avta : vta_bottom.

Parameters
----------
AText: char *
APoint: Graphic3d_Vertex
AHeight: float
EvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") Text;
		void Text(const char * AText, const Graphic3d_Vertex & APoint, const Standard_Real AHeight, const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		/**** md5 signature: 167eaea4dace1c338b0f703a2ac8d6fe ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Creates the string <atext> at position <apoint>. the 3d point of attachment is projected. the text is written in the plane of projection. the attributes are given with respect to the plane of projection. aheight : height of text. (relative to the normalized projection coordinates (npc) space). aangle : orientation of the text (with respect to the horizontal).

Parameters
----------
AText: TCollection_ExtendedString
APoint: Graphic3d_Vertex
AHeight: float
AAngle: float
ATp: Graphic3d_TextPath
AHta: Graphic3d_HorizontalTextAlignment
AVta: Graphic3d_VerticalTextAlignment
EvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") Text;
		void Text(const TCollection_ExtendedString & AText, const Graphic3d_Vertex & APoint, const Standard_Real AHeight, const Standard_Real AAngle, const Graphic3d_TextPath ATp, const Graphic3d_HorizontalTextAlignment AHta, const Graphic3d_VerticalTextAlignment AVta, const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		/**** md5 signature: f0783ae39f19a1a065467da9245f7532 ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Creates the string <atext> at position <apoint>. the 3d point of attachment is projected. the text is written in the plane of projection. the attributes are given with respect to the plane of projection. aheight : height of text. (relative to the normalized projection coordinates (npc) space). the other attributes have the following default values: aangle : pi / 2. atp : tp_right ahta : hta_left avta : vta_bottom.

Parameters
----------
AText: TCollection_ExtendedString
APoint: Graphic3d_Vertex
AHeight: float
EvalMinMax: bool,optional
	default value is Standard_True

Returns
-------
None
") Text;
		void Text(const TCollection_ExtendedString & AText, const Graphic3d_Vertex & APoint, const Standard_Real AHeight, const Standard_Boolean EvalMinMax = Standard_True);

		/****************** Text ******************/
		/**** md5 signature: 812712c97896a87a2f25f26ff37669e8 ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Creates the string <thetext> at orientation <theorientation> in 3d space.

Parameters
----------
theTextUtf: char *
theOrientation: gp_Ax2
theHeight: float
theAngle: float
theTp: Graphic3d_TextPath
theHTA: Graphic3d_HorizontalTextAlignment
theVTA: Graphic3d_VerticalTextAlignment
theToEvalMinMax: bool,optional
	default value is Standard_True
theHasOwnAnchor: bool,optional
	default value is Standard_True

Returns
-------
None
") Text;
		virtual void Text(const char * theTextUtf, const gp_Ax2 & theOrientation, const Standard_Real theHeight, const Standard_Real theAngle, const Graphic3d_TextPath theTp, const Graphic3d_HorizontalTextAlignment theHTA, const Graphic3d_VerticalTextAlignment theVTA, const Standard_Boolean theToEvalMinMax = Standard_True, const Standard_Boolean theHasOwnAnchor = Standard_True);

		/****************** Text ******************/
		/**** md5 signature: 25f0d7834c7faf3babb07e3c6cec385f ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Creates the string <thetext> at orientation <theorientation> in 3d space.

Parameters
----------
theText: TCollection_ExtendedString
theOrientation: gp_Ax2
theHeight: float
theAngle: float
theTp: Graphic3d_TextPath
theHTA: Graphic3d_HorizontalTextAlignment
theVTA: Graphic3d_VerticalTextAlignment
theToEvalMinMax: bool,optional
	default value is Standard_True
theHasOwnAnchor: bool,optional
	default value is Standard_True

Returns
-------
None
") Text;
		virtual void Text(const TCollection_ExtendedString & theText, const gp_Ax2 & theOrientation, const Standard_Real theHeight, const Standard_Real theAngle, const Graphic3d_TextPath theTp, const Graphic3d_HorizontalTextAlignment theHTA, const Graphic3d_VerticalTextAlignment theVTA, const Standard_Boolean theToEvalMinMax = Standard_True, const Standard_Boolean theHasOwnAnchor = Standard_True);

};


%make_alias(Graphic3d_Group)

%extend Graphic3d_Group {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetGroupPrimitivesAspect(self):
		pass
	}
};

/*****************************
* class Graphic3d_HatchStyle *
*****************************/
class Graphic3d_HatchStyle : public Standard_Transient {
	public:
		/****************** Graphic3d_HatchStyle ******************/
		/**** md5 signature: fcfca120b17f6cffb59f0865a47ae202 ****/
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "Creates a new custom hatch style with the given pattern and unique style id @warning raises a program error if given pattern image is not a valid 32*32 bitmap.

Parameters
----------
thePattern: Image_PixMap

Returns
-------
None
") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle(const opencascade::handle<Image_PixMap> & thePattern);

		/****************** Graphic3d_HatchStyle ******************/
		/**** md5 signature: dc1a1adbb2417ab3893a3b23a73a2d32 ****/
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "Creates a new predefined hatch style with the given id in aspect_hatchstyle enum. gpu memory for the pattern will not be allocated.

Parameters
----------
theType: Aspect_HatchStyle

Returns
-------
None
") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle(const Aspect_HatchStyle theType);

		/****************** HatchType ******************/
		/**** md5 signature: 2c6a35919cbda160bae1aceb31a8d63f ****/
		%feature("compactdefaultargs") HatchType;
		%feature("autodoc", "In case if predefined occt style is used, returns index in aspect_hatchstyle enumeration. if the style is custom, returns unique index of the style.

Returns
-------
int
") HatchType;
		Standard_Integer HatchType();

		/****************** Pattern ******************/
		/**** md5 signature: e0a5d2b4bbfd105d9cae001a4ba77d8b ****/
		%feature("compactdefaultargs") Pattern;
		%feature("autodoc", "Returns the pattern of custom hatch style.

Returns
-------
Standard_Byte *
") Pattern;
		const Standard_Byte * Pattern();

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
		/**** md5 signature: 6493b75ea05a8ab953e74ce8d421cc2d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
theStruct: Graphic3d_CStructure *
thePriority: int
isForChangePriority: bool,optional
	default value is Standard_False

Returns
-------
None
") Add;
		void Add(const Graphic3d_CStructure * theStruct, Standard_Integer thePriority, Standard_Boolean isForChangePriority = Standard_False);

		/****************** Append ******************/
		/**** md5 signature: f0f4bee4c0b9813775925533dc644b0f ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Append layer of acceptable type (with similar number of priorities or less). returns standard_false if the list can not be accepted.

Parameters
----------
theOther: Graphic3d_Layer

Returns
-------
bool
") Append;
		Standard_Boolean Append(const Graphic3d_Layer & theOther);

		/****************** ArrayOfStructures ******************/
		/**** md5 signature: ef8aba76a7ca6f293f49290963a7477e ****/
		%feature("compactdefaultargs") ArrayOfStructures;
		%feature("autodoc", "Returns array of structures.

Returns
-------
Graphic3d_ArrayOfIndexedMapOfStructure
") ArrayOfStructures;
		const Graphic3d_ArrayOfIndexedMapOfStructure & ArrayOfStructures();

		/****************** BoundingBox ******************/
		/**** md5 signature: 03e858a364fe586794f1c216400cfe53 ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns layer bounding box. @param theviewid view index to consider view affinity in structure @param thecamera camera definition @param thewindowwidth viewport width (for applying transformation-persistence) @param thewindowheight viewport height (for applying transformation-persistence) @param thetoincludeauxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) returns computed bounding box.

Parameters
----------
theViewId: int
theCamera: Graphic3d_Camera
theWindowWidth: int
theWindowHeight: int
theToIncludeAuxiliary: bool

Returns
-------
Bnd_Box
") BoundingBox;
		Bnd_Box BoundingBox(Standard_Integer theViewId, const opencascade::handle<Graphic3d_Camera> & theCamera, Standard_Integer theWindowWidth, Standard_Integer theWindowHeight, Standard_Boolean theToIncludeAuxiliary);

		/****************** CullableStructuresBVH ******************/
		/**** md5 signature: 60ec6c782e60ccf43b3cc5b479341c0e ****/
		%feature("compactdefaultargs") CullableStructuresBVH;
		%feature("autodoc", "Returns set of graphic3d_cstructures structures for building bvh tree.

Returns
-------
Graphic3d_BvhCStructureSet
") CullableStructuresBVH;
		const Graphic3d_BvhCStructureSet & CullableStructuresBVH();

		/****************** CullableTrsfPersStructuresBVH ******************/
		/**** md5 signature: 5e076cad1e27fea5cee8db2320d707c1 ****/
		%feature("compactdefaultargs") CullableTrsfPersStructuresBVH;
		%feature("autodoc", "Returns set of transform persistent graphic3d_cstructures for building bvh tree.

Returns
-------
Graphic3d_BvhCStructureSetTrsfPers
") CullableTrsfPersStructuresBVH;
		const Graphic3d_BvhCStructureSetTrsfPers & CullableTrsfPersStructuresBVH();

		/****************** InvalidateBVHData ******************/
		/**** md5 signature: 2fc22393f4d4ca2ae42c7f6212a1152a ****/
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "Marks bvh tree for given priority list as dirty and marks primitive set for rebuild.

Returns
-------
None
") InvalidateBVHData;
		void InvalidateBVHData();

		/****************** InvalidateBoundingBox ******************/
		/**** md5 signature: 134d1ff4127e86b51d809ffbbe1c1cd3 ****/
		%feature("compactdefaultargs") InvalidateBoundingBox;
		%feature("autodoc", "Marks cached bounding box as obsolete.

Returns
-------
None
") InvalidateBoundingBox;
		void InvalidateBoundingBox();

		/****************** IsCulled ******************/
		/**** md5 signature: a84f045efd889fe7503c666a795c890b ****/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "Returns true if layer is empty or has been discarded entirely by culling test.

Returns
-------
bool
") IsCulled;
		bool IsCulled();

		/****************** IsImmediate ******************/
		/**** md5 signature: 61db5a8037272eb61c5a3a4e001931f7 ****/
		%feature("compactdefaultargs") IsImmediate;
		%feature("autodoc", "Return true if layer was marked with immediate flag.

Returns
-------
bool
") IsImmediate;
		Standard_Boolean IsImmediate();

		/****************** LayerId ******************/
		/**** md5 signature: 4f3c96277ad1ad37bbea41df7a98d1f6 ****/
		%feature("compactdefaultargs") LayerId;
		%feature("autodoc", "Return layer id.

Returns
-------
Graphic3d_ZLayerId
") LayerId;
		Graphic3d_ZLayerId LayerId();

		/****************** LayerSettings ******************/
		/**** md5 signature: 77eff82582831e6aef7199e37c0feb22 ****/
		%feature("compactdefaultargs") LayerSettings;
		%feature("autodoc", "Returns settings of the layer object.

Returns
-------
Graphic3d_ZLayerSettings
") LayerSettings;
		const Graphic3d_ZLayerSettings & LayerSettings();

		/****************** NbOfTransformPersistenceObjects ******************/
		/**** md5 signature: 5f5d969ec7ca74366f93764250c7f0c8 ****/
		%feature("compactdefaultargs") NbOfTransformPersistenceObjects;
		%feature("autodoc", "Returns number of transform persistence objects.

Returns
-------
int
") NbOfTransformPersistenceObjects;
		Standard_Integer NbOfTransformPersistenceObjects();

		/****************** NbPriorities ******************/
		/**** md5 signature: 1a2f502bbb62a4131f9ef6c23352ef0a ****/
		%feature("compactdefaultargs") NbPriorities;
		%feature("autodoc", "Returns the number of available priority levels.

Returns
-------
int
") NbPriorities;
		Standard_Integer NbPriorities();

		/****************** NbStructures ******************/
		/**** md5 signature: d259ac5fb8c75b2b5950645466f32a00 ****/
		%feature("compactdefaultargs") NbStructures;
		%feature("autodoc", "Returns the number of structures.

Returns
-------
int
") NbStructures;
		Standard_Integer NbStructures();

		/****************** NbStructuresNotCulled ******************/
		/**** md5 signature: 024c9852203b0ea0e8743d7cb97679ce ****/
		%feature("compactdefaultargs") NbStructuresNotCulled;
		%feature("autodoc", "Number of not culled structures in the layer.

Returns
-------
int
") NbStructuresNotCulled;
		Standard_Integer NbStructuresNotCulled();

		/****************** NonCullableStructures ******************/
		/**** md5 signature: 38e7d008dfded361055484ef1e53d42e ****/
		%feature("compactdefaultargs") NonCullableStructures;
		%feature("autodoc", "Returns indexed map of always rendered structures.

Returns
-------
NCollection_IndexedMap< Graphic3d_CStructure *>
") NonCullableStructures;
		const NCollection_IndexedMap<const Graphic3d_CStructure *> & NonCullableStructures();

		/****************** Remove ******************/
		/**** md5 signature: 507deaa1a24883309d58b8bfe19b9bc0 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove structure and returns its priority, if the structure is not found, method returns negative value.

Parameters
----------
theStruct: Graphic3d_CStructure *
isForChangePriority: bool,optional
	default value is Standard_False

Returns
-------
thePriority: int
") Remove;
		bool Remove(const Graphic3d_CStructure * theStruct, Standard_Integer &OutValue, Standard_Boolean isForChangePriority = Standard_False);

		/****************** SetLayerSettings ******************/
		/**** md5 signature: 6813e1662f9cf34807e9b6113ac4bcc6 ****/
		%feature("compactdefaultargs") SetLayerSettings;
		%feature("autodoc", "Sets settings of the layer object.

Parameters
----------
theSettings: Graphic3d_ZLayerSettings

Returns
-------
None
") SetLayerSettings;
		void SetLayerSettings(const Graphic3d_ZLayerSettings & theSettings);

		/****************** UpdateCulling ******************/
		/**** md5 signature: 0c055279e50b63637445857e0a3e6256 ****/
		%feature("compactdefaultargs") UpdateCulling;
		%feature("autodoc", "Update culling state - should be called before rendering. traverses through bvh tree to determine which structures are in view volume.

Parameters
----------
theViewId: int
theSelector: Graphic3d_CullingTool
theFrustumCullingState: Graphic3d_RenderingParams::FrustumCulling

Returns
-------
None
") UpdateCulling;
		void UpdateCulling(Standard_Integer theViewId, const Graphic3d_CullingTool & theSelector, const Graphic3d_RenderingParams::FrustumCulling theFrustumCullingState);

		/****************** considerZoomPersistenceObjects ******************/
		/**** md5 signature: 1823e6b21bd9f11b0ca765b9a0f8c4aa ****/
		%feature("compactdefaultargs") considerZoomPersistenceObjects;
		%feature("autodoc", "Returns zoom-scale factor.

Parameters
----------
theViewId: int
theCamera: Graphic3d_Camera
theWindowWidth: int
theWindowHeight: int

Returns
-------
float
") considerZoomPersistenceObjects;
		Standard_Real considerZoomPersistenceObjects(Standard_Integer theViewId, const opencascade::handle<Graphic3d_Camera> & theCamera, Standard_Integer theWindowWidth, Standard_Integer theWindowHeight);

};


%make_alias(Graphic3d_Layer)

%extend Graphic3d_Layer {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def FrustumCullingBVHBuilder(self):
		pass

	@methodnotwrapped
	def Graphic3d_Layer(self):
		pass

	@methodnotwrapped
	def SetFrustumCullingBVHBuilder(self):
		pass
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

/* python proy classes for enums */
%pythoncode {

class IterationFilter(IntEnum):
	IterationFilter_None = 0
	IterationFilter_ExcludeAmbient = 2
	IterationFilter_ExcludeDisabled = 4
	IterationFilter_ExcludeDisabledAndAmbient = IterationFilter_ExcludeAmbient | IterationFilter_ExcludeDisabled
IterationFilter_None = IterationFilter.IterationFilter_None
IterationFilter_ExcludeAmbient = IterationFilter.IterationFilter_ExcludeAmbient
IterationFilter_ExcludeDisabled = IterationFilter.IterationFilter_ExcludeDisabled
IterationFilter_ExcludeDisabledAndAmbient = IterationFilter.IterationFilter_ExcludeDisabledAndAmbient
};
/* end python proxy for enums */

		/****************** Graphic3d_LightSet ******************/
		/**** md5 signature: f1fa4a2d1fa9fa24f50a84f14f029c24 ****/
		%feature("compactdefaultargs") Graphic3d_LightSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_LightSet;
		 Graphic3d_LightSet();

		/****************** Add ******************/
		/**** md5 signature: b5ceec7821158030561464f163d50030 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Append new light source.

Parameters
----------
theLight: Graphic3d_CLight

Returns
-------
bool
") Add;
		Standard_Boolean Add(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****************** AmbientColor ******************/
		/**** md5 signature: 193bc0979d168e33958f599a7678d64b ****/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "Returns cumulative ambient color, which is computed as sum of all enabled ambient light sources. values are not clamped (can be greater than 1.0f) and alpha component is fixed to 1.0f. @sa updaterevision().

Returns
-------
Graphic3d_Vec4
") AmbientColor;
		const Graphic3d_Vec4 & AmbientColor();

		/****************** Contains ******************/
		/**** md5 signature: 2c7d8831be7d7b5ada9f3a8004c0e508 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Return true if light source is defined in this set.

Parameters
----------
theLight: Graphic3d_CLight

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****************** Extent ******************/
		/**** md5 signature: 19453f219e568f9c5109a0fd06459e95 ****/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return number of light sources.

Returns
-------
int
") Extent;
		Standard_Integer Extent();

		/****************** IsEmpty ******************/
		/**** md5 signature: d529c07ce9e12eea3222188c82b0e80b ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if lights list is empty.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** KeyEnabledLong ******************/
		/**** md5 signature: daad6128aa16c8c7ca6093b32c70f88e ****/
		%feature("compactdefaultargs") KeyEnabledLong;
		%feature("autodoc", "Returns a string defining a list of enabled light sources as concatenation of letters 'd' (directional), 'p' (point), 's' (spot) depending on the type of light source in the list. example: 'dppp'. @sa updaterevision().

Returns
-------
TCollection_AsciiString
") KeyEnabledLong;
		const TCollection_AsciiString & KeyEnabledLong();

		/****************** KeyEnabledShort ******************/
		/**** md5 signature: 60cb0cca9e6d8d2f31105c94dbfdcfda ****/
		%feature("compactdefaultargs") KeyEnabledShort;
		%feature("autodoc", "Returns a string defining a list of enabled light sources as concatenation of letters 'd' (directional), 'p' (point), 's' (spot) depending on the type of light source in the list, specified only once. example: 'dp'. @sa updaterevision().

Returns
-------
TCollection_AsciiString
") KeyEnabledShort;
		const TCollection_AsciiString & KeyEnabledShort();

		/****************** Lower ******************/
		/**** md5 signature: a2a9f1c3c17fa0f26434aadaabeff45a ****/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return lower light index.

Returns
-------
int
") Lower;
		Standard_Integer Lower();

		/****************** NbEnabled ******************/
		/**** md5 signature: 310cabcdfa0ca3f2a531d50ff77c4b75 ****/
		%feature("compactdefaultargs") NbEnabled;
		%feature("autodoc", "Returns total amount of enabled lights excluding ambient. @sa updaterevision().

Returns
-------
int
") NbEnabled;
		Standard_Integer NbEnabled();

		/****************** NbEnabledLightsOfType ******************/
		/**** md5 signature: bf3a9c28dac03b65b9452e6cae08692c ****/
		%feature("compactdefaultargs") NbEnabledLightsOfType;
		%feature("autodoc", "Returns total amount of enabled lights of specified type. @sa updaterevision().

Parameters
----------
theType: Graphic3d_TypeOfLightSource

Returns
-------
int
") NbEnabledLightsOfType;
		Standard_Integer NbEnabledLightsOfType(Graphic3d_TypeOfLightSource theType);

		/****************** NbLightsOfType ******************/
		/**** md5 signature: aee4b2ae85df781b874d194cab94c96a ****/
		%feature("compactdefaultargs") NbLightsOfType;
		%feature("autodoc", "Returns total amount of lights of specified type.

Parameters
----------
theType: Graphic3d_TypeOfLightSource

Returns
-------
int
") NbLightsOfType;
		Standard_Integer NbLightsOfType(Graphic3d_TypeOfLightSource theType);

		/****************** Remove ******************/
		/**** md5 signature: 40d0453244ce8c060ba3373b165a7b1d ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove light source.

Parameters
----------
theLight: Graphic3d_CLight

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****************** Revision ******************/
		/**** md5 signature: dfd4fb672d125a081a8b5a357ac81453 ****/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "Return light sources revision. @sa updaterevision().

Returns
-------
Standard_Size
") Revision;
		Standard_Size Revision();

		/****************** UpdateRevision ******************/
		/**** md5 signature: 82265ef0f028adc05e9e39a5dab4e5db ****/
		%feature("compactdefaultargs") UpdateRevision;
		%feature("autodoc", "Update light sources revision.

Returns
-------
Standard_Size
") UpdateRevision;
		Standard_Size UpdateRevision();

		/****************** Upper ******************/
		/**** md5 signature: 621f04fab59b49711e54299100973c4e ****/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return upper light index.

Returns
-------
int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		/**** md5 signature: 0b6f47ab82b955df69f2afd3dc3abf2e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return the light source for specified index within range [lower(), upper()].

Parameters
----------
theIndex: int

Returns
-------
opencascade::handle<Graphic3d_CLight>
") Value;
		const opencascade::handle<Graphic3d_CLight> & Value(Standard_Integer theIndex);

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
		/****************** Graphic3d_MarkerImage ******************/
		/**** md5 signature: bc81d3d5607b7b8b46844ce8c987f1c1 ****/
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "@param theimage - source image.

Parameters
----------
theImage: Image_PixMap

Returns
-------
None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage(const opencascade::handle<Image_PixMap> & theImage);

		/****************** Graphic3d_MarkerImage ******************/
		/**** md5 signature: 903337a1929035a8f566affc039597d8 ****/
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "Creates marker image from array of bytes (method for compatibility with old markers definition). @param thebitmap - source bitmap stored as array of bytes @param thewidth - number of bits in a row @param theheight - number of bits in a column.

Parameters
----------
theBitMap: TColStd_HArray1OfByte
theWidth: int
theHeight: int

Returns
-------
None
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage(const opencascade::handle<TColStd_HArray1OfByte> & theBitMap, const Standard_Integer & theWidth, const Standard_Integer & theHeight);

		/****************** GetBitMapArray ******************/
		/**** md5 signature: 761630760f4875c567a4afb13f11bc05 ****/
		%feature("compactdefaultargs") GetBitMapArray;
		%feature("autodoc", "@param thealphavalue pixels in the image that have alpha value greater than  or equal to this parameter will be stored in bitmap as '1',  others will be stored as '0' returns marker image as array of bytes. if an instance of the class has been initialized with image, it will be converted to bitmap based on the parameter thealphavalue.

Parameters
----------
theAlphaValue: float,optional
	default value is 0.5

Returns
-------
opencascade::handle<TColStd_HArray1OfByte>
") GetBitMapArray;
		opencascade::handle<TColStd_HArray1OfByte> GetBitMapArray(const Standard_Real & theAlphaValue = 0.5);

		/****************** GetImage ******************/
		/**** md5 signature: 7c5ebfa0efa07e00e52abb3fc0528025 ****/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "Returns marker image. if an instance of the class has been initialized with a bitmap, it will be converted to image.

Returns
-------
opencascade::handle<Image_PixMap>
") GetImage;
		const opencascade::handle<Image_PixMap> & GetImage();

		/****************** GetImageAlpha ******************/
		/**** md5 signature: b0e6060aafe710fcaa00bf6675fccfe4 ****/
		%feature("compactdefaultargs") GetImageAlpha;
		%feature("autodoc", "Returns image alpha as grayscale image. note that if an instance of the class has been initialized with a bitmap or with grayscale image this method will return exactly the same image as getimage().

Returns
-------
opencascade::handle<Image_PixMap>
") GetImageAlpha;
		const opencascade::handle<Image_PixMap> & GetImageAlpha();

		/****************** GetImageAlphaId ******************/
		/**** md5 signature: 7b5ae989b5c104ce2610c4c118e2ae01 ****/
		%feature("compactdefaultargs") GetImageAlphaId;
		%feature("autodoc", "Returns an unique id. this id will be used to manage resource in graphic driver.

Returns
-------
TCollection_AsciiString
") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId();

		/****************** GetImageId ******************/
		/**** md5 signature: 602256488e6c98131d81feb766841aac ****/
		%feature("compactdefaultargs") GetImageId;
		%feature("autodoc", "Returns an unique id. this id will be used to manage resource in graphic driver.

Returns
-------
TCollection_AsciiString
") GetImageId;
		const TCollection_AsciiString & GetImageId();

		/****************** GetTextureSize ******************/
		/**** md5 signature: 613d235550caf2f8304bcaae6f035920 ****/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "Returns texture size.

Parameters
----------

Returns
-------
theWidth: int
theHeight: int
") GetTextureSize;
		void GetTextureSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

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
		/****************** Graphic3d_MaterialAspect ******************/
		/**** md5 signature: f65a0596643873ad9942f8a59f366520 ****/
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "Creates a material from default values.

Returns
-------
None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect();

		/****************** Graphic3d_MaterialAspect ******************/
		/**** md5 signature: b21c8dcad98059d7147f4fa75b4a1d23 ****/
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "Creates a generic material.

Parameters
----------
theName: Graphic3d_NameOfMaterial

Returns
-------
None
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect(const Graphic3d_NameOfMaterial theName);

		/****************** Alpha ******************/
		/**** md5 signature: 7ca16a70b060b6cea195b679eee9d6a0 ****/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Returns the alpha coefficient of the surface (1.0 - transparency); 1.0 means opaque.

Returns
-------
Standard_ShortReal
") Alpha;
		Standard_ShortReal Alpha();

		/****************** AmbientColor ******************/
		/**** md5 signature: e4a244c2e5729c893bef272554a0e36f ****/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "Returns the ambient color of the surface.

Returns
-------
Quantity_Color
") AmbientColor;
		const Quantity_Color & AmbientColor();

		/****************** BSDF ******************/
		/**** md5 signature: 0e4f43101c28e33adbb6ee92a6718d50 ****/
		%feature("compactdefaultargs") BSDF;
		%feature("autodoc", "Returns bsdf (bidirectional scattering distribution function).

Returns
-------
Graphic3d_BSDF
") BSDF;
		const Graphic3d_BSDF & BSDF();

		/****************** Color ******************/
		/**** md5 signature: 7cec116411eb20e52d1fabf3015346da ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the diffuse color of the surface. warning! this method does not return color for graphic3d_material_aspect material (color is defined by graphic3d_aspects::interiorcolor()).

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color & Color();

		/****************** DiffuseColor ******************/
		/**** md5 signature: 446509545f5afda1c3e3353ec03d6c00 ****/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "Returns the diffuse color of the surface.

Returns
-------
Quantity_Color
") DiffuseColor;
		const Quantity_Color & DiffuseColor();

		/****************** EmissiveColor ******************/
		/**** md5 signature: 8e2c00d43bcbb308aeca1ba33f04a139 ****/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "Returns the emissive color of the surface.

Returns
-------
Quantity_Color
") EmissiveColor;
		const Quantity_Color & EmissiveColor();

		/****************** IncreaseShine ******************/
		/**** md5 signature: 27025ec6ea9d020eb18bb3c5506ed91d ****/
		%feature("compactdefaultargs") IncreaseShine;
		%feature("autodoc", "Increases or decreases the luminosity. @param thedelta a signed percentage.

Parameters
----------
theDelta: Standard_ShortReal

Returns
-------
None
") IncreaseShine;
		void IncreaseShine(const Standard_ShortReal theDelta);

		/****************** IsDifferent ******************/
		/**** md5 signature: 0b6b071c1cbbb7bdf97e4a6899992d11 ****/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if this material differs from specified one.

Parameters
----------
theOther: Graphic3d_MaterialAspect

Returns
-------
bool
") IsDifferent;
		Standard_Boolean IsDifferent(const Graphic3d_MaterialAspect & theOther);

		/****************** IsEqual ******************/
		/**** md5 signature: 07e8862cc8ec437b30e22992934a7ba6 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if this material is identical to specified one.

Parameters
----------
theOther: Graphic3d_MaterialAspect

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const Graphic3d_MaterialAspect & theOther);

		/****************** MaterialFromName ******************/
		/**** md5 signature: 09fb9c26447367905c9ef4e50ddb0939 ****/
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "Finds the material for specified name. @param thename [in] name to find @param themat [out] found material returns false if name was unrecognized.

Parameters
----------
theName: char *
theMat: Graphic3d_NameOfMaterial

Returns
-------
bool
") MaterialFromName;
		static Standard_Boolean MaterialFromName(const char * theName, Graphic3d_NameOfMaterial & theMat);

		/****************** MaterialFromName ******************/
		/**** md5 signature: 5208b8b1000547cce2f00804c81986c6 ****/
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "Returns the material for specified name or graphic3d_nom_default if name is unknown.

Parameters
----------
theName: char *

Returns
-------
Graphic3d_NameOfMaterial
") MaterialFromName;
		static Graphic3d_NameOfMaterial MaterialFromName(const char * theName);

		/****************** MaterialName ******************/
		/**** md5 signature: d372647674cf61e514d12db5cd3f1b18 ****/
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "Returns the name of the predefined material of specified rank within range [1, numberofmaterials()].

Parameters
----------
theRank: int

Returns
-------
char *
") MaterialName;
		static const char * MaterialName(const Standard_Integer theRank);

		/****************** MaterialName ******************/
		/**** md5 signature: 6e198d14926374db627e08901b3098c0 ****/
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "Returns the given name of this material. this might be:.

Returns
-------
char *
") MaterialName;
		const char * MaterialName();

		/****************** MaterialType ******************/
		/**** md5 signature: 062008507cb52b85e69ad9189fb25451 ****/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "Returns the type of the predefined material of specified rank within range [1, numberofmaterials()].

Parameters
----------
theRank: int

Returns
-------
Graphic3d_TypeOfMaterial
") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType(const Standard_Integer theRank);

		/****************** MaterialType ******************/
		/**** md5 signature: a535fdabfcb61ac6089ae7ac4e67bd14 ****/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "Returns material type.

Returns
-------
Graphic3d_TypeOfMaterial
") MaterialType;
		Graphic3d_TypeOfMaterial MaterialType();

		/****************** MaterialType ******************/
		/**** md5 signature: c1acda1c132bb60cbfdfd61bf961071e ****/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "Returns true if type of this material is equal to specified type.

Parameters
----------
theType: Graphic3d_TypeOfMaterial

Returns
-------
bool
") MaterialType;
		Standard_Boolean MaterialType(const Graphic3d_TypeOfMaterial theType);

		/****************** Name ******************/
		/**** md5 signature: 7b95abe48c4d39c49b4f0fb25727b291 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the material name (within predefined enumeration).

Returns
-------
Graphic3d_NameOfMaterial
") Name;
		Graphic3d_NameOfMaterial Name();

		/****************** NumberOfMaterials ******************/
		/**** md5 signature: 4c1f8a5993d3fd603dfbf69a0b908768 ****/
		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "Returns the number of predefined textures.

Returns
-------
int
") NumberOfMaterials;
		static Standard_Integer NumberOfMaterials();

		/****************** ReflectionMode ******************/
		/**** md5 signature: d37a0fd919e6ea813d6e18de89c04bce ****/
		%feature("compactdefaultargs") ReflectionMode;
		%feature("autodoc", "Returns true if the reflection mode is active, false otherwise.

Parameters
----------
theType: Graphic3d_TypeOfReflection

Returns
-------
bool
") ReflectionMode;
		Standard_Boolean ReflectionMode(const Graphic3d_TypeOfReflection theType);

		/****************** RefractionIndex ******************/
		/**** md5 signature: 37e26b8eeb89ee70e535356ff72df1b3 ****/
		%feature("compactdefaultargs") RefractionIndex;
		%feature("autodoc", "Returns the refraction index of the material.

Returns
-------
Standard_ShortReal
") RefractionIndex;
		Standard_ShortReal RefractionIndex();

		/****************** RequestedName ******************/
		/**** md5 signature: fe6f9143f405caf35794a3ef6fa8ed54 ****/
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "Returns the material name within predefined enumeration which has been requested (before modifications).

Returns
-------
Graphic3d_NameOfMaterial
") RequestedName;
		Graphic3d_NameOfMaterial RequestedName();

		/****************** Reset ******************/
		/**** md5 signature: e3081050d274769a1cd4a93969da94c6 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Resets the material with the original values according to the material name but leave the current color values untouched for the material of type aspect.

Returns
-------
None
") Reset;
		void Reset();

		/****************** SetAlpha ******************/
		/**** md5 signature: b1ec2a54a74fcdd6f5f79e6e88318f2a ****/
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "Modifies the alpha coefficient of the surface, where 1.0 is opaque and 0.0 is fully transparent.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetAlpha;
		void SetAlpha(Standard_ShortReal theValue);

		/****************** SetAmbientColor ******************/
		/**** md5 signature: d846703cfa0eddd0c6b6bbd51fe20b71 ****/
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "Modifies the ambient color of the surface.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetAmbientColor;
		void SetAmbientColor(const Quantity_Color & theColor);

		/****************** SetBSDF ******************/
		/**** md5 signature: 97077de057f37bb47c74045c23a1223f ****/
		%feature("compactdefaultargs") SetBSDF;
		%feature("autodoc", "Modifies the bsdf (bidirectional scattering distribution function).

Parameters
----------
theBSDF: Graphic3d_BSDF

Returns
-------
None
") SetBSDF;
		void SetBSDF(const Graphic3d_BSDF & theBSDF);

		/****************** SetColor ******************/
		/**** md5 signature: 4493bec663df9e92c429e56b9c76a307 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Modifies the ambient and diffuse color of the surface. warning! has no effect for graphic3d_material_aspect material (color should be set to graphic3d_aspects::setinteriorcolor()).

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetDiffuseColor ******************/
		/**** md5 signature: 21aac63ac919b9eb2a7eca4f09279c40 ****/
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "Modifies the diffuse color of the surface.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetDiffuseColor;
		void SetDiffuseColor(const Quantity_Color & theColor);

		/****************** SetEmissiveColor ******************/
		/**** md5 signature: 9415dcf0db51ccae64f7c1ae8c719400 ****/
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "Modifies the emissive color of the surface.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetEmissiveColor;
		void SetEmissiveColor(const Quantity_Color & theColor);

		/****************** SetMaterialName ******************/
		/**** md5 signature: e0eaa3dfb67d9662b0405487353b4154 ****/
		%feature("compactdefaultargs") SetMaterialName;
		%feature("autodoc", "The current material become a 'userdefined' material. set the name of the 'userdefined' material.

Parameters
----------
theName: TCollection_AsciiString

Returns
-------
None
") SetMaterialName;
		void SetMaterialName(const TCollection_AsciiString & theName);

		/****************** SetMaterialType ******************/
		/**** md5 signature: ab421f4a4a9e8596a2d576bdcb2e892a ****/
		%feature("compactdefaultargs") SetMaterialType;
		%feature("autodoc", "Set material type.

Parameters
----------
theType: Graphic3d_TypeOfMaterial

Returns
-------
None
") SetMaterialType;
		void SetMaterialType(const Graphic3d_TypeOfMaterial theType);

		/****************** SetReflectionModeOff ******************/
		/**** md5 signature: 54ab6b720121b4b30907a4a5ec49da13 ****/
		%feature("compactdefaultargs") SetReflectionModeOff;
		%feature("autodoc", "Deactivates the reflective properties of the surface with specified reflection type.

Parameters
----------
theType: Graphic3d_TypeOfReflection

Returns
-------
None
") SetReflectionModeOff;
		void SetReflectionModeOff(const Graphic3d_TypeOfReflection theType);

		/****************** SetRefractionIndex ******************/
		/**** md5 signature: 4800c76294be3402148efd2a431e791d ****/
		%feature("compactdefaultargs") SetRefractionIndex;
		%feature("autodoc", "Modifies the refraction index of the material. warning: raises materialdefinitionerror if given value is a lesser than 1.0.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetRefractionIndex;
		void SetRefractionIndex(const Standard_ShortReal theValue);

		/****************** SetShininess ******************/
		/**** md5 signature: a3f2f285335feddcd80b0c2107b986f6 ****/
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "Modifies the luminosity of the surface. warning: raises materialdefinitionerror if given value is a negative value or greater than 1.0.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetShininess;
		void SetShininess(const Standard_ShortReal theValue);

		/****************** SetSpecularColor ******************/
		/**** md5 signature: 64f6579cc62bba02bc4da29b4557b091 ****/
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "Modifies the specular color of the surface.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetSpecularColor;
		void SetSpecularColor(const Quantity_Color & theColor);

		/****************** SetTransparency ******************/
		/**** md5 signature: ae35c1320747f9ea1028feec38480fd1 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Modifies the transparency coefficient of the surface, where 0 is opaque and 1 is fully transparent. transparency is applicable to materials that have at least one of reflection modes (ambient, diffuse, specular or emissive) enabled. see also setreflectionmodeon() and setreflectionmodeoff() methods. //! warning: raises materialdefinitionerror if given value is a negative value or greater than 1.0.

Parameters
----------
theValue: Standard_ShortReal

Returns
-------
None
") SetTransparency;
		void SetTransparency(const Standard_ShortReal theValue);

		/****************** Shininess ******************/
		/**** md5 signature: a4bf27bb1bd7bef573404edb592e65f3 ****/
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "Returns the luminosity of the surface.

Returns
-------
Standard_ShortReal
") Shininess;
		Standard_ShortReal Shininess();

		/****************** SpecularColor ******************/
		/**** md5 signature: 8248d955c130699f6669657101e22663 ****/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "Returns the specular color of the surface.

Returns
-------
Quantity_Color
") SpecularColor;
		const Quantity_Color & SpecularColor();

		/****************** StringName ******************/
		/**** md5 signature: 8107033bd84a45ab4a9514a887a7886e ****/
		%feature("compactdefaultargs") StringName;
		%feature("autodoc", "Returns the given name of this material. this might be: - given name set by method ::setmaterialname() - standard name for a material within enumeration - 'userdefined' for non-standard material without name specified externally.

Returns
-------
TCollection_AsciiString
") StringName;
		const TCollection_AsciiString & StringName();

		/****************** Transparency ******************/
		/**** md5 signature: aaef40cf92b2687b1ecee77a6c9e4eed ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Returns the transparency coefficient of the surface (1.0 - alpha); 0.0 means opaque.

Returns
-------
Standard_ShortReal
") Transparency;
		Standard_ShortReal Transparency();


            %extend{
                bool __ne_wrapper__(const Graphic3d_MaterialAspect other) {
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
                bool __eq_wrapper__(const Graphic3d_MaterialAspect other) {
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
		/****************** Graphic3d_PolygonOffset ******************/
		/**** md5 signature: d32d266ad893dbdf6f93b0afae8a9bb9 ****/
		%feature("compactdefaultargs") Graphic3d_PolygonOffset;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_PolygonOffset;
		 Graphic3d_PolygonOffset();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };

            %extend{
                bool __eq_wrapper__(const Graphic3d_PolygonOffset other) {
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
		/****************** Graphic3d_PresentationAttributes ******************/
		/**** md5 signature: 278bc90569b579d12d8d802b786248db ****/
		%feature("compactdefaultargs") Graphic3d_PresentationAttributes;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_PresentationAttributes;
		 Graphic3d_PresentationAttributes();

		/****************** BasicFillAreaAspect ******************/
		/**** md5 signature: 893da1066ab7497d7a1e4022f39ad6ec ****/
		%feature("compactdefaultargs") BasicFillAreaAspect;
		%feature("autodoc", "Return basic presentation fill area aspect, null by default. when set, might be used instead of color() property.

Returns
-------
opencascade::handle<Graphic3d_AspectFillArea3d>
") BasicFillAreaAspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & BasicFillAreaAspect();

		/****************** Color ******************/
		/**** md5 signature: 7cec116411eb20e52d1fabf3015346da ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns basic presentation color, quantity_noc_white by default.

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color & Color();

		/****************** ColorRGBA ******************/
		/**** md5 signature: 615b6d48d8bc4764a07d0e2ff837764b ****/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "Returns basic presentation color (including alpha channel).

Returns
-------
Quantity_ColorRGBA
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA();

		/****************** DisplayMode ******************/
		/**** md5 signature: 87ab8eae5ccb1d4f4dfd02dc34d6febc ****/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Returns display mode, 0 by default. -1 means undefined (main display mode of presentation to be used).

Returns
-------
int
") DisplayMode;
		Standard_Integer DisplayMode();

		/****************** Method ******************/
		/**** md5 signature: b302ac4956523d91e861bf2704dd879d ****/
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "Returns highlight method, aspect_tohm_color by default.

Returns
-------
Aspect_TypeOfHighlightMethod
") Method;
		Aspect_TypeOfHighlightMethod Method();

		/****************** SetBasicFillAreaAspect ******************/
		/**** md5 signature: 9c360396619883e6313847d330724906 ****/
		%feature("compactdefaultargs") SetBasicFillAreaAspect;
		%feature("autodoc", "Sets basic presentation fill area aspect.

Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Returns
-------
None
") SetBasicFillAreaAspect;
		virtual void SetBasicFillAreaAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****************** SetColor ******************/
		/**** md5 signature: 00f0a4e343c1e144a6992078bccbe32c ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets basic presentation color (rgb components, does not modifies transparency).

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetDisplayMode ******************/
		/**** md5 signature: 8fcdb511077259bc82849c206b53a806 ****/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "Sets display mode.

Parameters
----------
theMode: int

Returns
-------
None
") SetDisplayMode;
		virtual void SetDisplayMode(const Standard_Integer theMode);

		/****************** SetMethod ******************/
		/**** md5 signature: b7b1fb8e3db7c212dfca06ddad4bd2fa ****/
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "Changes highlight method to the given one.

Parameters
----------
theMethod: Aspect_TypeOfHighlightMethod

Returns
-------
None
") SetMethod;
		virtual void SetMethod(const Aspect_TypeOfHighlightMethod theMethod);

		/****************** SetTransparency ******************/
		/**** md5 signature: d0d6ebef60a8faad8436f8a967d31954 ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Sets basic presentation transparency (0 - opaque, 1 - fully transparent).

Parameters
----------
theTranspCoef: Standard_ShortReal

Returns
-------
None
") SetTransparency;
		virtual void SetTransparency(const Standard_ShortReal theTranspCoef);

		/****************** SetZLayer ******************/
		/**** md5 signature: ecf007389b4013cc9520dae6bc2141f2 ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Sets presentation zlayer.

Parameters
----------
theLayer: int

Returns
-------
None
") SetZLayer;
		virtual void SetZLayer(int theLayer);

		/****************** Transparency ******************/
		/**** md5 signature: aaef40cf92b2687b1ecee77a6c9e4eed ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Returns basic presentation transparency (0 - opaque, 1 - fully transparent), 0 by default (opaque).

Returns
-------
Standard_ShortReal
") Transparency;
		Standard_ShortReal Transparency();

		/****************** ZLayer ******************/
		/**** md5 signature: 7420fa5788bb824c02345ee38be45933 ****/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Returns presentation zlayer, graphic3d_zlayerid_default by default. graphic3d_zlayerid_unknown means undefined (a layer of main presentation to be used).

Returns
-------
Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer();

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

/* python proy classes for enums */
%pythoncode {

class Anaglyph(IntEnum):
	Anaglyph_RedCyan_Simple = 0
	Anaglyph_RedCyan_Optimized = 1
	Anaglyph_YellowBlue_Simple = 2
	Anaglyph_YellowBlue_Optimized = 3
	Anaglyph_GreenMagenta_Simple = 4
	Anaglyph_UserDefined = 5
Anaglyph_RedCyan_Simple = Anaglyph.Anaglyph_RedCyan_Simple
Anaglyph_RedCyan_Optimized = Anaglyph.Anaglyph_RedCyan_Optimized
Anaglyph_YellowBlue_Simple = Anaglyph.Anaglyph_YellowBlue_Simple
Anaglyph_YellowBlue_Optimized = Anaglyph.Anaglyph_YellowBlue_Optimized
Anaglyph_GreenMagenta_Simple = Anaglyph.Anaglyph_GreenMagenta_Simple
Anaglyph_UserDefined = Anaglyph.Anaglyph_UserDefined

class PerfCounters(IntEnum):
	PerfCounters_NONE = 0
	PerfCounters_FrameRate = 1
	PerfCounters_CPU = 2
	PerfCounters_Layers = 4
	PerfCounters_Structures = 8
	PerfCounters_Groups = 16
	PerfCounters_GroupArrays = 32
	PerfCounters_Triangles = 64
	PerfCounters_Points = 128
	PerfCounters_EstimMem = 256
	PerfCounters_FrameTime = 512
	PerfCounters_FrameTimeMax = 1024
	PerfCounters_SkipImmediate = 2048
	PerfCounters_Basic = PerfCounters_FrameRate | PerfCounters_CPU | PerfCounters_Layers | PerfCounters_Structures
	PerfCounters_Extended = PerfCounters_Basic | PerfCounters_Groups | PerfCounters_GroupArrays | PerfCounters_Triangles | PerfCounters_Points | PerfCounters_EstimMem
	PerfCounters_All = PerfCounters_Extended | PerfCounters_FrameTime | PerfCounters_FrameTimeMax
PerfCounters_NONE = PerfCounters.PerfCounters_NONE
PerfCounters_FrameRate = PerfCounters.PerfCounters_FrameRate
PerfCounters_CPU = PerfCounters.PerfCounters_CPU
PerfCounters_Layers = PerfCounters.PerfCounters_Layers
PerfCounters_Structures = PerfCounters.PerfCounters_Structures
PerfCounters_Groups = PerfCounters.PerfCounters_Groups
PerfCounters_GroupArrays = PerfCounters.PerfCounters_GroupArrays
PerfCounters_Triangles = PerfCounters.PerfCounters_Triangles
PerfCounters_Points = PerfCounters.PerfCounters_Points
PerfCounters_EstimMem = PerfCounters.PerfCounters_EstimMem
PerfCounters_FrameTime = PerfCounters.PerfCounters_FrameTime
PerfCounters_FrameTimeMax = PerfCounters.PerfCounters_FrameTimeMax
PerfCounters_SkipImmediate = PerfCounters.PerfCounters_SkipImmediate
PerfCounters_Basic = PerfCounters.PerfCounters_Basic
PerfCounters_Extended = PerfCounters.PerfCounters_Extended
PerfCounters_All = PerfCounters.PerfCounters_All

class FrustumCulling(IntEnum):
	FrustumCulling_Off = 0
	FrustumCulling_On = 1
	FrustumCulling_NoUpdate = 2
FrustumCulling_Off = FrustumCulling.FrustumCulling_Off
FrustumCulling_On = FrustumCulling.FrustumCulling_On
FrustumCulling_NoUpdate = FrustumCulling.FrustumCulling_NoUpdate
};
/* end python proxy for enums */

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
		opencascade::handle<Graphic3d_TransformPers > StatsPosition;
		opencascade::handle<Graphic3d_TransformPers > ChartPosition;
		Graphic3d_Vec2i ChartSize;
		opencascade::handle<Graphic3d_AspectText3d > StatsTextAspect;
		Standard_ShortReal StatsUpdateInterval;
		int StatsTextHeight;
		int StatsNbFrames;
		Standard_ShortReal StatsMaxChartTime;
		PerfCounters CollectedStats;
		bool ToShowStats;
		unsigned int Resolution;
		/****************** Graphic3d_RenderingParams ******************/
		/**** md5 signature: 604df3cf93dfd3384e91a3c3f46c32b4 ****/
		%feature("compactdefaultargs") Graphic3d_RenderingParams;
		%feature("autodoc", "Creates default rendering parameters.

Returns
-------
None
") Graphic3d_RenderingParams;
		 Graphic3d_RenderingParams();

		/****************** ResolutionRatio ******************/
		/**** md5 signature: 57d680035ff41120d22ad8575654a631 ****/
		%feature("compactdefaultargs") ResolutionRatio;
		%feature("autodoc", "Returns resolution ratio.

Returns
-------
Standard_ShortReal
") ResolutionRatio;
		Standard_ShortReal ResolutionRatio();

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
		/****************** Graphic3d_SequenceOfHClipPlane ******************/
		/**** md5 signature: dea7065ac573d924d683688d8c6ccbf7 ****/
		%feature("compactdefaultargs") Graphic3d_SequenceOfHClipPlane;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_SequenceOfHClipPlane;
		 Graphic3d_SequenceOfHClipPlane();

		/****************** Append ******************/
		/**** md5 signature: 3e9b7d5c84d70e6e8931014728e4bacd ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Append a plane. returns true if new item has been added (false if item already existed).

Parameters
----------
theItem: Graphic3d_ClipPlane

Returns
-------
bool
") Append;
		bool Append(const opencascade::handle<Graphic3d_ClipPlane> & theItem);

		/****************** Clear ******************/
		/**** md5 signature: 75abd67f132413fc11c19201aabf1126 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear the items out.

Returns
-------
None
") Clear;
		void Clear();

		/****************** First ******************/
		/**** md5 signature: cc797633cf7616f9dd4c3a09257e2742 ****/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return the first item in sequence.

Returns
-------
opencascade::handle<Graphic3d_ClipPlane>
") First;
		const opencascade::handle<Graphic3d_ClipPlane> & First();

		/****************** IsEmpty ******************/
		/**** md5 signature: 70a41d5fe65955a28167088305fc6991 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return true if sequence is empty.

Returns
-------
bool
") IsEmpty;
		bool IsEmpty();

		/****************** Remove ******************/
		/**** md5 signature: 310df33a7b799f6704691d7306814390 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove a plane. returns true if item has been found and removed.

Parameters
----------
theItem: Graphic3d_ClipPlane

Returns
-------
bool
") Remove;
		bool Remove(const opencascade::handle<Graphic3d_ClipPlane> & theItem);

		/****************** Remove ******************/
		/**** md5 signature: 67407ac4263b5ce4b1474bcb59790580 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove a plane.

Parameters
----------
theItem: Iterator

Returns
-------
None
") Remove;
		void Remove(Iterator theItem);

		/****************** SetOverrideGlobal ******************/
		/**** md5 signature: 53f2f55e405ecf8a104090892f86e38a ****/
		%feature("compactdefaultargs") SetOverrideGlobal;
		%feature("autodoc", "Setup flag defining if local properties should override global properties.

Parameters
----------
theToOverride: bool

Returns
-------
None
") SetOverrideGlobal;
		void SetOverrideGlobal(const Standard_Boolean theToOverride);

		/****************** Size ******************/
		/**** md5 signature: fe6e16e0f1e86558dd017c7384c76cd6 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return the number of items in sequence.

Returns
-------
int
") Size;
		Standard_Integer Size();

		/****************** ToOverrideGlobal ******************/
		/**** md5 signature: 1ecec5e4e17820cdf69ff2c94817a50e ****/
		%feature("compactdefaultargs") ToOverrideGlobal;
		%feature("autodoc", "Return true if local properties should override global properties.

Returns
-------
bool
") ToOverrideGlobal;
		Standard_Boolean ToOverrideGlobal();

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
		/**** md5 signature: ac60c401f73357877da49c7c5879e543 ****/
		%feature("compactdefaultargs") Graphic3d_ShaderAttribute;
		%feature("autodoc", "Creates new attribute.

Parameters
----------
theName: TCollection_AsciiString
theLocation: int

Returns
-------
None
") Graphic3d_ShaderAttribute;
		 Graphic3d_ShaderAttribute(const TCollection_AsciiString & theName, const int theLocation);

		/****************** Location ******************/
		/**** md5 signature: fbf2df819f76398dfe948e6957cd938c ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns attribute location to be bound on glsl program linkage stage.

Returns
-------
int
") Location;
		int Location();

		/****************** Name ******************/
		/**** md5 signature: efed61b92683387cd746fb27e0376505 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns name of shader variable.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

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
		/**** md5 signature: 0e4d93f61abfea2d28122dfc98e7db35 ****/
		%feature("compactdefaultargs") CreateFromFile;
		%feature("autodoc", "Creates new shader object from specified file.

Parameters
----------
theType: Graphic3d_TypeOfShaderObject
thePath: TCollection_AsciiString

Returns
-------
opencascade::handle<Graphic3d_ShaderObject>
") CreateFromFile;
		static opencascade::handle<Graphic3d_ShaderObject> CreateFromFile(const Graphic3d_TypeOfShaderObject theType, const TCollection_AsciiString & thePath);

		/****************** CreateFromSource ******************/
		/**** md5 signature: 89c8327f0382cb4ddac7df3854e7859f ****/
		%feature("compactdefaultargs") CreateFromSource;
		%feature("autodoc", "Creates new shader object from specified source.

Parameters
----------
theType: Graphic3d_TypeOfShaderObject
theSource: TCollection_AsciiString

Returns
-------
opencascade::handle<Graphic3d_ShaderObject>
") CreateFromSource;
		static opencascade::handle<Graphic3d_ShaderObject> CreateFromSource(const Graphic3d_TypeOfShaderObject theType, const TCollection_AsciiString & theSource);

		/****************** GetId ******************/
		/**** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Returns unique id used to manage resource in graphic driver.

Returns
-------
TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId();

		/****************** IsDone ******************/
		/**** md5 signature: 1dfe5875b8bc7f7b11380fb4ab8a9eb0 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Checks if the shader object is valid or not.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Path ******************/
		/**** md5 signature: 9d11d277fbcc37203e7dc39c30ea2e54 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns the full path to the shader source.

Returns
-------
OSD_Path
") Path;
		const OSD_Path & Path();

		/****************** Source ******************/
		/**** md5 signature: d9259fdeceadf330dfe57a7ddd24a1da ****/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Returns the source code of the shader object.

Returns
-------
TCollection_AsciiString
") Source;
		const TCollection_AsciiString & Source();

		/****************** Type ******************/
		/**** md5 signature: 89254e60d0dba2f7a980c3b9f0ba5aec ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns type of the shader object.

Returns
-------
Graphic3d_TypeOfShaderObject
") Type;
		Graphic3d_TypeOfShaderObject Type();

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
		/****************** Graphic3d_ShaderProgram ******************/
		/**** md5 signature: c9d506f6dd35044b3c228ea1da082f9b ****/
		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "Creates new empty program object.

Returns
-------
None
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram();

		/****************** AppendToHeader ******************/
		/**** md5 signature: ced78f90ca9cb4c305e39fbff11e02ab ****/
		%feature("compactdefaultargs") AppendToHeader;
		%feature("autodoc", "Append line to glsl header.

Parameters
----------
theHeaderLine: TCollection_AsciiString

Returns
-------
None
") AppendToHeader;
		void AppendToHeader(const TCollection_AsciiString & theHeaderLine);

		/****************** AttachShader ******************/
		/**** md5 signature: 2ed7a5ea2e4cd4e4595f652b67432170 ****/
		%feature("compactdefaultargs") AttachShader;
		%feature("autodoc", "Attaches shader object to the program object.

Parameters
----------
theShader: Graphic3d_ShaderObject

Returns
-------
bool
") AttachShader;
		Standard_Boolean AttachShader(const opencascade::handle<Graphic3d_ShaderObject> & theShader);

		/****************** ClearVariables ******************/
		/**** md5 signature: 1fb8537bc7c1634b6f48bef407b06bee ****/
		%feature("compactdefaultargs") ClearVariables;
		%feature("autodoc", "Removes all custom uniform variables from the program.

Returns
-------
None
") ClearVariables;
		void ClearVariables();

		/****************** DetachShader ******************/
		/**** md5 signature: 7cfa919e29e311aecd5f963d86cc4a27 ****/
		%feature("compactdefaultargs") DetachShader;
		%feature("autodoc", "Detaches shader object from the program object.

Parameters
----------
theShader: Graphic3d_ShaderObject

Returns
-------
bool
") DetachShader;
		Standard_Boolean DetachShader(const opencascade::handle<Graphic3d_ShaderObject> & theShader);

		/****************** GetId ******************/
		/**** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Returns unique id used to manage resource in graphic driver.

Returns
-------
TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId();

		/****************** HasAlphaTest ******************/
		/**** md5 signature: 6df3b76c7ea9b16d638eb1284b3c0848 ****/
		%feature("compactdefaultargs") HasAlphaTest;
		%feature("autodoc", "Return true if fragment shader should perform alpha test; false by default.

Returns
-------
bool
") HasAlphaTest;
		Standard_Boolean HasAlphaTest();

		/****************** HasDefaultSampler ******************/
		/**** md5 signature: 304ee6311b90029618e7e8295769f5ed ****/
		%feature("compactdefaultargs") HasDefaultSampler;
		%feature("autodoc", "Return true if standard program header should define default texture sampler occsampler0; true by default for compatibility.

Returns
-------
bool
") HasDefaultSampler;
		Standard_Boolean HasDefaultSampler();

		/****************** HasWeightOitOutput ******************/
		/**** md5 signature: d16c8b792adcba975b95fc1a659d670f ****/
		%feature("compactdefaultargs") HasWeightOitOutput;
		%feature("autodoc", "Return true if fragment shader color should output the weighted oit coverage; false by default.

Returns
-------
bool
") HasWeightOitOutput;
		Standard_Boolean HasWeightOitOutput();

		/****************** Header ******************/
		/**** md5 signature: f88fb6c2e88340b6cea1c010e1447033 ****/
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "Returns glsl header (version code and extensions).

Returns
-------
TCollection_AsciiString
") Header;
		const TCollection_AsciiString & Header();

		/****************** IsDone ******************/
		/**** md5 signature: 1dfe5875b8bc7f7b11380fb4ab8a9eb0 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Checks if the program object is valid or not.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** NbClipPlanesMax ******************/
		/**** md5 signature: e666dcb5a703f731f3fc4a8bf3e8ce5d ****/
		%feature("compactdefaultargs") NbClipPlanesMax;
		%feature("autodoc", "Return the length of array of clipping planes (the_max_clip_planes), to be used for initialization occclipplaneequations. default value is the_max_clip_planes_default.

Returns
-------
int
") NbClipPlanesMax;
		Standard_Integer NbClipPlanesMax();

		/****************** NbFragmentOutputs ******************/
		/**** md5 signature: b8a018cb9eedaa692aac7ce974057841 ****/
		%feature("compactdefaultargs") NbFragmentOutputs;
		%feature("autodoc", "Returns the number (1+) of fragment shader outputs to be written to (more than 1 can be in case of multiple draw buffers); 1 by default.

Returns
-------
int
") NbFragmentOutputs;
		Standard_Integer NbFragmentOutputs();

		/****************** NbLightsMax ******************/
		/**** md5 signature: c83e0182963cd9edab4c66afcb84e379 ****/
		%feature("compactdefaultargs") NbLightsMax;
		%feature("autodoc", "Return the length of array of light sources (the_max_lights), to be used for initialization occlightsources. default value is the_max_lights_default.

Returns
-------
int
") NbLightsMax;
		Standard_Integer NbLightsMax();

		/****************** PushVariableFloat ******************/
		/**** md5 signature: c7116542657a4d73523f19701b47cc97 ****/
		%feature("compactdefaultargs") PushVariableFloat;
		%feature("autodoc", "Pushes float uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: float

Returns
-------
bool
") PushVariableFloat;
		Standard_Boolean PushVariableFloat(const TCollection_AsciiString & theName, const float theValue);

		/****************** PushVariableInt ******************/
		/**** md5 signature: bff478b182d9509a10882ce90419df79 ****/
		%feature("compactdefaultargs") PushVariableInt;
		%feature("autodoc", "Pushes int uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: int

Returns
-------
bool
") PushVariableInt;
		Standard_Boolean PushVariableInt(const TCollection_AsciiString & theName, const int theValue);

		/****************** PushVariableVec2 ******************/
		/**** md5 signature: d02a003a9e11b722eacd37101ed0969b ****/
		%feature("compactdefaultargs") PushVariableVec2;
		%feature("autodoc", "Pushes vec2 uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: Graphic3d_Vec2

Returns
-------
bool
") PushVariableVec2;
		Standard_Boolean PushVariableVec2(const TCollection_AsciiString & theName, const Graphic3d_Vec2 & theValue);

		/****************** PushVariableVec2i ******************/
		/**** md5 signature: 231cdfeb088221c570d577a2e6af3ff2 ****/
		%feature("compactdefaultargs") PushVariableVec2i;
		%feature("autodoc", "Pushes vec2i uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: Graphic3d_Vec2i

Returns
-------
bool
") PushVariableVec2i;
		Standard_Boolean PushVariableVec2i(const TCollection_AsciiString & theName, const Graphic3d_Vec2i & theValue);

		/****************** PushVariableVec3 ******************/
		/**** md5 signature: 1e87fc6f4bed1bc59e32f075b299547f ****/
		%feature("compactdefaultargs") PushVariableVec3;
		%feature("autodoc", "Pushes vec3 uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: Graphic3d_Vec3

Returns
-------
bool
") PushVariableVec3;
		Standard_Boolean PushVariableVec3(const TCollection_AsciiString & theName, const Graphic3d_Vec3 & theValue);

		/****************** PushVariableVec3i ******************/
		/**** md5 signature: 76fcf0dab680077a9b9928f249715893 ****/
		%feature("compactdefaultargs") PushVariableVec3i;
		%feature("autodoc", "Pushes vec3i uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: Graphic3d_Vec3i

Returns
-------
bool
") PushVariableVec3i;
		Standard_Boolean PushVariableVec3i(const TCollection_AsciiString & theName, const Graphic3d_Vec3i & theValue);

		/****************** PushVariableVec4 ******************/
		/**** md5 signature: f48a6fd2b2fd4d2432e7e4555e958e8b ****/
		%feature("compactdefaultargs") PushVariableVec4;
		%feature("autodoc", "Pushes vec4 uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: Graphic3d_Vec4

Returns
-------
bool
") PushVariableVec4;
		Standard_Boolean PushVariableVec4(const TCollection_AsciiString & theName, const Graphic3d_Vec4 & theValue);

		/****************** PushVariableVec4i ******************/
		/**** md5 signature: 9cdd0cf7f8b36932596f084b1b32b4be ****/
		%feature("compactdefaultargs") PushVariableVec4i;
		%feature("autodoc", "Pushes vec4i uniform.

Parameters
----------
theName: TCollection_AsciiString
theValue: Graphic3d_Vec4i

Returns
-------
bool
") PushVariableVec4i;
		Standard_Boolean PushVariableVec4i(const TCollection_AsciiString & theName, const Graphic3d_Vec4i & theValue);

		/****************** SetAlphaTest ******************/
		/**** md5 signature: 0c8337e06f013097bf7fc3735dfd4764 ****/
		%feature("compactdefaultargs") SetAlphaTest;
		%feature("autodoc", "Set if fragment shader should perform alpha test. note that this flag is designed for usage with - custom shader program may discard fragment regardless this flag.

Parameters
----------
theAlphaTest: bool

Returns
-------
None
") SetAlphaTest;
		void SetAlphaTest(Standard_Boolean theAlphaTest);

		/****************** SetDefaultSampler ******************/
		/**** md5 signature: 6fabb1070d83a5e585d90a85b32e7260 ****/
		%feature("compactdefaultargs") SetDefaultSampler;
		%feature("autodoc", "Set if standard program header should define default texture sampler occsampler0.

Parameters
----------
theHasDefSampler: bool

Returns
-------
None
") SetDefaultSampler;
		void SetDefaultSampler(Standard_Boolean theHasDefSampler);

		/****************** SetHeader ******************/
		/**** md5 signature: 62f27581c0fcf7d3abe6ce528a7ab63d ****/
		%feature("compactdefaultargs") SetHeader;
		%feature("autodoc", "Setup glsl header containing language version code and used extensions. will be prepended to the very beginning of the source code. example: @code #version 300 es #extension gl_arb_bindless_texture : require @endcode.

Parameters
----------
theHeader: TCollection_AsciiString

Returns
-------
None
") SetHeader;
		void SetHeader(const TCollection_AsciiString & theHeader);

		/****************** SetId ******************/
		/**** md5 signature: 64840b5ae68646959ed97ec8254f3d04 ****/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "Sets unique id used to manage resource in graphic driver. warning! graphic3d_shaderprogram constructor generates a unique id for proper resource management; however if application overrides it, it is responsibility of application to avoid name collisions.

Parameters
----------
theId: TCollection_AsciiString

Returns
-------
None
") SetId;
		void SetId(const TCollection_AsciiString & theId);

		/****************** SetNbClipPlanesMax ******************/
		/**** md5 signature: 8f90ee3fa5faecc284bd831b0a828a6a ****/
		%feature("compactdefaultargs") SetNbClipPlanesMax;
		%feature("autodoc", "Specify the length of array of clipping planes (the_max_clip_planes).

Parameters
----------
theNbPlanes: int

Returns
-------
None
") SetNbClipPlanesMax;
		void SetNbClipPlanesMax(Standard_Integer theNbPlanes);

		/****************** SetNbFragmentOutputs ******************/
		/**** md5 signature: 72f045948c50b43bdddedbb592dcaa8c ****/
		%feature("compactdefaultargs") SetNbFragmentOutputs;
		%feature("autodoc", "Sets the number of fragment shader outputs to be written to. should be done before glsl program initialization.

Parameters
----------
theNbOutputs: int

Returns
-------
None
") SetNbFragmentOutputs;
		void SetNbFragmentOutputs(const Standard_Integer theNbOutputs);

		/****************** SetNbLightsMax ******************/
		/**** md5 signature: b18ad1a5a6f5d6962441de77b7b89768 ****/
		%feature("compactdefaultargs") SetNbLightsMax;
		%feature("autodoc", "Specify the length of array of light sources (the_max_lights).

Parameters
----------
theNbLights: int

Returns
-------
None
") SetNbLightsMax;
		void SetNbLightsMax(Standard_Integer theNbLights);

		/****************** SetVertexAttributes ******************/
		/**** md5 signature: d458b2610c968b561baf99376e731a61 ****/
		%feature("compactdefaultargs") SetVertexAttributes;
		%feature("autodoc", "Assign the list of custom vertex attributes. should be done before glsl program initialization.

Parameters
----------
theAttributes: Graphic3d_ShaderAttributeList

Returns
-------
None
") SetVertexAttributes;
		void SetVertexAttributes(const Graphic3d_ShaderAttributeList & theAttributes);

		/****************** SetWeightOitOutput ******************/
		/**** md5 signature: a8258c352f2b2a7a3855ac26a1d76d89 ****/
		%feature("compactdefaultargs") SetWeightOitOutput;
		%feature("autodoc", "Set if fragment shader color should output the weighted oit coverage. note that weighted oit also requires at least 2 fragment outputs (color + coverage).

Parameters
----------
theOutput: bool

Returns
-------
None
") SetWeightOitOutput;
		void SetWeightOitOutput(Standard_Boolean theOutput);

		/****************** ShaderObjects ******************/
		/**** md5 signature: 7e25b5a519ed39da5f0b6eccd62c6a47 ****/
		%feature("compactdefaultargs") ShaderObjects;
		%feature("autodoc", "Returns list of attached shader objects.

Returns
-------
Graphic3d_ShaderObjectList
") ShaderObjects;
		const Graphic3d_ShaderObjectList & ShaderObjects();

		/****************** ShadersFolder ******************/
		/**** md5 signature: f26477e080b56e162a878346206bf912 ****/
		%feature("compactdefaultargs") ShadersFolder;
		%feature("autodoc", "The path to glsl programs determined from csf_shadersdirectory or casroot environment variables. returns the root folder with default glsl programs.

Returns
-------
TCollection_AsciiString
") ShadersFolder;
		static const TCollection_AsciiString & ShadersFolder();

		/****************** Variables ******************/
		/**** md5 signature: 855892b48f0dfd5ecdd5470d0adadc38 ****/
		%feature("compactdefaultargs") Variables;
		%feature("autodoc", "The list of currently pushed but not applied custom uniform variables. this list is automatically cleared after applying to glsl program.

Returns
-------
Graphic3d_ShaderVariableList
") Variables;
		const Graphic3d_ShaderVariableList & Variables();

		/****************** VertexAttributes ******************/
		/**** md5 signature: 6825a17f79cf7bb099fb26f98bace75e ****/
		%feature("compactdefaultargs") VertexAttributes;
		%feature("autodoc", "Return the list of custom vertex attributes.

Returns
-------
Graphic3d_ShaderAttributeList
") VertexAttributes;
		const Graphic3d_ShaderAttributeList & VertexAttributes();

};


%make_alias(Graphic3d_ShaderProgram)

%extend Graphic3d_ShaderProgram {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def PushVariable(self):
		pass
	}
};

/*********************************
* class Graphic3d_ShaderVariable *
*********************************/
%nodefaultctor Graphic3d_ShaderVariable;
class Graphic3d_ShaderVariable : public Standard_Transient {
	public:
		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Checks if the shader variable is valid or not.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Name ******************/
		/**** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns name of shader variable.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** Value ******************/
		/**** md5 signature: b5672bd7d1d1e292ec75e023c5063098 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns interface of shader variable value.

Returns
-------
Graphic3d_ValueInterface *
") Value;
		Graphic3d_ValueInterface * Value();

};


%make_alias(Graphic3d_ShaderVariable)

%extend Graphic3d_ShaderVariable {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Create(self):
		pass
	}
};

/****************************
* class Graphic3d_Structure *
****************************/
class Graphic3d_Structure : public Standard_Transient {
	public:
		/****************** Graphic3d_Structure ******************/
		/**** md5 signature: d67667fa513f680c04d0cca3b0091e43 ****/
		%feature("compactdefaultargs") Graphic3d_Structure;
		%feature("autodoc", "Creates a graphic object in the manager themanager. it will appear in all the views of the visualiser. the structure is not displayed when it is created. @param themanager structure manager holding this structure @param thelinkprs another structure for creating a shadow (linked) structure.

Parameters
----------
theManager: Graphic3d_StructureManager
theLinkPrs: Graphic3d_Structure,optional
	default value is opencascade::handle<Graphic3d_Structure>()

Returns
-------
None
") Graphic3d_Structure;
		 Graphic3d_Structure(const opencascade::handle<Graphic3d_StructureManager> & theManager, const opencascade::handle<Graphic3d_Structure> & theLinkPrs = opencascade::handle<Graphic3d_Structure>());

		/****************** AcceptConnection ******************/
		/**** md5 signature: 848936d7e0d23ea065cf38de97257d2e ****/
		%feature("compactdefaultargs") AcceptConnection;
		%feature("autodoc", "Returns standard_true if the connection is possible between <astructure1> and <astructure2> without a creation of a cycle. //! it's not possible to call the method astructure1->connect (astructure2, typeofconnection) if - the set of all ancestors of <astructure1> contains <astructure1> and if the typeofconnection == toc_descendant - the set of all descendants of <astructure1> contains <astructure2> and if the typeofconnection == toc_ancestor.

Parameters
----------
theStructure1: Graphic3d_Structure *
theStructure2: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection

Returns
-------
bool
") AcceptConnection;
		static Standard_Boolean AcceptConnection(Graphic3d_Structure * theStructure1, Graphic3d_Structure * theStructure2, Graphic3d_TypeOfConnection theType);

		/****************** Ancestors ******************/
		/**** md5 signature: 30a119a49fca0145e6abee3237ebd871 ****/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "Returns the group of structures to which <self> is connected.

Parameters
----------
SG: Graphic3d_MapOfStructure

Returns
-------
None
") Ancestors;
		void Ancestors(Graphic3d_MapOfStructure & SG);

		/****************** CStructure ******************/
		/**** md5 signature: 8536306818e6758deef120ea5bed2397 ****/
		%feature("compactdefaultargs") CStructure;
		%feature("autodoc", "Returns the low-level structure.

Returns
-------
opencascade::handle<Graphic3d_CStructure>
") CStructure;
		const opencascade::handle<Graphic3d_CStructure> & CStructure();

		/****************** CalculateBoundBox ******************/
		/**** md5 signature: 3cd917a65fbfcb31c0e55116f05f4157 ****/
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "Computes axis-aligned bounding box of a structure.

Returns
-------
None
") CalculateBoundBox;
		virtual void CalculateBoundBox();

		/****************** Clear ******************/
		/**** md5 signature: af022295af7eee9ec42ff646aefc128f ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "If withdestruction == standard_true then suppress all the groups of primitives in the structure. and it is mandatory to create a new group in <self>. if withdestruction == standard_false then clears all the groups of primitives in the structure. and all the groups are conserved and empty. they will be erased at the next screen update. the structure itself is conserved. the transformation and the attributes of <self> are conserved. the childs of <self> are conserved.

Parameters
----------
WithDestruction: bool,optional
	default value is Standard_True

Returns
-------
None
") Clear;
		virtual void Clear(const Standard_Boolean WithDestruction = Standard_True);

		/****************** ClipPlanes ******************/
		/**** md5 signature: 26ab80085e76b6f03b64af6598080486 ****/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Get clip planes slicing the structure on rendering. returns set of clip planes.

Returns
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****************** Compute ******************/
		/**** md5 signature: 4dfc24dddeda03f1df06c9a5cb138df0 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** Compute ******************/
		/**** md5 signature: 74582eb5a20ade27250584d4ee1acbf1 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns the new structure defined for the new visualization.

Parameters
----------
theProjector: Graphic3d_DataStructureManager

Returns
-------
opencascade::handle<Graphic3d_Structure>
") Compute;
		virtual opencascade::handle<Graphic3d_Structure> Compute(const opencascade::handle<Graphic3d_DataStructureManager> & theProjector);

		/****************** Compute ******************/
		/**** md5 signature: 526735a43652a3f539a00ce0e74f6bdd ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns the new structure defined for the new visualization.

Parameters
----------
theProjector: Graphic3d_DataStructureManager
theTrsf: Geom_Transformation

Returns
-------
opencascade::handle<Graphic3d_Structure>
") Compute;
		virtual opencascade::handle<Graphic3d_Structure> Compute(const opencascade::handle<Graphic3d_DataStructureManager> & theProjector, const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** Compute ******************/
		/**** md5 signature: bad00881b3a42ee779bc435edec7182a ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns the new structure defined for the new visualization.

Parameters
----------
theProjector: Graphic3d_DataStructureManager
theStructure: Graphic3d_Structure

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Graphic3d_DataStructureManager> & theProjector, opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** Compute ******************/
		/**** md5 signature: f2735a31c040cd672dd8b6e31bab7c40 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Returns the new structure defined for the new visualization.

Parameters
----------
theProjector: Graphic3d_DataStructureManager
theTrsf: Geom_Transformation
theStructure: Graphic3d_Structure

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<Graphic3d_DataStructureManager> & theProjector, const opencascade::handle<Geom_Transformation> & theTrsf, opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** ComputeVisual ******************/
		/**** md5 signature: 751db0567d7c16c28d68a3f12ecf6a77 ****/
		%feature("compactdefaultargs") ComputeVisual;
		%feature("autodoc", "No available documentation.

Returns
-------
Graphic3d_TypeOfStructure
") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual();

		/****************** Connect ******************/
		/**** md5 signature: 2d740fb9596c625efc0e0120d3cf3b14 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "If atype is toc_descendant then add <astructure> as a child structure of <self>. if atype is toc_ancestor then add <astructure> as a parent structure of <self>. the connection propagates display, highlight, erase, remove, and stacks the transformations. no connection if the graph of the structures contains a cycle and <withcheck> is standard_true;.

Parameters
----------
theStructure: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection
theWithCheck: bool,optional
	default value is Standard_False

Returns
-------
None
") Connect;
		void Connect(Graphic3d_Structure * theStructure, Graphic3d_TypeOfConnection theType, Standard_Boolean theWithCheck = Standard_False);

		/****************** Connect ******************/
		/**** md5 signature: 9e0e0ae43d339f64ec839f31730c4cad ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrs: Graphic3d_Structure

Returns
-------
None
") Connect;
		void Connect(const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****************** ContainsFacet ******************/
		/**** md5 signature: c53b95b374faa3dd56807af9cbf654ce ****/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "Returns standard_true if the structure <self> contains polygons, triangles or quadrangles.

Returns
-------
bool
") ContainsFacet;
		Standard_Boolean ContainsFacet();

		/****************** CurrentGroup ******************/
		/**** md5 signature: dc1f0b5eea98b580e880b9e6c8061d8f ****/
		%feature("compactdefaultargs") CurrentGroup;
		%feature("autodoc", "Returns the last created group or creates new one if list is empty.

Returns
-------
opencascade::handle<Graphic3d_Group>
") CurrentGroup;
		opencascade::handle<Graphic3d_Group> CurrentGroup();

		/****************** Descendants ******************/
		/**** md5 signature: 6868f845687fc9b9352d8ad58268d070 ****/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "Returns the group of structures connected to <self>.

Parameters
----------
SG: Graphic3d_MapOfStructure

Returns
-------
None
") Descendants;
		void Descendants(Graphic3d_MapOfStructure & SG);

		/****************** Disconnect ******************/
		/**** md5 signature: f16e2a64d5f4c2c9802fe7e384632817 ****/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "Suppress the connection between <astructure> and <self>.

Parameters
----------
theStructure: Graphic3d_Structure *

Returns
-------
None
") Disconnect;
		void Disconnect(Graphic3d_Structure * theStructure);

		/****************** DisconnectAll ******************/
		/**** md5 signature: 2c9ce51fe44c5f626279c3983bae6668 ****/
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "If atype is toc_descendant then suppress all the connections with the child structures of <self>. if atype is toc_ancestor then suppress all the connections with the parent structures of <self>.

Parameters
----------
AType: Graphic3d_TypeOfConnection

Returns
-------
None
") DisconnectAll;
		void DisconnectAll(const Graphic3d_TypeOfConnection AType);

		/****************** Display ******************/
		/**** md5 signature: 3c4cca883a8ef6cb513945de5fd9c904 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Displays the structure <self> in all the views of the visualiser.

Returns
-------
None
") Display;
		virtual void Display();

		/****************** DisplayPriority ******************/
		/**** md5 signature: c4fc85a901582e4dbb710c18c17c717d ****/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "Returns the current display priority for this structure.

Returns
-------
int
") DisplayPriority;
		Standard_Integer DisplayPriority();

		/****************** Erase ******************/
		/**** md5 signature: 6b8959c3f27bc8bb25573acddfac71b2 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erases the structure <self> in all the views of the visualiser.

Returns
-------
None
") Erase;
		virtual void Erase();

		/****************** GetZLayer ******************/
		/**** md5 signature: 9e218901096cdecec418e74ac6fe9f8e ****/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "Get z layer id of displayed structure. the method returns -1 if the structure has no id (deleted from graphic driver).

Returns
-------
Graphic3d_ZLayerId
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer();

		/****************** GraphicClear ******************/
		/**** md5 signature: f3e59f6688be1e05f2d68ebbb6dd0a49 ****/
		%feature("compactdefaultargs") GraphicClear;
		%feature("autodoc", "Clears the structure <self>.

Parameters
----------
WithDestruction: bool

Returns
-------
None
") GraphicClear;
		void GraphicClear(const Standard_Boolean WithDestruction);

		/****************** GraphicConnect ******************/
		/**** md5 signature: 25414aa036ce4f9c880fca991929e226 ****/
		%feature("compactdefaultargs") GraphicConnect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDaughter: Graphic3d_Structure

Returns
-------
None
") GraphicConnect;
		void GraphicConnect(const opencascade::handle<Graphic3d_Structure> & theDaughter);

		/****************** GraphicDisconnect ******************/
		/**** md5 signature: de24d017a05f43bfaaaa80e642a46101 ****/
		%feature("compactdefaultargs") GraphicDisconnect;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDaughter: Graphic3d_Structure

Returns
-------
None
") GraphicDisconnect;
		void GraphicDisconnect(const opencascade::handle<Graphic3d_Structure> & theDaughter);

		/****************** GraphicTransform ******************/
		/**** md5 signature: 02cc95848ba581f59582e8e022566a0d ****/
		%feature("compactdefaultargs") GraphicTransform;
		%feature("autodoc", "Internal method which sets new transformation without calling graphic manager callbacks.

Parameters
----------
theTrsf: Geom_Transformation

Returns
-------
None
") GraphicTransform;
		void GraphicTransform(const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** Groups ******************/
		/**** md5 signature: d58f58de9bde8c9bb93737989f881ace ****/
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "Returns the groups sequence included in this structure.

Returns
-------
Graphic3d_SequenceOfGroup
") Groups;
		const Graphic3d_SequenceOfGroup & Groups();

		/****************** HLRValidation ******************/
		/**** md5 signature: 7c948b7a593b11d1648ac6560e4fcd4e ****/
		%feature("compactdefaultargs") HLRValidation;
		%feature("autodoc", "Hidden parts stored in this structure are valid if: 1) the owner is defined. 2) they are not invalid.

Returns
-------
bool
") HLRValidation;
		Standard_Boolean HLRValidation();

		/****************** Highlight ******************/
		/**** md5 signature: 2f79c6807b996e997028f88c66547141 ****/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "Highlights the structure in all the views with the given style @param thestyle [in] the style (type of highlighting: box/color, color and opacity) @param thetoupdatemgr [in] defines whether related computed structures will be highlighted via structure manager or not.

Parameters
----------
theStyle: Graphic3d_PresentationAttributes
theToUpdateMgr: bool,optional
	default value is Standard_True

Returns
-------
None
") Highlight;
		void Highlight(const opencascade::handle<Graphic3d_PresentationAttributes> & theStyle, const Standard_Boolean theToUpdateMgr = Standard_True);

		/****************** HighlightStyle ******************/
		/**** md5 signature: 8178b69ba5e9aec0fad5df24b6a36d07 ****/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Returns the highlight attributes.

Returns
-------
opencascade::handle<Graphic3d_PresentationAttributes>
") HighlightStyle;
		const opencascade::handle<Graphic3d_PresentationAttributes> & HighlightStyle();

		/****************** Identification ******************/
		/**** md5 signature: f18c91e46c1b20a4777abd8f80b5550f ****/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Returns the identification number of this structure.

Returns
-------
int
") Identification;
		Standard_Integer Identification();

		/****************** IsDeleted ******************/
		/**** md5 signature: f30d8bbdb3983c8c28e79a704fa27920 ****/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Returns true if this structure is deleted (after remove() call).

Returns
-------
bool
") IsDeleted;
		Standard_Boolean IsDeleted();

		/****************** IsDisplayed ******************/
		/**** md5 signature: 9ecbb5540141c9e9732c9946cab3de18 ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Returns the display indicator for this structure.

Returns
-------
bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns standard_true if the structure <self> is empty. warning: a structure is empty if : it do not have group or all the groups are empties and it do not have descendant or all the descendants are empties.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** IsHighlighted ******************/
		/**** md5 signature: 583f6ffd53a2d75ad144ad1c1fb800bb ****/
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "Returns the highlight indicator for this structure.

Returns
-------
bool
") IsHighlighted;
		virtual Standard_Boolean IsHighlighted();

		/****************** IsInfinite ******************/
		/**** md5 signature: 7633661c322c89b950f649430bd827bf ****/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Returns standard_true if the structure <self> is infinite.

Returns
-------
bool
") IsInfinite;
		Standard_Boolean IsInfinite();

		/****************** IsMutable ******************/
		/**** md5 signature: 3ee3916ef3d39d63be5557b524ac1b86 ****/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Returns true if structure has mutable nature (content or location are be changed regularly). mutable structure will be managed in different way than static onces.

Returns
-------
bool
") IsMutable;
		Standard_Boolean IsMutable();

		/****************** IsTransformed ******************/
		/**** md5 signature: 9b72ea9014a7f74b75411f3cb15d5e01 ****/
		%feature("compactdefaultargs") IsTransformed;
		%feature("autodoc", "Returns true if the structure is transformed.

Returns
-------
bool
") IsTransformed;
		Standard_Boolean IsTransformed();

		/****************** IsVisible ******************/
		/**** md5 signature: d2de178c6bd2985a6f06b17107c0b3e4 ****/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Returns the visibility indicator for this structure.

Returns
-------
bool
") IsVisible;
		Standard_Boolean IsVisible();

		/****************** MinMaxValues ******************/
		/**** md5 signature: 8cca1ef5f121ffd0d02be51223cb1475 ****/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "Returns the coordinates of the boundary box of the structure <self>. if <thetoignoreinfiniteflag> is true, the method returns actual graphical boundaries of the graphic3d_group components. otherwise, the method returns boundaries taking into account infinite state of the structure. this approach generally used for application specific fit operation (e.g. fitting the model into screen, not taking into accout infinite helper elements). warning: if the structure <self> is empty then the empty box is returned, if the structure <self> is infinite then the whole box is returned.

Parameters
----------
theToIgnoreInfiniteFlag: bool,optional
	default value is Standard_False

Returns
-------
Bnd_Box
") MinMaxValues;
		Bnd_Box MinMaxValues(const Standard_Boolean theToIgnoreInfiniteFlag = Standard_False);

		/****************** Network ******************/
		/**** md5 signature: 1f04794fd49a26ab24b1976d3d47fc2a ****/
		%feature("compactdefaultargs") Network;
		%feature("autodoc", "Returns <aset> the group of structures : - directly or indirectly connected to <astructure> if the typeofconnection == toc_descendant - to which <astructure> is directly or indirectly connected if the typeofconnection == toc_ancestor.

Parameters
----------
theStructure: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection
theSet: NCollection_Map<Graphic3d_Structure *>

Returns
-------
None
") Network;
		static void Network(Graphic3d_Structure * theStructure, const Graphic3d_TypeOfConnection theType, NCollection_Map<Graphic3d_Structure *> & theSet);

		/****************** NewGroup ******************/
		/**** md5 signature: 2179c9c42459d394fb9020a6a6dec876 ****/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "Append new group to this structure.

Returns
-------
opencascade::handle<Graphic3d_Group>
") NewGroup;
		opencascade::handle<Graphic3d_Group> NewGroup();

		/****************** NumberOfGroups ******************/
		/**** md5 signature: e843bea55577f651361f78ab56ad5e34 ****/
		%feature("compactdefaultargs") NumberOfGroups;
		%feature("autodoc", "Returns the current number of groups in this structure.

Returns
-------
int
") NumberOfGroups;
		Standard_Integer NumberOfGroups();

		/****************** Owner ******************/
		/**** md5 signature: ba418fdbece313ec9cc73895f3a761a0 ****/
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_Address
") Owner;
		Standard_Address Owner();

		/****************** PrintNetwork ******************/
		/**** md5 signature: f1e583afd3eefb370d3f45b8d7cc688e ****/
		%feature("compactdefaultargs") PrintNetwork;
		%feature("autodoc", "Prints informations about the network associated with the structure <astructure>.

Parameters
----------
AStructure: Graphic3d_Structure
AType: Graphic3d_TypeOfConnection

Returns
-------
None
") PrintNetwork;
		static void PrintNetwork(const opencascade::handle<Graphic3d_Structure> & AStructure, const Graphic3d_TypeOfConnection AType);

		/****************** ReCompute ******************/
		/**** md5 signature: 6619326e603ccdb36e9cfecd2b36ae53 ****/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "Forces a new construction of the structure <self> if <self> is displayed and tos_computed.

Returns
-------
None
") ReCompute;
		void ReCompute();

		/****************** ReCompute ******************/
		/**** md5 signature: 546d2e35de2d763b0501620176659a8b ****/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "Forces a new construction of the structure <self> if <self> is displayed in <aprojetor> and tos_computed.

Parameters
----------
aProjector: Graphic3d_DataStructureManager

Returns
-------
None
") ReCompute;
		void ReCompute(const opencascade::handle<Graphic3d_DataStructureManager> & aProjector);

		/****************** Remove ******************/
		/**** md5 signature: 0346504d7ac570fc8960fb72d5ad5f20 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Suppress the structure <self>. it will be erased at the next screen update. warning: no more graphic operations in <self> after this call. category: methods to modify the class definition.

Returns
-------
None
") Remove;
		void Remove();

		/****************** Remove ******************/
		/**** md5 signature: 91b66b071a3ae47ea82fbf40dc4f2290 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrs: Graphic3d_Structure

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****************** Remove ******************/
		/**** md5 signature: 090f833049a2c27ad3b00f3de10a2737 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Suppress the structure in the list of descendants or in the list of ancestors.

Parameters
----------
thePtr: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection

Returns
-------
None
") Remove;
		void Remove(Graphic3d_Structure * thePtr, const Graphic3d_TypeOfConnection theType);

		/****************** RemoveAll ******************/
		/**** md5 signature: 21d367538c35ee0fd687e7543534de8e ****/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") RemoveAll;
		void RemoveAll();

		/****************** ResetDisplayPriority ******************/
		/**** md5 signature: 7e9a6fef73d14b5bf0e50b4d1a74fe4f ****/
		%feature("compactdefaultargs") ResetDisplayPriority;
		%feature("autodoc", "Reset the current priority of the structure to the previous priority. category: methods to modify the class definition warning: if <self> is displayed then the setdisplaypriority method erase <self> and display <self> with the previous priority.

Returns
-------
None
") ResetDisplayPriority;
		void ResetDisplayPriority();

		/****************** SetClipPlanes ******************/
		/**** md5 signature: e4333b4a8793a61136630719405f0b4b ****/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "Changes a sequence of clip planes slicing the structure on rendering. @param theplanes [in] the set of clip planes.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetClipPlanes;
		void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetComputeVisual ******************/
		/**** md5 signature: f3be360944707961d7edf642114e6153 ****/
		%feature("compactdefaultargs") SetComputeVisual;
		%feature("autodoc", "No available documentation.

Parameters
----------
theVisual: Graphic3d_TypeOfStructure

Returns
-------
None
") SetComputeVisual;
		void SetComputeVisual(const Graphic3d_TypeOfStructure theVisual);

		/****************** SetDisplayPriority ******************/
		/**** md5 signature: 7dec56e9d352d17186e909dc3a62fe0b ****/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "Modifies the order of displaying the structure. values are between 0 and 10. structures are drawn according to their display priorities in ascending order. a structure of priority 10 is displayed the last and appears over the others. the default value is 5. category: methods to modify the class definition warning: if <self> is displayed then the setdisplaypriority method erase <self> and display <self> with the new priority. raises prioritydefinitionerror if <priority> is greater than 10 or a negative value.

Parameters
----------
Priority: int

Returns
-------
None
") SetDisplayPriority;
		void SetDisplayPriority(const Standard_Integer Priority);

		/****************** SetHLRValidation ******************/
		/**** md5 signature: 6a04c1b7f9ddd201cd2765dc7cdbe2db ****/
		%feature("compactdefaultargs") SetHLRValidation;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetHLRValidation;
		void SetHLRValidation(const Standard_Boolean theFlag);

		/****************** SetInfiniteState ******************/
		/**** md5 signature: 9f4cff7414f5b0e15c20bad197a89a41 ****/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "Sets infinite flag. when true, the minmaxvalues method returns: thexmin = theymin = thezmin = realfirst(). thexmax = theymax = thezmax = reallast(). by default, structure is created not infinite but empty.

Parameters
----------
theToSet: bool

Returns
-------
None
") SetInfiniteState;
		void SetInfiniteState(const Standard_Boolean theToSet);

		/****************** SetIsForHighlight ******************/
		/**** md5 signature: e31d652958b3a66e22fec5a3cb5a2bdd ****/
		%feature("compactdefaultargs") SetIsForHighlight;
		%feature("autodoc", "Marks the structure <self> representing wired structure needed for highlight only so it won't be added to bvh tree.

Parameters
----------
isForHighlight: bool

Returns
-------
None
") SetIsForHighlight;
		void SetIsForHighlight(const Standard_Boolean isForHighlight);

		/****************** SetMutable ******************/
		/**** md5 signature: 7064c07aba56b6576bc333ebc76ce783 ****/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "Sets if the structure location has mutable nature (content or location will be changed regularly).

Parameters
----------
theIsMutable: bool

Returns
-------
None
") SetMutable;
		void SetMutable(const Standard_Boolean theIsMutable);

		/****************** SetOwner ******************/
		/**** md5 signature: 91cb9cd7e90ba624db681c064887fc16 ****/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOwner: Standard_Address

Returns
-------
None
") SetOwner;
		void SetOwner(const Standard_Address theOwner);

		/****************** SetTransformPersistence ******************/
		/**** md5 signature: 58f8832cbff26a7b2b30abc76e733511 ****/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Modifies the current transform persistence (pan, zoom or rotate).

Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Returns
-------
None
") SetTransformPersistence;
		void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformation ******************/
		/**** md5 signature: 3a8ab22770ca7d38630a59937571160c ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Modifies the current local transformation.

Parameters
----------
theTrsf: Geom_Transformation

Returns
-------
None
") SetTransformation;
		void SetTransformation(const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** SetVisible ******************/
		/**** md5 signature: f4dcdbb4f4eb850359a072447385fecf ****/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "Modifies the visibility indicator to standard_true or standard_false for the structure <self>. the default value at the definition of <self> is standard_true.

Parameters
----------
AValue: bool

Returns
-------
None
") SetVisible;
		void SetVisible(const Standard_Boolean AValue);

		/****************** SetVisual ******************/
		/**** md5 signature: a541b1b8c8f18e85eee24ee866323f66 ****/
		%feature("compactdefaultargs") SetVisual;
		%feature("autodoc", "Modifies the visualisation mode for the structure <self>.

Parameters
----------
AVisual: Graphic3d_TypeOfStructure

Returns
-------
None
") SetVisual;
		virtual void SetVisual(const Graphic3d_TypeOfStructure AVisual);

		/****************** SetZLayer ******************/
		/**** md5 signature: 1234e282b3516163b291390663f2b62b ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id for the structure. the z layer mechanism allows to display structures presented in higher layers in overlay of structures in lower layers by switching off z buffer depth test between layers.

Parameters
----------
theLayerId: int

Returns
-------
None
") SetZLayer;
		void SetZLayer(int theLayerId);

		/****************** SetZoomLimit ******************/
		/**** md5 signature: b82384debbefbfbcf6ed40f4e3fc08fd ****/
		%feature("compactdefaultargs") SetZoomLimit;
		%feature("autodoc", "Modifies the minimum and maximum zoom coefficients for the structure <self>. the default value at the definition of <self> is unlimited. category: methods to modify the class definition warning: raises structuredefinitionerror if <limitinf> is greater than <limitsup> or if <limitinf> or <limitsup> is a negative value.

Parameters
----------
LimitInf: float
LimitSup: float

Returns
-------
None
") SetZoomLimit;
		void SetZoomLimit(const Standard_Real LimitInf, const Standard_Real LimitSup);

		/****************** Transform ******************/
		/**** md5 signature: 42e040133aad20d309c47d50a276cded ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTrsf: Geom_Transformation

Returns
-------
None
") Transform;
		void Transform(const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** TransformPersistence ******************/
		/**** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ****/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Returns transform persistence of the presentable object.

Returns
-------
opencascade::handle<Graphic3d_TransformPers>
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****************** Transformation ******************/
		/**** md5 signature: 11ffe13bd65c76d8962d14d3b1eb956a ****/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return local transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") Transformation;
		const opencascade::handle<Geom_Transformation> & Transformation();

		/****************** Transforms ******************/
		/**** md5 signature: 41f8190738fa3a976ef45fd1ae2cefe0 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Transforms thex, they, thez with the transformation thetrsf.

Parameters
----------
theTrsf: gp_Trsf
theX: float
theY: float
theZ: float

Returns
-------
theNewX: float
theNewY: float
theNewZ: float
") Transforms;
		static void Transforms(const gp_Trsf & theTrsf, const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UnHighlight ******************/
		/**** md5 signature: 39ce43ce3b46f356efde8e354316b376 ****/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "Suppresses the highlight for the structure <self> in all the views of the visualiser.

Returns
-------
None
") UnHighlight;
		void UnHighlight();

		/****************** Visual ******************/
		/**** md5 signature: db220160db9236600897688cadcd5ce7 ****/
		%feature("compactdefaultargs") Visual;
		%feature("autodoc", "Returns the visualisation mode for the structure <self>.

Returns
-------
Graphic3d_TypeOfStructure
") Visual;
		Graphic3d_TypeOfStructure Visual();

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
		/****************** Graphic3d_StructureManager ******************/
		/**** md5 signature: bf06c4f7a4fd2e5e28e43056a4a6b6d3 ****/
		%feature("compactdefaultargs") Graphic3d_StructureManager;
		%feature("autodoc", "Initializes the viewmanager. currently creating of more than 100 viewer instances is not supported and leads to initializationerror and initialization failure. this limitation might be addressed in some future occt releases. warning: raises initialisationerror if the initialization of the viewmanager failed.

Parameters
----------
theDriver: Graphic3d_GraphicDriver

Returns
-------
None
") Graphic3d_StructureManager;
		 Graphic3d_StructureManager(const opencascade::handle<Graphic3d_GraphicDriver> & theDriver);

		/****************** ChangeDisplayPriority ******************/
		/**** md5 signature: 93b1acf46f0a454b2eb008a179eb462e ****/
		%feature("compactdefaultargs") ChangeDisplayPriority;
		%feature("autodoc", "Changes the display priority of the structure <astructure>.

Parameters
----------
theStructure: Graphic3d_Structure
theOldPriority: int
theNewPriority: int

Returns
-------
None
") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority(const opencascade::handle<Graphic3d_Structure> & theStructure, const Standard_Integer theOldPriority, const Standard_Integer theNewPriority);

		/****************** ChangeZLayer ******************/
		/**** md5 signature: d68c801a4cace524cd37e40b6911217d ****/
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "Change z layer for structure. the z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

Parameters
----------
theStructure: Graphic3d_Structure
theLayerId: int

Returns
-------
None
") ChangeZLayer;
		virtual void ChangeZLayer(const opencascade::handle<Graphic3d_Structure> & theStructure, int theLayerId);

		/****************** Clear ******************/
		/**** md5 signature: bc3243fa7b973482ba302c258c16ea88 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the structure.

Parameters
----------
theStructure: Graphic3d_Structure *
theWithDestruction: bool

Returns
-------
None
") Clear;
		virtual void Clear(Graphic3d_Structure * theStructure, const Standard_Boolean theWithDestruction);

		/****************** Connect ******************/
		/**** md5 signature: 9b16e71d7a09bd5e9e14f2b36df2da35 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "Connects the structures.

Parameters
----------
theMother: Graphic3d_Structure *
theDaughter: Graphic3d_Structure *

Returns
-------
None
") Connect;
		virtual void Connect(const Graphic3d_Structure * theMother, const Graphic3d_Structure * theDaughter);

		/****************** DefinedViews ******************/
		/**** md5 signature: d5e8d85b2dd4e7bed7107e0d9b8eadc4 ****/
		%feature("compactdefaultargs") DefinedViews;
		%feature("autodoc", "Returns the group of views defined in the structure manager.

Returns
-------
Graphic3d_IndexedMapOfView
") DefinedViews;
		const Graphic3d_IndexedMapOfView & DefinedViews();

		/****************** Disconnect ******************/
		/**** md5 signature: 3ba10497297476c17744bdf68bcf5062 ****/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "Disconnects the structures.

Parameters
----------
theMother: Graphic3d_Structure *
theDaughter: Graphic3d_Structure *

Returns
-------
None
") Disconnect;
		virtual void Disconnect(const Graphic3d_Structure * theMother, const Graphic3d_Structure * theDaughter);

		/****************** Display ******************/
		/**** md5 signature: 0a0ff1e10f8ac4b3e756504382415923 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Display the structure.

Parameters
----------
theStructure: Graphic3d_Structure

Returns
-------
None
") Display;
		virtual void Display(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** DisplayedStructures ******************/
		/**** md5 signature: 4e1b7e53694d843df9afca99b1dae04f ****/
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "Returns the set of structures displayed in visualiser <self>.

Parameters
----------
SG: Graphic3d_MapOfStructure

Returns
-------
None
") DisplayedStructures;
		void DisplayedStructures(Graphic3d_MapOfStructure & SG);

		/****************** Erase ******************/
		/**** md5 signature: 6b8959c3f27bc8bb25573acddfac71b2 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erases all the structures.

Returns
-------
None
") Erase;
		virtual void Erase();

		/****************** Erase ******************/
		/**** md5 signature: 33fbe9ece3c4395e53fad2a8c75ab2e3 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erases the structure.

Parameters
----------
theStructure: Graphic3d_Structure

Returns
-------
None
") Erase;
		virtual void Erase(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** GraphicDriver ******************/
		/**** md5 signature: 5e26d54a69268bb1bfaed21ac554840d ****/
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "Returns the graphic driver of <self>.

Returns
-------
opencascade::handle<Graphic3d_GraphicDriver>
") GraphicDriver;
		const opencascade::handle<Graphic3d_GraphicDriver> & GraphicDriver();

		/****************** Highlight ******************/
		/**** md5 signature: 9252511647a737dcb6a04cd2d948f231 ****/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "Highlights the structure.

Parameters
----------
theStructure: Graphic3d_Structure

Returns
-------
None
") Highlight;
		virtual void Highlight(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** HighlightedStructures ******************/
		/**** md5 signature: e69502508e647c45fb75408c49495c8a ****/
		%feature("compactdefaultargs") HighlightedStructures;
		%feature("autodoc", "Returns the set of highlighted structures in a visualiser <self>.

Parameters
----------
SG: Graphic3d_MapOfStructure

Returns
-------
None
") HighlightedStructures;
		void HighlightedStructures(Graphic3d_MapOfStructure & SG);

		/****************** Identification ******************/
		/**** md5 signature: 52f1107b9de1f2ac6d8015fc932be4e8 ****/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Attaches the view to this structure manager and sets its identification number within the manager.

Parameters
----------
theView: Graphic3d_CView *

Returns
-------
int
") Identification;
		Standard_Integer Identification(Graphic3d_CView * theView);

		/****************** Identification ******************/
		/**** md5 signature: a53224867a430811054a9ea29719306c ****/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Returns the structure with the identification number <aid>.

Parameters
----------
AId: int

Returns
-------
opencascade::handle<Graphic3d_Structure>
") Identification;
		virtual opencascade::handle<Graphic3d_Structure> Identification(const Standard_Integer AId);

		/****************** IsDeviceLost ******************/
		/**** md5 signature: 0b1111f6d6e5892ffaaa28f2317aba65 ****/
		%feature("compactdefaultargs") IsDeviceLost;
		%feature("autodoc", "Returns true if device lost flag has been set and presentation data should be reuploaded onto graphics driver.

Returns
-------
bool
") IsDeviceLost;
		Standard_Boolean IsDeviceLost();

		/****************** MaxNumOfViews ******************/
		/**** md5 signature: e14f2fbfa5bce9b7d36aae6946806247 ****/
		%feature("compactdefaultargs") MaxNumOfViews;
		%feature("autodoc", "Returns the theoretical maximum number of definable views in the manager. warning: it's not possible to accept an infinite number of definable views because each view must have an identification and we have different managers.

Returns
-------
int
") MaxNumOfViews;
		Standard_Integer MaxNumOfViews();

		/****************** ObjectAffinity ******************/
		/**** md5 signature: 407c06527737d1bd4096020ddd3ccd09 ****/
		%feature("compactdefaultargs") ObjectAffinity;
		%feature("autodoc", "No available documentation.

Parameters
----------
theObject: Standard_Transient

Returns
-------
opencascade::handle<Graphic3d_ViewAffinity>
") ObjectAffinity;
		opencascade::handle<Graphic3d_ViewAffinity> ObjectAffinity(const opencascade::handle<Standard_Transient> & theObject);

		/****************** ReCompute ******************/
		/**** md5 signature: 616a39795d0668f6d0f2c39a483d0904 ****/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "Forces a new construction of the structure. if <thestructure> is displayed and tos_computed.

Parameters
----------
theStructure: Graphic3d_Structure

Returns
-------
None
") ReCompute;
		virtual void ReCompute(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** ReCompute ******************/
		/**** md5 signature: 83bb72430a81d8098709d68b51aa6597 ****/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "Forces a new construction of the structure. if <thestructure> is displayed in <theprojector> and tos_computed.

Parameters
----------
theStructure: Graphic3d_Structure
theProjector: Graphic3d_DataStructureManager

Returns
-------
None
") ReCompute;
		virtual void ReCompute(const opencascade::handle<Graphic3d_Structure> & theStructure, const opencascade::handle<Graphic3d_DataStructureManager> & theProjector);

		/****************** RecomputeStructures ******************/
		/**** md5 signature: a39bdc19ae8e5c57049d7855f816f653 ****/
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "Recomputes all structures in the manager. resets device lost flag.

Returns
-------
None
") RecomputeStructures;
		void RecomputeStructures();

		/****************** RecomputeStructures ******************/
		/**** md5 signature: 23f732c9b4599ff2d3ab40d5d84e000f ****/
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "Recomputes all structures from thestructures.

Parameters
----------
theStructures: NCollection_Map<Graphic3d_Structure *>

Returns
-------
None
") RecomputeStructures;
		void RecomputeStructures(const NCollection_Map<Graphic3d_Structure *> & theStructures);

		/****************** RegisterObject ******************/
		/**** md5 signature: 356445b1cad67ece66300fd0b81904b3 ****/
		%feature("compactdefaultargs") RegisterObject;
		%feature("autodoc", "No available documentation.

Parameters
----------
theObject: Standard_Transient

Returns
-------
opencascade::handle<Graphic3d_ViewAffinity>
") RegisterObject;
		opencascade::handle<Graphic3d_ViewAffinity> RegisterObject(const opencascade::handle<Standard_Transient> & theObject);

		/****************** Remove ******************/
		/**** md5 signature: 57a23cda69c531e8d176ae30ce8f77c6 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Deletes and erases the 3d structure manager.

Returns
-------
None
") Remove;
		virtual void Remove();

		/****************** SetDeviceLost ******************/
		/**** md5 signature: 9920384e372fd3747be47d84dd393cc9 ****/
		%feature("compactdefaultargs") SetDeviceLost;
		%feature("autodoc", "Sets device lost flag.

Returns
-------
None
") SetDeviceLost;
		void SetDeviceLost();

		/****************** SetTransform ******************/
		/**** md5 signature: 48f618389233acf1e1fdca371ff757f5 ****/
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "Transforms the structure.

Parameters
----------
theStructure: Graphic3d_Structure
theTrsf: Geom_Transformation

Returns
-------
None
") SetTransform;
		virtual void SetTransform(const opencascade::handle<Graphic3d_Structure> & theStructure, const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** UnHighlight ******************/
		/**** md5 signature: e841c00d90be06504c3125a91194b8d4 ****/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "Suppress the highlighting on the structure <astructure>.

Parameters
----------
AStructure: Graphic3d_Structure

Returns
-------
None
") UnHighlight;
		virtual void UnHighlight(const opencascade::handle<Graphic3d_Structure> & AStructure);

		/****************** UnHighlight ******************/
		/**** md5 signature: 019aca52f7d908cf9e1b3c79e24f8902 ****/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "Suppresses the highlighting on all the structures in <self>.

Returns
-------
None
") UnHighlight;
		virtual void UnHighlight();

		/****************** UnIdentification ******************/
		/**** md5 signature: 2c03450c9a17c6e28a5a2d56dcb8592e ****/
		%feature("compactdefaultargs") UnIdentification;
		%feature("autodoc", "Detach the view from this structure manager and release its identification.

Parameters
----------
theView: Graphic3d_CView *

Returns
-------
None
") UnIdentification;
		void UnIdentification(Graphic3d_CView * theView);

		/****************** UnregisterObject ******************/
		/**** md5 signature: f51c6ce76ba73a05d8e97a2b939c5d3f ****/
		%feature("compactdefaultargs") UnregisterObject;
		%feature("autodoc", "No available documentation.

Parameters
----------
theObject: Standard_Transient

Returns
-------
None
") UnregisterObject;
		void UnregisterObject(const opencascade::handle<Standard_Transient> & theObject);

		/****************** Update ******************/
		/**** md5 signature: acf4c29ded22955e1c1cc7a6b217934b ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Invalidates bounding box of specified zlayerid.

Parameters
----------
theLayerId: int,optional
	default value is Graphic3d_ZLayerId_UNKNOWN

Returns
-------
None
") Update;
		virtual void Update(int theLayerId = Graphic3d_ZLayerId_UNKNOWN);

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
		/**** md5 signature: 6012ed3dffaa1a4255c544b39bea25dd ****/
		%feature("compactdefaultargs") Graphic3d_Text;
		%feature("autodoc", "Creates default text parameters.

Parameters
----------
theHeight: Standard_ShortReal

Returns
-------
None
") Graphic3d_Text;
		 Graphic3d_Text(const Standard_ShortReal theHeight);

		/****************** HasOwnAnchorPoint ******************/
		/**** md5 signature: e37194a0a04c6cfedb999cfbbcc9f46f ****/
		%feature("compactdefaultargs") HasOwnAnchorPoint;
		%feature("autodoc", "Returns true if the text has an anchor point.

Returns
-------
bool
") HasOwnAnchorPoint;
		Standard_Boolean HasOwnAnchorPoint();

		/****************** HasPlane ******************/
		/**** md5 signature: 7cf03566771455c19f444d8a2236d65d ****/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "Returns true if the text is filled by a point.

Returns
-------
bool
") HasPlane;
		Standard_Boolean HasPlane();

		/****************** Height ******************/
		/**** md5 signature: 2749b028ff801f014d4fc0eb3de70908 ****/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Sets height of text. (relative to the normalized projection coordinates (npc) space).

Returns
-------
Standard_ShortReal
") Height;
		Standard_ShortReal Height();

		/****************** HorizontalAlignment ******************/
		/**** md5 signature: 0115f65c224e2508253706dbcaed911d ****/
		%feature("compactdefaultargs") HorizontalAlignment;
		%feature("autodoc", "Returns horizontal alignment of text.

Returns
-------
Graphic3d_HorizontalTextAlignment
") HorizontalAlignment;
		Graphic3d_HorizontalTextAlignment HorizontalAlignment();

		/****************** Orientation ******************/
		/**** md5 signature: 1f9ae1b5d6671bf7cb13e335b8bca8c1 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns text orientation in 3d space.

Returns
-------
gp_Ax2
") Orientation;
		const gp_Ax2 Orientation();

		/****************** Position ******************/
		/**** md5 signature: 0ab08d371c89be0cb1eecbddf304bb77 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "The 3d point of attachment is projected. if the orientation is defined, the text is written in the plane of projection.

Returns
-------
gp_Pnt
") Position;
		const gp_Pnt Position();

		/****************** ResetOrientation ******************/
		/**** md5 signature: 39aa72f39fb0e0c37f3b9a1f32b4aff2 ****/
		%feature("compactdefaultargs") ResetOrientation;
		%feature("autodoc", "Reset text orientation in 3d space.

Returns
-------
None
") ResetOrientation;
		void ResetOrientation();

		/****************** SetHeight ******************/
		/**** md5 signature: 24248b1fc0e6c80226c704e83d71a29f ****/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "Returns height of text.

Parameters
----------
theHeight: Standard_ShortReal

Returns
-------
None
") SetHeight;
		void SetHeight(const Standard_ShortReal theHeight);

		/****************** SetHorizontalAlignment ******************/
		/**** md5 signature: c370b9f2a669008a609171c1a458cd46 ****/
		%feature("compactdefaultargs") SetHorizontalAlignment;
		%feature("autodoc", "Sets horizontal alignment of text.

Parameters
----------
theJustification: Graphic3d_HorizontalTextAlignment

Returns
-------
None
") SetHorizontalAlignment;
		void SetHorizontalAlignment(const Graphic3d_HorizontalTextAlignment theJustification);

		/****************** SetOrientation ******************/
		/**** md5 signature: d0d8bca65c36cd5ecf7c66f85b6b744c ****/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "Sets text orientation in 3d space.

Parameters
----------
theOrientation: gp_Ax2

Returns
-------
None
") SetOrientation;
		void SetOrientation(const gp_Ax2 & theOrientation);

		/****************** SetOwnAnchorPoint ******************/
		/**** md5 signature: b48699145325bc254e9d2cd35b25e774 ****/
		%feature("compactdefaultargs") SetOwnAnchorPoint;
		%feature("autodoc", "Returns true if the text has an anchor point.

Parameters
----------
theHasOwnAnchor: bool

Returns
-------
None
") SetOwnAnchorPoint;
		void SetOwnAnchorPoint(const Standard_Boolean theHasOwnAnchor);

		/****************** SetPosition ******************/
		/**** md5 signature: 40bc31d1ad46a4aeef196d0c734ac91e ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets text point.

Parameters
----------
thePoint: gp_Pnt

Returns
-------
None
") SetPosition;
		void SetPosition(const gp_Pnt & thePoint);

		/****************** SetText ******************/
		/**** md5 signature: b9cc63ce3bb2835eedd0b5fe50bc4dff ****/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "Sets text value.

Parameters
----------
theText: NCollection_String

Returns
-------
None
") SetText;
		void SetText(const NCollection_String & theText);

		/****************** SetText ******************/
		/**** md5 signature: a0929e0bbb89cb9df8d2f7df87ca9f0c ****/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "Sets text value.

Parameters
----------
theText: TCollection_AsciiString

Returns
-------
None
") SetText;
		void SetText(const TCollection_AsciiString & theText);

		/****************** SetText ******************/
		/**** md5 signature: b3558520ae610ca542b0fb6b77a0768d ****/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "Sets text value.

Parameters
----------
theText: char *

Returns
-------
None
") SetText;
		void SetText(const char * theText);

		/****************** SetVerticalAlignment ******************/
		/**** md5 signature: e2cc7b2cf917c58381cfba8c8ed8d4a9 ****/
		%feature("compactdefaultargs") SetVerticalAlignment;
		%feature("autodoc", "Sets vertical alignment of text.

Parameters
----------
theJustification: Graphic3d_VerticalTextAlignment

Returns
-------
None
") SetVerticalAlignment;
		void SetVerticalAlignment(const Graphic3d_VerticalTextAlignment theJustification);

		/****************** Text ******************/
		/**** md5 signature: 5bba17eb833e5c94c8648407a843b411 ****/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Returns text value.

Returns
-------
NCollection_String
") Text;
		const NCollection_String & Text();

		/****************** VerticalAlignment ******************/
		/**** md5 signature: dbd4e8c974d13845b9700ce5eef112db ****/
		%feature("compactdefaultargs") VerticalAlignment;
		%feature("autodoc", "Returns vertical alignment of text.

Returns
-------
Graphic3d_VerticalTextAlignment
") VerticalAlignment;
		Graphic3d_VerticalTextAlignment VerticalAlignment();

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
		/****************** Graphic3d_TextureParams ******************/
		/**** md5 signature: 1f8634f1fd425055e350bfa7cb51434a ****/
		%feature("compactdefaultargs") Graphic3d_TextureParams;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") Graphic3d_TextureParams;
		 Graphic3d_TextureParams();

		/****************** AnisoFilter ******************/
		/**** md5 signature: a1063e5b1b0fa8938fd8b3515bad43e0 ****/
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "Returns level of anisontropy texture filter. default value is graphic3d_lota_off.

Returns
-------
Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter();

		/****************** Filter ******************/
		/**** md5 signature: a357879488fd75e79ba560704b544b81 ****/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "Returns texture interpolation filter. default value is graphic3d_totf_nearest.

Returns
-------
Graphic3d_TypeOfTextureFilter
") Filter;
		Graphic3d_TypeOfTextureFilter Filter();

		/****************** GenMode ******************/
		/**** md5 signature: 865c3f01d0a1a976e30ff5c43a0adb43 ****/
		%feature("compactdefaultargs") GenMode;
		%feature("autodoc", "Returns texture coordinates generation mode. default value is graphic3d_totm_manual.

Returns
-------
Graphic3d_TypeOfTextureMode
") GenMode;
		Graphic3d_TypeOfTextureMode GenMode();

		/****************** GenPlaneS ******************/
		/**** md5 signature: 5a420b7a06162b9eccd6c8b8edbcf21e ****/
		%feature("compactdefaultargs") GenPlaneS;
		%feature("autodoc", "Returns texture coordinates generation plane s.

Returns
-------
Graphic3d_Vec4
") GenPlaneS;
		const Graphic3d_Vec4 & GenPlaneS();

		/****************** GenPlaneT ******************/
		/**** md5 signature: 1f7102ba69a225576aa7584451b08127 ****/
		%feature("compactdefaultargs") GenPlaneT;
		%feature("autodoc", "Returns texture coordinates generation plane t.

Returns
-------
Graphic3d_Vec4
") GenPlaneT;
		const Graphic3d_Vec4 & GenPlaneT();

		/****************** IsModulate ******************/
		/**** md5 signature: 2e8a5b0702d5e7213cfba98e2c4f2f2c ****/
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "Returns true if the texture is modulate. default value is false.

Returns
-------
bool
") IsModulate;
		Standard_Boolean IsModulate();

		/****************** IsRepeat ******************/
		/**** md5 signature: 48fdc4527eeb413a8039f361c8a061d6 ****/
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "Returns true if the texture repeat is enabled. default value is false.

Returns
-------
bool
") IsRepeat;
		Standard_Boolean IsRepeat();

		/****************** Rotation ******************/
		/**** md5 signature: d53c3826c94a0b70b7a80893867da975 ****/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Returns rotation angle in degrees default value is 0.

Returns
-------
Standard_ShortReal
") Rotation;
		Standard_ShortReal Rotation();

		/****************** SamplerRevision ******************/
		/**** md5 signature: 40f8d1557d5754972b0c490348d69fc6 ****/
		%feature("compactdefaultargs") SamplerRevision;
		%feature("autodoc", "Return modification counter of parameters related to sampler state.

Returns
-------
unsigned int
") SamplerRevision;
		unsigned int SamplerRevision();

		/****************** Scale ******************/
		/**** md5 signature: 749fcbc9447e25bbdb6b3afe657a7089 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Returns scale factor default value is no scaling (1.0; 1.0).

Returns
-------
Graphic3d_Vec2
") Scale;
		const Graphic3d_Vec2 & Scale();

		/****************** SetAnisoFilter ******************/
		/**** md5 signature: 999fe7bc1a26aa6af8d56299c100b537 ****/
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "@param thelevel level of anisontropy texture filter.

Parameters
----------
theLevel: Graphic3d_LevelOfTextureAnisotropy

Returns
-------
None
") SetAnisoFilter;
		void SetAnisoFilter(const Graphic3d_LevelOfTextureAnisotropy theLevel);

		/****************** SetFilter ******************/
		/**** md5 signature: 3e35939457e589374a37bc96d8d155cb ****/
		%feature("compactdefaultargs") SetFilter;
		%feature("autodoc", "@param thefilter texture interpolation filter.

Parameters
----------
theFilter: Graphic3d_TypeOfTextureFilter

Returns
-------
None
") SetFilter;
		void SetFilter(const Graphic3d_TypeOfTextureFilter theFilter);

		/****************** SetGenMode ******************/
		/**** md5 signature: b4acdbe0ff4d2dc520dafd45d0e6d940 ****/
		%feature("compactdefaultargs") SetGenMode;
		%feature("autodoc", "Setup texture coordinates generation mode.

Parameters
----------
theMode: Graphic3d_TypeOfTextureMode
thePlaneS: Graphic3d_Vec4
thePlaneT: Graphic3d_Vec4

Returns
-------
None
") SetGenMode;
		void SetGenMode(const Graphic3d_TypeOfTextureMode theMode, const Graphic3d_Vec4 thePlaneS, const Graphic3d_Vec4 thePlaneT);

		/****************** SetModulate ******************/
		/**** md5 signature: 3c85d900631fe71e18cedc97c620af1a ****/
		%feature("compactdefaultargs") SetModulate;
		%feature("autodoc", "@param thetomodulate turn modulation on/off.

Parameters
----------
theToModulate: bool

Returns
-------
None
") SetModulate;
		void SetModulate(const Standard_Boolean theToModulate);

		/****************** SetRepeat ******************/
		/**** md5 signature: 3437fd549ca95467f7667436330a056e ****/
		%feature("compactdefaultargs") SetRepeat;
		%feature("autodoc", "@param thetorepeat turn texture repeat mode on or off (clamping).

Parameters
----------
theToRepeat: bool

Returns
-------
None
") SetRepeat;
		void SetRepeat(const Standard_Boolean theToRepeat);

		/****************** SetRotation ******************/
		/**** md5 signature: c2ea257b5cd47d5de38d465842e0f46e ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "@param theangledegrees rotation angle.

Parameters
----------
theAngleDegrees: Standard_ShortReal

Returns
-------
None
") SetRotation;
		void SetRotation(const Standard_ShortReal theAngleDegrees);

		/****************** SetScale ******************/
		/**** md5 signature: 5a849909ddec6d7e52c33fd14b93ad3d ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "@param thescale scale factor.

Parameters
----------
theScale: Graphic3d_Vec2

Returns
-------
None
") SetScale;
		void SetScale(const Graphic3d_Vec2 theScale);

		/****************** SetTextureUnit ******************/
		/**** md5 signature: 393fd5a96f811431db83dea5936e3ae0 ****/
		%feature("compactdefaultargs") SetTextureUnit;
		%feature("autodoc", "Setup default texture unit.

Parameters
----------
theUnit: Graphic3d_TextureUnit

Returns
-------
None
") SetTextureUnit;
		void SetTextureUnit(Graphic3d_TextureUnit theUnit);

		/****************** SetTranslation ******************/
		/**** md5 signature: bceecf42517fe1b905986c976ae2a5a7 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "@param thevec translation vector.

Parameters
----------
theVec: Graphic3d_Vec2

Returns
-------
None
") SetTranslation;
		void SetTranslation(const Graphic3d_Vec2 theVec);

		/****************** TextureUnit ******************/
		/**** md5 signature: 6c8ba285b3ae7bd2d38f3d7687772552 ****/
		%feature("compactdefaultargs") TextureUnit;
		%feature("autodoc", "Default texture unit to be used, default is graphic3d_textureunit_basecolor.

Returns
-------
Graphic3d_TextureUnit
") TextureUnit;
		Graphic3d_TextureUnit TextureUnit();

		/****************** Translation ******************/
		/**** md5 signature: e0f5ca18e3bbef2c5fd7c5ba80429fdd ****/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "Returns translation vector default value is no translation (0.0; 0.0).

Returns
-------
Graphic3d_Vec2
") Translation;
		const Graphic3d_Vec2 & Translation();

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
		/**** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "This id will be used to manage resource in graphic driver. //! default implementation generates unique id within constructor; inheritors may re-initialize it within their constructor, but should never modify it afterwards. //! multiple graphic3d_textureroot instances with same id will be treated as single texture with different parameters to optimize memory usage though this will be more natural to use same instance of graphic3d_textureroot when possible. //! if this id is set to empty string by inheritor, then independent graphical resource will be created for each instance of graphic3d_aspectfillarea3d where texture will be used. //! returns texture identifier.

Returns
-------
TCollection_AsciiString
") GetId;
		const TCollection_AsciiString & GetId();

		/****************** GetImage ******************/
		/**** md5 signature: be59520e9114894386728442bc4a59c8 ****/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "This method will be called by graphic driver each time when texture resource should be created. default constructors allow defining the texture source as path to texture image or directly as pixmap. if the source is defined as path, then the image will be dynamically loaded when this method is called (and no copy will be preserved in this class instance). inheritors may dynamically generate the image. notice, image data should be in bottom-up order (see image_pixmap::istopdown())! returns the image for texture.

Returns
-------
opencascade::handle<Image_PixMap>
") GetImage;
		virtual opencascade::handle<Image_PixMap> GetImage();

		/****************** GetParams ******************/
		/**** md5 signature: 9bad86532a93a9e68d3d67730d29041c ****/
		%feature("compactdefaultargs") GetParams;
		%feature("autodoc", "Returns low-level texture parameters.

Returns
-------
opencascade::handle<Graphic3d_TextureParams>
") GetParams;
		const opencascade::handle<Graphic3d_TextureParams> & GetParams();

		/****************** IsDone ******************/
		/**** md5 signature: 1dfe5875b8bc7f7b11380fb4ab8a9eb0 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Checks if a texture class is valid or not. returns true if the construction of the class is correct.

Returns
-------
bool
") IsDone;
		virtual Standard_Boolean IsDone();

		/****************** Path ******************/
		/**** md5 signature: 9d11d277fbcc37203e7dc39c30ea2e54 ****/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Returns the full path of the defined texture. it could be empty path if getimage() is overridden to load image not from file.

Returns
-------
OSD_Path
") Path;
		const OSD_Path & Path();

		/****************** Revision ******************/
		/**** md5 signature: dfd4fb672d125a081a8b5a357ac81453 ****/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "Return image revision.

Returns
-------
Standard_Size
") Revision;
		Standard_Size Revision();

		/****************** TexturesFolder ******************/
		/**** md5 signature: d0c7ddde8409f509c5551965f8259175 ****/
		%feature("compactdefaultargs") TexturesFolder;
		%feature("autodoc", "The path to textures determined from csf_mdtvtexturesdirectory or casroot environment variables. returns the root folder with default textures.

Returns
-------
TCollection_AsciiString
") TexturesFolder;
		static TCollection_AsciiString TexturesFolder();

		/****************** Type ******************/
		/**** md5 signature: 87a980c7b2776950ff29967ed1d02b26 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the texture type.

Returns
-------
Graphic3d_TypeOfTexture
") Type;
		Graphic3d_TypeOfTexture Type();

		/****************** UpdateRevision ******************/
		/**** md5 signature: c6fa6eed894b58a10a8244acfe852d71 ****/
		%feature("compactdefaultargs") UpdateRevision;
		%feature("autodoc", "Update image revision. can be used for signaling changes in the texture source (e.g. file update, pixmap update) without re-creating texture source itself (since unique id should be never modified).

Returns
-------
None
") UpdateRevision;
		void UpdateRevision();

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
		/**** md5 signature: 1b87d5773d0bbd2bc2a8b684ebde24e0 ****/
		%feature("compactdefaultargs") TypeID;
		%feature("autodoc", "Returns unique identifier of value type.

Returns
-------
Standard_Size
") TypeID;
		virtual Standard_Size TypeID();

};


%extend Graphic3d_ValueInterface {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def As(self):
		pass
	}
};

/*************************
* class Graphic3d_Vertex *
*************************/
class Graphic3d_Vertex {
	public:
		float xyz[3];
		/****************** Graphic3d_Vertex ******************/
		/**** md5 signature: 103e205f0886b0005b0cbeab1659769a ****/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "Creates a point with 0.0, 0.0, 0.0 coordinates.

Returns
-------
None
") Graphic3d_Vertex;
		 Graphic3d_Vertex();

		/****************** Graphic3d_Vertex ******************/
		/**** md5 signature: 14a03b70fb8d26c3419a33511c412538 ****/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "Creates a point with coordinates identical to thepoint.

Parameters
----------
thePoint: Graphic3d_Vertex

Returns
-------
None
") Graphic3d_Vertex;
		 Graphic3d_Vertex(const Graphic3d_Vertex & thePoint);

		/****************** Graphic3d_Vertex ******************/
		/**** md5 signature: 58adb81acdd9e39f4d304878f2e3a411 ****/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "Creates a point with thex, they and thez coordinates.

Parameters
----------
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal

Returns
-------
None
") Graphic3d_Vertex;
		 Graphic3d_Vertex(const Standard_ShortReal theX, const Standard_ShortReal theY, const Standard_ShortReal theZ);

		/****************** Graphic3d_Vertex ******************/
		/**** md5 signature: 735a391be0243255a0f0f9924a777503 ****/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "Creates a point with thex, they and thez coordinates.

Parameters
----------
theX: float
theY: float
theZ: float

Returns
-------
None
") Graphic3d_Vertex;
		 Graphic3d_Vertex(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ);

		/****************** Coord ******************/
		/**** md5 signature: 280c830b5f369e462575f5e7a2cb8c56 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates.

Parameters
----------
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal

Returns
-------
None
") Coord;
		void Coord(Standard_ShortReal & theX, Standard_ShortReal & theY, Standard_ShortReal & theZ);

		/****************** Coord ******************/
		/**** md5 signature: 5ef85c73f9c80cea4d8dc9bec59c3e4d ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates.

Parameters
----------

Returns
-------
theX: float
theY: float
theZ: float
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Distance ******************/
		/**** md5 signature: a9d6b779bf81c2942bd9222c13bfcfe4 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Returns the distance between two points.

Parameters
----------
theOther: Graphic3d_Vertex

Returns
-------
Standard_ShortReal
") Distance;
		Standard_ShortReal Distance(const Graphic3d_Vertex & theOther);

		/****************** SetCoord ******************/
		/**** md5 signature: f784278aa131d15fe22f13b088f67335 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Modifies the coordinates.

Parameters
----------
theX: Standard_ShortReal
theY: Standard_ShortReal
theZ: Standard_ShortReal

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_ShortReal theX, const Standard_ShortReal theY, const Standard_ShortReal theZ);

		/****************** SetCoord ******************/
		/**** md5 signature: c4b478464992cf7989de7989abd51418 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Modifies the coordinates.

Parameters
----------
theX: float
theY: float
theZ: float

Returns
-------
None
") SetCoord;
		void SetCoord(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ);

		/****************** X ******************/
		/**** md5 signature: 6ff8a8ccaac67562ded54933ac1f6eaf ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinates.

Returns
-------
Standard_ShortReal
") X;
		Standard_ShortReal X();

		/****************** Y ******************/
		/**** md5 signature: 9b54d9ad44bedfdc5535f532139b29f0 ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate.

Returns
-------
Standard_ShortReal
") Y;
		Standard_ShortReal Y();

		/****************** Z ******************/
		/**** md5 signature: 17127e512c97003b5692a4758e10a77f ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Returns the z coordinate.

Returns
-------
Standard_ShortReal
") Z;
		Standard_ShortReal Z();

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
		/**** md5 signature: c28b9859f1b5f4571ffe5d01bf2fbe3b ****/
		%feature("compactdefaultargs") Graphic3d_ViewAffinity;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_ViewAffinity;
		 Graphic3d_ViewAffinity();

		/****************** IsVisible ******************/
		/**** md5 signature: fde091b526f03186c5a82e89779d5e52 ****/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return visibility flag.

Parameters
----------
theViewId: int

Returns
-------
bool
") IsVisible;
		bool IsVisible(const Standard_Integer theViewId);

		/****************** SetVisible ******************/
		/**** md5 signature: cde22849400e9fb6f271e91c79dfa42a ****/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "Setup visibility flag for all views.

Parameters
----------
theIsVisible: bool

Returns
-------
None
") SetVisible;
		void SetVisible(const Standard_Boolean theIsVisible);

		/****************** SetVisible ******************/
		/**** md5 signature: 3aeebb679c566c8acd531184eca6daa9 ****/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "Setup visibility flag.

Parameters
----------
theViewId: int
theIsVisible: bool

Returns
-------
None
") SetVisible;
		void SetVisible(const Standard_Integer theViewId, const bool theIsVisible);

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
		/**** md5 signature: f3b196715a217ca6c1db7f0c9868b4d7 ****/
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "Default constructor.

Returns
-------
None
") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState();

		/****************** Graphic3d_WorldViewProjState ******************/
		/**** md5 signature: 11a4e45328ad41acbf0f5625445abd79 ****/
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "Constructor for custom projector type. @param theprojectionstate [in] the projection state. @param theworldviewstate [in] the world view state. @param thecamera [in] the pointer to the class supplying projection and  world view matrices (camera).

Parameters
----------
theProjectionState: Standard_Size
theWorldViewState: Standard_Size
theCamera: Standard_Transient *,optional
	default value is NULL

Returns
-------
None
") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState(const Standard_Size theProjectionState, const Standard_Size theWorldViewState, const Standard_Transient * theCamera = NULL);

		/****************** Initialize ******************/
		/**** md5 signature: 79ec01c7a66add6844dd4f3e0bf2488b ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize world view projection state.

Parameters
----------
theProjectionState: Standard_Size
theWorldViewState: Standard_Size
theCamera: Standard_Transient *,optional
	default value is NULL

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Size theProjectionState, const Standard_Size theWorldViewState, const Standard_Transient * theCamera = NULL);

		/****************** Initialize ******************/
		/**** md5 signature: 31f405ac6fae9f709587162aa5922302 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize world view projection state.

Parameters
----------
theCamera: Standard_Transient *,optional
	default value is NULL

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Transient * theCamera = NULL);

		/****************** IsChanged ******************/
		/**** md5 signature: 7b602c9fd7a31f20730c410acc59604f ****/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "Compare with other world view projection state. returns true when the projection of the given camera state differs from this one.

Parameters
----------
theState: Graphic3d_WorldViewProjState

Returns
-------
bool
") IsChanged;
		Standard_Boolean IsChanged(const Graphic3d_WorldViewProjState & theState);

		/****************** IsProjectionChanged ******************/
		/**** md5 signature: 285d1d0942afda16612026a76e1e11e5 ****/
		%feature("compactdefaultargs") IsProjectionChanged;
		%feature("autodoc", "Compare projection with other state. returns true when the projection of the given camera state differs from this one.

Parameters
----------
theState: Graphic3d_WorldViewProjState

Returns
-------
bool
") IsProjectionChanged;
		Standard_Boolean IsProjectionChanged(const Graphic3d_WorldViewProjState & theState);

		/****************** IsValid ******************/
		/**** md5 signature: c1993b3b31d320b598a9a9b27c56914e ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Check state validity. returns true if state is set.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** IsWorldViewChanged ******************/
		/**** md5 signature: 71ed06d06ff39395fa4c6d11ac16365d ****/
		%feature("compactdefaultargs") IsWorldViewChanged;
		%feature("autodoc", "Compare world view transformation with other state. returns true when the orientation of the given camera state differs from this one.

Parameters
----------
theState: Graphic3d_WorldViewProjState

Returns
-------
bool
") IsWorldViewChanged;
		Standard_Boolean IsWorldViewChanged(const Graphic3d_WorldViewProjState & theState);

		/****************** ProjectionState ******************/
		/**** md5 signature: 295098b9e05efc777696be9ced035265 ****/
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "Returns projection state counter.

Returns
-------
Standard_Size
") ProjectionState;
		Standard_Size & ProjectionState();

		/****************** Reset ******************/
		/**** md5 signature: e3081050d274769a1cd4a93969da94c6 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Invalidate world view projection state.

Returns
-------
None
") Reset;
		void Reset();

		/****************** WorldViewState ******************/
		/**** md5 signature: b496d314b27737b75554d89d662eeaac ****/
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "Returns world view state counter.

Returns
-------
Standard_Size
") WorldViewState;
		Standard_Size & WorldViewState();


            %extend{
                bool __ne_wrapper__(const Graphic3d_WorldViewProjState other) {
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
                bool __eq_wrapper__(const Graphic3d_WorldViewProjState other) {
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
		/****************** Graphic3d_ZLayerSettings ******************/
		/**** md5 signature: 61c792fdd142303f6bdad7c9f5308568 ****/
		%feature("compactdefaultargs") Graphic3d_ZLayerSettings;
		%feature("autodoc", "Default settings.

Returns
-------
None
") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings();

		/****************** ChangePolygonOffset ******************/
		/**** md5 signature: 41fd26be43fe21937e5010441b302f14 ****/
		%feature("compactdefaultargs") ChangePolygonOffset;
		%feature("autodoc", "Modify glpolygonoffset() arguments.

Returns
-------
Graphic3d_PolygonOffset
") ChangePolygonOffset;
		Graphic3d_PolygonOffset & ChangePolygonOffset();

		/****************** CullingDistance ******************/
		/**** md5 signature: e6b8750d3a7361597b6f3bc26dcd69c4 ****/
		%feature("compactdefaultargs") CullingDistance;
		%feature("autodoc", "Return the distance to discard drawing of distant objects (distance from camera eye point); by default it is infinite (distance culling is disabled). since camera eye definition has no strong meaning within orthographic projection, option is considered only within perspective projection. note also that this option has effect only when frustum culling is enabled.

Returns
-------
float
") CullingDistance;
		Standard_Real CullingDistance();

		/****************** CullingSize ******************/
		/**** md5 signature: 125efcbef75ecd620b89e827333ea9d2 ****/
		%feature("compactdefaultargs") CullingSize;
		%feature("autodoc", "Return the size to discard drawing of small objects; by default it is infinite (size culling is disabled). current implementation checks the length of projected diagonal of bounding box in pixels for discarding. note that this option has effect only when frustum culling is enabled.

Returns
-------
float
") CullingSize;
		Standard_Real CullingSize();

		/****************** DisableSetting ******************/
		/**** md5 signature: 677606ab7784fc920b0af6315e76ffa8 ****/
		%feature("compactdefaultargs") DisableSetting;
		%feature("autodoc", "Disables thesetting.

Parameters
----------
theSetting: Graphic3d_ZLayerSetting

Returns
-------
None
") DisableSetting;
		void DisableSetting(const Graphic3d_ZLayerSetting theSetting);

		/****************** EnableSetting ******************/
		/**** md5 signature: f9f19a26f7bc1f0c3f3ea468d840c73b ****/
		%feature("compactdefaultargs") EnableSetting;
		%feature("autodoc", "Enables thesetting.

Parameters
----------
theSetting: Graphic3d_ZLayerSetting

Returns
-------
None
") EnableSetting;
		void EnableSetting(const Graphic3d_ZLayerSetting theSetting);

		/****************** HasCullingDistance ******************/
		/**** md5 signature: 3cc1577ecc805ada9625500f00095068 ****/
		%feature("compactdefaultargs") HasCullingDistance;
		%feature("autodoc", "Return true, if culling of distant objects (distance culling) should be performed; false by default. @sa cullingdistance().

Returns
-------
bool
") HasCullingDistance;
		Standard_Boolean HasCullingDistance();

		/****************** HasCullingSize ******************/
		/**** md5 signature: 6bda045d9e6aceefe9df2f45440bbaa8 ****/
		%feature("compactdefaultargs") HasCullingSize;
		%feature("autodoc", "Return true, if culling of small objects (size culling) should be performed; false by default. @sa cullingsize().

Returns
-------
bool
") HasCullingSize;
		Standard_Boolean HasCullingSize();

		/****************** IsImmediate ******************/
		/**** md5 signature: 61db5a8037272eb61c5a3a4e001931f7 ****/
		%feature("compactdefaultargs") IsImmediate;
		%feature("autodoc", "Return true if this layer should be drawn after all normal (non-immediate) layers.

Returns
-------
bool
") IsImmediate;
		Standard_Boolean IsImmediate();

		/****************** IsRaytracable ******************/
		/**** md5 signature: 839809fe4128a7739e1916048b03998d ****/
		%feature("compactdefaultargs") IsRaytracable;
		%feature("autodoc", "Returns true if layer should be processed by ray-tracing renderer; true by default. note that this flag is ignored for layers with isimmediate() flag.

Returns
-------
bool
") IsRaytracable;
		Standard_Boolean IsRaytracable();

		/****************** IsSettingEnabled ******************/
		/**** md5 signature: 88032dfcd0a6034a23bb09be41020529 ****/
		%feature("compactdefaultargs") IsSettingEnabled;
		%feature("autodoc", "Returns true if thesetting is enabled.

Parameters
----------
theSetting: Graphic3d_ZLayerSetting

Returns
-------
bool
") IsSettingEnabled;
		Standard_Boolean IsSettingEnabled(const Graphic3d_ZLayerSetting theSetting);

		/****************** Lights ******************/
		/**** md5 signature: 63f7d6694870edc26ea8df652c3f0f2b ****/
		%feature("compactdefaultargs") Lights;
		%feature("autodoc", "Return lights list to be used for rendering presentations within this z-layer; null by default. null list (but not empty list!) means that default lights assigned to the view should be used instead of per-layer lights.

Returns
-------
opencascade::handle<Graphic3d_LightSet>
") Lights;
		const opencascade::handle<Graphic3d_LightSet> & Lights();

		/****************** Name ******************/
		/**** md5 signature: efed61b92683387cd746fb27e0376505 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return user-provided name.

Returns
-------
TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** Origin ******************/
		/**** md5 signature: 294b7efa433672e306faca1de51564b0 ****/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "Return the origin of all objects within the layer.

Returns
-------
gp_XYZ
") Origin;
		const gp_XYZ Origin();

		/****************** OriginTransformation ******************/
		/**** md5 signature: d475c7ebe3629fd18b307b7d586d371c ****/
		%feature("compactdefaultargs") OriginTransformation;
		%feature("autodoc", "Return the transformation to the origin.

Returns
-------
opencascade::handle<Geom_Transformation>
") OriginTransformation;
		const opencascade::handle<Geom_Transformation> & OriginTransformation();

		/****************** PolygonOffset ******************/
		/**** md5 signature: 5bc0db1ff0ef7eec07c4eb78b80f6cca ****/
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "Return glpolygonoffset() arguments.

Returns
-------
Graphic3d_PolygonOffset
") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset();

		/****************** SetClearDepth ******************/
		/**** md5 signature: e1cb8b4b9c9c690792097f7904691bf4 ****/
		%feature("compactdefaultargs") SetClearDepth;
		%feature("autodoc", "Set if depth values should be cleared before drawing the layer.

Parameters
----------
theValue: bool

Returns
-------
None
") SetClearDepth;
		void SetClearDepth(const Standard_Boolean theValue);

		/****************** SetCullingDistance ******************/
		/**** md5 signature: 212f1b9b3fad158e803c37ed4ea70813 ****/
		%feature("compactdefaultargs") SetCullingDistance;
		%feature("autodoc", "Set the distance to discard drawing objects.

Parameters
----------
theDistance: float

Returns
-------
None
") SetCullingDistance;
		void SetCullingDistance(Standard_Real theDistance);

		/****************** SetCullingSize ******************/
		/**** md5 signature: de1e67e83be84528f7afa7d200b49f34 ****/
		%feature("compactdefaultargs") SetCullingSize;
		%feature("autodoc", "Set the distance to discard drawing objects.

Parameters
----------
theSize: float

Returns
-------
None
") SetCullingSize;
		void SetCullingSize(Standard_Real theSize);

		/****************** SetDepthOffsetNegative ******************/
		/**** md5 signature: 8504702a9a57f02a9fc5f9a049047757 ****/
		%feature("compactdefaultargs") SetDepthOffsetNegative;
		%feature("autodoc", "Sets minimal possible negative depth offset.

Returns
-------
None
") SetDepthOffsetNegative;
		void SetDepthOffsetNegative();

		/****************** SetDepthOffsetPositive ******************/
		/**** md5 signature: e5422a61a52cf834e79732a19c969150 ****/
		%feature("compactdefaultargs") SetDepthOffsetPositive;
		%feature("autodoc", "Sets minimal possible positive depth offset.

Returns
-------
None
") SetDepthOffsetPositive;
		void SetDepthOffsetPositive();

		/****************** SetEnableDepthTest ******************/
		/**** md5 signature: 78f70f77ea0ae712508fd0672ebe8861 ****/
		%feature("compactdefaultargs") SetEnableDepthTest;
		%feature("autodoc", "Set if depth test should be enabled.

Parameters
----------
theValue: bool

Returns
-------
None
") SetEnableDepthTest;
		void SetEnableDepthTest(const Standard_Boolean theValue);

		/****************** SetEnableDepthWrite ******************/
		/**** md5 signature: 3ff81b20d6640750aa45dc9dc6946e4f ****/
		%feature("compactdefaultargs") SetEnableDepthWrite;
		%feature("autodoc", "Set if depth values should be written during rendering.

Parameters
----------
theValue: bool

Returns
-------
None
") SetEnableDepthWrite;
		void SetEnableDepthWrite(const Standard_Boolean theValue);

		/****************** SetEnvironmentTexture ******************/
		/**** md5 signature: fa23cac6f55518df8e0828d12c17be15 ****/
		%feature("compactdefaultargs") SetEnvironmentTexture;
		%feature("autodoc", "Set the flag to allow/prevent environment texture mapping usage for specific layer.

Parameters
----------
theValue: bool

Returns
-------
None
") SetEnvironmentTexture;
		void SetEnvironmentTexture(const Standard_Boolean theValue);

		/****************** SetImmediate ******************/
		/**** md5 signature: 100eea613280df3a64cdb947b26cc07a ****/
		%feature("compactdefaultargs") SetImmediate;
		%feature("autodoc", "Set the flag indicating the immediate layer, which should be drawn after all normal (non-immediate) layers.

Parameters
----------
theValue: bool

Returns
-------
None
") SetImmediate;
		void SetImmediate(const Standard_Boolean theValue);

		/****************** SetLights ******************/
		/**** md5 signature: 853164d2a8de34064a3aea2df906c3fa ****/
		%feature("compactdefaultargs") SetLights;
		%feature("autodoc", "Assign lights list to be used.

Parameters
----------
theLights: Graphic3d_LightSet

Returns
-------
None
") SetLights;
		void SetLights(const opencascade::handle<Graphic3d_LightSet> & theLights);

		/****************** SetName ******************/
		/**** md5 signature: 273df384551aa519beda71c20cd913ae ****/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Set custom name.

Parameters
----------
theName: TCollection_AsciiString

Returns
-------
None
") SetName;
		void SetName(const TCollection_AsciiString & theName);

		/****************** SetOrigin ******************/
		/**** md5 signature: 4e4636f1039090357f364099b018aa8c ****/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "Set the origin of all objects within the layer.

Parameters
----------
theOrigin: gp_XYZ

Returns
-------
None
") SetOrigin;
		void SetOrigin(const gp_XYZ & theOrigin);

		/****************** SetPolygonOffset ******************/
		/**** md5 signature: 683821e43c43689ce29cb4e52c777595 ****/
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "Setup glpolygonoffset() arguments.

Parameters
----------
theParams: Graphic3d_PolygonOffset

Returns
-------
None
") SetPolygonOffset;
		void SetPolygonOffset(const Graphic3d_PolygonOffset & theParams);

		/****************** SetRaytracable ******************/
		/**** md5 signature: 0468f0baf3ca14a2925941309bdbf40e ****/
		%feature("compactdefaultargs") SetRaytracable;
		%feature("autodoc", "Sets if layer should be processed by ray-tracing renderer.

Parameters
----------
theToRaytrace: bool

Returns
-------
None
") SetRaytracable;
		void SetRaytracable(Standard_Boolean theToRaytrace);

		/****************** SetRenderInDepthPrepass ******************/
		/**** md5 signature: fc37593c3b579d516790714fcbd125b9 ****/
		%feature("compactdefaultargs") SetRenderInDepthPrepass;
		%feature("autodoc", "Set if layer should be rendered within depth pre-pass.

Parameters
----------
theToRender: bool

Returns
-------
None
") SetRenderInDepthPrepass;
		void SetRenderInDepthPrepass(Standard_Boolean theToRender);

		/****************** ToClearDepth ******************/
		/**** md5 signature: 588e7a6cb8079fc5baf75d9b354fd7ff ****/
		%feature("compactdefaultargs") ToClearDepth;
		%feature("autodoc", "Return true if depth values should be cleared before drawing the layer.

Returns
-------
bool
") ToClearDepth;
		Standard_Boolean ToClearDepth();

		/****************** ToEnableDepthTest ******************/
		/**** md5 signature: c9240b5e49476699d42027d5a30bdaae ****/
		%feature("compactdefaultargs") ToEnableDepthTest;
		%feature("autodoc", "Return true if depth test should be enabled.

Returns
-------
bool
") ToEnableDepthTest;
		Standard_Boolean ToEnableDepthTest();

		/****************** ToEnableDepthWrite ******************/
		/**** md5 signature: 759b5fd3e3cdd67e1da4d8719af3ce76 ****/
		%feature("compactdefaultargs") ToEnableDepthWrite;
		%feature("autodoc", "Return true depth values should be written during rendering.

Returns
-------
bool
") ToEnableDepthWrite;
		Standard_Boolean ToEnableDepthWrite();

		/****************** ToRenderInDepthPrepass ******************/
		/**** md5 signature: 947be431c547603abdb326ceb200b0d2 ****/
		%feature("compactdefaultargs") ToRenderInDepthPrepass;
		%feature("autodoc", "Return true if layer should be rendered within depth pre-pass; true by default.

Returns
-------
bool
") ToRenderInDepthPrepass;
		Standard_Boolean ToRenderInDepthPrepass();

		/****************** UseEnvironmentTexture ******************/
		/**** md5 signature: 68ad1adf6d667cdaeaafe524a8e45f33 ****/
		%feature("compactdefaultargs") UseEnvironmentTexture;
		%feature("autodoc", "Return flag to allow/prevent environment texture mapping usage for specific layer.

Returns
-------
bool
") UseEnvironmentTexture;
		Standard_Boolean UseEnvironmentTexture();

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
		/**** md5 signature: 9866408ffddda8e43620807962ce2d37 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "Creates an array of points (graphic3d_topa_points). the array must be filled using the addvertex(point) method. @param themaxvertexs maximum number of points @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints(Standard_Integer theMaxVertexs, int theArrayFlags);

		/****************** Graphic3d_ArrayOfPoints ******************/
		/**** md5 signature: e23aec21f5a3377c8f261c30be246dda ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "Creates an array of points (graphic3d_topa_points). the array must be filled using the addvertex(point) method. @param themaxvertexs maximum number of points @param thehasvcolors when true, addvertex(point,color) should be used for specifying vertex color @param thehasvnormals when true, addvertex(point,normal) should be used for specifying vertex normal.

Parameters
----------
theMaxVertexs: int
theHasVColors: bool,optional
	default value is Standard_False
theHasVNormals: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints(Standard_Integer theMaxVertexs, Standard_Boolean theHasVColors = Standard_False, Standard_Boolean theHasVNormals = Standard_False);

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
		/**** md5 signature: 4629424b2c4652e778084defb0a8b3f4 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "Creates an array of polygons (graphic3d_topa_polygons), a polygon can be filled as: 1) creating a single polygon defined with his vertexes, i.e: @code myarray = graphic3d_arrayofpolygons (7); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x7, y7, z7); @endcode 2) creating separate polygons defined with a predefined number of bounds and the number of vertex per bound, i.e: @code myarray = graphic3d_arrayofpolygons (7, 2); myarray->addbound (4); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addbound (3); myarray->addvertex (x5, y5, z5); .... myarray->addvertex (x7, y7, z7); @endcode 3) creating a single indexed polygon defined with his vertex ans edges, i.e: @code myarray = graphic3d_arrayofpolygons (4, 0, 6); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addedge (1); myarray->addedge (2); myarray->addedge (3); myarray->addedge (1); myarray->addedge (2); myarray->addedge (4); @endcode 4) creating separate polygons defined with a predefined number of bounds and the number of edges per bound, i.e: @code myarray = graphic3d_arrayofpolygons (6, 4, 14); myarray->addbound (3); myarray->addvertex (x1, y1, z1); myarray->addvertex (x2, y2, z2); myarray->addvertex (x3, y3, z3); myarray->addedge (1); myarray->addedge (2); myarray->addedge (3); myarray->addbound (3); myarray->addvertex (x4, y4, z4); myarray->addvertex (x5, y5, z5); myarray->addvertex (x6, y6, z6); myarray->addedge (4); myarray->addedge (5); myarray->addedge (6); myarray->addbound (4); myarray->addedge (2); myarray->addedge (3); myarray->addedge (5); myarray->addedge (6); myarray->addbound (4); myarray->addedge (1); myarray->addedge (3); myarray->addedge (5); myarray->addedge (4); @endcode @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxbounds defines the maximum allowed bound number in the array @param themaxedges defines the maximum allowed edge number in the array @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxBounds: int
theMaxEdges: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons(Standard_Integer theMaxVertexs, Standard_Integer theMaxBounds, Standard_Integer theMaxEdges, int theArrayFlags);

		/****************** Graphic3d_ArrayOfPolygons ******************/
		/**** md5 signature: 2ff4b6a1e0b5d7de1f909b3d7c4ca0c2 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "Creates an array of polygons (graphic3d_topa_polygons): @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxbounds defines the maximum allowed bound number in the array @param themaxedges defines the maximum allowed edge number in the array.

Parameters
----------
theMaxVertexs: int
theMaxBounds: int,optional
	default value is 0
theMaxEdges: int,optional
	default value is 0
theHasVNormals: bool,optional
	default value is Standard_False
theHasVColors: bool,optional
	default value is Standard_False
theHasBColors: bool,optional
	default value is Standard_False
theHasVTexels: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons(const Standard_Integer theMaxVertexs, const Standard_Integer theMaxBounds = 0, const Standard_Integer theMaxEdges = 0, const Standard_Boolean theHasVNormals = Standard_False, const Standard_Boolean theHasVColors = Standard_False, const Standard_Boolean theHasBColors = Standard_False, const Standard_Boolean theHasVTexels = Standard_False);

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
		/**** md5 signature: 2858b0d5a664aaebc96ffb4bd6ad7f05 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "Creates an array of polylines (graphic3d_topa_polylines), a polyline can be filled as: 1) creating a single polyline defined with his vertexes, i.e: @code myarray = graphic3d_arrayofpolylines (7); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x7, y7, z7); @endcode 2) creating separate polylines defined with a predefined number of bounds and the number of vertex per bound, i.e: @code myarray = graphic3d_arrayofpolylines (7, 2); myarray->addbound (4); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addbound (3); myarray->addvertex (x5, y5, z5); .... myarray->addvertex (x7, y7, z7); @endcode 3) creating a single indexed polyline defined with his vertex and edges, i.e: @code myarray = graphic3d_arrayofpolylines (4, 0, 6); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addedge (1); myarray->addedge (2); myarray->addedge (3); myarray->addedge (1); myarray->addedge (2); myarray->addedge (4); @endcode 4) creating separate polylines defined with a predefined number of bounds and the number of edges per bound, i.e: @code myarray = graphic3d_arrayofpolylines (6, 4, 14); myarray->addbound (3); myarray->addvertex (x1, y1, z1); myarray->addvertex (x2, y2, z2); myarray->addvertex (x3, y3, z3); myarray->addedge (1); myarray->addedge (2); myarray->addedge (3); myarray->addbound (3); myarray->addvertex (x4, y4, z4); myarray->addvertex (x5, y5, z5); myarray->addvertex (x6, y6, z6); myarray->addedge (4); myarray->addedge (5); myarray->addedge (6); myarray->addbound (4); myarray->addedge (2); myarray->addedge (3); myarray->addedge (5); myarray->addedge (6); myarray->addbound (4); myarray->addedge (1); myarray->addedge (3); myarray->addedge (5); myarray->addedge (4); @endcode @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxbounds defines the maximum allowed bound number in the array @param themaxedges defines the maximum allowed edge number in the array @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxBounds: int
theMaxEdges: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines(Standard_Integer theMaxVertexs, Standard_Integer theMaxBounds, Standard_Integer theMaxEdges, int theArrayFlags);

		/****************** Graphic3d_ArrayOfPolylines ******************/
		/**** md5 signature: e1db2523232b718202cc226ddf9e6da6 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "Creates an array of polylines (graphic3d_topa_polylines). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxbounds defines the maximum allowed bound number in the array @param themaxedges defines the maximum allowed edge number in the array @param thehasvcolors when true addvertex(point,color) or addvertex(point,normal,color) should be used to specify per-vertex color values @param thehasbcolors when true addbound(number,color) should be used to specify sub-group color.

Parameters
----------
theMaxVertexs: int
theMaxBounds: int,optional
	default value is 0
theMaxEdges: int,optional
	default value is 0
theHasVColors: bool,optional
	default value is Standard_False
theHasBColors: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines(Standard_Integer theMaxVertexs, Standard_Integer theMaxBounds = 0, Standard_Integer theMaxEdges = 0, Standard_Boolean theHasVColors = Standard_False, Standard_Boolean theHasBColors = Standard_False);

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
		/**** md5 signature: 277bb8ecb46f10be8a9349b516f8c076 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "Creates an array of quadrangle strips (graphic3d_topa_quadranglestrips), a polygon can be filled as: 1) creating a single strip defined with his vertexes, i.e: @code myarray = graphic3d_arrayofquadranglestrips (7); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x7, y7, z7); @endcode 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip, i.e: @code myarray = graphic3d_arrayofquadranglestrips (8, 2); myarray->addbound (4); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addbound (4); myarray->addvertex (x5, y5, z5); .... myarray->addvertex (x8, y8, z8); @endcode the number of quadrangle really drawn is: vertexnumber()/2 - min(1, boundnumber()). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxstrips defines the maximum allowed strip number in the array @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxStrips: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips(Standard_Integer theMaxVertexs, Standard_Integer theMaxStrips, int theArrayFlags);

		/****************** Graphic3d_ArrayOfQuadrangleStrips ******************/
		/**** md5 signature: c92dd453e13c4b336d2361db52e2d35a ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "Creates an array of quadrangle strips (graphic3d_topa_quadranglestrips). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxstrips defines the maximum allowed strip number in the array.

Parameters
----------
theMaxVertexs: int
theMaxStrips: int,optional
	default value is 0
theHasVNormals: bool,optional
	default value is Standard_False
theHasVColors: bool,optional
	default value is Standard_False
theHasSColors: bool,optional
	default value is Standard_False
theHasVTexels: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips(Standard_Integer theMaxVertexs, Standard_Integer theMaxStrips = 0, Standard_Boolean theHasVNormals = Standard_False, Standard_Boolean theHasVColors = Standard_False, Standard_Boolean theHasSColors = Standard_False, Standard_Boolean theHasVTexels = Standard_False);

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
		/**** md5 signature: f8ddd2d308778b47550d7e463e1a544b ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "Creates an array of quadrangles (graphic3d_topa_quadrangles), a quadrangle can be filled as: 1) creating a set of quadrangles defined with his vertexes, i.e: @code myarray = graphic3d_arrayofquadrangles (8); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x8, y8, z8); @endcode 2) creating a set of indexed quadrangles defined with his vertex ans edges, i.e: @code myarray = graphic3d_arrayofquadrangles (6, 8); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x6, y6, z6); myarray->addedges (1, 2, 3, 4); myarray->addedges (3, 4, 5, 6); @endcode @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxedges defines the maximum allowed edge number in the array (for indexed array) @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles(Standard_Integer theMaxVertexs, Standard_Integer theMaxEdges, int theArrayFlags);

		/****************** Graphic3d_ArrayOfQuadrangles ******************/
		/**** md5 signature: f065933ee43e2327588f4142a9145e5a ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "Creates an array of quadrangles (graphic3d_topa_quadrangles). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxedges defines the maximum allowed edge number in the array (for indexed array).

Parameters
----------
theMaxVertexs: int
theMaxEdges: int,optional
	default value is 0
theHasVNormals: bool,optional
	default value is Standard_False
theHasVColors: bool,optional
	default value is Standard_False
theHasVTexels: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles(Standard_Integer theMaxVertexs, Standard_Integer theMaxEdges = 0, Standard_Boolean theHasVNormals = Standard_False, Standard_Boolean theHasVColors = Standard_False, Standard_Boolean theHasVTexels = Standard_False);

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
		/**** md5 signature: 3c6cb6cf80cee23c3d0e4b39d2cbdf64 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "Creates an array of segments (graphic3d_topa_segments), a segment can be filled as: 1) creating a set of segments defined with his vertexes, i.e: @code myarray = graphic3d_arrayofsegments (4); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); @endcode 2) creating a set of indexed segments defined with his vertex and edges, i.e: @code myarray = graphic3d_arrayofsegments (4, 8); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addedges (1, 2); myarray->addedges (3, 4); myarray->addedges (2, 4); myarray->addedges (1, 3); @endcode @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxedges defines the maximum allowed edge number in the array @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments(Standard_Integer theMaxVertexs, Standard_Integer theMaxEdges, int theArrayFlags);

		/****************** Graphic3d_ArrayOfSegments ******************/
		/**** md5 signature: 049e0ca57b4606c80d2bbed9e17f9215 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "Creates an array of segments (graphic3d_topa_segments). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxedges defines the maximum allowed edge number in the array @param thehasvcolors when true, addvertex(point,color) should be used for specifying vertex color.

Parameters
----------
theMaxVertexs: int
theMaxEdges: int,optional
	default value is 0
theHasVColors: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments(Standard_Integer theMaxVertexs, Standard_Integer theMaxEdges = 0, Standard_Boolean theHasVColors = Standard_False);

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
		/**** md5 signature: 3f7228ef3b65fc90c8bec18f0704c643 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "Creates an array of triangle fans (graphic3d_topa_trianglefans), a polygon can be filled as: 1) creating a single fan defined with his vertexes, i.e: @code myarray = graphic3d_arrayoftrianglefans (7); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x7, y7, z7); @endcode 2) creating separate fans defined with a predefined number of fans and the number of vertex per fan, i.e: @code myarray = graphic3d_arrayoftrianglefans (8, 2); myarray->addbound (4); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addbound (4); myarray->addvertex (x5, y5, z5); .... myarray->addvertex (x8, y8, z8); @endcode the number of triangle really drawn is: vertexnumber() - 2 * min(1, boundnumber()) @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxfans defines the maximum allowed fan number in the array @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxFans: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans(Standard_Integer theMaxVertexs, Standard_Integer theMaxFans, int theArrayFlags);

		/****************** Graphic3d_ArrayOfTriangleFans ******************/
		/**** md5 signature: e67f0dcb6454a6062a430efb34826659 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "Creates an array of triangle fans (graphic3d_topa_trianglefans). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxfans defines the maximum allowed fan number in the array.

Parameters
----------
theMaxVertexs: int
theMaxFans: int,optional
	default value is 0
theHasVNormals: bool,optional
	default value is Standard_False
theHasVColors: bool,optional
	default value is Standard_False
theHasBColors: bool,optional
	default value is Standard_False
theHasVTexels: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans(Standard_Integer theMaxVertexs, Standard_Integer theMaxFans = 0, Standard_Boolean theHasVNormals = Standard_False, Standard_Boolean theHasVColors = Standard_False, Standard_Boolean theHasBColors = Standard_False, Standard_Boolean theHasVTexels = Standard_False);

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
		/**** md5 signature: dd457b403c988dd009e1899bf7ea230b ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "Creates an array of triangle strips (graphic3d_topa_trianglestrips), a polygon can be filled as: 1) creating a single strip defined with his vertexes, i.e: @code myarray = graphic3d_arrayoftrianglestrips (7); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x7, y7, z7); @endcode 2) creating separate strips defined with a predefined number of strips and the number of vertex per strip, i.e: @code myarray = graphic3d_arrayoftrianglestrips (8, 2); myarray->addbound (4); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addbound (4); myarray->addvertex (x5, y5, z5); .... myarray->addvertex (x8, y8, z8); @endcode @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxstrips defines the maximum allowed strip number in the array;  the number of triangle really drawn is: vertexnumber() - 2 * min(1, boundnumber()) @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxStrips: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips(Standard_Integer theMaxVertexs, Standard_Integer theMaxStrips, int theArrayFlags);

		/****************** Graphic3d_ArrayOfTriangleStrips ******************/
		/**** md5 signature: 222b9b054008dbec147a724f1f116abb ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "Creates an array of triangle strips (graphic3d_topa_trianglestrips). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxstrips defines the maximum allowed strip number in the array;  the number of triangle really drawn is: vertexnumber() - 2 * min(1, boundnumber()) @param thehasvnormals when true, addvertex(point,normal), addvertex(point,normal,color) or addvertex(point,normal,texel) should be used to specify vertex normal;  vertex normals should be specified coherent to triangle orientation (defined by order of vertexes within triangle) for proper rendering @param thehasvcolors when true, addvertex(point,color) or addvertex(point,normal,color) should be used to specify vertex color @param thehasbcolors when true, addbound(number,color) should be used to specify sub-group color @param thehasvtexels when true, addvertex(point,texel) or addvertex(point,normal,texel) should be used to specify vertex uv coordinates.

Parameters
----------
theMaxVertexs: int
theMaxStrips: int,optional
	default value is 0
theHasVNormals: bool,optional
	default value is Standard_False
theHasVColors: bool,optional
	default value is Standard_False
theHasBColors: bool,optional
	default value is Standard_False
theHasVTexels: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips(Standard_Integer theMaxVertexs, Standard_Integer theMaxStrips = 0, Standard_Boolean theHasVNormals = Standard_False, Standard_Boolean theHasVColors = Standard_False, Standard_Boolean theHasBColors = Standard_False, Standard_Boolean theHasVTexels = Standard_False);

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
		/**** md5 signature: 09576520473edff92dc5aa14f5a2840c ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "Creates an array of triangles (graphic3d_topa_triangles), a triangle can be filled as: 1) creating a set of triangles defined with his vertexes, i.e: @code myarray = graphic3d_arrayoftriangles (6); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x6, y6, z6); @endcode 3) creating a set of indexed triangles defined with his vertex and edges, i.e: @code myarray = graphic3d_arrayoftriangles (4, 6); myarray->addvertex (x1, y1, z1); .... myarray->addvertex (x4, y4, z4); myarray->addedges (1, 2, 3); myarray->addedges (2, 3, 4); @endcode @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxedges defines the maximum allowed edge number in the array @param thearrayflags array flags.

Parameters
----------
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Returns
-------
None
") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles(Standard_Integer theMaxVertexs, Standard_Integer theMaxEdges, int theArrayFlags);

		/****************** Graphic3d_ArrayOfTriangles ******************/
		/**** md5 signature: 25029d6215f24644ca66e88a3e052eb7 ****/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "Creates an array of triangles (graphic3d_topa_triangles). @param themaxvertexs defines the maximum allowed vertex number in the array @param themaxedges defines the maximum allowed edge number in the array @param thehasvnormals when true, addvertex(point,normal), addvertex(point,normal,color) or addvertex(point,normal,texel) should be used to specify vertex normal;  vertex normals should be specified coherent to triangle orientation (defined by order of vertexes within triangle) for proper rendering @param thehasvcolors when true, addvertex(point,color) or addvertex(point,normal,color) should be used to specify vertex color @param thehasvtexels when true, addvertex(point,texel) or addvertex(point,normal,texel) should be used to specify vertex uv coordinates.

Parameters
----------
theMaxVertexs: int
theMaxEdges: int,optional
	default value is 0
theHasVNormals: bool,optional
	default value is Standard_False
theHasVColors: bool,optional
	default value is Standard_False
theHasVTexels: bool,optional
	default value is Standard_False

Returns
-------
None
") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles(Standard_Integer theMaxVertexs, Standard_Integer theMaxEdges = 0, Standard_Boolean theHasVNormals = Standard_False, Standard_Boolean theHasVColors = Standard_False, Standard_Boolean theHasVTexels = Standard_False);

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
		/****************** Graphic3d_AspectFillArea3d ******************/
		/**** md5 signature: fc9693ef99225219e1bd8c3ab519d2a4 ****/
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "Creates a context table for fill area primitives defined with the following default values: //! interiorstyle : aspect_is_empty interiorcolor : quantity_noc_cyan1 edgecolor : quantity_noc_white edgelinetype : aspect_tol_solid edgewidth : 1.0 frontmaterial : nom_brass backmaterial : nom_brass hatchstyle : aspect_hs_solid //! display of back-facing filled polygons. no distinction between external and internal faces of fillareas. the edges are not drawn. polygon offset parameters: mode = aspect_pom_none, factor = 1., units = 0.

Returns
-------
None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d();

		/****************** Graphic3d_AspectFillArea3d ******************/
		/**** md5 signature: 6b91accbdda8840fff2de72ceb656a94 ****/
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "Creates a context table for fill area primitives defined with the specified values. display of back-facing filled polygons. no distinction between external and internal faces of fillareas. the edges are not drawn. polygon offset parameters: mode = aspect_pom_none, factor = 1., units = 0.

Parameters
----------
theInterior: Aspect_InteriorStyle
theInteriorColor: Quantity_Color
theEdgeColor: Quantity_Color
theEdgeLineType: Aspect_TypeOfLine
theEdgeWidth: float
theFrontMaterial: Graphic3d_MaterialAspect
theBackMaterial: Graphic3d_MaterialAspect

Returns
-------
None
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d(const Aspect_InteriorStyle theInterior, const Quantity_Color & theInteriorColor, const Quantity_Color & theEdgeColor, const Aspect_TypeOfLine theEdgeLineType, const Standard_Real theEdgeWidth, const Graphic3d_MaterialAspect & theFrontMaterial, const Graphic3d_MaterialAspect & theBackMaterial);

		/****************** Edge ******************/
		/**** md5 signature: f282c08249e0c353d7b7113fe2375737 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Edge;
		bool Edge();

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
		/**** md5 signature: ae16253e3fb05b880b08c284f9894b56 ****/
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "Creates a context table for line primitives defined with the following default values: //! color = quantity_noc_yellow; type = aspect_tol_solid; width = 1.0;.

Returns
-------
None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d();

		/****************** Graphic3d_AspectLine3d ******************/
		/**** md5 signature: 738ef8d7f293046a9cd124a0ca5f3679 ****/
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "Creates a context table for line primitives defined with the specified values. warning: thewidth is the 'line width scale factor'. the nominal line width is 1 pixel. the width of the line is determined by applying the line width scale factor to this nominal line width. the supported line widths vary by 1-pixel units.

Parameters
----------
theColor: Quantity_Color
theType: Aspect_TypeOfLine
theWidth: float

Returns
-------
None
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d(const Quantity_Color & theColor, Aspect_TypeOfLine theType, Standard_Real theWidth);

		/****************** SetType ******************/
		/**** md5 signature: 1258fda167a7e43236300c87e492edae ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Modifies the type of line.

Parameters
----------
theType: Aspect_TypeOfLine

Returns
-------
None
") SetType;
		void SetType(const Aspect_TypeOfLine theType);

		/****************** SetWidth ******************/
		/**** md5 signature: a388bd43f011bc773d8da404945719b5 ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Modifies the line thickness. warning: raises standard_outofrange if the width is a negative value.

Parameters
----------
theWidth: float

Returns
-------
None
") SetWidth;
		void SetWidth(const Standard_Real theWidth);

		/****************** SetWidth ******************/
		/**** md5 signature: b1510877c180282274c63236776cd180 ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Modifies the line thickness. warning: raises standard_outofrange if the width is a negative value.

Parameters
----------
theWidth: Standard_ShortReal

Returns
-------
None
") SetWidth;
		void SetWidth(Standard_ShortReal theWidth);

		/****************** Type ******************/
		/**** md5 signature: 69333bf72673a8c7a5413520ea633cca ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return line type.

Returns
-------
Aspect_TypeOfLine
") Type;
		Aspect_TypeOfLine Type();

		/****************** Width ******************/
		/**** md5 signature: 31e04bb147ff1c492115f0ced1ab0e7a ****/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return line width.

Returns
-------
Standard_ShortReal
") Width;
		Standard_ShortReal Width();

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
		/****************** Graphic3d_AspectMarker3d ******************/
		/**** md5 signature: c51eae27bcfca01452a3972b6341bd3a ****/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "Creates a context table for marker primitives defined with the following default values: //! marker type : tom_x color : yellow scale factor: 1.0.

Returns
-------
None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d();

		/****************** Graphic3d_AspectMarker3d ******************/
		/**** md5 signature: 158ad3b17f8d5f5276bb4394e35d5687 ****/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
theType: Aspect_TypeOfMarker
theColor: Quantity_Color
theScale: float

Returns
-------
None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d(const Aspect_TypeOfMarker theType, const Quantity_Color & theColor, const Standard_Real theScale);

		/****************** Graphic3d_AspectMarker3d ******************/
		/**** md5 signature: f9ef89cda276ebb2df53a7a8df36d6b1 ****/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "Creates a context table for marker primitives defined with the specified values.

Parameters
----------
theColor: Quantity_Color
theWidth: int
theHeight: int
theTextureBitmap: TColStd_HArray1OfByte

Returns
-------
None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d(const Quantity_Color & theColor, const Standard_Integer theWidth, const Standard_Integer theHeight, const opencascade::handle<TColStd_HArray1OfByte> & theTextureBitmap);

		/****************** Graphic3d_AspectMarker3d ******************/
		/**** md5 signature: 19dbb9e9a8dcd21db65647860865917a ****/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "Creates a context table for marker primitives defined with the specified values.

Parameters
----------
theTextureImage: Image_PixMap

Returns
-------
None
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d(const opencascade::handle<Image_PixMap> & theTextureImage);

		/****************** GetMarkerImage ******************/
		/**** md5 signature: b7168bb49cffd5553e6520fc754c4a1b ****/
		%feature("compactdefaultargs") GetMarkerImage;
		%feature("autodoc", "Returns marker's image texture. could be null handle if marker aspect has been initialized as default type of marker.

Returns
-------
opencascade::handle<Graphic3d_MarkerImage>
") GetMarkerImage;
		const opencascade::handle<Graphic3d_MarkerImage> & GetMarkerImage();

		/****************** GetTextureSize ******************/
		/**** md5 signature: 613d235550caf2f8304bcaae6f035920 ****/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "Returns marker's texture size.

Parameters
----------

Returns
-------
theWidth: int
theHeight: int
") GetTextureSize;
		void GetTextureSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Scale ******************/
		/**** md5 signature: b4ceb05c3d88f9721cfe708d9e1f5a31 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return scale factor.

Returns
-------
Standard_ShortReal
") Scale;
		Standard_ShortReal Scale();

		/****************** SetBitMap ******************/
		/**** md5 signature: 97ea5c70d7a586d522536650f8323bab ****/
		%feature("compactdefaultargs") SetBitMap;
		%feature("autodoc", "No available documentation.

Parameters
----------
theWidth: int
theHeight: int
theTexture: TColStd_HArray1OfByte

Returns
-------
None
") SetBitMap;
		void SetBitMap(const Standard_Integer theWidth, const Standard_Integer theHeight, const opencascade::handle<TColStd_HArray1OfByte> & theTexture);

		/****************** SetScale ******************/
		/**** md5 signature: 33c64129c52c27576265502678977122 ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Modifies the scale factor. marker type aspect_tom_point is not affected by the marker size scale factor. it is always the smallest displayable dot. warning: raises standard_outofrange if the scale is a negative value.

Parameters
----------
theScale: Standard_ShortReal

Returns
-------
None
") SetScale;
		void SetScale(const Standard_ShortReal theScale);

		/****************** SetScale ******************/
		/**** md5 signature: 85c1419c4c5459593a06ce585a34394d ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Assign scale factor.

Parameters
----------
theScale: float

Returns
-------
None
") SetScale;
		void SetScale(const Standard_Real theScale);

		/****************** SetType ******************/
		/**** md5 signature: 01912a20786b2b3a7afea3ef50011de0 ****/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Modifies the type of marker.

Parameters
----------
theType: Aspect_TypeOfMarker

Returns
-------
None
") SetType;
		void SetType(const Aspect_TypeOfMarker theType);

		/****************** Type ******************/
		/**** md5 signature: aec8d966145097ca0717d502ba9f44da ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return marker type.

Returns
-------
Aspect_TypeOfMarker
") Type;
		Aspect_TypeOfMarker Type();

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
		/****************** Graphic3d_AspectText3d ******************/
		/**** md5 signature: d9ab7314327e2d2b23b642cf8f21fef9 ****/
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "Creates a context table for text primitives defined with the following default values: color : quantity_noc_yellow font : font_nof_ascii_mono the style : aspect_tost_normal the display type : aspect_todt_normal.

Returns
-------
None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d();

		/****************** Graphic3d_AspectText3d ******************/
		/**** md5 signature: 82c469f1309f271996da93b40eaa1ded ****/
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "Creates a context table for text primitives defined with the specified values. @param thecolor [in] text color @param thefont [in] font family name or alias like font_nof_ascii_mono @param theexpansionfactor [in] deprecated parameter, has no effect @param thespace [in] deprecated parameter, has no effect @param thestyle [in] font style @param thedisplaytype [in] display mode.

Parameters
----------
theColor: Quantity_Color
theFont: char *
theExpansionFactor: float
theSpace: float
theStyle: Aspect_TypeOfStyleText,optional
	default value is Aspect_TOST_NORMAL
theDisplayType: Aspect_TypeOfDisplayText,optional
	default value is Aspect_TODT_NORMAL

Returns
-------
None
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d(const Quantity_Color & theColor, const char * theFont, Standard_Real theExpansionFactor, Standard_Real theSpace, Aspect_TypeOfStyleText theStyle = Aspect_TOST_NORMAL, Aspect_TypeOfDisplayText theDisplayType = Aspect_TODT_NORMAL);

		/****************** Color ******************/
		/**** md5 signature: 7cec116411eb20e52d1fabf3015346da ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return the text color.

Returns
-------
Quantity_Color
") Color;
		const Quantity_Color & Color();

		/****************** ColorRGBA ******************/
		/**** md5 signature: 615b6d48d8bc4764a07d0e2ff837764b ****/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "Return the text color.

Returns
-------
Quantity_ColorRGBA
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA();

		/****************** DisplayType ******************/
		/**** md5 signature: 041325771462897bef38e38a8d051921 ****/
		%feature("compactdefaultargs") DisplayType;
		%feature("autodoc", "Return display type.

Returns
-------
Aspect_TypeOfDisplayText
") DisplayType;
		Aspect_TypeOfDisplayText DisplayType();

		/****************** Font ******************/
		/**** md5 signature: 246154ff4659a4acf077229295e5855e ****/
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "Return the font.

Returns
-------
TCollection_AsciiString
") Font;
		const TCollection_AsciiString & Font();

		/****************** GetTextAngle ******************/
		/**** md5 signature: b315e51286635e62f20ccde3a9d86b97 ****/
		%feature("compactdefaultargs") GetTextAngle;
		%feature("autodoc", "Returns angle of degree.

Returns
-------
Standard_ShortReal
") GetTextAngle;
		Standard_ShortReal GetTextAngle();

		/****************** GetTextFontAspect ******************/
		/**** md5 signature: 4cd71b07b0ec9eb017ea12670bda379e ****/
		%feature("compactdefaultargs") GetTextFontAspect;
		%feature("autodoc", "Returns text fontaspect.

Returns
-------
Font_FontAspect
") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect();

		/****************** GetTextZoomable ******************/
		/**** md5 signature: 47c9fd4a0ce90ee835f95292957687a7 ****/
		%feature("compactdefaultargs") GetTextZoomable;
		%feature("autodoc", "Returns true when the text zoomable is on.

Returns
-------
bool
") GetTextZoomable;
		bool GetTextZoomable();

		/****************** SetColor ******************/
		/**** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Modifies the color.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****************** SetColor ******************/
		/**** md5 signature: 4dd7c6505348ed91f3ee5831c87631e8 ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Modifies the color.

Parameters
----------
theColor: Quantity_ColorRGBA

Returns
-------
None
") SetColor;
		void SetColor(const Quantity_ColorRGBA & theColor);

		/****************** SetDisplayType ******************/
		/**** md5 signature: d72cac4cee8a504e1c4b2e47a848e48c ****/
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "Define the display type of the text.

Parameters
----------
theDisplayType: Aspect_TypeOfDisplayText

Returns
-------
None
") SetDisplayType;
		void SetDisplayType(Aspect_TypeOfDisplayText theDisplayType);

		/****************** SetFont ******************/
		/**** md5 signature: 7f2969793d80ece6d22485bcb15f06b4 ****/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "Modifies the font.

Parameters
----------
theFont: TCollection_AsciiString

Returns
-------
None
") SetFont;
		void SetFont(const TCollection_AsciiString & theFont);

		/****************** SetFont ******************/
		/**** md5 signature: 61d12f4a548c85ea1d3fd6a76e34b6f6 ****/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "Modifies the font.

Parameters
----------
theFont: char *

Returns
-------
None
") SetFont;
		void SetFont(const char * theFont);

		/****************** SetStyle ******************/
		/**** md5 signature: 79f0871ccb7f1986360bdd74fe84ff94 ****/
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "Modifies the style of the text.

Parameters
----------
theStyle: Aspect_TypeOfStyleText

Returns
-------
None
") SetStyle;
		void SetStyle(Aspect_TypeOfStyleText theStyle);

		/****************** SetTextAngle ******************/
		/**** md5 signature: fc0c098fc733d21359076cebc1de4918 ****/
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "Turns usage of text rotated.

Parameters
----------
theAngle: float

Returns
-------
None
") SetTextAngle;
		void SetTextAngle(const Standard_Real theAngle);

		/****************** Style ******************/
		/**** md5 signature: e2414cb4ef0eae6c2683ae26a37cf27b ****/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "Return the text style.

Returns
-------
Aspect_TypeOfStyleText
") Style;
		Aspect_TypeOfStyleText Style();

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
		/**** md5 signature: ef37a99e8ced63b1b1500bcd9e77ee57 ****/
		%feature("compactdefaultargs") Graphic3d_AttribBuffer;
		%feature("autodoc", "Empty constructor.

Parameters
----------
theAlloc: NCollection_BaseAllocator

Returns
-------
None
") Graphic3d_AttribBuffer;
		 Graphic3d_AttribBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** Init ******************/
		/**** md5 signature: efd8f630ef313a60a30b451800660618 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Allocates new empty array.

Parameters
----------
theNbElems: int
theAttribs: Graphic3d_Attribute *
theNbAttribs: int

Returns
-------
bool
") Init;
		bool Init(const Standard_Integer theNbElems, const Graphic3d_Attribute * theAttribs, const Standard_Integer theNbAttribs);

		/****************** Init ******************/
		/**** md5 signature: 3686a62adfda09716233ac96d4580561 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Allocates new empty array.

Parameters
----------
theNbElems: int
theAttribs: Graphic3d_Array1OfAttribute

Returns
-------
bool
") Init;
		bool Init(const Standard_Integer theNbElems, const Graphic3d_Array1OfAttribute & theAttribs);

		/****************** Invalidate ******************/
		/**** md5 signature: 5fa41df075457f024f8e1ad188e9c543 ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidate the entire buffer data.

Returns
-------
None
") Invalidate;
		virtual void Invalidate();

		/****************** Invalidate ******************/
		/**** md5 signature: ec3013667242ba75bc5251cc640927ce ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidate the entire attribute data.

Parameters
----------
theAttributeIndex: int

Returns
-------
None
") Invalidate;
		void Invalidate(Standard_Integer theAttributeIndex);

		/****************** Invalidate ******************/
		/**** md5 signature: 7b6607c72ab9b0722bf33feb2ca8f23c ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidate attribute data within specified sub-range (starting from 0).

Parameters
----------
theAttributeIndex: int
theVertexLower: int
theVertexUpper: int

Returns
-------
None
") Invalidate;
		void Invalidate(Standard_Integer theAttributeIndex, Standard_Integer theVertexLower, Standard_Integer theVertexUpper);

		/****************** Invalidate ******************/
		/**** md5 signature: a138322d465e7bebd22ffe0eb2ebc740 ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidate all attribute data within specified vertex sub-range (starting from 0).

Parameters
----------
theVertexLower: int
theVertexUpper: int

Returns
-------
None
") Invalidate;
		void Invalidate(Standard_Integer theVertexLower, Standard_Integer theVertexUpper);

		/****************** InvalidatedRange ******************/
		/**** md5 signature: 1765d375955ded2f60eeea3cf03bf4f5 ****/
		%feature("compactdefaultargs") InvalidatedRange;
		%feature("autodoc", "Return invalidated range.

Returns
-------
Graphic3d_BufferRange
") InvalidatedRange;
		virtual Graphic3d_BufferRange InvalidatedRange();

		/****************** IsInterleaved ******************/
		/**** md5 signature: 24b2daa7a9774fbc2d204a2305a8d70e ****/
		%feature("compactdefaultargs") IsInterleaved;
		%feature("autodoc", "Return true for interleaved array; true by default.

Returns
-------
bool
") IsInterleaved;
		virtual Standard_Boolean IsInterleaved();

		/****************** IsMutable ******************/
		/**** md5 signature: 0a65ba39d455381471f162d17685710f ****/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Return true if data can be invalidated; false by default.

Returns
-------
bool
") IsMutable;
		virtual Standard_Boolean IsMutable();

		/****************** SetInterleaved ******************/
		/**** md5 signature: 11f6f819b808e977ca0d4b17a552cf01 ****/
		%feature("compactdefaultargs") SetInterleaved;
		%feature("autodoc", "Setup interleaved/non-interleaved array. warning! filling non-interleaved buffer should be implemented on user side without graphic3d_buffer auxiliary methods designed for interleaved data.

Parameters
----------
theIsInterleaved: bool

Returns
-------
None
") SetInterleaved;
		void SetInterleaved(Standard_Boolean theIsInterleaved);

		/****************** SetMutable ******************/
		/**** md5 signature: f43b6d10e772d092b660f3e185275e03 ****/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "Set if data can be invalidated.

Parameters
----------
theMutable: bool

Returns
-------
None
") SetMutable;
		void SetMutable(Standard_Boolean theMutable);

		/****************** Validate ******************/
		/**** md5 signature: c7581a0f47fe76012f2b11e6385e07da ****/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "Reset invalidated range.

Returns
-------
None
") Validate;
		virtual void Validate();

		/****************** invalidate ******************/
		/**** md5 signature: a9dd52496baf9a9923d231297af5db43 ****/
		%feature("compactdefaultargs") invalidate;
		%feature("autodoc", "Invalidate specified sub-range of data (as byte offsets).

Parameters
----------
theRange: Graphic3d_BufferRange

Returns
-------
None
") invalidate;
		void invalidate(const Graphic3d_BufferRange & theRange);

};


%extend Graphic3d_AttribBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Graphic3d_CView *
************************/
%nodefaultctor Graphic3d_CView;
class Graphic3d_CView : public Graphic3d_DataStructureManager {
	public:
		/****************** Activate ******************/
		/**** md5 signature: 7e7c8b081c69288260a14e2e3cd963e1 ****/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Activates the view. maps presentations defined within structure manager onto this view.

Returns
-------
None
") Activate;
		virtual void Activate();

		/****************** BackfacingModel ******************/
		/**** md5 signature: 4f12d3250ea3572ea3eb38843df0672b ****/
		%feature("compactdefaultargs") BackfacingModel;
		%feature("autodoc", "Return backfacing model used for the view.

Returns
-------
Graphic3d_TypeOfBackfacingModel
") BackfacingModel;
		virtual Graphic3d_TypeOfBackfacingModel BackfacingModel();

		/****************** Background ******************/
		/**** md5 signature: c0f5419b36969bcbaab4d536acce707c ****/
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "Returns background fill color.

Returns
-------
Aspect_Background
") Background;
		virtual Aspect_Background Background();

		/****************** BackgroundCubeMap ******************/
		/**** md5 signature: 17051b4825bcccdc97c3248895fbfcff ****/
		%feature("compactdefaultargs") BackgroundCubeMap;
		%feature("autodoc", "Returns cubemap being setted last time on background.

Returns
-------
opencascade::handle<Graphic3d_CubeMap>
") BackgroundCubeMap;
		virtual opencascade::handle<Graphic3d_CubeMap> BackgroundCubeMap();

		/****************** BackgroundImage ******************/
		/**** md5 signature: f2ebba506d25c0200bc338a1837e8138 ****/
		%feature("compactdefaultargs") BackgroundImage;
		%feature("autodoc", "Returns background image texture file path.

Returns
-------
TCollection_AsciiString
") BackgroundImage;
		virtual TCollection_AsciiString BackgroundImage();

		/****************** BackgroundImageStyle ******************/
		/**** md5 signature: 9774e4b7f39a9586153cd8d1fad543ea ****/
		%feature("compactdefaultargs") BackgroundImageStyle;
		%feature("autodoc", "Returns background image fill style.

Returns
-------
Aspect_FillMethod
") BackgroundImageStyle;
		virtual Aspect_FillMethod BackgroundImageStyle();

		/****************** BufferDump ******************/
		/**** md5 signature: 716004d6a0bd1ac5e5aa64dd37c87b9e ****/
		%feature("compactdefaultargs") BufferDump;
		%feature("autodoc", "Dump active rendering buffer into specified memory buffer.

Parameters
----------
theImage: Image_PixMap
theBufferType: Graphic3d_BufferType

Returns
-------
bool
") BufferDump;
		virtual Standard_Boolean BufferDump(Image_PixMap & theImage, const Graphic3d_BufferType & theBufferType);

		/****************** Camera ******************/
		/**** md5 signature: 3a44fb060baf8f0e6a9e5b1a88974560 ****/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Returns camera object of the view.

Returns
-------
opencascade::handle<Graphic3d_Camera>
") Camera;
		virtual const opencascade::handle<Graphic3d_Camera> & Camera();

		/****************** ChangeHiddenObjects ******************/
		/**** md5 signature: 819ca3157a6786ec944f8f7d92ec9a7d ****/
		%feature("compactdefaultargs") ChangeHiddenObjects;
		%feature("autodoc", "Returns map of objects hidden within this specific view (not viewer-wise).

Returns
-------
opencascade::handle<Graphic3d_NMapOfTransient>
") ChangeHiddenObjects;
		opencascade::handle<Graphic3d_NMapOfTransient> & ChangeHiddenObjects();

		/****************** ChangeRenderingParams ******************/
		/**** md5 signature: 2930edc0d67ff31509e235f7390593e4 ****/
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "Returns reference to current rendering parameters and effect settings.

Returns
-------
Graphic3d_RenderingParams
") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams();

		/****************** ClipPlanes ******************/
		/**** md5 signature: 5b56a7bba4df7465362e074ad237bc00 ****/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Returns list of clip planes set for the view.

Returns
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ClipPlanes;
		virtual const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****************** Compute ******************/
		/**** md5 signature: 3472bca0870d21fcbdb4784495b49568 ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes the new presentation of the structures displayed in this view with the type graphic3d_tos_computed.

Returns
-------
None
") Compute;
		void Compute();

		/****************** ComputedMode ******************/
		/**** md5 signature: 47a490ca5aa934708fe6a7c8b60e9268 ****/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "Returns the computed hlr mode state.

Returns
-------
bool
") ComputedMode;
		Standard_Boolean ComputedMode();

		/****************** ConsiderZoomPersistenceObjects ******************/
		/**** md5 signature: 517e2d477f182b4d19d02e051688f6b4 ****/
		%feature("compactdefaultargs") ConsiderZoomPersistenceObjects;
		%feature("autodoc", "Returns zoom-scale factor.

Returns
-------
float
") ConsiderZoomPersistenceObjects;
		Standard_Real ConsiderZoomPersistenceObjects();

		/****************** ContainsFacet ******************/
		/**** md5 signature: c53b95b374faa3dd56807af9cbf654ce ****/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "Returns standard_true if one of the structures displayed in the view contains polygons, triangles or quadrangles.

Returns
-------
bool
") ContainsFacet;
		Standard_Boolean ContainsFacet();

		/****************** ContainsFacet ******************/
		/**** md5 signature: 228771deab60c4d5474dc8500325b37b ****/
		%feature("compactdefaultargs") ContainsFacet;
		%feature("autodoc", "Returns standard_true if one of the structures in the set contains polygons, triangles or quadrangles.

Parameters
----------
theSet: Graphic3d_MapOfStructure

Returns
-------
bool
") ContainsFacet;
		Standard_Boolean ContainsFacet(const Graphic3d_MapOfStructure & theSet);

		/****************** CopySettings ******************/
		/**** md5 signature: 4026fe6fd42530f6aedac7fd6bd368b1 ****/
		%feature("compactdefaultargs") CopySettings;
		%feature("autodoc", "Copy visualization settings from another view. method is used for cloning views in viewer when its required to create view with same view properties.

Parameters
----------
theOther: Graphic3d_CView

Returns
-------
None
") CopySettings;
		virtual void CopySettings(const opencascade::handle<Graphic3d_CView> & theOther);

		/****************** Deactivate ******************/
		/**** md5 signature: 884a7db0d96bdb6edb481d4f62218aaf ****/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Deactivates the view. unmaps presentations defined within structure manager. the view in deactivated state will ignore actions on structures such as display().

Returns
-------
None
") Deactivate;
		virtual void Deactivate();

		/****************** DiagnosticInformation ******************/
		/**** md5 signature: da095c0cd0b5dfa1d87dd0c32f1ccf9e ****/
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "Fill in the dictionary with diagnostic info. should be called within rendering thread. //! this api should be used only for user output or for creating automated reports. the format of returned information (e.g. key-value layout) is not part of this api and can be changed at any time. thus application should not parse returned information to weed out specific parameters.

Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString
theFlags: Graphic3d_DiagnosticInfo

Returns
-------
None
") DiagnosticInformation;
		virtual void DiagnosticInformation(TColStd_IndexedDataMapOfStringString & theDict, Graphic3d_DiagnosticInfo theFlags);

		/****************** DisplayedStructures ******************/
		/**** md5 signature: 86236884b0a7239a666185096566b138 ****/
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "Returns the set of structures displayed in this view.

Parameters
----------
theStructures: Graphic3d_MapOfStructure

Returns
-------
None
") DisplayedStructures;
		void DisplayedStructures(Graphic3d_MapOfStructure & theStructures);

		/****************** FBO ******************/
		/**** md5 signature: 5e8daf4b78cdbaaa4589b241d71103f7 ****/
		%feature("compactdefaultargs") FBO;
		%feature("autodoc", "Returns pointer to an assigned framebuffer object.

Returns
-------
opencascade::handle<Standard_Transient>
") FBO;
		virtual opencascade::handle<Standard_Transient> FBO();

		/****************** FBOChangeViewport ******************/
		/**** md5 signature: 6a8026d7a7e417578b8a57b73a445662 ****/
		%feature("compactdefaultargs") FBOChangeViewport;
		%feature("autodoc", "Change offscreen fbo viewport.

Parameters
----------
theFbo: Standard_Transient
theWidth: int
theHeight: int

Returns
-------
None
") FBOChangeViewport;
		virtual void FBOChangeViewport(const opencascade::handle<Standard_Transient> & theFbo, const Standard_Integer theWidth, const Standard_Integer theHeight);

		/****************** FBOCreate ******************/
		/**** md5 signature: 4cb62cd5199a422d9b597aef75098329 ****/
		%feature("compactdefaultargs") FBOCreate;
		%feature("autodoc", "Generate offscreen fbo in the graphic library. if not supported on hardware returns null.

Parameters
----------
theWidth: int
theHeight: int

Returns
-------
opencascade::handle<Standard_Transient>
") FBOCreate;
		virtual opencascade::handle<Standard_Transient> FBOCreate(const Standard_Integer theWidth, const Standard_Integer theHeight);

		/****************** FBOGetDimensions ******************/
		/**** md5 signature: 9608c0fe7ac03d251e04b595d019afb9 ****/
		%feature("compactdefaultargs") FBOGetDimensions;
		%feature("autodoc", "Read offscreen fbo configuration.

Parameters
----------
theFbo: Standard_Transient

Returns
-------
theWidth: int
theHeight: int
theWidthMax: int
theHeightMax: int
") FBOGetDimensions;
		virtual void FBOGetDimensions(const opencascade::handle<Standard_Transient> & theFbo, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** FBORelease ******************/
		/**** md5 signature: 44c6f29e61488023133cd287c55a3837 ****/
		%feature("compactdefaultargs") FBORelease;
		%feature("autodoc", "Remove offscreen fbo from the graphic library.

Parameters
----------
theFbo: Standard_Transient

Returns
-------
None
") FBORelease;
		virtual void FBORelease(opencascade::handle<Standard_Transient> & theFbo);

		/****************** GetGraduatedTrihedron ******************/
		/**** md5 signature: f68dfc8ae14469bea2db4aa0eff51178 ****/
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "Returns data of a graduated trihedron.

Returns
-------
Graphic3d_GraduatedTrihedron
") GetGraduatedTrihedron;
		virtual const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron();

		/****************** GradientBackground ******************/
		/**** md5 signature: 860c66cfd19114f1764c97d887bff69f ****/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "Returns gradient background fill colors.

Returns
-------
Aspect_GradientBackground
") GradientBackground;
		virtual Aspect_GradientBackground GradientBackground();

		/****************** GraduatedTrihedronDisplay ******************/
		/**** md5 signature: 1857c6cf14b31109b498769c67b0bbf5 ****/
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "Displays graduated trihedron.

Parameters
----------
theTrihedronData: Graphic3d_GraduatedTrihedron

Returns
-------
None
") GraduatedTrihedronDisplay;
		virtual void GraduatedTrihedronDisplay(const Graphic3d_GraduatedTrihedron & theTrihedronData);

		/****************** GraduatedTrihedronErase ******************/
		/**** md5 signature: 6d8f0387a39ea0593d498b477b7b4924 ****/
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "Erases graduated trihedron.

Returns
-------
None
") GraduatedTrihedronErase;
		virtual void GraduatedTrihedronErase();

		/****************** GraduatedTrihedronMinMaxValues ******************/
		/**** md5 signature: 5d5f09a8a1541444dc42103b4da3297a ****/
		%feature("compactdefaultargs") GraduatedTrihedronMinMaxValues;
		%feature("autodoc", "Sets minimum and maximum points of scene bounding box for graduated trihedron stored in graphic view object. @param themin [in] the minimum point of scene. @param themax [in] the maximum point of scene.

Parameters
----------
theMin: Graphic3d_Vec3
theMax: Graphic3d_Vec3

Returns
-------
None
") GraduatedTrihedronMinMaxValues;
		virtual void GraduatedTrihedronMinMaxValues(const Graphic3d_Vec3 theMin, const Graphic3d_Vec3 theMax);

		/****************** HiddenObjects ******************/
		/**** md5 signature: fcbd2338fa9c064c023e0aee2e8c9753 ****/
		%feature("compactdefaultargs") HiddenObjects;
		%feature("autodoc", "Returns map of objects hidden within this specific view (not viewer-wise).

Returns
-------
opencascade::handle<Graphic3d_NMapOfTransient>
") HiddenObjects;
		const opencascade::handle<Graphic3d_NMapOfTransient> & HiddenObjects();

		/****************** Identification ******************/
		/**** md5 signature: f18c91e46c1b20a4777abd8f80b5550f ****/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Returns the identification number of the view.

Returns
-------
int
") Identification;
		Standard_Integer Identification();

		/****************** InsertLayerAfter ******************/
		/**** md5 signature: cd9549addd4543aedd353e8c4428d456 ****/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "Add a layer to the view. @param thenewlayerid [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param thesettings [in] new layer settings @param thelayerbefore [in] id of layer to append new layer after.

Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerBefore: int

Returns
-------
None
") InsertLayerAfter;
		virtual void InsertLayerAfter(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerBefore);

		/****************** InsertLayerBefore ******************/
		/**** md5 signature: 9598fd696d1336a754aefafafac0a974 ****/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "Add a layer to the view. @param thenewlayerid [in] id of new layer, should be > 0 (negative values are reserved for default layers). @param thesettings [in] new layer settings @param thelayerafter [in] id of layer to append new layer before.

Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerAfter: int

Returns
-------
None
") InsertLayerBefore;
		virtual void InsertLayerBefore(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerAfter);

		/****************** Invalidate ******************/
		/**** md5 signature: 0d262fd592615fabc45f7dcd58c1a952 ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidates content of the view but does not redraw it.

Returns
-------
None
") Invalidate;
		virtual void Invalidate();

		/****************** InvalidateBVHData ******************/
		/**** md5 signature: ae791789e23a7abf5abac66c4f52eb7b ****/
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "Marks bvh tree and the set of bvh primitives of correspondent priority list with id thelayerid as outdated.

Parameters
----------
theLayerId: int

Returns
-------
None
") InvalidateBVHData;
		virtual void InvalidateBVHData(int theLayerId);

		/****************** InvalidateZLayerBoundingBox ******************/
		/**** md5 signature: 64b6a380e8baca315ec3508262f94c43 ****/
		%feature("compactdefaultargs") InvalidateZLayerBoundingBox;
		%feature("autodoc", "Returns the bounding box of all structures displayed in the z layer.

Parameters
----------
theLayerId: int

Returns
-------
None
") InvalidateZLayerBoundingBox;
		virtual void InvalidateZLayerBoundingBox(int theLayerId);

		/****************** IsActive ******************/
		/**** md5 signature: 1430a89053d4b0413f25b185201efe70 ****/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Returns the activity flag of the view.

Returns
-------
bool
") IsActive;
		Standard_Boolean IsActive();

		/****************** IsComputed ******************/
		/**** md5 signature: 3a53e61165b8b2a3e53d2934d0813196 ****/
		%feature("compactdefaultargs") IsComputed;
		%feature("autodoc", "Returns standard_true in case if the structure with the given <thestructid> is in list of structures to be computed and stores computed struct to <thecomputedstruct>.

Parameters
----------
theStructId: int
theComputedStruct: Graphic3d_Structure

Returns
-------
bool
") IsComputed;
		Standard_Boolean IsComputed(const Standard_Integer theStructId, opencascade::handle<Graphic3d_Structure> & theComputedStruct);

		/****************** IsDefined ******************/
		/**** md5 signature: 53efe3fde1dfd0e608676fdf7684ec59 ****/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "Returns true if the window associated to the view is defined.

Returns
-------
bool
") IsDefined;
		virtual Standard_Boolean IsDefined();

		/****************** IsInvalidated ******************/
		/**** md5 signature: 0566439ede2ceedb1e26d13d1e8f7d9d ****/
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "Return true if view content cache has been invalidated.

Returns
-------
bool
") IsInvalidated;
		virtual Standard_Boolean IsInvalidated();

		/****************** IsRemoved ******************/
		/**** md5 signature: 11569d63b02751ba09069246971eb4d4 ****/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "Returns true if the view was removed.

Returns
-------
bool
") IsRemoved;
		Standard_Boolean IsRemoved();

		/****************** Layer ******************/
		/**** md5 signature: 98e13d408eec5014ccb45661ed58591c ****/
		%feature("compactdefaultargs") Layer;
		%feature("autodoc", "Returns layer with given id or null if undefined.

Parameters
----------
theLayerId: int

Returns
-------
opencascade::handle<Graphic3d_Layer>
") Layer;
		virtual opencascade::handle<Graphic3d_Layer> Layer(int theLayerId);

		/****************** Layers ******************/
		/**** md5 signature: 1e44473170da77295f9e9d0552ecdd21 ****/
		%feature("compactdefaultargs") Layers;
		%feature("autodoc", "Returns the list of layers.

Returns
-------
NCollection_List<opencascade::handle<Graphic3d_Layer>>
") Layers;
		virtual const NCollection_List<opencascade::handle<Graphic3d_Layer>> & Layers();

		/****************** Lights ******************/
		/**** md5 signature: 1a679ee088dc3706926637bb7a9e9e5d ****/
		%feature("compactdefaultargs") Lights;
		%feature("autodoc", "Returns list of lights of the view.

Returns
-------
opencascade::handle<Graphic3d_LightSet>
") Lights;
		virtual const opencascade::handle<Graphic3d_LightSet> & Lights();

		/****************** MinMaxValues ******************/
		/**** md5 signature: 45fc67a9cdb7ade9e92898ace7263f05 ****/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "Returns the bounding box of all structures displayed in the view. if thetoincludeauxiliary is true, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite and other auxiliary structures. @param thetoincludeauxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) returns computed bounding box.

Parameters
----------
theToIncludeAuxiliary: bool,optional
	default value is Standard_False

Returns
-------
Bnd_Box
") MinMaxValues;
		virtual Bnd_Box MinMaxValues(const Standard_Boolean theToIncludeAuxiliary = Standard_False);

		/****************** MinMaxValues ******************/
		/**** md5 signature: 711091af61f4dcdf9b8b0cf2f13e9983 ****/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "Returns the coordinates of the boundary box of all structures in the set <theset>. if <thetoignoreinfiniteflag> is true, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite structures.

Parameters
----------
theSet: Graphic3d_MapOfStructure
theToIncludeAuxiliary: bool,optional
	default value is Standard_False

Returns
-------
Bnd_Box
") MinMaxValues;
		Bnd_Box MinMaxValues(const Graphic3d_MapOfStructure & theSet, const Standard_Boolean theToIncludeAuxiliary = Standard_False);

		/****************** NumberOfDisplayedStructures ******************/
		/**** md5 signature: 08b9051bcff19d077afd4b2918ac8068 ****/
		%feature("compactdefaultargs") NumberOfDisplayedStructures;
		%feature("autodoc", "Returns number of displayed structures in the view.

Returns
-------
int
") NumberOfDisplayedStructures;
		virtual Standard_Integer NumberOfDisplayedStructures();

		/****************** ReCompute ******************/
		/**** md5 signature: b298f491838ab5574e489a3b63373f8a ****/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "Computes the new presentation of the structure displayed in this view with the type graphic3d_tos_computed.

Parameters
----------
theStructure: Graphic3d_Structure

Returns
-------
None
") ReCompute;
		void ReCompute(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****************** Redraw ******************/
		/**** md5 signature: c693da13110ee5c0f4c37aa33fad1c21 ****/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "Redraw content of the view.

Returns
-------
None
") Redraw;
		virtual void Redraw();

		/****************** RedrawImmediate ******************/
		/**** md5 signature: 8dd0e1a7e818e6f07904b7cf852a1a0f ****/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Redraw immediate content of the view.

Returns
-------
None
") RedrawImmediate;
		virtual void RedrawImmediate();

		/****************** Remove ******************/
		/**** md5 signature: 57a23cda69c531e8d176ae30ce8f77c6 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Erases the view and removes from graphic driver. no more graphic operations are allowed in this view after the call.

Returns
-------
None
") Remove;
		virtual void Remove();

		/****************** RemoveZLayer ******************/
		/**** md5 signature: 50d5f44e4a544e7ce1c8003cf95dee16 ****/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "Remove z layer from the specified view. all structures displayed at the moment in layer will be displayed in default layer ( the bottom-level z layer ). to unset layer id from associated structures use method unsetzlayer (...).

Parameters
----------
theLayerId: int

Returns
-------
None
") RemoveZLayer;
		virtual void RemoveZLayer(int theLayerId);

		/****************** RenderingParams ******************/
		/**** md5 signature: 09614d1dcd3a2492545d199d3739d373 ****/
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "Returns current rendering parameters and effect settings.

Returns
-------
Graphic3d_RenderingParams
") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams();

		/****************** Resized ******************/
		/**** md5 signature: 9c00c8ed1347651e53fd1021899219e9 ****/
		%feature("compactdefaultargs") Resized;
		%feature("autodoc", "Handle changing size of the rendering window.

Returns
-------
None
") Resized;
		virtual void Resized();

		/****************** SetBackfacingModel ******************/
		/**** md5 signature: 559e0e214f796199f29d1d2d70ed3be5 ****/
		%feature("compactdefaultargs") SetBackfacingModel;
		%feature("autodoc", "Sets backfacing model for the view.

Parameters
----------
theModel: Graphic3d_TypeOfBackfacingModel

Returns
-------
None
") SetBackfacingModel;
		virtual void SetBackfacingModel(const Graphic3d_TypeOfBackfacingModel theModel);

		/****************** SetBackground ******************/
		/**** md5 signature: cca9f3f3a8cb129a25f49b97be82ed5b ****/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "Sets background fill color.

Parameters
----------
theBackground: Aspect_Background

Returns
-------
None
") SetBackground;
		virtual void SetBackground(const Aspect_Background & theBackground);

		/****************** SetBackgroundCubeMap ******************/
		/**** md5 signature: 85b6c06d2268123faae34e205d302ced ****/
		%feature("compactdefaultargs") SetBackgroundCubeMap;
		%feature("autodoc", "Sets environment cubemap as background.

Parameters
----------
theCubeMap: Graphic3d_CubeMap

Returns
-------
None
") SetBackgroundCubeMap;
		virtual void SetBackgroundCubeMap(const opencascade::handle<Graphic3d_CubeMap> & theCubeMap);

		/****************** SetBackgroundImage ******************/
		/**** md5 signature: 07d5d97bcd3458d83fd5137aa71d0871 ****/
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "Sets background image texture file path.

Parameters
----------
theFilePath: TCollection_AsciiString

Returns
-------
None
") SetBackgroundImage;
		virtual void SetBackgroundImage(const TCollection_AsciiString & theFilePath);

		/****************** SetBackgroundImageStyle ******************/
		/**** md5 signature: 6d6171020c144a8806fd6d5bea661430 ****/
		%feature("compactdefaultargs") SetBackgroundImageStyle;
		%feature("autodoc", "Sets background image fill style.

Parameters
----------
theFillStyle: Aspect_FillMethod

Returns
-------
None
") SetBackgroundImageStyle;
		virtual void SetBackgroundImageStyle(const Aspect_FillMethod theFillStyle);

		/****************** SetCamera ******************/
		/**** md5 signature: 257054b2420336cef22ca287c4c2483a ****/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "Sets camera used by the view.

Parameters
----------
theCamera: Graphic3d_Camera

Returns
-------
None
") SetCamera;
		virtual void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****************** SetClipPlanes ******************/
		/**** md5 signature: dfb002b318ba4ae6bef35e01c5bfad78 ****/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "Sets list of clip planes for the view.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetClipPlanes;
		virtual void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetComputedMode ******************/
		/**** md5 signature: 269d3bae92efe31d98d859df0012cf4d ****/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "Switches computed hlr mode in the view.

Parameters
----------
theMode: bool

Returns
-------
None
") SetComputedMode;
		void SetComputedMode(const Standard_Boolean theMode);

		/****************** SetFBO ******************/
		/**** md5 signature: 5027c300bed11eda941fac313a783a69 ****/
		%feature("compactdefaultargs") SetFBO;
		%feature("autodoc", "Sets framebuffer object for offscreen rendering.

Parameters
----------
theFbo: Standard_Transient

Returns
-------
None
") SetFBO;
		virtual void SetFBO(const opencascade::handle<Standard_Transient> & theFbo);

		/****************** SetGradientBackground ******************/
		/**** md5 signature: 4a3410413657f94e88bdabc17279ecfc ****/
		%feature("compactdefaultargs") SetGradientBackground;
		%feature("autodoc", "Sets gradient background fill colors.

Parameters
----------
theBackground: Aspect_GradientBackground

Returns
-------
None
") SetGradientBackground;
		virtual void SetGradientBackground(const Aspect_GradientBackground & theBackground);

		/****************** SetImmediateModeDrawToFront ******************/
		/**** md5 signature: b0f4841bb78325eef8ed7c80bcaab0be ****/
		%feature("compactdefaultargs") SetImmediateModeDrawToFront;
		%feature("autodoc", "@param thedrawtofrontbuffer advanced option to modify rendering mode: 1. true. drawing immediate mode structures directly to the front buffer over the scene image. fast, so preferred for interactive work (used by default). however these extra drawings will be missed in image dump since it is performed from back buffer. notice that since no pre-buffering used the v-sync will be ignored and rendering could be seen in run-time (in case of slow hardware) and/or tearing may appear. so this is strongly recommended to draw only simple (fast) structures. 2. false. drawing immediate mode structures to the back buffer. the complete scene is redrawn first, so this mode is slower if scene contains complex data and/or v-sync is turned on. but it works in any case and is especially useful for view dump because the dump image is read from the back buffer. returns previous mode.

Parameters
----------
theDrawToFrontBuffer: bool

Returns
-------
bool
") SetImmediateModeDrawToFront;
		virtual Standard_Boolean SetImmediateModeDrawToFront(const Standard_Boolean theDrawToFrontBuffer);

		/****************** SetLights ******************/
		/**** md5 signature: a176e7a4912580ea247e20fd706028d2 ****/
		%feature("compactdefaultargs") SetLights;
		%feature("autodoc", "Sets list of lights for the view.

Parameters
----------
theLights: Graphic3d_LightSet

Returns
-------
None
") SetLights;
		virtual void SetLights(const opencascade::handle<Graphic3d_LightSet> & theLights);

		/****************** SetShadingModel ******************/
		/**** md5 signature: e0128a9924c3f8c7395b0ec1521ffcee ****/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "Sets default shading model of the view. will throw an exception on attempt to set graphic3d_tosm_default.

Parameters
----------
theModel: Graphic3d_TypeOfShadingModel

Returns
-------
None
") SetShadingModel;
		void SetShadingModel(Graphic3d_TypeOfShadingModel theModel);

		/****************** SetTextureEnv ******************/
		/**** md5 signature: 7529a79a886636c7ffd10c57b2f00357 ****/
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "Sets environment texture for the view.

Parameters
----------
theTextureEnv: Graphic3d_TextureEnv

Returns
-------
None
") SetTextureEnv;
		virtual void SetTextureEnv(const opencascade::handle<Graphic3d_TextureEnv> & theTextureEnv);

		/****************** SetVisualizationType ******************/
		/**** md5 signature: 74ef6d939c9ef213220425899afe5cea ****/
		%feature("compactdefaultargs") SetVisualizationType;
		%feature("autodoc", "Sets visualization type of the view.

Parameters
----------
theType: Graphic3d_TypeOfVisualization

Returns
-------
None
") SetVisualizationType;
		void SetVisualizationType(const Graphic3d_TypeOfVisualization theType);

		/****************** SetWindow ******************/
		/**** md5 signature: 71601c2fe489c318b728df4d93c8ca96 ****/
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "Creates and maps rendering window to the view. @param thewindow [in] the window. @param thecontext [in] the rendering context. if null the context will be created internally.

Parameters
----------
theWindow: Aspect_Window
theContext: Aspect_RenderingContext,optional
	default value is NULL

Returns
-------
None
") SetWindow;
		virtual void SetWindow(const opencascade::handle<Aspect_Window> & theWindow, const Aspect_RenderingContext theContext = NULL);

		/****************** SetZLayerSettings ******************/
		/**** md5 signature: 526c66f52cf13826d826173b0d84d35e ****/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "Sets the settings for a single z layer of specified view.

Parameters
----------
theLayerId: int
theSettings: Graphic3d_ZLayerSettings

Returns
-------
None
") SetZLayerSettings;
		virtual void SetZLayerSettings(int theLayerId, const Graphic3d_ZLayerSettings & theSettings);

		/****************** ShadingModel ******************/
		/**** md5 signature: abf83d7e5f232094cc54f18d79b6661e ****/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "Returns default shading model of the view; graphic3d_tosm_fragment by default.

Returns
-------
Graphic3d_TypeOfShadingModel
") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel();

		/****************** StatisticInformation ******************/
		/**** md5 signature: be606496c5e13c6784f40079328b5f5b ****/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "Returns string with statistic performance info.

Returns
-------
TCollection_AsciiString
") StatisticInformation;
		virtual TCollection_AsciiString StatisticInformation();

		/****************** StatisticInformation ******************/
		/**** md5 signature: ab1f0374e6e5854189b7667f0f157e02 ****/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "Fills in the dictionary with statistic performance info.

Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString

Returns
-------
None
") StatisticInformation;
		virtual void StatisticInformation(TColStd_IndexedDataMapOfStringString & theDict);

		/****************** StructureManager ******************/
		/**** md5 signature: 5843678469524fb10153c08d2adb183d ****/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "Returns the structure manager handle which manage structures associated with this view.

Returns
-------
opencascade::handle<Graphic3d_StructureManager>
") StructureManager;
		const opencascade::handle<Graphic3d_StructureManager> & StructureManager();

		/****************** TextureEnv ******************/
		/**** md5 signature: 8d9dc36b5a00c0fe991e878de46184bc ****/
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "Returns environment texture set for the view.

Returns
-------
opencascade::handle<Graphic3d_TextureEnv>
") TextureEnv;
		virtual opencascade::handle<Graphic3d_TextureEnv> TextureEnv();

		/****************** Update ******************/
		/**** md5 signature: 42afb73ab8b865201bb1288942842c78 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Invalidates bounding box of specified zlayerid.

Parameters
----------
theLayerId: int,optional
	default value is Graphic3d_ZLayerId_UNKNOWN

Returns
-------
None
") Update;
		void Update(int theLayerId = Graphic3d_ZLayerId_UNKNOWN);

		/****************** VisualizationType ******************/
		/**** md5 signature: c16f318d97b0af9f922f150a729b4b3e ****/
		%feature("compactdefaultargs") VisualizationType;
		%feature("autodoc", "Returns visualization type of the view.

Returns
-------
Graphic3d_TypeOfVisualization
") VisualizationType;
		Graphic3d_TypeOfVisualization VisualizationType();

		/****************** Window ******************/
		/**** md5 signature: 72ad541502b66387894c3f250aaf45d4 ****/
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "Returns the window associated to the view.

Returns
-------
opencascade::handle<Aspect_Window>
") Window;
		virtual opencascade::handle<Aspect_Window> Window();

		/****************** ZLayerMax ******************/
		/**** md5 signature: 67e70575f7909ee70bd13a50f93fcb39 ****/
		%feature("compactdefaultargs") ZLayerMax;
		%feature("autodoc", "Returns the maximum z layer id. first layer id is graphic3d_zlayerid_default, last id is zlayermax().

Returns
-------
int
") ZLayerMax;
		virtual Standard_Integer ZLayerMax();

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
		/****************** Graphic3d_FrameStatsDataTmp ******************/
		/**** md5 signature: 88d77300987d2c206b338f657e5c0f18 ****/
		%feature("compactdefaultargs") Graphic3d_FrameStatsDataTmp;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_FrameStatsDataTmp;
		 Graphic3d_FrameStatsDataTmp();

		/****************** ChangeCounterValue ******************/
		/**** md5 signature: 0df043c4b99f49752c83a73d0f638c50 ****/
		%feature("compactdefaultargs") ChangeCounterValue;
		%feature("autodoc", "Get counter value.

Parameters
----------
theIndex: Graphic3d_FrameStatsCounter

Returns
-------
Standard_Size
") ChangeCounterValue;
		Standard_Size & ChangeCounterValue(Graphic3d_FrameStatsCounter theIndex);


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
		/**** md5 signature: 338985f32bc00db9d3129a5133cf5dcb ****/
		%feature("compactdefaultargs") ChangeTimer;
		%feature("autodoc", "Return a timer object for time measurements.

Parameters
----------
theTimer: Graphic3d_FrameStatsTimer

Returns
-------
OSD_Timer
") ChangeTimer;
		OSD_Timer & ChangeTimer(Graphic3d_FrameStatsTimer theTimer);


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
		/**** md5 signature: f0811a083eeb26d2ee2bd735fbc535b6 ****/
		%feature("compactdefaultargs") FlushTimers;
		%feature("autodoc", "Compute average data considering the amount of rendered frames.

Parameters
----------
theNbFrames: Standard_Size
theIsFinal: bool

Returns
-------
None
") FlushTimers;
		void FlushTimers(Standard_Size theNbFrames, bool theIsFinal);

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset data.

Returns
-------
None
") Reset;
		void Reset();

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
		/****************** Graphic3d_MediaTextureSet ******************/
		/**** md5 signature: 3de3d4d8ea0c3573cfb22874d93b1777 ****/
		%feature("compactdefaultargs") Graphic3d_MediaTextureSet;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") Graphic3d_MediaTextureSet;
		 Graphic3d_MediaTextureSet();

		/****************** Duration ******************/
		/**** md5 signature: 7dbbe5f7e0b63b92819c252fd1239f67 ****/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return duration in seconds.

Returns
-------
double
") Duration;
		double Duration();

		/****************** FrameSize ******************/
		/**** md5 signature: e640cf558c35c23f125dae4b07426e7e ****/
		%feature("compactdefaultargs") FrameSize;
		%feature("autodoc", "Return front frame dimensions.

Returns
-------
Graphic3d_Vec2i
") FrameSize;
		Graphic3d_Vec2i FrameSize();

		/****************** Input ******************/
		/**** md5 signature: f6133f739797d33668dfa0592653ea45 ****/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "Return input media.

Returns
-------
TCollection_AsciiString
") Input;
		const TCollection_AsciiString & Input();

		/****************** IsFullRangeYUV ******************/
		/**** md5 signature: 9638452164c38e352bfab652ef53936c ****/
		%feature("compactdefaultargs") IsFullRangeYUV;
		%feature("autodoc", "Return true if yuv range is full.

Returns
-------
bool
") IsFullRangeYUV;
		Standard_Boolean IsFullRangeYUV();

		/****************** IsPlanarYUV ******************/
		/**** md5 signature: 743e7a0a6bfda8c7550857122cff1ccf ****/
		%feature("compactdefaultargs") IsPlanarYUV;
		%feature("autodoc", "Return true if texture set defined 3 yuv planes.

Returns
-------
bool
") IsPlanarYUV;
		Standard_Boolean IsPlanarYUV();

		/****************** Notify ******************/
		/**** md5 signature: 2491f7f734b89141b57f81cc2f5a48ba ****/
		%feature("compactdefaultargs") Notify;
		%feature("autodoc", "Call callback.

Returns
-------
None
") Notify;
		void Notify();

		/****************** OpenInput ******************/
		/**** md5 signature: 860c3b6e78ac92cbd8cf0044e55bef88 ****/
		%feature("compactdefaultargs") OpenInput;
		%feature("autodoc", "Open specified file. passing an empty path would close current input.

Parameters
----------
thePath: TCollection_AsciiString
theToWait: bool

Returns
-------
None
") OpenInput;
		void OpenInput(const TCollection_AsciiString & thePath, Standard_Boolean theToWait);

		/****************** PlayerContext ******************/
		/**** md5 signature: 5fc0e0cbec11700279e3e8631feee60b ****/
		%feature("compactdefaultargs") PlayerContext;
		%feature("autodoc", "Return player context; it can be null until first openinput().

Returns
-------
opencascade::handle<Media_PlayerContext>
") PlayerContext;
		const opencascade::handle<Media_PlayerContext> & PlayerContext();

		/****************** Progress ******************/
		/**** md5 signature: a2570a54b89c9d02c8a49bac78772b2a ****/
		%feature("compactdefaultargs") Progress;
		%feature("autodoc", "Return playback progress in seconds.

Returns
-------
double
") Progress;
		double Progress();

		/****************** ShaderProgram ******************/
		/**** md5 signature: b1d414c1bce3b143f4f8567b5e109ee2 ****/
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "Return shader program for displaying texture set.

Returns
-------
opencascade::handle<Graphic3d_ShaderProgram>
") ShaderProgram;
		opencascade::handle<Graphic3d_ShaderProgram> ShaderProgram();

		/****************** SwapFrames ******************/
		/**** md5 signature: 55cf0b71e0b6c94345c0d4774faee526 ****/
		%feature("compactdefaultargs") SwapFrames;
		%feature("autodoc", "Swap front/back frames.

Returns
-------
bool
") SwapFrames;
		Standard_Boolean SwapFrames();

};


%make_alias(Graphic3d_MediaTextureSet)

%extend Graphic3d_MediaTextureSet {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetCallback(self):
		pass
	}
};

/*****************************
* class Graphic3d_TextureEnv *
*****************************/
class Graphic3d_TextureEnv : public Graphic3d_TextureRoot {
	public:
		/****************** Graphic3d_TextureEnv ******************/
		/**** md5 signature: 2112b4d65f1fbb19be75b979414ef96b ****/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "Creates an environment texture from a file.

Parameters
----------
theFileName: TCollection_AsciiString

Returns
-------
None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv(const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_TextureEnv ******************/
		/**** md5 signature: ceed081a5b5bebc2038ab1db122c6085 ****/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "Creates an environment texture from a predefined texture name set.

Parameters
----------
theName: Graphic3d_NameOfTextureEnv

Returns
-------
None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv(const Graphic3d_NameOfTextureEnv theName);

		/****************** Graphic3d_TextureEnv ******************/
		/**** md5 signature: cf902025332194a30f00f51e839b2ba2 ****/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "Creates an environment texture from the pixmap.

Parameters
----------
thePixMap: Image_PixMap

Returns
-------
None
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv(const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** Name ******************/
		/**** md5 signature: b18daa83e0f455d1890b80e7b2432c14 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the predefined textures or not_env_unknown when the name is given as a filename.

Returns
-------
Graphic3d_NameOfTextureEnv
") Name;
		Graphic3d_NameOfTextureEnv Name();

		/****************** NumberOfTextures ******************/
		/**** md5 signature: 696bdd43958bf4c752e9ef1d41242de3 ****/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "Returns the number of predefined textures.

Returns
-------
int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures();

		/****************** TextureName ******************/
		/**** md5 signature: 47ab46166fc3b73b226fc480a80ffd43 ****/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "Returns the name of the predefined texture of rank <arank>.

Parameters
----------
theRank: int

Returns
-------
TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName(const Standard_Integer theRank);

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
		/**** md5 signature: 616e07e87d398d0de8754a2bd09bff5a ****/
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "Returns level of anisontropy texture filter. default value is graphic3d_lota_off.

Returns
-------
Graphic3d_LevelOfTextureAnisotropy
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter();

		/****************** DisableModulate ******************/
		/**** md5 signature: 578fca54e32c9ab5aef797fdad9bc761 ****/
		%feature("compactdefaultargs") DisableModulate;
		%feature("autodoc", "Disable texture modulate mode. the image is directly decal on the surface.

Returns
-------
None
") DisableModulate;
		void DisableModulate();

		/****************** DisableRepeat ******************/
		/**** md5 signature: 4de6e4194dd0c2daff17603fbe7d5da6 ****/
		%feature("compactdefaultargs") DisableRepeat;
		%feature("autodoc", "Use this methods if you want to disable texture repetition on your objects.

Returns
-------
None
") DisableRepeat;
		void DisableRepeat();

		/****************** DisableSmooth ******************/
		/**** md5 signature: 84f2db317172b668042c5f156ea5b230 ****/
		%feature("compactdefaultargs") DisableSmooth;
		%feature("autodoc", "Disable texture smoothing.

Returns
-------
None
") DisableSmooth;
		void DisableSmooth();

		/****************** EnableModulate ******************/
		/**** md5 signature: 46c33aa561af11d8817f95477a9ded73 ****/
		%feature("compactdefaultargs") EnableModulate;
		%feature("autodoc", "Enable texture modulate mode. the image is modulate with the shading of the surface.

Returns
-------
None
") EnableModulate;
		void EnableModulate();

		/****************** EnableRepeat ******************/
		/**** md5 signature: d118f94ba7c0d3844f3dce4aeefd9e4f ****/
		%feature("compactdefaultargs") EnableRepeat;
		%feature("autodoc", "Use this methods if you want to enable texture repetition on your objects.

Returns
-------
None
") EnableRepeat;
		void EnableRepeat();

		/****************** EnableSmooth ******************/
		/**** md5 signature: cee9b8d17c0a74300f6ee9f08ef3bf01 ****/
		%feature("compactdefaultargs") EnableSmooth;
		%feature("autodoc", "Enable texture smoothing.

Returns
-------
None
") EnableSmooth;
		void EnableSmooth();

		/****************** IsModulate ******************/
		/**** md5 signature: c988cac31c9f56f4ae7e4d7bc8be9b43 ****/
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "Returns true if the texture is modulate.

Returns
-------
bool
") IsModulate;
		Standard_Boolean IsModulate();

		/****************** IsRepeat ******************/
		/**** md5 signature: 4a2c9886f3b35c5848ec7ce52a0727a8 ****/
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "Returns true if the texture repeat is enable.

Returns
-------
bool
") IsRepeat;
		Standard_Boolean IsRepeat();

		/****************** IsSmoothed ******************/
		/**** md5 signature: 2d5a2ef9bb0094d5bfbb197c81960bd6 ****/
		%feature("compactdefaultargs") IsSmoothed;
		%feature("autodoc", "Returns true if the texture is smoothed.

Returns
-------
bool
") IsSmoothed;
		Standard_Boolean IsSmoothed();

		/****************** SetAnisoFilter ******************/
		/**** md5 signature: 999fe7bc1a26aa6af8d56299c100b537 ****/
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "@param thelevel level of anisontropy texture filter.

Parameters
----------
theLevel: Graphic3d_LevelOfTextureAnisotropy

Returns
-------
None
") SetAnisoFilter;
		void SetAnisoFilter(const Graphic3d_LevelOfTextureAnisotropy theLevel);

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
		/**** md5 signature: 868f3bc8b7395cad6d44ef8baafa777c ****/
		%feature("compactdefaultargs") CurrentSide;
		%feature("autodoc", "Returns current cubemap side (iterator state).

Returns
-------
Graphic3d_CubeMapSide
") CurrentSide;
		Graphic3d_CubeMapSide CurrentSide();

		/****************** IsTopDown ******************/
		/**** md5 signature: c4ef22d04c4fb25721f5f617e14f3343 ****/
		%feature("compactdefaultargs") IsTopDown;
		%feature("autodoc", "Returns whether row's memory layout is top-down.

Returns
-------
bool
") IsTopDown;
		Standard_Boolean IsTopDown();

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns whether the iterator has reached the end (true if it hasn't). .

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: 1201a55f750036045cd397a65f07fc7d ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves iterator to the next cubemap side. uses opengl cubemap sides order +x -> -x -> +y -> -y -> +z -> -z.

Returns
-------
None
") Next;
		void Next();

		/****************** Reset ******************/
		/**** md5 signature: 1730adde2bf4f51544d37f5915605dd4 ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Sets iterator state to +x cubemap side.

Returns
-------
Graphic3d_CubeMap
") Reset;
		Graphic3d_CubeMap & Reset();

		/****************** SetZInversion ******************/
		/**** md5 signature: 6a544fc617109268dc916d0b4f3a3d85 ****/
		%feature("compactdefaultargs") SetZInversion;
		%feature("autodoc", "Sets z axis inversion (vertical flipping).

Parameters
----------
theZIsInverted: bool

Returns
-------
None
") SetZInversion;
		void SetZInversion(Standard_Boolean theZIsInverted);

		/****************** Value ******************/
		/**** md5 signature: bb0068dfb7cb7d9e7aa3c52f5450094d ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns pixmap containing current side of cubemap. returns null handle if current side is invalid.

Returns
-------
opencascade::handle<Image_PixMap>
") Value;
		virtual opencascade::handle<Image_PixMap> Value();

		/****************** ZIsInverted ******************/
		/**** md5 signature: ffdf11f19a4a4dfbecf2e4f3e6052001 ****/
		%feature("compactdefaultargs") ZIsInverted;
		%feature("autodoc", "Returns whether z axis is inverted.

Returns
-------
bool
") ZIsInverted;
		Standard_Boolean ZIsInverted();

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
		/**** md5 signature: 6c19f80602f2b82b4f45c578ca95634c ****/
		%feature("compactdefaultargs") Graphic3d_MutableIndexBuffer;
		%feature("autodoc", "Empty constructor.

Parameters
----------
theAlloc: NCollection_BaseAllocator

Returns
-------
None
") Graphic3d_MutableIndexBuffer;
		 Graphic3d_MutableIndexBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** Invalidate ******************/
		/**** md5 signature: 99d0b01edd9229062a44adaeeede137f ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidate the entire buffer data.

Returns
-------
None
") Invalidate;
		virtual void Invalidate();

		/****************** Invalidate ******************/
		/**** md5 signature: 92b6f6cc86dc5bc8126f3a600cd120d0 ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Invalidate the given indexes (starting from 0).

Parameters
----------
theIndexLower: int
theIndexUpper: int

Returns
-------
None
") Invalidate;
		void Invalidate(Standard_Integer theIndexLower, Standard_Integer theIndexUpper);

		/****************** InvalidatedRange ******************/
		/**** md5 signature: 1765d375955ded2f60eeea3cf03bf4f5 ****/
		%feature("compactdefaultargs") InvalidatedRange;
		%feature("autodoc", "Return invalidated range.

Returns
-------
Graphic3d_BufferRange
") InvalidatedRange;
		virtual Graphic3d_BufferRange InvalidatedRange();

		/****************** IsMutable ******************/
		/**** md5 signature: 0a65ba39d455381471f162d17685710f ****/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Return true if data can be invalidated.

Returns
-------
bool
") IsMutable;
		virtual Standard_Boolean IsMutable();

		/****************** Validate ******************/
		/**** md5 signature: c7581a0f47fe76012f2b11e6385e07da ****/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "Reset invalidated range.

Returns
-------
None
") Validate;
		virtual void Validate();

		/****************** invalidate ******************/
		/**** md5 signature: d1325b233234527746db5858cd03173a ****/
		%feature("compactdefaultargs") invalidate;
		%feature("autodoc", "Invalidate specified sub-range of data (as byte offsets).

Parameters
----------
theRange: Graphic3d_BufferRange

Returns
-------
None
") invalidate;
		void invalidate(const Graphic3d_BufferRange & theRange);

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
		/**** md5 signature: c5471c14d098eed717caf07f9214bf7e ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the predefined textures or not_1d_unknown when the name is given as a filename.

Returns
-------
Graphic3d_NameOfTexture1D
") Name;
		Graphic3d_NameOfTexture1D Name();

		/****************** NumberOfTextures ******************/
		/**** md5 signature: 696bdd43958bf4c752e9ef1d41242de3 ****/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "Returns the number of predefined textures.

Returns
-------
int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures();

		/****************** TextureName ******************/
		/**** md5 signature: e8839f3a4756cc5104c3948195dcb53a ****/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "Returns the name of the predefined texture of rank <arank>.

Parameters
----------
aRank: int

Returns
-------
TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName(const Standard_Integer aRank);

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
		/**** md5 signature: b3b5fb053a7b49996b2be90fa9333800 ****/
		%feature("compactdefaultargs") HasMipMaps;
		%feature("autodoc", "Return true if mip-maps should be used.

Returns
-------
bool
") HasMipMaps;
		Standard_Boolean HasMipMaps();

		/****************** Name ******************/
		/**** md5 signature: dda2451d076770a05a4cf60ebc1b2135 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of the predefined textures or not_2d_unknown when the name is given as a filename.

Returns
-------
Graphic3d_NameOfTexture2D
") Name;
		Graphic3d_NameOfTexture2D Name();

		/****************** NumberOfTextures ******************/
		/**** md5 signature: 696bdd43958bf4c752e9ef1d41242de3 ****/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "Returns the number of predefined textures.

Returns
-------
int
") NumberOfTextures;
		static Standard_Integer NumberOfTextures();

		/****************** SetImage ******************/
		/**** md5 signature: 1588c589999c87638afeed7026805f57 ****/
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "Assign new image to the texture. note that this method does not invalidate already uploaded resources - consider calling ::updaterevision() if needed.

Parameters
----------
thePixMap: Image_PixMap

Returns
-------
None
") SetImage;
		void SetImage(const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** SetMipMaps ******************/
		/**** md5 signature: 96cb7542bf6e82b31a77c3e2424bd6d1 ****/
		%feature("compactdefaultargs") SetMipMaps;
		%feature("autodoc", "Set if mip-maps should be used (generated if needed). note that this method should be called before loading / using the texture.

Parameters
----------
theToUse: bool

Returns
-------
None
") SetMipMaps;
		void SetMipMaps(const Standard_Boolean theToUse);

		/****************** TextureName ******************/
		/**** md5 signature: 47ab46166fc3b73b226fc480a80ffd43 ****/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "Returns the name of the predefined texture of rank <arank>.

Parameters
----------
theRank: int

Returns
-------
TCollection_AsciiString
") TextureName;
		static TCollection_AsciiString TextureName(const Standard_Integer theRank);

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
		/****************** Graphic3d_CubeMapSeparate ******************/
		/**** md5 signature: f214f0a66b33cb73305ea1065b68a323 ****/
		%feature("compactdefaultargs") Graphic3d_CubeMapSeparate;
		%feature("autodoc", "Initializes cubemap to be loaded from file. @thepaths - array of paths to separate image files (has to have size equal 6).

Parameters
----------
thePaths: NCollection_Array1<TCollection_AsciiString>

Returns
-------
None
") Graphic3d_CubeMapSeparate;
		 Graphic3d_CubeMapSeparate(const NCollection_Array1<TCollection_AsciiString> & thePaths);

		/****************** Graphic3d_CubeMapSeparate ******************/
		/**** md5 signature: 56d466dfd473af1aaaef0bb290e3c427 ****/
		%feature("compactdefaultargs") Graphic3d_CubeMapSeparate;
		%feature("autodoc", "Initializes cubemap to be setted directly from pixmaps. @theimages - array if pixmaps (has to have size equal 6).

Parameters
----------
theImages: Image_PixMap

Returns
-------
None
") Graphic3d_CubeMapSeparate;
		 Graphic3d_CubeMapSeparate(const NCollection_Array1<opencascade::handle<Image_PixMap> > & theImages);

		/****************** GetImage ******************/
		/**** md5 signature: 7c0999ad6f0e41d8558f710f24ef4856 ****/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "Returns null.

Returns
-------
opencascade::handle<Image_PixMap>
") GetImage;
		virtual opencascade::handle<Image_PixMap> GetImage();

		/****************** IsDone ******************/
		/**** md5 signature: c9aa3a454774a145a334d5dad12c1786 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Checks if a texture class is valid or not. returns true if the construction of the class is correct.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Value ******************/
		/**** md5 signature: d28a17bd5da564c117878e65e1116b4e ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns current side of cubemap as pixmap. returns null handle if current side or whole cubemap is invalid. all origin images have to have the same sizes, format and quad shapes to form valid cubemap.

Returns
-------
opencascade::handle<Image_PixMap>
") Value;
		opencascade::handle<Image_PixMap> Value();

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
		/****************** Graphic3d_MediaTexture ******************/
		/**** md5 signature: e2cdb55a126aaa40cfe98e33487e4fd3 ****/
		%feature("compactdefaultargs") Graphic3d_MediaTexture;
		%feature("autodoc", "Main constructor.

Parameters
----------
theMutex: Media_HMutex
thePlane: int,optional
	default value is -1

Returns
-------
None
") Graphic3d_MediaTexture;
		 Graphic3d_MediaTexture(const opencascade::handle<Media_HMutex> & theMutex, Standard_Integer thePlane = -1);

		/****************** Frame ******************/
		/**** md5 signature: 72eed6e2d3ed40f13a456563c383f7ca ****/
		%feature("compactdefaultargs") Frame;
		%feature("autodoc", "Return the frame.

Returns
-------
opencascade::handle<Media_Frame>
") Frame;
		const opencascade::handle<Media_Frame> & Frame();

		/****************** GenerateNewId ******************/
		/**** md5 signature: 1495d713b8162c3177562c052a16c340 ****/
		%feature("compactdefaultargs") GenerateNewId;
		%feature("autodoc", "Regenerate a new texture id.

Returns
-------
None
") GenerateNewId;
		void GenerateNewId();

		/****************** GetImage ******************/
		/**** md5 signature: 6c60aef14922d653f11e87371a7bca2d ****/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "Image reader.

Returns
-------
opencascade::handle<Image_PixMap>
") GetImage;
		virtual opencascade::handle<Image_PixMap> GetImage();

		/****************** SetFrame ******************/
		/**** md5 signature: 0dfb0fadea2ff545daa07a8643107bce ****/
		%feature("compactdefaultargs") SetFrame;
		%feature("autodoc", "Set the frame.

Parameters
----------
theFrame: Media_Frame

Returns
-------
None
") SetFrame;
		void SetFrame(const opencascade::handle<Media_Frame> & theFrame);

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
		/**** md5 signature: 16246a6717a0283bbe82f098c0f243dd ****/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "Creates a texture from the file filename.

Parameters
----------
theFileName: TCollection_AsciiString

Returns
-------
None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual(const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture1Dmanual ******************/
		/**** md5 signature: 523b409c896dd67bb73e53f0713b5b88 ****/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "Create a texture from a predefined texture name set.

Parameters
----------
theNOT: Graphic3d_NameOfTexture1D

Returns
-------
None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual(const Graphic3d_NameOfTexture1D theNOT);

		/****************** Graphic3d_Texture1Dmanual ******************/
		/**** md5 signature: 144f42d65129f67ad24cb0055b483270 ****/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "Creates a texture from the pixmap.

Parameters
----------
thePixMap: Image_PixMap

Returns
-------
None
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual(const opencascade::handle<Image_PixMap> & thePixMap);

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
		/**** md5 signature: 234567f0eac87576d69ef98d81103965 ****/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "Creates a texture from a file.

Parameters
----------
theFileName: TCollection_AsciiString

Returns
-------
None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment(const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture1Dsegment ******************/
		/**** md5 signature: a05398d4cb31cf6396ad390a24ec4de7 ****/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "Creates a texture from a predefined texture name set.

Parameters
----------
theNOT: Graphic3d_NameOfTexture1D

Returns
-------
None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment(const Graphic3d_NameOfTexture1D theNOT);

		/****************** Graphic3d_Texture1Dsegment ******************/
		/**** md5 signature: 7a32ead788f54fc5cf095c004f556eb5 ****/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "Creates a texture from the pixmap.

Parameters
----------
thePixMap: Image_PixMap

Returns
-------
None
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment(const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** Segment ******************/
		/**** md5 signature: 298be0f2ffeb1900226c372b5e3bec9f ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the values of the current segment x1, y1, z1 , x2, y2, z2.

Parameters
----------
theX1: Standard_ShortReal
theY1: Standard_ShortReal
theZ1: Standard_ShortReal
theX2: Standard_ShortReal
theY2: Standard_ShortReal
theZ2: Standard_ShortReal

Returns
-------
None
") Segment;
		void Segment(Standard_ShortReal & theX1, Standard_ShortReal & theY1, Standard_ShortReal & theZ1, Standard_ShortReal & theX2, Standard_ShortReal & theY2, Standard_ShortReal & theZ2);

		/****************** SetSegment ******************/
		/**** md5 signature: 9bdaf54faa2c28520a6560abbbfcb0b5 ****/
		%feature("compactdefaultargs") SetSegment;
		%feature("autodoc", "Sets the texture application bounds. defines the way the texture is stretched across facets. default values are <0.0, 0.0, 0.0> , <0.0, 0.0, 1.0>.

Parameters
----------
theX1: Standard_ShortReal
theY1: Standard_ShortReal
theZ1: Standard_ShortReal
theX2: Standard_ShortReal
theY2: Standard_ShortReal
theZ2: Standard_ShortReal

Returns
-------
None
") SetSegment;
		void SetSegment(const Standard_ShortReal theX1, const Standard_ShortReal theY1, const Standard_ShortReal theZ1, const Standard_ShortReal theX2, const Standard_ShortReal theY2, const Standard_ShortReal theZ2);

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
		/**** md5 signature: 89ba79d6f570d4df5db832a6a5f42564 ****/
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "Creates a texture from a file. mipmaps levels will be automatically generated if needed.

Parameters
----------
theFileName: TCollection_AsciiString

Returns
-------
None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual(const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture2Dmanual ******************/
		/**** md5 signature: e9b591bcc1d61ffeabbbbfca0b95ff39 ****/
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "Creates a texture from a predefined texture name set. mipmaps levels will be automatically generated if needed.

Parameters
----------
theNOT: Graphic3d_NameOfTexture2D

Returns
-------
None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual(const Graphic3d_NameOfTexture2D theNOT);

		/****************** Graphic3d_Texture2Dmanual ******************/
		/**** md5 signature: 8404d001b321e8f289082997e993fa03 ****/
		%feature("compactdefaultargs") Graphic3d_Texture2Dmanual;
		%feature("autodoc", "Creates a texture from the pixmap. mipmaps levels will be automatically generated if needed.

Parameters
----------
thePixMap: Image_PixMap

Returns
-------
None
") Graphic3d_Texture2Dmanual;
		 Graphic3d_Texture2Dmanual(const opencascade::handle<Image_PixMap> & thePixMap);

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
		/**** md5 signature: a6f25585f63ff0136a842aab922c1b7f ****/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "Creates a texture from a file.

Parameters
----------
theFileName: TCollection_AsciiString

Returns
-------
None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane(const TCollection_AsciiString & theFileName);

		/****************** Graphic3d_Texture2Dplane ******************/
		/**** md5 signature: aea36b4535b2f3f95d113fe310be496a ****/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "Creates a texture from a predefined texture name set.

Parameters
----------
theNOT: Graphic3d_NameOfTexture2D

Returns
-------
None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane(const Graphic3d_NameOfTexture2D theNOT);

		/****************** Graphic3d_Texture2Dplane ******************/
		/**** md5 signature: cbf8f493755871b02307b8b4fe0a64b6 ****/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "Creates a texture from the pixmap.

Parameters
----------
thePixMap: Image_PixMap

Returns
-------
None
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane(const opencascade::handle<Image_PixMap> & thePixMap);

		/****************** Plane ******************/
		/**** md5 signature: 13e7ba511c49d3739032bf490c857606 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Returns the current texture plane name or notp_unknown when the plane is user defined.

Returns
-------
Graphic3d_NameOfTexturePlane
") Plane;
		Graphic3d_NameOfTexturePlane Plane();

		/****************** PlaneS ******************/
		/**** md5 signature: 03ed1711912de7c15e0e53299ff2e99b ****/
		%feature("compactdefaultargs") PlaneS;
		%feature("autodoc", "Returns the current texture plane s equation.

Parameters
----------
A: Standard_ShortReal
B: Standard_ShortReal
C: Standard_ShortReal
D: Standard_ShortReal

Returns
-------
None
") PlaneS;
		void PlaneS(Standard_ShortReal & A, Standard_ShortReal & B, Standard_ShortReal & C, Standard_ShortReal & D);

		/****************** PlaneT ******************/
		/**** md5 signature: 0f64deb688509a59d7d495773093d9b1 ****/
		%feature("compactdefaultargs") PlaneT;
		%feature("autodoc", "Returns the current texture plane t equation.

Parameters
----------
A: Standard_ShortReal
B: Standard_ShortReal
C: Standard_ShortReal
D: Standard_ShortReal

Returns
-------
None
") PlaneT;
		void PlaneT(Standard_ShortReal & A, Standard_ShortReal & B, Standard_ShortReal & C, Standard_ShortReal & D);

		/****************** Rotation ******************/
		/**** md5 signature: 340e4ac958aa75f22cf9693956702cf3 ****/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Returns the current texture rotation angle.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") Rotation;
		void Rotation(Standard_ShortReal & theVal);

		/****************** ScaleS ******************/
		/**** md5 signature: e3176db3295b91f7337ec77e06b297fe ****/
		%feature("compactdefaultargs") ScaleS;
		%feature("autodoc", "Returns the current texture s scale value.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") ScaleS;
		void ScaleS(Standard_ShortReal & theVal);

		/****************** ScaleT ******************/
		/**** md5 signature: 2181a84eae66e0185f0f40f06a9e33aa ****/
		%feature("compactdefaultargs") ScaleT;
		%feature("autodoc", "Returns the current texture t scale value.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") ScaleT;
		void ScaleT(Standard_ShortReal & theVal);

		/****************** SetPlane ******************/
		/**** md5 signature: 5813f7058833e3ba0aacb0bc8ba39472 ****/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "Defines the texture projection plane for both s and t texture coordinate default is notp_xy meaning: <1.0, 0.0, 0.0, 0.0> for s and <0.0, 1.0, 0.0, 0.0> for t.

Parameters
----------
thePlane: Graphic3d_NameOfTexturePlane

Returns
-------
None
") SetPlane;
		void SetPlane(const Graphic3d_NameOfTexturePlane thePlane);

		/****************** SetPlaneS ******************/
		/**** md5 signature: 296dac1d9f26755b1c24beed7af0e903 ****/
		%feature("compactdefaultargs") SetPlaneS;
		%feature("autodoc", "Defines the texture projection plane for texture coordinate s default is <1.0, 0.0, 0.0, 0.0>.

Parameters
----------
A: Standard_ShortReal
B: Standard_ShortReal
C: Standard_ShortReal
D: Standard_ShortReal

Returns
-------
None
") SetPlaneS;
		void SetPlaneS(const Standard_ShortReal A, const Standard_ShortReal B, const Standard_ShortReal C, const Standard_ShortReal D);

		/****************** SetPlaneT ******************/
		/**** md5 signature: feeac175bf7d9bfb7c1e3c8be5c79fdd ****/
		%feature("compactdefaultargs") SetPlaneT;
		%feature("autodoc", "Defines the texture projection plane for texture coordinate t default is <0.0, 1.0, 0.0, 0.0>.

Parameters
----------
A: Standard_ShortReal
B: Standard_ShortReal
C: Standard_ShortReal
D: Standard_ShortReal

Returns
-------
None
") SetPlaneT;
		void SetPlaneT(const Standard_ShortReal A, const Standard_ShortReal B, const Standard_ShortReal C, const Standard_ShortReal D);

		/****************** SetRotation ******************/
		/**** md5 signature: 58c05b8fc74c716139b125085ca02925 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Sets the rotation angle of the whole texture. the same result might be achieved by recomputing the s and t plane equation but it's not the easiest way... the angle is expressed in degrees default is 0.0.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") SetRotation;
		void SetRotation(const Standard_ShortReal theVal);

		/****************** SetScaleS ******************/
		/**** md5 signature: 9a2f7627109ba2c51b8db23824221bab ****/
		%feature("compactdefaultargs") SetScaleS;
		%feature("autodoc", "Defines the texture scale for the s texture coordinate much easier than recomputing the s plane equation but the result is the same default to 1.0.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") SetScaleS;
		void SetScaleS(const Standard_ShortReal theVal);

		/****************** SetScaleT ******************/
		/**** md5 signature: ab76d8f3af260002928757b3a4d8c8ca ****/
		%feature("compactdefaultargs") SetScaleT;
		%feature("autodoc", "Defines the texture scale for the t texture coordinate much easier than recompution the t plane equation but the result is the same default to 1.0.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") SetScaleT;
		void SetScaleT(const Standard_ShortReal theVal);

		/****************** SetTranslateS ******************/
		/**** md5 signature: 8554f981ca1c6e23734a3ce8ec143b0a ****/
		%feature("compactdefaultargs") SetTranslateS;
		%feature("autodoc", "Defines the texture translation for the s texture coordinate you can obtain the same effect by modifying the s plane equation but its not easier. default to 0.0.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") SetTranslateS;
		void SetTranslateS(const Standard_ShortReal theVal);

		/****************** SetTranslateT ******************/
		/**** md5 signature: a9e2b58b7597fd99185d4733db7cab52 ****/
		%feature("compactdefaultargs") SetTranslateT;
		%feature("autodoc", "Defines the texture translation for the t texture coordinate you can obtain the same effect by modifying the t plane equation but its not easier. default to 0.0.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") SetTranslateT;
		void SetTranslateT(const Standard_ShortReal theVal);

		/****************** TranslateS ******************/
		/**** md5 signature: a8485b07c9a630a032b6325b56ca5439 ****/
		%feature("compactdefaultargs") TranslateS;
		%feature("autodoc", "Returns the current texture s translation value.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") TranslateS;
		void TranslateS(Standard_ShortReal & theVal);

		/****************** TranslateT ******************/
		/**** md5 signature: 9fc4f8423a49d11a60255baa317fbaf1 ****/
		%feature("compactdefaultargs") TranslateT;
		%feature("autodoc", "Returns the current texture t translation value.

Parameters
----------
theVal: Standard_ShortReal

Returns
-------
None
") TranslateT;
		void TranslateT(Standard_ShortReal & theVal);

};


%make_alias(Graphic3d_Texture2Dplane)

%extend Graphic3d_Texture2Dplane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Graphic3d_UniformValue:
	pass

@classnotwrapped
class Graphic3d_UniformValueType:
	pass

@classnotwrapped
class Graphic3d_UniformValueTypeID:
	pass

@classnotwrapped
class Graphic3d_Buffer:
	pass

@classnotwrapped
class Graphic3d_IndexBuffer:
	pass

@classnotwrapped
class Graphic3d_TransformPers:
	pass

@classnotwrapped
class Graphic3d_TextureSet:
	pass

@classnotwrapped
class Graphic3d_CubeMapOrder:
	pass

@classnotwrapped
class Graphic3d_CubeMapPacked:
	pass

@classnotwrapped
class Graphic3d_BvhCStructureSetTrsfPers:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
