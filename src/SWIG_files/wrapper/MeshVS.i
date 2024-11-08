/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_meshvs.html"
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


%{
#include<MeshVS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
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
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
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
%import Aspect.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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
%template(MeshVS_DataMapOfColorMapOfInteger) NCollection_DataMap<Quantity_Color,TColStd_MapOfInteger>;
%template(MeshVS_DataMapOfHArray1OfSequenceOfInteger) NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>> {
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
%template(MeshVS_DataMapOfIntegerAsciiString) NCollection_DataMap<Standard_Integer,TCollection_AsciiString>;

%extend NCollection_DataMap<Standard_Integer,TCollection_AsciiString> {
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
%template(MeshVS_DataMapOfIntegerBoolean) NCollection_DataMap<Standard_Integer,Standard_Boolean>;

%extend NCollection_DataMap<Standard_Integer,Standard_Boolean> {
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
%template(MeshVS_DataMapOfIntegerColor) NCollection_DataMap<Standard_Integer,Quantity_Color>;

%extend NCollection_DataMap<Standard_Integer,Quantity_Color> {
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
%template(MeshVS_DataMapOfIntegerMaterial) NCollection_DataMap<Standard_Integer,Graphic3d_MaterialAspect>;

%extend NCollection_DataMap<Standard_Integer,Graphic3d_MaterialAspect> {
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
%template(MeshVS_DataMapOfIntegerMeshEntityOwner) NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_MeshEntityOwner>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MeshVS_MeshEntityOwner>> {
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
%template(MeshVS_DataMapOfIntegerOwner) NCollection_DataMap<Standard_Integer,opencascade::handle<SelectMgr_EntityOwner>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<SelectMgr_EntityOwner>> {
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
%template(MeshVS_DataMapOfIntegerTwoColors) NCollection_DataMap<Standard_Integer,MeshVS_TwoColors>;

%extend NCollection_DataMap<Standard_Integer,MeshVS_TwoColors> {
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
%template(MeshVS_DataMapOfIntegerVector) NCollection_DataMap<Standard_Integer,gp_Vec>;

%extend NCollection_DataMap<Standard_Integer,gp_Vec> {
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
%template(MeshVS_DataMapOfTwoColorsMapOfInteger) NCollection_DataMap<MeshVS_TwoColors,TColStd_MapOfInteger>;
%template(MeshVS_MapOfTwoNodes) NCollection_Map<MeshVS_TwoNodes>;
%template(MeshVS_PolyhedronVerts) NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>>;

%extend NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(MeshVS_PolyhedronVertsIter) NCollection_TListIterator<MeshVS_PolyhedronVerts>;
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
typedef Standard_Integer MeshVS_BuilderPriority;
typedef NCollection_DataMap<Quantity_Color, TColStd_MapOfInteger>::Iterator MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>>::Iterator MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DataMap<Standard_Integer, TCollection_AsciiString>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
typedef NCollection_DataMap<Standard_Integer, Standard_Boolean>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
typedef NCollection_DataMap<Standard_Integer, Quantity_Color>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
typedef NCollection_DataMap<Standard_Integer, Graphic3d_MaterialAspect>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_MeshEntityOwner>>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<SelectMgr_EntityOwner>>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
typedef NCollection_DataMap<Standard_Integer, MeshVS_TwoColors>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
typedef NCollection_DataMap<Standard_Integer, gp_Vec>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
typedef NCollection_DataMap<MeshVS_TwoColors, TColStd_MapOfInteger>::Iterator MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
typedef NCollection_DataMap<Quantity_Color, TColStd_MapOfInteger> MeshVS_DataMapOfColorMapOfInteger;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>> MeshVS_DataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DataMap<Standard_Integer, TCollection_AsciiString> MeshVS_DataMapOfIntegerAsciiString;
typedef NCollection_DataMap<Standard_Integer, Standard_Boolean> MeshVS_DataMapOfIntegerBoolean;
typedef NCollection_DataMap<Standard_Integer, Quantity_Color> MeshVS_DataMapOfIntegerColor;
typedef NCollection_DataMap<Standard_Integer, Graphic3d_MaterialAspect> MeshVS_DataMapOfIntegerMaterial;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MeshVS_MeshEntityOwner>> MeshVS_DataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<SelectMgr_EntityOwner>> MeshVS_DataMapOfIntegerOwner;
typedef NCollection_DataMap<Standard_Integer, MeshVS_TwoColors> MeshVS_DataMapOfIntegerTwoColors;
typedef NCollection_DataMap<Standard_Integer, gp_Vec> MeshVS_DataMapOfIntegerVector;
typedef NCollection_DataMap<MeshVS_TwoColors, TColStd_MapOfInteger> MeshVS_DataMapOfTwoColorsMapOfInteger;
typedef Standard_Integer MeshVS_DisplayModeFlags;
typedef NCollection_Map<MeshVS_TwoNodes>::Iterator MeshVS_MapIteratorOfMapOfTwoNodes;
typedef NCollection_Map<MeshVS_TwoNodes> MeshVS_MapOfTwoNodes;
typedef MeshVS_Mesh * MeshVS_MeshPtr;
typedef std::pair<Standard_Integer, Standard_Integer> MeshVS_NodePair;
typedef NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>> MeshVS_PolyhedronVerts;
typedef NCollection_List<opencascade::handle<TColgp_HArray1OfPnt>>::Iterator MeshVS_PolyhedronVertsIter;
typedef NCollection_Sequence<opencascade::handle<MeshVS_PrsBuilder>> MeshVS_SequenceOfPrsBuilder;
/* end typedefs declaration */

/**********************
* class MeshVS_Buffer *
**********************/
class MeshVS_Buffer {
	public:
		/****************** MeshVS_Buffer ******************/
		/**** md5 signature: 6aa133acb7bf6a8defb6a753a4c6dbff ****/
		%feature("compactdefaultargs") MeshVS_Buffer;
		%feature("autodoc", "
Parameters
----------
theSize: Standard_Size

Return
-------
None

Description
-----------
Constructor of the buffer of the requested size.
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
		/**** md5 signature: 88c055c73321e66b439e5e4e9ef7a9f3 ****/
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

		/****************** BoundingBox ******************/
		/**** md5 signature: 32bbe8c17aea605d2fa20f6fee7f740c ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the triangulation. if location transformation is set, it will be applied.
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Box ******************/
		/**** md5 signature: 9170e3bfd20dbcabd7ec332ab26bb9fa ****/
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
Returns bounding box of sub-entity with index theidx in sub-entity list.
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		/**** md5 signature: 82dec1d5725b85fd9fe04818aa66dc03 ****/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theAxis: int

Return
-------
float

Description
-----------
Returns geometry center of sensitive entity index theidx along the given axis theaxis.
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		/**** md5 signature: 25c8cb59bf9cf3d8018e9e747d82efdc ****/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of a mesh.
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		/**** md5 signature: 6710de9a0213ce4cb10f7bdf207b1540 ****/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Create a copy.
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** NbSubElements ******************/
		/**** md5 signature: 67776b0ab204a0dd707f457a7c3a6214 ****/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of elements.
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Size ******************/
		/**** md5 signature: 8b9290cdf9c653fc150b9b31776f3f21 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities of the complex entity.
") Size;
		virtual Standard_Integer Size();

		/****************** Swap ******************/
		/**** md5 signature: 19b601a9d7acdae056493eb6f9eb0b63 ****/
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
Swaps items with indexes theidx1 and theidx2.
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
		/**** md5 signature: ca8c9922d6918767dee0581d1d849a7b ****/
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
Data: MeshVS_HArray1OfSequenceOfInteger

Return
-------
NbNodes: int

Description
-----------
This method returns topology information about 3d-element returns false if element with id isn't 3d or because other troubles.
") Get3DGeom;
		virtual Standard_Boolean Get3DGeom(const Standard_Integer ID, Standard_Integer &OutValue, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Data);

		/****************** GetAddr ******************/
		/**** md5 signature: 6ede570d714200ef2042aae5eaa49c23 ****/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool

Return
-------
Standard_Address

Description
-----------
This method returns pointer which represents element or node data structure. this address will be saved in meshvs_meshentityowner, so that you can access to data structure fast by the method owner(). in the redefined method you can return null. id is the numerical identificator of node or element iselement indicates this id describe node ( if standard_false ) or element ( if standard_true ).
") GetAddr;
		virtual Standard_Address GetAddr(const Standard_Integer ID, const Standard_Boolean IsElement);

		/****************** GetAllElements ******************/
		/**** md5 signature: f85e71abd796a5398a1de8f5fade7da2 ****/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
This method returns map of all elements the object consist of.
") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements();

		/****************** GetAllGroups ******************/
		/**** md5 signature: 3b325eb8b0334ce7f7b23771f6ea3b64 ****/
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

		/****************** GetAllNodes ******************/
		/**** md5 signature: d9ec1f37bed757ebe7b546ba878e8230 ****/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
This method returns map of all nodes the object consist of.
") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes();

		/****************** GetBoundingBox ******************/
		/**** md5 signature: c776ca3f9f7d80c6934fc1b6003552bc ****/
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Returns the bounding box of the whole mesh. it is used in advanced selection mode to define roughly the sensitive area of the mesh. it can be redefined to get access to a box computed in advance.
") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox();

		/****************** GetDetectedEntities ******************/
		/**** md5 signature: d6cc9c51b75a2f4602aade3bdf974e7c ****/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "
Parameters
----------
Prs: MeshVS_Mesh
X: float
Y: float
aTol: float
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Return
-------
DMin: float

Description
-----------
Returns maps of entities (nodes and elements) detected by mouse click at the point (x,y) on the current view plane, with the tolerance atol. dmin - is out argument should return actual detection tolerance. returns true if something is detected. it should be redefined if the advanced mesh selection is activated. default implementation returns false.
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const Standard_Real X, const Standard_Real Y, const Standard_Real aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements, Standard_Real &OutValue);

		/****************** GetDetectedEntities ******************/
		/**** md5 signature: 39ca460111ab817983a833e2f70887f6 ****/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "
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

Return
-------
bool

Description
-----------
Returns maps of entities (nodes and elements) detected by mouse selection with rectangular box (xmin, ymin, xmax, ymax) on the current view plane, with the tolerance atol. returns true if something is detected. it should be redefined if the advanced mesh selection is activated. default implementation returns false.
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const Standard_Real XMin, const Standard_Real YMin, const Standard_Real XMax, const Standard_Real YMax, const Standard_Real aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetDetectedEntities ******************/
		/**** md5 signature: fece8acd4a4e76d11f294ba9cc6b4863 ****/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "
Parameters
----------
Prs: MeshVS_Mesh
Polyline: TColgp_Array1OfPnt2d
aBox: Bnd_Box2d
aTol: float
Nodes: TColStd_HPackedMapOfInteger
Elements: TColStd_HPackedMapOfInteger

Return
-------
bool

Description
-----------
Returns maps of entities (nodes and elements) detected by mouse selection with the polyline <polyline> on the current view plane, with the tolerance atol. returns true if something is detected. it should be redefined if the advanced mesh selection is activated. default implementation returns false.
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, const TColgp_Array1OfPnt2d & Polyline, const Bnd_Box2d & aBox, const Standard_Real aTol, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetDetectedEntities ******************/
		/**** md5 signature: 97a7d4ba6637c92d2a6b081bba5e00d5 ****/
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
Filter out the maps of mesh entities so as to keep only the entities that are allowed to be selected according to the current context. returns true if any of the maps has been changed. it should be redefined if the advanced mesh selection is activated. default implementation returns false.
") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities(const opencascade::handle<MeshVS_Mesh> & Prs, opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes, opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetGeom ******************/
		/**** md5 signature: 236738bc464d6c86415c7d5b5ad6b029 ****/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool
Coords: TColStd_Array1OfReal

Return
-------
NbNodes: int
Type: MeshVS_EntityType

Description
-----------
Returns geometry information about node or element id is the numerical identificator of node or element iselement indicates this id describe node ( if standard_false ) or element ( if standard_true ) coords is an array of coordinates of node(s). for node it is only 3 numbers: x, y, z in the strict order for element it is 3*n numbers, where n is number of this element vertices the order is strict also: x1, y1, z1, x2,...., where xi, yi, zi are coordinates of vertices nbnodes is number of nodes. it is recommended this parameter to be set to 1 for node. type is type of node or element (from enumeration). it is recommended this parameter to be set to meshvs_et_node for node.
") GetGeom;
		virtual Standard_Boolean GetGeom(const Standard_Integer ID, const Standard_Boolean IsElement, TColStd_Array1OfReal & Coords, Standard_Integer &OutValue, MeshVS_EntityType &OutValue);

		/****************** GetGeomType ******************/
		/**** md5 signature: eb6b64ef92d6a945955b31254bcb6494 ****/
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
This method is similar to getgeom, but returns only element or node type.
") GetGeomType;
		virtual Standard_Boolean GetGeomType(const Standard_Integer ID, const Standard_Boolean IsElement, MeshVS_EntityType &OutValue);

		/****************** GetGroup ******************/
		/**** md5 signature: 1a3c1478c7f404ba800dbc98c1c57d18 ****/
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
		virtual Standard_Boolean GetGroup(const Standard_Integer Id, MeshVS_EntityType &OutValue, TColStd_PackedMapOfInteger & Ids);

		/****************** GetGroupAddr ******************/
		/**** md5 signature: f59ca8de5242f70e386e2080c54c525e ****/
		%feature("compactdefaultargs") GetGroupAddr;
		%feature("autodoc", "
Parameters
----------
ID: int

Return
-------
Standard_Address

Description
-----------
This method returns pointer which represents group data structure. this address will be saved in meshvs_meshowner, so that you can access to data structure fast by the method owner(). in the redefined method you can return null. id is the numerical identificator of group.
") GetGroupAddr;
		virtual Standard_Address GetGroupAddr(const Standard_Integer ID);

		/****************** GetNodeNormal ******************/
		/**** md5 signature: a73de6e26f9a8368c5f1f3a63f1b8361 ****/
		%feature("compactdefaultargs") GetNodeNormal;
		%feature("autodoc", "
Parameters
----------
ranknode: int
ElementId: int

Return
-------
nx: float
ny: float
nz: float

Description
-----------
This method return normal of node ranknode of face id, which is using for smooth shading presentation. returns false if normal isn't defined.
") GetNodeNormal;
		virtual Standard_Boolean GetNodeNormal(const Standard_Integer ranknode, const Standard_Integer ElementId, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetNodesByElement ******************/
		/**** md5 signature: d0d6e8359648ad25a1192af7b2745033 ****/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "
Parameters
----------
ID: int
NodeIDs: TColStd_Array1OfInteger

Return
-------
NbNodes: int

Description
-----------
This method returns information about nodes this element consist of. id is the numerical identificator of element. nodeids is the output array of nodes ids in correct order, the same as coordinates returned by getgeom(). nbnodes is number of nodes (number of items set in nodeids). returns false if element does not exist.
") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement(const Standard_Integer ID, TColStd_Array1OfInteger & NodeIDs, Standard_Integer &OutValue);

		/****************** GetNormal ******************/
		/**** md5 signature: 500534b89a1e875e9c4d452ed489ad06 ****/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "
Parameters
----------
Id: int
Max: int

Return
-------
nx: float
ny: float
nz: float

Description
-----------
This method calculates normal of face, which is using for correct reflection presentation. there is default method, for advance reflection this method can be redefined. id is the numerical identificator of only element! max is maximal number of nodes an element can consist of nx, ny, nz are values whose represent coordinates of normal (will be returned) in the redefined method you can return normal with length more then 1, but in this case the appearance of element will be more bright than usual. for ordinary brightness you must return normal with length 1.
") GetNormal;
		virtual Standard_Boolean GetNormal(const Standard_Integer Id, const Standard_Integer Max, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetNormalsByElement ******************/
		/**** md5 signature: 5bc1160db0f3dacd3684809a3c6741ee ****/
		%feature("compactdefaultargs") GetNormalsByElement;
		%feature("autodoc", "
Parameters
----------
Id: int
IsNodal: bool
MaxNodes: int
Normals: TColStd_HArray1OfReal

Return
-------
bool

Description
-----------
This method puts components of normal vectors at each node of a mesh face (at each face of a mesh volume) into the output array. returns false if some problem was detected during calculation of normals. id is an identifier of the mesh element. isnodal, when true, means that normals at mesh element nodes are needed. if nodal normals are not available, or isnodal is false, or the mesh element is a volume, then the output array contents depend on the element type: face: a normal calculated by getnormal() is duplicated for each node of the face; volume: normals to all faces of the volume are computed (not for each node!). maxnodes is maximal number of nodes an element can consist of. normals contains the result.
") GetNormalsByElement;
		virtual Standard_Boolean GetNormalsByElement(const Standard_Integer Id, const Standard_Boolean IsNodal, const Standard_Integer MaxNodes, opencascade::handle<TColStd_HArray1OfReal> & Normals);

		/****************** IsAdvancedSelectionEnabled ******************/
		/**** md5 signature: 0a4527ba84561e243a67ee25f22fa965 ****/
		%feature("compactdefaultargs") IsAdvancedSelectionEnabled;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if advanced mesh selection is enabled. default implementation returns false. it should be redefined to return true for advanced mesh selection activation.
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
		/**** md5 signature: 67d5c1cb61cb7dc5c5dcda590104f88e ****/
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

		/****************** GetAsciiString ******************/
		/**** md5 signature: 980447bc465e0e51928234e7974d5e51 ****/
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
		Standard_Boolean GetAsciiString(const Standard_Integer Key, TCollection_AsciiString & Value);

		/****************** GetBoolean ******************/
		/**** md5 signature: 661236443c09aa3dea3e0628bbae48cc ****/
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
		Standard_Boolean GetBoolean(const Standard_Integer Key, Standard_Boolean &OutValue);

		/****************** GetColor ******************/
		/**** md5 signature: 954adab9cb8c5c3525c2d25399bc0a02 ****/
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
		Standard_Boolean GetColor(const Standard_Integer Key, Quantity_Color & Value);

		/****************** GetDouble ******************/
		/**** md5 signature: bc999c492e4b274fc40d2be78d129201 ****/
		%feature("compactdefaultargs") GetDouble;
		%feature("autodoc", "
Parameters
----------
Key: int

Return
-------
Value: float

Description
-----------
No available documentation.
") GetDouble;
		Standard_Boolean GetDouble(const Standard_Integer Key, Standard_Real &OutValue);

		/****************** GetInteger ******************/
		/**** md5 signature: 05ce6af02ccf603cf6ad37f1d6765637 ****/
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
		Standard_Boolean GetInteger(const Standard_Integer Key, Standard_Integer &OutValue);

		/****************** GetMaterial ******************/
		/**** md5 signature: 7f38c85ff79dfe29671c1206fcac61e9 ****/
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
		Standard_Boolean GetMaterial(const Standard_Integer Key, Graphic3d_MaterialAspect & Value);

		/****************** RemoveAsciiString ******************/
		/**** md5 signature: 1739edca05fc8a72d5e20d42d9c98fba ****/
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
		Standard_Boolean RemoveAsciiString(const Standard_Integer Key);

		/****************** RemoveBoolean ******************/
		/**** md5 signature: d180d64aa3a9b6170f2087ee87c2892e ****/
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
		Standard_Boolean RemoveBoolean(const Standard_Integer Key);

		/****************** RemoveColor ******************/
		/**** md5 signature: 0dbc5af555966db5baf7a8fdaa19e379 ****/
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
		Standard_Boolean RemoveColor(const Standard_Integer Key);

		/****************** RemoveDouble ******************/
		/**** md5 signature: c8f20967e75146b3e9064cbab4cdd2b5 ****/
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
		Standard_Boolean RemoveDouble(const Standard_Integer Key);

		/****************** RemoveInteger ******************/
		/**** md5 signature: 41ccd6ede3a72d28cd4e5f162ef39a69 ****/
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
		Standard_Boolean RemoveInteger(const Standard_Integer Key);

		/****************** RemoveMaterial ******************/
		/**** md5 signature: f7240a5f552dfcea104ac4efaa46303d ****/
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
		Standard_Boolean RemoveMaterial(const Standard_Integer Key);

		/****************** SetAsciiString ******************/
		/**** md5 signature: 4bb4dfb7bba0ee266a870b60887f1414 ****/
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
		void SetAsciiString(const Standard_Integer Key, TCollection_AsciiString Value);

		/****************** SetBoolean ******************/
		/**** md5 signature: de57cc8afe03434b7e50da2a4245e18d ****/
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
		void SetBoolean(const Standard_Integer Key, const Standard_Boolean Value);

		/****************** SetColor ******************/
		/**** md5 signature: 51518b287c4b057fdfb682712d6beb0d ****/
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
		void SetColor(const Standard_Integer Key, const Quantity_Color & Value);

		/****************** SetDouble ******************/
		/**** md5 signature: c6f733ec0fc0c0ae57652aabe5b63172 ****/
		%feature("compactdefaultargs") SetDouble;
		%feature("autodoc", "
Parameters
----------
Key: int
Value: float

Return
-------
None

Description
-----------
No available documentation.
") SetDouble;
		void SetDouble(const Standard_Integer Key, const Standard_Real Value);

		/****************** SetInteger ******************/
		/**** md5 signature: 9b086ff56befec593e73f8dbc44e910d ****/
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
		void SetInteger(const Standard_Integer Key, const Standard_Integer Value);

		/****************** SetMaterial ******************/
		/**** md5 signature: ec5bef34f51823a11fa87227c77cfb26 ****/
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
		/**** md5 signature: c3ed78b0bf1ed26fef4c19f03cff20ad ****/
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

		/****************** BVH ******************/
		/**** md5 signature: 9d26e1a47d3d96ad1039d301e2b44c49 ****/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BVH;
		virtual void BVH();

		/****************** BoundingBox ******************/
		/**** md5 signature: 32bbe8c17aea605d2fa20f6fee7f740c ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
No available documentation.
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		/**** md5 signature: 91b253b06a291fc09a167246137ee4aa ****/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** Clear ******************/
		/**** md5 signature: f671931d03948860d0ead34afbe920aa ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		virtual void Clear();

		/****************** HasInitLocation ******************/
		/**** md5 signature: edc5a554015cfcdb8ed506ef584abd9a ****/
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasInitLocation;
		virtual Standard_Boolean HasInitLocation();

		/****************** InvInitLocation ******************/
		/**** md5 signature: 0936d499373bc9751f62eda55911c449 ****/
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
No available documentation.
") InvInitLocation;
		virtual gp_GTrsf InvInitLocation();

		/****************** Matches ******************/
		/**** md5 signature: 9840986fdc32d0b45aedaac5faa8bc9b ****/
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
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		/**** md5 signature: 67776b0ab204a0dd707f457a7c3a6214 ****/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** ToBuildBVH ******************/
		/**** md5 signature: 3e202142e81f8f905fd9631c2ddd9a95 ****/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ToBuildBVH;
		virtual Standard_Boolean ToBuildBVH();

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
		/**** md5 signature: fe240a75d13b9391c25314abc0867d90 ****/
		%feature("compactdefaultargs") MeshVS_Mesh;
		%feature("autodoc", "
Parameters
----------
theIsAllowOverlapped: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructor. theisallowoverlapped is standard_true, if it is allowed to draw edges overlapped with beams its value is stored in drawer.
") MeshVS_Mesh;
		 MeshVS_Mesh(const Standard_Boolean theIsAllowOverlapped = Standard_False);

		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: 73e6b64240388c9f5967edd29a7d922a ****/
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
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** AddBuilder ******************/
		/**** md5 signature: d60e5808e5ea2af86163a042c40daf6b ****/
		%feature("compactdefaultargs") AddBuilder;
		%feature("autodoc", "
Parameters
----------
Builder: MeshVS_PrsBuilder
TreatAsHilighter: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Adds builder to tale of sequence. prsbuilder is builder to be added if treatashilighter is true, meshvs_mesh will use this builder to create presentation of hilighted and selected owners. only one builder can be hilighter, so that if you call this method with treatashilighter = standard_true some times, only last builder will be hilighter warning: as minimum one builder must be added as hilighter, otherwise selection cannot be computed.
") AddBuilder;
		void AddBuilder(const opencascade::handle<MeshVS_PrsBuilder> & Builder, const Standard_Boolean TreatAsHilighter = Standard_False);

		/****************** ClearSelected ******************/
		/**** md5 signature: 3aaae3eac8509b6abfc3ffd58cbe26e1 ****/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal selection presentation.
") ClearSelected;
		virtual void ClearSelected();

		/****************** Compute ******************/
		/**** md5 signature: b295279843aabf998f201e59d7c8b091 ****/
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
Computes presentation using builders added to sequence. each builder computes own part of mesh presentation according to its type.
") Compute;
		virtual void Compute(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Presentation> & thePrs, const Standard_Integer theDispMode);

		/****************** ComputeSelection ******************/
		/**** md5 signature: 7321d14f9e1f7bb97bdc8aec5055880a ****/
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
Computes selection according to selectmode.
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSel, const Standard_Integer theSelMode);

		/****************** FindBuilder ******************/
		/**** md5 signature: bb263b949271eb7f143c55d2bc9b8716 ****/
		%feature("compactdefaultargs") FindBuilder;
		%feature("autodoc", "
Parameters
----------
TypeString: str

Return
-------
opencascade::handle<MeshVS_PrsBuilder>

Description
-----------
Finds builder by its type the string represents.
") FindBuilder;
		opencascade::handle<MeshVS_PrsBuilder> FindBuilder(Standard_CString TypeString);

		/****************** GetBuilder ******************/
		/**** md5 signature: 4c9607e94ac7aa236064857b9e1b7e7b ****/
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
		opencascade::handle<MeshVS_PrsBuilder> GetBuilder(const Standard_Integer Index);

		/****************** GetBuilderById ******************/
		/**** md5 signature: c5e3b37adcea1aa322a932d8bd63ddf5 ****/
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
Returns builder by its id.
") GetBuilderById;
		opencascade::handle<MeshVS_PrsBuilder> GetBuilderById(const Standard_Integer Id);

		/****************** GetBuildersCount ******************/
		/**** md5 signature: 32eab94530beac056352712ae1bad7a6 ****/
		%feature("compactdefaultargs") GetBuildersCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
How many builders there are in sequence.
") GetBuildersCount;
		Standard_Integer GetBuildersCount();

		/****************** GetDataSource ******************/
		/**** md5 signature: ca32be43189ef73b1d72b94994846adb ****/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
Returns default builders' data source.
") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource();

		/****************** GetDrawer ******************/
		/**** md5 signature: e55b0999dd530fcd96c63028c7005ff9 ****/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_Drawer>

Description
-----------
Returns default builders' drawer.
") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer();

		/****************** GetFreeId ******************/
		/**** md5 signature: 34e64d8664d6cf8b1d7cb4b452f9928a ****/
		%feature("compactdefaultargs") GetFreeId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the smallest positive id, not occupied by any builder. this method using when builder is created with id = -1.
") GetFreeId;
		Standard_Integer GetFreeId();

		/****************** GetHiddenElems ******************/
		/**** md5 signature: be1d71f2cbf4dea596755f02dc1b09df ****/
		%feature("compactdefaultargs") GetHiddenElems;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns map of hidden elements (may be null handle).
") GetHiddenElems;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenElems();

		/****************** GetHiddenNodes ******************/
		/**** md5 signature: 1023896b08414adc50dd0515c5cbb9d5 ****/
		%feature("compactdefaultargs") GetHiddenNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns map of hidden nodes (may be null handle).
") GetHiddenNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenNodes();

		/****************** GetHilighter ******************/
		/**** md5 signature: 2e4cedd742a8e16362b582ee7244c945 ****/
		%feature("compactdefaultargs") GetHilighter;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_PrsBuilder>

Description
-----------
Returns hilighter.
") GetHilighter;
		opencascade::handle<MeshVS_PrsBuilder> GetHilighter();

		/****************** GetMeshSelMethod ******************/
		/**** md5 signature: a5526e7d4552c8494b10304212397f1c ****/
		%feature("compactdefaultargs") GetMeshSelMethod;
		%feature("autodoc", "Return
-------
MeshVS_MeshSelectionMethod

Description
-----------
Returns set mesh selection method (see meshvs.cdl).
") GetMeshSelMethod;
		MeshVS_MeshSelectionMethod GetMeshSelMethod();

		/****************** GetOwnerMaps ******************/
		/**** md5 signature: e7c60cba79c9850e273bd8f1163979a1 ****/
		%feature("compactdefaultargs") GetOwnerMaps;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
MeshVS_DataMapOfIntegerOwner

Description
-----------
Returns map of owners.
") GetOwnerMaps;
		const MeshVS_DataMapOfIntegerOwner & GetOwnerMaps(const Standard_Boolean IsElement);

		/****************** GetSelectableNodes ******************/
		/**** md5 signature: 9edd74a16dbce1c76f74fa06853e8c35 ****/
		%feature("compactdefaultargs") GetSelectableNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns map of selectable elements (may be null handle).
") GetSelectableNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectableNodes();

		/****************** HilightOwnerWithColor ******************/
		/**** md5 signature: b933f8f1e93b95072660d63113069b6b ****/
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
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theColor, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		/**** md5 signature: 02ea231dde8ab5fdb0f76203fa6bc528 ****/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theOwners: SelectMgr_SequenceOfOwner

Return
-------
None

Description
-----------
Draw selected owners presentation.
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const SelectMgr_SequenceOfOwner & theOwners);

		/****************** IsHiddenElem ******************/
		/**** md5 signature: 339016e180c5cdd521a10fae084f893c ****/
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
Returns true if specified element is hidden by default no elements are hidden.
") IsHiddenElem;
		Standard_Boolean IsHiddenElem(const Standard_Integer ID);

		/****************** IsHiddenNode ******************/
		/**** md5 signature: a06a0f17f5ce205e01607e3374ef1f31 ****/
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
Returns true if specified node is hidden. by default all nodes are hidden.
") IsHiddenNode;
		Standard_Boolean IsHiddenNode(const Standard_Integer ID);

		/****************** IsSelectableElem ******************/
		/**** md5 signature: a233c34e87306c44ddab4d20330c1538 ****/
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
Returns true if specified element is not hidden.
") IsSelectableElem;
		Standard_Boolean IsSelectableElem(const Standard_Integer ID);

		/****************** IsSelectableNode ******************/
		/**** md5 signature: 2f1097431eb644cb5272a29635d8afd7 ****/
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
Returns true if specified node is specified as selectable.
") IsSelectableNode;
		Standard_Boolean IsSelectableNode(const Standard_Integer ID);

		/****************** IsWholeMeshOwner ******************/
		/**** md5 signature: c9123b7ffaf4c7d5c14ccf4f0f01f4a7 ****/
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
Returns true if the given owner represents a whole mesh.
") IsWholeMeshOwner;
		virtual Standard_Boolean IsWholeMeshOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** RemoveBuilder ******************/
		/**** md5 signature: 91238f8d2688b9d457e0aa4a98ead380 ****/
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
Removes builder from sequence. if it is hilighter, hilighter will be null ( don't remember to set it to other after!!! ).
") RemoveBuilder;
		void RemoveBuilder(const Standard_Integer Index);

		/****************** RemoveBuilderById ******************/
		/**** md5 signature: d33c5b2b3523d19b34f1219fd1f5d68e ****/
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
Removes builder with identificator id.
") RemoveBuilderById;
		void RemoveBuilderById(const Standard_Integer Id);

		/****************** SetDataSource ******************/
		/**** md5 signature: cf54d237029680a3719d8edb73eef545 ****/
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

		/****************** SetDrawer ******************/
		/**** md5 signature: 2eccb5055064a6c34829ec8b5575e9e1 ****/
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

		/****************** SetHiddenElems ******************/
		/**** md5 signature: 834907541ed9fd153ae875a7d6fab8ad ****/
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

		/****************** SetHiddenNodes ******************/
		/**** md5 signature: bc57e17e115dc7e6d5e4771ae554e85e ****/
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
Sets map of hidden nodes, which shall not be displayed individually. if nodes shared by some elements shall not be drawn, they should be included into that map.
") SetHiddenNodes;
		void SetHiddenNodes(const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****************** SetHilighter ******************/
		/**** md5 signature: 8504bcd4ae7a31d283b945f96d87c649 ****/
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

		/****************** SetHilighter ******************/
		/**** md5 signature: e5f68f6036b771f1b0297867186d1c58 ****/
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
Sets builder with sequence index 'index' as hilighter.
") SetHilighter;
		Standard_Boolean SetHilighter(const Standard_Integer Index);

		/****************** SetHilighterById ******************/
		/**** md5 signature: 848dc5ba14481455f494297e6a4bf1b4 ****/
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
Sets builder with identificator 'id' as hilighter.
") SetHilighterById;
		Standard_Boolean SetHilighterById(const Standard_Integer Id);

		/****************** SetMeshSelMethod ******************/
		/**** md5 signature: c10e4a5f5393f18d85fd94be33f8cdab ****/
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
Sets mesh selection method (see meshvs.cdl).
") SetMeshSelMethod;
		void SetMeshSelMethod(const MeshVS_MeshSelectionMethod M);

		/****************** SetSelectableNodes ******************/
		/**** md5 signature: 6092b46eb1966f9197594ca27a1efb6a ****/
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

		/****************** UpdateSelectableNodes ******************/
		/**** md5 signature: 5490c8d651606c343ee26ac0fab57f44 ****/
		%feature("compactdefaultargs") UpdateSelectableNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Automatically computes selectable nodes; the node is considered as being selectable if it is either not hidden, or is hidden but referred by at least one non-hidden element. thus all nodes that are visible (either individually, or as ends or corners of elements) are selectable by default.
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
		/**** md5 signature: a77712dc21cb3dc01d05e26fbb56395f ****/
		%feature("compactdefaultargs") MeshVS_MeshEntityOwner;
		%feature("autodoc", "
Parameters
----------
SelObj: SelectMgr_SelectableObject *
ID: int
MeshEntity: Standard_Address
Type: MeshVS_EntityType
Priority: int (optional, default to 0)
IsGroup: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_MeshEntityOwner;
		 MeshVS_MeshEntityOwner(const SelectMgr_SelectableObject * SelObj, const Standard_Integer ID, const Standard_Address MeshEntity, const MeshVS_EntityType & Type, const Standard_Integer Priority = 0, const Standard_Boolean IsGroup = Standard_False);

		/****************** Clear ******************/
		/**** md5 signature: 401ba939842ce70931456eb9d3e1a706 ****/
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
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & PM, const Standard_Integer Mode = 0);

		/****************** HilightWithColor ******************/
		/**** md5 signature: ff872ded3a30d3b368f40f78eef3d5d8 ****/
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
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode);

		/****************** ID ******************/
		/**** md5 signature: bad178b94960474569631e20c0ad1e69 ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns id of element or node data structure.
") ID;
		Standard_Integer ID();

		/****************** IsGroup ******************/
		/**** md5 signature: e660c7bda60aefcf529299fcfc114978 ****/
		%feature("compactdefaultargs") IsGroup;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if owner represents group of nodes or elements.
") IsGroup;
		Standard_Boolean IsGroup();

		/****************** IsHilighted ******************/
		/**** md5 signature: 9c4f932880358f701615d9dc25c4681e ****/
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
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & PM, const Standard_Integer Mode = 0);

		/****************** Owner ******************/
		/**** md5 signature: f0f0b85617a42f6e65494d2589a58a54 ****/
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "Return
-------
Standard_Address

Description
-----------
Returns an address of element or node data structure.
") Owner;
		Standard_Address Owner();

		/****************** Type ******************/
		/**** md5 signature: bbf39ad1e96486bac0abdece768add02 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
MeshVS_EntityType

Description
-----------
Returns type of element or node data structure.
") Type;
		MeshVS_EntityType Type();

		/****************** Unhilight ******************/
		/**** md5 signature: 9ae1a51ca1eb9f753166d846d77a208b ****/
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
		/**** md5 signature: 79bc78bf8bd3c50df42d974f5b190112 ****/
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
		 MeshVS_MeshOwner(const SelectMgr_SelectableObject * theSelObj, const opencascade::handle<MeshVS_DataSource> & theDS, const Standard_Integer thePriority = 0);

		/****************** AddSelectedEntities ******************/
		/**** md5 signature: 930a2aa4220ee7f25e67119672984a05 ****/
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

		/****************** ClearSelectedEntities ******************/
		/**** md5 signature: af2bd659b7b2c6682a06adb420ba4d31 ****/
		%feature("compactdefaultargs") ClearSelectedEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears ids of selected mesh entities.
") ClearSelectedEntities;
		virtual void ClearSelectedEntities();

		/****************** GetDataSource ******************/
		/**** md5 signature: d85e268855ae7570709111f1bfed2357 ****/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
No available documentation.
") GetDataSource;
		const opencascade::handle<MeshVS_DataSource> & GetDataSource();

		/****************** GetDetectedElements ******************/
		/**** md5 signature: 04b7410693d348f1c14a3a9427d1f89c ****/
		%feature("compactdefaultargs") GetDetectedElements;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of hilighted mesh elements.
") GetDetectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedElements();

		/****************** GetDetectedNodes ******************/
		/**** md5 signature: c0389016e4ca7143ab9f3b57802362c0 ****/
		%feature("compactdefaultargs") GetDetectedNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of hilighted mesh nodes.
") GetDetectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedNodes();

		/****************** GetSelectedElements ******************/
		/**** md5 signature: dff7dcfb193f36f3bdf59e566d193e5e ****/
		%feature("compactdefaultargs") GetSelectedElements;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of selected mesh elements.
") GetSelectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedElements();

		/****************** GetSelectedNodes ******************/
		/**** md5 signature: f43499b5276f262e4f555eee435c7e1a ****/
		%feature("compactdefaultargs") GetSelectedNodes;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Returns ids of selected mesh nodes.
") GetSelectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedNodes();

		/****************** HilightWithColor ******************/
		/**** md5 signature: d288227b2265be6943d8ce162a7983ea ****/
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
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theColor, const Standard_Integer theMode);

		/****************** IsForcedHilight ******************/
		/**** md5 signature: b7e8a39578fc441f958f06f3cf923c7d ****/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight();

		/****************** SetDetectedEntities ******************/
		/**** md5 signature: 04e17c5f7ec31d9c8284ca04c87e19de ****/
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

		/****************** Unhilight ******************/
		/**** md5 signature: 9ae1a51ca1eb9f753166d846d77a208b ****/
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
		/**** md5 signature: f1fffe91fd488e2d1a9e79c01f80773b ****/
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
Builds presentation of certain type of data. prs is presentation object which this method constructs. ids is set of numeric identificators forming object appearance. idstoexclude is set of ids to exclude from processing. if some entity has been excluded, it is not processed by other builders. iselement indicates, ids is identificators of nodes or elements. displaymode is numeric constant describing display mode (see meshvs_displaymodeflags.hxx).
") Build;
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** CustomBuild ******************/
		/**** md5 signature: 75716b05b96392b7ded84d62e3ac633e ****/
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
This method is called to build presentation of custom elements (they have meshvs_et_0d type). ids is set of numeric identificators of elements for custom building. idstoexclude is set of ids to exclude from processing. if some entity has been excluded, it is not processed by other builders. displaymode is numeric constant describing display mode (see meshvs_displaymodeflags.hxx).
") CustomBuild;
		virtual void CustomBuild(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Integer DisplayMode);

		/****************** CustomSensitiveEntity ******************/
		/**** md5 signature: 4c22a4dbf4612bcb6578f5bc2cc90590 ****/
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
This method is called to build sensitive of custom elements ( they have meshvs_et_0d type ).
") CustomSensitiveEntity;
		virtual opencascade::handle<Select3D_SensitiveEntity> CustomSensitiveEntity(const opencascade::handle<SelectMgr_EntityOwner> & Owner, const Standard_Integer SelectMode);

		/****************** GetDataSource ******************/
		/**** md5 signature: ca32be43189ef73b1d72b94994846adb ****/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
Returns custom data source or default ( from meshvs_mesh ) if custom is null.
") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource();

		/****************** GetDrawer ******************/
		/**** md5 signature: e55b0999dd530fcd96c63028c7005ff9 ****/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_Drawer>

Description
-----------
Returns custom drawer or default ( from meshvs_mesh ) if custom is null.
") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer();

		/****************** GetFlags ******************/
		/**** md5 signature: 38653d26e8e65805738b7154ff29aed8 ****/
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns flags, assigned with builder during creation.
") GetFlags;
		Standard_Integer GetFlags();

		/****************** GetId ******************/
		/**** md5 signature: 11c7246d8af76c1198cac9fd7724d2dd ****/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns builder id.
") GetId;
		Standard_Integer GetId();

		/****************** GetPresentationManager ******************/
		/**** md5 signature: 6e40a1f4cb619282f3f5fef0362d30c7 ****/
		%feature("compactdefaultargs") GetPresentationManager;
		%feature("autodoc", "Return
-------
opencascade::handle<PrsMgr_PresentationManager>

Description
-----------
Get presentation manager of builder.
") GetPresentationManager;
		opencascade::handle<PrsMgr_PresentationManager> GetPresentationManager();

		/****************** GetPriority ******************/
		/**** md5 signature: 14b4b2b155ca725d4cb06c0280e4a399 ****/
		%feature("compactdefaultargs") GetPriority;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns priority; as priority bigger, as soon builder will be called.
") GetPriority;
		Standard_Integer GetPriority();

		/****************** IsExcludingOn ******************/
		/**** md5 signature: 0975046299496f8881159ae681af1f35 ****/
		%feature("compactdefaultargs") IsExcludingOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Read excluding state.
") IsExcludingOn;
		Standard_Boolean IsExcludingOn();

		/****************** SetDataSource ******************/
		/**** md5 signature: acf169d625c2a3f54c3be9a96b5dd7e1 ****/
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

		/****************** SetDrawer ******************/
		/**** md5 signature: f908e5dab8929fcf39a3d215cf9ced40 ****/
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

		/****************** SetExcluding ******************/
		/**** md5 signature: 150df8f9b6aba7cbc32445f11e1c7503 ****/
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
Set excluding state. if it is standard_true, the nodes or elements, processed by current builder will be noted and next builder won't process its.
") SetExcluding;
		void SetExcluding(const Standard_Boolean state);

		/****************** SetPresentationManager ******************/
		/**** md5 signature: d173303c18adee38a57fbcdd196f3023 ****/
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

		/****************** TestFlags ******************/
		/**** md5 signature: 3f81fdd69e6875a0d0713045b35799f3 ****/
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
Test whether display mode has flags assigned with this builder. this method has default implementation and can be redefined for advance behavior returns standard_true only if display mode is appropriate for this builder.
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
		/**** md5 signature: cd5bfe64bc48e5864fc6fe3173c13a4c ****/
		%feature("compactdefaultargs") MeshVS_SensitiveFace;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt
theSensType: Select3D_TypeOfSensitivity (optional, default to Select3D_TOS_INTERIOR)

Return
-------
None

Description
-----------
No available documentation.
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
		/**** md5 signature: f0afd46a7fa181a120825a9dae839b6a ****/
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
		 MeshVS_SensitiveMesh(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Integer theMode = 0);

		/****************** BoundingBox ******************/
		/**** md5 signature: 32bbe8c17aea605d2fa20f6fee7f740c ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of mesh.
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		/**** md5 signature: 25c8cb59bf9cf3d8018e9e747d82efdc ****/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of mesh.
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		/**** md5 signature: 2d4e6989177861b3aea0f57481cfcdfc ****/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** GetMode ******************/
		/**** md5 signature: 8a406f0a5af92395f75f8988d367be4e ****/
		%feature("compactdefaultargs") GetMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMode;
		Standard_Integer GetMode();

		/****************** Matches ******************/
		/**** md5 signature: 683d61af923e98abd5b9028ab7397b73 ****/
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
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		/**** md5 signature: 67776b0ab204a0dd707f457a7c3a6214 ****/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of mesh nodes.
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
		/**** md5 signature: 9d565f0228ccf4e8902f6ea9478a947e ****/
		%feature("compactdefaultargs") MeshVS_SensitivePolyhedron;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theNodes: TColgp_Array1OfPnt
theTopo: MeshVS_HArray1OfSequenceOfInteger

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_SensitivePolyhedron;
		 MeshVS_SensitivePolyhedron(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const TColgp_Array1OfPnt & theNodes, const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & theTopo);

		/****************** BoundingBox ******************/
		/**** md5 signature: 32bbe8c17aea605d2fa20f6fee7f740c ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
No available documentation.
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		/**** md5 signature: 25c8cb59bf9cf3d8018e9e747d82efdc ****/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		/**** md5 signature: 2d4e6989177861b3aea0f57481cfcdfc ****/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		/**** md5 signature: 9840986fdc32d0b45aedaac5faa8bc9b ****/
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
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		/**** md5 signature: 67776b0ab204a0dd707f457a7c3a6214 ****/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of nodes of polyhedron.
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
		/**** md5 signature: cabec64e54089ae532909beb1c0b3d4f ****/
		%feature("compactdefaultargs") MeshVS_SensitiveQuad;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theQuadVerts: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Creates a new instance and initializes quadrangle vertices with the given points.
") MeshVS_SensitiveQuad;
		 MeshVS_SensitiveQuad(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const TColgp_Array1OfPnt & theQuadVerts);

		/****************** MeshVS_SensitiveQuad ******************/
		/**** md5 signature: 8164a0cdeb9a24fa1506bde94ab30186 ****/
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

		/****************** BoundingBox ******************/
		/**** md5 signature: 32bbe8c17aea605d2fa20f6fee7f740c ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns coordinates of the box.
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		/**** md5 signature: 25c8cb59bf9cf3d8018e9e747d82efdc ****/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the box.
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		/**** md5 signature: 2d4e6989177861b3aea0f57481cfcdfc ****/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns a copy of this sensitive quadrangle.
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		/**** md5 signature: 9840986fdc32d0b45aedaac5faa8bc9b ****/
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
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		/**** md5 signature: d42012759817bcd1e404a0d71391ca3b ****/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities in sensitive.
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
		/**** md5 signature: efc5c2e36dd0f6deb1081e6a21890c91 ****/
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
		/****************** CreateAspectFillArea3d ******************/
		/**** md5 signature: b15df73c10a2e3399531964f22de803d ****/
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Graphic3d_AspectFillArea3d>

Description
-----------
Creates fill area aspect with values from drawer according to keys from drawerattribute.
") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectFillArea3d ******************/
		/**** md5 signature: a14dbd7ddfea48c4fc1fe8baa222e55c ****/
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
Mat: Graphic3d_MaterialAspect
UseDefaults: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Graphic3d_AspectFillArea3d>

Description
-----------
Creates fill aspect with values from drawer according to keys from drawerattribute and specific material aspect.
") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Graphic3d_MaterialAspect & Mat, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectLine3d ******************/
		/**** md5 signature: 1ac241a34d1948fa04552f4c4d6ca8e7 ****/
		%feature("compactdefaultargs") CreateAspectLine3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Graphic3d_AspectLine3d>

Description
-----------
Creates line aspect with values from drawer according to keys from drawerattribute.
") CreateAspectLine3d;
		static opencascade::handle<Graphic3d_AspectLine3d> CreateAspectLine3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectMarker3d ******************/
		/**** md5 signature: e68390ab1e22d98f8697ae81c2f777f8 ****/
		%feature("compactdefaultargs") CreateAspectMarker3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Graphic3d_AspectMarker3d>

Description
-----------
Creates marker aspect with values from drawer according to keys from drawerattribute.
") CreateAspectMarker3d;
		static opencascade::handle<Graphic3d_AspectMarker3d> CreateAspectMarker3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectText3d ******************/
		/**** md5 signature: 697b6464c0903aeb618e0bf708ae3d99 ****/
		%feature("compactdefaultargs") CreateAspectText3d;
		%feature("autodoc", "
Parameters
----------
theDr: MeshVS_Drawer
UseDefaults: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Graphic3d_AspectText3d>

Description
-----------
Creates text aspect with values from drawer according to keys from drawerattribute.
") CreateAspectText3d;
		static opencascade::handle<Graphic3d_AspectText3d> CreateAspectText3d(const opencascade::handle<MeshVS_Drawer> & theDr, const Standard_Boolean UseDefaults = Standard_True);

		/****************** GetAverageNormal ******************/
		/**** md5 signature: 8b4f5212e8217a3da2adeb55bd9ba7f8 ****/
		%feature("compactdefaultargs") GetAverageNormal;
		%feature("autodoc", "
Parameters
----------
Nodes: TColStd_Array1OfReal
Norm: gp_Vec

Return
-------
bool

Description
-----------
Get an average of normals to non-planar polygon described by these points or compute normal of planar polygon. if the polygon isn't planar, function returns false.
") GetAverageNormal;
		static Standard_Boolean GetAverageNormal(const TColStd_Array1OfReal & Nodes, gp_Vec & Norm);

		/****************** GetNormal ******************/
		/**** md5 signature: 5b9243d886e7ebebb545b6a5f139b18e ****/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "
Parameters
----------
Nodes: TColStd_Array1OfReal
Norm: gp_Vec

Return
-------
bool

Description
-----------
Get one of normals to polygon described by these points. if the polygon isn't planar, function returns false.
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
		int First;
		int Second;
		/****************** MeshVS_TwoNodes ******************/
		/**** md5 signature: 2b6bd8f3a56b7ff4d11d86701a1067ce ****/
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
		 MeshVS_TwoNodes(Standard_Integer aFirst = 0, Standard_Integer aSecond = 0);


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
		/****************** CreatePrismTopology ******************/
		/**** md5 signature: d6c8e6da9b8f6d56fae463a6502f1c1e ****/
		%feature("compactdefaultargs") CreatePrismTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>

Description
-----------
No available documentation.
") CreatePrismTopology;
		static opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> CreatePrismTopology(const Standard_Integer BasePoints);

		/****************** CreatePyramidTopology ******************/
		/**** md5 signature: a01fe74af1ce1a2fcabf0240543835d0 ****/
		%feature("compactdefaultargs") CreatePyramidTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>

Description
-----------
No available documentation.
") CreatePyramidTopology;
		static opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> CreatePyramidTopology(const Standard_Integer BasePoints);

		/****************** GetPrismTopology ******************/
		/**** md5 signature: 1eed36ce2e4dca7ee6cdee762154ec5e ****/
		%feature("compactdefaultargs") GetPrismTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>

Description
-----------
No available documentation.
") GetPrismTopology;
		opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> GetPrismTopology(const Standard_Integer BasePoints);

		/****************** GetPyramidTopology ******************/
		/**** md5 signature: d68eadfc6f799e8b800964b3dfb63291 ****/
		%feature("compactdefaultargs") GetPyramidTopology;
		%feature("autodoc", "
Parameters
----------
BasePoints: int

Return
-------
opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>

Description
-----------
No available documentation.
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
		/**** md5 signature: 1580b4cec98b6d92485c753e2395227a ****/
		%feature("compactdefaultargs") MeshVS_DeformedDataSource;
		%feature("autodoc", "
Parameters
----------
theNonDeformDS: MeshVS_DataSource
theMagnify: float

Return
-------
None

Description
-----------
Constructor thenondeformds is canonical non-deformed data source, by which we are able to calculate deformed mesh geometry themagnify is coefficient of displacement magnify.
") MeshVS_DeformedDataSource;
		 MeshVS_DeformedDataSource(const opencascade::handle<MeshVS_DataSource> & theNonDeformDS, const Standard_Real theMagnify);

		/****************** Get3DGeom ******************/
		/**** md5 signature: 248332cf1504c0563ce79341122b1b05 ****/
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
Data: MeshVS_HArray1OfSequenceOfInteger

Return
-------
NbNodes: int

Description
-----------
No available documentation.
") Get3DGeom;
		virtual Standard_Boolean Get3DGeom(const Standard_Integer ID, Standard_Integer &OutValue, opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Data);

		/****************** GetAddr ******************/
		/**** md5 signature: 9eef9a013ff48901691f937d1fbd84ab ****/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool

Return
-------
Standard_Address

Description
-----------
No available documentation.
") GetAddr;
		virtual Standard_Address GetAddr(const Standard_Integer ID, const Standard_Boolean IsElement);

		/****************** GetAllElements ******************/
		/**** md5 signature: f28cb49754df54daa20b135dbeb6da7e ****/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements();

		/****************** GetAllNodes ******************/
		/**** md5 signature: cbc5a32f3977b8c638304b70fa2dc0ac ****/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "Return
-------
TColStd_PackedMapOfInteger

Description
-----------
No available documentation.
") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes();

		/****************** GetGeom ******************/
		/**** md5 signature: 58ede1ff023cbc8642d219add50c5f6c ****/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "
Parameters
----------
ID: int
IsElement: bool
Coords: TColStd_Array1OfReal

Return
-------
NbNodes: int
Type: MeshVS_EntityType

Description
-----------
No available documentation.
") GetGeom;
		virtual Standard_Boolean GetGeom(const Standard_Integer ID, const Standard_Boolean IsElement, TColStd_Array1OfReal & Coords, Standard_Integer &OutValue, MeshVS_EntityType &OutValue);

		/****************** GetGeomType ******************/
		/**** md5 signature: bb5b618dd799ac6b0b83296054d88ff0 ****/
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
		virtual Standard_Boolean GetGeomType(const Standard_Integer ID, const Standard_Boolean IsElement, MeshVS_EntityType &OutValue);

		/****************** GetMagnify ******************/
		/**** md5 signature: c25f154c290857e0adeac01588dbd60a ****/
		%feature("compactdefaultargs") GetMagnify;
		%feature("autodoc", "Return
-------
float

Description
-----------
With this methods you can read and change magnify coefficient of nodal displacements.
") GetMagnify;
		Standard_Real GetMagnify();

		/****************** GetNodesByElement ******************/
		/**** md5 signature: d551dcad637c3b3952d4c02e8d7a1e94 ****/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "
Parameters
----------
ID: int
NodeIDs: TColStd_Array1OfInteger

Return
-------
NbNodes: int

Description
-----------
No available documentation.
") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement(const Standard_Integer ID, TColStd_Array1OfInteger & NodeIDs, Standard_Integer &OutValue);

		/****************** GetNonDeformedDataSource ******************/
		/**** md5 signature: 1fb350b85c910da319116b42f8799dba ****/
		%feature("compactdefaultargs") GetNonDeformedDataSource;
		%feature("autodoc", "Return
-------
opencascade::handle<MeshVS_DataSource>

Description
-----------
With this methods you can read and change internal canonical data source.
") GetNonDeformedDataSource;
		opencascade::handle<MeshVS_DataSource> GetNonDeformedDataSource();

		/****************** GetVector ******************/
		/**** md5 signature: 6068e33fec73a5ca0842696db331b0fa ****/
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
This method returns vector ( vect ) assigned to node number id.
") GetVector;
		Standard_Boolean GetVector(const Standard_Integer ID, gp_Vec & Vect);

		/****************** GetVectors ******************/
		/**** md5 signature: 0a7de57afdae824e78b66d772b516c08 ****/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "Return
-------
MeshVS_DataMapOfIntegerVector

Description
-----------
This method returns map of nodal displacement vectors.
") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors();

		/****************** SetMagnify ******************/
		/**** md5 signature: 66f2f51fb8010e769c899b3529f183d0 ****/
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "
Parameters
----------
theMagnify: float

Return
-------
None

Description
-----------
No available documentation.
") SetMagnify;
		void SetMagnify(const Standard_Real theMagnify);

		/****************** SetNonDeformedDataSource ******************/
		/**** md5 signature: f4016f982dace6441c1f73e6a09237e8 ****/
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

		/****************** SetVector ******************/
		/**** md5 signature: 16ab9f734e3df5f98c352a22ab233a69 ****/
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
This method sets vector ( vect ) assigned to node number id.
") SetVector;
		void SetVector(const Standard_Integer ID, const gp_Vec & Vect);

		/****************** SetVectors ******************/
		/**** md5 signature: bd08de1933618bdd4f69df8b9cb95030 ****/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "
Parameters
----------
Map: MeshVS_DataMapOfIntegerVector

Return
-------
None

Description
-----------
This method sets map of nodal displacement vectors (map).
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
		/**** md5 signature: 868ca6d00fa839d89fb857c48906a4a4 ****/
		%feature("compactdefaultargs") MeshVS_ElementalColorPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Flags: int (optional, default to MeshVS_DMF_ElementalColorDataPrs)
DS: MeshVS_DataSource (optional, default to 0)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_ElemColor)

Return
-------
None

Description
-----------
Constructor.
") MeshVS_ElementalColorPrsBuilder;
		 MeshVS_ElementalColorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_ElementalColorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_ElemColor);

		/****************** Build ******************/
		/**** md5 signature: 31ffdae6ff383eb79244b2dcd10b995a ****/
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
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** GetColor1 ******************/
		/**** md5 signature: 316734a949c246eb7006c2c1e89d5443 ****/
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
Returns color assigned with element number id.
") GetColor1;
		Standard_Boolean GetColor1(const Standard_Integer ID, Quantity_Color & theColor);

		/****************** GetColor2 ******************/
		/**** md5 signature: 0baf105ae378c11796eb9e8f104400ab ****/
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
Returns colors assigned with element number id.
") GetColor2;
		Standard_Boolean GetColor2(const Standard_Integer ID, MeshVS_TwoColors & theColor);

		/****************** GetColor2 ******************/
		/**** md5 signature: 088bee49a807a668ccd88f1f7fe4d23f ****/
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
Returns colors assigned with element number id thecolor1 is the front element color thecolor2 is the back element color.
") GetColor2;
		Standard_Boolean GetColor2(const Standard_Integer ID, Quantity_Color & theColor1, Quantity_Color & theColor2);

		/****************** GetColors1 ******************/
		/**** md5 signature: 0f02cc1a51ab836c612f279711433a7c ****/
		%feature("compactdefaultargs") GetColors1;
		%feature("autodoc", "Return
-------
MeshVS_DataMapOfIntegerColor

Description
-----------
Returns map of colors same for front and back side of face.
") GetColors1;
		const MeshVS_DataMapOfIntegerColor & GetColors1();

		/****************** GetColors2 ******************/
		/**** md5 signature: 77621e87abd6e6c57ed8dbb36732483d ****/
		%feature("compactdefaultargs") GetColors2;
		%feature("autodoc", "Return
-------
MeshVS_DataMapOfIntegerTwoColors

Description
-----------
Returns map of different colors for front and back side of face.
") GetColors2;
		const MeshVS_DataMapOfIntegerTwoColors & GetColors2();

		/****************** HasColors1 ******************/
		/**** md5 signature: 80d604f29a20acc630c1afb7f0fd734b ****/
		%feature("compactdefaultargs") HasColors1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true, if map of colors isn't empty.
") HasColors1;
		Standard_Boolean HasColors1();

		/****************** HasColors2 ******************/
		/**** md5 signature: 66838064007421f60ad8491aa0504bd1 ****/
		%feature("compactdefaultargs") HasColors2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true, if map isn't empty.
") HasColors2;
		Standard_Boolean HasColors2();

		/****************** SetColor1 ******************/
		/**** md5 signature: f16638a050a01c8524265d0d5d384433 ****/
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
Sets color assigned with element number id.
") SetColor1;
		void SetColor1(const Standard_Integer ID, const Quantity_Color & theColor);

		/****************** SetColor2 ******************/
		/**** md5 signature: 4c73cea48e1f219df19d0fa40005fa03 ****/
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
Sets colors assigned with element number id.
") SetColor2;
		void SetColor2(const Standard_Integer ID, const MeshVS_TwoColors & theTwoColors);

		/****************** SetColor2 ******************/
		/**** md5 signature: 8fee8ff6c0e3ac27e6ab8015178c6b10 ****/
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
Sets color assigned with element number id thecolor1 is the front element color thecolor2 is the back element color.
") SetColor2;
		void SetColor2(const Standard_Integer ID, const Quantity_Color & theColor1, const Quantity_Color & theColor2);

		/****************** SetColors1 ******************/
		/**** md5 signature: 1145b5bf67847c6cf5eec67b0cf40f0b ****/
		%feature("compactdefaultargs") SetColors1;
		%feature("autodoc", "
Parameters
----------
Map: MeshVS_DataMapOfIntegerColor

Return
-------
None

Description
-----------
Sets map of colors same for front and back side of face.
") SetColors1;
		void SetColors1(const MeshVS_DataMapOfIntegerColor & Map);

		/****************** SetColors2 ******************/
		/**** md5 signature: e6aa762d48996cddc42fbef31789c1fe ****/
		%feature("compactdefaultargs") SetColors2;
		%feature("autodoc", "
Parameters
----------
Map: MeshVS_DataMapOfIntegerTwoColors

Return
-------
None

Description
-----------
Sets map of different colors for front and back side of face.
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
		/**** md5 signature: 5ded4c0d5d5f7b37e0268457f9a79fb8 ****/
		%feature("compactdefaultargs") MeshVS_MeshPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Flags: int (optional, default to MeshVS_DMF_OCCMask)
DS: MeshVS_DataSource (optional, default to 0)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_Mesh)

Return
-------
None

Description
-----------
Creates builder with certain display mode flags, data source, id and priority.
") MeshVS_MeshPrsBuilder;
		 MeshVS_MeshPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_OCCMask, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_Mesh);

		/****************** AddVolumePrs ******************/
		/**** md5 signature: a53d326bac8c80ed690cb15f4370a3a2 ****/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Add to array polygons or polylines representing volume.
") AddVolumePrs;
		static void AddVolumePrs(const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Topo, const TColStd_Array1OfReal & Nodes, const Standard_Integer NbNodes, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Array, const Standard_Boolean IsReflected, const Standard_Boolean IsShrinked, const Standard_Boolean IsSelect, const Standard_Real ShrinkCoef);

		/****************** Build ******************/
		/**** md5 signature: 31ffdae6ff383eb79244b2dcd10b995a ****/
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
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** BuildElements ******************/
		/**** md5 signature: 54614eeea53d9adec28be04fed575e38 ****/
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
		virtual void BuildElements(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Integer DisplayMode);

		/****************** BuildHilightPrs ******************/
		/**** md5 signature: 404a7f1a8db878b685edfaf3dea16d95 ****/
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
		virtual void BuildHilightPrs(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, const Standard_Boolean IsElement);

		/****************** BuildNodes ******************/
		/**** md5 signature: 21d3c7340d7887823b24003fdc6855af ****/
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
		virtual void BuildNodes(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Integer DisplayMode);

		/****************** HowManyPrimitives ******************/
		/**** md5 signature: e773806eeb215dffd1428634f52b00ca ****/
		%feature("compactdefaultargs") HowManyPrimitives;
		%feature("autodoc", "
Parameters
----------
Topo: MeshVS_HArray1OfSequenceOfInteger
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
		/**** md5 signature: 985cc9c67bf650613585f93c94c8f618 ****/
		%feature("compactdefaultargs") MeshVS_NodalColorPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Flags: int (optional, default to MeshVS_DMF_NodalColorDataPrs)
DS: MeshVS_DataSource (optional, default to 0)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_NodalColor)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_NodalColorPrsBuilder;
		 MeshVS_NodalColorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, int Flags = MeshVS_DMF_NodalColorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_NodalColor);

		/****************** AddVolumePrs ******************/
		/**** md5 signature: 21ad97fc7d1f49fb246d5e04f8a23b29 ****/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Add to array polygons or polylines representing volume.
") AddVolumePrs;
		void AddVolumePrs(const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & theTopo, const TColStd_Array1OfInteger & theNodes, const TColStd_Array1OfReal & theCoords, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & theArray, const Standard_Boolean theIsShaded, const Standard_Integer theNbColors, const Standard_Integer theNbTexColors, const Standard_Real theColorRatio);

		/****************** Build ******************/
		/**** md5 signature: 31ffdae6ff383eb79244b2dcd10b995a ****/
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
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer DisplayMode);

		/****************** GetColor ******************/
		/**** md5 signature: 2d7a7e331945dc2dd8e3d91c84e4d855 ****/
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
		Standard_Boolean GetColor(const Standard_Integer ID, Quantity_Color & theColor);

		/****************** GetColorMap ******************/
		/**** md5 signature: 391549c09e812bde473d08f4bc848b7b ****/
		%feature("compactdefaultargs") GetColorMap;
		%feature("autodoc", "Return
-------
Aspect_SequenceOfColor

Description
-----------
Return colors used for texrture presentation.
") GetColorMap;
		const Aspect_SequenceOfColor & GetColorMap();

		/****************** GetColors ******************/
		/**** md5 signature: 91df126a989fe0b5dde0f0fa185a9923 ****/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "Return
-------
MeshVS_DataMapOfIntegerColor

Description
-----------
Returns map of colors assigned to nodes.
") GetColors;
		const MeshVS_DataMapOfIntegerColor & GetColors();

		/****************** GetInvalidColor ******************/
		/**** md5 signature: fadb3ec9710e50245d895eab1b9ccd53 ****/
		%feature("compactdefaultargs") GetInvalidColor;
		%feature("autodoc", "Return
-------
Quantity_Color

Description
-----------
Return color representing invalid texture coordinate (laying outside range [0, 1]).
") GetInvalidColor;
		Quantity_Color GetInvalidColor();

		/****************** GetTextureCoord ******************/
		/**** md5 signature: fc1058fecaa4f73c3763697750a10397 ****/
		%feature("compactdefaultargs") GetTextureCoord;
		%feature("autodoc", "
Parameters
----------
theID: int

Return
-------
float

Description
-----------
Return correspondence between node ids and texture coordinate (range [0, 1]).
") GetTextureCoord;
		Standard_Real GetTextureCoord(const Standard_Integer theID);

		/****************** GetTextureCoords ******************/
		/**** md5 signature: 996d3495372c168b45030e9e7155d751 ****/
		%feature("compactdefaultargs") GetTextureCoords;
		%feature("autodoc", "Return
-------
TColStd_DataMapOfIntegerReal

Description
-----------
Get correspondence between node ids and texture coordinates (range [0, 1]).
") GetTextureCoords;
		const TColStd_DataMapOfIntegerReal & GetTextureCoords();

		/****************** HasColors ******************/
		/**** md5 signature: 65ba7837088c84d78ae17f8fd49f49fc ****/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true, if map isn't empty.
") HasColors;
		Standard_Boolean HasColors();

		/****************** IsUseTexture ******************/
		/**** md5 signature: c8f7a210ef2beb1aceab46ef9f6d94e4 ****/
		%feature("compactdefaultargs") IsUseTexture;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Verify whether texture is used to build presentation.
") IsUseTexture;
		Standard_Boolean IsUseTexture();

		/****************** SetColor ******************/
		/**** md5 signature: 28c479cc3b6ea8981a12a4b07d4cdbab ****/
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
		void SetColor(const Standard_Integer ID, const Quantity_Color & theColor);

		/****************** SetColorMap ******************/
		/**** md5 signature: c91cbeb13214ca4c7dfedf0ef58a1007 ****/
		%feature("compactdefaultargs") SetColorMap;
		%feature("autodoc", "
Parameters
----------
theColors: Aspect_SequenceOfColor

Return
-------
None

Description
-----------
Set colors to be used for texrture presentation thecolors - colors for valid coordinates (laying in range [0, 1]).
") SetColorMap;
		void SetColorMap(const Aspect_SequenceOfColor & theColors);

		/****************** SetColors ******************/
		/**** md5 signature: 7fa1791ec1f2198e20cc531a89ec67e6 ****/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "
Parameters
----------
Map: MeshVS_DataMapOfIntegerColor

Return
-------
None

Description
-----------
Sets map of colors assigned to nodes.
") SetColors;
		void SetColors(const MeshVS_DataMapOfIntegerColor & Map);

		/****************** SetInvalidColor ******************/
		/**** md5 signature: 1ef0ceb8c20a55bffa37ac95b9992618 ****/
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

		/****************** SetTextureCoord ******************/
		/**** md5 signature: 056cb0a9015e59373e314cd92ecee7af ****/
		%feature("compactdefaultargs") SetTextureCoord;
		%feature("autodoc", "
Parameters
----------
theID: int
theCoord: float

Return
-------
None

Description
-----------
Specify correspondence between node id and texture coordinate (range [0, 1]).
") SetTextureCoord;
		void SetTextureCoord(const Standard_Integer theID, const Standard_Real theCoord);

		/****************** SetTextureCoords ******************/
		/**** md5 signature: 642e16bca0d45f6c91ff3696d5ff9134 ****/
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "
Parameters
----------
theMap: TColStd_DataMapOfIntegerReal

Return
-------
None

Description
-----------
Specify correspondence between node ids and texture coordinates (range [0, 1]).
") SetTextureCoords;
		void SetTextureCoords(const TColStd_DataMapOfIntegerReal & theMap);

		/****************** UseTexture ******************/
		/**** md5 signature: 05bcc5f219da4328bcdf495738f08ceb ****/
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
		/**** md5 signature: c75545b76161764142de559166018b6a ****/
		%feature("compactdefaultargs") MeshVS_TextPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
Height: float
Color: Quantity_Color
Flags: int (optional, default to MeshVS_DMF_TextDataPrs)
DS: MeshVS_DataSource (optional, default to 0)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_Text)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_TextPrsBuilder;
		 MeshVS_TextPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, const Standard_Real Height, const Quantity_Color & Color, int Flags = MeshVS_DMF_TextDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_Text);

		/****************** Build ******************/
		/**** md5 signature: 16c3e861f91dde5189444492d787571f ****/
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
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer theDisplayMode);

		/****************** GetText ******************/
		/**** md5 signature: 690073f8769705d72981e33275ee059c ****/
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
		Standard_Boolean GetText(const Standard_Boolean IsElement, const Standard_Integer ID, TCollection_AsciiString & Text);

		/****************** GetTexts ******************/
		/**** md5 signature: 860b64bb07e9b4ca7a665e7c37cf934f ****/
		%feature("compactdefaultargs") GetTexts;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
MeshVS_DataMapOfIntegerAsciiString

Description
-----------
Returns map of text assigned with nodes ( iselement = false ) or elements ( iselement = true ).
") GetTexts;
		const MeshVS_DataMapOfIntegerAsciiString & GetTexts(const Standard_Boolean IsElement);

		/****************** HasTexts ******************/
		/**** md5 signature: 9a3c2af6a0ace364b34161202e646171 ****/
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
Returns true if map isn't empty.
") HasTexts;
		Standard_Boolean HasTexts(const Standard_Boolean IsElement);

		/****************** SetText ******************/
		/**** md5 signature: be01fdae7d9106e2dfbc1e0bc67adcfe ****/
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
		void SetText(const Standard_Boolean IsElement, const Standard_Integer ID, TCollection_AsciiString Text);

		/****************** SetTexts ******************/
		/**** md5 signature: 417e71af0ee08340a68f99a92c30842d ****/
		%feature("compactdefaultargs") SetTexts;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
Map: MeshVS_DataMapOfIntegerAsciiString

Return
-------
None

Description
-----------
Sets map of text assigned with nodes or elements.
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
		/**** md5 signature: 5a294477d95f03d7d047542386b8df19 ****/
		%feature("compactdefaultargs") MeshVS_VectorPrsBuilder;
		%feature("autodoc", "
Parameters
----------
Parent: MeshVS_Mesh
MaxLength: float
VectorColor: Quantity_Color
Flags: int (optional, default to MeshVS_DMF_VectorDataPrs)
DS: MeshVS_DataSource (optional, default to 0)
Id: int (optional, default to -1)
Priority: int (optional, default to MeshVS_BP_Vector)
IsSimplePrs: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") MeshVS_VectorPrsBuilder;
		 MeshVS_VectorPrsBuilder(const opencascade::handle<MeshVS_Mesh> & Parent, const Standard_Real MaxLength, const Quantity_Color & VectorColor, int Flags = MeshVS_DMF_VectorDataPrs, const opencascade::handle<MeshVS_DataSource> & DS = 0, const Standard_Integer Id = -1, int Priority = MeshVS_BP_Vector, const Standard_Boolean IsSimplePrs = Standard_False);

		/****************** Build ******************/
		/**** md5 signature: 16c3e861f91dde5189444492d787571f ****/
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
		virtual void Build(const opencascade::handle<Prs3d_Presentation> & Prs, const TColStd_PackedMapOfInteger & IDs, TColStd_PackedMapOfInteger & IDsToExclude, const Standard_Boolean IsElement, const Standard_Integer theDisplayMode);

		/****************** DrawVector ******************/
		/**** md5 signature: 045b3dcc631565562bb2df5f6368f32e ****/
		%feature("compactdefaultargs") DrawVector;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf
Length: float
MaxLength: float
ArrowPoints: TColgp_Array1OfPnt
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
		void DrawVector(const gp_Trsf & theTrsf, const Standard_Real Length, const Standard_Real MaxLength, const TColgp_Array1OfPnt & ArrowPoints, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Lines, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & ArrowLines, const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Triangles);

		/****************** GetMinMaxVectorValue ******************/
		/**** md5 signature: 251df3ee4048171257895f593b3e51df ****/
		%feature("compactdefaultargs") GetMinMaxVectorValue;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
MinValue: float
MaxValue: float

Description
-----------
Calculates minimal and maximal length of vectors in map ( nodal, if iselement = false or elemental, if iselement = true ).
") GetMinMaxVectorValue;
		void GetMinMaxVectorValue(const Standard_Boolean IsElement, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetVector ******************/
		/**** md5 signature: 79033433e30156afb5e89b07eb819b01 ****/
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
		Standard_Boolean GetVector(const Standard_Boolean IsElement, const Standard_Integer ID, gp_Vec & Vect);

		/****************** GetVectors ******************/
		/**** md5 signature: 1cfbe565a9df501d7ee76dd52e0301b3 ****/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "
Parameters
----------
IsElement: bool

Return
-------
MeshVS_DataMapOfIntegerVector

Description
-----------
Returns map of vectors assigned with nodes or elements.
") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors(const Standard_Boolean IsElement);

		/****************** HasVectors ******************/
		/**** md5 signature: 7638ed98bb71c24915acaf2b229ca905 ****/
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
		Standard_Boolean HasVectors(const Standard_Boolean IsElement);

		/****************** SetSimplePrsMode ******************/
		/**** md5 signature: 7e5ce5ef286c9353a831233b580d92ba ****/
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
Sets flag that indicates is simple vector arrow mode uses or not default value is false.
") SetSimplePrsMode;
		void SetSimplePrsMode(const Standard_Boolean IsSimpleArrow);

		/****************** SetSimplePrsParams ******************/
		/**** md5 signature: c462cc17e2cd1d6421c9d60375dffa34 ****/
		%feature("compactdefaultargs") SetSimplePrsParams;
		%feature("autodoc", "
Parameters
----------
theLineWidthParam: float
theStartParam: float
theEndParam: float

Return
-------
None

Description
-----------
Sets parameters of simple vector arrwo presentation thelinewidthparam - coefficient of vector line width (to draw line instead of arrow) thestartparam and theendparam parameters of start and end of thickened ends position of thickening calculates according to parameters and maximum vector length default values are: thelinewidthparam = 2.5 thestartparam = 0.85 theendparam = 0.95.
") SetSimplePrsParams;
		void SetSimplePrsParams(const Standard_Real theLineWidthParam, const Standard_Real theStartParam, const Standard_Real theEndParam);

		/****************** SetVector ******************/
		/**** md5 signature: bebdb47d3d97fae7fd6c1765acd455aa ****/
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
		void SetVector(const Standard_Boolean IsElement, const Standard_Integer ID, const gp_Vec & Vect);

		/****************** SetVectors ******************/
		/**** md5 signature: bc95fae69f03488582eb83dfd6c4fa50 ****/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "
Parameters
----------
IsElement: bool
Map: MeshVS_DataMapOfIntegerVector

Return
-------
None

Description
-----------
Sets map of vectors assigned with nodes or elements.
") SetVectors;
		void SetVectors(const Standard_Boolean IsElement, const MeshVS_DataMapOfIntegerVector & Map);

		/****************** calculateArrow ******************/
		/**** md5 signature: 8706342719c42713485fdd4a73264c7d ****/
		%feature("compactdefaultargs") calculateArrow;
		%feature("autodoc", "
Parameters
----------
Points: TColgp_Array1OfPnt
Length: float
ArrowPart: float

Return
-------
float

Description
-----------
Calculates points of arrow presentation.
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
