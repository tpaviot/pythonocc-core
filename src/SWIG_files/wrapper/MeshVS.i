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
#include<Visual3d_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
#include<TColQuantity_module.hxx>
#include<TopoDS_module.hxx>
#include<V3d_module.hxx>
#include<TopLoc_module.hxx>
#include<Prs3d_module.hxx>
#include<StdSelect_module.hxx>
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
%template(MeshVS_PolyhedronVerts) NCollection_List <opencascade::handle <TColgp_HArray1OfPnt>>;
%template(MeshVS_PolyhedronVertsIter) NCollection_TListIterator<MeshVS_PolyhedronVerts>;
%template(MeshVS_Array1OfSequenceOfInteger) NCollection_Array1 <TColStd_SequenceOfInteger>;

%extend NCollection_Array1 <TColStd_SequenceOfInteger> {
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
%template(MeshVS_MapOfTwoNodes) NCollection_Map <MeshVS_TwoNodes , MeshVS_TwoNodesHasher>;
%template(MeshVS_DataMapOfIntegerBoolean) NCollection_DataMap <Standard_Integer , Standard_Boolean , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , Standard_Boolean , TColStd_MapIntegerHasher> {
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
%template(MeshVS_DataMapOfTwoColorsMapOfInteger) NCollection_DataMap <MeshVS_TwoColors , TColStd_MapOfInteger , MeshVS_TwoColorsHasher>;
%template(MeshVS_DataMapOfIntegerMeshEntityOwner) NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_MeshEntityOwner>, TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_MeshEntityOwner>, TColStd_MapIntegerHasher> {
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
%template(MeshVS_DataMapOfHArray1OfSequenceOfInteger) NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_HArray1OfSequenceOfInteger>, TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_HArray1OfSequenceOfInteger>, TColStd_MapIntegerHasher> {
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
%template(MeshVS_TwoNodesHasher) NCollection_DefaultHasher <MeshVS_TwoNodes>;
%template(MeshVS_SequenceOfPrsBuilder) NCollection_Sequence <opencascade::handle <MeshVS_PrsBuilder>>;
%template(MeshVS_DataMapOfIntegerColor) NCollection_DataMap <Standard_Integer , Quantity_Color , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , Quantity_Color , TColStd_MapIntegerHasher> {
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
%template(MeshVS_DataMapOfIntegerOwner) NCollection_DataMap <Standard_Integer , opencascade::handle <SelectMgr_EntityOwner>, TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , opencascade::handle <SelectMgr_EntityOwner>, TColStd_MapIntegerHasher> {
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
%template(MeshVS_DataMapOfIntegerTwoColors) NCollection_DataMap <Standard_Integer , MeshVS_TwoColors , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , MeshVS_TwoColors , TColStd_MapIntegerHasher> {
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
%template(MeshVS_DataMapOfIntegerVector) NCollection_DataMap <Standard_Integer , gp_Vec , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , gp_Vec , TColStd_MapIntegerHasher> {
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
%template(MeshVS_DataMapOfIntegerAsciiString) NCollection_DataMap <Standard_Integer , TCollection_AsciiString , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , TCollection_AsciiString , TColStd_MapIntegerHasher> {
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
%template(MeshVS_TwoColorsHasher) NCollection_DefaultHasher <MeshVS_TwoColors>;
%template(MeshVS_DataMapOfColorMapOfInteger) NCollection_DataMap <Quantity_Color , TColStd_MapOfInteger , Quantity_ColorHasher>;
%template(MeshVS_DataMapOfIntegerMaterial) NCollection_DataMap <Standard_Integer , Graphic3d_MaterialAspect , TColStd_MapIntegerHasher>;

%extend NCollection_DataMap <Standard_Integer , Graphic3d_MaterialAspect , TColStd_MapIntegerHasher> {
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
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <TColgp_HArray1OfPnt>> MeshVS_PolyhedronVerts;
typedef NCollection_List <opencascade::handle <TColgp_HArray1OfPnt>>::Iterator MeshVS_PolyhedronVertsIter;
typedef NCollection_Array1 <TColStd_SequenceOfInteger> MeshVS_Array1OfSequenceOfInteger;
typedef NCollection_Map <MeshVS_TwoNodes , MeshVS_TwoNodesHasher> MeshVS_MapOfTwoNodes;
typedef NCollection_Map <MeshVS_TwoNodes , MeshVS_TwoNodesHasher>::Iterator MeshVS_MapIteratorOfMapOfTwoNodes;
typedef NCollection_DataMap <Standard_Integer , Standard_Boolean , TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerBoolean;
typedef NCollection_DataMap <Standard_Integer , Standard_Boolean , TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerBoolean;
typedef NCollection_DataMap <MeshVS_TwoColors , TColStd_MapOfInteger , MeshVS_TwoColorsHasher> MeshVS_DataMapOfTwoColorsMapOfInteger;
typedef NCollection_DataMap <MeshVS_TwoColors , TColStd_MapOfInteger , MeshVS_TwoColorsHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfTwoColorsMapOfInteger;
typedef Standard_Integer MeshVS_BuilderPriority;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_MeshEntityOwner>, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_MeshEntityOwner>, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMeshEntityOwner;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_HArray1OfSequenceOfInteger>, TColStd_MapIntegerHasher> MeshVS_DataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <MeshVS_HArray1OfSequenceOfInteger>, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfHArray1OfSequenceOfInteger;
typedef NCollection_DefaultHasher <MeshVS_TwoNodes> MeshVS_TwoNodesHasher;
typedef NCollection_Sequence <opencascade::handle <MeshVS_PrsBuilder>> MeshVS_SequenceOfPrsBuilder;
typedef NCollection_DataMap <Standard_Integer , Quantity_Color , TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerColor;
typedef NCollection_DataMap <Standard_Integer , Quantity_Color , TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerColor;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <SelectMgr_EntityOwner>, TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerOwner;
typedef NCollection_DataMap <Standard_Integer , opencascade::handle <SelectMgr_EntityOwner>, TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerOwner;
typedef MeshVS_Mesh * MeshVS_MeshPtr;
typedef NCollection_DataMap <Standard_Integer , MeshVS_TwoColors , TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerTwoColors;
typedef NCollection_DataMap <Standard_Integer , MeshVS_TwoColors , TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerTwoColors;
typedef Quantity_ColorHasher MeshVS_ColorHasher;
typedef NCollection_DataMap <Standard_Integer , gp_Vec , TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerVector;
typedef NCollection_DataMap <Standard_Integer , gp_Vec , TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerVector;
typedef std::pair <Standard_Integer , Standard_Integer> MeshVS_NodePair;
typedef Standard_Integer MeshVS_DisplayModeFlags;
typedef NCollection_DataMap <Standard_Integer , TCollection_AsciiString , TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerAsciiString;
typedef NCollection_DataMap <Standard_Integer , TCollection_AsciiString , TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerAsciiString;
typedef NCollection_DefaultHasher <MeshVS_TwoColors> MeshVS_TwoColorsHasher;
typedef NCollection_DataMap <Quantity_Color , TColStd_MapOfInteger , Quantity_ColorHasher> MeshVS_DataMapOfColorMapOfInteger;
typedef NCollection_DataMap <Quantity_Color , TColStd_MapOfInteger , Quantity_ColorHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfColorMapOfInteger;
typedef NCollection_DataMap <Standard_Integer , Graphic3d_MaterialAspect , TColStd_MapIntegerHasher> MeshVS_DataMapOfIntegerMaterial;
typedef NCollection_DataMap <Standard_Integer , Graphic3d_MaterialAspect , TColStd_MapIntegerHasher>::Iterator MeshVS_DataMapIteratorOfDataMapOfIntegerMaterial;
/* end typedefs declaration */

/**********************
* class MeshVS_Buffer *
**********************/
class MeshVS_Buffer {
	public:
		/****************** MeshVS_Buffer ******************/
		%feature("compactdefaultargs") MeshVS_Buffer;
		%feature("autodoc", "* Constructor of the buffer of the requested size
	:param theSize:
	:type theSize: Standard_Size
	:rtype: None") MeshVS_Buffer;
		 MeshVS_Buffer (const Standard_Size theSize);

		/****************** operator Standard_Integer& ******************/
		%feature("compactdefaultargs") operator Standard_Integer&;
		%feature("autodoc", "* Interpret the buffer as a reference to int
	:rtype: None") operator Standard_Integer&;
		 operator Standard_Integer& ();

		/****************** operator Standard_Real& ******************/
		%feature("compactdefaultargs") operator Standard_Real&;
		%feature("autodoc", "* Interpret the buffer as a reference to double
	:rtype: None") operator Standard_Real&;
		 operator Standard_Real& ();

		/****************** operator gp_Pnt& ******************/
		%feature("compactdefaultargs") operator gp_Pnt&;
		%feature("autodoc", "* Interpret the buffer as a reference to gp_Pnt
	:rtype: None") operator gp_Pnt&;
		 operator gp_Pnt& ();

		/****************** operator void* ******************/
		%feature("compactdefaultargs") operator void*;
		%feature("autodoc", "* Cast the buffer to the void pointer
	:rtype: None") operator void*;
		 operator void* ();

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the triangulation. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns bounding box of sub-entity with index theIdx in sub-entity list
	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns geometry center of sensitive entity index theIdx along the given axis theAxis
	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of a mesh
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "* Create a copy.
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** MeshVS_CommonSensitiveEntity ******************/
		%feature("compactdefaultargs") MeshVS_CommonSensitiveEntity;
		%feature("autodoc", "* Default constructor.
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theParentMesh:
	:type theParentMesh: MeshVS_Mesh
	:param theSelMethod:
	:type theSelMethod: MeshVS_MeshSelectionMethod
	:rtype: None") MeshVS_CommonSensitiveEntity;
		 MeshVS_CommonSensitiveEntity (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const opencascade::handle<MeshVS_Mesh> & theParentMesh,const MeshVS_MeshSelectionMethod theSelMethod);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Number of elements.
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns the amount of sub-entities of the complex entity
	:rtype: int") Size;
		virtual Standard_Integer Size ();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "* Swaps items with indexes theIdx1 and theIdx2
	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);

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
		%feature("autodoc", "* This method returns topology information about 3D-element Returns false if element with ID isn't 3D or because other troubles
	:param ID:
	:type ID: int
	:param NbNodes:
	:type NbNodes: int
	:param Data:
	:type Data: MeshVS_HArray1OfSequenceOfInteger
	:rtype: bool") Get3DGeom;
		virtual Standard_Boolean Get3DGeom (const Standard_Integer ID,Standard_Integer &OutValue,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Data);

		/****************** GetAddr ******************/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", "* This method returns pointer which represents element or node data structure. This address will be saved in MeshVS_MeshEntityOwner, so that you can access to data structure fast by the method Owner(). In the redefined method you can return NULL. ID is the numerical identificator of node or element IsElement indicates this ID describe node ( if Standard_False ) or element ( if Standard_True )
	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:rtype: Standard_Address") GetAddr;
		virtual Standard_Address GetAddr (const Standard_Integer ID,const Standard_Boolean IsElement);

		/****************** GetAllElements ******************/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", "* This method returns map of all elements the object consist of.
	:rtype: TColStd_PackedMapOfInteger") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements ();

		/****************** GetAllGroups ******************/
		%feature("compactdefaultargs") GetAllGroups;
		%feature("autodoc", "* This method returns map of all groups the object contains.
	:param Ids:
	:type Ids: TColStd_PackedMapOfInteger
	:rtype: void") GetAllGroups;
		virtual void GetAllGroups (TColStd_PackedMapOfInteger & Ids);

		/****************** GetAllNodes ******************/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", "* This method returns map of all nodes the object consist of.
	:rtype: TColStd_PackedMapOfInteger") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes ();

		/****************** GetBoundingBox ******************/
		%feature("compactdefaultargs") GetBoundingBox;
		%feature("autodoc", "* Returns the bounding box of the whole mesh. It is used in advanced selection mode to define roughly the sensitive area of the mesh. It can be redefined to get access to a box computed in advance.
	:rtype: Bnd_Box") GetBoundingBox;
		virtual Bnd_Box GetBoundingBox ();

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "* Returns maps of entities (nodes and elements) detected by mouse click at the point (X,Y) on the current view plane, with the tolerance aTol. DMin - is out argument should return actual detection tolerance. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
	:param Prs:
	:type Prs: MeshVS_Mesh
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param aTol:
	:type aTol: float
	:param Nodes:
	:type Nodes: TColStd_HPackedMapOfInteger
	:param Elements:
	:type Elements: TColStd_HPackedMapOfInteger
	:param DMin:
	:type DMin: float
	:rtype: bool") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const opencascade::handle<MeshVS_Mesh> & Prs,const Standard_Real X,const Standard_Real Y,const Standard_Real aTol,opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes,opencascade::handle<TColStd_HPackedMapOfInteger> & Elements,Standard_Real &OutValue);

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "* Returns maps of entities (nodes and elements) detected by mouse selection with rectangular box (XMin, YMin, XMax, YMax) on the current veiw plane, with the tolerance aTol. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
	:param Prs:
	:type Prs: MeshVS_Mesh
	:param XMin:
	:type XMin: float
	:param YMin:
	:type YMin: float
	:param XMax:
	:type XMax: float
	:param YMax:
	:type YMax: float
	:param aTol:
	:type aTol: float
	:param Nodes:
	:type Nodes: TColStd_HPackedMapOfInteger
	:param Elements:
	:type Elements: TColStd_HPackedMapOfInteger
	:rtype: bool") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const opencascade::handle<MeshVS_Mesh> & Prs,const Standard_Real XMin,const Standard_Real YMin,const Standard_Real XMax,const Standard_Real YMax,const Standard_Real aTol,opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes,opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "* Returns maps of entities (nodes and elements) detected by mouse selection with the polyline <Polyline> on the current veiw plane, with the tolerance aTol. Returns True if something is detected. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
	:param Prs:
	:type Prs: MeshVS_Mesh
	:param Polyline:
	:type Polyline: TColgp_Array1OfPnt2d
	:param aBox:
	:type aBox: Bnd_Box2d
	:param aTol:
	:type aTol: float
	:param Nodes:
	:type Nodes: TColStd_HPackedMapOfInteger
	:param Elements:
	:type Elements: TColStd_HPackedMapOfInteger
	:rtype: bool") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const opencascade::handle<MeshVS_Mesh> & Prs,const TColgp_Array1OfPnt2d & Polyline,const Bnd_Box2d & aBox,const Standard_Real aTol,opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes,opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetDetectedEntities ******************/
		%feature("compactdefaultargs") GetDetectedEntities;
		%feature("autodoc", "* Filter out the maps of mesh entities so as to keep only the entities that are allowed to be selected according to the current context. Returns True if any of the maps has been changed. It should be redefined if the advanced mesh selection is activated. Default implementation returns False.
	:param Prs:
	:type Prs: MeshVS_Mesh
	:param Nodes:
	:type Nodes: TColStd_HPackedMapOfInteger
	:param Elements:
	:type Elements: TColStd_HPackedMapOfInteger
	:rtype: bool") GetDetectedEntities;
		virtual Standard_Boolean GetDetectedEntities (const opencascade::handle<MeshVS_Mesh> & Prs,opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes,opencascade::handle<TColStd_HPackedMapOfInteger> & Elements);

		/****************** GetGeom ******************/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "* Returns geometry information about node or element ID is the numerical identificator of node or element IsElement indicates this ID describe node ( if Standard_False ) or element ( if Standard_True ) Coords is an array of co-ordinates of node(s). For node it is only 3 numbers: X, Y, Z in the strict order For element it is 3*n numbers, where n is number of this element vertices The order is strict also: X1, Y1, Z1, X2,...., where Xi, Yi, Zi are co-ordinates of vertices NbNodes is number of nodes. It is recommended this parameter to be set to 1 for node. Type is type of node or element (from enumeration). It is recommended this parameter to be set to MeshVS_ET_Node for node.
	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Coords:
	:type Coords: TColStd_Array1OfReal
	:param NbNodes:
	:type NbNodes: int
	:param Type:
	:type Type: MeshVS_EntityType
	:rtype: bool") GetGeom;
		virtual Standard_Boolean GetGeom (const Standard_Integer ID,const Standard_Boolean IsElement,TColStd_Array1OfReal & Coords,Standard_Integer &OutValue,MeshVS_EntityType & Type);

		/****************** GetGeomType ******************/
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", "* This method is similar to GetGeom, but returns only element or node type.
	:param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Type:
	:type Type: MeshVS_EntityType
	:rtype: bool") GetGeomType;
		virtual Standard_Boolean GetGeomType (const Standard_Integer ID,const Standard_Boolean IsElement,MeshVS_EntityType & Type);

		/****************** GetGroup ******************/
		%feature("compactdefaultargs") GetGroup;
		%feature("autodoc", "* This method returns map of all group elements.
	:param Id:
	:type Id: int
	:param Type:
	:type Type: MeshVS_EntityType
	:param Ids:
	:type Ids: TColStd_PackedMapOfInteger
	:rtype: bool") GetGroup;
		virtual Standard_Boolean GetGroup (const Standard_Integer Id,MeshVS_EntityType & Type,TColStd_PackedMapOfInteger & Ids);

		/****************** GetGroupAddr ******************/
		%feature("compactdefaultargs") GetGroupAddr;
		%feature("autodoc", "* This method returns pointer which represents group data structure. This address will be saved in MeshVS_MeshOwner, so that you can access to data structure fast by the method Owner(). In the redefined method you can return NULL. ID is the numerical identificator of group
	:param ID:
	:type ID: int
	:rtype: Standard_Address") GetGroupAddr;
		virtual Standard_Address GetGroupAddr (const Standard_Integer ID);

		/****************** GetNodeNormal ******************/
		%feature("compactdefaultargs") GetNodeNormal;
		%feature("autodoc", "* This method return normal of node ranknode of face Id, which is using for smooth shading presentation. Returns false if normal isn't defined.
	:param ranknode:
	:type ranknode: int
	:param ElementId:
	:type ElementId: int
	:param nx:
	:type nx: float
	:param ny:
	:type ny: float
	:param nz:
	:type nz: float
	:rtype: bool") GetNodeNormal;
		virtual Standard_Boolean GetNodeNormal (const Standard_Integer ranknode,const Standard_Integer ElementId,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetNodesByElement ******************/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", "* This method returns information about nodes this element consist of. ID is the numerical identificator of element. NodeIDs is the output array of nodes IDs in correct order, the same as coordinates returned by GetGeom(). NbNodes is number of nodes (number of items set in NodeIDs). Returns False if element does not exist
	:param ID:
	:type ID: int
	:param NodeIDs:
	:type NodeIDs: TColStd_Array1OfInteger
	:param NbNodes:
	:type NbNodes: int
	:rtype: bool") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement (const Standard_Integer ID,TColStd_Array1OfInteger & NodeIDs,Standard_Integer &OutValue);

		/****************** GetNormal ******************/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "* This method calculates normal of face, which is using for correct reflection presentation. There is default method, for advance reflection this method can be redefined. Id is the numerical identificator of only element! Max is maximal number of nodes an element can consist of nx, ny, nz are values whose represent co-ordinates of normal (will be returned) In the redefined method you can return normal with length more then 1, but in this case the appearance of element will be more bright than usual. For ordinary brightness you must return normal with length 1
	:param Id:
	:type Id: int
	:param Max:
	:type Max: int
	:param nx:
	:type nx: float
	:param ny:
	:type ny: float
	:param nz:
	:type nz: float
	:rtype: bool") GetNormal;
		virtual Standard_Boolean GetNormal (const Standard_Integer Id,const Standard_Integer Max,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetNormalsByElement ******************/
		%feature("compactdefaultargs") GetNormalsByElement;
		%feature("autodoc", "* This method puts components of normal vectors at each node of a mesh face (at each face of a mesh volume) into the output array. Returns false if some problem was detected during calculation of normals. Id is an identifier of the mesh element. IsNodal, when true, means that normals at mesh element nodes are needed. If nodal normals are not available, or IsNodal is false, or the mesh element is a volume, then the output array contents depend on the element type: face: a normal calculated by GetNormal() is duplicated for each node of the face; volume: normals to all faces of the volume are computed (not for each node!). MaxNodes is maximal number of nodes an element can consist of. Normals contains the result.
	:param Id:
	:type Id: int
	:param IsNodal:
	:type IsNodal: bool
	:param MaxNodes:
	:type MaxNodes: int
	:param Normals:
	:type Normals: TColStd_HArray1OfReal
	:rtype: bool") GetNormalsByElement;
		virtual Standard_Boolean GetNormalsByElement (const Standard_Integer Id,const Standard_Boolean IsNodal,const Standard_Integer MaxNodes,opencascade::handle<TColStd_HArray1OfReal> & Normals);

		/****************** IsAdvancedSelectionEnabled ******************/
		%feature("compactdefaultargs") IsAdvancedSelectionEnabled;
		%feature("autodoc", "* Returns True if advanced mesh selection is enabled. Default implementation returns False. It should be redefined to return True for advanced mesh selection activation.
	:rtype: bool") IsAdvancedSelectionEnabled;
		virtual Standard_Boolean IsAdvancedSelectionEnabled ();

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
		%feature("autodoc", "* This method copies other drawer contents to this.
	:param aDrawer:
	:type aDrawer: MeshVS_Drawer
	:rtype: void") Assign;
		virtual void Assign (const opencascade::handle<MeshVS_Drawer> & aDrawer);

		/****************** GetAsciiString ******************/
		%feature("compactdefaultargs") GetAsciiString;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: TCollection_AsciiString
	:rtype: bool") GetAsciiString;
		Standard_Boolean GetAsciiString (const Standard_Integer Key,TCollection_AsciiString & Value);

		/****************** GetBoolean ******************/
		%feature("compactdefaultargs") GetBoolean;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: bool
	:rtype: bool") GetBoolean;
		Standard_Boolean GetBoolean (const Standard_Integer Key,Standard_Boolean &OutValue);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: Quantity_Color
	:rtype: bool") GetColor;
		Standard_Boolean GetColor (const Standard_Integer Key,Quantity_Color & Value);

		/****************** GetDouble ******************/
		%feature("compactdefaultargs") GetDouble;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: float
	:rtype: bool") GetDouble;
		Standard_Boolean GetDouble (const Standard_Integer Key,Standard_Real &OutValue);

		/****************** GetInteger ******************/
		%feature("compactdefaultargs") GetInteger;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: int
	:rtype: bool") GetInteger;
		Standard_Boolean GetInteger (const Standard_Integer Key,Standard_Integer &OutValue);

		/****************** GetMaterial ******************/
		%feature("compactdefaultargs") GetMaterial;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: Graphic3d_MaterialAspect
	:rtype: bool") GetMaterial;
		Standard_Boolean GetMaterial (const Standard_Integer Key,Graphic3d_MaterialAspect & Value);

		/****************** RemoveAsciiString ******************/
		%feature("compactdefaultargs") RemoveAsciiString;
		%feature("autodoc", ":param Key:
	:type Key: int
	:rtype: bool") RemoveAsciiString;
		Standard_Boolean RemoveAsciiString (const Standard_Integer Key);

		/****************** RemoveBoolean ******************/
		%feature("compactdefaultargs") RemoveBoolean;
		%feature("autodoc", ":param Key:
	:type Key: int
	:rtype: bool") RemoveBoolean;
		Standard_Boolean RemoveBoolean (const Standard_Integer Key);

		/****************** RemoveColor ******************/
		%feature("compactdefaultargs") RemoveColor;
		%feature("autodoc", ":param Key:
	:type Key: int
	:rtype: bool") RemoveColor;
		Standard_Boolean RemoveColor (const Standard_Integer Key);

		/****************** RemoveDouble ******************/
		%feature("compactdefaultargs") RemoveDouble;
		%feature("autodoc", ":param Key:
	:type Key: int
	:rtype: bool") RemoveDouble;
		Standard_Boolean RemoveDouble (const Standard_Integer Key);

		/****************** RemoveInteger ******************/
		%feature("compactdefaultargs") RemoveInteger;
		%feature("autodoc", ":param Key:
	:type Key: int
	:rtype: bool") RemoveInteger;
		Standard_Boolean RemoveInteger (const Standard_Integer Key);

		/****************** RemoveMaterial ******************/
		%feature("compactdefaultargs") RemoveMaterial;
		%feature("autodoc", ":param Key:
	:type Key: int
	:rtype: bool") RemoveMaterial;
		Standard_Boolean RemoveMaterial (const Standard_Integer Key);

		/****************** SetAsciiString ******************/
		%feature("compactdefaultargs") SetAsciiString;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: TCollection_AsciiString
	:rtype: None") SetAsciiString;
		void SetAsciiString (const Standard_Integer Key,const TCollection_AsciiString & Value);

		/****************** SetBoolean ******************/
		%feature("compactdefaultargs") SetBoolean;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: bool
	:rtype: None") SetBoolean;
		void SetBoolean (const Standard_Integer Key,const Standard_Boolean Value);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Standard_Integer Key,const Quantity_Color & Value);

		/****************** SetDouble ******************/
		%feature("compactdefaultargs") SetDouble;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: float
	:rtype: None") SetDouble;
		void SetDouble (const Standard_Integer Key,const Standard_Real Value);

		/****************** SetInteger ******************/
		%feature("compactdefaultargs") SetInteger;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: int
	:rtype: None") SetInteger;
		void SetInteger (const Standard_Integer Key,const Standard_Integer Value);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", ":param Key:
	:type Key: int
	:param Value:
	:type Value: Graphic3d_MaterialAspect
	:rtype: None") SetMaterial;
		void SetMaterial (const Standard_Integer Key,const Graphic3d_MaterialAspect & Value);

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
		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", ":rtype: void") BVH;
		virtual void BVH ();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", ":rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", ":rtype: gp_Pnt") CenterOfGeometry;
		gp_Pnt CenterOfGeometry ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: void") Clear;
		virtual void Clear ();

		/****************** HasInitLocation ******************/
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", ":rtype: bool") HasInitLocation;
		virtual Standard_Boolean HasInitLocation ();

		/****************** InvInitLocation ******************/
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", ":rtype: gp_GTrsf") InvInitLocation;
		virtual gp_GTrsf InvInitLocation ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", ":param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** MeshVS_DummySensitiveEntity ******************/
		%feature("compactdefaultargs") MeshVS_DummySensitiveEntity;
		%feature("autodoc", ":param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:rtype: None") MeshVS_DummySensitiveEntity;
		 MeshVS_DummySensitiveEntity (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", ":rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

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
		/****************** AcceptDisplayMode ******************/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "* Returns true for supported display modes basing on a list of defined builders.
	:param theMode:
	:type theMode: int
	:rtype: bool") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);

		/****************** AddBuilder ******************/
		%feature("compactdefaultargs") AddBuilder;
		%feature("autodoc", "* Adds builder to tale of sequence. PrsBuilder is builder to be added If TreatAsHilighter is true, MeshVS_Mesh will use this builder to create presentation of hilighted and selected owners. Only one builder can be hilighter, so that if you call this method with TreatAsHilighter = Standard_True some times, only last builder will be hilighter WARNING: As minimum one builder must be added as hilighter, otherwise selection cannot be computed
	:param Builder:
	:type Builder: MeshVS_PrsBuilder
	:param TreatAsHilighter: default value is Standard_False
	:type TreatAsHilighter: bool
	:rtype: None") AddBuilder;
		void AddBuilder (const opencascade::handle<MeshVS_PrsBuilder> & Builder,const Standard_Boolean TreatAsHilighter = Standard_False);

		/****************** ClearSelected ******************/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "* Clears internal selection presentation
	:rtype: void") ClearSelected;
		virtual void ClearSelected ();

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Computes presentation using builders added to sequence. Each builder computes own part of mesh presentation according to its type.
	:param PM:
	:type PM: PrsMgr_PresentationManager3d
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") Compute;
		virtual void Compute (const opencascade::handle<PrsMgr_PresentationManager3d> & PM,const opencascade::handle<Prs3d_Presentation> & Prs,const Standard_Integer DisplayMode);

		/****************** ComputeSelection ******************/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "* Computes selection according to SelectMode
	:param Sel:
	:type Sel: SelectMgr_Selection
	:param SelectMode:
	:type SelectMode: int
	:rtype: void") ComputeSelection;
		virtual void ComputeSelection (const opencascade::handle<SelectMgr_Selection> & Sel,const Standard_Integer SelectMode);

		/****************** FindBuilder ******************/
		%feature("compactdefaultargs") FindBuilder;
		%feature("autodoc", "* Finds builder by its type the string represents
	:param TypeString:
	:type TypeString: char *
	:rtype: opencascade::handle<MeshVS_PrsBuilder>") FindBuilder;
		opencascade::handle<MeshVS_PrsBuilder> FindBuilder (const char * TypeString);

		/****************** GetBuilder ******************/
		%feature("compactdefaultargs") GetBuilder;
		%feature("autodoc", "* Returns builder by its index in sequence
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<MeshVS_PrsBuilder>") GetBuilder;
		opencascade::handle<MeshVS_PrsBuilder> GetBuilder (const Standard_Integer Index);

		/****************** GetBuilderById ******************/
		%feature("compactdefaultargs") GetBuilderById;
		%feature("autodoc", "* Returns builder by its ID
	:param Id:
	:type Id: int
	:rtype: opencascade::handle<MeshVS_PrsBuilder>") GetBuilderById;
		opencascade::handle<MeshVS_PrsBuilder> GetBuilderById (const Standard_Integer Id);

		/****************** GetBuildersCount ******************/
		%feature("compactdefaultargs") GetBuildersCount;
		%feature("autodoc", "* How many builders there are in sequence
	:rtype: int") GetBuildersCount;
		Standard_Integer GetBuildersCount ();

		/****************** GetDataSource ******************/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "* Returns default builders' data source
	:rtype: opencascade::handle<MeshVS_DataSource>") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource ();

		/****************** GetDrawer ******************/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "* Returns default builders' drawer
	:rtype: opencascade::handle<MeshVS_Drawer>") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer ();

		/****************** GetFreeId ******************/
		%feature("compactdefaultargs") GetFreeId;
		%feature("autodoc", "* Returns the smallest positive ID, not occupied by any builder. This method using when builder is created with ID = -1
	:rtype: int") GetFreeId;
		Standard_Integer GetFreeId ();

		/****************** GetHiddenElems ******************/
		%feature("compactdefaultargs") GetHiddenElems;
		%feature("autodoc", "* Returns map of hidden elements (may be null handle)
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") GetHiddenElems;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenElems ();

		/****************** GetHiddenNodes ******************/
		%feature("compactdefaultargs") GetHiddenNodes;
		%feature("autodoc", "* Returns map of hidden nodes (may be null handle)
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") GetHiddenNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetHiddenNodes ();

		/****************** GetHilighter ******************/
		%feature("compactdefaultargs") GetHilighter;
		%feature("autodoc", "* Returns hilighter
	:rtype: opencascade::handle<MeshVS_PrsBuilder>") GetHilighter;
		opencascade::handle<MeshVS_PrsBuilder> GetHilighter ();

		/****************** GetMeshSelMethod ******************/
		%feature("compactdefaultargs") GetMeshSelMethod;
		%feature("autodoc", "* Returns set mesh selection method (see MeshVS.cdl)
	:rtype: MeshVS_MeshSelectionMethod") GetMeshSelMethod;
		MeshVS_MeshSelectionMethod GetMeshSelMethod ();

		/****************** GetOwnerMaps ******************/
		%feature("compactdefaultargs") GetOwnerMaps;
		%feature("autodoc", "* Returns map of owners.
	:param IsElement:
	:type IsElement: bool
	:rtype: MeshVS_DataMapOfIntegerOwner") GetOwnerMaps;
		const MeshVS_DataMapOfIntegerOwner & GetOwnerMaps (const Standard_Boolean IsElement);

		/****************** GetSelectableNodes ******************/
		%feature("compactdefaultargs") GetSelectableNodes;
		%feature("autodoc", "* Returns map of selectable elements (may be null handle)
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") GetSelectableNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectableNodes ();

		/****************** HilightOwnerWithColor ******************/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "* Draw hilighted owner presentation
	:param thePM:
	:type thePM: PrsMgr_PresentationManager3d
	:param theColor:
	:type theColor: Prs3d_Drawer
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:rtype: void") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theColor,const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** HilightSelected ******************/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "* Draw selected owners presentation
	:param PM:
	:type PM: PrsMgr_PresentationManager3d
	:param Owners:
	:type Owners: SelectMgr_SequenceOfOwner
	:rtype: void") HilightSelected;
		virtual void HilightSelected (const opencascade::handle<PrsMgr_PresentationManager3d> & PM,const SelectMgr_SequenceOfOwner & Owners);

		/****************** IsHiddenElem ******************/
		%feature("compactdefaultargs") IsHiddenElem;
		%feature("autodoc", "* Returns True if specified element is hidden By default no elements are hidden
	:param ID:
	:type ID: int
	:rtype: bool") IsHiddenElem;
		Standard_Boolean IsHiddenElem (const Standard_Integer ID);

		/****************** IsHiddenNode ******************/
		%feature("compactdefaultargs") IsHiddenNode;
		%feature("autodoc", "* Returns True if specified node is hidden. By default all nodes are hidden
	:param ID:
	:type ID: int
	:rtype: bool") IsHiddenNode;
		Standard_Boolean IsHiddenNode (const Standard_Integer ID);

		/****************** IsSelectableElem ******************/
		%feature("compactdefaultargs") IsSelectableElem;
		%feature("autodoc", "* Returns True if specified element is not hidden
	:param ID:
	:type ID: int
	:rtype: bool") IsSelectableElem;
		Standard_Boolean IsSelectableElem (const Standard_Integer ID);

		/****************** IsSelectableNode ******************/
		%feature("compactdefaultargs") IsSelectableNode;
		%feature("autodoc", "* Returns True if specified node is specified as selectable.
	:param ID:
	:type ID: int
	:rtype: bool") IsSelectableNode;
		Standard_Boolean IsSelectableNode (const Standard_Integer ID);

		/****************** IsWholeMeshOwner ******************/
		%feature("compactdefaultargs") IsWholeMeshOwner;
		%feature("autodoc", "* Returns True if the given owner represents a whole mesh.
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:rtype: bool") IsWholeMeshOwner;
		virtual Standard_Boolean IsWholeMeshOwner (const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****************** MeshVS_Mesh ******************/
		%feature("compactdefaultargs") MeshVS_Mesh;
		%feature("autodoc", "* Constructor. theIsAllowOverlapped is Standard_True, if it is allowed to draw edges overlapped with beams Its value is stored in drawer
	:param theIsAllowOverlapped: default value is Standard_False
	:type theIsAllowOverlapped: bool
	:rtype: None") MeshVS_Mesh;
		 MeshVS_Mesh (const Standard_Boolean theIsAllowOverlapped = Standard_False);

		/****************** RemoveBuilder ******************/
		%feature("compactdefaultargs") RemoveBuilder;
		%feature("autodoc", "* Removes builder from sequence. If it is hilighter, hilighter will be NULL ( Don't remember to set it to other after!!! )
	:param Index:
	:type Index: int
	:rtype: None") RemoveBuilder;
		void RemoveBuilder (const Standard_Integer Index);

		/****************** RemoveBuilderById ******************/
		%feature("compactdefaultargs") RemoveBuilderById;
		%feature("autodoc", "* Removes builder with identificator Id
	:param Id:
	:type Id: int
	:rtype: None") RemoveBuilderById;
		void RemoveBuilderById (const Standard_Integer Id);

		/****************** SetDataSource ******************/
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "* Sets default builders' data source
	:param aDataSource:
	:type aDataSource: MeshVS_DataSource
	:rtype: None") SetDataSource;
		void SetDataSource (const opencascade::handle<MeshVS_DataSource> & aDataSource);

		/****************** SetDrawer ******************/
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "* Sets default builders' drawer
	:param aDrawer:
	:type aDrawer: MeshVS_Drawer
	:rtype: None") SetDrawer;
		void SetDrawer (const opencascade::handle<MeshVS_Drawer> & aDrawer);

		/****************** SetHiddenElems ******************/
		%feature("compactdefaultargs") SetHiddenElems;
		%feature("autodoc", "* Sets map of hidden elements
	:param Ids:
	:type Ids: TColStd_HPackedMapOfInteger
	:rtype: None") SetHiddenElems;
		void SetHiddenElems (const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****************** SetHiddenNodes ******************/
		%feature("compactdefaultargs") SetHiddenNodes;
		%feature("autodoc", "* Sets map of hidden nodes, which shall not be displayed individually. If nodes shared by some elements shall not be drawn, they should be included into that map
	:param Ids:
	:type Ids: TColStd_HPackedMapOfInteger
	:rtype: None") SetHiddenNodes;
		void SetHiddenNodes (const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****************** SetHilighter ******************/
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "* Changes hilighter ( see above )
	:param Builder:
	:type Builder: MeshVS_PrsBuilder
	:rtype: None") SetHilighter;
		void SetHilighter (const opencascade::handle<MeshVS_PrsBuilder> & Builder);

		/****************** SetHilighter ******************/
		%feature("compactdefaultargs") SetHilighter;
		%feature("autodoc", "* Sets builder with sequence index 'Index' as hilighter
	:param Index:
	:type Index: int
	:rtype: bool") SetHilighter;
		Standard_Boolean SetHilighter (const Standard_Integer Index);

		/****************** SetHilighterById ******************/
		%feature("compactdefaultargs") SetHilighterById;
		%feature("autodoc", "* Sets builder with identificator 'Id' as hilighter
	:param Id:
	:type Id: int
	:rtype: bool") SetHilighterById;
		Standard_Boolean SetHilighterById (const Standard_Integer Id);

		/****************** SetMeshSelMethod ******************/
		%feature("compactdefaultargs") SetMeshSelMethod;
		%feature("autodoc", "* Sets mesh selection method (see MeshVS.cdl)
	:param M:
	:type M: MeshVS_MeshSelectionMethod
	:rtype: None") SetMeshSelMethod;
		void SetMeshSelMethod (const MeshVS_MeshSelectionMethod M);

		/****************** SetSelectableNodes ******************/
		%feature("compactdefaultargs") SetSelectableNodes;
		%feature("autodoc", "* Sets map of selectable nodes.
	:param Ids:
	:type Ids: TColStd_HPackedMapOfInteger
	:rtype: None") SetSelectableNodes;
		void SetSelectableNodes (const opencascade::handle<TColStd_HPackedMapOfInteger> & Ids);

		/****************** UpdateSelectableNodes ******************/
		%feature("compactdefaultargs") UpdateSelectableNodes;
		%feature("autodoc", "* Automatically computes selectable nodes; the node is considered as being selectable if it is either not hidden, or is hidden but referred by at least one non-hidden element. Thus all nodes that are visible (either individually, or as ends or corners of elements) are selectable by default.
	:rtype: None") UpdateSelectableNodes;
		void UpdateSelectableNodes ();

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
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":param PM:
	:type PM: PrsMgr_PresentationManager
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void") Clear;
		virtual void Clear (const opencascade::handle<PrsMgr_PresentationManager> & PM,const Standard_Integer Mode = 0);

		/****************** HilightWithColor ******************/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "* Hilights owner with the certain color
	:param thePM:
	:type thePM: PrsMgr_PresentationManager3d
	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode = 0);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns ID of element or node data structure
	:rtype: int") ID;
		Standard_Integer ID ();

		/****************** IsGroup ******************/
		%feature("compactdefaultargs") IsGroup;
		%feature("autodoc", "* Returns true if owner represents group of nodes or elements
	:rtype: bool") IsGroup;
		Standard_Boolean IsGroup ();

		/****************** IsHilighted ******************/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "* Returns true if owner is hilighted
	:param PM:
	:type PM: PrsMgr_PresentationManager
	:param Mode: default value is 0
	:type Mode: int
	:rtype: bool") IsHilighted;
		virtual Standard_Boolean IsHilighted (const opencascade::handle<PrsMgr_PresentationManager> & PM,const Standard_Integer Mode = 0);

		/****************** MeshVS_MeshEntityOwner ******************/
		%feature("compactdefaultargs") MeshVS_MeshEntityOwner;
		%feature("autodoc", ":param SelObj:
	:type SelObj: SelectMgr_SOPtr
	:param ID:
	:type ID: int
	:param MeshEntity:
	:type MeshEntity: Standard_Address
	:param Type:
	:type Type: MeshVS_EntityType
	:param Priority: default value is 0
	:type Priority: int
	:param IsGroup: default value is Standard_False
	:type IsGroup: bool
	:rtype: None") MeshVS_MeshEntityOwner;
		 MeshVS_MeshEntityOwner (const SelectMgr_SOPtr & SelObj,const Standard_Integer ID,const Standard_Address MeshEntity,const MeshVS_EntityType & Type,const Standard_Integer Priority = 0,const Standard_Boolean IsGroup = Standard_False);

		/****************** Owner ******************/
		%feature("compactdefaultargs") Owner;
		%feature("autodoc", "* Returns an address of element or node data structure
	:rtype: Standard_Address") Owner;
		Standard_Address Owner ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns type of element or node data structure
	:rtype: MeshVS_EntityType") Type;
		MeshVS_EntityType Type ();

		/****************** Unhilight ******************/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "* Strip hilight of owner
	:param PM:
	:type PM: PrsMgr_PresentationManager
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void") Unhilight;
		virtual void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & PM,const Standard_Integer Mode = 0);

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
		/****************** AddSelectedEntities ******************/
		%feature("compactdefaultargs") AddSelectedEntities;
		%feature("autodoc", "* Saves ids of selected mesh entities
	:param Nodes:
	:type Nodes: TColStd_HPackedMapOfInteger
	:param Elems:
	:type Elems: TColStd_HPackedMapOfInteger
	:rtype: void") AddSelectedEntities;
		virtual void AddSelectedEntities (const opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes,const opencascade::handle<TColStd_HPackedMapOfInteger> & Elems);

		/****************** ClearSelectedEntities ******************/
		%feature("compactdefaultargs") ClearSelectedEntities;
		%feature("autodoc", "* Clears ids of selected mesh entities
	:rtype: void") ClearSelectedEntities;
		virtual void ClearSelectedEntities ();

		/****************** GetDataSource ******************/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", ":rtype: opencascade::handle<MeshVS_DataSource>") GetDataSource;
		const opencascade::handle<MeshVS_DataSource> & GetDataSource ();

		/****************** GetDetectedElements ******************/
		%feature("compactdefaultargs") GetDetectedElements;
		%feature("autodoc", "* Returns ids of hilighted mesh elements
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") GetDetectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedElements ();

		/****************** GetDetectedNodes ******************/
		%feature("compactdefaultargs") GetDetectedNodes;
		%feature("autodoc", "* Returns ids of hilighted mesh nodes
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") GetDetectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetDetectedNodes ();

		/****************** GetSelectedElements ******************/
		%feature("compactdefaultargs") GetSelectedElements;
		%feature("autodoc", "* Returns ids of selected mesh elements
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") GetSelectedElements;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedElements ();

		/****************** GetSelectedNodes ******************/
		%feature("compactdefaultargs") GetSelectedNodes;
		%feature("autodoc", "* Returns ids of selected mesh nodes
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") GetSelectedNodes;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & GetSelectedNodes ();

		/****************** HilightWithColor ******************/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", ":param thePM:
	:type thePM: PrsMgr_PresentationManager3d
	:param theColor:
	:type theColor: Prs3d_Drawer
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void") HilightWithColor;
		virtual void HilightWithColor (const opencascade::handle<PrsMgr_PresentationManager3d> & thePM,const opencascade::handle<Prs3d_Drawer> & theColor,const Standard_Integer theMode = 0);

		/****************** IsForcedHilight ******************/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", ":rtype: bool") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight ();

		/****************** MeshVS_MeshOwner ******************/
		%feature("compactdefaultargs") MeshVS_MeshOwner;
		%feature("autodoc", ":param theSelObj:
	:type theSelObj: SelectMgr_SOPtr
	:param theDS:
	:type theDS: MeshVS_DataSource
	:param thePriority: default value is 0
	:type thePriority: int
	:rtype: None") MeshVS_MeshOwner;
		 MeshVS_MeshOwner (const SelectMgr_SOPtr & theSelObj,const opencascade::handle<MeshVS_DataSource> & theDS,const Standard_Integer thePriority = 0);

		/****************** SetDetectedEntities ******************/
		%feature("compactdefaultargs") SetDetectedEntities;
		%feature("autodoc", "* Saves ids of hilighted mesh entities
	:param Nodes:
	:type Nodes: TColStd_HPackedMapOfInteger
	:param Elems:
	:type Elems: TColStd_HPackedMapOfInteger
	:rtype: None") SetDetectedEntities;
		void SetDetectedEntities (const opencascade::handle<TColStd_HPackedMapOfInteger> & Nodes,const opencascade::handle<TColStd_HPackedMapOfInteger> & Elems);

		/****************** Unhilight ******************/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", ":param PM:
	:type PM: PrsMgr_PresentationManager
	:param Mode: default value is 0
	:type Mode: int
	:rtype: void") Unhilight;
		virtual void Unhilight (const opencascade::handle<PrsMgr_PresentationManager> & PM,const Standard_Integer Mode = 0);

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
		%feature("autodoc", "* Builds presentation of certain type of data. Prs is presentation object which this method constructs. IDs is set of numeric identificators forming object appearance. IDsToExclude is set of IDs to exclude from processing. If some entity has been excluded, it is not processed by other builders. IsElement indicates, IDs is identificators of nodes or elements. DisplayMode is numeric constant describing display mode (see MeshVS_DisplayModeFlags.hxx)
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") Build;
		virtual void Build (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);

		/****************** CustomBuild ******************/
		%feature("compactdefaultargs") CustomBuild;
		%feature("autodoc", "* This method is called to build presentation of custom elements (they have MeshVS_ET_0D type). IDs is set of numeric identificators of elements for custom building. IDsToExclude is set of IDs to exclude from processing. If some entity has been excluded, it is not processed by other builders. DisplayMode is numeric constant describing display mode (see MeshVS_DisplayModeFlags.hxx)
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") CustomBuild;
		virtual void CustomBuild (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Integer DisplayMode);

		/****************** CustomSensitiveEntity ******************/
		%feature("compactdefaultargs") CustomSensitiveEntity;
		%feature("autodoc", "* This method is called to build sensitive of custom elements ( they have MeshVS_ET_0D type )
	:param Owner:
	:type Owner: SelectMgr_EntityOwner
	:param SelectMode:
	:type SelectMode: int
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") CustomSensitiveEntity;
		virtual opencascade::handle<Select3D_SensitiveEntity> CustomSensitiveEntity (const opencascade::handle<SelectMgr_EntityOwner> & Owner,const Standard_Integer SelectMode);

		/****************** GetDataSource ******************/
		%feature("compactdefaultargs") GetDataSource;
		%feature("autodoc", "* Returns custom data source or default ( from MeshVS_Mesh ) if custom is NULL
	:rtype: opencascade::handle<MeshVS_DataSource>") GetDataSource;
		opencascade::handle<MeshVS_DataSource> GetDataSource ();

		/****************** GetDrawer ******************/
		%feature("compactdefaultargs") GetDrawer;
		%feature("autodoc", "* Returns custom drawer or default ( from MeshVS_Mesh ) if custom is NULL
	:rtype: opencascade::handle<MeshVS_Drawer>") GetDrawer;
		opencascade::handle<MeshVS_Drawer> GetDrawer ();

		/****************** GetFlags ******************/
		%feature("compactdefaultargs") GetFlags;
		%feature("autodoc", "* Returns flags, assigned with builder during creation
	:rtype: int") GetFlags;
		Standard_Integer GetFlags ();

		/****************** GetId ******************/
		%feature("compactdefaultargs") GetId;
		%feature("autodoc", "* Returns builder ID
	:rtype: int") GetId;
		Standard_Integer GetId ();

		/****************** GetPresentationManager ******************/
		%feature("compactdefaultargs") GetPresentationManager;
		%feature("autodoc", "* Get presentation manager of builder
	:rtype: opencascade::handle<PrsMgr_PresentationManager3d>") GetPresentationManager;
		opencascade::handle<PrsMgr_PresentationManager3d> GetPresentationManager ();

		/****************** GetPriority ******************/
		%feature("compactdefaultargs") GetPriority;
		%feature("autodoc", "* Returns priority; as priority bigger, as soon builder will be called.
	:rtype: int") GetPriority;
		Standard_Integer GetPriority ();

		/****************** IsExcludingOn ******************/
		%feature("compactdefaultargs") IsExcludingOn;
		%feature("autodoc", "* Read excluding state
	:rtype: bool") IsExcludingOn;
		Standard_Boolean IsExcludingOn ();

		/****************** SetDataSource ******************/
		%feature("compactdefaultargs") SetDataSource;
		%feature("autodoc", "* Change custom data source
	:param newDS:
	:type newDS: MeshVS_DataSource
	:rtype: None") SetDataSource;
		void SetDataSource (const opencascade::handle<MeshVS_DataSource> & newDS);

		/****************** SetDrawer ******************/
		%feature("compactdefaultargs") SetDrawer;
		%feature("autodoc", "* Change custom drawer
	:param newDr:
	:type newDr: MeshVS_Drawer
	:rtype: None") SetDrawer;
		void SetDrawer (const opencascade::handle<MeshVS_Drawer> & newDr);

		/****************** SetExcluding ******************/
		%feature("compactdefaultargs") SetExcluding;
		%feature("autodoc", "* Set excluding state. If it is Standard_True, the nodes or elements, processed by current builder will be noted and next builder won't process its.
	:param state:
	:type state: bool
	:rtype: None") SetExcluding;
		void SetExcluding (const Standard_Boolean state);

		/****************** SetPresentationManager ******************/
		%feature("compactdefaultargs") SetPresentationManager;
		%feature("autodoc", "* Set presentation manager for builder
	:param thePrsMgr:
	:type thePrsMgr: PrsMgr_PresentationManager3d
	:rtype: None") SetPresentationManager;
		void SetPresentationManager (const opencascade::handle<PrsMgr_PresentationManager3d> & thePrsMgr);

		/****************** TestFlags ******************/
		%feature("compactdefaultargs") TestFlags;
		%feature("autodoc", "* Test whether display mode has flags assigned with this builder. This method has default implementation and can be redefined for advance behavior Returns Standard_True only if display mode is appropriate for this builder
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: bool") TestFlags;
		virtual Standard_Boolean TestFlags (const Standard_Integer DisplayMode);

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
		%feature("autodoc", ":param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:param theSensType: default value is Select3D_TOS_INTERIOR
	:type theSensType: Select3D_TypeOfSensitivity
	:rtype: None") MeshVS_SensitiveFace;
		 MeshVS_SensitiveFace (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const TColgp_Array1OfPnt & thePoints,const Select3D_TypeOfSensitivity theSensType = Select3D_TOS_INTERIOR);

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of mesh
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of mesh
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** GetMode ******************/
		%feature("compactdefaultargs") GetMode;
		%feature("autodoc", ":rtype: int") GetMode;
		Standard_Integer GetMode ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether sensitive overlaps current selecting volume.
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** MeshVS_SensitiveMesh ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveMesh;
		%feature("autodoc", ":param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") MeshVS_SensitiveMesh;
		 MeshVS_SensitiveMesh (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const Standard_Integer theMode = 0);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of mesh nodes
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", ":rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", ":rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", ":param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** MeshVS_SensitivePolyhedron ******************/
		%feature("compactdefaultargs") MeshVS_SensitivePolyhedron;
		%feature("autodoc", ":param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theNodes:
	:type theNodes: TColgp_Array1OfPnt
	:param theTopo:
	:type theTopo: MeshVS_HArray1OfSequenceOfInteger
	:rtype: None") MeshVS_SensitivePolyhedron;
		 MeshVS_SensitivePolyhedron (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const TColgp_Array1OfPnt & theNodes,const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & theTopo);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of nodes of polyhedron
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns coordinates of the box
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the box
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "* Returns a copy of this sensitive quadrangle
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the box overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** MeshVS_SensitiveQuad ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveQuad;
		%feature("autodoc", "* Creates a new instance and initializes quadrangle vertices with the given points
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theQuadVerts:
	:type theQuadVerts: TColgp_Array1OfPnt
	:rtype: None") MeshVS_SensitiveQuad;
		 MeshVS_SensitiveQuad (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const TColgp_Array1OfPnt & theQuadVerts);

		/****************** MeshVS_SensitiveQuad ******************/
		%feature("compactdefaultargs") MeshVS_SensitiveQuad;
		%feature("autodoc", "* Creates a new instance and initializes quadrangle vertices with the given points
	:param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:param thePnt3:
	:type thePnt3: gp_Pnt
	:param thePnt4:
	:type thePnt4: gp_Pnt
	:rtype: None") MeshVS_SensitiveQuad;
		 MeshVS_SensitiveQuad (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const gp_Pnt & thePnt1,const gp_Pnt & thePnt2,const gp_Pnt & thePnt3,const gp_Pnt & thePnt4);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of sub-entities in sensitive
	:rtype: int") NbSubElements;
		Standard_Integer NbSubElements ();

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
		%feature("autodoc", ":param theOwner:
	:type theOwner: SelectMgr_EntityOwner
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:rtype: None") MeshVS_SensitiveSegment;
		 MeshVS_SensitiveSegment (const opencascade::handle<SelectMgr_EntityOwner> & theOwner,const gp_Pnt & theFirstPnt,const gp_Pnt & theLastPnt);

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
		%feature("autodoc", "* Computes a hash code for the node pair, in the range [1, theUpperBound] @param theNodePair the node pair which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theNodePair:
	:type theNodePair: MeshVS_NodePair
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const MeshVS_NodePair & theNodePair,const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param thePair1:
	:type thePair1: MeshVS_NodePair
	:param thePair2:
	:type thePair2: MeshVS_NodePair
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const MeshVS_NodePair & thePair1,const MeshVS_NodePair & thePair2);

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
		%feature("autodoc", "* Creates fill area aspect with values from Drawer according to keys from DrawerAttribute
	:param theDr:
	:type theDr: MeshVS_Drawer
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: opencascade::handle<Graphic3d_AspectFillArea3d>") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d (const opencascade::handle<MeshVS_Drawer> & theDr,const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectFillArea3d ******************/
		%feature("compactdefaultargs") CreateAspectFillArea3d;
		%feature("autodoc", "* Creates fill aspect with values from Drawer according to keys from DrawerAttribute and specific material aspect
	:param theDr:
	:type theDr: MeshVS_Drawer
	:param Mat:
	:type Mat: Graphic3d_MaterialAspect
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: opencascade::handle<Graphic3d_AspectFillArea3d>") CreateAspectFillArea3d;
		static opencascade::handle<Graphic3d_AspectFillArea3d> CreateAspectFillArea3d (const opencascade::handle<MeshVS_Drawer> & theDr,const Graphic3d_MaterialAspect & Mat,const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectLine3d ******************/
		%feature("compactdefaultargs") CreateAspectLine3d;
		%feature("autodoc", "* Creates line aspect with values from Drawer according to keys from DrawerAttribute
	:param theDr:
	:type theDr: MeshVS_Drawer
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: opencascade::handle<Graphic3d_AspectLine3d>") CreateAspectLine3d;
		static opencascade::handle<Graphic3d_AspectLine3d> CreateAspectLine3d (const opencascade::handle<MeshVS_Drawer> & theDr,const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectMarker3d ******************/
		%feature("compactdefaultargs") CreateAspectMarker3d;
		%feature("autodoc", "* Creates marker aspect with values from Drawer according to keys from DrawerAttribute
	:param theDr:
	:type theDr: MeshVS_Drawer
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: opencascade::handle<Graphic3d_AspectMarker3d>") CreateAspectMarker3d;
		static opencascade::handle<Graphic3d_AspectMarker3d> CreateAspectMarker3d (const opencascade::handle<MeshVS_Drawer> & theDr,const Standard_Boolean UseDefaults = Standard_True);

		/****************** CreateAspectText3d ******************/
		%feature("compactdefaultargs") CreateAspectText3d;
		%feature("autodoc", "* Creates text aspect with values from Drawer according to keys from DrawerAttribute
	:param theDr:
	:type theDr: MeshVS_Drawer
	:param UseDefaults: default value is Standard_True
	:type UseDefaults: bool
	:rtype: opencascade::handle<Graphic3d_AspectText3d>") CreateAspectText3d;
		static opencascade::handle<Graphic3d_AspectText3d> CreateAspectText3d (const opencascade::handle<MeshVS_Drawer> & theDr,const Standard_Boolean UseDefaults = Standard_True);

		/****************** GetAverageNormal ******************/
		%feature("compactdefaultargs") GetAverageNormal;
		%feature("autodoc", "* Get an average of normals to non-planar polygon described by these points or compute normal of planar polygon. If the polygon isn't planar, function returns false
	:param Nodes:
	:type Nodes: TColStd_Array1OfReal
	:param Norm:
	:type Norm: gp_Vec
	:rtype: bool") GetAverageNormal;
		static Standard_Boolean GetAverageNormal (const TColStd_Array1OfReal & Nodes,gp_Vec & Norm);

		/****************** GetNormal ******************/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "* Get one of normals to polygon described by these points. If the polygon isn't planar, function returns false
	:param Nodes:
	:type Nodes: TColStd_Array1OfReal
	:param Norm:
	:type Norm: gp_Vec
	:rtype: bool") GetNormal;
		static Standard_Boolean GetNormal (const TColStd_Array1OfReal & Nodes,gp_Vec & Norm);

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
		%feature("autodoc", ":param aFirst: default value is 0
	:type aFirst: int
	:param aSecond: default value is 0
	:type aSecond: int
	:rtype: None") MeshVS_TwoNodes;
		 MeshVS_TwoNodes (Standard_Integer aFirst = 0,Standard_Integer aSecond = 0);

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
		%feature("autodoc", ":param BasePoints:
	:type BasePoints: int
	:rtype: opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>") CreatePrismTopology;
		static opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> CreatePrismTopology (const Standard_Integer BasePoints);

		/****************** CreatePyramidTopology ******************/
		%feature("compactdefaultargs") CreatePyramidTopology;
		%feature("autodoc", ":param BasePoints:
	:type BasePoints: int
	:rtype: opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>") CreatePyramidTopology;
		static opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> CreatePyramidTopology (const Standard_Integer BasePoints);

		/****************** GetPrismTopology ******************/
		%feature("compactdefaultargs") GetPrismTopology;
		%feature("autodoc", ":param BasePoints:
	:type BasePoints: int
	:rtype: opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>") GetPrismTopology;
		opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> GetPrismTopology (const Standard_Integer BasePoints);

		/****************** GetPyramidTopology ******************/
		%feature("compactdefaultargs") GetPyramidTopology;
		%feature("autodoc", ":param BasePoints:
	:type BasePoints: int
	:rtype: opencascade::handle<MeshVS_HArray1OfSequenceOfInteger>") GetPyramidTopology;
		opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> GetPyramidTopology (const Standard_Integer BasePoints);

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
		/****************** Get3DGeom ******************/
		%feature("compactdefaultargs") Get3DGeom;
		%feature("autodoc", ":param ID:
	:type ID: int
	:param NbNodes:
	:type NbNodes: int
	:param Data:
	:type Data: MeshVS_HArray1OfSequenceOfInteger
	:rtype: bool") Get3DGeom;
		virtual Standard_Boolean Get3DGeom (const Standard_Integer ID,Standard_Integer &OutValue,opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Data);

		/****************** GetAddr ******************/
		%feature("compactdefaultargs") GetAddr;
		%feature("autodoc", ":param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:rtype: Standard_Address") GetAddr;
		virtual Standard_Address GetAddr (const Standard_Integer ID,const Standard_Boolean IsElement);

		/****************** GetAllElements ******************/
		%feature("compactdefaultargs") GetAllElements;
		%feature("autodoc", ":rtype: TColStd_PackedMapOfInteger") GetAllElements;
		virtual const TColStd_PackedMapOfInteger & GetAllElements ();

		/****************** GetAllNodes ******************/
		%feature("compactdefaultargs") GetAllNodes;
		%feature("autodoc", ":rtype: TColStd_PackedMapOfInteger") GetAllNodes;
		virtual const TColStd_PackedMapOfInteger & GetAllNodes ();

		/****************** GetGeom ******************/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", ":param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Coords:
	:type Coords: TColStd_Array1OfReal
	:param NbNodes:
	:type NbNodes: int
	:param Type:
	:type Type: MeshVS_EntityType
	:rtype: bool") GetGeom;
		virtual Standard_Boolean GetGeom (const Standard_Integer ID,const Standard_Boolean IsElement,TColStd_Array1OfReal & Coords,Standard_Integer &OutValue,MeshVS_EntityType & Type);

		/****************** GetGeomType ******************/
		%feature("compactdefaultargs") GetGeomType;
		%feature("autodoc", ":param ID:
	:type ID: int
	:param IsElement:
	:type IsElement: bool
	:param Type:
	:type Type: MeshVS_EntityType
	:rtype: bool") GetGeomType;
		virtual Standard_Boolean GetGeomType (const Standard_Integer ID,const Standard_Boolean IsElement,MeshVS_EntityType & Type);

		/****************** GetMagnify ******************/
		%feature("compactdefaultargs") GetMagnify;
		%feature("autodoc", "* With this methods you can read and change magnify coefficient of nodal displacements
	:rtype: float") GetMagnify;
		Standard_Real GetMagnify ();

		/****************** GetNodesByElement ******************/
		%feature("compactdefaultargs") GetNodesByElement;
		%feature("autodoc", ":param ID:
	:type ID: int
	:param NodeIDs:
	:type NodeIDs: TColStd_Array1OfInteger
	:param NbNodes:
	:type NbNodes: int
	:rtype: bool") GetNodesByElement;
		virtual Standard_Boolean GetNodesByElement (const Standard_Integer ID,TColStd_Array1OfInteger & NodeIDs,Standard_Integer &OutValue);

		/****************** GetNonDeformedDataSource ******************/
		%feature("compactdefaultargs") GetNonDeformedDataSource;
		%feature("autodoc", "* With this methods you can read and change internal canonical data source
	:rtype: opencascade::handle<MeshVS_DataSource>") GetNonDeformedDataSource;
		opencascade::handle<MeshVS_DataSource> GetNonDeformedDataSource ();

		/****************** GetVector ******************/
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "* This method returns vector ( Vect ) assigned to node number ID.
	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: bool") GetVector;
		Standard_Boolean GetVector (const Standard_Integer ID,gp_Vec & Vect);

		/****************** GetVectors ******************/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "* This method returns map of nodal displacement vectors
	:rtype: MeshVS_DataMapOfIntegerVector") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors ();

		/****************** MeshVS_DeformedDataSource ******************/
		%feature("compactdefaultargs") MeshVS_DeformedDataSource;
		%feature("autodoc", "* Constructor theNonDeformDS is canonical non-deformed data source, by which we are able to calculate deformed mesh geometry theMagnify is coefficient of displacement magnify
	:param theNonDeformDS:
	:type theNonDeformDS: MeshVS_DataSource
	:param theMagnify:
	:type theMagnify: float
	:rtype: None") MeshVS_DeformedDataSource;
		 MeshVS_DeformedDataSource (const opencascade::handle<MeshVS_DataSource> & theNonDeformDS,const Standard_Real theMagnify);

		/****************** SetMagnify ******************/
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", ":param theMagnify:
	:type theMagnify: float
	:rtype: None") SetMagnify;
		void SetMagnify (const Standard_Real theMagnify);

		/****************** SetNonDeformedDataSource ******************/
		%feature("compactdefaultargs") SetNonDeformedDataSource;
		%feature("autodoc", ":param theDS:
	:type theDS: MeshVS_DataSource
	:rtype: None") SetNonDeformedDataSource;
		void SetNonDeformedDataSource (const opencascade::handle<MeshVS_DataSource> & theDS);

		/****************** SetVector ******************/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "* This method sets vector ( Vect ) assigned to node number ID.
	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: None") SetVector;
		void SetVector (const Standard_Integer ID,const gp_Vec & Vect);

		/****************** SetVectors ******************/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "* This method sets map of nodal displacement vectors (Map).
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerVector
	:rtype: None") SetVectors;
		void SetVectors (const MeshVS_DataMapOfIntegerVector & Map);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds presentation of elements with assigned colors.
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") Build;
		virtual void Build (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);

		/****************** GetColor1 ******************/
		%feature("compactdefaultargs") GetColor1;
		%feature("autodoc", "* Returns color assigned with element number ID
	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: bool") GetColor1;
		Standard_Boolean GetColor1 (const Standard_Integer ID,Quantity_Color & theColor);

		/****************** GetColor2 ******************/
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "* Returns colors assigned with element number ID
	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: MeshVS_TwoColors
	:rtype: bool") GetColor2;
		Standard_Boolean GetColor2 (const Standard_Integer ID,MeshVS_TwoColors & theColor);

		/****************** GetColor2 ******************/
		%feature("compactdefaultargs") GetColor2;
		%feature("autodoc", "* Returns colors assigned with element number ID theColor1 is the front element color theColor2 is the back element color
	:param ID:
	:type ID: int
	:param theColor1:
	:type theColor1: Quantity_Color
	:param theColor2:
	:type theColor2: Quantity_Color
	:rtype: bool") GetColor2;
		Standard_Boolean GetColor2 (const Standard_Integer ID,Quantity_Color & theColor1,Quantity_Color & theColor2);

		/****************** GetColors1 ******************/
		%feature("compactdefaultargs") GetColors1;
		%feature("autodoc", "* Returns map of colors same for front and back side of face.
	:rtype: MeshVS_DataMapOfIntegerColor") GetColors1;
		const MeshVS_DataMapOfIntegerColor & GetColors1 ();

		/****************** GetColors2 ******************/
		%feature("compactdefaultargs") GetColors2;
		%feature("autodoc", "* Returns map of different colors for front and back side of face
	:rtype: MeshVS_DataMapOfIntegerTwoColors") GetColors2;
		const MeshVS_DataMapOfIntegerTwoColors & GetColors2 ();

		/****************** HasColors1 ******************/
		%feature("compactdefaultargs") HasColors1;
		%feature("autodoc", "* Returns true, if map of colors isn't empty
	:rtype: bool") HasColors1;
		Standard_Boolean HasColors1 ();

		/****************** HasColors2 ******************/
		%feature("compactdefaultargs") HasColors2;
		%feature("autodoc", "* Returns true, if map isn't empty
	:rtype: bool") HasColors2;
		Standard_Boolean HasColors2 ();

		/****************** MeshVS_ElementalColorPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_ElementalColorPrsBuilder;
		%feature("autodoc", "* Constructor
	:param Parent:
	:type Parent: MeshVS_Mesh
	:param Flags: default value is MeshVS_DMF_ElementalColorDataPrs
	:type Flags: int
	:param DS: default value is 0
	:type DS: MeshVS_DataSource
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_ElemColor
	:type Priority: int
	:rtype: None") MeshVS_ElementalColorPrsBuilder;
		 MeshVS_ElementalColorPrsBuilder (const opencascade::handle<MeshVS_Mesh> & Parent,int Flags = MeshVS_DMF_ElementalColorDataPrs,const opencascade::handle<MeshVS_DataSource> & DS = 0,const Standard_Integer Id = -1,int Priority = MeshVS_BP_ElemColor);

		/****************** SetColor1 ******************/
		%feature("compactdefaultargs") SetColor1;
		%feature("autodoc", "* Sets color assigned with element number ID
	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor1;
		void SetColor1 (const Standard_Integer ID,const Quantity_Color & theColor);

		/****************** SetColor2 ******************/
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "* Sets colors assigned with element number ID
	:param ID:
	:type ID: int
	:param theTwoColors:
	:type theTwoColors: MeshVS_TwoColors
	:rtype: None") SetColor2;
		void SetColor2 (const Standard_Integer ID,const MeshVS_TwoColors & theTwoColors);

		/****************** SetColor2 ******************/
		%feature("compactdefaultargs") SetColor2;
		%feature("autodoc", "* Sets color assigned with element number ID theColor1 is the front element color theColor2 is the back element color
	:param ID:
	:type ID: int
	:param theColor1:
	:type theColor1: Quantity_Color
	:param theColor2:
	:type theColor2: Quantity_Color
	:rtype: None") SetColor2;
		void SetColor2 (const Standard_Integer ID,const Quantity_Color & theColor1,const Quantity_Color & theColor2);

		/****************** SetColors1 ******************/
		%feature("compactdefaultargs") SetColors1;
		%feature("autodoc", "* Sets map of colors same for front and back side of face.
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerColor
	:rtype: None") SetColors1;
		void SetColors1 (const MeshVS_DataMapOfIntegerColor & Map);

		/****************** SetColors2 ******************/
		%feature("compactdefaultargs") SetColors2;
		%feature("autodoc", "* Sets map of different colors for front and back side of face
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerTwoColors
	:rtype: None") SetColors2;
		void SetColors2 (const MeshVS_DataMapOfIntegerTwoColors & Map);

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
		/****************** AddVolumePrs ******************/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "* Add to array polygons or polylines representing volume
	:param Topo:
	:type Topo: MeshVS_HArray1OfSequenceOfInteger
	:param Nodes:
	:type Nodes: TColStd_Array1OfReal
	:param NbNodes:
	:type NbNodes: int
	:param Array:
	:type Array: Graphic3d_ArrayOfPrimitives
	:param IsReflected:
	:type IsReflected: bool
	:param IsShrinked:
	:type IsShrinked: bool
	:param IsSelect:
	:type IsSelect: bool
	:param ShrinkCoef:
	:type ShrinkCoef: float
	:rtype: void") AddVolumePrs;
		static void AddVolumePrs (const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Topo,const TColStd_Array1OfReal & Nodes,const Standard_Integer NbNodes,const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Array,const Standard_Boolean IsReflected,const Standard_Boolean IsShrinked,const Standard_Boolean IsSelect,const Standard_Real ShrinkCoef);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds base mesh presentation by calling the methods below
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") Build;
		virtual void Build (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);

		/****************** BuildElements ******************/
		%feature("compactdefaultargs") BuildElements;
		%feature("autodoc", "* Builds elements presentation
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") BuildElements;
		virtual void BuildElements (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Integer DisplayMode);

		/****************** BuildHilightPrs ******************/
		%feature("compactdefaultargs") BuildHilightPrs;
		%feature("autodoc", "* Builds presentation of hilighted entity
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IsElement:
	:type IsElement: bool
	:rtype: void") BuildHilightPrs;
		virtual void BuildHilightPrs (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,const Standard_Boolean IsElement);

		/****************** BuildNodes ******************/
		%feature("compactdefaultargs") BuildNodes;
		%feature("autodoc", "* Builds nodes presentation
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") BuildNodes;
		virtual void BuildNodes (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Integer DisplayMode);

		/****************** HowManyPrimitives ******************/
		%feature("compactdefaultargs") HowManyPrimitives;
		%feature("autodoc", "* Calculate how many polygons or polylines are necessary to draw passed topology
	:param Topo:
	:type Topo: MeshVS_HArray1OfSequenceOfInteger
	:param AsPolygons:
	:type AsPolygons: bool
	:param IsSelect:
	:type IsSelect: bool
	:param NbNodes:
	:type NbNodes: int
	:param Vertices:
	:type Vertices: int
	:param Bounds:
	:type Bounds: int
	:rtype: void") HowManyPrimitives;
		static void HowManyPrimitives (const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & Topo,const Standard_Boolean AsPolygons,const Standard_Boolean IsSelect,const Standard_Integer NbNodes,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** MeshVS_MeshPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_MeshPrsBuilder;
		%feature("autodoc", "* Creates builder with certain display mode flags, data source, ID and priority
	:param Parent:
	:type Parent: MeshVS_Mesh
	:param Flags: default value is MeshVS_DMF_OCCMask
	:type Flags: int
	:param DS: default value is 0
	:type DS: MeshVS_DataSource
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_Mesh
	:type Priority: int
	:rtype: None") MeshVS_MeshPrsBuilder;
		 MeshVS_MeshPrsBuilder (const opencascade::handle<MeshVS_Mesh> & Parent,int Flags = MeshVS_DMF_OCCMask,const opencascade::handle<MeshVS_DataSource> & DS = 0,const Standard_Integer Id = -1,int Priority = MeshVS_BP_Mesh);

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
		/****************** AddVolumePrs ******************/
		%feature("compactdefaultargs") AddVolumePrs;
		%feature("autodoc", "* Add to array polygons or polylines representing volume
	:param theTopo:
	:type theTopo: MeshVS_HArray1OfSequenceOfInteger
	:param theNodes:
	:type theNodes: TColStd_Array1OfInteger
	:param theCoords:
	:type theCoords: TColStd_Array1OfReal
	:param theArray:
	:type theArray: Graphic3d_ArrayOfPrimitives
	:param theIsShaded:
	:type theIsShaded: bool
	:param theNbColors:
	:type theNbColors: int
	:param theNbTexColors:
	:type theNbTexColors: int
	:param theColorRatio:
	:type theColorRatio: float
	:rtype: None") AddVolumePrs;
		void AddVolumePrs (const opencascade::handle<MeshVS_HArray1OfSequenceOfInteger> & theTopo,const TColStd_Array1OfInteger & theNodes,const TColStd_Array1OfReal & theCoords,const opencascade::handle<Graphic3d_ArrayOfPrimitives> & theArray,const Standard_Boolean theIsShaded,const Standard_Integer theNbColors,const Standard_Integer theNbTexColors,const Standard_Real theColorRatio);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds presentation of nodes with assigned color.
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param IsElement:
	:type IsElement: bool
	:param DisplayMode:
	:type DisplayMode: int
	:rtype: void") Build;
		virtual void Build (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer DisplayMode);

		/****************** GetColor ******************/
		%feature("compactdefaultargs") GetColor;
		%feature("autodoc", "* Returns color assigned to single node
	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: bool") GetColor;
		Standard_Boolean GetColor (const Standard_Integer ID,Quantity_Color & theColor);

		/****************** GetColorMap ******************/
		%feature("compactdefaultargs") GetColorMap;
		%feature("autodoc", "* Return colors used for texrture presentation
	:rtype: Aspect_SequenceOfColor") GetColorMap;
		const Aspect_SequenceOfColor & GetColorMap ();

		/****************** GetColors ******************/
		%feature("compactdefaultargs") GetColors;
		%feature("autodoc", "* Returns map of colors assigned to nodes.
	:rtype: MeshVS_DataMapOfIntegerColor") GetColors;
		const MeshVS_DataMapOfIntegerColor & GetColors ();

		/****************** GetInvalidColor ******************/
		%feature("compactdefaultargs") GetInvalidColor;
		%feature("autodoc", "* Return color representing invalid texture coordinate (laying outside range [0, 1])
	:rtype: Quantity_Color") GetInvalidColor;
		Quantity_Color GetInvalidColor ();

		/****************** GetTextureCoord ******************/
		%feature("compactdefaultargs") GetTextureCoord;
		%feature("autodoc", "* Return correspondence between node IDs and texture coordinate (range [0, 1])
	:param theID:
	:type theID: int
	:rtype: float") GetTextureCoord;
		Standard_Real GetTextureCoord (const Standard_Integer theID);

		/****************** GetTextureCoords ******************/
		%feature("compactdefaultargs") GetTextureCoords;
		%feature("autodoc", "* Get correspondence between node IDs and texture coordinates (range [0, 1])
	:rtype: TColStd_DataMapOfIntegerReal") GetTextureCoords;
		const TColStd_DataMapOfIntegerReal & GetTextureCoords ();

		/****************** HasColors ******************/
		%feature("compactdefaultargs") HasColors;
		%feature("autodoc", "* Returns true, if map isn't empty
	:rtype: bool") HasColors;
		Standard_Boolean HasColors ();

		/****************** IsUseTexture ******************/
		%feature("compactdefaultargs") IsUseTexture;
		%feature("autodoc", "* Verify whether texture is used to build presentation
	:rtype: bool") IsUseTexture;
		Standard_Boolean IsUseTexture ();

		/****************** MeshVS_NodalColorPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_NodalColorPrsBuilder;
		%feature("autodoc", ":param Parent:
	:type Parent: MeshVS_Mesh
	:param Flags: default value is MeshVS_DMF_NodalColorDataPrs
	:type Flags: int
	:param DS: default value is 0
	:type DS: MeshVS_DataSource
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_NodalColor
	:type Priority: int
	:rtype: None") MeshVS_NodalColorPrsBuilder;
		 MeshVS_NodalColorPrsBuilder (const opencascade::handle<MeshVS_Mesh> & Parent,int Flags = MeshVS_DMF_NodalColorDataPrs,const opencascade::handle<MeshVS_DataSource> & DS = 0,const Standard_Integer Id = -1,int Priority = MeshVS_BP_NodalColor);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Sets color assigned to single node
	:param ID:
	:type ID: int
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Standard_Integer ID,const Quantity_Color & theColor);

		/****************** SetColorMap ******************/
		%feature("compactdefaultargs") SetColorMap;
		%feature("autodoc", "* Set colors to be used for texrture presentation theColors - colors for valid coordinates (laying in range [0, 1])
	:param theColors:
	:type theColors: Aspect_SequenceOfColor
	:rtype: None") SetColorMap;
		void SetColorMap (const Aspect_SequenceOfColor & theColors);

		/****************** SetColors ******************/
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "* Sets map of colors assigned to nodes.
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerColor
	:rtype: None") SetColors;
		void SetColors (const MeshVS_DataMapOfIntegerColor & Map);

		/****************** SetInvalidColor ******************/
		%feature("compactdefaultargs") SetInvalidColor;
		%feature("autodoc", "* Set color representing invalid texture coordinate (laying outside range [0, 1])
	:param theInvalidColor:
	:type theInvalidColor: Quantity_Color
	:rtype: None") SetInvalidColor;
		void SetInvalidColor (const Quantity_Color & theInvalidColor);

		/****************** SetTextureCoord ******************/
		%feature("compactdefaultargs") SetTextureCoord;
		%feature("autodoc", "* Specify correspondence between node ID and texture coordinate (range [0, 1])
	:param theID:
	:type theID: int
	:param theCoord:
	:type theCoord: float
	:rtype: None") SetTextureCoord;
		void SetTextureCoord (const Standard_Integer theID,const Standard_Real theCoord);

		/****************** SetTextureCoords ******************/
		%feature("compactdefaultargs") SetTextureCoords;
		%feature("autodoc", "* Specify correspondence between node IDs and texture coordinates (range [0, 1])
	:param theMap:
	:type theMap: TColStd_DataMapOfIntegerReal
	:rtype: None") SetTextureCoords;
		void SetTextureCoords (const TColStd_DataMapOfIntegerReal & theMap);

		/****************** UseTexture ******************/
		%feature("compactdefaultargs") UseTexture;
		%feature("autodoc", "* Specify whether texture must be used to build presentation
	:param theToUse:
	:type theToUse: bool
	:rtype: None") UseTexture;
		void UseTexture (const Standard_Boolean theToUse);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds presentation of text data
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param IsElement:
	:type IsElement: bool
	:param theDisplayMode:
	:type theDisplayMode: int
	:rtype: void") Build;
		virtual void Build (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer theDisplayMode);

		/****************** GetText ******************/
		%feature("compactdefaultargs") GetText;
		%feature("autodoc", "* Returns text assigned with single node or element
	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Text:
	:type Text: TCollection_AsciiString
	:rtype: bool") GetText;
		Standard_Boolean GetText (const Standard_Boolean IsElement,const Standard_Integer ID,TCollection_AsciiString & Text);

		/****************** GetTexts ******************/
		%feature("compactdefaultargs") GetTexts;
		%feature("autodoc", "* Returns map of text assigned with nodes ( IsElement = False ) or elements ( IsElement = True )
	:param IsElement:
	:type IsElement: bool
	:rtype: MeshVS_DataMapOfIntegerAsciiString") GetTexts;
		const MeshVS_DataMapOfIntegerAsciiString & GetTexts (const Standard_Boolean IsElement);

		/****************** HasTexts ******************/
		%feature("compactdefaultargs") HasTexts;
		%feature("autodoc", "* Returns True if map isn't empty
	:param IsElement:
	:type IsElement: bool
	:rtype: bool") HasTexts;
		Standard_Boolean HasTexts (const Standard_Boolean IsElement);

		/****************** MeshVS_TextPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_TextPrsBuilder;
		%feature("autodoc", ":param Parent:
	:type Parent: MeshVS_Mesh
	:param Height:
	:type Height: float
	:param Color:
	:type Color: Quantity_Color
	:param Flags: default value is MeshVS_DMF_TextDataPrs
	:type Flags: int
	:param DS: default value is 0
	:type DS: MeshVS_DataSource
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_Text
	:type Priority: int
	:rtype: None") MeshVS_TextPrsBuilder;
		 MeshVS_TextPrsBuilder (const opencascade::handle<MeshVS_Mesh> & Parent,const Standard_Real Height,const Quantity_Color & Color,int Flags = MeshVS_DMF_TextDataPrs,const opencascade::handle<MeshVS_DataSource> & DS = 0,const Standard_Integer Id = -1,int Priority = MeshVS_BP_Text);

		/****************** SetText ******************/
		%feature("compactdefaultargs") SetText;
		%feature("autodoc", "* Sets text assigned with single node or element
	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Text:
	:type Text: TCollection_AsciiString
	:rtype: None") SetText;
		void SetText (const Standard_Boolean IsElement,const Standard_Integer ID,const TCollection_AsciiString & Text);

		/****************** SetTexts ******************/
		%feature("compactdefaultargs") SetTexts;
		%feature("autodoc", "* Sets map of text assigned with nodes or elements
	:param IsElement:
	:type IsElement: bool
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerAsciiString
	:rtype: None") SetTexts;
		void SetTexts (const Standard_Boolean IsElement,const MeshVS_DataMapOfIntegerAsciiString & Map);

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
		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds vector data presentation
	:param Prs:
	:type Prs: Prs3d_Presentation
	:param IDs:
	:type IDs: TColStd_PackedMapOfInteger
	:param IDsToExclude:
	:type IDsToExclude: TColStd_PackedMapOfInteger
	:param IsElement:
	:type IsElement: bool
	:param theDisplayMode:
	:type theDisplayMode: int
	:rtype: void") Build;
		virtual void Build (const opencascade::handle<Prs3d_Presentation> & Prs,const TColStd_PackedMapOfInteger & IDs,TColStd_PackedMapOfInteger & IDsToExclude,const Standard_Boolean IsElement,const Standard_Integer theDisplayMode);

		/****************** DrawVector ******************/
		%feature("compactdefaultargs") DrawVector;
		%feature("autodoc", "* Adds to array of polygons and polylines some primitive representing single vector
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:param Length:
	:type Length: float
	:param MaxLength:
	:type MaxLength: float
	:param ArrowPoints:
	:type ArrowPoints: TColgp_Array1OfPnt
	:param Lines:
	:type Lines: Graphic3d_ArrayOfPrimitives
	:param ArrowLines:
	:type ArrowLines: Graphic3d_ArrayOfPrimitives
	:param Triangles:
	:type Triangles: Graphic3d_ArrayOfPrimitives
	:rtype: None") DrawVector;
		void DrawVector (const gp_Trsf & theTrsf,const Standard_Real Length,const Standard_Real MaxLength,const TColgp_Array1OfPnt & ArrowPoints,const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Lines,const opencascade::handle<Graphic3d_ArrayOfPrimitives> & ArrowLines,const opencascade::handle<Graphic3d_ArrayOfPrimitives> & Triangles);

		/****************** GetMinMaxVectorValue ******************/
		%feature("compactdefaultargs") GetMinMaxVectorValue;
		%feature("autodoc", "* Calculates minimal and maximal length of vectors in map ( nodal, if IsElement = False or elemental, if IsElement = True )
	:param IsElement:
	:type IsElement: bool
	:param MinValue:
	:type MinValue: float
	:param MaxValue:
	:type MaxValue: float
	:rtype: None") GetMinMaxVectorValue;
		void GetMinMaxVectorValue (const Standard_Boolean IsElement,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetVector ******************/
		%feature("compactdefaultargs") GetVector;
		%feature("autodoc", "* Returns vector assigned with certain node or element
	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: bool") GetVector;
		Standard_Boolean GetVector (const Standard_Boolean IsElement,const Standard_Integer ID,gp_Vec & Vect);

		/****************** GetVectors ******************/
		%feature("compactdefaultargs") GetVectors;
		%feature("autodoc", "* Returns map of vectors assigned with nodes or elements
	:param IsElement:
	:type IsElement: bool
	:rtype: MeshVS_DataMapOfIntegerVector") GetVectors;
		const MeshVS_DataMapOfIntegerVector & GetVectors (const Standard_Boolean IsElement);

		/****************** HasVectors ******************/
		%feature("compactdefaultargs") HasVectors;
		%feature("autodoc", "* Returns true, if map isn't empty
	:param IsElement:
	:type IsElement: bool
	:rtype: bool") HasVectors;
		Standard_Boolean HasVectors (const Standard_Boolean IsElement);

		/****************** MeshVS_VectorPrsBuilder ******************/
		%feature("compactdefaultargs") MeshVS_VectorPrsBuilder;
		%feature("autodoc", ":param Parent:
	:type Parent: MeshVS_Mesh
	:param MaxLength:
	:type MaxLength: float
	:param VectorColor:
	:type VectorColor: Quantity_Color
	:param Flags: default value is MeshVS_DMF_VectorDataPrs
	:type Flags: int
	:param DS: default value is 0
	:type DS: MeshVS_DataSource
	:param Id: default value is -1
	:type Id: int
	:param Priority: default value is MeshVS_BP_Vector
	:type Priority: int
	:param IsSimplePrs: default value is Standard_False
	:type IsSimplePrs: bool
	:rtype: None") MeshVS_VectorPrsBuilder;
		 MeshVS_VectorPrsBuilder (const opencascade::handle<MeshVS_Mesh> & Parent,const Standard_Real MaxLength,const Quantity_Color & VectorColor,int Flags = MeshVS_DMF_VectorDataPrs,const opencascade::handle<MeshVS_DataSource> & DS = 0,const Standard_Integer Id = -1,int Priority = MeshVS_BP_Vector,const Standard_Boolean IsSimplePrs = Standard_False);

		/****************** SetSimplePrsMode ******************/
		%feature("compactdefaultargs") SetSimplePrsMode;
		%feature("autodoc", "* Sets flag that indicates is simple vector arrow mode uses or not default value is False
	:param IsSimpleArrow:
	:type IsSimpleArrow: bool
	:rtype: None") SetSimplePrsMode;
		void SetSimplePrsMode (const Standard_Boolean IsSimpleArrow);

		/****************** SetSimplePrsParams ******************/
		%feature("compactdefaultargs") SetSimplePrsParams;
		%feature("autodoc", "* Sets parameters of simple vector arrwo presentation theLineWidthParam - coefficient of vector line width (to draw line instead of arrow) theStartParam and theEndParam parameters of start and end of thickened ends position of thickening calculates according to parameters and maximum vector length default values are: theLineWidthParam = 2.5 theStartParam = 0.85 theEndParam = 0.95
	:param theLineWidthParam:
	:type theLineWidthParam: float
	:param theStartParam:
	:type theStartParam: float
	:param theEndParam:
	:type theEndParam: float
	:rtype: None") SetSimplePrsParams;
		void SetSimplePrsParams (const Standard_Real theLineWidthParam,const Standard_Real theStartParam,const Standard_Real theEndParam);

		/****************** SetVector ******************/
		%feature("compactdefaultargs") SetVector;
		%feature("autodoc", "* Sets vector assigned with certain node or element
	:param IsElement:
	:type IsElement: bool
	:param ID:
	:type ID: int
	:param Vect:
	:type Vect: gp_Vec
	:rtype: None") SetVector;
		void SetVector (const Standard_Boolean IsElement,const Standard_Integer ID,const gp_Vec & Vect);

		/****************** SetVectors ******************/
		%feature("compactdefaultargs") SetVectors;
		%feature("autodoc", "* Sets map of vectors assigned with nodes or elements
	:param IsElement:
	:type IsElement: bool
	:param Map:
	:type Map: MeshVS_DataMapOfIntegerVector
	:rtype: None") SetVectors;
		void SetVectors (const Standard_Boolean IsElement,const MeshVS_DataMapOfIntegerVector & Map);

		/****************** calculateArrow ******************/
		%feature("compactdefaultargs") calculateArrow;
		%feature("autodoc", "* Calculates points of arrow presentation
	:param Points:
	:type Points: TColgp_Array1OfPnt
	:param Length:
	:type Length: float
	:param ArrowPart:
	:type ArrowPart: float
	:rtype: float") calculateArrow;
		static Standard_Real calculateArrow (TColgp_Array1OfPnt & Points,const Standard_Real Length,const Standard_Real ArrowPart);

};


%make_alias(MeshVS_VectorPrsBuilder)

%extend MeshVS_VectorPrsBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class MeshVS_HArray1OfSequenceOfInteger : public  MeshVS_Array1OfSequenceOfInteger, public Standard_Transient {
  public:
    MeshVS_HArray1OfSequenceOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper);
    MeshVS_HArray1OfSequenceOfInteger(const Standard_Integer theLower, const Standard_Integer theUpper, const  MeshVS_Array1OfSequenceOfInteger::value_type& theValue);
    MeshVS_HArray1OfSequenceOfInteger(const  MeshVS_Array1OfSequenceOfInteger& theOther);
    const  MeshVS_Array1OfSequenceOfInteger& Array1();
     MeshVS_Array1OfSequenceOfInteger& ChangeArray1();
};
%make_alias(MeshVS_HArray1OfSequenceOfInteger)


/* harray2 classes */
/* hsequence classes */
