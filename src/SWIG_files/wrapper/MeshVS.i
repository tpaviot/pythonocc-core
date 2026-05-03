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
%define MESHVSDOCSTRING
"MeshVS module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_meshvs.html"
%enddef
%module (package="OCC.Core", docstring=MESHVSDOCSTRING) MeshVS


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
#include<MeshVS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<SelectMgr_module.hxx>
#include<Select3D_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
#include<Quantity_module.hxx>
#include<Graphic3d_module.hxx>
#include<SelectBasics_module.hxx>
#include<AIS_module.hxx>
#include<PrsMgr_module.hxx>
#include<Prs3d_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<Geom_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
#include<TColQuantity_module.hxx>
#include<TopoDS_module.hxx>
#include<V3d_module.hxx>
#include<TopLoc_module.hxx>
#include<Prs3d_module.hxx>
#include<StdSelect_module.hxx>
#include<Media_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Aspect_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import SelectMgr.i
%import Select3D.i
%import gp.i
%import TColStd.i
%import Bnd.i
%import TCollection.i
%import Quantity.i
%import Graphic3d.i
%import SelectBasics.i
%import AIS.i
%import PrsMgr.i
%import Prs3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum  {
	MeshVS_BP_Mesh = 5,
	MeshVS_BP_NodalColor = 10,
	MeshVS_BP_ElemColor = 15,
	MeshVS_BP_Text = 20,
	MeshVS_BP_Vector = 25,
	MeshVS_BP_User = 30,
	MeshVS_BP_Default = MeshVS_BP_User,
};

enum  {
	MeshVS_DMF_WireFrame = 1,
	MeshVS_DMF_Shading = 2,
	MeshVS_DMF_Shrink = 3,
	MeshVS_DMF_OCCMask = ( MeshVS_DMF_WireFrame | MeshVS_DMF_Shading | MeshVS_DMF_Shrink ),
	MeshVS_DMF_VectorDataPrs = 4,
	MeshVS_DMF_NodalColorDataPrs = 8,
	MeshVS_DMF_ElementalColorDataPrs = 16,
	MeshVS_DMF_TextDataPrs = 32,
	MeshVS_DMF_EntitiesWithData = 64,
	MeshVS_DMF_DeformedPrsWireFrame = 128,
	MeshVS_DMF_DeformedPrsShading = 256,
	MeshVS_DMF_DeformedPrsShrink = 384,
	MeshVS_DMF_DeformedMask = ( MeshVS_DMF_DeformedPrsWireFrame | MeshVS_DMF_DeformedPrsShading | MeshVS_DMF_DeformedPrsShrink ),
	MeshVS_DMF_SelectionPrs = 512,
	MeshVS_DMF_HilightPrs = 1024,
	MeshVS_DMF_User = 2048,
};

enum MeshVS_DrawerAttribute {
	MeshVS_DA_InteriorStyle = 0,
	MeshVS_DA_InteriorColor = 1,
	MeshVS_DA_BackInteriorColor = 2,
	MeshVS_DA_EdgeColor = 3,
	MeshVS_DA_EdgeType = 4,
	MeshVS_DA_EdgeWidth = 5,
	MeshVS_DA_HatchStyle = 6,
	MeshVS_DA_FrontMaterial = 7,
	MeshVS_DA_BackMaterial = 8,
	MeshVS_DA_BeamType = 9,
	MeshVS_DA_BeamWidth = 10,
	MeshVS_DA_BeamColor = 11,
	MeshVS_DA_MarkerType = 12,
	MeshVS_DA_MarkerColor = 13,
	MeshVS_DA_MarkerScale = 14,
	MeshVS_DA_TextColor = 15,
	MeshVS_DA_TextHeight = 16,
	MeshVS_DA_TextFont = 17,
	MeshVS_DA_TextExpansionFactor = 18,
	MeshVS_DA_TextSpace = 19,
	MeshVS_DA_TextStyle = 20,
	MeshVS_DA_TextDisplayType = 21,
	MeshVS_DA_TextTexFont = 22,
	MeshVS_DA_TextFontAspect = 23,
	MeshVS_DA_VectorColor = 24,
	MeshVS_DA_VectorMaxLength = 25,
	MeshVS_DA_VectorArrowPart = 26,
	MeshVS_DA_IsAllowOverlapped = 27,
	MeshVS_DA_Reflection = 28,
	MeshVS_DA_ColorReflection = 29,
	MeshVS_DA_ShrinkCoeff = 30,
	MeshVS_DA_MaxFaceNodes = 31,
	MeshVS_DA_ComputeTime = 32,
	MeshVS_DA_ComputeSelectionTime = 33,
	MeshVS_DA_DisplayNodes = 34,
	MeshVS_DA_SelectableAuto = 35,
	MeshVS_DA_ShowEdges = 36,
	MeshVS_DA_SmoothShading = 37,
	MeshVS_DA_SupressBackFaces = 38,
	MeshVS_DA_User = 39,
};

enum MeshVS_EntityType {
	MeshVS_ET_NONE = 0,
	MeshVS_ET_Node = 1,
	MeshVS_ET_0D = 2,
	MeshVS_ET_Link = 4,
	MeshVS_ET_Face = 8,
	MeshVS_ET_Volume = 16,
	MeshVS_ET_Element = MeshVS_ET_0D | MeshVS_ET_Link | MeshVS_ET_Face | MeshVS_ET_Volume,
	MeshVS_ET_All = MeshVS_ET_Element | MeshVS_ET_Node,
};

enum MeshVS_MeshSelectionMethod {
	MeshVS_MSM_PRECISE = 0,
	MeshVS_MSM_NODES = 1,
	MeshVS_MSM_BOX = 2,
};

enum MeshVS_SelectionModeFlags {
	MeshVS_SMF_Mesh = 0,
	MeshVS_SMF_Node = 1,
	MeshVS_SMF_0D = 2,
	MeshVS_SMF_Link = 4,
	MeshVS_SMF_Face = 8,
	MeshVS_SMF_Volume = 16,
	MeshVS_SMF_Element = MeshVS_SMF_0D | MeshVS_SMF_Link | MeshVS_SMF_Face | MeshVS_SMF_Volume,
	MeshVS_SMF_All = MeshVS_SMF_Element | MeshVS_SMF_Node,
	MeshVS_SMF_Group = 256,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class MeshVS_DrawerAttribute(IntEnum):
	MeshVS_DA_InteriorStyle = 0
	MeshVS_DA_InteriorColor = 1
	MeshVS_DA_BackInteriorColor = 2
	MeshVS_DA_EdgeColor = 3
	MeshVS_DA_EdgeType = 4
	MeshVS_DA_EdgeWidth = 5
	MeshVS_DA_HatchStyle = 6
	MeshVS_DA_FrontMaterial = 7
	MeshVS_DA_BackMaterial = 8
	MeshVS_DA_BeamType = 9
	MeshVS_DA_BeamWidth = 10
	MeshVS_DA_BeamColor = 11
	MeshVS_DA_MarkerType = 12
	MeshVS_DA_MarkerColor = 13
	MeshVS_DA_MarkerScale = 14
	MeshVS_DA_TextColor = 15
	MeshVS_DA_TextHeight = 16
	MeshVS_DA_TextFont = 17
	MeshVS_DA_TextExpansionFactor = 18
	MeshVS_DA_TextSpace = 19
	MeshVS_DA_TextStyle = 20
	MeshVS_DA_TextDisplayType = 21
	MeshVS_DA_TextTexFont = 22
	MeshVS_DA_TextFontAspect = 23
	MeshVS_DA_VectorColor = 24
	MeshVS_DA_VectorMaxLength = 25
	MeshVS_DA_VectorArrowPart = 26
	MeshVS_DA_IsAllowOverlapped = 27
	MeshVS_DA_Reflection = 28
	MeshVS_DA_ColorReflection = 29
	MeshVS_DA_ShrinkCoeff = 30
	MeshVS_DA_MaxFaceNodes = 31
	MeshVS_DA_ComputeTime = 32
	MeshVS_DA_ComputeSelectionTime = 33
	MeshVS_DA_DisplayNodes = 34
	MeshVS_DA_SelectableAuto = 35
	MeshVS_DA_ShowEdges = 36
	MeshVS_DA_SmoothShading = 37
	MeshVS_DA_SupressBackFaces = 38
	MeshVS_DA_User = 39
MeshVS_DA_InteriorStyle = MeshVS_DrawerAttribute.MeshVS_DA_InteriorStyle
MeshVS_DA_InteriorColor = MeshVS_DrawerAttribute.MeshVS_DA_InteriorColor
MeshVS_DA_BackInteriorColor = MeshVS_DrawerAttribute.MeshVS_DA_BackInteriorColor
MeshVS_DA_EdgeColor = MeshVS_DrawerAttribute.MeshVS_DA_EdgeColor
MeshVS_DA_EdgeType = MeshVS_DrawerAttribute.MeshVS_DA_EdgeType
MeshVS_DA_EdgeWidth = MeshVS_DrawerAttribute.MeshVS_DA_EdgeWidth
MeshVS_DA_HatchStyle = MeshVS_DrawerAttribute.MeshVS_DA_HatchStyle
MeshVS_DA_FrontMaterial = MeshVS_DrawerAttribute.MeshVS_DA_FrontMaterial
MeshVS_DA_BackMaterial = MeshVS_DrawerAttribute.MeshVS_DA_BackMaterial
MeshVS_DA_BeamType = MeshVS_DrawerAttribute.MeshVS_DA_BeamType
MeshVS_DA_BeamWidth = MeshVS_DrawerAttribute.MeshVS_DA_BeamWidth
MeshVS_DA_BeamColor = MeshVS_DrawerAttribute.MeshVS_DA_BeamColor
MeshVS_DA_MarkerType = MeshVS_DrawerAttribute.MeshVS_DA_MarkerType
MeshVS_DA_MarkerColor = MeshVS_DrawerAttribute.MeshVS_DA_MarkerColor
MeshVS_DA_MarkerScale = MeshVS_DrawerAttribute.MeshVS_DA_MarkerScale
MeshVS_DA_TextColor = MeshVS_DrawerAttribute.MeshVS_DA_TextColor
MeshVS_DA_TextHeight = MeshVS_DrawerAttribute.MeshVS_DA_TextHeight
MeshVS_DA_TextFont = MeshVS_DrawerAttribute.MeshVS_DA_TextFont
MeshVS_DA_TextExpansionFactor = MeshVS_DrawerAttribute.MeshVS_DA_TextExpansionFactor
MeshVS_DA_TextSpace = MeshVS_DrawerAttribute.MeshVS_DA_TextSpace
MeshVS_DA_TextStyle = MeshVS_DrawerAttribute.MeshVS_DA_TextStyle
MeshVS_DA_TextDisplayType = MeshVS_DrawerAttribute.MeshVS_DA_TextDisplayType
MeshVS_DA_TextTexFont = MeshVS_DrawerAttribute.MeshVS_DA_TextTexFont
MeshVS_DA_TextFontAspect = MeshVS_DrawerAttribute.MeshVS_DA_TextFontAspect
MeshVS_DA_VectorColor = MeshVS_DrawerAttribute.MeshVS_DA_VectorColor
MeshVS_DA_VectorMaxLength = MeshVS_DrawerAttribute.MeshVS_DA_VectorMaxLength
MeshVS_DA_VectorArrowPart = MeshVS_DrawerAttribute.MeshVS_DA_VectorArrowPart
MeshVS_DA_IsAllowOverlapped = MeshVS_DrawerAttribute.MeshVS_DA_IsAllowOverlapped
MeshVS_DA_Reflection = MeshVS_DrawerAttribute.MeshVS_DA_Reflection
MeshVS_DA_ColorReflection = MeshVS_DrawerAttribute.MeshVS_DA_ColorReflection
MeshVS_DA_ShrinkCoeff = MeshVS_DrawerAttribute.MeshVS_DA_ShrinkCoeff
MeshVS_DA_MaxFaceNodes = MeshVS_DrawerAttribute.MeshVS_DA_MaxFaceNodes
MeshVS_DA_ComputeTime = MeshVS_DrawerAttribute.MeshVS_DA_ComputeTime
MeshVS_DA_ComputeSelectionTime = MeshVS_DrawerAttribute.MeshVS_DA_ComputeSelectionTime
MeshVS_DA_DisplayNodes = MeshVS_DrawerAttribute.MeshVS_DA_DisplayNodes
MeshVS_DA_SelectableAuto = MeshVS_DrawerAttribute.MeshVS_DA_SelectableAuto
MeshVS_DA_ShowEdges = MeshVS_DrawerAttribute.MeshVS_DA_ShowEdges
MeshVS_DA_SmoothShading = MeshVS_DrawerAttribute.MeshVS_DA_SmoothShading
MeshVS_DA_SupressBackFaces = MeshVS_DrawerAttribute.MeshVS_DA_SupressBackFaces
MeshVS_DA_User = MeshVS_DrawerAttribute.MeshVS_DA_User

class MeshVS_EntityType(IntEnum):
	MeshVS_ET_NONE = 0
	MeshVS_ET_Node = 1
	MeshVS_ET_0D = 2
	MeshVS_ET_Link = 4
	MeshVS_ET_Face = 8
	MeshVS_ET_Volume = 16
	MeshVS_ET_Element = MeshVS_ET_0D | MeshVS_ET_Link | MeshVS_ET_Face | MeshVS_ET_Volume
	MeshVS_ET_All = MeshVS_ET_Element | MeshVS_ET_Node
MeshVS_ET_NONE = MeshVS_EntityType.MeshVS_ET_NONE
MeshVS_ET_Node = MeshVS_EntityType.MeshVS_ET_Node
MeshVS_ET_0D = MeshVS_EntityType.MeshVS_ET_0D
MeshVS_ET_Link = MeshVS_EntityType.MeshVS_ET_Link
MeshVS_ET_Face = MeshVS_EntityType.MeshVS_ET_Face
MeshVS_ET_Volume = MeshVS_EntityType.MeshVS_ET_Volume
MeshVS_ET_Element = MeshVS_EntityType.MeshVS_ET_Element
MeshVS_ET_All = MeshVS_EntityType.MeshVS_ET_All

class MeshVS_MeshSelectionMethod(IntEnum):
	MeshVS_MSM_PRECISE = 0
	MeshVS_MSM_NODES = 1
	MeshVS_MSM_BOX = 2
MeshVS_MSM_PRECISE = MeshVS_MeshSelectionMethod.MeshVS_MSM_PRECISE
MeshVS_MSM_NODES = MeshVS_MeshSelectionMethod.MeshVS_MSM_NODES
MeshVS_MSM_BOX = MeshVS_MeshSelectionMethod.MeshVS_MSM_BOX

class MeshVS_SelectionModeFlags(IntEnum):
	MeshVS_SMF_Mesh = 0
	MeshVS_SMF_Node = 1
	MeshVS_SMF_0D = 2
	MeshVS_SMF_Link = 4
	MeshVS_SMF_Face = 8
	MeshVS_SMF_Volume = 16
	MeshVS_SMF_Element = MeshVS_SMF_0D | MeshVS_SMF_Link | MeshVS_SMF_Face | MeshVS_SMF_Volume
	MeshVS_SMF_All = MeshVS_SMF_Element | MeshVS_SMF_Node
	MeshVS_SMF_Group = 256
MeshVS_SMF_Mesh = MeshVS_SelectionModeFlags.MeshVS_SMF_Mesh
MeshVS_SMF_Node = MeshVS_SelectionModeFlags.MeshVS_SMF_Node
MeshVS_SMF_0D = MeshVS_SelectionModeFlags.MeshVS_SMF_0D
MeshVS_SMF_Link = MeshVS_SelectionModeFlags.MeshVS_SMF_Link
MeshVS_SMF_Face = MeshVS_SelectionModeFlags.MeshVS_SMF_Face
MeshVS_SMF_Volume = MeshVS_SelectionModeFlags.MeshVS_SMF_Volume
MeshVS_SMF_Element = MeshVS_SelectionModeFlags.MeshVS_SMF_Element
MeshVS_SMF_All = MeshVS_SelectionModeFlags.MeshVS_SMF_All
MeshVS_SMF_Group = MeshVS_SelectionModeFlags.MeshVS_SMF_Group
};
/* end python proxy for enums */

/* handles */
%wrap_handle(MeshVS_CommonSensitiveEntity)
%wrap_handle(MeshVS_DataSource)
%wrap_handle(MeshVS_Drawer)
%wrap_handle(MeshVS_DummySensitiveEntity)
%wrap_handle(MeshVS_MeshEntityOwner)
%wrap_handle(MeshVS_MeshOwner)
%wrap_handle(MeshVS_PrsBuilder)
%wrap_handle(MeshVS_SensitiveFace)
%wrap_handle(MeshVS_SensitiveMesh)
%wrap_handle(MeshVS_SensitivePolyhedron)
%wrap_handle(MeshVS_SensitiveQuad)
%wrap_handle(MeshVS_SensitiveSegment)
%wrap_handle(MeshVS_DataSource3D)
%wrap_handle(MeshVS_DeformedDataSource)
%wrap_handle(MeshVS_ElementalColorPrsBuilder)
%wrap_handle(MeshVS_MeshPrsBuilder)
%wrap_handle(MeshVS_NodalColorPrsBuilder)
%wrap_handle(MeshVS_TextPrsBuilder)
%wrap_handle(MeshVS_VectorPrsBuilder)
/* end handles declaration */

/* templates */
%template(MeshVS_Array1OfSequenceOfInteger) NCollection_Array1<TColStd_SequenceOfInteger>;
Array1ExtendIter(TColStd_SequenceOfInteger)

%ignore NCollection_DataMap<Quantity_Color,TColStd_MapOfInteger>::Items;
%ignore NCollection_DataMap<Quantity_Color,TColStd_MapOfInteger>::KeyValues;
%template(MeshVS_DataMapOfColorMapOfInteger) NCollection_DataMap<Quantity_Color,TColStd_MapOfInteger>;
%ignore NCollection_DataMap<int,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>>::Items;
%ignore NCollection_DataMap<int,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>>::KeyValues;
%template(MeshVS_DataMapOfHArray1OfSequenceOfInteger) NCollection_DataMap<int,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>>;
%ignore NCollection_DataMap<int,TCollection_AsciiString>::Items;
%ignore NCollection_DataMap<int,TCollection_AsciiString>::KeyValues;
%template(MeshVS_DataMapOfIntegerAsciiString) NCollection_DataMap<int,TCollection_AsciiString>;
%ignore NCollection_DataMap<int,bool>::Items;
%ignore NCollection_DataMap<int,bool>::KeyValues;
%template(MeshVS_DataMapOfIntegerBoolean) NCollection_DataMap<int,bool>;
%ignore NCollection_DataMap<int,Quantity_Color>::Items;
%ignore NCollection_DataMap<int,Quantity_Color>::KeyValues;
%template(MeshVS_DataMapOfIntegerColor) NCollection_DataMap<int,Quantity_Color>;
%ignore NCollection_DataMap<int,Graphic3d_MaterialAspect>::Items;
%ignore NCollection_DataMap<int,Graphic3d_MaterialAspect>::KeyValues;
%template(MeshVS_DataMapOfIntegerMaterial) NCollection_DataMap<int,Graphic3d_MaterialAspect>;
%ignore NCollection_DataMap<int,opencascade::handle<MeshVS_MeshEntityOwner>>::Items;
%ignore NCollection_DataMap<int,opencascade::handle<MeshVS_MeshEntityOwner>>::KeyValues;
%template(MeshVS_DataMapOfIntegerMeshEntityOwner) NCollection_DataMap<int,opencascade::handle<MeshVS_MeshEntityOwner>>;
%ignore NCollection_DataMap<int,opencascade::handle<SelectMgr_EntityOwner>>::Items;
%ignore NCollection_DataMap<int,opencascade::handle<SelectMgr_EntityOwner>>::KeyValues;
%template(MeshVS_DataMapOfIntegerOwner) NCollection_DataMap<int,opencascade::handle<SelectMgr_EntityOwner>>;
%ignore NCollection_DataMap<int,MeshVS_TwoColors>::Items;
%ignore NCollection_DataMap<int,MeshVS_TwoColors>::KeyValues;
%template(MeshVS_DataMapOfIntegerTwoColors) NCollection_DataMap<int,MeshVS_TwoColors>;
%ignore NCollection_DataMap<int,gp_Vec>::Items;
%ignore NCollection_DataMap<int,gp_Vec>::KeyValues;
%template(MeshVS_DataMapOfIntegerVector) NCollection_DataMap<int,gp_Vec>;
%ignore NCollection_DataMap<MeshVS_TwoColors,TColStd_MapOfInteger>::Items;
%ignore NCollection_DataMap<MeshVS_TwoColors,TColStd_MapOfInteger>::KeyValues;
%template(MeshVS_DataMapOfTwoColorsMapOfInteger) NCollection_DataMap<MeshVS_TwoColors,TColStd_MapOfInteger>;
%template(MeshVS_MapOfTwoNodes) NCollection_Map<MeshVS_TwoNodes>;
%template(MeshVS_SequenceOfPrsBuilder) NCollection_Sequence<opencascade::handle<MeshVS_PrsBuilder>>;

%extend NCollection_Sequence<opencascade::handle<MeshVS_PrsBuilder>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TColStd_SequenceOfInteger> MeshVS_Array1OfSequenceOfInteger;
typedef int MeshVS_BuilderPriority;
typedef NCollection_DataMap<Quantity_Color, TColStd_MapOfInteger>::Iterator MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
typedef NCollection_DataMap<int, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>>::Iterator MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DataMap<int, TCollection_AsciiString>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
typedef NCollection_DataMap<int, bool>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
typedef NCollection_DataMap<int, Quantity_Color>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
typedef NCollection_DataMap<int, Graphic3d_MaterialAspect>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
typedef NCollection_DataMap<int, opencascade::handle<MeshVS_MeshEntityOwner>>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap<int, opencascade::handle<SelectMgr_EntityOwner>>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
typedef NCollection_DataMap<int, MeshVS_TwoColors>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
typedef NCollection_DataMap<int, gp_Vec>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
typedef NCollection_DataMap<MeshVS_TwoColors, TColStd_MapOfInteger>::Iterator MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
typedef NCollection_DataMap<Quantity_Color, TColStd_MapOfInteger> MeshVS_DataMapOfColorMapOfInteger;
typedef NCollection_DataMap<int, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>> MeshVS_DataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DataMap<int, TCollection_AsciiString> MeshVS_DataMapOfIntegerAsciiString;
typedef NCollection_DataMap<int, bool> MeshVS_DataMapOfIntegerBoolean;
typedef NCollection_DataMap<int, Quantity_Color> MeshVS_DataMapOfIntegerColor;
typedef NCollection_DataMap<int, Graphic3d_MaterialAspect> MeshVS_DataMapOfIntegerMaterial;
typedef NCollection_DataMap<int, opencascade::handle<MeshVS_MeshEntityOwner>> MeshVS_DataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap<int, opencascade::handle<SelectMgr_EntityOwner>> MeshVS_DataMapOfIntegerOwner;
typedef NCollection_DataMap<int, MeshVS_TwoColors> MeshVS_DataMapOfIntegerTwoColors;
typedef NCollection_DataMap<int, gp_Vec> MeshVS_DataMapOfIntegerVector;
typedef NCollection_DataMap<MeshVS_TwoColors, TColStd_MapOfInteger> MeshVS_DataMapOfTwoColorsMapOfInteger;
typedef int MeshVS_DisplayModeFlags;
typedef NCollection_HArray1<TColStd_SequenceOfInteger> MeshVS_HArray1OfSequenceOfInteger;
typedef NCollection_Map<MeshVS_TwoNodes>::Iterator MeshVS_MapIteratorOfMapOfTwoNodes;
typedef NCollection_Map<MeshVS_TwoNodes> MeshVS_MapOfTwoNodes;
typedef std::pair<int, int> MeshVS_NodePair;
typedef NCollection_Sequence<opencascade::handle<MeshVS_PrsBuilder>> MeshVS_SequenceOfPrsBuilder;
/* end typedefs declaration */

/**********************
* class MeshVS_Buffer *
**********************/
class MeshVS_Buffer {
	public:
		/****** MeshVS_Buffer::MeshVS_Buffer ******/
		/****** md5 signature: 20da61e934219ac5790c9ebdde1c6c09 ******/
		%feature("compactdefaultargs") MeshVS_Buffer;
		%feature("autodoc", "
Parameters
----------
theSize: size_t

Return
-------
None

Description
-----------
Constructor of the buffer of the requested size.
") MeshVS_Buffer;
		 MeshVS_Buffer(const size_t theSize);

};


%extend MeshVS_Buffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class MeshVS_CommonSensitiveEntity *
*************************************/
class MeshVS_CommonSensitiveEntity : public Select3D_SensitiveSet {
	public:
		/****** MeshVS_CommonSensitiveEntity::MeshVS_CommonSensitiveEntity ******/
		/****** md5 signature: 88c055c73321e66b439e5e4e9ef7a9f3 ******/
		%feature("compactdefaultargs") MeshVS_CommonSensitiveEntity;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theParentMesh: MeshVS_Mesh
theSelMethod: MeshVS_MeshSelectionMethod

Return
-------
None

Description
-----------
Default constructor.
") MeshVS_CommonSensitiveEntity;
		 MeshVS_CommonSensitiveEntity(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<MeshVS_Mesh> & theParentMesh, const MeshVS_MeshSelectionMethod theSelMethod);

		/****** MeshVS_CommonSensitiveEntity::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the triangulation. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** MeshVS_CommonSensitiveEntity::Box ******/
		/****** md5 signature: a2ce38217e8c3c3e41f58a85973ff262 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of sub-entity with index theIdx in sub-entity list.
") Box;
		Select3D_BndBox3d Box(const int theIdx);

		/****** MeshVS_CommonSensitiveEntity::Center ******/
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
Returns geometry center of sensitive entity index theIdx along the given axis theAxis.
") Center;
		double Center(const int theIdx, const int theAxis);

		/****** MeshVS_CommonSensitiveEntity::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of a mesh.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** MeshVS_CommonSensitiveEntity::GetConnected ******/
		/****** md5 signature: 8efcdba90c36173ecab8a94e81601163 ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Create a copy.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** MeshVS_CommonSensitiveEntity::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of elements.
") NbSubElements;
		int NbSubElements();

		/****** MeshVS_CommonSensitiveEntity::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities of the complex entity.
") Size;
		int Size();

		/****** MeshVS_CommonSensitiveEntity::Swap ******/
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
Swaps items with indexes theIdx1 and theIdx2.
") Swap;
		void Swap(const int theIdx1, const int theIdx2);

};


%make_alias(MeshVS_CommonSensitiveEntity)

%extend MeshVS_CommonSensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MeshVS_DataSource *
**************************/
%nodefaultctor MeshVS_DataSource;
class MeshVS_DataSource : public Standard_Transient {
	public:
		/****** MeshVS_DataSource::Get3DGeom ******/
		/****** md5 signature: 82c9c15245a9692bbe9099fe5c77db6a ******/
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
Data: NCollection_HArray1<NCollection_Sequence<int

Return
-------
NbNodes: int

Description
-----------
This method returns topology information about 3D-element Returns false if element with ID isn't 3D or because other troubles.
") Get3DGeom;
		virtual bool Get3DGeom(const int ID, Standard_Integer &OutValue, opencascade::handle<NCollection_HArray1<NCollection_Sequence<int> > > & Data);

		/****** MeshVS_DataSource::GetAddr ******/
		/****** md5 signature: 770e620ce42eccde108d24e72fa5ee7e ******/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool

Return
-------
void *

Description
-----------
This method returns pointer which represents element or node data structure. This address will be saved in MeshVS_MeshEntityOwner, so that you can access to data structure fast by the method Owner(). In the redefined method you can return NULL. ID is the numerical identificator of node or element IsElement indicates this ID describe node ( if false ) or element ( if true ).
") GetAddr;
		virtual void * GetAddr(const int ID, const bool IsElement);

		/****** MeshVS_DataSource::GetAllElements ******/
		/****** md5 signature: f85e71abd796a5398a1de8f5fade7da2 ******/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
This method returns map of all elements the object consist of.
") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements();

		/****** MeshVS_DataSource::GetAllGroups ******/
		/****** md5 signature: 3b325eb8b0334ce7f7b23771f6ea3b64 ******/
		%feature("compactdefaultargs") GetAllGroups;
		%feature("autodoc", "
Parameters
----------
Ids: TColStd_PackedMapOfInteger

Return
-------
None

Description
-----------
This method returns map of all groups the object contains.
") GetAllGroups;
		virtual void GetAllGroups(TColStd_PackedMapOfInteger & Ids);

		/****** MeshVS_DataSource::GetAllNodes ******/
		/****** md5 signature: d9ec1f37bed757ebe7b546ba878e8230 ******/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
This method returns map of all nodes the object consist of.
") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes();

		/****** MeshVS_DataSource::GetBoundingBox ******/
		/****** md5 signature: c776ca3f9f7d80c6934fc1b6003552bc ******/
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Returns the bounding box of the whole mesh. It is used in advanced selection mode to define roughly the sensitive area of the mesh. It can be redefined to get access to a box computed in advance.
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox();

		/****** MeshVS_DataSource::GetDetectedEntities ******/
		/****** md5 signature: 3114c568ffbcf74714fa3dbd7d4fb3db ******/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "
Parameters
----------
Prs: MeshVS_Mesh
X: double
Y: double
aTol: double
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Return
-------
DMin: double

Description
-----------
Returns maps of entities (nodes and elements) detected by mouse click at the point (X,Y) on the current view plane, with the tolerance aTol. DMin - is out argument should return actual detection tolerance. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
") GetDetectedEntities;
		virtual bool GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const double X, const double Y, const double aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements, Standard_Real &OutValue);

		/****** MeshVS_DataSource::GetDetectedEntities ******/
		/****** md5 signature: 208aa0a766281e27d17734e5b448e9eb ******/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "
Parameters
----------
Prs: MeshVS_Mesh
XMin: double
YMin: double
XMax: double
YMax: double
aTol: double
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Return
-------
bool

Description
-----------
Returns maps of entities (nodes and elements) detected by mouse selection with rectangular box (XMin, YMin, XMax, YMax) on the current view plane, with the tolerance aTol. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
") GetDetectedEntities;
		virtual bool GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const double XMin, const double YMin, const double XMax, const double YMax, const double aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****** MeshVS_DataSource::GetDetectedEntities ******/
		/****** md5 signature: 16bb06441c7a8e12b1880cb08c4b37fc ******/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "
Parameters
----------
Prs: MeshVS_Mesh
Polyline: NCollection_Array1<gp_Pnt2d>
aBox: Bnd_Box2d
aTol: double
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Return
-------
bool

Description
-----------
Returns maps of entities (nodes and elements) detected by mouse selection with the polyline <Polyline> on the current view plane, with the tolerance aTol. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
") GetDetectedEntities;
		virtual bool GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const NCollection_Array1<gp_Pnt2d> & Polyline, const Bnd_Box2d & aBox, const double aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****** MeshVS_DataSource::GetDetectedEntities ******/
		/****** md5 signature: 5e75ca19aff48127d3854c0c236ca824 ******/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "
Parameters
----------
Prs: MeshVS_Mesh
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Return
-------
bool

Description
-----------
Filter out the maps of mesh entities so as to keep only the entities that are allowed to be selected according to the current context. Returns True if any of the maps has been changed. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
") GetDetectedEntities;
		virtual bool GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****** MeshVS_DataSource::GetGeom ******/
		/****** md5 signature: 73ee0500b05d51c3d1e64c262c823e70 ******/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool
Coords: NCollection_Array1<double>

Return
-------
NbNodes: int
Type: MeshVS_EntityType

Description
-----------
Returns geometry information about node or element ID is the numerical identificator of node or element IsElement indicates this ID describe node ( if false ) or element ( if true ) Coords is an array of coordinates of node(s). For node it is only 3 numbers: X, Y, Z in the strict order For element it is 3*n numbers, where n is number of this element vertices The order is strict also: X1, Y1, Z1, X2,...., where Xi, Yi, Zi are coordinates of vertices NbNodes is number of nodes. It is recommended this parameter to be set to 1 for node. Type is type of node or element (from enumeration). It is recommended this parameter to be set to MeshVS_ET_Node for node.
") GetGeom;
		virtual bool GetGeom(const int ID, const bool IsElement, NCollection_Array1<double> & Coords, Standard_Integer &OutValue, MeshVS_EntityType &OutValue);

		/****** MeshVS_DataSource::GetGeomType ******/
		/****** md5 signature: 7cb010ffade0241be61fe071ce296f1c ******/
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool

Return
-------
Type: MeshVS_EntityType

Description
-----------
This method is similar to GetGeom, but returns only element or node type.
") GetGeomType;
		virtual bool GetGeomType(const int ID, const bool IsElement, MeshVS_EntityType &OutValue);

		/****** MeshVS_DataSource::GetGroup ******/
		/****** md5 signature: b6abdb207840649909e1a6320b7c8f97 ******/
		%feature("compactdefaultargs") GetGroup;
		%feature("autodoc", "
Parameters
----------
Id: int
Ids: TColStd_PackedMapOfInteger

Return
-------
Type: MeshVS_EntityType

Description
-----------
This method returns map of all group elements.
") GetGroup;
		virtual bool GetGroup(const int Id, MeshVS_EntityType &OutValue, TColStd_PackedMapOfInteger & Ids);

		/****** MeshVS_DataSource::GetGroupAddr ******/
		/****** md5 signature: d02d00a1cc11efecb6a46433681df3b9 ******/
		%feature("compactdefaultargs") GetGroupAddr;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
void *

Description
-----------
This method returns pointer which represents group data structure. This address will be saved in MeshVS_MeshOwner, so that you can access to data structure fast by the method Owner(). In the redefined method you can return NULL. ID is the numerical identificator of group.
") GetGroupAddr;
		virtual void * GetGroupAddr(const int ID);

		/****** MeshVS_DataSource::GetNodeNormal ******/
		/****** md5 signature: 6761688d7e7eec2a481377347adc97f1 ******/
		%feature("compactdefaultargs") GetNodeNormal;
		%feature("autodoc", "
Parameters
----------
ranknode: int
ElementId: int

Return
-------
nx: double
ny: double
nz: double

Description
-----------
This method return normal of node ranknode of face Id, which is using for smooth shading presentation. Returns false if normal isn't defined.
") GetNodeNormal;
		virtual bool GetNodeNormal(const int ranknode, const int ElementId, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** MeshVS_DataSource::GetNodesByElement ******/
		/****** md5 signature: fbe037b609a537d4c2f651e819b6e75b ******/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "
Parameters
----------
ID: int
NodeIDs: NCollection_Array1<int>

Return
-------
NbNodes: int

Description
-----------
This method returns information about nodes this element consist of. ID is the numerical identificator of element. NodeIDs is the output array of nodes IDs in correct order, the same as coordinates returned by GetGeom(). NbNodes is number of nodes (number of items set in NodeIDs). Returns False if element does not exist.
") GetNodesByElement;
		virtual bool GetNodesByElement(const int ID, NCollection_Array1<int> & NodeIDs, Standard_Integer &OutValue);

		/****** MeshVS_DataSource::GetNormal ******/
		/****** md5 signature: 01c3fe573cb32cf80bf09a9c7b053705 ******/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "
Parameters
----------
Id: int
Max: int

Return
-------
nx: double
ny: double
nz: double

Description
-----------
This method calculates normal of face, which is using for correct reflection presentation. There is default method, for advance reflection this method can be redefined. Id is the numerical identificator of only element! Max is maximal number of nodes an element can consist of nx, ny, nz are values whose represent coordinates of normal (will be returned) In the redefined method you can return normal with length more then 1, but in this case the appearance of element will be more bright than usual. For ordinary brightness you must return normal with length 1.
") GetNormal;
		virtual bool GetNormal(const int Id, const int Max, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** MeshVS_DataSource::GetNormalsByElement ******/
		/****** md5 signature: 43848ad8bb425e442474a40b5ade6b0b ******/
		%feature("compactdefaultargs") GetNormalsByElement;
		%feature("autodoc", "
Parameters
----------
Id: int
IsNodal: bool
MaxNodes: int
Normals: NCollection_HArray1<double

Return
-------
bool

Description
-----------
This method puts components of normal vectors at each node of a mesh face (at each face of a mesh volume) into the output array. Returns false if some problem was detected during calculation of normals. Id is an identifier of the mesh element. IsNodal, when true, means that normals at mesh element nodes are needed. If nodal normals are not available, or IsNodal is false, or the mesh element is a volume, then the output array contents depend on the element type: face: a normal calculated by GetNormal() is duplicated for each node of the face; volume: normals to all faces of the volume are computed (not for each node!). MaxNodes is maximal number of nodes an element can consist of. Normals contains the result.
") GetNormalsByElement;
		virtual bool GetNormalsByElement(const int Id, const bool IsNodal, const int MaxNodes, opencascade::handle<NCollection_HArray1<double> > & Normals);

		/****** MeshVS_DataSource::IsAdvancedSelectionEnabled ******/
		/****** md5 signature: 95741cde3c11d3f7feb98e4337db6fcd ******/
		%feature("compactdefaultargs") IsAdvancedSelectionEnabled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if advanced mesh selection is enabled. Default implementation returns False. It should be redefined to return True for advanced mesh selection activation.
") IsAdvancedSelectionEnabled;
		virtual bool IsAdvancedSelectionEnabled();

};


%make_alias(MeshVS_DataSource)

%extend MeshVS_DataSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class MeshVS_Drawer *
**********************/
class MeshVS_Drawer : public Standard_Transient {
	public:
		/****** MeshVS_Drawer::Assign ******/
		/****** md5 signature: 67d5c1cb61cb7dc5c5dcda590104f88e ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
aDrawer: MeshVS_Drawer

Return
-------
None

Description
-----------
This method copies other drawer contents to this.
") Assign;
		virtual void Assign(const opencascade::handle<MeshVS_Drawer> & aDrawer);

		/****** MeshVS_Drawer::GetAsciiString ******/
		/****** md5 signature: c754be4661323189f6486015b4a6d239 ******/
		%feature("compactdefaultargs") GetAsciiString;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: str

Return
-------
bool

Description
-----------
No available documentation.
") GetAsciiString;
		bool GetAsciiString(const int Key, TCollection_AsciiString & Value);

		/****** MeshVS_Drawer::GetBoolean ******/
		/****** md5 signature: 172630334b0ff9ed175e9782601753f7 ******/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
Value: bool

Description
-----------
No available documentation.
") GetBoolean;
		bool GetBoolean(const int Key, Standard_Boolean &OutValue);

		/****** MeshVS_Drawer::GetColor ******/
		/****** md5 signature: ad481bca96ab89bb1d1ff58d5b487541 ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: Quantity_Color

Return
-------
bool

Description
-----------
No available documentation.
") GetColor;
		bool GetColor(const int Key, Quantity_Color & Value);

		/****** MeshVS_Drawer::GetDouble ******/
		/****** md5 signature: 368ee4c4ac845a6a773257d8e39e65fd ******/
		%feature("compactdefaultargs") GetDouble;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
Value: double

Description
-----------
No available documentation.
") GetDouble;
		bool GetDouble(const int Key, Standard_Real &OutValue);

		/****** MeshVS_Drawer::GetInteger ******/
		/****** md5 signature: 6aa9e8faa8a4942c2e550e674274a8a9 ******/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
Value: int

Description
-----------
No available documentation.
") GetInteger;
		bool GetInteger(const int Key, Standard_Integer &OutValue);

		/****** MeshVS_Drawer::GetMaterial ******/
		/****** md5 signature: ff86dd11e7ad39321d3f99eb9acc45b8 ******/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: Graphic3d_MaterialAspect

Return
-------
bool

Description
-----------
No available documentation.
") GetMaterial;
		bool GetMaterial(const int Key, Graphic3d_MaterialAspect & Value);

		/****** MeshVS_Drawer::RemoveAsciiString ******/
		/****** md5 signature: 5e2d44b97b79343d429f6a04ddef0a69 ******/
		%feature("compactdefaultargs") RemoveAsciiString;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
bool

Description
-----------
No available documentation.
") RemoveAsciiString;
		bool RemoveAsciiString(const int Key);

		/****** MeshVS_Drawer::RemoveBoolean ******/
		/****** md5 signature: 08981e8b5ef13e05bc8627aee104f9de ******/
		%feature("compactdefaultargs") RemoveBoolean;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
bool

Description
-----------
No available documentation.
") RemoveBoolean;
		bool RemoveBoolean(const int Key);

		/****** MeshVS_Drawer::RemoveColor ******/
		/****** md5 signature: 6ff6d74c1b00809e70969f6869690b38 ******/
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
bool

Description
-----------
No available documentation.
") RemoveColor;
		bool RemoveColor(const int Key);

		/****** MeshVS_Drawer::RemoveDouble ******/
		/****** md5 signature: 360c3320bce22576908e446b4654c604 ******/
		%feature("compactdefaultargs") RemoveDouble;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
bool

Description
-----------
No available documentation.
") RemoveDouble;
		bool RemoveDouble(const int Key);

		/****** MeshVS_Drawer::RemoveInteger ******/
		/****** md5 signature: ac8d6a5f78313bb22605a90e1f5d4cea ******/
		%feature("compactdefaultargs") RemoveInteger;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
bool

Description
-----------
No available documentation.
") RemoveInteger;
		bool RemoveInteger(const int Key);

		/****** MeshVS_Drawer::RemoveMaterial ******/
		/****** md5 signature: 0cc15beb3bffbb116e5c5b1b9d77b203 ******/
		%feature("compactdefaultargs") RemoveMaterial;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
bool

Description
-----------
No available documentation.
") RemoveMaterial;
		bool RemoveMaterial(const int Key);

		/****** MeshVS_Drawer::SetAsciiString ******/
		/****** md5 signature: 978c47224468f5ad8894ff517db542cb ******/
		%feature("compactdefaultargs") SetAsciiString;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: str

Return
-------
None

Description
-----------
No available documentation.
") SetAsciiString;
		void SetAsciiString(const int Key, TCollection_AsciiString Value);

		/****** MeshVS_Drawer::SetBoolean ******/
		/****** md5 signature: ae97bdc31d4826e56bc8ba4302bfe91c ******/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: bool

Return
-------
None

Description
-----------
No available documentation.
") SetBoolean;
		void SetBoolean(const int Key, const bool Value);

		/****** MeshVS_Drawer::SetColor ******/
		/****** md5 signature: 3caec4c01bbad586de17f3ccb3658da9 ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: Quantity_Color

Return
-------
None

Description
-----------
No available documentation.
") SetColor;
		void SetColor(const int Key, const Quantity_Color & Value);

		/****** MeshVS_Drawer::SetDouble ******/
		/****** md5 signature: 270a507be921b2e750c759f7d3b6dce4 ******/
		%feature("compactdefaultargs") SetDouble;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: double

Return
-------
None

Description
-----------
No available documentation.
") SetDouble;
		void SetDouble(const int Key, const double Value);

		/****** MeshVS_Drawer::SetInteger ******/
		/****** md5 signature: 926b21e466d12311fe729b1481128d4f ******/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: int

Return
-------
None

Description
-----------
No available documentation.
") SetInteger;
		void SetInteger(const int Key, const int Value);

		/****** MeshVS_Drawer::SetMaterial ******/
		/****** md5 signature: e381c16007897091642381dc8847fac9 ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
No available documentation.
") SetMaterial;
		void SetMaterial(const int Key, const Graphic3d_MaterialAspect & Value);

};


%make_alias(MeshVS_Drawer)

%extend MeshVS_Drawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class MeshVS_DummySensitiveEntity *
************************************/
class MeshVS_DummySensitiveEntity : public Select3D_SensitiveEntity {
	public:
		/****** MeshVS_DummySensitiveEntity::MeshVS_DummySensitiveEntity ******/
		/****** md5 signature: c3ed78b0bf1ed26fef4c19f03cff20ad ******/
		%feature("compactdefaultargs") MeshVS_DummySensitiveEntity;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_DummySensitiveEntity;
		 MeshVS_DummySensitiveEntity(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****** MeshVS_DummySensitiveEntity::BVH ******/
		/****** md5 signature: ea19f810848cc4896f3127faf0cdc872 ******/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BVH;
		void BVH();

		/****** MeshVS_DummySensitiveEntity::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
No available documentation.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** MeshVS_DummySensitiveEntity::CenterOfGeometry ******/
		/****** md5 signature: 62b5799fcc1932d1822fcdd55d64a53f ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** MeshVS_DummySensitiveEntity::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** MeshVS_DummySensitiveEntity::HasInitLocation ******/
		/****** md5 signature: dba43e52b44bbad6774d40bd862982c2 ******/
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasInitLocation;
		bool HasInitLocation();

		/****** MeshVS_DummySensitiveEntity::InvInitLocation ******/
		/****** md5 signature: 906328e2b518b76e36e81333523d0cb3 ******/
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
No available documentation.
") InvInitLocation;
		gp_GTrsf InvInitLocation();

		/****** MeshVS_DummySensitiveEntity::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
No available documentation.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** MeshVS_DummySensitiveEntity::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSubElements;
		int NbSubElements();

		/****** MeshVS_DummySensitiveEntity::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ToBuildBVH;
		bool ToBuildBVH();

};


%make_alias(MeshVS_DummySensitiveEntity)

%extend MeshVS_DummySensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class MeshVS_Mesh *
********************/
class MeshVS_Mesh : public AIS_InteractiveObject {
	public:
		/****** MeshVS_Mesh::MeshVS_Mesh ******/
		/****** md5 signature: 5f8ed73de33ab1af03b2c59a271fc226 ******/
		%feature("compactdefaultargs") MeshVS_Mesh;
		%feature("autodoc", "
Parameters
----------
theIsAllowOverlapped: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructor. theIsAllowOverlapped is true, if it is allowed to draw edges overlapped with beams Its value is stored in drawer.
") MeshVS_Mesh;
		 MeshVS_Mesh(const bool theIsAllowOverlapped = false);

		/****** MeshVS_Mesh::AcceptDisplayMode ******/
		/****** md5 signature: d90d8273b45e739d910a614eb1bf7b69 ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Returns true for supported display modes basing on a list of defined builders.
") AcceptDisplayMode;
		bool AcceptDisplayMode(const int theMode);

		/****** MeshVS_Mesh::AddBuilder ******/
		/****** md5 signature: 541f1dd5e62d8f1f7c1deec8fb7e23ca ******/
		%feature("compactdefaultargs") AddBuilder;
		%feature("autodoc", "
Parameters
----------
Builder: MeshVS_PrsBuilder
TreatAsHilighter: bool (optional, default to false)

Return
-------
None

Description
-----------
Adds builder to tale of sequence. PrsBuilder is builder to be added If TreatAsHilighter is true, MeshVS_Mesh will use this builder to create presentation of hilighted and selected owners. Only one builder can be hilighter, so that if you call this method with TreatAsHilighter = true some times, only last builder will be hilighter WARNING: As minimum one builder must be added as hilighter, otherwise selection cannot be computed.
") AddBuilder;
		void AddBuilder(const opencascade::handle<MeshVS_PrsBuilder> & Builder, const bool TreatAsHilighter = false);

		/****** MeshVS_Mesh::ClearSelected ******/
		/****** md5 signature: bbf73c5d3ff19ae0db25243e1c446610 ******/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal selection presentation.
") ClearSelected;
		void ClearSelected();

		/****** MeshVS_Mesh::Compute ******/
		/****** md5 signature: a7ebf9605462deb1eebad269af340f1b ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
thePrs: Prs3d_Presentation
theDispMode: int

Return
-------
None

Description
-----------
Computes presentation using builders added to sequence. Each builder computes own part of mesh presentation according to its type.
") Compute;
		void Compute(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePrs, const int theDispMode);

		/****** MeshVS_Mesh::ComputeSelection ******/
		/****** md5 signature: 4d2ebbb70642c36f0544e3108bab1eae ******/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "
Parameters
----------
theSel: SelectMgr_Selection
theSelMode: int

Return
-------
None

Description
-----------
Computes selection according to SelectMode.
") ComputeSelection;
		void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSel, const int theSelMode);

		/****** MeshVS_Mesh::FindBuilder ******/
		/****** md5 signature: ab9c4cb0161d77af94eadd6b2931086e ******/
		%feature("compactdefaultargs") FindBuilder;
		%feature("autodoc", "
Parameters
----------
TypeString: char *

Return
-------
opencascade::handle<MeshVS_PrsBuilder>

Description
-----------
No available documentation.
") FindBuilder;
		opencascade::handle<MeshVS_PrsBuilder> FindBuilder(const char * const TypeString);

		/****** MeshVS_Mesh::FindBuilder ******/
		/****** md5 signature: 025d5ba783adc5c2f27acee9e9142ea4 ******/
		%feature("compactdefaultargs") FindBuilder;
		%feature("autodoc", "
Parameters
----------
TypeString: Standard_Type

Return
-------
opencascade::handle<MeshVS_PrsBuilder>

Description
-----------
Finds builder by its type the type represents.
") FindBuilder;
		opencascade::handle<MeshVS_PrsBuilder> FindBuilder(const opencascade::handle<Standard_Type> & TypeString);

		/****** MeshVS_Mesh::GetBuilder ******/
		/****** md5 signature: 460ecd14603770229566d4f779d63bc1 ******/
		%feature("compactdefaultargs") GetBuilder;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MeshVS_PrsBuilder>

Description
-----------
Returns builder by its index in sequence.
") GetBuilder;
		opencascade::handle<MeshVS_PrsBuilder> GetBuilder(const int Index);

		/****** MeshVS_Mesh::GetBuilderById ******/
		/****** md5 signature: 298f00a367b84f7502b1227de577f2ba ******/
		%feature("compactdefaultargs") GetBuilderById;
		%feature("autodoc", "
Parameters
----------
Id: int

Return
-------
opencascade::handle<MeshVS_PrsBuilder>

Description
-----------
Returns builder by its ID.
") GetBuilderById;
		opencascade::handle<MeshVS_PrsBuilder> GetBuilderById(const int Id);

		/****** MeshVS_Mesh::GetBuildersCount ******/
		/****** md5 signature: c32697ce3ae2b4b5a2d4fe866b2e297f ******/
		%feature("compactdefaultargs") GetBuildersCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
How many builders there are in sequence.
") GetBuildersCount;
		int GetBuildersCount();

		/****** MeshVS_Mesh::GetDataSource ******/
		/****** md5 signature: ca32be43189ef73b1d72b94994846adb ******/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
Returns default builders' data source.
") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource();

		/****** MeshVS_Mesh::GetDrawer ******/
		/****** md5 signature: e55b0999dd530fcd96c63028c7005ff9 ******/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_Drawer>

Description
-----------
Returns default builders' drawer.
") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer();

		/****** MeshVS_Mesh::GetFreeId ******/
		/****** md5 signature: 27b6bef0d7e8b986dc2159ca231a3a53 ******/
		%feature("compactdefaultargs") GetFreeId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the smallest positive ID, not occupied by any builder. This method using when builder is created with ID = -1.
") GetFreeId;
		int GetFreeId();

		/****** MeshVS_Mesh::GetHiddenElems ******/
		/****** md5 signature: be1d71f2cbf4dea596755f02dc1b09df ******/
		%feature("compactdefaultargs") GetHiddenElems;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns map of hidden elements (may be null handle).
") GetHiddenElems;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenElems();

		/****** MeshVS_Mesh::GetHiddenNodes ******/
		/****** md5 signature: 1023896b08414adc50dd0515c5cbb9d5 ******/
		%feature("compactdefaultargs") GetHiddenNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns map of hidden nodes (may be null handle).
") GetHiddenNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenNodes();

		/****** MeshVS_Mesh::GetHilighter ******/
		/****** md5 signature: 2e4cedd742a8e16362b582ee7244c945 ******/
		%feature("compactdefaultargs") GetHilighter;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_PrsBuilder>

Description
-----------
Returns hilighter.
") GetHilighter;
		opencascade::handle<MeshVS_PrsBuilder> GetHilighter();

		/****** MeshVS_Mesh::GetMeshSelMethod ******/
		/****** md5 signature: a5526e7d4552c8494b10304212397f1c ******/
		%feature("compactdefaultargs") GetMeshSelMethod;
		%feature("autodoc", "Return
-------
MeshVS_MeshSelectionMethod

Description
-----------
Returns set mesh selection method (see MeshVS.cdl).
") GetMeshSelMethod;
		MeshVS_MeshSelectionMethod GetMeshSelMethod();

		/****** MeshVS_Mesh::GetOwnerMaps ******/
		/****** md5 signature: 1c3c6832975009131f8a56af1b67b24c ******/
		%feature("compactdefaultargs") GetOwnerMaps;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
NCollection_DataMap<int, opencascade::handle<SelectMgr_EntityOwner>>

Description
-----------
Returns map of owners.
") GetOwnerMaps;
		const NCollection_DataMap<int, opencascade::handle<SelectMgr_EntityOwner>> & GetOwnerMaps(const bool IsElement);

		/****** MeshVS_Mesh::GetSelectableNodes ******/
		/****** md5 signature: 9edd74a16dbce1c76f74fa06853e8c35 ******/
		%feature("compactdefaultargs") GetSelectableNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns map of selectable elements (may be null handle).
") GetSelectableNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectableNodes();

		/****** MeshVS_Mesh::HilightOwnerWithColor ******/
		/****** md5 signature: a2d76610c4ee752b4b2a8caff9cbf3c6 ******/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theColor: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Draw hilighted owner presentation.
") HilightOwnerWithColor;
		void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theColor, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** MeshVS_Mesh::HilightSelected ******/
		/****** md5 signature: 9db06c1ced4d213b1706c4daf7a5e7f1 ******/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theOwners: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Draw selected owners presentation.
") HilightSelected;
		void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner> > & theOwners);

		/****** MeshVS_Mesh::IsHiddenElem ******/
		/****** md5 signature: f2890bb74bdfe174b03292401d8d3152 ******/
		%feature("compactdefaultargs") IsHiddenElem;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
bool

Description
-----------
Returns True if specified element is hidden By default no elements are hidden.
") IsHiddenElem;
		bool IsHiddenElem(const int ID);

		/****** MeshVS_Mesh::IsHiddenNode ******/
		/****** md5 signature: a2239018d4536632172eefbfe35190ee ******/
		%feature("compactdefaultargs") IsHiddenNode;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
bool

Description
-----------
Returns True if specified node is hidden. By default all nodes are hidden.
") IsHiddenNode;
		bool IsHiddenNode(const int ID);

		/****** MeshVS_Mesh::IsSelectableElem ******/
		/****** md5 signature: 444b4d61373e211e23cfa50f10013e7d ******/
		%feature("compactdefaultargs") IsSelectableElem;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
bool

Description
-----------
Returns True if specified element is not hidden.
") IsSelectableElem;
		bool IsSelectableElem(const int ID);

		/****** MeshVS_Mesh::IsSelectableNode ******/
		/****** md5 signature: 4179ad72a636241582b0158685450765 ******/
		%feature("compactdefaultargs") IsSelectableNode;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
bool

Description
-----------
Returns True if specified node is specified as selectable.
") IsSelectableNode;
		bool IsSelectableNode(const int ID);

		/****** MeshVS_Mesh::IsWholeMeshOwner ******/
		/****** md5 signature: c11577675090bd3fcb62ba23010ece8b ******/
		%feature("compactdefaultargs") IsWholeMeshOwner;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Returns True if the given owner represents a whole mesh.
") IsWholeMeshOwner;
		virtual bool IsWholeMeshOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** MeshVS_Mesh::RemoveBuilder ******/
		/****** md5 signature: 8d5b7c6c099c944bab85ec3ab8520fc3 ******/
		%feature("compactdefaultargs") RemoveBuilder;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Removes builder from sequence. If it is hilighter, hilighter will be NULL ( Don't remember to set it to other after!!! ).
") RemoveBuilder;
		void RemoveBuilder(const int Index);

		/****** MeshVS_Mesh::RemoveBuilderById ******/
		/****** md5 signature: 3e0941fb66928489269b67eb114e7e28 ******/
		%feature("compactdefaultargs") RemoveBuilderById;
		%feature("autodoc", "
Parameters
----------
Id: int

Return
-------
None

Description
-----------
Removes builder with identificator Id.
") RemoveBuilderById;
		void RemoveBuilderById(const int Id);

		/****** MeshVS_Mesh::SetDataSource ******/
		/****** md5 signature: cf54d237029680a3719d8edb73eef545 ******/
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "
Parameters
----------
aDataSource: MeshVS_DataSource

Return
-------
None

Description
-----------
Sets default builders' data source.
") SetDataSource;
		void SetDataSource(const opencascade::handle<MeshVS_DataSource> & aDataSource);

		/****** MeshVS_Mesh::SetDrawer ******/
		/****** md5 signature: 2eccb5055064a6c34829ec8b5575e9e1 ******/
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "
Parameters
----------
aDrawer: MeshVS_Drawer

Return
-------
None

Description
-----------
Sets default builders' drawer.
") SetDrawer;
		void SetDrawer(const opencascade::handle<MeshVS_Drawer> & aDrawer);

		/****** MeshVS_Mesh::SetHiddenElems ******/
		/****** md5 signature: 834907541ed9fd153ae875a7d6fab8ad ******/
		%feature("compactdefaultargs") SetHiddenElems;
		%feature("autodoc", "
Parameters
----------
Ids: TColStd_HPackedMapOfInteger

Return
-------
None

Description
-----------
Sets map of hidden elements.
") SetHiddenElems;
		void SetHiddenElems(const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****** MeshVS_Mesh::SetHiddenNodes ******/
		/****** md5 signature: bc57e17e115dc7e6d5e4771ae554e85e ******/
		%feature("compactdefaultargs") SetHiddenNodes;
		%feature("autodoc", "
Parameters
----------
Ids: TColStd_HPackedMapOfInteger

Return
-------
None

Description
-----------
Sets map of hidden nodes, which shall not be displayed individually. If nodes shared by some elements shall not be drawn, they should be included into that map.
") SetHiddenNodes;
		void SetHiddenNodes(const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****** MeshVS_Mesh::SetHilighter ******/
		/****** md5 signature: 8504bcd4ae7a31d283b945f96d87c649 ******/
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "
Parameters
----------
Builder: MeshVS_PrsBuilder

Return
-------
None

Description
-----------
Changes hilighter ( see above ).
") SetHilighter;
		void SetHilighter(const opencascade::handle<MeshVS_PrsBuilder> & Builder);

		/****** MeshVS_Mesh::SetHilighter ******/
		/****** md5 signature: 74813d189f94b6429290a6d3b1be18e5 ******/
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
bool

Description
-----------
Sets builder with sequence index 'Index' as hilighter.
") SetHilighter;
		bool SetHilighter(const int Index);

		/****** MeshVS_Mesh::SetHilighterById ******/
		/****** md5 signature: 15c8ac8740c37d9343646f87a2823ca9 ******/
		%feature("compactdefaultargs") SetHilighterById;
		%feature("autodoc", "
Parameters
----------
Id: int

Return
-------
bool

Description
-----------
Sets builder with identificator 'Id' as hilighter.
") SetHilighterById;
		bool SetHilighterById(const int Id);

		/****** MeshVS_Mesh::SetMeshSelMethod ******/
		/****** md5 signature: c10e4a5f5393f18d85fd94be33f8cdab ******/
		%feature("compactdefaultargs") SetMeshSelMethod;
		%feature("autodoc", "
Parameters
----------
M: MeshVS_MeshSelectionMethod

Return
-------
None

Description
-----------
Sets mesh selection method (see MeshVS.cdl).
") SetMeshSelMethod;
		void SetMeshSelMethod(const MeshVS_MeshSelectionMethod M);

		/****** MeshVS_Mesh::SetSelectableNodes ******/
		/****** md5 signature: 6092b46eb1966f9197594ca27a1efb6a ******/
		%feature("compactdefaultargs") SetSelectableNodes;
		%feature("autodoc", "
Parameters
----------
Ids: TColStd_HPackedMapOfInteger

Return
-------
None

Description
-----------
Sets map of selectable nodes.
") SetSelectableNodes;
		void SetSelectableNodes(const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****** MeshVS_Mesh::UpdateSelectableNodes ******/
		/****** md5 signature: 5490c8d651606c343ee26ac0fab57f44 ******/
		%feature("compactdefaultargs") UpdateSelectableNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Automatically computes selectable nodes; the node is considered as being selectable if it is either not hidden, or is hidden but referred by at least one non-hidden element. Thus all nodes that are visible (either individually, or as ends or corners of elements) are selectable by default.
") UpdateSelectableNodes;
		void UpdateSelectableNodes();

};


%extend MeshVS_Mesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class MeshVS_MeshEntityOwner *
*******************************/
class MeshVS_MeshEntityOwner : public SelectMgr_EntityOwner {
	public:
		/****** MeshVS_MeshEntityOwner::MeshVS_MeshEntityOwner ******/
		/****** md5 signature: dcb92bed2874ae0fc1db1aafcce18b08 ******/
		%feature("compactdefaultargs") MeshVS_MeshEntityOwner;
		%feature("autodoc", "
Parameters
----------
SelObj: SelectMgr_SelectableObject *
ID: int
MeshEntity: void *
Type: MeshVS_EntityType
Priority: int (optional, default to 0)
IsGroup: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_MeshEntityOwner;
		 MeshVS_MeshEntityOwner(const SelectMgr_SelectableObject * SelObj, const int ID, void * const MeshEntity, const MeshVS_EntityType & Type, const int Priority = 0, const bool IsGroup = false);

		/****** MeshVS_MeshEntityOwner::Clear ******/
		/****** md5 signature: 114b9ff52688e7fe7e07f61bbabfa255 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear(const opencascade::handle<PrsMgr_PresentationManager> & PM, const int Mode = 0);

		/****** MeshVS_MeshEntityOwner::HilightWithColor ******/
		/****** md5 signature: bcacc84fce4a273c2cef40b3c49caa70 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int

Return
-------
None

Description
-----------
Hilights owner with the certain color.
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const int theMode);

		/****** MeshVS_MeshEntityOwner::ID ******/
		/****** md5 signature: 897b87be47338bdfaa2575963f3b2cd7 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns ID of element or node data structure.
") ID;
		int ID();

		/****** MeshVS_MeshEntityOwner::IsGroup ******/
		/****** md5 signature: 47ac5974fb94cce77cdb1c3199858d4a ******/
		%feature("compactdefaultargs") IsGroup;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if owner represents group of nodes or elements.
") IsGroup;
		bool IsGroup();

		/****** MeshVS_MeshEntityOwner::IsHilighted ******/
		/****** md5 signature: e41ead3df7f4abf012c07cd9c425313f ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if owner is hilighted.
") IsHilighted;
		bool IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & PM, const int Mode = 0);

		/****** MeshVS_MeshEntityOwner::Owner ******/
		/****** md5 signature: e1d9a1ff32c3a388504c88f7563517ef ******/
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "Return
-------
void *

Description
-----------
Returns an address of element or node data structure.
") Owner;
		void * Owner();

		/****** MeshVS_MeshEntityOwner::Type ******/
		/****** md5 signature: bbf39ad1e96486bac0abdece768add02 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
MeshVS_EntityType

Description
-----------
Returns type of element or node data structure.
") Type;
		MeshVS_EntityType Type();

		/****** MeshVS_MeshEntityOwner::Unhilight ******/
		/****** md5 signature: 492668745b67c139e2baf086a5a3204d ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Strip hilight of owner.
") Unhilight;
		void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & PM, const int Mode = 0);

};


%make_alias(MeshVS_MeshEntityOwner)

%extend MeshVS_MeshEntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class MeshVS_MeshOwner *
*************************/
class MeshVS_MeshOwner : public SelectMgr_EntityOwner {
	public:
		/****** MeshVS_MeshOwner::MeshVS_MeshOwner ******/
		/****** md5 signature: 1fd672cd759493c604b092dd634f921f ******/
		%feature("compactdefaultargs") MeshVS_MeshOwner;
		%feature("autodoc", "
Parameters
----------
theSelObj: SelectMgr_SelectableObject *
theDS: MeshVS_DataSource
thePriority: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_MeshOwner;
		 MeshVS_MeshOwner(const SelectMgr_SelectableObject * theSelObj, const opencascade::handle<MeshVS_DataSource> & theDS, const int thePriority = 0);

		/****** MeshVS_MeshOwner::AddSelectedEntities ******/
		/****** md5 signature: 930a2aa4220ee7f25e67119672984a05 ******/
		%feature("compactdefaultargs") AddSelectedEntities;
		%feature("autodoc", "
Parameters
----------
Nodes: TColStd_HPackedMapOfInteger
Elems: TColStd_HPackedMapOfInteger

Return
-------
None

Description
-----------
Saves ids of selected mesh entities.
") AddSelectedEntities;
		virtual void AddSelectedEntities(const opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, const opencascade::handle<TColStd_HPackedMapOfInteger> & Elems);

		/****** MeshVS_MeshOwner::ClearSelectedEntities ******/
		/****** md5 signature: af2bd659b7b2c6682a06adb420ba4d31 ******/
		%feature("compactdefaultargs") ClearSelectedEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears ids of selected mesh entities.
") ClearSelectedEntities;
		virtual void ClearSelectedEntities();

		/****** MeshVS_MeshOwner::GetDataSource ******/
		/****** md5 signature: d85e268855ae7570709111f1bfed2357 ******/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
No available documentation.
") GetDataSource;
		const opencascade::handle<MeshVS_DataSource> & GetDataSource();

		/****** MeshVS_MeshOwner::GetDetectedElements ******/
		/****** md5 signature: 04b7410693d348f1c14a3a9427d1f89c ******/
		%feature("compactdefaultargs") GetDetectedElements;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of hilighted mesh elements.
") GetDetectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedElements();

		/****** MeshVS_MeshOwner::GetDetectedNodes ******/
		/****** md5 signature: c0389016e4ca7143ab9f3b57802362c0 ******/
		%feature("compactdefaultargs") GetDetectedNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of hilighted mesh nodes.
") GetDetectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedNodes();

		/****** MeshVS_MeshOwner::GetSelectedElements ******/
		/****** md5 signature: dff7dcfb193f36f3bdf59e566d193e5e ******/
		%feature("compactdefaultargs") GetSelectedElements;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of selected mesh elements.
") GetSelectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedElements();

		/****** MeshVS_MeshOwner::GetSelectedNodes ******/
		/****** md5 signature: f43499b5276f262e4f555eee435c7e1a ******/
		%feature("compactdefaultargs") GetSelectedNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of selected mesh nodes.
") GetSelectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedNodes();

		/****** MeshVS_MeshOwner::HilightWithColor ******/
		/****** md5 signature: b5f2f2b2097441f4b8bdca17ffebac05 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theColor: Prs3d_Drawer
theMode: int

Return
-------
None

Description
-----------
No available documentation.
") HilightWithColor;
		void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theColor, const int theMode);

		/****** MeshVS_MeshOwner::IsForcedHilight ******/
		/****** md5 signature: 92f3baa5202989891d1ab29485820efe ******/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsForcedHilight;
		bool IsForcedHilight();

		/****** MeshVS_MeshOwner::SetDetectedEntities ******/
		/****** md5 signature: 04e17c5f7ec31d9c8284ca04c87e19de ******/
		%feature("compactdefaultargs") SetDetectedEntities;
		%feature("autodoc", "
Parameters
----------
Nodes: TColStd_HPackedMapOfInteger
Elems: TColStd_HPackedMapOfInteger

Return
-------
None

Description
-----------
Saves ids of hilighted mesh entities.
") SetDetectedEntities;
		void SetDetectedEntities(const opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, const opencascade::handle<TColStd_HPackedMapOfInteger> & Elems);

		/****** MeshVS_MeshOwner::Unhilight ******/
		/****** md5 signature: 492668745b67c139e2baf086a5a3204d ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Unhilight;
		void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & PM, const int Mode = 0);

};


%make_alias(MeshVS_MeshOwner)

%extend MeshVS_MeshOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class MeshVS_PrsBuilder *
**************************/
%nodefaultctor MeshVS_PrsBuilder;
class MeshVS_PrsBuilder : public Standard_Transient {
	public:
		/****** MeshVS_PrsBuilder::Build ******/
		/****** md5 signature: 5c9c33f400869bc7a747864a74334c8d ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Return
-------
None

Description
-----------
Builds presentation of certain type of data. Prs is presentation object which this method constructs. IDs is set of numeric identificators forming object appearance. IDsToExclude is set of IDs to exclude from processing. If some entity has been excluded, it is not processed by other builders. IsElement indicates, IDs is identificators of nodes or elements. DisplayMode is numeric constant describing display mode (see MeshVS_DisplayModeFlags.hxx).
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const bool IsElement, const int DisplayMode);

		/****** MeshVS_PrsBuilder::CustomBuild ******/
		/****** md5 signature: f0673fc3e6c9323004bc7e902fdfedfd ******/
		%feature("compactdefaultargs") CustomBuild;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
DisplayMode: int

Return
-------
None

Description
-----------
This method is called to build presentation of custom elements (they have MeshVS_ET_0D type). IDs is set of numeric identificators of elements for custom building. IDsToExclude is set of IDs to exclude from processing. If some entity has been excluded, it is not processed by other builders. DisplayMode is numeric constant describing display mode (see MeshVS_DisplayModeFlags.hxx).
") CustomBuild;
		virtual void CustomBuild(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const int DisplayMode);

		/****** MeshVS_PrsBuilder::CustomSensitiveEntity ******/
		/****** md5 signature: c45747ba212c16d3f903227bfbb31bef ******/
		%feature("compactdefaultargs") CustomSensitiveEntity;
		%feature("autodoc", "
Parameters
----------
Owner: SelectMgr_EntityOwner
SelectMode: int

Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
This method is called to build sensitive of custom elements ( they have MeshVS_ET_0D type ).
") CustomSensitiveEntity;
		virtual opencascade::handle<Select3D_SensitiveEntity> CustomSensitiveEntity(const opencascade::handle<SelectMgr_EntityOwner> & Owner, const int SelectMode);

		/****** MeshVS_PrsBuilder::GetDataSource ******/
		/****** md5 signature: ca32be43189ef73b1d72b94994846adb ******/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
Returns custom data source or default ( from MeshVS_Mesh ) if custom is NULL.
") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource();

		/****** MeshVS_PrsBuilder::GetDrawer ******/
		/****** md5 signature: e55b0999dd530fcd96c63028c7005ff9 ******/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_Drawer>

Description
-----------
Returns custom drawer or default ( from MeshVS_Mesh ) if custom is NULL.
") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer();

		/****** MeshVS_PrsBuilder::GetFlags ******/
		/****** md5 signature: e37e21b99ee37966314520577cce6c33 ******/
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns flags, assigned with builder during creation.
") GetFlags;
		int GetFlags();

		/****** MeshVS_PrsBuilder::GetId ******/
		/****** md5 signature: 781f24bdbef989af0dcaeecba22194bf ******/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns builder ID.
") GetId;
		int GetId();

		/****** MeshVS_PrsBuilder::GetPresentationManager ******/
		/****** md5 signature: 6e40a1f4cb619282f3f5fef0362d30c7 ******/
		%feature("compactdefaultargs") GetPresentationManager;
		%feature("autodoc", "Return
-------
opencascade::handle<PrsMgr_PresentationManager>

Description
-----------
Get presentation manager of builder.
") GetPresentationManager;
		opencascade::handle<PrsMgr_PresentationManager> GetPresentationManager();

		/****** MeshVS_PrsBuilder::GetPriority ******/
		/****** md5 signature: 97e78f0aca6e5cc2ebf19e3e9f76b76f ******/
		%feature("compactdefaultargs") GetPriority;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns priority; as priority bigger, as soon builder will be called.
") GetPriority;
		int GetPriority();

		/****** MeshVS_PrsBuilder::IsExcludingOn ******/
		/****** md5 signature: c08555a5ed3d690a9dfc28d7442b774d ******/
		%feature("compactdefaultargs") IsExcludingOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Read excluding state.
") IsExcludingOn;
		bool IsExcludingOn();

		/****** MeshVS_PrsBuilder::SetDataSource ******/
		/****** md5 signature: acf169d625c2a3f54c3be9a96b5dd7e1 ******/
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "
Parameters
----------
newDS: MeshVS_DataSource

Return
-------
None

Description
-----------
Change custom data source.
") SetDataSource;
		void SetDataSource(const opencascade::handle<MeshVS_DataSource> & newDS);

		/****** MeshVS_PrsBuilder::SetDrawer ******/
		/****** md5 signature: f908e5dab8929fcf39a3d215cf9ced40 ******/
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "
Parameters
----------
newDr: MeshVS_Drawer

Return
-------
None

Description
-----------
Change custom drawer.
") SetDrawer;
		void SetDrawer(const opencascade::handle<MeshVS_Drawer> & newDr);

		/****** MeshVS_PrsBuilder::SetExcluding ******/
		/****** md5 signature: fff9a96c3eb8e6f6ae26bf6407aaf9bb ******/
		%feature("compactdefaultargs") SetExcluding;
		%feature("autodoc", "
Parameters
----------
state: bool

Return
-------
None

Description
-----------
Set excluding state. If it is true, the nodes or elements, processed by current builder will be noted and next builder won't process its.
") SetExcluding;
		void SetExcluding(const bool state);

		/****** MeshVS_PrsBuilder::SetPresentationManager ******/
		/****** md5 signature: d173303c18adee38a57fbcdd196f3023 ******/
		%feature("compactdefaultargs") SetPresentationManager;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager

Return
-------
None

Description
-----------
Set presentation manager for builder.
") SetPresentationManager;
		void SetPresentationManager(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr);

		/****** MeshVS_PrsBuilder::TestFlags ******/
		/****** md5 signature: 57fb87f9f735d49c6540bef448f1df51 ******/
		%feature("compactdefaultargs") TestFlags;
		%feature("autodoc", "
Parameters
----------
DisplayMode: int

Return
-------
bool

Description
-----------
Test whether display mode has flags assigned with this builder. This method has default implementation and can be redefined for advance behavior Returns true only if display mode is appropriate for this builder.
") TestFlags;
		virtual bool TestFlags(const int DisplayMode);

};


%make_alias(MeshVS_PrsBuilder)

%extend MeshVS_PrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class MeshVS_SensitiveFace *
*****************************/
class MeshVS_SensitiveFace : public Select3D_SensitiveFace {
	public:
		/****** MeshVS_SensitiveFace::MeshVS_SensitiveFace ******/
		/****** md5 signature: 18974a8b7c890b7900a7528dda7e5f8f ******/
		%feature("compactdefaultargs") MeshVS_SensitiveFace;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
thePoints: NCollection_Array1<gp_Pnt>
theSensType: Select3D_TypeOfSensitivity (optional, default to Select3D_TOS_INTERIOR)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_SensitiveFace;
		 MeshVS_SensitiveFace(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const NCollection_Array1<gp_Pnt> & thePoints, const Select3D_TypeOfSensitivity theSensType = Select3D_TOS_INTERIOR);

};


%make_alias(MeshVS_SensitiveFace)

%extend MeshVS_SensitiveFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class MeshVS_SensitiveMesh *
*****************************/
class MeshVS_SensitiveMesh : public Select3D_SensitiveEntity {
	public:
		/****** MeshVS_SensitiveMesh::MeshVS_SensitiveMesh ******/
		/****** md5 signature: 1d3ebec01fff437f036fa3fd08062315 ******/
		%feature("compactdefaultargs") MeshVS_SensitiveMesh;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_SensitiveMesh;
		 MeshVS_SensitiveMesh(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const int theMode = 0);

		/****** MeshVS_SensitiveMesh::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of mesh.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** MeshVS_SensitiveMesh::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of mesh.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** MeshVS_SensitiveMesh::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** MeshVS_SensitiveMesh::GetMode ******/
		/****** md5 signature: 946d40a73476346f70604689a3c00dac ******/
		%feature("compactdefaultargs") GetMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMode;
		int GetMode();

		/****** MeshVS_SensitiveMesh::Matches ******/
		/****** md5 signature: 8bde630e3dc0bc454c63ea4b4431fa7f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether sensitive overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** MeshVS_SensitiveMesh::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of mesh nodes.
") NbSubElements;
		int NbSubElements();

};


%make_alias(MeshVS_SensitiveMesh)

%extend MeshVS_SensitiveMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class MeshVS_SensitivePolyhedron *
***********************************/
class MeshVS_SensitivePolyhedron : public Select3D_SensitiveEntity {
	public:
		/****** MeshVS_SensitivePolyhedron::MeshVS_SensitivePolyhedron ******/
		/****** md5 signature: 5884de3f48d23dc5775d804979c088b7 ******/
		%feature("compactdefaultargs") MeshVS_SensitivePolyhedron;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theNodes: NCollection_Array1<gp_Pnt>
theTopo: NCollection_HArray1<NCollection_Sequence<int

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_SensitivePolyhedron;
		 MeshVS_SensitivePolyhedron(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const NCollection_Array1<gp_Pnt> & theNodes, const opencascade::handle<NCollection_HArray1<NCollection_Sequence<int> > > & theTopo);

		/****** MeshVS_SensitivePolyhedron::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
No available documentation.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** MeshVS_SensitivePolyhedron::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** MeshVS_SensitivePolyhedron::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** MeshVS_SensitivePolyhedron::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
No available documentation.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** MeshVS_SensitivePolyhedron::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of nodes of polyhedron.
") NbSubElements;
		int NbSubElements();

};


%make_alias(MeshVS_SensitivePolyhedron)

%extend MeshVS_SensitivePolyhedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class MeshVS_SensitiveQuad *
*****************************/
class MeshVS_SensitiveQuad : public Select3D_SensitiveEntity {
	public:
		/****** MeshVS_SensitiveQuad::MeshVS_SensitiveQuad ******/
		/****** md5 signature: b36e76a78449135d9e706edd804d268a ******/
		%feature("compactdefaultargs") MeshVS_SensitiveQuad;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theQuadVerts: NCollection_Array1<gp_Pnt>

Return
-------
None

Description
-----------
Creates a new instance and initializes quadrangle vertices with the given points.
") MeshVS_SensitiveQuad;
		 MeshVS_SensitiveQuad(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const NCollection_Array1<gp_Pnt> & theQuadVerts);

		/****** MeshVS_SensitiveQuad::MeshVS_SensitiveQuad ******/
		/****** md5 signature: 8164a0cdeb9a24fa1506bde94ab30186 ******/
		%feature("compactdefaultargs") MeshVS_SensitiveQuad;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePnt3: gp_Pnt
thePnt4: gp_Pnt

Return
-------
None

Description
-----------
Creates a new instance and initializes quadrangle vertices with the given points.
") MeshVS_SensitiveQuad;
		 MeshVS_SensitiveQuad(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, const gp_Pnt & thePnt4);

		/****** MeshVS_SensitiveQuad::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns coordinates of the box.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** MeshVS_SensitiveQuad::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the box.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** MeshVS_SensitiveQuad::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns a copy of this sensitive quadrangle.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** MeshVS_SensitiveQuad::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the box overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** MeshVS_SensitiveQuad::NbSubElements ******/
		/****** md5 signature: 4a8c4d129f7e6a31251dd926827a1299 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities in sensitive.
") NbSubElements;
		int NbSubElements();

};


%make_alias(MeshVS_SensitiveQuad)

%extend MeshVS_SensitiveQuad {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class MeshVS_SensitiveSegment *
********************************/
class MeshVS_SensitiveSegment : public Select3D_SensitiveSegment {
	public:
		/****** MeshVS_SensitiveSegment::MeshVS_SensitiveSegment ******/
		/****** md5 signature: efc5c2e36dd0f6deb1081e6a21890c91 ******/
		%feature("compactdefaultargs") MeshVS_SensitiveSegment;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_SensitiveSegment;
		 MeshVS_SensitiveSegment(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const gp_Pnt & theFirstPnt, const gp_Pnt & theLastPnt);

};


%make_alias(MeshVS_SensitiveSegment)

%extend MeshVS_SensitiveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class MeshVS_SymmetricPairHasher *
***********************************/
class MeshVS_SymmetricPairHasher {
	public:
};


%extend MeshVS_SymmetricPairHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class MeshVS_Tool *
********************/
class MeshVS_Tool {
	public:
		/****** MeshVS_Tool::CreateAspectFillArea3d ******/
		/****** md5 signature: fca0e71124efea684c72a29a9bb09dd9 ******/
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to true)

Return
-------
opencascade::handle<Graphic3d_AspectFillArea3d>

Description
-----------
Creates fill area aspect with values from Drawer according to keys from DrawerAttribute.
") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d(const opencascade::handle<MeshVS_Drawer> & theDr, const bool UseDefaults = true);

		/****** MeshVS_Tool::CreateAspectFillArea3d ******/
		/****** md5 signature: b8fdaee7d15bfb11581b7b00c83d9571 ******/
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
Mat: Graphic3d_MaterialAspect
UseDefaults: bool (optional, default to true)

Return
-------
opencascade::handle<Graphic3d_AspectFillArea3d>

Description
-----------
Creates fill aspect with values from Drawer according to keys from DrawerAttribute and specific material aspect.
") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Graphic3d_MaterialAspect & Mat, const bool UseDefaults = true);

		/****** MeshVS_Tool::CreateAspectLine3d ******/
		/****** md5 signature: 7a9ed52ad97f3e0f9aa9fecb190e3fbe ******/
		%feature("compactdefaultargs") CreateAspectLine3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to true)

Return
-------
opencascade::handle<Graphic3d_AspectLine3d>

Description
-----------
Creates line aspect with values from Drawer according to keys from DrawerAttribute.
") CreateAspectLine3d;
		static opencascade::handle<Graphic3d_AspectLine3d> CreateAspectLine3d(const opencascade::handle<MeshVS_Drawer> & theDr, const bool UseDefaults = true);

		/****** MeshVS_Tool::CreateAspectMarker3d ******/
		/****** md5 signature: bca5c594e63d74e988c6e2fb227d8ed4 ******/
		%feature("compactdefaultargs") CreateAspectMarker3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to true)

Return
-------
opencascade::handle<Graphic3d_AspectMarker3d>

Description
-----------
Creates marker aspect with values from Drawer according to keys from DrawerAttribute.
") CreateAspectMarker3d;
		static opencascade::handle<Graphic3d_AspectMarker3d> CreateAspectMarker3d(const opencascade::handle<MeshVS_Drawer> & theDr, const bool UseDefaults = true);

		/****** MeshVS_Tool::CreateAspectText3d ******/
		/****** md5 signature: 9fdf4faaadb23d7464f589b15964468d ******/
		%feature("compactdefaultargs") CreateAspectText3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to true)

Return
-------
opencascade::handle<Graphic3d_AspectText3d>

Description
-----------
Creates text aspect with values from Drawer according to keys from DrawerAttribute.
") CreateAspectText3d;
		static opencascade::handle<Graphic3d_AspectText3d> CreateAspectText3d(const opencascade::handle<MeshVS_Drawer> & theDr, const bool UseDefaults = true);

		/****** MeshVS_Tool::GetAverageNormal ******/
		/****** md5 signature: 66d42cfd7dfef8078014d6411279c535 ******/
		%feature("compactdefaultargs") GetAverageNormal;
		%feature("autodoc", "
Parameters
----------
Nodes: NCollection_Array1<double>
Norm: gp_Vec

Return
-------
bool

Description
-----------
Get an average of normals to non-planar polygon described by these points or compute normal of planar polygon. If the polygon isn't planar, function returns false.
") GetAverageNormal;
		static bool GetAverageNormal(const NCollection_Array1<double> & Nodes, gp_Vec & Norm);

		/****** MeshVS_Tool::GetNormal ******/
		/****** md5 signature: dbbea41a0358db219fa34466771d7407 ******/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "
Parameters
----------
Nodes: NCollection_Array1<double>
Norm: gp_Vec

Return
-------
bool

Description
-----------
Get one of normals to polygon described by these points. If the polygon isn't planar, function returns false.
") GetNormal;
		static bool GetNormal(const NCollection_Array1<double> & Nodes, gp_Vec & Norm);

};


%extend MeshVS_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class MeshVS_TwoColors *
*************************/
class MeshVS_TwoColors {
	public:

%extend{
    bool __eq_wrapper__(const MeshVS_TwoColors other) {
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


%extend MeshVS_TwoColors {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class MeshVS_TwoNodes *
************************/
class MeshVS_TwoNodes {
	public:
		/****** MeshVS_TwoNodes::MeshVS_TwoNodes ******/
		/****** md5 signature: ae32e54c25e314287ab15dea9b8847b8 ******/
		%feature("compactdefaultargs") MeshVS_TwoNodes;
		%feature("autodoc", "
Parameters
----------
aFirst: int (optional, default to 0)
aSecond: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_TwoNodes;
		 MeshVS_TwoNodes(int aFirst = 0, int aSecond = 0);


%extend{
    bool __eq_wrapper__(const MeshVS_TwoNodes other) {
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


%extend MeshVS_TwoNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class hash<MeshVS_TwoColors> *
*******************************/
/******************************
* class hash<MeshVS_TwoNodes> *
******************************/
/****************************
* class MeshVS_DataSource3D *
****************************/
%nodefaultctor MeshVS_DataSource3D;
class MeshVS_DataSource3D : public MeshVS_DataSource {
	public:
		/****** MeshVS_DataSource3D::CreatePrismTopology ******/
		/****** md5 signature: c7ad450f94ce2b9b3a28f82b057bb620 ******/
		%feature("compactdefaultargs") CreatePrismTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>>

Description
-----------
No available documentation.
") CreatePrismTopology;
		static opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>> CreatePrismTopology(const int BasePoints);

		/****** MeshVS_DataSource3D::CreatePyramidTopology ******/
		/****** md5 signature: 283b0ad8571cc4a7e53c4a4a674aa403 ******/
		%feature("compactdefaultargs") CreatePyramidTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>>

Description
-----------
No available documentation.
") CreatePyramidTopology;
		static opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>> CreatePyramidTopology(const int BasePoints);

		/****** MeshVS_DataSource3D::GetPrismTopology ******/
		/****** md5 signature: ab826f7c413ec3a1c2a3737bb66cd0df ******/
		%feature("compactdefaultargs") GetPrismTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>>

Description
-----------
No available documentation.
") GetPrismTopology;
		opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>> GetPrismTopology(const int BasePoints);

		/****** MeshVS_DataSource3D::GetPyramidTopology ******/
		/****** md5 signature: 3c372add30ddef369f58791ab78a891a ******/
		%feature("compactdefaultargs") GetPyramidTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>>

Description
-----------
No available documentation.
") GetPyramidTopology;
		opencascade::handle<NCollection_HArray1<NCollection_Sequence<int>>> GetPyramidTopology(const int BasePoints);

};


%make_alias(MeshVS_DataSource3D)

%extend MeshVS_DataSource3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class MeshVS_DeformedDataSource *
**********************************/
class MeshVS_DeformedDataSource : public MeshVS_DataSource {
	public:
		/****** MeshVS_DeformedDataSource::MeshVS_DeformedDataSource ******/
		/****** md5 signature: b191da229a133e7c59b778fc8ee3d078 ******/
		%feature("compactdefaultargs") MeshVS_DeformedDataSource;
		%feature("autodoc", "
Parameters
----------
theNonDeformDS: MeshVS_DataSource
theMagnify: double

Return
-------
None

Description
-----------
Constructor theNonDeformDS is canonical non-deformed data source, by which we are able to calculate deformed mesh geometry theMagnify is coefficient of displacement magnify.
") MeshVS_DeformedDataSource;
		 MeshVS_DeformedDataSource(const opencascade::handle<MeshVS_DataSource> & theNonDeformDS, const double theMagnify);

		/****** MeshVS_DeformedDataSource::Get3DGeom ******/
		/****** md5 signature: 309378738dc5f7d1af01734c3aef1698 ******/
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
Data: NCollection_HArray1<NCollection_Sequence<int

Return
-------
NbNodes: int

Description
-----------
No available documentation.
") Get3DGeom;
		bool Get3DGeom(const int ID, Standard_Integer &OutValue, opencascade::handle<NCollection_HArray1<NCollection_Sequence<int> > > & Data);

		/****** MeshVS_DeformedDataSource::GetAddr ******/
		/****** md5 signature: 158dc720c1b54acb641ae4f9eea1dfb2 ******/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool

Return
-------
void *

Description
-----------
No available documentation.
") GetAddr;
		void * GetAddr(const int ID, const bool IsElement);

		/****** MeshVS_DeformedDataSource::GetAllElements ******/
		/****** md5 signature: bb7af67958ccc7697ce27326d25721dd ******/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") GetAllElements;
		const TColStd_PackedMapOfInteger & GetAllElements();

		/****** MeshVS_DeformedDataSource::GetAllNodes ******/
		/****** md5 signature: 1709940198124d699883d414761376bd ******/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") GetAllNodes;
		const TColStd_PackedMapOfInteger & GetAllNodes();

		/****** MeshVS_DeformedDataSource::GetGeom ******/
		/****** md5 signature: 719af2d889bd880b48181d739e1d6916 ******/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool
Coords: NCollection_Array1<double>

Return
-------
NbNodes: int
Type: MeshVS_EntityType

Description
-----------
No available documentation.
") GetGeom;
		bool GetGeom(const int ID, const bool IsElement, NCollection_Array1<double> & Coords, Standard_Integer &OutValue, MeshVS_EntityType &OutValue);

		/****** MeshVS_DeformedDataSource::GetGeomType ******/
		/****** md5 signature: 2204248ae7ab690685990a0b4da6481e ******/
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool

Return
-------
Type: MeshVS_EntityType

Description
-----------
No available documentation.
") GetGeomType;
		bool GetGeomType(const int ID, const bool IsElement, MeshVS_EntityType &OutValue);

		/****** MeshVS_DeformedDataSource::GetMagnify ******/
		/****** md5 signature: 53df18cdf0cda3286f7a1ec744ba5038 ******/
		%feature("compactdefaultargs") GetMagnify;
		%feature("autodoc", "Return
-------
double

Description
-----------
With this methods you can read and change magnify coefficient of nodal displacements.
") GetMagnify;
		double GetMagnify();

		/****** MeshVS_DeformedDataSource::GetNodesByElement ******/
		/****** md5 signature: 71efe37fb144d5ac13c40d6a0b39342f ******/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "
Parameters
----------
ID: int
NodeIDs: NCollection_Array1<int>

Return
-------
NbNodes: int

Description
-----------
No available documentation.
") GetNodesByElement;
		bool GetNodesByElement(const int ID, NCollection_Array1<int> & NodeIDs, Standard_Integer &OutValue);

		/****** MeshVS_DeformedDataSource::GetNonDeformedDataSource ******/
		/****** md5 signature: 1fb350b85c910da319116b42f8799dba ******/
		%feature("compactdefaultargs") GetNonDeformedDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
With this methods you can read and change internal canonical data source.
") GetNonDeformedDataSource;
		opencascade::handle<MeshVS_DataSource> GetNonDeformedDataSource();

		/****** MeshVS_DeformedDataSource::GetVector ******/
		/****** md5 signature: 49f982d541ebf47a40136ab8daeab819 ******/
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "
Parameters
----------
ID: int
Vect: gp_Vec

Return
-------
bool

Description
-----------
This method returns vector ( Vect ) assigned to node number ID.
") GetVector;
		bool GetVector(const int ID, gp_Vec & Vect);

		/****** MeshVS_DeformedDataSource::GetVectors ******/
		/****** md5 signature: 91b6c1f122e60da0bb6767e5814c33ac ******/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, gp_Vec>

Description
-----------
This method returns map of nodal displacement vectors.
") GetVectors;
		const NCollection_DataMap<int, gp_Vec> GetVectors();

		/****** MeshVS_DeformedDataSource::SetMagnify ******/
		/****** md5 signature: f9872cba429081dfe7577b55ac07bde7 ******/
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "
Parameters
----------
theMagnify: double

Return
-------
None

Description
-----------
No available documentation.
") SetMagnify;
		void SetMagnify(const double theMagnify);

		/****** MeshVS_DeformedDataSource::SetNonDeformedDataSource ******/
		/****** md5 signature: f4016f982dace6441c1f73e6a09237e8 ******/
		%feature("compactdefaultargs") SetNonDeformedDataSource;
		%feature("autodoc", "
Parameters
----------
theDS: MeshVS_DataSource

Return
-------
None

Description
-----------
No available documentation.
") SetNonDeformedDataSource;
		void SetNonDeformedDataSource(const opencascade::handle<MeshVS_DataSource> & theDS);

		/****** MeshVS_DeformedDataSource::SetVector ******/
		/****** md5 signature: 4fc7c15c5f9e4079727160d91826049c ******/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "
Parameters
----------
ID: int
Vect: gp_Vec

Return
-------
None

Description
-----------
This method sets vector ( Vect ) assigned to node number ID.
") SetVector;
		void SetVector(const int ID, const gp_Vec & Vect);

		/****** MeshVS_DeformedDataSource::SetVectors ******/
		/****** md5 signature: 91920fc6734334d1d90b7e15eb06a840 ******/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "
Parameters
----------
Map: NCollection_DataMap<int, gp_Vec>

Return
-------
None

Description
-----------
This method sets map of nodal displacement vectors (Map).
") SetVectors;
		void SetVectors(const NCollection_DataMap<int, gp_Vec> & Map);

};


%make_alias(MeshVS_DeformedDataSource)

%extend MeshVS_DeformedDataSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class MeshVS_ElementalColorPrsBuilder *
****************************************/
class MeshVS_ElementalColorPrsBuilder : public MeshVS_PrsBuilder {
	public:
		/****** MeshVS_ElementalColorPrsBuilder::MeshVS_ElementalColorPrsBuilder ******/
		/****** md5 signature: 6117ca78d0f868140a24fac99b964b73 ******/
		%feature("compactdefaultargs") MeshVS_ElementalColorPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Flags: int (optional, default to MeshVS_DMF_ElementalColorDataPrs)
DS: MeshVS_DataSource (optional, default to nullptr)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_ElemColor)

Return
-------
None

Description
-----------
Constructor.
") MeshVS_ElementalColorPrsBuilder;
		 MeshVS_ElementalColorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_ElementalColorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = nullptr, const int Id = -1, int Priority = MeshVS_BP_ElemColor);

		/****** MeshVS_ElementalColorPrsBuilder::Build ******/
		/****** md5 signature: 729b1cd0a0078d3cb1f8227ea1e49f44 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Return
-------
None

Description
-----------
Builds presentation of elements with assigned colors.
") Build;
		void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const bool IsElement, const int DisplayMode);

		/****** MeshVS_ElementalColorPrsBuilder::GetColor1 ******/
		/****** md5 signature: 4ac21a7e8fb3a434821bb138641ef5af ******/
		%feature("compactdefaultargs") GetColor1;
		%feature("autodoc", "
Parameters
----------
ID: int
theColor: Quantity_Color

Return
-------
bool

Description
-----------
Returns color assigned with element number ID.
") GetColor1;
		bool GetColor1(const int ID, Quantity_Color & theColor);

		/****** MeshVS_ElementalColorPrsBuilder::GetColor2 ******/
		/****** md5 signature: 7a08f5afe06c586d4c5ebaff9a3499bb ******/
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "
Parameters
----------
ID: int
theColor: MeshVS_TwoColors

Return
-------
bool

Description
-----------
Returns colors assigned with element number ID.
") GetColor2;
		bool GetColor2(const int ID, MeshVS_TwoColors & theColor);

		/****** MeshVS_ElementalColorPrsBuilder::GetColor2 ******/
		/****** md5 signature: 49b1a638dada60c75b691c151cb7a9e2 ******/
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "
Parameters
----------
ID: int
theColor1: Quantity_Color
theColor2: Quantity_Color

Return
-------
bool

Description
-----------
Returns colors assigned with element number ID theColor1 is the front element color theColor2 is the back element color.
") GetColor2;
		bool GetColor2(const int ID, Quantity_Color & theColor1, Quantity_Color & theColor2);

		/****** MeshVS_ElementalColorPrsBuilder::GetColors1 ******/
		/****** md5 signature: c8a19712dae2b896d31d191d5decfbce ******/
		%feature("compactdefaultargs") GetColors1;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, Quantity_Color>

Description
-----------
Returns map of colors same for front and back side of face.
") GetColors1;
		const NCollection_DataMap<int, Quantity_Color> & GetColors1();

		/****** MeshVS_ElementalColorPrsBuilder::GetColors2 ******/
		/****** md5 signature: d24f832bc6d2ccab93d0678c6ca69ff4 ******/
		%feature("compactdefaultargs") GetColors2;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, MeshVS_TwoColors>

Description
-----------
Returns map of different colors for front and back side of face.
") GetColors2;
		const NCollection_DataMap<int, MeshVS_TwoColors> & GetColors2();

		/****** MeshVS_ElementalColorPrsBuilder::HasColors1 ******/
		/****** md5 signature: b782f8b935e67a7ce02fae8e65aaab12 ******/
		%feature("compactdefaultargs") HasColors1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true, if map of colors isn't empty.
") HasColors1;
		bool HasColors1();

		/****** MeshVS_ElementalColorPrsBuilder::HasColors2 ******/
		/****** md5 signature: ab549e29ddffb7c72f4eb14d7e0ea4b7 ******/
		%feature("compactdefaultargs") HasColors2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true, if map isn't empty.
") HasColors2;
		bool HasColors2();

		/****** MeshVS_ElementalColorPrsBuilder::SetColor1 ******/
		/****** md5 signature: 9e7ef1550a4a5a984c695cee6ee07e45 ******/
		%feature("compactdefaultargs") SetColor1;
		%feature("autodoc", "
Parameters
----------
ID: int
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color assigned with element number ID.
") SetColor1;
		void SetColor1(const int ID, const Quantity_Color & theColor);

		/****** MeshVS_ElementalColorPrsBuilder::SetColor2 ******/
		/****** md5 signature: 58043611cc536b48423f6ca077032250 ******/
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "
Parameters
----------
ID: int
theTwoColors: MeshVS_TwoColors

Return
-------
None

Description
-----------
Sets colors assigned with element number ID.
") SetColor2;
		void SetColor2(const int ID, const MeshVS_TwoColors & theTwoColors);

		/****** MeshVS_ElementalColorPrsBuilder::SetColor2 ******/
		/****** md5 signature: 95b9d1ce01af74032bd9a286d39f4921 ******/
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "
Parameters
----------
ID: int
theColor1: Quantity_Color
theColor2: Quantity_Color

Return
-------
None

Description
-----------
Sets color assigned with element number ID theColor1 is the front element color theColor2 is the back element color.
") SetColor2;
		void SetColor2(const int ID, const Quantity_Color & theColor1, const Quantity_Color & theColor2);

		/****** MeshVS_ElementalColorPrsBuilder::SetColors1 ******/
		/****** md5 signature: 76b0ec82b663a2c79bcb8c2f5f2cdb3a ******/
		%feature("compactdefaultargs") SetColors1;
		%feature("autodoc", "
Parameters
----------
Map: NCollection_DataMap<int, Quantity_Color>

Return
-------
None

Description
-----------
Sets map of colors same for front and back side of face.
") SetColors1;
		void SetColors1(const NCollection_DataMap<int, Quantity_Color> & Map);

		/****** MeshVS_ElementalColorPrsBuilder::SetColors2 ******/
		/****** md5 signature: d9d2dc9d1fa21b76c00f6bf68ff87747 ******/
		%feature("compactdefaultargs") SetColors2;
		%feature("autodoc", "
Parameters
----------
Map: NCollection_DataMap<int, MeshVS_TwoColors>

Return
-------
None

Description
-----------
Sets map of different colors for front and back side of face.
") SetColors2;
		void SetColors2(const NCollection_DataMap<int, MeshVS_TwoColors> & Map);

};


%make_alias(MeshVS_ElementalColorPrsBuilder)

%extend MeshVS_ElementalColorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class MeshVS_MeshPrsBuilder *
******************************/
class MeshVS_MeshPrsBuilder : public MeshVS_PrsBuilder {
	public:
		/****** MeshVS_MeshPrsBuilder::MeshVS_MeshPrsBuilder ******/
		/****** md5 signature: 3c78eb11823874b63f848c74c64a177f ******/
		%feature("compactdefaultargs") MeshVS_MeshPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Flags: int (optional, default to MeshVS_DMF_OCCMask)
DS: MeshVS_DataSource (optional, default to nullptr)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_Mesh)

Return
-------
None

Description
-----------
Creates builder with certain display mode flags, data source, ID and priority.
") MeshVS_MeshPrsBuilder;
		 MeshVS_MeshPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_OCCMask, const opencascade::handle<MeshVS_DataSource> & DS = nullptr, const int Id = -1, int Priority = MeshVS_BP_Mesh);

		/****** MeshVS_MeshPrsBuilder::AddVolumePrs ******/
		/****** md5 signature: 2232457a3eaeca4245131891f7559693 ******/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "
Parameters
----------
Topo: NCollection_HArray1<NCollection_Sequence<int
Nodes: NCollection_Array1<double>
NbNodes: int
Array: Graphic3d_ArrayOfPrimitives
IsReflected: bool
IsShrinked: bool
IsSelect: bool
ShrinkCoef: double

Return
-------
None

Description
-----------
Add to array polygons or polylines representing volume.
") AddVolumePrs;
		static void AddVolumePrs(const opencascade::handle<NCollection_HArray1<NCollection_Sequence<int> > > & Topo, const NCollection_Array1<double> & Nodes, const int NbNodes, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Array, const bool IsReflected, const bool IsShrinked, const bool IsSelect, const double ShrinkCoef);

		/****** MeshVS_MeshPrsBuilder::Build ******/
		/****** md5 signature: 729b1cd0a0078d3cb1f8227ea1e49f44 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Return
-------
None

Description
-----------
Builds base mesh presentation by calling the methods below.
") Build;
		void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const bool IsElement, const int DisplayMode);

		/****** MeshVS_MeshPrsBuilder::BuildElements ******/
		/****** md5 signature: 3ef9fb4c531b312b96fdd6770db15510 ******/
		%feature("compactdefaultargs") BuildElements;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
DisplayMode: int

Return
-------
None

Description
-----------
Builds elements presentation.
") BuildElements;
		virtual void BuildElements(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const int DisplayMode);

		/****** MeshVS_MeshPrsBuilder::BuildHilightPrs ******/
		/****** md5 signature: 16ec4a36e7d14736040982bf8f75c9dc ******/
		%feature("compactdefaultargs") BuildHilightPrs;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IsElement: bool

Return
-------
None

Description
-----------
Builds presentation of hilighted entity.
") BuildHilightPrs;
		virtual void BuildHilightPrs(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, const bool IsElement);

		/****** MeshVS_MeshPrsBuilder::BuildNodes ******/
		/****** md5 signature: 0386ff333f1ff61ace14192ca9e3fbce ******/
		%feature("compactdefaultargs") BuildNodes;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
DisplayMode: int

Return
-------
None

Description
-----------
Builds nodes presentation.
") BuildNodes;
		virtual void BuildNodes(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const int DisplayMode);

		/****** MeshVS_MeshPrsBuilder::HowManyPrimitives ******/
		/****** md5 signature: b3af464fb2dddd269120a3999ef90287 ******/
		%feature("compactdefaultargs") HowManyPrimitives;
		%feature("autodoc", "
Parameters
----------
Topo: NCollection_HArray1<NCollection_Sequence<int
AsPolygons: bool
IsSelect: bool
NbNodes: int

Return
-------
Vertices: int
Bounds: int

Description
-----------
Calculate how many polygons or polylines are necessary to draw passed topology.
") HowManyPrimitives;
		static void HowManyPrimitives(const opencascade::handle<NCollection_HArray1<NCollection_Sequence<int> > > & Topo, const bool AsPolygons, const bool IsSelect, const int NbNodes, Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%make_alias(MeshVS_MeshPrsBuilder)

%extend MeshVS_MeshPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class MeshVS_NodalColorPrsBuilder *
************************************/
class MeshVS_NodalColorPrsBuilder : public MeshVS_PrsBuilder {
	public:
		/****** MeshVS_NodalColorPrsBuilder::MeshVS_NodalColorPrsBuilder ******/
		/****** md5 signature: 37b9d1c73e302da614e9c6eaccf7b3c2 ******/
		%feature("compactdefaultargs") MeshVS_NodalColorPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Flags: int (optional, default to MeshVS_DMF_NodalColorDataPrs)
DS: MeshVS_DataSource (optional, default to nullptr)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_NodalColor)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_NodalColorPrsBuilder;
		 MeshVS_NodalColorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_NodalColorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = nullptr, const int Id = -1, int Priority = MeshVS_BP_NodalColor);

		/****** MeshVS_NodalColorPrsBuilder::AddVolumePrs ******/
		/****** md5 signature: c0152417c4ca1e130d0073b0d8e9ffde ******/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "
Parameters
----------
theTopo: NCollection_HArray1<NCollection_Sequence<int
theNodes: NCollection_Array1<int>
theCoords: NCollection_Array1<double>
theArray: Graphic3d_ArrayOfPrimitives
theIsShaded: bool
theNbColors: int
theNbTexColors: int
theColorRatio: double

Return
-------
None

Description
-----------
Add to array polygons or polylines representing volume.
") AddVolumePrs;
		void AddVolumePrs(const opencascade::handle<NCollection_HArray1<NCollection_Sequence<int> > > & theTopo, const NCollection_Array1<int> & theNodes, const NCollection_Array1<double> & theCoords, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & theArray, const bool theIsShaded, const int theNbColors, const int theNbTexColors, const double theColorRatio);

		/****** MeshVS_NodalColorPrsBuilder::Build ******/
		/****** md5 signature: 729b1cd0a0078d3cb1f8227ea1e49f44 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Return
-------
None

Description
-----------
Builds presentation of nodes with assigned color.
") Build;
		void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const bool IsElement, const int DisplayMode);

		/****** MeshVS_NodalColorPrsBuilder::GetColor ******/
		/****** md5 signature: 4c0d5a779675de3240a7ddaff95a78fd ******/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "
Parameters
----------
ID: int
theColor: Quantity_Color

Return
-------
bool

Description
-----------
Returns color assigned to single node.
") GetColor;
		bool GetColor(const int ID, Quantity_Color & theColor);

		/****** MeshVS_NodalColorPrsBuilder::GetColorMap ******/
		/****** md5 signature: f362fa91b53da2c1c6b0f0727d0e1c52 ******/
		%feature("compactdefaultargs") GetColorMap;
		%feature("autodoc", "Return
-------
NCollection_Sequence<Quantity_Color>

Description
-----------
Return colors used for texrture presentation.
") GetColorMap;
		const NCollection_Sequence<Quantity_Color> & GetColorMap();

		/****** MeshVS_NodalColorPrsBuilder::GetColors ******/
		/****** md5 signature: eea6e0ced65465faa91a6ac8cc97ce56 ******/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, Quantity_Color>

Description
-----------
Returns map of colors assigned to nodes.
") GetColors;
		const NCollection_DataMap<int, Quantity_Color> & GetColors();

		/****** MeshVS_NodalColorPrsBuilder::GetInvalidColor ******/
		/****** md5 signature: fadb3ec9710e50245d895eab1b9ccd53 ******/
		%feature("compactdefaultargs") GetInvalidColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return color representing invalid texture coordinate (laying outside range [0, 1]).
") GetInvalidColor;
		Quantity_Color GetInvalidColor();

		/****** MeshVS_NodalColorPrsBuilder::GetTextureCoord ******/
		/****** md5 signature: 5ae93c29b71d787baffff313dc4d9599 ******/
		%feature("compactdefaultargs") GetTextureCoord;
		%feature("autodoc", "
Parameters
----------
theID: int

Return
-------
double

Description
-----------
Return correspondence between node IDs and texture coordinate (range [0, 1]).
") GetTextureCoord;
		double GetTextureCoord(const int theID);

		/****** MeshVS_NodalColorPrsBuilder::GetTextureCoords ******/
		/****** md5 signature: efa1bec09e9e136954a95f13759321ec ******/
		%feature("compactdefaultargs") GetTextureCoords;
		%feature("autodoc", "Return
-------
NCollection_DataMap<int, double>

Description
-----------
Get correspondence between node IDs and texture coordinates (range [0, 1]).
") GetTextureCoords;
		const NCollection_DataMap<int, double> & GetTextureCoords();

		/****** MeshVS_NodalColorPrsBuilder::HasColors ******/
		/****** md5 signature: cf70820a255929ca118d94593afd3b51 ******/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true, if map isn't empty.
") HasColors;
		bool HasColors();

		/****** MeshVS_NodalColorPrsBuilder::IsUseTexture ******/
		/****** md5 signature: dcbb1c683c50853892dfa4cac353323b ******/
		%feature("compactdefaultargs") IsUseTexture;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Verify whether texture is used to build presentation.
") IsUseTexture;
		bool IsUseTexture();

		/****** MeshVS_NodalColorPrsBuilder::SetColor ******/
		/****** md5 signature: e6360a53ed52612a6f3b92deabfb684f ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
ID: int
theColor: Quantity_Color

Return
-------
None

Description
-----------
Sets color assigned to single node.
") SetColor;
		void SetColor(const int ID, const Quantity_Color & theColor);

		/****** MeshVS_NodalColorPrsBuilder::SetColorMap ******/
		/****** md5 signature: 2957e13a36f6973474de8fa537d8c86c ******/
		%feature("compactdefaultargs") SetColorMap;
		%feature("autodoc", "
Parameters
----------
theColors: NCollection_Sequence<Quantity_Color>

Return
-------
None

Description
-----------
Set colors to be used for texrture presentation theColors - colors for valid coordinates (laying in range [0, 1]).
") SetColorMap;
		void SetColorMap(const NCollection_Sequence<Quantity_Color> & theColors);

		/****** MeshVS_NodalColorPrsBuilder::SetColors ******/
		/****** md5 signature: 5e151094abdef31503b81c2da50a21e1 ******/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
Map: NCollection_DataMap<int, Quantity_Color>

Return
-------
None

Description
-----------
Sets map of colors assigned to nodes.
") SetColors;
		void SetColors(const NCollection_DataMap<int, Quantity_Color> & Map);

		/****** MeshVS_NodalColorPrsBuilder::SetInvalidColor ******/
		/****** md5 signature: 1ef0ceb8c20a55bffa37ac95b9992618 ******/
		%feature("compactdefaultargs") SetInvalidColor;
		%feature("autodoc", "
Parameters
----------
theInvalidColor: Quantity_Color

Return
-------
None

Description
-----------
Set color representing invalid texture coordinate (laying outside range [0, 1]).
") SetInvalidColor;
		void SetInvalidColor(const Quantity_Color & theInvalidColor);

		/****** MeshVS_NodalColorPrsBuilder::SetTextureCoord ******/
		/****** md5 signature: 1e311b31cfd42a8cf7007b7151a468cd ******/
		%feature("compactdefaultargs") SetTextureCoord;
		%feature("autodoc", "
Parameters
----------
theID: int
theCoord: double

Return
-------
None

Description
-----------
Specify correspondence between node ID and texture coordinate (range [0, 1]).
") SetTextureCoord;
		void SetTextureCoord(const int theID, const double theCoord);

		/****** MeshVS_NodalColorPrsBuilder::SetTextureCoords ******/
		/****** md5 signature: 56dd91b481946f3773d3de7d4a2b5680 ******/
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "
Parameters
----------
theMap: NCollection_DataMap<int, double>

Return
-------
None

Description
-----------
Specify correspondence between node IDs and texture coordinates (range [0, 1]).
") SetTextureCoords;
		void SetTextureCoords(const NCollection_DataMap<int, double> & theMap);

		/****** MeshVS_NodalColorPrsBuilder::UseTexture ******/
		/****** md5 signature: ec50b64bd04947bb5afb104b797e2ea2 ******/
		%feature("compactdefaultargs") UseTexture;
		%feature("autodoc", "
Parameters
----------
theToUse: bool

Return
-------
None

Description
-----------
Specify whether texture must be used to build presentation.
") UseTexture;
		void UseTexture(const bool theToUse);

};


%make_alias(MeshVS_NodalColorPrsBuilder)

%extend MeshVS_NodalColorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class MeshVS_TextPrsBuilder *
******************************/
class MeshVS_TextPrsBuilder : public MeshVS_PrsBuilder {
	public:
		/****** MeshVS_TextPrsBuilder::MeshVS_TextPrsBuilder ******/
		/****** md5 signature: 9b086b3b87b39fcb410b8e4ed731fff8 ******/
		%feature("compactdefaultargs") MeshVS_TextPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Height: double
Color: Quantity_Color
Flags: int (optional, default to MeshVS_DMF_TextDataPrs)
DS: MeshVS_DataSource (optional, default to nullptr)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_Text)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_TextPrsBuilder;
		 MeshVS_TextPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, const double Height, const Quantity_Color & Color, int Flags = MeshVS_DMF_TextDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = nullptr, const int Id = -1, int Priority = MeshVS_BP_Text);

		/****** MeshVS_TextPrsBuilder::Build ******/
		/****** md5 signature: cd79131cf4f3e4281185a4ecd6f8abad ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
theDisplayMode: int

Return
-------
None

Description
-----------
Builds presentation of text data.
") Build;
		void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const bool IsElement, const int theDisplayMode);

		/****** MeshVS_TextPrsBuilder::GetText ******/
		/****** md5 signature: f9bab53e7c3787f981ca331eb55459eb ******/
		%feature("compactdefaultargs") GetText;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
ID: int
Text: str

Return
-------
bool

Description
-----------
Returns text assigned with single node or element.
") GetText;
		bool GetText(const bool IsElement, const int ID, TCollection_AsciiString & Text);

		/****** MeshVS_TextPrsBuilder::GetTexts ******/
		/****** md5 signature: d2f6f88958f57b161135df23e3eb50b6 ******/
		%feature("compactdefaultargs") GetTexts;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
NCollection_DataMap<int, TCollection_AsciiString>

Description
-----------
Returns map of text assigned with nodes ( IsElement = False ) or elements ( IsElement = True ).
") GetTexts;
		const NCollection_DataMap<int, TCollection_AsciiString> & GetTexts(const bool IsElement);

		/****** MeshVS_TextPrsBuilder::HasTexts ******/
		/****** md5 signature: 829bfbfb7ed9f1b0f8b3b6589505cb05 ******/
		%feature("compactdefaultargs") HasTexts;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
bool

Description
-----------
Returns True if map isn't empty.
") HasTexts;
		bool HasTexts(const bool IsElement);

		/****** MeshVS_TextPrsBuilder::SetText ******/
		/****** md5 signature: a1c84c8a90d441ed7978b031c004a7d3 ******/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
ID: int
Text: str

Return
-------
None

Description
-----------
Sets text assigned with single node or element.
") SetText;
		void SetText(const bool IsElement, const int ID, TCollection_AsciiString Text);

		/****** MeshVS_TextPrsBuilder::SetTexts ******/
		/****** md5 signature: 229d61b4a324afcea93bf3068eaa1d0e ******/
		%feature("compactdefaultargs") SetTexts;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
Map: NCollection_DataMap<int, TCollection_AsciiString>

Return
-------
None

Description
-----------
Sets map of text assigned with nodes or elements.
") SetTexts;
		void SetTexts(const bool IsElement, const NCollection_DataMap<int, TCollection_AsciiString> & Map);

};


%make_alias(MeshVS_TextPrsBuilder)

%extend MeshVS_TextPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class MeshVS_VectorPrsBuilder *
********************************/
class MeshVS_VectorPrsBuilder : public MeshVS_PrsBuilder {
	public:
		/****** MeshVS_VectorPrsBuilder::MeshVS_VectorPrsBuilder ******/
		/****** md5 signature: 9e1621b72154ed8374d9d2945b4a7884 ******/
		%feature("compactdefaultargs") MeshVS_VectorPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
MaxLength: double
VectorColor: Quantity_Color
Flags: int (optional, default to MeshVS_DMF_VectorDataPrs)
DS: MeshVS_DataSource (optional, default to nullptr)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_Vector)
IsSimplePrs: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_VectorPrsBuilder;
		 MeshVS_VectorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, const double MaxLength, const Quantity_Color & VectorColor, int Flags = MeshVS_DMF_VectorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = nullptr, const int Id = -1, int Priority = MeshVS_BP_Vector, const bool IsSimplePrs = false);

		/****** MeshVS_VectorPrsBuilder::Build ******/
		/****** md5 signature: cd79131cf4f3e4281185a4ecd6f8abad ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
theDisplayMode: int

Return
-------
None

Description
-----------
Builds vector data presentation.
") Build;
		void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const bool IsElement, const int theDisplayMode);

		/****** MeshVS_VectorPrsBuilder::DrawVector ******/
		/****** md5 signature: b38777b7f605b0b1e2ca4b559d00c47e ******/
		%feature("compactdefaultargs") DrawVector;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf
Length: double
MaxLength: double
ArrowPoints: NCollection_Array1<gp_Pnt>
Lines: Graphic3d_ArrayOfPrimitives
ArrowLines: Graphic3d_ArrayOfPrimitives
Triangles: Graphic3d_ArrayOfPrimitives

Return
-------
None

Description
-----------
Adds to array of polygons and polylines some primitive representing single vector.
") DrawVector;
		void DrawVector(const gp_Trsf & theTrsf, const double Length, const double MaxLength, const NCollection_Array1<gp_Pnt> & ArrowPoints, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Lines, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & ArrowLines, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Triangles);

		/****** MeshVS_VectorPrsBuilder::GetMinMaxVectorValue ******/
		/****** md5 signature: 99fd63e9bd349438fddb6c76421ab455 ******/
		%feature("compactdefaultargs") GetMinMaxVectorValue;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
MinValue: double
MaxValue: double

Description
-----------
Calculates minimal and maximal length of vectors in map ( nodal, if IsElement = False or elemental, if IsElement = True ).
") GetMinMaxVectorValue;
		void GetMinMaxVectorValue(const bool IsElement, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** MeshVS_VectorPrsBuilder::GetVector ******/
		/****** md5 signature: a7e8899dba378d882c41f4b379152ace ******/
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
ID: int
Vect: gp_Vec

Return
-------
bool

Description
-----------
Returns vector assigned with certain node or element.
") GetVector;
		bool GetVector(const bool IsElement, const int ID, gp_Vec & Vect);

		/****** MeshVS_VectorPrsBuilder::GetVectors ******/
		/****** md5 signature: 7305a134cb4ee5740b06c351c54286e0 ******/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
NCollection_DataMap<int, gp_Vec>

Description
-----------
Returns map of vectors assigned with nodes or elements.
") GetVectors;
		const NCollection_DataMap<int, gp_Vec> GetVectors(const bool IsElement);

		/****** MeshVS_VectorPrsBuilder::HasVectors ******/
		/****** md5 signature: f016bcfa2129e4f09801d4edd406fbd2 ******/
		%feature("compactdefaultargs") HasVectors;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
bool

Description
-----------
Returns true, if map isn't empty.
") HasVectors;
		bool HasVectors(const bool IsElement);

		/****** MeshVS_VectorPrsBuilder::SetSimplePrsMode ******/
		/****** md5 signature: f462aa76e9fc9f7894d84d4924044ff9 ******/
		%feature("compactdefaultargs") SetSimplePrsMode;
		%feature("autodoc", "
Parameters
----------
IsSimpleArrow: bool

Return
-------
None

Description
-----------
Sets flag that indicates is simple vector arrow mode uses or not default value is False.
") SetSimplePrsMode;
		void SetSimplePrsMode(const bool IsSimpleArrow);

		/****** MeshVS_VectorPrsBuilder::SetSimplePrsParams ******/
		/****** md5 signature: aa8a711bcc844f98829e424efae74bc4 ******/
		%feature("compactdefaultargs") SetSimplePrsParams;
		%feature("autodoc", "
Parameters
----------
theLineWidthParam: double
theStartParam: double
theEndParam: double

Return
-------
None

Description
-----------
Sets parameters of simple vector arrwo presentation theLineWidthParam - coefficient of vector line width (to draw line instead of arrow) theStartParam and theEndParam parameters of start and end of thickened ends position of thickening calculates according to parameters and maximum vector length default values are: theLineWidthParam = 2.5 theStartParam = 0.85 theEndParam = 0.95.
") SetSimplePrsParams;
		void SetSimplePrsParams(const double theLineWidthParam, const double theStartParam, const double theEndParam);

		/****** MeshVS_VectorPrsBuilder::SetVector ******/
		/****** md5 signature: 7072c29904961371e839f5de0a0fa930 ******/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
ID: int
Vect: gp_Vec

Return
-------
None

Description
-----------
Sets vector assigned with certain node or element.
") SetVector;
		void SetVector(const bool IsElement, const int ID, const gp_Vec & Vect);

		/****** MeshVS_VectorPrsBuilder::SetVectors ******/
		/****** md5 signature: c24da2abeb14aed5c2496979a20a5a6d ******/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
Map: NCollection_DataMap<int, gp_Vec>

Return
-------
None

Description
-----------
Sets map of vectors assigned with nodes or elements.
") SetVectors;
		void SetVectors(const bool IsElement, const NCollection_DataMap<int, gp_Vec> & Map);

		/****** MeshVS_VectorPrsBuilder::calculateArrow ******/
		/****** md5 signature: 8871dbb69cb833264d038ad5c5457f12 ******/
		%feature("compactdefaultargs") calculateArrow;
		%feature("autodoc", "
Parameters
----------
Points: NCollection_Array1<gp_Pnt>
Length: double
ArrowPart: double

Return
-------
double

Description
-----------
Calculates points of arrow presentation.
") calculateArrow;
		static double calculateArrow(NCollection_Array1<gp_Pnt> & Points, const double Length, const double ArrowPart);

};


%make_alias(MeshVS_VectorPrsBuilder)

%extend MeshVS_VectorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class MeshVS_HArray1OfSequenceOfInteger : public NCollection_Array1<TColStd_SequenceOfInteger>, public Standard_Transient {
  public:
    MeshVS_HArray1OfSequenceOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    MeshVS_HArray1OfSequenceOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TColStd_SequenceOfInteger>::value_type& theValue);
    MeshVS_HArray1OfSequenceOfInteger(const NCollection_Array1<TColStd_SequenceOfInteger>& theOther);
    const NCollection_Array1<TColStd_SequenceOfInteger>& Array1();
    NCollection_Array1<TColStd_SequenceOfInteger>& ChangeArray1();
};
%make_alias(MeshVS_HArray1OfSequenceOfInteger)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def MeshVS_Tool_CreateAspectFillArea3d(*args):
	return MeshVS_Tool.CreateAspectFillArea3d(*args)

@deprecated
def MeshVS_Tool_CreateAspectFillArea3d(*args):
	return MeshVS_Tool.CreateAspectFillArea3d(*args)

@deprecated
def MeshVS_Tool_CreateAspectLine3d(*args):
	return MeshVS_Tool.CreateAspectLine3d(*args)

@deprecated
def MeshVS_Tool_CreateAspectMarker3d(*args):
	return MeshVS_Tool.CreateAspectMarker3d(*args)

@deprecated
def MeshVS_Tool_CreateAspectText3d(*args):
	return MeshVS_Tool.CreateAspectText3d(*args)

@deprecated
def MeshVS_Tool_GetAverageNormal(*args):
	return MeshVS_Tool.GetAverageNormal(*args)

@deprecated
def MeshVS_Tool_GetNormal(*args):
	return MeshVS_Tool.GetNormal(*args)

@deprecated
def MeshVS_DataSource3D_CreatePrismTopology(*args):
	return MeshVS_DataSource3D.CreatePrismTopology(*args)

@deprecated
def MeshVS_DataSource3D_CreatePyramidTopology(*args):
	return MeshVS_DataSource3D.CreatePyramidTopology(*args)

@deprecated
def MeshVS_MeshPrsBuilder_AddVolumePrs(*args):
	return MeshVS_MeshPrsBuilder.AddVolumePrs(*args)

@deprecated
def MeshVS_MeshPrsBuilder_HowManyPrimitives(*args):
	return MeshVS_MeshPrsBuilder.HowManyPrimitives(*args)

@deprecated
def MeshVS_VectorPrsBuilder_calculateArrow(*args):
	return MeshVS_VectorPrsBuilder.calculateArrow(*args)

}
