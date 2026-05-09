/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_graphic3d.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<TopLoc_module.hxx>
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
%import TopLoc.i
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
enum Graphic3d_AlphaMode {
	Graphic3d_AlphaMode_Opaque = 0,
	Graphic3d_AlphaMode_Mask = 1,
	Graphic3d_AlphaMode_Blend = 2,
	Graphic3d_AlphaMode_MaskBlend = 3,
	Graphic3d_AlphaMode_BlendAuto = - 1,
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

enum Graphic3d_FresnelModel {
	Graphic3d_FM_SCHLICK = 0,
	Graphic3d_FM_CONSTANT = 1,
	Graphic3d_FM_CONDUCTOR = 2,
	Graphic3d_FM_DIELECTRIC = 3,
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

enum Graphic3d_BufferType {
	Graphic3d_BT_RGB = 0,
	Graphic3d_BT_RGBA = 1,
	Graphic3d_BT_Depth = 2,
	Graphic3d_BT_RGB_RayTraceHdrLeft = 3,
	Graphic3d_BT_Red = 4,
	Graphic3d_BT_ShadowMap = 5,
};

enum Graphic3d_CappingFlags {
	Graphic3d_CappingFlags_None = 0,
	Graphic3d_CappingFlags_ObjectMaterial = 1,
	Graphic3d_CappingFlags_ObjectTexture = 2,
	Graphic3d_CappingFlags_ObjectShader = 8,
	Graphic3d_CappingFlags_ObjectAspect = Graphic3d_CappingFlags_ObjectMaterial | Graphic3d_CappingFlags_ObjectTexture | Graphic3d_CappingFlags_ObjectShader,
};

enum Graphic3d_ClipState {
	Graphic3d_ClipState_Out = 0,
	Graphic3d_ClipState_In = 1,
	Graphic3d_ClipState_On = 2,
};

enum Graphic3d_CubeMapSide {
	Graphic3d_CMS_POS_X = 0,
	Graphic3d_CMS_NEG_X = 1,
	Graphic3d_CMS_POS_Y = 2,
	Graphic3d_CMS_NEG_Y = 3,
	Graphic3d_CMS_POS_Z = 4,
	Graphic3d_CMS_NEG_Z = 5,
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

enum Graphic3d_DisplayPriority {
	Graphic3d_DisplayPriority_INVALID = - 1,
	Graphic3d_DisplayPriority_Bottom = 0,
	Graphic3d_DisplayPriority_AlmostBottom = 1,
	Graphic3d_DisplayPriority_Below2 = 2,
	Graphic3d_DisplayPriority_Below1 = 3,
	Graphic3d_DisplayPriority_Below = 4,
	Graphic3d_DisplayPriority_Normal = 5,
	Graphic3d_DisplayPriority_Above = 6,
	Graphic3d_DisplayPriority_Above1 = 7,
	Graphic3d_DisplayPriority_Above2 = 8,
	Graphic3d_DisplayPriority_Highlight = 9,
	Graphic3d_DisplayPriority_Topmost = 10,
};

enum  {
	Graphic3d_DisplayPriority_NB = Graphic3d_DisplayPriority_Topmost - Graphic3d_DisplayPriority_Bottom + 1,
};

enum Graphic3d_FrameStatsCounter {
	Graphic3d_FrameStatsCounter_NbLayers = 0,
	Graphic3d_FrameStatsCounter_NbStructs = 1,
	Graphic3d_FrameStatsCounter_EstimatedBytesGeom = 2,
	Graphic3d_FrameStatsCounter_EstimatedBytesFbos = 3,
	Graphic3d_FrameStatsCounter_EstimatedBytesTextures = 4,
	Graphic3d_FrameStatsCounter_NbLayersNotCulled = 5,
	Graphic3d_FrameStatsCounter_NbStructsNotCulled = 6,
	Graphic3d_FrameStatsCounter_NbGroupsNotCulled = 7,
	Graphic3d_FrameStatsCounter_NbElemsNotCulled = 8,
	Graphic3d_FrameStatsCounter_NbElemsFillNotCulled = 9,
	Graphic3d_FrameStatsCounter_NbElemsLineNotCulled = 10,
	Graphic3d_FrameStatsCounter_NbElemsPointNotCulled = 11,
	Graphic3d_FrameStatsCounter_NbElemsTextNotCulled = 12,
	Graphic3d_FrameStatsCounter_NbTrianglesNotCulled = 13,
	Graphic3d_FrameStatsCounter_NbLinesNotCulled = 14,
	Graphic3d_FrameStatsCounter_NbPointsNotCulled = 15,
	Graphic3d_FrameStatsCounter_NbLayersImmediate = 16,
	Graphic3d_FrameStatsCounter_NbStructsImmediate = 17,
	Graphic3d_FrameStatsCounter_NbGroupsImmediate = 18,
	Graphic3d_FrameStatsCounter_NbElemsImmediate = 19,
	Graphic3d_FrameStatsCounter_NbElemsFillImmediate = 20,
	Graphic3d_FrameStatsCounter_NbElemsLineImmediate = 21,
	Graphic3d_FrameStatsCounter_NbElemsPointImmediate = 22,
	Graphic3d_FrameStatsCounter_NbElemsTextImmediate = 23,
	Graphic3d_FrameStatsCounter_NbTrianglesImmediate = 24,
	Graphic3d_FrameStatsCounter_NbLinesImmediate = 25,
	Graphic3d_FrameStatsCounter_NbPointsImmediate = 26,
};

enum  {
	Graphic3d_FrameStatsCounter_NB = Graphic3d_FrameStatsCounter_NbPointsImmediate + 1,
	Graphic3d_FrameStatsCounter_SCENE_LOWER = Graphic3d_FrameStatsCounter_NbLayers,
	Graphic3d_FrameStatsCounter_SCENE_UPPER = Graphic3d_FrameStatsCounter_EstimatedBytesTextures,
	Graphic3d_FrameStatsCounter_RENDERED_LOWER = Graphic3d_FrameStatsCounter_NbLayersNotCulled,
	Graphic3d_FrameStatsCounter_RENDERED_UPPER = Graphic3d_FrameStatsCounter_NbPointsNotCulled,
	Graphic3d_FrameStatsCounter_IMMEDIATE_LOWER = Graphic3d_FrameStatsCounter_NbLayersImmediate,
	Graphic3d_FrameStatsCounter_IMMEDIATE_UPPER = Graphic3d_FrameStatsCounter_NbPointsImmediate,
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
	Graphic3d_NameOfMaterial_Brass = 0,
	Graphic3d_NameOfMaterial_Bronze = 1,
	Graphic3d_NameOfMaterial_Copper = 2,
	Graphic3d_NameOfMaterial_Gold = 3,
	Graphic3d_NameOfMaterial_Pewter = 4,
	Graphic3d_NameOfMaterial_Plastered = 5,
	Graphic3d_NameOfMaterial_Plastified = 6,
	Graphic3d_NameOfMaterial_Silver = 7,
	Graphic3d_NameOfMaterial_Steel = 8,
	Graphic3d_NameOfMaterial_Stone = 9,
	Graphic3d_NameOfMaterial_ShinyPlastified = 10,
	Graphic3d_NameOfMaterial_Satin = 11,
	Graphic3d_NameOfMaterial_Metalized = 12,
	Graphic3d_NameOfMaterial_Ionized = 13,
	Graphic3d_NameOfMaterial_Chrome = 14,
	Graphic3d_NameOfMaterial_Aluminum = 15,
	Graphic3d_NameOfMaterial_Obsidian = 16,
	Graphic3d_NameOfMaterial_Neon = 17,
	Graphic3d_NameOfMaterial_Jade = 18,
	Graphic3d_NameOfMaterial_Charcoal = 19,
	Graphic3d_NameOfMaterial_Water = 20,
	Graphic3d_NameOfMaterial_Glass = 21,
	Graphic3d_NameOfMaterial_Diamond = 22,
	Graphic3d_NameOfMaterial_Transparent = 23,
	Graphic3d_NameOfMaterial_DEFAULT = 24,
	Graphic3d_NameOfMaterial_UserDefined = 25,
	Graphic3d_NOM_BRASS = Graphic3d_NameOfMaterial_Brass,
	Graphic3d_NOM_BRONZE = Graphic3d_NameOfMaterial_Bronze,
	Graphic3d_NOM_COPPER = Graphic3d_NameOfMaterial_Copper,
	Graphic3d_NOM_GOLD = Graphic3d_NameOfMaterial_Gold,
	Graphic3d_NOM_PEWTER = Graphic3d_NameOfMaterial_Pewter,
	Graphic3d_NOM_PLASTER = Graphic3d_NameOfMaterial_Plastered,
	Graphic3d_NOM_PLASTIC = Graphic3d_NameOfMaterial_Plastified,
	Graphic3d_NOM_SILVER = Graphic3d_NameOfMaterial_Silver,
	Graphic3d_NOM_STEEL = Graphic3d_NameOfMaterial_Steel,
	Graphic3d_NOM_STONE = Graphic3d_NameOfMaterial_Stone,
	Graphic3d_NOM_SHINY_PLASTIC = Graphic3d_NameOfMaterial_ShinyPlastified,
	Graphic3d_NOM_SATIN = Graphic3d_NameOfMaterial_Satin,
	Graphic3d_NOM_METALIZED = Graphic3d_NameOfMaterial_Metalized,
	Graphic3d_NOM_NEON_GNC = Graphic3d_NameOfMaterial_Ionized,
	Graphic3d_NOM_CHROME = Graphic3d_NameOfMaterial_Chrome,
	Graphic3d_NOM_ALUMINIUM = Graphic3d_NameOfMaterial_Aluminum,
	Graphic3d_NOM_OBSIDIAN = Graphic3d_NameOfMaterial_Obsidian,
	Graphic3d_NOM_NEON_PHC = Graphic3d_NameOfMaterial_Neon,
	Graphic3d_NOM_JADE = Graphic3d_NameOfMaterial_Jade,
	Graphic3d_NOM_CHARCOAL = Graphic3d_NameOfMaterial_Charcoal,
	Graphic3d_NOM_WATER = Graphic3d_NameOfMaterial_Water,
	Graphic3d_NOM_GLASS = Graphic3d_NameOfMaterial_Glass,
	Graphic3d_NOM_DIAMOND = Graphic3d_NameOfMaterial_Diamond,
	Graphic3d_NOM_TRANSPARENT = Graphic3d_NameOfMaterial_Transparent,
	Graphic3d_NOM_DEFAULT = Graphic3d_NameOfMaterial_DEFAULT,
	Graphic3d_NOM_UserDefined = Graphic3d_NameOfMaterial_UserDefined,
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
	Graphic3d_NOT_2D_CHESS = 21,
	Graphic3d_NOT_2D_UNKNOWN = 22,
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

enum Graphic3d_RenderTransparentMethod {
	Graphic3d_RTM_BLEND_UNORDERED = 0,
	Graphic3d_RTM_BLEND_OIT = 1,
	Graphic3d_RTM_DEPTH_PEELING_OIT = 2,
};

enum Graphic3d_RenderingMode {
	Graphic3d_RM_RASTERIZATION = 0,
	Graphic3d_RM_RAYTRACING = 1,
};

enum Graphic3d_ShaderFlags {
	Graphic3d_ShaderFlags_VertColor = 1,
	Graphic3d_ShaderFlags_TextureRGB = 2,
	Graphic3d_ShaderFlags_TextureEnv = 4,
	Graphic3d_ShaderFlags_TextureNormal = Graphic3d_ShaderFlags_TextureRGB | Graphic3d_ShaderFlags_TextureEnv,
	Graphic3d_ShaderFlags_PointSimple = 8,
	Graphic3d_ShaderFlags_PointSprite = 16,
	Graphic3d_ShaderFlags_PointSpriteA = Graphic3d_ShaderFlags_PointSimple | Graphic3d_ShaderFlags_PointSprite,
	Graphic3d_ShaderFlags_StippleLine = 32,
	Graphic3d_ShaderFlags_ClipPlanes1 = 64,
	Graphic3d_ShaderFlags_ClipPlanes2 = 128,
	Graphic3d_ShaderFlags_ClipPlanesN = Graphic3d_ShaderFlags_ClipPlanes1 | Graphic3d_ShaderFlags_ClipPlanes2,
	Graphic3d_ShaderFlags_ClipChains = 256,
	Graphic3d_ShaderFlags_MeshEdges = 512,
	Graphic3d_ShaderFlags_AlphaTest = 1024,
	Graphic3d_ShaderFlags_WriteOit = 2048,
	Graphic3d_ShaderFlags_OitDepthPeeling = 4096,
	Graphic3d_ShaderFlags_NB = 8192,
	Graphic3d_ShaderFlags_IsPoint = Graphic3d_ShaderFlags_PointSimple | Graphic3d_ShaderFlags_PointSprite | Graphic3d_ShaderFlags_PointSpriteA,
	Graphic3d_ShaderFlags_HasTextures = Graphic3d_ShaderFlags_TextureRGB | Graphic3d_ShaderFlags_TextureEnv,
	Graphic3d_ShaderFlags_NeedsGeomShader = Graphic3d_ShaderFlags_MeshEdges,
};

enum Graphic3d_GlslExtension {
	Graphic3d_GlslExtension_GL_OES_standard_derivatives = 0,
	Graphic3d_GlslExtension_GL_EXT_shader_texture_lod = 1,
	Graphic3d_GlslExtension_GL_EXT_frag_depth = 2,
	Graphic3d_GlslExtension_GL_EXT_gpu_shader4 = 3,
};

enum  {
	Graphic3d_GlslExtension_NB = Graphic3d_GlslExtension_GL_EXT_gpu_shader4 + 1,
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
	Graphic3d_StereoMode_OpenVR = 8,
};

enum  {
	Graphic3d_StereoMode_NB = Graphic3d_StereoMode_OpenVR + 1,
};

enum Graphic3d_TextPath {
	Graphic3d_TP_UP = 0,
	Graphic3d_TP_DOWN = 1,
	Graphic3d_TP_LEFT = 2,
	Graphic3d_TP_RIGHT = 3,
};

enum Graphic3d_TextureSetBits {
	Graphic3d_TextureSetBits_NONE = 0,
	Graphic3d_TextureSetBits_BaseColor = Graphic3d_TextureUnit_BaseColor,
	Graphic3d_TextureSetBits_Emissive = Graphic3d_TextureUnit_Emissive,
	Graphic3d_TextureSetBits_Occlusion = Graphic3d_TextureUnit_Occlusion,
	Graphic3d_TextureSetBits_Normal = Graphic3d_TextureUnit_Normal,
	Graphic3d_TextureSetBits_MetallicRoughness = Graphic3d_TextureUnit_MetallicRoughness,
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
	Graphic3d_TextureUnit_Emissive = Graphic3d_TextureUnit_1,
	Graphic3d_TextureUnit_Occlusion = Graphic3d_TextureUnit_2,
	Graphic3d_TextureUnit_Normal = Graphic3d_TextureUnit_3,
	Graphic3d_TextureUnit_MetallicRoughness = Graphic3d_TextureUnit_4,
	Graphic3d_TextureUnit_EnvMap = Graphic3d_TextureUnit_0,
	Graphic3d_TextureUnit_PointSprite = Graphic3d_TextureUnit_1,
	Graphic3d_TextureUnit_DepthPeelingDepth = - 6,
	Graphic3d_TextureUnit_DepthPeelingFrontColor = - 5,
	Graphic3d_TextureUnit_ShadowMap = - 4,
	Graphic3d_TextureUnit_PbrEnvironmentLUT = - 3,
	Graphic3d_TextureUnit_PbrIblDiffuseSH = - 2,
	Graphic3d_TextureUnit_PbrIblSpecular = - 1,
};

enum  {
	Graphic3d_TextureUnit_NB = Graphic3d_TextureUnit_15 + 1,
};

enum Graphic3d_ToneMappingMethod {
	Graphic3d_ToneMappingMethod_Disabled = 0,
	Graphic3d_ToneMappingMethod_Filmic = 1,
};

enum Graphic3d_TransModeFlags {
	Graphic3d_TMF_None = 0,
	Graphic3d_TMF_ZoomPers = 2,
	Graphic3d_TMF_RotatePers = 8,
	Graphic3d_TMF_TriedronPers = 32,
	Graphic3d_TMF_2d = 64,
	Graphic3d_TMF_CameraPers = 128,
	Graphic3d_TMF_OrthoPers = 256,
	Graphic3d_TMF_AxialScalePers = 512,
	Graphic3d_TMF_ZoomRotatePers = Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers,
	Graphic3d_TMF_AxialZoomPers = Graphic3d_TMF_ZoomPers | Graphic3d_TMF_AxialScalePers,
};

enum Graphic3d_TypeOfAnswer {
	Graphic3d_TOA_YES = 0,
	Graphic3d_TOA_NO = 1,
	Graphic3d_TOA_COMPUTE = 2,
};

enum Graphic3d_TypeOfBackfacingModel {
	Graphic3d_TypeOfBackfacingModel_Auto = 0,
	Graphic3d_TypeOfBackfacingModel_DoubleSided = 1,
	Graphic3d_TypeOfBackfacingModel_BackCulled = 2,
	Graphic3d_TypeOfBackfacingModel_FrontCulled = 3,
	Graphic3d_TOBM_AUTOMATIC = Graphic3d_TypeOfBackfacingModel_Auto,
	Graphic3d_TOBM_FORCE = Graphic3d_TypeOfBackfacingModel_DoubleSided,
	Graphic3d_TOBM_DISABLE = Graphic3d_TypeOfBackfacingModel_BackCulled,
	V3d_TOBM_AUTOMATIC = Graphic3d_TypeOfBackfacingModel_Auto,
	V3d_TOBM_ALWAYS_DISPLAYED = Graphic3d_TypeOfBackfacingModel_DoubleSided,
	V3d_TOBM_NEVER_DISPLAYED = Graphic3d_TypeOfBackfacingModel_BackCulled,
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

enum Graphic3d_TypeOfConnection {
	Graphic3d_TOC_ANCESTOR = 0,
	Graphic3d_TOC_DESCENDANT = 1,
};

enum Graphic3d_TypeOfLightSource {
	Graphic3d_TypeOfLightSource_Ambient = 0,
	Graphic3d_TypeOfLightSource_Directional = 1,
	Graphic3d_TypeOfLightSource_Positional = 2,
	Graphic3d_TypeOfLightSource_Spot = 3,
	Graphic3d_TOLS_AMBIENT = Graphic3d_TypeOfLightSource_Ambient,
	Graphic3d_TOLS_DIRECTIONAL = Graphic3d_TypeOfLightSource_Directional,
	Graphic3d_TOLS_POSITIONAL = Graphic3d_TypeOfLightSource_Positional,
	Graphic3d_TOLS_SPOT = Graphic3d_TypeOfLightSource_Spot,
	V3d_AMBIENT = Graphic3d_TypeOfLightSource_Ambient,
	V3d_DIRECTIONAL = Graphic3d_TypeOfLightSource_Directional,
	V3d_POSITIONAL = Graphic3d_TypeOfLightSource_Positional,
	V3d_SPOT = Graphic3d_TypeOfLightSource_Spot,
};

enum  {
	Graphic3d_TypeOfLightSource_NB = Graphic3d_TypeOfLightSource_Spot + 1,
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
	Graphic3d_TypeOfLimit_HasPBR = 8,
	Graphic3d_TypeOfLimit_HasRayTracing = 9,
	Graphic3d_TypeOfLimit_HasRayTracingTextures = 10,
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling = 11,
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic = 12,
	Graphic3d_TypeOfLimit_HasSRGB = 13,
	Graphic3d_TypeOfLimit_HasBlendedOit = 14,
	Graphic3d_TypeOfLimit_HasBlendedOitMsaa = 15,
	Graphic3d_TypeOfLimit_HasFlatShading = 16,
	Graphic3d_TypeOfLimit_HasMeshEdges = 17,
	Graphic3d_TypeOfLimit_IsWorkaroundFBO = 18,
	Graphic3d_TypeOfLimit_NB = 19,
};

enum Graphic3d_TypeOfMaterial {
	Graphic3d_MATERIAL_ASPECT = 0,
	Graphic3d_MATERIAL_PHYSIC = 1,
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

enum Graphic3d_TypeOfReflection {
	Graphic3d_TOR_AMBIENT = 0,
	Graphic3d_TOR_DIFFUSE = 1,
	Graphic3d_TOR_SPECULAR = 2,
	Graphic3d_TOR_EMISSION = 3,
};

enum  {
	Graphic3d_TypeOfReflection_NB = 4,
};

enum Graphic3d_TypeOfShaderObject {
	Graphic3d_TOS_VERTEX = 1,
	Graphic3d_TOS_TESS_CONTROL = 2,
	Graphic3d_TOS_TESS_EVALUATION = 4,
	Graphic3d_TOS_GEOMETRY = 8,
	Graphic3d_TOS_FRAGMENT = 16,
	Graphic3d_TOS_COMPUTE = 32,
};

enum Graphic3d_TypeOfShadingModel {
	Graphic3d_TypeOfShadingModel_DEFAULT = - 1,
	Graphic3d_TypeOfShadingModel_Unlit = 0,
	Graphic3d_TypeOfShadingModel_PhongFacet = 1,
	Graphic3d_TypeOfShadingModel_Gouraud = 2,
	Graphic3d_TypeOfShadingModel_Phong = 3,
	Graphic3d_TypeOfShadingModel_Pbr = 4,
	Graphic3d_TypeOfShadingModel_PbrFacet = 5,
	Graphic3d_TOSM_DEFAULT = Graphic3d_TypeOfShadingModel_DEFAULT,
	Graphic3d_TOSM_UNLIT = Graphic3d_TypeOfShadingModel_Unlit,
	Graphic3d_TOSM_FACET = Graphic3d_TypeOfShadingModel_PhongFacet,
	Graphic3d_TOSM_VERTEX = Graphic3d_TypeOfShadingModel_Gouraud,
	Graphic3d_TOSM_FRAGMENT = Graphic3d_TypeOfShadingModel_Phong,
	Graphic3d_TOSM_PBR = Graphic3d_TypeOfShadingModel_Pbr,
	Graphic3d_TOSM_PBR_FACET = Graphic3d_TypeOfShadingModel_PbrFacet,
	Graphic3d_TOSM_NONE = Graphic3d_TOSM_UNLIT,
	V3d_COLOR = Graphic3d_TOSM_NONE,
	V3d_FLAT = Graphic3d_TOSM_FACET,
	V3d_GOURAUD = Graphic3d_TOSM_VERTEX,
	V3d_PHONG = Graphic3d_TOSM_FRAGMENT,
};

enum  {
	Graphic3d_TypeOfShadingModel_NB = Graphic3d_TypeOfShadingModel_PbrFacet + 1,
};

enum Graphic3d_TypeOfStructure {
	Graphic3d_TOS_WIREFRAME = 0,
	Graphic3d_TOS_SHADING = 1,
	Graphic3d_TOS_COMPUTED = 2,
	Graphic3d_TOS_ALL = 3,
};

enum Graphic3d_TypeOfTexture {
	Graphic3d_TypeOfTexture_1D = 0,
	Graphic3d_TypeOfTexture_2D = 1,
	Graphic3d_TypeOfTexture_3D = 2,
	Graphic3d_TypeOfTexture_CUBEMAP = 3,
	Graphic3d_TOT_2D_MIPMAP = 4,
	Graphic3d_TOT_1D = Graphic3d_TypeOfTexture_1D,
	Graphic3d_TOT_2D = Graphic3d_TypeOfTexture_2D,
	Graphic3d_TOT_CUBEMAP = Graphic3d_TypeOfTexture_CUBEMAP,
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

enum Graphic3d_TypeOfVisualization {
	Graphic3d_TOV_WIREFRAME = 0,
	Graphic3d_TOV_SHADING = 1,
};

enum Graphic3d_VerticalTextAlignment {
	Graphic3d_VTA_BOTTOM = 0,
	Graphic3d_VTA_CENTER = 1,
	Graphic3d_VTA_TOP = 2,
	Graphic3d_VTA_TOPFIRSTLINE = 3,
};

enum  {
	Graphic3d_ZLayerId_UNKNOWN = - 1,
	Graphic3d_ZLayerId_Default = 0,
	Graphic3d_ZLayerId_Top = - 2,
	Graphic3d_ZLayerId_Topmost = - 3,
	Graphic3d_ZLayerId_TopOSD = - 4,
	Graphic3d_ZLayerId_BotOSD = - 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Graphic3d_AlphaMode(IntEnum):
	Graphic3d_AlphaMode_Opaque = 0
	Graphic3d_AlphaMode_Mask = 1
	Graphic3d_AlphaMode_Blend = 2
	Graphic3d_AlphaMode_MaskBlend = 3
	Graphic3d_AlphaMode_BlendAuto = - 1
Graphic3d_AlphaMode_Opaque = Graphic3d_AlphaMode.Graphic3d_AlphaMode_Opaque
Graphic3d_AlphaMode_Mask = Graphic3d_AlphaMode.Graphic3d_AlphaMode_Mask
Graphic3d_AlphaMode_Blend = Graphic3d_AlphaMode.Graphic3d_AlphaMode_Blend
Graphic3d_AlphaMode_MaskBlend = Graphic3d_AlphaMode.Graphic3d_AlphaMode_MaskBlend
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

class Graphic3d_BufferType(IntEnum):
	Graphic3d_BT_RGB = 0
	Graphic3d_BT_RGBA = 1
	Graphic3d_BT_Depth = 2
	Graphic3d_BT_RGB_RayTraceHdrLeft = 3
	Graphic3d_BT_Red = 4
	Graphic3d_BT_ShadowMap = 5
Graphic3d_BT_RGB = Graphic3d_BufferType.Graphic3d_BT_RGB
Graphic3d_BT_RGBA = Graphic3d_BufferType.Graphic3d_BT_RGBA
Graphic3d_BT_Depth = Graphic3d_BufferType.Graphic3d_BT_Depth
Graphic3d_BT_RGB_RayTraceHdrLeft = Graphic3d_BufferType.Graphic3d_BT_RGB_RayTraceHdrLeft
Graphic3d_BT_Red = Graphic3d_BufferType.Graphic3d_BT_Red
Graphic3d_BT_ShadowMap = Graphic3d_BufferType.Graphic3d_BT_ShadowMap

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

class Graphic3d_ClipState(IntEnum):
	Graphic3d_ClipState_Out = 0
	Graphic3d_ClipState_In = 1
	Graphic3d_ClipState_On = 2
Graphic3d_ClipState_Out = Graphic3d_ClipState.Graphic3d_ClipState_Out
Graphic3d_ClipState_In = Graphic3d_ClipState.Graphic3d_ClipState_In
Graphic3d_ClipState_On = Graphic3d_ClipState.Graphic3d_ClipState_On

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

class Graphic3d_DisplayPriority(IntEnum):
	Graphic3d_DisplayPriority_INVALID = - 1
	Graphic3d_DisplayPriority_Bottom = 0
	Graphic3d_DisplayPriority_AlmostBottom = 1
	Graphic3d_DisplayPriority_Below2 = 2
	Graphic3d_DisplayPriority_Below1 = 3
	Graphic3d_DisplayPriority_Below = 4
	Graphic3d_DisplayPriority_Normal = 5
	Graphic3d_DisplayPriority_Above = 6
	Graphic3d_DisplayPriority_Above1 = 7
	Graphic3d_DisplayPriority_Above2 = 8
	Graphic3d_DisplayPriority_Highlight = 9
	Graphic3d_DisplayPriority_Topmost = 10
Graphic3d_DisplayPriority_INVALID = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_INVALID
Graphic3d_DisplayPriority_Bottom = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Bottom
Graphic3d_DisplayPriority_AlmostBottom = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_AlmostBottom
Graphic3d_DisplayPriority_Below2 = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Below2
Graphic3d_DisplayPriority_Below1 = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Below1
Graphic3d_DisplayPriority_Below = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Below
Graphic3d_DisplayPriority_Normal = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Normal
Graphic3d_DisplayPriority_Above = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Above
Graphic3d_DisplayPriority_Above1 = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Above1
Graphic3d_DisplayPriority_Above2 = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Above2
Graphic3d_DisplayPriority_Highlight = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Highlight
Graphic3d_DisplayPriority_Topmost = Graphic3d_DisplayPriority.Graphic3d_DisplayPriority_Topmost

class Graphic3d_FrameStatsCounter(IntEnum):
	Graphic3d_FrameStatsCounter_NbLayers = 0
	Graphic3d_FrameStatsCounter_NbStructs = 1
	Graphic3d_FrameStatsCounter_EstimatedBytesGeom = 2
	Graphic3d_FrameStatsCounter_EstimatedBytesFbos = 3
	Graphic3d_FrameStatsCounter_EstimatedBytesTextures = 4
	Graphic3d_FrameStatsCounter_NbLayersNotCulled = 5
	Graphic3d_FrameStatsCounter_NbStructsNotCulled = 6
	Graphic3d_FrameStatsCounter_NbGroupsNotCulled = 7
	Graphic3d_FrameStatsCounter_NbElemsNotCulled = 8
	Graphic3d_FrameStatsCounter_NbElemsFillNotCulled = 9
	Graphic3d_FrameStatsCounter_NbElemsLineNotCulled = 10
	Graphic3d_FrameStatsCounter_NbElemsPointNotCulled = 11
	Graphic3d_FrameStatsCounter_NbElemsTextNotCulled = 12
	Graphic3d_FrameStatsCounter_NbTrianglesNotCulled = 13
	Graphic3d_FrameStatsCounter_NbLinesNotCulled = 14
	Graphic3d_FrameStatsCounter_NbPointsNotCulled = 15
	Graphic3d_FrameStatsCounter_NbLayersImmediate = 16
	Graphic3d_FrameStatsCounter_NbStructsImmediate = 17
	Graphic3d_FrameStatsCounter_NbGroupsImmediate = 18
	Graphic3d_FrameStatsCounter_NbElemsImmediate = 19
	Graphic3d_FrameStatsCounter_NbElemsFillImmediate = 20
	Graphic3d_FrameStatsCounter_NbElemsLineImmediate = 21
	Graphic3d_FrameStatsCounter_NbElemsPointImmediate = 22
	Graphic3d_FrameStatsCounter_NbElemsTextImmediate = 23
	Graphic3d_FrameStatsCounter_NbTrianglesImmediate = 24
	Graphic3d_FrameStatsCounter_NbLinesImmediate = 25
	Graphic3d_FrameStatsCounter_NbPointsImmediate = 26
Graphic3d_FrameStatsCounter_NbLayers = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbLayers
Graphic3d_FrameStatsCounter_NbStructs = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbStructs
Graphic3d_FrameStatsCounter_EstimatedBytesGeom = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_EstimatedBytesGeom
Graphic3d_FrameStatsCounter_EstimatedBytesFbos = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_EstimatedBytesFbos
Graphic3d_FrameStatsCounter_EstimatedBytesTextures = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_EstimatedBytesTextures
Graphic3d_FrameStatsCounter_NbLayersNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbLayersNotCulled
Graphic3d_FrameStatsCounter_NbStructsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbStructsNotCulled
Graphic3d_FrameStatsCounter_NbGroupsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbGroupsNotCulled
Graphic3d_FrameStatsCounter_NbElemsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsNotCulled
Graphic3d_FrameStatsCounter_NbElemsFillNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsFillNotCulled
Graphic3d_FrameStatsCounter_NbElemsLineNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsLineNotCulled
Graphic3d_FrameStatsCounter_NbElemsPointNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsPointNotCulled
Graphic3d_FrameStatsCounter_NbElemsTextNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsTextNotCulled
Graphic3d_FrameStatsCounter_NbTrianglesNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbTrianglesNotCulled
Graphic3d_FrameStatsCounter_NbLinesNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbLinesNotCulled
Graphic3d_FrameStatsCounter_NbPointsNotCulled = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbPointsNotCulled
Graphic3d_FrameStatsCounter_NbLayersImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbLayersImmediate
Graphic3d_FrameStatsCounter_NbStructsImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbStructsImmediate
Graphic3d_FrameStatsCounter_NbGroupsImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbGroupsImmediate
Graphic3d_FrameStatsCounter_NbElemsImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsImmediate
Graphic3d_FrameStatsCounter_NbElemsFillImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsFillImmediate
Graphic3d_FrameStatsCounter_NbElemsLineImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsLineImmediate
Graphic3d_FrameStatsCounter_NbElemsPointImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsPointImmediate
Graphic3d_FrameStatsCounter_NbElemsTextImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbElemsTextImmediate
Graphic3d_FrameStatsCounter_NbTrianglesImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbTrianglesImmediate
Graphic3d_FrameStatsCounter_NbLinesImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbLinesImmediate
Graphic3d_FrameStatsCounter_NbPointsImmediate = Graphic3d_FrameStatsCounter.Graphic3d_FrameStatsCounter_NbPointsImmediate

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

class Graphic3d_GroupAspect(IntEnum):
	Graphic3d_ASPECT_LINE = 0
	Graphic3d_ASPECT_TEXT = 1
	Graphic3d_ASPECT_MARKER = 2
	Graphic3d_ASPECT_FILL_AREA = 3
Graphic3d_ASPECT_LINE = Graphic3d_GroupAspect.Graphic3d_ASPECT_LINE
Graphic3d_ASPECT_TEXT = Graphic3d_GroupAspect.Graphic3d_ASPECT_TEXT
Graphic3d_ASPECT_MARKER = Graphic3d_GroupAspect.Graphic3d_ASPECT_MARKER
Graphic3d_ASPECT_FILL_AREA = Graphic3d_GroupAspect.Graphic3d_ASPECT_FILL_AREA

class Graphic3d_HorizontalTextAlignment(IntEnum):
	Graphic3d_HTA_LEFT = 0
	Graphic3d_HTA_CENTER = 1
	Graphic3d_HTA_RIGHT = 2
Graphic3d_HTA_LEFT = Graphic3d_HorizontalTextAlignment.Graphic3d_HTA_LEFT
Graphic3d_HTA_CENTER = Graphic3d_HorizontalTextAlignment.Graphic3d_HTA_CENTER
Graphic3d_HTA_RIGHT = Graphic3d_HorizontalTextAlignment.Graphic3d_HTA_RIGHT

class Graphic3d_LevelOfTextureAnisotropy(IntEnum):
	Graphic3d_LOTA_OFF = 0
	Graphic3d_LOTA_FAST = 1
	Graphic3d_LOTA_MIDDLE = 2
	Graphic3d_LOTA_QUALITY = 3
Graphic3d_LOTA_OFF = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_OFF
Graphic3d_LOTA_FAST = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_FAST
Graphic3d_LOTA_MIDDLE = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_MIDDLE
Graphic3d_LOTA_QUALITY = Graphic3d_LevelOfTextureAnisotropy.Graphic3d_LOTA_QUALITY

class Graphic3d_NameOfMaterial(IntEnum):
	Graphic3d_NameOfMaterial_Brass = 0
	Graphic3d_NameOfMaterial_Bronze = 1
	Graphic3d_NameOfMaterial_Copper = 2
	Graphic3d_NameOfMaterial_Gold = 3
	Graphic3d_NameOfMaterial_Pewter = 4
	Graphic3d_NameOfMaterial_Plastered = 5
	Graphic3d_NameOfMaterial_Plastified = 6
	Graphic3d_NameOfMaterial_Silver = 7
	Graphic3d_NameOfMaterial_Steel = 8
	Graphic3d_NameOfMaterial_Stone = 9
	Graphic3d_NameOfMaterial_ShinyPlastified = 10
	Graphic3d_NameOfMaterial_Satin = 11
	Graphic3d_NameOfMaterial_Metalized = 12
	Graphic3d_NameOfMaterial_Ionized = 13
	Graphic3d_NameOfMaterial_Chrome = 14
	Graphic3d_NameOfMaterial_Aluminum = 15
	Graphic3d_NameOfMaterial_Obsidian = 16
	Graphic3d_NameOfMaterial_Neon = 17
	Graphic3d_NameOfMaterial_Jade = 18
	Graphic3d_NameOfMaterial_Charcoal = 19
	Graphic3d_NameOfMaterial_Water = 20
	Graphic3d_NameOfMaterial_Glass = 21
	Graphic3d_NameOfMaterial_Diamond = 22
	Graphic3d_NameOfMaterial_Transparent = 23
	Graphic3d_NameOfMaterial_DEFAULT = 24
	Graphic3d_NameOfMaterial_UserDefined = 25
	Graphic3d_NOM_BRASS = Graphic3d_NameOfMaterial_Brass
	Graphic3d_NOM_BRONZE = Graphic3d_NameOfMaterial_Bronze
	Graphic3d_NOM_COPPER = Graphic3d_NameOfMaterial_Copper
	Graphic3d_NOM_GOLD = Graphic3d_NameOfMaterial_Gold
	Graphic3d_NOM_PEWTER = Graphic3d_NameOfMaterial_Pewter
	Graphic3d_NOM_PLASTER = Graphic3d_NameOfMaterial_Plastered
	Graphic3d_NOM_PLASTIC = Graphic3d_NameOfMaterial_Plastified
	Graphic3d_NOM_SILVER = Graphic3d_NameOfMaterial_Silver
	Graphic3d_NOM_STEEL = Graphic3d_NameOfMaterial_Steel
	Graphic3d_NOM_STONE = Graphic3d_NameOfMaterial_Stone
	Graphic3d_NOM_SHINY_PLASTIC = Graphic3d_NameOfMaterial_ShinyPlastified
	Graphic3d_NOM_SATIN = Graphic3d_NameOfMaterial_Satin
	Graphic3d_NOM_METALIZED = Graphic3d_NameOfMaterial_Metalized
	Graphic3d_NOM_NEON_GNC = Graphic3d_NameOfMaterial_Ionized
	Graphic3d_NOM_CHROME = Graphic3d_NameOfMaterial_Chrome
	Graphic3d_NOM_ALUMINIUM = Graphic3d_NameOfMaterial_Aluminum
	Graphic3d_NOM_OBSIDIAN = Graphic3d_NameOfMaterial_Obsidian
	Graphic3d_NOM_NEON_PHC = Graphic3d_NameOfMaterial_Neon
	Graphic3d_NOM_JADE = Graphic3d_NameOfMaterial_Jade
	Graphic3d_NOM_CHARCOAL = Graphic3d_NameOfMaterial_Charcoal
	Graphic3d_NOM_WATER = Graphic3d_NameOfMaterial_Water
	Graphic3d_NOM_GLASS = Graphic3d_NameOfMaterial_Glass
	Graphic3d_NOM_DIAMOND = Graphic3d_NameOfMaterial_Diamond
	Graphic3d_NOM_TRANSPARENT = Graphic3d_NameOfMaterial_Transparent
	Graphic3d_NOM_DEFAULT = Graphic3d_NameOfMaterial_DEFAULT
	Graphic3d_NOM_UserDefined = Graphic3d_NameOfMaterial_UserDefined
Graphic3d_NameOfMaterial_Brass = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Brass
Graphic3d_NameOfMaterial_Bronze = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Bronze
Graphic3d_NameOfMaterial_Copper = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Copper
Graphic3d_NameOfMaterial_Gold = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Gold
Graphic3d_NameOfMaterial_Pewter = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Pewter
Graphic3d_NameOfMaterial_Plastered = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Plastered
Graphic3d_NameOfMaterial_Plastified = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Plastified
Graphic3d_NameOfMaterial_Silver = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Silver
Graphic3d_NameOfMaterial_Steel = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Steel
Graphic3d_NameOfMaterial_Stone = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Stone
Graphic3d_NameOfMaterial_ShinyPlastified = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_ShinyPlastified
Graphic3d_NameOfMaterial_Satin = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Satin
Graphic3d_NameOfMaterial_Metalized = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Metalized
Graphic3d_NameOfMaterial_Ionized = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Ionized
Graphic3d_NameOfMaterial_Chrome = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Chrome
Graphic3d_NameOfMaterial_Aluminum = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Aluminum
Graphic3d_NameOfMaterial_Obsidian = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Obsidian
Graphic3d_NameOfMaterial_Neon = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Neon
Graphic3d_NameOfMaterial_Jade = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Jade
Graphic3d_NameOfMaterial_Charcoal = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Charcoal
Graphic3d_NameOfMaterial_Water = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Water
Graphic3d_NameOfMaterial_Glass = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Glass
Graphic3d_NameOfMaterial_Diamond = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Diamond
Graphic3d_NameOfMaterial_Transparent = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_Transparent
Graphic3d_NameOfMaterial_DEFAULT = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_DEFAULT
Graphic3d_NameOfMaterial_UserDefined = Graphic3d_NameOfMaterial.Graphic3d_NameOfMaterial_UserDefined
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

class Graphic3d_NameOfTexture1D(IntEnum):
	Graphic3d_NOT_1D_ELEVATION = 0
	Graphic3d_NOT_1D_UNKNOWN = 1
Graphic3d_NOT_1D_ELEVATION = Graphic3d_NameOfTexture1D.Graphic3d_NOT_1D_ELEVATION
Graphic3d_NOT_1D_UNKNOWN = Graphic3d_NameOfTexture1D.Graphic3d_NOT_1D_UNKNOWN

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

class Graphic3d_NameOfTexturePlane(IntEnum):
	Graphic3d_NOTP_XY = 0
	Graphic3d_NOTP_YZ = 1
	Graphic3d_NOTP_ZX = 2
	Graphic3d_NOTP_UNKNOWN = 3
Graphic3d_NOTP_XY = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_XY
Graphic3d_NOTP_YZ = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_YZ
Graphic3d_NOTP_ZX = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_ZX
Graphic3d_NOTP_UNKNOWN = Graphic3d_NameOfTexturePlane.Graphic3d_NOTP_UNKNOWN

class Graphic3d_RenderTransparentMethod(IntEnum):
	Graphic3d_RTM_BLEND_UNORDERED = 0
	Graphic3d_RTM_BLEND_OIT = 1
	Graphic3d_RTM_DEPTH_PEELING_OIT = 2
Graphic3d_RTM_BLEND_UNORDERED = Graphic3d_RenderTransparentMethod.Graphic3d_RTM_BLEND_UNORDERED
Graphic3d_RTM_BLEND_OIT = Graphic3d_RenderTransparentMethod.Graphic3d_RTM_BLEND_OIT
Graphic3d_RTM_DEPTH_PEELING_OIT = Graphic3d_RenderTransparentMethod.Graphic3d_RTM_DEPTH_PEELING_OIT

class Graphic3d_RenderingMode(IntEnum):
	Graphic3d_RM_RASTERIZATION = 0
	Graphic3d_RM_RAYTRACING = 1
Graphic3d_RM_RASTERIZATION = Graphic3d_RenderingMode.Graphic3d_RM_RASTERIZATION
Graphic3d_RM_RAYTRACING = Graphic3d_RenderingMode.Graphic3d_RM_RAYTRACING

class Graphic3d_ShaderFlags(IntEnum):
	Graphic3d_ShaderFlags_VertColor = 1
	Graphic3d_ShaderFlags_TextureRGB = 2
	Graphic3d_ShaderFlags_TextureEnv = 4
	Graphic3d_ShaderFlags_TextureNormal = Graphic3d_ShaderFlags_TextureRGB | Graphic3d_ShaderFlags_TextureEnv
	Graphic3d_ShaderFlags_PointSimple = 8
	Graphic3d_ShaderFlags_PointSprite = 16
	Graphic3d_ShaderFlags_PointSpriteA = Graphic3d_ShaderFlags_PointSimple | Graphic3d_ShaderFlags_PointSprite
	Graphic3d_ShaderFlags_StippleLine = 32
	Graphic3d_ShaderFlags_ClipPlanes1 = 64
	Graphic3d_ShaderFlags_ClipPlanes2 = 128
	Graphic3d_ShaderFlags_ClipPlanesN = Graphic3d_ShaderFlags_ClipPlanes1 | Graphic3d_ShaderFlags_ClipPlanes2
	Graphic3d_ShaderFlags_ClipChains = 256
	Graphic3d_ShaderFlags_MeshEdges = 512
	Graphic3d_ShaderFlags_AlphaTest = 1024
	Graphic3d_ShaderFlags_WriteOit = 2048
	Graphic3d_ShaderFlags_OitDepthPeeling = 4096
	Graphic3d_ShaderFlags_NB = 8192
	Graphic3d_ShaderFlags_IsPoint = Graphic3d_ShaderFlags_PointSimple | Graphic3d_ShaderFlags_PointSprite | Graphic3d_ShaderFlags_PointSpriteA
	Graphic3d_ShaderFlags_HasTextures = Graphic3d_ShaderFlags_TextureRGB | Graphic3d_ShaderFlags_TextureEnv
	Graphic3d_ShaderFlags_NeedsGeomShader = Graphic3d_ShaderFlags_MeshEdges
Graphic3d_ShaderFlags_VertColor = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_VertColor
Graphic3d_ShaderFlags_TextureRGB = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_TextureRGB
Graphic3d_ShaderFlags_TextureEnv = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_TextureEnv
Graphic3d_ShaderFlags_TextureNormal = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_TextureNormal
Graphic3d_ShaderFlags_PointSimple = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_PointSimple
Graphic3d_ShaderFlags_PointSprite = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_PointSprite
Graphic3d_ShaderFlags_PointSpriteA = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_PointSpriteA
Graphic3d_ShaderFlags_StippleLine = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_StippleLine
Graphic3d_ShaderFlags_ClipPlanes1 = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_ClipPlanes1
Graphic3d_ShaderFlags_ClipPlanes2 = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_ClipPlanes2
Graphic3d_ShaderFlags_ClipPlanesN = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_ClipPlanesN
Graphic3d_ShaderFlags_ClipChains = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_ClipChains
Graphic3d_ShaderFlags_MeshEdges = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_MeshEdges
Graphic3d_ShaderFlags_AlphaTest = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_AlphaTest
Graphic3d_ShaderFlags_WriteOit = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_WriteOit
Graphic3d_ShaderFlags_OitDepthPeeling = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_OitDepthPeeling
Graphic3d_ShaderFlags_NB = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_NB
Graphic3d_ShaderFlags_IsPoint = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_IsPoint
Graphic3d_ShaderFlags_HasTextures = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_HasTextures
Graphic3d_ShaderFlags_NeedsGeomShader = Graphic3d_ShaderFlags.Graphic3d_ShaderFlags_NeedsGeomShader

class Graphic3d_GlslExtension(IntEnum):
	Graphic3d_GlslExtension_GL_OES_standard_derivatives = 0
	Graphic3d_GlslExtension_GL_EXT_shader_texture_lod = 1
	Graphic3d_GlslExtension_GL_EXT_frag_depth = 2
	Graphic3d_GlslExtension_GL_EXT_gpu_shader4 = 3
Graphic3d_GlslExtension_GL_OES_standard_derivatives = Graphic3d_GlslExtension.Graphic3d_GlslExtension_GL_OES_standard_derivatives
Graphic3d_GlslExtension_GL_EXT_shader_texture_lod = Graphic3d_GlslExtension.Graphic3d_GlslExtension_GL_EXT_shader_texture_lod
Graphic3d_GlslExtension_GL_EXT_frag_depth = Graphic3d_GlslExtension.Graphic3d_GlslExtension_GL_EXT_frag_depth
Graphic3d_GlslExtension_GL_EXT_gpu_shader4 = Graphic3d_GlslExtension.Graphic3d_GlslExtension_GL_EXT_gpu_shader4

class Graphic3d_StereoMode(IntEnum):
	Graphic3d_StereoMode_QuadBuffer = 0
	Graphic3d_StereoMode_Anaglyph = 1
	Graphic3d_StereoMode_RowInterlaced = 2
	Graphic3d_StereoMode_ColumnInterlaced = 3
	Graphic3d_StereoMode_ChessBoard = 4
	Graphic3d_StereoMode_SideBySide = 5
	Graphic3d_StereoMode_OverUnder = 6
	Graphic3d_StereoMode_SoftPageFlip = 7
	Graphic3d_StereoMode_OpenVR = 8
Graphic3d_StereoMode_QuadBuffer = Graphic3d_StereoMode.Graphic3d_StereoMode_QuadBuffer
Graphic3d_StereoMode_Anaglyph = Graphic3d_StereoMode.Graphic3d_StereoMode_Anaglyph
Graphic3d_StereoMode_RowInterlaced = Graphic3d_StereoMode.Graphic3d_StereoMode_RowInterlaced
Graphic3d_StereoMode_ColumnInterlaced = Graphic3d_StereoMode.Graphic3d_StereoMode_ColumnInterlaced
Graphic3d_StereoMode_ChessBoard = Graphic3d_StereoMode.Graphic3d_StereoMode_ChessBoard
Graphic3d_StereoMode_SideBySide = Graphic3d_StereoMode.Graphic3d_StereoMode_SideBySide
Graphic3d_StereoMode_OverUnder = Graphic3d_StereoMode.Graphic3d_StereoMode_OverUnder
Graphic3d_StereoMode_SoftPageFlip = Graphic3d_StereoMode.Graphic3d_StereoMode_SoftPageFlip
Graphic3d_StereoMode_OpenVR = Graphic3d_StereoMode.Graphic3d_StereoMode_OpenVR

class Graphic3d_TextPath(IntEnum):
	Graphic3d_TP_UP = 0
	Graphic3d_TP_DOWN = 1
	Graphic3d_TP_LEFT = 2
	Graphic3d_TP_RIGHT = 3
Graphic3d_TP_UP = Graphic3d_TextPath.Graphic3d_TP_UP
Graphic3d_TP_DOWN = Graphic3d_TextPath.Graphic3d_TP_DOWN
Graphic3d_TP_LEFT = Graphic3d_TextPath.Graphic3d_TP_LEFT
Graphic3d_TP_RIGHT = Graphic3d_TextPath.Graphic3d_TP_RIGHT

class Graphic3d_TextureSetBits(IntEnum):
	Graphic3d_TextureSetBits_NONE = 0
	Graphic3d_TextureSetBits_BaseColor = Graphic3d_TextureUnit_BaseColor
	Graphic3d_TextureSetBits_Emissive = Graphic3d_TextureUnit_Emissive
	Graphic3d_TextureSetBits_Occlusion = Graphic3d_TextureUnit_Occlusion
	Graphic3d_TextureSetBits_Normal = Graphic3d_TextureUnit_Normal
	Graphic3d_TextureSetBits_MetallicRoughness = Graphic3d_TextureUnit_MetallicRoughness
Graphic3d_TextureSetBits_NONE = Graphic3d_TextureSetBits.Graphic3d_TextureSetBits_NONE
Graphic3d_TextureSetBits_BaseColor = Graphic3d_TextureSetBits.Graphic3d_TextureSetBits_BaseColor
Graphic3d_TextureSetBits_Emissive = Graphic3d_TextureSetBits.Graphic3d_TextureSetBits_Emissive
Graphic3d_TextureSetBits_Occlusion = Graphic3d_TextureSetBits.Graphic3d_TextureSetBits_Occlusion
Graphic3d_TextureSetBits_Normal = Graphic3d_TextureSetBits.Graphic3d_TextureSetBits_Normal
Graphic3d_TextureSetBits_MetallicRoughness = Graphic3d_TextureSetBits.Graphic3d_TextureSetBits_MetallicRoughness

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
	Graphic3d_TextureUnit_Emissive = Graphic3d_TextureUnit_1
	Graphic3d_TextureUnit_Occlusion = Graphic3d_TextureUnit_2
	Graphic3d_TextureUnit_Normal = Graphic3d_TextureUnit_3
	Graphic3d_TextureUnit_MetallicRoughness = Graphic3d_TextureUnit_4
	Graphic3d_TextureUnit_EnvMap = Graphic3d_TextureUnit_0
	Graphic3d_TextureUnit_PointSprite = Graphic3d_TextureUnit_1
	Graphic3d_TextureUnit_DepthPeelingDepth = - 6
	Graphic3d_TextureUnit_DepthPeelingFrontColor = - 5
	Graphic3d_TextureUnit_ShadowMap = - 4
	Graphic3d_TextureUnit_PbrEnvironmentLUT = - 3
	Graphic3d_TextureUnit_PbrIblDiffuseSH = - 2
	Graphic3d_TextureUnit_PbrIblSpecular = - 1
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
Graphic3d_TextureUnit_Emissive = Graphic3d_TextureUnit.Graphic3d_TextureUnit_Emissive
Graphic3d_TextureUnit_Occlusion = Graphic3d_TextureUnit.Graphic3d_TextureUnit_Occlusion
Graphic3d_TextureUnit_Normal = Graphic3d_TextureUnit.Graphic3d_TextureUnit_Normal
Graphic3d_TextureUnit_MetallicRoughness = Graphic3d_TextureUnit.Graphic3d_TextureUnit_MetallicRoughness
Graphic3d_TextureUnit_EnvMap = Graphic3d_TextureUnit.Graphic3d_TextureUnit_EnvMap
Graphic3d_TextureUnit_PointSprite = Graphic3d_TextureUnit.Graphic3d_TextureUnit_PointSprite
Graphic3d_TextureUnit_DepthPeelingDepth = Graphic3d_TextureUnit.Graphic3d_TextureUnit_DepthPeelingDepth
Graphic3d_TextureUnit_DepthPeelingFrontColor = Graphic3d_TextureUnit.Graphic3d_TextureUnit_DepthPeelingFrontColor
Graphic3d_TextureUnit_ShadowMap = Graphic3d_TextureUnit.Graphic3d_TextureUnit_ShadowMap
Graphic3d_TextureUnit_PbrEnvironmentLUT = Graphic3d_TextureUnit.Graphic3d_TextureUnit_PbrEnvironmentLUT
Graphic3d_TextureUnit_PbrIblDiffuseSH = Graphic3d_TextureUnit.Graphic3d_TextureUnit_PbrIblDiffuseSH
Graphic3d_TextureUnit_PbrIblSpecular = Graphic3d_TextureUnit.Graphic3d_TextureUnit_PbrIblSpecular

class Graphic3d_ToneMappingMethod(IntEnum):
	Graphic3d_ToneMappingMethod_Disabled = 0
	Graphic3d_ToneMappingMethod_Filmic = 1
Graphic3d_ToneMappingMethod_Disabled = Graphic3d_ToneMappingMethod.Graphic3d_ToneMappingMethod_Disabled
Graphic3d_ToneMappingMethod_Filmic = Graphic3d_ToneMappingMethod.Graphic3d_ToneMappingMethod_Filmic

class Graphic3d_TransModeFlags(IntEnum):
	Graphic3d_TMF_None = 0
	Graphic3d_TMF_ZoomPers = 2
	Graphic3d_TMF_RotatePers = 8
	Graphic3d_TMF_TriedronPers = 32
	Graphic3d_TMF_2d = 64
	Graphic3d_TMF_CameraPers = 128
	Graphic3d_TMF_OrthoPers = 256
	Graphic3d_TMF_AxialScalePers = 512
	Graphic3d_TMF_ZoomRotatePers = Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers
	Graphic3d_TMF_AxialZoomPers = Graphic3d_TMF_ZoomPers | Graphic3d_TMF_AxialScalePers
Graphic3d_TMF_None = Graphic3d_TransModeFlags.Graphic3d_TMF_None
Graphic3d_TMF_ZoomPers = Graphic3d_TransModeFlags.Graphic3d_TMF_ZoomPers
Graphic3d_TMF_RotatePers = Graphic3d_TransModeFlags.Graphic3d_TMF_RotatePers
Graphic3d_TMF_TriedronPers = Graphic3d_TransModeFlags.Graphic3d_TMF_TriedronPers
Graphic3d_TMF_2d = Graphic3d_TransModeFlags.Graphic3d_TMF_2d
Graphic3d_TMF_CameraPers = Graphic3d_TransModeFlags.Graphic3d_TMF_CameraPers
Graphic3d_TMF_OrthoPers = Graphic3d_TransModeFlags.Graphic3d_TMF_OrthoPers
Graphic3d_TMF_AxialScalePers = Graphic3d_TransModeFlags.Graphic3d_TMF_AxialScalePers
Graphic3d_TMF_ZoomRotatePers = Graphic3d_TransModeFlags.Graphic3d_TMF_ZoomRotatePers
Graphic3d_TMF_AxialZoomPers = Graphic3d_TransModeFlags.Graphic3d_TMF_AxialZoomPers

class Graphic3d_TypeOfAnswer(IntEnum):
	Graphic3d_TOA_YES = 0
	Graphic3d_TOA_NO = 1
	Graphic3d_TOA_COMPUTE = 2
Graphic3d_TOA_YES = Graphic3d_TypeOfAnswer.Graphic3d_TOA_YES
Graphic3d_TOA_NO = Graphic3d_TypeOfAnswer.Graphic3d_TOA_NO
Graphic3d_TOA_COMPUTE = Graphic3d_TypeOfAnswer.Graphic3d_TOA_COMPUTE

class Graphic3d_TypeOfBackfacingModel(IntEnum):
	Graphic3d_TypeOfBackfacingModel_Auto = 0
	Graphic3d_TypeOfBackfacingModel_DoubleSided = 1
	Graphic3d_TypeOfBackfacingModel_BackCulled = 2
	Graphic3d_TypeOfBackfacingModel_FrontCulled = 3
	Graphic3d_TOBM_AUTOMATIC = Graphic3d_TypeOfBackfacingModel_Auto
	Graphic3d_TOBM_FORCE = Graphic3d_TypeOfBackfacingModel_DoubleSided
	Graphic3d_TOBM_DISABLE = Graphic3d_TypeOfBackfacingModel_BackCulled
	V3d_TOBM_AUTOMATIC = Graphic3d_TypeOfBackfacingModel_Auto
	V3d_TOBM_ALWAYS_DISPLAYED = Graphic3d_TypeOfBackfacingModel_DoubleSided
	V3d_TOBM_NEVER_DISPLAYED = Graphic3d_TypeOfBackfacingModel_BackCulled
Graphic3d_TypeOfBackfacingModel_Auto = Graphic3d_TypeOfBackfacingModel.Graphic3d_TypeOfBackfacingModel_Auto
Graphic3d_TypeOfBackfacingModel_DoubleSided = Graphic3d_TypeOfBackfacingModel.Graphic3d_TypeOfBackfacingModel_DoubleSided
Graphic3d_TypeOfBackfacingModel_BackCulled = Graphic3d_TypeOfBackfacingModel.Graphic3d_TypeOfBackfacingModel_BackCulled
Graphic3d_TypeOfBackfacingModel_FrontCulled = Graphic3d_TypeOfBackfacingModel.Graphic3d_TypeOfBackfacingModel_FrontCulled
Graphic3d_TOBM_AUTOMATIC = Graphic3d_TypeOfBackfacingModel.Graphic3d_TOBM_AUTOMATIC
Graphic3d_TOBM_FORCE = Graphic3d_TypeOfBackfacingModel.Graphic3d_TOBM_FORCE
Graphic3d_TOBM_DISABLE = Graphic3d_TypeOfBackfacingModel.Graphic3d_TOBM_DISABLE
V3d_TOBM_AUTOMATIC = Graphic3d_TypeOfBackfacingModel.V3d_TOBM_AUTOMATIC
V3d_TOBM_ALWAYS_DISPLAYED = Graphic3d_TypeOfBackfacingModel.V3d_TOBM_ALWAYS_DISPLAYED
V3d_TOBM_NEVER_DISPLAYED = Graphic3d_TypeOfBackfacingModel.V3d_TOBM_NEVER_DISPLAYED

class Graphic3d_TypeOfBackground(IntEnum):
	Graphic3d_TOB_NONE = - 1
	Graphic3d_TOB_GRADIENT = 1
	Graphic3d_TOB_TEXTURE = 2
	Graphic3d_TOB_CUBEMAP = 3
Graphic3d_TOB_NONE = Graphic3d_TypeOfBackground.Graphic3d_TOB_NONE
Graphic3d_TOB_GRADIENT = Graphic3d_TypeOfBackground.Graphic3d_TOB_GRADIENT
Graphic3d_TOB_TEXTURE = Graphic3d_TypeOfBackground.Graphic3d_TOB_TEXTURE
Graphic3d_TOB_CUBEMAP = Graphic3d_TypeOfBackground.Graphic3d_TOB_CUBEMAP

class Graphic3d_TypeOfConnection(IntEnum):
	Graphic3d_TOC_ANCESTOR = 0
	Graphic3d_TOC_DESCENDANT = 1
Graphic3d_TOC_ANCESTOR = Graphic3d_TypeOfConnection.Graphic3d_TOC_ANCESTOR
Graphic3d_TOC_DESCENDANT = Graphic3d_TypeOfConnection.Graphic3d_TOC_DESCENDANT

class Graphic3d_TypeOfLightSource(IntEnum):
	Graphic3d_TypeOfLightSource_Ambient = 0
	Graphic3d_TypeOfLightSource_Directional = 1
	Graphic3d_TypeOfLightSource_Positional = 2
	Graphic3d_TypeOfLightSource_Spot = 3
	Graphic3d_TOLS_AMBIENT = Graphic3d_TypeOfLightSource_Ambient
	Graphic3d_TOLS_DIRECTIONAL = Graphic3d_TypeOfLightSource_Directional
	Graphic3d_TOLS_POSITIONAL = Graphic3d_TypeOfLightSource_Positional
	Graphic3d_TOLS_SPOT = Graphic3d_TypeOfLightSource_Spot
	V3d_AMBIENT = Graphic3d_TypeOfLightSource_Ambient
	V3d_DIRECTIONAL = Graphic3d_TypeOfLightSource_Directional
	V3d_POSITIONAL = Graphic3d_TypeOfLightSource_Positional
	V3d_SPOT = Graphic3d_TypeOfLightSource_Spot
Graphic3d_TypeOfLightSource_Ambient = Graphic3d_TypeOfLightSource.Graphic3d_TypeOfLightSource_Ambient
Graphic3d_TypeOfLightSource_Directional = Graphic3d_TypeOfLightSource.Graphic3d_TypeOfLightSource_Directional
Graphic3d_TypeOfLightSource_Positional = Graphic3d_TypeOfLightSource.Graphic3d_TypeOfLightSource_Positional
Graphic3d_TypeOfLightSource_Spot = Graphic3d_TypeOfLightSource.Graphic3d_TypeOfLightSource_Spot
Graphic3d_TOLS_AMBIENT = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_AMBIENT
Graphic3d_TOLS_DIRECTIONAL = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_DIRECTIONAL
Graphic3d_TOLS_POSITIONAL = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_POSITIONAL
Graphic3d_TOLS_SPOT = Graphic3d_TypeOfLightSource.Graphic3d_TOLS_SPOT
V3d_AMBIENT = Graphic3d_TypeOfLightSource.V3d_AMBIENT
V3d_DIRECTIONAL = Graphic3d_TypeOfLightSource.V3d_DIRECTIONAL
V3d_POSITIONAL = Graphic3d_TypeOfLightSource.V3d_POSITIONAL
V3d_SPOT = Graphic3d_TypeOfLightSource.V3d_SPOT

class Graphic3d_TypeOfLimit(IntEnum):
	Graphic3d_TypeOfLimit_MaxNbLights = 0
	Graphic3d_TypeOfLimit_MaxNbClipPlanes = 1
	Graphic3d_TypeOfLimit_MaxNbViews = 2
	Graphic3d_TypeOfLimit_MaxTextureSize = 3
	Graphic3d_TypeOfLimit_MaxViewDumpSizeX = 4
	Graphic3d_TypeOfLimit_MaxViewDumpSizeY = 5
	Graphic3d_TypeOfLimit_MaxCombinedTextureUnits = 6
	Graphic3d_TypeOfLimit_MaxMsaa = 7
	Graphic3d_TypeOfLimit_HasPBR = 8
	Graphic3d_TypeOfLimit_HasRayTracing = 9
	Graphic3d_TypeOfLimit_HasRayTracingTextures = 10
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling = 11
	Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic = 12
	Graphic3d_TypeOfLimit_HasSRGB = 13
	Graphic3d_TypeOfLimit_HasBlendedOit = 14
	Graphic3d_TypeOfLimit_HasBlendedOitMsaa = 15
	Graphic3d_TypeOfLimit_HasFlatShading = 16
	Graphic3d_TypeOfLimit_HasMeshEdges = 17
	Graphic3d_TypeOfLimit_IsWorkaroundFBO = 18
	Graphic3d_TypeOfLimit_NB = 19
Graphic3d_TypeOfLimit_MaxNbLights = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxNbLights
Graphic3d_TypeOfLimit_MaxNbClipPlanes = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxNbClipPlanes
Graphic3d_TypeOfLimit_MaxNbViews = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxNbViews
Graphic3d_TypeOfLimit_MaxTextureSize = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxTextureSize
Graphic3d_TypeOfLimit_MaxViewDumpSizeX = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxViewDumpSizeX
Graphic3d_TypeOfLimit_MaxViewDumpSizeY = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxViewDumpSizeY
Graphic3d_TypeOfLimit_MaxCombinedTextureUnits = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxCombinedTextureUnits
Graphic3d_TypeOfLimit_MaxMsaa = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_MaxMsaa
Graphic3d_TypeOfLimit_HasPBR = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasPBR
Graphic3d_TypeOfLimit_HasRayTracing = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracing
Graphic3d_TypeOfLimit_HasRayTracingTextures = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracingTextures
Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSampling
Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasRayTracingAdaptiveSamplingAtomic
Graphic3d_TypeOfLimit_HasSRGB = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasSRGB
Graphic3d_TypeOfLimit_HasBlendedOit = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasBlendedOit
Graphic3d_TypeOfLimit_HasBlendedOitMsaa = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasBlendedOitMsaa
Graphic3d_TypeOfLimit_HasFlatShading = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasFlatShading
Graphic3d_TypeOfLimit_HasMeshEdges = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_HasMeshEdges
Graphic3d_TypeOfLimit_IsWorkaroundFBO = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_IsWorkaroundFBO
Graphic3d_TypeOfLimit_NB = Graphic3d_TypeOfLimit.Graphic3d_TypeOfLimit_NB

class Graphic3d_TypeOfMaterial(IntEnum):
	Graphic3d_MATERIAL_ASPECT = 0
	Graphic3d_MATERIAL_PHYSIC = 1
Graphic3d_MATERIAL_ASPECT = Graphic3d_TypeOfMaterial.Graphic3d_MATERIAL_ASPECT
Graphic3d_MATERIAL_PHYSIC = Graphic3d_TypeOfMaterial.Graphic3d_MATERIAL_PHYSIC

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

class Graphic3d_TypeOfReflection(IntEnum):
	Graphic3d_TOR_AMBIENT = 0
	Graphic3d_TOR_DIFFUSE = 1
	Graphic3d_TOR_SPECULAR = 2
	Graphic3d_TOR_EMISSION = 3
Graphic3d_TOR_AMBIENT = Graphic3d_TypeOfReflection.Graphic3d_TOR_AMBIENT
Graphic3d_TOR_DIFFUSE = Graphic3d_TypeOfReflection.Graphic3d_TOR_DIFFUSE
Graphic3d_TOR_SPECULAR = Graphic3d_TypeOfReflection.Graphic3d_TOR_SPECULAR
Graphic3d_TOR_EMISSION = Graphic3d_TypeOfReflection.Graphic3d_TOR_EMISSION

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

class Graphic3d_TypeOfShadingModel(IntEnum):
	Graphic3d_TypeOfShadingModel_DEFAULT = - 1
	Graphic3d_TypeOfShadingModel_Unlit = 0
	Graphic3d_TypeOfShadingModel_PhongFacet = 1
	Graphic3d_TypeOfShadingModel_Gouraud = 2
	Graphic3d_TypeOfShadingModel_Phong = 3
	Graphic3d_TypeOfShadingModel_Pbr = 4
	Graphic3d_TypeOfShadingModel_PbrFacet = 5
	Graphic3d_TOSM_DEFAULT = Graphic3d_TypeOfShadingModel_DEFAULT
	Graphic3d_TOSM_UNLIT = Graphic3d_TypeOfShadingModel_Unlit
	Graphic3d_TOSM_FACET = Graphic3d_TypeOfShadingModel_PhongFacet
	Graphic3d_TOSM_VERTEX = Graphic3d_TypeOfShadingModel_Gouraud
	Graphic3d_TOSM_FRAGMENT = Graphic3d_TypeOfShadingModel_Phong
	Graphic3d_TOSM_PBR = Graphic3d_TypeOfShadingModel_Pbr
	Graphic3d_TOSM_PBR_FACET = Graphic3d_TypeOfShadingModel_PbrFacet
	Graphic3d_TOSM_NONE = Graphic3d_TOSM_UNLIT
	V3d_COLOR = Graphic3d_TOSM_NONE
	V3d_FLAT = Graphic3d_TOSM_FACET
	V3d_GOURAUD = Graphic3d_TOSM_VERTEX
	V3d_PHONG = Graphic3d_TOSM_FRAGMENT
Graphic3d_TypeOfShadingModel_DEFAULT = Graphic3d_TypeOfShadingModel.Graphic3d_TypeOfShadingModel_DEFAULT
Graphic3d_TypeOfShadingModel_Unlit = Graphic3d_TypeOfShadingModel.Graphic3d_TypeOfShadingModel_Unlit
Graphic3d_TypeOfShadingModel_PhongFacet = Graphic3d_TypeOfShadingModel.Graphic3d_TypeOfShadingModel_PhongFacet
Graphic3d_TypeOfShadingModel_Gouraud = Graphic3d_TypeOfShadingModel.Graphic3d_TypeOfShadingModel_Gouraud
Graphic3d_TypeOfShadingModel_Phong = Graphic3d_TypeOfShadingModel.Graphic3d_TypeOfShadingModel_Phong
Graphic3d_TypeOfShadingModel_Pbr = Graphic3d_TypeOfShadingModel.Graphic3d_TypeOfShadingModel_Pbr
Graphic3d_TypeOfShadingModel_PbrFacet = Graphic3d_TypeOfShadingModel.Graphic3d_TypeOfShadingModel_PbrFacet
Graphic3d_TOSM_DEFAULT = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_DEFAULT
Graphic3d_TOSM_UNLIT = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_UNLIT
Graphic3d_TOSM_FACET = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_FACET
Graphic3d_TOSM_VERTEX = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_VERTEX
Graphic3d_TOSM_FRAGMENT = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_FRAGMENT
Graphic3d_TOSM_PBR = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_PBR
Graphic3d_TOSM_PBR_FACET = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_PBR_FACET
Graphic3d_TOSM_NONE = Graphic3d_TypeOfShadingModel.Graphic3d_TOSM_NONE
V3d_COLOR = Graphic3d_TypeOfShadingModel.V3d_COLOR
V3d_FLAT = Graphic3d_TypeOfShadingModel.V3d_FLAT
V3d_GOURAUD = Graphic3d_TypeOfShadingModel.V3d_GOURAUD
V3d_PHONG = Graphic3d_TypeOfShadingModel.V3d_PHONG

class Graphic3d_TypeOfStructure(IntEnum):
	Graphic3d_TOS_WIREFRAME = 0
	Graphic3d_TOS_SHADING = 1
	Graphic3d_TOS_COMPUTED = 2
	Graphic3d_TOS_ALL = 3
Graphic3d_TOS_WIREFRAME = Graphic3d_TypeOfStructure.Graphic3d_TOS_WIREFRAME
Graphic3d_TOS_SHADING = Graphic3d_TypeOfStructure.Graphic3d_TOS_SHADING
Graphic3d_TOS_COMPUTED = Graphic3d_TypeOfStructure.Graphic3d_TOS_COMPUTED
Graphic3d_TOS_ALL = Graphic3d_TypeOfStructure.Graphic3d_TOS_ALL

class Graphic3d_TypeOfTexture(IntEnum):
	Graphic3d_TypeOfTexture_1D = 0
	Graphic3d_TypeOfTexture_2D = 1
	Graphic3d_TypeOfTexture_3D = 2
	Graphic3d_TypeOfTexture_CUBEMAP = 3
	Graphic3d_TOT_2D_MIPMAP = 4
	Graphic3d_TOT_1D = Graphic3d_TypeOfTexture_1D
	Graphic3d_TOT_2D = Graphic3d_TypeOfTexture_2D
	Graphic3d_TOT_CUBEMAP = Graphic3d_TypeOfTexture_CUBEMAP
Graphic3d_TypeOfTexture_1D = Graphic3d_TypeOfTexture.Graphic3d_TypeOfTexture_1D
Graphic3d_TypeOfTexture_2D = Graphic3d_TypeOfTexture.Graphic3d_TypeOfTexture_2D
Graphic3d_TypeOfTexture_3D = Graphic3d_TypeOfTexture.Graphic3d_TypeOfTexture_3D
Graphic3d_TypeOfTexture_CUBEMAP = Graphic3d_TypeOfTexture.Graphic3d_TypeOfTexture_CUBEMAP
Graphic3d_TOT_2D_MIPMAP = Graphic3d_TypeOfTexture.Graphic3d_TOT_2D_MIPMAP
Graphic3d_TOT_1D = Graphic3d_TypeOfTexture.Graphic3d_TOT_1D
Graphic3d_TOT_2D = Graphic3d_TypeOfTexture.Graphic3d_TOT_2D
Graphic3d_TOT_CUBEMAP = Graphic3d_TypeOfTexture.Graphic3d_TOT_CUBEMAP

class Graphic3d_TypeOfTextureFilter(IntEnum):
	Graphic3d_TOTF_NEAREST = 0
	Graphic3d_TOTF_BILINEAR = 1
	Graphic3d_TOTF_TRILINEAR = 2
Graphic3d_TOTF_NEAREST = Graphic3d_TypeOfTextureFilter.Graphic3d_TOTF_NEAREST
Graphic3d_TOTF_BILINEAR = Graphic3d_TypeOfTextureFilter.Graphic3d_TOTF_BILINEAR
Graphic3d_TOTF_TRILINEAR = Graphic3d_TypeOfTextureFilter.Graphic3d_TOTF_TRILINEAR

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

class Graphic3d_TypeOfVisualization(IntEnum):
	Graphic3d_TOV_WIREFRAME = 0
	Graphic3d_TOV_SHADING = 1
Graphic3d_TOV_WIREFRAME = Graphic3d_TypeOfVisualization.Graphic3d_TOV_WIREFRAME
Graphic3d_TOV_SHADING = Graphic3d_TypeOfVisualization.Graphic3d_TOV_SHADING

class Graphic3d_VerticalTextAlignment(IntEnum):
	Graphic3d_VTA_BOTTOM = 0
	Graphic3d_VTA_CENTER = 1
	Graphic3d_VTA_TOP = 2
	Graphic3d_VTA_TOPFIRSTLINE = 3
Graphic3d_VTA_BOTTOM = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_BOTTOM
Graphic3d_VTA_CENTER = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_CENTER
Graphic3d_VTA_TOP = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_TOP
Graphic3d_VTA_TOPFIRSTLINE = Graphic3d_VerticalTextAlignment.Graphic3d_VTA_TOPFIRSTLINE
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Graphic3d_ArrayOfPrimitives)
%wrap_handle(Graphic3d_Aspects)
%wrap_handle(Graphic3d_BoundBuffer)
%wrap_handle(Graphic3d_BvhCStructureSet)
%wrap_handle(Graphic3d_CLight)
%wrap_handle(Graphic3d_CStructure)
%wrap_handle(Graphic3d_Camera)
%wrap_handle(Graphic3d_ClipPlane)
%wrap_handle(Graphic3d_DataStructureManager)
%wrap_handle(Graphic3d_Flipper)
%wrap_handle(Graphic3d_FrameStats)
%wrap_handle(Graphic3d_GraphicDriver)
%wrap_handle(Graphic3d_GraphicDriverFactory)
%wrap_handle(Graphic3d_Group)
%wrap_handle(Graphic3d_HatchStyle)
%wrap_handle(Graphic3d_Layer)
%wrap_handle(Graphic3d_LightSet)
%wrap_handle(Graphic3d_MarkerImage)
%wrap_handle(Graphic3d_PresentationAttributes)
%wrap_handle(Graphic3d_SequenceOfHClipPlane)
%wrap_handle(Graphic3d_ShaderAttribute)
%wrap_handle(Graphic3d_ShaderManager)
%wrap_handle(Graphic3d_ShaderObject)
%wrap_handle(Graphic3d_ShaderProgram)
%wrap_handle(Graphic3d_ShaderVariable)
%wrap_handle(Graphic3d_Structure)
%wrap_handle(Graphic3d_StructureManager)
%wrap_handle(Graphic3d_Text)
%wrap_handle(Graphic3d_TextureParams)
%wrap_handle(Graphic3d_TextureRoot)
%wrap_handle(Graphic3d_TransformPers)
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
%wrap_handle(Graphic3d_AttribBuffer)
%wrap_handle(Graphic3d_CView)
%wrap_handle(Graphic3d_MediaTextureSet)
%wrap_handle(Graphic3d_TextureEnv)
%wrap_handle(Graphic3d_TextureMap)
%wrap_handle(Graphic3d_TransformPersScaledAbove)
%wrap_handle(Graphic3d_CubeMap)
%wrap_handle(Graphic3d_MutableIndexBuffer)
%wrap_handle(Graphic3d_Texture1D)
%wrap_handle(Graphic3d_Texture2D)
%wrap_handle(Graphic3d_Texture3D)
%wrap_handle(Graphic3d_CubeMapSeparate)
%wrap_handle(Graphic3d_MediaTexture)
%wrap_handle(Graphic3d_Texture1Dmanual)
%wrap_handle(Graphic3d_Texture1Dsegment)
%wrap_handle(Graphic3d_Texture2Dplane)
/* end handles declaration */

/* templates */
%template(Graphic3d_Mat4) NCollection_Mat4<float>;
%template(Graphic3d_Mat4d) NCollection_Mat4<double>;
%template(Graphic3d_SequenceOfGroup) NCollection_Sequence<opencascade::handle<Graphic3d_Group>>;

%extend NCollection_Sequence<opencascade::handle<Graphic3d_Group>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Graphic3d_SequenceOfStructure) NCollection_Sequence<opencascade::handle<Graphic3d_Structure>>;

%extend NCollection_Sequence<opencascade::handle<Graphic3d_Structure>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Graphic3d_Vec2) NCollection_Vec2<float>;
%template(Graphic3d_Vec2b) NCollection_Vec2<char>;
%template(Graphic3d_Vec2d) NCollection_Vec2<double>;
%template(Graphic3d_Vec2i) NCollection_Vec2<int>;
%template(Graphic3d_Vec2ub) NCollection_Vec2<uint8_t>;
%template(Graphic3d_Vec3) NCollection_Vec3<float>;
%template(Graphic3d_Vec3b) NCollection_Vec3<char>;
%template(Graphic3d_Vec3d) NCollection_Vec3<double>;
%template(Graphic3d_Vec3i) NCollection_Vec3<int>;
%template(Graphic3d_Vec3ub) NCollection_Vec3<uint8_t>;
%template(Graphic3d_Vec4) NCollection_Vec4<float>;
%template(Graphic3d_Vec4b) NCollection_Vec4<char>;
%template(Graphic3d_Vec4d) NCollection_Vec4<double>;
%template(Graphic3d_Vec4i) NCollection_Vec4<int>;
%template(Graphic3d_Vec4ub) NCollection_Vec4<uint8_t>;
/* end templates declaration */

/* typedefs */
typedef int Graphic3d_ArrayFlags;
typedef std::array<NCollection_IndexedMap<const Graphic3d_CStructure *>, Graphic3d_DisplayPriority_NB> Graphic3d_ArrayOfIndexedMapOfStructure;
typedef BVH_Box<double, 3> Graphic3d_BndBox3d;
typedef BVH_Box<double, 4> Graphic3d_BndBox4d;
typedef BVH_Box<float, 4> Graphic3d_BndBox4f;
typedef NCollection_Mat4<float> Graphic3d_Mat4;
typedef NCollection_Mat4<double> Graphic3d_Mat4d;
typedef NCollection_Shared<NCollection_Map<const Standard_Transient *>> Graphic3d_NMapOfTransient;
typedef NCollection_Sequence<opencascade::handle<Graphic3d_Group>> Graphic3d_SequenceOfGroup;
typedef NCollection_Sequence<opencascade::handle<Graphic3d_Structure>> Graphic3d_SequenceOfStructure;
typedef Graphic3d_UniformValue<float> Graphic3d_UniformFloat;
typedef Graphic3d_UniformValue<int> Graphic3d_UniformInt;
typedef Graphic3d_UniformValue<NCollection_Mat3<float>> Graphic3d_UniformMat3;
typedef Graphic3d_UniformValue<NCollection_Mat4<float>> Graphic3d_UniformMat4;
typedef Graphic3d_UniformValue<NCollection_Vec2<float>> Graphic3d_UniformVec2;
typedef Graphic3d_UniformValue<NCollection_Vec2<int>> Graphic3d_UniformVec2i;
typedef Graphic3d_UniformValue<NCollection_Vec3<float>> Graphic3d_UniformVec3;
typedef Graphic3d_UniformValue<NCollection_Vec3<int>> Graphic3d_UniformVec3i;
typedef Graphic3d_UniformValue<NCollection_Vec4<float>> Graphic3d_UniformVec4;
typedef Graphic3d_UniformValue<NCollection_Vec4<int>> Graphic3d_UniformVec4i;
typedef NCollection_Vec2<float> Graphic3d_Vec2;
typedef NCollection_Vec2<char> Graphic3d_Vec2b;
typedef NCollection_Vec2<double> Graphic3d_Vec2d;
typedef NCollection_Vec2<int> Graphic3d_Vec2i;
typedef NCollection_Vec2<uint8_t> Graphic3d_Vec2ub;
typedef NCollection_Vec3<float> Graphic3d_Vec3;
typedef NCollection_Vec3<char> Graphic3d_Vec3b;
typedef NCollection_Vec3<double> Graphic3d_Vec3d;
typedef NCollection_Vec3<int> Graphic3d_Vec3i;
typedef NCollection_Vec3<uint8_t> Graphic3d_Vec3ub;
typedef NCollection_Vec4<float> Graphic3d_Vec4;
typedef NCollection_Vec4<char> Graphic3d_Vec4b;
typedef NCollection_Vec4<double> Graphic3d_Vec4d;
typedef NCollection_Vec4<int> Graphic3d_Vec4i;
typedef NCollection_Vec4<uint8_t> Graphic3d_Vec4ub;
typedef int Graphic3d_ZLayerId;
/* end typedefs declaration */

/************************************
* class Graphic3d_ArrayOfPrimitives *
************************************/
%nodefaultctor Graphic3d_ArrayOfPrimitives;
class Graphic3d_ArrayOfPrimitives : public Standard_Transient {
	public:
		/****** Graphic3d_ArrayOfPrimitives::AddBound ******/
		/****** md5 signature: 1bcfcb99cacde8c6e2a7b131afcb2bf9 ******/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "
Parameters
----------
theEdgeNumber: int

Return
-------
int

Description
-----------
Adds a bound of length theEdgeNumber in the bound array 
Return: the actual bounds number.
") AddBound;
		int AddBound(const int theEdgeNumber);

		/****** Graphic3d_ArrayOfPrimitives::AddBound ******/
		/****** md5 signature: 1149b352086012aa8518efb4c1adf996 ******/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "
Parameters
----------
theEdgeNumber: int
theBColor: Quantity_Color

Return
-------
int

Description
-----------
Adds a bound of length theEdgeNumber and bound color theBColor in the bound array. Warning: theBColor is ignored when the hasBColors constructor parameter is False 
Return: the actual bounds number.
") AddBound;
		int AddBound(const int theEdgeNumber, const Quantity_Color & theBColor);

		/****** Graphic3d_ArrayOfPrimitives::AddBound ******/
		/****** md5 signature: 5120c21844552b247b43b8310d5e9672 ******/
		%feature("compactdefaultargs") AddBound;
		%feature("autodoc", "
Parameters
----------
theEdgeNumber: int
theR: double
theG: double
theB: double

Return
-------
int

Description
-----------
Adds a bound of length theEdgeNumber and bound color coordinates in the bound array. Warning: <theR,theG,theB> are ignored when the hasBColors constructor parameter is False 
Return: the actual bounds number.
") AddBound;
		int AddBound(const int theEdgeNumber, const double theR, const double theG, const double theB);

		/****** Graphic3d_ArrayOfPrimitives::AddEdge ******/
		/****** md5 signature: b9dd3783a653eec587a60ece4ad49218 ******/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "
Parameters
----------
theVertexIndex: int

Return
-------
int

Description
-----------
Adds an edge in the range [1,VertexNumber()] in the array. 
Return: the actual edges number.
") AddEdge;
		int AddEdge(const int theVertexIndex);

		/****** Graphic3d_ArrayOfPrimitives::AddEdges ******/
		/****** md5 signature: 0e5882d10b18bf5c14964d75e9492e8f ******/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "
Parameters
----------
theVertexIndex1: int
theVertexIndex2: int

Return
-------
int

Description
-----------
Convenience method, adds two vertex indices (a segment) in the range [1,VertexNumber()] in the array. 
Return: the actual edges number.
") AddEdges;
		int AddEdges(int theVertexIndex1, int theVertexIndex2);

		/****** Graphic3d_ArrayOfPrimitives::AddEdges ******/
		/****** md5 signature: eb1dea0f392235fbd5d9a9ea524ddc5d ******/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "
Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int

Return
-------
int

Description
-----------
Convenience method, adds three vertex indices (a triangle) in the range [1,VertexNumber()] in the array. 
Return: the actual edges number.
") AddEdges;
		int AddEdges(int theVertexIndex1, int theVertexIndex2, int theVertexIndex3);

		/****** Graphic3d_ArrayOfPrimitives::AddEdges ******/
		/****** md5 signature: 9f9a6e08e37fa61630b9641c476afd47 ******/
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "
Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int
theVertexIndex4: int

Return
-------
int

Description
-----------
Convenience method, adds four vertex indices (a quad) in the range [1,VertexNumber()] in the array. 
Return: the actual edges number.
") AddEdges;
		int AddEdges(int theVertexIndex1, int theVertexIndex2, int theVertexIndex3, int theVertexIndex4);

		/****** Graphic3d_ArrayOfPrimitives::AddPolylineEdges ******/
		/****** md5 signature: 08825ba572fcf2394f32d3d510efb6fc ******/
		%feature("compactdefaultargs") AddPolylineEdges;
		%feature("autodoc", "
Parameters
----------
theVertexLower: int
theVertexUpper: int
theToClose: bool

Return
-------
None

Description
-----------
Add line strip (polyline) into indexed segments array. N-1 segments are added from N input nodes (or N with closed flag). Raises exception if array is not of type Graphic3d_TOPA_SEGMENTS. 
Input parameter: theVertexLower index of first node defining line strip fun (center) 
Input parameter: theVertexUpper index of last node defining triangle fun 
Input parameter: theToClose close triangle fan (connect first and last points).
") AddPolylineEdges;
		void AddPolylineEdges(int theVertexLower, int theVertexUpper, bool theToClose);

		/****** Graphic3d_ArrayOfPrimitives::AddQuadEdges ******/
		/****** md5 signature: 64106190580717462cf09d67aed193c5 ******/
		%feature("compactdefaultargs") AddQuadEdges;
		%feature("autodoc", "
Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int
theVertexIndex4: int

Return
-------
int

Description
-----------
Convenience method, adds four vertex indices (a quad) in the range [1,VertexNumber()] in the array of quads. Raises exception if array is not of type Graphic3d_TOPA_QUADRANGLES. 
Return: the actual edges number.
") AddQuadEdges;
		int AddQuadEdges(int theVertexIndex1, int theVertexIndex2, int theVertexIndex3, int theVertexIndex4);

		/****** Graphic3d_ArrayOfPrimitives::AddQuadTriangleEdges ******/
		/****** md5 signature: 43568f73a694733456bb4a2a663dea57 ******/
		%feature("compactdefaultargs") AddQuadTriangleEdges;
		%feature("autodoc", "
Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int
theVertexIndex4: int

Return
-------
int

Description
-----------
Convenience method, adds quad indices in the range [1,VertexNumber()] into array or triangles as two triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. 
Return: the actual edges number.
") AddQuadTriangleEdges;
		int AddQuadTriangleEdges(int theVertexIndex1, int theVertexIndex2, int theVertexIndex3, int theVertexIndex4);

		/****** Graphic3d_ArrayOfPrimitives::AddQuadTriangleEdges ******/
		/****** md5 signature: e5f34e0fd52452f7a4f433795390453a ******/
		%feature("compactdefaultargs") AddQuadTriangleEdges;
		%feature("autodoc", "
Parameters
----------
theIndexes: NCollection_Vec4<int>

Return
-------
int

Description
-----------
Convenience method, adds quad indices in the range [1,VertexNumber()] into array or triangles as two triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. 
Return: the actual edges number.
") AddQuadTriangleEdges;
		int AddQuadTriangleEdges(const NCollection_Vec4<int> & theIndexes);

		/****** Graphic3d_ArrayOfPrimitives::AddSegmentEdges ******/
		/****** md5 signature: c4f5944d108e5c74351ceaa0b89fbdab ******/
		%feature("compactdefaultargs") AddSegmentEdges;
		%feature("autodoc", "
Parameters
----------
theVertexIndex1: int
theVertexIndex2: int

Return
-------
int

Description
-----------
Convenience method, adds two vertex indices (a segment) in the range [1,VertexNumber()] in the array of segments (Graphic3d_TOPA_SEGMENTS). Raises exception if array is not of type Graphic3d_TOPA_SEGMENTS. 
Return: the actual edges number.
") AddSegmentEdges;
		int AddSegmentEdges(int theVertexIndex1, int theVertexIndex2);

		/****** Graphic3d_ArrayOfPrimitives::AddTriangleEdges ******/
		/****** md5 signature: eacbad43b39b006218e2b1821fcbe87e ******/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "
Parameters
----------
theVertexIndex1: int
theVertexIndex2: int
theVertexIndex3: int

Return
-------
int

Description
-----------
Convenience method, adds three vertex indices of triangle in the range [1,VertexNumber()] in the array of triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. 
Return: the actual edges number.
") AddTriangleEdges;
		int AddTriangleEdges(int theVertexIndex1, int theVertexIndex2, int theVertexIndex3);

		/****** Graphic3d_ArrayOfPrimitives::AddTriangleEdges ******/
		/****** md5 signature: 4c93ed0e82676266069aa1271f37aa96 ******/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "
Parameters
----------
theIndexes: NCollection_Vec3<int>

Return
-------
int

Description
-----------
Convenience method, adds three vertex indices of triangle in the range [1,VertexNumber()] in the array of triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. 
Return: the actual edges number.
") AddTriangleEdges;
		int AddTriangleEdges(const NCollection_Vec3<int> & theIndexes);

		/****** Graphic3d_ArrayOfPrimitives::AddTriangleEdges ******/
		/****** md5 signature: d374810f81d610470789ba7bc090eb2e ******/
		%feature("compactdefaultargs") AddTriangleEdges;
		%feature("autodoc", "
Parameters
----------
theIndexes: NCollection_Vec4<int>

Return
-------
int

Description
-----------
Convenience method, adds three vertex indices (4th component is ignored) of triangle in the range [1,VertexNumber()] in the array of triangles. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. 
Return: the actual edges number.
") AddTriangleEdges;
		int AddTriangleEdges(const NCollection_Vec4<int> & theIndexes);

		/****** Graphic3d_ArrayOfPrimitives::AddTriangleFanEdges ******/
		/****** md5 signature: 7693ae345991c7e13be943f0fd91d0d4 ******/
		%feature("compactdefaultargs") AddTriangleFanEdges;
		%feature("autodoc", "
Parameters
----------
theVertexLower: int
theVertexUpper: int
theToClose: bool

Return
-------
None

Description
-----------
Add triangle fan into indexed triangulation array. N-2 triangles are added from N input nodes (or N-1 with closed flag). Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. 
Input parameter: theVertexLower index of first node defining triangle fun (center) 
Input parameter: theVertexUpper index of last node defining triangle fun 
Input parameter: theToClose close triangle fan (connect first and last points).
") AddTriangleFanEdges;
		void AddTriangleFanEdges(int theVertexLower, int theVertexUpper, bool theToClose);

		/****** Graphic3d_ArrayOfPrimitives::AddTriangleStripEdges ******/
		/****** md5 signature: f57cd236997d3aac76106e0b39e5b99f ******/
		%feature("compactdefaultargs") AddTriangleStripEdges;
		%feature("autodoc", "
Parameters
----------
theVertexLower: int
theVertexUpper: int

Return
-------
None

Description
-----------
Add triangle strip into indexed triangulation array. N-2 triangles are added from N input nodes. Raises exception if array is not of type Graphic3d_TOPA_TRIANGLES. 
Input parameter: theVertexLower index of first node defining triangle strip 
Input parameter: theVertexUpper index of last node defining triangle strip.
") AddTriangleStripEdges;
		void AddTriangleStripEdges(int theVertexLower, int theVertexUpper);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: ccdc92a058c690d4e4ab183973af6a0f ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt

Return
-------
int

Description
-----------
Adds a vertice in the array. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 5b82752acdee064baca3b692bb6fda42 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: NCollection_Vec3<float>

Return
-------
int

Description
-----------
Adds a vertice in the array. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const NCollection_Vec3<float> & theVertex);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 061c16f12701d5d1e76a3fe38989766e ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double

Return
-------
int

Description
-----------
Adds a vertice in the array. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const double theX, const double theY, const double theZ);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 29abf68792c6eee67ebdfbdf069c0013 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
int

Description
-----------
Adds a vertice in the array. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const float theX, const float theY, const float theZ);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 1280f57116104bf745ac9f6a4282dd2b ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theColor: Quantity_Color

Return
-------
int

Description
-----------
Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const Quantity_Color & theColor);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 253d056b626e39f087bb8f03985cbebd ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theColor32: int

Return
-------
int

Description
-----------
Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const int theColor32);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 7efe0c78b72089e54cf99806408a4259 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theColor: NCollection_Vec4<uint8_t>

Return
-------
int

Description
-----------
Adds a vertice and vertex color in the vertex array. Warning: theColor is ignored when the hasVColors constructor parameter is False 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const NCollection_Vec4<uint8_t> & theColor);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: c9e6365fc10ff747ca052c07d245105d ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir

Return
-------
int

Description
-----------
Adds a vertice and vertex normal in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: e2168f50f9c1f54a74e29ee7b5d58f33 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double
theNX: double
theNY: double
theNZ: double

Return
-------
int

Description
-----------
Adds a vertice and vertex normal in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const double theX, const double theY, const double theZ, const double theNX, const double theNY, const double theNZ);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 913febcd9dceca8c2d630f7a58a1b2f9 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float
theNX: float
theNY: float
theNZ: float

Return
-------
int

Description
-----------
Adds a vertice and vertex normal in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const float theX, const float theY, const float theZ, const float theNX, const float theNY, const float theNZ);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: e206b699d88f0de22b60bc060764c114 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir
theColor: Quantity_Color

Return
-------
int

Description
-----------
Adds a vertice,vertex normal and color in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theColor is ignored when the hasVColors constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal, const Quantity_Color & theColor);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 21c798286dbb81685c56324a351828bc ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir
theColor32: int

Return
-------
int

Description
-----------
Adds a vertice,vertex normal and color in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theColor is ignored when the hasVColors constructor parameter is False. @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal, const int theColor32);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 73235c1cfbf79b43c85f2d5ea3fdf354 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theTexel: gp_Pnt2d

Return
-------
int

Description
-----------
Adds a vertice and vertex texture in the vertex array. theTexel is ignored when the hasVTexels constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const gp_Pnt2d & theTexel);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 39d192179e47a864b255a4b5b4e6360f ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double
theTX: double
theTY: double

Return
-------
int

Description
-----------
Adds a vertice and vertex texture coordinates in the vertex array. Texel is ignored when the hasVTexels constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const double theX, const double theY, const double theZ, const double theTX, const double theTY);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: a8781a85d62575276d197900080a4dc4 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float
theTX: float
theTY: float

Return
-------
int

Description
-----------
Adds a vertice and vertex texture coordinates in the vertex array. Texel is ignored when the hasVTexels constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const float theX, const float theY, const float theZ, const float theTX, const float theTY);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 1128b7a85488caabaf0181327f9dfd0f ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: gp_Pnt
theNormal: gp_Dir
theTexel: gp_Pnt2d

Return
-------
int

Description
-----------
Adds a vertice,vertex normal and texture in the vertex array. Warning: theNormal is ignored when the hasVNormals constructor parameter is False and theTexel is ignored when the hasVTexels constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const gp_Pnt & theVertex, const gp_Dir & theNormal, const gp_Pnt2d & theTexel);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 60db2c6e7d3342726fdef88bf4fbfa98 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double
theNX: double
theNY: double
theNZ: double
theTX: double
theTY: double

Return
-------
int

Description
-----------
Adds a vertice,vertex normal and texture in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False and Texel is ignored when the hasVTexels constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const double theX, const double theY, const double theZ, const double theNX, const double theNY, const double theNZ, const double theTX, const double theTY);

		/****** Graphic3d_ArrayOfPrimitives::AddVertex ******/
		/****** md5 signature: 770a74ba213a7ef0cb69dd2c0c2ccf4c ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
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

Return
-------
int

Description
-----------
Adds a vertice,vertex normal and texture in the vertex array. Warning: Normal is ignored when the hasVNormals constructor parameter is False and Texel is ignored when the hasVTexels constructor parameter is False. 
Return: the actual vertex number.
") AddVertex;
		int AddVertex(const float theX, const float theY, const float theZ, const float theNX, const float theNY, const float theNZ, const float theTX, const float theTY);

		/****** Graphic3d_ArrayOfPrimitives::Attributes ******/
		/****** md5 signature: 1610a8a8ea9ac2d06e2257d3ddc49edd ******/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Buffer>

Description
-----------
Returns vertex attributes buffer (colors, normals, texture coordinates).
") Attributes;
		const opencascade::handle<Graphic3d_Buffer> & Attributes();

		/****** Graphic3d_ArrayOfPrimitives::Bound ******/
		/****** md5 signature: ce1072cd594bd8fb9438bac1b5c6be73 ******/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
int

Description
-----------
Returns the edge number at rank theRank.
") Bound;
		int Bound(const int theRank);

		/****** Graphic3d_ArrayOfPrimitives::BoundColor ******/
		/****** md5 signature: 62ab299e37144e579983d0e356186acc ******/
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
Quantity_Color

Description
-----------
Returns the bound color at rank theRank from the bound table if defined.
") BoundColor;
		Quantity_Color BoundColor(const int theRank);

		/****** Graphic3d_ArrayOfPrimitives::BoundColor ******/
		/****** md5 signature: 33e1c58849772d36ccf2928679e6baae ******/
		%feature("compactdefaultargs") BoundColor;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
theR: double
theG: double
theB: double

Description
-----------
Returns the bound color values at rank theRank from the bound table if defined.
") BoundColor;
		void BoundColor(const int theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_ArrayOfPrimitives::BoundNumber ******/
		/****** md5 signature: 092258034ac7ee689b624404fad691d1 ******/
		%feature("compactdefaultargs") BoundNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of defined bounds.
") BoundNumber;
		int BoundNumber();

		/****** Graphic3d_ArrayOfPrimitives::BoundNumberAllocated ******/
		/****** md5 signature: c41dd38e3b79ceec04a3dc1ba7686d57 ******/
		%feature("compactdefaultargs") BoundNumberAllocated;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of allocated bounds.
") BoundNumberAllocated;
		int BoundNumberAllocated();

		/****** Graphic3d_ArrayOfPrimitives::Bounds ******/
		/****** md5 signature: aa4b6d27ab81123f0a7d91851b604a91 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_BoundBuffer>

Description
-----------
primitives / assigning colors) Returns optional bounds buffer.
") Bounds;
		const opencascade::handle<Graphic3d_BoundBuffer> & Bounds();

		/****** Graphic3d_ArrayOfPrimitives::CreateArray ******/
		/****** md5 signature: 56743a10845b899ad4f9848fff35d2df ******/
		%feature("compactdefaultargs") CreateArray;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfPrimitiveArray
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Return
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>

Description
-----------
Create an array of specified type.
") CreateArray;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> CreateArray(Graphic3d_TypeOfPrimitiveArray theType, int theMaxVertexs, int theMaxEdges, int theArrayFlags);

		/****** Graphic3d_ArrayOfPrimitives::CreateArray ******/
		/****** md5 signature: 8b815c76c30416abbe86b72702fd46b7 ******/
		%feature("compactdefaultargs") CreateArray;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfPrimitiveArray
theMaxVertexs: int
theMaxBounds: int
theMaxEdges: int
theArrayFlags: int

Return
-------
opencascade::handle<Graphic3d_ArrayOfPrimitives>

Description
-----------
Create an array of specified type.
") CreateArray;
		static opencascade::handle<Graphic3d_ArrayOfPrimitives> CreateArray(Graphic3d_TypeOfPrimitiveArray theType, int theMaxVertexs, int theMaxBounds, int theMaxEdges, int theArrayFlags);

		/****** Graphic3d_ArrayOfPrimitives::Edge ******/
		/****** md5 signature: d6ef76dcf36e3c28bfeff4df3defeaad ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
int

Description
-----------
Returns the vertex index at rank theRank in the range [1,EdgeNumber()].
") Edge;
		int Edge(const int theRank);

		/****** Graphic3d_ArrayOfPrimitives::EdgeNumber ******/
		/****** md5 signature: c762d4a08e5c6aacde132d55a0e3313e ******/
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of defined edges.
") EdgeNumber;
		int EdgeNumber();

		/****** Graphic3d_ArrayOfPrimitives::EdgeNumberAllocated ******/
		/****** md5 signature: f42ec24d5a686a881805bb8cb8a4ebad ******/
		%feature("compactdefaultargs") EdgeNumberAllocated;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of allocated edges.
") EdgeNumberAllocated;
		int EdgeNumberAllocated();

		/****** Graphic3d_ArrayOfPrimitives::HasBoundColors ******/
		/****** md5 signature: bb19513e9366ef98f53b4aa2093ec59c ******/
		%feature("compactdefaultargs") HasBoundColors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when bound colors array is defined.
") HasBoundColors;
		bool HasBoundColors();

		/****** Graphic3d_ArrayOfPrimitives::HasVertexColors ******/
		/****** md5 signature: 8db29bfd26e034a818f0ab3bc2aad2c2 ******/
		%feature("compactdefaultargs") HasVertexColors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when vertex colors array is defined.
") HasVertexColors;
		bool HasVertexColors();

		/****** Graphic3d_ArrayOfPrimitives::HasVertexNormals ******/
		/****** md5 signature: 3c243b5c104612bccea6c811c6b8b2bb ******/
		%feature("compactdefaultargs") HasVertexNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when vertex normals array is defined.
") HasVertexNormals;
		bool HasVertexNormals();

		/****** Graphic3d_ArrayOfPrimitives::HasVertexTexels ******/
		/****** md5 signature: ed5c0cb18aff18e5dc5258cc4e035df1 ******/
		%feature("compactdefaultargs") HasVertexTexels;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when vertex texels array is defined.
") HasVertexTexels;
		bool HasVertexTexels();

		/****** Graphic3d_ArrayOfPrimitives::Indices ******/
		/****** md5 signature: 1bb8a727555fded0b4938a4c1f24b002 ******/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_IndexBuffer>

Description
-----------
Returns optional index buffer.
") Indices;
		const opencascade::handle<Graphic3d_IndexBuffer> & Indices();

		/****** Graphic3d_ArrayOfPrimitives::IsValid ******/
		/****** md5 signature: aedb7cf6d3773b9b2253f643d0bcc700 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True only when the contains of this array is available.
") IsValid;
		bool IsValid();

		/****** Graphic3d_ArrayOfPrimitives::ItemNumber ******/
		/****** md5 signature: 0c2f6e446d7d3c2372d8098363893b05 ******/
		%feature("compactdefaultargs") ItemNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of total items according to the array type.
") ItemNumber;
		int ItemNumber();

		/****** Graphic3d_ArrayOfPrimitives::SetBoundColor ******/
		/****** md5 signature: 425ac30988e94be91c96b59ebe08d387 ******/
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theColor: Quantity_Color

Return
-------
None

Description
-----------
Change the bound color of rank theIndex in the array.
") SetBoundColor;
		void SetBoundColor(const int theIndex, const Quantity_Color & theColor);

		/****** Graphic3d_ArrayOfPrimitives::SetBoundColor ******/
		/****** md5 signature: 12ebe408a8a945f1ef4be07e4570acc4 ******/
		%feature("compactdefaultargs") SetBoundColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theR: double
theG: double
theB: double

Return
-------
None

Description
-----------
Change the bound color of rank theIndex in the array.
") SetBoundColor;
		void SetBoundColor(const int theIndex, const double theR, const double theG, const double theB);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexColor ******/
		/****** md5 signature: 016b2d9888b2b1f2a5dcd50b4098954d ******/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theColor: Quantity_Color

Return
-------
None

Description
-----------
Change the vertex color in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theColor node color.
") SetVertexColor;
		void SetVertexColor(const int theIndex, const Quantity_Color & theColor);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexColor ******/
		/****** md5 signature: f7241cc02c7b173bff88be0cab21ef9d ******/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theR: double
theG: double
theB: double

Return
-------
None

Description
-----------
Change the vertex color in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theR red color value within [0, 1] range 
Input parameter: theG green color value within [0, 1] range 
Input parameter: theB blue color value within [0, 1] range.
") SetVertexColor;
		void SetVertexColor(const int theIndex, const double theR, const double theG, const double theB);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexColor ******/
		/****** md5 signature: eba405bb65f0007c05c654b246d0ef7b ******/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theColor: NCollection_Vec4<uint8_t>

Return
-------
None

Description
-----------
Change the vertex color in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theColor node RGBA color values within [0, 255] range.
") SetVertexColor;
		void SetVertexColor(const int theIndex, const NCollection_Vec4<uint8_t> & theColor);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexColor ******/
		/****** md5 signature: bc3efdda0b16176d323d486a784382aa ******/
		%feature("compactdefaultargs") SetVertexColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theColor32: int

Return
-------
None

Description
-----------
Change the vertex color in the array. @code theColor32 = Alpha << 24 + Blue << 16 + Green << 8 + Red @endcode 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theColor32 packed RGBA color values.
") SetVertexColor;
		void SetVertexColor(const int theIndex, const int theColor32);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexNormal ******/
		/****** md5 signature: 65f577a71bc7142709fd7eb860152eab ******/
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNormal: gp_Dir

Return
-------
None

Description
-----------
Change the vertex normal in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theNormal normalized surface normal.
") SetVertexNormal;
		void SetVertexNormal(const int theIndex, const gp_Dir & theNormal);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexNormal ******/
		/****** md5 signature: 213130dac2bbd3740d1801f59c6caa82 ******/
		%feature("compactdefaultargs") SetVertexNormal;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNX: double
theNY: double
theNZ: double

Return
-------
None

Description
-----------
Change the vertex normal in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theNX surface normal X component 
Input parameter: theNY surface normal Y component 
Input parameter: theNZ surface normal Z component.
") SetVertexNormal;
		void SetVertexNormal(const int theIndex, const double theNX, const double theNY, const double theNZ);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexTexel ******/
		/****** md5 signature: 3250c8420c29bef50f5ca42dc8f462c6 ******/
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theTexel: gp_Pnt2d

Return
-------
None

Description
-----------
Change the vertex texel in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theTexel node UV coordinates.
") SetVertexTexel;
		void SetVertexTexel(const int theIndex, const gp_Pnt2d & theTexel);

		/****** Graphic3d_ArrayOfPrimitives::SetVertexTexel ******/
		/****** md5 signature: 66595b299859af980c56cebb818540bc ******/
		%feature("compactdefaultargs") SetVertexTexel;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theTX: double
theTY: double

Return
-------
None

Description
-----------
Change the vertex texel in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theTX node U coordinate 
Input parameter: theTY node V coordinate.
") SetVertexTexel;
		void SetVertexTexel(const int theIndex, const double theTX, const double theTY);

		/****** Graphic3d_ArrayOfPrimitives::SetVertice ******/
		/****** md5 signature: 774724706d9e67dce3f7a2b773e5e6cc ******/
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVertex: gp_Pnt

Return
-------
None

Description
-----------
Change the vertice of rank theIndex in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theVertex 3D coordinates.
") SetVertice;
		void SetVertice(const int theIndex, const gp_Pnt & theVertex);

		/****** Graphic3d_ArrayOfPrimitives::SetVertice ******/
		/****** md5 signature: 40177ccfb127a436b8214e66b756b99f ******/
		%feature("compactdefaultargs") SetVertice;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theX: float
theY: float
theZ: float

Return
-------
None

Description
-----------
Change the vertice in the array. 
Input parameter: theIndex node index within [1, VertexNumberAllocated()] range 
Input parameter: theX coordinate X 
Input parameter: theY coordinate Y 
Input parameter: theZ coordinate Z.
") SetVertice;
		void SetVertice(const int theIndex, const float theX, const float theY, const float theZ);

		/****** Graphic3d_ArrayOfPrimitives::StringType ******/
		/****** md5 signature: e6dd105614cb73206dea1ec69d6fb8de ******/
		%feature("compactdefaultargs") StringType;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the string type of this primitive.
") StringType;
		const char * StringType();

		/****** Graphic3d_ArrayOfPrimitives::Type ******/
		/****** md5 signature: 766ba92896e370dd36bb18b553d14b69 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfPrimitiveArray

Description
-----------
Returns the type of this primitive.
") Type;
		Graphic3d_TypeOfPrimitiveArray Type();

		/****** Graphic3d_ArrayOfPrimitives::VertexColor ******/
		/****** md5 signature: 90889769d9c07cbcf4282aa1829bcba4 ******/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
Quantity_Color

Description
-----------
Returns the vertex color at rank theRank from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range 
Return: node color RGB value.
") VertexColor;
		Quantity_Color VertexColor(const int theRank);

		/****** Graphic3d_ArrayOfPrimitives::VertexColor ******/
		/****** md5 signature: a595f624c0318d3ba7781f119ff8f1e3 ******/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theColor: NCollection_Vec4<uint8_t>

Return
-------
None

Description
-----------
Returns the vertex color from the vertex table if defined. 
Input parameter: theIndex node index within [1, VertexNumber()] range @param[out] theColor node RGBA color values within [0, 255] range.
") VertexColor;
		void VertexColor(const int theIndex, NCollection_Vec4<uint8_t> & theColor);

		/****** Graphic3d_ArrayOfPrimitives::VertexColor ******/
		/****** md5 signature: 1d23f625d4944299ef196796a615c445 ******/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
theR: double
theG: double
theB: double

Description
-----------
Returns the vertex color values from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range @param[out] theR node red color component value within [0, 1] range @param[out] theG node green color component value within [0, 1] range @param[out] theB node blue color component value within [0, 1] range.
") VertexColor;
		void VertexColor(const int theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_ArrayOfPrimitives::VertexColor ******/
		/****** md5 signature: c94f85e3c9d5a126b7e16125c5e7b8e0 ******/
		%feature("compactdefaultargs") VertexColor;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
theColor: int

Description
-----------
Returns the vertex color values from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range @param[out] theColor node RGBA color packed into 32-bit integer.
") VertexColor;
		void VertexColor(const int theRank, Standard_Integer &OutValue);

		/****** Graphic3d_ArrayOfPrimitives::VertexNormal ******/
		/****** md5 signature: 7701648ef7f485b83e3e096864f4b84f ******/
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
gp_Dir

Description
-----------
Returns the vertex normal from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range 
Return: normalized 3D vector defining surface normal.
") VertexNormal;
		gp_Dir VertexNormal(const int theRank);

		/****** Graphic3d_ArrayOfPrimitives::VertexNormal ******/
		/****** md5 signature: bd02e1774fba75d6de52eb361b1b472d ******/
		%feature("compactdefaultargs") VertexNormal;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
theNX: double
theNY: double
theNZ: double

Description
-----------
Returns the vertex normal coordinates at rank theRank from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range @param[out] theNX normal X coordinate @param[out] theNY normal Y coordinate @param[out] theNZ normal Z coordinate.
") VertexNormal;
		void VertexNormal(const int theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_ArrayOfPrimitives::VertexNumber ******/
		/****** md5 signature: 21ec8b488d2c7e06689f944c30239c8e ******/
		%feature("compactdefaultargs") VertexNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of defined vertex.
") VertexNumber;
		int VertexNumber();

		/****** Graphic3d_ArrayOfPrimitives::VertexNumberAllocated ******/
		/****** md5 signature: 289871688a779f3adc5bf8e3e22bf9c7 ******/
		%feature("compactdefaultargs") VertexNumberAllocated;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of allocated vertex.
") VertexNumberAllocated;
		int VertexNumberAllocated();

		/****** Graphic3d_ArrayOfPrimitives::VertexTexel ******/
		/****** md5 signature: bc8439d5fa883649d749b274d8bfa373 ******/
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
gp_Pnt2d

Description
-----------
Returns the vertex texture at rank theRank from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range 
Return: UV coordinates.
") VertexTexel;
		gp_Pnt2d VertexTexel(const int theRank);

		/****** Graphic3d_ArrayOfPrimitives::VertexTexel ******/
		/****** md5 signature: 37402b28a8e120936ea7badaab8014dc ******/
		%feature("compactdefaultargs") VertexTexel;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
theTX: double
theTY: double

Description
-----------
Returns the vertex texture coordinates at rank theRank from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range @param[out] theTX texel U coordinate value @param[out] theTY texel V coordinate value.
") VertexTexel;
		void VertexTexel(const int theRank, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_ArrayOfPrimitives::Vertice ******/
		/****** md5 signature: 2cdc16f7f742c035dfb795920ab45bb8 ******/
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
gp_Pnt

Description
-----------
Returns the vertice from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range 
Return: node 3D coordinates.
") Vertice;
		gp_Pnt Vertice(const int theRank);

		/****** Graphic3d_ArrayOfPrimitives::Vertice ******/
		/****** md5 signature: b09bd4ed7e804a2a65cb27534205185f ******/
		%feature("compactdefaultargs") Vertice;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
theX: double
theY: double
theZ: double

Description
-----------
Returns the vertice coordinates at rank theRank from the vertex table if defined. 
Input parameter: theRank node index within [1, VertexNumber()] range @param[out] theX node X coordinate value @param[out] theY node Y coordinate value @param[out] theZ node Z coordinate value.
") Vertice;
		void Vertice(const int theRank, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** Graphic3d_Aspects::Graphic3d_Aspects ******/
		/****** md5 signature: e28433a8ce967ebeaba5ca07028bdd70 ******/
		%feature("compactdefaultargs") Graphic3d_Aspects;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a context table for drawing primitives defined with the following default values:.
") Graphic3d_Aspects;
		 Graphic3d_Aspects();

		/****** Graphic3d_Aspects::AllowBackFace ******/
		/****** md5 signature: c90f5a2b43fff04968eb4dde02cb190f ******/
		%feature("compactdefaultargs") AllowBackFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") AllowBackFace;
		void AllowBackFace();

		/****** Graphic3d_Aspects::AlphaCutoff ******/
		/****** md5 signature: 533b77adaecb1842c9e04f3968496ce7 ******/
		%feature("compactdefaultargs") AlphaCutoff;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns alpha cutoff threshold, for discarding fragments within Graphic3d_AlphaMode_Mask mode (0.5 by default). If the alpha value is greater than or equal to this value then it is rendered as fully opaque, otherwise, it is rendered as fully transparent.
") AlphaCutoff;
		float AlphaCutoff();

		/****** Graphic3d_Aspects::AlphaMode ******/
		/****** md5 signature: c141b940ccd51adaa91c404b4d4a5d76 ******/
		%feature("compactdefaultargs") AlphaMode;
		%feature("autodoc", "Return
-------
Graphic3d_AlphaMode

Description
-----------
Returns the way how alpha value should be treated (Graphic3d_AlphaMode_BlendAuto by default, for backward compatibility).
") AlphaMode;
		Graphic3d_AlphaMode AlphaMode();

		/****** Graphic3d_Aspects::BackFace ******/
		/****** md5 signature: d634528b3c0ee7a40c5cedfafb5cbf5c ******/
		%feature("compactdefaultargs") BackFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") BackFace;
		bool BackFace();

		/****** Graphic3d_Aspects::BackInteriorColor ******/
		/****** md5 signature: e43c9444d80ba6362541272eb09b8d61 ******/
		%feature("compactdefaultargs") BackInteriorColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return back interior color.
") BackInteriorColor;
		const Quantity_Color & BackInteriorColor();

		/****** Graphic3d_Aspects::BackInteriorColorRGBA ******/
		/****** md5 signature: fd87b0cbfd66e53bad2724623161e871 ******/
		%feature("compactdefaultargs") BackInteriorColorRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return back interior color.
") BackInteriorColorRGBA;
		const Quantity_ColorRGBA & BackInteriorColorRGBA();

		/****** Graphic3d_Aspects::BackMaterial ******/
		/****** md5 signature: d61ddc63820fda6c18f961c1b8f4fac2 ******/
		%feature("compactdefaultargs") BackMaterial;
		%feature("autodoc", "Return
-------
Graphic3d_MaterialAspect

Description
-----------
Returns the surface material of internal faces.
") BackMaterial;
		const Graphic3d_MaterialAspect & BackMaterial();

		/****** Graphic3d_Aspects::ChangeBackMaterial ******/
		/****** md5 signature: bf42bcce6fb2c7cbca5951a18913d8b2 ******/
		%feature("compactdefaultargs") ChangeBackMaterial;
		%feature("autodoc", "Return
-------
Graphic3d_MaterialAspect

Description
-----------
Returns the surface material of internal faces.
") ChangeBackMaterial;
		Graphic3d_MaterialAspect & ChangeBackMaterial();

		/****** Graphic3d_Aspects::ChangeFrontMaterial ******/
		/****** md5 signature: 896bb6b9197226375817929795f577c8 ******/
		%feature("compactdefaultargs") ChangeFrontMaterial;
		%feature("autodoc", "Return
-------
Graphic3d_MaterialAspect

Description
-----------
Returns the surface material of external faces.
") ChangeFrontMaterial;
		Graphic3d_MaterialAspect & ChangeFrontMaterial();

		/****** Graphic3d_Aspects::Color ******/
		/****** md5 signature: 7cec116411eb20e52d1fabf3015346da ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return the color.
") Color;
		const Quantity_Color & Color();

		/****** Graphic3d_Aspects::ColorRGBA ******/
		/****** md5 signature: 615b6d48d8bc4764a07d0e2ff837764b ******/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return color.
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA();

		/****** Graphic3d_Aspects::ColorSubTitle ******/
		/****** md5 signature: ec9fb7d73de227b76a49a632255940a1 ******/
		%feature("compactdefaultargs") ColorSubTitle;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return text background/shadow color; equals to EdgeColor() property.
") ColorSubTitle;
		const Quantity_Color & ColorSubTitle();

		/****** Graphic3d_Aspects::ColorSubTitleRGBA ******/
		/****** md5 signature: 19c99bba7072d8a37082e5e5db18e02f ******/
		%feature("compactdefaultargs") ColorSubTitleRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Returns text background/shadow color; equals to EdgeColor() property.
") ColorSubTitleRGBA;
		const Quantity_ColorRGBA & ColorSubTitleRGBA();

		/****** Graphic3d_Aspects::DefaultLinePatternForType ******/
		/****** md5 signature: db0377d31ee56d14b26490c9ec64f6aa ******/
		%feature("compactdefaultargs") DefaultLinePatternForType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfLine

Return
-------
uint16_t

Description
-----------
Return stipple line pattern for line type.
") DefaultLinePatternForType;
		static uint16_t DefaultLinePatternForType(Aspect_TypeOfLine theType);

		/****** Graphic3d_Aspects::DefaultLineTypeForPattern ******/
		/****** md5 signature: 86cfe3bd72966e1639229affebe88fde ******/
		%feature("compactdefaultargs") DefaultLineTypeForPattern;
		%feature("autodoc", "
Parameters
----------
thePattern: uint16_t

Return
-------
Aspect_TypeOfLine

Description
-----------
Return line type for stipple line pattern.
") DefaultLineTypeForPattern;
		static Aspect_TypeOfLine DefaultLineTypeForPattern(uint16_t thePattern);

		/****** Graphic3d_Aspects::Distinguish ******/
		/****** md5 signature: 0454cac171c21f4684edced692b81ef0 ******/
		%feature("compactdefaultargs") Distinguish;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if material properties should be distinguished for back and front faces (false by default).
") Distinguish;
		bool Distinguish();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Aspects::EdgeColor ******/
		/****** md5 signature: e3bf049881e7a42425197782f2de2754 ******/
		%feature("compactdefaultargs") EdgeColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return color of edges.
") EdgeColor;
		const Quantity_Color & EdgeColor();

		/****** Graphic3d_Aspects::EdgeColorRGBA ******/
		/****** md5 signature: 7f6e351360a662eeb14730bdbc180102 ******/
		%feature("compactdefaultargs") EdgeColorRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return color of edges.
") EdgeColorRGBA;
		const Quantity_ColorRGBA & EdgeColorRGBA();

		/****** Graphic3d_Aspects::EdgeLineType ******/
		/****** md5 signature: 88c19f6858297c0d6ca1eb0808721938 ******/
		%feature("compactdefaultargs") EdgeLineType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfLine

Description
-----------
Return edges line type (same as LineType()).
") EdgeLineType;
		Aspect_TypeOfLine EdgeLineType();

		/****** Graphic3d_Aspects::EdgeWidth ******/
		/****** md5 signature: dc428cae323084a509e8a4d2d87c6b11 ******/
		%feature("compactdefaultargs") EdgeWidth;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return width for edges in pixels (same as LineWidth()).
") EdgeWidth;
		float EdgeWidth();

		/****** Graphic3d_Aspects::FaceCulling ******/
		/****** md5 signature: ea5bcfdb7347bbf80f346aa702bd7b90 ******/
		%feature("compactdefaultargs") FaceCulling;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfBackfacingModel

Description
-----------
Return face culling mode; Graphic3d_FaceCulling_BackClosed by default. A back-facing polygon is defined as a polygon whose vertices are in a clockwise order with respect to screen coordinates.
") FaceCulling;
		Graphic3d_TypeOfBackfacingModel FaceCulling();

		/****** Graphic3d_Aspects::FrontMaterial ******/
		/****** md5 signature: 41b8cfff159c56853a21e11111805499 ******/
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "Return
-------
Graphic3d_MaterialAspect

Description
-----------
Returns the surface material of external faces.
") FrontMaterial;
		const Graphic3d_MaterialAspect & FrontMaterial();

		/****** Graphic3d_Aspects::HatchStyle ******/
		/****** md5 signature: 07b62677450d3df62f68cd2f20b612da ******/
		%feature("compactdefaultargs") HatchStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_HatchStyle>

Description
-----------
Returns the hatch type used when InteriorStyle is IS_HATCH.
") HatchStyle;
		const opencascade::handle<Graphic3d_HatchStyle> & HatchStyle();

		/****** Graphic3d_Aspects::InteriorColor ******/
		/****** md5 signature: 257c7e47a9943279e873d8c441621100 ******/
		%feature("compactdefaultargs") InteriorColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return interior color.
") InteriorColor;
		const Quantity_Color & InteriorColor();

		/****** Graphic3d_Aspects::InteriorColorRGBA ******/
		/****** md5 signature: 384d675ce829aa2e285b913e4365eb79 ******/
		%feature("compactdefaultargs") InteriorColorRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return interior color.
") InteriorColorRGBA;
		const Quantity_ColorRGBA & InteriorColorRGBA();

		/****** Graphic3d_Aspects::InteriorStyle ******/
		/****** md5 signature: 45d0297b03618fc24ff5055820bfb55e ******/
		%feature("compactdefaultargs") InteriorStyle;
		%feature("autodoc", "Return
-------
Aspect_InteriorStyle

Description
-----------
Return interior rendering style; Aspect_IS_SOLID by default.
") InteriorStyle;
		Aspect_InteriorStyle InteriorStyle();

		/****** Graphic3d_Aspects::IsEqual ******/
		/****** md5 signature: 9c6c9deb326013434fe87e965e640203 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_Aspects

Return
-------
bool

Description
-----------
Check for equality with another aspects.
") IsEqual;
		bool IsEqual(const Graphic3d_Aspects & theOther);

		/****** Graphic3d_Aspects::IsMarkerSprite ******/
		/****** md5 signature: 37db8501fdef81ffca82c4ea0edb64df ******/
		%feature("compactdefaultargs") IsMarkerSprite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if marker should be drawn using marker sprite (either user-provided or generated).
") IsMarkerSprite;
		bool IsMarkerSprite();

		/****** Graphic3d_Aspects::IsTextZoomable ******/
		/****** md5 signature: eb038d91f0438c94d940691891b24f36 ******/
		%feature("compactdefaultargs") IsTextZoomable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the Text Zoomable is on.
") IsTextZoomable;
		bool IsTextZoomable();

		/****** Graphic3d_Aspects::LinePattern ******/
		/****** md5 signature: 0f5a2917d18d0384d2bca639fea5b45b ******/
		%feature("compactdefaultargs") LinePattern;
		%feature("autodoc", "Return
-------
uint16_t

Description
-----------
Return custom stipple line pattern; 0xFFFF by default.
") LinePattern;
		uint16_t LinePattern();

		/****** Graphic3d_Aspects::LineStippleFactor ******/
		/****** md5 signature: e63889618f2bf3b4350144cbc25324dc ******/
		%feature("compactdefaultargs") LineStippleFactor;
		%feature("autodoc", "Return
-------
uint16_t

Description
-----------
Return a multiplier for each bit in the line stipple pattern within [1, 256] range; 1 by default.
") LineStippleFactor;
		uint16_t LineStippleFactor();

		/****** Graphic3d_Aspects::LineType ******/
		/****** md5 signature: 6ae68230b33e9e754a59131adc3dc5c1 ******/
		%feature("compactdefaultargs") LineType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfLine

Description
-----------
No available documentation.
") LineType;
		Aspect_TypeOfLine LineType();

		/****** Graphic3d_Aspects::LineWidth ******/
		/****** md5 signature: 7354b86d0cca2cb76558f9395fff226a ******/
		%feature("compactdefaultargs") LineWidth;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return width for edges in pixels; 1.0 by default.
") LineWidth;
		float LineWidth();

		/****** Graphic3d_Aspects::MarkerImage ******/
		/****** md5 signature: f83a5773dd88984525c91de89afe25a4 ******/
		%feature("compactdefaultargs") MarkerImage;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_MarkerImage>

Description
-----------
Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.
") MarkerImage;
		const opencascade::handle<Graphic3d_MarkerImage> & MarkerImage();

		/****** Graphic3d_Aspects::MarkerScale ******/
		/****** md5 signature: 1378f255ac6da704d9f0ac8b627344ca ******/
		%feature("compactdefaultargs") MarkerScale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return marker scale factor; 1.0 by default.
") MarkerScale;
		float MarkerScale();

		/****** Graphic3d_Aspects::MarkerType ******/
		/****** md5 signature: 191ac2efa41e30b533cb10620a7a11df ******/
		%feature("compactdefaultargs") MarkerType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfMarker

Description
-----------
No available documentation.
") MarkerType;
		Aspect_TypeOfMarker MarkerType();

		/****** Graphic3d_Aspects::PolygonOffset ******/
		/****** md5 signature: 5bc0db1ff0ef7eec07c4eb78b80f6cca ******/
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "Return
-------
Graphic3d_PolygonOffset

Description
-----------
Returns current polygon offsets settings.
") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset();

		/****** Graphic3d_Aspects::PolygonOffsets ******/
		/****** md5 signature: b51d1101d4585da9dd97f6cf3213252d ******/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "
Parameters
----------

Return
-------
theMode: int
theFactor: float
theUnits: float

Description
-----------
Returns current polygon offsets settings.
") PolygonOffsets;
		void PolygonOffsets(Standard_Integer &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** Graphic3d_Aspects::SetAlphaMode ******/
		/****** md5 signature: cdadfc1f9bd5bedfdce055e080dcffff ******/
		%feature("compactdefaultargs") SetAlphaMode;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_AlphaMode
theAlphaCutoff: float (optional, default to 0.5f)

Return
-------
None

Description
-----------
Defines the way how alpha value should be treated.
") SetAlphaMode;
		void SetAlphaMode(Graphic3d_AlphaMode theMode, float theAlphaCutoff = 0.5f);

		/****** Graphic3d_Aspects::SetBackInteriorColor ******/
		/****** md5 signature: 0eb222f94cb4cedfb4675fc7a778c746 ******/
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the color of the interior of the back face.
") SetBackInteriorColor;
		void SetBackInteriorColor(const Quantity_Color & theColor);

		/****** Graphic3d_Aspects::SetBackInteriorColor ******/
		/****** md5 signature: 1ac4b62834b23720aa71ec554afa2b42 ******/
		%feature("compactdefaultargs") SetBackInteriorColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA

Return
-------
None

Description
-----------
Modifies the color of the interior of the back face.
") SetBackInteriorColor;
		void SetBackInteriorColor(const Quantity_ColorRGBA & theColor);

		/****** Graphic3d_Aspects::SetBackMaterial ******/
		/****** md5 signature: 0796d7a91bd9fded95bfe550066edd54 ******/
		%feature("compactdefaultargs") SetBackMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Modifies the surface material of internal faces.
") SetBackMaterial;
		void SetBackMaterial(const Graphic3d_MaterialAspect & theMaterial);

		/****** Graphic3d_Aspects::SetColor ******/
		/****** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Graphic3d_Aspects::SetColorSubTitle ******/
		/****** md5 signature: b8dff86a23c012bf0fc166e089f32797 ******/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies text background/shadow color; equals to EdgeColor() property.
") SetColorSubTitle;
		void SetColorSubTitle(const Quantity_Color & theColor);

		/****** Graphic3d_Aspects::SetColorSubTitle ******/
		/****** md5 signature: 366032eddc73ad7164a54cb28550c2e6 ******/
		%feature("compactdefaultargs") SetColorSubTitle;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA

Return
-------
None

Description
-----------
Modifies text background/shadow color; equals to EdgeColor() property.
") SetColorSubTitle;
		void SetColorSubTitle(const Quantity_ColorRGBA & theColor);

		/****** Graphic3d_Aspects::SetDistinguish ******/
		/****** md5 signature: 76455feae8e798c74be25ad0b45d935f ******/
		%feature("compactdefaultargs") SetDistinguish;
		%feature("autodoc", "
Parameters
----------
toDistinguish: bool

Return
-------
None

Description
-----------
Set material distinction between front and back faces.
") SetDistinguish;
		void SetDistinguish(bool toDistinguish);

		/****** Graphic3d_Aspects::SetDistinguishOff ******/
		/****** md5 signature: 63b9d9d34afec45ea7929fa232816c0a ******/
		%feature("compactdefaultargs") SetDistinguishOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Forbids material distinction between front and back faces.
") SetDistinguishOff;
		void SetDistinguishOff();

		/****** Graphic3d_Aspects::SetDistinguishOn ******/
		/****** md5 signature: 11cab8d2ed03315d6cef72413a6f2c0e ******/
		%feature("compactdefaultargs") SetDistinguishOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Allows material distinction between front and back faces.
") SetDistinguishOn;
		void SetDistinguishOn();

		/****** Graphic3d_Aspects::SetDrawEdges ******/
		/****** md5 signature: ed098dddd2db1cbebf5f0f5b7faab252 ******/
		%feature("compactdefaultargs") SetDrawEdges;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Set if mesh edges should be drawn or not.
") SetDrawEdges;
		void SetDrawEdges(bool theToDraw);

		/****** Graphic3d_Aspects::SetDrawSilhouette ******/
		/****** md5 signature: 97a46083210a65f184ecb83925fdec43 ******/
		%feature("compactdefaultargs") SetDrawSilhouette;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
Enables/disables drawing silhouette (outline).
") SetDrawSilhouette;
		void SetDrawSilhouette(bool theToDraw);

		/****** Graphic3d_Aspects::SetEdgeColor ******/
		/****** md5 signature: d00577edf69caa0380c91743cfde58a3 ******/
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the color of the edge of the face.
") SetEdgeColor;
		void SetEdgeColor(const Quantity_Color & theColor);

		/****** Graphic3d_Aspects::SetEdgeColor ******/
		/****** md5 signature: 4dc69c28314e0005ef63bdc261ea2d54 ******/
		%feature("compactdefaultargs") SetEdgeColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA

Return
-------
None

Description
-----------
Modifies the color of the edge of the face.
") SetEdgeColor;
		void SetEdgeColor(const Quantity_ColorRGBA & theColor);

		/****** Graphic3d_Aspects::SetEdgeLineType ******/
		/****** md5 signature: b1791fa33e1cb77a340b2371826e303d ******/
		%feature("compactdefaultargs") SetEdgeLineType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfLine

Return
-------
None

Description
-----------
Modifies the edge line type (same as SetLineType()).
") SetEdgeLineType;
		void SetEdgeLineType(Aspect_TypeOfLine theType);

		/****** Graphic3d_Aspects::SetEdgeOff ******/
		/****** md5 signature: 209653f93a4a475b948b658dadb3c5b8 ******/
		%feature("compactdefaultargs") SetEdgeOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
The edges of FillAreas are not drawn.
") SetEdgeOff;
		void SetEdgeOff();

		/****** Graphic3d_Aspects::SetEdgeOn ******/
		/****** md5 signature: 12716e13a8bcb1a1053a2855ca9739e1 ******/
		%feature("compactdefaultargs") SetEdgeOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
The edges of FillAreas are drawn.
") SetEdgeOn;
		void SetEdgeOn();

		/****** Graphic3d_Aspects::SetEdgeWidth ******/
		/****** md5 signature: 468838e5e08925cd48a205ea19efe6c2 ******/
		%feature("compactdefaultargs") SetEdgeWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: double

Return
-------
None

Description
-----------
Modifies the edge thickness (same as SetLineWidth()).
") SetEdgeWidth;
		void SetEdgeWidth(double theWidth);

		/****** Graphic3d_Aspects::SetFaceCulling ******/
		/****** md5 signature: e33027971df977c7340567a81a044749 ******/
		%feature("compactdefaultargs") SetFaceCulling;
		%feature("autodoc", "
Parameters
----------
theCulling: Graphic3d_TypeOfBackfacingModel

Return
-------
None

Description
-----------
Set face culling mode.
") SetFaceCulling;
		void SetFaceCulling(Graphic3d_TypeOfBackfacingModel theCulling);

		/****** Graphic3d_Aspects::SetFrontMaterial ******/
		/****** md5 signature: 14c2813796ead5a225d907bc718417d2 ******/
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "
Parameters
----------
theMaterial: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Modifies the surface material of external faces.
") SetFrontMaterial;
		void SetFrontMaterial(const Graphic3d_MaterialAspect & theMaterial);

		/****** Graphic3d_Aspects::SetHatchStyle ******/
		/****** md5 signature: b0caa9e27048ee8a4af14f32988bab5a ******/
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Graphic3d_HatchStyle

Return
-------
None

Description
-----------
Modifies the hatch type used when InteriorStyle is IS_HATCH.
") SetHatchStyle;
		void SetHatchStyle(const opencascade::handle<Graphic3d_HatchStyle> & theStyle);

		/****** Graphic3d_Aspects::SetHatchStyle ******/
		/****** md5 signature: 571c2e2029ec1961c6be66b9697ae219 ******/
		%feature("compactdefaultargs") SetHatchStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Aspect_HatchStyle

Return
-------
None

Description
-----------
Modifies the hatch type used when InteriorStyle is IS_HATCH @warning This method always creates a new handle for a given hatch style.
") SetHatchStyle;
		void SetHatchStyle(const Aspect_HatchStyle theStyle);

		/****** Graphic3d_Aspects::SetInteriorColor ******/
		/****** md5 signature: a5ea883367163149052e810bf49eda6b ******/
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the color of the interior of the face.
") SetInteriorColor;
		void SetInteriorColor(const Quantity_Color & theColor);

		/****** Graphic3d_Aspects::SetInteriorColor ******/
		/****** md5 signature: 167ecffce763f5a546bc032caffcc7be ******/
		%feature("compactdefaultargs") SetInteriorColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA

Return
-------
None

Description
-----------
Modifies the color of the interior of the face.
") SetInteriorColor;
		void SetInteriorColor(const Quantity_ColorRGBA & theColor);

		/****** Graphic3d_Aspects::SetInteriorStyle ******/
		/****** md5 signature: a275ca9769f814a82eb74f1486e02ca5 ******/
		%feature("compactdefaultargs") SetInteriorStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Aspect_InteriorStyle

Return
-------
None

Description
-----------
Modifies the interior type used for rendering.
") SetInteriorStyle;
		void SetInteriorStyle(const Aspect_InteriorStyle theStyle);

		/****** Graphic3d_Aspects::SetLinePattern ******/
		/****** md5 signature: dcb92c889cf404e8110d52ab7ef1878a ******/
		%feature("compactdefaultargs") SetLinePattern;
		%feature("autodoc", "
Parameters
----------
thePattern: uint16_t

Return
-------
None

Description
-----------
Modifies the stipple line pattern, and changes line type to Aspect_TOL_USERDEFINED for non-standard pattern.
") SetLinePattern;
		void SetLinePattern(uint16_t thePattern);

		/****** Graphic3d_Aspects::SetLineStippleFactor ******/
		/****** md5 signature: 5a4ce4aa1b2cbf776034be5e022001ab ******/
		%feature("compactdefaultargs") SetLineStippleFactor;
		%feature("autodoc", "
Parameters
----------
theFactor: uint16_t

Return
-------
None

Description
-----------
Set a multiplier for each bit in the line stipple pattern.
") SetLineStippleFactor;
		void SetLineStippleFactor(uint16_t theFactor);

		/****** Graphic3d_Aspects::SetLineType ******/
		/****** md5 signature: 62e1ffe971a62e7ffb6bed2fec770aa5 ******/
		%feature("compactdefaultargs") SetLineType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfLine

Return
-------
None

Description
-----------
Modifies the line type.
") SetLineType;
		void SetLineType(Aspect_TypeOfLine theType);

		/****** Graphic3d_Aspects::SetLineWidth ******/
		/****** md5 signature: cb65be6a4889339e90744b8992ed919e ******/
		%feature("compactdefaultargs") SetLineWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: float

Return
-------
None

Description
-----------
Modifies the line thickness Warning: Raises Standard_OutOfRange if the width is a negative value.
") SetLineWidth;
		void SetLineWidth(float theWidth);

		/****** Graphic3d_Aspects::SetMarkerImage ******/
		/****** md5 signature: 8819a7c66f25d37dc3c3b63f7a6e58bd ******/
		%feature("compactdefaultargs") SetMarkerImage;
		%feature("autodoc", "
Parameters
----------
theImage: Graphic3d_MarkerImage

Return
-------
None

Description
-----------
Set marker's image texture.
") SetMarkerImage;
		void SetMarkerImage(const opencascade::handle<Graphic3d_MarkerImage> & theImage);

		/****** Graphic3d_Aspects::SetMarkerScale ******/
		/****** md5 signature: 8c574b8a87507328a4f6edfd12180c17 ******/
		%feature("compactdefaultargs") SetMarkerScale;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
None

Description
-----------
Modifies the scale factor. Marker type Aspect_TOM_POINT is not affected by the marker size scale factor. It is always the smallest displayable dot. Warning: Raises Standard_OutOfRange if the scale is a negative value.
") SetMarkerScale;
		void SetMarkerScale(const float theScale);

		/****** Graphic3d_Aspects::SetMarkerType ******/
		/****** md5 signature: 4c156fccf7ff437b07f34c3e68fc8687 ******/
		%feature("compactdefaultargs") SetMarkerType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfMarker

Return
-------
None

Description
-----------
Modifies the type of marker.
") SetMarkerType;
		void SetMarkerType(Aspect_TypeOfMarker theType);

		/****** Graphic3d_Aspects::SetPolygonOffset ******/
		/****** md5 signature: de9a863ce5dbd13394cd0a5ee6099e7d ******/
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "
Parameters
----------
theOffset: Graphic3d_PolygonOffset

Return
-------
None

Description
-----------
Sets polygon offsets settings.
") SetPolygonOffset;
		void SetPolygonOffset(const Graphic3d_PolygonOffset & theOffset);

		/****** Graphic3d_Aspects::SetPolygonOffsets ******/
		/****** md5 signature: e894ee84cd5cc527d16829ae8598e80e ******/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "
Parameters
----------
theMode: int
theFactor: float (optional, default to 1.0f)
theUnits: float (optional, default to 0.0f)

Return
-------
None

Description
-----------
Sets up OpenGL polygon offsets mechanism. <aMode> parameter can contain various combinations of Aspect_PolygonOffsetMode enumeration elements (Aspect_POM_None means that polygon offsets are not changed). If <aMode> is different from Aspect_POM_Off and Aspect_POM_None, then <aFactor> and <aUnits> arguments are used by graphic renderer to calculate a depth offset value: //! offset = <aFactor> * m + <aUnits> * r, where m - maximum depth slope for the polygon currently being displayed, r - minimum window coordinates depth resolution (implementation-specific) //! Default settings for OCC 3D viewer: mode = Aspect_POM_Fill, factor = 1., units = 1. //! Negative offset values move polygons closer to the viewport, while positive values shift polygons away. Consult OpenGL reference for details (glPolygonOffset function description).
") SetPolygonOffsets;
		void SetPolygonOffsets(const int theMode, const float theFactor = 1.0f, const float theUnits = 0.0f);

		/****** Graphic3d_Aspects::SetShaderProgram ******/
		/****** md5 signature: c84389c506ab3fabe77cf1234a780afa ******/
		%feature("compactdefaultargs") SetShaderProgram;
		%feature("autodoc", "
Parameters
----------
theProgram: Graphic3d_ShaderProgram

Return
-------
None

Description
-----------
Sets up OpenGL/GLSL shader program.
") SetShaderProgram;
		void SetShaderProgram(const opencascade::handle<Graphic3d_ShaderProgram> & theProgram);

		/****** Graphic3d_Aspects::SetShadingModel ******/
		/****** md5 signature: b67fea2d2f670ea5a35640bade585ab6 ******/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "
Parameters
----------
theShadingModel: Graphic3d_TypeOfShadingModel

Return
-------
None

Description
-----------
Sets shading model.
") SetShadingModel;
		void SetShadingModel(const Graphic3d_TypeOfShadingModel theShadingModel);

		/****** Graphic3d_Aspects::SetSkipFirstEdge ******/
		/****** md5 signature: f2d4f63e4a0ad4c4929bcef0cec93d44 ******/
		%feature("compactdefaultargs") SetSkipFirstEdge;
		%feature("autodoc", "
Parameters
----------
theToSkipFirstEdge: bool

Return
-------
None

Description
-----------
Set skip first triangle edge flag for drawing wireframe presentation of quads array split into triangles.
") SetSkipFirstEdge;
		void SetSkipFirstEdge(bool theToSkipFirstEdge);

		/****** Graphic3d_Aspects::SetSuppressBackFaces ******/
		/****** md5 signature: 564c9f4e84c67aeaced26807dd97d26a ******/
		%feature("compactdefaultargs") SetSuppressBackFaces;
		%feature("autodoc", "
Parameters
----------
theToSuppress: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSuppressBackFaces;
		void SetSuppressBackFaces(bool theToSuppress);

		/****** Graphic3d_Aspects::SetTextAngle ******/
		/****** md5 signature: bd6f5f2b0a5a41d22e46f782f2e3814c ******/
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: float

Return
-------
None

Description
-----------
Turns usage of text rotated.
") SetTextAngle;
		void SetTextAngle(float theAngle);

		/****** Graphic3d_Aspects::SetTextDisplayType ******/
		/****** md5 signature: 2e96c2145c3c7f0b188d92bddea3f5af ******/
		%feature("compactdefaultargs") SetTextDisplayType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfDisplayText

Return
-------
None

Description
-----------
Sets display type.
") SetTextDisplayType;
		void SetTextDisplayType(Aspect_TypeOfDisplayText theType);

		/****** Graphic3d_Aspects::SetTextFont ******/
		/****** md5 signature: c18c74f455bd2b8d768cc533264b5e0c ******/
		%feature("compactdefaultargs") SetTextFont;
		%feature("autodoc", "
Parameters
----------
theFont: TCollection_HAsciiString

Return
-------
None

Description
-----------
Modifies the font.
") SetTextFont;
		void SetTextFont(const opencascade::handle<TCollection_HAsciiString> & theFont);

		/****** Graphic3d_Aspects::SetTextFontAspect ******/
		/****** md5 signature: e898525ff5b5d8c72752eab8f189cfaf ******/
		%feature("compactdefaultargs") SetTextFontAspect;
		%feature("autodoc", "
Parameters
----------
theFontAspect: Font_FontAspect

Return
-------
None

Description
-----------
Turns usage of Aspect text.
") SetTextFontAspect;
		void SetTextFontAspect(Font_FontAspect theFontAspect);

		/****** Graphic3d_Aspects::SetTextStyle ******/
		/****** md5 signature: e039456428ed8ebe7153ce18e9ea6326 ******/
		%feature("compactdefaultargs") SetTextStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Aspect_TypeOfStyleText

Return
-------
None

Description
-----------
Modifies the style of the text.
") SetTextStyle;
		void SetTextStyle(Aspect_TypeOfStyleText theStyle);

		/****** Graphic3d_Aspects::SetTextZoomable ******/
		/****** md5 signature: 799263abda100ba563c33475ad702060 ******/
		%feature("compactdefaultargs") SetTextZoomable;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Turns usage of text zoomable on/off.
") SetTextZoomable;
		void SetTextZoomable(bool theFlag);

		/****** Graphic3d_Aspects::SetTextureMap ******/
		/****** md5 signature: 4d0afcd350d6e9df864d41b902c76518 ******/
		%feature("compactdefaultargs") SetTextureMap;
		%feature("autodoc", "
Parameters
----------
theTexture: Graphic3d_TextureMap

Return
-------
None

Description
-----------
Assign texture to be mapped. See also SetTextureMapOn() to actually activate texture mapping.
") SetTextureMap;
		void SetTextureMap(const opencascade::handle<Graphic3d_TextureMap> & theTexture);

		/****** Graphic3d_Aspects::SetTextureMapOff ******/
		/****** md5 signature: 3c272f8a19f195db8799bfd674501adc ******/
		%feature("compactdefaultargs") SetTextureMapOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Disable texture mapping.
") SetTextureMapOff;
		void SetTextureMapOff();

		/****** Graphic3d_Aspects::SetTextureMapOn ******/
		/****** md5 signature: 8125d601fb4d3e18193da8566d56acf6 ******/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "
Parameters
----------
theToMap: bool

Return
-------
None

Description
-----------
Enable or disable texture mapping (has no effect if texture is not set).
") SetTextureMapOn;
		void SetTextureMapOn(bool theToMap);

		/****** Graphic3d_Aspects::SetTextureMapOn ******/
		/****** md5 signature: 0d7467974fbdade3c449a3231166dff5 ******/
		%feature("compactdefaultargs") SetTextureMapOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Enable texture mapping (has no effect if texture is not set).
") SetTextureMapOn;
		void SetTextureMapOn();

		/****** Graphic3d_Aspects::SetTextureSet ******/
		/****** md5 signature: 944fc8551c5f0eb6dce05b79e6b27914 ******/
		%feature("compactdefaultargs") SetTextureSet;
		%feature("autodoc", "
Parameters
----------
theTextures: Graphic3d_TextureSet

Return
-------
None

Description
-----------
Setup texture array to be mapped.
") SetTextureSet;
		void SetTextureSet(const opencascade::handle<Graphic3d_TextureSet> & theTextures);

		/****** Graphic3d_Aspects::ShaderProgram ******/
		/****** md5 signature: 857f7359f9600b740c8753a620f5d3f1 ******/
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ShaderProgram>

Description
-----------
Return shader program.
") ShaderProgram;
		const opencascade::handle<Graphic3d_ShaderProgram> & ShaderProgram();

		/****** Graphic3d_Aspects::ShadingModel ******/
		/****** md5 signature: abf83d7e5f232094cc54f18d79b6661e ******/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfShadingModel

Description
-----------
Returns shading model; Graphic3d_TypeOfShadingModel_DEFAULT by default. Graphic3d_TOSM_DEFAULT means that Shading Model set as default for entire Viewer will be used.
") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel();

		/****** Graphic3d_Aspects::SuppressBackFace ******/
		/****** md5 signature: 40795a90417758ffefc9ee3a73a12893 ******/
		%feature("compactdefaultargs") SuppressBackFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") SuppressBackFace;
		void SuppressBackFace();

		/****** Graphic3d_Aspects::TextAngle ******/
		/****** md5 signature: a2cf2fbb84a4ba2470bc1994bf5070c8 ******/
		%feature("compactdefaultargs") TextAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Angle of degree.
") TextAngle;
		float TextAngle();

		/****** Graphic3d_Aspects::TextDisplayType ******/
		/****** md5 signature: ea1f820655d16faac3b1a1ea22eee6dd ******/
		%feature("compactdefaultargs") TextDisplayType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfDisplayText

Description
-----------
Returns display type; Aspect_TODT_NORMAL by default.
") TextDisplayType;
		Aspect_TypeOfDisplayText TextDisplayType();

		/****** Graphic3d_Aspects::TextFont ******/
		/****** md5 signature: 5136fe0c05487d07cd0e4d290be5ba22 ******/
		%feature("compactdefaultargs") TextFont;
		%feature("autodoc", "Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") TextFont;
		const opencascade::handle<TCollection_HAsciiString> & TextFont();

		/****** Graphic3d_Aspects::TextFontAspect ******/
		/****** md5 signature: a701b63eb2707cde117bd21c1051e309 ******/
		%feature("compactdefaultargs") TextFontAspect;
		%feature("autodoc", "Return
-------
Font_FontAspect

Description
-----------
Returns text FontAspect.
") TextFontAspect;
		Font_FontAspect TextFontAspect();

		/****** Graphic3d_Aspects::TextStyle ******/
		/****** md5 signature: 5b8dce3790d8c9a8bbe5b487fc4173d7 ******/
		%feature("compactdefaultargs") TextStyle;
		%feature("autodoc", "Return
-------
Aspect_TypeOfStyleText

Description
-----------
Returns the text style; Aspect_TOST_NORMAL by default.
") TextStyle;
		Aspect_TypeOfStyleText TextStyle();

		/****** Graphic3d_Aspects::TextureMap ******/
		/****** md5 signature: d3f3eab9972845b733ae189c505c62cb ******/
		%feature("compactdefaultargs") TextureMap;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TextureMap>

Description
-----------
Return texture to be mapped.
") TextureMap;
		opencascade::handle<Graphic3d_TextureMap> TextureMap();

		/****** Graphic3d_Aspects::TextureMapState ******/
		/****** md5 signature: c311bbaba192ed972f153a49cf92dd65 ******/
		%feature("compactdefaultargs") TextureMapState;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if texture mapping is enabled (false by default).
") TextureMapState;
		bool TextureMapState();

		/****** Graphic3d_Aspects::TextureSet ******/
		/****** md5 signature: 2ff25b571bcd3bc16bd831d38b3d247c ******/
		%feature("compactdefaultargs") TextureSet;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TextureSet>

Description
-----------
Return texture array to be mapped.
") TextureSet;
		const opencascade::handle<Graphic3d_TextureSet> & TextureSet();

		/****** Graphic3d_Aspects::ToDrawEdges ******/
		/****** md5 signature: ebb13a2795fd190f68dd5ad205901719 ******/
		%feature("compactdefaultargs") ToDrawEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ToDrawEdges;
		bool ToDrawEdges();

		/****** Graphic3d_Aspects::ToDrawSilhouette ******/
		/****** md5 signature: 2c0c0fd754c64cc57f345fc665cc8f33 ******/
		%feature("compactdefaultargs") ToDrawSilhouette;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if silhouette (outline) should be drawn (with edge color and width); False by default.
") ToDrawSilhouette;
		bool ToDrawSilhouette();

		/****** Graphic3d_Aspects::ToMapTexture ******/
		/****** md5 signature: a39a45bca6ada99b43c1aa203f766447 ******/
		%feature("compactdefaultargs") ToMapTexture;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if texture mapping is enabled (false by default).
") ToMapTexture;
		bool ToMapTexture();

		/****** Graphic3d_Aspects::ToSkipFirstEdge ******/
		/****** md5 signature: ba01086b9308813c90b7110fc2f4ac55 ******/
		%feature("compactdefaultargs") ToSkipFirstEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if drawing element edges should discard first edge in triangle; False by default. Graphics hardware works mostly with triangles, so that wireframe presentation will draw triangle edges by default. This flag allows rendering wireframe presentation of quad-only array split into triangles. For this, quads should be split in specific order, so that the quad diagonal (to be NOT rendered) goes first: 1------2 / / Triangle #1: 2-0-1; Triangle #2: 0-2-3 0------3.
") ToSkipFirstEdge;
		bool ToSkipFirstEdge();

		/****** Graphic3d_Aspects::ToSuppressBackFaces ******/
		/****** md5 signature: 291ab01b16ecdd1cdd1cbdf740311643 ******/
		%feature("compactdefaultargs") ToSuppressBackFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
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
		/****** Graphic3d_Attribute::Stride ******/
		/****** md5 signature: f24b5635526e05492deb2dc57a0dcd3c ******/
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Stride;
		int Stride();

		/****** Graphic3d_Attribute::Stride ******/
		/****** md5 signature: 35d94f1fbbdd6ebae27af5276411ec03 ******/
		%feature("compactdefaultargs") Stride;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfData

Return
-------
int

Description
-----------
Return: size of attribute of specified data type.
") Stride;
		static int Stride(const Graphic3d_TypeOfData theType);

};


%extend Graphic3d_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Graphic3d_BSDF *
***********************/
class Graphic3d_BSDF {
	public:
		NCollection_Vec4<float > Kc;
		NCollection_Vec3<float > Kd;
		NCollection_Vec4<float > Ks;
		NCollection_Vec3<float > Kt;
		NCollection_Vec3<float > Le;
		NCollection_Vec4<float > Absorption;
		Graphic3d_Fresnel FresnelCoat;
		Graphic3d_Fresnel FresnelBase;
		/****** Graphic3d_BSDF::Graphic3d_BSDF ******/
		/****** md5 signature: ef3e719f8cae4402739eaa9a4c4dfb45 ******/
		%feature("compactdefaultargs") Graphic3d_BSDF;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates uninitialized BSDF.
") Graphic3d_BSDF;
		 Graphic3d_BSDF();

		/****** Graphic3d_BSDF::CreateDiffuse ******/
		/****** md5 signature: 6fd386a7112ff39cb18c0e2686d8f10c ******/
		%feature("compactdefaultargs") CreateDiffuse;
		%feature("autodoc", "
Parameters
----------
theWeight: NCollection_Vec3<float>

Return
-------
Graphic3d_BSDF

Description
-----------
Creates BSDF describing diffuse (Lambertian) surface.
") CreateDiffuse;
		static Graphic3d_BSDF CreateDiffuse(const NCollection_Vec3<float> & theWeight);

		/****** Graphic3d_BSDF::CreateGlass ******/
		/****** md5 signature: 0848c916cece02a89ecad316403089d8 ******/
		%feature("compactdefaultargs") CreateGlass;
		%feature("autodoc", "
Parameters
----------
theWeight: NCollection_Vec3<float>
theAbsorptionColor: NCollection_Vec3<float>
theAbsorptionCoeff: float
theRefractionIndex: float

Return
-------
Graphic3d_BSDF

Description
-----------
Creates BSDF describing glass-like object. Glass-like BSDF mixes refraction and reflection effects at grazing angles using physically-based Fresnel dielectric model.
") CreateGlass;
		static Graphic3d_BSDF CreateGlass(const NCollection_Vec3<float> & theWeight, const NCollection_Vec3<float> & theAbsorptionColor, const float theAbsorptionCoeff, const float theRefractionIndex);

		/****** Graphic3d_BSDF::CreateMetallic ******/
		/****** md5 signature: 4f02587de81f62d5dc38f7bdeb34974d ******/
		%feature("compactdefaultargs") CreateMetallic;
		%feature("autodoc", "
Parameters
----------
theWeight: NCollection_Vec3<float>
theFresnel: Graphic3d_Fresnel
theRoughness: float

Return
-------
Graphic3d_BSDF

Description
-----------
Creates BSDF describing polished metallic-like surface.
") CreateMetallic;
		static Graphic3d_BSDF CreateMetallic(const NCollection_Vec3<float> & theWeight, const Graphic3d_Fresnel & theFresnel, const float theRoughness);

		/****** Graphic3d_BSDF::CreateMetallicRoughness ******/
		/****** md5 signature: 930ca7145736f61c5c901f75de9967f5 ******/
		%feature("compactdefaultargs") CreateMetallicRoughness;
		%feature("autodoc", "
Parameters
----------
thePbr: Graphic3d_PBRMaterial

Return
-------
Graphic3d_BSDF

Description
-----------
Creates BSDF from PBR metallic-roughness material.
") CreateMetallicRoughness;
		static Graphic3d_BSDF CreateMetallicRoughness(const Graphic3d_PBRMaterial & thePbr);

		/****** Graphic3d_BSDF::CreateTransparent ******/
		/****** md5 signature: 4b2863bcb552eb4ecdfc3eac819d2513 ******/
		%feature("compactdefaultargs") CreateTransparent;
		%feature("autodoc", "
Parameters
----------
theWeight: NCollection_Vec3<float>
theAbsorptionColor: NCollection_Vec3<float>
theAbsorptionCoeff: float

Return
-------
Graphic3d_BSDF

Description
-----------
Creates BSDF describing transparent object. Transparent BSDF models simple transparency without refraction (the ray passes straight through the surface).
") CreateTransparent;
		static Graphic3d_BSDF CreateTransparent(const NCollection_Vec3<float> & theWeight, const NCollection_Vec3<float> & theAbsorptionColor, const float theAbsorptionCoeff);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_BSDF::Normalize ******/
		/****** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ******/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Normalizes BSDF components.
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
		NCollection_Vec4<float> * Colors;
		int * Bounds;
		int NbBounds;
		int NbMaxBounds;
		/****** Graphic3d_BoundBuffer::Graphic3d_BoundBuffer ******/
		/****** md5 signature: bc430c6678816ed8a40cb9c1495ede84 ******/
		%feature("compactdefaultargs") Graphic3d_BoundBuffer;
		%feature("autodoc", "
Parameters
----------
theAlloc: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_BoundBuffer;
		 Graphic3d_BoundBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_BoundBuffer::Init ******/
		/****** md5 signature: 373e46a3ae62b704f8d6aca04a0a7ed6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theNbBounds: int
theHasColors: bool

Return
-------
bool

Description
-----------
Allocates new empty array.
") Init;
		bool Init(const int theNbBounds, const bool theHasColors);

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
		/****** Graphic3d_BufferRange::Graphic3d_BufferRange ******/
		/****** md5 signature: 94437812d48eee6ddb30061db0a9b246 ******/
		%feature("compactdefaultargs") Graphic3d_BufferRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_BufferRange;
		 Graphic3d_BufferRange();

		/****** Graphic3d_BufferRange::Graphic3d_BufferRange ******/
		/****** md5 signature: 3909d2a53245a83a64422c589e376325 ******/
		%feature("compactdefaultargs") Graphic3d_BufferRange;
		%feature("autodoc", "
Parameters
----------
theStart: int
theLength: int

Return
-------
None

Description
-----------
Constructor.
") Graphic3d_BufferRange;
		 Graphic3d_BufferRange(int theStart, int theLength);

		/****** Graphic3d_BufferRange::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear the range.
") Clear;
		void Clear();

		/****** Graphic3d_BufferRange::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if range is empty.
") IsEmpty;
		bool IsEmpty();

		/****** Graphic3d_BufferRange::Unite ******/
		/****** md5 signature: 29f02a09e87c574e51a3b11bdb6d001b ******/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "
Parameters
----------
theRange: Graphic3d_BufferRange

Return
-------
None

Description
-----------
Add another range to this one.
") Unite;
		void Unite(const Graphic3d_BufferRange & theRange);

		/****** Graphic3d_BufferRange::Upper ******/
		/****** md5 signature: ddcdb4664c4dc21d38622f88e622db4f ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the Upper element within the range.
") Upper;
		int Upper();

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
		/****** Graphic3d_BvhCStructureSet::Box ******/
		/****** md5 signature: d1a018cbf2274e7ff5463b27347c702c ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
Graphic3d_BndBox3d

Description
-----------
Returns AABB of the structure.
") Box;
		Graphic3d_BndBox3d Box(const int theIdx);

		/****** Graphic3d_BvhCStructureSet::Center ******/
		/****** md5 signature: d631215324043d52c3ee2e21e8a95af0 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theAxis: int

Return
-------
double

Description
-----------
Calculates center of the AABB along given axis.
") Center;
		double Center(const int theIdx, const int theAxis);

		/****** Graphic3d_BvhCStructureSet::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total number of structures.
") Size;
		int Size();

		/****** Graphic3d_BvhCStructureSet::Structures ******/
		/****** md5 signature: 0247b44b3928398f253d7072dc172188 ******/
		%feature("compactdefaultargs") Structures;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap< Graphic3d_CStructure *>

Description
-----------
Access directly a collection of structures.
") Structures;
		const NCollection_IndexedMap<const Graphic3d_CStructure *> & Structures();

		/****** Graphic3d_BvhCStructureSet::Swap ******/
		/****** md5 signature: 1f92b6fb813e2e35c2fd9d0259aaee1e ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIdx1: int
theIdx2: int

Return
-------
None

Description
-----------
Swaps structures with the given indices.
") Swap;
		void Swap(const int theIdx1, const int theIdx2);

};


%make_alias(Graphic3d_BvhCStructureSet)

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
		/****** Graphic3d_CLight::Graphic3d_CLight ******/
		/****** md5 signature: b809aefcc1870097241707b7d23d4549 ******/
		%feature("compactdefaultargs") Graphic3d_CLight;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfLightSource

Return
-------
None

Description
-----------
Empty constructor, which should be followed by light source properties configuration.
") Graphic3d_CLight;
		 Graphic3d_CLight(Graphic3d_TypeOfLightSource theType);

		/****** Graphic3d_CLight::Angle ******/
		/****** md5 signature: 4442db1a256be94305ea7f46438a00de ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Angle;
		float Angle();

		/****** Graphic3d_CLight::Attenuation ******/
		/****** md5 signature: 68809aabd15aeb383f71000d36d391b8 ******/
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "
Parameters
----------

Return
-------
theConstAttenuation: double
theLinearAttenuation: double

Description
-----------
Returns the attenuation factors.
") Attenuation;
		void Attenuation(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_CLight::Color ******/
		/****** md5 signature: 7cec116411eb20e52d1fabf3015346da ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the color of the light source; WHITE by default.
") Color;
		const Quantity_Color & Color();

		/****** Graphic3d_CLight::Concentration ******/
		/****** md5 signature: ce44ddf08d1df0b6c7ac605d33dd2452 ******/
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns intensity distribution of the spot light, within [0.0, 1.0] range; 1.0 by default. This coefficient should be converted into spotlight exponent within [0.0, 128.0] range: @code float aSpotExponent = Concentration() * 128.0; anAttenuation *= pow (aCosA, aSpotExponent);' @endcode The concentration factor determines the dispersion of the light on the surface, the default value (1.0) corresponds to a minimum of dispersion.
") Concentration;
		float Concentration();

		/****** Graphic3d_CLight::ConstAttenuation ******/
		/****** md5 signature: bfccafc63ef7d94534b3dd2e22c0fede ******/
		%feature("compactdefaultargs") ConstAttenuation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns constant attenuation factor of positional/spot light source; 1.0f by default. Distance attenuation factors of reducing positional/spot light intensity depending on the distance from its position: @code float anAttenuation = 1.0 / (ConstAttenuation() + LinearAttenuation() * theDistance + QuadraticAttenuation() * theDistance * theDistance); @endcode.
") ConstAttenuation;
		float ConstAttenuation();

		/****** Graphic3d_CLight::CopyFrom ******/
		/****** md5 signature: b7e56d0aeca413f462788f3208bf0c98 ******/
		%feature("compactdefaultargs") CopyFrom;
		%feature("autodoc", "
Parameters
----------
theLight: Graphic3d_CLight

Return
-------
None

Description
-----------
Copy parameters from another light source excluding source type.
") CopyFrom;
		void CopyFrom(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****** Graphic3d_CLight::Direction ******/
		/****** md5 signature: 2b0a515c17ee028a8b572032cfbdfabb ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** Graphic3d_CLight::Direction ******/
		/****** md5 signature: 35d9f671f2a60c4257e0cea3c6fc0f4d ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "
Parameters
----------

Return
-------
theVx: double
theVy: double
theVz: double

Description
-----------
Returns the theVx, theVy, theVz direction of the light source.
") Direction;
		void Direction(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_CLight::DisplayPosition ******/
		/****** md5 signature: 9f9045903ce58e7bb413ba477b693cee ******/
		%feature("compactdefaultargs") DisplayPosition;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns location of positional/spot/directional light, which is the same as returned by Position().
") DisplayPosition;
		const gp_Pnt DisplayPosition();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_CLight::GetId ******/
		/****** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ******/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") GetId;
		const TCollection_AsciiString & GetId();

		/****** Graphic3d_CLight::HasRange ******/
		/****** md5 signature: 042ed400a2eaebbd19bb0801da6f5043 ******/
		%feature("compactdefaultargs") HasRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if maximum distance of point light source is defined.
") HasRange;
		bool HasRange();

		/****** Graphic3d_CLight::Headlight ******/
		/****** md5 signature: 1bfc285d2349ab360b6466e7c9970c61 ******/
		%feature("compactdefaultargs") Headlight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Alias for IsHeadlight().
") Headlight;
		bool Headlight();

		/****** Graphic3d_CLight::Intensity ******/
		/****** md5 signature: 85ca99a3158f73c6588494e368f9495c ******/
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Intensity;
		float Intensity();

		/****** Graphic3d_CLight::IsEnabled ******/
		/****** md5 signature: 08e6d5dff97c02382ea77da63335995c ******/
		%feature("compactdefaultargs") IsEnabled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check that the light source is turned on; True by default. This flag affects all occurrences of light sources, where it was registered and activated; so that it is possible defining an active light in View which is actually in disabled state.
") IsEnabled;
		bool IsEnabled();

		/****** Graphic3d_CLight::IsHeadlight ******/
		/****** md5 signature: 3e3cb0615735d3b57dc77065fa122bfe ******/
		%feature("compactdefaultargs") IsHeadlight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the light is a headlight; False by default. Headlight flag means that light position/direction are defined not in a World coordinate system, but relative to the camera orientation.
") IsHeadlight;
		bool IsHeadlight();

		/****** Graphic3d_CLight::LinearAttenuation ******/
		/****** md5 signature: 9e2e8edbed71b688f1bd1c076ae186d3 ******/
		%feature("compactdefaultargs") LinearAttenuation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns linear attenuation factor of positional/spot light source; 0.0 by default. Distance attenuation factors of reducing positional/spot light intensity depending on the distance from its position: @code float anAttenuation = 1.0 / (ConstAttenuation() + LinearAttenuation() * theDistance + QuadraticAttenuation() * theDistance * theDistance); @endcode.
") LinearAttenuation;
		float LinearAttenuation();

		/****** Graphic3d_CLight::Name ******/
		/****** md5 signature: efed61b92683387cd746fb27e0376505 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns light source name; empty string by default.
") Name;
		const TCollection_AsciiString & Name();

		/****** Graphic3d_CLight::PackedColor ******/
		/****** md5 signature: 0ade2a8759ee360771786d9745f9bc09 ******/
		%feature("compactdefaultargs") PackedColor;
		%feature("autodoc", "Return
-------
NCollection_Vec4<float>

Description
-----------
Returns the color of the light source with dummy Alpha component, which should be ignored.
") PackedColor;
		const NCollection_Vec4<float> & PackedColor();

		/****** Graphic3d_CLight::PackedDirection ******/
		/****** md5 signature: 990c0dd31aef69ab69bdbc120ae64c52 ******/
		%feature("compactdefaultargs") PackedDirection;
		%feature("autodoc", "Return
-------
NCollection_Vec3<float >

Description
-----------
Returns direction of directional/spot light.
") PackedDirection;
		NCollection_Vec3<float > PackedDirection();

		/****** Graphic3d_CLight::PackedDirectionRange ******/
		/****** md5 signature: 70808d779dc090549acf8d80b3525a84 ******/
		%feature("compactdefaultargs") PackedDirectionRange;
		%feature("autodoc", "Return
-------
NCollection_Vec4<float>

Description
-----------
Returns direction of directional/spot light and range for positional/spot light in alpha channel.
") PackedDirectionRange;
		const NCollection_Vec4<float> & PackedDirectionRange();

		/****** Graphic3d_CLight::PackedParams ******/
		/****** md5 signature: a33fc351f465ee0be00bce0edac0d245 ******/
		%feature("compactdefaultargs") PackedParams;
		%feature("autodoc", "Return
-------
NCollection_Vec4<float>

Description
-----------
Packed light parameters.
") PackedParams;
		const NCollection_Vec4<float> & PackedParams();

		/****** Graphic3d_CLight::Position ******/
		/****** md5 signature: 0ab08d371c89be0cb1eecbddf304bb77 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Position;
		const gp_Pnt Position();

		/****** Graphic3d_CLight::Position ******/
		/****** md5 signature: 6db3c060266568f339f03a5ce5c7f138 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double
theZ: double

Description
-----------
Returns location of positional/spot light.
") Position;
		void Position(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_CLight::Range ******/
		/****** md5 signature: c525b90a2092137381841b53e93cb441 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns maximum distance on which point light source affects to objects and is considered during illumination calculations. 0.0 means disabling range considering at all without any distance limits. Has sense only for point light sources (positional and spot).
") Range;
		float Range();

		/****** Graphic3d_CLight::Revision ******/
		/****** md5 signature: f614c1dea38767c7173b5e8c78d73993 ******/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Return: modification counter.
") Revision;
		size_t Revision();

		/****** Graphic3d_CLight::SetAngle ******/
		/****** md5 signature: f17656e59f877656fdab2e7f1a586d3a ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: float

Return
-------
None

Description
-----------
Angle in radians of the cone created by the spot, should be within range (0.0, M_PI).
") SetAngle;
		void SetAngle(float theAngle);

		/****** Graphic3d_CLight::SetAttenuation ******/
		/****** md5 signature: 99d73f75aa03f846b099af5fcd6f2763 ******/
		%feature("compactdefaultargs") SetAttenuation;
		%feature("autodoc", "
Parameters
----------
theConstAttenuation: float
theLinearAttenuation: float

Return
-------
None

Description
-----------
Defines the coefficients of attenuation; values should be >= 0.0 and their summ should not be equal to 0.
") SetAttenuation;
		void SetAttenuation(float theConstAttenuation, float theLinearAttenuation);

		/****** Graphic3d_CLight::SetCastShadows ******/
		/****** md5 signature: a6ef85889ab0dbd6737b58692be67569 ******/
		%feature("compactdefaultargs") SetCastShadows;
		%feature("autodoc", "
Parameters
----------
theToCast: bool

Return
-------
None

Description
-----------
Enable/disable shadow casting.
") SetCastShadows;
		void SetCastShadows(bool theToCast);

		/****** Graphic3d_CLight::SetColor ******/
		/****** md5 signature: 4493bec663df9e92c429e56b9c76a307 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Defines the color of a light source by giving the basic color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Graphic3d_CLight::SetConcentration ******/
		/****** md5 signature: 735515683bba2f6bdd4bbe121c02464a ******/
		%feature("compactdefaultargs") SetConcentration;
		%feature("autodoc", "
Parameters
----------
theConcentration: float

Return
-------
None

Description
-----------
Defines the coefficient of concentration; value should be within range [0.0, 1.0].
") SetConcentration;
		void SetConcentration(float theConcentration);

		/****** Graphic3d_CLight::SetDirection ******/
		/****** md5 signature: cefc66d5cea733e39294753286bacaa0 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theDir: gp_Dir

Return
-------
None

Description
-----------
Sets direction of directional/spot light.
") SetDirection;
		void SetDirection(const gp_Dir & theDir);

		/****** Graphic3d_CLight::SetDirection ******/
		/****** md5 signature: 470488cf4babf2b075fe34f07af44289 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theVx: double
theVy: double
theVz: double

Return
-------
None

Description
-----------
Sets direction of directional/spot light.
") SetDirection;
		void SetDirection(double theVx, double theVy, double theVz);

		/****** Graphic3d_CLight::SetDisplayPosition ******/
		/****** md5 signature: 8e4ce2892bc6f683fa9f79a8be114bde ******/
		%feature("compactdefaultargs") SetDisplayPosition;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Pnt

Return
-------
None

Description
-----------
Setup location of positional/spot/directional light, which is the same as SetPosition() but allows directional light source (technically having no position, but this point can be used for displaying light source presentation).
") SetDisplayPosition;
		void SetDisplayPosition(const gp_Pnt & thePosition);

		/****** Graphic3d_CLight::SetEnabled ******/
		/****** md5 signature: 31aa5e18f999737f957a0240836d99bc ******/
		%feature("compactdefaultargs") SetEnabled;
		%feature("autodoc", "
Parameters
----------
theIsOn: bool

Return
-------
None

Description
-----------
Change enabled state of the light state. This call does not remove or deactivate light source in Views/Viewers; instead it turns it OFF so that it just have no effect.
") SetEnabled;
		void SetEnabled(bool theIsOn);

		/****** Graphic3d_CLight::SetHeadlight ******/
		/****** md5 signature: 3e2ffb7d5e0709cde03d91927829d983 ******/
		%feature("compactdefaultargs") SetHeadlight;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Setup headlight flag.
") SetHeadlight;
		void SetHeadlight(bool theValue);

		/****** Graphic3d_CLight::SetIntensity ******/
		/****** md5 signature: 88c50bcc5f7c4771a2db171abfba7bdf ******/
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies the intensity of light source, which should be > 0.0.
") SetIntensity;
		void SetIntensity(float theValue);

		/****** Graphic3d_CLight::SetName ******/
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
Sets light source name.
") SetName;
		void SetName(TCollection_AsciiString theName);

		/****** Graphic3d_CLight::SetPosition ******/
		/****** md5 signature: 6cd7cdcecb59ee7f74eb9c342f464f4d ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
thePosition: gp_Pnt

Return
-------
None

Description
-----------
Setup location of positional/spot light.
") SetPosition;
		void SetPosition(const gp_Pnt & thePosition);

		/****** Graphic3d_CLight::SetPosition ******/
		/****** md5 signature: 18511b617222a608b9f4a5242c930f37 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double

Return
-------
None

Description
-----------
Setup location of positional/spot light.
") SetPosition;
		void SetPosition(double theX, double theY, double theZ);

		/****** Graphic3d_CLight::SetRange ******/
		/****** md5 signature: b8b13033b5f7f358dd2f377d83084062 ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies maximum distance on which point light source affects to objects and is considered during illumination calculations. Positional and spot lights are only point light sources. 0.0 means disabling range considering at all without any distance limits.
") SetRange;
		void SetRange(float theValue);

		/****** Graphic3d_CLight::SetSmoothAngle ******/
		/****** md5 signature: f0294e9814217f8941c310ca4d0a56c9 ******/
		%feature("compactdefaultargs") SetSmoothAngle;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies the smoothing angle (in radians) of directional light source; should be within range [0.0, M_PI/2].
") SetSmoothAngle;
		void SetSmoothAngle(float theValue);

		/****** Graphic3d_CLight::SetSmoothRadius ******/
		/****** md5 signature: c09ae1dd7028cbbed6e17934c731aff3 ******/
		%feature("compactdefaultargs") SetSmoothRadius;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies the smoothing radius of positional/spot light; should be >= 0.0.
") SetSmoothRadius;
		void SetSmoothRadius(float theValue);

		/****** Graphic3d_CLight::Smoothness ******/
		/****** md5 signature: 5e8aaf10524b3d255ab80a9f7c4eabdf ******/
		%feature("compactdefaultargs") Smoothness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the smoothness of light source (either smoothing angle for directional light or smoothing radius in case of positional light); 0.0 by default.
") Smoothness;
		float Smoothness();

		/****** Graphic3d_CLight::ToCastShadows ******/
		/****** md5 signature: 0ce2585d8edd5c968c18570f4d1f6f8e ******/
		%feature("compactdefaultargs") ToCastShadows;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if shadow casting is enabled; False by default. Has no effect in Ray-Tracing rendering mode.
") ToCastShadows;
		bool ToCastShadows();

		/****** Graphic3d_CLight::Type ******/
		/****** md5 signature: d146d133611b424d902f31165fccb442 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfLightSource

Description
-----------
Returns the Type of the Light, cannot be changed after object construction.
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
		opencascade::handle<Graphic3d_ViewAffinity > ViewAffinity;
		unsigned IsInfinite;
		unsigned stick;
		unsigned highlight;
		unsigned visible;
		unsigned HLRValidation;
		unsigned IsForHighlight;
		unsigned IsMutable;
		unsigned Is2dText;
		/****** Graphic3d_CStructure::BndBoxClipCheck ******/
		/****** md5 signature: 587f9bdd39f9da46e45f8aae1057d794 ******/
		%feature("compactdefaultargs") BndBoxClipCheck;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether check of object's bounding box clipping is enabled before drawing of object; True by default.
") BndBoxClipCheck;
		bool BndBoxClipCheck();

		/****** Graphic3d_CStructure::BoundingBox ******/
		/****** md5 signature: ec5ef849abfa47e8ebee30a0057dc18a ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Graphic3d_BndBox3d

Description
-----------
Return: bounding box of this presentation.
") BoundingBox;
		const Graphic3d_BndBox3d & BoundingBox();

		/****** Graphic3d_CStructure::ChangeBoundingBox ******/
		/****** md5 signature: 2730d3d1929f140f237adc334ee1f48d ******/
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "Return
-------
Graphic3d_BndBox3d

Description
-----------
Return: bounding box of this presentation without transformation matrix applied.
") ChangeBoundingBox;
		Graphic3d_BndBox3d & ChangeBoundingBox();

		/****** Graphic3d_CStructure::Clear ******/
		/****** md5 signature: d67699716a1d70f3f12e5a2b1d81e2d9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear graphic data.
") Clear;
		virtual void Clear();

		/****** Graphic3d_CStructure::ClipPlanes ******/
		/****** md5 signature: 26ab80085e76b6f03b64af6598080486 ******/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Return: associated clip planes.
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****** Graphic3d_CStructure::Connect ******/
		/****** md5 signature: 3c18c412a5529a81d24ebc61ca8f72d3 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_CStructure

Return
-------
None

Description
-----------
Connect other structure to this one.
") Connect;
		virtual void Connect(Graphic3d_CStructure & theStructure);

		/****** Graphic3d_CStructure::Disconnect ******/
		/****** md5 signature: e59d6dd5eef3e2f62b99a476301243d1 ******/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_CStructure

Return
-------
None

Description
-----------
Disconnect other structure to this one.
") Disconnect;
		virtual void Disconnect(Graphic3d_CStructure & theStructure);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_CStructure::GraphicDriver ******/
		/****** md5 signature: 92aa99aef6bae4d6a3fd285cb7eb38ce ******/
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_GraphicDriver>

Description
-----------
Return: graphic driver created this structure.
") GraphicDriver;
		const opencascade::handle<Graphic3d_GraphicDriver> & GraphicDriver();

		/****** Graphic3d_CStructure::GraphicHighlight ******/
		/****** md5 signature: be2986c2bc05d7038f912626e0a46896 ******/
		%feature("compactdefaultargs") GraphicHighlight;
		%feature("autodoc", "
Parameters
----------
theStyle: Graphic3d_PresentationAttributes

Return
-------
None

Description
-----------
Highlights structure with the given style.
") GraphicHighlight;
		virtual void GraphicHighlight(const opencascade::handle<Graphic3d_PresentationAttributes> & theStyle);

		/****** Graphic3d_CStructure::GraphicUnhighlight ******/
		/****** md5 signature: b264492d04a5b76206f1040464d0e471 ******/
		%feature("compactdefaultargs") GraphicUnhighlight;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unhighlights the structure and invalidates pointer to structure's highlight style.
") GraphicUnhighlight;
		virtual void GraphicUnhighlight();

		/****** Graphic3d_CStructure::Groups ******/
		/****** md5 signature: bfc11242543f04a1a53467f4dd227ab1 ******/
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<Graphic3d_Group>>

Description
-----------
Return: graphic groups.
") Groups;
		const NCollection_Sequence<opencascade::handle<Graphic3d_Group>> & Groups();

		/****** Graphic3d_CStructure::HasGroupFlipping ******/
		/****** md5 signature: 27e87363532a7fbeed8f7375ce707334 ******/
		%feature("compactdefaultargs") HasGroupFlipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if some groups might have flipping options; False by default.
") HasGroupFlipping;
		bool HasGroupFlipping();

		/****** Graphic3d_CStructure::HasGroupTransformPersistence ******/
		/****** md5 signature: 5d4952bc8c8bf1e884760e5b9bb8f355 ******/
		%feature("compactdefaultargs") HasGroupTransformPersistence;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if some groups might have transform persistence; False by default.
") HasGroupTransformPersistence;
		bool HasGroupTransformPersistence();

		/****** Graphic3d_CStructure::HighlightStyle ******/
		/****** md5 signature: 8178b69ba5e9aec0fad5df24b6a36d07 ******/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_PresentationAttributes>

Description
-----------
Returns valid handle to highlight style of the structure in case if highlight flag is set to true.
") HighlightStyle;
		const opencascade::handle<Graphic3d_PresentationAttributes> & HighlightStyle();

		/****** Graphic3d_CStructure::Identification ******/
		/****** md5 signature: e09dd1d0e8395be114dc117199e1947c ******/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return structure id (generated by Graphic3d_GraphicDriver::NewIdentification() during structure construction).
") Identification;
		int Identification();

		/****** Graphic3d_CStructure::IsAlwaysRendered ******/
		/****** md5 signature: d945d8d9aa6f511d55e326f90f947f33 ******/
		%feature("compactdefaultargs") IsAlwaysRendered;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the structure should be included into BVH tree or not.
") IsAlwaysRendered;
		bool IsAlwaysRendered();

		/****** Graphic3d_CStructure::IsCulled ******/
		/****** md5 signature: a84f045efd889fe7503c666a795c890b ******/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False if the structure hits the current view volume, otherwise returns True.
") IsCulled;
		bool IsCulled();

		/****** Graphic3d_CStructure::IsVisible ******/
		/****** md5 signature: 6d47e4fe91edc0d54b9a3b231c878799 ******/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return structure visibility flag.
") IsVisible;
		bool IsVisible();

		/****** Graphic3d_CStructure::IsVisible ******/
		/****** md5 signature: 24392749dd7aa4c890b7e28889a96a8f ******/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "
Parameters
----------
theViewId: int

Return
-------
bool

Description
-----------
Return structure visibility considering both View Affinity and global visibility state.
") IsVisible;
		bool IsVisible(const int theViewId);

		/****** Graphic3d_CStructure::MarkAsNotCulled ******/
		/****** md5 signature: 897aa286c42261d59dc236206e1c43d7 ******/
		%feature("compactdefaultargs") MarkAsNotCulled;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks structure as overlapping the current view volume one. The method is called during traverse of BVH tree.
") MarkAsNotCulled;
		void MarkAsNotCulled();

		/****** Graphic3d_CStructure::NewGroup ******/
		/****** md5 signature: b29eff19261565b2197170e2fddd4a01 ******/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "
Parameters
----------
theStruct: Graphic3d_Structure

Return
-------
opencascade::handle<Graphic3d_Group>

Description
-----------
Create new group within this structure.
") NewGroup;
		virtual opencascade::handle<Graphic3d_Group> NewGroup(const opencascade::handle<Graphic3d_Structure> & theStruct);

		/****** Graphic3d_CStructure::OnVisibilityChanged ******/
		/****** md5 signature: f939450daae8a4e0791763dd0796b996 ******/
		%feature("compactdefaultargs") OnVisibilityChanged;
		%feature("autodoc", "Return
-------
None

Description
-----------
Update structure visibility state.
") OnVisibilityChanged;
		virtual void OnVisibilityChanged();

		/****** Graphic3d_CStructure::PreviousPriority ******/
		/****** md5 signature: 5ce130b5e3a1bc1ab2fddea0442f64cf ******/
		%feature("compactdefaultargs") PreviousPriority;
		%feature("autodoc", "Return
-------
Graphic3d_DisplayPriority

Description
-----------
Return previous structure display priority.
") PreviousPriority;
		Graphic3d_DisplayPriority PreviousPriority();

		/****** Graphic3d_CStructure::Priority ******/
		/****** md5 signature: 27196dd56c108e83889182b069af6715 ******/
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "Return
-------
Graphic3d_DisplayPriority

Description
-----------
Return structure display priority.
") Priority;
		Graphic3d_DisplayPriority Priority();

		/****** Graphic3d_CStructure::RemoveGroup ******/
		/****** md5 signature: 5306031610a77c3eda50a31cbc46b00d ******/
		%feature("compactdefaultargs") RemoveGroup;
		%feature("autodoc", "
Parameters
----------
theGroup: Graphic3d_Group

Return
-------
None

Description
-----------
Remove group from this structure.
") RemoveGroup;
		virtual void RemoveGroup(const opencascade::handle<Graphic3d_Group> & theGroup);

		/****** Graphic3d_CStructure::SetBndBoxClipCheck ******/
		/****** md5 signature: 42c5be24ec5200b92ecc6a5e8fcc1223 ******/
		%feature("compactdefaultargs") SetBndBoxClipCheck;
		%feature("autodoc", "
Parameters
----------
theBndBoxClipCheck: bool

Return
-------
None

Description
-----------
Enable/disable check of object's bounding box clipping before drawing of object.
") SetBndBoxClipCheck;
		void SetBndBoxClipCheck(bool theBndBoxClipCheck);

		/****** Graphic3d_CStructure::SetClipPlanes ******/
		/****** md5 signature: e4333b4a8793a61136630719405f0b4b ******/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "
Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Return
-------
None

Description
-----------
Pass clip planes to the associated graphic driver structure.
") SetClipPlanes;
		void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****** Graphic3d_CStructure::SetCulled ******/
		/****** md5 signature: c44662265104da4fef9a27b4d3aae01a ******/
		%feature("compactdefaultargs") SetCulled;
		%feature("autodoc", "
Parameters
----------
theIsCulled: bool

Return
-------
None

Description
-----------
Marks structure as culled/not culled - note that IsAlwaysRendered() is ignored here!.
") SetCulled;
		void SetCulled(bool theIsCulled);

		/****** Graphic3d_CStructure::SetGroupFlipping ******/
		/****** md5 signature: 2842dc2c0dd1141fb242302963bba6ce ******/
		%feature("compactdefaultargs") SetGroupFlipping;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set if some groups might have flipping options.
") SetGroupFlipping;
		void SetGroupFlipping(bool theValue);

		/****** Graphic3d_CStructure::SetGroupTransformPersistence ******/
		/****** md5 signature: bac91b6506cf81c7d593e9f62c6eaf8b ******/
		%feature("compactdefaultargs") SetGroupTransformPersistence;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set if some groups might have transform persistence.
") SetGroupTransformPersistence;
		void SetGroupTransformPersistence(bool theValue);

		/****** Graphic3d_CStructure::SetPreviousPriority ******/
		/****** md5 signature: 6694962343cf95554e722769581ba96f ******/
		%feature("compactdefaultargs") SetPreviousPriority;
		%feature("autodoc", "
Parameters
----------
thePriority: Graphic3d_DisplayPriority

Return
-------
None

Description
-----------
Set previous structure display priority.
") SetPreviousPriority;
		void SetPreviousPriority(Graphic3d_DisplayPriority thePriority);

		/****** Graphic3d_CStructure::SetPriority ******/
		/****** md5 signature: 4f328308d16b2119887631e15176fd97 ******/
		%feature("compactdefaultargs") SetPriority;
		%feature("autodoc", "
Parameters
----------
thePriority: Graphic3d_DisplayPriority

Return
-------
None

Description
-----------
Set structure display priority.
") SetPriority;
		void SetPriority(Graphic3d_DisplayPriority thePriority);

		/****** Graphic3d_CStructure::SetTransformPersistence ******/
		/****** md5 signature: ebaa62acbe8ec5abd3805f5c94502bd2 ******/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "
Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Return
-------
None

Description
-----------
Set transformation persistence.
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** Graphic3d_CStructure::SetTransformation ******/
		/****** md5 signature: e50f985bc8429fcabc770ae98629b0e4 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theTrsf: TopLoc_Datum3D

Return
-------
None

Description
-----------
Assign transformation.
") SetTransformation;
		virtual void SetTransformation(const opencascade::handle<TopLoc_Datum3D> & theTrsf);

		/****** Graphic3d_CStructure::SetZLayer ******/
		/****** md5 signature: ce2e4a880a4e9d0bd19b68aa8a0ed6bd ******/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "
Parameters
----------
theLayerIndex: int

Return
-------
None

Description
-----------
Set z layer ID to display the structure in specified layer.
") SetZLayer;
		virtual void SetZLayer(int theLayerIndex);

		/****** Graphic3d_CStructure::ShadowLink ******/
		/****** md5 signature: 79e4828e5441bba02c128c277a5e9ce4 ******/
		%feature("compactdefaultargs") ShadowLink;
		%feature("autodoc", "
Parameters
----------
theManager: Graphic3d_StructureManager

Return
-------
opencascade::handle<Graphic3d_CStructure>

Description
-----------
Create shadow link to this structure.
") ShadowLink;
		virtual opencascade::handle<Graphic3d_CStructure> ShadowLink(const opencascade::handle<Graphic3d_StructureManager> & theManager);

		/****** Graphic3d_CStructure::TransformPersistence ******/
		/****** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ******/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TransformPers>

Description
-----------
Return transformation persistence.
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****** Graphic3d_CStructure::Transformation ******/
		/****** md5 signature: db8c043002ade3619cbf19c2cdc0b508 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Return transformation.
") Transformation;
		const opencascade::handle<TopLoc_Datum3D> & Transformation();

		/****** Graphic3d_CStructure::ZLayer ******/
		/****** md5 signature: 7420fa5788bb824c02345ee38be45933 ******/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerId

Description
-----------
Get z layer ID.
") ZLayer;
		Graphic3d_ZLayerId ZLayer();

		/****** Graphic3d_CStructure::updateLayerTransformation ******/
		/****** md5 signature: 2021ed30aa6033d5b3430e3eb071c124 ******/
		%feature("compactdefaultargs") updateLayerTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Update render transformation matrix.
") updateLayerTransformation;
		virtual void updateLayerTransformation();

};


%make_alias(Graphic3d_CStructure)

%extend Graphic3d_CStructure {
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

/* python proxy classes for enums */
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

		/****** Graphic3d_Camera::Graphic3d_Camera ******/
		/****** md5 signature: df0f7364c3262676d798db4877bc89d1 ******/
		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Initializes camera with the following properties: Eye (0, 0, -2); Center (0, 0, 0); Up (0, 1, 0); Type (Orthographic); FOVy (45); Scale (1000); IsStereo(false); ZNear (0.001); ZFar (3000.0); Aspect(1); ZFocus(1.0); ZFocusType(Relative); IOD(0.05); IODType(Relative).
") Graphic3d_Camera;
		 Graphic3d_Camera();

		/****** Graphic3d_Camera::Graphic3d_Camera ******/
		/****** md5 signature: 1a7bd2806a6306d0308f2ffa1ae2ea8b ******/
		%feature("compactdefaultargs") Graphic3d_Camera;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_Camera

Return
-------
None

Description
-----------
Copy constructor. 
Input parameter: theOther the camera to copy from.
") Graphic3d_Camera;
		 Graphic3d_Camera(const opencascade::handle<Graphic3d_Camera> & theOther);

		/****** Graphic3d_Camera::Aspect ******/
		/****** md5 signature: d75ed810a92ab0c4841ec48641f2e1c3 ******/
		%feature("compactdefaultargs") Aspect;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get camera display ratio. 
Return: display ratio.
") Aspect;
		double Aspect();

		/****** Graphic3d_Camera::AxialScale ******/
		/****** md5 signature: a34dc3fbf3c0151be08f9ddac5ac6f5c ******/
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Get camera axial scale. 
Return: Camera's axial scale.
") AxialScale;
		const gp_XYZ AxialScale();

		/****** Graphic3d_Camera::Center ******/
		/****** md5 signature: 6e010c335ea3ad7f510ab4dc46be6265 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get Center of the camera, e.g. the point where camera looks at. This point is computed as Eye() translated along Direction() at Distance(). 
Return: the point where the camera looks at.
") Center;
		gp_Pnt Center();

		/****** Graphic3d_Camera::ConvertProj2View ******/
		/****** md5 signature: 61f7cc7d630b6fa50bfb62f8bba100e4 ******/
		%feature("compactdefaultargs") ConvertProj2View;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Convert point from projection coordinate space to view coordinate space. 
Input parameter: thePnt the point in NDC. 
Return: point in VCS.
") ConvertProj2View;
		gp_Pnt ConvertProj2View(const gp_Pnt & thePnt);

		/****** Graphic3d_Camera::ConvertView2Proj ******/
		/****** md5 signature: 9b7fb83ada635448d430e47d15684c73 ******/
		%feature("compactdefaultargs") ConvertView2Proj;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Convert point from view coordinate space to projection coordinate space. 
Input parameter: thePnt the point in VCS. 
Return: point in NDC.
") ConvertView2Proj;
		gp_Pnt ConvertView2Proj(const gp_Pnt & thePnt);

		/****** Graphic3d_Camera::ConvertView2World ******/
		/****** md5 signature: b33cff606a6ff19c9474ccbac1b3618c ******/
		%feature("compactdefaultargs") ConvertView2World;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Convert point from view coordinate space to world coordinates. 
Input parameter: thePnt the 3D point in VCS. 
Return: point in WCS.
") ConvertView2World;
		gp_Pnt ConvertView2World(const gp_Pnt & thePnt);

		/****** Graphic3d_Camera::ConvertWorld2View ******/
		/****** md5 signature: d48a0df358800a049be17a0e29f01828 ******/
		%feature("compactdefaultargs") ConvertWorld2View;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Convert point from world coordinate space to view coordinate space. 
Input parameter: thePnt the 3D point in WCS. 
Return: point in VCS.
") ConvertWorld2View;
		gp_Pnt ConvertWorld2View(const gp_Pnt & thePnt);

		/****** Graphic3d_Camera::Copy ******/
		/****** md5 signature: a197e78409862ab70e2f4b022adc6706 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_Camera

Return
-------
None

Description
-----------
Copy properties of another camera. 
Input parameter: theOther the camera to copy from.
") Copy;
		void Copy(const opencascade::handle<Graphic3d_Camera> & theOther);

		/****** Graphic3d_Camera::CopyMappingData ******/
		/****** md5 signature: fa827f178d7b4e25e2c784fd749a08d9 ******/
		%feature("compactdefaultargs") CopyMappingData;
		%feature("autodoc", "
Parameters
----------
theOtherCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Initialize mapping related parameters from other camera handle.
") CopyMappingData;
		void CopyMappingData(const opencascade::handle<Graphic3d_Camera> & theOtherCamera);

		/****** Graphic3d_Camera::CopyOrientationData ******/
		/****** md5 signature: a3dee68836d129923d0ab58babe72b9f ******/
		%feature("compactdefaultargs") CopyOrientationData;
		%feature("autodoc", "
Parameters
----------
theOtherCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Initialize orientation related parameters from other camera handle.
") CopyOrientationData;
		void CopyOrientationData(const opencascade::handle<Graphic3d_Camera> & theOtherCamera);

		/****** Graphic3d_Camera::Direction ******/
		/****** md5 signature: fe17f01a1a479d7628e85d427dbda641 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		const gp_Dir Direction();

		/****** Graphic3d_Camera::Distance ******/
		/****** md5 signature: 838085eebdef2cf934720624bb07f993 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get distance of Eye from camera Center. 
Return: the distance.
") Distance;
		double Distance();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Camera::Eye ******/
		/****** md5 signature: 5d89a7e69918722c78431c69f97cda69 ******/
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get camera Eye position. 
Return: camera eye location.
") Eye;
		const gp_Pnt Eye();

		/****** Graphic3d_Camera::FOV2d ******/
		/****** md5 signature: 83cfbf8674368be4ef1419de593e5ff3 ******/
		%feature("compactdefaultargs") FOV2d;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get Field Of View (FOV) restriction for 2D on-screen elements; 180 degrees by default. When 2D FOV is smaller than FOVy or FOVx, 2D elements defined within offset from view corner will be extended to fit into specified 2D FOV. This can be useful to make 2D elements sharply visible, like in case of HMD normally having extra large FOVy.
") FOV2d;
		double FOV2d();

		/****** Graphic3d_Camera::FOVx ******/
		/****** md5 signature: f97f9f30742b99e6d9b71284a49539a8 ******/
		%feature("compactdefaultargs") FOVx;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get Field Of View (FOV) in x axis. 
Return: the FOV value in degrees.
") FOVx;
		double FOVx();

		/****** Graphic3d_Camera::FOVy ******/
		/****** md5 signature: 685f03af885940b8223cdd716be99cb2 ******/
		%feature("compactdefaultargs") FOVy;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get Field Of View (FOV) in y axis. 
Return: the FOV value in degrees.
") FOVy;
		double FOVy();

		/****** Graphic3d_Camera::FitMinMax ******/
		/****** md5 signature: ef63ed2c19f888dfdeb172d7620f41e5 ******/
		%feature("compactdefaultargs") FitMinMax;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box
theResolution: double
theToEnlargeIfLine: bool

Return
-------
bool

Description
-----------
Adjust camera to fit in specified AABB.
") FitMinMax;
		bool FitMinMax(const Bnd_Box & theBox, const double theResolution, const bool theToEnlargeIfLine);

		/****** Graphic3d_Camera::Frustum ******/
		/****** md5 signature: cf93be954a6467b83bd07e5a762a6fe9 ******/
		%feature("compactdefaultargs") Frustum;
		%feature("autodoc", "
Parameters
----------
theLeft: gp_Pln
theRight: gp_Pln
theBottom: gp_Pln
theTop: gp_Pln
theNear: gp_Pln
theFar: gp_Pln

Return
-------
None

Description
-----------
Calculate WCS frustum planes for the camera projection volume. Frustum is a convex volume determined by six planes directing inwards. The frustum planes are usually used as inputs for camera algorithms. Thus, if any changes to projection matrix calculation are necessary, the frustum planes calculation should be also touched. @param[out] theLeft the frustum plane for left side of view. @param[out] theRight the frustum plane for right side of view. @param[out] theBottom the frustum plane for bottom side of view. @param[out] theTop the frustum plane for top side of view. @param[out] theNear the frustum plane for near side of view. @param[out] theFar the frustum plane for far side of view.
") Frustum;
		void Frustum(gp_Pln & theLeft, gp_Pln & theRight, gp_Pln & theBottom, gp_Pln & theTop, gp_Pln & theNear, gp_Pln & theFar);

		/****** Graphic3d_Camera::FrustumPoints ******/
		/****** md5 signature: e722ef8e408b71819eba8ab52a178a18 ******/
		%feature("compactdefaultargs") FrustumPoints;
		%feature("autodoc", "
Parameters
----------
thePoints: NCollection_Array1<NCollection_Vec3<double>>
theModelWorld: NCollection_Mat4<double> (optional, default to NCollection_Mat4<double>())

Return
-------
None

Description
-----------
Fill array of current view frustum corners. The size of this array is equal to FrustumVerticesNB. The order of vertices is as defined in FrustumVert_* enumeration.
") FrustumPoints;
		void FrustumPoints(NCollection_Array1<NCollection_Vec3<double>> & thePoints, const NCollection_Mat4<double> & theModelWorld = NCollection_Mat4<double>());

		/****** Graphic3d_Camera::GetIODType ******/
		/****** md5 signature: 930a27532abcc8fe5dc7b294192f1acf ******/
		%feature("compactdefaultargs") GetIODType;
		%feature("autodoc", "Return
-------
Graphic3d_Camera::IODType

Description
-----------
Get Intraocular distance definition type. 
Return: definition type used for Intraocular distance.
") GetIODType;
		Graphic3d_Camera::IODType GetIODType();

		/****** Graphic3d_Camera::IOD ******/
		/****** md5 signature: 6c526dc30d8815f08e97a67084902fd1 ******/
		%feature("compactdefaultargs") IOD;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get Intraocular distance value. 
Return: absolute or relative IOD value depending on its definition type.
") IOD;
		double IOD();

		/****** Graphic3d_Camera::Interpolate ******/
		/****** md5 signature: cf58d049943cb5707d151a3600470e95 ******/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theStart: Graphic3d_Camera
theEnd: Graphic3d_Camera
theT: double
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Linear interpolation tool for camera orientation and position. This tool interpolates camera parameters scale, eye, center, rotation (up and direction vectors) independently. 
See also: NCollection_Lerp<opencascade::handle<Graphic3d_Camera>> //! Eye/Center interpolation is performed through defining an anchor point in-between Center and Eye. The anchor position is defined as point near to the camera point which has smaller translation part. The main idea is to keep the distance between Center and Eye (which will change if Center and Eye translation will be interpolated independently). E.g.: - When both Center and Eye are moved at the same vector -> both will be just translated by straight line; - When Center is not moved -> camera Eye will move around Center through arc; - When Eye is not moved -> camera Center will move around Eye through arc; - When both Center and Eye are move by different vectors -> transformation will be something in between, and will try interpolate linearly the distance between Center and Eye. //! This transformation might be not in line with user expectations. In this case, application might define intermediate camera positions for interpolation or implement own interpolation logic. //! 
Input parameter: theStart initial camera position 
Input parameter: theEnd final camera position 
Input parameter: theT step between initial and final positions within [0,1] range @param[out] theCamera interpolation result.
") Interpolate;
		static void Interpolate(const opencascade::handle<Graphic3d_Camera> & theStart, const opencascade::handle<Graphic3d_Camera> & theEnd, const double theT, opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** Graphic3d_Camera::InvalidateOrientation ******/
		/****** md5 signature: db406d3073ea0c1be275948df298cd3b ******/
		%feature("compactdefaultargs") InvalidateOrientation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidate orientation matrix. The matrix will be updated on request.
") InvalidateOrientation;
		void InvalidateOrientation();

		/****** Graphic3d_Camera::InvalidateProjection ******/
		/****** md5 signature: 0d6d6b15fdde9614d7c09fbbef20f7af ******/
		%feature("compactdefaultargs") InvalidateProjection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidate state of projection matrix. The matrix will be updated on request.
") InvalidateProjection;
		void InvalidateProjection();

		/****** Graphic3d_Camera::IsCustomMonoProjection ******/
		/****** md5 signature: f40f82bd48e25f5f239d265ca31a9419 ******/
		%feature("compactdefaultargs") IsCustomMonoProjection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if custom projection matrix is set.
") IsCustomMonoProjection;
		bool IsCustomMonoProjection();

		/****** Graphic3d_Camera::IsCustomStereoFrustum ******/
		/****** md5 signature: 79a61811976022584d3a16a0132ac5d5 ******/
		%feature("compactdefaultargs") IsCustomStereoFrustum;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if custom stereo frustums are set.
") IsCustomStereoFrustum;
		bool IsCustomStereoFrustum();

		/****** Graphic3d_Camera::IsCustomStereoProjection ******/
		/****** md5 signature: f95aa0bf9f02210f97a0b93d8ac62ce5 ******/
		%feature("compactdefaultargs") IsCustomStereoProjection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if custom stereo projection matrices are set.
") IsCustomStereoProjection;
		bool IsCustomStereoProjection();

		/****** Graphic3d_Camera::IsOrthographic ******/
		/****** md5 signature: 3e02e6eefcf32e90bc591e1f7e7218b7 ******/
		%feature("compactdefaultargs") IsOrthographic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check that the camera projection is orthographic. 
Return: boolean flag that indicates whether the camera's projection is orthographic or not.
") IsOrthographic;
		bool IsOrthographic();

		/****** Graphic3d_Camera::IsStereo ******/
		/****** md5 signature: c6e34521a8220edc500a23fd82023409 ******/
		%feature("compactdefaultargs") IsStereo;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check whether the camera projection is stereo. Please note that stereo rendering is now implemented with support of Quad buffering. 
Return: boolean flag indicating whether the stereographic L/R projection is chosen.
") IsStereo;
		bool IsStereo();

		/****** Graphic3d_Camera::IsZeroToOneDepth ******/
		/****** md5 signature: f68ea5de65aed33ae417a8c6dd253d78 ******/
		%feature("compactdefaultargs") IsZeroToOneDepth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if camera should calculate projection matrix for [0, 1] depth range or for [-1, 1] range. False by default.
") IsZeroToOneDepth;
		bool IsZeroToOneDepth();

		/****** Graphic3d_Camera::MoveEyeTo ******/
		/****** md5 signature: 8805118f8cd5bdfe0afd4ef0aee46699 ******/
		%feature("compactdefaultargs") MoveEyeTo;
		%feature("autodoc", "
Parameters
----------
theEye: gp_Pnt

Return
-------
None

Description
-----------
Sets camera Eye position. Unlike SetEye(), this method only changes Eye point and preserves camera direction. 
Input parameter: theEye the location of camera's Eye. 
See also: SetEye().
") MoveEyeTo;
		void MoveEyeTo(const gp_Pnt & theEye);

		/****** Graphic3d_Camera::NDC2dOffsetX ******/
		/****** md5 signature: 96ae6880010a468a82d59be4ad3bd178 ******/
		%feature("compactdefaultargs") NDC2dOffsetX;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return offset to the view corner in NDC space within dimension X for 2d on-screen elements, which is normally 0.5. Can be clamped when FOVx exceeds FOV2d.
") NDC2dOffsetX;
		double NDC2dOffsetX();

		/****** Graphic3d_Camera::NDC2dOffsetY ******/
		/****** md5 signature: 9fad7dcd1fe04e0b4052631263b66d23 ******/
		%feature("compactdefaultargs") NDC2dOffsetY;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return offset to the view corner in NDC space within dimension X for 2d on-screen elements, which is normally 0.5. Can be clamped when FOVy exceeds FOV2d.
") NDC2dOffsetY;
		double NDC2dOffsetY();

		/****** Graphic3d_Camera::OrientationMatrix ******/
		/****** md5 signature: 442b476c696ad0700d22860f92a851c2 ******/
		%feature("compactdefaultargs") OrientationMatrix;
		%feature("autodoc", "Return
-------
NCollection_Mat4<double>

Description
-----------
No available documentation.
") OrientationMatrix;
		const NCollection_Mat4<double> & OrientationMatrix();

		/****** Graphic3d_Camera::OrientationMatrixF ******/
		/****** md5 signature: b0ce81a4c6bccbf83cca60041d1541e6 ******/
		%feature("compactdefaultargs") OrientationMatrixF;
		%feature("autodoc", "Return
-------
NCollection_Mat4<float>

Description
-----------
Get orientation matrix of float precision. 
Return: camera orientation matrix.
") OrientationMatrixF;
		const NCollection_Mat4<float> & OrientationMatrixF();

		/****** Graphic3d_Camera::OrthogonalizeUp ******/
		/****** md5 signature: e85fd67d4179af26c6f84c4298353c05 ******/
		%feature("compactdefaultargs") OrthogonalizeUp;
		%feature("autodoc", "Return
-------
None

Description
-----------
Orthogonalize up direction vector.
") OrthogonalizeUp;
		void OrthogonalizeUp();

		/****** Graphic3d_Camera::OrthogonalizedUp ******/
		/****** md5 signature: 8e9cca336a7e02481013c3c654a54700 ******/
		%feature("compactdefaultargs") OrthogonalizedUp;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Return a copy of orthogonalized up direction vector.
") OrthogonalizedUp;
		gp_Dir OrthogonalizedUp();

		/****** Graphic3d_Camera::Project ******/
		/****** md5 signature: abd4a94d8c8aae54509e94ad36fb4ac1 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Project;
		gp_Pnt Project(const gp_Pnt & thePnt);

		/****** Graphic3d_Camera::ProjectionMatrix ******/
		/****** md5 signature: c1910cd92bb407bcab8c7c4fdeb6ecab ******/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "Return
-------
NCollection_Mat4<double>

Description
-----------
Get monographic or middle point projection matrix used for monographic rendering and for point projection / unprojection. 
Return: monographic projection matrix.
") ProjectionMatrix;
		const NCollection_Mat4<double> & ProjectionMatrix();

		/****** Graphic3d_Camera::ProjectionMatrixF ******/
		/****** md5 signature: f5dd6048457761ed557b423c374b518b ******/
		%feature("compactdefaultargs") ProjectionMatrixF;
		%feature("autodoc", "Return
-------
NCollection_Mat4<float>

Description
-----------
Get monographic or middle point projection matrix of float precision used for monographic rendering and for point projection / unprojection. 
Return: monographic projection matrix.
") ProjectionMatrixF;
		const NCollection_Mat4<float> & ProjectionMatrixF();

		/****** Graphic3d_Camera::ProjectionState ******/
		/****** md5 signature: e6808a01e100ed375fd3a0fb5902451e ******/
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns modification state of camera projection matrix.
") ProjectionState;
		size_t ProjectionState();

		/****** Graphic3d_Camera::ProjectionStereoLeft ******/
		/****** md5 signature: 8ad92d3c57d3d5710aa687d245914e96 ******/
		%feature("compactdefaultargs") ProjectionStereoLeft;
		%feature("autodoc", "Return
-------
NCollection_Mat4<double>

Description
-----------
Return: stereographic matrix computed for left eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
") ProjectionStereoLeft;
		const NCollection_Mat4<double> & ProjectionStereoLeft();

		/****** Graphic3d_Camera::ProjectionStereoLeftF ******/
		/****** md5 signature: 9993cba8d303b58cb42b5d54f240a08f ******/
		%feature("compactdefaultargs") ProjectionStereoLeftF;
		%feature("autodoc", "Return
-------
NCollection_Mat4<float>

Description
-----------
Return: stereographic matrix of float precision computed for left eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
") ProjectionStereoLeftF;
		const NCollection_Mat4<float> & ProjectionStereoLeftF();

		/****** Graphic3d_Camera::ProjectionStereoRight ******/
		/****** md5 signature: 7d64f1ff32f2d7e4498a6eaebd40abfa ******/
		%feature("compactdefaultargs") ProjectionStereoRight;
		%feature("autodoc", "Return
-------
NCollection_Mat4<double>

Description
-----------
Return: stereographic matrix computed for right eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
") ProjectionStereoRight;
		const NCollection_Mat4<double> & ProjectionStereoRight();

		/****** Graphic3d_Camera::ProjectionStereoRightF ******/
		/****** md5 signature: 7bae2856037fad77a5eb162a3e8cd25f ******/
		%feature("compactdefaultargs") ProjectionStereoRightF;
		%feature("autodoc", "Return
-------
NCollection_Mat4<float>

Description
-----------
Return: stereographic matrix of float precision computed for right eye. Please note that this method is used for rendering for <i>Projection_Stereo</i>.
") ProjectionStereoRightF;
		const NCollection_Mat4<float> & ProjectionStereoRightF();

		/****** Graphic3d_Camera::ProjectionType ******/
		/****** md5 signature: bbd21df5398364c0e880bd19f5b180dd ******/
		%feature("compactdefaultargs") ProjectionType;
		%feature("autodoc", "Return
-------
Graphic3d_Camera::Projection

Description
-----------
Return: camera projection type.
") ProjectionType;
		Graphic3d_Camera::Projection ProjectionType();

		/****** Graphic3d_Camera::ResetCustomProjection ******/
		/****** md5 signature: c76eab2fdadc47ea772ac6e33aae3e3e ******/
		%feature("compactdefaultargs") ResetCustomProjection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unset all custom frustums and projection matrices.
") ResetCustomProjection;
		void ResetCustomProjection();

		/****** Graphic3d_Camera::Scale ******/
		/****** md5 signature: 61c9c74d8ec40780bdfa84588e6789a4 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get camera scale. 
Return: camera scale factor.
") Scale;
		double Scale();

		/****** Graphic3d_Camera::SetAspect ******/
		/****** md5 signature: de4a370b973710f919ee7cb8fea28374 ******/
		%feature("compactdefaultargs") SetAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: double

Return
-------
None

Description
-----------
Changes width / height display ratio. 
Input parameter: theAspect the display ratio.
") SetAspect;
		void SetAspect(const double theAspect);

		/****** Graphic3d_Camera::SetAxialScale ******/
		/****** md5 signature: 3a595f07bdcb576462e6ff2b1385e904 ******/
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "
Parameters
----------
theAxialScale: gp_XYZ

Return
-------
None

Description
-----------
Set camera axial scale. 
Input parameter: theAxialScale the axial scale vector.
") SetAxialScale;
		void SetAxialScale(const gp_XYZ & theAxialScale);

		/****** Graphic3d_Camera::SetCenter ******/
		/****** md5 signature: d37eaee629aacdd36ba1b49cba7ff093 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt

Return
-------
None

Description
-----------
Sets Center of the camera, e.g. the point where camera looks at. This methods changes camera direction, so that the new direction is computed from current Eye position to specified Center position. 
Input parameter: theCenter the point where the camera looks at.
") SetCenter;
		void SetCenter(const gp_Pnt & theCenter);

		/****** Graphic3d_Camera::SetCustomMonoProjection ******/
		/****** md5 signature: 42a2d3831c6cc614893d4758eb30a5f3 ******/
		%feature("compactdefaultargs") SetCustomMonoProjection;
		%feature("autodoc", "
Parameters
----------
theProj: NCollection_Mat4<double>

Return
-------
None

Description
-----------
Set custom projection matrix.
") SetCustomMonoProjection;
		void SetCustomMonoProjection(const NCollection_Mat4<double> & theProj);

		/****** Graphic3d_Camera::SetCustomStereoFrustums ******/
		/****** md5 signature: f5945b101ff46f1045a8147a29746419 ******/
		%feature("compactdefaultargs") SetCustomStereoFrustums;
		%feature("autodoc", "
Parameters
----------
theFrustumL: Aspect_FrustumLRBT<double>
theFrustumR: Aspect_FrustumLRBT<double>

Return
-------
None

Description
-----------
Set custom stereo frustums. These can be retrieved from APIs like OpenVR.
") SetCustomStereoFrustums;
		void SetCustomStereoFrustums(const Aspect_FrustumLRBT<double> & theFrustumL, const Aspect_FrustumLRBT<double> & theFrustumR);

		/****** Graphic3d_Camera::SetCustomStereoProjection ******/
		/****** md5 signature: 6248d4a148bd8209509833ce425364cc ******/
		%feature("compactdefaultargs") SetCustomStereoProjection;
		%feature("autodoc", "
Parameters
----------
theProjL: NCollection_Mat4<double>
theHeadToEyeL: NCollection_Mat4<double>
theProjR: NCollection_Mat4<double>
theHeadToEyeR: NCollection_Mat4<double>

Return
-------
None

Description
-----------
Set custom stereo projection matrices. 
Input parameter: theProjL left eye projection matrix 
Input parameter: theHeadToEyeL left head to eye translation matrix 
Input parameter: theProjR right eye projection matrix 
Input parameter: theHeadToEyeR right head to eye translation matrix.
") SetCustomStereoProjection;
		void SetCustomStereoProjection(const NCollection_Mat4<double> & theProjL, const NCollection_Mat4<double> & theHeadToEyeL, const NCollection_Mat4<double> & theProjR, const NCollection_Mat4<double> & theHeadToEyeR);

		/****** Graphic3d_Camera::SetDirection ******/
		/****** md5 signature: cefc66d5cea733e39294753286bacaa0 ******/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theDir: gp_Dir

Return
-------
None

Description
-----------
Sets camera look direction and computes the new Eye position relative to current Center. WARNING! This method does NOT verify that the current Up() vector is orthogonal to the new Direction. 
Input parameter: theDir the direction.
") SetDirection;
		void SetDirection(const gp_Dir & theDir);

		/****** Graphic3d_Camera::SetDirectionFromEye ******/
		/****** md5 signature: bdeb39a6f9bad4d21e8fd65f1dd48e35 ******/
		%feature("compactdefaultargs") SetDirectionFromEye;
		%feature("autodoc", "
Parameters
----------
theDir: gp_Dir

Return
-------
None

Description
-----------
Sets camera look direction preserving the current Eye() position. WARNING! This method does NOT verify that the current Up() vector is orthogonal to the new Direction. 
Input parameter: theDir the direction.
") SetDirectionFromEye;
		void SetDirectionFromEye(const gp_Dir & theDir);

		/****** Graphic3d_Camera::SetDistance ******/
		/****** md5 signature: acd7731c4eb20be74dd118249f792402 ******/
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "
Parameters
----------
theDistance: double

Return
-------
None

Description
-----------
Set distance of Eye from camera Center. 
Input parameter: theDistance the distance.
") SetDistance;
		void SetDistance(const double theDistance);

		/****** Graphic3d_Camera::SetEye ******/
		/****** md5 signature: 087ce1b13605c60b90cb65401431043b ******/
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "
Parameters
----------
theEye: gp_Pnt

Return
-------
None

Description
-----------
Sets camera Eye position. WARNING! For backward compatibility reasons, this method also changes view direction, so that the new direction is computed from new Eye position to old Center position. 
Input parameter: theEye the location of camera's Eye. 
See also: MoveEyeTo(), SetEyeAndCenter().
") SetEye;
		void SetEye(const gp_Pnt & theEye);

		/****** Graphic3d_Camera::SetEyeAndCenter ******/
		/****** md5 signature: 9fba3596e320aa26e99834ae5f012844 ******/
		%feature("compactdefaultargs") SetEyeAndCenter;
		%feature("autodoc", "
Parameters
----------
theEye: gp_Pnt
theCenter: gp_Pnt

Return
-------
None

Description
-----------
Sets camera Eye and Center positions. 
Input parameter: theEye the location of camera's Eye 
Input parameter: theCenter the location of camera's Center.
") SetEyeAndCenter;
		void SetEyeAndCenter(const gp_Pnt & theEye, const gp_Pnt & theCenter);

		/****** Graphic3d_Camera::SetFOV2d ******/
		/****** md5 signature: e12be7346e2bec8e937a6a7c3ee9da28 ******/
		%feature("compactdefaultargs") SetFOV2d;
		%feature("autodoc", "
Parameters
----------
theFOV: double

Return
-------
None

Description
-----------
Set Field Of View (FOV) restriction for 2D on-screen elements.
") SetFOV2d;
		void SetFOV2d(double theFOV);

		/****** Graphic3d_Camera::SetFOVy ******/
		/****** md5 signature: 219c400e78037073a57b91f8f6cabb20 ******/
		%feature("compactdefaultargs") SetFOVy;
		%feature("autodoc", "
Parameters
----------
theFOVy: double

Return
-------
None

Description
-----------
Set Field Of View (FOV) in y axis for perspective projection. Field of View in x axis is automatically scaled from view aspect ratio. 
Input parameter: theFOVy the FOV in degrees.
") SetFOVy;
		void SetFOVy(const double theFOVy);

		/****** Graphic3d_Camera::SetIOD ******/
		/****** md5 signature: 889ed359887818d42d53fa688539caba ******/
		%feature("compactdefaultargs") SetIOD;
		%feature("autodoc", "
Parameters
----------
theType: IODType
theIOD: double

Return
-------
None

Description
-----------
Sets Intraocular distance. 
Input parameter: theType the IOD definition type. IOD can be defined as absolute value or relatively to (as coefficient of) camera focal length. 
Input parameter: theIOD the Intraocular distance.
") SetIOD;
		void SetIOD(IODType theType, const double theIOD);

		/****** Graphic3d_Camera::SetIdentityOrientation ******/
		/****** md5 signature: 9cd866c96241fdf94bd0dbc5729d9125 ******/
		%feature("compactdefaultargs") SetIdentityOrientation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets camera parameters to make current orientation matrix identity one.
") SetIdentityOrientation;
		void SetIdentityOrientation();

		/****** Graphic3d_Camera::SetProjectionType ******/
		/****** md5 signature: 500231e331fd3294fa2c82d618e95738 ******/
		%feature("compactdefaultargs") SetProjectionType;
		%feature("autodoc", "
Parameters
----------
theProjection: Projection

Return
-------
None

Description
-----------
Change camera projection type. When switching to perspective projection from orthographic one, the ZNear and ZFar are reset to default values (0.001, 3000.0) if less than 0.0. 
Input parameter: theProjection the camera projection type.
") SetProjectionType;
		void SetProjectionType(Projection theProjection);

		/****** Graphic3d_Camera::SetScale ******/
		/****** md5 signature: e4c4cdd9135da02c4042f9791681f0b2 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
Sets camera scale. For orthographic projection the scale factor corresponds to parallel scale of view mapping (i.e. size of viewport). For perspective camera scale is converted to distance. The scale specifies equal size of the view projection in both dimensions assuming that the aspect is 1.0. The projection height and width are specified with the scale and correspondingly multiplied by the aspect. 
Input parameter: theScale the scale factor.
") SetScale;
		void SetScale(const double theScale);

		/****** Graphic3d_Camera::SetTile ******/
		/****** md5 signature: abe7d7a3bf0a3dd2a74a1495dad37c06 ******/
		%feature("compactdefaultargs") SetTile;
		%feature("autodoc", "
Parameters
----------
theTile: Graphic3d_CameraTile

Return
-------
None

Description
-----------
Sets the Tile defining the drawing sub-area within View. Note that tile defining a region outside the view boundaries is also valid - use method Graphic3d_CameraTile::Cropped() to assign a cropped copy. 
Parameter theTile tile definition.
") SetTile;
		void SetTile(const Graphic3d_CameraTile & theTile);

		/****** Graphic3d_Camera::SetUp ******/
		/****** md5 signature: 0db426f44d387a8cf5f78ad20e6deab6 ******/
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "
Parameters
----------
theUp: gp_Dir

Return
-------
None

Description
-----------
Sets camera Up direction vector, orthogonal to camera direction. WARNING! This method does NOT verify that the new Up vector is orthogonal to the current Direction(). 
Input parameter: theUp the Up direction vector. 
See also: OrthogonalizeUp().
") SetUp;
		void SetUp(const gp_Dir & theUp);

		/****** Graphic3d_Camera::SetZFocus ******/
		/****** md5 signature: f6713eb020accfa714ac3c1646e53932 ******/
		%feature("compactdefaultargs") SetZFocus;
		%feature("autodoc", "
Parameters
----------
theType: FocusType
theZFocus: double

Return
-------
None

Description
-----------
Sets stereographic focus distance. 
Input parameter: theType the focus definition type. Focus can be defined as absolute value or relatively to (as coefficient of) coefficient of camera focal length. 
Input parameter: theZFocus the focus absolute value or coefficient depending on the passed definition type.
") SetZFocus;
		void SetZFocus(FocusType theType, const double theZFocus);

		/****** Graphic3d_Camera::SetZRange ******/
		/****** md5 signature: 658e210c463547867e1508ebd0b80b52 ******/
		%feature("compactdefaultargs") SetZRange;
		%feature("autodoc", "
Parameters
----------
theZNear: double
theZFar: double

Return
-------
None

Description
-----------
Change the Near and Far Z-clipping plane positions. For orthographic projection, theZNear, theZFar can be negative or positive. For perspective projection, only positive values are allowed. Program error exception is raised if non-positive values are specified for perspective projection or theZNear >= theZFar. 
Input parameter: theZNear the distance of the plane from the Eye. 
Input parameter: theZFar the distance of the plane from the Eye.
") SetZRange;
		void SetZRange(const double theZNear, const double theZFar);

		/****** Graphic3d_Camera::SetZeroToOneDepth ******/
		/****** md5 signature: e42a6ba38b9c613db8b43769e125959a ******/
		%feature("compactdefaultargs") SetZeroToOneDepth;
		%feature("autodoc", "
Parameters
----------
theIsZeroToOne: bool

Return
-------
None

Description
-----------
Set using [0, 1] depth range or [-1, 1] range.
") SetZeroToOneDepth;
		void SetZeroToOneDepth(bool theIsZeroToOne);

		/****** Graphic3d_Camera::SideRight ******/
		/****** md5 signature: 376ce920b40e8da4926fcbcf98d049aa ******/
		%feature("compactdefaultargs") SideRight;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Right side direction.
") SideRight;
		gp_Dir SideRight();

		/****** Graphic3d_Camera::StereoProjection ******/
		/****** md5 signature: e6681a2e82b2b17aef7c0f4357bf4543 ******/
		%feature("compactdefaultargs") StereoProjection;
		%feature("autodoc", "
Parameters
----------
theProjL: NCollection_Mat4<double>
theHeadToEyeL: NCollection_Mat4<double>
theProjR: NCollection_Mat4<double>
theHeadToEyeR: NCollection_Mat4<double>

Return
-------
None

Description
-----------
Get stereo projection matrices. @param[out] theProjL left eye projection matrix @param[out] theHeadToEyeL left head to eye translation matrix @param[out] theProjR right eye projection matrix @param[out] theHeadToEyeR right head to eye translation matrix.
") StereoProjection;
		void StereoProjection(NCollection_Mat4<double> & theProjL, NCollection_Mat4<double> & theHeadToEyeL, NCollection_Mat4<double> & theProjR, NCollection_Mat4<double> & theHeadToEyeR);

		/****** Graphic3d_Camera::StereoProjectionF ******/
		/****** md5 signature: cba2ddec5ad4377e14844baa9b3500ea ******/
		%feature("compactdefaultargs") StereoProjectionF;
		%feature("autodoc", "
Parameters
----------
theProjL: NCollection_Mat4<float>
theHeadToEyeL: NCollection_Mat4<float>
theProjR: NCollection_Mat4<float>
theHeadToEyeR: NCollection_Mat4<float>

Return
-------
None

Description
-----------
Get stereo projection matrices. @param[out] theProjL left eye projection matrix @param[out] theHeadToEyeL left head to eye translation matrix @param[out] theProjR right eye projection matrix @param[out] theHeadToEyeR right head to eye translation matrix.
") StereoProjectionF;
		void StereoProjectionF(NCollection_Mat4<float> & theProjL, NCollection_Mat4<float> & theHeadToEyeL, NCollection_Mat4<float> & theProjR, NCollection_Mat4<float> & theHeadToEyeR);

		/****** Graphic3d_Camera::Tile ******/
		/****** md5 signature: 0a39fc9b82eb1069228eaa7fbe821f43 ******/
		%feature("compactdefaultargs") Tile;
		%feature("autodoc", "Return
-------
Graphic3d_CameraTile

Description
-----------
Get current tile.
") Tile;
		const Graphic3d_CameraTile & Tile();

		/****** Graphic3d_Camera::Transform ******/
		/****** md5 signature: b1d3d70da15a244a49acf6a481c2ab71 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theTrsf);

		/****** Graphic3d_Camera::UnProject ******/
		/****** md5 signature: 4a3a5e034749d6ce0dd134e64f4b1f61 ******/
		%feature("compactdefaultargs") UnProject;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Unproject point from normalized device coordinates to world coordinate space. 
Input parameter: thePnt the NDC point. 
Return: 3D point in WCS.
") UnProject;
		gp_Pnt UnProject(const gp_Pnt & thePnt);

		/****** Graphic3d_Camera::Up ******/
		/****** md5 signature: 41ad6369dbf47f223fab4663017e77bb ******/
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Get camera Up direction vector. 
Return: Camera's Up direction vector.
") Up;
		const gp_Dir Up();

		/****** Graphic3d_Camera::ViewDimensions ******/
		/****** md5 signature: 661ee1816a495608297e7b53f28eb6a6 ******/
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Calculate view plane size at center (target) point and distance between ZFar and ZNear planes. 
Return: values in form of gp_Pnt (Width, Height, Depth).
") ViewDimensions;
		gp_XYZ ViewDimensions();

		/****** Graphic3d_Camera::ViewDimensions ******/
		/****** md5 signature: bba6e33eb06ae8beaffff7b1d8bfbe14 ******/
		%feature("compactdefaultargs") ViewDimensions;
		%feature("autodoc", "
Parameters
----------
theZValue: double

Return
-------
gp_XYZ

Description
-----------
Calculate view plane size at center point with specified Z offset and distance between ZFar and ZNear planes. 
Input parameter: theZValue the distance from the eye in eye-to-center direction 
Return: values in form of gp_Pnt (Width, Height, Depth).
") ViewDimensions;
		gp_XYZ ViewDimensions(const double theZValue);

		/****** Graphic3d_Camera::WorldViewProjState ******/
		/****** md5 signature: 84fd216afc4c582ff7d76c1c302180f8 ******/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "Return
-------
Graphic3d_WorldViewProjState

Description
-----------
No available documentation.
") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState();

		/****** Graphic3d_Camera::WorldViewState ******/
		/****** md5 signature: cc1333ce6e6af438a74585178a5f45b5 ******/
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns modification state of camera world view transformation matrix.
") WorldViewState;
		size_t WorldViewState();

		/****** Graphic3d_Camera::ZFar ******/
		/****** md5 signature: 2eb46abc789924aefd6549887b0d0f25 ******/
		%feature("compactdefaultargs") ZFar;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get the Far Z-clipping plane position. 
Return: the distance of the plane from the Eye.
") ZFar;
		double ZFar();

		/****** Graphic3d_Camera::ZFitAll ******/
		/****** md5 signature: bd59b155f85326177363c3a33d37c999 ******/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: double
theMinMax: Bnd_Box
theGraphicBB: Bnd_Box

Return
-------
theZNear: double
theZFar: double

Description
-----------
Estimate Z-min and Z-max planes of projection volume to match the displayed objects. The methods ensures that view volume will be close by depth range to the displayed objects. Fitting assumes that for orthogonal projection the view volume contains the displayed objects completely. For zoomed perspective view, the view volume is adjusted such that it contains the objects or their parts, located in front of the camera. 
Input parameter: theScaleFactor the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed. 
Input parameter: theMinMax applicative min max boundaries. 
Input parameter: theGraphicBB real graphical boundaries (not accounting infinite flag).
") ZFitAll;
		bool ZFitAll(const double theScaleFactor, const Bnd_Box & theMinMax, const Bnd_Box & theGraphicBB, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_Camera::ZFitAll ******/
		/****** md5 signature: aaa8b644124cdd33dc204972850d1ab6 ******/
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: double
theMinMax: Bnd_Box
theGraphicBB: Bnd_Box

Return
-------
None

Description
-----------
Change Z-min and Z-max planes of projection volume to match the displayed objects.
") ZFitAll;
		void ZFitAll(const double theScaleFactor, const Bnd_Box & theMinMax, const Bnd_Box & theGraphicBB);

		/****** Graphic3d_Camera::ZFocus ******/
		/****** md5 signature: a2906ae7d624deb500d284af5dc12c7a ******/
		%feature("compactdefaultargs") ZFocus;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get stereographic focus value. 
Return: absolute or relative stereographic focus value depending on its definition type.
") ZFocus;
		double ZFocus();

		/****** Graphic3d_Camera::ZFocusType ******/
		/****** md5 signature: d91de11345e7927a542a3d871a961945 ******/
		%feature("compactdefaultargs") ZFocusType;
		%feature("autodoc", "Return
-------
Graphic3d_Camera::FocusType

Description
-----------
Get stereographic focus definition type. 
Return: definition type used for stereographic focus.
") ZFocusType;
		Graphic3d_Camera::FocusType ZFocusType();

		/****** Graphic3d_Camera::ZNear ******/
		/****** md5 signature: 212ce4074e9460b3287abebc944ae9f2 ******/
		%feature("compactdefaultargs") ZNear;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get the Near Z-clipping plane position. 
Return: the distance of the plane from the Eye.
") ZNear;
		double ZNear();

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
		bool IsTopDown;
		/****** Graphic3d_CameraTile::Graphic3d_CameraTile ******/
		/****** md5 signature: a7ff85bc9b9a5b07dcd347f9ff8a974a ******/
		%feature("compactdefaultargs") Graphic3d_CameraTile;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Initializes the empty Tile of zero size and lower-left offset orientation. Such Tile is considered uninitialized (invalid).
") Graphic3d_CameraTile;
		 Graphic3d_CameraTile();

		/****** Graphic3d_CameraTile::Cropped ******/
		/****** md5 signature: a5617e2e92bfe0db3d15d224e16314ae ******/
		%feature("compactdefaultargs") Cropped;
		%feature("autodoc", "Return
-------
Graphic3d_CameraTile

Description
-----------
Return the copy cropped by total size.
") Cropped;
		Graphic3d_CameraTile Cropped();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_CameraTile::IsValid ******/
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if Tile has been defined.
") IsValid;
		bool IsValid();

		/****** Graphic3d_CameraTile::OffsetLowerLeft ******/
		/****** md5 signature: 2f2e99acf3c1007899533eb8009a5bc5 ******/
		%feature("compactdefaultargs") OffsetLowerLeft;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Return offset position from lower-left corner.
") OffsetLowerLeft;
		NCollection_Vec2<int > OffsetLowerLeft();


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
typedef NCollection_Vec4<double> Equation;
		/****** Graphic3d_ClipPlane::Graphic3d_ClipPlane ******/
		/****** md5 signature: 3b2ca438d53477ffa620c2e2afb936dd ******/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Initializes clip plane container with the following properties: - Equation (0.0, 0.0, 1.0, 0) - IsOn (True), - IsCapping (False), - Material (Graphic3d_NameOfMaterial_DEFAULT), - Texture (NULL), - HatchStyle (Aspect_HS_HORIZONTAL), - IsHatchOn (False).
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane();

		/****** Graphic3d_ClipPlane::Graphic3d_ClipPlane ******/
		/****** md5 signature: 0062f35ffc7c667c1c200b3134c67513 ******/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_ClipPlane

Return
-------
None

Description
-----------
Copy constructor. 
Input parameter: theOther the copied plane.
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane(const Graphic3d_ClipPlane & theOther);

		/****** Graphic3d_ClipPlane::Graphic3d_ClipPlane ******/
		/****** md5 signature: 95f6c3da38a65ef99b25c84c73b6cbdd ******/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "
Parameters
----------
theEquation: NCollection_Vec4<double>

Return
-------
None

Description
-----------
Construct clip plane for the passed equation. By default the plane is on, capping is turned off. 
Input parameter: theEquation the plane equation.
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane(const NCollection_Vec4<double> & theEquation);

		/****** Graphic3d_ClipPlane::Graphic3d_ClipPlane ******/
		/****** md5 signature: ce150c029c2679d13f4817496ec71dce ******/
		%feature("compactdefaultargs") Graphic3d_ClipPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln

Return
-------
None

Description
-----------
Construct clip plane from the passed geometrical definition. By default the plane is on, capping is turned off. 
Input parameter: thePlane the plane.
") Graphic3d_ClipPlane;
		 Graphic3d_ClipPlane(const gp_Pln & thePlane);

		/****** Graphic3d_ClipPlane::CappingAspect ******/
		/****** md5 signature: 089018478933d1873fb8c8f77f715460 ******/
		%feature("compactdefaultargs") CappingAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_AspectFillArea3d>

Description
-----------
Return capping aspect. 
Return: capping surface rendering aspect.
") CappingAspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & CappingAspect();

		/****** Graphic3d_ClipPlane::CappingColor ******/
		/****** md5 signature: 33f268077fa3eff9a8efe1dfdb8ff254 ******/
		%feature("compactdefaultargs") CappingColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return color for rendering capping surface.
") CappingColor;
		Quantity_Color CappingColor();

		/****** Graphic3d_ClipPlane::CappingCustomHatch ******/
		/****** md5 signature: 532100c1eaf8f2f7678ae86555b0dbce ******/
		%feature("compactdefaultargs") CappingCustomHatch;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_HatchStyle>

Description
-----------
Return: hatching style.
") CappingCustomHatch;
		const opencascade::handle<Graphic3d_HatchStyle> & CappingCustomHatch();

		/****** Graphic3d_ClipPlane::CappingHatch ******/
		/****** md5 signature: fae6085bab7c0cb9f8a29bfa1408219e ******/
		%feature("compactdefaultargs") CappingHatch;
		%feature("autodoc", "Return
-------
Aspect_HatchStyle

Description
-----------
Return: hatching style.
") CappingHatch;
		Aspect_HatchStyle CappingHatch();

		/****** Graphic3d_ClipPlane::CappingMaterial ******/
		/****** md5 signature: ec7378d4d0978973feaf4727f2ab39ab ******/
		%feature("compactdefaultargs") CappingMaterial;
		%feature("autodoc", "Return
-------
Graphic3d_MaterialAspect

Description
-----------
Return: capping material.
") CappingMaterial;
		const Graphic3d_MaterialAspect & CappingMaterial();

		/****** Graphic3d_ClipPlane::CappingTexture ******/
		/****** md5 signature: c85811b236f28b12f8dac89a1840ec99 ******/
		%feature("compactdefaultargs") CappingTexture;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TextureMap>

Description
-----------
Return: capping texture map.
") CappingTexture;
		opencascade::handle<Graphic3d_TextureMap> CappingTexture();

		/****** Graphic3d_ClipPlane::ChainNextPlane ******/
		/****** md5 signature: 590a5956e7c7383ad373846e3c900c1a ******/
		%feature("compactdefaultargs") ChainNextPlane;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ClipPlane>

Description
-----------
No available documentation.
") ChainNextPlane;
		const opencascade::handle<Graphic3d_ClipPlane> & ChainNextPlane();

		/****** Graphic3d_ClipPlane::ChainPreviousPlane ******/
		/****** md5 signature: 56fcbd3157911ddbf4ff1e520118af54 ******/
		%feature("compactdefaultargs") ChainPreviousPlane;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ClipPlane>

Description
-----------
Return the previous plane in a Chain of Planes defining logical AND operation, or NULL if there is no Chain or it is a first element in Chain. When clipping is defined by a Chain of Planes, it cuts a space only in case if check fails for all Planes in Chain.
") ChainPreviousPlane;
		opencascade::handle<Graphic3d_ClipPlane> ChainPreviousPlane();

		/****** Graphic3d_ClipPlane::Clone ******/
		/****** md5 signature: ee5ee1ed8f05ee0371050d9c2ee0b36e ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ClipPlane>

Description
-----------
Clone plane. Virtual method to simplify copying procedure if plane class is redefined at application level to add specific fields to it e.g. id, name, etc. 
Return: new instance of clipping plane with same properties and attributes.
") Clone;
		virtual opencascade::handle<Graphic3d_ClipPlane> Clone();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_ClipPlane::GetEquation ******/
		/****** md5 signature: dcbb1ba5e6415e8c1983d31253e132ea ******/
		%feature("compactdefaultargs") GetEquation;
		%feature("autodoc", "Return
-------
NCollection_Vec4<double>

Description
-----------
Get 4-component equation vector for clipping plane. 
Return: clipping plane equation vector.
") GetEquation;
		const NCollection_Vec4<double> & GetEquation();

		/****** Graphic3d_ClipPlane::GetId ******/
		/****** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ******/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
This ID is used for managing associated resources in graphical driver. The clip plane can be assigned within a range of IO which can be displayed in separate OpenGl contexts. For each of the context an associated OpenGl resource for graphical aspects should be created and kept. The resources are stored in graphical driver for each of individual groups of shared context under the clip plane identifier. 
Return: clip plane resource identifier string.
") GetId;
		const TCollection_AsciiString & GetId();

		/****** Graphic3d_ClipPlane::IsBoxFullInHalfspace ******/
		/****** md5 signature: a0b159cba8922ee1b65ffbd9144c8d82 ******/
		%feature("compactdefaultargs") IsBoxFullInHalfspace;
		%feature("autodoc", "
Parameters
----------
theBox: Graphic3d_BndBox3d

Return
-------
bool

Description
-----------
Check if the given bounding box is fully inside (or touches from inside) the half-space (e.g. NOT discarded by clipping plane).
") IsBoxFullInHalfspace;
		bool IsBoxFullInHalfspace(const Graphic3d_BndBox3d & theBox);

		/****** Graphic3d_ClipPlane::IsBoxFullOutHalfspace ******/
		/****** md5 signature: 31a9362d0ef14fb2257bdbe2be1a2f5b ******/
		%feature("compactdefaultargs") IsBoxFullOutHalfspace;
		%feature("autodoc", "
Parameters
----------
theBox: Graphic3d_BndBox3d

Return
-------
bool

Description
-----------
Check if the given bounding box is fully outside of the half-space (e.g. should be discarded by clipping plane).
") IsBoxFullOutHalfspace;
		bool IsBoxFullOutHalfspace(const Graphic3d_BndBox3d & theBox);

		/****** Graphic3d_ClipPlane::IsCapping ******/
		/****** md5 signature: ecda60c315227d4299ee5e65dd42e11d ******/
		%feature("compactdefaultargs") IsCapping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check state of capping surface rendering. 
Return: true (turned on) or false depending on the state.
") IsCapping;
		bool IsCapping();

		/****** Graphic3d_ClipPlane::IsChain ******/
		/****** md5 signature: 5126ec51632e0e31c8cd2cbbfa5fdd46 ******/
		%feature("compactdefaultargs") IsChain;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if this item defines a conjunction (logical AND) between a set of Planes. Graphic3d_ClipPlane item defines either a Clipping halfspace (single Clipping Plane) or a Clipping volume defined by a logical AND (conjunction) operation between a set of Planes defined as a Chain (so that the volume cuts a space only in case if check fails for ALL Planes in the Chain). //! Note that Graphic3d_ClipPlane item cannot: - Define a Chain with logical OR (disjunction) operation; this should be done through Graphic3d_SequenceOfHClipPlane. - Define nested Chains. - Disable Chain items; only entire Chain can be disabled (by disabled a head of Chain). //! The head of a Chain defines all visual properties of the Chain, so that Graphic3d_ClipPlane of next items in a Chain merely defines only geometrical definition of the plane.
") IsChain;
		bool IsChain();

		/****** Graphic3d_ClipPlane::IsHatchOn ******/
		/****** md5 signature: ff2de3e19b89317e58003b99f7fc6d32 ******/
		%feature("compactdefaultargs") IsHatchOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True if hatching mask is turned on.
") IsHatchOn;
		bool IsHatchOn();

		/****** Graphic3d_ClipPlane::IsOn ******/
		/****** md5 signature: c8ef13b47538ba7c6f2a946cb12081a5 ******/
		%feature("compactdefaultargs") IsOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check that the clipping plane is turned on. 
Return: boolean flag indicating whether the plane is in on or off state.
") IsOn;
		bool IsOn();

		/****** Graphic3d_ClipPlane::IsPointOutHalfspace ******/
		/****** md5 signature: 17517324ad08a3c08745cc06c0659cdd ******/
		%feature("compactdefaultargs") IsPointOutHalfspace;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec4<double>

Return
-------
bool

Description
-----------
Check if the given point is outside of the half-space (e.g. should be discarded by clipping plane).
") IsPointOutHalfspace;
		bool IsPointOutHalfspace(const NCollection_Vec4<double> & thePoint);

		/****** Graphic3d_ClipPlane::MCountAspect ******/
		/****** md5 signature: 8830fdfa4d09c90a999edeb3eb87701e ******/
		%feature("compactdefaultargs") MCountAspect;
		%feature("autodoc", "Return
-------
unsigned int

Description
-----------
Return: modification counter for aspect.
") MCountAspect;
		unsigned int MCountAspect();

		/****** Graphic3d_ClipPlane::MCountEquation ******/
		/****** md5 signature: 5832a40d63cc226fe20b6b671be705a3 ******/
		%feature("compactdefaultargs") MCountEquation;
		%feature("autodoc", "Return
-------
unsigned int

Description
-----------
Return: modification counter for equation.
") MCountEquation;
		unsigned int MCountEquation();

		/****** Graphic3d_ClipPlane::NbChainNextPlanes ******/
		/****** md5 signature: 4f400077c2006065a2af5722023fe511 ******/
		%feature("compactdefaultargs") NbChainNextPlanes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of chains in forward direction (including this item, so it is always >= 1). For a head of Chain - returns the length of entire Chain.
") NbChainNextPlanes;
		int NbChainNextPlanes();

		/****** Graphic3d_ClipPlane::ProbeBox ******/
		/****** md5 signature: 5f3d2825cbe32814ce21e29efaeda1a2 ******/
		%feature("compactdefaultargs") ProbeBox;
		%feature("autodoc", "
Parameters
----------
theBox: Graphic3d_BndBox3d

Return
-------
Graphic3d_ClipState

Description
-----------
Check if the given bounding box is fully outside / fully inside.
") ProbeBox;
		Graphic3d_ClipState ProbeBox(const Graphic3d_BndBox3d & theBox);

		/****** Graphic3d_ClipPlane::ProbeBoxHalfspace ******/
		/****** md5 signature: 464d13bf3a5e166ddc73317866dccf1c ******/
		%feature("compactdefaultargs") ProbeBoxHalfspace;
		%feature("autodoc", "
Parameters
----------
theBox: Graphic3d_BndBox3d

Return
-------
Graphic3d_ClipState

Description
-----------
Check if the given bounding box is fully outside / fully inside the half-space.
") ProbeBoxHalfspace;
		Graphic3d_ClipState ProbeBoxHalfspace(const Graphic3d_BndBox3d & theBox);

		/****** Graphic3d_ClipPlane::ProbeBoxMaxPointHalfspace ******/
		/****** md5 signature: 812d9878fe277ef39844dc7ca7f3512f ******/
		%feature("compactdefaultargs") ProbeBoxMaxPointHalfspace;
		%feature("autodoc", "
Parameters
----------
theBox: Graphic3d_BndBox3d

Return
-------
Graphic3d_ClipState

Description
-----------
Check if the given bounding box is fully outside of the half-space (e.g. should be discarded by clipping plane).
") ProbeBoxMaxPointHalfspace;
		Graphic3d_ClipState ProbeBoxMaxPointHalfspace(const Graphic3d_BndBox3d & theBox);

		/****** Graphic3d_ClipPlane::ProbeBoxTouch ******/
		/****** md5 signature: 5fae0d5a3a961f678f1522cb67996377 ******/
		%feature("compactdefaultargs") ProbeBoxTouch;
		%feature("autodoc", "
Parameters
----------
theBox: Graphic3d_BndBox3d

Return
-------
bool

Description
-----------
Check if the given bounding box is In and touch the clipping planes.
") ProbeBoxTouch;
		bool ProbeBoxTouch(const Graphic3d_BndBox3d & theBox);

		/****** Graphic3d_ClipPlane::ProbePoint ******/
		/****** md5 signature: 7e17d67dbe2003c3b3c66fe371fc64fa ******/
		%feature("compactdefaultargs") ProbePoint;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec4<double>

Return
-------
Graphic3d_ClipState

Description
-----------
Check if the given point is outside / inside / on section.
") ProbePoint;
		Graphic3d_ClipState ProbePoint(const NCollection_Vec4<double> & thePoint);

		/****** Graphic3d_ClipPlane::ProbePointHalfspace ******/
		/****** md5 signature: 0a9e6d58eda9b2a4673f587f918d697c ******/
		%feature("compactdefaultargs") ProbePointHalfspace;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec4<double>

Return
-------
Graphic3d_ClipState

Description
-----------
Check if the given point is outside of the half-space (e.g. should be discarded by clipping plane).
") ProbePointHalfspace;
		Graphic3d_ClipState ProbePointHalfspace(const NCollection_Vec4<double> & thePoint);

		/****** Graphic3d_ClipPlane::ReversedEquation ******/
		/****** md5 signature: f7013c15394d7037e547ba5a0bc639e0 ******/
		%feature("compactdefaultargs") ReversedEquation;
		%feature("autodoc", "Return
-------
NCollection_Vec4<double>

Description
-----------
Get 4-component equation vector for clipping plane. 
Return: clipping plane equation vector.
") ReversedEquation;
		const NCollection_Vec4<double> & ReversedEquation();

		/****** Graphic3d_ClipPlane::SetCapping ******/
		/****** md5 signature: b12794ea493b2a8dfc6f19470b357828 ******/
		%feature("compactdefaultargs") SetCapping;
		%feature("autodoc", "
Parameters
----------
theIsOn: bool

Return
-------
None

Description
-----------
Change state of capping surface rendering. 
Input parameter: theIsOn the flag specifying whether the graphic driver should perform rendering of capping surface produced by this plane. The graphic driver produces this surface for convex graphics by means of stencil-test and multi-pass rendering.
") SetCapping;
		void SetCapping(const bool theIsOn);

		/****** Graphic3d_ClipPlane::SetCappingAspect ******/
		/****** md5 signature: 05e5452fa2f16c42f53e07e167e0c74c ******/
		%feature("compactdefaultargs") SetCappingAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Return
-------
None

Description
-----------
Assign capping aspect.
") SetCappingAspect;
		void SetCappingAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****** Graphic3d_ClipPlane::SetCappingColor ******/
		/****** md5 signature: 10386b0387534dee2103d52514974548 ******/
		%feature("compactdefaultargs") SetCappingColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Set color for rendering capping surface.
") SetCappingColor;
		void SetCappingColor(const Quantity_Color & theColor);

		/****** Graphic3d_ClipPlane::SetCappingCustomHatch ******/
		/****** md5 signature: ecfc6c86b835ff55c032e0a8aac2b943 ******/
		%feature("compactdefaultargs") SetCappingCustomHatch;
		%feature("autodoc", "
Parameters
----------
theStyle: Graphic3d_HatchStyle

Return
-------
None

Description
-----------
Set custom hatch style (stipple) and turn hatching on. 
Input parameter: theStyle the hatch pattern.
") SetCappingCustomHatch;
		void SetCappingCustomHatch(const opencascade::handle<Graphic3d_HatchStyle> & theStyle);

		/****** Graphic3d_ClipPlane::SetCappingHatch ******/
		/****** md5 signature: a50e75b7fcb29f11c28ec851617bdfed ******/
		%feature("compactdefaultargs") SetCappingHatch;
		%feature("autodoc", "
Parameters
----------
theStyle: Aspect_HatchStyle

Return
-------
None

Description
-----------
Set hatch style (stipple) and turn hatching on. 
Input parameter: theStyle the hatch style.
") SetCappingHatch;
		void SetCappingHatch(const Aspect_HatchStyle theStyle);

		/****** Graphic3d_ClipPlane::SetCappingHatchOff ******/
		/****** md5 signature: f2dd155c48ac58bb23b0a9c116a086ef ******/
		%feature("compactdefaultargs") SetCappingHatchOff;
		%feature("autodoc", "Return
-------
None

Description
-----------
Turn off hatching.
") SetCappingHatchOff;
		void SetCappingHatchOff();

		/****** Graphic3d_ClipPlane::SetCappingHatchOn ******/
		/****** md5 signature: e5893da8bdba3236c35ccb5c4adce968 ******/
		%feature("compactdefaultargs") SetCappingHatchOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Turn on hatching.
") SetCappingHatchOn;
		void SetCappingHatchOn();

		/****** Graphic3d_ClipPlane::SetCappingMaterial ******/
		/****** md5 signature: b5325c1f11df13050b1636f8016bf728 ******/
		%feature("compactdefaultargs") SetCappingMaterial;
		%feature("autodoc", "
Parameters
----------
theMat: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Set material for rendering capping surface. 
Input parameter: theMat the material.
") SetCappingMaterial;
		void SetCappingMaterial(const Graphic3d_MaterialAspect & theMat);

		/****** Graphic3d_ClipPlane::SetCappingTexture ******/
		/****** md5 signature: 35e14b782b0f235bd0b0178b374ee4ed ******/
		%feature("compactdefaultargs") SetCappingTexture;
		%feature("autodoc", "
Parameters
----------
theTexture: Graphic3d_TextureMap

Return
-------
None

Description
-----------
Set texture to be applied on capping surface. 
Input parameter: theTexture the texture.
") SetCappingTexture;
		void SetCappingTexture(const opencascade::handle<Graphic3d_TextureMap> & theTexture);

		/****** Graphic3d_ClipPlane::SetChainNextPlane ******/
		/****** md5 signature: ee3b0bf19a25924a1f50d8bbe82b3864 ******/
		%feature("compactdefaultargs") SetChainNextPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: Graphic3d_ClipPlane

Return
-------
None

Description
-----------
Set the next plane in a Chain of Planes. This operation also updates relationship between chains (Previous/Next items), so that the previously set Next plane is cut off.
") SetChainNextPlane;
		void SetChainNextPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****** Graphic3d_ClipPlane::SetEquation ******/
		/****** md5 signature: 98d9ebe26ccc7ae757c1c0c2fbd0deac ******/
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln

Return
-------
None

Description
-----------
Set plane equation by its geometrical definition. The equation is specified in 'world' coordinate system. 
Input parameter: thePlane the plane.
") SetEquation;
		void SetEquation(const gp_Pln & thePlane);

		/****** Graphic3d_ClipPlane::SetEquation ******/
		/****** md5 signature: 489dcd9619349c90e8c8afcfffe24b07 ******/
		%feature("compactdefaultargs") SetEquation;
		%feature("autodoc", "
Parameters
----------
theEquation: NCollection_Vec4<double>

Return
-------
None

Description
-----------
Set 4-component equation vector for clipping plane. The equation is specified in 'world' coordinate system. 
Input parameter: theEquation the XYZW (or 'ABCD') equation vector.
") SetEquation;
		void SetEquation(const NCollection_Vec4<double> & theEquation);

		/****** Graphic3d_ClipPlane::SetOn ******/
		/****** md5 signature: 3b8dba417d4945a55cd7b97b62dd941d ******/
		%feature("compactdefaultargs") SetOn;
		%feature("autodoc", "
Parameters
----------
theIsOn: bool

Return
-------
None

Description
-----------
Change state of the clipping plane. 
Input parameter: theIsOn the flag specifying whether the graphic driver clipping by this plane should be turned on or off.
") SetOn;
		void SetOn(const bool theIsOn);

		/****** Graphic3d_ClipPlane::SetUseObjectMaterial ******/
		/****** md5 signature: e51a3e4f157cf6f18a41a74204f89d3c ******/
		%feature("compactdefaultargs") SetUseObjectMaterial;
		%feature("autodoc", "
Parameters
----------
theToUse: bool

Return
-------
None

Description
-----------
Set flag for controlling the source of capping plane material.
") SetUseObjectMaterial;
		void SetUseObjectMaterial(bool theToUse);

		/****** Graphic3d_ClipPlane::SetUseObjectShader ******/
		/****** md5 signature: 08936a5622e7e6c690bcd0fdc6728577 ******/
		%feature("compactdefaultargs") SetUseObjectShader;
		%feature("autodoc", "
Parameters
----------
theToUse: bool

Return
-------
None

Description
-----------
Set flag for controlling the source of capping plane shader program.
") SetUseObjectShader;
		void SetUseObjectShader(bool theToUse);

		/****** Graphic3d_ClipPlane::SetUseObjectTexture ******/
		/****** md5 signature: a821504e886ab26fbcd6787ec057f6d3 ******/
		%feature("compactdefaultargs") SetUseObjectTexture;
		%feature("autodoc", "
Parameters
----------
theToUse: bool

Return
-------
None

Description
-----------
Set flag for controlling the source of capping plane texture.
") SetUseObjectTexture;
		void SetUseObjectTexture(bool theToUse);

		/****** Graphic3d_ClipPlane::ToPlane ******/
		/****** md5 signature: ced66f82ed6e4053653d7c0e8408465b ******/
		%feature("compactdefaultargs") ToPlane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
Get geometrical definition. 
Return: geometrical definition of clipping plane.
") ToPlane;
		const gp_Pln ToPlane();

		/****** Graphic3d_ClipPlane::ToUseObjectMaterial ******/
		/****** md5 signature: 7deeaffbde57fcf043e1072b354f79d2 ******/
		%feature("compactdefaultargs") ToUseObjectMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Flag indicating whether material for capping plane should be taken from object. Default value: False (use dedicated capping plane material).
") ToUseObjectMaterial;
		bool ToUseObjectMaterial();

		/****** Graphic3d_ClipPlane::ToUseObjectProperties ******/
		/****** md5 signature: b739e66c383bfb4362cc7ca9e1937819 ******/
		%feature("compactdefaultargs") ToUseObjectProperties;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if some fill area aspect properties should be taken from object.
") ToUseObjectProperties;
		bool ToUseObjectProperties();

		/****** Graphic3d_ClipPlane::ToUseObjectShader ******/
		/****** md5 signature: c8a22f1ea268d72862ff604db660d838 ******/
		%feature("compactdefaultargs") ToUseObjectShader;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Flag indicating whether shader program for capping plane should be taken from object. Default value: False.
") ToUseObjectShader;
		bool ToUseObjectShader();

		/****** Graphic3d_ClipPlane::ToUseObjectTexture ******/
		/****** md5 signature: 36cf8eff8e41cb2efc2bfc6ef994b489 ******/
		%feature("compactdefaultargs") ToUseObjectTexture;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Flag indicating whether texture for capping plane should be taken from object. Default value: False.
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
		/****** Graphic3d_CullingTool::Graphic3d_CullingTool ******/
		/****** md5 signature: 5f02547bbbbc6c5cc18b9c6bb32866ba ******/
		%feature("compactdefaultargs") Graphic3d_CullingTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty selector object with parallel projection type by default.
") Graphic3d_CullingTool;
		 Graphic3d_CullingTool();

		/****** Graphic3d_CullingTool::CacheClipPtsProjections ******/
		/****** md5 signature: c6a5b8ea56ba980df85f6ba6c94374cb ******/
		%feature("compactdefaultargs") CacheClipPtsProjections;
		%feature("autodoc", "Return
-------
None

Description
-----------
Caches view volume's vertices projections along its normals and AABBs dimensions. Must be called at the beginning of each BVH tree traverse loop.
") CacheClipPtsProjections;
		void CacheClipPtsProjections();

		/****** Graphic3d_CullingTool::Camera ******/
		/****** md5 signature: 9722357b74290d4bf6f13f9113469012 ******/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Return the camera definition.
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****** Graphic3d_CullingTool::CameraDirection ******/
		/****** md5 signature: 188e27abd2862aff1688f6403c04368c ******/
		%feature("compactdefaultargs") CameraDirection;
		%feature("autodoc", "Return
-------
NCollection_Vec3<double>

Description
-----------
Returns camera direction.
") CameraDirection;
		const NCollection_Vec3<double> & CameraDirection();

		/****** Graphic3d_CullingTool::CameraEye ******/
		/****** md5 signature: c4a03dbba4cdbd24f2bd36920eac0df0 ******/
		%feature("compactdefaultargs") CameraEye;
		%feature("autodoc", "Return
-------
NCollection_Vec3<double>

Description
-----------
Returns camera eye position.
") CameraEye;
		const NCollection_Vec3<double> & CameraEye();

		/****** Graphic3d_CullingTool::IsCulled ******/
		/****** md5 signature: e19bf8f85beeb1dcfc8da6df584ac1a7 ******/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "
Parameters
----------
theCtx: CullingContext
theMinPnt: NCollection_Vec3<double>
theMaxPnt: NCollection_Vec3<double>
theIsInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Checks whether given AABB should be entirely culled or not. 
Input parameter: theCtx culling properties 
Input parameter: theMinPnt maximum point of AABB 
Input parameter: theMaxPnt minimum point of AABB @param[out] theIsInside flag indicating if AABB is fully inside; initial value should be set to True 
Return: True if AABB is completely outside of view frustum or culled by size/distance; False in case of partial or complete overlap (use theIsInside to distinguish).
") IsCulled;
		bool IsCulled(CullingContext theCtx, const NCollection_Vec3<double> & theMinPnt, const NCollection_Vec3<double> & theMaxPnt, bool * theIsInside = nullptr);

		/****** Graphic3d_CullingTool::IsOutFrustum ******/
		/****** md5 signature: f5276194aa556ee33834fe81c8469944 ******/
		%feature("compactdefaultargs") IsOutFrustum;
		%feature("autodoc", "
Parameters
----------
theMinPnt: NCollection_Vec3<double>
theMaxPnt: NCollection_Vec3<double>
theIsInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Detects if AABB overlaps view volume using separating axis theorem (SAT). 
Input parameter: theMinPnt maximum point of AABB 
Input parameter: theMaxPnt minimum point of AABB @param[out] theIsInside flag indicating if AABB is fully inside; initial value should be set to True 
Return: True if AABB is completely outside of view frustum; False in case of partial or complete overlap (use theIsInside to distinguish) 
See also: SelectMgr_Frustum::hasOverlap().
") IsOutFrustum;
		bool IsOutFrustum(const NCollection_Vec3<double> & theMinPnt, const NCollection_Vec3<double> & theMaxPnt, bool * theIsInside = nullptr);

		/****** Graphic3d_CullingTool::IsTooDistant ******/
		/****** md5 signature: 3bbe8c5d2e90e1e3388468459aed1306 ******/
		%feature("compactdefaultargs") IsTooDistant;
		%feature("autodoc", "
Parameters
----------
theCtx: CullingContext
theMinPnt: NCollection_Vec3<double>
theMaxPnt: NCollection_Vec3<double>
theIsInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns True if given AABB should be discarded by distance culling criterion. 
Input parameter: theMinPnt maximum point of AABB 
Input parameter: theMaxPnt minimum point of AABB @param[out] theIsInside flag indicating if AABB is fully inside; initial value should be set to True 
Return: True if AABB is completely behind culling distance; False in case of partial or complete overlap (use theIsInside to distinguish).
") IsTooDistant;
		bool IsTooDistant(CullingContext theCtx, const NCollection_Vec3<double> & theMinPnt, const NCollection_Vec3<double> & theMaxPnt, bool * theIsInside = nullptr);

		/****** Graphic3d_CullingTool::IsTooSmall ******/
		/****** md5 signature: b9697d269fc9e313903b0cd60314cfc5 ******/
		%feature("compactdefaultargs") IsTooSmall;
		%feature("autodoc", "
Parameters
----------
theCtx: CullingContext
theMinPnt: NCollection_Vec3<double>
theMaxPnt: NCollection_Vec3<double>

Return
-------
bool

Description
-----------
Returns True if given AABB should be discarded by size culling criterion.
") IsTooSmall;
		bool IsTooSmall(CullingContext theCtx, const NCollection_Vec3<double> & theMinPnt, const NCollection_Vec3<double> & theMaxPnt);

		/****** Graphic3d_CullingTool::ProjectionMatrix ******/
		/****** md5 signature: c3ee9d28899747ee4a1a7ec1fc69c76f ******/
		%feature("compactdefaultargs") ProjectionMatrix;
		%feature("autodoc", "Return
-------
NCollection_Mat4<double>

Description
-----------
Returns current projection matrix.
") ProjectionMatrix;
		const NCollection_Mat4<double> & ProjectionMatrix();

		/****** Graphic3d_CullingTool::SetViewVolume ******/
		/****** md5 signature: 2cd9752cdf6b4702150b24575016a106 ******/
		%feature("compactdefaultargs") SetViewVolume;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera
theModelWorld: NCollection_Mat4<double> (optional, default to NCollection_Mat4<double>())

Return
-------
None

Description
-----------
Retrieves view volume's planes equations and its vertices from projection and world-view matrices. 
Input parameter: theCamera camera definition 
Input parameter: theModelWorld optional object transformation for computing frustum in object local coordinate system.
") SetViewVolume;
		void SetViewVolume(const opencascade::handle<Graphic3d_Camera> & theCamera, const NCollection_Mat4<double> & theModelWorld = NCollection_Mat4<double>());

		/****** Graphic3d_CullingTool::SetViewportSize ******/
		/****** md5 signature: 71a920077db63b4ed3ea765dea057a5f ******/
		%feature("compactdefaultargs") SetViewportSize;
		%feature("autodoc", "
Parameters
----------
theViewportWidth: int
theViewportHeight: int
theResolutionRatio: double

Return
-------
None

Description
-----------
No available documentation.
") SetViewportSize;
		void SetViewportSize(int theViewportWidth, int theViewportHeight, double theResolutionRatio);

		/****** Graphic3d_CullingTool::SignedPlanePointDistance ******/
		/****** md5 signature: 76f3ff77c551805ba861834926d771bf ******/
		%feature("compactdefaultargs") SignedPlanePointDistance;
		%feature("autodoc", "
Parameters
----------
theNormal: NCollection_Vec4<double>
thePnt: NCollection_Vec4<double>

Return
-------
double

Description
-----------
Calculates signed distance from plane to point. 
Input parameter: theNormal the plane's normal. 
Input parameter: thePnt.
") SignedPlanePointDistance;
		double SignedPlanePointDistance(const NCollection_Vec4<double> & theNormal, const NCollection_Vec4<double> & thePnt);

		/****** Graphic3d_CullingTool::ViewportHeight ******/
		/****** md5 signature: fe58a821406639ad2d959c191deda4a3 ******/
		%feature("compactdefaultargs") ViewportHeight;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ViewportHeight;
		int ViewportHeight();

		/****** Graphic3d_CullingTool::ViewportWidth ******/
		/****** md5 signature: 4b7179d21659f130db0a420e51bd3fb4 ******/
		%feature("compactdefaultargs") ViewportWidth;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ViewportWidth;
		int ViewportWidth();

		/****** Graphic3d_CullingTool::WorldViewMatrix ******/
		/****** md5 signature: e6534c4da3771de858be7e8f34818517 ******/
		%feature("compactdefaultargs") WorldViewMatrix;
		%feature("autodoc", "Return
-------
NCollection_Mat4<double>

Description
-----------
Returns current world view transformation matrix.
") WorldViewMatrix;
		const NCollection_Mat4<double> & WorldViewMatrix();

		/****** Graphic3d_CullingTool::WorldViewProjState ******/
		/****** md5 signature: 84fd216afc4c582ff7d76c1c302180f8 ******/
		%feature("compactdefaultargs") WorldViewProjState;
		%feature("autodoc", "Return
-------
Graphic3d_WorldViewProjState

Description
-----------
Returns state of current world view projection transformation matrices.
") WorldViewProjState;
		const Graphic3d_WorldViewProjState & WorldViewProjState();

};


%extend Graphic3d_CullingTool {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetCullingDistance(self):
		pass

	@methodnotwrapped
	def SetCullingSize(self):
		pass
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

/**************************
* class Graphic3d_Flipper *
**************************/
class Graphic3d_Flipper : public Standard_Transient {
	public:
		/****** Graphic3d_Flipper::Graphic3d_Flipper ******/
		/****** md5 signature: bf4dada889edfcf11d0a878dfaa6e490 ******/
		%feature("compactdefaultargs") Graphic3d_Flipper;
		%feature("autodoc", "
Parameters
----------
theRefPlane: gp_Ax2

Return
-------
None

Description
-----------
Constructor.
") Graphic3d_Flipper;
		 Graphic3d_Flipper(const gp_Ax2 & theRefPlane);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Flipper::RefPlane ******/
		/****** md5 signature: a18ac6bd460cf84914871288d7af3d4e ******/
		%feature("compactdefaultargs") RefPlane;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Return reference plane used for flipping.
") RefPlane;
		gp_Ax2 RefPlane();

		/****** Graphic3d_Flipper::SetRefPlane ******/
		/****** md5 signature: bf9a543bd2f56c32757e05b52f09bf8f ******/
		%feature("compactdefaultargs") SetRefPlane;
		%feature("autodoc", "
Parameters
----------
theValue: gp_Ax2

Return
-------
None

Description
-----------
Set reference plane used for flipping.
") SetRefPlane;
		void SetRefPlane(const gp_Ax2 & theValue);

};


%make_alias(Graphic3d_Flipper)

%extend Graphic3d_Flipper {
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
		/****** Graphic3d_FrameStats::ActiveDataFrame ******/
		/****** md5 signature: e89e1c4808bb7032e3058fd748c2ba1e ******/
		%feature("compactdefaultargs") ActiveDataFrame;
		%feature("autodoc", "Return
-------
Graphic3d_FrameStatsDataTmp

Description
-----------
Returns currently filling data frame for modification, should be called between ::FrameStart() and ::FrameEnd() calls.
") ActiveDataFrame;
		Graphic3d_FrameStatsDataTmp & ActiveDataFrame();

		/****** Graphic3d_FrameStats::ChangeCounter ******/
		/****** md5 signature: 40711ebe8426136f2cd93a687b44afac ******/
		%feature("compactdefaultargs") ChangeCounter;
		%feature("autodoc", "
Parameters
----------
theCounter: Graphic3d_FrameStatsCounter

Return
-------
size_t

Description
-----------
Returns value of specified counter for modification, should be called between ::FrameStart() and ::FrameEnd() calls.
") ChangeCounter;
		size_t & ChangeCounter(Graphic3d_FrameStatsCounter theCounter);

		/****** Graphic3d_FrameStats::ChangeDataFrames ******/
		/****** md5 signature: 9486d6288d46f6501e052e63e78363a5 ******/
		%feature("compactdefaultargs") ChangeDataFrames;
		%feature("autodoc", "Return
-------
NCollection_Array1<Graphic3d_FrameStatsData>

Description
-----------
Returns data frames.
") ChangeDataFrames;
		NCollection_Array1<Graphic3d_FrameStatsData> & ChangeDataFrames();

		/****** Graphic3d_FrameStats::ChangeTimer ******/
		/****** md5 signature: ca3e1067fb14ffd58d58ba0165f59273 ******/
		%feature("compactdefaultargs") ChangeTimer;
		%feature("autodoc", "
Parameters
----------
theTimer: Graphic3d_FrameStatsTimer

Return
-------
double

Description
-----------
Returns value of specified timer for modification, should be called between ::FrameStart() and ::FrameEnd() calls.
") ChangeTimer;
		double & ChangeTimer(Graphic3d_FrameStatsTimer theTimer);

		/****** Graphic3d_FrameStats::CounterValue ******/
		/****** md5 signature: 2953a2ad05b1d3c9bef5ed1407a61ee4 ******/
		%feature("compactdefaultargs") CounterValue;
		%feature("autodoc", "
Parameters
----------
theCounter: Graphic3d_FrameStatsCounter

Return
-------
size_t

Description
-----------
Returns value of specified counter, cached between stats updates. Should NOT be called between ::FrameStart() and ::FrameEnd() calls.
") CounterValue;
		size_t CounterValue(Graphic3d_FrameStatsCounter theCounter);

		/****** Graphic3d_FrameStats::DataFrames ******/
		/****** md5 signature: 00192e1420bc8aaf54d99dc695bc8868 ******/
		%feature("compactdefaultargs") DataFrames;
		%feature("autodoc", "Return
-------
NCollection_Array1<Graphic3d_FrameStatsData>

Description
-----------
Returns data frames.
") DataFrames;
		const NCollection_Array1<Graphic3d_FrameStatsData> & DataFrames();

		/****** Graphic3d_FrameStats::FormatStats ******/
		/****** md5 signature: 5b9dead4afc40b78e32eab45fce6ef06 ******/
		%feature("compactdefaultargs") FormatStats;
		%feature("autodoc", "
Parameters
----------
theFlags: Graphic3d_RenderingParams::PerfCounters

Return
-------
TCollection_AsciiString

Description
-----------
Returns formatted string.
") FormatStats;
		virtual TCollection_AsciiString FormatStats(Graphic3d_RenderingParams::PerfCounters theFlags);

		/****** Graphic3d_FrameStats::FormatStats ******/
		/****** md5 signature: 5030c22149f71eb431a542f54217cfb4 ******/
		%feature("compactdefaultargs") FormatStats;
		%feature("autodoc", "
Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString
theFlags: Graphic3d_RenderingParams::PerfCounters

Return
-------
None

Description
-----------
Fill in the dictionary with formatted statistic info.
") FormatStats;
		virtual void FormatStats(TColStd_IndexedDataMapOfStringString & theDict, Graphic3d_RenderingParams::PerfCounters theFlags);

		/****** Graphic3d_FrameStats::FrameDuration ******/
		/****** md5 signature: 611a12e33b07bfdecb6b92963afc48d8 ******/
		%feature("compactdefaultargs") FrameDuration;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns duration of the last frame in seconds.
") FrameDuration;
		double FrameDuration();

		/****** Graphic3d_FrameStats::FrameEnd ******/
		/****** md5 signature: a1a62d3a296e8bc083bd2a2e33e0b401 ******/
		%feature("compactdefaultargs") FrameEnd;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView
theIsImmediateOnly: bool

Return
-------
None

Description
-----------
Frame redraw finished.
") FrameEnd;
		virtual void FrameEnd(const opencascade::handle<Graphic3d_CView> & theView, bool theIsImmediateOnly);

		/****** Graphic3d_FrameStats::FrameRate ******/
		/****** md5 signature: 2be7bb6cd021e327a049f075bcaf4565 ******/
		%feature("compactdefaultargs") FrameRate;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns FPS (frames per seconds, elapsed time). This number indicates an actual frame rate averaged for several frames within UpdateInterval() duration, basing on a real elapsed time between updates.
") FrameRate;
		double FrameRate();

		/****** Graphic3d_FrameStats::FrameRateCpu ******/
		/****** md5 signature: 5e808003fb790a96bec4189dbf3b2868 ******/
		%feature("compactdefaultargs") FrameRateCpu;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns CPU FPS (frames per seconds, CPU time). This number indicates a PREDICTED frame rate, basing on CPU elapsed time between updates and NOT real elapsed time (which might include periods of CPU inactivity). Number is expected to be greater then actual frame rate returned by FrameRate(). Values significantly greater actual frame rate indicate that rendering is limited by GPU performance (CPU is stalled in-between), while values around actual frame rate indicate rendering being limited by CPU performance (GPU is stalled in-between).
") FrameRateCpu;
		double FrameRateCpu();

		/****** Graphic3d_FrameStats::FrameStart ******/
		/****** md5 signature: 4321aa56927dd15c9aa2049a53d48d01 ******/
		%feature("compactdefaultargs") FrameStart;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView
theIsImmediateOnly: bool

Return
-------
None

Description
-----------
Frame redraw started.
") FrameStart;
		virtual void FrameStart(const opencascade::handle<Graphic3d_CView> & theView, bool theIsImmediateOnly);

		/****** Graphic3d_FrameStats::HasCulledLayers ******/
		/****** md5 signature: 6f43af7eed73eebf557a7669bbf034a8 ******/
		%feature("compactdefaultargs") HasCulledLayers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if some Layers have been culled.
") HasCulledLayers;
		bool HasCulledLayers();

		/****** Graphic3d_FrameStats::HasCulledStructs ******/
		/****** md5 signature: 1d257ffbad1c02e6853d3c3752bce69a ******/
		%feature("compactdefaultargs") HasCulledStructs;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if some structures have been culled.
") HasCulledStructs;
		bool HasCulledStructs();

		/****** Graphic3d_FrameStats::IsLongLineFormat ******/
		/****** md5 signature: 231e257467c7c767bce7b6b9f320267f ******/
		%feature("compactdefaultargs") IsLongLineFormat;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Prefer longer lines over more greater of lines.
") IsLongLineFormat;
		bool IsLongLineFormat();

		/****** Graphic3d_FrameStats::LastDataFrame ******/
		/****** md5 signature: 43a5ae643ec463959ba072b87a1e8878 ******/
		%feature("compactdefaultargs") LastDataFrame;
		%feature("autodoc", "Return
-------
Graphic3d_FrameStatsData

Description
-----------
Returns last data frame, cached between stats updates. Should NOT be called between ::FrameStart() and ::FrameEnd() calls.
") LastDataFrame;
		const Graphic3d_FrameStatsData & LastDataFrame();

		/****** Graphic3d_FrameStats::LastDataFrameIndex ******/
		/****** md5 signature: 1effb2f3fb31127040673fdaca2af125 ******/
		%feature("compactdefaultargs") LastDataFrameIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns last data frame index.
") LastDataFrameIndex;
		int LastDataFrameIndex();

		/****** Graphic3d_FrameStats::SetLongLineFormat ******/
		/****** md5 signature: a9dd4b2e2d920ff04975d1e25600da5f ******/
		%feature("compactdefaultargs") SetLongLineFormat;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set if format should prefer longer lines over greater number of lines.
") SetLongLineFormat;
		void SetLongLineFormat(bool theValue);

		/****** Graphic3d_FrameStats::SetUpdateInterval ******/
		/****** md5 signature: 10040d11aaedef20ba2b1f7db36bf400 ******/
		%feature("compactdefaultargs") SetUpdateInterval;
		%feature("autodoc", "
Parameters
----------
theInterval: double

Return
-------
None

Description
-----------
Sets interval in seconds for updating values.
") SetUpdateInterval;
		void SetUpdateInterval(double theInterval);

		/****** Graphic3d_FrameStats::TimerValue ******/
		/****** md5 signature: 5066f58204641eb39fa56fa6c1a7cfc7 ******/
		%feature("compactdefaultargs") TimerValue;
		%feature("autodoc", "
Parameters
----------
theTimer: Graphic3d_FrameStatsTimer

Return
-------
double

Description
-----------
Returns value of specified timer for modification, should be called between ::FrameStart() and ::FrameEnd() calls. Should NOT be called between ::FrameStart() and ::FrameEnd() calls.
") TimerValue;
		double TimerValue(Graphic3d_FrameStatsTimer theTimer);

		/****** Graphic3d_FrameStats::UpdateInterval ******/
		/****** md5 signature: 207be5dd8d2afb74429dfdce38272d60 ******/
		%feature("compactdefaultargs") UpdateInterval;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns interval in seconds for updating meters across several frames; 1 second by default.
") UpdateInterval;
		double UpdateInterval();

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
		/****** Graphic3d_FrameStatsData::Graphic3d_FrameStatsData ******/
		/****** md5 signature: cb20320dae57ead2c8bcffdd55733e51 ******/
		%feature("compactdefaultargs") Graphic3d_FrameStatsData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_FrameStatsData;
		 Graphic3d_FrameStatsData();

		/****** Graphic3d_FrameStatsData::Graphic3d_FrameStatsData ******/
		/****** md5 signature: e1e7b95b04e8c9d86b8beb9e219b6832 ******/
		%feature("compactdefaultargs") Graphic3d_FrameStatsData;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_FrameStatsData

Return
-------
None

Description
-----------
Copy constructor.
") Graphic3d_FrameStatsData;
		 Graphic3d_FrameStatsData(const Graphic3d_FrameStatsData & theOther);

		/****** Graphic3d_FrameStatsData::Graphic3d_FrameStatsData ******/
		/****** md5 signature: 4636c48bd62685dc1d69e0b603913f9b ******/
		%feature("compactdefaultargs") Graphic3d_FrameStatsData;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_FrameStatsData

Return
-------
None

Description
-----------
Move constructor.
") Graphic3d_FrameStatsData;
		 Graphic3d_FrameStatsData(Graphic3d_FrameStatsData & theOther);

		/****** Graphic3d_FrameStatsData::CounterValue ******/
		/****** md5 signature: c26511210181d154a400b93d929a1701 ******/
		%feature("compactdefaultargs") CounterValue;
		%feature("autodoc", "
Parameters
----------
theIndex: Graphic3d_FrameStatsCounter

Return
-------
size_t

Description
-----------
Get counter value.
") CounterValue;
		size_t CounterValue(Graphic3d_FrameStatsCounter theIndex);

		/****** Graphic3d_FrameStatsData::FillMax ******/
		/****** md5 signature: aba2493eb7aceb56692dcd34d61c14d1 ******/
		%feature("compactdefaultargs") FillMax;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_FrameStatsData

Return
-------
None

Description
-----------
Fill with maximum values.
") FillMax;
		void FillMax(const Graphic3d_FrameStatsData & theOther);

		/****** Graphic3d_FrameStatsData::FrameRate ******/
		/****** md5 signature: 2be7bb6cd021e327a049f075bcaf4565 ******/
		%feature("compactdefaultargs") FrameRate;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns FPS (frames per seconds, elapsed time). This number indicates an actual frame rate averaged for several frames within UpdateInterval() duration, basing on a real elapsed time between updates.
") FrameRate;
		double FrameRate();

		/****** Graphic3d_FrameStatsData::FrameRateCpu ******/
		/****** md5 signature: 5e808003fb790a96bec4189dbf3b2868 ******/
		%feature("compactdefaultargs") FrameRateCpu;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns CPU FPS (frames per seconds, CPU time). This number indicates a PREDICTED frame rate, basing on CPU elapsed time between updates and NOT real elapsed time (which might include periods of CPU inactivity). Number is expected to be greater then actual frame rate returned by FrameRate(). Values significantly greater actual frame rate indicate that rendering is limited by GPU performance (CPU is stalled in-between), while values around actual frame rate indicate rendering being limited by CPU performance (GPU is stalled in-between).
") FrameRateCpu;
		double FrameRateCpu();

		/****** Graphic3d_FrameStatsData::ImmediateFrameRate ******/
		/****** md5 signature: 20e163d6ff05d676546baa100d0e2771 ******/
		%feature("compactdefaultargs") ImmediateFrameRate;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns FPS for immediate redraws.
") ImmediateFrameRate;
		double ImmediateFrameRate();

		/****** Graphic3d_FrameStatsData::ImmediateFrameRateCpu ******/
		/****** md5 signature: cd730644f9fdf537131f0092fcb91d88 ******/
		%feature("compactdefaultargs") ImmediateFrameRateCpu;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns CPU FPS for immediate redraws.
") ImmediateFrameRateCpu;
		double ImmediateFrameRateCpu();

		/****** Graphic3d_FrameStatsData::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset data.
") Reset;
		void Reset();

		/****** Graphic3d_FrameStatsData::TimerValue ******/
		/****** md5 signature: 40e735e25040955f0d3e393f7045c885 ******/
		%feature("compactdefaultargs") TimerValue;
		%feature("autodoc", "
Parameters
----------
theIndex: Graphic3d_FrameStatsTimer

Return
-------
double

Description
-----------
Get timer value.
") TimerValue;
		double TimerValue(Graphic3d_FrameStatsTimer theIndex);

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
		/****** Graphic3d_Fresnel::Graphic3d_Fresnel ******/
		/****** md5 signature: 9be7b9d3e911d9507c81ff78fff65010 ******/
		%feature("compactdefaultargs") Graphic3d_Fresnel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates uninitialized Fresnel factor.
") Graphic3d_Fresnel;
		 Graphic3d_Fresnel();

		/****** Graphic3d_Fresnel::CreateConductor ******/
		/****** md5 signature: dfb88397f96696c93600f69d3c251391 ******/
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "
Parameters
----------
theRefractionIndex: float
theAbsorptionIndex: float

Return
-------
Graphic3d_Fresnel

Description
-----------
Creates Fresnel factor for physical-based conductor model.
") CreateConductor;
		static Graphic3d_Fresnel CreateConductor(float theRefractionIndex, float theAbsorptionIndex);

		/****** Graphic3d_Fresnel::CreateConductor ******/
		/****** md5 signature: 83ae9e1a07730362c4501eaf33285d4f ******/
		%feature("compactdefaultargs") CreateConductor;
		%feature("autodoc", "
Parameters
----------
theRefractionIndex: NCollection_Vec3<float>
theAbsorptionIndex: NCollection_Vec3<float>

Return
-------
Graphic3d_Fresnel

Description
-----------
Creates Fresnel factor for physical-based conductor model (spectral version).
") CreateConductor;
		static Graphic3d_Fresnel CreateConductor(const NCollection_Vec3<float> & theRefractionIndex, const NCollection_Vec3<float> & theAbsorptionIndex);

		/****** Graphic3d_Fresnel::CreateConstant ******/
		/****** md5 signature: 5f53933488aa21c9db73db7da01b3d7a ******/
		%feature("compactdefaultargs") CreateConstant;
		%feature("autodoc", "
Parameters
----------
theReflection: float

Return
-------
Graphic3d_Fresnel

Description
-----------
Creates Fresnel factor for constant reflection.
") CreateConstant;
		static Graphic3d_Fresnel CreateConstant(const float theReflection);

		/****** Graphic3d_Fresnel::CreateDielectric ******/
		/****** md5 signature: 8ec4ba349edf8da0bd3933de1cbb20cf ******/
		%feature("compactdefaultargs") CreateDielectric;
		%feature("autodoc", "
Parameters
----------
theRefractionIndex: float

Return
-------
Graphic3d_Fresnel

Description
-----------
Creates Fresnel factor for physical-based dielectric model.
") CreateDielectric;
		static Graphic3d_Fresnel CreateDielectric(float theRefractionIndex);

		/****** Graphic3d_Fresnel::CreateSchlick ******/
		/****** md5 signature: e61ee87cc7b0a3f3c80338d1463c0150 ******/
		%feature("compactdefaultargs") CreateSchlick;
		%feature("autodoc", "
Parameters
----------
theSpecularColor: NCollection_Vec3<float>

Return
-------
Graphic3d_Fresnel

Description
-----------
Creates Schlick's approximation of Fresnel factor.
") CreateSchlick;
		static Graphic3d_Fresnel CreateSchlick(const NCollection_Vec3<float> & theSpecularColor);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Fresnel::FresnelType ******/
		/****** md5 signature: 98c0c74d03fd3aa57b6d6ab4409e1720 ******/
		%feature("compactdefaultargs") FresnelType;
		%feature("autodoc", "Return
-------
Graphic3d_FresnelModel

Description
-----------
Returns type of Fresnel.
") FresnelType;
		Graphic3d_FresnelModel FresnelType();

		/****** Graphic3d_Fresnel::Serialize ******/
		/****** md5 signature: bd6816bea3ac8386dd23f41510ba9718 ******/
		%feature("compactdefaultargs") Serialize;
		%feature("autodoc", "Return
-------
NCollection_Vec4<float >

Description
-----------
Returns serialized representation of Fresnel factor.
") Serialize;
		NCollection_Vec4<float > Serialize();


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
		class AxisAspect {};
		/****** Graphic3d_GraduatedTrihedron::Graphic3d_GraduatedTrihedron ******/
		/****** md5 signature: 68470148477b86a774da75d60f5ef155 ******/
		%feature("compactdefaultargs") Graphic3d_GraduatedTrihedron;
		%feature("autodoc", "
Parameters
----------
theNamesFont: str (optional, default to 'Arial')
theNamesStyle: Font_FontAspect (optional, default to Font_FA_Bold)
theNamesSize: int (optional, default to 12)
theValuesFont: str (optional, default to 'Arial')
theValuesStyle: Font_FontAspect (optional, default to Font_FA_Regular)
theValuesSize: int (optional, default to 12)
theArrowsLength: float (optional, default to 30.0f)
theGridColor: Quantity_Color (optional, default to Quantity_NOC_WHITE)
theToDrawGrid: bool (optional, default to true)
theToDrawAxes: bool (optional, default to true)

Return
-------
None

Description
-----------
Default constructor Constructs the default graduated trihedron with grid, X, Y, Z axes, and tickmarks.
") Graphic3d_GraduatedTrihedron;
		 Graphic3d_GraduatedTrihedron(TCollection_AsciiString theNamesFont = "Arial", const Font_FontAspect & theNamesStyle = Font_FA_Bold, const int theNamesSize = 12, TCollection_AsciiString theValuesFont = "Arial", const Font_FontAspect & theValuesStyle = Font_FA_Regular, const int theValuesSize = 12, const float theArrowsLength = 30.0f, const Quantity_Color theGridColor = Quantity_NOC_WHITE, const bool theToDrawGrid = true, const bool theToDrawAxes = true);

		/****** Graphic3d_GraduatedTrihedron::ArrowsLength ******/
		/****** md5 signature: 3401ef9b71ccd5d3d7c02c03c9821f22 ******/
		%feature("compactdefaultargs") ArrowsLength;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ArrowsLength;
		float ArrowsLength();

		/****** Graphic3d_GraduatedTrihedron::AxisAspectAt ******/
		/****** md5 signature: fa72893c19cb3ba075fc1fbb4bc85007 ******/
		%feature("compactdefaultargs") AxisAspectAt;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") AxisAspectAt;
		Graphic3d_GraduatedTrihedron::AxisAspect AxisAspectAt(const int theIndex);

		/****** Graphic3d_GraduatedTrihedron::ChangeAxisAspect ******/
		/****** md5 signature: 3fc552a11ec61661802eef88512248b7 ******/
		%feature("compactdefaultargs") ChangeAxisAspect;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") ChangeAxisAspect;
		Graphic3d_GraduatedTrihedron::AxisAspect ChangeAxisAspect(const int theIndex);

		/****** Graphic3d_GraduatedTrihedron::ChangeXAxisAspect ******/
		/****** md5 signature: 0db2f493a8dc9d6a74d8770813ea91e3 ******/
		%feature("compactdefaultargs") ChangeXAxisAspect;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") ChangeXAxisAspect;
		Graphic3d_GraduatedTrihedron::AxisAspect ChangeXAxisAspect();

		/****** Graphic3d_GraduatedTrihedron::ChangeYAxisAspect ******/
		/****** md5 signature: 26bef1416c24df17fe629630d5fad032 ******/
		%feature("compactdefaultargs") ChangeYAxisAspect;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") ChangeYAxisAspect;
		Graphic3d_GraduatedTrihedron::AxisAspect ChangeYAxisAspect();

		/****** Graphic3d_GraduatedTrihedron::ChangeZAxisAspect ******/
		/****** md5 signature: 0c6e16c99d91d275f7b741d01a32696b ******/
		%feature("compactdefaultargs") ChangeZAxisAspect;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") ChangeZAxisAspect;
		Graphic3d_GraduatedTrihedron::AxisAspect ChangeZAxisAspect();

		/****** Graphic3d_GraduatedTrihedron::CubicAxesCallback ******/
		/****** md5 signature: 7b8addf976d41ad86c104d91427176e0 ******/
		%feature("compactdefaultargs") CubicAxesCallback;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView *

Return
-------
bool

Description
-----------
No available documentation.
") CubicAxesCallback;
		bool CubicAxesCallback(Graphic3d_CView * theView);

		/****** Graphic3d_GraduatedTrihedron::GridColor ******/
		/****** md5 signature: 0a94080e9f8d07e2f072c1b5c94f2339 ******/
		%feature("compactdefaultargs") GridColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
No available documentation.
") GridColor;
		const Quantity_Color & GridColor();

		/****** Graphic3d_GraduatedTrihedron::NamesFont ******/
		/****** md5 signature: fff09ee152b933c30f0bd84d05698758 ******/
		%feature("compactdefaultargs") NamesFont;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") NamesFont;
		const TCollection_AsciiString & NamesFont();

		/****** Graphic3d_GraduatedTrihedron::NamesFontAspect ******/
		/****** md5 signature: 24ee92075d6b91f3b6cd462739a1b92f ******/
		%feature("compactdefaultargs") NamesFontAspect;
		%feature("autodoc", "Return
-------
Font_FontAspect

Description
-----------
No available documentation.
") NamesFontAspect;
		Font_FontAspect NamesFontAspect();

		/****** Graphic3d_GraduatedTrihedron::NamesSize ******/
		/****** md5 signature: e91f415c362496c9882a65ec83e422c1 ******/
		%feature("compactdefaultargs") NamesSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NamesSize;
		int NamesSize();

		/****** Graphic3d_GraduatedTrihedron::SetArrowsLength ******/
		/****** md5 signature: 21095d460d729a3ccdd9220cb2d64b4b ******/
		%feature("compactdefaultargs") SetArrowsLength;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
No available documentation.
") SetArrowsLength;
		void SetArrowsLength(const float theValue);

		/****** Graphic3d_GraduatedTrihedron::SetDrawAxes ******/
		/****** md5 signature: 8c87c5235a23e2eab0d1f99e71e497f0 ******/
		%feature("compactdefaultargs") SetDrawAxes;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
No available documentation.
") SetDrawAxes;
		void SetDrawAxes(const bool theToDraw);

		/****** Graphic3d_GraduatedTrihedron::SetDrawGrid ******/
		/****** md5 signature: 962f731fd5fa999b02cf4201bde516b8 ******/
		%feature("compactdefaultargs") SetDrawGrid;
		%feature("autodoc", "
Parameters
----------
theToDraw: bool

Return
-------
None

Description
-----------
No available documentation.
") SetDrawGrid;
		void SetDrawGrid(const bool theToDraw);

		/****** Graphic3d_GraduatedTrihedron::SetGridColor ******/
		/****** md5 signature: 9f70fd93cff9ed9f03df433cb59530c7 ******/
		%feature("compactdefaultargs") SetGridColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetGridColor;
		void SetGridColor(const Quantity_Color & theColor);

		/****** Graphic3d_GraduatedTrihedron::SetNamesFont ******/
		/****** md5 signature: 04ce69c162ca06059e2e9948b6c7a5d5 ******/
		%feature("compactdefaultargs") SetNamesFont;
		%feature("autodoc", "
Parameters
----------
theFont: str

Return
-------
None

Description
-----------
No available documentation.
") SetNamesFont;
		void SetNamesFont(TCollection_AsciiString theFont);

		/****** Graphic3d_GraduatedTrihedron::SetNamesFontAspect ******/
		/****** md5 signature: 95599011b4aa83f2326f3a73b956d72c ******/
		%feature("compactdefaultargs") SetNamesFontAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Font_FontAspect

Return
-------
None

Description
-----------
No available documentation.
") SetNamesFontAspect;
		void SetNamesFontAspect(Font_FontAspect theAspect);

		/****** Graphic3d_GraduatedTrihedron::SetNamesSize ******/
		/****** md5 signature: 29bfde18772a48593c9232bff5206104 ******/
		%feature("compactdefaultargs") SetNamesSize;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
None

Description
-----------
No available documentation.
") SetNamesSize;
		void SetNamesSize(const int theValue);

		/****** Graphic3d_GraduatedTrihedron::SetValuesFont ******/
		/****** md5 signature: 51c17c292b99eeb2899776619385aecc ******/
		%feature("compactdefaultargs") SetValuesFont;
		%feature("autodoc", "
Parameters
----------
theFont: str

Return
-------
None

Description
-----------
No available documentation.
") SetValuesFont;
		void SetValuesFont(TCollection_AsciiString theFont);

		/****** Graphic3d_GraduatedTrihedron::SetValuesFontAspect ******/
		/****** md5 signature: d802052a96e2bd0dacd9adf90fe293cd ******/
		%feature("compactdefaultargs") SetValuesFontAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Font_FontAspect

Return
-------
None

Description
-----------
No available documentation.
") SetValuesFontAspect;
		void SetValuesFontAspect(Font_FontAspect theAspect);

		/****** Graphic3d_GraduatedTrihedron::SetValuesSize ******/
		/****** md5 signature: a5a4bb48799dacb6dbd536756b0edb36 ******/
		%feature("compactdefaultargs") SetValuesSize;
		%feature("autodoc", "
Parameters
----------
theValue: int

Return
-------
None

Description
-----------
No available documentation.
") SetValuesSize;
		void SetValuesSize(const int theValue);

		/****** Graphic3d_GraduatedTrihedron::ToDrawAxes ******/
		/****** md5 signature: e59c10df31cd7c7d5638c74486d08235 ******/
		%feature("compactdefaultargs") ToDrawAxes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ToDrawAxes;
		bool ToDrawAxes();

		/****** Graphic3d_GraduatedTrihedron::ToDrawGrid ******/
		/****** md5 signature: 84eae084a8e5ec4923a6c83c2bd24115 ******/
		%feature("compactdefaultargs") ToDrawGrid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ToDrawGrid;
		bool ToDrawGrid();

		/****** Graphic3d_GraduatedTrihedron::ValuesFont ******/
		/****** md5 signature: fb3c190dc717e90b8fb6d2d17f5e867a ******/
		%feature("compactdefaultargs") ValuesFont;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") ValuesFont;
		const TCollection_AsciiString & ValuesFont();

		/****** Graphic3d_GraduatedTrihedron::ValuesFontAspect ******/
		/****** md5 signature: b14f920e832d04b2a45fcad2054971b1 ******/
		%feature("compactdefaultargs") ValuesFontAspect;
		%feature("autodoc", "Return
-------
Font_FontAspect

Description
-----------
No available documentation.
") ValuesFontAspect;
		Font_FontAspect ValuesFontAspect();

		/****** Graphic3d_GraduatedTrihedron::ValuesSize ******/
		/****** md5 signature: c17e0e32373b4e07e0bbbaed75bac2c3 ******/
		%feature("compactdefaultargs") ValuesSize;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") ValuesSize;
		int ValuesSize();

		/****** Graphic3d_GraduatedTrihedron::XAxisAspect ******/
		/****** md5 signature: 658c3ee5f9ab4ee1108f1949964cb378 ******/
		%feature("compactdefaultargs") XAxisAspect;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") XAxisAspect;
		Graphic3d_GraduatedTrihedron::AxisAspect XAxisAspect();

		/****** Graphic3d_GraduatedTrihedron::YAxisAspect ******/
		/****** md5 signature: 5e948e695e24c65afc182aae4b8c4f74 ******/
		%feature("compactdefaultargs") YAxisAspect;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") YAxisAspect;
		Graphic3d_GraduatedTrihedron::AxisAspect YAxisAspect();

		/****** Graphic3d_GraduatedTrihedron::ZAxisAspect ******/
		/****** md5 signature: cdd43014b9d477d11415b709e5cebb35 ******/
		%feature("compactdefaultargs") ZAxisAspect;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron::AxisAspect

Description
-----------
No available documentation.
") ZAxisAspect;
		Graphic3d_GraduatedTrihedron::AxisAspect ZAxisAspect();

};


%extend Graphic3d_GraduatedTrihedron {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetCubicAxesCallback(self):
		pass
	}
};

/********************************
* class Graphic3d_GraphicDriver *
********************************/
%nodefaultctor Graphic3d_GraphicDriver;
class Graphic3d_GraphicDriver : public Standard_Transient {
	public:
		/****** Graphic3d_GraphicDriver::CreateStructure ******/
		/****** md5 signature: a36ec42089c49a5b3cd014c42cce26aa ******/
		%feature("compactdefaultargs") CreateStructure;
		%feature("autodoc", "
Parameters
----------
theManager: Graphic3d_StructureManager

Return
-------
opencascade::handle<Graphic3d_CStructure>

Description
-----------
Creates new empty graphic structure.
") CreateStructure;
		virtual opencascade::handle<Graphic3d_CStructure> CreateStructure(const opencascade::handle<Graphic3d_StructureManager> & theManager);

		/****** Graphic3d_GraphicDriver::CreateView ******/
		/****** md5 signature: efb7ebf01d81afbe1ea2502c9f4f1c84 ******/
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "
Parameters
----------
theMgr: Graphic3d_StructureManager

Return
-------
opencascade::handle<Graphic3d_CView>

Description
-----------
Creates new view for this graphic driver.
") CreateView;
		virtual opencascade::handle<Graphic3d_CView> CreateView(const opencascade::handle<Graphic3d_StructureManager> & theMgr);

		/****** Graphic3d_GraphicDriver::DefaultTextHeight ******/
		/****** md5 signature: ece7ae187dcf5815c4143cc1418bb1bd ******/
		%feature("compactdefaultargs") DefaultTextHeight;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DefaultTextHeight;
		virtual float DefaultTextHeight();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_GraphicDriver::EnableVBO ******/
		/****** md5 signature: bddf00adbafa790df62cd7751be7b366 ******/
		%feature("compactdefaultargs") EnableVBO;
		%feature("autodoc", "
Parameters
----------
status: bool

Return
-------
None

Description
-----------
enables/disables usage of OpenGL vertex buffer arrays while drawing primitive arrays.
") EnableVBO;
		virtual void EnableVBO(const bool status);

		/****** Graphic3d_GraphicDriver::GetDisplayConnection ******/
		/****** md5 signature: 23fb6073a1974917a907039ad426bbdd ******/
		%feature("compactdefaultargs") GetDisplayConnection;
		%feature("autodoc", "Return
-------
opencascade::handle<Aspect_DisplayConnection>

Description
-----------
returns Handle to display connection.
") GetDisplayConnection;
		const opencascade::handle<Aspect_DisplayConnection> & GetDisplayConnection();

		/****** Graphic3d_GraphicDriver::InquireLightLimit ******/
		/****** md5 signature: afb044f194f3f2efe3fa7dbd247d062a ******/
		%feature("compactdefaultargs") InquireLightLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Request maximum number of active light sources supported by driver and hardware.
") InquireLightLimit;
		int InquireLightLimit();

		/****** Graphic3d_GraphicDriver::InquireLimit ******/
		/****** md5 signature: 717ca847dc2850bfc07cf7806573a4c1 ******/
		%feature("compactdefaultargs") InquireLimit;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfLimit

Return
-------
int

Description
-----------
Request limit of graphic resource of specific type.
") InquireLimit;
		virtual int InquireLimit(const Graphic3d_TypeOfLimit theType);

		/****** Graphic3d_GraphicDriver::InquirePlaneLimit ******/
		/****** md5 signature: c96a11575fae15fb996c17f3d9cb9132 ******/
		%feature("compactdefaultargs") InquirePlaneLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Request maximum number of active clipping planes supported by driver and hardware.
") InquirePlaneLimit;
		int InquirePlaneLimit();

		/****** Graphic3d_GraphicDriver::InquireViewLimit ******/
		/****** md5 signature: 0cfbf71da7269ab56a06821130560906 ******/
		%feature("compactdefaultargs") InquireViewLimit;
		%feature("autodoc", "Return
-------
int

Description
-----------
Request maximum number of views supported by driver.
") InquireViewLimit;
		int InquireViewLimit();

		/****** Graphic3d_GraphicDriver::InsertLayerAfter ******/
		/****** md5 signature: cd9549addd4543aedd353e8c4428d456 ******/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "
Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerBefore: int

Return
-------
None

Description
-----------
Adds a layer to all views. 
Input parameter: theNewLayerId id of new layer, should be > 0 (negative values are reserved for default layers). 
Input parameter: theSettings new layer settings 
Input parameter: theLayerBefore id of layer to append new layer after.
") InsertLayerAfter;
		virtual void InsertLayerAfter(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerBefore);

		/****** Graphic3d_GraphicDriver::InsertLayerBefore ******/
		/****** md5 signature: 9598fd696d1336a754aefafafac0a974 ******/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "
Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerAfter: int

Return
-------
None

Description
-----------
Adds a layer to all views. To add a structure to desired layer on display it is necessary to set the layer ID for the structure. 
Input parameter: theNewLayerId id of new layer, should be > 0 (negative values are reserved for default layers). 
Input parameter: theSettings new layer settings 
Input parameter: theLayerAfter id of layer to append new layer before.
") InsertLayerBefore;
		virtual void InsertLayerBefore(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerAfter);

		/****** Graphic3d_GraphicDriver::IsVerticalSync ******/
		/****** md5 signature: 985d8beb785bea58cbbe2cfd1d737440 ******/
		%feature("compactdefaultargs") IsVerticalSync;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if vertical synchronization with display refresh rate (VSync) should be used; True by default.
") IsVerticalSync;
		virtual bool IsVerticalSync();

		/****** Graphic3d_GraphicDriver::MemoryInfo ******/
		/****** md5 signature: fa57ef2d51fe617e2d108a6975f8bdeb ******/
		%feature("compactdefaultargs") MemoryInfo;
		%feature("autodoc", "
Parameters
----------
theFreeBytes: size_t
theInfo: str

Return
-------
bool

Description
-----------
Returns information about GPU memory usage.
") MemoryInfo;
		virtual bool MemoryInfo(size_t & theFreeBytes, TCollection_AsciiString & theInfo);

		/****** Graphic3d_GraphicDriver::NewIdentification ******/
		/****** md5 signature: 947cf6514c96b61d192a98b3d795fc16 ******/
		%feature("compactdefaultargs") NewIdentification;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns a new identification number for a new structure.
") NewIdentification;
		int NewIdentification();

		/****** Graphic3d_GraphicDriver::RemoveIdentification ******/
		/****** md5 signature: b246240d176cabda90eaa79b4eda3439 ******/
		%feature("compactdefaultargs") RemoveIdentification;
		%feature("autodoc", "
Parameters
----------
theId: int

Return
-------
None

Description
-----------
Frees the identifier of a structure.
") RemoveIdentification;
		void RemoveIdentification(const int theId);

		/****** Graphic3d_GraphicDriver::RemoveStructure ******/
		/****** md5 signature: 374b074d13ec64b455e2c467ed5728e5 ******/
		%feature("compactdefaultargs") RemoveStructure;
		%feature("autodoc", "
Parameters
----------
theCStructure: Graphic3d_CStructure

Return
-------
None

Description
-----------
Removes structure from graphic driver and releases its resources.
") RemoveStructure;
		virtual void RemoveStructure(opencascade::handle<Graphic3d_CStructure> & theCStructure);

		/****** Graphic3d_GraphicDriver::RemoveView ******/
		/****** md5 signature: a2826f043434590367fb0ea3fe65f310 ******/
		%feature("compactdefaultargs") RemoveView;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView

Return
-------
None

Description
-----------
Removes view from graphic driver and releases its resources.
") RemoveView;
		virtual void RemoveView(const opencascade::handle<Graphic3d_CView> & theView);

		/****** Graphic3d_GraphicDriver::RemoveZLayer ******/
		/****** md5 signature: 50d5f44e4a544e7ce1c8003cf95dee16 ******/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
None

Description
-----------
Removes Z layer. All structures displayed at the moment in layer will be displayed in default layer (the bottom-level z layer). By default, there are always default bottom-level layer that can't be removed. The passed theLayerId should be not less than 0 (reserved for default layers that can not be removed).
") RemoveZLayer;
		virtual void RemoveZLayer(int theLayerId);

		/****** Graphic3d_GraphicDriver::SetVerticalSync ******/
		/****** md5 signature: 12e74570c44c853016ba468efbe54dc5 ******/
		%feature("compactdefaultargs") SetVerticalSync;
		%feature("autodoc", "
Parameters
----------
theToEnable: bool

Return
-------
None

Description
-----------
Set if vertical synchronization with display refresh rate (VSync) should be used.
") SetVerticalSync;
		virtual void SetVerticalSync(bool theToEnable);

		/****** Graphic3d_GraphicDriver::SetZLayerSettings ******/
		/****** md5 signature: 526c66f52cf13826d826173b0d84d35e ******/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "
Parameters
----------
theLayerId: int
theSettings: Graphic3d_ZLayerSettings

Return
-------
None

Description
-----------
Sets the settings for a single Z layer.
") SetZLayerSettings;
		virtual void SetZLayerSettings(int theLayerId, const Graphic3d_ZLayerSettings & theSettings);

		/****** Graphic3d_GraphicDriver::TextSize ******/
		/****** md5 signature: 798e270c62e5c486c1152c1831b76651 ******/
		%feature("compactdefaultargs") TextSize;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView
theText: char *
theHeight: float

Return
-------
theWidth: float
theAscent: float
theDescent: float

Description
-----------
Computes text width.
") TextSize;
		virtual void TextSize(const opencascade::handle<Graphic3d_CView> & theView, const char * const theText, const float theHeight, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** Graphic3d_GraphicDriver::ViewExists ******/
		/****** md5 signature: 9c20f806d86ae97b9ce87d6dad5d6855 ******/
		%feature("compactdefaultargs") ViewExists;
		%feature("autodoc", "
Parameters
----------
theWindow: Aspect_Window
theView: Graphic3d_CView

Return
-------
bool

Description
-----------
Returns view associated with the window if it is exists and is activated. Returns true if the view associated to the window exists.
") ViewExists;
		virtual bool ViewExists(const opencascade::handle<Aspect_Window> & theWindow, opencascade::handle<Graphic3d_CView> & theView);

		/****** Graphic3d_GraphicDriver::ZLayerSettings ******/
		/****** md5 signature: e38c9e174f323fbe425dc9e1a52d5a50 ******/
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
Graphic3d_ZLayerSettings

Description
-----------
Returns the settings of a single Z layer.
") ZLayerSettings;
		virtual const Graphic3d_ZLayerSettings & ZLayerSettings(int theLayerId);

		/****** Graphic3d_GraphicDriver::ZLayers ******/
		/****** md5 signature: 8bf3b7af4cf3bfe28f49abfb33451f60 ******/
		%feature("compactdefaultargs") ZLayers;
		%feature("autodoc", "
Parameters
----------
theLayerSeq: TColStd_SequenceOfInteger

Return
-------
None

Description
-----------
Returns list of Z layers defined for the graphical driver.
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

/***************************************
* class Graphic3d_GraphicDriverFactory *
***************************************/
%nodefaultctor Graphic3d_GraphicDriverFactory;
class Graphic3d_GraphicDriverFactory : public Standard_Transient {
	public:
		/****** Graphic3d_GraphicDriverFactory::CreateDriver ******/
		/****** md5 signature: 51916739a7171cbbc64ee23ff291b6b9 ******/
		%feature("compactdefaultargs") CreateDriver;
		%feature("autodoc", "
Parameters
----------
theDisp: Aspect_DisplayConnection

Return
-------
opencascade::handle<Graphic3d_GraphicDriver>

Description
-----------
Creates new empty graphic driver.
") CreateDriver;
		virtual opencascade::handle<Graphic3d_GraphicDriver> CreateDriver(const opencascade::handle<Aspect_DisplayConnection> & theDisp);

		/****** Graphic3d_GraphicDriverFactory::DefaultDriverFactory ******/
		/****** md5 signature: e914dd4d0cb1a2d6e284026448f6a910 ******/
		%feature("compactdefaultargs") DefaultDriverFactory;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_GraphicDriverFactory>

Description
-----------
Return default driver factory or NULL if no one was registered.
") DefaultDriverFactory;
		static opencascade::handle<Graphic3d_GraphicDriverFactory> DefaultDriverFactory();

		/****** Graphic3d_GraphicDriverFactory::DriverFactories ******/
		/****** md5 signature: d0166169cede8f78603da77cd0fbbde6 ******/
		%feature("compactdefaultargs") DriverFactories;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<Graphic3d_GraphicDriverFactory>>

Description
-----------
Return the global map of registered driver factories.
") DriverFactories;
		static const NCollection_List<opencascade::handle<Graphic3d_GraphicDriverFactory>> & DriverFactories();

		/****** Graphic3d_GraphicDriverFactory::Name ******/
		/****** md5 signature: efed61b92683387cd746fb27e0376505 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return driver factory name.
") Name;
		const TCollection_AsciiString & Name();

		/****** Graphic3d_GraphicDriverFactory::RegisterFactory ******/
		/****** md5 signature: 881e0cdc731f704ba93123921ea34592 ******/
		%feature("compactdefaultargs") RegisterFactory;
		%feature("autodoc", "
Parameters
----------
theFactory: Graphic3d_GraphicDriverFactory
theIsPreferred: bool (optional, default to false)

Return
-------
None

Description
-----------
Registers factory. 
Input parameter: theFactory factory to register 
Input parameter: theIsPreferred add to the beginning of the list when True, or add to the end otherwise.
") RegisterFactory;
		static void RegisterFactory(const opencascade::handle<Graphic3d_GraphicDriverFactory> & theFactory, bool theIsPreferred = false);

		/****** Graphic3d_GraphicDriverFactory::UnregisterFactory ******/
		/****** md5 signature: 9fe2bdc1459cba7162127ec6a3412054 ******/
		%feature("compactdefaultargs") UnregisterFactory;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
Unregisters factory.
") UnregisterFactory;
		static void UnregisterFactory(TCollection_AsciiString theName);

};


%make_alias(Graphic3d_GraphicDriverFactory)

%extend Graphic3d_GraphicDriverFactory {
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
		/****** Graphic3d_Group::AddPrimitiveArray ******/
		/****** md5 signature: 02ea5fd2d66b9e4eab490883a80332bf ******/
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfPrimitiveArray
theIndices: Graphic3d_IndexBuffer
theAttribs: Graphic3d_Buffer
theBounds: Graphic3d_BoundBuffer
theToEvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
Adds an array of primitives for display.
") AddPrimitiveArray;
		virtual void AddPrimitiveArray(const Graphic3d_TypeOfPrimitiveArray theType, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const opencascade::handle<Graphic3d_Buffer> & theAttribs, const opencascade::handle<Graphic3d_BoundBuffer> & theBounds, const bool theToEvalMinMax = true);

		/****** Graphic3d_Group::AddPrimitiveArray ******/
		/****** md5 signature: cbccd8a6e60fe3314bd734561f731e2f ******/
		%feature("compactdefaultargs") AddPrimitiveArray;
		%feature("autodoc", "
Parameters
----------
thePrim: Graphic3d_ArrayOfPrimitives
theToEvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
Adds an array of primitives for display.
") AddPrimitiveArray;
		void AddPrimitiveArray(const opencascade::handle<Graphic3d_ArrayOfPrimitives> & thePrim, const bool theToEvalMinMax = true);

		/****** Graphic3d_Group::AddText ******/
		/****** md5 signature: 28ba53906e0db7779f62877bb2ae3e34 ******/
		%feature("compactdefaultargs") AddText;
		%feature("autodoc", "
Parameters
----------
theTextParams: Graphic3d_Text
theToEvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
Adds a text for display.
") AddText;
		virtual void AddText(const opencascade::handle<Graphic3d_Text> & theTextParams, const bool theToEvalMinMax = true);

		/****** Graphic3d_Group::Aspects ******/
		/****** md5 signature: 04e82c25c53238d777eaf039de6caaf9 ******/
		%feature("compactdefaultargs") Aspects;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Aspects>

Description
-----------
Return fill area aspect.
") Aspects;
		virtual opencascade::handle<Graphic3d_Aspects> Aspects();

		/****** Graphic3d_Group::BoundingBox ******/
		/****** md5 signature: e41af9b36a07039d2315bd8651dda9c4 ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Graphic3d_BndBox4f

Description
-----------
Returns boundary box of the group <self> without transformation applied,.
") BoundingBox;
		const Graphic3d_BndBox4f & BoundingBox();

		/****** Graphic3d_Group::ChangeBoundingBox ******/
		/****** md5 signature: cc4a360d34add196038ff35d6beec779 ******/
		%feature("compactdefaultargs") ChangeBoundingBox;
		%feature("autodoc", "Return
-------
Graphic3d_BndBox4f

Description
-----------
Returns non-const boundary box of the group <self> without transformation applied,.
") ChangeBoundingBox;
		Graphic3d_BndBox4f & ChangeBoundingBox();

		/****** Graphic3d_Group::Clear ******/
		/****** md5 signature: c035bc2a5cef6cb7adfb3f41a8d81d45 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theUpdateStructureMgr: bool (optional, default to true)

Return
-------
None

Description
-----------
Suppress all primitives and attributes of <self>. To clear group without update in Graphic3d_StructureManager pass false as <theUpdateStructureMgr>. This used on context and viewer destruction, when the pointer to structure manager in Graphic3d_Structure could be already released (pointers are used here to avoid handle cross-reference);.
") Clear;
		virtual void Clear(const bool theUpdateStructureMgr = true);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Group::Flipper ******/
		/****** md5 signature: cc7f93b393944230c181072fc5c99743 ******/
		%feature("compactdefaultargs") Flipper;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Flipper>

Description
-----------
Return flipper metadata describing the runtime flip of this group, or null if not flipped.
") Flipper;
		const opencascade::handle<Graphic3d_Flipper> & Flipper();

		/****** Graphic3d_Group::IsClosed ******/
		/****** md5 signature: 87cef9bebf52c7a89467bdbada7b297e ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if primitive arrays within this graphic group form closed volume (do no contain open shells).
") IsClosed;
		bool IsClosed();

		/****** Graphic3d_Group::IsDeleted ******/
		/****** md5 signature: cc0c0952645062487d6671a17e0d5a93 ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the group <self> is deleted. <self> is deleted after the call Remove (me) or the associated structure is deleted.
") IsDeleted;
		bool IsDeleted();

		/****** Graphic3d_Group::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the group <self> is empty.
") IsEmpty;
		bool IsEmpty();

		/****** Graphic3d_Group::Marker ******/
		/****** md5 signature: 8671750e7ee1b4dd8258dd9c3a38b14a ******/
		%feature("compactdefaultargs") Marker;
		%feature("autodoc", "
Parameters
----------
thePoint: Graphic3d_Vertex
theToEvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Marker;
		void Marker(const Graphic3d_Vertex & thePoint, const bool theToEvalMinMax = true);

		/****** Graphic3d_Group::MinMaxValues ******/
		/****** md5 signature: d898b235e0a820d9379de5bf303d50ed ******/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXMin: double
theYMin: double
theZMin: double
theXMax: double
theYMax: double
theZMax: double

Description
-----------
Returns the coordinates of the boundary box of the group.
") MinMaxValues;
		void MinMaxValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_Group::Remove ******/
		/****** md5 signature: 0346504d7ac570fc8960fb72d5ad5f20 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
None

Description
-----------
Suppress the group <self> in the structure. Warning: No more graphic operations in <self> after this call. Modifies the current modelling transform persistence (pan, zoom or rotate) Get the current modelling transform persistence (pan, zoom or rotate).
") Remove;
		void Remove();

		/****** Graphic3d_Group::ReplaceAspects ******/
		/****** md5 signature: 773b9351930ab60f3f0865c7352d6762 ******/
		%feature("compactdefaultargs") ReplaceAspects;
		%feature("autodoc", "
Parameters
----------
theMap: Graphic3d_Aspects

Return
-------
None

Description
-----------
Replace aspects specified in the replacement map.
") ReplaceAspects;
		virtual void ReplaceAspects(const NCollection_DataMap<opencascade::handle<Graphic3d_Aspects>, opencascade::handle<Graphic3d_Aspects>> & theMap);

		/****** Graphic3d_Group::SetClosed ******/
		/****** md5 signature: 1b75d364558b57c72138f423e78d6873 ******/
		%feature("compactdefaultargs") SetClosed;
		%feature("autodoc", "
Parameters
----------
theIsClosed: bool

Return
-------
None

Description
-----------
Changes property shown that primitive arrays within this group form closed volume (do no contain open shells).
") SetClosed;
		void SetClosed(const bool theIsClosed);

		/****** Graphic3d_Group::SetFlippingOptions ******/
		/****** md5 signature: 59820151c78501eb3f9405c800eb1bf3 ******/
		%feature("compactdefaultargs") SetFlippingOptions;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool
theRefPlane: gp_Ax2

Return
-------
None

Description
-----------
sets the flipping to theIsEnabled state.
") SetFlippingOptions;
		virtual void SetFlippingOptions(const bool theIsEnabled, const gp_Ax2 & theRefPlane);

		/****** Graphic3d_Group::SetMinMaxValues ******/
		/****** md5 signature: f29618c9f205710c8a435645344d0936 ******/
		%feature("compactdefaultargs") SetMinMaxValues;
		%feature("autodoc", "
Parameters
----------
theXMin: double
theYMin: double
theZMin: double
theXMax: double
theYMax: double
theZMax: double

Return
-------
None

Description
-----------
Sets the coordinates of the boundary box of the group.
") SetMinMaxValues;
		void SetMinMaxValues(const double theXMin, const double theYMin, const double theZMin, const double theXMax, const double theYMax, const double theZMax);

		/****** Graphic3d_Group::SetPrimitivesAspect ******/
		/****** md5 signature: 3da7a768fd766aa68016939deaeb98d8 ******/
		%feature("compactdefaultargs") SetPrimitivesAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_Aspects

Return
-------
None

Description
-----------
Modifies the current context of the group to give another aspect for all the primitives created after this call in the group.
") SetPrimitivesAspect;
		virtual void SetPrimitivesAspect(const opencascade::handle<Graphic3d_Aspects> & theAspect);

		/****** Graphic3d_Group::SetStencilTestOptions ******/
		/****** md5 signature: 5903a1f71637231dd747ee8593a40678 ******/
		%feature("compactdefaultargs") SetStencilTestOptions;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
sets the stencil test to theIsEnabled state;.
") SetStencilTestOptions;
		virtual void SetStencilTestOptions(const bool theIsEnabled);

		/****** Graphic3d_Group::SetTransformPersistence ******/
		/****** md5 signature: 9823ebeffde5eb16b0c205a862e3b2c2 ******/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "
Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Return
-------
None

Description
-----------
Set transformation persistence.
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** Graphic3d_Group::SetTransformation ******/
		/****** md5 signature: b30231aa04431d338ff7405e6d3fd51a ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Assign transformation.
") SetTransformation;
		virtual void SetTransformation(const gp_Trsf & theTrsf);

		/****** Graphic3d_Group::Structure ******/
		/****** md5 signature: 81c8bb8d3594116a073834f280567560 ******/
		%feature("compactdefaultargs") Structure;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Structure>

Description
-----------
Returns the structure containing the group <self>.
") Structure;
		opencascade::handle<Graphic3d_Structure> Structure();

		/****** Graphic3d_Group::SynchronizeAspects ******/
		/****** md5 signature: bdb913d6b6228a4dc1b27616e05ced5a ******/
		%feature("compactdefaultargs") SynchronizeAspects;
		%feature("autodoc", "Return
-------
None

Description
-----------
Update presentation aspects after their modification.
") SynchronizeAspects;
		virtual void SynchronizeAspects();

		/****** Graphic3d_Group::Text ******/
		/****** md5 signature: 006a7e3c02d0a65ae8f172d981fdefec ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
AText: char *
APoint: Graphic3d_Vertex
AHeight: double
AAngle: double
ATp: Graphic3d_TextPath
AHta: Graphic3d_HorizontalTextAlignment
AVta: Graphic3d_VerticalTextAlignment
EvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Text;
		virtual void Text(const char * const AText, const Graphic3d_Vertex & APoint, const double AHeight, const double AAngle, const Graphic3d_TextPath ATp, const Graphic3d_HorizontalTextAlignment AHta, const Graphic3d_VerticalTextAlignment AVta, const bool EvalMinMax = true);

		/****** Graphic3d_Group::Text ******/
		/****** md5 signature: 6a7f8a909037ff0eda35422b98dd99bc ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
AText: char *
APoint: Graphic3d_Vertex
AHeight: double
EvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Text;
		void Text(const char * const AText, const Graphic3d_Vertex & APoint, const double AHeight, const bool EvalMinMax = true);

		/****** Graphic3d_Group::Text ******/
		/****** md5 signature: 7e16bbc5bf73cd95a372876006bc3db6 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
AText: str
APoint: Graphic3d_Vertex
AHeight: double
AAngle: double
ATp: Graphic3d_TextPath
AHta: Graphic3d_HorizontalTextAlignment
AVta: Graphic3d_VerticalTextAlignment
EvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Text;
		void Text(TCollection_ExtendedString AText, const Graphic3d_Vertex & APoint, const double AHeight, const double AAngle, const Graphic3d_TextPath ATp, const Graphic3d_HorizontalTextAlignment AHta, const Graphic3d_VerticalTextAlignment AVta, const bool EvalMinMax = true);

		/****** Graphic3d_Group::Text ******/
		/****** md5 signature: bfcb9b00fd724fc5cf219b256fbb9ff6 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
AText: str
APoint: Graphic3d_Vertex
AHeight: double
EvalMinMax: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Text;
		void Text(TCollection_ExtendedString AText, const Graphic3d_Vertex & APoint, const double AHeight, const bool EvalMinMax = true);

		/****** Graphic3d_Group::Text ******/
		/****** md5 signature: 0eb292163ac00b5e5ace47c60f1ab605 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
theTextUtf: char *
theOrientation: gp_Ax2
theHeight: double
theAngle: double
theTp: Graphic3d_TextPath
theHTA: Graphic3d_HorizontalTextAlignment
theVTA: Graphic3d_VerticalTextAlignment
theToEvalMinMax: bool (optional, default to true)
theHasOwnAnchor: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Text;
		virtual void Text(const char * const theTextUtf, const gp_Ax2 & theOrientation, const double theHeight, const double theAngle, const Graphic3d_TextPath theTp, const Graphic3d_HorizontalTextAlignment theHTA, const Graphic3d_VerticalTextAlignment theVTA, const bool theToEvalMinMax = true, const bool theHasOwnAnchor = true);

		/****** Graphic3d_Group::Text ******/
		/****** md5 signature: 447b1fa7db31e3dfc2d98b4a44b044e5 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "
Parameters
----------
theText: str
theOrientation: gp_Ax2
theHeight: double
theAngle: double
theTp: Graphic3d_TextPath
theHTA: Graphic3d_HorizontalTextAlignment
theVTA: Graphic3d_VerticalTextAlignment
theToEvalMinMax: bool (optional, default to true)
theHasOwnAnchor: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Text;
		virtual void Text(TCollection_ExtendedString theText, const gp_Ax2 & theOrientation, const double theHeight, const double theAngle, const Graphic3d_TextPath theTp, const Graphic3d_HorizontalTextAlignment theHTA, const Graphic3d_VerticalTextAlignment theVTA, const bool theToEvalMinMax = true, const bool theHasOwnAnchor = true);

		/****** Graphic3d_Group::TransformPersistence ******/
		/****** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ******/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TransformPers>

Description
-----------
Return transformation persistence.
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****** Graphic3d_Group::Transformation ******/
		/****** md5 signature: 4340f0c35d6856faf6f9daeca03f9595 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return transformation.
") Transformation;
		const gp_Trsf Transformation();

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
		/****** Graphic3d_HatchStyle::Graphic3d_HatchStyle ******/
		/****** md5 signature: fcfca120b17f6cffb59f0865a47ae202 ******/
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "
Parameters
----------
thePattern: Image_PixMap

Return
-------
None

Description
-----------
Creates a new custom hatch style with the given pattern and unique style id @warning Raises a program error if given pattern image is not a valid 32*32 bitmap.
") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle(const opencascade::handle<Image_PixMap> & thePattern);

		/****** Graphic3d_HatchStyle::Graphic3d_HatchStyle ******/
		/****** md5 signature: dc1a1adbb2417ab3893a3b23a73a2d32 ******/
		%feature("compactdefaultargs") Graphic3d_HatchStyle;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_HatchStyle

Return
-------
None

Description
-----------
Creates a new predefined hatch style with the given id in Aspect_HatchStyle enum. GPU memory for the pattern will not be allocated.
") Graphic3d_HatchStyle;
		 Graphic3d_HatchStyle(const Aspect_HatchStyle theType);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_HatchStyle::HatchType ******/
		/****** md5 signature: f3e967edc77109cad2b0352bbd8a0ad0 ******/
		%feature("compactdefaultargs") HatchType;
		%feature("autodoc", "Return
-------
int

Description
-----------
In case if predefined OCCT style is used, returns index in Aspect_HatchStyle enumeration. If the style is custom, returns unique index of the style.
") HatchType;
		int HatchType();

		/****** Graphic3d_HatchStyle::Pattern ******/
		/****** md5 signature: 7333c36002b73de6149b68a8b0065229 ******/
		%feature("compactdefaultargs") Pattern;
		%feature("autodoc", "Return
-------
uint8_t *

Description
-----------
Returns the pattern of custom hatch style.
") Pattern;
		const uint8_t * Pattern();

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
		/****** Graphic3d_Layer::Add ******/
		/****** md5 signature: f8102d9cd5b98e7ee99c4e8df4a9e9bf ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theStruct: Graphic3d_CStructure *
thePriority: Graphic3d_DisplayPriority
isForChangePriority: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const Graphic3d_CStructure * theStruct, Graphic3d_DisplayPriority thePriority, bool isForChangePriority = false);

		/****** Graphic3d_Layer::Append ******/
		/****** md5 signature: 9b08207e2d8e90c56bc8306357e36cc2 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_Layer

Return
-------
bool

Description
-----------
Append layer of acceptable type (with similar number of priorities or less). Returns false if the list can not be accepted.
") Append;
		bool Append(const Graphic3d_Layer & theOther);

		/****** Graphic3d_Layer::ArrayOfStructures ******/
		/****** md5 signature: ef8aba76a7ca6f293f49290963a7477e ******/
		%feature("compactdefaultargs") ArrayOfStructures;
		%feature("autodoc", "Return
-------
Graphic3d_ArrayOfIndexedMapOfStructure

Description
-----------
Returns array of structures.
") ArrayOfStructures;
		const Graphic3d_ArrayOfIndexedMapOfStructure & ArrayOfStructures();

		/****** Graphic3d_Layer::BoundingBox ******/
		/****** md5 signature: 321f58ff6c6427afb49d13e1c9aec608 ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "
Parameters
----------
theViewId: int
theCamera: Graphic3d_Camera
theWindowWidth: int
theWindowHeight: int
theToIncludeAuxiliary: bool

Return
-------
Bnd_Box

Description
-----------
Returns layer bounding box. 
Parameter theViewId view index to consider View Affinity in structure 
Parameter theCamera camera definition 
Parameter theWindowWidth viewport width (for applying transformation-persistence) 
Parameter theWindowHeight viewport height (for applying transformation-persistence) 
Parameter theToIncludeAuxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) 
Return: computed bounding box.
") BoundingBox;
		Bnd_Box BoundingBox(int theViewId, const opencascade::handle<Graphic3d_Camera> & theCamera, int theWindowWidth, int theWindowHeight, bool theToIncludeAuxiliary);

		/****** Graphic3d_Layer::CullableStructuresBVH ******/
		/****** md5 signature: 60ec6c782e60ccf43b3cc5b479341c0e ******/
		%feature("compactdefaultargs") CullableStructuresBVH;
		%feature("autodoc", "Return
-------
Graphic3d_BvhCStructureSet

Description
-----------
Returns set of Graphic3d_CStructures structures for building BVH tree.
") CullableStructuresBVH;
		const Graphic3d_BvhCStructureSet & CullableStructuresBVH();

		/****** Graphic3d_Layer::CullableTrsfPersStructuresBVH ******/
		/****** md5 signature: 5e076cad1e27fea5cee8db2320d707c1 ******/
		%feature("compactdefaultargs") CullableTrsfPersStructuresBVH;
		%feature("autodoc", "Return
-------
Graphic3d_BvhCStructureSetTrsfPers

Description
-----------
Returns set of transform persistent Graphic3d_CStructures for building BVH tree.
") CullableTrsfPersStructuresBVH;
		const Graphic3d_BvhCStructureSetTrsfPers & CullableTrsfPersStructuresBVH();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Layer::InvalidateBVHData ******/
		/****** md5 signature: 2fc22393f4d4ca2ae42c7f6212a1152a ******/
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks BVH tree for given priority list as dirty and marks primitive set for rebuild.
") InvalidateBVHData;
		void InvalidateBVHData();

		/****** Graphic3d_Layer::InvalidateBoundingBox ******/
		/****** md5 signature: 134d1ff4127e86b51d809ffbbe1c1cd3 ******/
		%feature("compactdefaultargs") InvalidateBoundingBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks cached bounding box as obsolete.
") InvalidateBoundingBox;
		void InvalidateBoundingBox();

		/****** Graphic3d_Layer::IsCulled ******/
		/****** md5 signature: a84f045efd889fe7503c666a795c890b ******/
		%feature("compactdefaultargs") IsCulled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if layer is empty or has been discarded entirely by culling test.
") IsCulled;
		bool IsCulled();

		/****** Graphic3d_Layer::IsImmediate ******/
		/****** md5 signature: b1c2b3fe3127931d882e81ff690c0349 ******/
		%feature("compactdefaultargs") IsImmediate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if layer was marked with immediate flag.
") IsImmediate;
		bool IsImmediate();

		/****** Graphic3d_Layer::LayerId ******/
		/****** md5 signature: 4f3c96277ad1ad37bbea41df7a98d1f6 ******/
		%feature("compactdefaultargs") LayerId;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerId

Description
-----------
Return layer id.
") LayerId;
		Graphic3d_ZLayerId LayerId();

		/****** Graphic3d_Layer::LayerSettings ******/
		/****** md5 signature: 77eff82582831e6aef7199e37c0feb22 ******/
		%feature("compactdefaultargs") LayerSettings;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerSettings

Description
-----------
Returns settings of the layer object.
") LayerSettings;
		const Graphic3d_ZLayerSettings & LayerSettings();

		/****** Graphic3d_Layer::NbOfTransformPersistenceObjects ******/
		/****** md5 signature: a2717e2d019dc098ba68a0fe8523ebff ******/
		%feature("compactdefaultargs") NbOfTransformPersistenceObjects;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of transform persistence objects.
") NbOfTransformPersistenceObjects;
		int NbOfTransformPersistenceObjects();

		/****** Graphic3d_Layer::NbPriorities ******/
		/****** md5 signature: 2513a2ac30f3a4e8c37c42a4c5938ff4 ******/
		%feature("compactdefaultargs") NbPriorities;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of available priority levels.
") NbPriorities;
		int NbPriorities();

		/****** Graphic3d_Layer::NbStructures ******/
		/****** md5 signature: bc79c84bb50c31b2bf5d217f41d9cffc ******/
		%feature("compactdefaultargs") NbStructures;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return: the number of structures.
") NbStructures;
		int NbStructures();

		/****** Graphic3d_Layer::NbStructuresNotCulled ******/
		/****** md5 signature: 8bfa45de16896c367fe02921de7183a9 ******/
		%feature("compactdefaultargs") NbStructuresNotCulled;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of NOT culled structures in the layer.
") NbStructuresNotCulled;
		int NbStructuresNotCulled();

		/****** Graphic3d_Layer::NonCullableStructures ******/
		/****** md5 signature: 38e7d008dfded361055484ef1e53d42e ******/
		%feature("compactdefaultargs") NonCullableStructures;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap< Graphic3d_CStructure *>

Description
-----------
Returns indexed map of always rendered structures.
") NonCullableStructures;
		const NCollection_IndexedMap<const Graphic3d_CStructure *> & NonCullableStructures();

		/****** Graphic3d_Layer::Remove ******/
		/****** md5 signature: 488f6d71cfb781aa52a9df67828329b7 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theStruct: Graphic3d_CStructure *
isForChangePriority: bool (optional, default to false)

Return
-------
thePriority: Graphic3d_DisplayPriority

Description
-----------
Remove structure and returns its priority, if the structure is not found, method returns negative value.
") Remove;
		bool Remove(const Graphic3d_CStructure * theStruct, Graphic3d_DisplayPriority &OutValue, bool isForChangePriority = false);

		/****** Graphic3d_Layer::SetLayerSettings ******/
		/****** md5 signature: 6813e1662f9cf34807e9b6113ac4bcc6 ******/
		%feature("compactdefaultargs") SetLayerSettings;
		%feature("autodoc", "
Parameters
----------
theSettings: Graphic3d_ZLayerSettings

Return
-------
None

Description
-----------
Sets settings of the layer object.
") SetLayerSettings;
		void SetLayerSettings(const Graphic3d_ZLayerSettings & theSettings);

		/****** Graphic3d_Layer::Structures ******/
		/****** md5 signature: d812fd497207a891f829877dc6b77a6e ******/
		%feature("compactdefaultargs") Structures;
		%feature("autodoc", "
Parameters
----------
thePriority: Graphic3d_DisplayPriority

Return
-------
NCollection_IndexedMap< Graphic3d_CStructure *>

Description
-----------
Returns structures for specified priority.
") Structures;
		const NCollection_IndexedMap<const Graphic3d_CStructure *> & Structures(Graphic3d_DisplayPriority thePriority);

		/****** Graphic3d_Layer::UpdateCulling ******/
		/****** md5 signature: 94ca08b2bf2d4b0097a7171fae0994ac ******/
		%feature("compactdefaultargs") UpdateCulling;
		%feature("autodoc", "
Parameters
----------
theViewId: int
theSelector: Graphic3d_CullingTool
theFrustumCullingState: Graphic3d_RenderingParams::FrustumCulling

Return
-------
None

Description
-----------
Update culling state - should be called before rendering. Traverses through BVH tree to determine which structures are in view volume.
") UpdateCulling;
		void UpdateCulling(int theViewId, const Graphic3d_CullingTool & theSelector, const Graphic3d_RenderingParams::FrustumCulling theFrustumCullingState);

		/****** Graphic3d_Layer::considerZoomPersistenceObjects ******/
		/****** md5 signature: 2766b4efb71311e1c372bc2170f088e8 ******/
		%feature("compactdefaultargs") considerZoomPersistenceObjects;
		%feature("autodoc", "
Parameters
----------
theViewId: int
theCamera: Graphic3d_Camera
theWindowWidth: int
theWindowHeight: int

Return
-------
double

Description
-----------
Returns zoom-scale factor.
") considerZoomPersistenceObjects;
		double considerZoomPersistenceObjects(int theViewId, const opencascade::handle<Graphic3d_Camera> & theCamera, int theWindowWidth, int theWindowHeight);

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
	IterationFilter_ExcludeNoShadow = 8,
	IterationFilter_ExcludeDisabledAndAmbient = IterationFilter_ExcludeAmbient | IterationFilter_ExcludeDisabled,
	IterationFilter_ActiveShadowCasters = IterationFilter_ExcludeDisabledAndAmbient | IterationFilter_ExcludeNoShadow,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IterationFilter(IntEnum):
	IterationFilter_None = 0
	IterationFilter_ExcludeAmbient = 2
	IterationFilter_ExcludeDisabled = 4
	IterationFilter_ExcludeNoShadow = 8
	IterationFilter_ExcludeDisabledAndAmbient = IterationFilter_ExcludeAmbient | IterationFilter_ExcludeDisabled
	IterationFilter_ActiveShadowCasters = IterationFilter_ExcludeDisabledAndAmbient | IterationFilter_ExcludeNoShadow
IterationFilter_None = IterationFilter.IterationFilter_None
IterationFilter_ExcludeAmbient = IterationFilter.IterationFilter_ExcludeAmbient
IterationFilter_ExcludeDisabled = IterationFilter.IterationFilter_ExcludeDisabled
IterationFilter_ExcludeNoShadow = IterationFilter.IterationFilter_ExcludeNoShadow
IterationFilter_ExcludeDisabledAndAmbient = IterationFilter.IterationFilter_ExcludeDisabledAndAmbient
IterationFilter_ActiveShadowCasters = IterationFilter.IterationFilter_ActiveShadowCasters
};
/* end python proxy for enums */

		/****** Graphic3d_LightSet::Graphic3d_LightSet ******/
		/****** md5 signature: f1fa4a2d1fa9fa24f50a84f14f029c24 ******/
		%feature("compactdefaultargs") Graphic3d_LightSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_LightSet;
		 Graphic3d_LightSet();

		/****** Graphic3d_LightSet::Add ******/
		/****** md5 signature: df53a1be575b51debbd38c9570aecf1d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theLight: Graphic3d_CLight

Return
-------
bool

Description
-----------
Append new light source.
") Add;
		bool Add(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****** Graphic3d_LightSet::AmbientColor ******/
		/****** md5 signature: 085d64a17f775904bcf072bfa30e94d6 ******/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "Return
-------
NCollection_Vec4<float>

Description
-----------
Returns cumulative ambient color, which is computed as sum of all enabled ambient light sources. Values are NOT clamped (can be greater than 1.0f) and alpha component is fixed to 1.0f. 
See also: UpdateRevision().
") AmbientColor;
		const NCollection_Vec4<float> & AmbientColor();

		/****** Graphic3d_LightSet::Contains ******/
		/****** md5 signature: b2ec3c80b1062e074cb4d6b5d131ce78 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theLight: Graphic3d_CLight

Return
-------
bool

Description
-----------
Return True if light source is defined in this set.
") Contains;
		bool Contains(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****** Graphic3d_LightSet::Extent ******/
		/****** md5 signature: 5ab265087cc74fd902b499a31008b06c ******/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of light sources.
") Extent;
		int Extent();

		/****** Graphic3d_LightSet::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if lights list is empty.
") IsEmpty;
		bool IsEmpty();

		/****** Graphic3d_LightSet::KeyEnabledLong ******/
		/****** md5 signature: daad6128aa16c8c7ca6093b32c70f88e ******/
		%feature("compactdefaultargs") KeyEnabledLong;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string defining a list of enabled light sources as concatenation of letters 'd' (Directional), 'p' (Point), 's' (Spot) depending on the type of light source in the list. Example: 'dppp'. 
See also: UpdateRevision().
") KeyEnabledLong;
		const TCollection_AsciiString & KeyEnabledLong();

		/****** Graphic3d_LightSet::KeyEnabledShort ******/
		/****** md5 signature: 60cb0cca9e6d8d2f31105c94dbfdcfda ******/
		%feature("compactdefaultargs") KeyEnabledShort;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a string defining a list of enabled light sources as concatenation of letters 'd' (Directional), 'p' (Point), 's' (Spot) depending on the type of light source in the list, specified only once. Example: 'dp'. 
See also: UpdateRevision().
") KeyEnabledShort;
		const TCollection_AsciiString & KeyEnabledShort();

		/****** Graphic3d_LightSet::Lower ******/
		/****** md5 signature: e7b7bea2ce08b27d2e1e90686c8e2356 ******/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return lower light index.
") Lower;
		int Lower();

		/****** Graphic3d_LightSet::NbCastShadows ******/
		/****** md5 signature: fab55a0a2dd70d167d226fa4cd2edb3f ******/
		%feature("compactdefaultargs") NbCastShadows;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total amount of enabled lights castings shadows. 
See also: UpdateRevision().
") NbCastShadows;
		int NbCastShadows();

		/****** Graphic3d_LightSet::NbEnabled ******/
		/****** md5 signature: 8a5067b06755db5c121af338dfbd73f9 ******/
		%feature("compactdefaultargs") NbEnabled;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns total amount of enabled lights EXCLUDING ambient. 
See also: UpdateRevision().
") NbEnabled;
		int NbEnabled();

		/****** Graphic3d_LightSet::NbEnabledLightsOfType ******/
		/****** md5 signature: ba21239a2c3ff6a1bee844c8299016c4 ******/
		%feature("compactdefaultargs") NbEnabledLightsOfType;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfLightSource

Return
-------
int

Description
-----------
Returns total amount of enabled lights of specified type. 
See also: UpdateRevision().
") NbEnabledLightsOfType;
		int NbEnabledLightsOfType(Graphic3d_TypeOfLightSource theType);

		/****** Graphic3d_LightSet::NbLightsOfType ******/
		/****** md5 signature: eb6bdb3a8f8935baf611cf3ed1e3a39e ******/
		%feature("compactdefaultargs") NbLightsOfType;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfLightSource

Return
-------
int

Description
-----------
Returns total amount of lights of specified type.
") NbLightsOfType;
		int NbLightsOfType(Graphic3d_TypeOfLightSource theType);

		/****** Graphic3d_LightSet::Remove ******/
		/****** md5 signature: 8a803e9f01f5c3e558b205c4de4b4704 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theLight: Graphic3d_CLight

Return
-------
bool

Description
-----------
Remove light source.
") Remove;
		bool Remove(const opencascade::handle<Graphic3d_CLight> & theLight);

		/****** Graphic3d_LightSet::Revision ******/
		/****** md5 signature: f614c1dea38767c7173b5e8c78d73993 ******/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Return light sources revision. 
See also: UpdateRevision().
") Revision;
		size_t Revision();

		/****** Graphic3d_LightSet::UpdateRevision ******/
		/****** md5 signature: 9af804b05a504c1ecebca1a4ad285e4a ******/
		%feature("compactdefaultargs") UpdateRevision;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
No available documentation.
") UpdateRevision;
		size_t UpdateRevision();

		/****** Graphic3d_LightSet::Upper ******/
		/****** md5 signature: ddcdb4664c4dc21d38622f88e622db4f ******/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return upper light index.
") Upper;
		int Upper();

		/****** Graphic3d_LightSet::Value ******/
		/****** md5 signature: 2add60943d7b3da7f4b3c4b15057e70e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
opencascade::handle<Graphic3d_CLight>

Description
-----------
Return the light source for specified index within range [Lower(), Upper()].
") Value;
		const opencascade::handle<Graphic3d_CLight> & Value(int theIndex);

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
		/****** Graphic3d_MarkerImage::Graphic3d_MarkerImage ******/
		/****** md5 signature: d3ac2496cb00be3c17e763f95b6979e4 ******/
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "
Parameters
----------
theImage: Image_PixMap
theImageAlpha: Image_PixMap (optional, default to opencascade::handle<Image_PixMap>())

Return
-------
None

Description
-----------
Constructor from existing pixmap. 
Input parameter: theImage source image 
Input parameter: theImageAlpha colorless image.
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage(const opencascade::handle<Image_PixMap> & theImage, const opencascade::handle<Image_PixMap> & theImageAlpha = opencascade::handle<Image_PixMap>());

		/****** Graphic3d_MarkerImage::Graphic3d_MarkerImage ******/
		/****** md5 signature: a3b04cf1cc3d616ede09740f64df21e3 ******/
		%feature("compactdefaultargs") Graphic3d_MarkerImage;
		%feature("autodoc", "
Parameters
----------
theBitMap: TColStd_HArray1OfByte
theWidth: int
theHeight: int

Return
-------
None

Description
-----------
Creates marker image from array of bytes (method for compatibility with old markers definition). 
Input parameter: theBitMap source bitmap stored as array of bytes 
Input parameter: theWidth number of bits in a row 
Input parameter: theHeight number of bits in a column.
") Graphic3d_MarkerImage;
		 Graphic3d_MarkerImage(const opencascade::handle<TColStd_HArray1OfByte> & theBitMap, const int theWidth, const int theHeight);

		/****** Graphic3d_MarkerImage::GetBitMapArray ******/
		/****** md5 signature: bf4888154232db149e4f6982434c2b23 ******/
		%feature("compactdefaultargs") GetBitMapArray;
		%feature("autodoc", "
Parameters
----------
theAlphaValue: double (optional, default to 0.5)
theIsTopDown: bool (optional, default to false)

Return
-------
opencascade::handle<TColStd_HArray1OfByte>

Description
-----------
Return marker image as array of bytes. If an instance of the class has been initialized with image, it will be converted to bitmap based on the parameter theAlphaValue. 
Parameter theAlphaValue pixels in the image that have alpha value greater than  or equal to this parameter will be stored in bitmap as '1',  others will be stored as '0' 
Input parameter: theIsTopDown flag indicating expected rows order in returned bitmap, which is bottom-up by default.
") GetBitMapArray;
		opencascade::handle<TColStd_HArray1OfByte> GetBitMapArray(const double theAlphaValue = 0.5, const bool theIsTopDown = false);

		/****** Graphic3d_MarkerImage::GetImage ******/
		/****** md5 signature: 7c5ebfa0efa07e00e52abb3fc0528025 ******/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Return marker image. If an instance of the class has been initialized with a bitmap, it will be converted to image.
") GetImage;
		const opencascade::handle<Image_PixMap> & GetImage();

		/****** Graphic3d_MarkerImage::GetImageAlpha ******/
		/****** md5 signature: b0e6060aafe710fcaa00bf6675fccfe4 ******/
		%feature("compactdefaultargs") GetImageAlpha;
		%feature("autodoc", "Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Return image alpha as grayscale image. Note that if an instance of the class has been initialized with a bitmap or with grayscale image this method will return exactly the same image as GetImage().
") GetImageAlpha;
		const opencascade::handle<Image_PixMap> & GetImageAlpha();

		/****** Graphic3d_MarkerImage::GetImageAlphaId ******/
		/****** md5 signature: 7b5ae989b5c104ce2610c4c118e2ae01 ******/
		%feature("compactdefaultargs") GetImageAlphaId;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return an unique ID. This ID will be used to manage resource in graphic driver.
") GetImageAlphaId;
		const TCollection_AsciiString & GetImageAlphaId();

		/****** Graphic3d_MarkerImage::GetImageId ******/
		/****** md5 signature: 602256488e6c98131d81feb766841aac ******/
		%feature("compactdefaultargs") GetImageId;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return an unique ID. This ID will be used to manage resource in graphic driver.
") GetImageId;
		const TCollection_AsciiString & GetImageId();

		/****** Graphic3d_MarkerImage::GetTextureSize ******/
		/****** md5 signature: 6acf472b14ee393808839445fda6bc20 ******/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
theWidth: int
theHeight: int

Description
-----------
Return texture size.
") GetTextureSize;
		void GetTextureSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Graphic3d_MarkerImage::IsColoredImage ******/
		/****** md5 signature: 6d8b2537eda1816475d431cea851a65c ******/
		%feature("compactdefaultargs") IsColoredImage;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if marker image has colors (e.g. RGBA and not grayscale).
") IsColoredImage;
		bool IsColoredImage();

		/****** Graphic3d_MarkerImage::StandardMarker ******/
		/****** md5 signature: 93ee783a2ecedec4698333bc1dd0d6a4 ******/
		%feature("compactdefaultargs") StandardMarker;
		%feature("autodoc", "
Parameters
----------
theMarkerType: Aspect_TypeOfMarker
theScale: float
theColor: NCollection_Vec4<float>

Return
-------
opencascade::handle<Graphic3d_MarkerImage>

Description
-----------
Returns a marker image for the marker of the specified type, scale and color.
") StandardMarker;
		static opencascade::handle<Graphic3d_MarkerImage> StandardMarker(const Aspect_TypeOfMarker theMarkerType, const float theScale, const NCollection_Vec4<float> & theColor);

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
		/****** Graphic3d_MaterialAspect::Graphic3d_MaterialAspect ******/
		/****** md5 signature: f65a0596643873ad9942f8a59f366520 ******/
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a material from default values.
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect();

		/****** Graphic3d_MaterialAspect::Graphic3d_MaterialAspect ******/
		/****** md5 signature: b21c8dcad98059d7147f4fa75b4a1d23 ******/
		%feature("compactdefaultargs") Graphic3d_MaterialAspect;
		%feature("autodoc", "
Parameters
----------
theName: Graphic3d_NameOfMaterial

Return
-------
None

Description
-----------
Creates a generic material.
") Graphic3d_MaterialAspect;
		 Graphic3d_MaterialAspect(const Graphic3d_NameOfMaterial theName);

		/****** Graphic3d_MaterialAspect::Alpha ******/
		/****** md5 signature: 14dfc0690bd25318a4a7266d8b79052b ******/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the alpha coefficient of the surface (1.0 - Transparency); 1.0 means opaque.
") Alpha;
		float Alpha();

		/****** Graphic3d_MaterialAspect::AmbientColor ******/
		/****** md5 signature: e4a244c2e5729c893bef272554a0e36f ******/
		%feature("compactdefaultargs") AmbientColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the ambient color of the surface.
") AmbientColor;
		const Quantity_Color & AmbientColor();

		/****** Graphic3d_MaterialAspect::BSDF ******/
		/****** md5 signature: 0e4f43101c28e33adbb6ee92a6718d50 ******/
		%feature("compactdefaultargs") BSDF;
		%feature("autodoc", "Return
-------
Graphic3d_BSDF

Description
-----------
Returns BSDF (bidirectional scattering distribution function).
") BSDF;
		const Graphic3d_BSDF & BSDF();

		/****** Graphic3d_MaterialAspect::Color ******/
		/****** md5 signature: 7cec116411eb20e52d1fabf3015346da ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the diffuse color of the surface. WARNING! This method does NOT return color for Graphic3d_MATERIAL_ASPECT material (color is defined by Graphic3d_Aspects::InteriorColor()).
") Color;
		const Quantity_Color & Color();

		/****** Graphic3d_MaterialAspect::DiffuseColor ******/
		/****** md5 signature: 446509545f5afda1c3e3353ec03d6c00 ******/
		%feature("compactdefaultargs") DiffuseColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the diffuse color of the surface.
") DiffuseColor;
		const Quantity_Color & DiffuseColor();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_MaterialAspect::EmissiveColor ******/
		/****** md5 signature: 8e2c00d43bcbb308aeca1ba33f04a139 ******/
		%feature("compactdefaultargs") EmissiveColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the emissive color of the surface.
") EmissiveColor;
		const Quantity_Color & EmissiveColor();

		/****** Graphic3d_MaterialAspect::IncreaseShine ******/
		/****** md5 signature: 754a68ab0c4f87f47ce4effb762931b1 ******/
		%feature("compactdefaultargs") IncreaseShine;
		%feature("autodoc", "
Parameters
----------
theDelta: float

Return
-------
None

Description
-----------
Increases or decreases the luminosity. 
Parameter theDelta a signed percentage.
") IncreaseShine;
		void IncreaseShine(const float theDelta);

		/****** Graphic3d_MaterialAspect::IsDifferent ******/
		/****** md5 signature: 44d729fd3d72c53375a12079ecb45e52 ******/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_MaterialAspect

Return
-------
bool

Description
-----------
Returns True if this material differs from specified one.
") IsDifferent;
		bool IsDifferent(const Graphic3d_MaterialAspect & theOther);

		/****** Graphic3d_MaterialAspect::IsEqual ******/
		/****** md5 signature: 4f82b8ba049f7b8676aa381826e4e8ba ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_MaterialAspect

Return
-------
bool

Description
-----------
Returns True if this material is identical to specified one.
") IsEqual;
		bool IsEqual(const Graphic3d_MaterialAspect & theOther);

		/****** Graphic3d_MaterialAspect::MaterialFromName ******/
		/****** md5 signature: 36578cdea670d5cbb4305e219191fc22 ******/
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "
Parameters
----------
theName: char *

Return
-------
theMat: Graphic3d_NameOfMaterial

Description
-----------
Finds the material for specified name. 
Input parameter: theName name to find @param[out] theMat found material 
Return: False if name was unrecognized.
") MaterialFromName;
		static bool MaterialFromName(const char * const theName, Graphic3d_NameOfMaterial &OutValue);

		/****** Graphic3d_MaterialAspect::MaterialFromName ******/
		/****** md5 signature: 8ccfd4a75174b54a031a150a17a5eae2 ******/
		%feature("compactdefaultargs") MaterialFromName;
		%feature("autodoc", "
Parameters
----------
theName: char *

Return
-------
Graphic3d_NameOfMaterial

Description
-----------
Returns the material for specified name or Graphic3d_NameOfMaterial_DEFAULT if name is unknown.
") MaterialFromName;
		static Graphic3d_NameOfMaterial MaterialFromName(const char * const theName);

		/****** Graphic3d_MaterialAspect::MaterialName ******/
		/****** md5 signature: 3f9c8afa8dc7bd0d7f00c25a7b4b0ac0 ******/
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
char *

Description
-----------
Returns the name of the predefined material of specified rank within range [1, NumberOfMaterials()].
") MaterialName;
		static const char * MaterialName(const int theRank);

		/****** Graphic3d_MaterialAspect::MaterialName ******/
		/****** md5 signature: 094fd1791203aaa3391e19408e440ae7 ******/
		%feature("compactdefaultargs") MaterialName;
		%feature("autodoc", "Return
-------
char *

Description
-----------
Returns the given name of this material. This might be:.
") MaterialName;
		const char * MaterialName();

		/****** Graphic3d_MaterialAspect::MaterialType ******/
		/****** md5 signature: b5f9c40a2118a99aa72c6189cbaec975 ******/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
Graphic3d_TypeOfMaterial

Description
-----------
Returns the type of the predefined material of specified rank within range [1, NumberOfMaterials()].
") MaterialType;
		static Graphic3d_TypeOfMaterial MaterialType(const int theRank);

		/****** Graphic3d_MaterialAspect::MaterialType ******/
		/****** md5 signature: a535fdabfcb61ac6089ae7ac4e67bd14 ******/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfMaterial

Description
-----------
Returns material type.
") MaterialType;
		Graphic3d_TypeOfMaterial MaterialType();

		/****** Graphic3d_MaterialAspect::MaterialType ******/
		/****** md5 signature: 58810ffdd09fd96dc7181b569adb9c12 ******/
		%feature("compactdefaultargs") MaterialType;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfMaterial

Return
-------
bool

Description
-----------
Returns True if type of this material is equal to specified type.
") MaterialType;
		bool MaterialType(const Graphic3d_TypeOfMaterial theType);

		/****** Graphic3d_MaterialAspect::Name ******/
		/****** md5 signature: 7b95abe48c4d39c49b4f0fb25727b291 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfMaterial

Description
-----------
Returns the material name (within predefined enumeration).
") Name;
		Graphic3d_NameOfMaterial Name();

		/****** Graphic3d_MaterialAspect::NumberOfMaterials ******/
		/****** md5 signature: cd50ba0e24d7719eec46442a79c5e68d ******/
		%feature("compactdefaultargs") NumberOfMaterials;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of predefined textures.
") NumberOfMaterials;
		static int NumberOfMaterials();

		/****** Graphic3d_MaterialAspect::PBRMaterial ******/
		/****** md5 signature: 11b0baa2ee2b4c812546a5f61cfead63 ******/
		%feature("compactdefaultargs") PBRMaterial;
		%feature("autodoc", "Return
-------
Graphic3d_PBRMaterial

Description
-----------
Returns physically based representation of material.
") PBRMaterial;
		const Graphic3d_PBRMaterial & PBRMaterial();

		/****** Graphic3d_MaterialAspect::ReflectionMode ******/
		/****** md5 signature: c776731cb1590bbd76ccbc77842d49ee ******/
		%feature("compactdefaultargs") ReflectionMode;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfReflection

Return
-------
bool

Description
-----------
Returns True if the reflection mode is active, False otherwise.
") ReflectionMode;
		bool ReflectionMode(const Graphic3d_TypeOfReflection theType);

		/****** Graphic3d_MaterialAspect::RefractionIndex ******/
		/****** md5 signature: b416e248573736d9227bb8296cafe254 ******/
		%feature("compactdefaultargs") RefractionIndex;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the refraction index of the material.
") RefractionIndex;
		float RefractionIndex();

		/****** Graphic3d_MaterialAspect::RequestedName ******/
		/****** md5 signature: fe6f9143f405caf35794a3ef6fa8ed54 ******/
		%feature("compactdefaultargs") RequestedName;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfMaterial

Description
-----------
Returns the material name within predefined enumeration which has been requested (before modifications).
") RequestedName;
		Graphic3d_NameOfMaterial RequestedName();

		/****** Graphic3d_MaterialAspect::Reset ******/
		/****** md5 signature: e3081050d274769a1cd4a93969da94c6 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets the material with the original values according to the material name but leave the current color values untouched for the material of type ASPECT.
") Reset;
		void Reset();

		/****** Graphic3d_MaterialAspect::SetAlpha ******/
		/****** md5 signature: 5856a091a4ed481a014cae098f83bdf3 ******/
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies the alpha coefficient of the surface, where 1.0 is opaque and 0.0 is fully transparent.
") SetAlpha;
		void SetAlpha(float theValue);

		/****** Graphic3d_MaterialAspect::SetAmbientColor ******/
		/****** md5 signature: d846703cfa0eddd0c6b6bbd51fe20b71 ******/
		%feature("compactdefaultargs") SetAmbientColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the ambient color of the surface.
") SetAmbientColor;
		void SetAmbientColor(const Quantity_Color & theColor);

		/****** Graphic3d_MaterialAspect::SetBSDF ******/
		/****** md5 signature: 97077de057f37bb47c74045c23a1223f ******/
		%feature("compactdefaultargs") SetBSDF;
		%feature("autodoc", "
Parameters
----------
theBSDF: Graphic3d_BSDF

Return
-------
None

Description
-----------
Modifies the BSDF (bidirectional scattering distribution function).
") SetBSDF;
		void SetBSDF(const Graphic3d_BSDF & theBSDF);

		/****** Graphic3d_MaterialAspect::SetColor ******/
		/****** md5 signature: 4493bec663df9e92c429e56b9c76a307 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the ambient and diffuse color of the surface. WARNING! Has no effect for Graphic3d_MATERIAL_ASPECT material (color should be set to Graphic3d_Aspects::SetInteriorColor()).
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Graphic3d_MaterialAspect::SetDiffuseColor ******/
		/****** md5 signature: 21aac63ac919b9eb2a7eca4f09279c40 ******/
		%feature("compactdefaultargs") SetDiffuseColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the diffuse color of the surface.
") SetDiffuseColor;
		void SetDiffuseColor(const Quantity_Color & theColor);

		/****** Graphic3d_MaterialAspect::SetEmissiveColor ******/
		/****** md5 signature: 9415dcf0db51ccae64f7c1ae8c719400 ******/
		%feature("compactdefaultargs") SetEmissiveColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the emissive color of the surface.
") SetEmissiveColor;
		void SetEmissiveColor(const Quantity_Color & theColor);

		/****** Graphic3d_MaterialAspect::SetMaterialName ******/
		/****** md5 signature: e0eaa3dfb67d9662b0405487353b4154 ******/
		%feature("compactdefaultargs") SetMaterialName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
The current material become a 'UserDefined' material. Set the name of the 'UserDefined' material.
") SetMaterialName;
		void SetMaterialName(TCollection_AsciiString theName);

		/****** Graphic3d_MaterialAspect::SetMaterialType ******/
		/****** md5 signature: ab421f4a4a9e8596a2d576bdcb2e892a ******/
		%feature("compactdefaultargs") SetMaterialType;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfMaterial

Return
-------
None

Description
-----------
Set material type.
") SetMaterialType;
		void SetMaterialType(const Graphic3d_TypeOfMaterial theType);

		/****** Graphic3d_MaterialAspect::SetPBRMaterial ******/
		/****** md5 signature: 57a79c1118f3c400f690d5b27f4be2e1 ******/
		%feature("compactdefaultargs") SetPBRMaterial;
		%feature("autodoc", "
Parameters
----------
thePBRMaterial: Graphic3d_PBRMaterial

Return
-------
None

Description
-----------
Modifies the physically based representation of material.
") SetPBRMaterial;
		void SetPBRMaterial(const Graphic3d_PBRMaterial & thePBRMaterial);

		/****** Graphic3d_MaterialAspect::SetReflectionModeOff ******/
		/****** md5 signature: 54ab6b720121b4b30907a4a5ec49da13 ******/
		%feature("compactdefaultargs") SetReflectionModeOff;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfReflection

Return
-------
None

Description
-----------
No available documentation.
") SetReflectionModeOff;
		void SetReflectionModeOff(const Graphic3d_TypeOfReflection theType);

		/****** Graphic3d_MaterialAspect::SetRefractionIndex ******/
		/****** md5 signature: 817e4b214218ba96bd9b00e5331acacd ******/
		%feature("compactdefaultargs") SetRefractionIndex;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies the refraction index of the material. Warning: Raises MaterialDefinitionError if given value is a lesser than 1.0.
") SetRefractionIndex;
		void SetRefractionIndex(const float theValue);

		/****** Graphic3d_MaterialAspect::SetShininess ******/
		/****** md5 signature: 017dbf37924bb2836f661236b2944dca ******/
		%feature("compactdefaultargs") SetShininess;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies the luminosity of the surface. Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.
") SetShininess;
		void SetShininess(const float theValue);

		/****** Graphic3d_MaterialAspect::SetSpecularColor ******/
		/****** md5 signature: 64f6579cc62bba02bc4da29b4557b091 ******/
		%feature("compactdefaultargs") SetSpecularColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the specular color of the surface.
") SetSpecularColor;
		void SetSpecularColor(const Quantity_Color & theColor);

		/****** Graphic3d_MaterialAspect::SetTransparency ******/
		/****** md5 signature: d3c1a9b122c27edbaef0b0566db072ce ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Modifies the transparency coefficient of the surface, where 0 is opaque and 1 is fully transparent. Transparency is applicable to materials that have at least one of reflection modes (ambient, diffuse, specular or emissive) enabled. See also SetReflectionModeOn() and SetReflectionModeOff() methods. //! Warning: Raises MaterialDefinitionError if given value is a negative value or greater than 1.0.
") SetTransparency;
		void SetTransparency(const float theValue);

		/****** Graphic3d_MaterialAspect::Shininess ******/
		/****** md5 signature: c896df146d34a9b27e6bdaf5a79f0683 ******/
		%feature("compactdefaultargs") Shininess;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the luminosity of the surface.
") Shininess;
		float Shininess();

		/****** Graphic3d_MaterialAspect::SpecularColor ******/
		/****** md5 signature: 8248d955c130699f6669657101e22663 ******/
		%feature("compactdefaultargs") SpecularColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns the specular color of the surface.
") SpecularColor;
		const Quantity_Color & SpecularColor();

		/****** Graphic3d_MaterialAspect::StringName ******/
		/****** md5 signature: 8107033bd84a45ab4a9514a887a7886e ******/
		%feature("compactdefaultargs") StringName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the given name of this material. This might be: - given name set by method ::SetMaterialName() - standard name for a material within enumeration - 'UserDefined' for non-standard material without name specified externally.
") StringName;
		const TCollection_AsciiString & StringName();

		/****** Graphic3d_MaterialAspect::Transparency ******/
		/****** md5 signature: a88fcf79eb978433a8b2b339ec6d8b52 ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the transparency coefficient of the surface (1.0 - Alpha); 0.0 means opaque.
") Transparency;
		float Transparency();


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

/******************************
* class Graphic3d_PBRMaterial *
******************************/
class Graphic3d_PBRMaterial {
	public:
		/****** Graphic3d_PBRMaterial::Graphic3d_PBRMaterial ******/
		/****** md5 signature: 64dd925225d772eec2f56a6ac286f833 ******/
		%feature("compactdefaultargs") Graphic3d_PBRMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates new physically based material in Metallic-Roughness system. 'metallic' parameter is 0 by default. 'roughness' parameter is 1 by default. 'color' parameter is (0, 0, 0) by default. 'alpha' parameter is 1 by default. 'IOR' parameter is 1.5 by default. 'emission' parameter is (0, 0, 0) by default.
") Graphic3d_PBRMaterial;
		 Graphic3d_PBRMaterial();

		/****** Graphic3d_PBRMaterial::Graphic3d_PBRMaterial ******/
		/****** md5 signature: 188dd61673e5afc8f39b43e588caae9a ******/
		%feature("compactdefaultargs") Graphic3d_PBRMaterial;
		%feature("autodoc", "
Parameters
----------
theBSDF: Graphic3d_BSDF

Return
-------
None

Description
-----------
Creates new physically based material in Metallic-Roughness system from Graphic3d_BSDF.
") Graphic3d_PBRMaterial;
		 Graphic3d_PBRMaterial(const Graphic3d_BSDF & theBSDF);

		/****** Graphic3d_PBRMaterial::Alpha ******/
		/****** md5 signature: 14dfc0690bd25318a4a7266d8b79052b ******/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns alpha component in range [0, 1].
") Alpha;
		float Alpha();

		/****** Graphic3d_PBRMaterial::Color ******/
		/****** md5 signature: 3dcb129093b0c22e4d1f5785248243fd ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Returns albedo color with alpha component of material.
") Color;
		const Quantity_ColorRGBA & Color();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_PBRMaterial::Emission ******/
		/****** md5 signature: 3bd60ac1c325a1acc79b1b7cb2686275 ******/
		%feature("compactdefaultargs") Emission;
		%feature("autodoc", "Return
-------
NCollection_Vec3<float >

Description
-----------
Returns light intensity emitted by material. Values are greater or equal 0.
") Emission;
		NCollection_Vec3<float > Emission();

		/****** Graphic3d_PBRMaterial::GenerateEnvLUT ******/
		/****** md5 signature: ab6e4772a25884134f897d33a68ddf4d ******/
		%feature("compactdefaultargs") GenerateEnvLUT;
		%feature("autodoc", "
Parameters
----------
theLUT: Image_PixMap
theNbIntegralSamples: unsigned int (optional, default to 1024)

Return
-------
None

Description
-----------
Generates 2D look up table of scale and bias for fresnell zero coefficient. It is needed for calculation reflectance part of environment lighting. @param[out] theLUT table storage (must be Image_Format_RGF). 
Input parameter: theNbIntegralSamples number of importance samples in hemisphere integral calculation for every table item.
") GenerateEnvLUT;
		static void GenerateEnvLUT(const opencascade::handle<Image_PixMap> & theLUT, unsigned int theNbIntegralSamples = 1024);

		/****** Graphic3d_PBRMaterial::IOR ******/
		/****** md5 signature: b040e03ec80b84a188a4619fb7a69020 ******/
		%feature("compactdefaultargs") IOR;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns index of refraction in [1, 3] range.
") IOR;
		float IOR();

		/****** Graphic3d_PBRMaterial::Metallic ******/
		/****** md5 signature: 1969c807d8a54237a5596189d6b2dea1 ******/
		%feature("compactdefaultargs") Metallic;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns material's metallic coefficient in [0, 1] range. 1 for metals and 0 for dielectrics. It is preferable to be exactly 0 or 1. Average values are needed for textures mixing in shader.
") Metallic;
		float Metallic();

		/****** Graphic3d_PBRMaterial::MetallicFromSpecular ******/
		/****** md5 signature: c2553289ada4ede6f3b4aced968bad6b ******/
		%feature("compactdefaultargs") MetallicFromSpecular;
		%feature("autodoc", "
Parameters
----------
theSpecular: Quantity_Color

Return
-------
float

Description
-----------
Compute material metallicity from common material (specular color). 
Input parameter: theSpecular specular color 
Return: metallicity within [0..1] range.
") MetallicFromSpecular;
		static float MetallicFromSpecular(const Quantity_Color & theSpecular);

		/****** Graphic3d_PBRMaterial::MinRoughness ******/
		/****** md5 signature: 94e1caf9a5214f4dde6cd3a6ef51bdcf ******/
		%feature("compactdefaultargs") MinRoughness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Roughness cannot be 0 in real calculations, so it returns minimal achievable level of roughness in practice.
") MinRoughness;
		static float MinRoughness();

		/****** Graphic3d_PBRMaterial::NormalizedRoughness ******/
		/****** md5 signature: d40c8dc56130ed0f08b633ab154fbbe1 ******/
		%feature("compactdefaultargs") NormalizedRoughness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns roughness mapping parameter in [0, 1] range. Roughness is defined in [0, 1] for handful material settings and is mapped to [MinRoughness, 1] for calculations.
") NormalizedRoughness;
		float NormalizedRoughness();

		/****** Graphic3d_PBRMaterial::Roughness ******/
		/****** md5 signature: 212613482f1af986f97bed100f79e957 ******/
		%feature("compactdefaultargs") Roughness;
		%feature("autodoc", "
Parameters
----------
theNormalizedRoughness: float

Return
-------
float

Description
-----------
Maps roughness from [0, 1] to [MinRoughness, 1] for calculations.
") Roughness;
		static float Roughness(float theNormalizedRoughness);

		/****** Graphic3d_PBRMaterial::Roughness ******/
		/****** md5 signature: 51aa95defc5b56cbd3da74241ebbaf0d ******/
		%feature("compactdefaultargs") Roughness;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns real value of roughness in [MinRoughness, 1] range for calculations.
") Roughness;
		float Roughness();

		/****** Graphic3d_PBRMaterial::RoughnessFromSpecular ******/
		/****** md5 signature: 3af4c4e3d3252b9be1ef1e8b0e637964 ******/
		%feature("compactdefaultargs") RoughnessFromSpecular;
		%feature("autodoc", "
Parameters
----------
theSpecular: Quantity_Color
theShiness: double

Return
-------
float

Description
-----------
Compute material roughness from common material (specular color + shininess). 
Input parameter: theSpecular specular color 
Input parameter: theShiness normalized shininess coefficient within [0..1] range 
Return: roughness within [0..1] range.
") RoughnessFromSpecular;
		static float RoughnessFromSpecular(const Quantity_Color & theSpecular, const double theShiness);

		/****** Graphic3d_PBRMaterial::SetAlpha ******/
		/****** md5 signature: 895fd0f105d196c36e9aad3c8a53e2ea ******/
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "
Parameters
----------
theAlpha: float

Return
-------
None

Description
-----------
Modifies alpha component.
") SetAlpha;
		void SetAlpha(float theAlpha);

		/****** Graphic3d_PBRMaterial::SetBSDF ******/
		/****** md5 signature: 02fb8f9f231182513d89209ed4badf55 ******/
		%feature("compactdefaultargs") SetBSDF;
		%feature("autodoc", "
Parameters
----------
theBSDF: Graphic3d_BSDF

Return
-------
None

Description
-----------
Generates material in Metallic-Roughness system from Graphic3d_BSDF.
") SetBSDF;
		void SetBSDF(const Graphic3d_BSDF & theBSDF);

		/****** Graphic3d_PBRMaterial::SetColor ******/
		/****** md5 signature: f154347034a6e0870fb5d6aa0e2b3b0a ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA

Return
-------
None

Description
-----------
Modifies albedo color with alpha component.
") SetColor;
		void SetColor(const Quantity_ColorRGBA & theColor);

		/****** Graphic3d_PBRMaterial::SetColor ******/
		/****** md5 signature: 4493bec663df9e92c429e56b9c76a307 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies only albedo color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Graphic3d_PBRMaterial::SetEmission ******/
		/****** md5 signature: f833319d4695a6593419ba8db5bb468b ******/
		%feature("compactdefaultargs") SetEmission;
		%feature("autodoc", "
Parameters
----------
theEmission: NCollection_Vec3<float>

Return
-------
None

Description
-----------
Modifies light intensity emitted by material.
") SetEmission;
		void SetEmission(const NCollection_Vec3<float> & theEmission);

		/****** Graphic3d_PBRMaterial::SetIOR ******/
		/****** md5 signature: 8d09de48019835e577b4a33e20a722e8 ******/
		%feature("compactdefaultargs") SetIOR;
		%feature("autodoc", "
Parameters
----------
theIOR: float

Return
-------
None

Description
-----------
Modifies index of refraction in [1, 3] range. In practice affects only on non-metal materials reflection possibilities.
") SetIOR;
		void SetIOR(float theIOR);

		/****** Graphic3d_PBRMaterial::SetMetallic ******/
		/****** md5 signature: bc43b1760b7487bd6b919a439a7d4511 ******/
		%feature("compactdefaultargs") SetMetallic;
		%feature("autodoc", "
Parameters
----------
theMetallic: float

Return
-------
None

Description
-----------
Modifies metallic coefficient of material in [0, 1] range.
") SetMetallic;
		void SetMetallic(float theMetallic);

		/****** Graphic3d_PBRMaterial::SetRoughness ******/
		/****** md5 signature: 21f1c17f993549f3b8e6707664a1df74 ******/
		%feature("compactdefaultargs") SetRoughness;
		%feature("autodoc", "
Parameters
----------
theRoughness: float

Return
-------
None

Description
-----------
Modifies roughness coefficient of material in [0, 1] range.
") SetRoughness;
		void SetRoughness(float theRoughness);

		/****** Graphic3d_PBRMaterial::SpecIBLMapSamplesFactor ******/
		/****** md5 signature: 570cfec3447ac573b49c885abac96708 ******/
		%feature("compactdefaultargs") SpecIBLMapSamplesFactor;
		%feature("autodoc", "
Parameters
----------
theProbability: float
theRoughness: float

Return
-------
float

Description
-----------
Shows how much times less samples can be used in certain roughness value specular IBL map generation in compare with samples number for map with roughness of 1. Specular IBL maps with less roughness values have higher resolution but require less samples for the same quality of baking. So that reducing samples number is good strategy to improve performance of baking. The samples number for specular IBL map with roughness of 1 (the maximum possible samples number) is expected to be defined as baking parameter. Samples number for other roughness values can be calculated by multiplication origin samples number by this factor. 
Parameter theProbability value from 0 to 1 controlling strength of samples reducing. Bigger values result in slower reduction to provide better quality but worse performance. Value of 1 doesn't affect at all so that 1 will be returned (it can be used to disable reduction strategy). 
Parameter theRoughness roughness value of current generated specular IBL map (from 0 to 1). 
Return: factor to calculate number of samples for current specular IBL map baking. Be aware! It has no obligation to return 1 in case of roughness of 1. Be aware! It produces poor quality with small number of origin samples. In that case it is recommended to be disabled.
") SpecIBLMapSamplesFactor;
		static float SpecIBLMapSamplesFactor(float theProbability, float theRoughness);


%extend{
    bool __eq_wrapper__(const Graphic3d_PBRMaterial other) {
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


%extend Graphic3d_PBRMaterial {
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
		float Factor;
		float Units;
		/****** Graphic3d_PolygonOffset::Graphic3d_PolygonOffset ******/
		/****** md5 signature: d32d266ad893dbdf6f93b0afae8a9bb9 ******/
		%feature("compactdefaultargs") Graphic3d_PolygonOffset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_PolygonOffset;
		 Graphic3d_PolygonOffset();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
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
		/****** Graphic3d_PresentationAttributes::Graphic3d_PresentationAttributes ******/
		/****** md5 signature: 278bc90569b579d12d8d802b786248db ******/
		%feature("compactdefaultargs") Graphic3d_PresentationAttributes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_PresentationAttributes;
		 Graphic3d_PresentationAttributes();

		/****** Graphic3d_PresentationAttributes::BasicFillAreaAspect ******/
		/****** md5 signature: 893da1066ab7497d7a1e4022f39ad6ec ******/
		%feature("compactdefaultargs") BasicFillAreaAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_AspectFillArea3d>

Description
-----------
Return basic presentation fill area aspect, NULL by default. When set, might be used instead of Color() property.
") BasicFillAreaAspect;
		const opencascade::handle<Graphic3d_AspectFillArea3d> & BasicFillAreaAspect();

		/****** Graphic3d_PresentationAttributes::Color ******/
		/****** md5 signature: 7cec116411eb20e52d1fabf3015346da ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Returns basic presentation color, Quantity_NOC_WHITE by default.
") Color;
		const Quantity_Color & Color();

		/****** Graphic3d_PresentationAttributes::ColorRGBA ******/
		/****** md5 signature: 615b6d48d8bc4764a07d0e2ff837764b ******/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Returns basic presentation color (including alpha channel).
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA();

		/****** Graphic3d_PresentationAttributes::DisplayMode ******/
		/****** md5 signature: ac5a0607c42d4a5cb024f9e1f4d5fff9 ******/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns display mode, 0 by default. -1 means undefined (main display mode of presentation to be used).
") DisplayMode;
		int DisplayMode();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_PresentationAttributes::Method ******/
		/****** md5 signature: b302ac4956523d91e861bf2704dd879d ******/
		%feature("compactdefaultargs") Method;
		%feature("autodoc", "Return
-------
Aspect_TypeOfHighlightMethod

Description
-----------
Returns highlight method, Aspect_TOHM_COLOR by default.
") Method;
		Aspect_TypeOfHighlightMethod Method();

		/****** Graphic3d_PresentationAttributes::SetBasicFillAreaAspect ******/
		/****** md5 signature: 9c360396619883e6313847d330724906 ******/
		%feature("compactdefaultargs") SetBasicFillAreaAspect;
		%feature("autodoc", "
Parameters
----------
theAspect: Graphic3d_AspectFillArea3d

Return
-------
None

Description
-----------
Sets basic presentation fill area aspect.
") SetBasicFillAreaAspect;
		virtual void SetBasicFillAreaAspect(const opencascade::handle<Graphic3d_AspectFillArea3d> & theAspect);

		/****** Graphic3d_PresentationAttributes::SetColor ******/
		/****** md5 signature: 00f0a4e343c1e144a6992078bccbe32c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets basic presentation color (RGB components, does not modifies transparency).
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****** Graphic3d_PresentationAttributes::SetDisplayMode ******/
		/****** md5 signature: 6d2a0204ab647b8b92a13598267b62a9 ******/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Sets display mode.
") SetDisplayMode;
		virtual void SetDisplayMode(const int theMode);

		/****** Graphic3d_PresentationAttributes::SetMethod ******/
		/****** md5 signature: b7b1fb8e3db7c212dfca06ddad4bd2fa ******/
		%feature("compactdefaultargs") SetMethod;
		%feature("autodoc", "
Parameters
----------
theMethod: Aspect_TypeOfHighlightMethod

Return
-------
None

Description
-----------
Changes highlight method to the given one.
") SetMethod;
		virtual void SetMethod(const Aspect_TypeOfHighlightMethod theMethod);

		/****** Graphic3d_PresentationAttributes::SetTransparency ******/
		/****** md5 signature: 1e0de3d97f284c138601cfb5e476e5b8 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
theTranspCoef: float

Return
-------
None

Description
-----------
Sets basic presentation transparency (0 - opaque, 1 - fully transparent).
") SetTransparency;
		virtual void SetTransparency(const float theTranspCoef);

		/****** Graphic3d_PresentationAttributes::SetZLayer ******/
		/****** md5 signature: ecf007389b4013cc9520dae6bc2141f2 ******/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "
Parameters
----------
theLayer: int

Return
-------
None

Description
-----------
Sets presentation Zlayer.
") SetZLayer;
		virtual void SetZLayer(int theLayer);

		/****** Graphic3d_PresentationAttributes::Transparency ******/
		/****** md5 signature: a88fcf79eb978433a8b2b339ec6d8b52 ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns basic presentation transparency (0 - opaque, 1 - fully transparent), 0 by default (opaque).
") Transparency;
		float Transparency();

		/****** Graphic3d_PresentationAttributes::ZLayer ******/
		/****** md5 signature: 7420fa5788bb824c02345ee38be45933 ******/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerId

Description
-----------
Returns presentation Zlayer, Graphic3d_ZLayerId_Default by default. Graphic3d_ZLayerId_UNKNOWN means undefined (a layer of main presentation to be used).
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
	PerfCounters_Lines = 256,
	PerfCounters_EstimMem = 512,
	PerfCounters_FrameTime = 1024,
	PerfCounters_FrameTimeMax = 2048,
	PerfCounters_SkipImmediate = 4096,
	PerfCounters_Basic = PerfCounters_FrameRate | PerfCounters_CPU | PerfCounters_Layers | PerfCounters_Structures,
	PerfCounters_Extended = PerfCounters_Basic | PerfCounters_Groups | PerfCounters_GroupArrays | PerfCounters_Triangles | PerfCounters_Points | PerfCounters_Lines | PerfCounters_EstimMem,
	PerfCounters_All = PerfCounters_Extended | PerfCounters_FrameTime | PerfCounters_FrameTimeMax,
};

enum FrustumCulling {
	FrustumCulling_Off = 0,
	FrustumCulling_On = 1,
	FrustumCulling_NoUpdate = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
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
	PerfCounters_Lines = 256
	PerfCounters_EstimMem = 512
	PerfCounters_FrameTime = 1024
	PerfCounters_FrameTimeMax = 2048
	PerfCounters_SkipImmediate = 4096
	PerfCounters_Basic = PerfCounters_FrameRate | PerfCounters_CPU | PerfCounters_Layers | PerfCounters_Structures
	PerfCounters_Extended = PerfCounters_Basic | PerfCounters_Groups | PerfCounters_GroupArrays | PerfCounters_Triangles | PerfCounters_Points | PerfCounters_Lines | PerfCounters_EstimMem
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
PerfCounters_Lines = PerfCounters.PerfCounters_Lines
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
		Graphic3d_TypeOfShadingModel ShadingModel;
		Graphic3d_RenderTransparentMethod TransparencyMethod;
		unsigned int Resolution;
		Font_Hinting FontHinting;
		float LineFeather;
		int PbrEnvPow2Size;
		int PbrEnvSpecMapNbLevels;
		int PbrEnvBakingDiffNbSamples;
		int PbrEnvBakingSpecNbSamples;
		float PbrEnvBakingProbability;
		float OitDepthFactor;
		int NbOitDepthPeelingLayers;
		int NbMsaaSamples;
		float RenderResolutionScale;
		int ShadowMapResolution;
		float ShadowMapBias;
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
		bool ToIgnoreNormalMapInRayTracing;
		bool CoherentPathTracingMode;
		bool AdaptiveScreenSampling;
		bool AdaptiveScreenSamplingAtomic;
		bool ShowSamplingTiles;
		bool TwoSidedBsdfModels;
		float RadianceClampingValue;
		bool RebuildRayTracingShaders;
		int RayTracingTileSize;
		int NbRayTracingTiles;
		float CameraApertureRadius;
		float CameraFocalPlaneDist;
		FrustumCulling FrustumCullingState;
		Graphic3d_ToneMappingMethod ToneMappingMethod;
		float Exposure;
		float WhitePoint;
		Graphic3d_StereoMode StereoMode;
		float HmdFov2d;
		Anaglyph AnaglyphFilter;
		NCollection_Mat4<float > AnaglyphLeft;
		NCollection_Mat4<float > AnaglyphRight;
		bool ToReverseStereo;
		bool ToSmoothInterlacing;
		bool ToMirrorComposer;
		opencascade::handle<Graphic3d_TransformPers > StatsPosition;
		opencascade::handle<Graphic3d_TransformPers > ChartPosition;
		opencascade::handle<Graphic3d_AspectText3d > StatsTextAspect;
		float StatsUpdateInterval;
		int StatsTextHeight;
		int StatsNbFrames;
		float StatsMaxChartTime;
		PerfCounters CollectedStats;
		bool ToShowStats;
		/****** Graphic3d_RenderingParams::Graphic3d_RenderingParams ******/
		/****** md5 signature: 604df3cf93dfd3384e91a3c3f46c32b4 ******/
		%feature("compactdefaultargs") Graphic3d_RenderingParams;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates default rendering parameters.
") Graphic3d_RenderingParams;
		 Graphic3d_RenderingParams();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_RenderingParams::ResolutionRatio ******/
		/****** md5 signature: 58205651c5db2ed7ed1af2576bbb1d34 ******/
		%feature("compactdefaultargs") ResolutionRatio;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns resolution ratio.
") ResolutionRatio;
		float ResolutionRatio();

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
		/****** Graphic3d_SequenceOfHClipPlane::Graphic3d_SequenceOfHClipPlane ******/
		/****** md5 signature: dea7065ac573d924d683688d8c6ccbf7 ******/
		%feature("compactdefaultargs") Graphic3d_SequenceOfHClipPlane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_SequenceOfHClipPlane;
		 Graphic3d_SequenceOfHClipPlane();

		/****** Graphic3d_SequenceOfHClipPlane::Append ******/
		/****** md5 signature: 3e9b7d5c84d70e6e8931014728e4bacd ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theItem: Graphic3d_ClipPlane

Return
-------
bool

Description
-----------
Append a plane. 
Return: True if new item has been added (False if item already existed).
") Append;
		bool Append(const opencascade::handle<Graphic3d_ClipPlane> & theItem);

		/****** Graphic3d_SequenceOfHClipPlane::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear the items out.
") Clear;
		void Clear();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_SequenceOfHClipPlane::First ******/
		/****** md5 signature: cc797633cf7616f9dd4c3a09257e2742 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ClipPlane>

Description
-----------
Return the first item in sequence.
") First;
		const opencascade::handle<Graphic3d_ClipPlane> & First();

		/****** Graphic3d_SequenceOfHClipPlane::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if sequence is empty.
") IsEmpty;
		bool IsEmpty();

		/****** Graphic3d_SequenceOfHClipPlane::SetOverrideGlobal ******/
		/****** md5 signature: bc64babd7136193dc1667635d623ec45 ******/
		%feature("compactdefaultargs") SetOverrideGlobal;
		%feature("autodoc", "
Parameters
----------
theToOverride: bool

Return
-------
None

Description
-----------
Setup flag defining if local properties should override global properties.
") SetOverrideGlobal;
		void SetOverrideGlobal(const bool theToOverride);

		/****** Graphic3d_SequenceOfHClipPlane::Size ******/
		/****** md5 signature: 95fd550d1712c017c7cad2fbb2186e09 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of items in sequence.
") Size;
		int Size();

		/****** Graphic3d_SequenceOfHClipPlane::ToOverrideGlobal ******/
		/****** md5 signature: 462c5ef0e186946c354111fbf197420a ******/
		%feature("compactdefaultargs") ToOverrideGlobal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if local properties should override global properties.
") ToOverrideGlobal;
		bool ToOverrideGlobal();

};


%make_alias(Graphic3d_SequenceOfHClipPlane)

%extend Graphic3d_SequenceOfHClipPlane {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Remove(self):
		pass
	}
};

/**********************************
* class Graphic3d_ShaderAttribute *
**********************************/
class Graphic3d_ShaderAttribute : public Standard_Transient {
	public:
		/****** Graphic3d_ShaderAttribute::Graphic3d_ShaderAttribute ******/
		/****** md5 signature: ac60c401f73357877da49c7c5879e543 ******/
		%feature("compactdefaultargs") Graphic3d_ShaderAttribute;
		%feature("autodoc", "
Parameters
----------
theName: str
theLocation: int

Return
-------
None

Description
-----------
Creates new attribute.
") Graphic3d_ShaderAttribute;
		 Graphic3d_ShaderAttribute(TCollection_AsciiString theName, const int theLocation);

		/****** Graphic3d_ShaderAttribute::Location ******/
		/****** md5 signature: fbf2df819f76398dfe948e6957cd938c ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns attribute location to be bound on GLSL program linkage stage.
") Location;
		int Location();

		/****** Graphic3d_ShaderAttribute::Name ******/
		/****** md5 signature: efed61b92683387cd746fb27e0376505 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns name of shader variable.
") Name;
		const TCollection_AsciiString & Name();

};


%make_alias(Graphic3d_ShaderAttribute)

%extend Graphic3d_ShaderAttribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Graphic3d_ShaderManager *
********************************/
class Graphic3d_ShaderManager : public Standard_Transient {
	public:
		/****** Graphic3d_ShaderManager::Graphic3d_ShaderManager ******/
		/****** md5 signature: edfeeb57072df8ac6b8bbe060349c47b ******/
		%feature("compactdefaultargs") Graphic3d_ShaderManager;
		%feature("autodoc", "
Parameters
----------
theGapi: Aspect_GraphicsLibrary

Return
-------
None

Description
-----------
Creates new empty shader manager.
") Graphic3d_ShaderManager;
		 Graphic3d_ShaderManager(Aspect_GraphicsLibrary theGapi);

		/****** Graphic3d_ShaderManager::EnableGlslExtension ******/
		/****** md5 signature: 1565a9dd67aaa4d6dd088e174916e417 ******/
		%feature("compactdefaultargs") EnableGlslExtension;
		%feature("autodoc", "
Parameters
----------
theExt: Graphic3d_GlslExtension
theToEnable: bool (optional, default to true)

Return
-------
None

Description
-----------
Set if specified extension is available or not.
") EnableGlslExtension;
		void EnableGlslExtension(Graphic3d_GlslExtension theExt, bool theToEnable = true);

		/****** Graphic3d_ShaderManager::GapiVersionMajor ******/
		/****** md5 signature: d4a087e1bce89a0b07d6987e56976f59 ******/
		%feature("compactdefaultargs") GapiVersionMajor;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return GAPI version major number.
") GapiVersionMajor;
		int GapiVersionMajor();

		/****** Graphic3d_ShaderManager::GapiVersionMinor ******/
		/****** md5 signature: 9cf4a876151270fd050ff3f65926fc58 ******/
		%feature("compactdefaultargs") GapiVersionMinor;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return GAPI version minor number.
") GapiVersionMinor;
		int GapiVersionMinor();

		/****** Graphic3d_ShaderManager::HasFlatShading ******/
		/****** md5 signature: a51a9477453ff3d09379b95ae7696ad9 ******/
		%feature("compactdefaultargs") HasFlatShading;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag indicating flat shading usage; True by default.
") HasFlatShading;
		bool HasFlatShading();

		/****** Graphic3d_ShaderManager::HasGlslExtension ******/
		/****** md5 signature: 01a7060cef40b7151ed90bed2bb6ebff ******/
		%feature("compactdefaultargs") HasGlslExtension;
		%feature("autodoc", "
Parameters
----------
theExt: Graphic3d_GlslExtension

Return
-------
bool

Description
-----------
Return True if specified extension is available.
") HasGlslExtension;
		bool HasGlslExtension(Graphic3d_GlslExtension theExt);

		/****** Graphic3d_ShaderManager::IsGapiGreaterEqual ******/
		/****** md5 signature: 9aaa92c1a5b4de47e7d9fbf51af7b36b ******/
		%feature("compactdefaultargs") IsGapiGreaterEqual;
		%feature("autodoc", "
Parameters
----------
theVerMajor: int
theVerMinor: int

Return
-------
bool

Description
-----------
Return: true if detected GL version is greater or equal to requested one.
") IsGapiGreaterEqual;
		bool IsGapiGreaterEqual(int theVerMajor, int theVerMinor);

		/****** Graphic3d_ShaderManager::SetEmulateDepthClamp ******/
		/****** md5 signature: 2c1c7d42fdb29063f356221242f1caf1 ******/
		%feature("compactdefaultargs") SetEmulateDepthClamp;
		%feature("autodoc", "
Parameters
----------
theToEmulate: bool

Return
-------
None

Description
-----------
Set if depth clamping should be emulated by GLSL program.
") SetEmulateDepthClamp;
		void SetEmulateDepthClamp(bool theToEmulate);

		/****** Graphic3d_ShaderManager::SetFlatShading ******/
		/****** md5 signature: bab132dee77734acb97a0cdf54af397d ******/
		%feature("compactdefaultargs") SetFlatShading;
		%feature("autodoc", "
Parameters
----------
theToUse: bool
theToReverseSign: bool

Return
-------
None

Description
-----------
Set flag indicating flat shading usage.
") SetFlatShading;
		void SetFlatShading(bool theToUse, bool theToReverseSign);

		/****** Graphic3d_ShaderManager::SetGapiVersion ******/
		/****** md5 signature: 6d1846e4daf7a960fe47878a738657e0 ******/
		%feature("compactdefaultargs") SetGapiVersion;
		%feature("autodoc", "
Parameters
----------
theVerMajor: int
theVerMinor: int

Return
-------
None

Description
-----------
Return GAPI version major number.
") SetGapiVersion;
		void SetGapiVersion(int theVerMajor, int theVerMinor);

		/****** Graphic3d_ShaderManager::SetUseRedAlpha ******/
		/****** md5 signature: 277e2b94c5211c66781ef954a1639590 ******/
		%feature("compactdefaultargs") SetUseRedAlpha;
		%feature("autodoc", "
Parameters
----------
theUseRedAlpha: bool

Return
-------
None

Description
-----------
Set if RED channel should be used instead of ALPHA for single-channel textures.
") SetUseRedAlpha;
		void SetUseRedAlpha(bool theUseRedAlpha);

		/****** Graphic3d_ShaderManager::ToEmulateDepthClamp ******/
		/****** md5 signature: b2141ccb1ef4ecb8bee1dfcfd044bdad ******/
		%feature("compactdefaultargs") ToEmulateDepthClamp;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if depth clamping should be emulated by GLSL program; True by default.
") ToEmulateDepthClamp;
		bool ToEmulateDepthClamp();

		/****** Graphic3d_ShaderManager::ToReverseDFdxSign ******/
		/****** md5 signature: 7bb219efdbfeed91f830488b98532a50 ******/
		%feature("compactdefaultargs") ToReverseDFdxSign;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag indicating flat shading should reverse normal flag; False by default.
") ToReverseDFdxSign;
		bool ToReverseDFdxSign();

		/****** Graphic3d_ShaderManager::UseRedAlpha ******/
		/****** md5 signature: 9336849b35eb84dccae6637e8d89217c ******/
		%feature("compactdefaultargs") UseRedAlpha;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if RED channel should be used instead of ALPHA for single-channel textures (e.g. GAPI supports only GL_RED textures and not GL_ALPHA).
") UseRedAlpha;
		bool UseRedAlpha();

};


%make_alias(Graphic3d_ShaderManager)

%extend Graphic3d_ShaderManager {
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
typedef NCollection_Sequence<ShaderVariable> ShaderVariableList;
		class ShaderVariable {};
		/****** Graphic3d_ShaderObject::CreateFromFile ******/
		/****** md5 signature: 0e4d93f61abfea2d28122dfc98e7db35 ******/
		%feature("compactdefaultargs") CreateFromFile;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfShaderObject
thePath: str

Return
-------
opencascade::handle<Graphic3d_ShaderObject>

Description
-----------
Creates new shader object from specified file.
") CreateFromFile;
		static opencascade::handle<Graphic3d_ShaderObject> CreateFromFile(const Graphic3d_TypeOfShaderObject theType, TCollection_AsciiString thePath);

		/****** Graphic3d_ShaderObject::CreateFromSource ******/
		/****** md5 signature: 89c8327f0382cb4ddac7df3854e7859f ******/
		%feature("compactdefaultargs") CreateFromSource;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfShaderObject
theSource: str

Return
-------
opencascade::handle<Graphic3d_ShaderObject>

Description
-----------
Creates new shader object from specified source.
") CreateFromSource;
		static opencascade::handle<Graphic3d_ShaderObject> CreateFromSource(const Graphic3d_TypeOfShaderObject theType, TCollection_AsciiString theSource);

		/****** Graphic3d_ShaderObject::GetId ******/
		/****** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ******/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns unique ID used to manage resource in graphic driver.
") GetId;
		const TCollection_AsciiString & GetId();

		/****** Graphic3d_ShaderObject::IsDone ******/
		/****** md5 signature: 1945a479a0f142c1c7964194fe72a60d ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the shader object is valid or not.
") IsDone;
		virtual bool IsDone();

		/****** Graphic3d_ShaderObject::Path ******/
		/****** md5 signature: 9d11d277fbcc37203e7dc39c30ea2e54 ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
OSD_Path

Description
-----------
Returns the full path to the shader source.
") Path;
		const OSD_Path & Path();

		/****** Graphic3d_ShaderObject::Source ******/
		/****** md5 signature: d9259fdeceadf330dfe57a7ddd24a1da ******/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the source code of the shader object.
") Source;
		const TCollection_AsciiString & Source();

		/****** Graphic3d_ShaderObject::Type ******/
		/****** md5 signature: 89254e60d0dba2f7a980c3b9f0ba5aec ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfShaderObject

Description
-----------
Returns type of the shader object.
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
		/****** Graphic3d_ShaderProgram::Graphic3d_ShaderProgram ******/
		/****** md5 signature: c9d506f6dd35044b3c228ea1da082f9b ******/
		%feature("compactdefaultargs") Graphic3d_ShaderProgram;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates new empty program object.
") Graphic3d_ShaderProgram;
		 Graphic3d_ShaderProgram();

		/****** Graphic3d_ShaderProgram::AppendToHeader ******/
		/****** md5 signature: ced78f90ca9cb4c305e39fbff11e02ab ******/
		%feature("compactdefaultargs") AppendToHeader;
		%feature("autodoc", "
Parameters
----------
theHeaderLine: str

Return
-------
None

Description
-----------
Append line to GLSL header.
") AppendToHeader;
		void AppendToHeader(TCollection_AsciiString theHeaderLine);

		/****** Graphic3d_ShaderProgram::AttachShader ******/
		/****** md5 signature: 31efe88f4042ae094bad3e25e6e6a5c3 ******/
		%feature("compactdefaultargs") AttachShader;
		%feature("autodoc", "
Parameters
----------
theShader: Graphic3d_ShaderObject

Return
-------
bool

Description
-----------
Attaches shader object to the program object.
") AttachShader;
		bool AttachShader(const opencascade::handle<Graphic3d_ShaderObject> & theShader);

		/****** Graphic3d_ShaderProgram::ClearVariables ******/
		/****** md5 signature: 1fb8537bc7c1634b6f48bef407b06bee ******/
		%feature("compactdefaultargs") ClearVariables;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all custom uniform variables from the program.
") ClearVariables;
		void ClearVariables();

		/****** Graphic3d_ShaderProgram::DetachShader ******/
		/****** md5 signature: b714f670ed93f3d614713c5bfedb1ee6 ******/
		%feature("compactdefaultargs") DetachShader;
		%feature("autodoc", "
Parameters
----------
theShader: Graphic3d_ShaderObject

Return
-------
bool

Description
-----------
Detaches shader object from the program object.
") DetachShader;
		bool DetachShader(const opencascade::handle<Graphic3d_ShaderObject> & theShader);

		/****** Graphic3d_ShaderProgram::GetId ******/
		/****** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ******/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns unique ID used to manage resource in graphic driver.
") GetId;
		const TCollection_AsciiString & GetId();

		/****** Graphic3d_ShaderProgram::HasAlphaTest ******/
		/****** md5 signature: 948bd9a75ea378c90814c764600e3ec2 ******/
		%feature("compactdefaultargs") HasAlphaTest;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if Fragment Shader should perform alpha test; False by default.
") HasAlphaTest;
		bool HasAlphaTest();

		/****** Graphic3d_ShaderProgram::HasDefaultSampler ******/
		/****** md5 signature: d9cf5c774ed9733a3fe0b44a90150e97 ******/
		%feature("compactdefaultargs") HasDefaultSampler;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if standard program header should define default texture sampler occSampler0; True by default for compatibility.
") HasDefaultSampler;
		bool HasDefaultSampler();

		/****** Graphic3d_ShaderProgram::Header ******/
		/****** md5 signature: f88fb6c2e88340b6cea1c010e1447033 ******/
		%feature("compactdefaultargs") Header;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns GLSL header (version code and extensions).
") Header;
		const TCollection_AsciiString & Header();

		/****** Graphic3d_ShaderProgram::IsDone ******/
		/****** md5 signature: 1945a479a0f142c1c7964194fe72a60d ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the program object is valid or not.
") IsDone;
		virtual bool IsDone();

		/****** Graphic3d_ShaderProgram::IsPBR ******/
		/****** md5 signature: e8074909da5b1a77f1ea06b7810aafbd ******/
		%feature("compactdefaultargs") IsPBR;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if standard program header should define functions and variables used in PBR pipeline. False by default.
") IsPBR;
		bool IsPBR();

		/****** Graphic3d_ShaderProgram::NbClipPlanesMax ******/
		/****** md5 signature: 46655932b98d6be45cfbcd7b09d31d28 ******/
		%feature("compactdefaultargs") NbClipPlanesMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the length of array of clipping planes (THE_MAX_CLIP_PLANES), to be used for initialization occClipPlaneEquations. Default value is THE_MAX_CLIP_PLANES_DEFAULT.
") NbClipPlanesMax;
		int NbClipPlanesMax();

		/****** Graphic3d_ShaderProgram::NbFragmentOutputs ******/
		/****** md5 signature: 7e3259fed77ead96f1a5e114d9307691 ******/
		%feature("compactdefaultargs") NbFragmentOutputs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number (1+) of Fragment Shader outputs to be written to (more than 1 can be in case of multiple draw buffers); 1 by default.
") NbFragmentOutputs;
		int NbFragmentOutputs();

		/****** Graphic3d_ShaderProgram::NbLightsMax ******/
		/****** md5 signature: 8f631ec7b4df32e224ca766df435933b ******/
		%feature("compactdefaultargs") NbLightsMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the length of array of light sources (THE_MAX_LIGHTS), to be used for initialization occLightSources. Default value is THE_MAX_LIGHTS_DEFAULT.
") NbLightsMax;
		int NbLightsMax();

		/****** Graphic3d_ShaderProgram::NbShadowMaps ******/
		/****** md5 signature: 31b047ffd0e13dd753354d6c050ed34d ******/
		%feature("compactdefaultargs") NbShadowMaps;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the length of array of shadow maps (THE_NB_SHADOWMAPS); 0 by default.
") NbShadowMaps;
		int NbShadowMaps();

		/****** Graphic3d_ShaderProgram::OitOutput ******/
		/****** md5 signature: 0ae1e43420d7eec8a047a3c7cc6e1bec ******/
		%feature("compactdefaultargs") OitOutput;
		%feature("autodoc", "Return
-------
Graphic3d_RenderTransparentMethod

Description
-----------
Return if Fragment Shader color should output to OIT buffers; OFF by default.
") OitOutput;
		Graphic3d_RenderTransparentMethod OitOutput();

		/****** Graphic3d_ShaderProgram::PushVariableFloat ******/
		/****** md5 signature: c64819c32f4207240d781f6df990e999 ******/
		%feature("compactdefaultargs") PushVariableFloat;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: float

Return
-------
bool

Description
-----------
Pushes float uniform.
") PushVariableFloat;
		bool PushVariableFloat(TCollection_AsciiString theName, const float theValue);

		/****** Graphic3d_ShaderProgram::PushVariableInt ******/
		/****** md5 signature: 089fa90005510b4e4548f5b7726ff379 ******/
		%feature("compactdefaultargs") PushVariableInt;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: int

Return
-------
bool

Description
-----------
Pushes int uniform.
") PushVariableInt;
		bool PushVariableInt(TCollection_AsciiString theName, const int theValue);

		/****** Graphic3d_ShaderProgram::PushVariableMat3 ******/
		/****** md5 signature: 64807d6d2bebe3b3e56bd6e62e01d073 ******/
		%feature("compactdefaultargs") PushVariableMat3;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Mat3<float>

Return
-------
bool

Description
-----------
Pushes mat3 uniform.
") PushVariableMat3;
		bool PushVariableMat3(TCollection_AsciiString theName, const NCollection_Mat3<float> & theValue);

		/****** Graphic3d_ShaderProgram::PushVariableMat4 ******/
		/****** md5 signature: d37f46cbafef68ced4479680e7f54a5e ******/
		%feature("compactdefaultargs") PushVariableMat4;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Mat4<float>

Return
-------
bool

Description
-----------
Pushes mat4 uniform.
") PushVariableMat4;
		bool PushVariableMat4(TCollection_AsciiString theName, const NCollection_Mat4<float> & theValue);

		/****** Graphic3d_ShaderProgram::PushVariableVec2 ******/
		/****** md5 signature: 9bebd27bf2847fbee51c32c7c82d4071 ******/
		%feature("compactdefaultargs") PushVariableVec2;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Vec2<float>

Return
-------
bool

Description
-----------
Pushes vec2 uniform.
") PushVariableVec2;
		bool PushVariableVec2(TCollection_AsciiString theName, const NCollection_Vec2<float> & theValue);

		/****** Graphic3d_ShaderProgram::PushVariableVec2i ******/
		/****** md5 signature: af076dbac722f4d15f5c1976a637bab1 ******/
		%feature("compactdefaultargs") PushVariableVec2i;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Vec2<int>

Return
-------
bool

Description
-----------
Pushes vec2i uniform.
") PushVariableVec2i;
		bool PushVariableVec2i(TCollection_AsciiString theName, const NCollection_Vec2<int> & theValue);

		/****** Graphic3d_ShaderProgram::PushVariableVec3 ******/
		/****** md5 signature: b3c5b95944e1a7d998b27b2dcd0fd043 ******/
		%feature("compactdefaultargs") PushVariableVec3;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Vec3<float>

Return
-------
bool

Description
-----------
Pushes vec3 uniform.
") PushVariableVec3;
		bool PushVariableVec3(TCollection_AsciiString theName, const NCollection_Vec3<float> & theValue);

		/****** Graphic3d_ShaderProgram::PushVariableVec3i ******/
		/****** md5 signature: 7dfa984a4b8b2a6eec49e8d7d2d6599d ******/
		%feature("compactdefaultargs") PushVariableVec3i;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Vec3<int>

Return
-------
bool

Description
-----------
Pushes vec3i uniform.
") PushVariableVec3i;
		bool PushVariableVec3i(TCollection_AsciiString theName, const NCollection_Vec3<int> & theValue);

		/****** Graphic3d_ShaderProgram::PushVariableVec4 ******/
		/****** md5 signature: cdcc6ae828608d466324f620fc134f26 ******/
		%feature("compactdefaultargs") PushVariableVec4;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Vec4<float>

Return
-------
bool

Description
-----------
Pushes vec4 uniform.
") PushVariableVec4;
		bool PushVariableVec4(TCollection_AsciiString theName, const NCollection_Vec4<float> & theValue);

		/****** Graphic3d_ShaderProgram::PushVariableVec4i ******/
		/****** md5 signature: e35b40df9673cae8886455d9cdbace41 ******/
		%feature("compactdefaultargs") PushVariableVec4i;
		%feature("autodoc", "
Parameters
----------
theName: str
theValue: NCollection_Vec4<int>

Return
-------
bool

Description
-----------
Pushes vec4i uniform.
") PushVariableVec4i;
		bool PushVariableVec4i(TCollection_AsciiString theName, const NCollection_Vec4<int> & theValue);

		/****** Graphic3d_ShaderProgram::SetAlphaTest ******/
		/****** md5 signature: a57ebee911c39db680e4c7966efea82b ******/
		%feature("compactdefaultargs") SetAlphaTest;
		%feature("autodoc", "
Parameters
----------
theAlphaTest: bool

Return
-------
None

Description
-----------
Set if Fragment Shader should perform alpha test. Note that this flag is designed for usage with - custom shader program may discard fragment regardless this flag.
") SetAlphaTest;
		void SetAlphaTest(bool theAlphaTest);

		/****** Graphic3d_ShaderProgram::SetDefaultSampler ******/
		/****** md5 signature: 9e732abff38fedfad56791a5c4a1dec5 ******/
		%feature("compactdefaultargs") SetDefaultSampler;
		%feature("autodoc", "
Parameters
----------
theHasDefSampler: bool

Return
-------
None

Description
-----------
Set if standard program header should define default texture sampler occSampler0.
") SetDefaultSampler;
		void SetDefaultSampler(bool theHasDefSampler);

		/****** Graphic3d_ShaderProgram::SetHeader ******/
		/****** md5 signature: 62f27581c0fcf7d3abe6ce528a7ab63d ******/
		%feature("compactdefaultargs") SetHeader;
		%feature("autodoc", "
Parameters
----------
theHeader: str

Return
-------
None

Description
-----------
Setup GLSL header containing language version code and used extensions. Will be prepended to the very beginning of the source code. Example: @code #version 300 es #extension GL_ARB_bindless_texture: require @endcode.
") SetHeader;
		void SetHeader(TCollection_AsciiString theHeader);

		/****** Graphic3d_ShaderProgram::SetId ******/
		/****** md5 signature: 64840b5ae68646959ed97ec8254f3d04 ******/
		%feature("compactdefaultargs") SetId;
		%feature("autodoc", "
Parameters
----------
theId: str

Return
-------
None

Description
-----------
Sets unique ID used to manage resource in graphic driver. WARNING! Graphic3d_ShaderProgram constructor generates a unique id for proper resource management; however if application overrides it, it is responsibility of application to avoid name collisions.
") SetId;
		void SetId(TCollection_AsciiString theId);

		/****** Graphic3d_ShaderProgram::SetNbClipPlanesMax ******/
		/****** md5 signature: 020b38cf20b32e4db6c8ad0cbd4de20b ******/
		%feature("compactdefaultargs") SetNbClipPlanesMax;
		%feature("autodoc", "
Parameters
----------
theNbPlanes: int

Return
-------
None

Description
-----------
Specify the length of array of clipping planes (THE_MAX_CLIP_PLANES).
") SetNbClipPlanesMax;
		void SetNbClipPlanesMax(int theNbPlanes);

		/****** Graphic3d_ShaderProgram::SetNbFragmentOutputs ******/
		/****** md5 signature: 085f78db1239098abcaee33f728c3678 ******/
		%feature("compactdefaultargs") SetNbFragmentOutputs;
		%feature("autodoc", "
Parameters
----------
theNbOutputs: int

Return
-------
None

Description
-----------
Sets the number of Fragment Shader outputs to be written to. Should be done before GLSL program initialization.
") SetNbFragmentOutputs;
		void SetNbFragmentOutputs(const int theNbOutputs);

		/****** Graphic3d_ShaderProgram::SetNbLightsMax ******/
		/****** md5 signature: 3d887d6c30f4c2a0b96e5351490eeae6 ******/
		%feature("compactdefaultargs") SetNbLightsMax;
		%feature("autodoc", "
Parameters
----------
theNbLights: int

Return
-------
None

Description
-----------
Specify the length of array of light sources (THE_MAX_LIGHTS).
") SetNbLightsMax;
		void SetNbLightsMax(int theNbLights);

		/****** Graphic3d_ShaderProgram::SetNbShadowMaps ******/
		/****** md5 signature: 2e9128cde2c7b2ed7dc44c3cf6cb6b44 ******/
		%feature("compactdefaultargs") SetNbShadowMaps;
		%feature("autodoc", "
Parameters
----------
theNbMaps: int

Return
-------
None

Description
-----------
Specify the length of array of shadow maps (THE_NB_SHADOWMAPS).
") SetNbShadowMaps;
		void SetNbShadowMaps(int theNbMaps);

		/****** Graphic3d_ShaderProgram::SetOitOutput ******/
		/****** md5 signature: aa6fe5dfd1ae6a7a74b9b5a4d50b58b4 ******/
		%feature("compactdefaultargs") SetOitOutput;
		%feature("autodoc", "
Parameters
----------
theOutput: Graphic3d_RenderTransparentMethod

Return
-------
None

Description
-----------
Set if Fragment Shader color should output to OIT buffers. Note that weighted OIT also requires at least 2 Fragment Outputs (color + coverage), and Depth Peeling requires at least 3 Fragment Outputs (depth + front color + back color),.
") SetOitOutput;
		void SetOitOutput(Graphic3d_RenderTransparentMethod theOutput);

		/****** Graphic3d_ShaderProgram::SetPBR ******/
		/****** md5 signature: ba430bb76b4531010af14467ef34a95e ******/
		%feature("compactdefaultargs") SetPBR;
		%feature("autodoc", "
Parameters
----------
theIsPBR: bool

Return
-------
None

Description
-----------
Sets whether standard program header should define functions and variables used in PBR pipeline.
") SetPBR;
		void SetPBR(bool theIsPBR);

		/****** Graphic3d_ShaderProgram::SetTextureSetBits ******/
		/****** md5 signature: 98c3c3c0638778a8044458af95487508 ******/
		%feature("compactdefaultargs") SetTextureSetBits;
		%feature("autodoc", "
Parameters
----------
theBits: int

Return
-------
None

Description
-----------
Set texture units declared within the program.
") SetTextureSetBits;
		void SetTextureSetBits(int theBits);

		/****** Graphic3d_ShaderProgram::SetVertexAttributes ******/
		/****** md5 signature: df0317e32b964026431bc8e2df33b84b ******/
		%feature("compactdefaultargs") SetVertexAttributes;
		%feature("autodoc", "
Parameters
----------
theAttributes: Graphic3d_ShaderAttribute

Return
-------
None

Description
-----------
Assign the list of custom vertex attributes. Should be done before GLSL program initialization.
") SetVertexAttributes;
		void SetVertexAttributes(const NCollection_Sequence<opencascade::handle<Graphic3d_ShaderAttribute>> & theAttributes);

		/****** Graphic3d_ShaderProgram::ShaderObjects ******/
		/****** md5 signature: 8de5f9ac4609f61e61349d5bd257e012 ******/
		%feature("compactdefaultargs") ShaderObjects;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<Graphic3d_ShaderObject>>

Description
-----------
Returns list of attached shader objects.
") ShaderObjects;
		const NCollection_Sequence<opencascade::handle<Graphic3d_ShaderObject>> & ShaderObjects();

		/****** Graphic3d_ShaderProgram::ShadersFolder ******/
		/****** md5 signature: f26477e080b56e162a878346206bf912 ******/
		%feature("compactdefaultargs") ShadersFolder;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
The path to GLSL programs determined from CSF_ShadersDirectory or CASROOT environment variables. 
Return: the root folder with default GLSL programs.
") ShadersFolder;
		static const TCollection_AsciiString & ShadersFolder();

		/****** Graphic3d_ShaderProgram::TextureSetBits ******/
		/****** md5 signature: 7d6135c5e807d27b2166250f222b0427 ******/
		%feature("compactdefaultargs") TextureSetBits;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return texture units declared within the program, 
See also: Graphic3d_TextureSetBits.
") TextureSetBits;
		int TextureSetBits();

		/****** Graphic3d_ShaderProgram::Variables ******/
		/****** md5 signature: 35c1335216b43bc40340f6412170e4c3 ******/
		%feature("compactdefaultargs") Variables;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<Graphic3d_ShaderVariable>>

Description
-----------
The list of currently pushed but not applied custom uniform variables. This list is automatically cleared after applying to GLSL program.
") Variables;
		const NCollection_Sequence<opencascade::handle<Graphic3d_ShaderVariable>> & Variables();

		/****** Graphic3d_ShaderProgram::VertexAttributes ******/
		/****** md5 signature: 10f9fe38cc97d73f1f072d5b87ca31d2 ******/
		%feature("compactdefaultargs") VertexAttributes;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<Graphic3d_ShaderAttribute>>

Description
-----------
Return the list of custom vertex attributes.
") VertexAttributes;
		const NCollection_Sequence<opencascade::handle<Graphic3d_ShaderAttribute>> & VertexAttributes();

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
		/****** Graphic3d_ShaderVariable::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the shader variable is valid or not.
") IsDone;
		bool IsDone();

		/****** Graphic3d_ShaderVariable::Name ******/
		/****** md5 signature: 8e64a3d42cb69d5f0c279aca58e35ec7 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns name of shader variable.
") Name;
		const TCollection_AsciiString & Name();

		/****** Graphic3d_ShaderVariable::Value ******/
		/****** md5 signature: b5672bd7d1d1e292ec75e023c5063098 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
Graphic3d_ValueInterface *

Description
-----------
Returns interface of shader variable value.
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
		/****** Graphic3d_Structure::Graphic3d_Structure ******/
		/****** md5 signature: d67667fa513f680c04d0cca3b0091e43 ******/
		%feature("compactdefaultargs") Graphic3d_Structure;
		%feature("autodoc", "
Parameters
----------
theManager: Graphic3d_StructureManager
theLinkPrs: Graphic3d_Structure (optional, default to opencascade::handle<Graphic3d_Structure>())

Return
-------
None

Description
-----------
Creates a graphic object in the manager theManager. It will appear in all the views of the visualiser. The structure is not displayed when it is created. 
Parameter theManager structure manager holding this structure 
Parameter theLinkPrs another structure for creating a shadow (linked) structure.
") Graphic3d_Structure;
		 Graphic3d_Structure(const opencascade::handle<Graphic3d_StructureManager> & theManager, const opencascade::handle<Graphic3d_Structure> & theLinkPrs = opencascade::handle<Graphic3d_Structure>());

		/****** Graphic3d_Structure::AcceptConnection ******/
		/****** md5 signature: 83b836e93032a1c43c4e4fbc2e6325c9 ******/
		%feature("compactdefaultargs") AcceptConnection;
		%feature("autodoc", "
Parameters
----------
theStructure1: Graphic3d_Structure *
theStructure2: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection

Return
-------
bool

Description
-----------
Returns true if the connection is possible between <AStructure1> and <AStructure2> without a creation of a cycle. //! It's not possible to call the method AStructure1->Connect (AStructure2, TypeOfConnection) if - the set of all ancestors of <AStructure1> contains <AStructure1> and if the TypeOfConnection == TOC_DESCENDANT - the set of all descendants of <AStructure1> contains <AStructure2> and if the TypeOfConnection == TOC_ANCESTOR.
") AcceptConnection;
		static bool AcceptConnection(Graphic3d_Structure * theStructure1, Graphic3d_Structure * theStructure2, Graphic3d_TypeOfConnection theType);

		/****** Graphic3d_Structure::Ancestors ******/
		/****** md5 signature: 1fed415fb0f5c5cef6273962c3481430 ******/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "
Parameters
----------
SG: Graphic3d_Structure

Return
-------
None

Description
-----------
Returns the group of structures to which <self> is connected.
") Ancestors;
		void Ancestors(NCollection_Map<opencascade::handle<Graphic3d_Structure>> & SG);

		/****** Graphic3d_Structure::CStructure ******/
		/****** md5 signature: 8536306818e6758deef120ea5bed2397 ******/
		%feature("compactdefaultargs") CStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_CStructure>

Description
-----------
Returns the low-level structure.
") CStructure;
		const opencascade::handle<Graphic3d_CStructure> & CStructure();

		/****** Graphic3d_Structure::CalculateBoundBox ******/
		/****** md5 signature: 3cd917a65fbfcb31c0e55116f05f4157 ******/
		%feature("compactdefaultargs") CalculateBoundBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes axis-aligned bounding box of a structure.
") CalculateBoundBox;
		virtual void CalculateBoundBox();

		/****** Graphic3d_Structure::Clear ******/
		/****** md5 signature: b755b1a4607b699da2bb09804ec6bb25 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
WithDestruction: bool (optional, default to true)

Return
-------
None

Description
-----------
if WithDestruction == true then suppress all the groups of primitives in the structure. and it is mandatory to create a new group in <self>. if WithDestruction == false then clears all the groups of primitives in the structure. and all the groups are conserved and empty. They will be erased at the next screen update. The structure itself is conserved. The transformation and the attributes of <self> are conserved. The childs of <self> are conserved.
") Clear;
		virtual void Clear(const bool WithDestruction = true);

		/****** Graphic3d_Structure::ClipPlanes ******/
		/****** md5 signature: 26ab80085e76b6f03b64af6598080486 ******/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Get clip planes slicing the structure on rendering. 
Return: set of clip planes.
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****** Graphic3d_Structure::Compute ******/
		/****** md5 signature: 4dfc24dddeda03f1df06c9a5cb138df0 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Compute;
		virtual void Compute();

		/****** Graphic3d_Structure::ComputeVisual ******/
		/****** md5 signature: 751db0567d7c16c28d68a3f12ecf6a77 ******/
		%feature("compactdefaultargs") ComputeVisual;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfStructure

Description
-----------
No available documentation.
") ComputeVisual;
		Graphic3d_TypeOfStructure ComputeVisual();

		/****** Graphic3d_Structure::Connect ******/
		/****** md5 signature: 6291b52a8a275d30ebe4af77436aede4 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection
theWithCheck: bool (optional, default to false)

Return
-------
None

Description
-----------
If Atype is TOC_DESCENDANT then add <AStructure> as a child structure of <self>. If Atype is TOC_ANCESTOR then add <AStructure> as a parent structure of <self>. The connection propagates Display, Highlight, Erase, Remove, and stacks the transformations. No connection if the graph of the structures contains a cycle and <WithCheck> is true;.
") Connect;
		void Connect(Graphic3d_Structure * theStructure, Graphic3d_TypeOfConnection theType, bool theWithCheck = false);

		/****** Graphic3d_Structure::Connect ******/
		/****** md5 signature: 9e0e0ae43d339f64ec839f31730c4cad ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
thePrs: Graphic3d_Structure

Return
-------
None

Description
-----------
No available documentation.
") Connect;
		void Connect(const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****** Graphic3d_Structure::CurrentGroup ******/
		/****** md5 signature: dc1f0b5eea98b580e880b9e6c8061d8f ******/
		%feature("compactdefaultargs") CurrentGroup;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Group>

Description
-----------
Returns the last created group or creates new one if list is empty.
") CurrentGroup;
		opencascade::handle<Graphic3d_Group> CurrentGroup();

		/****** Graphic3d_Structure::Descendants ******/
		/****** md5 signature: baad1cf4d5e2d5826af4fbd18985188c ******/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "
Parameters
----------
SG: Graphic3d_Structure

Return
-------
None

Description
-----------
Returns the group of structures connected to <self>.
") Descendants;
		void Descendants(NCollection_Map<opencascade::handle<Graphic3d_Structure>> & SG);

		/****** Graphic3d_Structure::Disconnect ******/
		/****** md5 signature: f16e2a64d5f4c2c9802fe7e384632817 ******/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure *

Return
-------
None

Description
-----------
Suppress the connection between <AStructure> and <self>.
") Disconnect;
		void Disconnect(Graphic3d_Structure * theStructure);

		/****** Graphic3d_Structure::DisconnectAll ******/
		/****** md5 signature: 2c9ce51fe44c5f626279c3983bae6668 ******/
		%feature("compactdefaultargs") DisconnectAll;
		%feature("autodoc", "
Parameters
----------
AType: Graphic3d_TypeOfConnection

Return
-------
None

Description
-----------
If Atype is TOC_DESCENDANT then suppress all the connections with the child structures of <self>. If Atype is TOC_ANCESTOR then suppress all the connections with the parent structures of <self>.
") DisconnectAll;
		void DisconnectAll(const Graphic3d_TypeOfConnection AType);

		/****** Graphic3d_Structure::Display ******/
		/****** md5 signature: 3c4cca883a8ef6cb513945de5fd9c904 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Return
-------
None

Description
-----------
Displays the structure <self> in all the views of the visualiser.
") Display;
		virtual void Display();

		/****** Graphic3d_Structure::DisplayPriority ******/
		/****** md5 signature: 569cd12ac8a5e3ea17f776921edea002 ******/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "Return
-------
Graphic3d_DisplayPriority

Description
-----------
Returns the current display priority for this structure.
") DisplayPriority;
		Graphic3d_DisplayPriority DisplayPriority();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Structure::Erase ******/
		/****** md5 signature: 61a58cd527074b370b7b4538af53adc9 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases this structure in all the views of the visualiser.
") Erase;
		virtual void Erase();

		/****** Graphic3d_Structure::GetZLayer ******/
		/****** md5 signature: 9e218901096cdecec418e74ac6fe9f8e ******/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerId

Description
-----------
Get Z layer ID of displayed structure. The method returns -1 if the structure has no ID (deleted from graphic driver).
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer();

		/****** Graphic3d_Structure::GraphicClear ******/
		/****** md5 signature: 047f430bd9b6a4f1771783be88a30e84 ******/
		%feature("compactdefaultargs") GraphicClear;
		%feature("autodoc", "
Parameters
----------
WithDestruction: bool

Return
-------
None

Description
-----------
Clears the structure <self>.
") GraphicClear;
		void GraphicClear(const bool WithDestruction);

		/****** Graphic3d_Structure::GraphicConnect ******/
		/****** md5 signature: 25414aa036ce4f9c880fca991929e226 ******/
		%feature("compactdefaultargs") GraphicConnect;
		%feature("autodoc", "
Parameters
----------
theDaughter: Graphic3d_Structure

Return
-------
None

Description
-----------
No available documentation.
") GraphicConnect;
		void GraphicConnect(const opencascade::handle<Graphic3d_Structure> & theDaughter);

		/****** Graphic3d_Structure::GraphicDisconnect ******/
		/****** md5 signature: de24d017a05f43bfaaaa80e642a46101 ******/
		%feature("compactdefaultargs") GraphicDisconnect;
		%feature("autodoc", "
Parameters
----------
theDaughter: Graphic3d_Structure

Return
-------
None

Description
-----------
No available documentation.
") GraphicDisconnect;
		void GraphicDisconnect(const opencascade::handle<Graphic3d_Structure> & theDaughter);

		/****** Graphic3d_Structure::GraphicTransform ******/
		/****** md5 signature: 9d5e921112bd06c55d92d6ab11115760 ******/
		%feature("compactdefaultargs") GraphicTransform;
		%feature("autodoc", "
Parameters
----------
theTrsf: TopLoc_Datum3D

Return
-------
None

Description
-----------
Internal method which sets new transformation without calling graphic manager callbacks.
") GraphicTransform;
		void GraphicTransform(const opencascade::handle<TopLoc_Datum3D> & theTrsf);

		/****** Graphic3d_Structure::Groups ******/
		/****** md5 signature: bfc11242543f04a1a53467f4dd227ab1 ******/
		%feature("compactdefaultargs") Groups;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<Graphic3d_Group>>

Description
-----------
Returns the groups sequence included in this structure.
") Groups;
		const NCollection_Sequence<opencascade::handle<Graphic3d_Group>> & Groups();

		/****** Graphic3d_Structure::HLRValidation ******/
		/****** md5 signature: 4669a48fad1291baf5d90e4b8b28d86a ******/
		%feature("compactdefaultargs") HLRValidation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Hidden parts stored in this structure are valid if: 1) the owner is defined. 2) they are not invalid.
") HLRValidation;
		bool HLRValidation();

		/****** Graphic3d_Structure::Highlight ******/
		/****** md5 signature: 7cc71656d38672bd26b8bcad2b1feb51 ******/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "
Parameters
----------
theStyle: Graphic3d_PresentationAttributes
theToUpdateMgr: bool (optional, default to true)

Return
-------
None

Description
-----------
Highlights the structure in all the views with the given style 
Input parameter: theStyle the style (type of highlighting: box/color, color and opacity) 
Input parameter: theToUpdateMgr defines whether related computed structures will be highlighted via structure manager or not.
") Highlight;
		void Highlight(const opencascade::handle<Graphic3d_PresentationAttributes> & theStyle, const bool theToUpdateMgr = true);

		/****** Graphic3d_Structure::HighlightStyle ******/
		/****** md5 signature: 8178b69ba5e9aec0fad5df24b6a36d07 ******/
		%feature("compactdefaultargs") HighlightStyle;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_PresentationAttributes>

Description
-----------
Returns the highlight attributes.
") HighlightStyle;
		const opencascade::handle<Graphic3d_PresentationAttributes> & HighlightStyle();

		/****** Graphic3d_Structure::Identification ******/
		/****** md5 signature: e09dd1d0e8395be114dc117199e1947c ******/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the identification number of this structure.
") Identification;
		int Identification();

		/****** Graphic3d_Structure::IsDeleted ******/
		/****** md5 signature: 9f4bb7ec7dc87712842f6d83f4e2f00a ******/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this structure is deleted (after Remove() call).
") IsDeleted;
		bool IsDeleted();

		/****** Graphic3d_Structure::IsDisplayed ******/
		/****** md5 signature: 41fa24d7262b997e469479feb5cd04c2 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the display indicator for this structure.
") IsDisplayed;
		virtual bool IsDisplayed();

		/****** Graphic3d_Structure::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the structure <self> is empty. Warning: A structure is empty if: it do not have group or all the groups are empties and it do not have descendant or all the descendants are empties.
") IsEmpty;
		bool IsEmpty();

		/****** Graphic3d_Structure::IsHighlighted ******/
		/****** md5 signature: f627d6894c1ac50e50c7509c48fad120 ******/
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the highlight indicator for this structure.
") IsHighlighted;
		virtual bool IsHighlighted();

		/****** Graphic3d_Structure::IsInfinite ******/
		/****** md5 signature: 7f15d815c957eba08a82497226542810 ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the structure <self> is infinite.
") IsInfinite;
		bool IsInfinite();

		/****** Graphic3d_Structure::IsMutable ******/
		/****** md5 signature: 6b5855c59f93c0e10dec04d410edb1b7 ******/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if structure has mutable nature (content or location are be changed regularly). Mutable structure will be managed in different way than static ones.
") IsMutable;
		bool IsMutable();

		/****** Graphic3d_Structure::IsTransformed ******/
		/****** md5 signature: 59bf5b80e258fa199126261ad0691790 ******/
		%feature("compactdefaultargs") IsTransformed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the structure is transformed.
") IsTransformed;
		bool IsTransformed();

		/****** Graphic3d_Structure::IsVisible ******/
		/****** md5 signature: 6d47e4fe91edc0d54b9a3b231c878799 ******/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the visibility indicator for this structure.
") IsVisible;
		bool IsVisible();

		/****** Graphic3d_Structure::MinMaxValues ******/
		/****** md5 signature: b885be657666ef58cffa840e6a4ffc61 ******/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "
Parameters
----------
theToIgnoreInfiniteFlag: bool (optional, default to false)

Return
-------
Bnd_Box

Description
-----------
Returns the coordinates of the boundary box of the structure <self>. If <theToIgnoreInfiniteFlag> is True, the method returns actual graphical boundaries of the Graphic3d_Group components. Otherwise, the method returns boundaries taking into account infinite state of the structure. This approach generally used for application specific fit operation (e.g. fitting the model into screen, not taking into account infinite helper elements). Warning: If the structure <self> is empty then the empty box is returned, If the structure <self> is infinite then the whole box is returned.
") MinMaxValues;
		Bnd_Box MinMaxValues(const bool theToIgnoreInfiniteFlag = false);

		/****** Graphic3d_Structure::Network ******/
		/****** md5 signature: 1f04794fd49a26ab24b1976d3d47fc2a ******/
		%feature("compactdefaultargs") Network;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection
theSet: NCollection_Map<Graphic3d_Structure *>

Return
-------
None

Description
-----------
Returns <ASet> the group of structures: - directly or indirectly connected to <AStructure> if the TypeOfConnection == TOC_DESCENDANT - to which <AStructure> is directly or indirectly connected if the TypeOfConnection == TOC_ANCESTOR.
") Network;
		static void Network(Graphic3d_Structure * theStructure, const Graphic3d_TypeOfConnection theType, NCollection_Map<Graphic3d_Structure *> & theSet);

		/****** Graphic3d_Structure::NewGroup ******/
		/****** md5 signature: 2179c9c42459d394fb9020a6a6dec876 ******/
		%feature("compactdefaultargs") NewGroup;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Group>

Description
-----------
Append new group to this structure.
") NewGroup;
		opencascade::handle<Graphic3d_Group> NewGroup();

		/****** Graphic3d_Structure::NumberOfGroups ******/
		/****** md5 signature: 849e3118a53471a3f6accde28a226558 ******/
		%feature("compactdefaultargs") NumberOfGroups;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current number of groups in this structure.
") NumberOfGroups;
		int NumberOfGroups();

		/****** Graphic3d_Structure::Owner ******/
		/****** md5 signature: 6b597f68998e9e10f0b75d6676d3d05e ******/
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "Return
-------
void *

Description
-----------
No available documentation.
") Owner;
		void * Owner();

		/****** Graphic3d_Structure::PrintNetwork ******/
		/****** md5 signature: f1e583afd3eefb370d3f45b8d7cc688e ******/
		%feature("compactdefaultargs") PrintNetwork;
		%feature("autodoc", "
Parameters
----------
AStructure: Graphic3d_Structure
AType: Graphic3d_TypeOfConnection

Return
-------
None

Description
-----------
Prints information about the network associated with the structure <AStructure>.
") PrintNetwork;
		static void PrintNetwork(const opencascade::handle<Graphic3d_Structure> & AStructure, const Graphic3d_TypeOfConnection AType);

		/****** Graphic3d_Structure::ReCompute ******/
		/****** md5 signature: 6619326e603ccdb36e9cfecd2b36ae53 ******/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Forces a new construction of the structure <self> if <self> is displayed and TOS_COMPUTED.
") ReCompute;
		void ReCompute();

		/****** Graphic3d_Structure::ReCompute ******/
		/****** md5 signature: 546d2e35de2d763b0501620176659a8b ******/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "
Parameters
----------
aProjector: Graphic3d_DataStructureManager

Return
-------
None

Description
-----------
Forces a new construction of the structure <self> if <self> is displayed in <aProjetor> and TOS_COMPUTED.
") ReCompute;
		void ReCompute(const opencascade::handle<Graphic3d_DataStructureManager> & aProjector);

		/****** Graphic3d_Structure::RecomputeTransformation ******/
		/****** md5 signature: 82ed18839859745368af73d0950cafa4 ******/
		%feature("compactdefaultargs") RecomputeTransformation;
		%feature("autodoc", "
Parameters
----------
theProjector: Graphic3d_Camera

Return
-------
None

Description
-----------
Calculates structure transformation for specific camera position.
") RecomputeTransformation;
		virtual void RecomputeTransformation(const opencascade::handle<Graphic3d_Camera> & theProjector);

		/****** Graphic3d_Structure::Remove ******/
		/****** md5 signature: 0346504d7ac570fc8960fb72d5ad5f20 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
None

Description
-----------
Suppress the structure <self>. It will be erased at the next screen update. Warning: No more graphic operations in <self> after this call. Category: Methods to modify the class definition.
") Remove;
		void Remove();

		/****** Graphic3d_Structure::Remove ******/
		/****** md5 signature: 91b66b071a3ae47ea82fbf40dc4f2290 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
thePrs: Graphic3d_Structure

Return
-------
None

Description
-----------
No available documentation.
") Remove;
		void Remove(const opencascade::handle<Graphic3d_Structure> & thePrs);

		/****** Graphic3d_Structure::Remove ******/
		/****** md5 signature: 090f833049a2c27ad3b00f3de10a2737 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
thePtr: Graphic3d_Structure *
theType: Graphic3d_TypeOfConnection

Return
-------
None

Description
-----------
Suppress the structure in the list of descendants or in the list of ancestors.
") Remove;
		void Remove(Graphic3d_Structure * thePtr, const Graphic3d_TypeOfConnection theType);

		/****** Graphic3d_Structure::RemoveAll ******/
		/****** md5 signature: 21d367538c35ee0fd687e7543534de8e ******/
		%feature("compactdefaultargs") RemoveAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") RemoveAll;
		void RemoveAll();

		/****** Graphic3d_Structure::ResetDisplayPriority ******/
		/****** md5 signature: 7e9a6fef73d14b5bf0e50b4d1a74fe4f ******/
		%feature("compactdefaultargs") ResetDisplayPriority;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the current priority of the structure to the previous priority. Warning: If structure is displayed then the SetDisplayPriority() method erases it and displays with the previous priority.
") ResetDisplayPriority;
		void ResetDisplayPriority();

		/****** Graphic3d_Structure::SetClipPlanes ******/
		/****** md5 signature: e4333b4a8793a61136630719405f0b4b ******/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "
Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Return
-------
None

Description
-----------
Changes a sequence of clip planes slicing the structure on rendering. 
Input parameter: thePlanes the set of clip planes.
") SetClipPlanes;
		void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****** Graphic3d_Structure::SetComputeVisual ******/
		/****** md5 signature: f3be360944707961d7edf642114e6153 ******/
		%feature("compactdefaultargs") SetComputeVisual;
		%feature("autodoc", "
Parameters
----------
theVisual: Graphic3d_TypeOfStructure

Return
-------
None

Description
-----------
No available documentation.
") SetComputeVisual;
		void SetComputeVisual(const Graphic3d_TypeOfStructure theVisual);

		/****** Graphic3d_Structure::SetDisplayPriority ******/
		/****** md5 signature: 7ab59d52dbc820e0408e02d58be68382 ******/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "
Parameters
----------
thePriority: Graphic3d_DisplayPriority

Return
-------
None

Description
-----------
Modifies the order of displaying the structure. Values are between 0 and 10. Structures are drawn according to their display priorities in ascending order. A structure of priority 10 is displayed the last and appears over the others. The default value is 5. Warning: If structure is displayed then the SetDisplayPriority method erases it and displays with the new priority. Raises Graphic3d_PriorityDefinitionError if Priority is greater than 10 or a negative value.
") SetDisplayPriority;
		void SetDisplayPriority(const Graphic3d_DisplayPriority thePriority);

		/****** Graphic3d_Structure::SetDisplayPriority ******/
		/****** md5 signature: 969d628df9b811505be232c82b069446 ******/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "
Parameters
----------
thePriority: int

Return
-------
None

Description
-----------
No available documentation.
") SetDisplayPriority;
		void SetDisplayPriority(const int thePriority);

		/****** Graphic3d_Structure::SetHLRValidation ******/
		/****** md5 signature: cea53b760f3857b3eac320398e23e56e ******/
		%feature("compactdefaultargs") SetHLRValidation;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
No available documentation.
") SetHLRValidation;
		void SetHLRValidation(const bool theFlag);

		/****** Graphic3d_Structure::SetInfiniteState ******/
		/****** md5 signature: 6ce46ca3c1e3ae8c1ef2c97c14af2ae9 ******/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "
Parameters
----------
theToSet: bool

Return
-------
None

Description
-----------
Sets infinite flag. When True, the MinMaxValues method returns: theXMin = theYMin = theZMin = RealFirst(). theXMax = theYMax = theZMax = RealLast(). By default, structure is created not infinite but empty.
") SetInfiniteState;
		void SetInfiniteState(const bool theToSet);

		/****** Graphic3d_Structure::SetIsForHighlight ******/
		/****** md5 signature: 7b0c6fe4263c1a4cab8a3151231590fa ******/
		%feature("compactdefaultargs") SetIsForHighlight;
		%feature("autodoc", "
Parameters
----------
isForHighlight: bool

Return
-------
None

Description
-----------
Marks the structure <self> representing wired structure needed for highlight only so it won't be added to BVH tree.
") SetIsForHighlight;
		void SetIsForHighlight(const bool isForHighlight);

		/****** Graphic3d_Structure::SetMutable ******/
		/****** md5 signature: e9753c20843a5f4b7018053ff4c12ddd ******/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "
Parameters
----------
theIsMutable: bool

Return
-------
None

Description
-----------
Sets if the structure location has mutable nature (content or location will be changed regularly).
") SetMutable;
		void SetMutable(const bool theIsMutable);

		/****** Graphic3d_Structure::SetOwner ******/
		/****** md5 signature: 27730c1901e615dc773050fef33da141 ******/
		%feature("compactdefaultargs") SetOwner;
		%feature("autodoc", "
Parameters
----------
theOwner: void *

Return
-------
None

Description
-----------
No available documentation.
") SetOwner;
		void SetOwner(void * const theOwner);

		/****** Graphic3d_Structure::SetTransformPersistence ******/
		/****** md5 signature: 58f8832cbff26a7b2b30abc76e733511 ******/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "
Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Return
-------
None

Description
-----------
Modifies the current transform persistence (pan, zoom or rotate).
") SetTransformPersistence;
		void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** Graphic3d_Structure::SetTransformation ******/
		/****** md5 signature: 5ed349b7755a32982bb5ffa30e287efc ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theTrsf: TopLoc_Datum3D

Return
-------
None

Description
-----------
Modifies the current local transformation.
") SetTransformation;
		void SetTransformation(const opencascade::handle<TopLoc_Datum3D> & theTrsf);

		/****** Graphic3d_Structure::SetVisible ******/
		/****** md5 signature: c3ab2c67d7a9184c06c1cd8df7802bec ******/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "
Parameters
----------
AValue: bool

Return
-------
None

Description
-----------
Modifies the visibility indicator to true or false for the structure <self>. The default value at the definition of <self> is true.
") SetVisible;
		void SetVisible(const bool AValue);

		/****** Graphic3d_Structure::SetVisual ******/
		/****** md5 signature: a541b1b8c8f18e85eee24ee866323f66 ******/
		%feature("compactdefaultargs") SetVisual;
		%feature("autodoc", "
Parameters
----------
AVisual: Graphic3d_TypeOfStructure

Return
-------
None

Description
-----------
Modifies the visualisation mode for the structure <self>.
") SetVisual;
		virtual void SetVisual(const Graphic3d_TypeOfStructure AVisual);

		/****** Graphic3d_Structure::SetZLayer ******/
		/****** md5 signature: 1234e282b3516163b291390663f2b62b ******/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
None

Description
-----------
Set Z layer ID for the structure. The Z layer mechanism allows to display structures presented in higher layers in overlay of structures in lower layers by switching off z buffer depth test between layers.
") SetZLayer;
		void SetZLayer(int theLayerId);

		/****** Graphic3d_Structure::SetZoomLimit ******/
		/****** md5 signature: a68b12eb696e4bd223a4518ffe1afd6d ******/
		%feature("compactdefaultargs") SetZoomLimit;
		%feature("autodoc", "
Parameters
----------
LimitInf: double
LimitSup: double

Return
-------
None

Description
-----------
Modifies the minimum and maximum zoom coefficients for the structure <self>. The default value at the definition of <self> is unlimited. Category: Methods to modify the class definition Warning: Raises StructureDefinitionError if <LimitInf> is greater than <LimitSup> or if <LimitInf> or <LimitSup> is a negative value.
") SetZoomLimit;
		void SetZoomLimit(const double LimitInf, const double LimitSup);

		/****** Graphic3d_Structure::TransformPersistence ******/
		/****** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ******/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TransformPers>

Description
-----------
Return: transform persistence of the presentable object.
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****** Graphic3d_Structure::Transformation ******/
		/****** md5 signature: db8c043002ade3619cbf19c2cdc0b508 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Return local transformation.
") Transformation;
		const opencascade::handle<TopLoc_Datum3D> & Transformation();

		/****** Graphic3d_Structure::UnHighlight ******/
		/****** md5 signature: 39ce43ce3b46f356efde8e354316b376 ******/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "Return
-------
None

Description
-----------
Suppresses the highlight for the structure <self> in all the views of the visualiser.
") UnHighlight;
		void UnHighlight();

		/****** Graphic3d_Structure::Visual ******/
		/****** md5 signature: db220160db9236600897688cadcd5ce7 ******/
		%feature("compactdefaultargs") Visual;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfStructure

Description
-----------
Returns the visualisation mode for the structure <self>.
") Visual;
		Graphic3d_TypeOfStructure Visual();

		/****** Graphic3d_Structure::computeHLR ******/
		/****** md5 signature: 3f519e2f0f12a70d51d7226a8c10f959 ******/
		%feature("compactdefaultargs") computeHLR;
		%feature("autodoc", "
Parameters
----------
theProjector: Graphic3d_Camera
theStructure: Graphic3d_Structure

Return
-------
None

Description
-----------
Returns the new Structure defined for the new visualization.
") computeHLR;
		virtual void computeHLR(const opencascade::handle<Graphic3d_Camera> & theProjector, opencascade::handle<Graphic3d_Structure> & theStructure);

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
		/****** Graphic3d_StructureManager::Graphic3d_StructureManager ******/
		/****** md5 signature: bf06c4f7a4fd2e5e28e43056a4a6b6d3 ******/
		%feature("compactdefaultargs") Graphic3d_StructureManager;
		%feature("autodoc", "
Parameters
----------
theDriver: Graphic3d_GraphicDriver

Return
-------
None

Description
-----------
Initializes the ViewManager. Currently creating of more than 100 viewer instances is not supported and leads to InitializationError and initialization failure. This limitation might be addressed in some future OCCT releases. Warning: Raises InitialisationError if the initialization of the ViewManager failed.
") Graphic3d_StructureManager;
		 Graphic3d_StructureManager(const opencascade::handle<Graphic3d_GraphicDriver> & theDriver);

		/****** Graphic3d_StructureManager::ChangeDisplayPriority ******/
		/****** md5 signature: f4e4404a4991ec3c3960c0f024d20108 ******/
		%feature("compactdefaultargs") ChangeDisplayPriority;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure
theOldPriority: Graphic3d_DisplayPriority
theNewPriority: Graphic3d_DisplayPriority

Return
-------
None

Description
-----------
Changes the display priority of the structure <AStructure>.
") ChangeDisplayPriority;
		virtual void ChangeDisplayPriority(const opencascade::handle<Graphic3d_Structure> & theStructure, const Graphic3d_DisplayPriority theOldPriority, const Graphic3d_DisplayPriority theNewPriority);

		/****** Graphic3d_StructureManager::ChangeZLayer ******/
		/****** md5 signature: d68c801a4cace524cd37e40b6911217d ******/
		%feature("compactdefaultargs") ChangeZLayer;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure
theLayerId: int

Return
-------
None

Description
-----------
Change Z layer for structure. The Z layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.
") ChangeZLayer;
		virtual void ChangeZLayer(const opencascade::handle<Graphic3d_Structure> & theStructure, int theLayerId);

		/****** Graphic3d_StructureManager::Clear ******/
		/****** md5 signature: b795ddf92f9c07000fee4550b7a92e2a ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure *
theWithDestruction: bool

Return
-------
None

Description
-----------
Clears the structure.
") Clear;
		virtual void Clear(Graphic3d_Structure * theStructure, const bool theWithDestruction);

		/****** Graphic3d_StructureManager::Connect ******/
		/****** md5 signature: 9b16e71d7a09bd5e9e14f2b36df2da35 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
theMother: Graphic3d_Structure *
theDaughter: Graphic3d_Structure *

Return
-------
None

Description
-----------
Connects the structures.
") Connect;
		virtual void Connect(const Graphic3d_Structure * theMother, const Graphic3d_Structure * theDaughter);

		/****** Graphic3d_StructureManager::DefinedViews ******/
		/****** md5 signature: 9b3580196c904eb04fa1101de46d9bb2 ******/
		%feature("compactdefaultargs") DefinedViews;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<Graphic3d_CView *>

Description
-----------
Returns the group of views defined in the structure manager.
") DefinedViews;
		const NCollection_IndexedMap<Graphic3d_CView *> & DefinedViews();

		/****** Graphic3d_StructureManager::Disconnect ******/
		/****** md5 signature: 3ba10497297476c17744bdf68bcf5062 ******/
		%feature("compactdefaultargs") Disconnect;
		%feature("autodoc", "
Parameters
----------
theMother: Graphic3d_Structure *
theDaughter: Graphic3d_Structure *

Return
-------
None

Description
-----------
Disconnects the structures.
") Disconnect;
		virtual void Disconnect(const Graphic3d_Structure * theMother, const Graphic3d_Structure * theDaughter);

		/****** Graphic3d_StructureManager::Display ******/
		/****** md5 signature: 0a0ff1e10f8ac4b3e756504382415923 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure

Return
-------
None

Description
-----------
Display the structure.
") Display;
		virtual void Display(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****** Graphic3d_StructureManager::DisplayedStructures ******/
		/****** md5 signature: 6940eaa42b70ae2ba57d2b4d1f688472 ******/
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "
Parameters
----------
SG: Graphic3d_Structure

Return
-------
None

Description
-----------
Returns the set of structures displayed in visualiser <self>.
") DisplayedStructures;
		void DisplayedStructures(NCollection_Map<opencascade::handle<Graphic3d_Structure>> & SG);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_StructureManager::Erase ******/
		/****** md5 signature: 6b8959c3f27bc8bb25573acddfac71b2 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases all the structures.
") Erase;
		virtual void Erase();

		/****** Graphic3d_StructureManager::Erase ******/
		/****** md5 signature: 33fbe9ece3c4395e53fad2a8c75ab2e3 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure

Return
-------
None

Description
-----------
Erases the structure.
") Erase;
		virtual void Erase(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****** Graphic3d_StructureManager::GraphicDriver ******/
		/****** md5 signature: 5e26d54a69268bb1bfaed21ac554840d ******/
		%feature("compactdefaultargs") GraphicDriver;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_GraphicDriver>

Description
-----------
Returns the graphic driver of <self>.
") GraphicDriver;
		const opencascade::handle<Graphic3d_GraphicDriver> & GraphicDriver();

		/****** Graphic3d_StructureManager::Highlight ******/
		/****** md5 signature: 9252511647a737dcb6a04cd2d948f231 ******/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure

Return
-------
None

Description
-----------
Highlights the structure.
") Highlight;
		virtual void Highlight(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****** Graphic3d_StructureManager::HighlightedStructures ******/
		/****** md5 signature: 4a9fbeead5a3e898c20b8874a969bb86 ******/
		%feature("compactdefaultargs") HighlightedStructures;
		%feature("autodoc", "
Parameters
----------
SG: Graphic3d_Structure

Return
-------
None

Description
-----------
Returns the set of highlighted structures in a visualiser <self>.
") HighlightedStructures;
		void HighlightedStructures(NCollection_Map<opencascade::handle<Graphic3d_Structure>> & SG);

		/****** Graphic3d_StructureManager::Identification ******/
		/****** md5 signature: a71ee90a2350ca573e30915dc907f847 ******/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView *

Return
-------
int

Description
-----------
Attaches the view to this structure manager and sets its identification number within the manager.
") Identification;
		int Identification(Graphic3d_CView * theView);

		/****** Graphic3d_StructureManager::Identification ******/
		/****** md5 signature: 9f8d8de1649cc530e2aa3ccf40f429a3 ******/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "
Parameters
----------
AId: int

Return
-------
opencascade::handle<Graphic3d_Structure>

Description
-----------
Returns the structure with the identification number <AId>.
") Identification;
		virtual opencascade::handle<Graphic3d_Structure> Identification(const int AId);

		/****** Graphic3d_StructureManager::IsDeviceLost ******/
		/****** md5 signature: 15a3ccb160f0fce7a9b03f1677667343 ******/
		%feature("compactdefaultargs") IsDeviceLost;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if Device Lost flag has been set and presentation data should be reuploaded onto graphics driver.
") IsDeviceLost;
		bool IsDeviceLost();

		/****** Graphic3d_StructureManager::MaxNumOfViews ******/
		/****** md5 signature: a4a100b7fee0a9e91ad26f6c6a8b96d0 ******/
		%feature("compactdefaultargs") MaxNumOfViews;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the theoretical maximum number of definable views in the manager. Warning: It's not possible to accept an infinite number of definable views because each view must have an identification and we have different managers.
") MaxNumOfViews;
		int MaxNumOfViews();

		/****** Graphic3d_StructureManager::ObjectAffinity ******/
		/****** md5 signature: e79830514c49bd4e88b290587984cd82 ******/
		%feature("compactdefaultargs") ObjectAffinity;
		%feature("autodoc", "
Parameters
----------
theObject: Standard_Transient

Return
-------
opencascade::handle<Graphic3d_ViewAffinity>

Description
-----------
No available documentation.
") ObjectAffinity;
		const opencascade::handle<Graphic3d_ViewAffinity> & ObjectAffinity(const opencascade::handle<Standard_Transient> & theObject);

		/****** Graphic3d_StructureManager::ReCompute ******/
		/****** md5 signature: 616a39795d0668f6d0f2c39a483d0904 ******/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure

Return
-------
None

Description
-----------
Forces a new construction of the structure. if <theStructure> is displayed and TOS_COMPUTED.
") ReCompute;
		virtual void ReCompute(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****** Graphic3d_StructureManager::ReCompute ******/
		/****** md5 signature: 83bb72430a81d8098709d68b51aa6597 ******/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure
theProjector: Graphic3d_DataStructureManager

Return
-------
None

Description
-----------
Forces a new construction of the structure. if <theStructure> is displayed in <theProjector> and TOS_COMPUTED.
") ReCompute;
		virtual void ReCompute(const opencascade::handle<Graphic3d_Structure> & theStructure, const opencascade::handle<Graphic3d_DataStructureManager> & theProjector);

		/****** Graphic3d_StructureManager::RecomputeStructures ******/
		/****** md5 signature: a39bdc19ae8e5c57049d7855f816f653 ******/
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes all structures in the manager. Resets Device Lost flag.
") RecomputeStructures;
		void RecomputeStructures();

		/****** Graphic3d_StructureManager::RecomputeStructures ******/
		/****** md5 signature: 23f732c9b4599ff2d3ab40d5d84e000f ******/
		%feature("compactdefaultargs") RecomputeStructures;
		%feature("autodoc", "
Parameters
----------
theStructures: NCollection_Map<Graphic3d_Structure *>

Return
-------
None

Description
-----------
Recomputes all structures from theStructures.
") RecomputeStructures;
		void RecomputeStructures(const NCollection_Map<Graphic3d_Structure *> & theStructures);

		/****** Graphic3d_StructureManager::RegisterObject ******/
		/****** md5 signature: 4d90aa666e5fb41b5a16e9a69b45f2f9 ******/
		%feature("compactdefaultargs") RegisterObject;
		%feature("autodoc", "
Parameters
----------
theObject: Standard_Transient
theAffinity: Graphic3d_ViewAffinity

Return
-------
None

Description
-----------
No available documentation.
") RegisterObject;
		void RegisterObject(const opencascade::handle<Standard_Transient> & theObject, const opencascade::handle<Graphic3d_ViewAffinity> & theAffinity);

		/****** Graphic3d_StructureManager::Remove ******/
		/****** md5 signature: 57a23cda69c531e8d176ae30ce8f77c6 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deletes and erases the 3D structure manager.
") Remove;
		virtual void Remove();

		/****** Graphic3d_StructureManager::SetDeviceLost ******/
		/****** md5 signature: 9920384e372fd3747be47d84dd393cc9 ******/
		%feature("compactdefaultargs") SetDeviceLost;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets Device Lost flag.
") SetDeviceLost;
		void SetDeviceLost();

		/****** Graphic3d_StructureManager::SetTransform ******/
		/****** md5 signature: 752db10fe087601901e4c13e5c05d40c ******/
		%feature("compactdefaultargs") SetTransform;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure
theTrsf: TopLoc_Datum3D

Return
-------
None

Description
-----------
Transforms the structure.
") SetTransform;
		virtual void SetTransform(const opencascade::handle<Graphic3d_Structure> & theStructure, const opencascade::handle<TopLoc_Datum3D> & theTrsf);

		/****** Graphic3d_StructureManager::UnHighlight ******/
		/****** md5 signature: e841c00d90be06504c3125a91194b8d4 ******/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "
Parameters
----------
AStructure: Graphic3d_Structure

Return
-------
None

Description
-----------
Suppress the highlighting on the structure <AStructure>.
") UnHighlight;
		virtual void UnHighlight(const opencascade::handle<Graphic3d_Structure> & AStructure);

		/****** Graphic3d_StructureManager::UnHighlight ******/
		/****** md5 signature: 019aca52f7d908cf9e1b3c79e24f8902 ******/
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "Return
-------
None

Description
-----------
Suppresses the highlighting on all the structures in <self>.
") UnHighlight;
		virtual void UnHighlight();

		/****** Graphic3d_StructureManager::UnIdentification ******/
		/****** md5 signature: 2c03450c9a17c6e28a5a2d56dcb8592e ******/
		%feature("compactdefaultargs") UnIdentification;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView *

Return
-------
None

Description
-----------
Detach the view from this structure manager and release its identification.
") UnIdentification;
		void UnIdentification(Graphic3d_CView * theView);

		/****** Graphic3d_StructureManager::UnregisterObject ******/
		/****** md5 signature: f51c6ce76ba73a05d8e97a2b939c5d3f ******/
		%feature("compactdefaultargs") UnregisterObject;
		%feature("autodoc", "
Parameters
----------
theObject: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") UnregisterObject;
		void UnregisterObject(const opencascade::handle<Standard_Transient> & theObject);

		/****** Graphic3d_StructureManager::Update ******/
		/****** md5 signature: acf4c29ded22955e1c1cc7a6b217934b ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
theLayerId: int (optional, default to Graphic3d_ZLayerId_UNKNOWN)

Return
-------
None

Description
-----------
Invalidates bounding box of specified ZLayerId.
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
		/****** Graphic3d_Text::Graphic3d_Text ******/
		/****** md5 signature: 637dc427158de7e3babe626d49123c1f ******/
		%feature("compactdefaultargs") Graphic3d_Text;
		%feature("autodoc", "
Parameters
----------
theHeight: float

Return
-------
None

Description
-----------
Creates default text parameters.
") Graphic3d_Text;
		 Graphic3d_Text(const float theHeight);

		/****** Graphic3d_Text::HasOwnAnchorPoint ******/
		/****** md5 signature: 39cb551908cba0204e9e666e55e73184 ******/
		%feature("compactdefaultargs") HasOwnAnchorPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the text has an anchor point.
") HasOwnAnchorPoint;
		bool HasOwnAnchorPoint();

		/****** Graphic3d_Text::HasPlane ******/
		/****** md5 signature: e18298330172220d6616cb690de3d5ad ******/
		%feature("compactdefaultargs") HasPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the text is filled by a point.
") HasPlane;
		bool HasPlane();

		/****** Graphic3d_Text::Height ******/
		/****** md5 signature: 72f3a578aaa16dd89e043214006e0a56 ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
float

Description
-----------
Sets height of text. (Relative to the Normalized Projection Coordinates (NPC) Space).
") Height;
		float Height();

		/****** Graphic3d_Text::HorizontalAlignment ******/
		/****** md5 signature: 0115f65c224e2508253706dbcaed911d ******/
		%feature("compactdefaultargs") HorizontalAlignment;
		%feature("autodoc", "Return
-------
Graphic3d_HorizontalTextAlignment

Description
-----------
Returns horizontal alignment of text.
") HorizontalAlignment;
		Graphic3d_HorizontalTextAlignment HorizontalAlignment();

		/****** Graphic3d_Text::Orientation ******/
		/****** md5 signature: 1f9ae1b5d6671bf7cb13e335b8bca8c1 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns text orientation in 3D space.
") Orientation;
		const gp_Ax2 Orientation();

		/****** Graphic3d_Text::Position ******/
		/****** md5 signature: 0ab08d371c89be0cb1eecbddf304bb77 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
The 3D point of attachment is projected. If the orientation is defined, the text is written in the plane of projection.
") Position;
		const gp_Pnt Position();

		/****** Graphic3d_Text::ResetOrientation ******/
		/****** md5 signature: 39aa72f39fb0e0c37f3b9a1f32b4aff2 ******/
		%feature("compactdefaultargs") ResetOrientation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset text orientation in 3D space.
") ResetOrientation;
		void ResetOrientation();

		/****** Graphic3d_Text::SetHeight ******/
		/****** md5 signature: 2d95e1924a6ce6da63b70283be3009bb ******/
		%feature("compactdefaultargs") SetHeight;
		%feature("autodoc", "
Parameters
----------
theHeight: float

Return
-------
None

Description
-----------
Returns height of text.
") SetHeight;
		void SetHeight(const float theHeight);

		/****** Graphic3d_Text::SetHorizontalAlignment ******/
		/****** md5 signature: c370b9f2a669008a609171c1a458cd46 ******/
		%feature("compactdefaultargs") SetHorizontalAlignment;
		%feature("autodoc", "
Parameters
----------
theJustification: Graphic3d_HorizontalTextAlignment

Return
-------
None

Description
-----------
Sets horizontal alignment of text.
") SetHorizontalAlignment;
		void SetHorizontalAlignment(const Graphic3d_HorizontalTextAlignment theJustification);

		/****** Graphic3d_Text::SetOrientation ******/
		/****** md5 signature: d0d8bca65c36cd5ecf7c66f85b6b744c ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: gp_Ax2

Return
-------
None

Description
-----------
Sets text orientation in 3D space.
") SetOrientation;
		void SetOrientation(const gp_Ax2 & theOrientation);

		/****** Graphic3d_Text::SetOwnAnchorPoint ******/
		/****** md5 signature: fe89c111348b543d53fc0d2d3f692a63 ******/
		%feature("compactdefaultargs") SetOwnAnchorPoint;
		%feature("autodoc", "
Parameters
----------
theHasOwnAnchor: bool

Return
-------
None

Description
-----------
Returns true if the text has an anchor point.
") SetOwnAnchorPoint;
		void SetOwnAnchorPoint(const bool theHasOwnAnchor);

		/****** Graphic3d_Text::SetPosition ******/
		/****** md5 signature: 40bc31d1ad46a4aeef196d0c734ac91e ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Sets text point.
") SetPosition;
		void SetPosition(const gp_Pnt & thePoint);

		/****** Graphic3d_Text::SetText ******/
		/****** md5 signature: b9cc63ce3bb2835eedd0b5fe50bc4dff ******/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "
Parameters
----------
theText: NCollection_String

Return
-------
None

Description
-----------
Sets text value.
") SetText;
		void SetText(const NCollection_String & theText);

		/****** Graphic3d_Text::SetText ******/
		/****** md5 signature: a0929e0bbb89cb9df8d2f7df87ca9f0c ******/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "
Parameters
----------
theText: str

Return
-------
None

Description
-----------
Sets text value.
") SetText;
		void SetText(TCollection_AsciiString theText);

		/****** Graphic3d_Text::SetText ******/
		/****** md5 signature: e2406a5d311655ed834e2a2f65b0d3f6 ******/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "
Parameters
----------
theText: char *

Return
-------
None

Description
-----------
Sets text value.
") SetText;
		void SetText(const char * theText);

		/****** Graphic3d_Text::SetTextFormatter ******/
		/****** md5 signature: 69d92dbd5b2f2ec93859c8dcc0b4f585 ******/
		%feature("compactdefaultargs") SetTextFormatter;
		%feature("autodoc", "
Parameters
----------
theFormatter: Font_TextFormatter

Return
-------
None

Description
-----------
Setup text default formatter for text within this context.
") SetTextFormatter;
		void SetTextFormatter(const opencascade::handle<Font_TextFormatter> & theFormatter);

		/****** Graphic3d_Text::SetVerticalAlignment ******/
		/****** md5 signature: e2cc7b2cf917c58381cfba8c8ed8d4a9 ******/
		%feature("compactdefaultargs") SetVerticalAlignment;
		%feature("autodoc", "
Parameters
----------
theJustification: Graphic3d_VerticalTextAlignment

Return
-------
None

Description
-----------
Sets vertical alignment of text.
") SetVerticalAlignment;
		void SetVerticalAlignment(const Graphic3d_VerticalTextAlignment theJustification);

		/****** Graphic3d_Text::Text ******/
		/****** md5 signature: 5bba17eb833e5c94c8648407a843b411 ******/
		%feature("compactdefaultargs") Text;
		%feature("autodoc", "Return
-------
NCollection_String

Description
-----------
Returns text value.
") Text;
		const NCollection_String & Text();

		/****** Graphic3d_Text::TextFormatter ******/
		/****** md5 signature: 8f3bf7d01406c07afa85cad5f2782460 ******/
		%feature("compactdefaultargs") TextFormatter;
		%feature("autodoc", "Return
-------
opencascade::handle<Font_TextFormatter>

Description
-----------
Return: text formatter; NULL by default, which means standard text formatter will be used.
") TextFormatter;
		const opencascade::handle<Font_TextFormatter> & TextFormatter();

		/****** Graphic3d_Text::VerticalAlignment ******/
		/****** md5 signature: dbd4e8c974d13845b9700ce5eef112db ******/
		%feature("compactdefaultargs") VerticalAlignment;
		%feature("autodoc", "Return
-------
Graphic3d_VerticalTextAlignment

Description
-----------
Returns vertical alignment of text.
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
		/****** Graphic3d_TextureParams::Graphic3d_TextureParams ******/
		/****** md5 signature: 1f8634f1fd425055e350bfa7cb51434a ******/
		%feature("compactdefaultargs") Graphic3d_TextureParams;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") Graphic3d_TextureParams;
		 Graphic3d_TextureParams();

		/****** Graphic3d_TextureParams::AnisoFilter ******/
		/****** md5 signature: a1063e5b1b0fa8938fd8b3515bad43e0 ******/
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "Return
-------
Graphic3d_LevelOfTextureAnisotropy

Description
-----------
Return: level of anisontropy texture filter. Default value is Graphic3d_LOTA_OFF.
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter();

		/****** Graphic3d_TextureParams::BaseLevel ******/
		/****** md5 signature: b86c99c30cd2a55b335b81b746cb226f ******/
		%feature("compactdefaultargs") BaseLevel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return: base texture mipmap level; 0 by default.
") BaseLevel;
		int BaseLevel();

		/****** Graphic3d_TextureParams::Filter ******/
		/****** md5 signature: a357879488fd75e79ba560704b544b81 ******/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfTextureFilter

Description
-----------
Return: texture interpolation filter. Default value is Graphic3d_TOTF_NEAREST.
") Filter;
		Graphic3d_TypeOfTextureFilter Filter();

		/****** Graphic3d_TextureParams::GenMode ******/
		/****** md5 signature: 865c3f01d0a1a976e30ff5c43a0adb43 ******/
		%feature("compactdefaultargs") GenMode;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfTextureMode

Description
-----------
Return: texture coordinates generation mode. Default value is Graphic3d_TOTM_MANUAL.
") GenMode;
		Graphic3d_TypeOfTextureMode GenMode();

		/****** Graphic3d_TextureParams::GenPlaneS ******/
		/****** md5 signature: 1431f2d7f55dc5f3b14b83bffd272ba9 ******/
		%feature("compactdefaultargs") GenPlaneS;
		%feature("autodoc", "Return
-------
NCollection_Vec4<float>

Description
-----------
Return: texture coordinates generation plane S.
") GenPlaneS;
		const NCollection_Vec4<float> & GenPlaneS();

		/****** Graphic3d_TextureParams::GenPlaneT ******/
		/****** md5 signature: f66ae7213e287ef21a5db836178acf29 ******/
		%feature("compactdefaultargs") GenPlaneT;
		%feature("autodoc", "Return
-------
NCollection_Vec4<float>

Description
-----------
Return: texture coordinates generation plane T.
") GenPlaneT;
		const NCollection_Vec4<float> & GenPlaneT();

		/****** Graphic3d_TextureParams::IsModulate ******/
		/****** md5 signature: a508c77cf8188352101e0eaba91f0ce3 ******/
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True if the texture is modulate. Default value is False.
") IsModulate;
		bool IsModulate();

		/****** Graphic3d_TextureParams::IsRepeat ******/
		/****** md5 signature: f6f524949f3722e98f3243bbaba34d29 ******/
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: True if the texture repeat is enabled. Default value is False.
") IsRepeat;
		bool IsRepeat();

		/****** Graphic3d_TextureParams::MaxLevel ******/
		/****** md5 signature: 6bc4085a48fd7cf8abfc4f2e7ebeef76 ******/
		%feature("compactdefaultargs") MaxLevel;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return maximum texture mipmap array level; 1000 by default. Real rendering limit will take into account mipmap generation flags and presence of mipmaps in loaded image.
") MaxLevel;
		int MaxLevel();

		/****** Graphic3d_TextureParams::Rotation ******/
		/****** md5 signature: 77efdac4a3d2fa455fca675c8e5f45a8 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return rotation angle in degrees; 0 by default. Complete transformation matrix: Rotation -> Translation -> Scale.
") Rotation;
		float Rotation();

		/****** Graphic3d_TextureParams::SamplerRevision ******/
		/****** md5 signature: 40f8d1557d5754972b0c490348d69fc6 ******/
		%feature("compactdefaultargs") SamplerRevision;
		%feature("autodoc", "Return
-------
unsigned int

Description
-----------
Return modification counter of parameters related to sampler state.
") SamplerRevision;
		unsigned int SamplerRevision();

		/****** Graphic3d_TextureParams::Scale ******/
		/****** md5 signature: 2b98662a5e1d71c257ddc6c992026fa6 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
NCollection_Vec2<float>

Description
-----------
Return scale factor; (1.0; 1.0) by default, which means no scaling. Complete transformation matrix: Rotation -> Translation -> Scale.
") Scale;
		const NCollection_Vec2<float> & Scale();

		/****** Graphic3d_TextureParams::SetAnisoFilter ******/
		/****** md5 signature: 999fe7bc1a26aa6af8d56299c100b537 ******/
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "
Parameters
----------
theLevel: Graphic3d_LevelOfTextureAnisotropy

Return
-------
None

Description
-----------
Parameter theLevel level of anisontropy texture filter.
") SetAnisoFilter;
		void SetAnisoFilter(const Graphic3d_LevelOfTextureAnisotropy theLevel);

		/****** Graphic3d_TextureParams::SetFilter ******/
		/****** md5 signature: 3e35939457e589374a37bc96d8d155cb ******/
		%feature("compactdefaultargs") SetFilter;
		%feature("autodoc", "
Parameters
----------
theFilter: Graphic3d_TypeOfTextureFilter

Return
-------
None

Description
-----------
Parameter theFilter texture interpolation filter.
") SetFilter;
		void SetFilter(const Graphic3d_TypeOfTextureFilter theFilter);

		/****** Graphic3d_TextureParams::SetGenMode ******/
		/****** md5 signature: 243722066d8eb32ab79e26e8244ee1a0 ******/
		%feature("compactdefaultargs") SetGenMode;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TypeOfTextureMode
thePlaneS: NCollection_Vec4<float >
thePlaneT: NCollection_Vec4<float >

Return
-------
None

Description
-----------
Setup texture coordinates generation mode.
") SetGenMode;
		void SetGenMode(const Graphic3d_TypeOfTextureMode theMode, const NCollection_Vec4<float > thePlaneS, const NCollection_Vec4<float > thePlaneT);

		/****** Graphic3d_TextureParams::SetLevelsRange ******/
		/****** md5 signature: 2d65343812f67a1bdf75224c606ea047 ******/
		%feature("compactdefaultargs") SetLevelsRange;
		%feature("autodoc", "
Parameters
----------
theFirstLevel: int
theSecondLevel: int (optional, default to 0)

Return
-------
None

Description
-----------
Setups texture mipmap array levels range. The lowest value will be the base level. The remaining one will be the maximum level.
") SetLevelsRange;
		void SetLevelsRange(int theFirstLevel, int theSecondLevel = 0);

		/****** Graphic3d_TextureParams::SetModulate ******/
		/****** md5 signature: 132c8272b086b83b1eba5fb12fe1ac6e ******/
		%feature("compactdefaultargs") SetModulate;
		%feature("autodoc", "
Parameters
----------
theToModulate: bool

Return
-------
None

Description
-----------
Parameter theToModulate turn modulation on/off.
") SetModulate;
		void SetModulate(const bool theToModulate);

		/****** Graphic3d_TextureParams::SetRepeat ******/
		/****** md5 signature: 03f79bad88382b01cdfdde1a4a92930d ******/
		%feature("compactdefaultargs") SetRepeat;
		%feature("autodoc", "
Parameters
----------
theToRepeat: bool

Return
-------
None

Description
-----------
Parameter theToRepeat turn texture repeat mode ON or OFF (clamping).
") SetRepeat;
		void SetRepeat(const bool theToRepeat);

		/****** Graphic3d_TextureParams::SetRotation ******/
		/****** md5 signature: 03229416a9f7f88c5951282164eb7e82 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theAngleDegrees: float

Return
-------
None

Description
-----------
Parameter theAngleDegrees rotation angle.
") SetRotation;
		void SetRotation(const float theAngleDegrees);

		/****** Graphic3d_TextureParams::SetScale ******/
		/****** md5 signature: 04703800cbde3c675120908699b98946 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theScale: NCollection_Vec2<float >

Return
-------
None

Description
-----------
Parameter theScale scale factor.
") SetScale;
		void SetScale(const NCollection_Vec2<float > theScale);

		/****** Graphic3d_TextureParams::SetTextureUnit ******/
		/****** md5 signature: 393fd5a96f811431db83dea5936e3ae0 ******/
		%feature("compactdefaultargs") SetTextureUnit;
		%feature("autodoc", "
Parameters
----------
theUnit: Graphic3d_TextureUnit

Return
-------
None

Description
-----------
Setup default texture unit.
") SetTextureUnit;
		void SetTextureUnit(Graphic3d_TextureUnit theUnit);

		/****** Graphic3d_TextureParams::SetTranslation ******/
		/****** md5 signature: 9500664ee65dc0f91a32fda03b96f73d ******/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theVec: NCollection_Vec2<float >

Return
-------
None

Description
-----------
Parameter theVec translation vector.
") SetTranslation;
		void SetTranslation(const NCollection_Vec2<float > theVec);

		/****** Graphic3d_TextureParams::TextureUnit ******/
		/****** md5 signature: 6c8ba285b3ae7bd2d38f3d7687772552 ******/
		%feature("compactdefaultargs") TextureUnit;
		%feature("autodoc", "Return
-------
Graphic3d_TextureUnit

Description
-----------
Default texture unit to be used, default is Graphic3d_TextureUnit_BaseColor.
") TextureUnit;
		Graphic3d_TextureUnit TextureUnit();

		/****** Graphic3d_TextureParams::Translation ******/
		/****** md5 signature: 5f2c0a012d7007d3bb71142dad98c023 ******/
		%feature("compactdefaultargs") Translation;
		%feature("autodoc", "Return
-------
NCollection_Vec2<float>

Description
-----------
Return translation vector; (0.0; 0.0), which means no translation. Complete transformation matrix: Rotation -> Translation -> Scale.
") Translation;
		const NCollection_Vec2<float> & Translation();

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
		/****** Graphic3d_TextureRoot::GetCompressedImage ******/
		/****** md5 signature: 322f70ba268453e61044f97de1c28ac0 ******/
		%feature("compactdefaultargs") GetCompressedImage;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_CompressedPixMap>

Description
-----------
This method will be called by graphic driver each time when texture resource should be created. It is called in front of GetImage() for uploading compressed image formats natively supported by GPU. 
Input parameter: theSupported the list of supported compressed texture formats;  returning image in unsupported format will result in texture upload  failure 
Return: compressed pixmap or NULL if image is not in supported compressed format.
") GetCompressedImage;
		virtual opencascade::handle<Image_CompressedPixMap> GetCompressedImage(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** Graphic3d_TextureRoot::GetId ******/
		/****** md5 signature: 1df69bdce80fc1a96745f12b83255cb1 ******/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
This ID will be used to manage resource in graphic driver. //! Default implementation generates unique ID within constructor; inheritors may re-initialize it within their constructor, but should never modify it afterwards. //! Multiple Graphic3d_TextureRoot instances with same ID will be treated as single texture with different parameters to optimize memory usage though this will be more natural to use same instance of Graphic3d_TextureRoot when possible. //! If this ID is set to empty string by inheritor, then independent graphical resource will be created for each instance of Graphic3d_AspectFillArea3d where texture will be used. //! 
Return: texture identifier.
") GetId;
		const TCollection_AsciiString & GetId();

		/****** Graphic3d_TextureRoot::GetImage ******/
		/****** md5 signature: 27fa61f16bc56c895dcc1af9896bbe91 ******/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
This method will be called by graphic driver each time when texture resource should be created. Default constructors allow defining the texture source as path to texture image or directly as pixmap. If the source is defined as path, then the image will be dynamically loaded when this method is called (and no copy will be preserved in this class instance). Inheritors may dynamically generate the image. Notice, image data should be in Bottom-Up order (see Image_PixMap::IsTopDown())! 
Return: the image for texture.
") GetImage;
		virtual opencascade::handle<Image_PixMap> GetImage(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** Graphic3d_TextureRoot::GetParams ******/
		/****** md5 signature: 9bad86532a93a9e68d3d67730d29041c ******/
		%feature("compactdefaultargs") GetParams;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TextureParams>

Description
-----------
Return: low-level texture parameters.
") GetParams;
		const opencascade::handle<Graphic3d_TextureParams> & GetParams();

		/****** Graphic3d_TextureRoot::HasMipmaps ******/
		/****** md5 signature: 6398cc4985422addc3f64f52d79f06b4 ******/
		%feature("compactdefaultargs") HasMipmaps;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether mipmaps should be generated or not.
") HasMipmaps;
		bool HasMipmaps();

		/****** Graphic3d_TextureRoot::IsColorMap ******/
		/****** md5 signature: 47f2addd94fbf28d725413f747ad81d9 ******/
		%feature("compactdefaultargs") IsColorMap;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag indicating color nature of values within the texture; True by default. //! This flag will be used to interpret 8-bit per channel RGB(A) images as sRGB(A) textures with implicit linearizion of color components. Has no effect on images with floating point values (always considered linearized). //! When set to False, such images will be interpreted as textures will be linear component values, which is useful for RGB(A) textures defining non-color properties (like Normalmap/Metalness/Roughness).
") IsColorMap;
		bool IsColorMap();

		/****** Graphic3d_TextureRoot::IsDone ******/
		/****** md5 signature: 1945a479a0f142c1c7964194fe72a60d ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if a texture class is valid or not. 
Return: true if the construction of the class is correct.
") IsDone;
		virtual bool IsDone();

		/****** Graphic3d_TextureRoot::IsTopDown ******/
		/****** md5 signature: 6fb9e464630847b9af17c2500d451b2f ******/
		%feature("compactdefaultargs") IsTopDown;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether row's memory layout is top-down.
") IsTopDown;
		bool IsTopDown();

		/****** Graphic3d_TextureRoot::Path ******/
		/****** md5 signature: 9d11d277fbcc37203e7dc39c30ea2e54 ******/
		%feature("compactdefaultargs") Path;
		%feature("autodoc", "Return
-------
OSD_Path

Description
-----------
Returns the full path of the defined texture. It could be empty path if GetImage() is overridden to load image not from file.
") Path;
		const OSD_Path & Path();

		/****** Graphic3d_TextureRoot::Revision ******/
		/****** md5 signature: f614c1dea38767c7173b5e8c78d73993 ******/
		%feature("compactdefaultargs") Revision;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Return image revision.
") Revision;
		size_t Revision();

		/****** Graphic3d_TextureRoot::SetColorMap ******/
		/****** md5 signature: 235f58bcc0b4dc71f28e91741aef3bee ******/
		%feature("compactdefaultargs") SetColorMap;
		%feature("autodoc", "
Parameters
----------
theIsColor: bool

Return
-------
None

Description
-----------
Set flag indicating color nature of values within the texture.
") SetColorMap;
		void SetColorMap(bool theIsColor);

		/****** Graphic3d_TextureRoot::SetMipmapsGeneration ******/
		/****** md5 signature: 403a5ffc884feefadb3d4a8ee1576025 ******/
		%feature("compactdefaultargs") SetMipmapsGeneration;
		%feature("autodoc", "
Parameters
----------
theToGenerateMipmaps: bool

Return
-------
None

Description
-----------
Sets whether to generate mipmaps or not.
") SetMipmapsGeneration;
		void SetMipmapsGeneration(bool theToGenerateMipmaps);

		/****** Graphic3d_TextureRoot::TexturesFolder ******/
		/****** md5 signature: d0c7ddde8409f509c5551965f8259175 ******/
		%feature("compactdefaultargs") TexturesFolder;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
The path to textures determined from CSF_MDTVTexturesDirectory or CASROOT environment variables. 
Return: the root folder with default textures.
") TexturesFolder;
		static TCollection_AsciiString TexturesFolder();

		/****** Graphic3d_TextureRoot::Type ******/
		/****** md5 signature: 87a980c7b2776950ff29967ed1d02b26 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfTexture

Description
-----------
Return: the texture type.
") Type;
		Graphic3d_TypeOfTexture Type();

		/****** Graphic3d_TextureRoot::UpdateRevision ******/
		/****** md5 signature: c6fa6eed894b58a10a8244acfe852d71 ******/
		%feature("compactdefaultargs") UpdateRevision;
		%feature("autodoc", "Return
-------
None

Description
-----------
Update image revision. Can be used for signaling changes in the texture source (e.g. file update, pixmap update) without re-creating texture source itself (since unique id should be never modified).
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
class Graphic3d_TransformPers : public Standard_Transient {
	public:
		class PersParams3d {};
		class PersParams2d {};
		/****** Graphic3d_TransformPers::Graphic3d_TransformPers ******/
		/****** md5 signature: e5399f0d92c32c30dda437b6c88cb861 ******/
		%feature("compactdefaultargs") Graphic3d_TransformPers;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags

Return
-------
None

Description
-----------
Set transformation persistence.
") Graphic3d_TransformPers;
		 Graphic3d_TransformPers(const Graphic3d_TransModeFlags theMode);

		/****** Graphic3d_TransformPers::Graphic3d_TransformPers ******/
		/****** md5 signature: a245a37190e9f18adce1d9bb26438568 ******/
		%feature("compactdefaultargs") Graphic3d_TransformPers;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Set Zoom/Rotate transformation persistence with an anchor 3D point. Anchor point defines the origin of Local Coordinate system within World Coordinate system. Throws an exception if persistence mode is not Graphic3d_TMF_ZoomPers, Graphic3d_TMF_ZoomRotatePers or Graphic3d_TMF_RotatePers.
") Graphic3d_TransformPers;
		 Graphic3d_TransformPers(const Graphic3d_TransModeFlags theMode, const gp_Pnt & thePnt);

		/****** Graphic3d_TransformPers::Graphic3d_TransformPers ******/
		/****** md5 signature: 4b3f935d3030afcb11bf1e3820cb8fee ******/
		%feature("compactdefaultargs") Graphic3d_TransformPers;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags
theCorner: Aspect_TypeOfTriedronPosition
theOffset: NCollection_Vec2<int> (optional, default to NCollection_Vec2<int>(0,0))

Return
-------
None

Description
-----------
Set 2d/trihedron transformation persistence with a corner and 2D offset. 2D offset defines the origin of Local Coordinate system as projection of 2D point on screen plane into World Coordinate system. Throws an exception if persistence mode is not Graphic3d_TMF_TriedronPers or Graphic3d_TMF_2d. The offset is a positive displacement from the view corner in pixels.
") Graphic3d_TransformPers;
		 Graphic3d_TransformPers(const Graphic3d_TransModeFlags theMode, const Aspect_TypeOfTriedronPosition theCorner, const NCollection_Vec2<int> & theOffset = NCollection_Vec2<int>(0,0));

		/****** Graphic3d_TransformPers::AnchorPoint ******/
		/****** md5 signature: 24c970dd532b9a0543ee0f7fb95708ac ******/
		%feature("compactdefaultargs") AnchorPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return the anchor point for zoom/rotate transformation persistence.
") AnchorPoint;
		gp_Pnt AnchorPoint();

		/****** Graphic3d_TransformPers::ComputeApply ******/
		/****** md5 signature: 00ec93f596de745f3885b94ca06a1a8b ******/
		%feature("compactdefaultargs") ComputeApply;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera
theViewportWidth: int
theViewportHeight: int
theAnchor: gp_Pnt * (optional, default to nullptr)

Return
-------
NCollection_Mat4<double >

Description
-----------
Perform computations for applying transformation persistence on specified matrices. 
Input parameter: theCamera camera definition 
Input parameter: theViewportWidth viewport width 
Input parameter: theViewportHeight viewport height 
Input parameter: theAnchor if not NULL, overrides anchor point.
") ComputeApply;
		virtual NCollection_Mat4<double > ComputeApply(opencascade::handle<Graphic3d_Camera> & theCamera, const int theViewportWidth, const int theViewportHeight, const gp_Pnt * theAnchor = nullptr);

		/****** Graphic3d_TransformPers::Corner2d ******/
		/****** md5 signature: 47d0ef849af382ad94cf96ab6591598c ******/
		%feature("compactdefaultargs") Corner2d;
		%feature("autodoc", "Return
-------
Aspect_TypeOfTriedronPosition

Description
-----------
Return the corner for 2d/trihedron transformation persistence.
") Corner2d;
		Aspect_TypeOfTriedronPosition Corner2d();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_TransformPers::Flags ******/
		/****** md5 signature: 1ee922393b058833fc0aafbba922310e ******/
		%feature("compactdefaultargs") Flags;
		%feature("autodoc", "Return
-------
Graphic3d_TransModeFlags

Description
-----------
Transformation persistence mode flags.
") Flags;
		Graphic3d_TransModeFlags Flags();

		/****** Graphic3d_TransformPers::IsAxial ******/
		/****** md5 signature: 5ddbd6d1a16af5ae59bfcb2e050e5a0d ******/
		%feature("compactdefaultargs") IsAxial;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags

Return
-------
bool

Description
-----------
Return true if specified mode is axial transformation persistence.
") IsAxial;
		static bool IsAxial(Graphic3d_TransModeFlags theMode);

		/****** Graphic3d_TransformPers::IsAxial ******/
		/****** md5 signature: 834ae9417a10d70d203c1a0c503e30b7 ******/
		%feature("compactdefaultargs") IsAxial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true for Graphic3d_TMF_AxialScalePers modes.
") IsAxial;
		bool IsAxial();

		/****** Graphic3d_TransformPers::IsOrthoPers ******/
		/****** md5 signature: d09942842af2390079aaa7c4f4b6dda8 ******/
		%feature("compactdefaultargs") IsOrthoPers;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags

Return
-------
bool

Description
-----------
Return true if specified mode is orthographic projection transformation persistence.
") IsOrthoPers;
		static bool IsOrthoPers(Graphic3d_TransModeFlags theMode);

		/****** Graphic3d_TransformPers::IsOrthoPers ******/
		/****** md5 signature: 845cd63add1489d0a1ddc1929aa4dd19 ******/
		%feature("compactdefaultargs") IsOrthoPers;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true for Graphic3d_TMF_OrthoPers mode.
") IsOrthoPers;
		bool IsOrthoPers();

		/****** Graphic3d_TransformPers::IsTrihedronOr2d ******/
		/****** md5 signature: f5ff0bff0e446e5fe750929099bcad5a ******/
		%feature("compactdefaultargs") IsTrihedronOr2d;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags

Return
-------
bool

Description
-----------
Return true if specified mode is 2d/trihedron transformation persistence.
") IsTrihedronOr2d;
		static bool IsTrihedronOr2d(Graphic3d_TransModeFlags theMode);

		/****** Graphic3d_TransformPers::IsTrihedronOr2d ******/
		/****** md5 signature: 102184242a68f8883fa6db87f57b7395 ******/
		%feature("compactdefaultargs") IsTrihedronOr2d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true for Graphic3d_TMF_TriedronPers and Graphic3d_TMF_2d modes.
") IsTrihedronOr2d;
		bool IsTrihedronOr2d();

		/****** Graphic3d_TransformPers::IsZoomOrRotate ******/
		/****** md5 signature: 36867dfa55cd28661728c05a37221ec5 ******/
		%feature("compactdefaultargs") IsZoomOrRotate;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags

Return
-------
bool

Description
-----------
Return true if specified mode is zoom/rotate transformation persistence.
") IsZoomOrRotate;
		static bool IsZoomOrRotate(Graphic3d_TransModeFlags theMode);

		/****** Graphic3d_TransformPers::IsZoomOrRotate ******/
		/****** md5 signature: e21ca644a9fcd399a4a69671583441cb ******/
		%feature("compactdefaultargs") IsZoomOrRotate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true for Graphic3d_TMF_ZoomPers, Graphic3d_TMF_ZoomRotatePers or Graphic3d_TMF_RotatePers modes.
") IsZoomOrRotate;
		bool IsZoomOrRotate();

		/****** Graphic3d_TransformPers::Mode ******/
		/****** md5 signature: fc769168c308516a63fd1a068ba7ec96 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
Graphic3d_TransModeFlags

Description
-----------
Transformation persistence mode flags.
") Mode;
		Graphic3d_TransModeFlags Mode();

		/****** Graphic3d_TransformPers::Offset2d ******/
		/****** md5 signature: 9655eb260b5d2860c002d6bd73d9c347 ******/
		%feature("compactdefaultargs") Offset2d;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Return the offset from the corner for 2d/trihedron transformation persistence.
") Offset2d;
		NCollection_Vec2<int > Offset2d();

		/****** Graphic3d_TransformPers::SetAnchorPoint ******/
		/****** md5 signature: 791d6ffdf9f2a9e21b4091951f17aca3 ******/
		%feature("compactdefaultargs") SetAnchorPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Set the anchor point for zoom/rotate transformation persistence.
") SetAnchorPoint;
		void SetAnchorPoint(const gp_Pnt & thePnt);

		/****** Graphic3d_TransformPers::SetCorner2d ******/
		/****** md5 signature: 70376b1b4341ac8d3e2ef2d5291a020c ******/
		%feature("compactdefaultargs") SetCorner2d;
		%feature("autodoc", "
Parameters
----------
thePos: Aspect_TypeOfTriedronPosition

Return
-------
None

Description
-----------
Set the corner for 2d/trihedron transformation persistence.
") SetCorner2d;
		void SetCorner2d(const Aspect_TypeOfTriedronPosition thePos);

		/****** Graphic3d_TransformPers::SetOffset2d ******/
		/****** md5 signature: b92b32ff5e919e6e25df974a42ffd0a6 ******/
		%feature("compactdefaultargs") SetOffset2d;
		%feature("autodoc", "
Parameters
----------
theOffset: NCollection_Vec2<int>

Return
-------
None

Description
-----------
Set the offset from the corner for 2d/trihedron transformation persistence.
") SetOffset2d;
		void SetOffset2d(const NCollection_Vec2<int> & theOffset);

		/****** Graphic3d_TransformPers::SetPersistence ******/
		/****** md5 signature: 8d6cba5c3f91ef1d2aeb958fcae727e2 ******/
		%feature("compactdefaultargs") SetPersistence;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Set Zoom/Rotate transformation persistence with an anchor 3D point. Throws an exception if persistence mode is not Graphic3d_TMF_ZoomPers, Graphic3d_TMF_ZoomRotatePers or Graphic3d_TMF_RotatePers.
") SetPersistence;
		void SetPersistence(const Graphic3d_TransModeFlags theMode, const gp_Pnt & thePnt);

		/****** Graphic3d_TransformPers::SetPersistence ******/
		/****** md5 signature: fae5590e50ac28562ad077542cabb2fe ******/
		%feature("compactdefaultargs") SetPersistence;
		%feature("autodoc", "
Parameters
----------
theMode: Graphic3d_TransModeFlags
theCorner: Aspect_TypeOfTriedronPosition
theOffset: NCollection_Vec2<int>

Return
-------
None

Description
-----------
Set 2d/trihedron transformation persistence with a corner and 2D offset. Throws an exception if persistence mode is not Graphic3d_TMF_TriedronPers or Graphic3d_TMF_2d.
") SetPersistence;
		void SetPersistence(const Graphic3d_TransModeFlags theMode, const Aspect_TypeOfTriedronPosition theCorner, const NCollection_Vec2<int> & theOffset);

		/****** Graphic3d_TransformPers::persistentRotationMatrix ******/
		/****** md5 signature: 98b46ee1e6ad324c13b7057720f5abf3 ******/
		%feature("compactdefaultargs") persistentRotationMatrix;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera
theViewportWidth: int
theViewportHeight: int

Return
-------
NCollection_Mat3<double >

Description
-----------
Create orientation matrix based on camera and view dimensions. Default implementation locks rotation by nullifying rotation component. Camera and view dimensions are not used, by default. 
Input parameter: theCamera camera definition 
Input parameter: theViewportWidth the width of viewport 
Input parameter: theViewportHeight the height of viewport.
") persistentRotationMatrix;
		virtual NCollection_Mat3<double > persistentRotationMatrix(const opencascade::handle<Graphic3d_Camera> & theCamera, const int theViewportWidth, const int theViewportHeight);

		/****** Graphic3d_TransformPers::persistentScale ******/
		/****** md5 signature: 2dc244b699289932d0e368b2eb638f76 ******/
		%feature("compactdefaultargs") persistentScale;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera
theViewportWidth: int
theViewportHeight: int

Return
-------
double

Description
-----------
Find scale value based on the camera position and view dimensions 
Input parameter: theCamera camera definition 
Input parameter: theViewportWidth the width of viewport. 
Input parameter: theViewportHeight the height of viewport.
") persistentScale;
		virtual double persistentScale(const opencascade::handle<Graphic3d_Camera> & theCamera, const int theViewportWidth, const int theViewportHeight);

};


%make_alias(Graphic3d_TransformPers)

%extend Graphic3d_TransformPers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Graphic3d_UniformValueTypeID *
*************************************/
/**************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Mat3<float>> *
**************************************************************/
/**************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Mat4<float>> *
**************************************************************/
/**************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Vec2<float>> *
**************************************************************/
/************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Vec2<int>> *
************************************************************/
/**************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Vec3<float>> *
**************************************************************/
/************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Vec3<int>> *
************************************************************/
/**************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Vec4<float>> *
**************************************************************/
/************************************************************
* class Graphic3d_UniformValueTypeID<NCollection_Vec4<int>> *
************************************************************/
/********************************************
* class Graphic3d_UniformValueTypeID<float> *
********************************************/
/******************************************
* class Graphic3d_UniformValueTypeID<int> *
******************************************/
/****************************************
* class Graphic3d_ValidatedCubeMapOrder *
****************************************/
class Graphic3d_ValidatedCubeMapOrder {
	public:
		/****** Graphic3d_ValidatedCubeMapOrder::Graphic3d_ValidatedCubeMapOrder ******/
		/****** md5 signature: af4195bfb95b62310efc592339fde1b6 ******/
		%feature("compactdefaultargs") Graphic3d_ValidatedCubeMapOrder;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_ValidatedCubeMapOrder

Return
-------
None

Description
-----------
Copy constructor.
") Graphic3d_ValidatedCubeMapOrder;
		 Graphic3d_ValidatedCubeMapOrder(const Graphic3d_ValidatedCubeMapOrder & theOther);

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
		/****** Graphic3d_ValueInterface::TypeID ******/
		/****** md5 signature: f395cbdf6a68b582a274fcd529382735 ******/
		%feature("compactdefaultargs") TypeID;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Returns unique identifier of value type.
") TypeID;
		virtual size_t TypeID();

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
		/****** Graphic3d_Vertex::Graphic3d_Vertex ******/
		/****** md5 signature: 103e205f0886b0005b0cbeab1659769a ******/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a point with 0.0, 0.0, 0.0 coordinates.
") Graphic3d_Vertex;
		 Graphic3d_Vertex();

		/****** Graphic3d_Vertex::Graphic3d_Vertex ******/
		/****** md5 signature: 538f7e2e217da5570036db58ec83dab8 ******/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
None

Description
-----------
Creates a point with theX, theY and theZ coordinates.
") Graphic3d_Vertex;
		 Graphic3d_Vertex(const float theX, const float theY, const float theZ);

		/****** Graphic3d_Vertex::Graphic3d_Vertex ******/
		/****** md5 signature: b75605a15152c081e1fc9a8c407c41c1 ******/
		%feature("compactdefaultargs") Graphic3d_Vertex;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double

Return
-------
None

Description
-----------
Creates a point with theX, theY and theZ coordinates.
") Graphic3d_Vertex;
		 Graphic3d_Vertex(const double theX, const double theY, const double theZ);

		/****** Graphic3d_Vertex::Coord ******/
		/****** md5 signature: 95b29625f867fa36954cdf314fc6f2d4 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float
theZ: float

Description
-----------
Returns the coordinates.
") Coord;
		void Coord(Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** Graphic3d_Vertex::Coord ******/
		/****** md5 signature: caa64e5f56bc1bfd11661b1c0828bf96 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: double
theY: double
theZ: double

Description
-----------
Returns the coordinates.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Graphic3d_Vertex::Distance ******/
		/****** md5 signature: f2011914066011ae742c9ed1c4e7a629 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_Vertex

Return
-------
float

Description
-----------
Returns the distance between two points.
") Distance;
		float Distance(const Graphic3d_Vertex & theOther);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_Vertex::SetCoord ******/
		/****** md5 signature: 7df7dc87f2a22571351783f97e43c14d ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
None

Description
-----------
Modifies the coordinates.
") SetCoord;
		void SetCoord(const float theX, const float theY, const float theZ);

		/****** Graphic3d_Vertex::SetCoord ******/
		/****** md5 signature: 16fa848351891c619e7e27b4d76f229a ******/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double

Return
-------
None

Description
-----------
Modifies the coordinates.
") SetCoord;
		void SetCoord(const double theX, const double theY, const double theZ);

		/****** Graphic3d_Vertex::X ******/
		/****** md5 signature: 0cfba7351230618b13911dfb4a9a8ee1 ******/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the X coordinates.
") X;
		float X();

		/****** Graphic3d_Vertex::Y ******/
		/****** md5 signature: 059187e247495f7d821d07b693533de0 ******/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Y coordinate.
") Y;
		float Y();

		/****** Graphic3d_Vertex::Z ******/
		/****** md5 signature: 78492d7909b709ea0b26228e17b8dd23 ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Z coordinate.
") Z;
		float Z();

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
		/****** Graphic3d_ViewAffinity::Graphic3d_ViewAffinity ******/
		/****** md5 signature: c28b9859f1b5f4571ffe5d01bf2fbe3b ******/
		%feature("compactdefaultargs") Graphic3d_ViewAffinity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_ViewAffinity;
		 Graphic3d_ViewAffinity();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_ViewAffinity::IsVisible ******/
		/****** md5 signature: 24392749dd7aa4c890b7e28889a96a8f ******/
		%feature("compactdefaultargs") IsVisible;
		%feature("autodoc", "
Parameters
----------
theViewId: int

Return
-------
bool

Description
-----------
Return visibility flag.
") IsVisible;
		bool IsVisible(const int theViewId);

		/****** Graphic3d_ViewAffinity::SetVisible ******/
		/****** md5 signature: aeb41842fbcbc727c58e00ed3eb2ef17 ******/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "
Parameters
----------
theIsVisible: bool

Return
-------
None

Description
-----------
Setup visibility flag for all views.
") SetVisible;
		void SetVisible(const bool theIsVisible);

		/****** Graphic3d_ViewAffinity::SetVisible ******/
		/****** md5 signature: a16c335579c2f55beeacec2ea51dd280 ******/
		%feature("compactdefaultargs") SetVisible;
		%feature("autodoc", "
Parameters
----------
theViewId: int
theIsVisible: bool

Return
-------
None

Description
-----------
Setup visibility flag.
") SetVisible;
		void SetVisible(const int theViewId, const bool theIsVisible);

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
		/****** Graphic3d_WorldViewProjState::Graphic3d_WorldViewProjState ******/
		/****** md5 signature: f3b196715a217ca6c1db7f0c9868b4d7 ******/
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor.
") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState();

		/****** Graphic3d_WorldViewProjState::Graphic3d_WorldViewProjState ******/
		/****** md5 signature: 9bf1590a4dcba3478969811ca2062400 ******/
		%feature("compactdefaultargs") Graphic3d_WorldViewProjState;
		%feature("autodoc", "
Parameters
----------
theProjectionState: size_t
theWorldViewState: size_t
theCamera: Standard_Transient * (optional, default to nullptr)

Return
-------
None

Description
-----------
Constructor for custom projector type. 
Input parameter: theProjectionState the projection state. 
Input parameter: theWorldViewState the world view state. 
Input parameter: theCamera the pointer to the class supplying projection and  world view matrices (camera).
") Graphic3d_WorldViewProjState;
		 Graphic3d_WorldViewProjState(const size_t theProjectionState, const size_t theWorldViewState, const Standard_Transient * theCamera = nullptr);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_WorldViewProjState::Initialize ******/
		/****** md5 signature: a05c843dc4d36450528c2237c1adf544 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theProjectionState: size_t
theWorldViewState: size_t
theCamera: Standard_Transient * (optional, default to nullptr)

Return
-------
None

Description
-----------
Initialize world view projection state.
") Initialize;
		void Initialize(const size_t theProjectionState, const size_t theWorldViewState, const Standard_Transient * theCamera = nullptr);

		/****** Graphic3d_WorldViewProjState::Initialize ******/
		/****** md5 signature: ab22f42879ec26e1d5249c2c57af9c69 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theCamera: Standard_Transient * (optional, default to nullptr)

Return
-------
None

Description
-----------
Initialize world view projection state.
") Initialize;
		void Initialize(const Standard_Transient * theCamera = nullptr);

		/****** Graphic3d_WorldViewProjState::IsChanged ******/
		/****** md5 signature: 7a501bb952df2e589ed89a901bfa3dbc ******/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "
Parameters
----------
theState: Graphic3d_WorldViewProjState

Return
-------
bool

Description
-----------
Compare with other world view projection state. 
Return: true when the projection of the given camera state differs from this one.
") IsChanged;
		bool IsChanged(const Graphic3d_WorldViewProjState & theState);

		/****** Graphic3d_WorldViewProjState::IsProjectionChanged ******/
		/****** md5 signature: f9791145fd9e753bb6deff9f5af4915c ******/
		%feature("compactdefaultargs") IsProjectionChanged;
		%feature("autodoc", "
Parameters
----------
theState: Graphic3d_WorldViewProjState

Return
-------
bool

Description
-----------
Compare projection with other state. 
Return: true when the projection of the given camera state differs from this one.
") IsProjectionChanged;
		bool IsProjectionChanged(const Graphic3d_WorldViewProjState & theState);

		/****** Graphic3d_WorldViewProjState::IsValid ******/
		/****** md5 signature: 82efcf3e608ccd8c0d0a35a3a439a722 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check state validity. 
Return: true if state is set.
") IsValid;
		bool IsValid();

		/****** Graphic3d_WorldViewProjState::IsWorldViewChanged ******/
		/****** md5 signature: 84ec8be4dbdaee2066dd1a670b45456f ******/
		%feature("compactdefaultargs") IsWorldViewChanged;
		%feature("autodoc", "
Parameters
----------
theState: Graphic3d_WorldViewProjState

Return
-------
bool

Description
-----------
Compare world view transformation with other state. 
Return: true when the orientation of the given camera state differs from this one.
") IsWorldViewChanged;
		bool IsWorldViewChanged(const Graphic3d_WorldViewProjState & theState);

		/****** Graphic3d_WorldViewProjState::ProjectionState ******/
		/****** md5 signature: 962b4eaba206971d2fad9b5c155ae0e7 ******/
		%feature("compactdefaultargs") ProjectionState;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Return: projection state counter.
") ProjectionState;
		size_t & ProjectionState();

		/****** Graphic3d_WorldViewProjState::Reset ******/
		/****** md5 signature: e3081050d274769a1cd4a93969da94c6 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidate world view projection state.
") Reset;
		void Reset();

		/****** Graphic3d_WorldViewProjState::WorldViewState ******/
		/****** md5 signature: 4ed992a27b573afaac77f71af817d9d6 ******/
		%feature("compactdefaultargs") WorldViewState;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
Return: world view state counter.
") WorldViewState;
		size_t & WorldViewState();


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
		/****** Graphic3d_ZLayerSettings::Graphic3d_ZLayerSettings ******/
		/****** md5 signature: 61c792fdd142303f6bdad7c9f5308568 ******/
		%feature("compactdefaultargs") Graphic3d_ZLayerSettings;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default settings.
") Graphic3d_ZLayerSettings;
		 Graphic3d_ZLayerSettings();

		/****** Graphic3d_ZLayerSettings::ChangePolygonOffset ******/
		/****** md5 signature: 41fd26be43fe21937e5010441b302f14 ******/
		%feature("compactdefaultargs") ChangePolygonOffset;
		%feature("autodoc", "Return
-------
Graphic3d_PolygonOffset

Description
-----------
Modify glPolygonOffset() arguments.
") ChangePolygonOffset;
		Graphic3d_PolygonOffset & ChangePolygonOffset();

		/****** Graphic3d_ZLayerSettings::CullingDistance ******/
		/****** md5 signature: 1651b993fc5ea9f6f0f839ecaf0e5ff9 ******/
		%feature("compactdefaultargs") CullingDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return the distance to discard drawing of distant objects (distance from camera Eye point); by default it is Infinite (distance culling is disabled). Since camera eye definition has no strong meaning within orthographic projection, option is considered only within perspective projection. Note also that this option has effect only when frustum culling is enabled.
") CullingDistance;
		double CullingDistance();

		/****** Graphic3d_ZLayerSettings::CullingSize ******/
		/****** md5 signature: bca0100c54b91043c39d772c462acb6d ******/
		%feature("compactdefaultargs") CullingSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return the size to discard drawing of small objects; by default it is Infinite (size culling is disabled). Current implementation checks the length of projected diagonal of bounding box in pixels for discarding. Note that this option has effect only when frustum culling is enabled.
") CullingSize;
		double CullingSize();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_ZLayerSettings::HasCullingDistance ******/
		/****** md5 signature: c0ba20ce36ff498d0123c2a8aa264aa7 ******/
		%feature("compactdefaultargs") HasCullingDistance;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True, if culling of distant objects (distance culling) should be performed; False by default. 
See also: CullingDistance().
") HasCullingDistance;
		bool HasCullingDistance();

		/****** Graphic3d_ZLayerSettings::HasCullingSize ******/
		/****** md5 signature: bd0d848c58d141614e9de252339c719c ******/
		%feature("compactdefaultargs") HasCullingSize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True, if culling of small objects (size culling) should be performed; False by default. 
See also: CullingSize().
") HasCullingSize;
		bool HasCullingSize();

		/****** Graphic3d_ZLayerSettings::IsImmediate ******/
		/****** md5 signature: b1c2b3fe3127931d882e81ff690c0349 ******/
		%feature("compactdefaultargs") IsImmediate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if this layer should be drawn after all normal (non-immediate) layers.
") IsImmediate;
		bool IsImmediate();

		/****** Graphic3d_ZLayerSettings::IsRaytracable ******/
		/****** md5 signature: 10a915136ab59be96a23423984364ce3 ******/
		%feature("compactdefaultargs") IsRaytracable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if layer should be processed by ray-tracing renderer; True by default. Note that this flag is IGNORED for layers with IsImmediate() flag.
") IsRaytracable;
		bool IsRaytracable();

		/****** Graphic3d_ZLayerSettings::Lights ******/
		/****** md5 signature: 63f7d6694870edc26ea8df652c3f0f2b ******/
		%feature("compactdefaultargs") Lights;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_LightSet>

Description
-----------
Return lights list to be used for rendering presentations within this Z-Layer; NULL by default. NULL list (but not empty list!) means that default lights assigned to the View should be used instead of per-layer lights.
") Lights;
		const opencascade::handle<Graphic3d_LightSet> & Lights();

		/****** Graphic3d_ZLayerSettings::Name ******/
		/****** md5 signature: efed61b92683387cd746fb27e0376505 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return user-provided name.
") Name;
		const TCollection_AsciiString & Name();

		/****** Graphic3d_ZLayerSettings::Origin ******/
		/****** md5 signature: 294b7efa433672e306faca1de51564b0 ******/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Return the origin of all objects within the layer.
") Origin;
		const gp_XYZ Origin();

		/****** Graphic3d_ZLayerSettings::OriginTransformation ******/
		/****** md5 signature: 0f49de7d9e3a42a8f750204a13409c6c ******/
		%feature("compactdefaultargs") OriginTransformation;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Return the transformation to the origin.
") OriginTransformation;
		const opencascade::handle<TopLoc_Datum3D> & OriginTransformation();

		/****** Graphic3d_ZLayerSettings::PolygonOffset ******/
		/****** md5 signature: 5bc0db1ff0ef7eec07c4eb78b80f6cca ******/
		%feature("compactdefaultargs") PolygonOffset;
		%feature("autodoc", "Return
-------
Graphic3d_PolygonOffset

Description
-----------
Return glPolygonOffset() arguments.
") PolygonOffset;
		const Graphic3d_PolygonOffset & PolygonOffset();

		/****** Graphic3d_ZLayerSettings::SetClearDepth ******/
		/****** md5 signature: d2b02297755c2bff3d91800aab4b7847 ******/
		%feature("compactdefaultargs") SetClearDepth;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set if depth values should be cleared before drawing the layer.
") SetClearDepth;
		void SetClearDepth(const bool theValue);

		/****** Graphic3d_ZLayerSettings::SetCullingDistance ******/
		/****** md5 signature: 881aba1fd08f7dcb96ab5457833ac7af ******/
		%feature("compactdefaultargs") SetCullingDistance;
		%feature("autodoc", "
Parameters
----------
theDistance: double

Return
-------
None

Description
-----------
Set the distance to discard drawing objects.
") SetCullingDistance;
		void SetCullingDistance(double theDistance);

		/****** Graphic3d_ZLayerSettings::SetCullingSize ******/
		/****** md5 signature: 6b4f13d86e4191db6b506da6c1653a87 ******/
		%feature("compactdefaultargs") SetCullingSize;
		%feature("autodoc", "
Parameters
----------
theSize: double

Return
-------
None

Description
-----------
Set the distance to discard drawing objects.
") SetCullingSize;
		void SetCullingSize(double theSize);

		/****** Graphic3d_ZLayerSettings::SetDepthOffsetNegative ******/
		/****** md5 signature: 8504702a9a57f02a9fc5f9a049047757 ******/
		%feature("compactdefaultargs") SetDepthOffsetNegative;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets minimal possible negative depth offset.
") SetDepthOffsetNegative;
		void SetDepthOffsetNegative();

		/****** Graphic3d_ZLayerSettings::SetDepthOffsetPositive ******/
		/****** md5 signature: e5422a61a52cf834e79732a19c969150 ******/
		%feature("compactdefaultargs") SetDepthOffsetPositive;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets minimal possible positive depth offset.
") SetDepthOffsetPositive;
		void SetDepthOffsetPositive();

		/****** Graphic3d_ZLayerSettings::SetEnableDepthTest ******/
		/****** md5 signature: 1ca34af197a3573b1b3ca4ba5c9d9348 ******/
		%feature("compactdefaultargs") SetEnableDepthTest;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set if depth test should be enabled.
") SetEnableDepthTest;
		void SetEnableDepthTest(const bool theValue);

		/****** Graphic3d_ZLayerSettings::SetEnableDepthWrite ******/
		/****** md5 signature: 24181c0020cf446a2076f3f70ecaa79e ******/
		%feature("compactdefaultargs") SetEnableDepthWrite;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set if depth values should be written during rendering.
") SetEnableDepthWrite;
		void SetEnableDepthWrite(const bool theValue);

		/****** Graphic3d_ZLayerSettings::SetEnvironmentTexture ******/
		/****** md5 signature: 87d5ac3f126fba8f31a5fb1ad3c7ce1c ******/
		%feature("compactdefaultargs") SetEnvironmentTexture;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set the flag to allow/prevent environment texture mapping usage for specific layer.
") SetEnvironmentTexture;
		void SetEnvironmentTexture(const bool theValue);

		/****** Graphic3d_ZLayerSettings::SetImmediate ******/
		/****** md5 signature: 43858edf3ad9ce2db88ffaf4a3e6011b ******/
		%feature("compactdefaultargs") SetImmediate;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Set the flag indicating the immediate layer, which should be drawn after all normal (non-immediate) layers.
") SetImmediate;
		void SetImmediate(const bool theValue);

		/****** Graphic3d_ZLayerSettings::SetLights ******/
		/****** md5 signature: 853164d2a8de34064a3aea2df906c3fa ******/
		%feature("compactdefaultargs") SetLights;
		%feature("autodoc", "
Parameters
----------
theLights: Graphic3d_LightSet

Return
-------
None

Description
-----------
Assign lights list to be used.
") SetLights;
		void SetLights(const opencascade::handle<Graphic3d_LightSet> & theLights);

		/****** Graphic3d_ZLayerSettings::SetName ******/
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
Set custom name.
") SetName;
		void SetName(TCollection_AsciiString theName);

		/****** Graphic3d_ZLayerSettings::SetOrigin ******/
		/****** md5 signature: 4e4636f1039090357f364099b018aa8c ******/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "
Parameters
----------
theOrigin: gp_XYZ

Return
-------
None

Description
-----------
Set the origin of all objects within the layer.
") SetOrigin;
		void SetOrigin(const gp_XYZ & theOrigin);

		/****** Graphic3d_ZLayerSettings::SetPolygonOffset ******/
		/****** md5 signature: 683821e43c43689ce29cb4e52c777595 ******/
		%feature("compactdefaultargs") SetPolygonOffset;
		%feature("autodoc", "
Parameters
----------
theParams: Graphic3d_PolygonOffset

Return
-------
None

Description
-----------
Setup glPolygonOffset() arguments.
") SetPolygonOffset;
		void SetPolygonOffset(const Graphic3d_PolygonOffset & theParams);

		/****** Graphic3d_ZLayerSettings::SetRaytracable ******/
		/****** md5 signature: 69915e3e9be1e35dbac43cda28bcbe6d ******/
		%feature("compactdefaultargs") SetRaytracable;
		%feature("autodoc", "
Parameters
----------
theToRaytrace: bool

Return
-------
None

Description
-----------
Sets if layer should be processed by ray-tracing renderer.
") SetRaytracable;
		void SetRaytracable(bool theToRaytrace);

		/****** Graphic3d_ZLayerSettings::SetRenderInDepthPrepass ******/
		/****** md5 signature: 25ed0c7641c1331994a5e05bf510c712 ******/
		%feature("compactdefaultargs") SetRenderInDepthPrepass;
		%feature("autodoc", "
Parameters
----------
theToRender: bool

Return
-------
None

Description
-----------
Set if layer should be rendered within depth pre-pass.
") SetRenderInDepthPrepass;
		void SetRenderInDepthPrepass(bool theToRender);

		/****** Graphic3d_ZLayerSettings::ToClearDepth ******/
		/****** md5 signature: 03f997f6e2f2b6a9946627c161bfe677 ******/
		%feature("compactdefaultargs") ToClearDepth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if depth values should be cleared before drawing the layer.
") ToClearDepth;
		bool ToClearDepth();

		/****** Graphic3d_ZLayerSettings::ToEnableDepthTest ******/
		/****** md5 signature: 8853cb9224c36454609824e6c62f9b39 ******/
		%feature("compactdefaultargs") ToEnableDepthTest;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if depth test should be enabled.
") ToEnableDepthTest;
		bool ToEnableDepthTest();

		/****** Graphic3d_ZLayerSettings::ToEnableDepthWrite ******/
		/****** md5 signature: 93e4f2fc4ff8e718cf21fd0af4dbee8a ******/
		%feature("compactdefaultargs") ToEnableDepthWrite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true depth values should be written during rendering.
") ToEnableDepthWrite;
		bool ToEnableDepthWrite();

		/****** Graphic3d_ZLayerSettings::ToRenderInDepthPrepass ******/
		/****** md5 signature: f77631262351887396943aeabf800fbf ******/
		%feature("compactdefaultargs") ToRenderInDepthPrepass;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if layer should be rendered within depth pre-pass; True by default.
") ToRenderInDepthPrepass;
		bool ToRenderInDepthPrepass();

		/****** Graphic3d_ZLayerSettings::UseEnvironmentTexture ******/
		/****** md5 signature: bd61fd084756985e8d430df105368381 ******/
		%feature("compactdefaultargs") UseEnvironmentTexture;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to allow/prevent environment texture mapping usage for specific layer.
") UseEnvironmentTexture;
		bool UseEnvironmentTexture();

};


%extend Graphic3d_ZLayerSettings {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class MatrixType *
*******************/
/***************************
* class MatrixType<double> *
***************************/
/**************************
* class MatrixType<float> *
**************************/
/*******************
* class VectorType *
*******************/
/***************************
* class VectorType<double> *
***************************/
/**************************
* class VectorType<float> *
**************************/
/********************************
* class Graphic3d_ArrayOfPoints *
********************************/
class Graphic3d_ArrayOfPoints : public Graphic3d_ArrayOfPrimitives {
	public:
		/****** Graphic3d_ArrayOfPoints::Graphic3d_ArrayOfPoints ******/
		/****** md5 signature: a73436f44ba342b5fbb3fc40b5e04688 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of points (Graphic3d_TOPA_POINTS). The array must be filled using the AddVertex(Point) method. 
Parameter theMaxVertexs maximum number of points 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints(int theMaxVertexs, int theArrayFlags);

		/****** Graphic3d_ArrayOfPoints::Graphic3d_ArrayOfPoints ******/
		/****** md5 signature: e15a0c7eb630965009fcc87c0391c375 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPoints;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theHasVColors: bool (optional, default to false)
theHasVNormals: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of points (Graphic3d_TOPA_POINTS). The array must be filled using the AddVertex(Point) method. 
Parameter theMaxVertexs maximum number of points 
Parameter theHasVColors when True, AddVertex(Point,Color) should be used for specifying vertex color 
Parameter theHasVNormals when True, AddVertex(Point,Normal) should be used for specifying vertex normal.
") Graphic3d_ArrayOfPoints;
		 Graphic3d_ArrayOfPoints(int theMaxVertexs, bool theHasVColors = false, bool theHasVNormals = false);

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
		/****** Graphic3d_ArrayOfPolygons::Graphic3d_ArrayOfPolygons ******/
		/****** md5 signature: 29c0e22bc3a2fbadf9c6b5ce09ce7c3f ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxBounds: int
theMaxEdges: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of polygons (Graphic3d_TOPA_POLYGONS), a polygon can be filled as: 1) Creating a single polygon defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfPolygons (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate polygons defined with a predefined number of bounds and the number of vertex per bound, i.e: @code myArray = Graphic3d_ArrayOfPolygons (7, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (3); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x7, y7, z7); @endcode 3) Creating a single indexed polygon defined with his vertex ans edges, i.e: @code myArray = Graphic3d_ArrayOfPolygons (4, 0, 6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (4); @endcode 4) Creating separate polygons defined with a predefined number of bounds and the number of edges per bound, i.e: @code myArray = Graphic3d_ArrayOfPolygons (6, 4, 14); myArray->AddBound (3); myArray->AddVertex (x1, y1, z1); myArray->AddVertex (x2, y2, z2); myArray->AddVertex (x3, y3, z3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddBound (3); myArray->AddVertex (x4, y4, z4); myArray->AddVertex (x5, y5, z5); myArray->AddVertex (x6, y6, z6); myArray->AddEdge (4); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (1); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (4); @endcode 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxBounds defines the maximum allowed bound number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons(int theMaxVertexs, int theMaxBounds, int theMaxEdges, int theArrayFlags);

		/****** Graphic3d_ArrayOfPolygons::Graphic3d_ArrayOfPolygons ******/
		/****** md5 signature: 42e754ec1b2c42447a6d220a7daffd60 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolygons;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxBounds: int (optional, default to 0)
theMaxEdges: int (optional, default to 0)
theHasVNormals: bool (optional, default to false)
theHasVColors: bool (optional, default to false)
theHasBColors: bool (optional, default to false)
theHasVTexels: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of polygons (Graphic3d_TOPA_POLYGONS): 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxBounds defines the maximum allowed bound number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array.
") Graphic3d_ArrayOfPolygons;
		 Graphic3d_ArrayOfPolygons(const int theMaxVertexs, const int theMaxBounds = 0, const int theMaxEdges = 0, const bool theHasVNormals = false, const bool theHasVColors = false, const bool theHasBColors = false, const bool theHasVTexels = false);

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
		/****** Graphic3d_ArrayOfPolylines::Graphic3d_ArrayOfPolylines ******/
		/****** md5 signature: 94feac9d2321b2201aca0dec5882ded6 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxBounds: int
theMaxEdges: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of polylines (Graphic3d_TOPA_POLYLINES), a polyline can be filled as: 1) Creating a single polyline defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfPolylines (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate polylines defined with a predefined number of bounds and the number of vertex per bound, i.e: @code myArray = Graphic3d_ArrayOfPolylines (7, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (3); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x7, y7, z7); @endcode 3) Creating a single indexed polyline defined with his vertex and edges, i.e: @code myArray = Graphic3d_ArrayOfPolylines (4, 0, 6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (4); @endcode 4) creating separate polylines defined with a predefined number of bounds and the number of edges per bound, i.e: @code myArray = Graphic3d_ArrayOfPolylines (6, 4, 14); myArray->AddBound (3); myArray->AddVertex (x1, y1, z1); myArray->AddVertex (x2, y2, z2); myArray->AddVertex (x3, y3, z3); myArray->AddEdge (1); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddBound (3); myArray->AddVertex (x4, y4, z4); myArray->AddVertex (x5, y5, z5); myArray->AddVertex (x6, y6, z6); myArray->AddEdge (4); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (2); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (6); myArray->AddBound (4); myArray->AddEdge (1); myArray->AddEdge (3); myArray->AddEdge (5); myArray->AddEdge (4); @endcode 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxBounds defines the maximum allowed bound number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines(int theMaxVertexs, int theMaxBounds, int theMaxEdges, int theArrayFlags);

		/****** Graphic3d_ArrayOfPolylines::Graphic3d_ArrayOfPolylines ******/
		/****** md5 signature: 254b66262fff95cc8978b6c9b77fc406 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfPolylines;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxBounds: int (optional, default to 0)
theMaxEdges: int (optional, default to 0)
theHasVColors: bool (optional, default to false)
theHasBColors: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of polylines (Graphic3d_TOPA_POLYLINES). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxBounds defines the maximum allowed bound number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array 
Parameter theHasVColors when True AddVertex(Point,Color) or AddVertex(Point,Normal,Color) should be used to specify per-vertex color values 
Parameter theHasBColors when True AddBound(number,Color) should be used to specify sub-group color.
") Graphic3d_ArrayOfPolylines;
		 Graphic3d_ArrayOfPolylines(int theMaxVertexs, int theMaxBounds = 0, int theMaxEdges = 0, bool theHasVColors = false, bool theHasBColors = false);

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
		/****** Graphic3d_ArrayOfQuadrangleStrips::Graphic3d_ArrayOfQuadrangleStrips ******/
		/****** md5 signature: b9479025bff2680289e27fb795d5403b ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxStrips: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of quadrangle strips (Graphic3d_TOPA_QUADRANGLESTRIPS), a polygon can be filled as: 1) Creating a single strip defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfQuadrangleStrips (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate strips defined with a predefined number of strips and the number of vertex per strip, i.e: @code myArray = Graphic3d_ArrayOfQuadrangleStrips (8, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (4); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x8, y8, z8); @endcode The number of quadrangle really drawn is: VertexNumber()/2 - std::min(1, BoundNumber()). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxStrips defines the maximum allowed strip number in the array 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips(int theMaxVertexs, int theMaxStrips, int theArrayFlags);

		/****** Graphic3d_ArrayOfQuadrangleStrips::Graphic3d_ArrayOfQuadrangleStrips ******/
		/****** md5 signature: aab23962578d5aed72fef132ec9ffaf9 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangleStrips;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxStrips: int (optional, default to 0)
theHasVNormals: bool (optional, default to false)
theHasVColors: bool (optional, default to false)
theHasSColors: bool (optional, default to false)
theHasVTexels: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of quadrangle strips (Graphic3d_TOPA_QUADRANGLESTRIPS). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxStrips defines the maximum allowed strip number in the array.
") Graphic3d_ArrayOfQuadrangleStrips;
		 Graphic3d_ArrayOfQuadrangleStrips(int theMaxVertexs, int theMaxStrips = 0, bool theHasVNormals = false, bool theHasVColors = false, bool theHasSColors = false, bool theHasVTexels = false);

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
		/****** Graphic3d_ArrayOfQuadrangles::Graphic3d_ArrayOfQuadrangles ******/
		/****** md5 signature: 716bc168c815c8ad13db365751d3ef0e ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of quadrangles (Graphic3d_TOPA_QUADRANGLES), a quadrangle can be filled as: 1) Creating a set of quadrangles defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfQuadrangles (8); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x8, y8, z8); @endcode 2) Creating a set of indexed quadrangles defined with his vertex ans edges, i.e: @code myArray = Graphic3d_ArrayOfQuadrangles (6, 8); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x6, y6, z6); myArray->AddEdges (1, 2, 3, 4); myArray->AddEdges (3, 4, 5, 6); @endcode 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array (for indexed array) 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles(int theMaxVertexs, int theMaxEdges, int theArrayFlags);

		/****** Graphic3d_ArrayOfQuadrangles::Graphic3d_ArrayOfQuadrangles ******/
		/****** md5 signature: 2fef6a607f8f01028f69f1711536da33 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfQuadrangles;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxEdges: int (optional, default to 0)
theHasVNormals: bool (optional, default to false)
theHasVColors: bool (optional, default to false)
theHasVTexels: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of quadrangles (Graphic3d_TOPA_QUADRANGLES). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array (for indexed array).
") Graphic3d_ArrayOfQuadrangles;
		 Graphic3d_ArrayOfQuadrangles(int theMaxVertexs, int theMaxEdges = 0, bool theHasVNormals = false, bool theHasVColors = false, bool theHasVTexels = false);

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
		/****** Graphic3d_ArrayOfSegments::Graphic3d_ArrayOfSegments ******/
		/****** md5 signature: bbf38052f7634500e1b9ec4e766051fd ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of segments (Graphic3d_TOPA_SEGMENTS), a segment can be filled as: 1) Creating a set of segments defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfSegments (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); @endcode 2) Creating a set of indexed segments defined with his vertex and edges, i.e: @code myArray = Graphic3d_ArrayOfSegments (4, 8); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdges (1, 2); myArray->AddEdges (3, 4); myArray->AddEdges (2, 4); myArray->AddEdges (1, 3); @endcode 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments(int theMaxVertexs, int theMaxEdges, int theArrayFlags);

		/****** Graphic3d_ArrayOfSegments::Graphic3d_ArrayOfSegments ******/
		/****** md5 signature: 58b749ae48391c2e8335c1121f5eeedb ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfSegments;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxEdges: int (optional, default to 0)
theHasVColors: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of segments (Graphic3d_TOPA_SEGMENTS). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array 
Parameter theHasVColors when True, AddVertex(Point,Color) should be used for specifying vertex color.
") Graphic3d_ArrayOfSegments;
		 Graphic3d_ArrayOfSegments(int theMaxVertexs, int theMaxEdges = 0, bool theHasVColors = false);

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
		/****** Graphic3d_ArrayOfTriangleFans::Graphic3d_ArrayOfTriangleFans ******/
		/****** md5 signature: 78bd7bc2a60b67b7644408ac5e75a431 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxFans: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of triangle fans (Graphic3d_TOPA_TRIANGLEFANS), a polygon can be filled as: 1) Creating a single fan defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfTriangleFans (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) creating separate fans defined with a predefined number of fans and the number of vertex per fan, i.e: @code myArray = Graphic3d_ArrayOfTriangleFans (8, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (4); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x8, y8, z8); @endcode The number of triangle really drawn is: VertexNumber() - 2 * std::min(1, BoundNumber()) 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxFans defines the maximum allowed fan number in the array 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans(int theMaxVertexs, int theMaxFans, int theArrayFlags);

		/****** Graphic3d_ArrayOfTriangleFans::Graphic3d_ArrayOfTriangleFans ******/
		/****** md5 signature: ac9f13af97e9583e44936874770b92bc ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleFans;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxFans: int (optional, default to 0)
theHasVNormals: bool (optional, default to false)
theHasVColors: bool (optional, default to false)
theHasBColors: bool (optional, default to false)
theHasVTexels: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of triangle fans (Graphic3d_TOPA_TRIANGLEFANS). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxFans defines the maximum allowed fan number in the array.
") Graphic3d_ArrayOfTriangleFans;
		 Graphic3d_ArrayOfTriangleFans(int theMaxVertexs, int theMaxFans = 0, bool theHasVNormals = false, bool theHasVColors = false, bool theHasBColors = false, bool theHasVTexels = false);

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
		/****** Graphic3d_ArrayOfTriangleStrips::Graphic3d_ArrayOfTriangleStrips ******/
		/****** md5 signature: d8d6a9289fea3bb4f4eaeccab126b8d0 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxStrips: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of triangle strips (Graphic3d_TOPA_TRIANGLESTRIPS), a polygon can be filled as: 1) Creating a single strip defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfTriangleStrips (7); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x7, y7, z7); @endcode 2) Creating separate strips defined with a predefined number of strips and the number of vertex per strip, i.e: @code myArray = Graphic3d_ArrayOfTriangleStrips (8, 2); myArray->AddBound (4); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddBound (4); myArray->AddVertex (x5, y5, z5); .... myArray->AddVertex (x8, y8, z8); @endcode 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxStrips defines the maximum allowed strip number in the array;  the number of triangle really drawn is: VertexNumber() - 2 * std::min(1,  BoundNumber()) 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips(int theMaxVertexs, int theMaxStrips, int theArrayFlags);

		/****** Graphic3d_ArrayOfTriangleStrips::Graphic3d_ArrayOfTriangleStrips ******/
		/****** md5 signature: 585585c6a51b36994d55e30d7e90cbc4 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangleStrips;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxStrips: int (optional, default to 0)
theHasVNormals: bool (optional, default to false)
theHasVColors: bool (optional, default to false)
theHasBColors: bool (optional, default to false)
theHasVTexels: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of triangle strips (Graphic3d_TOPA_TRIANGLESTRIPS). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxStrips defines the maximum allowed strip number in the array;  the number of triangle really drawn is: VertexNumber() - 2 * std::min(1,  BoundNumber()) 
Parameter theHasVNormals when True, AddVertex(Point,Normal), AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) should be used to specify vertex normal;  vertex normals should be specified coherent to triangle orientation  (defined by order of vertexes within triangle) for proper rendering 
Parameter theHasVColors when True, AddVertex(Point,Color) or AddVertex(Point,Normal,Color) should be used to specify vertex color 
Parameter theHasBColors when True, AddBound(number,Color) should be used to specify sub-group color 
Parameter theHasVTexels when True, AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) should be used to specify vertex UV coordinates.
") Graphic3d_ArrayOfTriangleStrips;
		 Graphic3d_ArrayOfTriangleStrips(int theMaxVertexs, int theMaxStrips = 0, bool theHasVNormals = false, bool theHasVColors = false, bool theHasBColors = false, bool theHasVTexels = false);

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
		/****** Graphic3d_ArrayOfTriangles::Graphic3d_ArrayOfTriangles ******/
		/****** md5 signature: de479a70b1bba29be5708b87a8978341 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxEdges: int
theArrayFlags: int

Return
-------
None

Description
-----------
Creates an array of triangles (Graphic3d_TOPA_TRIANGLES), a triangle can be filled as: 1) Creating a set of triangles defined with his vertexes, i.e: @code myArray = Graphic3d_ArrayOfTriangles (6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x6, y6, z6); @endcode 3) Creating a set of indexed triangles defined with his vertex and edges, i.e: @code myArray = Graphic3d_ArrayOfTriangles (4, 6); myArray->AddVertex (x1, y1, z1); .... myArray->AddVertex (x4, y4, z4); myArray->AddEdges (1, 2, 3); myArray->AddEdges (2, 3, 4); @endcode 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array 
Parameter theArrayFlags array flags.
") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles(int theMaxVertexs, int theMaxEdges, int theArrayFlags);

		/****** Graphic3d_ArrayOfTriangles::Graphic3d_ArrayOfTriangles ******/
		/****** md5 signature: 5c8d24d7680c982e5af47d137f187328 ******/
		%feature("compactdefaultargs") Graphic3d_ArrayOfTriangles;
		%feature("autodoc", "
Parameters
----------
theMaxVertexs: int
theMaxEdges: int (optional, default to 0)
theHasVNormals: bool (optional, default to false)
theHasVColors: bool (optional, default to false)
theHasVTexels: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates an array of triangles (Graphic3d_TOPA_TRIANGLES). 
Parameter theMaxVertexs defines the maximum allowed vertex number in the array 
Parameter theMaxEdges defines the maximum allowed edge number in the array 
Parameter theHasVNormals when True, AddVertex(Point,Normal), AddVertex(Point,Normal,Color) or AddVertex(Point,Normal,Texel) should be used to specify vertex normal;  vertex normals should be specified coherent to triangle orientation  (defined by order of vertexes within triangle) for proper rendering 
Parameter theHasVColors when True, AddVertex(Point,Color) or AddVertex(Point,Normal,Color) should be used to specify vertex color 
Parameter theHasVTexels when True, AddVertex(Point,Texel) or AddVertex(Point,Normal,Texel) should be used to specify vertex UV coordinates.
") Graphic3d_ArrayOfTriangles;
		 Graphic3d_ArrayOfTriangles(int theMaxVertexs, int theMaxEdges = 0, bool theHasVNormals = false, bool theHasVColors = false, bool theHasVTexels = false);

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
		/****** Graphic3d_AspectFillArea3d::Graphic3d_AspectFillArea3d ******/
		/****** md5 signature: fc9693ef99225219e1bd8c3ab519d2a4 ******/
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a context table for fill area primitives defined with the following default values: //! InteriorStyle: Aspect_IS_EMPTY InteriorColor: Quantity_NOC_CYAN1 EdgeColor: Quantity_NOC_WHITE EdgeLineType: Aspect_TOL_SOLID EdgeWidth: 1.0 FrontMaterial: NOM_BRASS BackMaterial: NOM_BRASS HatchStyle: Aspect_HS_SOLID //! Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d();

		/****** Graphic3d_AspectFillArea3d::Graphic3d_AspectFillArea3d ******/
		/****** md5 signature: 1f8380b33302ba46602c857b75bd2f7c ******/
		%feature("compactdefaultargs") Graphic3d_AspectFillArea3d;
		%feature("autodoc", "
Parameters
----------
theInterior: Aspect_InteriorStyle
theInteriorColor: Quantity_Color
theEdgeColor: Quantity_Color
theEdgeLineType: Aspect_TypeOfLine
theEdgeWidth: double
theFrontMaterial: Graphic3d_MaterialAspect
theBackMaterial: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Creates a context table for fill area primitives defined with the specified values. Display of back-facing filled polygons. No distinction between external and internal faces of FillAreas. The edges are not drawn. Polygon offset parameters: mode = Aspect_POM_None, factor = 1., units = 0.
") Graphic3d_AspectFillArea3d;
		 Graphic3d_AspectFillArea3d(const Aspect_InteriorStyle theInterior, const Quantity_Color & theInteriorColor, const Quantity_Color & theEdgeColor, const Aspect_TypeOfLine theEdgeLineType, const double theEdgeWidth, const Graphic3d_MaterialAspect & theFrontMaterial, const Graphic3d_MaterialAspect & theBackMaterial);

		/****** Graphic3d_AspectFillArea3d::Edge ******/
		/****** md5 signature: f282c08249e0c353d7b7113fe2375737 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
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
		/****** Graphic3d_AspectLine3d::Graphic3d_AspectLine3d ******/
		/****** md5 signature: ae16253e3fb05b880b08c284f9894b56 ******/
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a context table for line primitives defined with the following default values: //! Color = Quantity_NOC_YELLOW; Type = Aspect_TOL_SOLID; Width = 1.0;.
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d();

		/****** Graphic3d_AspectLine3d::Graphic3d_AspectLine3d ******/
		/****** md5 signature: 8ad564d48700cc49bf11fbee0bebdae7 ******/
		%feature("compactdefaultargs") Graphic3d_AspectLine3d;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theType: Aspect_TypeOfLine
theWidth: double

Return
-------
None

Description
-----------
Creates a context table for line primitives defined with the specified values. Warning: theWidth is the 'line width scale factor'. The nominal line width is 1 pixel. The width of the line is determined by applying the line width scale factor to this nominal line width. The supported line widths vary by 1-pixel units.
") Graphic3d_AspectLine3d;
		 Graphic3d_AspectLine3d(const Quantity_Color & theColor, Aspect_TypeOfLine theType, double theWidth);

		/****** Graphic3d_AspectLine3d::SetType ******/
		/****** md5 signature: 1258fda167a7e43236300c87e492edae ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfLine

Return
-------
None

Description
-----------
Modifies the type of line.
") SetType;
		void SetType(const Aspect_TypeOfLine theType);

		/****** Graphic3d_AspectLine3d::SetWidth ******/
		/****** md5 signature: dca96455ca545124c2c49422e4d8c257 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: double

Return
-------
None

Description
-----------
Modifies the line thickness. Warning: Raises Standard_OutOfRange if the width is a negative value.
") SetWidth;
		void SetWidth(const double theWidth);

		/****** Graphic3d_AspectLine3d::SetWidth ******/
		/****** md5 signature: 594714f2ecb58ad7677be171e2b8c7a0 ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: float

Return
-------
None

Description
-----------
Modifies the line thickness. Warning: Raises Standard_OutOfRange if the width is a negative value.
") SetWidth;
		void SetWidth(float theWidth);

		/****** Graphic3d_AspectLine3d::Type ******/
		/****** md5 signature: 69333bf72673a8c7a5413520ea633cca ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Aspect_TypeOfLine

Description
-----------
Return line type.
") Type;
		Aspect_TypeOfLine Type();

		/****** Graphic3d_AspectLine3d::Width ******/
		/****** md5 signature: 83fcbdced08f372293662700e8ec1b84 ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return line width.
") Width;
		float Width();

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
		/****** Graphic3d_AspectMarker3d::Graphic3d_AspectMarker3d ******/
		/****** md5 signature: c51eae27bcfca01452a3972b6341bd3a ******/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a context table for marker primitives defined with the following default values: //! Marker type: TOM_X Color: YELLOW Scale factor: 1.0.
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d();

		/****** Graphic3d_AspectMarker3d::Graphic3d_AspectMarker3d ******/
		/****** md5 signature: 3d57af3cbba3938f3ead60e4876d9eb4 ******/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfMarker
theColor: Quantity_Color
theScale: double

Return
-------
None

Description
-----------
No available documentation.
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d(const Aspect_TypeOfMarker theType, const Quantity_Color & theColor, const double theScale);

		/****** Graphic3d_AspectMarker3d::Graphic3d_AspectMarker3d ******/
		/****** md5 signature: d251d7bb43c73939b73db06c71c2ed69 ******/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theWidth: int
theHeight: int
theTextureBitmap: TColStd_HArray1OfByte

Return
-------
None

Description
-----------
Creates a context table for marker primitives defined with the specified values.
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d(const Quantity_Color & theColor, const int theWidth, const int theHeight, const opencascade::handle<TColStd_HArray1OfByte> & theTextureBitmap);

		/****** Graphic3d_AspectMarker3d::Graphic3d_AspectMarker3d ******/
		/****** md5 signature: 19dbb9e9a8dcd21db65647860865917a ******/
		%feature("compactdefaultargs") Graphic3d_AspectMarker3d;
		%feature("autodoc", "
Parameters
----------
theTextureImage: Image_PixMap

Return
-------
None

Description
-----------
Creates a context table for marker primitives defined with the specified values.
") Graphic3d_AspectMarker3d;
		 Graphic3d_AspectMarker3d(const opencascade::handle<Image_PixMap> & theTextureImage);

		/****** Graphic3d_AspectMarker3d::GetMarkerImage ******/
		/****** md5 signature: b7168bb49cffd5553e6520fc754c4a1b ******/
		%feature("compactdefaultargs") GetMarkerImage;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_MarkerImage>

Description
-----------
Returns marker's image texture. Could be null handle if marker aspect has been initialized as default type of marker.
") GetMarkerImage;
		const opencascade::handle<Graphic3d_MarkerImage> & GetMarkerImage();

		/****** Graphic3d_AspectMarker3d::GetTextureSize ******/
		/****** md5 signature: 6acf472b14ee393808839445fda6bc20 ******/
		%feature("compactdefaultargs") GetTextureSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
theWidth: int
theHeight: int

Description
-----------
Returns marker's texture size.
") GetTextureSize;
		void GetTextureSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Graphic3d_AspectMarker3d::Scale ******/
		/****** md5 signature: ce5e590eac8436d0200fc97aca9ff2e7 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return scale factor.
") Scale;
		float Scale();

		/****** Graphic3d_AspectMarker3d::SetBitMap ******/
		/****** md5 signature: 8dbde57ce2b3ce3993a6468f8d2847be ******/
		%feature("compactdefaultargs") SetBitMap;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theHeight: int
theTexture: TColStd_HArray1OfByte

Return
-------
None

Description
-----------
No available documentation.
") SetBitMap;
		void SetBitMap(const int theWidth, const int theHeight, const opencascade::handle<TColStd_HArray1OfByte> & theTexture);

		/****** Graphic3d_AspectMarker3d::SetScale ******/
		/****** md5 signature: f831fa6b2c906aec634a6d406678f132 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
None

Description
-----------
Modifies the scale factor. Marker type Aspect_TOM_POINT is not affected by the marker size scale factor. It is always the smallest displayable dot. Warning: Raises Standard_OutOfRange if the scale is a negative value.
") SetScale;
		void SetScale(const float theScale);

		/****** Graphic3d_AspectMarker3d::SetScale ******/
		/****** md5 signature: f03e0b150cf827a9c371719a495ebff6 ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theScale: double

Return
-------
None

Description
-----------
Assign scale factor.
") SetScale;
		void SetScale(const double theScale);

		/****** Graphic3d_AspectMarker3d::SetType ******/
		/****** md5 signature: 01912a20786b2b3a7afea3ef50011de0 ******/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "
Parameters
----------
theType: Aspect_TypeOfMarker

Return
-------
None

Description
-----------
Modifies the type of marker.
") SetType;
		void SetType(const Aspect_TypeOfMarker theType);

		/****** Graphic3d_AspectMarker3d::Type ******/
		/****** md5 signature: aec8d966145097ca0717d502ba9f44da ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
Aspect_TypeOfMarker

Description
-----------
Return marker type.
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
		/****** Graphic3d_AspectText3d::Graphic3d_AspectText3d ******/
		/****** md5 signature: d9ab7314327e2d2b23b642cf8f21fef9 ******/
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a context table for text primitives defined with the following default values: Color: Quantity_NOC_YELLOW Font: Font_NOF_ASCII_MONO The style: Aspect_TOST_NORMAL The display type: Aspect_TODT_NORMAL.
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d();

		/****** Graphic3d_AspectText3d::Graphic3d_AspectText3d ******/
		/****** md5 signature: c7cbd1366c84ea299df118dc39a87f97 ******/
		%feature("compactdefaultargs") Graphic3d_AspectText3d;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color
theFont: char *
theExpansionFactor: double
theSpace: double
theStyle: Aspect_TypeOfStyleText (optional, default to Aspect_TOST_NORMAL)
theDisplayType: Aspect_TypeOfDisplayText (optional, default to Aspect_TODT_NORMAL)

Return
-------
None

Description
-----------
Creates a context table for text primitives defined with the specified values. 
Input parameter: theColor text color 
Input parameter: theFont font family name or alias like Font_NOF_ASCII_MONO 
Input parameter: theExpansionFactor deprecated parameter, has no effect 
Input parameter: theSpace deprecated parameter, has no effect 
Input parameter: theStyle font style 
Input parameter: theDisplayType display mode.
") Graphic3d_AspectText3d;
		 Graphic3d_AspectText3d(const Quantity_Color & theColor, const char * theFont, double theExpansionFactor, double theSpace, Aspect_TypeOfStyleText theStyle = Aspect_TOST_NORMAL, Aspect_TypeOfDisplayText theDisplayType = Aspect_TODT_NORMAL);

		/****** Graphic3d_AspectText3d::Color ******/
		/****** md5 signature: 7cec116411eb20e52d1fabf3015346da ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return the text color.
") Color;
		const Quantity_Color & Color();

		/****** Graphic3d_AspectText3d::ColorRGBA ******/
		/****** md5 signature: 615b6d48d8bc4764a07d0e2ff837764b ******/
		%feature("compactdefaultargs") ColorRGBA;
		%feature("autodoc", "Return
-------
Quantity_ColorRGBA

Description
-----------
Return the text color.
") ColorRGBA;
		const Quantity_ColorRGBA & ColorRGBA();

		/****** Graphic3d_AspectText3d::DisplayType ******/
		/****** md5 signature: 041325771462897bef38e38a8d051921 ******/
		%feature("compactdefaultargs") DisplayType;
		%feature("autodoc", "Return
-------
Aspect_TypeOfDisplayText

Description
-----------
Return display type.
") DisplayType;
		Aspect_TypeOfDisplayText DisplayType();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_AspectText3d::Font ******/
		/****** md5 signature: 246154ff4659a4acf077229295e5855e ******/
		%feature("compactdefaultargs") Font;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return the font.
") Font;
		const TCollection_AsciiString & Font();

		/****** Graphic3d_AspectText3d::GetTextAngle ******/
		/****** md5 signature: 19a739633e494cd043cbce81c52b0cdd ******/
		%feature("compactdefaultargs") GetTextAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns Angle of degree.
") GetTextAngle;
		float GetTextAngle();

		/****** Graphic3d_AspectText3d::GetTextFontAspect ******/
		/****** md5 signature: 4cd71b07b0ec9eb017ea12670bda379e ******/
		%feature("compactdefaultargs") GetTextFontAspect;
		%feature("autodoc", "Return
-------
Font_FontAspect

Description
-----------
Returns text FontAspect.
") GetTextFontAspect;
		Font_FontAspect GetTextFontAspect();

		/****** Graphic3d_AspectText3d::GetTextZoomable ******/
		/****** md5 signature: 47c9fd4a0ce90ee835f95292957687a7 ******/
		%feature("compactdefaultargs") GetTextZoomable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the Text Zoomable is on.
") GetTextZoomable;
		bool GetTextZoomable();

		/****** Graphic3d_AspectText3d::SetColor ******/
		/****** md5 signature: 289e78889c9a8b48d6cf1ce3b205415d ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Modifies the color.
") SetColor;
		void SetColor(const Quantity_Color & theColor);

		/****** Graphic3d_AspectText3d::SetColor ******/
		/****** md5 signature: 4dd7c6505348ed91f3ee5831c87631e8 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_ColorRGBA

Return
-------
None

Description
-----------
Modifies the color.
") SetColor;
		void SetColor(const Quantity_ColorRGBA & theColor);

		/****** Graphic3d_AspectText3d::SetDisplayType ******/
		/****** md5 signature: d72cac4cee8a504e1c4b2e47a848e48c ******/
		%feature("compactdefaultargs") SetDisplayType;
		%feature("autodoc", "
Parameters
----------
theDisplayType: Aspect_TypeOfDisplayText

Return
-------
None

Description
-----------
Define the display type of the text.
") SetDisplayType;
		void SetDisplayType(Aspect_TypeOfDisplayText theDisplayType);

		/****** Graphic3d_AspectText3d::SetFont ******/
		/****** md5 signature: 7f2969793d80ece6d22485bcb15f06b4 ******/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "
Parameters
----------
theFont: str

Return
-------
None

Description
-----------
Modifies the font.
") SetFont;
		void SetFont(TCollection_AsciiString theFont);

		/****** Graphic3d_AspectText3d::SetFont ******/
		/****** md5 signature: d38c457f50bed74122e3b6ca83fd8740 ******/
		%feature("compactdefaultargs") SetFont;
		%feature("autodoc", "
Parameters
----------
theFont: char *

Return
-------
None

Description
-----------
Modifies the font.
") SetFont;
		void SetFont(const char * const theFont);

		/****** Graphic3d_AspectText3d::SetStyle ******/
		/****** md5 signature: 79f0871ccb7f1986360bdd74fe84ff94 ******/
		%feature("compactdefaultargs") SetStyle;
		%feature("autodoc", "
Parameters
----------
theStyle: Aspect_TypeOfStyleText

Return
-------
None

Description
-----------
Modifies the style of the text.
") SetStyle;
		void SetStyle(Aspect_TypeOfStyleText theStyle);

		/****** Graphic3d_AspectText3d::SetTextAngle ******/
		/****** md5 signature: 782a14c5e3d73e112452c2937c0d1d2c ******/
		%feature("compactdefaultargs") SetTextAngle;
		%feature("autodoc", "
Parameters
----------
theAngle: double

Return
-------
None

Description
-----------
Turns usage of text rotated.
") SetTextAngle;
		void SetTextAngle(const double theAngle);

		/****** Graphic3d_AspectText3d::Style ******/
		/****** md5 signature: e2414cb4ef0eae6c2683ae26a37cf27b ******/
		%feature("compactdefaultargs") Style;
		%feature("autodoc", "Return
-------
Aspect_TypeOfStyleText

Description
-----------
Return the text style.
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
		/****** Graphic3d_AttribBuffer::Graphic3d_AttribBuffer ******/
		/****** md5 signature: ef37a99e8ced63b1b1500bcd9e77ee57 ******/
		%feature("compactdefaultargs") Graphic3d_AttribBuffer;
		%feature("autodoc", "
Parameters
----------
theAlloc: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_AttribBuffer;
		 Graphic3d_AttribBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****** Graphic3d_AttribBuffer::Init ******/
		/****** md5 signature: 409c1cd182e6adbb7a63a14e93b6950f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theNbElems: int
theAttribs: Graphic3d_Attribute *
theNbAttribs: int

Return
-------
bool

Description
-----------
Allocates new empty array.
") Init;
		bool Init(const int theNbElems, const Graphic3d_Attribute * theAttribs, const int theNbAttribs);

		/****** Graphic3d_AttribBuffer::Init ******/
		/****** md5 signature: 27b204d0c5000a705bb997a40341ccc8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theNbElems: int
theAttribs: NCollection_Array1<Graphic3d_Attribute>

Return
-------
bool

Description
-----------
Allocates new empty array.
") Init;
		bool Init(const int theNbElems, const NCollection_Array1<Graphic3d_Attribute> & theAttribs);

		/****** Graphic3d_AttribBuffer::Invalidate ******/
		/****** md5 signature: 4446d31e03b37d9581a862442c336cae ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidate the entire buffer data.
") Invalidate;
		void Invalidate();

		/****** Graphic3d_AttribBuffer::Invalidate ******/
		/****** md5 signature: 15011420e3b66c653787e038af3d04fc ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "
Parameters
----------
theAttributeIndex: int

Return
-------
None

Description
-----------
Invalidate the entire attribute data.
") Invalidate;
		void Invalidate(int theAttributeIndex);

		/****** Graphic3d_AttribBuffer::Invalidate ******/
		/****** md5 signature: dd7b6d656edc2fd046b1662cccff0041 ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "
Parameters
----------
theAttributeIndex: int
theVertexLower: int
theVertexUpper: int

Return
-------
None

Description
-----------
Invalidate attribute data within specified sub-range (starting from 0).
") Invalidate;
		void Invalidate(int theAttributeIndex, int theVertexLower, int theVertexUpper);

		/****** Graphic3d_AttribBuffer::Invalidate ******/
		/****** md5 signature: ad07b0ec855e18e6aad918db250863ca ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "
Parameters
----------
theVertexLower: int
theVertexUpper: int

Return
-------
None

Description
-----------
Invalidate all attribute data within specified vertex sub-range (starting from 0).
") Invalidate;
		void Invalidate(int theVertexLower, int theVertexUpper);

		/****** Graphic3d_AttribBuffer::InvalidatedRange ******/
		/****** md5 signature: e19405b068ef860efe75aa5200cb5861 ******/
		%feature("compactdefaultargs") InvalidatedRange;
		%feature("autodoc", "Return
-------
Graphic3d_BufferRange

Description
-----------
Return invalidated range.
") InvalidatedRange;
		Graphic3d_BufferRange InvalidatedRange();

		/****** Graphic3d_AttribBuffer::IsInterleaved ******/
		/****** md5 signature: bb93250e60b97ec78be616068d55729c ******/
		%feature("compactdefaultargs") IsInterleaved;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True for interleaved array; True by default.
") IsInterleaved;
		bool IsInterleaved();

		/****** Graphic3d_AttribBuffer::IsMutable ******/
		/****** md5 signature: 341cced24aa661235d95dfe00c85590b ******/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if data can be invalidated; False by default.
") IsMutable;
		bool IsMutable();

		/****** Graphic3d_AttribBuffer::SetInterleaved ******/
		/****** md5 signature: ff7635c83efc18786cb1339e4a4513d5 ******/
		%feature("compactdefaultargs") SetInterleaved;
		%feature("autodoc", "
Parameters
----------
theIsInterleaved: bool

Return
-------
None

Description
-----------
Setup interleaved/non-interleaved array. WARNING! Filling non-interleaved buffer should be implemented on user side without Graphic3d_Buffer auxiliary methods designed for interleaved data.
") SetInterleaved;
		void SetInterleaved(bool theIsInterleaved);

		/****** Graphic3d_AttribBuffer::SetMutable ******/
		/****** md5 signature: 193a63c7e2ae9a01539b7be87864a139 ******/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "
Parameters
----------
theMutable: bool

Return
-------
None

Description
-----------
Set if data can be invalidated.
") SetMutable;
		void SetMutable(bool theMutable);

		/****** Graphic3d_AttribBuffer::Validate ******/
		/****** md5 signature: 63d8297d51c4ac9bb56f07040619316a ******/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset invalidated range.
") Validate;
		void Validate();

		/****** Graphic3d_AttribBuffer::invalidate ******/
		/****** md5 signature: a9dd52496baf9a9923d231297af5db43 ******/
		%feature("compactdefaultargs") invalidate;
		%feature("autodoc", "
Parameters
----------
theRange: Graphic3d_BufferRange

Return
-------
None

Description
-----------
Invalidate specified sub-range of data (as byte offsets).
") invalidate;
		void invalidate(const Graphic3d_BufferRange & theRange);

};


%make_alias(Graphic3d_AttribBuffer)

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
		/****** Graphic3d_CView::Activate ******/
		/****** md5 signature: 7e7c8b081c69288260a14e2e3cd963e1 ******/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Activates the view. Maps presentations defined within structure manager onto this view.
") Activate;
		virtual void Activate();

		/****** Graphic3d_CView::AddSubview ******/
		/****** md5 signature: 087614f43cc50ee37f740a2917be8ce5 ******/
		%feature("compactdefaultargs") AddSubview;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView

Return
-------
None

Description
-----------
Add subview to the list.
") AddSubview;
		void AddSubview(const opencascade::handle<Graphic3d_CView> & theView);

		/****** Graphic3d_CView::BackfacingModel ******/
		/****** md5 signature: 4ef77cd5fd8e610f48c8d749a75b591a ******/
		%feature("compactdefaultargs") BackfacingModel;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfBackfacingModel

Description
-----------
Return backfacing model used for the view; Graphic3d_TypeOfBackfacingModel_Auto by default, which means that backface culling is defined by each presentation.
") BackfacingModel;
		Graphic3d_TypeOfBackfacingModel BackfacingModel();

		/****** Graphic3d_CView::Background ******/
		/****** md5 signature: c0f5419b36969bcbaab4d536acce707c ******/
		%feature("compactdefaultargs") Background;
		%feature("autodoc", "Return
-------
Aspect_Background

Description
-----------
Returns background fill color.
") Background;
		virtual Aspect_Background Background();

		/****** Graphic3d_CView::BackgroundCubeMap ******/
		/****** md5 signature: 47f07577dff92db22c0b16758c2eaba4 ******/
		%feature("compactdefaultargs") BackgroundCubeMap;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_CubeMap>

Description
-----------
Returns cubemap being set last time on background.
") BackgroundCubeMap;
		const opencascade::handle<Graphic3d_CubeMap> & BackgroundCubeMap();

		/****** Graphic3d_CView::BackgroundImage ******/
		/****** md5 signature: f2258721f5f4ef8ccd929c4758ab15a8 ******/
		%feature("compactdefaultargs") BackgroundImage;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TextureMap>

Description
-----------
Returns background image texture map.
") BackgroundImage;
		const opencascade::handle<Graphic3d_TextureMap> & BackgroundImage();

		/****** Graphic3d_CView::BackgroundImageStyle ******/
		/****** md5 signature: 9774e4b7f39a9586153cd8d1fad543ea ******/
		%feature("compactdefaultargs") BackgroundImageStyle;
		%feature("autodoc", "Return
-------
Aspect_FillMethod

Description
-----------
Returns background image fill style.
") BackgroundImageStyle;
		virtual Aspect_FillMethod BackgroundImageStyle();

		/****** Graphic3d_CView::BackgroundSkydome ******/
		/****** md5 signature: d7cf91d14be3f61f07eadf45a044328f ******/
		%feature("compactdefaultargs") BackgroundSkydome;
		%feature("autodoc", "Return
-------
Aspect_SkydomeBackground

Description
-----------
Returns skydome aspect;.
") BackgroundSkydome;
		const Aspect_SkydomeBackground & BackgroundSkydome();

		/****** Graphic3d_CView::BackgroundType ******/
		/****** md5 signature: cc22829f256c1e73c4aabb07733228f1 ******/
		%feature("compactdefaultargs") BackgroundType;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfBackground

Description
-----------
Returns background type.
") BackgroundType;
		Graphic3d_TypeOfBackground BackgroundType();

		/****** Graphic3d_CView::BaseXRCamera ******/
		/****** md5 signature: 569eec9cf9a0c2d6e3c15fcafd8f7e68 ******/
		%feature("compactdefaultargs") BaseXRCamera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Returns anchor camera definition (without tracked head orientation).
") BaseXRCamera;
		const opencascade::handle<Graphic3d_Camera> & BaseXRCamera();

		/****** Graphic3d_CView::BufferDump ******/
		/****** md5 signature: 642dcb68652f8ec4075a880fcf306971 ******/
		%feature("compactdefaultargs") BufferDump;
		%feature("autodoc", "
Parameters
----------
theImage: Image_PixMap
theBufferType: Graphic3d_BufferType

Return
-------
bool

Description
-----------
Dump active rendering buffer into specified memory buffer.
") BufferDump;
		virtual bool BufferDump(Image_PixMap & theImage, const Graphic3d_BufferType & theBufferType);

		/****** Graphic3d_CView::Camera ******/
		/****** md5 signature: d9b53c545efafa97b57509c079c6a3ee ******/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Returns camera object of the view.
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****** Graphic3d_CView::ChangeRenderingParams ******/
		/****** md5 signature: 2930edc0d67ff31509e235f7390593e4 ******/
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "Return
-------
Graphic3d_RenderingParams

Description
-----------
Returns reference to current rendering parameters and effect settings.
") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams();

		/****** Graphic3d_CView::ClipPlanes ******/
		/****** md5 signature: 5b56a7bba4df7465362e074ad237bc00 ******/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Returns list of clip planes set for the view.
") ClipPlanes;
		virtual const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****** Graphic3d_CView::Compute ******/
		/****** md5 signature: 3472bca0870d21fcbdb4784495b49568 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the new presentation of the structures displayed in this view with the type Graphic3d_TOS_COMPUTED.
") Compute;
		void Compute();

		/****** Graphic3d_CView::ComputeXRBaseCameraFromPosed ******/
		/****** md5 signature: 9f9d9d6588f52bd74d24d69371b17125 ******/
		%feature("compactdefaultargs") ComputeXRBaseCameraFromPosed;
		%feature("autodoc", "
Parameters
----------
theCamPosed: Graphic3d_Camera
thePoseTrsf: gp_Trsf

Return
-------
None

Description
-----------
Update based camera from posed camera by applying reversed transformation.
") ComputeXRBaseCameraFromPosed;
		void ComputeXRBaseCameraFromPosed(const Graphic3d_Camera & theCamPosed, const gp_Trsf & thePoseTrsf);

		/****** Graphic3d_CView::ComputeXRPosedCameraFromBase ******/
		/****** md5 signature: fa0309bf3b3ea6e737859c88c31d7c83 ******/
		%feature("compactdefaultargs") ComputeXRPosedCameraFromBase;
		%feature("autodoc", "
Parameters
----------
theCam: Graphic3d_Camera
theXRTrsf: gp_Trsf

Return
-------
None

Description
-----------
Compute camera position based on XR pose.
") ComputeXRPosedCameraFromBase;
		void ComputeXRPosedCameraFromBase(Graphic3d_Camera & theCam, const gp_Trsf & theXRTrsf);

		/****** Graphic3d_CView::ComputedMode ******/
		/****** md5 signature: bbb05b9d13c7a39361272819d6d33657 ******/
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the computed HLR mode state.
") ComputedMode;
		bool ComputedMode();

		/****** Graphic3d_CView::ConsiderZoomPersistenceObjects ******/
		/****** md5 signature: a88827c9705d0f2844b666b590a40269 ******/
		%feature("compactdefaultargs") ConsiderZoomPersistenceObjects;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns zoom-scale factor.
") ConsiderZoomPersistenceObjects;
		double ConsiderZoomPersistenceObjects();

		/****** Graphic3d_CView::CopySettings ******/
		/****** md5 signature: 4026fe6fd42530f6aedac7fd6bd368b1 ******/
		%feature("compactdefaultargs") CopySettings;
		%feature("autodoc", "
Parameters
----------
theOther: Graphic3d_CView

Return
-------
None

Description
-----------
Copy visualization settings from another view. Method is used for cloning views in viewer when its required to create view with same view properties.
") CopySettings;
		virtual void CopySettings(const opencascade::handle<Graphic3d_CView> & theOther);

		/****** Graphic3d_CView::Deactivate ******/
		/****** md5 signature: 884a7db0d96bdb6edb481d4f62218aaf ******/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deactivates the view. Unmaps presentations defined within structure manager. The view in deactivated state will ignore actions on structures such as Display().
") Deactivate;
		virtual void Deactivate();

		/****** Graphic3d_CView::DiagnosticInformation ******/
		/****** md5 signature: a722c5d759a2d851ee924b47a5f935f2 ******/
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "
Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString
theFlags: Graphic3d_DiagnosticInfo

Return
-------
None

Description
-----------
Fill in the dictionary with diagnostic info. Should be called within rendering thread. //! This API should be used only for user output or for creating automated reports. The format of returned information (e.g. key-value layout) is NOT part of this API and can be changed at any time. Thus application should not parse returned information to weed out specific parameters.
") DiagnosticInformation;
		virtual void DiagnosticInformation(TColStd_IndexedDataMapOfStringString & theDict, Graphic3d_DiagnosticInfo theFlags);

		/****** Graphic3d_CView::DisplayedStructures ******/
		/****** md5 signature: 05749c241f41df0d2b57ea6dd1fd724b ******/
		%feature("compactdefaultargs") DisplayedStructures;
		%feature("autodoc", "
Parameters
----------
theStructures: Graphic3d_Structure

Return
-------
None

Description
-----------
Returns the set of structures displayed in this view.
") DisplayedStructures;
		void DisplayedStructures(NCollection_Map<opencascade::handle<Graphic3d_Structure>> & theStructures);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Graphic3d_CView::FBO ******/
		/****** md5 signature: 5e8daf4b78cdbaaa4589b241d71103f7 ******/
		%feature("compactdefaultargs") FBO;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns pointer to an assigned framebuffer object.
") FBO;
		virtual opencascade::handle<Standard_Transient> FBO();

		/****** Graphic3d_CView::FBOChangeViewport ******/
		/****** md5 signature: 73119508aec7915e40a18b5f9713117e ******/
		%feature("compactdefaultargs") FBOChangeViewport;
		%feature("autodoc", "
Parameters
----------
theFbo: Standard_Transient
theWidth: int
theHeight: int

Return
-------
None

Description
-----------
Change offscreen FBO viewport.
") FBOChangeViewport;
		virtual void FBOChangeViewport(const opencascade::handle<Standard_Transient> & theFbo, const int theWidth, const int theHeight);

		/****** Graphic3d_CView::FBOCreate ******/
		/****** md5 signature: 228bac347e7c68b57ff52a3b8f3194f9 ******/
		%feature("compactdefaultargs") FBOCreate;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theHeight: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Generate offscreen FBO in the graphic library. If not supported on hardware returns NULL.
") FBOCreate;
		virtual opencascade::handle<Standard_Transient> FBOCreate(const int theWidth, const int theHeight);

		/****** Graphic3d_CView::FBOGetDimensions ******/
		/****** md5 signature: f26ea31d1cdac73d927fa88d81c90390 ******/
		%feature("compactdefaultargs") FBOGetDimensions;
		%feature("autodoc", "
Parameters
----------
theFbo: Standard_Transient

Return
-------
theWidth: int
theHeight: int
theWidthMax: int
theHeightMax: int

Description
-----------
Read offscreen FBO configuration.
") FBOGetDimensions;
		virtual void FBOGetDimensions(const opencascade::handle<Standard_Transient> & theFbo, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Graphic3d_CView::FBORelease ******/
		/****** md5 signature: 44c6f29e61488023133cd287c55a3837 ******/
		%feature("compactdefaultargs") FBORelease;
		%feature("autodoc", "
Parameters
----------
theFbo: Standard_Transient

Return
-------
None

Description
-----------
Remove offscreen FBO from the graphic library.
") FBORelease;
		virtual void FBORelease(opencascade::handle<Standard_Transient> & theFbo);

		/****** Graphic3d_CView::GetGraduatedTrihedron ******/
		/****** md5 signature: f68dfc8ae14469bea2db4aa0eff51178 ******/
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "Return
-------
Graphic3d_GraduatedTrihedron

Description
-----------
Returns data of a graduated trihedron.
") GetGraduatedTrihedron;
		virtual const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron();

		/****** Graphic3d_CView::GradientBackground ******/
		/****** md5 signature: 860c66cfd19114f1764c97d887bff69f ******/
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "Return
-------
Aspect_GradientBackground

Description
-----------
Returns gradient background fill colors.
") GradientBackground;
		virtual Aspect_GradientBackground GradientBackground();

		/****** Graphic3d_CView::GraduatedTrihedronDisplay ******/
		/****** md5 signature: 1857c6cf14b31109b498769c67b0bbf5 ******/
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "
Parameters
----------
theTrihedronData: Graphic3d_GraduatedTrihedron

Return
-------
None

Description
-----------
Displays Graduated Trihedron.
") GraduatedTrihedronDisplay;
		virtual void GraduatedTrihedronDisplay(const Graphic3d_GraduatedTrihedron & theTrihedronData);

		/****** Graphic3d_CView::GraduatedTrihedronErase ******/
		/****** md5 signature: 6d8f0387a39ea0593d498b477b7b4924 ******/
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases Graduated Trihedron.
") GraduatedTrihedronErase;
		virtual void GraduatedTrihedronErase();

		/****** Graphic3d_CView::GraduatedTrihedronMinMaxValues ******/
		/****** md5 signature: d2125aa2f088d3cff1eb81d2dcb66ece ******/
		%feature("compactdefaultargs") GraduatedTrihedronMinMaxValues;
		%feature("autodoc", "
Parameters
----------
theMin: NCollection_Vec3<float >
theMax: NCollection_Vec3<float >

Return
-------
None

Description
-----------
Sets minimum and maximum points of scene bounding box for Graduated Trihedron stored in graphic view object. 
Input parameter: theMin the minimum point of scene. 
Input parameter: theMax the maximum point of scene.
") GraduatedTrihedronMinMaxValues;
		virtual void GraduatedTrihedronMinMaxValues(const NCollection_Vec3<float > theMin, const NCollection_Vec3<float > theMax);

		/****** Graphic3d_CView::GridDisplay ******/
		/****** md5 signature: a683bc32dcaf349cb85981b89e4d3184 ******/
		%feature("compactdefaultargs") GridDisplay;
		%feature("autodoc", "
Parameters
----------
theParams: Aspect_GridParams
thePlane: gp_Ax3

Return
-------
None

Description
-----------
Display a shader-rendered grid on the given plane. The default implementation is a no-op; drivers with shader support override it. 
Input parameter: theParams appearance parameters 
Input parameter: thePlane grid plane in world coordinates (origin + X/Y directions).
") GridDisplay;
		virtual void GridDisplay(const Aspect_GridParams & theParams, const gp_Ax3 & thePlane);

		/****** Graphic3d_CView::GridErase ******/
		/****** md5 signature: dd6c41dd3291b04035b55b1578aefa76 ******/
		%feature("compactdefaultargs") GridErase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erase the shader-rendered grid. The default implementation is a no-op; drivers with shader support override it.
") GridErase;
		virtual void GridErase();

		/****** Graphic3d_CView::IBLCubeMap ******/
		/****** md5 signature: ffcaee8919807a8917521c40504678ca ******/
		%feature("compactdefaultargs") IBLCubeMap;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_CubeMap>

Description
-----------
Returns cubemap being set last time on background.
") IBLCubeMap;
		const opencascade::handle<Graphic3d_CubeMap> & IBLCubeMap();

		/****** Graphic3d_CView::Identification ******/
		/****** md5 signature: e09dd1d0e8395be114dc117199e1947c ******/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the identification number of the view.
") Identification;
		int Identification();

		/****** Graphic3d_CView::InitXR ******/
		/****** md5 signature: f0cfcfb26e15030c0c3215f30584f420 ******/
		%feature("compactdefaultargs") InitXR;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Initialize XR session.
") InitXR;
		virtual bool InitXR();

		/****** Graphic3d_CView::InsertLayerAfter ******/
		/****** md5 signature: cd9549addd4543aedd353e8c4428d456 ******/
		%feature("compactdefaultargs") InsertLayerAfter;
		%feature("autodoc", "
Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerBefore: int

Return
-------
None

Description
-----------
Add a layer to the view. 
Input parameter: theNewLayerId id of new layer, should be > 0 (negative values are reserved for default layers). 
Input parameter: theSettings new layer settings 
Input parameter: theLayerBefore id of layer to append new layer after.
") InsertLayerAfter;
		virtual void InsertLayerAfter(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerBefore);

		/****** Graphic3d_CView::InsertLayerBefore ******/
		/****** md5 signature: 9598fd696d1336a754aefafafac0a974 ******/
		%feature("compactdefaultargs") InsertLayerBefore;
		%feature("autodoc", "
Parameters
----------
theNewLayerId: int
theSettings: Graphic3d_ZLayerSettings
theLayerAfter: int

Return
-------
None

Description
-----------
Add a layer to the view. 
Input parameter: theNewLayerId id of new layer, should be > 0 (negative values are reserved for default layers). 
Input parameter: theSettings new layer settings 
Input parameter: theLayerAfter id of layer to append new layer before.
") InsertLayerBefore;
		virtual void InsertLayerBefore(int theNewLayerId, const Graphic3d_ZLayerSettings & theSettings, int theLayerAfter);

		/****** Graphic3d_CView::Invalidate ******/
		/****** md5 signature: 0d262fd592615fabc45f7dcd58c1a952 ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidates content of the view but does not redraw it.
") Invalidate;
		virtual void Invalidate();

		/****** Graphic3d_CView::InvalidateBVHData ******/
		/****** md5 signature: ae791789e23a7abf5abac66c4f52eb7b ******/
		%feature("compactdefaultargs") InvalidateBVHData;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
None

Description
-----------
Marks BVH tree and the set of BVH primitives of correspondent priority list with id theLayerId as outdated.
") InvalidateBVHData;
		virtual void InvalidateBVHData(int theLayerId);

		/****** Graphic3d_CView::InvalidateZLayerBoundingBox ******/
		/****** md5 signature: 64b6a380e8baca315ec3508262f94c43 ******/
		%feature("compactdefaultargs") InvalidateZLayerBoundingBox;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
None

Description
-----------
Returns the bounding box of all structures displayed in the Z layer.
") InvalidateZLayerBoundingBox;
		virtual void InvalidateZLayerBoundingBox(int theLayerId);

		/****** Graphic3d_CView::IsActive ******/
		/****** md5 signature: 38d9417d8eeb1eba9378636ce5975fa8 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the activity flag of the view.
") IsActive;
		bool IsActive();

		/****** Graphic3d_CView::IsActiveXR ******/
		/****** md5 signature: 28ef08380cd2c5428fe9c695d6a8357a ******/
		%feature("compactdefaultargs") IsActiveXR;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if there is active XR session.
") IsActiveXR;
		bool IsActiveXR();

		/****** Graphic3d_CView::IsComputed ******/
		/****** md5 signature: 8b29fcb9e991d227cbfa553ce30ad2ea ******/
		%feature("compactdefaultargs") IsComputed;
		%feature("autodoc", "
Parameters
----------
theStructId: int
theComputedStruct: Graphic3d_Structure

Return
-------
bool

Description
-----------
Returns true in case if the structure with the given <theStructId> is in list of structures to be computed and stores computed struct to <theComputedStruct>.
") IsComputed;
		bool IsComputed(const int theStructId, opencascade::handle<Graphic3d_Structure> & theComputedStruct);

		/****** Graphic3d_CView::IsDefined ******/
		/****** md5 signature: 7e194c5bfea2701c602b384aebb841a9 ******/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the window associated to the view is defined.
") IsDefined;
		virtual bool IsDefined();

		/****** Graphic3d_CView::IsInvalidated ******/
		/****** md5 signature: f20837c72010569fd959f0b5119698f3 ******/
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if view content cache has been invalidated.
") IsInvalidated;
		virtual bool IsInvalidated();

		/****** Graphic3d_CView::IsRemoved ******/
		/****** md5 signature: f59ad71700415f7d46a1fd6dd58158cf ******/
		%feature("compactdefaultargs") IsRemoved;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the view was removed.
") IsRemoved;
		bool IsRemoved();

		/****** Graphic3d_CView::IsSubViewRelativeSize ******/
		/****** md5 signature: 04ae131a78555ab50e814ca94d8066c9 ******/
		%feature("compactdefaultargs") IsSubViewRelativeSize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if subview size is set as proportions relative to parent view.
") IsSubViewRelativeSize;
		bool IsSubViewRelativeSize();

		/****** Graphic3d_CView::IsSubview ******/
		/****** md5 signature: e4786984f763125a6b3ee9d1975a34eb ******/
		%feature("compactdefaultargs") IsSubview;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if this is a subview of another view.
") IsSubview;
		bool IsSubview();

		/****** Graphic3d_CView::IsSubviewComposer ******/
		/****** md5 signature: dda8477995e5b91e1a15cec3f2e75a4f ******/
		%feature("compactdefaultargs") IsSubviewComposer;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if this is view performs rendering of subviews and nothing else; False by default. By default, view with subviews will render main scene and blit subviews on top of it. Rendering of main scene might become redundant in case if subviews cover entire window of parent view. This flag allows to disable rendering of the main scene in such scenarios without creation of a dedicated V3d_Viewer instance just for composing subviews.
") IsSubviewComposer;
		bool IsSubviewComposer();

		/****** Graphic3d_CView::Layer ******/
		/****** md5 signature: 98e13d408eec5014ccb45661ed58591c ******/
		%feature("compactdefaultargs") Layer;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
opencascade::handle<Graphic3d_Layer>

Description
-----------
Returns layer with given ID or NULL if undefined.
") Layer;
		virtual opencascade::handle<Graphic3d_Layer> Layer(int theLayerId);

		/****** Graphic3d_CView::Layers ******/
		/****** md5 signature: 1e44473170da77295f9e9d0552ecdd21 ******/
		%feature("compactdefaultargs") Layers;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<Graphic3d_Layer>>

Description
-----------
Returns the list of layers.
") Layers;
		virtual const NCollection_List<opencascade::handle<Graphic3d_Layer>> & Layers();

		/****** Graphic3d_CView::Lights ******/
		/****** md5 signature: 1a679ee088dc3706926637bb7a9e9e5d ******/
		%feature("compactdefaultargs") Lights;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_LightSet>

Description
-----------
Returns list of lights of the view.
") Lights;
		virtual const opencascade::handle<Graphic3d_LightSet> & Lights();

		/****** Graphic3d_CView::MinMaxValues ******/
		/****** md5 signature: 29549cb19363f737c25d61c991cae214 ******/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "
Parameters
----------
theToIncludeAuxiliary: bool (optional, default to false)

Return
-------
Bnd_Box

Description
-----------
Returns the bounding box of all structures displayed in the view. If theToIncludeAuxiliary is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite and other auxiliary structures. 
Parameter theToIncludeAuxiliary consider also auxiliary presentations (with infinite flag or with trihedron transformation persistence) 
Return: computed bounding box.
") MinMaxValues;
		virtual Bnd_Box MinMaxValues(const bool theToIncludeAuxiliary = false);

		/****** Graphic3d_CView::MinMaxValues ******/
		/****** md5 signature: b92847c449732828cb58e5861c9b04a9 ******/
		%feature("compactdefaultargs") MinMaxValues;
		%feature("autodoc", "
Parameters
----------
theSet: Graphic3d_Structure
theToIncludeAuxiliary: bool (optional, default to false)

Return
-------
Bnd_Box

Description
-----------
Returns the coordinates of the boundary box of all structures in the set <theSet>. If <theToIgnoreInfiniteFlag> is True, then the boundary box also includes minimum and maximum limits of graphical elements forming parts of infinite structures.
") MinMaxValues;
		Bnd_Box MinMaxValues(const NCollection_Map<opencascade::handle<Graphic3d_Structure>> & theSet, const bool theToIncludeAuxiliary = false);

		/****** Graphic3d_CView::NumberOfDisplayedStructures ******/
		/****** md5 signature: 4be9d7bdca667fac9e73e90ff6e1fdf1 ******/
		%feature("compactdefaultargs") NumberOfDisplayedStructures;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of displayed structures in the view.
") NumberOfDisplayedStructures;
		virtual int NumberOfDisplayedStructures();

		/****** Graphic3d_CView::ParentView ******/
		/****** md5 signature: 3277b1d4697d1e5bf1050aa6b3b068c0 ******/
		%feature("compactdefaultargs") ParentView;
		%feature("autodoc", "Return
-------
Graphic3d_CView *

Description
-----------
Return parent View or NULL if this is not a subview.
") ParentView;
		Graphic3d_CView * ParentView();

		/****** Graphic3d_CView::PoseXRToWorld ******/
		/****** md5 signature: cd46f66daada283828955a8fd56f2748 ******/
		%feature("compactdefaultargs") PoseXRToWorld;
		%feature("autodoc", "
Parameters
----------
thePoseXR: gp_Trsf

Return
-------
gp_Trsf

Description
-----------
Convert XR pose to world space. 
Input parameter: thePoseXR transformation defined in VR local coordinate system,  oriented as Y-up, X-right and -Z-forward 
Return: transformation defining orientation of XR pose in world space.
") PoseXRToWorld;
		gp_Trsf PoseXRToWorld(const gp_Trsf & thePoseXR);

		/****** Graphic3d_CView::PosedXRCamera ******/
		/****** md5 signature: e3ae35712648cbfe2d75aec41667d8f6 ******/
		%feature("compactdefaultargs") PosedXRCamera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Returns transient XR camera position with tracked head orientation applied.
") PosedXRCamera;
		const opencascade::handle<Graphic3d_Camera> & PosedXRCamera();

		/****** Graphic3d_CView::ProcessXRInput ******/
		/****** md5 signature: 0a11ab43e728eaafd87463f58bb331be ******/
		%feature("compactdefaultargs") ProcessXRInput;
		%feature("autodoc", "Return
-------
None

Description
-----------
Process input.
") ProcessXRInput;
		virtual void ProcessXRInput();

		/****** Graphic3d_CView::ReCompute ******/
		/****** md5 signature: b298f491838ab5574e489a3b63373f8a ******/
		%feature("compactdefaultargs") ReCompute;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure

Return
-------
None

Description
-----------
Computes the new presentation of the structure displayed in this view with the type Graphic3d_TOS_COMPUTED.
") ReCompute;
		void ReCompute(const opencascade::handle<Graphic3d_Structure> & theStructure);

		/****** Graphic3d_CView::Redraw ******/
		/****** md5 signature: c693da13110ee5c0f4c37aa33fad1c21 ******/
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redraw content of the view.
") Redraw;
		virtual void Redraw();

		/****** Graphic3d_CView::RedrawImmediate ******/
		/****** md5 signature: 8dd0e1a7e818e6f07904b7cf852a1a0f ******/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Redraw immediate content of the view.
") RedrawImmediate;
		virtual void RedrawImmediate();

		/****** Graphic3d_CView::ReleaseXR ******/
		/****** md5 signature: 1c0ce0247e26ce1f13490859dca30cde ******/
		%feature("compactdefaultargs") ReleaseXR;
		%feature("autodoc", "Return
-------
None

Description
-----------
Release XR session.
") ReleaseXR;
		virtual void ReleaseXR();

		/****** Graphic3d_CView::Remove ******/
		/****** md5 signature: 57a23cda69c531e8d176ae30ce8f77c6 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Return
-------
None

Description
-----------
Erases the view and removes from graphic driver. No more graphic operations are allowed in this view after the call.
") Remove;
		virtual void Remove();

		/****** Graphic3d_CView::RemoveSubview ******/
		/****** md5 signature: 6f7136c88cbfcfcd7c8c06abc029efcd ******/
		%feature("compactdefaultargs") RemoveSubview;
		%feature("autodoc", "
Parameters
----------
theView: Graphic3d_CView *

Return
-------
bool

Description
-----------
Remove subview from the list.
") RemoveSubview;
		bool RemoveSubview(const Graphic3d_CView * theView);

		/****** Graphic3d_CView::RemoveZLayer ******/
		/****** md5 signature: 50d5f44e4a544e7ce1c8003cf95dee16 ******/
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
None

Description
-----------
Remove Z layer from the specified view. All structures displayed at the moment in layer will be displayed in default layer ( the bottom-level z layer ). To unset layer ID from associated structures use method UnsetZLayer (...).
") RemoveZLayer;
		virtual void RemoveZLayer(int theLayerId);

		/****** Graphic3d_CView::RenderingParams ******/
		/****** md5 signature: 09614d1dcd3a2492545d199d3739d373 ******/
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "Return
-------
Graphic3d_RenderingParams

Description
-----------
Returns current rendering parameters and effect settings.
") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams();

		/****** Graphic3d_CView::Resized ******/
		/****** md5 signature: 9c00c8ed1347651e53fd1021899219e9 ******/
		%feature("compactdefaultargs") Resized;
		%feature("autodoc", "Return
-------
None

Description
-----------
Handle changing size of the rendering window.
") Resized;
		virtual void Resized();

		/****** Graphic3d_CView::SetBackfacingModel ******/
		/****** md5 signature: 50bd0f3a514b4efa9480a06d75957fff ******/
		%feature("compactdefaultargs") SetBackfacingModel;
		%feature("autodoc", "
Parameters
----------
theModel: Graphic3d_TypeOfBackfacingModel

Return
-------
None

Description
-----------
Sets backfacing model for the view.
") SetBackfacingModel;
		void SetBackfacingModel(const Graphic3d_TypeOfBackfacingModel theModel);

		/****** Graphic3d_CView::SetBackground ******/
		/****** md5 signature: cca9f3f3a8cb129a25f49b97be82ed5b ******/
		%feature("compactdefaultargs") SetBackground;
		%feature("autodoc", "
Parameters
----------
theBackground: Aspect_Background

Return
-------
None

Description
-----------
Sets background fill color.
") SetBackground;
		virtual void SetBackground(const Aspect_Background & theBackground);

		/****** Graphic3d_CView::SetBackgroundImage ******/
		/****** md5 signature: e9bbaccc89e614d3f4995d0d4ba86791 ******/
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "
Parameters
----------
theTextureMap: Graphic3d_TextureMap
theToUpdatePBREnv: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets image texture or environment cubemap as background. 
Input parameter: theTextureMap source to set a background;  should be either Graphic3d_Texture2D or Graphic3d_CubeMap 
Input parameter: theToUpdatePBREnv defines whether IBL maps will be generated or not  (see GeneratePBREnvironment()).
") SetBackgroundImage;
		virtual void SetBackgroundImage(const opencascade::handle<Graphic3d_TextureMap> & theTextureMap, bool theToUpdatePBREnv = true);

		/****** Graphic3d_CView::SetBackgroundImageStyle ******/
		/****** md5 signature: 6d6171020c144a8806fd6d5bea661430 ******/
		%feature("compactdefaultargs") SetBackgroundImageStyle;
		%feature("autodoc", "
Parameters
----------
theFillStyle: Aspect_FillMethod

Return
-------
None

Description
-----------
Sets background image fill style.
") SetBackgroundImageStyle;
		virtual void SetBackgroundImageStyle(const Aspect_FillMethod theFillStyle);

		/****** Graphic3d_CView::SetBackgroundSkydome ******/
		/****** md5 signature: f2f294fa47467a4178d82ae6d591df42 ******/
		%feature("compactdefaultargs") SetBackgroundSkydome;
		%feature("autodoc", "
Parameters
----------
theAspect: Aspect_SkydomeBackground
theToUpdatePBREnv: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets skydome aspect.
") SetBackgroundSkydome;
		void SetBackgroundSkydome(const Aspect_SkydomeBackground & theAspect, bool theToUpdatePBREnv = true);

		/****** Graphic3d_CView::SetBackgroundType ******/
		/****** md5 signature: 7cbcdf16f22591f5670a7bcbaa8dd21a ******/
		%feature("compactdefaultargs") SetBackgroundType;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfBackground

Return
-------
None

Description
-----------
Sets background type.
") SetBackgroundType;
		void SetBackgroundType(Graphic3d_TypeOfBackground theType);

		/****** Graphic3d_CView::SetBaseXRCamera ******/
		/****** md5 signature: 091dbe28d6cd379e4f8bd1d66388c13d ******/
		%feature("compactdefaultargs") SetBaseXRCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Sets anchor camera definition.
") SetBaseXRCamera;
		void SetBaseXRCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** Graphic3d_CView::SetCamera ******/
		/****** md5 signature: 257054b2420336cef22ca287c4c2483a ******/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Sets camera used by the view.
") SetCamera;
		virtual void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** Graphic3d_CView::SetClipPlanes ******/
		/****** md5 signature: dfb002b318ba4ae6bef35e01c5bfad78 ******/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "
Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Return
-------
None

Description
-----------
Sets list of clip planes for the view.
") SetClipPlanes;
		virtual void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****** Graphic3d_CView::SetComputedMode ******/
		/****** md5 signature: 851f9c06d6d28976f6b7f55836cb791d ******/
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Switches computed HLR mode in the view.
") SetComputedMode;
		void SetComputedMode(const bool theMode);

		/****** Graphic3d_CView::SetFBO ******/
		/****** md5 signature: 5027c300bed11eda941fac313a783a69 ******/
		%feature("compactdefaultargs") SetFBO;
		%feature("autodoc", "
Parameters
----------
theFbo: Standard_Transient

Return
-------
None

Description
-----------
Sets framebuffer object for offscreen rendering.
") SetFBO;
		virtual void SetFBO(const opencascade::handle<Standard_Transient> & theFbo);

		/****** Graphic3d_CView::SetGradientBackground ******/
		/****** md5 signature: 4a3410413657f94e88bdabc17279ecfc ******/
		%feature("compactdefaultargs") SetGradientBackground;
		%feature("autodoc", "
Parameters
----------
theBackground: Aspect_GradientBackground

Return
-------
None

Description
-----------
Sets gradient background fill colors.
") SetGradientBackground;
		virtual void SetGradientBackground(const Aspect_GradientBackground & theBackground);

		/****** Graphic3d_CView::SetImageBasedLighting ******/
		/****** md5 signature: f8ff6f6a4466f26b40592afba2632156 ******/
		%feature("compactdefaultargs") SetImageBasedLighting;
		%feature("autodoc", "
Parameters
----------
theToEnableIBL: bool

Return
-------
None

Description
-----------
Enables or disables IBL (Image Based Lighting) from background cubemap. Has no effect if PBR is not used. 
Input parameter: theToEnableIBL enable or disable IBL from background cubemap.
") SetImageBasedLighting;
		virtual void SetImageBasedLighting(bool theToEnableIBL);

		/****** Graphic3d_CView::SetImmediateModeDrawToFront ******/
		/****** md5 signature: 98e71501fe327904f72cdcc3cadd9332 ******/
		%feature("compactdefaultargs") SetImmediateModeDrawToFront;
		%feature("autodoc", "
Parameters
----------
theDrawToFrontBuffer: bool

Return
-------
bool

Description
-----------
Parameter theDrawToFrontBuffer Advanced option to modify rendering mode: 1. True. Drawing immediate mode structures directly to the front buffer over the scene image. Fast, so preferred for interactive work (used by default). However these extra drawings will be missed in image dump since it is performed from back buffer. Notice that since no pre-buffering used the V-Sync will be ignored and rendering could be seen in run-time (in case of slow hardware) and/or tearing may appear. So this is strongly recommended to draw only simple (fast) structures. 2. False. Drawing immediate mode structures to the back buffer. The complete scene is redrawn first, so this mode is slower if scene contains complex data and/or V-Sync is turned on. But it works in any case and is especially useful for view dump because the dump image is read from the back buffer. 
Return: previous mode.
") SetImmediateModeDrawToFront;
		virtual bool SetImmediateModeDrawToFront(const bool theDrawToFrontBuffer);

		/****** Graphic3d_CView::SetLights ******/
		/****** md5 signature: a176e7a4912580ea247e20fd706028d2 ******/
		%feature("compactdefaultargs") SetLights;
		%feature("autodoc", "
Parameters
----------
theLights: Graphic3d_LightSet

Return
-------
None

Description
-----------
Sets list of lights for the view.
") SetLights;
		virtual void SetLights(const opencascade::handle<Graphic3d_LightSet> & theLights);

		/****** Graphic3d_CView::SetPosedXRCamera ******/
		/****** md5 signature: 3ebb69930ad9744c104a2fc32ac0f92c ******/
		%feature("compactdefaultargs") SetPosedXRCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Sets transient XR camera position with tracked head orientation applied.
") SetPosedXRCamera;
		void SetPosedXRCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** Graphic3d_CView::SetShadingModel ******/
		/****** md5 signature: e0128a9924c3f8c7395b0ec1521ffcee ******/
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "
Parameters
----------
theModel: Graphic3d_TypeOfShadingModel

Return
-------
None

Description
-----------
Sets default Shading Model of the view. Will throw an exception on attempt to set Graphic3d_TypeOfShadingModel_DEFAULT.
") SetShadingModel;
		void SetShadingModel(Graphic3d_TypeOfShadingModel theModel);

		/****** Graphic3d_CView::SetSubviewComposer ******/
		/****** md5 signature: 55fbfea061f30b97532f4558c8bca661 ******/
		%feature("compactdefaultargs") SetSubviewComposer;
		%feature("autodoc", "
Parameters
----------
theIsComposer: bool

Return
-------
None

Description
-----------
Set if this view should perform composing of subviews and nothing else.
") SetSubviewComposer;
		void SetSubviewComposer(bool theIsComposer);

		/****** Graphic3d_CView::SetSubviewCorner ******/
		/****** md5 signature: ef48b2f01aa985acb05b2f3d5b12b84d ******/
		%feature("compactdefaultargs") SetSubviewCorner;
		%feature("autodoc", "
Parameters
----------
thePos: Aspect_TypeOfTriedronPosition

Return
-------
None

Description
-----------
Set subview position within parent view.
") SetSubviewCorner;
		void SetSubviewCorner(Aspect_TypeOfTriedronPosition thePos);

		/****** Graphic3d_CView::SetSubviewMargins ******/
		/****** md5 signature: f7b6e57c757219da473d786c0048c59e ******/
		%feature("compactdefaultargs") SetSubviewMargins;
		%feature("autodoc", "
Parameters
----------
theMargins: NCollection_Vec2<int>

Return
-------
None

Description
-----------
Set subview margins in pixels.
") SetSubviewMargins;
		void SetSubviewMargins(const NCollection_Vec2<int> & theMargins);

		/****** Graphic3d_CView::SetSubviewOffset ******/
		/****** md5 signature: 2331dcf9cd3ccb2d7ad35267d5954ef1 ******/
		%feature("compactdefaultargs") SetSubviewOffset;
		%feature("autodoc", "
Parameters
----------
theOffset: NCollection_Vec2<double>

Return
-------
None

Description
-----------
Set corner offset within parent view.
") SetSubviewOffset;
		void SetSubviewOffset(const NCollection_Vec2<double> & theOffset);

		/****** Graphic3d_CView::SetSubviewSize ******/
		/****** md5 signature: fe23efb60afacc6f89071f634cfb928e ******/
		%feature("compactdefaultargs") SetSubviewSize;
		%feature("autodoc", "
Parameters
----------
theSize: NCollection_Vec2<double>

Return
-------
None

Description
-----------
Set subview size relative to parent view.
") SetSubviewSize;
		void SetSubviewSize(const NCollection_Vec2<double> & theSize);

		/****** Graphic3d_CView::SetTextureEnv ******/
		/****** md5 signature: 7529a79a886636c7ffd10c57b2f00357 ******/
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "
Parameters
----------
theTextureEnv: Graphic3d_TextureEnv

Return
-------
None

Description
-----------
Sets environment texture for the view.
") SetTextureEnv;
		virtual void SetTextureEnv(const opencascade::handle<Graphic3d_TextureEnv> & theTextureEnv);

		/****** Graphic3d_CView::SetToFlipOutput ******/
		/****** md5 signature: 564727eff50a02ade0dbfc536f937010 ******/
		%feature("compactdefaultargs") SetToFlipOutput;
		%feature("autodoc", "
Parameters
----------
: bool

Return
-------
None

Description
-----------
Sets state of flip OY necessity in projection matrix.
") SetToFlipOutput;
		virtual void SetToFlipOutput(const bool );

		/****** Graphic3d_CView::SetUnitFactor ******/
		/****** md5 signature: 7a7330d77a740c63f3a4cc2ce38f675d ******/
		%feature("compactdefaultargs") SetUnitFactor;
		%feature("autodoc", "
Parameters
----------
theFactor: double

Return
-------
None

Description
-----------
Set unit scale factor.
") SetUnitFactor;
		void SetUnitFactor(double theFactor);

		/****** Graphic3d_CView::SetVisualizationType ******/
		/****** md5 signature: 74ef6d939c9ef213220425899afe5cea ******/
		%feature("compactdefaultargs") SetVisualizationType;
		%feature("autodoc", "
Parameters
----------
theType: Graphic3d_TypeOfVisualization

Return
-------
None

Description
-----------
Sets visualization type of the view.
") SetVisualizationType;
		void SetVisualizationType(const Graphic3d_TypeOfVisualization theType);

		/****** Graphic3d_CView::SetWindow ******/
		/****** md5 signature: 202e4c90685904ae9b9d19f3767b6834 ******/
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "
Parameters
----------
theParentVIew: Graphic3d_CView
theWindow: Aspect_Window
theContext: Aspect_RenderingContext

Return
-------
None

Description
-----------
Creates and maps rendering window to the view. 
Input parameter: theParentVIew parent view or NULL 
Input parameter: theWindow the window 
Input parameter: theContext the rendering context; if NULL the context will be created internally.
") SetWindow;
		virtual void SetWindow(const opencascade::handle<Graphic3d_CView> & theParentVIew, const opencascade::handle<Aspect_Window> & theWindow, const Aspect_RenderingContext theContext);

		/****** Graphic3d_CView::SetXRSession ******/
		/****** md5 signature: a15f51b514a0e7938f3cd4b88c551f83 ******/
		%feature("compactdefaultargs") SetXRSession;
		%feature("autodoc", "
Parameters
----------
theSession: Aspect_XRSession

Return
-------
None

Description
-----------
Set XR session.
") SetXRSession;
		void SetXRSession(const opencascade::handle<Aspect_XRSession> & theSession);

		/****** Graphic3d_CView::SetZLayerRedrawMode ******/
		/****** md5 signature: 896a7d5935ff6f45275d1953eff24730 ******/
		%feature("compactdefaultargs") SetZLayerRedrawMode;
		%feature("autodoc", "
Parameters
----------
theMode: bool

Return
-------
None

Description
-----------
Sets ZLayerId redraw mode.
") SetZLayerRedrawMode;
		void SetZLayerRedrawMode(const bool theMode);

		/****** Graphic3d_CView::SetZLayerSettings ******/
		/****** md5 signature: 526c66f52cf13826d826173b0d84d35e ******/
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "
Parameters
----------
theLayerId: int
theSettings: Graphic3d_ZLayerSettings

Return
-------
None

Description
-----------
Sets the settings for a single Z layer of specified view.
") SetZLayerSettings;
		virtual void SetZLayerSettings(int theLayerId, const Graphic3d_ZLayerSettings & theSettings);

		/****** Graphic3d_CView::SetZLayerTarget ******/
		/****** md5 signature: 6247307410ea0389b71e57cd83facdf8 ******/
		%feature("compactdefaultargs") SetZLayerTarget;
		%feature("autodoc", "
Parameters
----------
theTarget: int

Return
-------
None

Description
-----------
Sets ZLayerId target.
") SetZLayerTarget;
		void SetZLayerTarget(int theTarget);

		/****** Graphic3d_CView::SetupXRPosedCamera ******/
		/****** md5 signature: 10b421be502d3cbb0c3da0fb35ba9851 ******/
		%feature("compactdefaultargs") SetupXRPosedCamera;
		%feature("autodoc", "Return
-------
None

Description
-----------
Compute PosedXRCamera() based on current XR head pose and make it active.
") SetupXRPosedCamera;
		void SetupXRPosedCamera();

		/****** Graphic3d_CView::ShadingModel ******/
		/****** md5 signature: abf83d7e5f232094cc54f18d79b6661e ******/
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfShadingModel

Description
-----------
Returns default Shading Model of the view; Graphic3d_TypeOfShadingModel_Phong by default.
") ShadingModel;
		Graphic3d_TypeOfShadingModel ShadingModel();

		/****** Graphic3d_CView::ShadowMapDump ******/
		/****** md5 signature: ee4369271fb9df4f2b0f98f3b1d36f7b ******/
		%feature("compactdefaultargs") ShadowMapDump;
		%feature("autodoc", "
Parameters
----------
theImage: Image_PixMap
theLightName: str

Return
-------
bool

Description
-----------
Dumps the graphical contents of a shadowmap framebuffer into an image. 
Parameter theImage the image to store the shadow map. 
Input parameter: theLightName name of the light used to generate the shadow map.
") ShadowMapDump;
		virtual bool ShadowMapDump(Image_PixMap & theImage, TCollection_AsciiString theLightName);

		/****** Graphic3d_CView::StatisticInformation ******/
		/****** md5 signature: be606496c5e13c6784f40079328b5f5b ******/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns string with statistic performance info.
") StatisticInformation;
		virtual TCollection_AsciiString StatisticInformation();

		/****** Graphic3d_CView::StatisticInformation ******/
		/****** md5 signature: 13891253b217fbc83fc023ade6683d96 ******/
		%feature("compactdefaultargs") StatisticInformation;
		%feature("autodoc", "
Parameters
----------
theDict: TColStd_IndexedDataMapOfStringString

Return
-------
None

Description
-----------
Fills in the dictionary with statistic performance info.
") StatisticInformation;
		virtual void StatisticInformation(TColStd_IndexedDataMapOfStringString & theDict);

		/****** Graphic3d_CView::StructureManager ******/
		/****** md5 signature: 5843678469524fb10153c08d2adb183d ******/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_StructureManager>

Description
-----------
Returns the structure manager handle which manage structures associated with this view.
") StructureManager;
		const opencascade::handle<Graphic3d_StructureManager> & StructureManager();

		/****** Graphic3d_CView::SubviewCorner ******/
		/****** md5 signature: 7d5ec294d7810d260a8b0d02149f04fc ******/
		%feature("compactdefaultargs") SubviewCorner;
		%feature("autodoc", "Return
-------
Aspect_TypeOfTriedronPosition

Description
-----------
Return subview position within parent view; Aspect_TOTP_LEFT_UPPER by default.
") SubviewCorner;
		Aspect_TypeOfTriedronPosition SubviewCorner();

		/****** Graphic3d_CView::SubviewMargins ******/
		/****** md5 signature: 3bc1b11015e57d75659d2c15b6866c0d ******/
		%feature("compactdefaultargs") SubviewMargins;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int>

Description
-----------
Return subview margins in pixels; (0,0) by default.
") SubviewMargins;
		const NCollection_Vec2<int> & SubviewMargins();

		/****** Graphic3d_CView::SubviewOffset ******/
		/****** md5 signature: 167d5d54ba67365ba50f36ca87f39575 ******/
		%feature("compactdefaultargs") SubviewOffset;
		%feature("autodoc", "Return
-------
NCollection_Vec2<double>

Description
-----------
Return corner offset within parent view; (0.0,0.0) by default. Values >= 2 define offset in pixels; Values <= 1.0 define offset as fraction of parent view dimensions.
") SubviewOffset;
		const NCollection_Vec2<double> & SubviewOffset();

		/****** Graphic3d_CView::SubviewResized ******/
		/****** md5 signature: e7bf10595e82dd8df76b634c88d3e63e ******/
		%feature("compactdefaultargs") SubviewResized;
		%feature("autodoc", "
Parameters
----------
theWindow: Aspect_NeutralWindow

Return
-------
None

Description
-----------
Update subview position and dimensions.
") SubviewResized;
		void SubviewResized(const opencascade::handle<Aspect_NeutralWindow> & theWindow);

		/****** Graphic3d_CView::SubviewSize ******/
		/****** md5 signature: cdbb288d2d9c87b7a4eb931ad52a8d97 ******/
		%feature("compactdefaultargs") SubviewSize;
		%feature("autodoc", "Return
-------
NCollection_Vec2<double>

Description
-----------
Return subview dimensions; (1.0, 1.0) by default. Values >= 2 define size in pixels; Values <= 1.0 define size as fraction of parent view.
") SubviewSize;
		const NCollection_Vec2<double> & SubviewSize();

		/****** Graphic3d_CView::SubviewTopLeft ******/
		/****** md5 signature: 2d8f18bdc2a7de2f8d6e6463d7c51b5a ******/
		%feature("compactdefaultargs") SubviewTopLeft;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int>

Description
-----------
Return subview top-left position relative to parent view in pixels.
") SubviewTopLeft;
		const NCollection_Vec2<int> & SubviewTopLeft();

		/****** Graphic3d_CView::Subviews ******/
		/****** md5 signature: efad4d5ad0d94cfbce25117f22a13570 ******/
		%feature("compactdefaultargs") Subviews;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<Graphic3d_CView>>

Description
-----------
Return subview list.
") Subviews;
		const NCollection_Sequence<opencascade::handle<Graphic3d_CView>> & Subviews();

		/****** Graphic3d_CView::SynchronizeXRBaseToPosedCamera ******/
		/****** md5 signature: 871de4dab7795f0e2c4a6d9779b77617 ******/
		%feature("compactdefaultargs") SynchronizeXRBaseToPosedCamera;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes PosedXRCamera() based on BaseXRCamera() and head orientation.
") SynchronizeXRBaseToPosedCamera;
		void SynchronizeXRBaseToPosedCamera();

		/****** Graphic3d_CView::SynchronizeXRPosedToBaseCamera ******/
		/****** md5 signature: a6d48b080f5581be36e592a34874b56b ******/
		%feature("compactdefaultargs") SynchronizeXRPosedToBaseCamera;
		%feature("autodoc", "Return
-------
None

Description
-----------
Checks if PosedXRCamera() has been modified since SetupXRPosedCamera() and copies these modifications to BaseXRCamera().
") SynchronizeXRPosedToBaseCamera;
		void SynchronizeXRPosedToBaseCamera();

		/****** Graphic3d_CView::TextureEnv ******/
		/****** md5 signature: 69a1becf8add8a150fed319c6c1816f8 ******/
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TextureEnv>

Description
-----------
Returns environment texture set for the view.
") TextureEnv;
		const opencascade::handle<Graphic3d_TextureEnv> & TextureEnv();

		/****** Graphic3d_CView::ToFlipOutput ******/
		/****** md5 signature: 4c60b6e5760122c4289c464efbb5aa51 ******/
		%feature("compactdefaultargs") ToFlipOutput;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns necessity to flip OY in projection matrix.
") ToFlipOutput;
		virtual bool ToFlipOutput();

		/****** Graphic3d_CView::TurnViewXRCamera ******/
		/****** md5 signature: b541a212e2a9d644acb1e40cadfae6e8 ******/
		%feature("compactdefaultargs") TurnViewXRCamera;
		%feature("autodoc", "
Parameters
----------
theTrsfTurn: gp_Trsf

Return
-------
None

Description
-----------
Turn XR camera direction using current (head) eye position as anchor.
") TurnViewXRCamera;
		void TurnViewXRCamera(const gp_Trsf & theTrsfTurn);

		/****** Graphic3d_CView::UnitFactor ******/
		/****** md5 signature: 357beeb9b9619501c8cf18307139ee87 ******/
		%feature("compactdefaultargs") UnitFactor;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return unit scale factor defined as scale factor for m (meters); 1.0 by default. Normally, view definition is unitless, however some operations like VR input requires proper units mapping.
") UnitFactor;
		double UnitFactor();

		/****** Graphic3d_CView::UnsetXRPosedCamera ******/
		/****** md5 signature: df56638996c669fe022e488f9d17f78a ******/
		%feature("compactdefaultargs") UnsetXRPosedCamera;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set current camera back to BaseXRCamera() and copy temporary modifications of PosedXRCamera(). Calls SynchronizeXRPosedToBaseCamera() beforehand.
") UnsetXRPosedCamera;
		void UnsetXRPosedCamera();

		/****** Graphic3d_CView::Update ******/
		/****** md5 signature: 42afb73ab8b865201bb1288942842c78 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
theLayerId: int (optional, default to Graphic3d_ZLayerId_UNKNOWN)

Return
-------
None

Description
-----------
Invalidates bounding box of specified ZLayerId.
") Update;
		void Update(int theLayerId = Graphic3d_ZLayerId_UNKNOWN);

		/****** Graphic3d_CView::ViewAxisInWorld ******/
		/****** md5 signature: 06c02c071e04e67bc6c53cce8ff03eae ******/
		%feature("compactdefaultargs") ViewAxisInWorld;
		%feature("autodoc", "
Parameters
----------
thePoseXR: gp_Trsf

Return
-------
gp_Ax1

Description
-----------
Returns view direction in the world space based on XR pose. 
Input parameter: thePoseXR transformation defined in VR local coordinate system,  oriented as Y-up, X-right and -Z-forward.
") ViewAxisInWorld;
		gp_Ax1 ViewAxisInWorld(const gp_Trsf & thePoseXR);

		/****** Graphic3d_CView::VisualizationType ******/
		/****** md5 signature: c16f318d97b0af9f922f150a729b4b3e ******/
		%feature("compactdefaultargs") VisualizationType;
		%feature("autodoc", "Return
-------
Graphic3d_TypeOfVisualization

Description
-----------
Returns visualization type of the view.
") VisualizationType;
		Graphic3d_TypeOfVisualization VisualizationType();

		/****** Graphic3d_CView::Window ******/
		/****** md5 signature: 72ad541502b66387894c3f250aaf45d4 ******/
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "Return
-------
opencascade::handle<Aspect_Window>

Description
-----------
Returns the window associated to the view.
") Window;
		virtual opencascade::handle<Aspect_Window> Window();

		/****** Graphic3d_CView::XRSession ******/
		/****** md5 signature: 6e06f1519d78ccfed4af5ad1424bd1b2 ******/
		%feature("compactdefaultargs") XRSession;
		%feature("autodoc", "Return
-------
opencascade::handle<Aspect_XRSession>

Description
-----------
Return XR session.
") XRSession;
		const opencascade::handle<Aspect_XRSession> & XRSession();

		/****** Graphic3d_CView::ZLayerMax ******/
		/****** md5 signature: cee0b501ef5076c76ef8b97cf515bf58 ******/
		%feature("compactdefaultargs") ZLayerMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the maximum Z layer ID. First layer ID is Graphic3d_ZLayerId_Default, last ID is ZLayerMax().
") ZLayerMax;
		virtual int ZLayerMax();

		/****** Graphic3d_CView::ZLayerRedrawMode ******/
		/****** md5 signature: 18a9c19b62eff872894d65f3f17fd77d ******/
		%feature("compactdefaultargs") ZLayerRedrawMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns ZLayerId redraw mode.
") ZLayerRedrawMode;
		bool ZLayerRedrawMode();

		/****** Graphic3d_CView::ZLayerTarget ******/
		/****** md5 signature: 1913fc6390a70c6fb6292e356da5572c ******/
		%feature("compactdefaultargs") ZLayerTarget;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerId

Description
-----------
Returns ZLayerId target.
") ZLayerTarget;
		Graphic3d_ZLayerId ZLayerTarget();

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
		/****** Graphic3d_FrameStatsDataTmp::Graphic3d_FrameStatsDataTmp ******/
		/****** md5 signature: 88d77300987d2c206b338f657e5c0f18 ******/
		%feature("compactdefaultargs") Graphic3d_FrameStatsDataTmp;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_FrameStatsDataTmp;
		 Graphic3d_FrameStatsDataTmp();

		/****** Graphic3d_FrameStatsDataTmp::ChangeCounterValue ******/
		/****** md5 signature: c5e034159938957e99ddbb96e5d18652 ******/
		%feature("compactdefaultargs") ChangeCounterValue;
		%feature("autodoc", "
Parameters
----------
theIndex: Graphic3d_FrameStatsCounter

Return
-------
size_t

Description
-----------
Get counter value.
") ChangeCounterValue;
		size_t & ChangeCounterValue(Graphic3d_FrameStatsCounter theIndex);

		/****** Graphic3d_FrameStatsDataTmp::ChangeFrameRate ******/
		/****** md5 signature: d72774ff01c027b6374aa67d3c9b0f55 ******/
		%feature("compactdefaultargs") ChangeFrameRate;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns FPS (frames per seconds, elapsed time).
") ChangeFrameRate;
		double & ChangeFrameRate();

		/****** Graphic3d_FrameStatsDataTmp::ChangeFrameRateCpu ******/
		/****** md5 signature: a47fd97347381e4f8155ace370901b6f ******/
		%feature("compactdefaultargs") ChangeFrameRateCpu;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns CPU FPS (frames per seconds, CPU time).
") ChangeFrameRateCpu;
		double & ChangeFrameRateCpu();

		/****** Graphic3d_FrameStatsDataTmp::ChangeImmediateFrameRate ******/
		/****** md5 signature: 469b0a714eaae2986e6aeee9d54ae971 ******/
		%feature("compactdefaultargs") ChangeImmediateFrameRate;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns FPS for immediate redraws.
") ChangeImmediateFrameRate;
		double & ChangeImmediateFrameRate();

		/****** Graphic3d_FrameStatsDataTmp::ChangeImmediateFrameRateCpu ******/
		/****** md5 signature: 2b61571a22d5e8eca21514b151e87304 ******/
		%feature("compactdefaultargs") ChangeImmediateFrameRateCpu;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns CPU FPS for immediate redraws.
") ChangeImmediateFrameRateCpu;
		double & ChangeImmediateFrameRateCpu();

		/****** Graphic3d_FrameStatsDataTmp::ChangeTimer ******/
		/****** md5 signature: 338985f32bc00db9d3129a5133cf5dcb ******/
		%feature("compactdefaultargs") ChangeTimer;
		%feature("autodoc", "
Parameters
----------
theTimer: Graphic3d_FrameStatsTimer

Return
-------
OSD_Timer

Description
-----------
Return a timer object for time measurements.
") ChangeTimer;
		OSD_Timer & ChangeTimer(Graphic3d_FrameStatsTimer theTimer);

		/****** Graphic3d_FrameStatsDataTmp::ChangeTimerValue ******/
		/****** md5 signature: e02e823acff93f20e3b4e2427a0584e6 ******/
		%feature("compactdefaultargs") ChangeTimerValue;
		%feature("autodoc", "
Parameters
----------
theIndex: Graphic3d_FrameStatsTimer

Return
-------
double

Description
-----------
Modify timer value.
") ChangeTimerValue;
		double & ChangeTimerValue(Graphic3d_FrameStatsTimer theIndex);

		/****** Graphic3d_FrameStatsDataTmp::FlushTimers ******/
		/****** md5 signature: d91a4fb78fb0f0da39ee1468329da9db ******/
		%feature("compactdefaultargs") FlushTimers;
		%feature("autodoc", "
Parameters
----------
theNbFrames: size_t
theIsFinal: bool

Return
-------
None

Description
-----------
Compute average data considering the amount of rendered frames.
") FlushTimers;
		void FlushTimers(size_t theNbFrames, bool theIsFinal);

		/****** Graphic3d_FrameStatsDataTmp::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset data.
") Reset;
		void Reset();

		%extend{
			double GetChangeFrameRate() { return self->ChangeFrameRate(); }
			void SetChangeFrameRate(double value) { self->ChangeFrameRate() = value; }
		};
		%extend{
			double GetChangeFrameRateCpu() { return self->ChangeFrameRateCpu(); }
			void SetChangeFrameRateCpu(double value) { self->ChangeFrameRateCpu() = value; }
		};
		%extend{
			double GetChangeImmediateFrameRate() { return self->ChangeImmediateFrameRate(); }
			void SetChangeImmediateFrameRate(double value) { self->ChangeImmediateFrameRate() = value; }
		};
		%extend{
			double GetChangeImmediateFrameRateCpu() { return self->ChangeImmediateFrameRateCpu(); }
			void SetChangeImmediateFrameRateCpu(double value) { self->ChangeImmediateFrameRateCpu() = value; }
		};
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
		/****** Graphic3d_MediaTextureSet::Graphic3d_MediaTextureSet ******/
		/****** md5 signature: 3de3d4d8ea0c3573cfb22874d93b1777 ******/
		%feature("compactdefaultargs") Graphic3d_MediaTextureSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_MediaTextureSet;
		 Graphic3d_MediaTextureSet();

		/****** Graphic3d_MediaTextureSet::Duration ******/
		/****** md5 signature: 7dbbe5f7e0b63b92819c252fd1239f67 ******/
		%feature("compactdefaultargs") Duration;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return duration in seconds.
") Duration;
		double Duration();

		/****** Graphic3d_MediaTextureSet::FrameSize ******/
		/****** md5 signature: 25577e3d050b4f4311ada4b5eb3e67dd ******/
		%feature("compactdefaultargs") FrameSize;
		%feature("autodoc", "Return
-------
NCollection_Vec2<int >

Description
-----------
Return front frame dimensions.
") FrameSize;
		NCollection_Vec2<int > FrameSize();

		/****** Graphic3d_MediaTextureSet::Input ******/
		/****** md5 signature: f6133f739797d33668dfa0592653ea45 ******/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Return input media.
") Input;
		const TCollection_AsciiString & Input();

		/****** Graphic3d_MediaTextureSet::IsFullRangeYUV ******/
		/****** md5 signature: bafa00ec10e57dd7b03daa1b15f4fde5 ******/
		%feature("compactdefaultargs") IsFullRangeYUV;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if YUV range is full.
") IsFullRangeYUV;
		bool IsFullRangeYUV();

		/****** Graphic3d_MediaTextureSet::IsPlanarYUV ******/
		/****** md5 signature: 1985e65cb6bee521fbacf53ee91e955e ******/
		%feature("compactdefaultargs") IsPlanarYUV;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if texture set defined 3 YUV planes.
") IsPlanarYUV;
		bool IsPlanarYUV();

		/****** Graphic3d_MediaTextureSet::Notify ******/
		/****** md5 signature: 2491f7f734b89141b57f81cc2f5a48ba ******/
		%feature("compactdefaultargs") Notify;
		%feature("autodoc", "Return
-------
None

Description
-----------
Call callback.
") Notify;
		void Notify();

		/****** Graphic3d_MediaTextureSet::OpenInput ******/
		/****** md5 signature: d26354b811f0c9d27e0306b4e1650003 ******/
		%feature("compactdefaultargs") OpenInput;
		%feature("autodoc", "
Parameters
----------
thePath: str
theToWait: bool

Return
-------
None

Description
-----------
Open specified file. Passing an empty path would close current input.
") OpenInput;
		void OpenInput(TCollection_AsciiString thePath, bool theToWait);

		/****** Graphic3d_MediaTextureSet::PlayerContext ******/
		/****** md5 signature: 5fc0e0cbec11700279e3e8631feee60b ******/
		%feature("compactdefaultargs") PlayerContext;
		%feature("autodoc", "Return
-------
opencascade::handle<Media_PlayerContext>

Description
-----------
Return player context; it can be NULL until first OpenInput().
") PlayerContext;
		const opencascade::handle<Media_PlayerContext> & PlayerContext();

		/****** Graphic3d_MediaTextureSet::Progress ******/
		/****** md5 signature: a2570a54b89c9d02c8a49bac78772b2a ******/
		%feature("compactdefaultargs") Progress;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return playback progress in seconds.
") Progress;
		double Progress();

		/****** Graphic3d_MediaTextureSet::ShaderProgram ******/
		/****** md5 signature: b1d414c1bce3b143f4f8567b5e109ee2 ******/
		%feature("compactdefaultargs") ShaderProgram;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ShaderProgram>

Description
-----------
Return shader program for displaying texture set.
") ShaderProgram;
		opencascade::handle<Graphic3d_ShaderProgram> ShaderProgram();

		/****** Graphic3d_MediaTextureSet::SwapFrames ******/
		/****** md5 signature: cc0a1fbc6fd1a34ddbad868eaefb0119 ******/
		%feature("compactdefaultargs") SwapFrames;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Swap front/back frames.
") SwapFrames;
		bool SwapFrames();

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
		/****** Graphic3d_TextureEnv::Graphic3d_TextureEnv ******/
		/****** md5 signature: 2112b4d65f1fbb19be75b979414ef96b ******/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Creates an environment texture from a file.
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv(TCollection_AsciiString theFileName);

		/****** Graphic3d_TextureEnv::Graphic3d_TextureEnv ******/
		/****** md5 signature: ceed081a5b5bebc2038ab1db122c6085 ******/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "
Parameters
----------
theName: Graphic3d_NameOfTextureEnv

Return
-------
None

Description
-----------
Creates an environment texture from a predefined texture name set.
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv(const Graphic3d_NameOfTextureEnv theName);

		/****** Graphic3d_TextureEnv::Graphic3d_TextureEnv ******/
		/****** md5 signature: cf902025332194a30f00f51e839b2ba2 ******/
		%feature("compactdefaultargs") Graphic3d_TextureEnv;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Creates an environment texture from the pixmap.
") Graphic3d_TextureEnv;
		 Graphic3d_TextureEnv(const opencascade::handle<Image_PixMap> & thePixMap);

		/****** Graphic3d_TextureEnv::Name ******/
		/****** md5 signature: b18daa83e0f455d1890b80e7b2432c14 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfTextureEnv

Description
-----------
Returns the name of the predefined textures or NOT_ENV_UNKNOWN when the name is given as a filename.
") Name;
		Graphic3d_NameOfTextureEnv Name();

		/****** Graphic3d_TextureEnv::NumberOfTextures ******/
		/****** md5 signature: 034ef311eae44a77c6b659d30defe4c1 ******/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of predefined textures.
") NumberOfTextures;
		static int NumberOfTextures();

		/****** Graphic3d_TextureEnv::TextureName ******/
		/****** md5 signature: 36d76f99d0be93b8dcb2399f3fb71c77 ******/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of the predefined texture of rank <aRank>.
") TextureName;
		static TCollection_AsciiString TextureName(const int theRank);

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
		/****** Graphic3d_TextureMap::AnisoFilter ******/
		/****** md5 signature: 616e07e87d398d0de8754a2bd09bff5a ******/
		%feature("compactdefaultargs") AnisoFilter;
		%feature("autodoc", "Return
-------
Graphic3d_LevelOfTextureAnisotropy

Description
-----------
Return: level of anisotropy texture filter. Default value is Graphic3d_LOTA_OFF.
") AnisoFilter;
		Graphic3d_LevelOfTextureAnisotropy AnisoFilter();

		/****** Graphic3d_TextureMap::DisableModulate ******/
		/****** md5 signature: 578fca54e32c9ab5aef797fdad9bc761 ******/
		%feature("compactdefaultargs") DisableModulate;
		%feature("autodoc", "Return
-------
None

Description
-----------
disable texture modulate mode. the image is directly decal on the surface.
") DisableModulate;
		void DisableModulate();

		/****** Graphic3d_TextureMap::DisableRepeat ******/
		/****** md5 signature: 4de6e4194dd0c2daff17603fbe7d5da6 ******/
		%feature("compactdefaultargs") DisableRepeat;
		%feature("autodoc", "Return
-------
None

Description
-----------
use this methods if you want to disable texture repetition on your objects.
") DisableRepeat;
		void DisableRepeat();

		/****** Graphic3d_TextureMap::DisableSmooth ******/
		/****** md5 signature: 84f2db317172b668042c5f156ea5b230 ******/
		%feature("compactdefaultargs") DisableSmooth;
		%feature("autodoc", "Return
-------
None

Description
-----------
disable texture smoothing.
") DisableSmooth;
		void DisableSmooth();

		/****** Graphic3d_TextureMap::EnableModulate ******/
		/****** md5 signature: 46c33aa561af11d8817f95477a9ded73 ******/
		%feature("compactdefaultargs") EnableModulate;
		%feature("autodoc", "Return
-------
None

Description
-----------
enable texture modulate mode. the image is modulate with the shading of the surface.
") EnableModulate;
		void EnableModulate();

		/****** Graphic3d_TextureMap::EnableRepeat ******/
		/****** md5 signature: d118f94ba7c0d3844f3dce4aeefd9e4f ******/
		%feature("compactdefaultargs") EnableRepeat;
		%feature("autodoc", "Return
-------
None

Description
-----------
use this methods if you want to enable texture repetition on your objects.
") EnableRepeat;
		void EnableRepeat();

		/****** Graphic3d_TextureMap::EnableSmooth ******/
		/****** md5 signature: cee9b8d17c0a74300f6ee9f08ef3bf01 ******/
		%feature("compactdefaultargs") EnableSmooth;
		%feature("autodoc", "Return
-------
None

Description
-----------
enable texture smoothing.
") EnableSmooth;
		void EnableSmooth();

		/****** Graphic3d_TextureMap::IsModulate ******/
		/****** md5 signature: 5f5f4c3c3812780a1680ea2352816fc1 ******/
		%feature("compactdefaultargs") IsModulate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the texture is modulate.
") IsModulate;
		bool IsModulate();

		/****** Graphic3d_TextureMap::IsRepeat ******/
		/****** md5 signature: 404291ae01dc0a937b577e24955e6222 ******/
		%feature("compactdefaultargs") IsRepeat;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the texture repeat is enable.
") IsRepeat;
		bool IsRepeat();

		/****** Graphic3d_TextureMap::IsSmoothed ******/
		/****** md5 signature: a549acd75572e7ef0d9a26e68fe12c26 ******/
		%feature("compactdefaultargs") IsSmoothed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the texture is smoothed.
") IsSmoothed;
		bool IsSmoothed();

		/****** Graphic3d_TextureMap::SetAnisoFilter ******/
		/****** md5 signature: 999fe7bc1a26aa6af8d56299c100b537 ******/
		%feature("compactdefaultargs") SetAnisoFilter;
		%feature("autodoc", "
Parameters
----------
theLevel: Graphic3d_LevelOfTextureAnisotropy

Return
-------
None

Description
-----------
Parameter theLevel level of anisotropy texture filter.
") SetAnisoFilter;
		void SetAnisoFilter(const Graphic3d_LevelOfTextureAnisotropy theLevel);

};


%make_alias(Graphic3d_TextureMap)

%extend Graphic3d_TextureMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class Graphic3d_TransformPersScaledAbove *
*******************************************/
class Graphic3d_TransformPersScaledAbove : public Graphic3d_TransformPers {
	public:
		/****** Graphic3d_TransformPersScaledAbove::Graphic3d_TransformPersScaledAbove ******/
		/****** md5 signature: 0a0661b7008a07f89800684eb9a7c673 ******/
		%feature("compactdefaultargs") Graphic3d_TransformPersScaledAbove;
		%feature("autodoc", "
Parameters
----------
theScale: double
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Create a Zoom transformation persistence with an anchor 3D point and a scale value.
") Graphic3d_TransformPersScaledAbove;
		 Graphic3d_TransformPersScaledAbove(const double theScale, const gp_Pnt & thePnt);

		/****** Graphic3d_TransformPersScaledAbove::persistentScale ******/
		/****** md5 signature: 2ff09eccfd9ed1c4c581f19f3c5264ee ******/
		%feature("compactdefaultargs") persistentScale;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera
theViewportWidth: int
theViewportHeight: int

Return
-------
double

Description
-----------
Find scale value based on the camera position and view dimensions If the camera scale value less than the persistence scale, zoom persistence is not applied. 
Input parameter: theCamera camera definition 
Input parameter: theViewportWidth the width of viewport. 
Input parameter: theViewportHeight the height of viewport.
") persistentScale;
		double persistentScale(const opencascade::handle<Graphic3d_Camera> & theCamera, const int theViewportWidth, const int theViewportHeight);

};


%make_alias(Graphic3d_TransformPersScaledAbove)

%extend Graphic3d_TransformPersScaledAbove {
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
		/****** Graphic3d_CubeMap::CompressedValue ******/
		/****** md5 signature: bf947852bd98eb2918f411f1fb6ed99a ******/
		%feature("compactdefaultargs") CompressedValue;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_CompressedPixMap>

Description
-----------
Returns current cubemap side as compressed PixMap. Returns null handle if current side is invalid or if image is not in supported compressed format.
") CompressedValue;
		virtual opencascade::handle<Image_CompressedPixMap> CompressedValue(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** Graphic3d_CubeMap::CurrentSide ******/
		/****** md5 signature: 868f3bc8b7395cad6d44ef8baafa777c ******/
		%feature("compactdefaultargs") CurrentSide;
		%feature("autodoc", "Return
-------
Graphic3d_CubeMapSide

Description
-----------
Returns current cubemap side (iterator state).
") CurrentSide;
		Graphic3d_CubeMapSide CurrentSide();

		/****** Graphic3d_CubeMap::HasMipmaps ******/
		/****** md5 signature: 6398cc4985422addc3f64f52d79f06b4 ******/
		%feature("compactdefaultargs") HasMipmaps;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether mipmaps of cubemap will be generated or not.
") HasMipmaps;
		bool HasMipmaps();

		/****** Graphic3d_CubeMap::More ******/
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether the iterator has reached the end (true if it hasn't).
") More;
		bool More();

		/****** Graphic3d_CubeMap::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves iterator to the next cubemap side. Uses OpenGL cubemap sides order +X -> -X -> +Y -> -Y -> +Z -> -Z.
") Next;
		void Next();

		/****** Graphic3d_CubeMap::Reset ******/
		/****** md5 signature: 1730adde2bf4f51544d37f5915605dd4 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
Graphic3d_CubeMap

Description
-----------
Sets iterator state to +X cubemap side.
") Reset;
		Graphic3d_CubeMap & Reset();

		/****** Graphic3d_CubeMap::SetMipmapsGeneration ******/
		/****** md5 signature: 403a5ffc884feefadb3d4a8ee1576025 ******/
		%feature("compactdefaultargs") SetMipmapsGeneration;
		%feature("autodoc", "
Parameters
----------
theToGenerateMipmaps: bool

Return
-------
None

Description
-----------
Sets whether to generate mipmaps of cubemap or not.
") SetMipmapsGeneration;
		void SetMipmapsGeneration(bool theToGenerateMipmaps);

		/****** Graphic3d_CubeMap::SetZInversion ******/
		/****** md5 signature: 3c8bd985bea847fee8aa5d7f3bfbf79f ******/
		%feature("compactdefaultargs") SetZInversion;
		%feature("autodoc", "
Parameters
----------
theZIsInverted: bool

Return
-------
None

Description
-----------
Sets Z axis inversion (vertical flipping).
") SetZInversion;
		void SetZInversion(bool theZIsInverted);

		/****** Graphic3d_CubeMap::Value ******/
		/****** md5 signature: 163288e9c0b00e99cbafd39e941416a5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Returns PixMap containing current side of cubemap. Returns null handle if current side is invalid.
") Value;
		virtual opencascade::handle<Image_PixMap> Value(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** Graphic3d_CubeMap::ZIsInverted ******/
		/****** md5 signature: 3c0051e2f029ee3aa7379cc73e77f0c6 ******/
		%feature("compactdefaultargs") ZIsInverted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether Z axis is inverted.
") ZIsInverted;
		bool ZIsInverted();

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
		/****** Graphic3d_MutableIndexBuffer::Graphic3d_MutableIndexBuffer ******/
		/****** md5 signature: 6c19f80602f2b82b4f45c578ca95634c ******/
		%feature("compactdefaultargs") Graphic3d_MutableIndexBuffer;
		%feature("autodoc", "
Parameters
----------
theAlloc: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Empty constructor.
") Graphic3d_MutableIndexBuffer;
		 Graphic3d_MutableIndexBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****** Graphic3d_MutableIndexBuffer::Invalidate ******/
		/****** md5 signature: 2176761f5ff30dea56189d550d43f41b ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidate the entire buffer data.
") Invalidate;
		void Invalidate();

		/****** Graphic3d_MutableIndexBuffer::Invalidate ******/
		/****** md5 signature: c481839c83da4ba7184806c272417665 ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "
Parameters
----------
theIndexLower: int
theIndexUpper: int

Return
-------
None

Description
-----------
Invalidate the given indexes (starting from 0).
") Invalidate;
		void Invalidate(int theIndexLower, int theIndexUpper);

		/****** Graphic3d_MutableIndexBuffer::InvalidatedRange ******/
		/****** md5 signature: e19405b068ef860efe75aa5200cb5861 ******/
		%feature("compactdefaultargs") InvalidatedRange;
		%feature("autodoc", "Return
-------
Graphic3d_BufferRange

Description
-----------
Return invalidated range.
") InvalidatedRange;
		Graphic3d_BufferRange InvalidatedRange();

		/****** Graphic3d_MutableIndexBuffer::IsMutable ******/
		/****** md5 signature: 341cced24aa661235d95dfe00c85590b ******/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if data can be invalidated.
") IsMutable;
		bool IsMutable();

		/****** Graphic3d_MutableIndexBuffer::Validate ******/
		/****** md5 signature: 63d8297d51c4ac9bb56f07040619316a ******/
		%feature("compactdefaultargs") Validate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset invalidated range.
") Validate;
		void Validate();

		/****** Graphic3d_MutableIndexBuffer::invalidate ******/
		/****** md5 signature: d1325b233234527746db5858cd03173a ******/
		%feature("compactdefaultargs") invalidate;
		%feature("autodoc", "
Parameters
----------
theRange: Graphic3d_BufferRange

Return
-------
None

Description
-----------
Invalidate specified sub-range of data (as byte offsets).
") invalidate;
		void invalidate(const Graphic3d_BufferRange & theRange);

};


%make_alias(Graphic3d_MutableIndexBuffer)

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
		/****** Graphic3d_Texture1D::Name ******/
		/****** md5 signature: c5471c14d098eed717caf07f9214bf7e ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfTexture1D

Description
-----------
Returns the name of the predefined textures or NOT_1D_UNKNOWN when the name is given as a filename.
") Name;
		Graphic3d_NameOfTexture1D Name();

		/****** Graphic3d_Texture1D::NumberOfTextures ******/
		/****** md5 signature: 034ef311eae44a77c6b659d30defe4c1 ******/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of predefined textures.
") NumberOfTextures;
		static int NumberOfTextures();

		/****** Graphic3d_Texture1D::TextureName ******/
		/****** md5 signature: 238f901e74efdc24565e51cd6481628b ******/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "
Parameters
----------
aRank: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of the predefined texture of rank <aRank>.
") TextureName;
		static TCollection_AsciiString TextureName(const int aRank);

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
class Graphic3d_Texture2D : public Graphic3d_TextureMap {
	public:
		/****** Graphic3d_Texture2D::Graphic3d_Texture2D ******/
		/****** md5 signature: 42799dbe2ef101e14db536cd8b8ed8e0 ******/
		%feature("compactdefaultargs") Graphic3d_Texture2D;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Creates a texture from a file. MipMaps levels will be automatically generated if needed.
") Graphic3d_Texture2D;
		 Graphic3d_Texture2D(TCollection_AsciiString theFileName);

		/****** Graphic3d_Texture2D::Graphic3d_Texture2D ******/
		/****** md5 signature: 1148eac074475874ab0ee8fd1f12cc0c ******/
		%feature("compactdefaultargs") Graphic3d_Texture2D;
		%feature("autodoc", "
Parameters
----------
theNOT: Graphic3d_NameOfTexture2D

Return
-------
None

Description
-----------
Creates a texture from a predefined texture name set. MipMaps levels will be automatically generated if needed.
") Graphic3d_Texture2D;
		 Graphic3d_Texture2D(const Graphic3d_NameOfTexture2D theNOT);

		/****** Graphic3d_Texture2D::Graphic3d_Texture2D ******/
		/****** md5 signature: f31bc2827b957c944fcc334f2c5c43a4 ******/
		%feature("compactdefaultargs") Graphic3d_Texture2D;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Creates a texture from the pixmap. MipMaps levels will be automatically generated if needed.
") Graphic3d_Texture2D;
		 Graphic3d_Texture2D(const opencascade::handle<Image_PixMap> & thePixMap);

		/****** Graphic3d_Texture2D::Name ******/
		/****** md5 signature: dda2451d076770a05a4cf60ebc1b2135 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfTexture2D

Description
-----------
Returns the name of the predefined textures or NOT_2D_UNKNOWN when the name is given as a filename.
") Name;
		Graphic3d_NameOfTexture2D Name();

		/****** Graphic3d_Texture2D::NumberOfTextures ******/
		/****** md5 signature: 034ef311eae44a77c6b659d30defe4c1 ******/
		%feature("compactdefaultargs") NumberOfTextures;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of predefined textures.
") NumberOfTextures;
		static int NumberOfTextures();

		/****** Graphic3d_Texture2D::SetImage ******/
		/****** md5 signature: 1588c589999c87638afeed7026805f57 ******/
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Assign new image to the texture. Note that this method does not invalidate already uploaded resources - consider calling ::UpdateRevision() if needed.
") SetImage;
		void SetImage(const opencascade::handle<Image_PixMap> & thePixMap);

		/****** Graphic3d_Texture2D::TextureName ******/
		/****** md5 signature: 36d76f99d0be93b8dcb2399f3fb71c77 ******/
		%feature("compactdefaultargs") TextureName;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
TCollection_AsciiString

Description
-----------
Returns the name of the predefined texture of rank <aRank>.
") TextureName;
		static TCollection_AsciiString TextureName(const int theRank);

};


%make_alias(Graphic3d_Texture2D)

%extend Graphic3d_Texture2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Graphic3d_Texture3D *
****************************/
class Graphic3d_Texture3D : public Graphic3d_TextureMap {
	public:
		/****** Graphic3d_Texture3D::Graphic3d_Texture3D ******/
		/****** md5 signature: 6fcc5f22036cf564f191b2df12d5acf4 ******/
		%feature("compactdefaultargs") Graphic3d_Texture3D;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Creates a texture from a file.
") Graphic3d_Texture3D;
		 Graphic3d_Texture3D(TCollection_AsciiString theFileName);

		/****** Graphic3d_Texture3D::Graphic3d_Texture3D ******/
		/****** md5 signature: 12b8a332dec18b02096d54770852207e ******/
		%feature("compactdefaultargs") Graphic3d_Texture3D;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Creates a texture from the pixmap.
") Graphic3d_Texture3D;
		 Graphic3d_Texture3D(const opencascade::handle<Image_PixMap> & thePixMap);

		/****** Graphic3d_Texture3D::Graphic3d_Texture3D ******/
		/****** md5 signature: b32ff230302c7b38b4a2a75c7f11b74e ******/
		%feature("compactdefaultargs") Graphic3d_Texture3D;
		%feature("autodoc", "
Parameters
----------
theFiles: TColStd_Array1OfAsciiString

Return
-------
None

Description
-----------
Creates a texture from a file.
") Graphic3d_Texture3D;
		 Graphic3d_Texture3D(const TColStd_Array1OfAsciiString & theFiles);

		/****** Graphic3d_Texture3D::GetImage ******/
		/****** md5 signature: f3110abc861a9f81a571119022fa772d ******/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Load and return image.
") GetImage;
		opencascade::handle<Image_PixMap> GetImage(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** Graphic3d_Texture3D::SetImage ******/
		/****** md5 signature: 1588c589999c87638afeed7026805f57 ******/
		%feature("compactdefaultargs") SetImage;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Assign new image to the texture. Note that this method does not invalidate already uploaded resources - consider calling ::UpdateRevision() if needed.
") SetImage;
		void SetImage(const opencascade::handle<Image_PixMap> & thePixMap);

};


%make_alias(Graphic3d_Texture3D)

%extend Graphic3d_Texture3D {
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
		/****** Graphic3d_CubeMapSeparate::Graphic3d_CubeMapSeparate ******/
		/****** md5 signature: f214f0a66b33cb73305ea1065b68a323 ******/
		%feature("compactdefaultargs") Graphic3d_CubeMapSeparate;
		%feature("autodoc", "
Parameters
----------
thePaths: TColStd_Array1OfAsciiString

Return
-------
None

Description
-----------
Initializes cubemap to be loaded from file. @thePaths - array of paths to separate image files (has to have size equal 6).
") Graphic3d_CubeMapSeparate;
		 Graphic3d_CubeMapSeparate(const TColStd_Array1OfAsciiString & thePaths);

		/****** Graphic3d_CubeMapSeparate::Graphic3d_CubeMapSeparate ******/
		/****** md5 signature: 56d466dfd473af1aaaef0bb290e3c427 ******/
		%feature("compactdefaultargs") Graphic3d_CubeMapSeparate;
		%feature("autodoc", "
Parameters
----------
theImages: Image_PixMap

Return
-------
None

Description
-----------
Initializes cubemap to be set directly from PixMaps. @theImages - array if PixMaps (has to have size equal 6).
") Graphic3d_CubeMapSeparate;
		 Graphic3d_CubeMapSeparate(const NCollection_Array1<opencascade::handle<Image_PixMap>> & theImages);

		/****** Graphic3d_CubeMapSeparate::CompressedValue ******/
		/****** md5 signature: 0ba0af76303e68254190d70e7961a83e ******/
		%feature("compactdefaultargs") CompressedValue;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_CompressedPixMap>

Description
-----------
Returns current cubemap side as compressed PixMap.
") CompressedValue;
		opencascade::handle<Image_CompressedPixMap> CompressedValue(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** Graphic3d_CubeMapSeparate::GetImage ******/
		/****** md5 signature: 52e3d85a2eedca73622a02b6f21c34a6 ******/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "
Parameters
----------
&: Image_SupportedFormats

Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Returns NULL.
") GetImage;
		opencascade::handle<Image_PixMap> GetImage(const opencascade::handle<Image_SupportedFormats > &);

		/****** Graphic3d_CubeMapSeparate::IsDone ******/
		/****** md5 signature: 2be114a985aea21262ebd32099ccc3a6 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if a texture class is valid or not. Returns true if the construction of the class is correct.
") IsDone;
		bool IsDone();

		/****** Graphic3d_CubeMapSeparate::Value ******/
		/****** md5 signature: 01b640b4b474657e9d31f2fdb8a72e0b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Returns current side of cubemap as PixMap. Returns null handle if current side or whole cubemap is invalid. All origin images have to have the same sizes, format and quad shapes to form valid cubemap.
") Value;
		opencascade::handle<Image_PixMap> Value(const opencascade::handle<Image_SupportedFormats> & theSupported);

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
%nodefaultctor Graphic3d_MediaTexture;
class Graphic3d_MediaTexture : public Graphic3d_Texture2D {
	public:
		/****** Graphic3d_MediaTexture::Frame ******/
		/****** md5 signature: 72eed6e2d3ed40f13a456563c383f7ca ******/
		%feature("compactdefaultargs") Frame;
		%feature("autodoc", "Return
-------
opencascade::handle<Media_Frame>

Description
-----------
Return the frame.
") Frame;
		const opencascade::handle<Media_Frame> & Frame();

		/****** Graphic3d_MediaTexture::GenerateNewId ******/
		/****** md5 signature: 1495d713b8162c3177562c052a16c340 ******/
		%feature("compactdefaultargs") GenerateNewId;
		%feature("autodoc", "Return
-------
None

Description
-----------
Regenerate a new texture id.
") GenerateNewId;
		void GenerateNewId();

		/****** Graphic3d_MediaTexture::GetImage ******/
		/****** md5 signature: f3110abc861a9f81a571119022fa772d ******/
		%feature("compactdefaultargs") GetImage;
		%feature("autodoc", "
Parameters
----------
theSupported: Image_SupportedFormats

Return
-------
opencascade::handle<Image_PixMap>

Description
-----------
Image reader.
") GetImage;
		opencascade::handle<Image_PixMap> GetImage(const opencascade::handle<Image_SupportedFormats> & theSupported);

		/****** Graphic3d_MediaTexture::SetFrame ******/
		/****** md5 signature: 0dfb0fadea2ff545daa07a8643107bce ******/
		%feature("compactdefaultargs") SetFrame;
		%feature("autodoc", "
Parameters
----------
theFrame: Media_Frame

Return
-------
None

Description
-----------
Set the frame.
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
		/****** Graphic3d_Texture1Dmanual::Graphic3d_Texture1Dmanual ******/
		/****** md5 signature: 16246a6717a0283bbe82f098c0f243dd ******/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Creates a texture from the file FileName.
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual(TCollection_AsciiString theFileName);

		/****** Graphic3d_Texture1Dmanual::Graphic3d_Texture1Dmanual ******/
		/****** md5 signature: 523b409c896dd67bb73e53f0713b5b88 ******/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "
Parameters
----------
theNOT: Graphic3d_NameOfTexture1D

Return
-------
None

Description
-----------
Create a texture from a predefined texture name set.
") Graphic3d_Texture1Dmanual;
		 Graphic3d_Texture1Dmanual(const Graphic3d_NameOfTexture1D theNOT);

		/****** Graphic3d_Texture1Dmanual::Graphic3d_Texture1Dmanual ******/
		/****** md5 signature: 144f42d65129f67ad24cb0055b483270 ******/
		%feature("compactdefaultargs") Graphic3d_Texture1Dmanual;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Creates a texture from the pixmap.
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
		/****** Graphic3d_Texture1Dsegment::Graphic3d_Texture1Dsegment ******/
		/****** md5 signature: 234567f0eac87576d69ef98d81103965 ******/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Creates a texture from a file.
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment(TCollection_AsciiString theFileName);

		/****** Graphic3d_Texture1Dsegment::Graphic3d_Texture1Dsegment ******/
		/****** md5 signature: a05398d4cb31cf6396ad390a24ec4de7 ******/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "
Parameters
----------
theNOT: Graphic3d_NameOfTexture1D

Return
-------
None

Description
-----------
Creates a texture from a predefined texture name set.
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment(const Graphic3d_NameOfTexture1D theNOT);

		/****** Graphic3d_Texture1Dsegment::Graphic3d_Texture1Dsegment ******/
		/****** md5 signature: 7a32ead788f54fc5cf095c004f556eb5 ******/
		%feature("compactdefaultargs") Graphic3d_Texture1Dsegment;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Creates a texture from the pixmap.
") Graphic3d_Texture1Dsegment;
		 Graphic3d_Texture1Dsegment(const opencascade::handle<Image_PixMap> & thePixMap);

		/****** Graphic3d_Texture1Dsegment::Segment ******/
		/****** md5 signature: 4d7ed82c130a2fe864206e799a2c66e4 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX1: float
theY1: float
theZ1: float
theX2: float
theY2: float
theZ2: float

Description
-----------
Returns the values of the current segment X1, Y1, Z1 , X2, Y2, Z2.
") Segment;
		void Segment(Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** Graphic3d_Texture1Dsegment::SetSegment ******/
		/****** md5 signature: d8b849daac301e4c29c9febe4cb7db22 ******/
		%feature("compactdefaultargs") SetSegment;
		%feature("autodoc", "
Parameters
----------
theX1: float
theY1: float
theZ1: float
theX2: float
theY2: float
theZ2: float

Return
-------
None

Description
-----------
Sets the texture application bounds. Defines the way the texture is stretched across facets. Default values are <0.0, 0.0, 0.0> , <0.0, 0.0, 1.0>.
") SetSegment;
		void SetSegment(const float theX1, const float theY1, const float theZ1, const float theX2, const float theY2, const float theZ2);

};


%make_alias(Graphic3d_Texture1Dsegment)

%extend Graphic3d_Texture1Dsegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Graphic3d_Texture2Dplane *
*********************************/
class Graphic3d_Texture2Dplane : public Graphic3d_Texture2D {
	public:
		/****** Graphic3d_Texture2Dplane::Graphic3d_Texture2Dplane ******/
		/****** md5 signature: a6f25585f63ff0136a842aab922c1b7f ******/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
None

Description
-----------
Creates a texture from a file.
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane(TCollection_AsciiString theFileName);

		/****** Graphic3d_Texture2Dplane::Graphic3d_Texture2Dplane ******/
		/****** md5 signature: aea36b4535b2f3f95d113fe310be496a ******/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "
Parameters
----------
theNOT: Graphic3d_NameOfTexture2D

Return
-------
None

Description
-----------
Creates a texture from a predefined texture name set.
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane(const Graphic3d_NameOfTexture2D theNOT);

		/****** Graphic3d_Texture2Dplane::Graphic3d_Texture2Dplane ******/
		/****** md5 signature: cbf8f493755871b02307b8b4fe0a64b6 ******/
		%feature("compactdefaultargs") Graphic3d_Texture2Dplane;
		%feature("autodoc", "
Parameters
----------
thePixMap: Image_PixMap

Return
-------
None

Description
-----------
Creates a texture from the pixmap.
") Graphic3d_Texture2Dplane;
		 Graphic3d_Texture2Dplane(const opencascade::handle<Image_PixMap> & thePixMap);

		/****** Graphic3d_Texture2Dplane::Plane ******/
		/****** md5 signature: 13e7ba511c49d3739032bf490c857606 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfTexturePlane

Description
-----------
Returns the current texture plane name or NOTP_UNKNOWN when the plane is user defined.
") Plane;
		Graphic3d_NameOfTexturePlane Plane();

		/****** Graphic3d_Texture2Dplane::PlaneS ******/
		/****** md5 signature: 23fa46bb075ecf7e80ee86ecc9dfbef1 ******/
		%feature("compactdefaultargs") PlaneS;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: float
B: float
C: float
D: float

Description
-----------
Returns the current texture plane S equation.
") PlaneS;
		void PlaneS(Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** Graphic3d_Texture2Dplane::PlaneT ******/
		/****** md5 signature: 30b9f797a89c3c33f760d06822a49726 ******/
		%feature("compactdefaultargs") PlaneT;
		%feature("autodoc", "
Parameters
----------

Return
-------
A: float
B: float
C: float
D: float

Description
-----------
Returns the current texture plane T equation.
") PlaneT;
		void PlaneT(Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** Graphic3d_Texture2Dplane::Rotation ******/
		/****** md5 signature: 467ac338d01ed3de1ec1641ba615289b ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
theVal: float

Description
-----------
Returns the current texture rotation angle.
") Rotation;
		void Rotation(Standard_ShortReal &OutValue);

		/****** Graphic3d_Texture2Dplane::ScaleS ******/
		/****** md5 signature: 6f3bbc688ba4cbe2fdcc21dee08ecf4c ******/
		%feature("compactdefaultargs") ScaleS;
		%feature("autodoc", "
Parameters
----------

Return
-------
theVal: float

Description
-----------
Returns the current texture S scale value.
") ScaleS;
		void ScaleS(Standard_ShortReal &OutValue);

		/****** Graphic3d_Texture2Dplane::ScaleT ******/
		/****** md5 signature: c451f23ba05d0cce8b47a603ae6f4f9e ******/
		%feature("compactdefaultargs") ScaleT;
		%feature("autodoc", "
Parameters
----------

Return
-------
theVal: float

Description
-----------
Returns the current texture T scale value.
") ScaleT;
		void ScaleT(Standard_ShortReal &OutValue);

		/****** Graphic3d_Texture2Dplane::SetPlane ******/
		/****** md5 signature: 5813f7058833e3ba0aacb0bc8ba39472 ******/
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: Graphic3d_NameOfTexturePlane

Return
-------
None

Description
-----------
Defines the texture projection plane for both S and T texture coordinate default is NOTP_XY meaning: <1.0, 0.0, 0.0, 0.0> for S and <0.0, 1.0, 0.0, 0.0> for T.
") SetPlane;
		void SetPlane(const Graphic3d_NameOfTexturePlane thePlane);

		/****** Graphic3d_Texture2Dplane::SetPlaneS ******/
		/****** md5 signature: 8657ed0201afe5b475e0b90ce2888fe6 ******/
		%feature("compactdefaultargs") SetPlaneS;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float

Return
-------
None

Description
-----------
Defines the texture projection plane for texture coordinate S default is <1.0, 0.0, 0.0, 0.0>.
") SetPlaneS;
		void SetPlaneS(const float A, const float B, const float C, const float D);

		/****** Graphic3d_Texture2Dplane::SetPlaneT ******/
		/****** md5 signature: 3f2193f1a84d28c60f61348350a17d55 ******/
		%feature("compactdefaultargs") SetPlaneT;
		%feature("autodoc", "
Parameters
----------
A: float
B: float
C: float
D: float

Return
-------
None

Description
-----------
Defines the texture projection plane for texture coordinate T default is <0.0, 1.0, 0.0, 0.0>.
") SetPlaneT;
		void SetPlaneT(const float A, const float B, const float C, const float D);

		/****** Graphic3d_Texture2Dplane::SetRotation ******/
		/****** md5 signature: a7a726a9b84698084ad28292f65ee622 ******/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
None

Description
-----------
Sets the rotation angle of the whole texture. the same result might be achieved by recomputing the S and T plane equation but it's not the easiest way... the angle is expressed in degrees default is 0.0.
") SetRotation;
		void SetRotation(const float theVal);

		/****** Graphic3d_Texture2Dplane::SetScaleS ******/
		/****** md5 signature: bd0904e1c0dd655c3616d54ff9af4ef0 ******/
		%feature("compactdefaultargs") SetScaleS;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
None

Description
-----------
Defines the texture scale for the S texture coordinate much easier than recomputing the S plane equation but the result is the same default to 1.0.
") SetScaleS;
		void SetScaleS(const float theVal);

		/****** Graphic3d_Texture2Dplane::SetScaleT ******/
		/****** md5 signature: a9d0c7c58abe2522ff7c0276b34ed846 ******/
		%feature("compactdefaultargs") SetScaleT;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
None

Description
-----------
Defines the texture scale for the T texture coordinate much easier than recompution the T plane equation but the result is the same default to 1.0.
") SetScaleT;
		void SetScaleT(const float theVal);

		/****** Graphic3d_Texture2Dplane::SetTranslateS ******/
		/****** md5 signature: 8df0601783e2291427ce7cd21b37ebde ******/
		%feature("compactdefaultargs") SetTranslateS;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
None

Description
-----------
Defines the texture translation for the S texture coordinate you can obtain the same effect by modifying the S plane equation but its not easier. default to 0.0.
") SetTranslateS;
		void SetTranslateS(const float theVal);

		/****** Graphic3d_Texture2Dplane::SetTranslateT ******/
		/****** md5 signature: 36206eaaa1c5898970d523dd21c864ef ******/
		%feature("compactdefaultargs") SetTranslateT;
		%feature("autodoc", "
Parameters
----------
theVal: float

Return
-------
None

Description
-----------
Defines the texture translation for the T texture coordinate you can obtain the same effect by modifying the T plane equation but its not easier. default to 0.0.
") SetTranslateT;
		void SetTranslateT(const float theVal);

		/****** Graphic3d_Texture2Dplane::TranslateS ******/
		/****** md5 signature: 6f4e6dd8ecca0b27723500b524512f68 ******/
		%feature("compactdefaultargs") TranslateS;
		%feature("autodoc", "
Parameters
----------

Return
-------
theVal: float

Description
-----------
Returns the current texture S translation value.
") TranslateS;
		void TranslateS(Standard_ShortReal &OutValue);

		/****** Graphic3d_Texture2Dplane::TranslateT ******/
		/****** md5 signature: b4a1f6bdda4a63ed87967f2beee10d9a ******/
		%feature("compactdefaultargs") TranslateT;
		%feature("autodoc", "
Parameters
----------

Return
-------
theVal: float

Description
-----------
Returns the current texture T translation value.
") TranslateT;
		void TranslateT(Standard_ShortReal &OutValue);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Graphic3d_ArrayOfPrimitives_CreateArray(*args):
	return Graphic3d_ArrayOfPrimitives.CreateArray(*args)

@deprecated
def Graphic3d_ArrayOfPrimitives_CreateArray(*args):
	return Graphic3d_ArrayOfPrimitives.CreateArray(*args)

@deprecated
def Graphic3d_Aspects_DefaultLinePatternForType(*args):
	return Graphic3d_Aspects.DefaultLinePatternForType(*args)

@deprecated
def Graphic3d_Aspects_DefaultLineTypeForPattern(*args):
	return Graphic3d_Aspects.DefaultLineTypeForPattern(*args)

@deprecated
def Graphic3d_Attribute_Stride(*args):
	return Graphic3d_Attribute.Stride(*args)

@deprecated
def Graphic3d_BSDF_CreateDiffuse(*args):
	return Graphic3d_BSDF.CreateDiffuse(*args)

@deprecated
def Graphic3d_BSDF_CreateGlass(*args):
	return Graphic3d_BSDF.CreateGlass(*args)

@deprecated
def Graphic3d_BSDF_CreateMetallic(*args):
	return Graphic3d_BSDF.CreateMetallic(*args)

@deprecated
def Graphic3d_BSDF_CreateMetallicRoughness(*args):
	return Graphic3d_BSDF.CreateMetallicRoughness(*args)

@deprecated
def Graphic3d_BSDF_CreateTransparent(*args):
	return Graphic3d_BSDF.CreateTransparent(*args)

@deprecated
def Graphic3d_Camera_Interpolate(*args):
	return Graphic3d_Camera.Interpolate(*args)

@deprecated
def Graphic3d_Fresnel_CreateConductor(*args):
	return Graphic3d_Fresnel.CreateConductor(*args)

@deprecated
def Graphic3d_Fresnel_CreateConductor(*args):
	return Graphic3d_Fresnel.CreateConductor(*args)

@deprecated
def Graphic3d_Fresnel_CreateConstant(*args):
	return Graphic3d_Fresnel.CreateConstant(*args)

@deprecated
def Graphic3d_Fresnel_CreateDielectric(*args):
	return Graphic3d_Fresnel.CreateDielectric(*args)

@deprecated
def Graphic3d_Fresnel_CreateSchlick(*args):
	return Graphic3d_Fresnel.CreateSchlick(*args)

@deprecated
def Graphic3d_GraphicDriverFactory_DefaultDriverFactory(*args):
	return Graphic3d_GraphicDriverFactory.DefaultDriverFactory(*args)

@deprecated
def Graphic3d_GraphicDriverFactory_DriverFactories(*args):
	return Graphic3d_GraphicDriverFactory.DriverFactories(*args)

@deprecated
def Graphic3d_GraphicDriverFactory_RegisterFactory(*args):
	return Graphic3d_GraphicDriverFactory.RegisterFactory(*args)

@deprecated
def Graphic3d_GraphicDriverFactory_UnregisterFactory(*args):
	return Graphic3d_GraphicDriverFactory.UnregisterFactory(*args)

@deprecated
def Graphic3d_MarkerImage_StandardMarker(*args):
	return Graphic3d_MarkerImage.StandardMarker(*args)

@deprecated
def Graphic3d_MaterialAspect_MaterialFromName(*args):
	return Graphic3d_MaterialAspect.MaterialFromName(*args)

@deprecated
def Graphic3d_MaterialAspect_MaterialFromName(*args):
	return Graphic3d_MaterialAspect.MaterialFromName(*args)

@deprecated
def Graphic3d_MaterialAspect_MaterialName(*args):
	return Graphic3d_MaterialAspect.MaterialName(*args)

@deprecated
def Graphic3d_MaterialAspect_MaterialType(*args):
	return Graphic3d_MaterialAspect.MaterialType(*args)

@deprecated
def Graphic3d_MaterialAspect_NumberOfMaterials(*args):
	return Graphic3d_MaterialAspect.NumberOfMaterials(*args)

@deprecated
def Graphic3d_PBRMaterial_GenerateEnvLUT(*args):
	return Graphic3d_PBRMaterial.GenerateEnvLUT(*args)

@deprecated
def Graphic3d_PBRMaterial_MetallicFromSpecular(*args):
	return Graphic3d_PBRMaterial.MetallicFromSpecular(*args)

@deprecated
def Graphic3d_PBRMaterial_MinRoughness(*args):
	return Graphic3d_PBRMaterial.MinRoughness(*args)

@deprecated
def Graphic3d_PBRMaterial_Roughness(*args):
	return Graphic3d_PBRMaterial.Roughness(*args)

@deprecated
def Graphic3d_PBRMaterial_RoughnessFromSpecular(*args):
	return Graphic3d_PBRMaterial.RoughnessFromSpecular(*args)

@deprecated
def Graphic3d_PBRMaterial_SpecIBLMapSamplesFactor(*args):
	return Graphic3d_PBRMaterial.SpecIBLMapSamplesFactor(*args)

@deprecated
def Graphic3d_ShaderObject_CreateFromFile(*args):
	return Graphic3d_ShaderObject.CreateFromFile(*args)

@deprecated
def Graphic3d_ShaderObject_CreateFromSource(*args):
	return Graphic3d_ShaderObject.CreateFromSource(*args)

@deprecated
def Graphic3d_ShaderProgram_ShadersFolder(*args):
	return Graphic3d_ShaderProgram.ShadersFolder(*args)

@deprecated
def Graphic3d_Structure_AcceptConnection(*args):
	return Graphic3d_Structure.AcceptConnection(*args)

@deprecated
def Graphic3d_Structure_Network(*args):
	return Graphic3d_Structure.Network(*args)

@deprecated
def Graphic3d_Structure_PrintNetwork(*args):
	return Graphic3d_Structure.PrintNetwork(*args)

@deprecated
def Graphic3d_TextureRoot_TexturesFolder(*args):
	return Graphic3d_TextureRoot.TexturesFolder(*args)

@deprecated
def Graphic3d_TransformPers_IsAxial(*args):
	return Graphic3d_TransformPers.IsAxial(*args)

@deprecated
def Graphic3d_TransformPers_IsOrthoPers(*args):
	return Graphic3d_TransformPers.IsOrthoPers(*args)

@deprecated
def Graphic3d_TransformPers_IsTrihedronOr2d(*args):
	return Graphic3d_TransformPers.IsTrihedronOr2d(*args)

@deprecated
def Graphic3d_TransformPers_IsZoomOrRotate(*args):
	return Graphic3d_TransformPers.IsZoomOrRotate(*args)

@deprecated
def Graphic3d_TextureEnv_NumberOfTextures(*args):
	return Graphic3d_TextureEnv.NumberOfTextures(*args)

@deprecated
def Graphic3d_TextureEnv_TextureName(*args):
	return Graphic3d_TextureEnv.TextureName(*args)

@deprecated
def Graphic3d_Texture1D_NumberOfTextures(*args):
	return Graphic3d_Texture1D.NumberOfTextures(*args)

@deprecated
def Graphic3d_Texture1D_TextureName(*args):
	return Graphic3d_Texture1D.TextureName(*args)

@deprecated
def Graphic3d_Texture2D_NumberOfTextures(*args):
	return Graphic3d_Texture2D.NumberOfTextures(*args)

@deprecated
def Graphic3d_Texture2D_TextureName(*args):
	return Graphic3d_Texture2D.TextureName(*args)

}
