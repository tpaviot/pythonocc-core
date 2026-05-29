/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bopds.html"
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
%ignore NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>::Items;
%ignore NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>::KeyValues;
%template(BOPDS_DataMapOfPaveBlockListOfInteger) NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>;
%ignore NCollection_DataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>::KeyValues;
%template(BOPDS_DataMapOfShapeCoupleOfPaveBlocks) NCollection_DataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>::Items;
%ignore NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>::KeyValues;
%ignore NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>::IndexedItems;
%ignore NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>::Contained;
%template(BOPDS_IndexedDataMapOfPaveBlockListOfInteger) NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>,TColStd_ListOfInteger>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>::Contained;
%template(BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks) NCollection_IndexedDataMap<TopoDS_Shape,BOPDS_CoupleOfPaveBlocks,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>::Items;
%ignore NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>::KeyValues;
%ignore NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>::IndexedItems;
%ignore NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>::Contained;
%template(BOPDS_IndexedMapOfPaveBlock) NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>;
%template(BOPDS_ListIteratorOfListOfPave) NCollection_TListIterator<BOPDS_Pave>;
%template(BOPDS_ListOfPave) NCollection_List<BOPDS_Pave>;

%extend NCollection_List<BOPDS_Pave> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = BOPDS_ListIteratorOfListOfPave(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(BOPDS_MapOfCommonBlock) NCollection_Map<opencascade::handle<BOPDS_CommonBlock>>;
%template(BOPDS_MapOfPair) NCollection_Map<BOPDS_Pair>;
%template(BOPDS_MapOfPave) NCollection_Map<BOPDS_Pave>;
%template(BOPDS_MapOfPaveBlock) NCollection_Map<opencascade::handle<BOPDS_PaveBlock>>;
%template(BOPDS_VectorOfCurve) NCollection_DynamicArray<BOPDS_Curve>;
%template(BOPDS_VectorOfFaceInfo) NCollection_DynamicArray<BOPDS_FaceInfo>;
%template(BOPDS_VectorOfIndexRange) NCollection_DynamicArray<BOPDS_IndexRange>;
%template(BOPDS_VectorOfInterfEE) NCollection_DynamicArray<BOPDS_InterfEE>;
%template(BOPDS_VectorOfInterfEF) NCollection_DynamicArray<BOPDS_InterfEF>;
%template(BOPDS_VectorOfInterfEZ) NCollection_DynamicArray<BOPDS_InterfEZ>;
%template(BOPDS_VectorOfInterfFF) NCollection_DynamicArray<BOPDS_InterfFF>;
%template(BOPDS_VectorOfInterfFZ) NCollection_DynamicArray<BOPDS_InterfFZ>;
%template(BOPDS_VectorOfInterfVE) NCollection_DynamicArray<BOPDS_InterfVE>;
%template(BOPDS_VectorOfInterfVF) NCollection_DynamicArray<BOPDS_InterfVF>;
%template(BOPDS_VectorOfInterfVV) NCollection_DynamicArray<BOPDS_InterfVV>;
%template(BOPDS_VectorOfInterfVZ) NCollection_DynamicArray<BOPDS_InterfVZ>;
%template(BOPDS_VectorOfInterfZZ) NCollection_DynamicArray<BOPDS_InterfZZ>;
%template(BOPDS_VectorOfPair) NCollection_DynamicArray<BOPDS_Pair>;
%template(BOPDS_VectorOfPave) NCollection_Array1<BOPDS_Pave>;
Array1ExtendIter(BOPDS_Pave)

%template(BOPDS_VectorOfPoint) NCollection_DynamicArray<BOPDS_Point>;
%template(BOPDS_VectorOfShapeInfo) NCollection_DynamicArray<BOPDS_ShapeInfo>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>, opencascade::handle<BOPDS_CommonBlock>>::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockCommonBlock;
typedef NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger>::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfInteger;
typedef NCollection_DataMap<TopoDS_Shape, BOPDS_CoupleOfPaveBlocks, TopTools_ShapeMapHasher>::Iterator BOPDS_DataMapIteratorOfDataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_DataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger> BOPDS_DataMapOfPaveBlockListOfInteger;
typedef NCollection_DataMap<TopoDS_Shape, BOPDS_CoupleOfPaveBlocks, TopTools_ShapeMapHasher> BOPDS_DataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_IndexedDataMap<opencascade::handle<BOPDS_PaveBlock>, TColStd_ListOfInteger> BOPDS_IndexedDataMapOfPaveBlockListOfInteger;
typedef NCollection_IndexedDataMap<TopoDS_Shape, BOPDS_CoupleOfPaveBlocks, TopTools_ShapeMapHasher> BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> BOPDS_IndexedMapOfPaveBlock;
typedef NCollection_List<BOPDS_Pave>::Iterator BOPDS_ListIteratorOfListOfPave;
typedef NCollection_List<BOPDS_Pave> BOPDS_ListOfPave;
typedef NCollection_Map<opencascade::handle<BOPDS_CommonBlock>>::Iterator BOPDS_MapIteratorOfMapOfCommonBlock;
typedef NCollection_Map<BOPDS_Pair>::Iterator BOPDS_MapIteratorOfMapOfPair;
typedef NCollection_Map<BOPDS_Pave>::Iterator BOPDS_MapIteratorOfMapOfPave;
typedef NCollection_Map<opencascade::handle<BOPDS_PaveBlock>>::Iterator BOPDS_MapIteratorOfMapOfPaveBlock;
typedef NCollection_Map<opencascade::handle<BOPDS_CommonBlock>> BOPDS_MapOfCommonBlock;
typedef NCollection_Map<BOPDS_Pair> BOPDS_MapOfPair;
typedef NCollection_Map<BOPDS_Pave> BOPDS_MapOfPave;
typedef NCollection_Map<opencascade::handle<BOPDS_PaveBlock>> BOPDS_MapOfPaveBlock;
typedef NCollection_DynamicArray<BOPDS_Curve> BOPDS_VectorOfCurve;
typedef NCollection_DynamicArray<BOPDS_FaceInfo> BOPDS_VectorOfFaceInfo;
typedef NCollection_DynamicArray<BOPDS_IndexRange> BOPDS_VectorOfIndexRange;
typedef NCollection_DynamicArray<BOPDS_InterfEE> BOPDS_VectorOfInterfEE;
typedef NCollection_DynamicArray<BOPDS_InterfEF> BOPDS_VectorOfInterfEF;
typedef NCollection_DynamicArray<BOPDS_InterfEZ> BOPDS_VectorOfInterfEZ;
typedef NCollection_DynamicArray<BOPDS_InterfFF> BOPDS_VectorOfInterfFF;
typedef NCollection_DynamicArray<BOPDS_InterfFZ> BOPDS_VectorOfInterfFZ;
typedef NCollection_DynamicArray<BOPDS_InterfVE> BOPDS_VectorOfInterfVE;
typedef NCollection_DynamicArray<BOPDS_InterfVF> BOPDS_VectorOfInterfVF;
typedef NCollection_DynamicArray<BOPDS_InterfVV> BOPDS_VectorOfInterfVV;
typedef NCollection_DynamicArray<BOPDS_InterfVZ> BOPDS_VectorOfInterfVZ;
typedef NCollection_DynamicArray<BOPDS_InterfZZ> BOPDS_VectorOfInterfZZ;
typedef NCollection_DynamicArray<BOPDS_Pair> BOPDS_VectorOfPair;
typedef NCollection_Array1<BOPDS_Pave> BOPDS_VectorOfPave;
typedef NCollection_DynamicArray<BOPDS_Point> BOPDS_VectorOfPoint;
typedef NCollection_DynamicArray<BOPDS_ShapeInfo> BOPDS_VectorOfShapeInfo;
typedef NCollection_DynamicArray<BOPDS_VectorOfPair> BOPDS_VectorOfVectorOfPair;
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
Constructor 
Parameter theAllocator the allocator to manage the memory.
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_CommonBlock::AddFace ******/
		/****** md5 signature: 0c7f95de257d86018c7a48694633a3f7 ******/
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
Modifier Adds the index of the face <aF> to the list of indices of faces of the common block.
") AddFace;
		void AddFace(const int aF);

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
Modifier Adds the pave block <aPB> to the list of pave blocks of the common block.
") AddPaveBlock;
		void AddPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & aPB);

		/****** BOPDS_CommonBlock::AppendFaces ******/
		/****** md5 signature: 993892b2292508c18687d3212335176c ******/
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
Modifier Appends the list of indices of faces <aLF> to the list of indices of faces of the common block (the input list is emptied).
") AppendFaces;
		void AppendFaces(TColStd_ListOfInteger & aLF);

		/****** BOPDS_CommonBlock::Contains ******/
		/****** md5 signature: 4b3272a694594675bae785a65b0903cf ******/
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
Query Returns true if the common block contains a pave block that is equal to <thePB>.
") Contains;
		bool Contains(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_CommonBlock::Contains ******/
		/****** md5 signature: 7508f77a27a5eb5b14da9f51e6c2fe78 ******/
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
Query Returns true if the common block contains the face with index equal to <theF>.
") Contains;
		bool Contains(const int theF);

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
		/****** md5 signature: d6bcd55b8bae579e7b4b7931e982c5a2 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the index of the edge of all pave blocks of the common block.
") Edge;
		int Edge();

		/****** BOPDS_CommonBlock::Faces ******/
		/****** md5 signature: d007e435f64c696b2f689c0a336e57b2 ******/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector Returns the list of indices of faces of the common block.
") Faces;
		const TColStd_ListOfInteger & Faces();

		/****** BOPDS_CommonBlock::IsPaveBlockOnEdge ******/
		/****** md5 signature: 2d57f1d25bca31907689f1231d430daf ******/
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
Query Returns true if the common block contains a pave block that belongs to the edge with index <theIx>.
") IsPaveBlockOnEdge;
		bool IsPaveBlockOnEdge(const int theIndex);

		/****** BOPDS_CommonBlock::IsPaveBlockOnFace ******/
		/****** md5 signature: 9a7cf29d761812db7c4f67f5ce0d01f4 ******/
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
Query Returns true if the common block contains a pave block that belongs to the face with index <theIx>.
") IsPaveBlockOnFace;
		bool IsPaveBlockOnFace(const int theIndex);

		/****** BOPDS_CommonBlock::PaveBlock1 ******/
		/****** md5 signature: 38e85104f9e5048af41cb3d65ab07ee3 ******/
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
Selector Returns the first pave block of the common block.
") PaveBlock1;
		const opencascade::handle<BOPDS_PaveBlock> & PaveBlock1();

		/****** BOPDS_CommonBlock::PaveBlockOnEdge ******/
		/****** md5 signature: 6a758f35c5409c46a843f111976bafab ******/
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
Selector Returns the pave block that belongs to the edge with index <theIx>.
") PaveBlockOnEdge;
		opencascade::handle<BOPDS_PaveBlock> & PaveBlockOnEdge(const int theIndex);

		/****** BOPDS_CommonBlock::PaveBlocks ******/
		/****** md5 signature: 770f52828ce980217a9dd084b6a5a2c7 ******/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector Returns the list of pave blocks of the common block.
") PaveBlocks;
		const NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & PaveBlocks();

		/****** BOPDS_CommonBlock::SetEdge ******/
		/****** md5 signature: 10ef0497a2e2e608e511c8bbe697c8a4 ******/
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
Modifier Assign the index <theEdge> as the edge index to all pave blocks of the common block.
") SetEdge;
		void SetEdge(const int theEdge);

		/****** BOPDS_CommonBlock::SetFaces ******/
		/****** md5 signature: 937340fca13e46123d3f4cbdea00a057 ******/
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
Modifier Sets the list of indices of faces <aLF> of the common block.
") SetFaces;
		void SetFaces(const TColStd_ListOfInteger & aLF);

		/****** BOPDS_CommonBlock::SetPaveBlocks ******/
		/****** md5 signature: 9ce14e8841ee61c82967a6fb7939fac5 ******/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "
Parameters
----------
aLPB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
Modifier Sets the list of pave blocks for the common block.
") SetPaveBlocks;
		void SetPaveBlocks(const NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & aLPB);

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
Moves the pave blocks in the list to make the given pave block to be the first. It will be representative for the whole group.
") SetRealPaveBlock;
		void SetRealPaveBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_CommonBlock::SetTolerance ******/
		/****** md5 signature: 46723e0a5720b7717ac743274fef3d11 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Sets the tolerance for the common block.
") SetTolerance;
		void SetTolerance(const double theTol);

		/****** BOPDS_CommonBlock::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return the tolerance of common block.
") Tolerance;
		double Tolerance();

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
Default constructor.
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
Constructor with two pave blocks. 
Input parameter: thePB1 first pave block 
Input parameter: thePB2 second pave block.
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks(const opencascade::handle<BOPDS_PaveBlock> & thePB1, const opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****** BOPDS_CoupleOfPaveBlocks::Index ******/
		/****** md5 signature: 4fc88a71a4ab819038de9a6160c989c2 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index. 
Return: the index.
") Index;
		int Index();

		/****** BOPDS_CoupleOfPaveBlocks::IndexInterf ******/
		/****** md5 signature: 4d8f749dbb35bd7bad4be8b9ea655c71 ******/
		%feature("compactdefaultargs") IndexInterf;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of an interference. 
Return: index of an interference.
") IndexInterf;
		int IndexInterf();

		/****** BOPDS_CoupleOfPaveBlocks::PaveBlock1 ******/
		/****** md5 signature: fbed016ee3e75bed6bbdc5dc7e5b9e3f ******/
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "Return
-------
opencascade::handle<BOPDS_PaveBlock>

Description
-----------
Returns the first pave block. 
Return: handle to the first pave block.
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
Returns the second pave block. 
Return: handle to the second pave block.
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
		/****** md5 signature: 2a3e510c2a05e5583c001e169b9296fc ******/
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
Sets the index. 
Input parameter: theIndex the index.
") SetIndex;
		void SetIndex(const int theIndex);

		/****** BOPDS_CoupleOfPaveBlocks::SetIndexInterf ******/
		/****** md5 signature: 375fbfa362ebf9dfa870246243d2b5cb ******/
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
Sets the index of an interference. 
Input parameter: theIndex index of an interference.
") SetIndexInterf;
		void SetIndexInterf(const int theIndex);

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
Sets the first pave block. 
Input parameter: thePB the first pave block.
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
Sets the second pave block. 
Input parameter: thePB the second pave block.
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
Sets both pave blocks. 
Input parameter: thePB1 first pave block 
Input parameter: thePB2 second pave block.
") SetPaveBlocks;
		void SetPaveBlocks(const opencascade::handle<BOPDS_PaveBlock> & thePB1, const opencascade::handle<BOPDS_PaveBlock> & thePB2);

		/****** BOPDS_CoupleOfPaveBlocks::SetTolerance ******/
		/****** md5 signature: 46723e0a5720b7717ac743274fef3d11 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Sets the tolerance associated with this couple. 
Input parameter: theTol the tolerance value.
") SetTolerance;
		void SetTolerance(const double theTol);

		/****** BOPDS_CoupleOfPaveBlocks::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance associated with this couple. 
Return: the tolerance value.
") Tolerance;
		double Tolerance();

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
Constructor 
Parameter theAllocator the allocator to manage the memory.
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
Selector Returns the bounding box of the curve.
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
Selector/Modifier Returns the bounding box of the curve.
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
Selector/Modifier Returns initial pave block of the curve.
") ChangePaveBlock1;
		opencascade::handle<BOPDS_PaveBlock> & ChangePaveBlock1();

		/****** BOPDS_Curve::ChangePaveBlocks ******/
		/****** md5 signature: 983f0690def33098969090807810f4f9 ******/
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector/Modifier Returns the list of pave blocks of the curve.
") ChangePaveBlocks;
		NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & ChangePaveBlocks();

		/****** BOPDS_Curve::ChangeTechnoVertices ******/
		/****** md5 signature: fa94b655a13f9bb7ec6e430633cc4e21 ******/
		%feature("compactdefaultargs") ChangeTechnoVertices;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector/Modifier Returns list of indices of technologic vertices of the curve.
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
Selector Returns the curve.
") Curve;
		IntTools_Curve Curve();

		/****** BOPDS_Curve::HasEdge ******/
		/****** md5 signature: 1431a428535970b7a422dfbd1ed3d98e ******/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns true if at least one pave block of the curve has edge.
") HasEdge;
		bool HasEdge();

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
		/****** md5 signature: 770f52828ce980217a9dd084b6a5a2c7 ******/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector Returns the list of pave blocks of the curve.
") PaveBlocks;
		const NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & PaveBlocks();

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
Modifier Sets the bounding box <theBox> of the curve.
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
Modifier Sets the curve <theC>.
") SetCurve;
		void SetCurve(const IntTools_Curve & theC);

		/****** BOPDS_Curve::SetPaveBlocks ******/
		/****** md5 signature: 4f3ec8b6c2dc10a70bfea179d24bbbc5 ******/
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "
Parameters
----------
theLPB: BOPDS_PaveBlock

Return
-------
None

Description
-----------
No available documentation.
") SetPaveBlocks;
		void SetPaveBlocks(const NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & theLPB);

		/****** BOPDS_Curve::SetTolerance ******/
		/****** md5 signature: 46723e0a5720b7717ac743274fef3d11 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Sets the tolerance for the curve.
") SetTolerance;
		void SetTolerance(const double theTol);

		/****** BOPDS_Curve::TangentialTolerance ******/
		/****** md5 signature: e60912ea3150be42bc4f243e7e5761c1 ******/
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tangential tolerance of the curve.
") TangentialTolerance;
		double TangentialTolerance();

		/****** BOPDS_Curve::TechnoVertices ******/
		/****** md5 signature: 02c88a8239566f9bc92dfda5184f4be5 ******/
		%feature("compactdefaultargs") TechnoVertices;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector Returns list of indices of technologic vertices of the curve.
") TechnoVertices;
		const TColStd_ListOfInteger & TechnoVertices();

		/****** BOPDS_Curve::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance of the curve.
") Tolerance;
		double Tolerance();

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
Constructor 
Parameter theAllocator the allocator to manage the memory.
") BOPDS_DS;
		 BOPDS_DS(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_DS::AddInterf ******/
		/****** md5 signature: bc4ec165e80100bcfee66991b531cb52 ******/
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
Modifier Adds the information about an interference between shapes with indices theI1, theI2 to the summary table of interferences.
") AddInterf;
		bool AddInterf(const int theI1, const int theI2);

		/****** BOPDS_DS::AddShapeSD ******/
		/****** md5 signature: 70ff03d5a932d061cf06ece56eba0062 ******/
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
Modifier Adds the information about same domain shapes with indices theIndex, theIndexSD.
") AddShapeSD;
		void AddShapeSD(const int theIndex, const int theIndexSD);

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
		/****** md5 signature: 0a345227df77febb71b5c0ae7b8d0223 ******/
		%feature("compactdefaultargs") AloneVertices;
		%feature("autodoc", "
Parameters
----------
theFaceIndex: int
theVertexList: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Selector Returns the indices of alone vertices for the face with index @p theFaceIndex.
") AloneVertices;
		void AloneVertices(const int theFaceIndex, TColStd_ListOfInteger & theVertexList);

		/****** BOPDS_DS::Append ******/
		/****** md5 signature: 8247691645497818952579581db4a2ba ******/
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
Modifier Appends the information about the shape [theSI] to the data structure Returns the index of theSI in the data structure.
") Append;
		int Append(const BOPDS_ShapeInfo & theSI);

		/****** BOPDS_DS::Append ******/
		/****** md5 signature: 7cd18ff526f562e72d27648e77fd417f ******/
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
Modifier Appends the default information about the shape [theS] to the data structure Returns the index of theS in the data structure.
") Append;
		int Append(const TopoDS_Shape & theS);

		/****** BOPDS_DS::Arguments ******/
		/****** md5 signature: b869ff9ffc90f441ebb6a2f7f843ce6a ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Selector Returns the arguments of an operation.
") Arguments;
		const TopTools_ListOfShape & Arguments();

		/****** BOPDS_DS::BuildBndBoxSolid ******/
		/****** md5 signature: 97e2214a5b5b405ea8d6174f4b73e3f8 ******/
		%feature("compactdefaultargs") BuildBndBoxSolid;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBox: Bnd_Box
theCheckInverted: bool (optional, default to true)

Return
-------
None

Description
-----------
Computes bounding box <theBox> for the solid with DS-index <theIndex>. The flag <theCheckInverted> enables/disables the check of the solid for inverted status. By default the solids will be checked.
") BuildBndBoxSolid;
		void BuildBndBoxSolid(const int theIndex, Bnd_Box & theBox, const bool theCheckInverted = true);

		/****** BOPDS_DS::ChangeFaceInfo ******/
		/****** md5 signature: 0c36b93f93aa85091a5447c21a303f44 ******/
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
Selector/Modifier Returns the state of face with index theIndex.
") ChangeFaceInfo;
		BOPDS_FaceInfo & ChangeFaceInfo(const int theIndex);

		/****** BOPDS_DS::ChangePaveBlocks ******/
		/****** md5 signature: ce2705f4c845d162e43a31439b7138e4 ******/
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
NCollection_List<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector/Modifier Returns the pave blocks for the shape with index theIndex.
") ChangePaveBlocks;
		NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & ChangePaveBlocks(const int theIndex);

		/****** BOPDS_DS::ChangePaveBlocksPool ******/
		/****** md5 signature: 97b39ee777fbbf0aae9a8416d2d02daf ******/
		%feature("compactdefaultargs") ChangePaveBlocksPool;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<NCollection_List<opencascade::handle<BOPDS_PaveBlock>>>

Description
-----------
Selector/Modifier Returns the information about pave blocks on source edges.
") ChangePaveBlocksPool;
		NCollection_DynamicArray<NCollection_List<opencascade::handle<BOPDS_PaveBlock>>> & ChangePaveBlocksPool();

		/****** BOPDS_DS::ChangeShapeInfo ******/
		/****** md5 signature: cc6f62809d6e81d4621028ac8240dc36 ******/
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
Selector/Modifier Returns the information about the shape with index theIndex.
") ChangeShapeInfo;
		BOPDS_ShapeInfo & ChangeShapeInfo(const int theIndex);

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
Selector Returns the common block.
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
		/****** md5 signature: 9b8f8c046cc9fab776a1732fd9043988 ******/
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
Selector Returns the state of face with index theIndex.
") FaceInfo;
		const BOPDS_FaceInfo & FaceInfo(const int theIndex);

		/****** BOPDS_DS::FaceInfoIn ******/
		/****** md5 signature: e05ff80f57210a6cdf142290a653a2fd ******/
		%feature("compactdefaultargs") FaceInfoIn;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theMPB: BOPDS_PaveBlock
theMVP: TColStd_MapOfInteger

Return
-------
None

Description
-----------
Selector Returns the state In [theMPB,theMVP] of face with index theIndex.
") FaceInfoIn;
		void FaceInfoIn(const int theIndex, NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & theMPB, TColStd_MapOfInteger & theMVP);

		/****** BOPDS_DS::FaceInfoOn ******/
		/****** md5 signature: 98f0d5944e4a03f045f0cfb8e53928e5 ******/
		%feature("compactdefaultargs") FaceInfoOn;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theMPB: BOPDS_PaveBlock
theMVP: TColStd_MapOfInteger

Return
-------
None

Description
-----------
Selector Returns the state On [theMPB,theMVP] of face with index theIndex.
") FaceInfoOn;
		void FaceInfoOn(const int theIndex, NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & theMPB, TColStd_MapOfInteger & theMVP);

		/****** BOPDS_DS::FaceInfoPool ******/
		/****** md5 signature: d112e6b704fee4761a5287a8ddfc87d5 ******/
		%feature("compactdefaultargs") FaceInfoPool;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_FaceInfo>

Description
-----------
Selector Returns the information about state of faces.
") FaceInfoPool;
		const NCollection_DynamicArray<BOPDS_FaceInfo> & FaceInfoPool();

		/****** BOPDS_DS::GetSameDomainIndex ******/
		/****** md5 signature: 713c51ff0932a6e8a48c31d23af06a17 ******/
		%feature("compactdefaultargs") GetSameDomainIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns the index of same domain shape for the shape with index @p theIndex. If there is no same domain shape, returns @p theIndex itself.
") GetSameDomainIndex;
		int GetSameDomainIndex(const int theIndex);

		/****** BOPDS_DS::HasFaceInfo ******/
		/****** md5 signature: bff83ac5d4eeeb0f66281ea03c86bdf5 ******/
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
Query Returns true if the shape with index theIndex has the information about state of face.
") HasFaceInfo;
		bool HasFaceInfo(const int theIndex);

		/****** BOPDS_DS::HasInterf ******/
		/****** md5 signature: d7c70f69c3597ac9604298979afcae79 ******/
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
Query Returns true if the shape with index theI is interferred.
") HasInterf;
		bool HasInterf(const int theI);

		/****** BOPDS_DS::HasInterf ******/
		/****** md5 signature: 3f5ec30d56a5060a520a9170acd8083a ******/
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
Query Returns true if the shapes with indices theI1, theI2 are interferred.
") HasInterf;
		bool HasInterf(const int theI1, const int theI2);

		/****** BOPDS_DS::HasInterfShapeSubShapes ******/
		/****** md5 signature: f164dec10b8a67528f2c430a0f3763f1 ******/
		%feature("compactdefaultargs") HasInterfShapeSubShapes;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int
theAnyInterference: bool (optional, default to true)

Return
-------
bool

Description
-----------
Query Returns true if the shape with index theIndex1 is interfered with any sub-shape of the shape with index theIndex2 (theAnyInterference=true) all sub-shapes of the shape with index theIndex2 (theAnyInterference=false).
") HasInterfShapeSubShapes;
		bool HasInterfShapeSubShapes(const int theIndex1, const int theIndex2, const bool theAnyInterference = true);

		/****** BOPDS_DS::HasInterfSubShapes ******/
		/****** md5 signature: 05bfda56c938515e90bab773b1b60586 ******/
		%feature("compactdefaultargs") HasInterfSubShapes;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int

Return
-------
bool

Description
-----------
Query Returns true if the shapes with indices theIndex1, theIndex2 have interferred sub-shapes.
") HasInterfSubShapes;
		bool HasInterfSubShapes(const int theIndex1, const int theIndex2);

		/****** BOPDS_DS::HasPaveBlocks ******/
		/****** md5 signature: 5621b8bd03e70601a327e710499dc475 ******/
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
Query Returns true if the shape with index theIndex has the information about pave blocks.
") HasPaveBlocks;
		bool HasPaveBlocks(const int theIndex);

		/****** BOPDS_DS::HasShapeSD ******/
		/****** md5 signature: 9705e5cb4a5fbc2d95356934940edbf9 ******/
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
Query Returns true if the shape with index theIndex has the same domain shape. In this case theIndexSD will contain the index of same domain shape found //! interferences.
") HasShapeSD;
		bool HasShapeSD(const int theIndex, Standard_Integer &OutValue);

		/****** BOPDS_DS::Index ******/
		/****** md5 signature: 431c28b00bdcd75b9a945a79cd3178dc ******/
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
Selector Returns the index of the shape theS.
") Index;
		int Index(const TopoDS_Shape & theS);

		/****** BOPDS_DS::Init ******/
		/****** md5 signature: 14cdc4d6657e285ffe0969e5ed883437 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theFuzz: double (optional, default to Precision::Confusion())

Return
-------
None

Description
-----------
Initializes the data structure for the arguments.
") Init;
		void Init(const double theFuzz = Precision::Confusion());

		/****** BOPDS_DS::InitPaveBlocksForVertex ******/
		/****** md5 signature: 7008d1a0d6a6d3e120ec4c313cb04b05 ******/
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
		void InitPaveBlocksForVertex(const int theNV);

		/****** BOPDS_DS::InterfEE ******/
		/****** md5 signature: 651ba59807224abb63c084efeb9c96fe ******/
		%feature("compactdefaultargs") InterfEE;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfEE>

Description
-----------
Selector/Modifier Returns the collection of interferences Edge/Edge.
") InterfEE;
		NCollection_DynamicArray<BOPDS_InterfEE> & InterfEE();

		/****** BOPDS_DS::InterfEF ******/
		/****** md5 signature: 3143af825731697bf392f4bca52cc701 ******/
		%feature("compactdefaultargs") InterfEF;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfEF>

Description
-----------
Selector/Modifier Returns the collection of interferences Edge/Face.
") InterfEF;
		NCollection_DynamicArray<BOPDS_InterfEF> & InterfEF();

		/****** BOPDS_DS::InterfEZ ******/
		/****** md5 signature: c6033d06e7bc0fe9f2008e97208e97d2 ******/
		%feature("compactdefaultargs") InterfEZ;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfEZ>

Description
-----------
Selector/Modifier Returns the collection of interferences Edge/Solid.
") InterfEZ;
		NCollection_DynamicArray<BOPDS_InterfEZ> & InterfEZ();

		/****** BOPDS_DS::InterfFF ******/
		/****** md5 signature: efc9cd895f2035ffcc0112546da2fe20 ******/
		%feature("compactdefaultargs") InterfFF;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfFF>

Description
-----------
Selector/Modifier Returns the collection of interferences Face/Face.
") InterfFF;
		NCollection_DynamicArray<BOPDS_InterfFF> & InterfFF();

		/****** BOPDS_DS::InterfFZ ******/
		/****** md5 signature: 131716e6c152520b6b52546e71a84fb9 ******/
		%feature("compactdefaultargs") InterfFZ;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfFZ>

Description
-----------
Selector/Modifier Returns the collection of interferences Face/Solid.
") InterfFZ;
		NCollection_DynamicArray<BOPDS_InterfFZ> & InterfFZ();

		/****** BOPDS_DS::InterfVE ******/
		/****** md5 signature: b7e46c6790f7b9b198f0693f66dde86b ******/
		%feature("compactdefaultargs") InterfVE;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfVE>

Description
-----------
Selector/Modifier Returns the collection of interferences Vertex/Edge.
") InterfVE;
		NCollection_DynamicArray<BOPDS_InterfVE> & InterfVE();

		/****** BOPDS_DS::InterfVF ******/
		/****** md5 signature: bd1784aaa5491a1cffeb8813cf7f7255 ******/
		%feature("compactdefaultargs") InterfVF;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfVF>

Description
-----------
Selector/Modifier Returns the collection of interferences Vertex/Face.
") InterfVF;
		NCollection_DynamicArray<BOPDS_InterfVF> & InterfVF();

		/****** BOPDS_DS::InterfVV ******/
		/****** md5 signature: a99c27178135645f17ddccf43e361a68 ******/
		%feature("compactdefaultargs") InterfVV;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfVV>

Description
-----------
Selector/Modifier Returns the collection of interferences Vertex/Vertex.
") InterfVV;
		NCollection_DynamicArray<BOPDS_InterfVV> & InterfVV();

		/****** BOPDS_DS::InterfVZ ******/
		/****** md5 signature: 8ee7c01ed2d4fd9aa38fd35dbb2e6b06 ******/
		%feature("compactdefaultargs") InterfVZ;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfVZ>

Description
-----------
Selector/Modifier Returns the collection of interferences Vertex/Solid.
") InterfVZ;
		NCollection_DynamicArray<BOPDS_InterfVZ> & InterfVZ();

		/****** BOPDS_DS::InterfZZ ******/
		/****** md5 signature: d60ace4a79aec470695dd7ae87d2b539 ******/
		%feature("compactdefaultargs") InterfZZ;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_InterfZZ>

Description
-----------
Selector/Modifier Returns the collection of interferences Solid/Solid.
") InterfZZ;
		NCollection_DynamicArray<BOPDS_InterfZZ> & InterfZZ();

		/****** BOPDS_DS::Interferences ******/
		/****** md5 signature: b3cf058c3fe2c6b826585598c99df3c2 ******/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "Return
-------
NCollection_Map<BOPDS_Pair>

Description
-----------
Selector Returns the table of interferences //! debug.
") Interferences;
		const NCollection_Map<BOPDS_Pair> & Interferences();

		/****** BOPDS_DS::IsCommonBlock ******/
		/****** md5 signature: c3e93110c98cd0a12d49e20b7b0c28e1 ******/
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
Query Returns true if the pave block is common block.
") IsCommonBlock;
		bool IsCommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::IsCommonBlockOnEdge ******/
		/****** md5 signature: ce05185b5833895a0ce6b465b091ad8e ******/
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
Query Returns true if common block contains more then one pave block.
") IsCommonBlockOnEdge;
		bool IsCommonBlockOnEdge(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::IsNewShape ******/
		/****** md5 signature: 9b7eb21ecb8ab4b0fc491ab3d4c395b0 ******/
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
		bool IsNewShape(const int theIndex);

		/****** BOPDS_DS::IsSubShape ******/
		/****** md5 signature: 44a5e0e9895b8dfba75eeeb56bf9b9d0 ******/
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "
Parameters
----------
theCandidate: int
theParent: int

Return
-------
bool

Description
-----------
Returns true if the shape with index @p theCandidate is a sub-shape of the shape with index @p theParent.
") IsSubShape;
		bool IsSubShape(const int theCandidate, const int theParent);

		/****** BOPDS_DS::IsValidShrunkData ******/
		/****** md5 signature: 460c599f585e1b25733668e7335096c5 ******/
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
Checks if the existing shrunk data of the pave block is still valid. The shrunk data may become invalid if e.g. the vertices of the pave block have been replaced with the new one with bigger tolerances, or the tolerances of the existing vertices have been increased.
") IsValidShrunkData;
		bool IsValidShrunkData(const opencascade::handle<BOPDS_PaveBlock> & thePB);

		/****** BOPDS_DS::NbInterfTypes ******/
		/****** md5 signature: f6873f27659b4365b0670434312b9699 ******/
		%feature("compactdefaultargs") NbInterfTypes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of types of the interferences.
") NbInterfTypes;
		static int NbInterfTypes();

		/****** BOPDS_DS::NbRanges ******/
		/****** md5 signature: d242d26274e9bc749aaba4024379164a ******/
		%feature("compactdefaultargs") NbRanges;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the number of index ranges.
") NbRanges;
		int NbRanges();

		/****** BOPDS_DS::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the total number of shapes stored.
") NbShapes;
		int NbShapes();

		/****** BOPDS_DS::NbSourceShapes ******/
		/****** md5 signature: 22d2d7b581425ebcb11449c948d9f5cb ******/
		%feature("compactdefaultargs") NbSourceShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the total number of source shapes stored.
") NbSourceShapes;
		int NbSourceShapes();

		/****** BOPDS_DS::PaveBlocks ******/
		/****** md5 signature: 421206bb093a75e472e81bcfdc5fc589 ******/
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
NCollection_List<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector Returns the pave blocks for the shape with index theIndex.
") PaveBlocks;
		const NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & PaveBlocks(const int theIndex);

		/****** BOPDS_DS::PaveBlocksPool ******/
		/****** md5 signature: e61ed297db698fbfc593441dc7b6857d ******/
		%feature("compactdefaultargs") PaveBlocksPool;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<NCollection_List<opencascade::handle<BOPDS_PaveBlock>>>

Description
-----------
Selector Returns the information about pave blocks on source edges.
") PaveBlocksPool;
		const NCollection_DynamicArray<NCollection_List<opencascade::handle<BOPDS_PaveBlock>>> & PaveBlocksPool();

		/****** BOPDS_DS::Paves ******/
		/****** md5 signature: 5e26b5d981dc5a811609964299ab07c2 ******/
		%feature("compactdefaultargs") Paves;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theLP: NCollection_List<BOPDS_Pave>

Return
-------
None

Description
-----------
Fills theLP with sorted paves of the shape with index theIndex.
") Paves;
		void Paves(const int theIndex, NCollection_List<BOPDS_Pave> & theLP);

		/****** BOPDS_DS::Range ******/
		/****** md5 signature: 157dcdbeea8a40a7d3dedb92a52078bc ******/
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
Selector Returns the index range 'i'.
") Range;
		const BOPDS_IndexRange & Range(const int theIndex);

		/****** BOPDS_DS::Rank ******/
		/****** md5 signature: 9576eb3cea045ac40148fa896eb2374b ******/
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
Selector Returns the rank of the shape of index 'i'.
") Rank;
		int Rank(const int theIndex);

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
Selector Returns the real first pave block.
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
Removes any pave block from list of having IN state if it has also the state ON.
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
Refine the state On for the all faces having state information //! ++.
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
Clears information about PaveBlocks for the untouched edges.
") ReleasePaveBlocks;
		void ReleasePaveBlocks();

		/****** BOPDS_DS::SetArguments ******/
		/****** md5 signature: d9943a8fd31780687d1220b9e0eb7924 ******/
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
Modifier Sets the arguments [theLS] of an operation.
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
Modifier Sets the common block <theCB>.
") SetCommonBlock;
		void SetCommonBlock(const opencascade::handle<BOPDS_PaveBlock> & thePB, const opencascade::handle<BOPDS_CommonBlock> & theCB);

		/****** BOPDS_DS::Shape ******/
		/****** md5 signature: 8162a4975455d3eb15ce8aca97f43599 ******/
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
Selector Returns the shape with index theIndex.
") Shape;
		const TopoDS_Shape Shape(const int theIndex);

		/****** BOPDS_DS::ShapeInfo ******/
		/****** md5 signature: 3cc791a0774c5e3b72ffb984bf44865e ******/
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
Selector Returns the information about the shape with index theIndex.
") ShapeInfo;
		const BOPDS_ShapeInfo & ShapeInfo(const int theIndex);

		/****** BOPDS_DS::ShapesSD ******/
		/****** md5 signature: b699ea98c38928d791791e3cd2350d59 ******/
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "Return
-------
TColStd_DataMapOfIntegerInteger

Description
-----------
Selector Returns the collection same domain shapes.
") ShapesSD;
		TColStd_DataMapOfIntegerInteger & ShapesSD();

		/****** BOPDS_DS::SharedEdges ******/
		/****** md5 signature: 3339feba3a05d0f5e4028a92962dd7db ******/
		%feature("compactdefaultargs") SharedEdges;
		%feature("autodoc", "
Parameters
----------
theFaceIndex1: int
theFaceIndex2: int
theEdgeList: TColStd_ListOfInteger
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Returns the indices of edges that are shared for the faces with indices @p theFaceIndex1 and @p theFaceIndex2.
") SharedEdges;
		void SharedEdges(const int theFaceIndex1, const int theFaceIndex2, TColStd_ListOfInteger & theEdgeList, const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_DS::SubShapesOnIn ******/
		/****** md5 signature: 368c299b2bd0ecda6dac38199d7ee03d ******/
		%feature("compactdefaultargs") SubShapesOnIn;
		%feature("autodoc", "
Parameters
----------
theFaceIndex1: int
theFaceIndex2: int
theMVOnIn: TColStd_MapOfInteger
theMVCommon: TColStd_MapOfInteger
thePBOnIn: BOPDS_PaveBlock
theCommonPaveBlocks: BOPDS_PaveBlock

Return
-------
None

Description
-----------
Returns information about ON/IN sub-shapes of the given faces. 
Parameter theFaceIndex1 the index of the first face 
Parameter theFaceIndex2 the index of the second face 
Parameter theMVOnIn the indices of ON/IN vertices from both faces 
Parameter theMVCommon the indices of common vertices for both faces 
Parameter thePBOnIn all On/In pave blocks from both faces 
Parameter theCommonPaveBlocks the common pave blocks (that are shared by both faces).
") SubShapesOnIn;
		void SubShapesOnIn(const int theFaceIndex1, const int theFaceIndex2, TColStd_MapOfInteger & theMVOnIn, TColStd_MapOfInteger & theMVCommon, NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & thePBOnIn, NCollection_Map<opencascade::handle<BOPDS_PaveBlock>> & theCommonPaveBlocks);

		/****** BOPDS_DS::UpdateCommonBlock ******/
		/****** md5 signature: 109f7ee85e3286f7205bef33e6b0b757 ******/
		%feature("compactdefaultargs") UpdateCommonBlock;
		%feature("autodoc", "
Parameters
----------
theCB: BOPDS_CommonBlock
theFuzz: double

Return
-------
None

Description
-----------
Update the common block theCB.
") UpdateCommonBlock;
		void UpdateCommonBlock(const opencascade::handle<BOPDS_CommonBlock> & theCB, const double theFuzz);

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
		/****** md5 signature: 4344bc2e3d81a03d13304992ef940350 ******/
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
Update the state In of face with index theIndex.
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn(const int theIndex);

		/****** BOPDS_DS::UpdateFaceInfoIn ******/
		/****** md5 signature: 9f23fdc653b235a6a606a6531e966e79 ******/
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
Update the state IN for all faces in the given map.
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn(const TColStd_MapOfInteger & theFaces);

		/****** BOPDS_DS::UpdateFaceInfoOn ******/
		/****** md5 signature: 508bd6c278ca3fbc04df53ae015f8ed2 ******/
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
Update the state On of face with index theIndex.
") UpdateFaceInfoOn;
		void UpdateFaceInfoOn(const int theIndex);

		/****** BOPDS_DS::UpdateFaceInfoOn ******/
		/****** md5 signature: 4182dfe3febdf8a7fa31a63814d906b8 ******/
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
Update the state ON for all faces in the given map.
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
Update the pave block thePB.
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
Constructor 
Parameter theAllocator the allocator to manage the memory.
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_FaceInfo::ChangePaveBlocksIn ******/
		/****** md5 signature: f80779465e98c5968b176b61d5b96262 ******/
		%feature("compactdefaultargs") ChangePaveBlocksIn;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector/Modifier Returns the pave blocks of the face that have state In.
") ChangePaveBlocksIn;
		NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & ChangePaveBlocksIn();

		/****** BOPDS_FaceInfo::ChangePaveBlocksOn ******/
		/****** md5 signature: a06d141a19c8caf5161671dbfc2563e0 ******/
		%feature("compactdefaultargs") ChangePaveBlocksOn;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector/Modifier Returns the pave blocks of the face that have state On.
") ChangePaveBlocksOn;
		NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & ChangePaveBlocksOn();

		/****** BOPDS_FaceInfo::ChangePaveBlocksSc ******/
		/****** md5 signature: e9107dd7828655637f4bc116ba552428 ******/
		%feature("compactdefaultargs") ChangePaveBlocksSc;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
No available documentation.
") ChangePaveBlocksSc;
		NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & ChangePaveBlocksSc();

		/****** BOPDS_FaceInfo::ChangeVerticesIn ******/
		/****** md5 signature: fafa8103e916e13ae94702436c0036f9 ******/
		%feature("compactdefaultargs") ChangeVerticesIn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector/Modifier Returns the list of indices for vertices of the face that have state In //! On.
") ChangeVerticesIn;
		TColStd_MapOfInteger & ChangeVerticesIn();

		/****** BOPDS_FaceInfo::ChangeVerticesOn ******/
		/****** md5 signature: d18d42185703288808272f8539de979c ******/
		%feature("compactdefaultargs") ChangeVerticesOn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector/Modifier Returns the list of indices for vertices of the face that have state On //! Sections.
") ChangeVerticesOn;
		TColStd_MapOfInteger & ChangeVerticesOn();

		/****** BOPDS_FaceInfo::ChangeVerticesSc ******/
		/****** md5 signature: 51d23f5bfc67d6d521e0f699312004d3 ******/
		%feature("compactdefaultargs") ChangeVerticesSc;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector/Modifier Returns the list of indices for section vertices of the face //! Others.
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
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the index of the face //! In.
") Index;
		int Index();

		/****** BOPDS_FaceInfo::PaveBlocksIn ******/
		/****** md5 signature: 572a2c09e6a3bd1c62e5e6383ac4000c ******/
		%feature("compactdefaultargs") PaveBlocksIn;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector Returns the pave blocks of the face that have state In.
") PaveBlocksIn;
		const NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & PaveBlocksIn();

		/****** BOPDS_FaceInfo::PaveBlocksOn ******/
		/****** md5 signature: 119e0a08dcbd347389586e1d28271f54 ******/
		%feature("compactdefaultargs") PaveBlocksOn;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector Returns the pave blocks of the face that have state On.
") PaveBlocksOn;
		const NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & PaveBlocksOn();

		/****** BOPDS_FaceInfo::PaveBlocksSc ******/
		/****** md5 signature: 9c9e9a14cb8c589c5217878001716702 ******/
		%feature("compactdefaultargs") PaveBlocksSc;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>>

Description
-----------
Selector Returns the pave blocks of the face that are pave blocks of section edges.
") PaveBlocksSc;
		const NCollection_IndexedMap<opencascade::handle<BOPDS_PaveBlock>> & PaveBlocksSc();

		/****** BOPDS_FaceInfo::SetIndex ******/
		/****** md5 signature: 97a60aec116a0ebdaf8252c92fb7f440 ******/
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
Modifier Sets the index of the face <theI>.
") SetIndex;
		void SetIndex(const int theI);

		/****** BOPDS_FaceInfo::VerticesIn ******/
		/****** md5 signature: a60b4b23fe17312c3dc5b90ece53bb01 ******/
		%feature("compactdefaultargs") VerticesIn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector Returns the list of indices for vertices of the face that have state In.
") VerticesIn;
		const TColStd_MapOfInteger & VerticesIn();

		/****** BOPDS_FaceInfo::VerticesOn ******/
		/****** md5 signature: 706bcf9d4be328e966bb07d12f3b8b75 ******/
		%feature("compactdefaultargs") VerticesOn;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector Returns the list of indices for vertices of the face that have state On.
") VerticesOn;
		const TColStd_MapOfInteger & VerticesOn();

		/****** BOPDS_FaceInfo::VerticesSc ******/
		/****** md5 signature: 271d7354ad4f592f1d72e9dbbc01e100 ******/
		%feature("compactdefaultargs") VerticesSc;
		%feature("autodoc", "Return
-------
TColStd_MapOfInteger

Description
-----------
Selector Returns the list of indices for section vertices of the face.
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

		/****** BOPDS_IndexRange::BOPDS_IndexRange ******/
		/****** md5 signature: b4578665dcadb34c755d29debcb9eff0 ******/
		%feature("compactdefaultargs") BOPDS_IndexRange;
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
Constructor with initial indices.
") BOPDS_IndexRange;
		 BOPDS_IndexRange(const int theI1, const int theI2);

		/****** BOPDS_IndexRange::Contains ******/
		/****** md5 signature: b584eed1cfb119ecbfc18cb2ab69326c ******/
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
Query Returns true if the range contains <theIndex>.
") Contains;
		bool Contains(const int theIndex);

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
		/****** md5 signature: 9976e21cdb70063ea164065ef482c38d ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the first index of the range.
") First;
		int First();

		/****** BOPDS_IndexRange::Indices ******/
		/****** md5 signature: 8c2830b5e305d837e149e0e7a1566f82 ******/
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
Selector Returns the first index of the range <theI1> Returns the second index of the range <theI2>.
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BOPDS_IndexRange::Last ******/
		/****** md5 signature: 205142323c0fda3122bd3306b13c1b5e ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the second index of the range.
") Last;
		int Last();

		/****** BOPDS_IndexRange::SetFirst ******/
		/****** md5 signature: 3c6940d0420d0607ac4ef4deaa8348cb ******/
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
Modifier Sets the first index <theI1> of the range.
") SetFirst;
		void SetFirst(const int theI1);

		/****** BOPDS_IndexRange::SetIndices ******/
		/****** md5 signature: 867e6ef2944989890460ada7964b4a5d ******/
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
Modifier Sets the first index of the range <theI1> Sets the second index of the range <theI2>.
") SetIndices;
		void SetIndices(const int theI1, const int theI2);

		/****** BOPDS_IndexRange::SetLast ******/
		/****** md5 signature: ba2bb50767bee15bba5ba7d2a7fb04da ******/
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
Modifier Sets the second index <theI2> of the range.
") SetLast;
		void SetLast(const int theI2);

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
Constructor 
Parameter theAllocator the allocator to manage the memory.
") BOPDS_Iterator;
		 BOPDS_Iterator(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_Iterator::BlockLength ******/
		/****** md5 signature: eaaf7a4f672d286884bfd54d10cebdaa ******/
		%feature("compactdefaultargs") BlockLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the block length.
") BlockLength;
		int BlockLength();

		/****** BOPDS_Iterator::DS ******/
		/****** md5 signature: 276afbb7db8ff236fa734c0f56c3dcb8 ******/
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "Return
-------
BOPDS_DS

Description
-----------
Selector Returns the data structure.
") DS;
		const BOPDS_DS & DS();

		/****** BOPDS_Iterator::ExpectedLength ******/
		/****** md5 signature: 10c151e26e494617b29f5f71d175771c ******/
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersections founded.
") ExpectedLength;
		int ExpectedLength();

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
Initializes the iterator theType1 - the first type of shape theType2 - the second type of shape.
") Initialize;
		void Initialize(const TopAbs_ShapeEnum theType1, const TopAbs_ShapeEnum theType2);

		/****** BOPDS_Iterator::IntersectExt ******/
		/****** md5 signature: 4676ba2914ff35c15ac0e1c43527ce57 ******/
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
Updates the tree of Bounding Boxes with increased boxes and intersects such elements with the tree.
") IntersectExt;
		void IntersectExt(const TColStd_MapOfInteger & theIndicies);

		/****** BOPDS_Iterator::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if still there are pairs of intersected shapes.
") More;
		bool More();

		/****** BOPDS_Iterator::NbExtInterfs ******/
		/****** md5 signature: e5f1ebd7f63371d665d69664a725decf ******/
		%feature("compactdefaultargs") NbExtInterfs;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbExtInterfs;
		static int NbExtInterfs();

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
		/****** md5 signature: 5449c7d65cbb4faadc419955024e4187 ******/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "
Parameters
----------
theCtx: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())
theCheckOBB: bool (optional, default to false)
theFuzzyValue: double (optional, default to Precision::Confusion())

Return
-------
None

Description
-----------
Perform the intersection algorithm and prepare the results to be used.
") Prepare;
		virtual void Prepare(const opencascade::handle<IntTools_Context> & theCtx = opencascade::handle<IntTools_Context>(), const bool theCheckOBB = false, const double theFuzzyValue = Precision::Confusion());

		/****** BOPDS_Iterator::RunParallel ******/
		/****** md5 signature: 3486052155fd2562fcc738af989b0ddb ******/
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag of parallel processing.
") RunParallel;
		bool RunParallel();

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
Modifier Sets the data structure <pDS> to process.
") SetDS;
		void SetDS(const BOPDS_PDS & pDS);

		/****** BOPDS_Iterator::SetRunParallel ******/
		/****** md5 signature: ff82086189ecc9966922324f1ee171dc ******/
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
Set the flag of parallel processing if <theFlag> is true the parallel processing is switched on if <theFlag> is false the parallel processing is switched off.
") SetRunParallel;
		void SetRunParallel(const bool theFlag);

		/****** BOPDS_Iterator::Value ******/
		/****** md5 signature: 5ccfc0ac3b3b4c10c79203b7c68bc8f9 ******/
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
Returns indices (DS) of intersected shapes theIndex1 - the index of the first shape theIndex2 - the index of the second shape.
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
		/****** md5 signature: 3878200d81798af115e2c8ccb0695f27 ******/
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
		 BOPDS_Pair(const int theIndex1, const int theIndex2);

		/****** BOPDS_Pair::Indices ******/
		/****** md5 signature: f1b48f5f10fd57cf65d6af675652359c ******/
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
		/****** md5 signature: 525dce6a9b0f2a30cedc76f9700d0b74 ******/
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
Returns true if the Pair is equal to <the theOther>.
") IsEqual;
		bool IsEqual(const BOPDS_Pair & theOther);

		/****** BOPDS_Pair::SetIndices ******/
		/****** md5 signature: 0933def214b0c2db8e1dd88ed31e06f3 ******/
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
		void SetIndices(const int theIndex1, const int theIndex2);


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

		/****** BOPDS_Pave::BOPDS_Pave ******/
		/****** md5 signature: 41df1be8f19207b1a81e9b596b671c23 ******/
		%feature("compactdefaultargs") BOPDS_Pave;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theParameter: double

Return
-------
None

Description
-----------
Constructor with index and parameter.
") BOPDS_Pave;
		 BOPDS_Pave(const int theIndex, const double theParameter);

		/****** BOPDS_Pave::Contents ******/
		/****** md5 signature: e562e3d16f0c7cd461e9a8d76cb6bf86 ******/
		%feature("compactdefaultargs") Contents;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndex: int
theParameter: double

Description
-----------
Selector Returns the index of vertex <theIndex> Returns the parameter of vertex <theParameter>.
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
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the index of vertex.
") Index;
		int Index();

		/****** BOPDS_Pave::IsEqual ******/
		/****** md5 signature: 2d71b789110ed5802a8df260a004b21c ******/
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
Query Returns true if the parameter of this is equal to the parameter of <theOther>.
") IsEqual;
		bool IsEqual(const BOPDS_Pave & theOther);

		/****** BOPDS_Pave::IsLess ******/
		/****** md5 signature: 984631b80a1b8344397915f7c7cd11c3 ******/
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
Query Returns true if the parameter of this is less than the parameter of <theOther>.
") IsLess;
		bool IsLess(const BOPDS_Pave & theOther);

		/****** BOPDS_Pave::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Selector Returns the parameter of vertex.
") Parameter;
		double Parameter();

		/****** BOPDS_Pave::SetIndex ******/
		/****** md5 signature: 21592ec6eaa1cb4fc2285544b375c931 ******/
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
Modifier Sets the index of vertex <theIndex>.
") SetIndex;
		void SetIndex(const int theIndex);

		/****** BOPDS_Pave::SetParameter ******/
		/****** md5 signature: 5f47a8985ca1472924cf8c45deca9769 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
theParameter: double

Return
-------
None

Description
-----------
Modifier Sets the parameter of vertex <theParameter>.
") SetParameter;
		void SetParameter(const double theParameter);


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
Constructor 
Parameter theAllocator the allocator to manage the memory.
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
Modifier Appends extra paves <thePave>.
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
Modifier Appends extra pave <thePave>.
") AppendExtPave1;
		void AppendExtPave1(const BOPDS_Pave & thePave);

		/****** BOPDS_PaveBlock::ChangeExtPaves ******/
		/****** md5 signature: 1e5091f64869840217c9b08e75b40db1 ******/
		%feature("compactdefaultargs") ChangeExtPaves;
		%feature("autodoc", "Return
-------
NCollection_List<BOPDS_Pave>

Description
-----------
Selector / Modifier Returns the extra paves.
") ChangeExtPaves;
		NCollection_List<BOPDS_Pave> & ChangeExtPaves();

		/****** BOPDS_PaveBlock::ContainsParameter ******/
		/****** md5 signature: 35b32aa8e10a091dc51f109751362566 ******/
		%feature("compactdefaultargs") ContainsParameter;
		%feature("autodoc", "
Parameters
----------
thePrm: double
theTol: double

Return
-------
theInd: int

Description
-----------
Query Returns true if the extra paves contain the pave with given value of the parameter <thePrm> <theTol> - the value of the tolerance to compare <theInd> - index of the found pave.
") ContainsParameter;
		bool ContainsParameter(const double thePrm, const double theTol, Standard_Integer &OutValue);

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
		/****** md5 signature: d6bcd55b8bae579e7b4b7931e982c5a2 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the index of edge of pave block.
") Edge;
		int Edge();

		/****** BOPDS_PaveBlock::ExtPaves ******/
		/****** md5 signature: 54194bcd3880fb5f984ce73cb0cc8217 ******/
		%feature("compactdefaultargs") ExtPaves;
		%feature("autodoc", "Return
-------
NCollection_List<BOPDS_Pave>

Description
-----------
Selector Returns the extra paves.
") ExtPaves;
		const NCollection_List<BOPDS_Pave> & ExtPaves();

		/****** BOPDS_PaveBlock::HasEdge ******/
		/****** md5 signature: 1431a428535970b7a422dfbd1ed3d98e ******/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns true if the pave block has edge.
") HasEdge;
		bool HasEdge();

		/****** BOPDS_PaveBlock::HasEdge ******/
		/****** md5 signature: f05bc8224e311580aa38db59cf97a0af ******/
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "
Parameters
----------

Return
-------
theEdge: int

Description
-----------
Query Returns true if the pave block has edge Returns the index of edge <theEdge>.
") HasEdge;
		bool HasEdge(Standard_Integer &OutValue);

		/****** BOPDS_PaveBlock::HasSameBounds ******/
		/****** md5 signature: 587e60bf8c4199c22e06d3dc40f7ce84 ******/
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
Query Returns true if the pave block has pave indices that equal to the pave indices of the pave block <theOther>.
") HasSameBounds;
		bool HasSameBounds(const opencascade::handle<BOPDS_PaveBlock> & theOther);

		/****** BOPDS_PaveBlock::HasShrunkData ******/
		/****** md5 signature: 4dfdd07737391715815b2f7f20ddc633 ******/
		%feature("compactdefaultargs") HasShrunkData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns true if the pave block contains the shrunk data.
") HasShrunkData;
		bool HasShrunkData();

		/****** BOPDS_PaveBlock::Indices ******/
		/****** md5 signature: df4cc204bed9840373ae9c63675958cf ******/
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
Selector Returns the pave indices <theIndex1,theIndex2> of the pave block.
") Indices;
		void Indices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BOPDS_PaveBlock::IsSplitEdge ******/
		/****** md5 signature: cd8d3074fb0dd04216300c5435d0e51d ******/
		%feature("compactdefaultargs") IsSplitEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns true if the edge is equal to the original edge of the pave block.
") IsSplitEdge;
		bool IsSplitEdge();

		/****** BOPDS_PaveBlock::IsSplittable ******/
		/****** md5 signature: f75584b28d17f2506c175be414303f2e ******/
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns False if the pave block has a too short shrunk range and cannot be split, otherwise returns True.
") IsSplittable;
		bool IsSplittable();

		/****** BOPDS_PaveBlock::IsToUpdate ******/
		/****** md5 signature: 4e6eb48aea41b0caf946cc2a72dc2325 ******/
		%feature("compactdefaultargs") IsToUpdate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns true if the pave block contains extra paves.
") IsToUpdate;
		bool IsToUpdate();

		/****** BOPDS_PaveBlock::OriginalEdge ******/
		/****** md5 signature: c5a74a65f029ae14d71ec46f933e3f11 ******/
		%feature("compactdefaultargs") OriginalEdge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the index of original edge of pave block.
") OriginalEdge;
		int OriginalEdge();

		/****** BOPDS_PaveBlock::Pave1 ******/
		/****** md5 signature: c069a811d2db1154789a8c26ef94db8d ******/
		%feature("compactdefaultargs") Pave1;
		%feature("autodoc", "Return
-------
BOPDS_Pave

Description
-----------
Selector Returns the first pave.
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
Selector Returns the second pave.
") Pave2;
		const BOPDS_Pave & Pave2();

		/****** BOPDS_PaveBlock::Range ******/
		/****** md5 signature: 0263be984ee6a87580394839a3fbc3b5 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
theT1: double
theT2: double

Description
-----------
Selector Returns the parametric range <theT1,theT2> of the pave block.
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BOPDS_PaveBlock::RemoveExtPave ******/
		/****** md5 signature: 25e498a536c6ed2341a0d54f515641c0 ******/
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
Modifier Removes a pave with the given vertex number from extra paves.
") RemoveExtPave;
		void RemoveExtPave(const int theVertNum);

		/****** BOPDS_PaveBlock::SetEdge ******/
		/****** md5 signature: 10ef0497a2e2e608e511c8bbe697c8a4 ******/
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
Modifier Sets the index of edge of pave block <theEdge>.
") SetEdge;
		void SetEdge(const int theEdge);

		/****** BOPDS_PaveBlock::SetOriginalEdge ******/
		/****** md5 signature: 125508bd010141707a92dc423e7e8c26 ******/
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
Modifier Sets the index of original edge of the pave block <theEdge>.
") SetOriginalEdge;
		void SetOriginalEdge(const int theEdge);

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
Modifier Sets the first pave <thePave>.
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
Modifier Sets the second pave <thePave>.
") SetPave2;
		void SetPave2(const BOPDS_Pave & thePave);

		/****** BOPDS_PaveBlock::SetShrunkData ******/
		/****** md5 signature: f34669469a8b03a3a5e4d0d9ad309da6 ******/
		%feature("compactdefaultargs") SetShrunkData;
		%feature("autodoc", "
Parameters
----------
theTS1: double
theTS2: double
theBox: Bnd_Box
theIsSplittable: bool

Return
-------
None

Description
-----------
Modifier Sets the shrunk data for the pave block <theTS1>, <theTS2> - shrunk range <theBox> - the bounding box <theIsSplittable> - defines whether the edge can be split.
") SetShrunkData;
		void SetShrunkData(const double theTS1, const double theTS2, const Bnd_Box & theBox, const bool theIsSplittable);

		/****** BOPDS_PaveBlock::ShrunkData ******/
		/****** md5 signature: 0ec4d23dc12b4c0554759f5a368cfdfe ******/
		%feature("compactdefaultargs") ShrunkData;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
theTS1: double
theTS2: double
theIsSplittable: bool

Description
-----------
Selector Returns the shrunk data for the pave block <theTS1>, <theTS2> - shrunk range <theBox> - the bounding box <theIsSplittable> - defines whether the edge can be split.
") ShrunkData;
		void ShrunkData(Standard_Real &OutValue, Standard_Real &OutValue, Bnd_Box & theBox, Standard_Boolean &OutValue);

		/****** BOPDS_PaveBlock::Update ******/
		/****** md5 signature: 3ca5238bc25353199df9b576e2321407 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
theLPB: BOPDS_PaveBlock
theFlag: bool (optional, default to true)

Return
-------
None

Description
-----------
Modifier Updates the pave block. The extra paves are used to create new pave blocks <theLPB>. <theFlag> - if true, the first and second pave are used to produce new pave blocks.
") Update;
		void Update(NCollection_List<opencascade::handle<BOPDS_PaveBlock>> & theLPB, const bool theFlag = true);

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
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns index of the vertex.
") Index;
		int Index();

		/****** BOPDS_Point::Pnt ******/
		/****** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Selector Returns 3D point.
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
Selector Returns 2D point on the first face <thePnt>.
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
Selector Returns 2D point on the second face <thePnt>.
") Pnt2D2;
		const gp_Pnt2d Pnt2D2();

		/****** BOPDS_Point::SetIndex ******/
		/****** md5 signature: 21592ec6eaa1cb4fc2285544b375c931 ******/
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
Modifier Sets the index of the vertex <theIndex>.
") SetIndex;
		void SetIndex(const int theIndex);

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
Modifier Sets 3D point <thePnt>.
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
Modifier Sets 2D point on the first face <thePnt>.
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
Modifier Sets 2D point on the second face <thePnt>.
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
Constructor 
Parameter theAllocator the allocator to manage the memory.
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
Selector Returns the boundung box of the shape.
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
Selector/Modifier Returns the boundung box of the shape.
") ChangeBox;
		Bnd_Box & ChangeBox();

		/****** BOPDS_ShapeInfo::ChangeSubShapes ******/
		/****** md5 signature: 010eeac626d28cc1835dbd11f902f045 ******/
		%feature("compactdefaultargs") ChangeSubShapes;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector/ Modifier Returns the list of indices of sub-shapes.
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
		/****** md5 signature: b9e2a9b45dfb38f69a1162f832901eec ******/
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the flag.
") Flag;
		int Flag();

		/****** BOPDS_ShapeInfo::HasBRep ******/
		/****** md5 signature: a4bcaf8e7e84a89828458c2da33e38c5 ******/
		%feature("compactdefaultargs") HasBRep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns true if the shape has boundary representation.
") HasBRep;
		bool HasBRep();

		/****** BOPDS_ShapeInfo::HasFlag ******/
		/****** md5 signature: ff07820c92809899dda23174585cd2b8 ******/
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Query Returns true if there is flag.
") HasFlag;
		bool HasFlag();

		/****** BOPDS_ShapeInfo::HasFlag ******/
		/****** md5 signature: e9209d746818412a7490417db28b9661 ******/
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "
Parameters
----------

Return
-------
theFlag: int

Description
-----------
Query Returns true if there is flag. Returns the flag theFlag.
") HasFlag;
		bool HasFlag(Standard_Integer &OutValue);

		/****** BOPDS_ShapeInfo::HasReference ******/
		/****** md5 signature: b0aab5f2d7570a900a458ba9ccc411a2 ******/
		%feature("compactdefaultargs") HasReference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasReference;
		bool HasReference();

		/****** BOPDS_ShapeInfo::HasSubShape ******/
		/****** md5 signature: c56bc629e7f48d85b7af0465f0b70b26 ******/
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
Query Returns true if the shape has sub-shape with index theI.
") HasSubShape;
		bool HasSubShape(const int theI);

		/****** BOPDS_ShapeInfo::IsInterfering ******/
		/****** md5 signature: 9652bd4e73fdf4c9f08c558571d3e6aa ******/
		%feature("compactdefaultargs") IsInterfering;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the shape can be participant of an interference //! Flag.
") IsInterfering;
		bool IsInterfering();

		/****** BOPDS_ShapeInfo::Reference ******/
		/****** md5 signature: f97da73ecef07e0c8d9574b25a5a2f49 ******/
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", "Return
-------
int

Description
-----------
Selector Returns the index of a reference information.
") Reference;
		int Reference();

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
Modifier Sets the boundung box of the shape theBox.
") SetBox;
		void SetBox(const Bnd_Box & theBox);

		/****** BOPDS_ShapeInfo::SetFlag ******/
		/****** md5 signature: faf5e2c60591b1e7163033d003ae9096 ******/
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
Modifier Sets the flag.
") SetFlag;
		void SetFlag(const int theI);

		/****** BOPDS_ShapeInfo::SetReference ******/
		/****** md5 signature: 112c45317f2bb8b11fa8e9c5256b07f7 ******/
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
Modifier Sets the index of a reference information.
") SetReference;
		void SetReference(const int theI);

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
Modifier Sets the shape <theS>.
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
Modifier Sets the type of shape theType.
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
Selector Returns the shape.
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
Selector Returns the type of shape.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****** BOPDS_ShapeInfo::SubShapes ******/
		/****** md5 signature: f4e327b938249f1131c923d9a1fadfd7 ******/
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "Return
-------
TColStd_ListOfInteger

Description
-----------
Selector Returns the list of indices of sub-shapes.
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
Constructor theAllocator - the allocator to manage the memory.
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
		/****** md5 signature: 6dcb389feaed64bbbfcb8ffff350b6f7 ******/
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of interfering pairs.
") ExpectedLength;
		int ExpectedLength();

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
		/****** md5 signature: 0a7b505ff53e438121f2c208f8ae7ce8 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there are more pairs of intersected shapes.
") More;
		bool More();

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
Sets the data structure <pDS> to process. It is used to access the shapes and their bounding boxes.
") SetDS;
		void SetDS(const BOPDS_PDS & pDS);

		/****** BOPDS_SubIterator::SetSubSet1 ******/
		/****** md5 signature: 6ee4c1693c7e332173606cb51cf5946a ******/
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
Sets the first set of indices <theLI> to process.
") SetSubSet1;
		void SetSubSet1(const TColStd_ListOfInteger & theLI);

		/****** BOPDS_SubIterator::SetSubSet2 ******/
		/****** md5 signature: 75d415ba5078073865c8d0fcd4d6e2fc ******/
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
Sets the second set of indices <theLI> to process.
") SetSubSet2;
		void SetSubSet2(const TColStd_ListOfInteger & theLI);

		/****** BOPDS_SubIterator::SubSet1 ******/
		/****** md5 signature: 97915776bc92a1f5dd0a804c9e63bcf9 ******/
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
		/****** md5 signature: d6cdd8f53e14b0c5efcc1f9459cd451a ******/
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
		/****** md5 signature: 5ccfc0ac3b3b4c10c79203b7c68bc8f9 ******/
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
Returns indices (DS) of intersected shapes theIndex1 - the index of the first shape theIndex2 - the index of the second shape.
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
		/****** md5 signature: 6b8336aacefd882f8094170e547a1ff3 ******/
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
Returns true if the type <theT> correspond to a shape having boundary representation.
") HasBRep;
		static bool HasBRep(const TopAbs_ShapeEnum theT);

		/****** BOPDS_Tools::IsInterfering ******/
		/****** md5 signature: 7961f311c0286528a85e02a87a656f47 ******/
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
Returns true if the type <theT> can be participant of an interference.
") IsInterfering;
		static bool IsInterfering(const TopAbs_ShapeEnum theT);

		/****** BOPDS_Tools::TypeToInteger ******/
		/****** md5 signature: 3331fcef80050d4973835b8ed7b00833 ******/
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
Converts the conmbination of two types of shape <theT1>,<theT2> to the one integer value, that is returned.
") TypeToInteger;
		static int TypeToInteger(const TopAbs_ShapeEnum theT1, const TopAbs_ShapeEnum theT2);

		/****** BOPDS_Tools::TypeToInteger ******/
		/****** md5 signature: 5b59af9cf6f0cdb17e5d79da77166b10 ******/
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
Converts the type of shape <theT>, to integer value, that is returned.
") TypeToInteger;
		static int TypeToInteger(const TopAbs_ShapeEnum theT);

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
		/****** md5 signature: 225ca9d7ce03a18b8754a778edfeb955 ******/
		%feature("compactdefaultargs") BOPDS_InterfEE;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
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
/** * Selector * Returns the info of common part * 
Return: * common part */.
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
/** * Modifier * Sets the info of common part * 
Parameter theCP * common part */.
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
		/****** md5 signature: 2adb58ab66bd34571d906a207b794ba2 ******/
		%feature("compactdefaultargs") BOPDS_InterfEF;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
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
/** * Selector * Returns the info of common part * 
Return: * common part */.
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
/** * Modifier * Sets the info of common part * 
Parameter theCP * common part */.
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
		/****** md5 signature: d631ec337749c00812067a3aff8618a3 ******/
		%feature("compactdefaultargs") BOPDS_InterfEZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
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
/** * Constructor */.
") BOPDS_InterfFF;
		 BOPDS_InterfFF();

		/****** BOPDS_InterfFF::ChangeCurves ******/
		/****** md5 signature: 4c57192d10cc86a40d7d1087b35f53fd ******/
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_Curve>

Description
-----------
/** * Selector/Modifier * Returns the intersection curves * 
Return: * intersection curves */.
") ChangeCurves;
		NCollection_DynamicArray<BOPDS_Curve> & ChangeCurves();

		/****** BOPDS_InterfFF::ChangePoints ******/
		/****** md5 signature: aac9c1b42a70af3e6bff10eda7281e4f ******/
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_Point>

Description
-----------
/** * Selector/Modifier * Returns the intersection points * 
Return: * intersection points */.
") ChangePoints;
		NCollection_DynamicArray<BOPDS_Point> & ChangePoints();

		/****** BOPDS_InterfFF::Curves ******/
		/****** md5 signature: fa39cd758ab9dcd35f40b5112a268592 ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_Curve>

Description
-----------
/** * Selector * Returns the intersection curves * 
Return: * intersection curves */.
") Curves;
		NCollection_DynamicArray<BOPDS_Curve> Curves();

		/****** BOPDS_InterfFF::Init ******/
		/****** md5 signature: 67cae55cef2e39fa32338808680a53f2 ******/
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
		void Init(const int theNbCurves, const int theNbPoints);

		/****** BOPDS_InterfFF::Points ******/
		/****** md5 signature: 1eabb4d6b34db38732a6cd2c930d8626 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<BOPDS_Point>

Description
-----------
/** * Selector * Returns the intersection points * 
Return: * intersection points */.
") Points;
		const NCollection_DynamicArray<BOPDS_Point> & Points();

		/****** BOPDS_InterfFF::SetTangentFaces ******/
		/****** md5 signature: a0d5aea1cb04f1f47cdb384bfec35f9e ******/
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
/** * Modifier * Sets the flag of whether the faces are tangent * 
Parameter theFlag * the flag */.
") SetTangentFaces;
		void SetTangentFaces(const bool theFlag);

		/****** BOPDS_InterfFF::TangentFaces ******/
		/****** md5 signature: b1c6f627579601163f2c18b095788995 ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Selector * Returns the flag whether the faces are tangent * 
Return: * the flag */.
") TangentFaces;
		bool TangentFaces();

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
		/****** md5 signature: 9a8fd4e28c3c24ef7aac3b21a21c6b9f ******/
		%feature("compactdefaultargs") BOPDS_InterfFZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
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
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
") BOPDS_InterfVE;
		 BOPDS_InterfVE(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_InterfVE::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
/** * Selector * Returrns the value of parameter * of the point of the vertex * on the curve of the edge * 
Return: * value of parameter */.
") Parameter;
		double Parameter();

		/****** BOPDS_InterfVE::SetParameter ******/
		/****** md5 signature: 05e70c2a6fb1efa13fb25fdabc0c631c ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
theT: double

Return
-------
None

Description
-----------
/** * Modifier * Sets the value of parameter * of the point of the vertex * on the curve of the edge * 
Parameter theT * value of parameter */.
") SetParameter;
		void SetParameter(const double theT);

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
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
") BOPDS_InterfVF;
		 BOPDS_InterfVF(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_InterfVF::SetUV ******/
		/****** md5 signature: bc15c91300a23f5541f183f5fce775e4 ******/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
None

Description
-----------
/** * Modifier * Sets the value of parameters * of the point of the vertex * on the surface of of the face * 
Parameter theU * value of U parameter * 
Parameter theV * value of U parameter */.
") SetUV;
		void SetUV(const double theU, const double theV);

		/****** BOPDS_InterfVF::UV ******/
		/****** md5 signature: 72b5d3fd49931d1e11e866cdf4c9de6c ******/
		%feature("compactdefaultargs") UV;
		%feature("autodoc", "
Parameters
----------

Return
-------
theU: double
theV: double

Description
-----------
/** * Selector * Returns the value of parameters * of the point of the vertex * on the surface of of the face * 
Parameter theU * value of U parameter * 
Parameter theV * value of U parameter */.
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
		/****** md5 signature: 43902dd32743dc77250d0e4c695f831f ******/
		%feature("compactdefaultargs") BOPDS_InterfVV;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
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
		/****** md5 signature: 242f99ea01e62827cdff34c2be475eba ******/
		%feature("compactdefaultargs") BOPDS_InterfVZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
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
		/****** md5 signature: c76704a4fc499329a2f7f4cb870d5174 ******/
		%feature("compactdefaultargs") BOPDS_InterfZZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Constructor */.
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
/** * Constructor * 
Parameter theAllocator * allocator to manage the memory */.
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
Constructor 
Parameter theAllocator the allocator to manage the memory.
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPDS_IteratorSI::UpdateByLevelOfCheck ******/
		/****** md5 signature: f71946a518eb525aea05e1af04855f41 ******/
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
Updates the lists of possible intersections according to the value of <theLevel>. It defines which interferferences will be checked: 0 - only V/V; 1 - V/V and V/E; 2 - V/V, V/E and E/E; 3 - V/V, V/E, E/E and V/F; 4 - V/V, V/E, E/E, V/F and E/F; other - all interferences.
") UpdateByLevelOfCheck;
		void UpdateByLevelOfCheck(const int theLevel);

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
