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
%define MESHVSDOCSTRING
"MeshVS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_meshvs.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<MeshVS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<SelectMgr_module.hxx>
#include<Quantity_module.hxx>
#include<Select3D_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<SelectBasics_module.hxx>
#include<AIS_module.hxx>
#include<PrsMgr_module.hxx>
#include<Prs3d_module.hxx>
#include<Aspect_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import SelectMgr.i
%import Quantity.i
%import Select3D.i
%import gp.i
%import TColStd.i
%import Bnd.i
%import TCollection.i
%import Graphic3d.i
%import SelectBasics.i
%import AIS.i
%import PrsMgr.i
%import Prs3d.i
%import Aspect.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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

enum  {
	MeshVS_BP_Mesh = 5,
	MeshVS_BP_NodalColor = 10,
	MeshVS_BP_ElemColor = 15,
	MeshVS_BP_Text = 20,
	MeshVS_BP_Vector = 25,
	MeshVS_BP_User = 30,
	MeshVS_BP_Default = MeshVS_BP_User,
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

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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
};
/* end python proxy for enums */

/* handles */
%wrap_handle(MeshVS_CommonSensitiveEntity)
%wrap_handle(MeshVS_DataSource)
%wrap_handle(MeshVS_Drawer)
%wrap_handle(MeshVS_DummySensitiveEntity)
%wrap_handle(MeshVS_Mesh)
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
%wrap_handle(MeshVS_HArray1OfSequenceOfInteger)
/* end handles declaration */

/* templates */
%template(MeshVS_Array1OfSequenceOfInteger) NCollection_Array1<TColStd_SequenceOfInteger>;

%extend NCollection_Array1<TColStd_SequenceOfInteger> {
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
%template(MeshVS_DataMapOfColorMapOfInteger) NCollection_DataMap<Quantity_Color,TColStd_MapOfInteger,Quantity_ColorHasher>;
%template(MeshVS_DataMapOfHArray1OfSequenceOfInteger) NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfHArray1OfSequenceOfInteger::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerAsciiString) NCollection_DataMap<Standard_Integer,TCollection_AsciiString,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TCollection_AsciiString,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerAsciiString::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerBoolean) NCollection_DataMap<Standard_Integer,Standard_Boolean,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Standard_Boolean,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerBoolean::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerColor) NCollection_DataMap<Standard_Integer,Quantity_Color,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Quantity_Color,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerColor::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerMaterial) NCollection_DataMap<Standard_Integer,Graphic3d_MaterialAspect,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,Graphic3d_MaterialAspect,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerMaterial::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerMeshEntityOwner) NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_MeshEntityOwner>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_MeshEntityOwner>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerMeshEntityOwner::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerOwner) NCollection_DataMap<Standard_Integer,opencascade::handle<SelectMgr_EntityOwner>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<SelectMgr_EntityOwner>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerOwner::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerTwoColors) NCollection_DataMap<Standard_Integer,MeshVS_TwoColors,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,MeshVS_TwoColors,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerTwoColors::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfIntegerVector) NCollection_DataMap<Standard_Integer,gp_Vec,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,gp_Vec,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MeshVS_DataMapOfIntegerVector::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MeshVS_DataMapOfTwoColorsMapOfInteger) NCollection_DataMap<MeshVS_TwoColors,TColStd_MapOfInteger,MeshVS_TwoColorsHasher>;
%template(MeshVS_MapOfTwoNodes) NCollection_Map<MeshVS_TwoNodes,MeshVS_TwoNodesHasher>;
%template(MeshVS_PolyhedronVerts) NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>>;

%extend NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(MeshVS_PolyhedronVertsIter) NCollection_TListIterator<MeshVS_PolyhedronVerts>;
%template(MeshVS_SequenceOfPrsBuilder) NCollection_Sequence<opencascade::handle<MeshVS_PrsBuilder>>;
%template(MeshVS_TwoColorsHasher) NCollection_DefaultHasher<MeshVS_TwoColors>;
%template(MeshVS_TwoNodesHasher) NCollection_DefaultHasher<MeshVS_TwoNodes>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TColStd_SequenceOfInteger> MeshVS_Array1OfSequenceOfInteger;
typedef Standard_Integer MeshVS_BuilderPriority;
typedef Quantity_ColorHasher MeshVS_ColorHasher;
typedef NCollection_DataMap<Quantity_Color, TColStd_MapOfInteger, Quantity_ColorHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DataMap<Standard_Integer, TCollection_AsciiString, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
typedef NCollection_DataMap<Standard_Integer, Standard_Boolean, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
typedef NCollection_DataMap<Standard_Integer, Quantity_Color, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
typedef NCollection_DataMap<Standard_Integer, Graphic3d_MaterialAspect, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_MeshEntityOwner>, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<SelectMgr_EntityOwner>, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
typedef NCollection_DataMap<Standard_Integer, MeshVS_TwoColors, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
typedef NCollection_DataMap<Standard_Integer, gp_Vec, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
typedef NCollection_DataMap<MeshVS_TwoColors, TColStd_MapOfInteger, MeshVS_TwoColorsHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
typedef NCollection_DataMap<Quantity_Color, TColStd_MapOfInteger, Quantity_ColorHasher> MeshVS_DataMapOfColorMapOfInteger;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>, TColStd_MapIntegerHasher> MeshVS_DataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DataMap<Standard_Integer, TCollection_AsciiString, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerAsciiString;
typedef NCollection_DataMap<Standard_Integer, Standard_Boolean, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerBoolean;
typedef NCollection_DataMap<Standard_Integer, Quantity_Color, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerColor;
typedef NCollection_DataMap<Standard_Integer, Graphic3d_MaterialAspect, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerMaterial;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_MeshEntityOwner>, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<SelectMgr_EntityOwner>, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerOwner;
typedef NCollection_DataMap<Standard_Integer, MeshVS_TwoColors, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerTwoColors;
typedef NCollection_DataMap<Standard_Integer, gp_Vec, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerVector;
typedef NCollection_DataMap<MeshVS_TwoColors, TColStd_MapOfInteger, MeshVS_TwoColorsHasher> MeshVS_DataMapOfTwoColorsMapOfInteger;
typedef Standard_Integer MeshVS_DisplayModeFlags;
typedef NCollection_Map<MeshVS_TwoNodes, MeshVS_TwoNodesHasher>::Iterator MeshVS_MapIteratorOfMapOfTwoNodes;
typedef NCollection_Map<MeshVS_TwoNodes, MeshVS_TwoNodesHasher> MeshVS_MapOfTwoNodes;
typedef MeshVS_Mesh * MeshVS_MeshPtr;
typedef std::pair<Standard_Integer, Standard_Integer> MeshVS_NodePair;
typedef NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>> MeshVS_PolyhedronVerts;
typedef NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>>::Iterator MeshVS_PolyhedronVertsIter;
typedef NCollection_Sequence<opencascade::handle<MeshVS_PrsBuilder>> MeshVS_SequenceOfPrsBuilder;
typedef NCollection_DefaultHasher<MeshVS_TwoColors> MeshVS_TwoColorsHasher;
typedef NCollection_DefaultHasher<MeshVS_TwoNodes> MeshVS_TwoNodesHasher;
/* end typedefs declaration */

/**********************
* class MeshVS_Buffer *
**********************/
class MeshVS_Buffer {
	public:
		/****************** MeshVS_Buffer ******************/
		%feature("compactdefaultargs") MeshVS_Buffer;
		%feature("autodoc", "Constructor of the buffer of the requested size.

Parameters
----------
theSize: Standard_Size

Returns
-------
None
") MeshVS_Buffer;
		 MeshVS_Buffer(const Standard_Size theSize);

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
		/****************** MeshVS_CommonSensitiveEntity ******************/
		%feature("compactdefaultargs") MeshVS_CommonSensitiveEntity;
		%feature("autodoc", "Default constructor.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theParentMesh: MeshVS_Mesh
theSelMethod: MeshVS_MeshSelectionMethod

Returns
-------
None
") MeshVS_CommonSensitiveEntity;
		 MeshVS_CommonSensitiveEntity(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const opencascade::handle<MeshVS_Mesh> & theParentMesh, const MeshVS_MeshSelectionMethod theSelMethod);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the triangulation. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns bounding box of sub-entity with index theidx in sub-entity list.

Parameters
----------
theIdx: int

Returns
-------
Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns geometry center of sensitive entity index theidx along the given axis theaxis.

Parameters
----------
theIdx: int
theAxis: int

Returns
-------
float
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of a mesh.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Create a copy.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Number of elements.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the amount of sub-entities of the complex entity.

Returns
-------
int
") Size;
		virtual Standard_Integer Size();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps items with indexes theidx1 and theidx2.

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
		/****************** Get3DGeom ******************/
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "This method returns topology information about 3d-element returns false if element with id isn't 3d or because other troubles.

Parameters
----------
ID: int
Data: MeshVS_HArray1OfSequenceOfInteger

Returns
-------
NbNodes: int
") Get3DGeom;
		virtual Standard_Boolean Get3DGeom(const Standard_Integer ID, Standard_Integer &OutValue, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Data);

		/****************** GetAddr ******************/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "This method returns pointer which represents element or node data structure. this address will be saved in meshvs_meshentityowner, so that you can access to data structure fast by the method owner(). in the redefined method you can return null. id is the numerical identificator of node or element iselement indicates this id describe node ( if standard_false ) or element ( if standard_true ).

Parameters
----------
ID: int
IsElement: bool

Returns
-------
Standard_Address
") GetAddr;
		virtual Standard_Address GetAddr(const Standard_Integer ID, const Standard_Boolean IsElement);

		/****************** GetAllElements ******************/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "This method returns map of all elements the object consist of.

Returns
-------
TColStd_PackedMapOfInteger
") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements();

		/****************** GetAllGroups ******************/
		%feature("compactdefaultargs") GetAllGroups;
		%feature("autodoc", "This method returns map of all groups the object contains.

Parameters
----------
Ids: TColStd_PackedMapOfInteger

Returns
-------
None
") GetAllGroups;
		virtual void GetAllGroups(TColStd_PackedMapOfInteger & Ids);

		/****************** GetAllNodes ******************/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "This method returns map of all nodes the object consist of.

Returns
-------
TColStd_PackedMapOfInteger
") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes();

		/****************** GetBoundingBox ******************/
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "Returns the bounding box of the whole mesh. it is used in advanced selection mode to define roughly the sensitive area of the mesh. it can be redefined to get access to a box computed in advance.

Returns
-------
Bnd_Box
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox();

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "Returns maps of entities (nodes and elements) detected by mouse click at the point (x,y) on the current view plane, with the tolerance atol. dmin - is out argument should return actual detection tolerance. returns true if something is detected. it should be redefined if the advanced mesh selection is activated. default implementation returns false.

Parameters
----------
Prs: MeshVS_Mesh
X: float
Y: float
aTol: float
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Returns
-------
DMin: float
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements, Standard_Real &OutValue);

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "Returns maps of entities (nodes and elements) detected by mouse selection with rectangular box (xmin, ymin, xmax, ymax) on the current veiw plane, with the tolerance atol. returns true if something is detected. it should be redefined if the advanced mesh selection is activated. default implementation returns false.

Parameters
----------
Prs: MeshVS_Mesh
XMin: float
YMin: float
XMax: float
YMax: float
aTol: float
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Returns
-------
bool
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "Returns maps of entities (nodes and elements) detected by mouse selection with the polyline <polyline> on the current veiw plane, with the tolerance atol. returns true if something is detected. it should be redefined if the advanced mesh selection is activated. default implementation returns false.

Parameters
----------
Prs: MeshVS_Mesh
Polyline: TColgp_Array1OfPnt2d
aBox: Bnd_Box2d
aTol: float
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Returns
-------
bool
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const TColgp_Array1OfPnt2d & Polyline, const Bnd_Box2d & aBox, const Standard_Real aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "Filter out the maps of mesh entities so as to keep only the entities that are allowed to be selected according to the current context. returns true if any of the maps has been changed. it should be redefined if the advanced mesh selection is activated. default implementation returns false.

Parameters
----------
Prs: MeshVS_Mesh
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Returns
-------
bool
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetGeom ******************/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "Returns geometry information about node or element id is the numerical identificator of node or element iselement indicates this id describe node ( if standard_false ) or element ( if standard_true ) coords is an array of co-ordinates of node(s). for node it is only 3 numbers: x, y, z in the strict order for element it is 3*n numbers, where n is number of this element vertices the order is strict also: x1, y1, z1, x2,...., where xi, yi, zi are co-ordinates of vertices nbnodes is number of nodes. it is recommended this parameter to be set to 1 for node. type is type of node or element (from enumeration). it is recommended this parameter to be set to meshvs_et_node for node.

Parameters
----------
ID: int
IsElement: bool
Coords: TColStd_Array1OfReal
Type: MeshVS_EntityType

Returns
-------
NbNodes: int
") GetGeom;
		virtual Standard_Boolean GetGeom(const Standard_Integer ID, const Standard_Boolean IsElement, TColStd_Array1OfReal & Coords, Standard_Integer &OutValue, MeshVS_EntityType & Type);

		/****************** GetGeomType ******************/
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "This method is similar to getgeom, but returns only element or node type.

Parameters
----------
ID: int
IsElement: bool
Type: MeshVS_EntityType

Returns
-------
bool
") GetGeomType;
		virtual Standard_Boolean GetGeomType(const Standard_Integer ID, const Standard_Boolean IsElement, MeshVS_EntityType & Type);

		/****************** GetGroup ******************/
		%feature("compactdefaultargs") GetGroup;
		%feature("autodoc", "This method returns map of all group elements.

Parameters
----------
Id: int
Type: MeshVS_EntityType
Ids: TColStd_PackedMapOfInteger

Returns
-------
bool
") GetGroup;
		virtual Standard_Boolean GetGroup(const Standard_Integer Id, MeshVS_EntityType & Type, TColStd_PackedMapOfInteger & Ids);

		/****************** GetGroupAddr ******************/
		%feature("compactdefaultargs") GetGroupAddr;
		%feature("autodoc", "This method returns pointer which represents group data structure. this address will be saved in meshvs_meshowner, so that you can access to data structure fast by the method owner(). in the redefined method you can return null. id is the numerical identificator of group.

Parameters
----------
ID: int

Returns
-------
Standard_Address
") GetGroupAddr;
		virtual Standard_Address GetGroupAddr(const Standard_Integer ID);

		/****************** GetNodeNormal ******************/
		%feature("compactdefaultargs") GetNodeNormal;
		%feature("autodoc", "This method return normal of node ranknode of face id, which is using for smooth shading presentation. returns false if normal isn't defined.

Parameters
----------
ranknode: int
ElementId: int

Returns
-------
nx: float
ny: float
nz: float
") GetNodeNormal;
		virtual Standard_Boolean GetNodeNormal(const Standard_Integer ranknode, const Standard_Integer ElementId, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetNodesByElement ******************/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "This method returns information about nodes this element consist of. id is the numerical identificator of element. nodeids is the output array of nodes ids in correct order, the same as coordinates returned by getgeom(). nbnodes is number of nodes (number of items set in nodeids). returns false if element does not exist.

Parameters
----------
ID: int
NodeIDs: TColStd_Array1OfInteger

Returns
-------
NbNodes: int
") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement(const Standard_Integer ID, TColStd_Array1OfInteger & NodeIDs, Standard_Integer &OutValue);

		/****************** GetNormal ******************/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "This method calculates normal of face, which is using for correct reflection presentation. there is default method, for advance reflection this method can be redefined. id is the numerical identificator of only element! max is maximal number of nodes an element can consist of nx, ny, nz are values whose represent co-ordinates of normal (will be returned) in the redefined method you can return normal with length more then 1, but in this case the appearance of element will be more bright than usual. for ordinary brightness you must return normal with length 1.

Parameters
----------
Id: int
Max: int

Returns
-------
nx: float
ny: float
nz: float
") GetNormal;
		virtual Standard_Boolean GetNormal(const Standard_Integer Id, const Standard_Integer Max, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetNormalsByElement ******************/
		%feature("compactdefaultargs") GetNormalsByElement;
		%feature("autodoc", "This method puts components of normal vectors at each node of a mesh face (at each face of a mesh volume) into the output array. returns false if some problem was detected during calculation of normals. id is an identifier of the mesh element. isnodal, when true, means that normals at mesh element nodes are needed. if nodal normals are not available, or isnodal is false, or the mesh element is a volume, then the output array contents depend on the element type: face: a normal calculated by getnormal() is duplicated for each node of the face; volume: normals to all faces of the volume are computed (not for each node!). maxnodes is maximal number of nodes an element can consist of. normals contains the result.

Parameters
----------
Id: int
IsNodal: bool
MaxNodes: int
Normals: TColStd_HArray1OfReal

Returns
-------
bool
") GetNormalsByElement;
		virtual Standard_Boolean GetNormalsByElement(const Standard_Integer Id, const Standard_Boolean IsNodal, const Standard_Integer MaxNodes, opencascade::handle<TColStd_HArray1OfReal> & Normals);

		/****************** IsAdvancedSelectionEnabled ******************/
		%feature("compactdefaultargs") IsAdvancedSelectionEnabled;
		%feature("autodoc", "Returns true if advanced mesh selection is enabled. default implementation returns false. it should be redefined to return true for advanced mesh selection activation.

Returns
-------
bool
") IsAdvancedSelectionEnabled;
		virtual Standard_Boolean IsAdvancedSelectionEnabled();

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
		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "This method copies other drawer contents to this.

Parameters
----------
aDrawer: MeshVS_Drawer

Returns
-------
None
") Assign;
		virtual void Assign(const opencascade::handle<MeshVS_Drawer> & aDrawer);

		/****************** GetAsciiString ******************/
		%feature("compactdefaultargs") GetAsciiString;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: TCollection_AsciiString

Returns
-------
bool
") GetAsciiString;
		Standard_Boolean GetAsciiString(const Standard_Integer Key, TCollection_AsciiString & Value);

		/****************** GetBoolean ******************/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
Value: bool
") GetBoolean;
		Standard_Boolean GetBoolean(const Standard_Integer Key, Standard_Boolean &OutValue);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: Quantity_Color

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const Standard_Integer Key, Quantity_Color & Value);

		/****************** GetDouble ******************/
		%feature("compactdefaultargs") GetDouble;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
Value: float
") GetDouble;
		Standard_Boolean GetDouble(const Standard_Integer Key, Standard_Real &OutValue);

		/****************** GetInteger ******************/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
Value: int
") GetInteger;
		Standard_Boolean GetInteger(const Standard_Integer Key, Standard_Integer &OutValue);

		/****************** GetMaterial ******************/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: Graphic3d_MaterialAspect

Returns
-------
bool
") GetMaterial;
		Standard_Boolean GetMaterial(const Standard_Integer Key, Graphic3d_MaterialAspect & Value);

		/****************** RemoveAsciiString ******************/
		%feature("compactdefaultargs") RemoveAsciiString;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
bool
") RemoveAsciiString;
		Standard_Boolean RemoveAsciiString(const Standard_Integer Key);

		/****************** RemoveBoolean ******************/
		%feature("compactdefaultargs") RemoveBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
bool
") RemoveBoolean;
		Standard_Boolean RemoveBoolean(const Standard_Integer Key);

		/****************** RemoveColor ******************/
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
bool
") RemoveColor;
		Standard_Boolean RemoveColor(const Standard_Integer Key);

		/****************** RemoveDouble ******************/
		%feature("compactdefaultargs") RemoveDouble;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
bool
") RemoveDouble;
		Standard_Boolean RemoveDouble(const Standard_Integer Key);

		/****************** RemoveInteger ******************/
		%feature("compactdefaultargs") RemoveInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
bool
") RemoveInteger;
		Standard_Boolean RemoveInteger(const Standard_Integer Key);

		/****************** RemoveMaterial ******************/
		%feature("compactdefaultargs") RemoveMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int

Returns
-------
bool
") RemoveMaterial;
		Standard_Boolean RemoveMaterial(const Standard_Integer Key);

		/****************** SetAsciiString ******************/
		%feature("compactdefaultargs") SetAsciiString;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: TCollection_AsciiString

Returns
-------
None
") SetAsciiString;
		void SetAsciiString(const Standard_Integer Key, const TCollection_AsciiString & Value);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: bool

Returns
-------
None
") SetBoolean;
		void SetBoolean(const Standard_Integer Key, const Standard_Boolean Value);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Standard_Integer Key, const Quantity_Color & Value);

		/****************** SetDouble ******************/
		%feature("compactdefaultargs") SetDouble;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: float

Returns
-------
None
") SetDouble;
		void SetDouble(const Standard_Integer Key, const Standard_Real Value);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: int

Returns
-------
None
") SetInteger;
		void SetInteger(const Standard_Integer Key, const Standard_Integer Value);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
Key: int
Value: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		void SetMaterial(const Standard_Integer Key, const Graphic3d_MaterialAspect & Value);

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
		/****************** MeshVS_DummySensitiveEntity ******************/
		%feature("compactdefaultargs") MeshVS_DummySensitiveEntity;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Returns
-------
None
") MeshVS_DummySensitiveEntity;
		 MeshVS_DummySensitiveEntity(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BVH;
		virtual void BVH();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "No available documentation.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** HasInitLocation ******************/
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasInitLocation;
		virtual Standard_Boolean HasInitLocation();

		/****************** InvInitLocation ******************/
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_GTrsf
") InvInitLocation;
		virtual gp_GTrsf InvInitLocation();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

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
		/****************** MeshVS_Mesh ******************/
		%feature("compactdefaultargs") MeshVS_Mesh;
		%feature("autodoc", "Constructor. theisallowoverlapped is standard_true, if it is allowed to draw edges overlapped with beams its value is stored in drawer.

Parameters
----------
theIsAllowOverlapped: bool,optional
	default value is Standard_False

Returns
-------
None
") MeshVS_Mesh;
		 MeshVS_Mesh(const Standard_Boolean theIsAllowOverlapped = Standard_False);

		/****************** AcceptDisplayMode ******************/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true for supported display modes basing on a list of defined builders.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** AddBuilder ******************/
		%feature("compactdefaultargs") AddBuilder;
		%feature("autodoc", "Adds builder to tale of sequence. prsbuilder is builder to be added if treatashilighter is true, meshvs_mesh will use this builder to create presentation of hilighted and selected owners. only one builder can be hilighter, so that if you call this method with treatashilighter = standard_true some times, only last builder will be hilighter warning: as minimum one builder must be added as hilighter, otherwise selection cannot be computed.

Parameters
----------
Builder: MeshVS_PrsBuilder
TreatAsHilighter: bool,optional
	default value is Standard_False

Returns
-------
None
") AddBuilder;
		void AddBuilder(const opencascade::handle<MeshVS_PrsBuilder> & Builder, const Standard_Boolean TreatAsHilighter = Standard_False);

		/****************** ClearSelected ******************/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Clears internal selection presentation.

Returns
-------
None
") ClearSelected;
		virtual void ClearSelected();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Computes presentation using builders added to sequence. each builder computes own part of mesh presentation according to its type.

Parameters
----------
PM: PrsMgr_PresentationManager3d
Prs: Prs3d_Presentation
DisplayMode: int

Returns
-------
None
") Compute;
		virtual void Compute(const opencascade::handle<PrsMgr_PresentationManager3d> & PM, const opencascade::handle<Prs3d_Presentation> & Prs, const Standard_Integer DisplayMode);

		/****************** ComputeSelection ******************/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "Computes selection according to selectmode.

Parameters
----------
Sel: SelectMgr_Selection
SelectMode: int

Returns
-------
None
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & Sel, const Standard_Integer SelectMode);

		/****************** FindBuilder ******************/
		%feature("compactdefaultargs") FindBuilder;
		%feature("autodoc", "Finds builder by its type the string represents.

Parameters
----------
TypeString: char *

Returns
-------
opencascade::handle<MeshVS_PrsBuilder>
") FindBuilder;
		opencascade::handle<MeshVS_PrsBuilder> FindBuilder(const char * TypeString);

		/****************** GetBuilder ******************/
		%feature("compactdefaultargs") GetBuilder;
		%feature("autodoc", "Returns builder by its index in sequence.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MeshVS_PrsBuilder>
") GetBuilder;
		opencascade::handle<MeshVS_PrsBuilder> GetBuilder(const Standard_Integer Index);

		/****************** GetBuilderById ******************/
		%feature("compactdefaultargs") GetBuilderById;
		%feature("autodoc", "Returns builder by its id.

Parameters
----------
Id: int

Returns
-------
opencascade::handle<MeshVS_PrsBuilder>
") GetBuilderById;
		opencascade::handle<MeshVS_PrsBuilder> GetBuilderById(const Standard_Integer Id);

		/****************** GetBuildersCount ******************/
		%feature("compactdefaultargs") GetBuildersCount;
		%feature("autodoc", "How many builders there are in sequence.

Returns
-------
int
") GetBuildersCount;
		Standard_Integer GetBuildersCount();

		/****************** GetDataSource ******************/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Returns default builders' data source.

Returns
-------
opencascade::handle<MeshVS_DataSource>
") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource();

		/****************** GetDrawer ******************/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "Returns default builders' drawer.

Returns
-------
opencascade::handle<MeshVS_Drawer>
") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer();

		/****************** GetFreeId ******************/
		%feature("compactdefaultargs") GetFreeId;
		%feature("autodoc", "Returns the smallest positive id, not occupied by any builder. this method using when builder is created with id = -1.

Returns
-------
int
") GetFreeId;
		Standard_Integer GetFreeId();

		/****************** GetHiddenElems ******************/
		%feature("compactdefaultargs") GetHiddenElems;
		%feature("autodoc", "Returns map of hidden elements (may be null handle).

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetHiddenElems;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenElems();

		/****************** GetHiddenNodes ******************/
		%feature("compactdefaultargs") GetHiddenNodes;
		%feature("autodoc", "Returns map of hidden nodes (may be null handle).

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetHiddenNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenNodes();

		/****************** GetHilighter ******************/
		%feature("compactdefaultargs") GetHilighter;
		%feature("autodoc", "Returns hilighter.

Returns
-------
opencascade::handle<MeshVS_PrsBuilder>
") GetHilighter;
		opencascade::handle<MeshVS_PrsBuilder> GetHilighter();

		/****************** GetMeshSelMethod ******************/
		%feature("compactdefaultargs") GetMeshSelMethod;
		%feature("autodoc", "Returns set mesh selection method (see meshvs.cdl).

Returns
-------
MeshVS_MeshSelectionMethod
") GetMeshSelMethod;
		MeshVS_MeshSelectionMethod GetMeshSelMethod();

		/****************** GetOwnerMaps ******************/
		%feature("compactdefaultargs") GetOwnerMaps;
		%feature("autodoc", "Returns map of owners.

Parameters
----------
IsElement: bool

Returns
-------
MeshVS_DataMapOfIntegerOwner
") GetOwnerMaps;
		const MeshVS_DataMapOfIntegerOwner & GetOwnerMaps(const Standard_Boolean IsElement);

		/****************** GetSelectableNodes ******************/
		%feature("compactdefaultargs") GetSelectableNodes;
		%feature("autodoc", "Returns map of selectable elements (may be null handle).

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetSelectableNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectableNodes();

		/****************** HilightOwnerWithColor ******************/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "Draw hilighted owner presentation.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theColor: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Returns
-------
None
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theColor, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "Draw selected owners presentation.

Parameters
----------
PM: PrsMgr_PresentationManager3d
Owners: SelectMgr_SequenceOfOwner

Returns
-------
None
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager3d> & PM, const SelectMgr_SequenceOfOwner & Owners);

		/****************** IsHiddenElem ******************/
		%feature("compactdefaultargs") IsHiddenElem;
		%feature("autodoc", "Returns true if specified element is hidden by default no elements are hidden.

Parameters
----------
ID: int

Returns
-------
bool
") IsHiddenElem;
		Standard_Boolean IsHiddenElem(const Standard_Integer ID);

		/****************** IsHiddenNode ******************/
		%feature("compactdefaultargs") IsHiddenNode;
		%feature("autodoc", "Returns true if specified node is hidden. by default all nodes are hidden.

Parameters
----------
ID: int

Returns
-------
bool
") IsHiddenNode;
		Standard_Boolean IsHiddenNode(const Standard_Integer ID);

		/****************** IsSelectableElem ******************/
		%feature("compactdefaultargs") IsSelectableElem;
		%feature("autodoc", "Returns true if specified element is not hidden.

Parameters
----------
ID: int

Returns
-------
bool
") IsSelectableElem;
		Standard_Boolean IsSelectableElem(const Standard_Integer ID);

		/****************** IsSelectableNode ******************/
		%feature("compactdefaultargs") IsSelectableNode;
		%feature("autodoc", "Returns true if specified node is specified as selectable.

Parameters
----------
ID: int

Returns
-------
bool
") IsSelectableNode;
		Standard_Boolean IsSelectableNode(const Standard_Integer ID);

		/****************** IsWholeMeshOwner ******************/
		%feature("compactdefaultargs") IsWholeMeshOwner;
		%feature("autodoc", "Returns true if the given owner represents a whole mesh.

Parameters
----------
theOwner: SelectMgr_EntityOwner

Returns
-------
bool
") IsWholeMeshOwner;
		virtual Standard_Boolean IsWholeMeshOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** RemoveBuilder ******************/
		%feature("compactdefaultargs") RemoveBuilder;
		%feature("autodoc", "Removes builder from sequence. if it is hilighter, hilighter will be null ( don't remember to set it to other after!!! ).

Parameters
----------
Index: int

Returns
-------
None
") RemoveBuilder;
		void RemoveBuilder(const Standard_Integer Index);

		/****************** RemoveBuilderById ******************/
		%feature("compactdefaultargs") RemoveBuilderById;
		%feature("autodoc", "Removes builder with identificator id.

Parameters
----------
Id: int

Returns
-------
None
") RemoveBuilderById;
		void RemoveBuilderById(const Standard_Integer Id);

		/****************** SetDataSource ******************/
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "Sets default builders' data source.

Parameters
----------
aDataSource: MeshVS_DataSource

Returns
-------
None
") SetDataSource;
		void SetDataSource(const opencascade::handle<MeshVS_DataSource> & aDataSource);

		/****************** SetDrawer ******************/
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "Sets default builders' drawer.

Parameters
----------
aDrawer: MeshVS_Drawer

Returns
-------
None
") SetDrawer;
		void SetDrawer(const opencascade::handle<MeshVS_Drawer> & aDrawer);

		/****************** SetHiddenElems ******************/
		%feature("compactdefaultargs") SetHiddenElems;
		%feature("autodoc", "Sets map of hidden elements.

Parameters
----------
Ids: TColStd_HPackedMapOfInteger

Returns
-------
None
") SetHiddenElems;
		void SetHiddenElems(const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****************** SetHiddenNodes ******************/
		%feature("compactdefaultargs") SetHiddenNodes;
		%feature("autodoc", "Sets map of hidden nodes, which shall not be displayed individually. if nodes shared by some elements shall not be drawn, they should be included into that map.

Parameters
----------
Ids: TColStd_HPackedMapOfInteger

Returns
-------
None
") SetHiddenNodes;
		void SetHiddenNodes(const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****************** SetHilighter ******************/
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "Changes hilighter ( see above ).

Parameters
----------
Builder: MeshVS_PrsBuilder

Returns
-------
None
") SetHilighter;
		void SetHilighter(const opencascade::handle<MeshVS_PrsBuilder> & Builder);

		/****************** SetHilighter ******************/
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "Sets builder with sequence index 'index' as hilighter.

Parameters
----------
Index: int

Returns
-------
bool
") SetHilighter;
		Standard_Boolean SetHilighter(const Standard_Integer Index);

		/****************** SetHilighterById ******************/
		%feature("compactdefaultargs") SetHilighterById;
		%feature("autodoc", "Sets builder with identificator 'id' as hilighter.

Parameters
----------
Id: int

Returns
-------
bool
") SetHilighterById;
		Standard_Boolean SetHilighterById(const Standard_Integer Id);

		/****************** SetMeshSelMethod ******************/
		%feature("compactdefaultargs") SetMeshSelMethod;
		%feature("autodoc", "Sets mesh selection method (see meshvs.cdl).

Parameters
----------
M: MeshVS_MeshSelectionMethod

Returns
-------
None
") SetMeshSelMethod;
		void SetMeshSelMethod(const MeshVS_MeshSelectionMethod M);

		/****************** SetSelectableNodes ******************/
		%feature("compactdefaultargs") SetSelectableNodes;
		%feature("autodoc", "Sets map of selectable nodes.

Parameters
----------
Ids: TColStd_HPackedMapOfInteger

Returns
-------
None
") SetSelectableNodes;
		void SetSelectableNodes(const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****************** UpdateSelectableNodes ******************/
		%feature("compactdefaultargs") UpdateSelectableNodes;
		%feature("autodoc", "Automatically computes selectable nodes; the node is considered as being selectable if it is either not hidden, or is hidden but referred by at least one non-hidden element. thus all nodes that are visible (either individually, or as ends or corners of elements) are selectable by default.

Returns
-------
None
") UpdateSelectableNodes;
		void UpdateSelectableNodes();

};


%make_alias(MeshVS_Mesh)

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
		/****************** MeshVS_MeshEntityOwner ******************/
		%feature("compactdefaultargs") MeshVS_MeshEntityOwner;
		%feature("autodoc", "No available documentation.

Parameters
----------
SelObj: SelectMgr_SOPtr
ID: int
MeshEntity: Standard_Address
Type: MeshVS_EntityType
Priority: int,optional
	default value is 0
IsGroup: bool,optional
	default value is Standard_False

Returns
-------
None
") MeshVS_MeshEntityOwner;
		 MeshVS_MeshEntityOwner(const SelectMgr_SOPtr & SelObj, const Standard_Integer ID, const Standard_Address MeshEntity, const MeshVS_EntityType & Type, const Standard_Integer Priority = 0, const Standard_Boolean IsGroup = Standard_False);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int,optional
	default value is 0

Returns
-------
None
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & PM, const Standard_Integer Mode = 0);

		/****************** HilightWithColor ******************/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "Hilights owner with the certain color.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theStyle: Prs3d_Drawer
theMode: int,optional
	default value is 0

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns id of element or node data structure.

Returns
-------
int
") ID;
		Standard_Integer ID();

		/****************** IsGroup ******************/
		%feature("compactdefaultargs") IsGroup;
		%feature("autodoc", "Returns true if owner represents group of nodes or elements.

Returns
-------
bool
") IsGroup;
		Standard_Boolean IsGroup();

		/****************** IsHilighted ******************/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "Returns true if owner is hilighted.

Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int,optional
	default value is 0

Returns
-------
bool
") IsHilighted;
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & PM, const Standard_Integer Mode = 0);

		/****************** Owner ******************/
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "Returns an address of element or node data structure.

Returns
-------
Standard_Address
") Owner;
		Standard_Address Owner();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns type of element or node data structure.

Returns
-------
MeshVS_EntityType
") Type;
		MeshVS_EntityType Type();

		/****************** Unhilight ******************/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "Strip hilight of owner.

Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int,optional
	default value is 0

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & PM, const Standard_Integer Mode = 0);

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
		/****************** MeshVS_MeshOwner ******************/
		%feature("compactdefaultargs") MeshVS_MeshOwner;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSelObj: SelectMgr_SOPtr
theDS: MeshVS_DataSource
thePriority: int,optional
	default value is 0

Returns
-------
None
") MeshVS_MeshOwner;
		 MeshVS_MeshOwner(const SelectMgr_SOPtr & theSelObj, const opencascade::handle<MeshVS_DataSource> & theDS, const Standard_Integer thePriority = 0);

		/****************** AddSelectedEntities ******************/
		%feature("compactdefaultargs") AddSelectedEntities;
		%feature("autodoc", "Saves ids of selected mesh entities.

Parameters
----------
Nodes: TColStd_HPackedMapOfInteger
Elems: TColStd_HPackedMapOfInteger

Returns
-------
None
") AddSelectedEntities;
		virtual void AddSelectedEntities(const opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, const opencascade::handle<TColStd_HPackedMapOfInteger> & Elems);

		/****************** ClearSelectedEntities ******************/
		%feature("compactdefaultargs") ClearSelectedEntities;
		%feature("autodoc", "Clears ids of selected mesh entities.

Returns
-------
None
") ClearSelectedEntities;
		virtual void ClearSelectedEntities();

		/****************** GetDataSource ******************/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MeshVS_DataSource>
") GetDataSource;
		const opencascade::handle<MeshVS_DataSource> & GetDataSource();

		/****************** GetDetectedElements ******************/
		%feature("compactdefaultargs") GetDetectedElements;
		%feature("autodoc", "Returns ids of hilighted mesh elements.

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetDetectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedElements();

		/****************** GetDetectedNodes ******************/
		%feature("compactdefaultargs") GetDetectedNodes;
		%feature("autodoc", "Returns ids of hilighted mesh nodes.

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetDetectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedNodes();

		/****************** GetSelectedElements ******************/
		%feature("compactdefaultargs") GetSelectedElements;
		%feature("autodoc", "Returns ids of selected mesh elements.

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetSelectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedElements();

		/****************** GetSelectedNodes ******************/
		%feature("compactdefaultargs") GetSelectedNodes;
		%feature("autodoc", "Returns ids of selected mesh nodes.

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") GetSelectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedNodes();

		/****************** HilightWithColor ******************/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePM: PrsMgr_PresentationManager3d
theColor: Prs3d_Drawer
theMode: int,optional
	default value is 0

Returns
-------
None
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager3d> & thePM, const opencascade::handle<Prs3d_Drawer> & theColor, const Standard_Integer theMode = 0);

		/****************** IsForcedHilight ******************/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight();

		/****************** SetDetectedEntities ******************/
		%feature("compactdefaultargs") SetDetectedEntities;
		%feature("autodoc", "Saves ids of hilighted mesh entities.

Parameters
----------
Nodes: TColStd_HPackedMapOfInteger
Elems: TColStd_HPackedMapOfInteger

Returns
-------
None
") SetDetectedEntities;
		void SetDetectedEntities(const opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, const opencascade::handle<TColStd_HPackedMapOfInteger> & Elems);

		/****************** Unhilight ******************/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "No available documentation.

Parameters
----------
PM: PrsMgr_PresentationManager
Mode: int,optional
	default value is 0

Returns
-------
None
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & PM, const Standard_Integer Mode = 0);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds presentation of certain type of data. prs is presentation object which this method constructs. ids is set of numeric identificators forming object appearance. idstoexclude is set of ids to exclude from processing. if some entity has been excluded, it is not processed by other builders. iselement indicates, ids is identificators of nodes or elements. displaymode is numeric constant describing display mode (see meshvs_displaymodeflags.hxx).

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Returns
-------
None
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** CustomBuild ******************/
		%feature("compactdefaultargs") CustomBuild;
		%feature("autodoc", "This method is called to build presentation of custom elements (they have meshvs_et_0d type). ids is set of numeric identificators of elements for custom building. idstoexclude is set of ids to exclude from processing. if some entity has been excluded, it is not processed by other builders. displaymode is numeric constant describing display mode (see meshvs_displaymodeflags.hxx).

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
DisplayMode: int

Returns
-------
None
") CustomBuild;
		virtual void CustomBuild(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Integer DisplayMode);

		/****************** CustomSensitiveEntity ******************/
		%feature("compactdefaultargs") CustomSensitiveEntity;
		%feature("autodoc", "This method is called to build sensitive of custom elements ( they have meshvs_et_0d type ).

Parameters
----------
Owner: SelectMgr_EntityOwner
SelectMode: int

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") CustomSensitiveEntity;
		virtual opencascade::handle<Select3D_SensitiveEntity> CustomSensitiveEntity(const opencascade::handle<SelectMgr_EntityOwner> & Owner, const Standard_Integer SelectMode);

		/****************** GetDataSource ******************/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Returns custom data source or default ( from meshvs_mesh ) if custom is null.

Returns
-------
opencascade::handle<MeshVS_DataSource>
") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource();

		/****************** GetDrawer ******************/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "Returns custom drawer or default ( from meshvs_mesh ) if custom is null.

Returns
-------
opencascade::handle<MeshVS_Drawer>
") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer();

		/****************** GetFlags ******************/
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "Returns flags, assigned with builder during creation.

Returns
-------
int
") GetFlags;
		Standard_Integer GetFlags();

		/****************** GetId ******************/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Returns builder id.

Returns
-------
int
") GetId;
		Standard_Integer GetId();

		/****************** GetPresentationManager ******************/
		%feature("compactdefaultargs") GetPresentationManager;
		%feature("autodoc", "Get presentation manager of builder.

Returns
-------
opencascade::handle<PrsMgr_PresentationManager3d>
") GetPresentationManager;
		opencascade::handle<PrsMgr_PresentationManager3d> GetPresentationManager();

		/****************** GetPriority ******************/
		%feature("compactdefaultargs") GetPriority;
		%feature("autodoc", "Returns priority; as priority bigger, as soon builder will be called.

Returns
-------
int
") GetPriority;
		Standard_Integer GetPriority();

		/****************** IsExcludingOn ******************/
		%feature("compactdefaultargs") IsExcludingOn;
		%feature("autodoc", "Read excluding state.

Returns
-------
bool
") IsExcludingOn;
		Standard_Boolean IsExcludingOn();

		/****************** SetDataSource ******************/
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "Change custom data source.

Parameters
----------
newDS: MeshVS_DataSource

Returns
-------
None
") SetDataSource;
		void SetDataSource(const opencascade::handle<MeshVS_DataSource> & newDS);

		/****************** SetDrawer ******************/
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "Change custom drawer.

Parameters
----------
newDr: MeshVS_Drawer

Returns
-------
None
") SetDrawer;
		void SetDrawer(const opencascade::handle<MeshVS_Drawer> & newDr);

		/****************** SetExcluding ******************/
		%feature("compactdefaultargs") SetExcluding;
		%feature("autodoc", "Set excluding state. if it is standard_true, the nodes or elements, processed by current builder will be noted and next builder won't process its.

Parameters
----------
state: bool

Returns
-------
None
") SetExcluding;
		void SetExcluding(const Standard_Boolean state);

		/****************** SetPresentationManager ******************/
		%feature("compactdefaultargs") SetPresentationManager;
		%feature("autodoc", "Set presentation manager for builder.

Parameters
----------
thePrsMgr: PrsMgr_PresentationManager3d

Returns
-------
None
") SetPresentationManager;
		void SetPresentationManager(const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr);

		/****************** TestFlags ******************/
		%feature("compactdefaultargs") TestFlags;
		%feature("autodoc", "Test whether display mode has flags assigned with this builder. this method has default implementation and can be redefined for advance behavior returns standard_true only if display mode is appropriate for this builder.

Parameters
----------
DisplayMode: int

Returns
-------
bool
") TestFlags;
		virtual Standard_Boolean TestFlags(const Standard_Integer DisplayMode);

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
		/****************** MeshVS_SensitiveFace ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOwner: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt
theSensType: Select3D_TypeOfSensitivity,optional
	default value is Select3D_TOS_INTERIOR

Returns
-------
None
") MeshVS_SensitiveFace;
		 MeshVS_SensitiveFace(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const TColgp_Array1OfPnt & thePoints, const Select3D_TypeOfSensitivity theSensType = Select3D_TOS_INTERIOR);

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
		/****************** MeshVS_SensitiveMesh ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveMesh;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theMode: int,optional
	default value is 0

Returns
-------
None
") MeshVS_SensitiveMesh;
		 MeshVS_SensitiveMesh(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Integer theMode = 0);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of mesh.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of mesh.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** GetMode ******************/
		%feature("compactdefaultargs") GetMode;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMode;
		Standard_Integer GetMode();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether sensitive overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of mesh nodes.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

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
		/****************** MeshVS_SensitivePolyhedron ******************/
		%feature("compactdefaultargs") MeshVS_SensitivePolyhedron;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theNodes: TColgp_Array1OfPnt
theTopo: MeshVS_HArray1OfSequenceOfInteger

Returns
-------
None
") MeshVS_SensitivePolyhedron;
		 MeshVS_SensitivePolyhedron(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const TColgp_Array1OfPnt & theNodes, const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & theTopo);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "No available documentation.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of nodes of polyhedron.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

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
		/****************** MeshVS_SensitiveQuad ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveQuad;
		%feature("autodoc", "Creates a new instance and initializes quadrangle vertices with the given points.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theQuadVerts: TColgp_Array1OfPnt

Returns
-------
None
") MeshVS_SensitiveQuad;
		 MeshVS_SensitiveQuad(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const TColgp_Array1OfPnt & theQuadVerts);

		/****************** MeshVS_SensitiveQuad ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveQuad;
		%feature("autodoc", "Creates a new instance and initializes quadrangle vertices with the given points.

Parameters
----------
theOwner: SelectMgr_EntityOwner
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePnt3: gp_Pnt
thePnt4: gp_Pnt

Returns
-------
None
") MeshVS_SensitiveQuad;
		 MeshVS_SensitiveQuad(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, const gp_Pnt & thePnt4);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns coordinates of the box.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the box.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Returns a copy of this sensitive quadrangle.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the box overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of sub-entities in sensitive.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

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
		/****************** MeshVS_SensitiveSegment ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOwner: SelectMgr_EntityOwner
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Returns
-------
None
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
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the node pair, in the range [1, theupperbound] @param thenodepair the node pair which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theNodePair: MeshVS_NodePair
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const MeshVS_NodePair & theNodePair, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePair1: MeshVS_NodePair
thePair2: MeshVS_NodePair

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const MeshVS_NodePair & thePair1, const MeshVS_NodePair & thePair2);

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
		/****************** CreateAspectFillArea3d ******************/
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "Creates fill area aspect with values from drawer according to keys from drawerattribute.

Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Graphic3d_AspectFillArea3d>
") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectFillArea3d ******************/
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "Creates fill aspect with values from drawer according to keys from drawerattribute and specific material aspect.

Parameters
----------
theDr: MeshVS_Drawer
Mat: Graphic3d_MaterialAspect
UseDefaults: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Graphic3d_AspectFillArea3d>
") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Graphic3d_MaterialAspect & Mat, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectLine3d ******************/
		%feature("compactdefaultargs") CreateAspectLine3d;
		%feature("autodoc", "Creates line aspect with values from drawer according to keys from drawerattribute.

Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Graphic3d_AspectLine3d>
") CreateAspectLine3d;
		static opencascade::handle<Graphic3d_AspectLine3d> CreateAspectLine3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectMarker3d ******************/
		%feature("compactdefaultargs") CreateAspectMarker3d;
		%feature("autodoc", "Creates marker aspect with values from drawer according to keys from drawerattribute.

Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Graphic3d_AspectMarker3d>
") CreateAspectMarker3d;
		static opencascade::handle<Graphic3d_AspectMarker3d> CreateAspectMarker3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectText3d ******************/
		%feature("compactdefaultargs") CreateAspectText3d;
		%feature("autodoc", "Creates text aspect with values from drawer according to keys from drawerattribute.

Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Graphic3d_AspectText3d>
") CreateAspectText3d;
		static opencascade::handle<Graphic3d_AspectText3d> CreateAspectText3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** GetAverageNormal ******************/
		%feature("compactdefaultargs") GetAverageNormal;
		%feature("autodoc", "Get an average of normals to non-planar polygon described by these points or compute normal of planar polygon. if the polygon isn't planar, function returns false.

Parameters
----------
Nodes: TColStd_Array1OfReal
Norm: gp_Vec

Returns
-------
bool
") GetAverageNormal;
		static Standard_Boolean GetAverageNormal(const TColStd_Array1OfReal & Nodes, gp_Vec & Norm);

		/****************** GetNormal ******************/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "Get one of normals to polygon described by these points. if the polygon isn't planar, function returns false.

Parameters
----------
Nodes: TColStd_Array1OfReal
Norm: gp_Vec

Returns
-------
bool
") GetNormal;
		static Standard_Boolean GetNormal(const TColStd_Array1OfReal & Nodes, gp_Vec & Norm);

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
		unsigned int r1;
		unsigned int g1;
		unsigned int b1;
		unsigned int r2;
		unsigned int g2;
		unsigned int b2;
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
		int First;
		int Second;
		/****************** MeshVS_TwoNodes ******************/
		%feature("compactdefaultargs") MeshVS_TwoNodes;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFirst: int,optional
	default value is 0
aSecond: int,optional
	default value is 0

Returns
-------
None
") MeshVS_TwoNodes;
		 MeshVS_TwoNodes(Standard_Integer aFirst = 0, Standard_Integer aSecond = 0);

};


%extend MeshVS_TwoNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class MeshVS_DataSource3D *
****************************/
%nodefaultctor MeshVS_DataSource3D;
class MeshVS_DataSource3D : public MeshVS_DataSource {
	public:
		/****************** CreatePrismTopology ******************/
		%feature("compactdefaultargs") CreatePrismTopology;
		%feature("autodoc", "No available documentation.

Parameters
----------
BasePoints: int

Returns
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>
") CreatePrismTopology;
		static opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> CreatePrismTopology(const Standard_Integer BasePoints);

		/****************** CreatePyramidTopology ******************/
		%feature("compactdefaultargs") CreatePyramidTopology;
		%feature("autodoc", "No available documentation.

Parameters
----------
BasePoints: int

Returns
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>
") CreatePyramidTopology;
		static opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> CreatePyramidTopology(const Standard_Integer BasePoints);

		/****************** GetPrismTopology ******************/
		%feature("compactdefaultargs") GetPrismTopology;
		%feature("autodoc", "No available documentation.

Parameters
----------
BasePoints: int

Returns
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>
") GetPrismTopology;
		opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> GetPrismTopology(const Standard_Integer BasePoints);

		/****************** GetPyramidTopology ******************/
		%feature("compactdefaultargs") GetPyramidTopology;
		%feature("autodoc", "No available documentation.

Parameters
----------
BasePoints: int

Returns
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>
") GetPyramidTopology;
		opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> GetPyramidTopology(const Standard_Integer BasePoints);

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
		/****************** MeshVS_DeformedDataSource ******************/
		%feature("compactdefaultargs") MeshVS_DeformedDataSource;
		%feature("autodoc", "Constructor thenondeformds is canonical non-deformed data source, by which we are able to calculate deformed mesh geometry themagnify is coefficient of displacement magnify.

Parameters
----------
theNonDeformDS: MeshVS_DataSource
theMagnify: float

Returns
-------
None
") MeshVS_DeformedDataSource;
		 MeshVS_DeformedDataSource(const opencascade::handle<MeshVS_DataSource> & theNonDeformDS, const Standard_Real theMagnify);

		/****************** Get3DGeom ******************/
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "No available documentation.

Parameters
----------
ID: int
Data: MeshVS_HArray1OfSequenceOfInteger

Returns
-------
NbNodes: int
") Get3DGeom;
		virtual Standard_Boolean Get3DGeom(const Standard_Integer ID, Standard_Integer &OutValue, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Data);

		/****************** GetAddr ******************/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "No available documentation.

Parameters
----------
ID: int
IsElement: bool

Returns
-------
Standard_Address
") GetAddr;
		virtual Standard_Address GetAddr(const Standard_Integer ID, const Standard_Boolean IsElement);

		/****************** GetAllElements ******************/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_PackedMapOfInteger
") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements();

		/****************** GetAllNodes ******************/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_PackedMapOfInteger
") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes();

		/****************** GetGeom ******************/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "No available documentation.

Parameters
----------
ID: int
IsElement: bool
Coords: TColStd_Array1OfReal
Type: MeshVS_EntityType

Returns
-------
NbNodes: int
") GetGeom;
		virtual Standard_Boolean GetGeom(const Standard_Integer ID, const Standard_Boolean IsElement, TColStd_Array1OfReal & Coords, Standard_Integer &OutValue, MeshVS_EntityType & Type);

		/****************** GetGeomType ******************/
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "No available documentation.

Parameters
----------
ID: int
IsElement: bool
Type: MeshVS_EntityType

Returns
-------
bool
") GetGeomType;
		virtual Standard_Boolean GetGeomType(const Standard_Integer ID, const Standard_Boolean IsElement, MeshVS_EntityType & Type);

		/****************** GetMagnify ******************/
		%feature("compactdefaultargs") GetMagnify;
		%feature("autodoc", "With this methods you can read and change magnify coefficient of nodal displacements.

Returns
-------
float
") GetMagnify;
		Standard_Real GetMagnify();

		/****************** GetNodesByElement ******************/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
ID: int
NodeIDs: TColStd_Array1OfInteger

Returns
-------
NbNodes: int
") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement(const Standard_Integer ID, TColStd_Array1OfInteger & NodeIDs, Standard_Integer &OutValue);

		/****************** GetNonDeformedDataSource ******************/
		%feature("compactdefaultargs") GetNonDeformedDataSource;
		%feature("autodoc", "With this methods you can read and change internal canonical data source.

Returns
-------
opencascade::handle<MeshVS_DataSource>
") GetNonDeformedDataSource;
		opencascade::handle<MeshVS_DataSource> GetNonDeformedDataSource();

		/****************** GetVector ******************/
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "This method returns vector ( vect ) assigned to node number id.

Parameters
----------
ID: int
Vect: gp_Vec

Returns
-------
bool
") GetVector;
		Standard_Boolean GetVector(const Standard_Integer ID, gp_Vec & Vect);

		/****************** GetVectors ******************/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "This method returns map of nodal displacement vectors.

Returns
-------
MeshVS_DataMapOfIntegerVector
") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors();

		/****************** SetMagnify ******************/
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMagnify: float

Returns
-------
None
") SetMagnify;
		void SetMagnify(const Standard_Real theMagnify);

		/****************** SetNonDeformedDataSource ******************/
		%feature("compactdefaultargs") SetNonDeformedDataSource;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDS: MeshVS_DataSource

Returns
-------
None
") SetNonDeformedDataSource;
		void SetNonDeformedDataSource(const opencascade::handle<MeshVS_DataSource> & theDS);

		/****************** SetVector ******************/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "This method sets vector ( vect ) assigned to node number id.

Parameters
----------
ID: int
Vect: gp_Vec

Returns
-------
None
") SetVector;
		void SetVector(const Standard_Integer ID, const gp_Vec & Vect);

		/****************** SetVectors ******************/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "This method sets map of nodal displacement vectors (map).

Parameters
----------
Map: MeshVS_DataMapOfIntegerVector

Returns
-------
None
") SetVectors;
		void SetVectors(const MeshVS_DataMapOfIntegerVector & Map);

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
		/****************** MeshVS_ElementalColorPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_ElementalColorPrsBuilder;
		%feature("autodoc", "Constructor.

Parameters
----------
Parent: MeshVS_Mesh
Flags: int,optional
	default value is MeshVS_DMF_ElementalColorDataPrs
DS: MeshVS_DataSource,optional
	default value is 0
Id: int,optional
	default value is -1
Priority: int,optional
	default value is MeshVS_BP_ElemColor

Returns
-------
None
") MeshVS_ElementalColorPrsBuilder;
		 MeshVS_ElementalColorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_ElementalColorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_ElemColor);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds presentation of elements with assigned colors.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Returns
-------
None
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** GetColor1 ******************/
		%feature("compactdefaultargs") GetColor1;
		%feature("autodoc", "Returns color assigned with element number id.

Parameters
----------
ID: int
theColor: Quantity_Color

Returns
-------
bool
") GetColor1;
		Standard_Boolean GetColor1(const Standard_Integer ID, Quantity_Color & theColor);

		/****************** GetColor2 ******************/
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "Returns colors assigned with element number id.

Parameters
----------
ID: int
theColor: MeshVS_TwoColors

Returns
-------
bool
") GetColor2;
		Standard_Boolean GetColor2(const Standard_Integer ID, MeshVS_TwoColors & theColor);

		/****************** GetColor2 ******************/
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "Returns colors assigned with element number id thecolor1 is the front element color thecolor2 is the back element color.

Parameters
----------
ID: int
theColor1: Quantity_Color
theColor2: Quantity_Color

Returns
-------
bool
") GetColor2;
		Standard_Boolean GetColor2(const Standard_Integer ID, Quantity_Color & theColor1, Quantity_Color & theColor2);

		/****************** GetColors1 ******************/
		%feature("compactdefaultargs") GetColors1;
		%feature("autodoc", "Returns map of colors same for front and back side of face.

Returns
-------
MeshVS_DataMapOfIntegerColor
") GetColors1;
		const MeshVS_DataMapOfIntegerColor & GetColors1();

		/****************** GetColors2 ******************/
		%feature("compactdefaultargs") GetColors2;
		%feature("autodoc", "Returns map of different colors for front and back side of face.

Returns
-------
MeshVS_DataMapOfIntegerTwoColors
") GetColors2;
		const MeshVS_DataMapOfIntegerTwoColors & GetColors2();

		/****************** HasColors1 ******************/
		%feature("compactdefaultargs") HasColors1;
		%feature("autodoc", "Returns true, if map of colors isn't empty.

Returns
-------
bool
") HasColors1;
		Standard_Boolean HasColors1();

		/****************** HasColors2 ******************/
		%feature("compactdefaultargs") HasColors2;
		%feature("autodoc", "Returns true, if map isn't empty.

Returns
-------
bool
") HasColors2;
		Standard_Boolean HasColors2();

		/****************** SetColor1 ******************/
		%feature("compactdefaultargs") SetColor1;
		%feature("autodoc", "Sets color assigned with element number id.

Parameters
----------
ID: int
theColor: Quantity_Color

Returns
-------
None
") SetColor1;
		void SetColor1(const Standard_Integer ID, const Quantity_Color & theColor);

		/****************** SetColor2 ******************/
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "Sets colors assigned with element number id.

Parameters
----------
ID: int
theTwoColors: MeshVS_TwoColors

Returns
-------
None
") SetColor2;
		void SetColor2(const Standard_Integer ID, const MeshVS_TwoColors & theTwoColors);

		/****************** SetColor2 ******************/
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "Sets color assigned with element number id thecolor1 is the front element color thecolor2 is the back element color.

Parameters
----------
ID: int
theColor1: Quantity_Color
theColor2: Quantity_Color

Returns
-------
None
") SetColor2;
		void SetColor2(const Standard_Integer ID, const Quantity_Color & theColor1, const Quantity_Color & theColor2);

		/****************** SetColors1 ******************/
		%feature("compactdefaultargs") SetColors1;
		%feature("autodoc", "Sets map of colors same for front and back side of face.

Parameters
----------
Map: MeshVS_DataMapOfIntegerColor

Returns
-------
None
") SetColors1;
		void SetColors1(const MeshVS_DataMapOfIntegerColor & Map);

		/****************** SetColors2 ******************/
		%feature("compactdefaultargs") SetColors2;
		%feature("autodoc", "Sets map of different colors for front and back side of face.

Parameters
----------
Map: MeshVS_DataMapOfIntegerTwoColors

Returns
-------
None
") SetColors2;
		void SetColors2(const MeshVS_DataMapOfIntegerTwoColors & Map);

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
		/****************** MeshVS_MeshPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_MeshPrsBuilder;
		%feature("autodoc", "Creates builder with certain display mode flags, data source, id and priority.

Parameters
----------
Parent: MeshVS_Mesh
Flags: int,optional
	default value is MeshVS_DMF_OCCMask
DS: MeshVS_DataSource,optional
	default value is 0
Id: int,optional
	default value is -1
Priority: int,optional
	default value is MeshVS_BP_Mesh

Returns
-------
None
") MeshVS_MeshPrsBuilder;
		 MeshVS_MeshPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_OCCMask, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_Mesh);

		/****************** AddVolumePrs ******************/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "Add to array polygons or polylines representing volume.

Parameters
----------
Topo: MeshVS_HArray1OfSequenceOfInteger
Nodes: TColStd_Array1OfReal
NbNodes: int
Array: Graphic3d_ArrayOfPrimitives
IsReflected: bool
IsShrinked: bool
IsSelect: bool
ShrinkCoef: float

Returns
-------
None
") AddVolumePrs;
		static void AddVolumePrs(const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Topo, const TColStd_Array1OfReal & Nodes, const Standard_Integer NbNodes, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Array, const Standard_Boolean IsReflected, const Standard_Boolean IsShrinked, const Standard_Boolean IsSelect, const Standard_Real ShrinkCoef);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds base mesh presentation by calling the methods below.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Returns
-------
None
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** BuildElements ******************/
		%feature("compactdefaultargs") BuildElements;
		%feature("autodoc", "Builds elements presentation.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
DisplayMode: int

Returns
-------
None
") BuildElements;
		virtual void BuildElements(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Integer DisplayMode);

		/****************** BuildHilightPrs ******************/
		%feature("compactdefaultargs") BuildHilightPrs;
		%feature("autodoc", "Builds presentation of hilighted entity.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IsElement: bool

Returns
-------
None
") BuildHilightPrs;
		virtual void BuildHilightPrs(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, const Standard_Boolean IsElement);

		/****************** BuildNodes ******************/
		%feature("compactdefaultargs") BuildNodes;
		%feature("autodoc", "Builds nodes presentation.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
DisplayMode: int

Returns
-------
None
") BuildNodes;
		virtual void BuildNodes(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Integer DisplayMode);

		/****************** HowManyPrimitives ******************/
		%feature("compactdefaultargs") HowManyPrimitives;
		%feature("autodoc", "Calculate how many polygons or polylines are necessary to draw passed topology.

Parameters
----------
Topo: MeshVS_HArray1OfSequenceOfInteger
AsPolygons: bool
IsSelect: bool
NbNodes: int

Returns
-------
Vertices: int
Bounds: int
") HowManyPrimitives;
		static void HowManyPrimitives(const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Topo, const Standard_Boolean AsPolygons, const Standard_Boolean IsSelect, const Standard_Integer NbNodes, Standard_Integer &OutValue, Standard_Integer &OutValue);

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
		/****************** MeshVS_NodalColorPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_NodalColorPrsBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Parent: MeshVS_Mesh
Flags: int,optional
	default value is MeshVS_DMF_NodalColorDataPrs
DS: MeshVS_DataSource,optional
	default value is 0
Id: int,optional
	default value is -1
Priority: int,optional
	default value is MeshVS_BP_NodalColor

Returns
-------
None
") MeshVS_NodalColorPrsBuilder;
		 MeshVS_NodalColorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_NodalColorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_NodalColor);

		/****************** AddVolumePrs ******************/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "Add to array polygons or polylines representing volume.

Parameters
----------
theTopo: MeshVS_HArray1OfSequenceOfInteger
theNodes: TColStd_Array1OfInteger
theCoords: TColStd_Array1OfReal
theArray: Graphic3d_ArrayOfPrimitives
theIsShaded: bool
theNbColors: int
theNbTexColors: int
theColorRatio: float

Returns
-------
None
") AddVolumePrs;
		void AddVolumePrs(const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & theTopo, const TColStd_Array1OfInteger & theNodes, const TColStd_Array1OfReal & theCoords, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & theArray, const Standard_Boolean theIsShaded, const Standard_Integer theNbColors, const Standard_Integer theNbTexColors, const Standard_Real theColorRatio);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds presentation of nodes with assigned color.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
DisplayMode: int

Returns
-------
None
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "Returns color assigned to single node.

Parameters
----------
ID: int
theColor: Quantity_Color

Returns
-------
bool
") GetColor;
		Standard_Boolean GetColor(const Standard_Integer ID, Quantity_Color & theColor);

		/****************** GetColorMap ******************/
		%feature("compactdefaultargs") GetColorMap;
		%feature("autodoc", "Return colors used for texrture presentation.

Returns
-------
Aspect_SequenceOfColor
") GetColorMap;
		const Aspect_SequenceOfColor & GetColorMap();

		/****************** GetColors ******************/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Returns map of colors assigned to nodes.

Returns
-------
MeshVS_DataMapOfIntegerColor
") GetColors;
		const MeshVS_DataMapOfIntegerColor & GetColors();

		/****************** GetInvalidColor ******************/
		%feature("compactdefaultargs") GetInvalidColor;
		%feature("autodoc", "Return color representing invalid texture coordinate (laying outside range [0, 1]).

Returns
-------
Quantity_Color
") GetInvalidColor;
		Quantity_Color GetInvalidColor();

		/****************** GetTextureCoord ******************/
		%feature("compactdefaultargs") GetTextureCoord;
		%feature("autodoc", "Return correspondence between node ids and texture coordinate (range [0, 1]).

Parameters
----------
theID: int

Returns
-------
float
") GetTextureCoord;
		Standard_Real GetTextureCoord(const Standard_Integer theID);

		/****************** GetTextureCoords ******************/
		%feature("compactdefaultargs") GetTextureCoords;
		%feature("autodoc", "Get correspondence between node ids and texture coordinates (range [0, 1]).

Returns
-------
TColStd_DataMapOfIntegerReal
") GetTextureCoords;
		const TColStd_DataMapOfIntegerReal & GetTextureCoords();

		/****************** HasColors ******************/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "Returns true, if map isn't empty.

Returns
-------
bool
") HasColors;
		Standard_Boolean HasColors();

		/****************** IsUseTexture ******************/
		%feature("compactdefaultargs") IsUseTexture;
		%feature("autodoc", "Verify whether texture is used to build presentation.

Returns
-------
bool
") IsUseTexture;
		Standard_Boolean IsUseTexture();

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Sets color assigned to single node.

Parameters
----------
ID: int
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		void SetColor(const Standard_Integer ID, const Quantity_Color & theColor);

		/****************** SetColorMap ******************/
		%feature("compactdefaultargs") SetColorMap;
		%feature("autodoc", "Set colors to be used for texrture presentation thecolors - colors for valid coordinates (laying in range [0, 1]).

Parameters
----------
theColors: Aspect_SequenceOfColor

Returns
-------
None
") SetColorMap;
		void SetColorMap(const Aspect_SequenceOfColor & theColors);

		/****************** SetColors ******************/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "Sets map of colors assigned to nodes.

Parameters
----------
Map: MeshVS_DataMapOfIntegerColor

Returns
-------
None
") SetColors;
		void SetColors(const MeshVS_DataMapOfIntegerColor & Map);

		/****************** SetInvalidColor ******************/
		%feature("compactdefaultargs") SetInvalidColor;
		%feature("autodoc", "Set color representing invalid texture coordinate (laying outside range [0, 1]).

Parameters
----------
theInvalidColor: Quantity_Color

Returns
-------
None
") SetInvalidColor;
		void SetInvalidColor(const Quantity_Color & theInvalidColor);

		/****************** SetTextureCoord ******************/
		%feature("compactdefaultargs") SetTextureCoord;
		%feature("autodoc", "Specify correspondence between node id and texture coordinate (range [0, 1]).

Parameters
----------
theID: int
theCoord: float

Returns
-------
None
") SetTextureCoord;
		void SetTextureCoord(const Standard_Integer theID, const Standard_Real theCoord);

		/****************** SetTextureCoords ******************/
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "Specify correspondence between node ids and texture coordinates (range [0, 1]).

Parameters
----------
theMap: TColStd_DataMapOfIntegerReal

Returns
-------
None
") SetTextureCoords;
		void SetTextureCoords(const TColStd_DataMapOfIntegerReal & theMap);

		/****************** UseTexture ******************/
		%feature("compactdefaultargs") UseTexture;
		%feature("autodoc", "Specify whether texture must be used to build presentation.

Parameters
----------
theToUse: bool

Returns
-------
None
") UseTexture;
		void UseTexture(const Standard_Boolean theToUse);

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
		/****************** MeshVS_TextPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_TextPrsBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Parent: MeshVS_Mesh
Height: float
Color: Quantity_Color
Flags: int,optional
	default value is MeshVS_DMF_TextDataPrs
DS: MeshVS_DataSource,optional
	default value is 0
Id: int,optional
	default value is -1
Priority: int,optional
	default value is MeshVS_BP_Text

Returns
-------
None
") MeshVS_TextPrsBuilder;
		 MeshVS_TextPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, const Standard_Real Height, const Quantity_Color & Color, int Flags = MeshVS_DMF_TextDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_Text);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds presentation of text data.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
theDisplayMode: int

Returns
-------
None
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer theDisplayMode);

		/****************** GetText ******************/
		%feature("compactdefaultargs") GetText;
		%feature("autodoc", "Returns text assigned with single node or element.

Parameters
----------
IsElement: bool
ID: int
Text: TCollection_AsciiString

Returns
-------
bool
") GetText;
		Standard_Boolean GetText(const Standard_Boolean IsElement, const Standard_Integer ID, TCollection_AsciiString & Text);

		/****************** GetTexts ******************/
		%feature("compactdefaultargs") GetTexts;
		%feature("autodoc", "Returns map of text assigned with nodes ( iselement = false ) or elements ( iselement = true ).

Parameters
----------
IsElement: bool

Returns
-------
MeshVS_DataMapOfIntegerAsciiString
") GetTexts;
		const MeshVS_DataMapOfIntegerAsciiString & GetTexts(const Standard_Boolean IsElement);

		/****************** HasTexts ******************/
		%feature("compactdefaultargs") HasTexts;
		%feature("autodoc", "Returns true if map isn't empty.

Parameters
----------
IsElement: bool

Returns
-------
bool
") HasTexts;
		Standard_Boolean HasTexts(const Standard_Boolean IsElement);

		/****************** SetText ******************/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "Sets text assigned with single node or element.

Parameters
----------
IsElement: bool
ID: int
Text: TCollection_AsciiString

Returns
-------
None
") SetText;
		void SetText(const Standard_Boolean IsElement, const Standard_Integer ID, const TCollection_AsciiString & Text);

		/****************** SetTexts ******************/
		%feature("compactdefaultargs") SetTexts;
		%feature("autodoc", "Sets map of text assigned with nodes or elements.

Parameters
----------
IsElement: bool
Map: MeshVS_DataMapOfIntegerAsciiString

Returns
-------
None
") SetTexts;
		void SetTexts(const Standard_Boolean IsElement, const MeshVS_DataMapOfIntegerAsciiString & Map);

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
		/****************** MeshVS_VectorPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_VectorPrsBuilder;
		%feature("autodoc", "No available documentation.

Parameters
----------
Parent: MeshVS_Mesh
MaxLength: float
VectorColor: Quantity_Color
Flags: int,optional
	default value is MeshVS_DMF_VectorDataPrs
DS: MeshVS_DataSource,optional
	default value is 0
Id: int,optional
	default value is -1
Priority: int,optional
	default value is MeshVS_BP_Vector
IsSimplePrs: bool,optional
	default value is Standard_False

Returns
-------
None
") MeshVS_VectorPrsBuilder;
		 MeshVS_VectorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, const Standard_Real MaxLength, const Quantity_Color & VectorColor, int Flags = MeshVS_DMF_VectorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_Vector, const Standard_Boolean IsSimplePrs = Standard_False);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds vector data presentation.

Parameters
----------
Prs: Prs3d_Presentation
IDs: TColStd_PackedMapOfInteger
IDsToExclude: TColStd_PackedMapOfInteger
IsElement: bool
theDisplayMode: int

Returns
-------
None
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer theDisplayMode);

		/****************** DrawVector ******************/
		%feature("compactdefaultargs") DrawVector;
		%feature("autodoc", "Adds to array of polygons and polylines some primitive representing single vector.

Parameters
----------
theTrsf: gp_Trsf
Length: float
MaxLength: float
ArrowPoints: TColgp_Array1OfPnt
Lines: Graphic3d_ArrayOfPrimitives
ArrowLines: Graphic3d_ArrayOfPrimitives
Triangles: Graphic3d_ArrayOfPrimitives

Returns
-------
None
") DrawVector;
		void DrawVector(const gp_Trsf & theTrsf, const Standard_Real Length, const Standard_Real MaxLength, const TColgp_Array1OfPnt & ArrowPoints, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Lines, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & ArrowLines, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Triangles);

		/****************** GetMinMaxVectorValue ******************/
		%feature("compactdefaultargs") GetMinMaxVectorValue;
		%feature("autodoc", "Calculates minimal and maximal length of vectors in map ( nodal, if iselement = false or elemental, if iselement = true ).

Parameters
----------
IsElement: bool

Returns
-------
MinValue: float
MaxValue: float
") GetMinMaxVectorValue;
		void GetMinMaxVectorValue(const Standard_Boolean IsElement, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetVector ******************/
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "Returns vector assigned with certain node or element.

Parameters
----------
IsElement: bool
ID: int
Vect: gp_Vec

Returns
-------
bool
") GetVector;
		Standard_Boolean GetVector(const Standard_Boolean IsElement, const Standard_Integer ID, gp_Vec & Vect);

		/****************** GetVectors ******************/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "Returns map of vectors assigned with nodes or elements.

Parameters
----------
IsElement: bool

Returns
-------
MeshVS_DataMapOfIntegerVector
") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors(const Standard_Boolean IsElement);

		/****************** HasVectors ******************/
		%feature("compactdefaultargs") HasVectors;
		%feature("autodoc", "Returns true, if map isn't empty.

Parameters
----------
IsElement: bool

Returns
-------
bool
") HasVectors;
		Standard_Boolean HasVectors(const Standard_Boolean IsElement);

		/****************** SetSimplePrsMode ******************/
		%feature("compactdefaultargs") SetSimplePrsMode;
		%feature("autodoc", "Sets flag that indicates is simple vector arrow mode uses or not default value is false.

Parameters
----------
IsSimpleArrow: bool

Returns
-------
None
") SetSimplePrsMode;
		void SetSimplePrsMode(const Standard_Boolean IsSimpleArrow);

		/****************** SetSimplePrsParams ******************/
		%feature("compactdefaultargs") SetSimplePrsParams;
		%feature("autodoc", "Sets parameters of simple vector arrwo presentation thelinewidthparam - coefficient of vector line width (to draw line instead of arrow) thestartparam and theendparam parameters of start and end of thickened ends position of thickening calculates according to parameters and maximum vector length default values are: thelinewidthparam = 2.5 thestartparam = 0.85 theendparam = 0.95.

Parameters
----------
theLineWidthParam: float
theStartParam: float
theEndParam: float

Returns
-------
None
") SetSimplePrsParams;
		void SetSimplePrsParams(const Standard_Real theLineWidthParam, const Standard_Real theStartParam, const Standard_Real theEndParam);

		/****************** SetVector ******************/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "Sets vector assigned with certain node or element.

Parameters
----------
IsElement: bool
ID: int
Vect: gp_Vec

Returns
-------
None
") SetVector;
		void SetVector(const Standard_Boolean IsElement, const Standard_Integer ID, const gp_Vec & Vect);

		/****************** SetVectors ******************/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "Sets map of vectors assigned with nodes or elements.

Parameters
----------
IsElement: bool
Map: MeshVS_DataMapOfIntegerVector

Returns
-------
None
") SetVectors;
		void SetVectors(const Standard_Boolean IsElement, const MeshVS_DataMapOfIntegerVector & Map);

		/****************** calculateArrow ******************/
		%feature("compactdefaultargs") calculateArrow;
		%feature("autodoc", "Calculates points of arrow presentation.

Parameters
----------
Points: TColgp_Array1OfPnt
Length: float
ArrowPart: float

Returns
-------
float
") calculateArrow;
		static Standard_Real calculateArrow(TColgp_Array1OfPnt & Points, const Standard_Real Length, const Standard_Real ArrowPart);

};


%make_alias(MeshVS_VectorPrsBuilder)

%extend MeshVS_VectorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class MeshVS_HArray1OfSequenceOfInteger : public MeshVS_Array1OfSequenceOfInteger, public Standard_Transient {
  public:
    MeshVS_HArray1OfSequenceOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    MeshVS_HArray1OfSequenceOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const MeshVS_Array1OfSequenceOfInteger::value_type& theValue);
    MeshVS_HArray1OfSequenceOfInteger(const MeshVS_Array1OfSequenceOfInteger& theOther);
    const MeshVS_Array1OfSequenceOfInteger& Array1();
    MeshVS_Array1OfSequenceOfInteger& ChangeArray1();
};
%make_alias(MeshVS_HArray1OfSequenceOfInteger)

/* harray2 classes */
/* hsequence classes */
