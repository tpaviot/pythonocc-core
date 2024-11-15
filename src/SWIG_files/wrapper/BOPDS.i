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
%define BOPDSDOCSTRING
"BOPDS module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_bopds.html"
%enddef
%module (package="OCC.Core", docstring=BOPDSDOCSTRING) BOPDS


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
#include<BOPDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<IntTools_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<TopAbs_module.hxx>
#include<gp_module.hxx>
#include<IntTools_module.hxx>
#include<AppParCurves_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<FEmTool_module.hxx>
#include<Extrema_module.hxx>
#include<IntAna_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Quantity_module.hxx>
#include<HatchGen_module.hxx>
#include<TopLoc_module.hxx>
#include<Approx_module.hxx>
#include<Geom2dHatch_module.hxx>
#include<IntRes2d_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<BRepClass3d_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dInt_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<IntPatch_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Bnd.i
%import IntTools.i
%import TopoDS.i
%import TopTools.i
%import TopAbs.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BOPDS_CommonBlock)
%wrap_handle(BOPDS_PaveBlock)
/* end handles declaration */

/* templates */
%template(BOPDS_DataMapOfIntegerListOfPaveBlock) NCollection_DataMap<Standard_Integer,BOPDS_ListOfPaveBlock>;

%extend NCollection_DataMap<Standard_Integer,BOPDS_ListOfPaveBlock> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (BOPDS_DataMapOfIntegerListOfPaveBlock::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(BOPDS_DataMapOfPaveBlockListOfInteger) NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>;
%template(BOPDS_DataMapOfPaveBlockListOfPaveBlock) NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>,BOPDS_ListOfPaveBlock>;
%template(BOPDS_DataMapOfShapeCoupleOfPaveBlocks) NCollection_DataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>;
%template(BOPDS_IndexedDataMapOfPaveBlockListOfInteger) NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>;
%template(BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock) NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,BOPDS_ListOfPaveBlock>;
%template(BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks) NCollection_IndexedDataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>;
%template(BOPDS_IndexedMapOfPaveBlock) NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>;
%template(BOPDS_ListOfPave) NCollection_List<BOPDS_Pave>;

%extend NCollection_List<BOPDS_Pave> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BOPDS_ListOfPaveBlock) NCollection_List<opencascade::handle<BOPDS_PaveBlock>>;

%extend NCollection_List<opencascade::handle<BOPDS_PaveBlock>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BOPDS_MapOfCommonBlock) NCollection_Map<opencascade::handle<BOPDS_CommonBlock>>;
%template(BOPDS_MapOfPair) NCollection_Map<BOPDS_Pair>;
%template(BOPDS_MapOfPave) NCollection_Map<BOPDS_Pave>;
%template(BOPDS_MapOfPaveBlock) NCollection_Map<opencascade::handle<BOPDS_PaveBlock>>;
%template(BOPDS_VectorOfCurve) NCollection_Vector<BOPDS_Curve>;
%template(BOPDS_VectorOfFaceInfo) NCollection_Vector<BOPDS_FaceInfo>;
%template(BOPDS_VectorOfIndexRange) NCollection_Vector<BOPDS_IndexRange>;
%template(BOPDS_VectorOfInterfEE) NCollection_Vector<BOPDS_InterfEE>;
%template(BOPDS_VectorOfInterfEF) NCollection_Vector<BOPDS_InterfEF>;
%template(BOPDS_VectorOfInterfEZ) NCollection_Vector<BOPDS_InterfEZ>;
%template(BOPDS_VectorOfInterfFF) NCollection_Vector<BOPDS_InterfFF>;
%template(BOPDS_VectorOfInterfFZ) NCollection_Vector<BOPDS_InterfFZ>;
%template(BOPDS_VectorOfInterfVE) NCollection_Vector<BOPDS_InterfVE>;
%template(BOPDS_VectorOfInterfVF) NCollection_Vector<BOPDS_InterfVF>;
%template(BOPDS_VectorOfInterfVV) NCollection_Vector<BOPDS_InterfVV>;
%template(BOPDS_VectorOfInterfVZ) NCollection_Vector<BOPDS_InterfVZ>;
%template(BOPDS_VectorOfInterfZZ) NCollection_Vector<BOPDS_InterfZZ>;
%template(BOPDS_VectorOfListOfPaveBlock) NCollection_Vector<BOPDS_ListOfPaveBlock>;
%template(BOPDS_VectorOfPair) NCollection_Vector<BOPDS_Pair>;
%template(BOPDS_VectorOfPave) NCollection_Array1<BOPDS_Pave>;
Array1ExtendIter(BOPDS_Pave)

%template(BOPDS_VectorOfPoint) NCollection_Vector<BOPDS_Point>;
%template(BOPDS_VectorOfShapeInfo) NCollection_Vector<BOPDS_ShapeInfo>;
%template(BOPDS_VectorOfVectorOfPair) NCollection_Vector<BOPDS_VectorOfPair>;
/* end templates declaration */

/* typedefs */
typedef BOPDS_DataMapOfPaveBlockCommonBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockCommonBlock;
typedef BOPDS_DataMapOfPaveBlockListOfInteger::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfInteger;
typedef BOPDS_DataMapOfPaveBlockListOfPaveBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfPaveBlock;
typedef BOPDS_DataMapOfShapeCoupleOfPaveBlocks::Iterator BOPDS_DataMapIteratorOfDataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_DataMap<Standard_Integer, BOPDS_ListOfPaveBlock> BOPDS_DataMapOfIntegerListOfPaveBlock;
typedef NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger> BOPDS_DataMapOfPaveBlockListOfInteger;
typedef NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>, BOPDS_ListOfPaveBlock> BOPDS_DataMapOfPaveBlockListOfPaveBlock;
typedef NCollection_DataMap<TopoDS_Shape, BOPDS_CoupleOfPaveBlocks, TopTools_ShapeMapHasher> BOPDS_DataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger> BOPDS_IndexedDataMapOfPaveBlockListOfInteger;
typedef NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>, BOPDS_ListOfPaveBlock> BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock;
typedef NCollection_IndexedDataMap<TopoDS_Shape, BOPDS_CoupleOfPaveBlocks, TopTools_ShapeMapHasher> BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> BOPDS_IndexedMapOfPaveBlock;
typedef BOPDS_ListOfPave::Iterator BOPDS_ListIteratorOfListOfPave;
typedef BOPDS_ListOfPaveBlock::Iterator BOPDS_ListIteratorOfListOfPaveBlock;
typedef NCollection_List<BOPDS_Pave> BOPDS_ListOfPave;
typedef NCollection_List<opencascade::handle<BOPDS_PaveBlock>> BOPDS_ListOfPaveBlock;
typedef BOPDS_MapOfCommonBlock::Iterator BOPDS_MapIteratorOfMapOfCommonBlock;
typedef BOPDS_MapOfPair::Iterator BOPDS_MapIteratorOfMapOfPair;
typedef BOPDS_MapOfPave::Iterator BOPDS_MapIteratorOfMapOfPave;
typedef BOPDS_MapOfPaveBlock::Iterator BOPDS_MapIteratorOfMapOfPaveBlock;
typedef NCollection_Map<opencascade::handle<BOPDS_CommonBlock>> BOPDS_MapOfCommonBlock;
typedef NCollection_Map<BOPDS_Pair> BOPDS_MapOfPair;
typedef NCollection_Map<BOPDS_Pave> BOPDS_MapOfPave;
typedef NCollection_Map<opencascade::handle<BOPDS_PaveBlock>> BOPDS_MapOfPaveBlock;
typedef BOPDS_DS * BOPDS_PDS;
typedef BOPDS_Iterator * BOPDS_PIterator;
typedef BOPDS_IteratorSI * BOPDS_PIteratorSI;
typedef NCollection_Vector<BOPDS_Curve> BOPDS_VectorOfCurve;
typedef NCollection_Vector<BOPDS_FaceInfo> BOPDS_VectorOfFaceInfo;
typedef NCollection_Vector<BOPDS_IndexRange> BOPDS_VectorOfIndexRange;
typedef NCollection_Vector<BOPDS_InterfEE> BOPDS_VectorOfInterfEE;
typedef NCollection_Vector<BOPDS_InterfEF> BOPDS_VectorOfInterfEF;
typedef NCollection_Vector<BOPDS_InterfEZ> BOPDS_VectorOfInterfEZ;
typedef NCollection_Vector<BOPDS_InterfFF> BOPDS_VectorOfInterfFF;
typedef NCollection_Vector<BOPDS_InterfFZ> BOPDS_VectorOfInterfFZ;
typedef NCollection_Vector<BOPDS_InterfVE> BOPDS_VectorOfInterfVE;
typedef NCollection_Vector<BOPDS_InterfVF> BOPDS_VectorOfInterfVF;
typedef NCollection_Vector<BOPDS_InterfVV> BOPDS_VectorOfInterfVV;
typedef NCollection_Vector<BOPDS_InterfVZ> BOPDS_VectorOfInterfVZ;
typedef NCollection_Vector<BOPDS_InterfZZ> BOPDS_VectorOfInterfZZ;
typedef NCollection_Vector<BOPDS_ListOfPaveBlock> BOPDS_VectorOfListOfPaveBlock;
typedef NCollection_Vector<BOPDS_Pair> BOPDS_VectorOfPair;
typedef NCollection_Array1<BOPDS_Pave> BOPDS_VectorOfPave;
typedef NCollection_Vector<BOPDS_Point> BOPDS_VectorOfPoint;
typedef NCollection_Vector<BOPDS_ShapeInfo> BOPDS_VectorOfShapeInfo;
typedef NCollection_Vector<BOPDS_VectorOfPair> BOPDS_VectorOfVectorOfPair;
/* end typedefs declaration */

/**************************
* class BOPDS_CommonBlock *
**************************/
class BOPDS_CommonBlock : public Standard_Transient {
	public:
		/****** BOPDS_CommonBlock::BOPDS_CommonBlock ******/
		/****** md5 signature: 92a8163598663f388a0cc06d557c3d62 ******/
		%feature("compactdefaultargs") BOPDS_CommonBlock;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock();

		/****** BOPDS_CommonBlock::BOPDS_CommonBlock ******/
		/****** md5 signature: df854f8c56258e94a4fa5e1297ec0b70 ******/
		%feature("compactdefaultargs") BOPDS_CommonBlock;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_CommonBlock::AddFace ******/
		/****** md5 signature: 714848e0da983a50147a1a6fe5cc137f ******/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "
Parameters
----------
aF: int

Return
-------
None

Description
-----------
Modifier adds the index of the face <af> to the list of indices of faces of the common block.
") AddFace;
		void AddFace(const Standard_Integer aF);

		/****** BOPDS_CommonBlock::AddPaveBlock ******/
		/****** md5 signature: 40476ddb9e36cdbcc5eee8010b97ab4c ******/
		%feature("compactdefaultargs") AddPaveBlock;
		%feature("autodoc", "
Parameters
----------
aPB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
Modifier adds the pave block <apb> to the list of pave blocks of the common block.
") AddPaveBlock;
		void AddPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & aPB);

		/****** BOPDS_CommonBlock::AppendFaces ******/
		/****** md5 signature: 5ce63b846074664c228a675dcb45a458 ******/
		%feature("compactdefaultargs") AppendFaces;
		%feature("autodoc", "
Parameters
----------
aLF: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Modifier appends the list of indices of faces <alf> to the list of indices of faces of the common block (the input list is emptied).
") AppendFaces;
		void AppendFaces(TColStd_ListOfInteger & aLF);

		/****** BOPDS_CommonBlock::Contains ******/
		/****** md5 signature: 5b22a1e11ec5b4dc5629d25b7250f464 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
bool

Description
-----------
Query returns true if the common block contains a pave block that is equal to <thepb>.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_CommonBlock::Contains ******/
		/****** md5 signature: e176c1347c329fce1ef7d92975a35938 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theF: int

Return
-------
bool

Description
-----------
Query returns true if the common block contains the face with index equal to <thef>.
") Contains;
		Standard_Boolean Contains(const Standard_Integer theF);

		/****** BOPDS_CommonBlock::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** BOPDS_CommonBlock::Edge ******/
		/****** md5 signature: 76748ffd591f786c44105943fcd6acd5 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the index of the edge of all pave blocks of the common block.
") Edge;
		Standard_Integer Edge();

		/****** BOPDS_CommonBlock::Faces ******/
		/****** md5 signature: f01cee5175506ebd45b83cb3b3b4131b ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector returns the list of indices of faces of the common block.
") Faces;
		const TColStd_ListOfInteger & Faces();

		/****** BOPDS_CommonBlock::IsPaveBlockOnEdge ******/
		/****** md5 signature: 556c9b86abcb2e00fd4015462e486e3a ******/
		%feature("compactdefaultargs") IsPaveBlockOnEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
bool

Description
-----------
Query returns true if the common block contains a pave block that belongs to the edge with index <theix>.
") IsPaveBlockOnEdge;
		Standard_Boolean IsPaveBlockOnEdge(const Standard_Integer theIndex);

		/****** BOPDS_CommonBlock::IsPaveBlockOnFace ******/
		/****** md5 signature: a763ade0791732f6be00ac3203ae8699 ******/
		%feature("compactdefaultargs") IsPaveBlockOnFace;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
bool

Description
-----------
Query returns true if the common block contains a pave block that belongs to the face with index <theix>.
") IsPaveBlockOnFace;
		Standard_Boolean IsPaveBlockOnFace(const Standard_Integer theIndex);

		/****** BOPDS_CommonBlock::PaveBlock1 ******/
		/****** md5 signature: 38e85104f9e5048af41cb3d65ab07ee3 ******/
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
Selector returns the first pave block of the common block.
") PaveBlock1;
		const opencascade::handle<BOPDS_PaveBlock> & PaveBlock1();

		/****** BOPDS_CommonBlock::PaveBlockOnEdge ******/
		/****** md5 signature: f3596403b9d0aac976dafd133944bfec ******/
		%feature("compactdefaultargs") PaveBlockOnEdge;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
Selector returns the pave block that belongs to the edge with index <theix>.
") PaveBlockOnEdge;
		opencascade::handle<BOPDS_PaveBlock> & PaveBlockOnEdge(const Standard_Integer theIndex);

		/****** BOPDS_CommonBlock::PaveBlocks ******/
		/****** md5 signature: 7d51c8e06f45b23721dd9a87453d2391 ******/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "Return
-------
BOPDS_ListOfPaveBlock

Description
-----------
Selector returns the list of pave blocks of the common block.
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks();

		/****** BOPDS_CommonBlock::SetEdge ******/
		/****** md5 signature: e5f0cb270588385f5c43b443c7a3911e ******/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: int

Return
-------
None

Description
-----------
Modifier assign the index <theedge> as the edge index to all pave blocks of the common block.
") SetEdge;
		void SetEdge(const Standard_Integer theEdge);

		/****** BOPDS_CommonBlock::SetFaces ******/
		/****** md5 signature: df9d7d397e0a70d489fa65f29e832130 ******/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "
Parameters
----------
aLF: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Modifier sets the list of indices of faces <alf> of the common block.
") SetFaces;
		void SetFaces(const TColStd_ListOfInteger & aLF);

		/****** BOPDS_CommonBlock::SetPaveBlocks ******/
		/****** md5 signature: 1b0483dad806e671b173313df9ef53b7 ******/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "
Parameters
----------
aLPB: BOPDS_ListOfPaveBlock

Return
-------
None

Description
-----------
Modifier sets the list of pave blocks for the common block.
") SetPaveBlocks;
		void SetPaveBlocks(const BOPDS_ListOfPaveBlock & aLPB);

		/****** BOPDS_CommonBlock::SetRealPaveBlock ******/
		/****** md5 signature: bd90910404bf474e53d2306cbe0b543b ******/
		%feature("compactdefaultargs") SetRealPaveBlock;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
Moves the pave blocks in the list to make the given pave block to be the first. it will be representative for the whole group.
") SetRealPaveBlock;
		void SetRealPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_CommonBlock::SetTolerance ******/
		/****** md5 signature: 3d7576e44e771b252fc1783601ea4631 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
Sets the tolerance for the common block.
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****** BOPDS_CommonBlock::Tolerance ******/
		/****** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return the tolerance of common block.
") Tolerance;
		Standard_Real Tolerance();

};


%make_alias(BOPDS_CommonBlock)

%extend BOPDS_CommonBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BOPDS_CoupleOfPaveBlocks *
*********************************/
class BOPDS_CoupleOfPaveBlocks {
	public:
		/****** BOPDS_CoupleOfPaveBlocks::BOPDS_CoupleOfPaveBlocks ******/
		/****** md5 signature: 4da52fdebc0ef3b3fa5901784d78a411 ******/
		%feature("compactdefaultargs") BOPDS_CoupleOfPaveBlocks;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks();

		/****** BOPDS_CoupleOfPaveBlocks::BOPDS_CoupleOfPaveBlocks ******/
		/****** md5 signature: 172b7f8f41b35e1ec971579ff5740616 ******/
		%feature("compactdefaultargs") BOPDS_CoupleOfPaveBlocks;
		%feature("autodoc", "
Parameters
----------
thePB1: BOPDS_PaveBlock
thePB2: BOPDS_PaveBlock

Return
-------
None

Description
-----------
/** * constructor * @param thepb1 * first pave block * @param thepb2 * secondt pave block */.
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks(const opencascade::handle<BOPDS_PaveBlock> & thePB1, const opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****** BOPDS_CoupleOfPaveBlocks::Index ******/
		/****** md5 signature: 0be2d384cf83d16771bb3f9c857c6326 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * returns the index * return * index */.
") Index;
		Standard_Integer Index();

		/****** BOPDS_CoupleOfPaveBlocks::IndexInterf ******/
		/****** md5 signature: f53221f131b48fa86a70c5cca779b235 ******/
		%feature("compactdefaultargs") IndexInterf;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * returns the index of an interference * return * index of an interference */.
") IndexInterf;
		Standard_Integer IndexInterf();

		/****** BOPDS_CoupleOfPaveBlocks::PaveBlock1 ******/
		/****** md5 signature: fbed016ee3e75bed6bbdc5dc7e5b9e3f ******/
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
No available documentation.
") PaveBlock1;
		const opencascade::handle<BOPDS_PaveBlock> & PaveBlock1();

		/****** BOPDS_CoupleOfPaveBlocks::PaveBlock2 ******/
		/****** md5 signature: c11c5d7da97830f552326c1f5060abd7 ******/
		%feature("compactdefaultargs") PaveBlock2;
		%feature("autodoc", "Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
No available documentation.
") PaveBlock2;
		const opencascade::handle<BOPDS_PaveBlock> & PaveBlock2();

		/****** BOPDS_CoupleOfPaveBlocks::PaveBlocks ******/
		/****** md5 signature: 742498916321e6fa2c60c1c2fa641fb7 ******/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "
Parameters
----------
thePB1: BOPDS_PaveBlock
thePB2: BOPDS_PaveBlock

Return
-------
None

Description
-----------
No available documentation.
") PaveBlocks;
		void PaveBlocks(opencascade::handle<BOPDS_PaveBlock> & thePB1, opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****** BOPDS_CoupleOfPaveBlocks::SetIndex ******/
		/****** md5 signature: 5d636b968374ec848f4cd1fad9815499 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
/** * sets an index * @param theindex * index */.
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****** BOPDS_CoupleOfPaveBlocks::SetIndexInterf ******/
		/****** md5 signature: d82912a5e6070d14fdaa4e4b53bfbf16 ******/
		%feature("compactdefaultargs") SetIndexInterf;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndexInterf;
		void SetIndexInterf(const Standard_Integer theIndex);

		/****** BOPDS_CoupleOfPaveBlocks::SetPaveBlock1 ******/
		/****** md5 signature: acf4bc4664fb826b50250c087925e0d4 ******/
		%feature("compactdefaultargs") SetPaveBlock1;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
No available documentation.
") SetPaveBlock1;
		void SetPaveBlock1(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_CoupleOfPaveBlocks::SetPaveBlock2 ******/
		/****** md5 signature: d8fe450c6b6529f87a18a0ffa11e9323 ******/
		%feature("compactdefaultargs") SetPaveBlock2;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
No available documentation.
") SetPaveBlock2;
		void SetPaveBlock2(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_CoupleOfPaveBlocks::SetPaveBlocks ******/
		/****** md5 signature: 718ca1b486bee0d326da69a80a6c9984 ******/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "
Parameters
----------
thePB1: BOPDS_PaveBlock
thePB2: BOPDS_PaveBlock

Return
-------
None

Description
-----------
No available documentation.
") SetPaveBlocks;
		void SetPaveBlocks(const opencascade::handle<BOPDS_PaveBlock> & thePB1, const opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****** BOPDS_CoupleOfPaveBlocks::SetTolerance ******/
		/****** md5 signature: 3d7576e44e771b252fc1783601ea4631 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
/** * sets the tolerance associated with this couple */.
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****** BOPDS_CoupleOfPaveBlocks::Tolerance ******/
		/****** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
/** * returns the tolerance associated with this couple */.
") Tolerance;
		Standard_Real Tolerance();

};


%extend BOPDS_CoupleOfPaveBlocks {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class BOPDS_Curve *
********************/
class BOPDS_Curve {
	public:
		/****** BOPDS_Curve::BOPDS_Curve ******/
		/****** md5 signature: b72e3545eb213b0dc6aafa98d0055770 ******/
		%feature("compactdefaultargs") BOPDS_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_Curve;
		 BOPDS_Curve();

		/****** BOPDS_Curve::BOPDS_Curve ******/
		/****** md5 signature: f93e5d7b27c0f12229424fa02dc011ee ******/
		%feature("compactdefaultargs") BOPDS_Curve;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_Curve;
		 BOPDS_Curve(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_Curve::Box ******/
		/****** md5 signature: 7c4ea237507e51916495e768089f878e ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Selector returns the bounding box of the curve.
") Box;
		const Bnd_Box & Box();

		/****** BOPDS_Curve::ChangeBox ******/
		/****** md5 signature: 5631b4e4d9ba9acf6c3e62a29ae5b2c2 ******/
		%feature("compactdefaultargs") ChangeBox;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Selector/modifier returns the bounding box of the curve.
") ChangeBox;
		Bnd_Box & ChangeBox();

		/****** BOPDS_Curve::ChangePaveBlock1 ******/
		/****** md5 signature: 33ecf769dcc3de2a931c764889747312 ******/
		%feature("compactdefaultargs") ChangePaveBlock1;
		%feature("autodoc", "Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
Selector/modifier returns initial pave block of the curve.
") ChangePaveBlock1;
		opencascade::handle<BOPDS_PaveBlock> & ChangePaveBlock1();

		/****** BOPDS_Curve::ChangePaveBlocks ******/
		/****** md5 signature: 5a68e5768876becb3226e5b71004feeb ******/
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "Return
-------
BOPDS_ListOfPaveBlock

Description
-----------
Selector/modifier returns the list of pave blocks of the curve.
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks();

		/****** BOPDS_Curve::ChangeTechnoVertices ******/
		/****** md5 signature: 4c2d6c6a355395f1703c558e7a77e79f ******/
		%feature("compactdefaultargs") ChangeTechnoVertices;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector/modifier returns list of indices of technologic vertices of the curve.
") ChangeTechnoVertices;
		TColStd_ListOfInteger & ChangeTechnoVertices();

		/****** BOPDS_Curve::Curve ******/
		/****** md5 signature: f601887c73fa6c5311bace5eeee9b758 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
IntTools_Curve

Description
-----------
Selector returns the curve.
") Curve;
		IntTools_Curve Curve();

		/****** BOPDS_Curve::HasEdge ******/
		/****** md5 signature: b29d7c6fb0d75a5501e02d3f7002ad41 ******/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns true if at least one pave block of the curve has edge.
") HasEdge;
		Standard_Boolean HasEdge();

		/****** BOPDS_Curve::InitPaveBlock1 ******/
		/****** md5 signature: 9029705f3ca329328cf1b75de1922c4e ******/
		%feature("compactdefaultargs") InitPaveBlock1;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates initial pave block of the curve.
") InitPaveBlock1;
		void InitPaveBlock1();

		/****** BOPDS_Curve::PaveBlocks ******/
		/****** md5 signature: 7d51c8e06f45b23721dd9a87453d2391 ******/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "Return
-------
BOPDS_ListOfPaveBlock

Description
-----------
Selector returns the list of pave blocks of the curve.
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks();

		/****** BOPDS_Curve::SetBox ******/
		/****** md5 signature: 08b5255d733c5c76b81013bedaa4c32d ******/
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
None

Description
-----------
Modifier sets the bounding box <thebox> of the curve.
") SetBox;
		void SetBox(const Bnd_Box & theBox);

		/****** BOPDS_Curve::SetCurve ******/
		/****** md5 signature: 7ef354f0cb8480e0895b05ee41111bd2 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theC: IntTools_Curve

Return
-------
None

Description
-----------
Modifier sets the curve <thec>.
") SetCurve;
		void SetCurve(const IntTools_Curve & theC);

		/****** BOPDS_Curve::SetPaveBlocks ******/
		/****** md5 signature: 396db1816ffe1d8df6fee2dd320f1385 ******/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "
Parameters
----------
theLPB: BOPDS_ListOfPaveBlock

Return
-------
None

Description
-----------
No available documentation.
") SetPaveBlocks;
		void SetPaveBlocks(const BOPDS_ListOfPaveBlock & theLPB);

		/****** BOPDS_Curve::SetTolerance ******/
		/****** md5 signature: 3d7576e44e771b252fc1783601ea4631 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
Sets the tolerance for the curve.
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****** BOPDS_Curve::TangentialTolerance ******/
		/****** md5 signature: c1e785de724669f2f929496d8c904a9c ******/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tangential tolerance of the curve.
") TangentialTolerance;
		Standard_Real TangentialTolerance();

		/****** BOPDS_Curve::TechnoVertices ******/
		/****** md5 signature: 9266b29efc3610cc962a9ba1b2063c66 ******/
		%feature("compactdefaultargs") TechnoVertices;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector returns list of indices of technologic vertices of the curve.
") TechnoVertices;
		const TColStd_ListOfInteger & TechnoVertices();

		/****** BOPDS_Curve::Tolerance ******/
		/****** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tolerance of the curve.
") Tolerance;
		Standard_Real Tolerance();

};


%extend BOPDS_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class BOPDS_DS *
*****************/
class BOPDS_DS {
	public:
		/****** BOPDS_DS::BOPDS_DS ******/
		/****** md5 signature: f9a3d2b6ab77d6d06736fd633088137f ******/
		%feature("compactdefaultargs") BOPDS_DS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_DS;
		 BOPDS_DS();

		/****** BOPDS_DS::BOPDS_DS ******/
		/****** md5 signature: 7ddac47ec4a184be023ac2ada301162c ******/
		%feature("compactdefaultargs") BOPDS_DS;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_DS;
		 BOPDS_DS(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_DS::AddInterf ******/
		/****** md5 signature: e208a2d1807b943e21900bd1a1bea9d8 ******/
		%feature("compactdefaultargs") AddInterf;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int

Return
-------
bool

Description
-----------
Modifier adds the information about an interference between shapes with indices thei1, thei2 to the summary table of interferences.
") AddInterf;
		Standard_Boolean AddInterf(const Standard_Integer theI1, const Standard_Integer theI2);

		/****** BOPDS_DS::AddShapeSD ******/
		/****** md5 signature: 72049a70b73d8f79599bac8aa8fdfd13 ******/
		%feature("compactdefaultargs") AddShapeSD;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theIndexSD: int

Return
-------
None

Description
-----------
Modifier adds the information about same domain shapes with indices theindex, theindexsd.
") AddShapeSD;
		void AddShapeSD(const Standard_Integer theIndex, const Standard_Integer theIndexSD);

		/****** BOPDS_DS::Allocator ******/
		/****** md5 signature: 16ec5fa9c8407823fdb0339c9f1d453e ******/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_BaseAllocator>

Description
-----------
Selector.
") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator();

		/****** BOPDS_DS::AloneVertices ******/
		/****** md5 signature: c93385a5f28b91fac106100deb86f0d3 ******/
		%feature("compactdefaultargs") AloneVertices;
		%feature("autodoc", "
Parameters
----------
theF: int
theLI: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Selector returns the indices of alone vertices for the face with index theindex.
") AloneVertices;
		void AloneVertices(const Standard_Integer theF, TColStd_ListOfInteger & theLI);

		/****** BOPDS_DS::Append ******/
		/****** md5 signature: 3e13f4e60ccb6615e6df53170490f097 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theSI: BOPDS_ShapeInfo

Return
-------
int

Description
-----------
Modifier appends the information about the shape [thesi] to the data structure returns the index of thesi in the data structure.
") Append;
		Standard_Integer Append(const BOPDS_ShapeInfo & theSI);

		/****** BOPDS_DS::Append ******/
		/****** md5 signature: 59ffffc8522871f8f1bfab4c318f3466 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
int

Description
-----------
Modifier appends the default information about the shape [thes] to the data structure returns the index of thes in the data structure.
") Append;
		Standard_Integer Append(const TopoDS_Shape & theS);

		/****** BOPDS_DS::Arguments ******/
		/****** md5 signature: 80309a121493a4f5d1f74be6db70eb2e ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Selector returns the arguments of an operation.
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****** BOPDS_DS::BuildBndBoxSolid ******/
		/****** md5 signature: ffe165738dd3059a8eebdf7686b24a4d ******/
		%feature("compactdefaultargs") BuildBndBoxSolid;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBox: Bnd_Box
theCheckInverted: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Computes bounding box <thebox> for the solid with ds-index <theindex>. the flag <thecheckinverted> enables/disables the check of the solid for inverted status. by default the solids will be checked.
") BuildBndBoxSolid;
		void BuildBndBoxSolid(const Standard_Integer theIndex, Bnd_Box & theBox, const Standard_Boolean theCheckInverted = Standard_True);

		/****** BOPDS_DS::ChangeFaceInfo ******/
		/****** md5 signature: 7172f9c4cd39086795416172658da4ba ******/
		%feature("compactdefaultargs") ChangeFaceInfo;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BOPDS_FaceInfo

Description
-----------
Selector/modifier returns the state of face with index theindex.
") ChangeFaceInfo;
		BOPDS_FaceInfo & ChangeFaceInfo(const Standard_Integer theIndex);

		/****** BOPDS_DS::ChangePaveBlocks ******/
		/****** md5 signature: 7299e5e8bc16bab9a322647e20d61b33 ******/
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BOPDS_ListOfPaveBlock

Description
-----------
Selector/modifier returns the pave blocks for the shape with index theindex.
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks(const Standard_Integer theIndex);

		/****** BOPDS_DS::ChangePaveBlocksPool ******/
		/****** md5 signature: 399ec244864e962bdc9de51c041427ce ******/
		%feature("compactdefaultargs") ChangePaveBlocksPool;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfListOfPaveBlock

Description
-----------
Selector/modifier returns the information about pave blocks on source edges.
") ChangePaveBlocksPool;
		BOPDS_VectorOfListOfPaveBlock & ChangePaveBlocksPool();

		/****** BOPDS_DS::ChangeShapeInfo ******/
		/****** md5 signature: 69ac6739f4453660035cfffcfae56704 ******/
		%feature("compactdefaultargs") ChangeShapeInfo;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BOPDS_ShapeInfo

Description
-----------
Selector/modifier returns the information about the shape with index theindex.
") ChangeShapeInfo;
		BOPDS_ShapeInfo & ChangeShapeInfo(const Standard_Integer theIndex);

		/****** BOPDS_DS::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the contents.
") Clear;
		void Clear();

		/****** BOPDS_DS::CommonBlock ******/
		/****** md5 signature: d35c8087f25db24045441a719b2b5866 ******/
		%feature("compactdefaultargs") CommonBlock;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
opencascade::handle<BOPDS_CommonBlock>

Description
-----------
Selector returns the common block.
") CommonBlock;
		opencascade::handle<BOPDS_CommonBlock> CommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** BOPDS_DS::FaceInfo ******/
		/****** md5 signature: 6ec8ca3eb06b147f5132a85deff896dd ******/
		%feature("compactdefaultargs") FaceInfo;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BOPDS_FaceInfo

Description
-----------
Selector returns the state of face with index theindex.
") FaceInfo;
		const BOPDS_FaceInfo & FaceInfo(const Standard_Integer theIndex);

		/****** BOPDS_DS::FaceInfoIn ******/
		/****** md5 signature: 1a244a93e8dfd09c6dfd80799a243c8c ******/
		%feature("compactdefaultargs") FaceInfoIn;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theMPB: BOPDS_IndexedMapOfPaveBlock
theMVP: TColStd_MapOfInteger

Return
-------
None

Description
-----------
Selector returns the state in [thempb,themvp] of face with index theindex.
") FaceInfoIn;
		void FaceInfoIn(const Standard_Integer theIndex, BOPDS_IndexedMapOfPaveBlock & theMPB, TColStd_MapOfInteger & theMVP);

		/****** BOPDS_DS::FaceInfoOn ******/
		/****** md5 signature: 8476cfdb28e35410fbccff7d3fea188c ******/
		%feature("compactdefaultargs") FaceInfoOn;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theMPB: BOPDS_IndexedMapOfPaveBlock
theMVP: TColStd_MapOfInteger

Return
-------
None

Description
-----------
Selector returns the state on [thempb,themvp] of face with index theindex.
") FaceInfoOn;
		void FaceInfoOn(const Standard_Integer theIndex, BOPDS_IndexedMapOfPaveBlock & theMPB, TColStd_MapOfInteger & theMVP);

		/****** BOPDS_DS::FaceInfoPool ******/
		/****** md5 signature: a6655407c6289d3016f98639683edc48 ******/
		%feature("compactdefaultargs") FaceInfoPool;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfFaceInfo

Description
-----------
Selector returns the information about state of faces.
") FaceInfoPool;
		const BOPDS_VectorOfFaceInfo & FaceInfoPool();

		/****** BOPDS_DS::HasFaceInfo ******/
		/****** md5 signature: 028f8f8ab3e7f0f2ed26c8c06cf455c2 ******/
		%feature("compactdefaultargs") HasFaceInfo;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
bool

Description
-----------
Query returns true if the shape with index theindex has the information about state of face.
") HasFaceInfo;
		Standard_Boolean HasFaceInfo(const Standard_Integer theIndex);

		/****** BOPDS_DS::HasInterf ******/
		/****** md5 signature: 49283712d76e913ced59d7cd0e4cc6bf ******/
		%feature("compactdefaultargs") HasInterf;
		%feature("autodoc", "
Parameters
----------
theI: int

Return
-------
bool

Description
-----------
Query returns true if the shape with index thei is interferred.
") HasInterf;
		Standard_Boolean HasInterf(const Standard_Integer theI);

		/****** BOPDS_DS::HasInterf ******/
		/****** md5 signature: 1d80e545b7d9a7723da7460ab8fc21ef ******/
		%feature("compactdefaultargs") HasInterf;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int

Return
-------
bool

Description
-----------
Query returns true if the shapes with indices thei1, thei2 are interferred.
") HasInterf;
		Standard_Boolean HasInterf(const Standard_Integer theI1, const Standard_Integer theI2);

		/****** BOPDS_DS::HasInterfShapeSubShapes ******/
		/****** md5 signature: 0aa0734f4d409aa68bbb45efdedf95f0 ******/
		%feature("compactdefaultargs") HasInterfShapeSubShapes;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int
theFlag: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Query returns true if the shape with index thei1 is interfered with any sub-shape of the shape with index thei2 (theflag=true) all sub-shapes of the shape with index thei2 (theflag=false).
") HasInterfShapeSubShapes;
		Standard_Boolean HasInterfShapeSubShapes(const Standard_Integer theI1, const Standard_Integer theI2, const Standard_Boolean theFlag = Standard_True);

		/****** BOPDS_DS::HasInterfSubShapes ******/
		/****** md5 signature: 2ae27af80945e532df7c2bbd58f11cd7 ******/
		%feature("compactdefaultargs") HasInterfSubShapes;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int

Return
-------
bool

Description
-----------
Query returns true if the shapes with indices thei1, thei2 have interferred sub-shapes.
") HasInterfSubShapes;
		Standard_Boolean HasInterfSubShapes(const Standard_Integer theI1, const Standard_Integer theI2);

		/****** BOPDS_DS::HasPaveBlocks ******/
		/****** md5 signature: c7343602d13620a44b73bbe33d4d439a ******/
		%feature("compactdefaultargs") HasPaveBlocks;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
bool

Description
-----------
Query returns true if the shape with index theindex has the information about pave blocks.
") HasPaveBlocks;
		Standard_Boolean HasPaveBlocks(const Standard_Integer theIndex);

		/****** BOPDS_DS::HasShapeSD ******/
		/****** md5 signature: ae014300fee852ffc3e8e610f3a33ffb ******/
		%feature("compactdefaultargs") HasShapeSD;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
theIndexSD: int

Description
-----------
Query returns true if the shape with index theindex has the same domain shape. in this case theindexsd will contain the index of same domain shape found //! interferences.
") HasShapeSD;
		Standard_Boolean HasShapeSD(const Standard_Integer theIndex, Standard_Integer &OutValue);

		/****** BOPDS_DS::Index ******/
		/****** md5 signature: be10b23bfcf45be693e1699539996e8e ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
int

Description
-----------
Selector returns the index of the shape thes.
") Index;
		Standard_Integer Index(const TopoDS_Shape & theS);

		/****** BOPDS_DS::Init ******/
		/****** md5 signature: 119c8bca63b257c5cda6219fd077dd01 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theFuzz: float (optional, default to Precision::Confusion())

Return
-------
None

Description
-----------
Initializes the data structure for the arguments.
") Init;
		void Init(const Standard_Real theFuzz = Precision::Confusion());

		/****** BOPDS_DS::InitPaveBlocksForVertex ******/
		/****** md5 signature: 15347613c57581b43dc354442cd1623d ******/
		%feature("compactdefaultargs") InitPaveBlocksForVertex;
		%feature("autodoc", "
Parameters
----------
theNV: int

Return
-------
None

Description
-----------
No available documentation.
") InitPaveBlocksForVertex;
		void InitPaveBlocksForVertex(const Standard_Integer theNV);

		/****** BOPDS_DS::InterfEE ******/
		/****** md5 signature: 72fd0c4ed5824128f64e718d30ed306a ******/
		%feature("compactdefaultargs") InterfEE;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfEE

Description
-----------
Selector/modifier returns the collection of interferences edge/edge.
") InterfEE;
		BOPDS_VectorOfInterfEE & InterfEE();

		/****** BOPDS_DS::InterfEF ******/
		/****** md5 signature: 2c6d8233f65184e1dc6b78c515553cdb ******/
		%feature("compactdefaultargs") InterfEF;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfEF

Description
-----------
Selector/modifier returns the collection of interferences edge/face.
") InterfEF;
		BOPDS_VectorOfInterfEF & InterfEF();

		/****** BOPDS_DS::InterfEZ ******/
		/****** md5 signature: b1d903cb21c241d05a7f78f0d0f825d4 ******/
		%feature("compactdefaultargs") InterfEZ;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfEZ

Description
-----------
Selector/modifier returns the collection of interferences edge/solid.
") InterfEZ;
		BOPDS_VectorOfInterfEZ & InterfEZ();

		/****** BOPDS_DS::InterfFF ******/
		/****** md5 signature: e0c2ceb6e3b7331819f3629b48f57e95 ******/
		%feature("compactdefaultargs") InterfFF;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfFF

Description
-----------
Selector/modifier returns the collection of interferences face/face.
") InterfFF;
		BOPDS_VectorOfInterfFF & InterfFF();

		/****** BOPDS_DS::InterfFZ ******/
		/****** md5 signature: ed8406a231822c7e94c8e25d1c71b4a1 ******/
		%feature("compactdefaultargs") InterfFZ;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfFZ

Description
-----------
Selector/modifier returns the collection of interferences face/solid.
") InterfFZ;
		BOPDS_VectorOfInterfFZ & InterfFZ();

		/****** BOPDS_DS::InterfVE ******/
		/****** md5 signature: 1e8c1351166b78cd57dfd6252f8095fd ******/
		%feature("compactdefaultargs") InterfVE;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfVE

Description
-----------
Selector/modifier returns the collection of interferences vertex/edge.
") InterfVE;
		BOPDS_VectorOfInterfVE & InterfVE();

		/****** BOPDS_DS::InterfVF ******/
		/****** md5 signature: a740dfccca2947945870f2853010ff59 ******/
		%feature("compactdefaultargs") InterfVF;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfVF

Description
-----------
Selector/modifier returns the collection of interferences vertex/face.
") InterfVF;
		BOPDS_VectorOfInterfVF & InterfVF();

		/****** BOPDS_DS::InterfVV ******/
		/****** md5 signature: de6bd3601d77ef5be33cc83e8c5b53f5 ******/
		%feature("compactdefaultargs") InterfVV;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfVV

Description
-----------
Selector/modifier returns the collection of interferences vertex/vertex.
") InterfVV;
		BOPDS_VectorOfInterfVV & InterfVV();

		/****** BOPDS_DS::InterfVZ ******/
		/****** md5 signature: 582789694d5f35487a86689d97253193 ******/
		%feature("compactdefaultargs") InterfVZ;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfVZ

Description
-----------
Selector/modifier returns the collection of interferences vertex/solid.
") InterfVZ;
		BOPDS_VectorOfInterfVZ & InterfVZ();

		/****** BOPDS_DS::InterfZZ ******/
		/****** md5 signature: 6c404f4d7b0d8d898ff2b617987d701a ******/
		%feature("compactdefaultargs") InterfZZ;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfInterfZZ

Description
-----------
Selector/modifier returns the collection of interferences solid/solid.
") InterfZZ;
		BOPDS_VectorOfInterfZZ & InterfZZ();

		/****** BOPDS_DS::Interferences ******/
		/****** md5 signature: 44bcb4cfcbd2e70afdb7ecdc2eb03075 ******/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "Return
-------
BOPDS_MapOfPair

Description
-----------
Selector returns the table of interferences //! debug.
") Interferences;
		const BOPDS_MapOfPair & Interferences();

		/****** BOPDS_DS::IsCommonBlock ******/
		/****** md5 signature: b0dc02e6b02caac0c57f5134435bd806 ******/
		%feature("compactdefaultargs") IsCommonBlock;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
bool

Description
-----------
Query returns true if the pave block is common block.
") IsCommonBlock;
		Standard_Boolean IsCommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::IsCommonBlockOnEdge ******/
		/****** md5 signature: 4275bd033086ef1a680a1b23c40e6cf9 ******/
		%feature("compactdefaultargs") IsCommonBlockOnEdge;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
bool

Description
-----------
Query returns true if common block contains more then one pave block.
") IsCommonBlockOnEdge;
		Standard_Boolean IsCommonBlockOnEdge(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::IsNewShape ******/
		/****** md5 signature: 328a388f60ec661bb87b8eea2904a15a ******/
		%feature("compactdefaultargs") IsNewShape;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
bool

Description
-----------
Returns true if the shape of index 'i' is not the source shape/sub-shape.
") IsNewShape;
		Standard_Boolean IsNewShape(const Standard_Integer theIndex);

		/****** BOPDS_DS::IsSubShape ******/
		/****** md5 signature: 456551f926d05108170c1f9b73a108c8 ******/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int

Return
-------
bool

Description
-----------
No available documentation.
") IsSubShape;
		Standard_Boolean IsSubShape(const Standard_Integer theI1, const Standard_Integer theI2);

		/****** BOPDS_DS::IsValidShrunkData ******/
		/****** md5 signature: 673a61f557de33779fc6f80e66567e0b ******/
		%feature("compactdefaultargs") IsValidShrunkData;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
bool

Description
-----------
Checks if the existing shrunk data of the pave block is still valid. the shrunk data may become invalid if e.g. the vertices of the pave block have been replaced with the new one with bigger tolerances, or the tolerances of the existing vertices have been increased.
") IsValidShrunkData;
		Standard_Boolean IsValidShrunkData(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::NbInterfTypes ******/
		/****** md5 signature: b5f8cfff2549c73ab79b5d69be986141 ******/
		%feature("compactdefaultargs") NbInterfTypes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of types of the interferences.
") NbInterfTypes;
		static Standard_Integer NbInterfTypes();

		/****** BOPDS_DS::NbRanges ******/
		/****** md5 signature: ab3e782a06903e5d503c4a552710a462 ******/
		%feature("compactdefaultargs") NbRanges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the number of index ranges.
") NbRanges;
		Standard_Integer NbRanges();

		/****** BOPDS_DS::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the total number of shapes stored.
") NbShapes;
		Standard_Integer NbShapes();

		/****** BOPDS_DS::NbSourceShapes ******/
		/****** md5 signature: 491dd42a7738616c75f8107b1175e48f ******/
		%feature("compactdefaultargs") NbSourceShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the total number of source shapes stored.
") NbSourceShapes;
		Standard_Integer NbSourceShapes();

		/****** BOPDS_DS::PaveBlocks ******/
		/****** md5 signature: 68dcf40aab903429d067a486b7121001 ******/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BOPDS_ListOfPaveBlock

Description
-----------
Selector returns the pave blocks for the shape with index theindex.
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks(const Standard_Integer theIndex);

		/****** BOPDS_DS::PaveBlocksPool ******/
		/****** md5 signature: 50b4ea760186198ca75f077153c0fbc8 ******/
		%feature("compactdefaultargs") PaveBlocksPool;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfListOfPaveBlock

Description
-----------
Selector returns the information about pave blocks on source edges.
") PaveBlocksPool;
		const BOPDS_VectorOfListOfPaveBlock & PaveBlocksPool();

		/****** BOPDS_DS::Paves ******/
		/****** md5 signature: 21e9e50b8600c1f1dae7bda888c3e95f ******/
		%feature("compactdefaultargs") Paves;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theLP: BOPDS_ListOfPave

Return
-------
None

Description
-----------
Fills thelp with sorted paves of the shape with index theindex.
") Paves;
		void Paves(const Standard_Integer theIndex, BOPDS_ListOfPave & theLP);

		/****** BOPDS_DS::Range ******/
		/****** md5 signature: 5ca271758ebb00dc0b21c53b042f5bf2 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BOPDS_IndexRange

Description
-----------
Selector returns the index range 'i'.
") Range;
		const BOPDS_IndexRange & Range(const Standard_Integer theIndex);

		/****** BOPDS_DS::Rank ******/
		/****** md5 signature: 9e6a20c7b89086372aecea71b8c88749 ******/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Selector returns the rank of the shape of index 'i'.
") Rank;
		Standard_Integer Rank(const Standard_Integer theIndex);

		/****** BOPDS_DS::RealPaveBlock ******/
		/****** md5 signature: 4469a9d9a26892d7c107422010da714b ******/
		%feature("compactdefaultargs") RealPaveBlock;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
Selector returns the real first pave block.
") RealPaveBlock;
		opencascade::handle<BOPDS_PaveBlock> RealPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::RefineFaceInfoIn ******/
		/****** md5 signature: 4994c1dd02d9f8a4743cc519d32b7898 ******/
		%feature("compactdefaultargs") RefineFaceInfoIn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes any pave block from list of having in state if it has also the state on.
") RefineFaceInfoIn;
		void RefineFaceInfoIn();

		/****** BOPDS_DS::RefineFaceInfoOn ******/
		/****** md5 signature: 7bba131ff2176723c8ccc01dd9cde80a ******/
		%feature("compactdefaultargs") RefineFaceInfoOn;
		%feature("autodoc", "Return
-------
None

Description
-----------
Refine the state on for the all faces having state information //! ++.
") RefineFaceInfoOn;
		void RefineFaceInfoOn();

		/****** BOPDS_DS::ReleasePaveBlocks ******/
		/****** md5 signature: 0a9c849d65b6a4cf95be6f2d718156ae ******/
		%feature("compactdefaultargs") ReleasePaveBlocks;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears information about paveblocks for the untouched edges.
") ReleasePaveBlocks;
		void ReleasePaveBlocks();

		/****** BOPDS_DS::SetArguments ******/
		/****** md5 signature: b894d6130aeeacff1dc8ed5150d56866 ******/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "
Parameters
----------
theLS: TopTools_ListOfShape

Return
-------
None

Description
-----------
Modifier sets the arguments [thels] of an operation.
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theLS);

		/****** BOPDS_DS::SetCommonBlock ******/
		/****** md5 signature: e4c808b4502142fd887ea0b4a1ee2d11 ******/
		%feature("compactdefaultargs") SetCommonBlock;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock
theCB: BOPDS_CommonBlock

Return
-------
None

Description
-----------
Modifier sets the common block <thecb>.
") SetCommonBlock;
		void SetCommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB, const opencascade::handle<BOPDS_CommonBlock> & theCB);

		/****** BOPDS_DS::Shape ******/
		/****** md5 signature: 517eeba390a4935f1b8879270532daf0 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
TopoDS_Shape

Description
-----------
Selector returns the shape with index theindex.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer theIndex);

		/****** BOPDS_DS::ShapeInfo ******/
		/****** md5 signature: b283e86f09404b14ce48003218b1d95f ******/
		%feature("compactdefaultargs") ShapeInfo;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BOPDS_ShapeInfo

Description
-----------
Selector returns the information about the shape with index theindex.
") ShapeInfo;
		const BOPDS_ShapeInfo & ShapeInfo(const Standard_Integer theIndex);

		/****** BOPDS_DS::ShapesSD ******/
		/****** md5 signature: 527952a375cb69af338de9d02af00c94 ******/
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "Return
-------
TColStd_DataMapOfIntegerInteger

Description
-----------
Selector returns the collection same domain shapes.
") ShapesSD;
		TColStd_DataMapOfIntegerInteger & ShapesSD();

		/****** BOPDS_DS::SharedEdges ******/
		/****** md5 signature: 6bad9f50cf160f185b7036f3c972c789 ******/
		%feature("compactdefaultargs") SharedEdges;
		%feature("autodoc", "
Parameters
----------
theF1: int
theF2: int
theLI: TColStd_ListOfInteger
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Returns the indices of edges that are shared for the faces with indices thef1, thef2 //! same domain shapes.
") SharedEdges;
		void SharedEdges(const Standard_Integer theF1, const Standard_Integer theF2, TColStd_ListOfInteger & theLI, const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_DS::SubShapesOnIn ******/
		/****** md5 signature: cece8015c92cb291b215b2d9d9ca7c48 ******/
		%feature("compactdefaultargs") SubShapesOnIn;
		%feature("autodoc", "
Parameters
----------
theNF1: int
theNF2: int
theMVOnIn: TColStd_MapOfInteger
theMVCommon: TColStd_MapOfInteger
thePBOnIn: BOPDS_IndexedMapOfPaveBlock
theCommonPB: BOPDS_MapOfPaveBlock

Return
-------
None

Description
-----------
Returns information about on/in sub-shapes of the given faces. @param themvonin the indices of on/in vertices from both faces @param themvcommon the indices of common vertices for both faces @param thepbonin all on/in pave blocks from both faces @param thecommonpb the common pave blocks (that are shared by both faces).
") SubShapesOnIn;
		void SubShapesOnIn(const Standard_Integer theNF1, const Standard_Integer theNF2, TColStd_MapOfInteger & theMVOnIn, TColStd_MapOfInteger & theMVCommon, BOPDS_IndexedMapOfPaveBlock & thePBOnIn, BOPDS_MapOfPaveBlock & theCommonPB);

		/****** BOPDS_DS::UpdateCommonBlock ******/
		/****** md5 signature: b32849b579faa453d3ab01dfeb9151dc ******/
		%feature("compactdefaultargs") UpdateCommonBlock;
		%feature("autodoc", "
Parameters
----------
theCB: BOPDS_CommonBlock
theFuzz: float

Return
-------
None

Description
-----------
Update the common block thecb.
") UpdateCommonBlock;
		void UpdateCommonBlock(const opencascade::handle<BOPDS_CommonBlock> & theCB, const Standard_Real theFuzz);

		/****** BOPDS_DS::UpdateCommonBlockWithSDVertices ******/
		/****** md5 signature: 7866c8568fa9b10af99ea0d52a1e7bd6 ******/
		%feature("compactdefaultargs") UpdateCommonBlockWithSDVertices;
		%feature("autodoc", "
Parameters
----------
theCB: BOPDS_CommonBlock

Return
-------
None

Description
-----------
Update the pave block of the common block for all shapes in data structure.
") UpdateCommonBlockWithSDVertices;
		void UpdateCommonBlockWithSDVertices(const opencascade::handle<BOPDS_CommonBlock> & theCB);

		/****** BOPDS_DS::UpdateFaceInfoIn ******/
		/****** md5 signature: d1f6faa8a56b9e04059de53cd23a3d3e ******/
		%feature("compactdefaultargs") UpdateFaceInfoIn;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Update the state in of face with index theindex.
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn(const Standard_Integer theIndex);

		/****** BOPDS_DS::UpdateFaceInfoIn ******/
		/****** md5 signature: 47926fbf15ea8dcc9ce09be605c96f01 ******/
		%feature("compactdefaultargs") UpdateFaceInfoIn;
		%feature("autodoc", "
Parameters
----------
theFaces: TColStd_MapOfInteger

Return
-------
None

Description
-----------
Update the state in for all faces in the given map.
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn(const TColStd_MapOfInteger & theFaces);

		/****** BOPDS_DS::UpdateFaceInfoOn ******/
		/****** md5 signature: 22cf949c85b68e28fd0defaaa4cce57e ******/
		%feature("compactdefaultargs") UpdateFaceInfoOn;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Update the state on of face with index theindex.
") UpdateFaceInfoOn;
		void UpdateFaceInfoOn(const Standard_Integer theIndex);

		/****** BOPDS_DS::UpdateFaceInfoOn ******/
		/****** md5 signature: 6da1f3a5aca4bb07a6f21a02a641463c ******/
		%feature("compactdefaultargs") UpdateFaceInfoOn;
		%feature("autodoc", "
Parameters
----------
theFaces: TColStd_MapOfInteger

Return
-------
None

Description
-----------
Update the state on for all faces in the given map.
") UpdateFaceInfoOn;
		void UpdateFaceInfoOn(const TColStd_MapOfInteger & theFaces);

		/****** BOPDS_DS::UpdatePaveBlock ******/
		/****** md5 signature: 973c8bac7cd25e5ce96fdadcf00095b9 ******/
		%feature("compactdefaultargs") UpdatePaveBlock;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
Update the pave block thepb.
") UpdatePaveBlock;
		void UpdatePaveBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::UpdatePaveBlockWithSDVertices ******/
		/****** md5 signature: 031de64d1777b53b8baf2f1e7686ac1a ******/
		%feature("compactdefaultargs") UpdatePaveBlockWithSDVertices;
		%feature("autodoc", "
Parameters
----------
thePB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
Update the pave block for all shapes in data structure.
") UpdatePaveBlockWithSDVertices;
		void UpdatePaveBlockWithSDVertices(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::UpdatePaveBlocks ******/
		/****** md5 signature: bb1d4d78bee9eea0b8a56f12f0f8e45e ******/
		%feature("compactdefaultargs") UpdatePaveBlocks;
		%feature("autodoc", "Return
-------
None

Description
-----------
Update the pave blocks for the all shapes in data structure.
") UpdatePaveBlocks;
		void UpdatePaveBlocks();

		/****** BOPDS_DS::UpdatePaveBlocksWithSDVertices ******/
		/****** md5 signature: b4f70b32e3469c14b16be36928c1fe26 ******/
		%feature("compactdefaultargs") UpdatePaveBlocksWithSDVertices;
		%feature("autodoc", "Return
-------
None

Description
-----------
Update the pave blocks for all shapes in data structure.
") UpdatePaveBlocksWithSDVertices;
		void UpdatePaveBlocksWithSDVertices();

};


%extend BOPDS_DS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_FaceInfo *
***********************/
class BOPDS_FaceInfo {
	public:
		/****** BOPDS_FaceInfo::BOPDS_FaceInfo ******/
		/****** md5 signature: dbf881bcf2d92c472cd8524dc1a94d79 ******/
		%feature("compactdefaultargs") BOPDS_FaceInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo();

		/****** BOPDS_FaceInfo::BOPDS_FaceInfo ******/
		/****** md5 signature: 58156401c00b9ebd5196c21ce568756b ******/
		%feature("compactdefaultargs") BOPDS_FaceInfo;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_FaceInfo::ChangePaveBlocksIn ******/
		/****** md5 signature: d4ec18f81c144198dbecd960b589646d ******/
		%feature("compactdefaultargs") ChangePaveBlocksIn;
		%feature("autodoc", "Return
-------
BOPDS_IndexedMapOfPaveBlock

Description
-----------
Selector/modifier returns the pave blocks of the face that have state in.
") ChangePaveBlocksIn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksIn();

		/****** BOPDS_FaceInfo::ChangePaveBlocksOn ******/
		/****** md5 signature: 90def9e02fcda3b9ebf87cebe3c18fe1 ******/
		%feature("compactdefaultargs") ChangePaveBlocksOn;
		%feature("autodoc", "Return
-------
BOPDS_IndexedMapOfPaveBlock

Description
-----------
Selector/modifier returns the pave blocks of the face that have state on.
") ChangePaveBlocksOn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksOn();

		/****** BOPDS_FaceInfo::ChangePaveBlocksSc ******/
		/****** md5 signature: aa60dacd7c757139c1caac5022fd9507 ******/
		%feature("compactdefaultargs") ChangePaveBlocksSc;
		%feature("autodoc", "Return
-------
BOPDS_IndexedMapOfPaveBlock

Description
-----------
No available documentation.
") ChangePaveBlocksSc;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksSc();

		/****** BOPDS_FaceInfo::ChangeVerticesIn ******/
		/****** md5 signature: a1f733653d918c0dfda07b61761078cd ******/
		%feature("compactdefaultargs") ChangeVerticesIn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector/modifier returns the list of indices for vertices of the face that have state in //! on.
") ChangeVerticesIn;
		TColStd_MapOfInteger & ChangeVerticesIn();

		/****** BOPDS_FaceInfo::ChangeVerticesOn ******/
		/****** md5 signature: 0a12e27e688f637bedea8ad74c0e05d2 ******/
		%feature("compactdefaultargs") ChangeVerticesOn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector/modifier returns the list of indices for vertices of the face that have state on //! sections.
") ChangeVerticesOn;
		TColStd_MapOfInteger & ChangeVerticesOn();

		/****** BOPDS_FaceInfo::ChangeVerticesSc ******/
		/****** md5 signature: 1f58d37b0d25660e9e7d3f4bf9d48ecb ******/
		%feature("compactdefaultargs") ChangeVerticesSc;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector/modifier returns the list of indices for section vertices of the face //! others.
") ChangeVerticesSc;
		TColStd_MapOfInteger & ChangeVerticesSc();

		/****** BOPDS_FaceInfo::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the contents.
") Clear;
		void Clear();

		/****** BOPDS_FaceInfo::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the index of the face //! in.
") Index;
		Standard_Integer Index();

		/****** BOPDS_FaceInfo::PaveBlocksIn ******/
		/****** md5 signature: 61287d2aeb3dd1d9dbce972f7cebee70 ******/
		%feature("compactdefaultargs") PaveBlocksIn;
		%feature("autodoc", "Return
-------
BOPDS_IndexedMapOfPaveBlock

Description
-----------
Selector returns the pave blocks of the face that have state in.
") PaveBlocksIn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksIn();

		/****** BOPDS_FaceInfo::PaveBlocksOn ******/
		/****** md5 signature: 17bd7d43663bc3af7acd3e789afb9726 ******/
		%feature("compactdefaultargs") PaveBlocksOn;
		%feature("autodoc", "Return
-------
BOPDS_IndexedMapOfPaveBlock

Description
-----------
Selector returns the pave blocks of the face that have state on.
") PaveBlocksOn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksOn();

		/****** BOPDS_FaceInfo::PaveBlocksSc ******/
		/****** md5 signature: 8832f11b747d5c9394d12acc32cbe3b2 ******/
		%feature("compactdefaultargs") PaveBlocksSc;
		%feature("autodoc", "Return
-------
BOPDS_IndexedMapOfPaveBlock

Description
-----------
Selector returns the pave blocks of the face that are pave blocks of section edges.
") PaveBlocksSc;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksSc();

		/****** BOPDS_FaceInfo::SetIndex ******/
		/****** md5 signature: 4dd534b2ead8c5c1524ec783c183f5c4 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
theI: int

Return
-------
None

Description
-----------
Modifier sets the index of the face <thei>.
") SetIndex;
		void SetIndex(const Standard_Integer theI);

		/****** BOPDS_FaceInfo::VerticesIn ******/
		/****** md5 signature: 362e2d28d22b892a3738b9c7a690e95a ******/
		%feature("compactdefaultargs") VerticesIn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector returns the list of indices for vertices of the face that have state in.
") VerticesIn;
		const TColStd_MapOfInteger & VerticesIn();

		/****** BOPDS_FaceInfo::VerticesOn ******/
		/****** md5 signature: c771e20b61ac134ac88806946a87ed16 ******/
		%feature("compactdefaultargs") VerticesOn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector returns the list of indices for vertices of the face that have state on.
") VerticesOn;
		const TColStd_MapOfInteger & VerticesOn();

		/****** BOPDS_FaceInfo::VerticesSc ******/
		/****** md5 signature: 38fefd7c99e35fc9b840686df0e2c151 ******/
		%feature("compactdefaultargs") VerticesSc;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector returns the list of indices for section vertices of the face.
") VerticesSc;
		const TColStd_MapOfInteger & VerticesSc();

};


%extend BOPDS_FaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BOPDS_IndexRange *
*************************/
class BOPDS_IndexRange {
	public:
		/****** BOPDS_IndexRange::BOPDS_IndexRange ******/
		/****** md5 signature: 99ee5feaa0f5f2e8071f8ec605997513 ******/
		%feature("compactdefaultargs") BOPDS_IndexRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_IndexRange;
		 BOPDS_IndexRange();

		/****** BOPDS_IndexRange::Contains ******/
		/****** md5 signature: de9f24e21b92884020c7cb857ce850c9 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
bool

Description
-----------
Query returns true if the range contains <theindex>.
") Contains;
		Standard_Boolean Contains(const Standard_Integer theIndex);

		/****** BOPDS_IndexRange::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** BOPDS_IndexRange::First ******/
		/****** md5 signature: e9b9b55d0f95896826fc1a7c7b3fdf28 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the first index of the range.
") First;
		Standard_Integer First();

		/****** BOPDS_IndexRange::Indices ******/
		/****** md5 signature: 1aace53eafd7d667008f722852898b9a ******/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "
Parameters
----------

Return
-------
theI1: int
theI2: int

Description
-----------
Selector returns the first index of the range <thei1> returns the second index of the range <thei2>.
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BOPDS_IndexRange::Last ******/
		/****** md5 signature: b34ffc707f6352bb6f1f4c928c84e251 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the second index of the range.
") Last;
		Standard_Integer Last();

		/****** BOPDS_IndexRange::SetFirst ******/
		/****** md5 signature: c94ec2556faffb224a51e9a98299f9b0 ******/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "
Parameters
----------
theI1: int

Return
-------
None

Description
-----------
Modifier sets the first index <thei1> of the range.
") SetFirst;
		void SetFirst(const Standard_Integer theI1);

		/****** BOPDS_IndexRange::SetIndices ******/
		/****** md5 signature: 17bcbf84f32630b3982706ad9985593d ******/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "
Parameters
----------
theI1: int
theI2: int

Return
-------
None

Description
-----------
Modifier sets the first index of the range <thei1> sets the second index of the range <thei2>.
") SetIndices;
		void SetIndices(const Standard_Integer theI1, const Standard_Integer theI2);

		/****** BOPDS_IndexRange::SetLast ******/
		/****** md5 signature: d221889926836d6791218229fbe20e40 ******/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "
Parameters
----------
theI2: int

Return
-------
None

Description
-----------
Modifier sets the second index <thei2> of the range.
") SetLast;
		void SetLast(const Standard_Integer theI2);

};


%extend BOPDS_IndexRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BOPDS_Interf *
*********************/
/***********************
* class BOPDS_Iterator *
***********************/
class BOPDS_Iterator {
	public:
		/****** BOPDS_Iterator::BOPDS_Iterator ******/
		/****** md5 signature: e39e9f80c57e8765bf71893ec4fb5f63 ******/
		%feature("compactdefaultargs") BOPDS_Iterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_Iterator;
		 BOPDS_Iterator();

		/****** BOPDS_Iterator::BOPDS_Iterator ******/
		/****** md5 signature: bd9e216d5b71b4ba1d9bd6a1bf309cd2 ******/
		%feature("compactdefaultargs") BOPDS_Iterator;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_Iterator;
		 BOPDS_Iterator(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_Iterator::BlockLength ******/
		/****** md5 signature: c48a9343cc3ae4a238042d11b275a008 ******/
		%feature("compactdefaultargs") BlockLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the block length.
") BlockLength;
		Standard_Integer BlockLength();

		/****** BOPDS_Iterator::DS ******/
		/****** md5 signature: 276afbb7db8ff236fa734c0f56c3dcb8 ******/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "Return
-------
BOPDS_DS

Description
-----------
Selector returns the data structure.
") DS;
		const BOPDS_DS & DS();

		/****** BOPDS_Iterator::ExpectedLength ******/
		/****** md5 signature: a3e8f5f279b8e7d7a447257012becee5 ******/
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersections founded.
") ExpectedLength;
		Standard_Integer ExpectedLength();

		/****** BOPDS_Iterator::Initialize ******/
		/****** md5 signature: 7fb13a93a2b1f54b2e5a8d53cbc8474e ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theType1: TopAbs_ShapeEnum
theType2: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
Initializes the iterator thetype1 - the first type of shape thetype2 - the second type of shape.
") Initialize;
		void Initialize(const TopAbs_ShapeEnum theType1, const TopAbs_ShapeEnum theType2);

		/****** BOPDS_Iterator::IntersectExt ******/
		/****** md5 signature: 9d4c97d64751f482efc17b0e0a1e1b4e ******/
		%feature("compactdefaultargs") IntersectExt;
		%feature("autodoc", "
Parameters
----------
theIndicies: TColStd_MapOfInteger

Return
-------
None

Description
-----------
Updates the tree of bounding boxes with increased boxes and intersects such elements with the tree.
") IntersectExt;
		void IntersectExt(const TColStd_MapOfInteger & theIndicies);

		/****** BOPDS_Iterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if still there are pairs of intersected shapes.
") More;
		Standard_Boolean More();

		/****** BOPDS_Iterator::NbExtInterfs ******/
		/****** md5 signature: dfeacf68558221c9d70c06d649e6cdeb ******/
		%feature("compactdefaultargs") NbExtInterfs;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbExtInterfs;
		static Standard_Integer NbExtInterfs();

		/****** BOPDS_Iterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves iterations ahead.
") Next;
		void Next();

		/****** BOPDS_Iterator::Prepare ******/
		/****** md5 signature: 26ccd55174924d4ca54bbaad1979b27a ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
theCtx: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())
theCheckOBB: bool (optional, default to Standard_False)
theFuzzyValue: float (optional, default to Precision::Confusion())

Return
-------
None

Description
-----------
Perform the intersection algorithm and prepare the results to be used.
") Prepare;
		virtual void Prepare(const opencascade::handle<IntTools_Context> & theCtx = opencascade::handle<IntTools_Context>(), const Standard_Boolean theCheckOBB = Standard_False, const Standard_Real theFuzzyValue = Precision::Confusion());

		/****** BOPDS_Iterator::RunParallel ******/
		/****** md5 signature: f5c0831f57ee3d1a6d238da5afdb5132 ******/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag of parallel processing.
") RunParallel;
		Standard_Boolean RunParallel();

		/****** BOPDS_Iterator::SetDS ******/
		/****** md5 signature: 7bd5ab1492cdf0ff6021812020f58396 ******/
		%feature("compactdefaultargs") SetDS;
		%feature("autodoc", "
Parameters
----------
pDS: BOPDS_PDS

Return
-------
None

Description
-----------
Modifier sets the data structure <pds> to process.
") SetDS;
		void SetDS(const BOPDS_PDS & pDS);

		/****** BOPDS_Iterator::SetRunParallel ******/
		/****** md5 signature: 0a82d8fce1725e61203aa8606820455a ******/
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Set the flag of parallel processing if <theflag> is true the parallel processing is switched on if <theflag> is false the parallel processing is switched off.
") SetRunParallel;
		void SetRunParallel(const Standard_Boolean theFlag);

		/****** BOPDS_Iterator::Value ******/
		/****** md5 signature: e158a5c3b0133290b10886e826c5728a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndex1: int
theIndex2: int

Description
-----------
Returns indices (ds) of intersected shapes theindex1 - the index of the first shape theindex2 - the index of the second shape.
") Value;
		void Value(Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend BOPDS_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class BOPDS_Pair *
*******************/
class BOPDS_Pair {
	public:
		/****** BOPDS_Pair::BOPDS_Pair ******/
		/****** md5 signature: 5718626f84016ecf34e58bc5be00bee7 ******/
		%feature("compactdefaultargs") BOPDS_Pair;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPDS_Pair;
		 BOPDS_Pair();

		/****** BOPDS_Pair::BOPDS_Pair ******/
		/****** md5 signature: a80bf875fa78b42adb2f59e1eefedf94 ******/
		%feature("compactdefaultargs") BOPDS_Pair;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int

Return
-------
None

Description
-----------
No available documentation.
") BOPDS_Pair;
		 BOPDS_Pair(const Standard_Integer theIndex1, const Standard_Integer theIndex2);

		/****** BOPDS_Pair::Indices ******/
		/****** md5 signature: fc670924ecc87d0f1a8c9d00f037ebe4 ******/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndex1: int
theIndex2: int

Description
-----------
Gets the indices.
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BOPDS_Pair::IsEqual ******/
		/****** md5 signature: 2a26c85591699ee3a4cd3636721cf551 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: BOPDS_Pair

Return
-------
bool

Description
-----------
Returns true if the pair is equal to <the theother>.
") IsEqual;
		Standard_Boolean IsEqual(const BOPDS_Pair & theOther);

		/****** BOPDS_Pair::SetIndices ******/
		/****** md5 signature: 4a99b9589d6dfa574dfdd1dec8b330c1 ******/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int

Return
-------
None

Description
-----------
Sets the indices.
") SetIndices;
		void SetIndices(const Standard_Integer theIndex1, const Standard_Integer theIndex2);


%extend{
    bool __eq_wrapper__(const BOPDS_Pair other) {
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


%extend BOPDS_Pair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class BOPDS_Pave *
*******************/
class BOPDS_Pave {
	public:
		/****** BOPDS_Pave::BOPDS_Pave ******/
		/****** md5 signature: 479b452478ff7c0152e5ce58231932e9 ******/
		%feature("compactdefaultargs") BOPDS_Pave;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_Pave;
		 BOPDS_Pave();

		/****** BOPDS_Pave::Contents ******/
		/****** md5 signature: 8d6c165389fbe2212946ff8887dce0d9 ******/
		%feature("compactdefaultargs") Contents;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndex: int
theParameter: float

Description
-----------
Selector returns the index of vertex <theindex> returns the parameter of vertex <theparameter>.
") Contents;
		void Contents(Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** BOPDS_Pave::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** BOPDS_Pave::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the index of vertex.
") Index;
		Standard_Integer Index();

		/****** BOPDS_Pave::IsEqual ******/
		/****** md5 signature: 0b129306f2f26156fa7470e2a273ce31 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: BOPDS_Pave

Return
-------
bool

Description
-----------
Query returns true if thr parameter od this is equal to the parameter of <theother>.
") IsEqual;
		Standard_Boolean IsEqual(const BOPDS_Pave & theOther);

		/****** BOPDS_Pave::IsLess ******/
		/****** md5 signature: f4ff1bf54e635febefa541366f89cb0c ******/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "
Parameters
----------
theOther: BOPDS_Pave

Return
-------
bool

Description
-----------
Query returns true if thr parameter od this is less than the parameter of <theother>.
") IsLess;
		Standard_Boolean IsLess(const BOPDS_Pave & theOther);

		/****** BOPDS_Pave::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Selector returns the parameter of vertex.
") Parameter;
		Standard_Real Parameter();

		/****** BOPDS_Pave::SetIndex ******/
		/****** md5 signature: 8837cdd415a0f5c290f45964b1b4e33b ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Modifier sets the index of vertex <theindex>.
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****** BOPDS_Pave::SetParameter ******/
		/****** md5 signature: ddedd9344e341801e5774c5b9b817896 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
theParameter: float

Return
-------
None

Description
-----------
Modifier sets the parameter of vertex <theparameter>.
") SetParameter;
		void SetParameter(const Standard_Real theParameter);


%extend{
    bool __eq_wrapper__(const BOPDS_Pave other) {
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


%extend BOPDS_Pave {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPDS_PaveBlock *
************************/
class BOPDS_PaveBlock : public Standard_Transient {
	public:
		/****** BOPDS_PaveBlock::BOPDS_PaveBlock ******/
		/****** md5 signature: 23cb6ec47b2be25244db20ee836f5557 ******/
		%feature("compactdefaultargs") BOPDS_PaveBlock;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock();

		/****** BOPDS_PaveBlock::BOPDS_PaveBlock ******/
		/****** md5 signature: 4e7cca86dd9c859a976d2a5e52959273 ******/
		%feature("compactdefaultargs") BOPDS_PaveBlock;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_PaveBlock::AppendExtPave ******/
		/****** md5 signature: 3fb63f2f1bbdb3deb3be97a142c1f2bc ******/
		%feature("compactdefaultargs") AppendExtPave;
		%feature("autodoc", "
Parameters
----------
thePave: BOPDS_Pave

Return
-------
None

Description
-----------
Modifier appends extra paves <thepave>.
") AppendExtPave;
		void AppendExtPave(const BOPDS_Pave & thePave);

		/****** BOPDS_PaveBlock::AppendExtPave1 ******/
		/****** md5 signature: a34cb6cef949ac8e2550982959c6a8c4 ******/
		%feature("compactdefaultargs") AppendExtPave1;
		%feature("autodoc", "
Parameters
----------
thePave: BOPDS_Pave

Return
-------
None

Description
-----------
Modifier appends extra pave <thepave>.
") AppendExtPave1;
		void AppendExtPave1(const BOPDS_Pave & thePave);

		/****** BOPDS_PaveBlock::ChangeExtPaves ******/
		/****** md5 signature: 0c4d0169ffc2ec36903d959a070780f8 ******/
		%feature("compactdefaultargs") ChangeExtPaves;
		%feature("autodoc", "Return
-------
BOPDS_ListOfPave

Description
-----------
Selector / modifier returns the extra paves.
") ChangeExtPaves;
		BOPDS_ListOfPave & ChangeExtPaves();

		/****** BOPDS_PaveBlock::ContainsParameter ******/
		/****** md5 signature: 41f6f8b947fed753bba44380a63f845a ******/
		%feature("compactdefaultargs") ContainsParameter;
		%feature("autodoc", "
Parameters
----------
thePrm: float
theTol: float

Return
-------
theInd: int

Description
-----------
Query returns true if the extra paves contain the pave with given value of the parameter <theprm> <thetol> - the value of the tolerance to compare <theind> - index of the found pave.
") ContainsParameter;
		Standard_Boolean ContainsParameter(const Standard_Real thePrm, const Standard_Real theTol, Standard_Integer &OutValue);

		/****** BOPDS_PaveBlock::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** BOPDS_PaveBlock::Edge ******/
		/****** md5 signature: 76748ffd591f786c44105943fcd6acd5 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the index of edge of pave block.
") Edge;
		Standard_Integer Edge();

		/****** BOPDS_PaveBlock::ExtPaves ******/
		/****** md5 signature: fa9428f7fcc4dc023ae946ab5a79308f ******/
		%feature("compactdefaultargs") ExtPaves;
		%feature("autodoc", "Return
-------
BOPDS_ListOfPave

Description
-----------
Selector returns the extra paves.
") ExtPaves;
		const BOPDS_ListOfPave & ExtPaves();

		/****** BOPDS_PaveBlock::HasEdge ******/
		/****** md5 signature: b29d7c6fb0d75a5501e02d3f7002ad41 ******/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns true if the pave block has edge.
") HasEdge;
		Standard_Boolean HasEdge();

		/****** BOPDS_PaveBlock::HasEdge ******/
		/****** md5 signature: 67f2d989d5efe4b20f4f791ce92927e3 ******/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "
Parameters
----------

Return
-------
theEdge: int

Description
-----------
Query returns true if the pave block has edge returns the index of edge <theedge>.
") HasEdge;
		Standard_Boolean HasEdge(Standard_Integer &OutValue);

		/****** BOPDS_PaveBlock::HasSameBounds ******/
		/****** md5 signature: 0bd326d2184cf7b6ef04ecc16a2ca955 ******/
		%feature("compactdefaultargs") HasSameBounds;
		%feature("autodoc", "
Parameters
----------
theOther: BOPDS_PaveBlock

Return
-------
bool

Description
-----------
Query returns true if the pave block has pave indices that equal to the pave indices of the pave block <theother>.
") HasSameBounds;
		Standard_Boolean HasSameBounds(const opencascade::handle<BOPDS_PaveBlock> & theOther);

		/****** BOPDS_PaveBlock::HasShrunkData ******/
		/****** md5 signature: f5e0c4ec7e5718ef2f5bf9a86199c6ea ******/
		%feature("compactdefaultargs") HasShrunkData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns true if the pave block contains the shrunk data.
") HasShrunkData;
		Standard_Boolean HasShrunkData();

		/****** BOPDS_PaveBlock::Indices ******/
		/****** md5 signature: 7ef0b06999c91021b91c1bdc4088cff4 ******/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndex1: int
theIndex2: int

Description
-----------
Selector returns the pave indices <theindex1,theindex2> of the pave block.
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BOPDS_PaveBlock::IsSplitEdge ******/
		/****** md5 signature: 07c70c92ad2a4b75b8028068f876898b ******/
		%feature("compactdefaultargs") IsSplitEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns true if the edge is equal to the original edge of the pave block.
") IsSplitEdge;
		Standard_Boolean IsSplitEdge();

		/****** BOPDS_PaveBlock::IsSplittable ******/
		/****** md5 signature: 4b9dd74e2aa42018fe83fe5063aa511b ******/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns false if the pave block has a too short shrunk range and cannot be split, otherwise returns true.
") IsSplittable;
		Standard_Boolean IsSplittable();

		/****** BOPDS_PaveBlock::IsToUpdate ******/
		/****** md5 signature: c5adb7d93c3efa0160d1d2d2f63f8b65 ******/
		%feature("compactdefaultargs") IsToUpdate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns true if the pave block contains extra paves.
") IsToUpdate;
		Standard_Boolean IsToUpdate();

		/****** BOPDS_PaveBlock::OriginalEdge ******/
		/****** md5 signature: db9c8a87977e4eabaf100d8c65531a7f ******/
		%feature("compactdefaultargs") OriginalEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the index of original edge of pave block.
") OriginalEdge;
		Standard_Integer OriginalEdge();

		/****** BOPDS_PaveBlock::Pave1 ******/
		/****** md5 signature: c069a811d2db1154789a8c26ef94db8d ******/
		%feature("compactdefaultargs") Pave1;
		%feature("autodoc", "Return
-------
BOPDS_Pave

Description
-----------
Selector returns the first pave.
") Pave1;
		const BOPDS_Pave & Pave1();

		/****** BOPDS_PaveBlock::Pave2 ******/
		/****** md5 signature: 5cb0f045be87975a3e4e0fb36f4561b0 ******/
		%feature("compactdefaultargs") Pave2;
		%feature("autodoc", "Return
-------
BOPDS_Pave

Description
-----------
Selector returns the second pave.
") Pave2;
		const BOPDS_Pave & Pave2();

		/****** BOPDS_PaveBlock::Range ******/
		/****** md5 signature: 8ddfe2340263927f7a7249797228e7e9 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
theT1: float
theT2: float

Description
-----------
Selector returns the parametric range <thet1,thet2> of the pave block.
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BOPDS_PaveBlock::RemoveExtPave ******/
		/****** md5 signature: 1912180e16de8e42d4618dd6241a8eee ******/
		%feature("compactdefaultargs") RemoveExtPave;
		%feature("autodoc", "
Parameters
----------
theVertNum: int

Return
-------
None

Description
-----------
Modifier removes a pave with the given vertex number from extra paves.
") RemoveExtPave;
		void RemoveExtPave(const Standard_Integer theVertNum);

		/****** BOPDS_PaveBlock::SetEdge ******/
		/****** md5 signature: e5f0cb270588385f5c43b443c7a3911e ******/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: int

Return
-------
None

Description
-----------
Modifier sets the index of edge of pave block <theedge>.
") SetEdge;
		void SetEdge(const Standard_Integer theEdge);

		/****** BOPDS_PaveBlock::SetOriginalEdge ******/
		/****** md5 signature: 3cf310bce40a48b55779ed2e0ae00c2b ******/
		%feature("compactdefaultargs") SetOriginalEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: int

Return
-------
None

Description
-----------
Modifier sets the index of original edge of the pave block <theedge>.
") SetOriginalEdge;
		void SetOriginalEdge(const Standard_Integer theEdge);

		/****** BOPDS_PaveBlock::SetPave1 ******/
		/****** md5 signature: 0d77581426baec39e7889318dd23befc ******/
		%feature("compactdefaultargs") SetPave1;
		%feature("autodoc", "
Parameters
----------
thePave: BOPDS_Pave

Return
-------
None

Description
-----------
Modifier sets the first pave <thepave>.
") SetPave1;
		void SetPave1(const BOPDS_Pave & thePave);

		/****** BOPDS_PaveBlock::SetPave2 ******/
		/****** md5 signature: 54001b905c67664104f00a04f5a1a447 ******/
		%feature("compactdefaultargs") SetPave2;
		%feature("autodoc", "
Parameters
----------
thePave: BOPDS_Pave

Return
-------
None

Description
-----------
Modifier sets the second pave <thepave>.
") SetPave2;
		void SetPave2(const BOPDS_Pave & thePave);

		/****** BOPDS_PaveBlock::SetShrunkData ******/
		/****** md5 signature: 88b6ec09d6f99c638baa1bd4a5aad644 ******/
		%feature("compactdefaultargs") SetShrunkData;
		%feature("autodoc", "
Parameters
----------
theTS1: float
theTS2: float
theBox: Bnd_Box
theIsSplittable: bool

Return
-------
None

Description
-----------
Modifier sets the shrunk data for the pave block <thets1>, <thets2> - shrunk range <thebox> - the bounding box <theissplittable> - defines whether the edge can be split.
") SetShrunkData;
		void SetShrunkData(const Standard_Real theTS1, const Standard_Real theTS2, const Bnd_Box & theBox, const Standard_Boolean theIsSplittable);

		/****** BOPDS_PaveBlock::ShrunkData ******/
		/****** md5 signature: 6c493466ad5bb4913f72330dcfd83ff3 ******/
		%feature("compactdefaultargs") ShrunkData;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
theTS1: float
theTS2: float
theIsSplittable: bool

Description
-----------
Selector returns the shrunk data for the pave block <thets1>, <thets2> - shrunk range <thebox> - the bounding box <theissplittable> - defines whether the edge can be split.
") ShrunkData;
		void ShrunkData(Standard_Real &OutValue, Standard_Real &OutValue, Bnd_Box & theBox, Standard_Boolean &OutValue);

		/****** BOPDS_PaveBlock::Update ******/
		/****** md5 signature: 475ca3e15ec8cd26334eaa1c94f1d708 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
theLPB: BOPDS_ListOfPaveBlock
theFlag: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Modifier updates the pave block. the extra paves are used to create new pave blocks <thelpb>. <theflag> - if true, the first pave and the second pave are used to produce new pave blocks.
") Update;
		void Update(BOPDS_ListOfPaveBlock & theLPB, const Standard_Boolean theFlag = Standard_True);

};


%make_alias(BOPDS_PaveBlock)

%extend BOPDS_PaveBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class BOPDS_Point *
********************/
class BOPDS_Point {
	public:
		/****** BOPDS_Point::BOPDS_Point ******/
		/****** md5 signature: 006772e0c3a6ee0ca4e888773b24cd13 ******/
		%feature("compactdefaultargs") BOPDS_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_Point;
		 BOPDS_Point();

		/****** BOPDS_Point::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns index of the vertex.
") Index;
		Standard_Integer Index();

		/****** BOPDS_Point::Pnt ******/
		/****** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Selector returns 3d point.
") Pnt;
		const gp_Pnt Pnt();

		/****** BOPDS_Point::Pnt2D1 ******/
		/****** md5 signature: 03938184fe4b834525188dedf6bafc0b ******/
		%feature("compactdefaultargs") Pnt2D1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Selector returns 2d point on the first face <thepnt>.
") Pnt2D1;
		const gp_Pnt2d Pnt2D1();

		/****** BOPDS_Point::Pnt2D2 ******/
		/****** md5 signature: 138377232adca24cd39eb6dbfc8e5337 ******/
		%feature("compactdefaultargs") Pnt2D2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Selector returns 2d point on the second face <thepnt>.
") Pnt2D2;
		const gp_Pnt2d Pnt2D2();

		/****** BOPDS_Point::SetIndex ******/
		/****** md5 signature: 8837cdd415a0f5c290f45964b1b4e33b ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Modifier sets the index of the vertex <theindex>.
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****** BOPDS_Point::SetPnt ******/
		/****** md5 signature: 492367fdc36391270c6513bf1a403636 ******/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Modifier sets 3d point <thepnt>.
") SetPnt;
		void SetPnt(const gp_Pnt & thePnt);

		/****** BOPDS_Point::SetPnt2D1 ******/
		/****** md5 signature: 7cf3a0394468ed5656c3a88ab27aca39 ******/
		%feature("compactdefaultargs") SetPnt2D1;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Modifier sets 2d point on the first face <thepnt>.
") SetPnt2D1;
		void SetPnt2D1(const gp_Pnt2d & thePnt);

		/****** BOPDS_Point::SetPnt2D2 ******/
		/****** md5 signature: d6affd6a44a57ee1fa22a2399b87fc3a ******/
		%feature("compactdefaultargs") SetPnt2D2;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Modifier sets 2d point on the second face <thepnt>.
") SetPnt2D2;
		void SetPnt2D2(const gp_Pnt2d & thePnt);

};


%extend BOPDS_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BOPDS_ShapeInfo *
************************/
class BOPDS_ShapeInfo {
	public:
		/****** BOPDS_ShapeInfo::BOPDS_ShapeInfo ******/
		/****** md5 signature: 8d0a572bef2463ea9fbdd5e7fd05e081 ******/
		%feature("compactdefaultargs") BOPDS_ShapeInfo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo();

		/****** BOPDS_ShapeInfo::BOPDS_ShapeInfo ******/
		/****** md5 signature: 7dfadbc51e9908962dbc2d4d564f5aee ******/
		%feature("compactdefaultargs") BOPDS_ShapeInfo;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_ShapeInfo::Box ******/
		/****** md5 signature: 7c4ea237507e51916495e768089f878e ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Selector returns the boundung box of the shape.
") Box;
		const Bnd_Box & Box();

		/****** BOPDS_ShapeInfo::ChangeBox ******/
		/****** md5 signature: 5631b4e4d9ba9acf6c3e62a29ae5b2c2 ******/
		%feature("compactdefaultargs") ChangeBox;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Selector/modifier returns the boundung box of the shape.
") ChangeBox;
		Bnd_Box & ChangeBox();

		/****** BOPDS_ShapeInfo::ChangeSubShapes ******/
		/****** md5 signature: cce46b8afe21405c1741f5b05cc2d1a2 ******/
		%feature("compactdefaultargs") ChangeSubShapes;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector/ modifier returns the list of indices of sub-shapes.
") ChangeSubShapes;
		TColStd_ListOfInteger & ChangeSubShapes();

		/****** BOPDS_ShapeInfo::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** BOPDS_ShapeInfo::Flag ******/
		/****** md5 signature: a1e7ee9e0f6e3b4294449387a5faac0a ******/
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the flag.
") Flag;
		Standard_Integer Flag();

		/****** BOPDS_ShapeInfo::HasBRep ******/
		/****** md5 signature: 85aa9303d8033ef239112f1da1286317 ******/
		%feature("compactdefaultargs") HasBRep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns true if the shape has boundary representation.
") HasBRep;
		Standard_Boolean HasBRep();

		/****** BOPDS_ShapeInfo::HasFlag ******/
		/****** md5 signature: bf337e3732a94daa45cff0e55a817078 ******/
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query returns true if there is flag.
") HasFlag;
		Standard_Boolean HasFlag();

		/****** BOPDS_ShapeInfo::HasFlag ******/
		/****** md5 signature: d05bf372703d8850d2889fd2855f632f ******/
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "
Parameters
----------

Return
-------
theFlag: int

Description
-----------
Query returns true if there is flag. returns the flag theflag.
") HasFlag;
		Standard_Boolean HasFlag(Standard_Integer &OutValue);

		/****** BOPDS_ShapeInfo::HasReference ******/
		/****** md5 signature: 9bac2006ec6742c943cf0d6ba833da5a ******/
		%feature("compactdefaultargs") HasReference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasReference;
		Standard_Boolean HasReference();

		/****** BOPDS_ShapeInfo::HasSubShape ******/
		/****** md5 signature: 8c06b342a7f049675b14c3d60a4d3398 ******/
		%feature("compactdefaultargs") HasSubShape;
		%feature("autodoc", "
Parameters
----------
theI: int

Return
-------
bool

Description
-----------
Query returns true if the shape has sub-shape with index thei.
") HasSubShape;
		Standard_Boolean HasSubShape(const Standard_Integer theI);

		/****** BOPDS_ShapeInfo::IsInterfering ******/
		/****** md5 signature: f2f0c5e2ad949621ff90565dc251f8c6 ******/
		%feature("compactdefaultargs") IsInterfering;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the shape can be participant of an interference //! flag.
") IsInterfering;
		Standard_Boolean IsInterfering();

		/****** BOPDS_ShapeInfo::Reference ******/
		/****** md5 signature: a49ae0cd48bab924bed904d2db0964c3 ******/
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector returns the index of a reference information.
") Reference;
		Standard_Integer Reference();

		/****** BOPDS_ShapeInfo::SetBox ******/
		/****** md5 signature: 08b5255d733c5c76b81013bedaa4c32d ******/
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
None

Description
-----------
Modifier sets the boundung box of the shape thebox.
") SetBox;
		void SetBox(const Bnd_Box & theBox);

		/****** BOPDS_ShapeInfo::SetFlag ******/
		/****** md5 signature: 356ab305ce6bb1c1a5cd5f8623e00c78 ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
theI: int

Return
-------
None

Description
-----------
Modifier sets the flag.
") SetFlag;
		void SetFlag(const Standard_Integer theI);

		/****** BOPDS_ShapeInfo::SetReference ******/
		/****** md5 signature: ead7289c6453b0e4a306c996b2f2eac6 ******/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "
Parameters
----------
theI: int

Return
-------
None

Description
-----------
Modifier sets the index of a reference information.
") SetReference;
		void SetReference(const Standard_Integer theI);

		/****** BOPDS_ShapeInfo::SetShape ******/
		/****** md5 signature: ea8cd69f1842315314882342f4f38762 ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
None

Description
-----------
Modifier sets the shape <thes>.
") SetShape;
		void SetShape(const TopoDS_Shape & theS);

		/****** BOPDS_ShapeInfo::SetShapeType ******/
		/****** md5 signature: 4979c0c071d6cc77b255ba651052d5f6 ******/
		%feature("compactdefaultargs") SetShapeType;
		%feature("autodoc", "
Parameters
----------
theType: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
Modifier sets the type of shape thetype.
") SetShapeType;
		void SetShapeType(const TopAbs_ShapeEnum theType);

		/****** BOPDS_ShapeInfo::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Selector returns the shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** BOPDS_ShapeInfo::ShapeType ******/
		/****** md5 signature: fdb6bbab82f138b7eb96684b837c482d ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
Selector returns the type of shape.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****** BOPDS_ShapeInfo::SubShapes ******/
		/****** md5 signature: 014e993425abfc99dfc2d8c0874fb974 ******/
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector returns the list of indices of sub-shapes.
") SubShapes;
		const TColStd_ListOfInteger & SubShapes();

};


%extend BOPDS_ShapeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BOPDS_SubIterator *
**************************/
class BOPDS_SubIterator {
	public:
		/****** BOPDS_SubIterator::BOPDS_SubIterator ******/
		/****** md5 signature: b0326185bc073be786446564b2e63bc7 ******/
		%feature("compactdefaultargs") BOPDS_SubIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_SubIterator;
		 BOPDS_SubIterator();

		/****** BOPDS_SubIterator::BOPDS_SubIterator ******/
		/****** md5 signature: 7d7f53a37df32fe2c4a454ccb46756a2 ******/
		%feature("compactdefaultargs") BOPDS_SubIterator;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor theallocator - the allocator to manage the memory.
") BOPDS_SubIterator;
		 BOPDS_SubIterator(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_SubIterator::DS ******/
		/****** md5 signature: e2b7a95332d83a907322867b207b5f91 ******/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "Return
-------
BOPDS_DS

Description
-----------
Returns the data structure.
") DS;
		const BOPDS_DS & DS();

		/****** BOPDS_SubIterator::ExpectedLength ******/
		/****** md5 signature: fbd2b330f0e8a94b7bcf73bf50ddb532 ******/
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of interfering pairs.
") ExpectedLength;
		Standard_Integer ExpectedLength();

		/****** BOPDS_SubIterator::Initialize ******/
		/****** md5 signature: 4c9930c75acb9044902a1f8388d68e73 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the iterator.
") Initialize;
		void Initialize();

		/****** BOPDS_SubIterator::More ******/
		/****** md5 signature: cff271d3b32940da94bada40648f9096 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are more pairs of intersected shapes.
") More;
		Standard_Boolean More();

		/****** BOPDS_SubIterator::Next ******/
		/****** md5 signature: 1201a55f750036045cd397a65f07fc7d ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves iterations ahead.
") Next;
		void Next();

		/****** BOPDS_SubIterator::Prepare ******/
		/****** md5 signature: f9b9a1436567a44993f3d07dbecfab30 ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Return
-------
None

Description
-----------
Perform the intersection algorithm and prepare the results to be used.
") Prepare;
		virtual void Prepare();

		/****** BOPDS_SubIterator::SetDS ******/
		/****** md5 signature: 3dd088536031061a899dbea11ade121b ******/
		%feature("compactdefaultargs") SetDS;
		%feature("autodoc", "
Parameters
----------
pDS: BOPDS_PDS

Return
-------
None

Description
-----------
Sets the data structure <pds> to process. it is used to access the shapes and their bounding boxes.
") SetDS;
		void SetDS(const BOPDS_PDS & pDS);

		/****** BOPDS_SubIterator::SetSubSet1 ******/
		/****** md5 signature: 252136206a8ce77d68387c3e946bb471 ******/
		%feature("compactdefaultargs") SetSubSet1;
		%feature("autodoc", "
Parameters
----------
theLI: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Sets the first set of indices <theli> to process.
") SetSubSet1;
		void SetSubSet1(const TColStd_ListOfInteger & theLI);

		/****** BOPDS_SubIterator::SetSubSet2 ******/
		/****** md5 signature: 4f4e0b922e12e3fe4c09fa2634bef460 ******/
		%feature("compactdefaultargs") SetSubSet2;
		%feature("autodoc", "
Parameters
----------
theLI: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Sets the second set of indices <theli> to process.
") SetSubSet2;
		void SetSubSet2(const TColStd_ListOfInteger & theLI);

		/****** BOPDS_SubIterator::SubSet1 ******/
		/****** md5 signature: ab0c061163652bd3c7576cf1e5393ed8 ******/
		%feature("compactdefaultargs") SubSet1;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Returns the first set of indices to process.
") SubSet1;
		const TColStd_ListOfInteger & SubSet1();

		/****** BOPDS_SubIterator::SubSet2 ******/
		/****** md5 signature: acf1124456fc41a861be31a0aee3df0b ******/
		%feature("compactdefaultargs") SubSet2;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Returns the second set of indices to process.
") SubSet2;
		const TColStd_ListOfInteger & SubSet2();

		/****** BOPDS_SubIterator::Value ******/
		/****** md5 signature: e158a5c3b0133290b10886e826c5728a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndex1: int
theIndex2: int

Description
-----------
Returns indices (ds) of intersected shapes theindex1 - the index of the first shape theindex2 - the index of the second shape.
") Value;
		void Value(Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend BOPDS_SubIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class BOPDS_Tools *
********************/
class BOPDS_Tools {
	public:
		/****** BOPDS_Tools::HasBRep ******/
		/****** md5 signature: dc27ba68aac28e872e646f6627a870af ******/
		%feature("compactdefaultargs") HasBRep;
		%feature("autodoc", "
Parameters
----------
theT: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
Returns true if the type <thet> correspond to a shape having boundary representation.
") HasBRep;
		static Standard_Boolean HasBRep(const TopAbs_ShapeEnum theT);

		/****** BOPDS_Tools::IsInterfering ******/
		/****** md5 signature: 114855a12e7685dc30b197df785d635d ******/
		%feature("compactdefaultargs") IsInterfering;
		%feature("autodoc", "
Parameters
----------
theT: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
Returns true if the type <thet> can be participant of an interference.
") IsInterfering;
		static Standard_Boolean IsInterfering(const TopAbs_ShapeEnum theT);

		/****** BOPDS_Tools::TypeToInteger ******/
		/****** md5 signature: 0ae15761533503a6aa960b1cf71c8fcd ******/
		%feature("compactdefaultargs") TypeToInteger;
		%feature("autodoc", "
Parameters
----------
theT1: TopAbs_ShapeEnum
theT2: TopAbs_ShapeEnum

Return
-------
int

Description
-----------
Converts the conmbination of two types of shape <thet1>,<thet2> to the one integer value, that is returned.
") TypeToInteger;
		static Standard_Integer TypeToInteger(const TopAbs_ShapeEnum theT1, const TopAbs_ShapeEnum theT2);

		/****** BOPDS_Tools::TypeToInteger ******/
		/****** md5 signature: 2ff94d4866c6c71e2ceb7a5e855100f3 ******/
		%feature("compactdefaultargs") TypeToInteger;
		%feature("autodoc", "
Parameters
----------
theT: TopAbs_ShapeEnum

Return
-------
int

Description
-----------
Converts the type of shape <thet>, to integer value, that is returned.
") TypeToInteger;
		static Standard_Integer TypeToInteger(const TopAbs_ShapeEnum theT);

};


%extend BOPDS_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class hash<BOPDS_Pair> *
*************************/
/*************************
* class hash<BOPDS_Pave> *
*************************/
/***********************
* class BOPDS_InterfEE *
***********************/
class BOPDS_InterfEE : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfEE::BOPDS_InterfEE ******/
		/****** md5 signature: 3a56ee86c80ca876a599958dcbb93de2 ******/
		%feature("compactdefaultargs") BOPDS_InterfEE;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfEE;
		 BOPDS_InterfEE();

		/****** BOPDS_InterfEE::BOPDS_InterfEE ******/
		/****** md5 signature: 66f80f94fd23238be82f83cc36f1acf0 ******/
		%feature("compactdefaultargs") BOPDS_InterfEE;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfEE;
		 BOPDS_InterfEE(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_InterfEE::CommonPart ******/
		/****** md5 signature: 158eea49db3781300d62b63a4c3d0e83 ******/
		%feature("compactdefaultargs") CommonPart;
		%feature("autodoc", "Return
-------
IntTools_CommonPrt

Description
-----------
/** * selector * returns the info of common part * return * common part */.
") CommonPart;
		const IntTools_CommonPrt & CommonPart();

		/****** BOPDS_InterfEE::SetCommonPart ******/
		/****** md5 signature: 76e27597c4757830473369f47aa42860 ******/
		%feature("compactdefaultargs") SetCommonPart;
		%feature("autodoc", "
Parameters
----------
theCP: IntTools_CommonPrt

Return
-------
None

Description
-----------
/** * modifier * sets the info of common part * @param thecp * common part */.
") SetCommonPart;
		void SetCommonPart(const IntTools_CommonPrt & theCP);

};


%extend BOPDS_InterfEE {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfEF *
***********************/
class BOPDS_InterfEF : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfEF::BOPDS_InterfEF ******/
		/****** md5 signature: db7b1db9510fdcd08228116450854f56 ******/
		%feature("compactdefaultargs") BOPDS_InterfEF;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfEF;
		 BOPDS_InterfEF();

		/****** BOPDS_InterfEF::BOPDS_InterfEF ******/
		/****** md5 signature: 0888789645a47ab19ec98d181244c93e ******/
		%feature("compactdefaultargs") BOPDS_InterfEF;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfEF;
		 BOPDS_InterfEF(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_InterfEF::CommonPart ******/
		/****** md5 signature: 158eea49db3781300d62b63a4c3d0e83 ******/
		%feature("compactdefaultargs") CommonPart;
		%feature("autodoc", "Return
-------
IntTools_CommonPrt

Description
-----------
/** * selector * returns the info of common part * return * common part */.
") CommonPart;
		const IntTools_CommonPrt & CommonPart();

		/****** BOPDS_InterfEF::SetCommonPart ******/
		/****** md5 signature: 76e27597c4757830473369f47aa42860 ******/
		%feature("compactdefaultargs") SetCommonPart;
		%feature("autodoc", "
Parameters
----------
theCP: IntTools_CommonPrt

Return
-------
None

Description
-----------
/** * modifier * sets the info of common part * @param thecp * common part */.
") SetCommonPart;
		void SetCommonPart(const IntTools_CommonPrt & theCP);

};


%extend BOPDS_InterfEF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfEZ *
***********************/
class BOPDS_InterfEZ : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfEZ::BOPDS_InterfEZ ******/
		/****** md5 signature: 68a3e3081232b079fb3aa95b06499417 ******/
		%feature("compactdefaultargs") BOPDS_InterfEZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfEZ;
		 BOPDS_InterfEZ();

		/****** BOPDS_InterfEZ::BOPDS_InterfEZ ******/
		/****** md5 signature: 324a547e187942b91af368889f5e90b3 ******/
		%feature("compactdefaultargs") BOPDS_InterfEZ;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfEZ;
		 BOPDS_InterfEZ(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


%extend BOPDS_InterfEZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfFF *
***********************/
class BOPDS_InterfFF : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfFF::BOPDS_InterfFF ******/
		/****** md5 signature: e9636cf1028f0ee0277b9b2d95fd34bf ******/
		%feature("compactdefaultargs") BOPDS_InterfFF;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfFF;
		 BOPDS_InterfFF();

		/****** BOPDS_InterfFF::ChangeCurves ******/
		/****** md5 signature: a137ee1b8aca0e0cd4aa63ad1bf53ac5 ******/
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfCurve

Description
-----------
/** * selector/modifier * returns the intersection curves * return * intersection curves */.
") ChangeCurves;
		BOPDS_VectorOfCurve & ChangeCurves();

		/****** BOPDS_InterfFF::ChangePoints ******/
		/****** md5 signature: 6d7e21a9831c13acb16202b5eb5069c2 ******/
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfPoint

Description
-----------
/** * selector/modifier * returns the intersection points * return * intersection points */.
") ChangePoints;
		BOPDS_VectorOfPoint & ChangePoints();

		/****** BOPDS_InterfFF::Curves ******/
		/****** md5 signature: a51a404fc40e0761a1ef97d4ce4eb86a ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfCurve

Description
-----------
/** * selector * returns the intersection curves * return * intersection curves */.
") Curves;
		BOPDS_VectorOfCurve Curves();

		/****** BOPDS_InterfFF::Init ******/
		/****** md5 signature: 4ef383c666596f906f9ce4d66071677d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theNbCurves: int
theNbPoints: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer theNbCurves, const Standard_Integer theNbPoints);

		/****** BOPDS_InterfFF::Points ******/
		/****** md5 signature: af3d274ccfb32eab08bf5e3c85cb2291 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
BOPDS_VectorOfPoint

Description
-----------
/** * selector * returns the intersection points * return * intersection points */.
") Points;
		const BOPDS_VectorOfPoint & Points();

		/****** BOPDS_InterfFF::SetTangentFaces ******/
		/****** md5 signature: f40c479ada59173a3110087e189d0488 ******/
		%feature("compactdefaultargs") SetTangentFaces;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
/** * modifier * sets the flag of whether the faces are tangent * @param theflag * the flag */.
") SetTangentFaces;
		void SetTangentFaces(const Standard_Boolean theFlag);

		/****** BOPDS_InterfFF::TangentFaces ******/
		/****** md5 signature: 44e511afda93e8aadb10ba4db293bb02 ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * selector * returns the flag whether the faces are tangent * return * the flag */.
") TangentFaces;
		Standard_Boolean TangentFaces();

};


%extend BOPDS_InterfFF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfFZ *
***********************/
class BOPDS_InterfFZ : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfFZ::BOPDS_InterfFZ ******/
		/****** md5 signature: e5c202a4fb5b68fc49a5668dc1d5fc67 ******/
		%feature("compactdefaultargs") BOPDS_InterfFZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfFZ;
		 BOPDS_InterfFZ();

		/****** BOPDS_InterfFZ::BOPDS_InterfFZ ******/
		/****** md5 signature: fe1676b3d8f89dc728bd691b5be673f3 ******/
		%feature("compactdefaultargs") BOPDS_InterfFZ;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfFZ;
		 BOPDS_InterfFZ(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


%extend BOPDS_InterfFZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfVE *
***********************/
class BOPDS_InterfVE : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfVE::BOPDS_InterfVE ******/
		/****** md5 signature: 6271df0bb8ec22b4b5d2f12a131e2ae8 ******/
		%feature("compactdefaultargs") BOPDS_InterfVE;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfVE;
		 BOPDS_InterfVE();

		/****** BOPDS_InterfVE::BOPDS_InterfVE ******/
		/****** md5 signature: 0517f3ece389f8cd8f4272e4ce15ca4d ******/
		%feature("compactdefaultargs") BOPDS_InterfVE;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfVE;
		 BOPDS_InterfVE(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_InterfVE::Parameter ******/
		/****** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
/** * selector * returrns the value of parameter * of the point of the vertex * on the curve of the edge * return * value of parameter */.
") Parameter;
		Standard_Real Parameter();

		/****** BOPDS_InterfVE::SetParameter ******/
		/****** md5 signature: d089f68e9d85c0cc9947cf1853be9ad0 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
theT: float

Return
-------
None

Description
-----------
/** * modifier * sets the value of parameter * of the point of the vertex * on the curve of the edge * @param thet * value of parameter */.
") SetParameter;
		void SetParameter(const Standard_Real theT);

};


%extend BOPDS_InterfVE {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfVF *
***********************/
class BOPDS_InterfVF : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfVF::BOPDS_InterfVF ******/
		/****** md5 signature: 4f904beb865fa4a8a7b6ce31b90e31ce ******/
		%feature("compactdefaultargs") BOPDS_InterfVF;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfVF;
		 BOPDS_InterfVF();

		/****** BOPDS_InterfVF::BOPDS_InterfVF ******/
		/****** md5 signature: 845ad13694dca1bb6664247530187612 ******/
		%feature("compactdefaultargs") BOPDS_InterfVF;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfVF;
		 BOPDS_InterfVF(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_InterfVF::SetUV ******/
		/****** md5 signature: f05410086525668d6e7335c85692e807 ******/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float

Return
-------
None

Description
-----------
/** * modifier * sets the value of parameters * of the point of the vertex * on the surface of of the face * @param theu * value of u parameter * @param thev * value of u parameter */.
") SetUV;
		void SetUV(const Standard_Real theU, const Standard_Real theV);

		/****** BOPDS_InterfVF::UV ******/
		/****** md5 signature: d5aee13da276e476ef2e46c0c4691734 ******/
		%feature("compactdefaultargs") UV;
		%feature("autodoc", "
Parameters
----------

Return
-------
theU: float
theV: float

Description
-----------
/** * selector * returns the value of parameters * of the point of the vertex * on the surface of of the face * @param theu * value of u parameter * @param thev * value of u parameter */.
") UV;
		void UV(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend BOPDS_InterfVF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfVV *
***********************/
class BOPDS_InterfVV : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfVV::BOPDS_InterfVV ******/
		/****** md5 signature: e630b4eef92ce00d9ba3c276b244a9d9 ******/
		%feature("compactdefaultargs") BOPDS_InterfVV;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfVV;
		 BOPDS_InterfVV();

		/****** BOPDS_InterfVV::BOPDS_InterfVV ******/
		/****** md5 signature: b8d96d83bfe94f647252a7f68f684680 ******/
		%feature("compactdefaultargs") BOPDS_InterfVV;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfVV;
		 BOPDS_InterfVV(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


%extend BOPDS_InterfVV {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfVZ *
***********************/
class BOPDS_InterfVZ : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfVZ::BOPDS_InterfVZ ******/
		/****** md5 signature: 96ec00ba8d018a2dbf0e43b26f1e2583 ******/
		%feature("compactdefaultargs") BOPDS_InterfVZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfVZ;
		 BOPDS_InterfVZ();

		/****** BOPDS_InterfVZ::BOPDS_InterfVZ ******/
		/****** md5 signature: 5c02cc4070faaca682e63bf98e24be8d ******/
		%feature("compactdefaultargs") BOPDS_InterfVZ;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfVZ;
		 BOPDS_InterfVZ(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


%extend BOPDS_InterfVZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfZZ *
***********************/
class BOPDS_InterfZZ : public BOPDS_Interf {
	public:
		/****** BOPDS_InterfZZ::BOPDS_InterfZZ ******/
		/****** md5 signature: 113ab70d063043dabdc7028349eeea00 ******/
		%feature("compactdefaultargs") BOPDS_InterfZZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * constructor */.
") BOPDS_InterfZZ;
		 BOPDS_InterfZZ();

		/****** BOPDS_InterfZZ::BOPDS_InterfZZ ******/
		/****** md5 signature: 5f74a14b8c05998299025f2f1bc01f77 ******/
		%feature("compactdefaultargs") BOPDS_InterfZZ;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * constructor * @param theallocator * allocator to manage the memory */.
") BOPDS_InterfZZ;
		 BOPDS_InterfZZ(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

};


%extend BOPDS_InterfZZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BOPDS_IteratorSI *
*************************/
class BOPDS_IteratorSI : public BOPDS_Iterator {
	public:
		/****** BOPDS_IteratorSI::BOPDS_IteratorSI ******/
		/****** md5 signature: c5b0dd22646c1e2457a62b94390f85aa ******/
		%feature("compactdefaultargs") BOPDS_IteratorSI;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI();

		/****** BOPDS_IteratorSI::BOPDS_IteratorSI ******/
		/****** md5 signature: 802d1e4e61c51785f102169bd02bad90 ******/
		%feature("compactdefaultargs") BOPDS_IteratorSI;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Constructor @param theallocator the allocator to manage the memory.
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_IteratorSI::UpdateByLevelOfCheck ******/
		/****** md5 signature: da43b78370a700502adc2b5b947016f3 ******/
		%feature("compactdefaultargs") UpdateByLevelOfCheck;
		%feature("autodoc", "
Parameters
----------
theLevel: int

Return
-------
None

Description
-----------
Updates the lists of possible intersections according to the value of <thelevel>. it defines which interferferences will be checked: 0 - only v/v; 1 - v/v and v/e; 2 - v/v, v/e and e/e; 3 - v/v, v/e, e/e and v/f; 4 - v/v, v/e, e/e, v/f and e/f; other - all interferences.
") UpdateByLevelOfCheck;
		void UpdateByLevelOfCheck(const Standard_Integer theLevel);

};


%extend BOPDS_IteratorSI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BOPDS_Interf:
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
def BOPDS_DS_NbInterfTypes(*args):
	return BOPDS_DS.NbInterfTypes(*args)

@deprecated
def BOPDS_Iterator_NbExtInterfs(*args):
	return BOPDS_Iterator.NbExtInterfs(*args)

@deprecated
def BOPDS_Tools_HasBRep(*args):
	return BOPDS_Tools.HasBRep(*args)

@deprecated
def BOPDS_Tools_IsInterfering(*args):
	return BOPDS_Tools.IsInterfering(*args)

@deprecated
def BOPDS_Tools_TypeToInteger(*args):
	return BOPDS_Tools.TypeToInteger(*args)

@deprecated
def BOPDS_Tools_TypeToInteger(*args):
	return BOPDS_Tools.TypeToInteger(*args)

}
