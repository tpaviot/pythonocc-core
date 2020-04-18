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
%define BOPDSDOCSTRING
"BOPDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bopds.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BOPDS_CommonBlock)
%wrap_handle(BOPDS_PaveBlock)
/* end handles declaration */

/* templates */
%template(BOPDS_DataMapOfIntegerListOfPaveBlock) NCollection_DataMap<Standard_Integer,BOPDS_ListOfPaveBlock,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,BOPDS_ListOfPaveBlock,TColStd_MapIntegerHasher> {
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
%template(BOPDS_DataMapOfPaveBlockListOfInteger) NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger,TColStd_MapTransientHasher>;
%template(BOPDS_DataMapOfPaveBlockListOfPaveBlock) NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>,BOPDS_ListOfPaveBlock,TColStd_MapTransientHasher>;
%template(BOPDS_DataMapOfShapeCoupleOfPaveBlocks) NCollection_DataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>;
%template(BOPDS_IndexedDataMapOfPaveBlockListOfInteger) NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger,TColStd_MapTransientHasher>;
%template(BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock) NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,BOPDS_ListOfPaveBlock,TColStd_MapTransientHasher>;
%template(BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks) NCollection_IndexedDataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>;
%template(BOPDS_IndexedMapOfPaveBlock) NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_MapTransientHasher>;
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
%template(BOPDS_MapOfCommonBlock) NCollection_Map<opencascade::handle<BOPDS_CommonBlock>,TColStd_MapTransientHasher>;
%template(BOPDS_MapOfPair) NCollection_Map<BOPDS_Pair,BOPDS_PairMapHasher>;
%template(BOPDS_MapOfPave) NCollection_Map<BOPDS_Pave,BOPDS_PaveMapHasher>;
%template(BOPDS_MapOfPaveBlock) NCollection_Map<opencascade::handle<BOPDS_PaveBlock>,TColStd_MapTransientHasher>;
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

%extend NCollection_Array1<BOPDS_Pave> {
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
%template(BOPDS_VectorOfPoint) NCollection_Vector<BOPDS_Point>;
%template(BOPDS_VectorOfShapeInfo) NCollection_Vector<BOPDS_ShapeInfo>;
%template(BOPDS_VectorOfVectorOfPair) NCollection_Vector<BOPDS_VectorOfPair>;
/* end templates declaration */

/* typedefs */
typedef BOPDS_DataMapOfPaveBlockCommonBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockCommonBlock;
typedef BOPDS_DataMapOfPaveBlockListOfInteger::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfInteger;
typedef BOPDS_DataMapOfPaveBlockListOfPaveBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfPaveBlock;
typedef BOPDS_DataMapOfShapeCoupleOfPaveBlocks::Iterator BOPDS_DataMapIteratorOfDataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_DataMap<Standard_Integer, BOPDS_ListOfPaveBlock, TColStd_MapIntegerHasher> BOPDS_DataMapOfIntegerListOfPaveBlock;
typedef NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger, TColStd_MapTransientHasher> BOPDS_DataMapOfPaveBlockListOfInteger;
typedef NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>, BOPDS_ListOfPaveBlock, TColStd_MapTransientHasher> BOPDS_DataMapOfPaveBlockListOfPaveBlock;
typedef NCollection_DataMap<TopoDS_Shape, BOPDS_CoupleOfPaveBlocks, TopTools_ShapeMapHasher> BOPDS_DataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger, TColStd_MapTransientHasher> BOPDS_IndexedDataMapOfPaveBlockListOfInteger;
typedef NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>, BOPDS_ListOfPaveBlock, TColStd_MapTransientHasher> BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock;
typedef NCollection_IndexedDataMap<TopoDS_Shape, BOPDS_CoupleOfPaveBlocks, TopTools_ShapeMapHasher> BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_MapTransientHasher> BOPDS_IndexedMapOfPaveBlock;
typedef BOPDS_ListOfPave::Iterator BOPDS_ListIteratorOfListOfPave;
typedef BOPDS_ListOfPaveBlock::Iterator BOPDS_ListIteratorOfListOfPaveBlock;
typedef NCollection_List<BOPDS_Pave> BOPDS_ListOfPave;
typedef NCollection_List<opencascade::handle<BOPDS_PaveBlock>> BOPDS_ListOfPaveBlock;
typedef BOPDS_MapOfCommonBlock::Iterator BOPDS_MapIteratorOfMapOfCommonBlock;
typedef BOPDS_MapOfPair::Iterator BOPDS_MapIteratorOfMapOfPair;
typedef BOPDS_MapOfPave::Iterator BOPDS_MapIteratorOfMapOfPave;
typedef BOPDS_MapOfPaveBlock::Iterator BOPDS_MapIteratorOfMapOfPaveBlock;
typedef NCollection_Map<opencascade::handle<BOPDS_CommonBlock>, TColStd_MapTransientHasher> BOPDS_MapOfCommonBlock;
typedef NCollection_Map<BOPDS_Pair, BOPDS_PairMapHasher> BOPDS_MapOfPair;
typedef NCollection_Map<BOPDS_Pave, BOPDS_PaveMapHasher> BOPDS_MapOfPave;
typedef NCollection_Map<opencascade::handle<BOPDS_PaveBlock>, TColStd_MapTransientHasher> BOPDS_MapOfPaveBlock;
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
		/****************** BOPDS_CommonBlock ******************/
		%feature("compactdefaultargs") BOPDS_CommonBlock;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock();

		/****************** BOPDS_CommonBlock ******************/
		%feature("compactdefaultargs") BOPDS_CommonBlock;
		%feature("autodoc", "Contructor <theallocator> - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddFace ******************/
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "Modifier adds the index of the face <af> to the list of indices of faces of the common block.

Parameters
----------
aF: int

Returns
-------
None
") AddFace;
		void AddFace(const Standard_Integer aF);

		/****************** AddPaveBlock ******************/
		%feature("compactdefaultargs") AddPaveBlock;
		%feature("autodoc", "Modifier adds the pave block <apb> to the list of pave blocks of the common block.

Parameters
----------
aPB: BOPDS_PaveBlock

Returns
-------
None
") AddPaveBlock;
		void AddPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & aPB);

		/****************** AppendFaces ******************/
		%feature("compactdefaultargs") AppendFaces;
		%feature("autodoc", "Modifier appends the list of indices of faces <alf> to the list of indices of faces of the common block (the input list is emptied).

Parameters
----------
aLF: TColStd_ListOfInteger

Returns
-------
None
") AppendFaces;
		void AppendFaces(TColStd_ListOfInteger & aLF);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Query returns true if the common block contains a pave block that is equal to <thepb>.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Query returns true if the common block contains the face with index equal to <thef>.

Parameters
----------
theF: int

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const Standard_Integer theF);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Selector returns the index of the edge of all pave blocks of the common block.

Returns
-------
int
") Edge;
		Standard_Integer Edge();

		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Selector returns the list of indices of faces of the common block.

Returns
-------
TColStd_ListOfInteger
") Faces;
		const TColStd_ListOfInteger & Faces();

		/****************** IsPaveBlockOnEdge ******************/
		%feature("compactdefaultargs") IsPaveBlockOnEdge;
		%feature("autodoc", "Query returns true if the common block contains a pave block that belongs to the edge with index <theix>.

Parameters
----------
theIndex: int

Returns
-------
bool
") IsPaveBlockOnEdge;
		Standard_Boolean IsPaveBlockOnEdge(const Standard_Integer theIndex);

		/****************** IsPaveBlockOnFace ******************/
		%feature("compactdefaultargs") IsPaveBlockOnFace;
		%feature("autodoc", "Query returns true if the common block contains a pave block that belongs to the face with index <theix>.

Parameters
----------
theIndex: int

Returns
-------
bool
") IsPaveBlockOnFace;
		Standard_Boolean IsPaveBlockOnFace(const Standard_Integer theIndex);

		/****************** PaveBlock1 ******************/
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "Selector returns the first pave block of the common block.

Returns
-------
opencascade::handle<BOPDS_PaveBlock>
") PaveBlock1;
		const opencascade::handle<BOPDS_PaveBlock> & PaveBlock1();

		/****************** PaveBlockOnEdge ******************/
		%feature("compactdefaultargs") PaveBlockOnEdge;
		%feature("autodoc", "Selector returns the pave block that belongs to the edge with index <theix>.

Parameters
----------
theIndex: int

Returns
-------
opencascade::handle<BOPDS_PaveBlock>
") PaveBlockOnEdge;
		opencascade::handle<BOPDS_PaveBlock> & PaveBlockOnEdge(const Standard_Integer theIndex);

		/****************** PaveBlocks ******************/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "Selector returns the list of pave blocks of the common block.

Returns
-------
BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks();

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "Modifier assign the index <theedge> as the edge index to all pave blocks of the common block.

Parameters
----------
theEdge: int

Returns
-------
None
") SetEdge;
		void SetEdge(const Standard_Integer theEdge);

		/****************** SetFaces ******************/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "Modifier sets the list of indices of faces <alf> of the common block.

Parameters
----------
aLF: TColStd_ListOfInteger

Returns
-------
None
") SetFaces;
		void SetFaces(const TColStd_ListOfInteger & aLF);

		/****************** SetPaveBlocks ******************/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "Modifier sets the list of pave blocks for the common block.

Parameters
----------
aLPB: BOPDS_ListOfPaveBlock

Returns
-------
None
") SetPaveBlocks;
		void SetPaveBlocks(const BOPDS_ListOfPaveBlock & aLPB);

		/****************** SetRealPaveBlock ******************/
		%feature("compactdefaultargs") SetRealPaveBlock;
		%feature("autodoc", "Moves the pave blocks in the list to make the given pave block to be the first. it will be representative for the whole group.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
None
") SetRealPaveBlock;
		void SetRealPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the tolerance for the common block.

Parameters
----------
theTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return the tolerance of common block.

Returns
-------
float
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
		/****************** BOPDS_CoupleOfPaveBlocks ******************/
		%feature("compactdefaultargs") BOPDS_CoupleOfPaveBlocks;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks();

		/****************** BOPDS_CoupleOfPaveBlocks ******************/
		%feature("compactdefaultargs") BOPDS_CoupleOfPaveBlocks;
		%feature("autodoc", "/** * constructor * @param thepb1 * first pave block * @param thepb2 * secondt pave block */.

Parameters
----------
thePB1: BOPDS_PaveBlock
thePB2: BOPDS_PaveBlock

Returns
-------
None
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks(const opencascade::handle<BOPDS_PaveBlock> & thePB1, const opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "/** * returns the index * returns * index */.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IndexInterf ******************/
		%feature("compactdefaultargs") IndexInterf;
		%feature("autodoc", "/** * returns the index of an interference * returns * index of an interference */.

Returns
-------
int
") IndexInterf;
		Standard_Integer IndexInterf();

		/****************** PaveBlock1 ******************/
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BOPDS_PaveBlock>
") PaveBlock1;
		const opencascade::handle<BOPDS_PaveBlock> & PaveBlock1();

		/****************** PaveBlock2 ******************/
		%feature("compactdefaultargs") PaveBlock2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<BOPDS_PaveBlock>
") PaveBlock2;
		const opencascade::handle<BOPDS_PaveBlock> & PaveBlock2();

		/****************** PaveBlocks ******************/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePB1: BOPDS_PaveBlock
thePB2: BOPDS_PaveBlock

Returns
-------
None
") PaveBlocks;
		void PaveBlocks(opencascade::handle<BOPDS_PaveBlock> & thePB1, opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "/** * sets an index * @param theindex * index */.

Parameters
----------
theIndex: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****************** SetIndexInterf ******************/
		%feature("compactdefaultargs") SetIndexInterf;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
None
") SetIndexInterf;
		void SetIndexInterf(const Standard_Integer theIndex);

		/****************** SetPaveBlock1 ******************/
		%feature("compactdefaultargs") SetPaveBlock1;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
None
") SetPaveBlock1;
		void SetPaveBlock1(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** SetPaveBlock2 ******************/
		%feature("compactdefaultargs") SetPaveBlock2;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
None
") SetPaveBlock2;
		void SetPaveBlock2(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** SetPaveBlocks ******************/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePB1: BOPDS_PaveBlock
thePB2: BOPDS_PaveBlock

Returns
-------
None
") SetPaveBlocks;
		void SetPaveBlocks(const opencascade::handle<BOPDS_PaveBlock> & thePB1, const opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "/** * sets the tolerance associated with this couple */.

Parameters
----------
theTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "/** * returns the tolerance associated with this couple */.

Returns
-------
float
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
		/****************** BOPDS_Curve ******************/
		%feature("compactdefaultargs") BOPDS_Curve;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_Curve;
		 BOPDS_Curve();

		/****************** BOPDS_Curve ******************/
		%feature("compactdefaultargs") BOPDS_Curve;
		%feature("autodoc", "Contructor <theallocator> - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_Curve;
		 BOPDS_Curve(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Selector returns the bounding box of the curve.

Returns
-------
Bnd_Box
") Box;
		const Bnd_Box & Box();

		/****************** ChangeBox ******************/
		%feature("compactdefaultargs") ChangeBox;
		%feature("autodoc", "Selector/modifier returns the bounding box of the curve.

Returns
-------
Bnd_Box
") ChangeBox;
		Bnd_Box & ChangeBox();

		/****************** ChangePaveBlock1 ******************/
		%feature("compactdefaultargs") ChangePaveBlock1;
		%feature("autodoc", "Selector/modifier returns initial pave block of the curve.

Returns
-------
opencascade::handle<BOPDS_PaveBlock>
") ChangePaveBlock1;
		opencascade::handle<BOPDS_PaveBlock> & ChangePaveBlock1();

		/****************** ChangePaveBlocks ******************/
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "Selector/modifier returns the list of pave blocks of the curve.

Returns
-------
BOPDS_ListOfPaveBlock
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks();

		/****************** ChangeTechnoVertices ******************/
		%feature("compactdefaultargs") ChangeTechnoVertices;
		%feature("autodoc", "Selector/modifier returns list of indices of technologic vertices of the curve.

Returns
-------
TColStd_ListOfInteger
") ChangeTechnoVertices;
		TColStd_ListOfInteger & ChangeTechnoVertices();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Selector returns the curve.

Returns
-------
IntTools_Curve
") Curve;
		const IntTools_Curve & Curve();

		/****************** HasEdge ******************/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Query returns true if at least one pave block of the curve has edge.

Returns
-------
bool
") HasEdge;
		Standard_Boolean HasEdge();

		/****************** InitPaveBlock1 ******************/
		%feature("compactdefaultargs") InitPaveBlock1;
		%feature("autodoc", "Creates initial pave block of the curve.

Returns
-------
None
") InitPaveBlock1;
		void InitPaveBlock1();

		/****************** PaveBlocks ******************/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "Selector returns the list of pave blocks of the curve.

Returns
-------
BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks();

		/****************** SetBox ******************/
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "Modifier sets the bounding box <thebox> of the curve.

Parameters
----------
theBox: Bnd_Box

Returns
-------
None
") SetBox;
		void SetBox(const Bnd_Box & theBox);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "Modifier sets the curve <thec>.

Parameters
----------
theC: IntTools_Curve

Returns
-------
None
") SetCurve;
		void SetCurve(const IntTools_Curve & theC);

		/****************** SetPaveBlocks ******************/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLPB: BOPDS_ListOfPaveBlock

Returns
-------
None
") SetPaveBlocks;
		void SetPaveBlocks(const BOPDS_ListOfPaveBlock & theLPB);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets the tolerance for the curve.

Parameters
----------
theTol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real theTol);

		/****************** TangentialTolerance ******************/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "Returns the tangential tolerance of the curve.

Returns
-------
float
") TangentialTolerance;
		Standard_Real TangentialTolerance();

		/****************** TechnoVertices ******************/
		%feature("compactdefaultargs") TechnoVertices;
		%feature("autodoc", "Selector returns list of indices of technologic vertices of the curve.

Returns
-------
TColStd_ListOfInteger
") TechnoVertices;
		const TColStd_ListOfInteger & TechnoVertices();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance of the curve.

Returns
-------
float
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
		/****************** BOPDS_DS ******************/
		%feature("compactdefaultargs") BOPDS_DS;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_DS;
		 BOPDS_DS();

		/****************** BOPDS_DS ******************/
		%feature("compactdefaultargs") BOPDS_DS;
		%feature("autodoc", "Contructor theallocator - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_DS;
		 BOPDS_DS(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AddInterf ******************/
		%feature("compactdefaultargs") AddInterf;
		%feature("autodoc", "Modifier adds the information about an interference between shapes with indices thei1, thei2 to the summary table of interferences.

Parameters
----------
theI1: int
theI2: int

Returns
-------
bool
") AddInterf;
		Standard_Boolean AddInterf(const Standard_Integer theI1, const Standard_Integer theI2);

		/****************** AddShapeSD ******************/
		%feature("compactdefaultargs") AddShapeSD;
		%feature("autodoc", "Modifier adds the information about same domain shapes with indices theindex, theindexsd.

Parameters
----------
theIndex: int
theIndexSD: int

Returns
-------
None
") AddShapeSD;
		void AddShapeSD(const Standard_Integer theIndex, const Standard_Integer theIndexSD);

		/****************** Allocator ******************/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Selector.

Returns
-------
opencascade::handle<NCollection_BaseAllocator>
") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator();

		/****************** AloneVertices ******************/
		%feature("compactdefaultargs") AloneVertices;
		%feature("autodoc", "Selector returns the indices of alone vertices for the face with index theindex.

Parameters
----------
theF: int
theLI: TColStd_ListOfInteger

Returns
-------
None
") AloneVertices;
		void AloneVertices(const Standard_Integer theF, TColStd_ListOfInteger & theLI);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Modifier appends the information about the shape [thesi] to the data structure returns the index of thesi in the data structure.

Parameters
----------
theSI: BOPDS_ShapeInfo

Returns
-------
int
") Append;
		Standard_Integer Append(const BOPDS_ShapeInfo & theSI);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "Modifier appends the default information about the shape [thes] to the data structure returns the index of thes in the data structure.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
int
") Append;
		Standard_Integer Append(const TopoDS_Shape & theS);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Selector returns the arguments of an operation.

Returns
-------
TopTools_ListOfShape
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****************** BuildBndBoxSolid ******************/
		%feature("compactdefaultargs") BuildBndBoxSolid;
		%feature("autodoc", "Computes bounding box <thebox> for the solid with ds-index <theindex>. the flag <thecheckinverted> enables/disables the check of the solid for inverted status. by default the solids will be checked.

Parameters
----------
theIndex: int
theBox: Bnd_Box
theCheckInverted: bool,optional
	default value is Standard_True

Returns
-------
None
") BuildBndBoxSolid;
		void BuildBndBoxSolid(const Standard_Integer theIndex, Bnd_Box & theBox, const Standard_Boolean theCheckInverted = Standard_True);

		/****************** ChangeFaceInfo ******************/
		%feature("compactdefaultargs") ChangeFaceInfo;
		%feature("autodoc", "Selector/modifier returns the state of face with index theindex.

Parameters
----------
theIndex: int

Returns
-------
BOPDS_FaceInfo
") ChangeFaceInfo;
		BOPDS_FaceInfo & ChangeFaceInfo(const Standard_Integer theIndex);

		/****************** ChangePaveBlocks ******************/
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "Selector/modifier returns the pave blocks for the shape with index theindex.

Parameters
----------
theIndex: int

Returns
-------
BOPDS_ListOfPaveBlock
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks(const Standard_Integer theIndex);

		/****************** ChangePaveBlocksPool ******************/
		%feature("compactdefaultargs") ChangePaveBlocksPool;
		%feature("autodoc", "Selector/modifier returns the information about pave blocks on source edges.

Returns
-------
BOPDS_VectorOfListOfPaveBlock
") ChangePaveBlocksPool;
		BOPDS_VectorOfListOfPaveBlock & ChangePaveBlocksPool();

		/****************** ChangeShapeInfo ******************/
		%feature("compactdefaultargs") ChangeShapeInfo;
		%feature("autodoc", "Selector/modifier returns the information about the shape with index theindex.

Parameters
----------
theIndex: int

Returns
-------
BOPDS_ShapeInfo
") ChangeShapeInfo;
		BOPDS_ShapeInfo & ChangeShapeInfo(const Standard_Integer theIndex);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the contents.

Returns
-------
None
") Clear;
		void Clear();

		/****************** CommonBlock ******************/
		%feature("compactdefaultargs") CommonBlock;
		%feature("autodoc", "Selector returns the common block.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
opencascade::handle<BOPDS_CommonBlock>
") CommonBlock;
		opencascade::handle<BOPDS_CommonBlock> CommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** FaceInfo ******************/
		%feature("compactdefaultargs") FaceInfo;
		%feature("autodoc", "Selector returns the state of face with index theindex.

Parameters
----------
theIndex: int

Returns
-------
BOPDS_FaceInfo
") FaceInfo;
		const BOPDS_FaceInfo & FaceInfo(const Standard_Integer theIndex);

		/****************** FaceInfoIn ******************/
		%feature("compactdefaultargs") FaceInfoIn;
		%feature("autodoc", "Selector returns the state in [thempb,themvp] of face with index theindex.

Parameters
----------
theIndex: int
theMPB: BOPDS_IndexedMapOfPaveBlock
theMVP: TColStd_MapOfInteger

Returns
-------
None
") FaceInfoIn;
		void FaceInfoIn(const Standard_Integer theIndex, BOPDS_IndexedMapOfPaveBlock & theMPB, TColStd_MapOfInteger & theMVP);

		/****************** FaceInfoOn ******************/
		%feature("compactdefaultargs") FaceInfoOn;
		%feature("autodoc", "Selector returns the state on [thempb,themvp] of face with index theindex.

Parameters
----------
theIndex: int
theMPB: BOPDS_IndexedMapOfPaveBlock
theMVP: TColStd_MapOfInteger

Returns
-------
None
") FaceInfoOn;
		void FaceInfoOn(const Standard_Integer theIndex, BOPDS_IndexedMapOfPaveBlock & theMPB, TColStd_MapOfInteger & theMVP);

		/****************** FaceInfoPool ******************/
		%feature("compactdefaultargs") FaceInfoPool;
		%feature("autodoc", "Selector returns the information about state of faces.

Returns
-------
BOPDS_VectorOfFaceInfo
") FaceInfoPool;
		const BOPDS_VectorOfFaceInfo & FaceInfoPool();

		/****************** HasFaceInfo ******************/
		%feature("compactdefaultargs") HasFaceInfo;
		%feature("autodoc", "Query returns true if the shape with index theindex has the information about state of face.

Parameters
----------
theIndex: int

Returns
-------
bool
") HasFaceInfo;
		Standard_Boolean HasFaceInfo(const Standard_Integer theIndex);

		/****************** HasInterf ******************/
		%feature("compactdefaultargs") HasInterf;
		%feature("autodoc", "Query returns true if the shape with index thei is interferred.

Parameters
----------
theI: int

Returns
-------
bool
") HasInterf;
		Standard_Boolean HasInterf(const Standard_Integer theI);

		/****************** HasInterf ******************/
		%feature("compactdefaultargs") HasInterf;
		%feature("autodoc", "Query returns true if the shapes with indices thei1, thei2 are interferred.

Parameters
----------
theI1: int
theI2: int

Returns
-------
bool
") HasInterf;
		Standard_Boolean HasInterf(const Standard_Integer theI1, const Standard_Integer theI2);

		/****************** HasInterfShapeSubShapes ******************/
		%feature("compactdefaultargs") HasInterfShapeSubShapes;
		%feature("autodoc", "Query returns true if the shape with index thei1 is interfered with any sub-shape of the shape with index thei2 (theflag=true) all sub-shapes of the shape with index thei2 (theflag=false).

Parameters
----------
theI1: int
theI2: int
theFlag: bool,optional
	default value is Standard_True

Returns
-------
bool
") HasInterfShapeSubShapes;
		Standard_Boolean HasInterfShapeSubShapes(const Standard_Integer theI1, const Standard_Integer theI2, const Standard_Boolean theFlag = Standard_True);

		/****************** HasInterfSubShapes ******************/
		%feature("compactdefaultargs") HasInterfSubShapes;
		%feature("autodoc", "Query returns true if the shapes with indices thei1, thei2 have interferred sub-shapes.

Parameters
----------
theI1: int
theI2: int

Returns
-------
bool
") HasInterfSubShapes;
		Standard_Boolean HasInterfSubShapes(const Standard_Integer theI1, const Standard_Integer theI2);

		/****************** HasPaveBlocks ******************/
		%feature("compactdefaultargs") HasPaveBlocks;
		%feature("autodoc", "Query returns true if the shape with index theindex has the information about pave blocks.

Parameters
----------
theIndex: int

Returns
-------
bool
") HasPaveBlocks;
		Standard_Boolean HasPaveBlocks(const Standard_Integer theIndex);

		/****************** HasShapeSD ******************/
		%feature("compactdefaultargs") HasShapeSD;
		%feature("autodoc", "Query returns true if the shape with index theindex has the same domain shape. in this case theindexsd will contain the index of same domain shape found //! interferences.

Parameters
----------
theIndex: int

Returns
-------
theIndexSD: int
") HasShapeSD;
		Standard_Boolean HasShapeSD(const Standard_Integer theIndex, Standard_Integer &OutValue);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Selector returns the index of the shape thes.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Shape & theS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the data structure for the arguments.

Parameters
----------
theFuzz: float,optional
	default value is Precision::Confusion()

Returns
-------
None
") Init;
		void Init(const Standard_Real theFuzz = Precision::Confusion());

		/****************** InitPaveBlocksForVertex ******************/
		%feature("compactdefaultargs") InitPaveBlocksForVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNV: int

Returns
-------
None
") InitPaveBlocksForVertex;
		void InitPaveBlocksForVertex(const Standard_Integer theNV);

		/****************** InterfEE ******************/
		%feature("compactdefaultargs") InterfEE;
		%feature("autodoc", "Selector/modifier returns the collection of interferences edge/edge.

Returns
-------
BOPDS_VectorOfInterfEE
") InterfEE;
		BOPDS_VectorOfInterfEE & InterfEE();

		/****************** InterfEF ******************/
		%feature("compactdefaultargs") InterfEF;
		%feature("autodoc", "Selector/modifier returns the collection of interferences edge/face.

Returns
-------
BOPDS_VectorOfInterfEF
") InterfEF;
		BOPDS_VectorOfInterfEF & InterfEF();

		/****************** InterfEZ ******************/
		%feature("compactdefaultargs") InterfEZ;
		%feature("autodoc", "Selector/modifier returns the collection of interferences edge/solid.

Returns
-------
BOPDS_VectorOfInterfEZ
") InterfEZ;
		BOPDS_VectorOfInterfEZ & InterfEZ();

		/****************** InterfFF ******************/
		%feature("compactdefaultargs") InterfFF;
		%feature("autodoc", "Selector/modifier returns the collection of interferences face/face.

Returns
-------
BOPDS_VectorOfInterfFF
") InterfFF;
		BOPDS_VectorOfInterfFF & InterfFF();

		/****************** InterfFZ ******************/
		%feature("compactdefaultargs") InterfFZ;
		%feature("autodoc", "Selector/modifier returns the collection of interferences face/solid.

Returns
-------
BOPDS_VectorOfInterfFZ
") InterfFZ;
		BOPDS_VectorOfInterfFZ & InterfFZ();

		/****************** InterfVE ******************/
		%feature("compactdefaultargs") InterfVE;
		%feature("autodoc", "Selector/modifier returns the collection of interferences vertex/edge.

Returns
-------
BOPDS_VectorOfInterfVE
") InterfVE;
		BOPDS_VectorOfInterfVE & InterfVE();

		/****************** InterfVF ******************/
		%feature("compactdefaultargs") InterfVF;
		%feature("autodoc", "Selector/modifier returns the collection of interferences vertex/face.

Returns
-------
BOPDS_VectorOfInterfVF
") InterfVF;
		BOPDS_VectorOfInterfVF & InterfVF();

		/****************** InterfVV ******************/
		%feature("compactdefaultargs") InterfVV;
		%feature("autodoc", "Selector/modifier returns the collection of interferences vertex/vertex.

Returns
-------
BOPDS_VectorOfInterfVV
") InterfVV;
		BOPDS_VectorOfInterfVV & InterfVV();

		/****************** InterfVZ ******************/
		%feature("compactdefaultargs") InterfVZ;
		%feature("autodoc", "Selector/modifier returns the collection of interferences vertex/solid.

Returns
-------
BOPDS_VectorOfInterfVZ
") InterfVZ;
		BOPDS_VectorOfInterfVZ & InterfVZ();

		/****************** InterfZZ ******************/
		%feature("compactdefaultargs") InterfZZ;
		%feature("autodoc", "Selector/modifier returns the collection of interferences solid/solid.

Returns
-------
BOPDS_VectorOfInterfZZ
") InterfZZ;
		BOPDS_VectorOfInterfZZ & InterfZZ();

		/****************** Interferences ******************/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "Selector returns the table of interferences //! debug.

Returns
-------
BOPDS_MapOfPair
") Interferences;
		const BOPDS_MapOfPair & Interferences();

		/****************** IsCommonBlock ******************/
		%feature("compactdefaultargs") IsCommonBlock;
		%feature("autodoc", "Query returns true if the pave block is common block.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
bool
") IsCommonBlock;
		Standard_Boolean IsCommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** IsCommonBlockOnEdge ******************/
		%feature("compactdefaultargs") IsCommonBlockOnEdge;
		%feature("autodoc", "Query returns true if common block contains more then one pave block.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
bool
") IsCommonBlockOnEdge;
		Standard_Boolean IsCommonBlockOnEdge(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** IsNewShape ******************/
		%feature("compactdefaultargs") IsNewShape;
		%feature("autodoc", "Returns true if the shape of index 'i' is not the source shape/sub-shape.

Parameters
----------
theIndex: int

Returns
-------
bool
") IsNewShape;
		Standard_Boolean IsNewShape(const Standard_Integer theIndex);

		/****************** IsSubShape ******************/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
theI1: int
theI2: int

Returns
-------
bool
") IsSubShape;
		Standard_Boolean IsSubShape(const Standard_Integer theI1, const Standard_Integer theI2);

		/****************** IsValidShrunkData ******************/
		%feature("compactdefaultargs") IsValidShrunkData;
		%feature("autodoc", "Checks if the existing shrunk data of the pave block is still valid. the shrunk data may become invalid if e.g. the vertices of the pave block have been replaced with the new one with bigger tolerances, or the tolerances of the existing vertices have been increased.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
bool
") IsValidShrunkData;
		Standard_Boolean IsValidShrunkData(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** NbInterfTypes ******************/
		%feature("compactdefaultargs") NbInterfTypes;
		%feature("autodoc", "Returns the number of types of the interferences.

Returns
-------
int
") NbInterfTypes;
		static Standard_Integer NbInterfTypes();

		/****************** NbRanges ******************/
		%feature("compactdefaultargs") NbRanges;
		%feature("autodoc", "Selector returns the number of index ranges.

Returns
-------
int
") NbRanges;
		Standard_Integer NbRanges();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Selector returns the total number of shapes stored.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NbSourceShapes ******************/
		%feature("compactdefaultargs") NbSourceShapes;
		%feature("autodoc", "Selector returns the total number of source shapes stored.

Returns
-------
int
") NbSourceShapes;
		Standard_Integer NbSourceShapes();

		/****************** PaveBlocks ******************/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "Selector returns the pave blocks for the shape with index theindex.

Parameters
----------
theIndex: int

Returns
-------
BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks(const Standard_Integer theIndex);

		/****************** PaveBlocksPool ******************/
		%feature("compactdefaultargs") PaveBlocksPool;
		%feature("autodoc", "Selector returns the information about pave blocks on source edges.

Returns
-------
BOPDS_VectorOfListOfPaveBlock
") PaveBlocksPool;
		const BOPDS_VectorOfListOfPaveBlock & PaveBlocksPool();

		/****************** Paves ******************/
		%feature("compactdefaultargs") Paves;
		%feature("autodoc", "Fills thelp with sorted paves of the shape with index theindex.

Parameters
----------
theIndex: int
theLP: BOPDS_ListOfPave

Returns
-------
None
") Paves;
		void Paves(const Standard_Integer theIndex, BOPDS_ListOfPave & theLP);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Selector returns the index range 'i'.

Parameters
----------
theIndex: int

Returns
-------
BOPDS_IndexRange
") Range;
		const BOPDS_IndexRange & Range(const Standard_Integer theIndex);

		/****************** Rank ******************/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "Selector returns the rank of the shape of index 'i'.

Parameters
----------
theIndex: int

Returns
-------
int
") Rank;
		Standard_Integer Rank(const Standard_Integer theIndex);

		/****************** RealPaveBlock ******************/
		%feature("compactdefaultargs") RealPaveBlock;
		%feature("autodoc", "Selector returns the real first pave block.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
opencascade::handle<BOPDS_PaveBlock>
") RealPaveBlock;
		opencascade::handle<BOPDS_PaveBlock> RealPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** RefineFaceInfoIn ******************/
		%feature("compactdefaultargs") RefineFaceInfoIn;
		%feature("autodoc", "Removes any pave block from list of having in state if it has also the state on.

Returns
-------
None
") RefineFaceInfoIn;
		void RefineFaceInfoIn();

		/****************** RefineFaceInfoOn ******************/
		%feature("compactdefaultargs") RefineFaceInfoOn;
		%feature("autodoc", "Refine the state on for the all faces having state information //! ++.

Returns
-------
None
") RefineFaceInfoOn;
		void RefineFaceInfoOn();

		/****************** ReleasePaveBlocks ******************/
		%feature("compactdefaultargs") ReleasePaveBlocks;
		%feature("autodoc", "Clears information about paveblocks for the untouched edges.

Returns
-------
None
") ReleasePaveBlocks;
		void ReleasePaveBlocks();

		/****************** SetArguments ******************/
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "Modifier sets the arguments [thels] of an operation.

Parameters
----------
theLS: TopTools_ListOfShape

Returns
-------
None
") SetArguments;
		void SetArguments(const TopTools_ListOfShape & theLS);

		/****************** SetCommonBlock ******************/
		%feature("compactdefaultargs") SetCommonBlock;
		%feature("autodoc", "Modifier sets the common block <thecb>.

Parameters
----------
thePB: BOPDS_PaveBlock
theCB: BOPDS_CommonBlock

Returns
-------
None
") SetCommonBlock;
		void SetCommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB, const opencascade::handle<BOPDS_CommonBlock> & theCB);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Selector returns the shape with index theindex.

Parameters
----------
theIndex: int

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer theIndex);

		/****************** ShapeInfo ******************/
		%feature("compactdefaultargs") ShapeInfo;
		%feature("autodoc", "Selector returns the information about the shape with index theindex.

Parameters
----------
theIndex: int

Returns
-------
BOPDS_ShapeInfo
") ShapeInfo;
		const BOPDS_ShapeInfo & ShapeInfo(const Standard_Integer theIndex);

		/****************** ShapesSD ******************/
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "Selector returns the collection same domain shapes.

Returns
-------
TColStd_DataMapOfIntegerInteger
") ShapesSD;
		TColStd_DataMapOfIntegerInteger & ShapesSD();

		/****************** SharedEdges ******************/
		%feature("compactdefaultargs") SharedEdges;
		%feature("autodoc", "Returns the indices of edges that are shared for the faces with indices thef1, thef2 //! same domain shapes.

Parameters
----------
theF1: int
theF2: int
theLI: TColStd_ListOfInteger
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") SharedEdges;
		void SharedEdges(const Standard_Integer theF1, const Standard_Integer theF2, TColStd_ListOfInteger & theLI, const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** SubShapesOnIn ******************/
		%feature("compactdefaultargs") SubShapesOnIn;
		%feature("autodoc", "Returns information about on/in sub-shapes of the given faces. @param themvonin the indices of on/in vertices from both faces @param themvcommon the indices of common vertices for both faces @param thepbonin all on/in pave blocks from both faces @param thecommonpb the common pave blocks (that are shared by both faces).

Parameters
----------
theNF1: int
theNF2: int
theMVOnIn: TColStd_MapOfInteger
theMVCommon: TColStd_MapOfInteger
thePBOnIn: BOPDS_IndexedMapOfPaveBlock
theCommonPB: BOPDS_MapOfPaveBlock

Returns
-------
None
") SubShapesOnIn;
		void SubShapesOnIn(const Standard_Integer theNF1, const Standard_Integer theNF2, TColStd_MapOfInteger & theMVOnIn, TColStd_MapOfInteger & theMVCommon, BOPDS_IndexedMapOfPaveBlock & thePBOnIn, BOPDS_MapOfPaveBlock & theCommonPB);

		/****************** UpdateCommonBlock ******************/
		%feature("compactdefaultargs") UpdateCommonBlock;
		%feature("autodoc", "Update the common block thecb.

Parameters
----------
theCB: BOPDS_CommonBlock
theFuzz: float

Returns
-------
None
") UpdateCommonBlock;
		void UpdateCommonBlock(const opencascade::handle<BOPDS_CommonBlock> & theCB, const Standard_Real theFuzz);

		/****************** UpdateCommonBlockWithSDVertices ******************/
		%feature("compactdefaultargs") UpdateCommonBlockWithSDVertices;
		%feature("autodoc", "Update the pave block of the common block for all shapes in data structure.

Parameters
----------
theCB: BOPDS_CommonBlock

Returns
-------
None
") UpdateCommonBlockWithSDVertices;
		void UpdateCommonBlockWithSDVertices(const opencascade::handle<BOPDS_CommonBlock> & theCB);

		/****************** UpdateFaceInfoIn ******************/
		%feature("compactdefaultargs") UpdateFaceInfoIn;
		%feature("autodoc", "Update the state in of face with index theindex.

Parameters
----------
theIndex: int

Returns
-------
None
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn(const Standard_Integer theIndex);

		/****************** UpdateFaceInfoIn ******************/
		%feature("compactdefaultargs") UpdateFaceInfoIn;
		%feature("autodoc", "Update the state in for all faces in the given map.

Parameters
----------
theFaces: TColStd_MapOfInteger

Returns
-------
None
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn(const TColStd_MapOfInteger & theFaces);

		/****************** UpdateFaceInfoOn ******************/
		%feature("compactdefaultargs") UpdateFaceInfoOn;
		%feature("autodoc", "Update the state on of face with index theindex.

Parameters
----------
theIndex: int

Returns
-------
None
") UpdateFaceInfoOn;
		void UpdateFaceInfoOn(const Standard_Integer theIndex);

		/****************** UpdateFaceInfoOn ******************/
		%feature("compactdefaultargs") UpdateFaceInfoOn;
		%feature("autodoc", "Update the state on for all faces in the given map.

Parameters
----------
theFaces: TColStd_MapOfInteger

Returns
-------
None
") UpdateFaceInfoOn;
		void UpdateFaceInfoOn(const TColStd_MapOfInteger & theFaces);

		/****************** UpdatePaveBlock ******************/
		%feature("compactdefaultargs") UpdatePaveBlock;
		%feature("autodoc", "Update the pave block thepb.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
None
") UpdatePaveBlock;
		void UpdatePaveBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** UpdatePaveBlockWithSDVertices ******************/
		%feature("compactdefaultargs") UpdatePaveBlockWithSDVertices;
		%feature("autodoc", "Update the pave block for all shapes in data structure.

Parameters
----------
thePB: BOPDS_PaveBlock

Returns
-------
None
") UpdatePaveBlockWithSDVertices;
		void UpdatePaveBlockWithSDVertices(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****************** UpdatePaveBlocks ******************/
		%feature("compactdefaultargs") UpdatePaveBlocks;
		%feature("autodoc", "Update the pave blocks for the all shapes in data structure.

Returns
-------
None
") UpdatePaveBlocks;
		void UpdatePaveBlocks();

		/****************** UpdatePaveBlocksWithSDVertices ******************/
		%feature("compactdefaultargs") UpdatePaveBlocksWithSDVertices;
		%feature("autodoc", "Update the pave blocks for all shapes in data structure.

Returns
-------
None
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
		/****************** BOPDS_FaceInfo ******************/
		%feature("compactdefaultargs") BOPDS_FaceInfo;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo();

		/****************** BOPDS_FaceInfo ******************/
		%feature("compactdefaultargs") BOPDS_FaceInfo;
		%feature("autodoc", "Contructor theallocator - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** ChangePaveBlocksIn ******************/
		%feature("compactdefaultargs") ChangePaveBlocksIn;
		%feature("autodoc", "Selector/modifier returns the pave blocks of the face that have state in.

Returns
-------
BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksIn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksIn();

		/****************** ChangePaveBlocksOn ******************/
		%feature("compactdefaultargs") ChangePaveBlocksOn;
		%feature("autodoc", "Selector/modifier returns the pave blocks of the face that have state on.

Returns
-------
BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksOn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksOn();

		/****************** ChangePaveBlocksSc ******************/
		%feature("compactdefaultargs") ChangePaveBlocksSc;
		%feature("autodoc", "No available documentation.

Returns
-------
BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksSc;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksSc();

		/****************** ChangeVerticesIn ******************/
		%feature("compactdefaultargs") ChangeVerticesIn;
		%feature("autodoc", "Selector/modifier returns the list of indices for vertices of the face that have state in //! on.

Returns
-------
TColStd_MapOfInteger
") ChangeVerticesIn;
		TColStd_MapOfInteger & ChangeVerticesIn();

		/****************** ChangeVerticesOn ******************/
		%feature("compactdefaultargs") ChangeVerticesOn;
		%feature("autodoc", "Selector/modifier returns the list of indices for vertices of the face that have state on //! sections.

Returns
-------
TColStd_MapOfInteger
") ChangeVerticesOn;
		TColStd_MapOfInteger & ChangeVerticesOn();

		/****************** ChangeVerticesSc ******************/
		%feature("compactdefaultargs") ChangeVerticesSc;
		%feature("autodoc", "Selector/modifier returns the list of indices for section vertices of the face //! others.

Returns
-------
TColStd_MapOfInteger
") ChangeVerticesSc;
		TColStd_MapOfInteger & ChangeVerticesSc();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the contents.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Selector returns the index of the face //! in.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** PaveBlocksIn ******************/
		%feature("compactdefaultargs") PaveBlocksIn;
		%feature("autodoc", "Selector returns the pave blocks of the face that have state in.

Returns
-------
BOPDS_IndexedMapOfPaveBlock
") PaveBlocksIn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksIn();

		/****************** PaveBlocksOn ******************/
		%feature("compactdefaultargs") PaveBlocksOn;
		%feature("autodoc", "Selector returns the pave blocks of the face that have state on.

Returns
-------
BOPDS_IndexedMapOfPaveBlock
") PaveBlocksOn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksOn();

		/****************** PaveBlocksSc ******************/
		%feature("compactdefaultargs") PaveBlocksSc;
		%feature("autodoc", "Selector returns the pave blocks of the face that are pave blocks of section edges.

Returns
-------
BOPDS_IndexedMapOfPaveBlock
") PaveBlocksSc;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksSc();

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Modifier sets the index of the face <thei>.

Parameters
----------
theI: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer theI);

		/****************** VerticesIn ******************/
		%feature("compactdefaultargs") VerticesIn;
		%feature("autodoc", "Selector returns the list of indices for vertices of the face that have state in.

Returns
-------
TColStd_MapOfInteger
") VerticesIn;
		const TColStd_MapOfInteger & VerticesIn();

		/****************** VerticesOn ******************/
		%feature("compactdefaultargs") VerticesOn;
		%feature("autodoc", "Selector returns the list of indices for vertices of the face that have state on.

Returns
-------
TColStd_MapOfInteger
") VerticesOn;
		const TColStd_MapOfInteger & VerticesOn();

		/****************** VerticesSc ******************/
		%feature("compactdefaultargs") VerticesSc;
		%feature("autodoc", "Selector returns the list of indices for section vertices of the face.

Returns
-------
TColStd_MapOfInteger
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
		/****************** BOPDS_IndexRange ******************/
		%feature("compactdefaultargs") BOPDS_IndexRange;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_IndexRange;
		 BOPDS_IndexRange();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Query returns true if the range contains <theindex>.

Parameters
----------
theIndex: int

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const Standard_Integer theIndex);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Selector returns the first index of the range.

Returns
-------
int
") First;
		Standard_Integer First();

		/****************** Indices ******************/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "Selector returns the first index of the range <thei1> returns the second index of the range <thei2>.

Parameters
----------

Returns
-------
theI1: int
theI2: int
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Selector returns the second index of the range.

Returns
-------
int
") Last;
		Standard_Integer Last();

		/****************** SetFirst ******************/
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "Modifier sets the first index <thei1> of the range.

Parameters
----------
theI1: int

Returns
-------
None
") SetFirst;
		void SetFirst(const Standard_Integer theI1);

		/****************** SetIndices ******************/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "Modifier sets the first index of the range <thei1> sets the second index of the range <thei2>.

Parameters
----------
theI1: int
theI2: int

Returns
-------
None
") SetIndices;
		void SetIndices(const Standard_Integer theI1, const Standard_Integer theI2);

		/****************** SetLast ******************/
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "Modifier sets the second index <thei2> of the range.

Parameters
----------
theI2: int

Returns
-------
None
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
		/****************** BOPDS_Iterator ******************/
		%feature("compactdefaultargs") BOPDS_Iterator;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_Iterator;
		 BOPDS_Iterator();

		/****************** BOPDS_Iterator ******************/
		%feature("compactdefaultargs") BOPDS_Iterator;
		%feature("autodoc", "Contructor theallocator - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_Iterator;
		 BOPDS_Iterator(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** BlockLength ******************/
		%feature("compactdefaultargs") BlockLength;
		%feature("autodoc", "Returns the block length.

Returns
-------
int
") BlockLength;
		Standard_Integer BlockLength();

		/****************** DS ******************/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "Selector returns the data structure.

Returns
-------
BOPDS_DS
") DS;
		const BOPDS_DS & DS();

		/****************** ExpectedLength ******************/
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "Returns the number of intersections founded.

Returns
-------
int
") ExpectedLength;
		Standard_Integer ExpectedLength();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the iterator thetype1 - the first type of shape thetype2 - the second type of shape.

Parameters
----------
theType1: TopAbs_ShapeEnum
theType2: TopAbs_ShapeEnum

Returns
-------
None
") Initialize;
		void Initialize(const TopAbs_ShapeEnum theType1, const TopAbs_ShapeEnum theType2);

		/****************** IntersectExt ******************/
		%feature("compactdefaultargs") IntersectExt;
		%feature("autodoc", "Updates the tree of bounding boxes with increased boxes and intersects such elements with the tree.

Parameters
----------
theIndicies: TColStd_MapOfInteger

Returns
-------
None
") IntersectExt;
		void IntersectExt(const TColStd_MapOfInteger & theIndicies);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if still there are pairs of intersected shapes.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbExtInterfs ******************/
		%feature("compactdefaultargs") NbExtInterfs;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbExtInterfs;
		static Standard_Integer NbExtInterfs();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves iterations ahead.

Returns
-------
None
") Next;
		void Next();

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Perform the intersection algorithm and prepare the results to be used.

Parameters
----------
theCtx: IntTools_Context,optional
	default value is opencascade::handle<IntTools_Context>()
theCheckOBB: bool,optional
	default value is Standard_False
theFuzzyValue: float,optional
	default value is Precision::Confusion()

Returns
-------
None
") Prepare;
		virtual void Prepare(const opencascade::handle<IntTools_Context> & theCtx = opencascade::handle<IntTools_Context>(), const Standard_Boolean theCheckOBB = Standard_False, const Standard_Real theFuzzyValue = Precision::Confusion());

		/****************** RunParallel ******************/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "Returns the flag of parallel processing.

Returns
-------
bool
") RunParallel;
		Standard_Boolean RunParallel();

		/****************** SetDS ******************/
		%feature("compactdefaultargs") SetDS;
		%feature("autodoc", "Modifier sets the data structure <pds> to process.

Parameters
----------
pDS: BOPDS_PDS

Returns
-------
None
") SetDS;
		void SetDS(const BOPDS_PDS & pDS);

		/****************** SetRunParallel ******************/
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "Set the flag of parallel processing if <theflag> is true the parallel processing is switched on if <theflag> is false the parallel processing is switched off.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetRunParallel;
		void SetRunParallel(const Standard_Boolean theFlag);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns indices (ds) of intersected shapes theindex1 - the index of the first shape theindex2 - the index of the second shape.

Parameters
----------

Returns
-------
theIndex1: int
theIndex2: int
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
		/****************** BOPDS_Pair ******************/
		%feature("compactdefaultargs") BOPDS_Pair;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BOPDS_Pair;
		 BOPDS_Pair();

		/****************** BOPDS_Pair ******************/
		%feature("compactdefaultargs") BOPDS_Pair;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex1: int
theIndex2: int

Returns
-------
None
") BOPDS_Pair;
		 BOPDS_Pair(const Standard_Integer theIndex1, const Standard_Integer theIndex2);

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for this pair, in the range [1, theupperbound] @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
theUpperBound: int

Returns
-------
int
") HashCode;
		Standard_Integer HashCode(const Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** Indices ******************/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "Gets the indices.

Parameters
----------

Returns
-------
theIndex1: int
theIndex2: int
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the pair is equal to <the theother>.

Parameters
----------
theOther: BOPDS_Pair

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const BOPDS_Pair & theOther);

		/****************** SetIndices ******************/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "Sets the indices.

Parameters
----------
theIndex1: int
theIndex2: int

Returns
-------
None
") SetIndices;
		void SetIndices(const Standard_Integer theIndex1, const Standard_Integer theIndex2);

};


%extend BOPDS_Pair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPDS_PairMapHasher *
****************************/
class BOPDS_PairMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given pair, in the range [1, theupperbound] @param thepair the pair which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
thePair: BOPDS_Pair
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const BOPDS_Pair & thePair, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePair1: BOPDS_Pair
thePair2: BOPDS_Pair

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const BOPDS_Pair & thePair1, const BOPDS_Pair & thePair2);

};


%extend BOPDS_PairMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class BOPDS_Pave *
*******************/
class BOPDS_Pave {
	public:
		/****************** BOPDS_Pave ******************/
		%feature("compactdefaultargs") BOPDS_Pave;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_Pave;
		 BOPDS_Pave();

		/****************** Contents ******************/
		%feature("compactdefaultargs") Contents;
		%feature("autodoc", "Selector returns the index of vertex <theindex> returns the parameter of vertex <theparameter>.

Parameters
----------

Returns
-------
theIndex: int
theParameter: float
") Contents;
		void Contents(Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Selector returns the index of vertex.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Query returns true if thr parameter od this is equal to the parameter of <theother>.

Parameters
----------
theOther: BOPDS_Pave

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const BOPDS_Pave & theOther);

		/****************** IsLess ******************/
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "Query returns true if thr parameter od this is less than the parameter of <theother>.

Parameters
----------
theOther: BOPDS_Pave

Returns
-------
bool
") IsLess;
		Standard_Boolean IsLess(const BOPDS_Pave & theOther);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Selector returns the parameter of vertex.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Modifier sets the index of vertex <theindex>.

Parameters
----------
theIndex: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Modifier sets the parameter of vertex <theparameter>.

Parameters
----------
theParameter: float

Returns
-------
None
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
		/****************** BOPDS_PaveBlock ******************/
		%feature("compactdefaultargs") BOPDS_PaveBlock;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock();

		/****************** BOPDS_PaveBlock ******************/
		%feature("compactdefaultargs") BOPDS_PaveBlock;
		%feature("autodoc", "Contructor <theallocator> - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** AppendExtPave ******************/
		%feature("compactdefaultargs") AppendExtPave;
		%feature("autodoc", "Modifier appends extra paves <thepave>.

Parameters
----------
thePave: BOPDS_Pave

Returns
-------
None
") AppendExtPave;
		void AppendExtPave(const BOPDS_Pave & thePave);

		/****************** AppendExtPave1 ******************/
		%feature("compactdefaultargs") AppendExtPave1;
		%feature("autodoc", "Modifier appends extra pave <thepave>.

Parameters
----------
thePave: BOPDS_Pave

Returns
-------
None
") AppendExtPave1;
		void AppendExtPave1(const BOPDS_Pave & thePave);

		/****************** ChangeExtPaves ******************/
		%feature("compactdefaultargs") ChangeExtPaves;
		%feature("autodoc", "Selector / modifier returns the extra paves.

Returns
-------
BOPDS_ListOfPave
") ChangeExtPaves;
		BOPDS_ListOfPave & ChangeExtPaves();

		/****************** ContainsParameter ******************/
		%feature("compactdefaultargs") ContainsParameter;
		%feature("autodoc", "Query returns true if the extra paves contain the pave with given value of the parameter <theprm> <thetol> - the value of the tolerance to compare <theind> - index of the found pave.

Parameters
----------
thePrm: float
theTol: float

Returns
-------
theInd: int
") ContainsParameter;
		Standard_Boolean ContainsParameter(const Standard_Real thePrm, const Standard_Real theTol, Standard_Integer &OutValue);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Selector returns the index of edge of pave block.

Returns
-------
int
") Edge;
		Standard_Integer Edge();

		/****************** ExtPaves ******************/
		%feature("compactdefaultargs") ExtPaves;
		%feature("autodoc", "Selector returns the extra paves.

Returns
-------
BOPDS_ListOfPave
") ExtPaves;
		const BOPDS_ListOfPave & ExtPaves();

		/****************** HasEdge ******************/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Query returns true if the pave block has edge.

Returns
-------
bool
") HasEdge;
		Standard_Boolean HasEdge();

		/****************** HasEdge ******************/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Query returns true if the pave block has edge returns the index of edge <theedge>.

Parameters
----------

Returns
-------
theEdge: int
") HasEdge;
		Standard_Boolean HasEdge(Standard_Integer &OutValue);

		/****************** HasSameBounds ******************/
		%feature("compactdefaultargs") HasSameBounds;
		%feature("autodoc", "Query returns true if the pave block has pave indices that equal to the pave indices of the pave block <theother>.

Parameters
----------
theOther: BOPDS_PaveBlock

Returns
-------
bool
") HasSameBounds;
		Standard_Boolean HasSameBounds(const opencascade::handle<BOPDS_PaveBlock> & theOther);

		/****************** HasShrunkData ******************/
		%feature("compactdefaultargs") HasShrunkData;
		%feature("autodoc", "Query returns true if the pave block contains the shrunk data.

Returns
-------
bool
") HasShrunkData;
		Standard_Boolean HasShrunkData();

		/****************** Indices ******************/
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "Selector returns the pave indices <theindex1,theindex2> of the pave block.

Parameters
----------

Returns
-------
theIndex1: int
theIndex2: int
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsSplitEdge ******************/
		%feature("compactdefaultargs") IsSplitEdge;
		%feature("autodoc", "Query returns true if the edge is equal to the original edge of the pave block.

Returns
-------
bool
") IsSplitEdge;
		Standard_Boolean IsSplitEdge();

		/****************** IsSplittable ******************/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "Query returns false if the pave block has a too short shrunk range and cannot be split, otherwise returns true.

Returns
-------
bool
") IsSplittable;
		Standard_Boolean IsSplittable();

		/****************** IsToUpdate ******************/
		%feature("compactdefaultargs") IsToUpdate;
		%feature("autodoc", "Query returns true if the pave block contains extra paves.

Returns
-------
bool
") IsToUpdate;
		Standard_Boolean IsToUpdate();

		/****************** OriginalEdge ******************/
		%feature("compactdefaultargs") OriginalEdge;
		%feature("autodoc", "Selector returns the index of original edge of pave block.

Returns
-------
int
") OriginalEdge;
		Standard_Integer OriginalEdge();

		/****************** Pave1 ******************/
		%feature("compactdefaultargs") Pave1;
		%feature("autodoc", "Selector returns the first pave.

Returns
-------
BOPDS_Pave
") Pave1;
		const BOPDS_Pave & Pave1();

		/****************** Pave2 ******************/
		%feature("compactdefaultargs") Pave2;
		%feature("autodoc", "Selector returns the second pave.

Returns
-------
BOPDS_Pave
") Pave2;
		const BOPDS_Pave & Pave2();

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Selector returns the parametric range <thet1,thet2> of the pave block.

Parameters
----------

Returns
-------
theT1: float
theT2: float
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** RemoveExtPave ******************/
		%feature("compactdefaultargs") RemoveExtPave;
		%feature("autodoc", "Modifier removes a pave with the given vertex number from extra paves.

Parameters
----------
theVertNum: int

Returns
-------
None
") RemoveExtPave;
		void RemoveExtPave(const Standard_Integer theVertNum);

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "Modifier sets the index of edge of pave block <theedge>.

Parameters
----------
theEdge: int

Returns
-------
None
") SetEdge;
		void SetEdge(const Standard_Integer theEdge);

		/****************** SetOriginalEdge ******************/
		%feature("compactdefaultargs") SetOriginalEdge;
		%feature("autodoc", "Modifier sets the index of original edge of the pave block <theedge>.

Parameters
----------
theEdge: int

Returns
-------
None
") SetOriginalEdge;
		void SetOriginalEdge(const Standard_Integer theEdge);

		/****************** SetPave1 ******************/
		%feature("compactdefaultargs") SetPave1;
		%feature("autodoc", "Modifier sets the first pave <thepave>.

Parameters
----------
thePave: BOPDS_Pave

Returns
-------
None
") SetPave1;
		void SetPave1(const BOPDS_Pave & thePave);

		/****************** SetPave2 ******************/
		%feature("compactdefaultargs") SetPave2;
		%feature("autodoc", "Modifier sets the second pave <thepave>.

Parameters
----------
thePave: BOPDS_Pave

Returns
-------
None
") SetPave2;
		void SetPave2(const BOPDS_Pave & thePave);

		/****************** SetShrunkData ******************/
		%feature("compactdefaultargs") SetShrunkData;
		%feature("autodoc", "Modifier sets the shrunk data for the pave block <thets1>, <thets2> - shrunk range <thebox> - the bounding box <theissplittable> - defines whether the edge can be split.

Parameters
----------
theTS1: float
theTS2: float
theBox: Bnd_Box
theIsSplittable: bool

Returns
-------
None
") SetShrunkData;
		void SetShrunkData(const Standard_Real theTS1, const Standard_Real theTS2, const Bnd_Box & theBox, const Standard_Boolean theIsSplittable);

		/****************** ShrunkData ******************/
		%feature("compactdefaultargs") ShrunkData;
		%feature("autodoc", "Selector returns the shrunk data for the pave block <thets1>, <thets2> - shrunk range <thebox> - the bounding box <theissplittable> - defines whether the edge can be split.

Parameters
----------
theBox: Bnd_Box

Returns
-------
theTS1: float
theTS2: float
theIsSplittable: bool
") ShrunkData;
		void ShrunkData(Standard_Real &OutValue, Standard_Real &OutValue, Bnd_Box & theBox, Standard_Boolean &OutValue);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Modifier updates the pave block. the extra paves are used to create new pave blocks <thelpb>. <theflag> - if true, the first pave and the second pave are used to produce new pave blocks.

Parameters
----------
theLPB: BOPDS_ListOfPaveBlock
theFlag: bool,optional
	default value is Standard_True

Returns
-------
None
") Update;
		void Update(BOPDS_ListOfPaveBlock & theLPB, const Standard_Boolean theFlag = Standard_True);

};


%make_alias(BOPDS_PaveBlock)

%extend BOPDS_PaveBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BOPDS_PaveMapHasher *
****************************/
class BOPDS_PaveMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given pave, in the range [1, theupperbound] @param thepave the pave which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

Parameters
----------
thePave: BOPDS_Pave
theUpperBound: int

Returns
-------
int
") HashCode;
		static Standard_Integer HashCode(const BOPDS_Pave & thePave, Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPave1: BOPDS_Pave
aPave2: BOPDS_Pave

Returns
-------
bool
") IsEqual;
		static Standard_Boolean IsEqual(const BOPDS_Pave & aPave1, const BOPDS_Pave & aPave2);

};


%extend BOPDS_PaveMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class BOPDS_Point *
********************/
class BOPDS_Point {
	public:
		/****************** BOPDS_Point ******************/
		%feature("compactdefaultargs") BOPDS_Point;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_Point;
		 BOPDS_Point();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Selector returns index of the vertex.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Selector returns 3d point.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** Pnt2D1 ******************/
		%feature("compactdefaultargs") Pnt2D1;
		%feature("autodoc", "Selector returns 2d point on the first face <thepnt>.

Returns
-------
gp_Pnt2d
") Pnt2D1;
		const gp_Pnt2d Pnt2D1();

		/****************** Pnt2D2 ******************/
		%feature("compactdefaultargs") Pnt2D2;
		%feature("autodoc", "Selector returns 2d point on the second face <thepnt>.

Returns
-------
gp_Pnt2d
") Pnt2D2;
		const gp_Pnt2d Pnt2D2();

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Modifier sets the index of the vertex <theindex>.

Parameters
----------
theIndex: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "Modifier sets 3d point <thepnt>.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") SetPnt;
		void SetPnt(const gp_Pnt & thePnt);

		/****************** SetPnt2D1 ******************/
		%feature("compactdefaultargs") SetPnt2D1;
		%feature("autodoc", "Modifier sets 2d point on the first face <thepnt>.

Parameters
----------
thePnt: gp_Pnt2d

Returns
-------
None
") SetPnt2D1;
		void SetPnt2D1(const gp_Pnt2d & thePnt);

		/****************** SetPnt2D2 ******************/
		%feature("compactdefaultargs") SetPnt2D2;
		%feature("autodoc", "Modifier sets 2d point on the second face <thepnt>.

Parameters
----------
thePnt: gp_Pnt2d

Returns
-------
None
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
		/****************** BOPDS_ShapeInfo ******************/
		%feature("compactdefaultargs") BOPDS_ShapeInfo;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo();

		/****************** BOPDS_ShapeInfo ******************/
		%feature("compactdefaultargs") BOPDS_ShapeInfo;
		%feature("autodoc", "Contructor theallocator - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Selector returns the boundung box of the shape.

Returns
-------
Bnd_Box
") Box;
		const Bnd_Box & Box();

		/****************** ChangeBox ******************/
		%feature("compactdefaultargs") ChangeBox;
		%feature("autodoc", "Selector/modifier returns the boundung box of the shape.

Returns
-------
Bnd_Box
") ChangeBox;
		Bnd_Box & ChangeBox();

		/****************** ChangeSubShapes ******************/
		%feature("compactdefaultargs") ChangeSubShapes;
		%feature("autodoc", "Selector/ modifier returns the list of indices of sub-shapes.

Returns
-------
TColStd_ListOfInteger
") ChangeSubShapes;
		TColStd_ListOfInteger & ChangeSubShapes();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Flag ******************/
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "Returns the flag.

Returns
-------
int
") Flag;
		Standard_Integer Flag();

		/****************** HasBRep ******************/
		%feature("compactdefaultargs") HasBRep;
		%feature("autodoc", "Query returns true if the shape has boundary representation.

Returns
-------
bool
") HasBRep;
		Standard_Boolean HasBRep();

		/****************** HasFlag ******************/
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "Query returns true if there is flag.

Returns
-------
bool
") HasFlag;
		Standard_Boolean HasFlag();

		/****************** HasFlag ******************/
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "Query returns true if there is flag. returns the the flag theflag.

Parameters
----------

Returns
-------
theFlag: int
") HasFlag;
		Standard_Boolean HasFlag(Standard_Integer &OutValue);

		/****************** HasReference ******************/
		%feature("compactdefaultargs") HasReference;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasReference;
		Standard_Boolean HasReference();

		/****************** HasSubShape ******************/
		%feature("compactdefaultargs") HasSubShape;
		%feature("autodoc", "Query returns true if the shape has sub-shape with index thei.

Parameters
----------
theI: int

Returns
-------
bool
") HasSubShape;
		Standard_Boolean HasSubShape(const Standard_Integer theI);

		/****************** IsInterfering ******************/
		%feature("compactdefaultargs") IsInterfering;
		%feature("autodoc", "Returns true if the shape can be participant of an interference //! flag.

Returns
-------
bool
") IsInterfering;
		Standard_Boolean IsInterfering();

		/****************** Reference ******************/
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", "Selector returns the index of a reference information.

Returns
-------
int
") Reference;
		Standard_Integer Reference();

		/****************** SetBox ******************/
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "Modifier sets the boundung box of the shape thebox.

Parameters
----------
theBox: Bnd_Box

Returns
-------
None
") SetBox;
		void SetBox(const Bnd_Box & theBox);

		/****************** SetFlag ******************/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "Modifier sets the flag.

Parameters
----------
theI: int

Returns
-------
None
") SetFlag;
		void SetFlag(const Standard_Integer theI);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "Modifier sets the index of a reference information.

Parameters
----------
theI: int

Returns
-------
None
") SetReference;
		void SetReference(const Standard_Integer theI);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "Modifier sets the shape <thes>.

Parameters
----------
theS: TopoDS_Shape

Returns
-------
None
") SetShape;
		void SetShape(const TopoDS_Shape & theS);

		/****************** SetShapeType ******************/
		%feature("compactdefaultargs") SetShapeType;
		%feature("autodoc", "Modifier sets the type of shape thetype.

Parameters
----------
theType: TopAbs_ShapeEnum

Returns
-------
None
") SetShapeType;
		void SetShapeType(const TopAbs_ShapeEnum theType);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Selector returns the shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Selector returns the type of shape.

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** SubShapes ******************/
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "Selector returns the list of indices of sub-shapes.

Returns
-------
TColStd_ListOfInteger
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
		/****************** BOPDS_SubIterator ******************/
		%feature("compactdefaultargs") BOPDS_SubIterator;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") BOPDS_SubIterator;
		 BOPDS_SubIterator();

		/****************** BOPDS_SubIterator ******************/
		%feature("compactdefaultargs") BOPDS_SubIterator;
		%feature("autodoc", "Constructor theallocator - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_SubIterator;
		 BOPDS_SubIterator(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** DS ******************/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "Returns the data structure.

Returns
-------
BOPDS_DS
") DS;
		const BOPDS_DS & DS();

		/****************** ExpectedLength ******************/
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "Returns the number of interfering pairs.

Returns
-------
int
") ExpectedLength;
		Standard_Integer ExpectedLength();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the iterator.

Returns
-------
None
") Initialize;
		void Initialize();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more pairs of intersected shapes.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves iterations ahead.

Returns
-------
None
") Next;
		void Next();

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Perform the intersection algorithm and prepare the results to be used.

Returns
-------
None
") Prepare;
		virtual void Prepare();

		/****************** SetDS ******************/
		%feature("compactdefaultargs") SetDS;
		%feature("autodoc", "Sets the data structure <pds> to process. it is used to access the shapes and their bounding boxes.

Parameters
----------
pDS: BOPDS_PDS

Returns
-------
None
") SetDS;
		void SetDS(const BOPDS_PDS & pDS);

		/****************** SetSubSet1 ******************/
		%feature("compactdefaultargs") SetSubSet1;
		%feature("autodoc", "Sets the first set of indices <theli> to process.

Parameters
----------
theLI: TColStd_ListOfInteger

Returns
-------
None
") SetSubSet1;
		void SetSubSet1(const TColStd_ListOfInteger & theLI);

		/****************** SetSubSet2 ******************/
		%feature("compactdefaultargs") SetSubSet2;
		%feature("autodoc", "Sets the second set of indices <theli> to process.

Parameters
----------
theLI: TColStd_ListOfInteger

Returns
-------
None
") SetSubSet2;
		void SetSubSet2(const TColStd_ListOfInteger & theLI);

		/****************** SubSet1 ******************/
		%feature("compactdefaultargs") SubSet1;
		%feature("autodoc", "Returns the first set of indices to process.

Returns
-------
TColStd_ListOfInteger
") SubSet1;
		const TColStd_ListOfInteger & SubSet1();

		/****************** SubSet2 ******************/
		%feature("compactdefaultargs") SubSet2;
		%feature("autodoc", "Returns the second set of indices to process.

Returns
-------
TColStd_ListOfInteger
") SubSet2;
		const TColStd_ListOfInteger & SubSet2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns indices (ds) of intersected shapes theindex1 - the index of the first shape theindex2 - the index of the second shape.

Parameters
----------

Returns
-------
theIndex1: int
theIndex2: int
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
		/****************** HasBRep ******************/
		%feature("compactdefaultargs") HasBRep;
		%feature("autodoc", "Returns true if the type <thet> correspond to a shape having boundary representation.

Parameters
----------
theT: TopAbs_ShapeEnum

Returns
-------
bool
") HasBRep;
		static Standard_Boolean HasBRep(const TopAbs_ShapeEnum theT);

		/****************** IsInterfering ******************/
		%feature("compactdefaultargs") IsInterfering;
		%feature("autodoc", "Returns true if the type <thet> can be participant of an interference.

Parameters
----------
theT: TopAbs_ShapeEnum

Returns
-------
bool
") IsInterfering;
		static Standard_Boolean IsInterfering(const TopAbs_ShapeEnum theT);

		/****************** TypeToInteger ******************/
		%feature("compactdefaultargs") TypeToInteger;
		%feature("autodoc", "Converts the conmbination of two types of shape <thet1>,<thet2> to the one integer value, that is returned.

Parameters
----------
theT1: TopAbs_ShapeEnum
theT2: TopAbs_ShapeEnum

Returns
-------
int
") TypeToInteger;
		static Standard_Integer TypeToInteger(const TopAbs_ShapeEnum theT1, const TopAbs_ShapeEnum theT2);

		/****************** TypeToInteger ******************/
		%feature("compactdefaultargs") TypeToInteger;
		%feature("autodoc", "Converts the type of shape <thet>, to integer value, that is returned.

Parameters
----------
theT: TopAbs_ShapeEnum

Returns
-------
int
") TypeToInteger;
		static Standard_Integer TypeToInteger(const TopAbs_ShapeEnum theT);

};


%extend BOPDS_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BOPDS_InterfEE *
***********************/
class BOPDS_InterfEE : public BOPDS_Interf {
	public:
		/****************** BOPDS_InterfEE ******************/
		%feature("compactdefaultargs") BOPDS_InterfEE;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfEE;
		 BOPDS_InterfEE();

		/****************** BOPDS_InterfEE ******************/
		%feature("compactdefaultargs") BOPDS_InterfEE;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_InterfEE;
		 BOPDS_InterfEE(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** CommonPart ******************/
		%feature("compactdefaultargs") CommonPart;
		%feature("autodoc", "/** * selector * returns the info of common part * returns * common part */.

Returns
-------
IntTools_CommonPrt
") CommonPart;
		const IntTools_CommonPrt & CommonPart();

		/****************** SetCommonPart ******************/
		%feature("compactdefaultargs") SetCommonPart;
		%feature("autodoc", "/** * modifier * sets the info of common part * @param thecp * common part */.

Parameters
----------
theCP: IntTools_CommonPrt

Returns
-------
None
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
		/****************** BOPDS_InterfEF ******************/
		%feature("compactdefaultargs") BOPDS_InterfEF;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfEF;
		 BOPDS_InterfEF();

		/****************** BOPDS_InterfEF ******************/
		%feature("compactdefaultargs") BOPDS_InterfEF;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_InterfEF;
		 BOPDS_InterfEF(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** CommonPart ******************/
		%feature("compactdefaultargs") CommonPart;
		%feature("autodoc", "/** * selector * returns the info of common part * returns * common part */.

Returns
-------
IntTools_CommonPrt
") CommonPart;
		const IntTools_CommonPrt & CommonPart();

		/****************** SetCommonPart ******************/
		%feature("compactdefaultargs") SetCommonPart;
		%feature("autodoc", "/** * modifier * sets the info of common part * @param thecp * common part */.

Parameters
----------
theCP: IntTools_CommonPrt

Returns
-------
None
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
		/****************** BOPDS_InterfEZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfEZ;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfEZ;
		 BOPDS_InterfEZ();

		/****************** BOPDS_InterfEZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfEZ;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
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
		/****************** BOPDS_InterfFF ******************/
		%feature("compactdefaultargs") BOPDS_InterfFF;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfFF;
		 BOPDS_InterfFF();

		/****************** ChangeCurves ******************/
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", "/** * selector/modifier * returns the intersection curves * returns * intersection curves */.

Returns
-------
BOPDS_VectorOfCurve
") ChangeCurves;
		BOPDS_VectorOfCurve & ChangeCurves();

		/****************** ChangePoints ******************/
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", "/** * selector/modifier * returns the intersection points * returns * intersection points */.

Returns
-------
BOPDS_VectorOfPoint
") ChangePoints;
		BOPDS_VectorOfPoint & ChangePoints();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "/** * selector * returns the intersection curves * returns * intersection curves */.

Returns
-------
BOPDS_VectorOfCurve
") Curves;
		const BOPDS_VectorOfCurve & Curves();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNbCurves: int
theNbPoints: int

Returns
-------
None
") Init;
		void Init(const Standard_Integer theNbCurves, const Standard_Integer theNbPoints);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "/** * selector * returns the intersection points * returns * intersection points */.

Returns
-------
BOPDS_VectorOfPoint
") Points;
		const BOPDS_VectorOfPoint & Points();

		/****************** SetTangentFaces ******************/
		%feature("compactdefaultargs") SetTangentFaces;
		%feature("autodoc", "/** * modifier * sets the flag of whether the faces are tangent * @param theflag * the flag */.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetTangentFaces;
		void SetTangentFaces(const Standard_Boolean theFlag);

		/****************** TangentFaces ******************/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "/** * selector * returns the flag whether the faces are tangent * returns * the flag */.

Returns
-------
bool
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
		/****************** BOPDS_InterfFZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfFZ;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfFZ;
		 BOPDS_InterfFZ();

		/****************** BOPDS_InterfFZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfFZ;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
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
		/****************** BOPDS_InterfVE ******************/
		%feature("compactdefaultargs") BOPDS_InterfVE;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfVE;
		 BOPDS_InterfVE();

		/****************** BOPDS_InterfVE ******************/
		%feature("compactdefaultargs") BOPDS_InterfVE;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_InterfVE;
		 BOPDS_InterfVE(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "/** * selector * returrns the value of parameter * of the point of the vertex * on the curve of the edge * returns * value of parameter */.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "/** * modifier * sets the value of parameter * of the point of the vertex * on the curve of the edge * @param thet * value of parameter */.

Parameters
----------
theT: float

Returns
-------
None
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
		/****************** BOPDS_InterfVF ******************/
		%feature("compactdefaultargs") BOPDS_InterfVF;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfVF;
		 BOPDS_InterfVF();

		/****************** BOPDS_InterfVF ******************/
		%feature("compactdefaultargs") BOPDS_InterfVF;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_InterfVF;
		 BOPDS_InterfVF(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** SetUV ******************/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "/** * modifier * sets the value of parameters * of the point of the vertex * on the surface of of the face * @param theu * value of u parameter * @param thev * value of u parameter */.

Parameters
----------
theU: float
theV: float

Returns
-------
None
") SetUV;
		void SetUV(const Standard_Real theU, const Standard_Real theV);

		/****************** UV ******************/
		%feature("compactdefaultargs") UV;
		%feature("autodoc", "/** * selector * returns the value of parameters * of the point of the vertex * on the surface of of the face * @param theu * value of u parameter * @param thev * value of u parameter */.

Parameters
----------

Returns
-------
theU: float
theV: float
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
		/****************** BOPDS_InterfVV ******************/
		%feature("compactdefaultargs") BOPDS_InterfVV;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfVV;
		 BOPDS_InterfVV();

		/****************** BOPDS_InterfVV ******************/
		%feature("compactdefaultargs") BOPDS_InterfVV;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
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
		/****************** BOPDS_InterfVZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfVZ;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfVZ;
		 BOPDS_InterfVZ();

		/****************** BOPDS_InterfVZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfVZ;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
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
		/****************** BOPDS_InterfZZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfZZ;
		%feature("autodoc", "/** * constructor */.

Returns
-------
None
") BOPDS_InterfZZ;
		 BOPDS_InterfZZ();

		/****************** BOPDS_InterfZZ ******************/
		%feature("compactdefaultargs") BOPDS_InterfZZ;
		%feature("autodoc", "/** * constructor * @param theallocator * allocator to manage the memory */.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
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
		/****************** BOPDS_IteratorSI ******************/
		%feature("compactdefaultargs") BOPDS_IteratorSI;
		%feature("autodoc", "Empty contructor.

Returns
-------
None
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI();

		/****************** BOPDS_IteratorSI ******************/
		%feature("compactdefaultargs") BOPDS_IteratorSI;
		%feature("autodoc", "Contructor theallocator - the allocator to manage the memory.

Parameters
----------
theAllocator: NCollection_BaseAllocator

Returns
-------
None
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** UpdateByLevelOfCheck ******************/
		%feature("compactdefaultargs") UpdateByLevelOfCheck;
		%feature("autodoc", "Updates the lists of possible intersections according to the value of <thelevel>. it defines which interferferences will be checked: 0 - only v/v; 1 - v/v and v/e; 2 - v/v, v/e and e/e; 3 - v/v, v/e, e/e and v/f; 4 - v/v, v/e, e/e, v/f and e/f; other - all interferences.

Parameters
----------
theLevel: int

Returns
-------
None
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
