/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BOPDS

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BOPDS_headers.i

/* typedefs */
typedef NCollection_Map <BOPDS_PassKey , BOPDS_PassKeyMapHasher> BOPDS_MapOfPassKey;
typedef BOPCol_Array1 <BOPDS_InterfVZ> BOPDS_VectorOfInterfVZ;
typedef NCollection_DataMap <Handle_BOPDS_PaveBlock , BOPCol_ListOfInteger , TColStd_MapTransientHasher> BOPDS_DataMapOfPaveBlockListOfInteger;
typedef NCollection_List <BOPDS_Pave> BOPDS_ListOfPave;
typedef BOPDS_DataMapOfPaveBlockListOfPaveBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfPaveBlock;
typedef BOPCol_Array1 <BOPDS_InterfEZ> BOPDS_VectorOfInterfEZ;
typedef NCollection_IndexedDataMap <Handle_BOPDS_PaveBlock , BOPCol_ListOfInteger , TColStd_MapTransientHasher> BOPDS_IndexedDataMapOfPaveBlockListOfInteger;
typedef BOPCol_Array1 <BOPDS_InterfEE> BOPDS_VectorOfInterfEE;
typedef BOPCol_Array1 <BOPDS_InterfEF> BOPDS_VectorOfInterfEF;
typedef BOPDS_IteratorSI * BOPDS_PIteratorSI;
typedef BOPCol_Array1 <BOPDS_InterfZZ> BOPDS_VectorOfInterfZZ;
typedef BOPCol_Array1 <BOPDS_InterfVE> BOPDS_VectorOfInterfVE;
typedef BOPDS_DataMapOfShapeCoupleOfPaveBlocks::Iterator BOPDS_DataMapIteratorOfDataMapOfShapeCoupleOfPaveBlocks;
typedef BOPCol_Array1 <BOPDS_InterfVF> BOPDS_VectorOfInterfVF;
typedef BOPDS_ListOfPave::Iterator BOPDS_ListIteratorOfListOfPave;
typedef BOPCol_Array1 <BOPDS_Curve> BOPDS_VectorOfCurve;
typedef BOPCol_Array1 <BOPDS_ShapeInfo> BOPDS_VectorOfShapeInfo;
typedef NCollection_Map <Handle_BOPDS_PaveBlock , TColStd_MapTransientHasher> BOPDS_MapOfPaveBlock;
typedef BOPCol_Array1 <BOPDS_IndexRange> BOPDS_VectorOfIndexRange;
typedef BOPCol_Array1 <BOPDS_InterfFF> BOPDS_VectorOfInterfFF;
typedef BOPCol_Array1 <BOPDS_InterfFZ> BOPDS_VectorOfInterfFZ;
typedef BOPDS_MapOfPave::Iterator BOPDS_MapIteratorMapOfPave;
typedef NCollection_DataMap <Standard_Integer , BOPDS_ListOfPaveBlock , TColStd_MapIntegerHasher> BOPDS_DataMapOfIntegerListOfPaveBlock;
typedef BOPDS_DataMapOfPassKeyListOfPaveBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPassKeyListOfPaveBlock;
typedef BOPDS_MapOfPassKeyBoolean::Iterator BOPDS_MapIteratorMapOfPassKeyBoolean;
typedef NCollection_Map <BOPDS_PassKeyBoolean , BOPDS_PassKeyMapHasher> BOPDS_MapOfPassKeyBoolean;
typedef BOPDS_DS * BOPDS_PDS;
typedef BOPDS_ListOfPassKeyBoolean::Iterator BOPDS_ListIteratorOfListOfPassKeyBoolean;
typedef NCollection_IndexedMap <Handle_BOPDS_PaveBlock , TColStd_MapTransientHasher> BOPDS_IndexedMapOfPaveBlock;
typedef BOPDS_Iterator * BOPDS_PIterator;
typedef BOPDS_DataMapOfPaveBlockCommonBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockCommonBlock;
typedef BOPDS_MapOfPassKey::Iterator BOPDS_MapIteratorMapOfPassKey;
typedef BOPDS_MapOfCommonBlock::Iterator BOPDS_MapIteratorOfMapOfCommonBlock;
typedef NCollection_DataMap <BOPDS_PassKey , BOPDS_ListOfPaveBlock , BOPDS_PassKeyMapHasher> BOPDS_DataMapOfPassKeyListOfPaveBlock;
typedef NCollection_Map <Handle_BOPDS_CommonBlock , TColStd_MapTransientHasher> BOPDS_MapOfCommonBlock;
typedef BOPDS_ListOfPaveBlock::Iterator BOPDS_ListIteratorOfListOfPaveBlock;
typedef NCollection_Map <BOPDS_Pave , BOPDS_PaveMapHasher> BOPDS_MapOfPave;
typedef BOPCol_Array1 <BOPDS_ListOfPaveBlock> BOPDS_VectorOfListOfPaveBlock;
typedef BOPCol_Array1 <BOPDS_InterfVV> BOPDS_VectorOfInterfVV;
typedef BOPCol_Array1 <BOPDS_Point> BOPDS_VectorOfPoint;
typedef BOPDS_DataMapOfPaveBlockListOfInteger::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfInteger;
typedef NCollection_DataMap <Handle_BOPDS_PaveBlock , BOPDS_ListOfPaveBlock , TColStd_MapTransientHasher> BOPDS_DataMapOfPaveBlockListOfPaveBlock;
typedef BOPDS_MapOfPaveBlock::Iterator BOPDS_MapIteratorOfMapOfPaveBlock;
typedef NCollection_List <Handle_BOPDS_PaveBlock> BOPDS_ListOfPaveBlock;
typedef NCollection_DataMap <TopoDS_Shape , BOPDS_CoupleOfPaveBlocks , TopTools_ShapeMapHasher> BOPDS_DataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_IndexedDataMap <TopoDS_Shape , BOPDS_CoupleOfPaveBlocks , TopTools_ShapeMapHasher> BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks;
typedef BOPCol_Array1 <BOPDS_FaceInfo> BOPDS_VectorOfFaceInfo;
typedef NCollection_IndexedDataMap <Handle_BOPDS_PaveBlock , BOPDS_ListOfPaveBlock , TColStd_MapTransientHasher> BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock;
typedef BOPCol_Array1 <BOPDS_ListOfPassKeyBoolean> BOPDS_VectorOfListOfPassKeyBoolean;
typedef NCollection_List <BOPDS_PassKeyBoolean> BOPDS_ListOfPassKeyBoolean;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BOPDS_CommonBlock;
class BOPDS_CommonBlock : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock ();
		%feature("autodoc", "	* Contructor <theAllocator> - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Modifier Adds the pave block <aPB> to the list of pave blocks of the common block

	:param aPB:
	:type aPB: Handle_BOPDS_PaveBlock &
	:rtype: None
") AddPaveBlock;
		void AddPaveBlock (const Handle_BOPDS_PaveBlock & aPB);
		%feature("autodoc", "	* Modifier Adds the list of pave blocks <aLPB> to the list of pave blocks of the common block

	:param aLPB:
	:type aLPB: BOPDS_ListOfPaveBlock &
	:rtype: None
") AddPaveBlocks;
		void AddPaveBlocks (const BOPDS_ListOfPaveBlock & aLPB);
		%feature("autodoc", "	* Modifier Adds the index of the face <aF> to the list of indices of faces of the common block

	:param aF:
	:type aF: Standard_Integer
	:rtype: None
") AddFace;
		void AddFace (const Standard_Integer aF);
		%feature("autodoc", "	* Modifier Adds the list of indices of faces <aLF> to the list of indices of faces of the common block

	:param aLF:
	:type aLF: BOPCol_ListOfInteger &
	:rtype: None
") AddFaces;
		void AddFaces (const BOPCol_ListOfInteger & aLF);
		%feature("autodoc", "	* Selector Returns the list of pave blocks of the common block

	:rtype: BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks ();
		%feature("autodoc", "	* Selector Returns the list of indices of faces of the common block

	:rtype: BOPCol_ListOfInteger
") Faces;
		const BOPCol_ListOfInteger & Faces ();
		%feature("autodoc", "	* Selector Returns the first pave block of the common block

	:rtype: Handle_BOPDS_PaveBlock
") PaveBlock1;
		const Handle_BOPDS_PaveBlock & PaveBlock1 ();
		%feature("autodoc", "	* Selector Returns the pave block that belongs to the edge with index <theIx>

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: Handle_BOPDS_PaveBlock
") PaveBlockOnEdge;
		Handle_BOPDS_PaveBlock & PaveBlockOnEdge (const Standard_Integer theIndex);
		%feature("autodoc", "	* Query Returns true if the common block contains a pave block that belongs to the face with index <theIx>

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") IsPaveBlockOnFace;
		Standard_Boolean IsPaveBlockOnFace (const Standard_Integer theIndex);
		%feature("autodoc", "	* Query Returns true if the common block contains a pave block that belongs to the edge with index <theIx>

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") IsPaveBlockOnEdge;
		Standard_Boolean IsPaveBlockOnEdge (const Standard_Integer theIndex);
		%feature("autodoc", "	* Query Returns true if the common block contains a pave block that is equal to <thePB>

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* Query Returns true if the common block contains the face with index equal to <theF>

	:param theF:
	:type theF: Standard_Integer
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theF);
		%feature("autodoc", "	* Modifier Assign the index <theEdge> as the edge index to all pave blocks of the common block

	:param theEdge:
	:type theEdge: Standard_Integer
	:rtype: None
") SetEdge;
		void SetEdge (const Standard_Integer theEdge);
		%feature("autodoc", "	* Selector Returns the index of the edge of all pave blocks of the common block

	:rtype: int
") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") BOPDS_CommonBlock::~BOPDS_CommonBlock %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_CommonBlock {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BOPDS_CommonBlock {
	Handle_BOPDS_CommonBlock GetHandle() {
	return *(Handle_BOPDS_CommonBlock*) &$self;
	}
};

%nodefaultctor Handle_BOPDS_CommonBlock;
class Handle_BOPDS_CommonBlock : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BOPDS_CommonBlock();
        Handle_BOPDS_CommonBlock(const Handle_BOPDS_CommonBlock &aHandle);
        Handle_BOPDS_CommonBlock(const BOPDS_CommonBlock *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BOPDS_CommonBlock DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BOPDS_CommonBlock {
    BOPDS_CommonBlock* GetObject() {
    return (BOPDS_CommonBlock*)$self->Access();
    }
};
%feature("shadow") Handle_BOPDS_CommonBlock::~Handle_BOPDS_CommonBlock %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BOPDS_CommonBlock {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BOPDS_CoupleOfPaveBlocks;
class BOPDS_CoupleOfPaveBlocks {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks ();
		%feature("autodoc", "	* /** * Constructor * @param thePB1 * first pave block * @param thePB2 * secondt pave block */

	:param thePB1:
	:type thePB1: Handle_BOPDS_PaveBlock &
	:param thePB2:
	:type thePB2: Handle_BOPDS_PaveBlock &
	:rtype: None
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks (const Handle_BOPDS_PaveBlock & thePB1,const Handle_BOPDS_PaveBlock & thePB2);
		%feature("autodoc", "	* /** * Sets an index * @param theIndex * index */

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("autodoc", "	* /** * Returns the index * returns * index */

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* /** * Sets an index of an interference * @param theIndex * index of an interference */

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") SetIndexInterf;
		void SetIndexInterf (const Standard_Integer theIndex);
		%feature("autodoc", "	* /** * Returns the index of an interference * returns * index of an interference */

	:rtype: int
") IndexInterf;
		Standard_Integer IndexInterf ();
		%feature("autodoc", "	* /** * Sets pave blocks * @param thePB1 * first pave block * @param thePB2 * secondt pave block */

	:param thePB1:
	:type thePB1: Handle_BOPDS_PaveBlock &
	:param thePB2:
	:type thePB2: Handle_BOPDS_PaveBlock &
	:rtype: None
") SetPaveBlocks;
		void SetPaveBlocks (const Handle_BOPDS_PaveBlock & thePB1,const Handle_BOPDS_PaveBlock & thePB2);
		%feature("autodoc", "	* /** * Returns pave blocks * @param thePB1 * the first pave block * @param thePB2 * the second pave block */

	:param thePB1:
	:type thePB1: Handle_BOPDS_PaveBlock &
	:param thePB2:
	:type thePB2: Handle_BOPDS_PaveBlock &
	:rtype: None
") PaveBlocks;
		void PaveBlocks (Handle_BOPDS_PaveBlock & thePB1,Handle_BOPDS_PaveBlock & thePB2);
		%feature("autodoc", "	* /** * Sets the first pave block * @param thePB * the first pave block */

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: None
") SetPaveBlock1;
		void SetPaveBlock1 (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* /** * Returns the first pave block * returns * the first pave block */

	:rtype: Handle_BOPDS_PaveBlock
") PaveBlock1;
		const Handle_BOPDS_PaveBlock & PaveBlock1 ();
		%feature("autodoc", "	* /** * Sets the second pave block * @param thePB * the second pave block */

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: None
") SetPaveBlock2;
		void SetPaveBlock2 (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* /** * Returns the second pave block * returns * the second pave block */

	:rtype: Handle_BOPDS_PaveBlock
") PaveBlock2;
		const Handle_BOPDS_PaveBlock & PaveBlock2 ();
};


%feature("shadow") BOPDS_CoupleOfPaveBlocks::~BOPDS_CoupleOfPaveBlocks %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_CoupleOfPaveBlocks {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_Curve;
class BOPDS_Curve {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Curve;
		 BOPDS_Curve ();
		%feature("autodoc", "	* Contructor <theAllocator> - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_Curve;
		 BOPDS_Curve (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Modifier Sets the curve <theC>

	:param theC:
	:type theC: IntTools_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const IntTools_Curve & theC);
		%feature("autodoc", "	* Selector Returns the curve

	:rtype: IntTools_Curve
") Curve;
		const IntTools_Curve & Curve ();
		%feature("autodoc", "	* Modifier Sets the bounding box <theBox> of the curve

	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") SetBox;
		void SetBox (const Bnd_Box & theBox);
		%feature("autodoc", "	* Selector Returns the bounding box of the curve

	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
		%feature("autodoc", "	* Selector/Modifier Returns the bounding box of the curve

	:rtype: Bnd_Box
") ChangeBox;
		Bnd_Box & ChangeBox ();
		%feature("autodoc", "	:param theLPB:
	:type theLPB: BOPDS_ListOfPaveBlock &
	:rtype: None
") SetPaveBlocks;
		void SetPaveBlocks (const BOPDS_ListOfPaveBlock & theLPB);
		%feature("autodoc", "	* Selector Returns the list of pave blocks of the curve

	:rtype: BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks ();
		%feature("autodoc", "	* Selector/Modifier Returns the list of pave blocks of the curve

	:rtype: BOPDS_ListOfPaveBlock
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks ();
		%feature("autodoc", "	* Creates initial pave block of the curve

	:rtype: None
") InitPaveBlock1;
		void InitPaveBlock1 ();
		%feature("autodoc", "	* Selector/Modifier Returns initial pave block of the curve

	:rtype: Handle_BOPDS_PaveBlock
") ChangePaveBlock1;
		Handle_BOPDS_PaveBlock & ChangePaveBlock1 ();
		%feature("autodoc", "	* Selector Returns list of indices of technologic vertices of the curve

	:rtype: BOPCol_ListOfInteger
") TechnoVertices;
		const BOPCol_ListOfInteger & TechnoVertices ();
		%feature("autodoc", "	* Selector/Modifier Returns list of indices of technologic vertices of the curve

	:rtype: BOPCol_ListOfInteger
") ChangeTechnoVertices;
		BOPCol_ListOfInteger & ChangeTechnoVertices ();
		%feature("autodoc", "	* Query Returns true if at least one pave block of the curve has edge

	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge ();
};


%feature("shadow") BOPDS_Curve::~BOPDS_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_DS;
class BOPDS_DS {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_DS;
		 BOPDS_DS ();
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_DS;
		 BOPDS_DS (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Clears the contents

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Selector

	:rtype: BOPCol_BaseAllocator
") Allocator;
		const BOPCol_BaseAllocator & Allocator ();
		%feature("autodoc", "	* Modifier Sets the arguments [theLS] of an operation

	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") SetArguments;
		void SetArguments (const BOPCol_ListOfShape & theLS);
		%feature("autodoc", "	* Selector Returns the arguments of an operation

	:rtype: BOPCol_ListOfShape
") Arguments;
		const BOPCol_ListOfShape & Arguments ();
		%feature("autodoc", "	* Initializes the data structure for the arguments

	:rtype: None
") Init;
		void Init ();
		%feature("autodoc", "	* Selector Returns the total number of shapes stored

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "	* Selector Returns the total number of source shapes stored

	:rtype: int
") NbSourceShapes;
		Standard_Integer NbSourceShapes ();
		%feature("autodoc", "	* Selector Returns the number of index ranges

	:rtype: int
") NbRanges;
		Standard_Integer NbRanges ();
		%feature("autodoc", "	* Selector Returns the index range 'i'

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: BOPDS_IndexRange
") Range;
		const BOPDS_IndexRange & Range (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the rank of the shape of index 'i'

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: int
") Rank;
		Standard_Integer Rank (const Standard_Integer theIndex);
		%feature("autodoc", "	* Returns true if the shape of index 'i' is not the source shape/sub-shape

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") IsNewShape;
		Standard_Boolean IsNewShape (const Standard_Integer theIndex);
		%feature("autodoc", "	* Modifier Appends the information about the shape [theSI] to the data structure Returns the index of theSI in the data structure

	:param theSI:
	:type theSI: BOPDS_ShapeInfo &
	:rtype: int
") Append;
		Standard_Integer Append (const BOPDS_ShapeInfo & theSI);
		%feature("autodoc", "	* Modifier Appends the default information about the shape [theS] to the data structure Returns the index of theS in the data structure

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: int
") Append;
		Standard_Integer Append (const TopoDS_Shape & theS);
		%feature("autodoc", "	* Selector Returns the information about the shape with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: BOPDS_ShapeInfo
") ShapeInfo;
		const BOPDS_ShapeInfo & ShapeInfo (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector/Modifier Returns the information about the shape with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: BOPDS_ShapeInfo
") ChangeShapeInfo;
		BOPDS_ShapeInfo & ChangeShapeInfo (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the shape with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the index of the shape theS

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & theS);
		%feature("autodoc", "	* Selector Returns the information about pave blocks on source edges

	:rtype: BOPDS_VectorOfListOfPaveBlock
") PaveBlocksPool;
		const BOPDS_VectorOfListOfPaveBlock & PaveBlocksPool ();
		%feature("autodoc", "	* Selector/Modifier Returns the information about pave blocks on source edges

	:rtype: BOPDS_VectorOfListOfPaveBlock
") ChangePaveBlocksPool;
		BOPDS_VectorOfListOfPaveBlock & ChangePaveBlocksPool ();
		%feature("autodoc", "	* Query Returns true if the shape with index theIndex has the information about pave blocks

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") HasPaveBlocks;
		Standard_Boolean HasPaveBlocks (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the pave blocks for the shape with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector/Modifier Returns the pave blocks for the shape with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: BOPDS_ListOfPaveBlock
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks (const Standard_Integer theIndex);
		%feature("autodoc", "	* Update the pave blocks for the all shapes in data structure

	:rtype: None
") UpdatePaveBlocks;
		void UpdatePaveBlocks ();
		%feature("autodoc", "	* Update the pave block thePB

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: None
") UpdatePaveBlock;
		void UpdatePaveBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* Update the common block theCB

	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:rtype: None
") UpdateCommonBlock;
		void UpdateCommonBlock (const Handle_BOPDS_CommonBlock & theCB);
		%feature("autodoc", "	* Query Returns true if the pave block is common block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: bool
") IsCommonBlock;
		Standard_Boolean IsCommonBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* Selector Returns the common block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: Handle_BOPDS_CommonBlock
") CommonBlock;
		Handle_BOPDS_CommonBlock CommonBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* Modifier Sets the common block <theCB>

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:rtype: None
") SetCommonBlock;
		void SetCommonBlock (const Handle_BOPDS_PaveBlock & thePB,const Handle_BOPDS_CommonBlock & theCB);
		%feature("autodoc", "	* Selector Returns the real first pave block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: Handle_BOPDS_PaveBlock
") RealPaveBlock;
		Handle_BOPDS_PaveBlock RealPaveBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* Query Returns true if common block contains more then one pave block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: bool
") IsCommonBlockOnEdge;
		Standard_Boolean IsCommonBlockOnEdge (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "	* Selector Returns the information about state of faces

	:rtype: BOPDS_VectorOfFaceInfo
") FaceInfoPool;
		const BOPDS_VectorOfFaceInfo & FaceInfoPool ();
		%feature("autodoc", "	* Query Returns true if the shape with index theIndex has the information about state of face

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") HasFaceInfo;
		Standard_Boolean HasFaceInfo (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the state of face with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: BOPDS_FaceInfo
") FaceInfo;
		const BOPDS_FaceInfo & FaceInfo (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector/Modifier Returns the state of face with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: BOPDS_FaceInfo
") ChangeFaceInfo;
		BOPDS_FaceInfo & ChangeFaceInfo (const Standard_Integer theIndex);
		%feature("autodoc", "	* Update the state In of face with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn (const Standard_Integer theIndex);
		%feature("autodoc", "	* Update the state On of face with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") UpdateFaceInfoOn;
		void UpdateFaceInfoOn (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the state On [theMPB,theMVP] of face with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theMPB:
	:type theMPB: BOPDS_IndexedMapOfPaveBlock &
	:param theMVP:
	:type theMVP: BOPCol_MapOfInteger &
	:rtype: None
") FaceInfoOn;
		void FaceInfoOn (const Standard_Integer theIndex,BOPDS_IndexedMapOfPaveBlock & theMPB,BOPCol_MapOfInteger & theMVP);
		%feature("autodoc", "	* Selector Returns the state In [theMPB,theMVP] of face with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theMPB:
	:type theMPB: BOPDS_IndexedMapOfPaveBlock &
	:param theMVP:
	:type theMVP: BOPCol_MapOfInteger &
	:rtype: None
") FaceInfoIn;
		void FaceInfoIn (const Standard_Integer theIndex,BOPDS_IndexedMapOfPaveBlock & theMPB,BOPCol_MapOfInteger & theMVP);
		%feature("autodoc", "	* Selector Returns the indices of alone vertices for the face with index theIndex

	:param theF:
	:type theF: Standard_Integer
	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") AloneVertices;
		void AloneVertices (const Standard_Integer theF,BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "	* Refine the state On for the all faces having state information ++

	:rtype: None
") RefineFaceInfoOn;
		void RefineFaceInfoOn ();
		%feature("autodoc", "	* Returns the indices of vertices and pave blocks that are On/In for the faces with indices theF1, theF2

	:param theF1:
	:type theF1: Standard_Integer
	:param theF2:
	:type theF2: Standard_Integer
	:param theMI:
	:type theMI: BOPCol_MapOfInteger &
	:param aMPB:
	:type aMPB: BOPDS_IndexedMapOfPaveBlock &
	:rtype: None
") VerticesOnIn;
		void VerticesOnIn (const Standard_Integer theF1,const Standard_Integer theF2,BOPCol_MapOfInteger & theMI,BOPDS_IndexedMapOfPaveBlock & aMPB);
		%feature("autodoc", "	* Returns the indices of edges that are shared for the faces with indices theF1, theF2 same domain shapes

	:param theF1:
	:type theF1: Standard_Integer
	:param theF2:
	:type theF2: Standard_Integer
	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") SharedEdges;
		void SharedEdges (const Standard_Integer theF1,const Standard_Integer theF2,BOPCol_ListOfInteger & theLI,const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Selector Returns the collection same domain shapes

	:rtype: BOPCol_DataMapOfIntegerInteger
") ShapesSD;
		BOPCol_DataMapOfIntegerInteger & ShapesSD ();
		%feature("autodoc", "	* Modifier Adds the information about same domain shapes with indices theIndex, theIndexSD

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theIndexSD:
	:type theIndexSD: Standard_Integer
	:rtype: None
") AddShapeSD;
		void AddShapeSD (const Standard_Integer theIndex,const Standard_Integer theIndexSD);
		%feature("autodoc", "	* Query Returns true if the shape with index theIndex has the same domain shape. In this case theIndexSD will contain the index of same domain shape found interferences

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theIndexSD:
	:type theIndexSD: Standard_Integer &
	:rtype: bool
") HasShapeSD;
		Standard_Boolean HasShapeSD (const Standard_Integer theIndex,Standard_Integer &OutValue);
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Vertex

	:rtype: BOPDS_VectorOfInterfVV
") InterfVV;
		BOPDS_VectorOfInterfVV & InterfVV ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Edge

	:rtype: BOPDS_VectorOfInterfVE
") InterfVE;
		BOPDS_VectorOfInterfVE & InterfVE ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Face

	:rtype: BOPDS_VectorOfInterfVF
") InterfVF;
		BOPDS_VectorOfInterfVF & InterfVF ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Edge/Edge

	:rtype: BOPDS_VectorOfInterfEE
") InterfEE;
		BOPDS_VectorOfInterfEE & InterfEE ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Edge/Face

	:rtype: BOPDS_VectorOfInterfEF
") InterfEF;
		BOPDS_VectorOfInterfEF & InterfEF ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Face/Face

	:rtype: BOPDS_VectorOfInterfFF
") InterfFF;
		BOPDS_VectorOfInterfFF & InterfFF ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Solid

	:rtype: BOPDS_VectorOfInterfVZ
") InterfVZ;
		BOPDS_VectorOfInterfVZ & InterfVZ ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Edge/Solid

	:rtype: BOPDS_VectorOfInterfEZ
") InterfEZ;
		BOPDS_VectorOfInterfEZ & InterfEZ ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Face/Solid

	:rtype: BOPDS_VectorOfInterfFZ
") InterfFZ;
		BOPDS_VectorOfInterfFZ & InterfFZ ();
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Solid/Solid

	:rtype: BOPDS_VectorOfInterfZZ
") InterfZZ;
		BOPDS_VectorOfInterfZZ & InterfZZ ();
		%feature("autodoc", "	* Returns the number of types of the interferences

	:rtype: int
") NbInterfTypes;
		static Standard_Integer NbInterfTypes ();
		%feature("autodoc", "	* Modifier Adds the information about an interference between shapes with indices theI1, theI2 to the summary table of interferences

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:rtype: None
") AddInterf;
		void AddInterf (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "	* Query Returns true if the shape with index theI is interferred

	:param theI:
	:type theI: Standard_Integer
	:rtype: bool
") HasInterf;
		Standard_Boolean HasInterf (const Standard_Integer theI);
		%feature("autodoc", "	* Query Returns true if the shapes with indices theI1, theI2 are interferred

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:rtype: bool
") HasInterf;
		Standard_Boolean HasInterf (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "	* Query Returns true if the shape with index theI1 is interfered with any sub-shape of the shape with index theI2 (theFlag=true) all sub-shapes of the shape with index theI2 (theFlag=false)

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:param theFlag: default value is Standard_True
	:type theFlag: bool
	:rtype: bool
") HasInterfShapeSubShapes;
		Standard_Boolean HasInterfShapeSubShapes (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Boolean theFlag = Standard_True);
		%feature("autodoc", "	* Query Returns true if the shapes with indices theI1, theI2 have interferred sub-shapes

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:rtype: bool
") HasInterfSubShapes;
		Standard_Boolean HasInterfSubShapes (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "	* Selector Returns the table of interferences debug

	:rtype: BOPDS_MapOfPassKey
") Interferences;
		const BOPDS_MapOfPassKey & Interferences ();
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("autodoc", "	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:rtype: None
") SortPaveBlocks;
		void SortPaveBlocks (const Handle_BOPDS_CommonBlock & theCB);
		%feature("autodoc", "	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:param theI:
	:type theI: Standard_Integer &
	:rtype: bool
") IsToSort;
		Standard_Boolean IsToSort (const Handle_BOPDS_CommonBlock & theCB,Standard_Integer &OutValue);
		%feature("autodoc", "	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:rtype: bool
") IsSubShape;
		Standard_Boolean IsSubShape (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "	* Fills theLP with sorted paves of the shape with index theIndex

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theLP:
	:type theLP: BOPDS_ListOfPave &
	:rtype: None
") Paves;
		void Paves (const Standard_Integer theIndex,BOPDS_ListOfPave & theLP);
		%feature("autodoc", "	* Updates tolerance of the sub-shapes of the shape with index <theIndex>.

	:param theIndex:
	:type theIndex: Standard_Integer
	:param theTolerance:
	:type theTolerance: float
	:rtype: None
") UpdateEdgeTolerance;
		void UpdateEdgeTolerance (const Standard_Integer theIndex,const Standard_Real theTolerance);
};


%feature("shadow") BOPDS_DS::~BOPDS_DS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_DS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_FaceInfo;
class BOPDS_FaceInfo {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo ();
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Clears the contents

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Modifier Sets the index of the face <theI>

	:param theI:
	:type theI: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theI);
		%feature("autodoc", "	* Selector Returns the index of the face In

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Selector Returns the pave blocks of the face that have state In

	:rtype: BOPDS_IndexedMapOfPaveBlock
") PaveBlocksIn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksIn ();
		%feature("autodoc", "	* Selector/Modifier Returns the pave blocks of the face that have state In

	:rtype: BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksIn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksIn ();
		%feature("autodoc", "	* Selector Returns the list of indices for vertices of the face that have state In

	:rtype: BOPCol_MapOfInteger
") VerticesIn;
		const BOPCol_MapOfInteger & VerticesIn ();
		%feature("autodoc", "	* Selector/Modifier Returns the list of indices for vertices of the face that have state In On

	:rtype: BOPCol_MapOfInteger
") ChangeVerticesIn;
		BOPCol_MapOfInteger & ChangeVerticesIn ();
		%feature("autodoc", "	* Selector Returns the pave blocks of the face that have state On

	:rtype: BOPDS_IndexedMapOfPaveBlock
") PaveBlocksOn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksOn ();
		%feature("autodoc", "	* Selector/Modifier Returns the pave blocks of the face that have state On

	:rtype: BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksOn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksOn ();
		%feature("autodoc", "	* Selector Returns the list of indices for vertices of the face that have state On

	:rtype: BOPCol_MapOfInteger
") VerticesOn;
		const BOPCol_MapOfInteger & VerticesOn ();
		%feature("autodoc", "	* Selector/Modifier Returns the list of indices for vertices of the face that have state On Sections

	:rtype: BOPCol_MapOfInteger
") ChangeVerticesOn;
		BOPCol_MapOfInteger & ChangeVerticesOn ();
		%feature("autodoc", "	* Selector Returns the pave blocks of the face that are pave blocks of section edges

	:rtype: BOPDS_IndexedMapOfPaveBlock
") PaveBlocksSc;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksSc ();
		%feature("autodoc", "	:rtype: BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksSc;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksSc ();
		%feature("autodoc", "	* Selector Returns the list of indices for section vertices of the face

	:rtype: BOPCol_MapOfInteger
") VerticesSc;
		const BOPCol_MapOfInteger & VerticesSc ();
		%feature("autodoc", "	* Selector/Modifier Returns the list of indices for section vertices of the face Others

	:rtype: BOPCol_MapOfInteger
") ChangeVerticesSc;
		BOPCol_MapOfInteger & ChangeVerticesSc ();
};


%feature("shadow") BOPDS_FaceInfo::~BOPDS_FaceInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_FaceInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_IndexRange;
class BOPDS_IndexRange {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_IndexRange;
		 BOPDS_IndexRange ();
		%feature("autodoc", "	* Modifier Sets the first index <theI1> of the range

	:param theI1:
	:type theI1: Standard_Integer
	:rtype: None
") SetFirst;
		void SetFirst (const Standard_Integer theI1);
		%feature("autodoc", "	* Modifier Sets the second index <theI2> of the range

	:param theI2:
	:type theI2: Standard_Integer
	:rtype: None
") SetLast;
		void SetLast (const Standard_Integer theI2);
		%feature("autodoc", "	* Selector Returns the first index of the range

	:rtype: int
") First;
		Standard_Integer First ();
		%feature("autodoc", "	* Selector Returns the second index of the range

	:rtype: int
") Last;
		Standard_Integer Last ();
		%feature("autodoc", "	* Modifier Sets the first index of the range <theI1> Sets the second index of the range <theI2>

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:rtype: None
") SetIndices;
		void SetIndices (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "	* Selector Returns the first index of the range <theI1> Returns the second index of the range <theI2>

	:param theI1:
	:type theI1: Standard_Integer &
	:param theI2:
	:type theI2: Standard_Integer &
	:rtype: None
") Indices;
		void Indices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Query Returns true if the range contains <theIndex>

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theIndex);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") BOPDS_IndexRange::~BOPDS_IndexRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_IndexRange {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_Iterator;
class BOPDS_Iterator {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Iterator;
		 BOPDS_Iterator ();
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_Iterator;
		 BOPDS_Iterator (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Modifier Sets the data structure <pDS> to process

	:param pDS:
	:type pDS: BOPDS_PDS &
	:rtype: None
") SetDS;
		void SetDS (const BOPDS_PDS & pDS);
		%feature("autodoc", "	* Selector Returns the data structure

	:rtype: BOPDS_DS
") DS;
		const BOPDS_DS & DS ();
		%feature("autodoc", "	* Initializes the iterator theType1 - the first type of shape theType2 - the second type of shape

	:param theType1:
	:type theType1: TopAbs_ShapeEnum
	:param theType2:
	:type theType2: TopAbs_ShapeEnum
	:rtype: None
") Initialize;
		void Initialize (const TopAbs_ShapeEnum theType1,const TopAbs_ShapeEnum theType2);
		%feature("autodoc", "	* Returns true if still there are pairs of intersected shapes

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Moves iterations ahead

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns indices (DS) of intersected shapes theIndex1 - the index of the first shape theIndex2 - the index of the second shape theWithSubShape - flag. True if the sub-shapes of shapes are intersected

	:param theIndex1:
	:type theIndex1: Standard_Integer &
	:param theIndex2:
	:type theIndex2: Standard_Integer &
	:param theWithSubShape:
	:type theWithSubShape: bool
	:rtype: None
") Value;
		void Value (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean & theWithSubShape);
		%feature("autodoc", "	* Perform the intersection algorithm and prepare the results to be used

	:rtype: void
") Prepare;
		virtual void Prepare ();
		%feature("autodoc", "	* Returns the number of intersections founded

	:rtype: int
") ExpectedLength;
		Standard_Integer ExpectedLength ();
		%feature("autodoc", "	* Returns the block length

	:rtype: int
") BlockLength;
		Standard_Integer BlockLength ();
};


%feature("shadow") BOPDS_Iterator::~BOPDS_Iterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_Iterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_PassKey;
class BOPDS_PassKey {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_PassKey;
		 BOPDS_PassKey ();
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_PassKey;
		 BOPDS_PassKey (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Copy Contructor

	:param Other:
	:type Other: BOPDS_PassKey &
	:rtype: None
") BOPDS_PassKey;
		 BOPDS_PassKey (const BOPDS_PassKey & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BOPDS_PassKey &
	:rtype: BOPDS_PassKey
") operator=;
		BOPDS_PassKey & operator = (const BOPDS_PassKey & Other);
		%feature("autodoc", "	* Clear the contents

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Modifier Sets one Id <theI1>

	:param theI1:
	:type theI1: Standard_Integer
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1);
		%feature("autodoc", "	* Modifier Sets two Id <theI1>,<theI2>

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "	* Modifier Sets three Id <theI1>,<theI2>,<theI3>

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:param theI3:
	:type theI3: Standard_Integer
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Integer theI3);
		%feature("autodoc", "	* Modifier Sets four Id <theI1>,<theI2>,<theI3>,<theI4>

	:param theI1:
	:type theI1: Standard_Integer
	:param theI2:
	:type theI2: Standard_Integer
	:param theI3:
	:type theI3: Standard_Integer
	:param theI4:
	:type theI4: Standard_Integer
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Integer theI3,const Standard_Integer theI4);
		%feature("autodoc", "	* Modifier Sets the list of Id <theLI>

	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") SetIds;
		void SetIds (const BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "	* Selector Returns the number of Ids>

	:rtype: int
") NbIds;
		Standard_Integer NbIds ();
		%feature("autodoc", "	* Query Returns true if the PassKey is equal to <the theOther>

	:param theOther:
	:type theOther: BOPDS_PassKey &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BOPDS_PassKey & theOther);
		%feature("autodoc", "	* Query Returns hash code

	:param theUpper:
	:type theUpper: Standard_Integer
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer theUpper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "	* Selector Returns Id of index <theIndex>

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: int
") Id;
		Standard_Integer Id (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the first two Ids <theI1>,<theI2>

	:param theI1:
	:type theI1: Standard_Integer &
	:param theI2:
	:type theI2: Standard_Integer &
	:rtype: None
") Ids;
		void Ids (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param aHex: default value is 0
	:type aHex: Standard_Integer
	:rtype: None
") Dump;
		void Dump (const Standard_Integer aHex = 0);
};


%feature("shadow") BOPDS_PassKey::~BOPDS_PassKey %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_PassKey {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_PassKeyMapHasher;
class BOPDS_PassKeyMapHasher {
	public:
		%feature("autodoc", "	:param aPKey:
	:type aPKey: BOPDS_PassKey &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BOPDS_PassKey & aPKey,const Standard_Integer Upper);
		%feature("autodoc", "	:param aPKey1:
	:type aPKey1: BOPDS_PassKey &
	:param aPKey2:
	:type aPKey2: BOPDS_PassKey &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BOPDS_PassKey & aPKey1,const BOPDS_PassKey & aPKey2);
};


%feature("shadow") BOPDS_PassKeyMapHasher::~BOPDS_PassKeyMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_PassKeyMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_Pave;
class BOPDS_Pave {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Pave;
		 BOPDS_Pave ();
		%feature("autodoc", "	* Modifier Sets the index of vertex <theIndex>

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns the index of vertex

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("autodoc", "	* Modifier Sets the parameter of vertex <theParameter>

	:param theParameter:
	:type theParameter: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real theParameter);
		%feature("autodoc", "	* Selector Returns the parameter of vertex

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	* Selector Returns the index of vertex <theIndex> Returns the parameter of vertex <theParameter>

	:param theIndex:
	:type theIndex: Standard_Integer &
	:param theParameter:
	:type theParameter: float &
	:rtype: None
") Contents;
		void Contents (Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Query Returns true if thr parameter od this is less than the parameter of <theOther>

	:param theOther:
	:type theOther: BOPDS_Pave &
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const BOPDS_Pave & theOther);
		%feature("autodoc", "	:param theOther:
	:type theOther: BOPDS_Pave &
	:rtype: bool
") operator<;
		Standard_Boolean operator < (const BOPDS_Pave & theOther);
		%feature("autodoc", "	* Query Returns true if thr parameter od this is equal to the parameter of <theOther>

	:param theOther:
	:type theOther: BOPDS_Pave &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BOPDS_Pave & theOther);

        %extend{
            bool __eq_wrapper__(const BOPDS_Pave  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") BOPDS_Pave::~BOPDS_Pave %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_Pave {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_PaveBlock;
class BOPDS_PaveBlock : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock ();
		%feature("autodoc", "	* Contructor <theAllocator> - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Modifier Sets the first pave <thePave>

	:param thePave:
	:type thePave: BOPDS_Pave &
	:rtype: None
") SetPave1;
		void SetPave1 (const BOPDS_Pave & thePave);
		%feature("autodoc", "	* Selector Returns the first pave

	:rtype: BOPDS_Pave
") Pave1;
		const BOPDS_Pave & Pave1 ();
		%feature("autodoc", "	* Modifier Sets the second pave <thePave>

	:param thePave:
	:type thePave: BOPDS_Pave &
	:rtype: None
") SetPave2;
		void SetPave2 (const BOPDS_Pave & thePave);
		%feature("autodoc", "	* Selector Returns the second pave

	:rtype: BOPDS_Pave
") Pave2;
		const BOPDS_Pave & Pave2 ();
		%feature("autodoc", "	* Modifier Sets the index of edge of pave block <theEdge>

	:param theEdge:
	:type theEdge: Standard_Integer
	:rtype: None
") SetEdge;
		void SetEdge (const Standard_Integer theEdge);
		%feature("autodoc", "	* Selector Returns the index of edge of pave block

	:rtype: int
") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "	* Query Returns true if the pave block has edge

	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge ();
		%feature("autodoc", "	* Query Returns true if the pave block has edge Returns the index of edge <theEdge>

	:param theEdge:
	:type theEdge: Standard_Integer &
	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge (Standard_Integer &OutValue);
		%feature("autodoc", "	* Modifier Sets the index of original edge of the pave block <theEdge>

	:param theEdge:
	:type theEdge: Standard_Integer
	:rtype: None
") SetOriginalEdge;
		void SetOriginalEdge (const Standard_Integer theEdge);
		%feature("autodoc", "	* Selector Returns the index of original edge of pave block

	:rtype: int
") OriginalEdge;
		Standard_Integer OriginalEdge ();
		%feature("autodoc", "	* Query Returns true if the edge is equal to the original edge of the pave block

	:rtype: bool
") IsSplitEdge;
		Standard_Boolean IsSplitEdge ();
		%feature("autodoc", "	* Selector Returns the parametric range <theT1,theT2> of the pave block

	:param theT1:
	:type theT1: float &
	:param theT2:
	:type theT2: float &
	:rtype: None
") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Query Returns true if the pave block has pave indices that equal to the pave indices of the pave block <theOther>

	:param theOther:
	:type theOther: Handle_BOPDS_PaveBlock &
	:rtype: bool
") HasSameBounds;
		Standard_Boolean HasSameBounds (const Handle_BOPDS_PaveBlock & theOther);
		%feature("autodoc", "	* Selector Returns the pave indices <theIndex1,theIndex2> of the pave block

	:param theIndex1:
	:type theIndex1: Standard_Integer &
	:param theIndex2:
	:type theIndex2: Standard_Integer &
	:rtype: None
") Indices;
		void Indices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Query Returns true if the pave block contains extra paves

	:rtype: bool
") IsToUpdate;
		Standard_Boolean IsToUpdate ();
		%feature("autodoc", "	* Modifier Appends extra paves <theLP>

	:param theLP:
	:type theLP: BOPDS_Pave &
	:rtype: None
") AppendExtPave;
		void AppendExtPave (const BOPDS_Pave & theLP);
		%feature("autodoc", "	* Modifier Appends extra pave <thePave>

	:param thePave:
	:type thePave: BOPDS_Pave &
	:rtype: None
") AppendExtPave1;
		void AppendExtPave1 (const BOPDS_Pave & thePave);
		%feature("autodoc", "	* Selector Returns the extra paves

	:rtype: BOPDS_ListOfPave
") ExtPaves;
		const BOPDS_ListOfPave & ExtPaves ();
		%feature("autodoc", "	* Selector / Modifier Returns the extra paves

	:rtype: BOPDS_ListOfPave
") ChangeExtPaves;
		BOPDS_ListOfPave & ChangeExtPaves ();
		%feature("autodoc", "	* Modifier Updates the pave block. The extra paves are used to create new pave blocks <theLPB>. <theFlag> - if true, the first pave and the second pave are used to produce new pave blocks.

	:param theLPB:
	:type theLPB: BOPDS_ListOfPaveBlock &
	:param theFlag: default value is Standard_True
	:type theFlag: bool
	:rtype: None
") Update;
		void Update (BOPDS_ListOfPaveBlock & theLPB,const Standard_Boolean theFlag = Standard_True);
		%feature("autodoc", "	* Query Returns true if the extra paves contain the pave with given value of the parameter <thePrm> <theTol> - the value of the tolerance to compare

	:param thePrm:
	:type thePrm: float
	:param theTol:
	:type theTol: float
	:rtype: bool
") ContainsParameter;
		Standard_Boolean ContainsParameter (const Standard_Real thePrm,const Standard_Real theTol);
		%feature("autodoc", "	* Modifier Sets the shrunk data for the pave block <theTS1>, <theTS2> - shrunk range <theBox> - the bounding box

	:param theTS1:
	:type theTS1: float
	:param theTS2:
	:type theTS2: float
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") SetShrunkData;
		void SetShrunkData (const Standard_Real theTS1,const Standard_Real theTS2,const Bnd_Box & theBox);
		%feature("autodoc", "	* Selector Returns the shrunk data for the pave block <theTS1>, <theTS2> - shrunk range <theBox> - the bounding box

	:param theTS1:
	:type theTS1: float &
	:param theTS2:
	:type theTS2: float &
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") ShrunkData;
		void ShrunkData (Standard_Real &OutValue,Standard_Real &OutValue,Bnd_Box & theBox);
		%feature("autodoc", "	* Query Returns true if the pave block contains the shrunk data

	:rtype: bool
") HasShrunkData;
		Standard_Boolean HasShrunkData ();
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") BOPDS_PaveBlock::~BOPDS_PaveBlock %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_PaveBlock {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BOPDS_PaveBlock {
	Handle_BOPDS_PaveBlock GetHandle() {
	return *(Handle_BOPDS_PaveBlock*) &$self;
	}
};

%nodefaultctor Handle_BOPDS_PaveBlock;
class Handle_BOPDS_PaveBlock : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BOPDS_PaveBlock();
        Handle_BOPDS_PaveBlock(const Handle_BOPDS_PaveBlock &aHandle);
        Handle_BOPDS_PaveBlock(const BOPDS_PaveBlock *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BOPDS_PaveBlock DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BOPDS_PaveBlock {
    BOPDS_PaveBlock* GetObject() {
    return (BOPDS_PaveBlock*)$self->Access();
    }
};
%feature("shadow") Handle_BOPDS_PaveBlock::~Handle_BOPDS_PaveBlock %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BOPDS_PaveBlock {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BOPDS_PaveMapHasher;
class BOPDS_PaveMapHasher {
	public:
		%feature("autodoc", "	:param aPave:
	:type aPave: BOPDS_Pave &
	:param Upper:
	:type Upper: Standard_Integer
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BOPDS_Pave & aPave,const Standard_Integer Upper);
		%feature("autodoc", "	:param aPave1:
	:type aPave1: BOPDS_Pave &
	:param aPave2:
	:type aPave2: BOPDS_Pave &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BOPDS_Pave & aPave1,const BOPDS_Pave & aPave2);
};


%feature("shadow") BOPDS_PaveMapHasher::~BOPDS_PaveMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_PaveMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_Point;
class BOPDS_Point {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Point;
		 BOPDS_Point ();
		%feature("autodoc", "	* Modifier Sets 3D point <thePnt>

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const gp_Pnt & thePnt);
		%feature("autodoc", "	* Selector Returns 3D point

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	* Modifier Sets 2D point on the first face <thePnt>

	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None
") SetPnt2D1;
		void SetPnt2D1 (const gp_Pnt2d & thePnt);
		%feature("autodoc", "	* Selector Returns 2D point on the first face <thePnt>

	:rtype: gp_Pnt2d
") Pnt2D1;
		const gp_Pnt2d  Pnt2D1 ();
		%feature("autodoc", "	* Modifier Sets 2D point on the second face <thePnt>

	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None
") SetPnt2D2;
		void SetPnt2D2 (const gp_Pnt2d & thePnt);
		%feature("autodoc", "	* Selector Returns 2D point on the second face <thePnt>

	:rtype: gp_Pnt2d
") Pnt2D2;
		const gp_Pnt2d  Pnt2D2 ();
		%feature("autodoc", "	* Modifier Sets the index of the vertex <theIndex>

	:param theIndex:
	:type theIndex: Standard_Integer
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("autodoc", "	* Selector Returns index of the vertex

	:rtype: int
") Index;
		Standard_Integer Index ();
};


%feature("shadow") BOPDS_Point::~BOPDS_Point %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_Point {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_ShapeInfo;
class BOPDS_ShapeInfo {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo ();
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Modifier Sets the shape <theS>

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & theS);
		%feature("autodoc", "	* Selector Returns the shape

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	* Modifier Sets the type of shape theType

	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None
") SetShapeType;
		void SetShapeType (const TopAbs_ShapeEnum theType);
		%feature("autodoc", "	* Selector Returns the type of shape

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "	* Modifier Sets the boundung box of the shape theBox

	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") SetBox;
		void SetBox (const Bnd_Box & theBox);
		%feature("autodoc", "	* Selector Returns the boundung box of the shape

	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
		%feature("autodoc", "	* Selector/Modifier Returns the boundung box of the shape

	:rtype: Bnd_Box
") ChangeBox;
		Bnd_Box & ChangeBox ();
		%feature("autodoc", "	* Selector Returns the list of indices of sub-shapes

	:rtype: BOPCol_ListOfInteger
") SubShapes;
		const BOPCol_ListOfInteger & SubShapes ();
		%feature("autodoc", "	* Selector/ Modifier Returns the list of indices of sub-shapes

	:rtype: BOPCol_ListOfInteger
") ChangeSubShapes;
		BOPCol_ListOfInteger & ChangeSubShapes ();
		%feature("autodoc", "	* Query Returns true if the shape has sub-shape with index theI

	:param theI:
	:type theI: Standard_Integer
	:rtype: bool
") HasSubShape;
		Standard_Boolean HasSubShape (const Standard_Integer theI);
		%feature("autodoc", "	:rtype: bool
") HasReference;
		Standard_Boolean HasReference ();
		%feature("autodoc", "	* Modifier Sets the index of a reference information

	:param theI:
	:type theI: Standard_Integer
	:rtype: None
") SetReference;
		void SetReference (const Standard_Integer theI);
		%feature("autodoc", "	* Selector Returns the index of a reference information

	:rtype: int
") Reference;
		Standard_Integer Reference ();
		%feature("autodoc", "	* Query Returns true if the shape has boundary representation

	:rtype: bool
") HasBRep;
		Standard_Boolean HasBRep ();
		%feature("autodoc", "	* Returns true if the shape can be participant of an interference Flag

	:rtype: bool
") IsInterfering;
		Standard_Boolean IsInterfering ();
		%feature("autodoc", "	* Query Returns true if there is flag.

	:rtype: bool
") HasFlag;
		Standard_Boolean HasFlag ();
		%feature("autodoc", "	* Query Returns true if there is flag. Returns the the flag theFlag

	:param theFlag:
	:type theFlag: Standard_Integer &
	:rtype: bool
") HasFlag;
		Standard_Boolean HasFlag (Standard_Integer &OutValue);
		%feature("autodoc", "	* Modifier Sets the flag

	:param theI:
	:type theI: Standard_Integer
	:rtype: None
") SetFlag;
		void SetFlag (const Standard_Integer theI);
		%feature("autodoc", "	* Returns the flag

	:rtype: int
") Flag;
		Standard_Integer Flag ();
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") BOPDS_ShapeInfo::~BOPDS_ShapeInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_ShapeInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_SubIterator;
class BOPDS_SubIterator {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_SubIterator;
		 BOPDS_SubIterator ();
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_SubIterator;
		 BOPDS_SubIterator (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Modifier Sets the data structure <pDS> to process

	:param pDS:
	:type pDS: BOPDS_PDS &
	:rtype: None
") SetDS;
		void SetDS (const BOPDS_PDS & pDS);
		%feature("autodoc", "	* Selector Returns the data structure

	:rtype: BOPDS_DS
") DS;
		const BOPDS_DS & DS ();
		%feature("autodoc", "	* Modifier Sets the first set of indices <theLI> to process

	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") SetSubSet1;
		void SetSubSet1 (const BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "	* Selector Returns the first set of indices to process

	:rtype: BOPCol_ListOfInteger
") SubSet1;
		const BOPCol_ListOfInteger & SubSet1 ();
		%feature("autodoc", "	* Modifier Sets the second set of indices <theLI> to process

	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") SetSubSet2;
		void SetSubSet2 (const BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "	* Selector Returns the second set of indices to process

	:rtype: BOPCol_ListOfInteger
") SubSet2;
		const BOPCol_ListOfInteger & SubSet2 ();
		%feature("autodoc", "	* Initializes the iterator

	:rtype: None
") Initialize;
		void Initialize ();
		%feature("autodoc", "	* Returns true if still there are pairs of intersected shapes

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Moves iterations ahead

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns indices (DS) of intersected shapes theIndex1 - the index of the first shape theIndex2 - the index of the second shape

	:param theIndex1:
	:type theIndex1: Standard_Integer &
	:param theIndex2:
	:type theIndex2: Standard_Integer &
	:rtype: None
") Value;
		void Value (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	* Perform the intersection algorithm and prepare the results to be used

	:rtype: void
") Prepare;
		virtual void Prepare ();
};


%feature("shadow") BOPDS_SubIterator::~BOPDS_SubIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_SubIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_Tools;
class BOPDS_Tools {
	public:
		%feature("autodoc", "	* Converts the conmbination of two types of shape <theT1>,<theT2> to the one integer value, that is returned

	:param theT1:
	:type theT1: TopAbs_ShapeEnum
	:param theT2:
	:type theT2: TopAbs_ShapeEnum
	:rtype: int
") TypeToInteger;
		static Standard_Integer TypeToInteger (const TopAbs_ShapeEnum theT1,const TopAbs_ShapeEnum theT2);
		%feature("autodoc", "	* Converts the type of shape <theT>, to integer value, that is returned

	:param theT:
	:type theT: TopAbs_ShapeEnum
	:rtype: int
") TypeToInteger;
		static Standard_Integer TypeToInteger (const TopAbs_ShapeEnum theT);
		%feature("autodoc", "	* Returns true if the type <theT> correspond to a shape having boundary representation

	:param theT:
	:type theT: TopAbs_ShapeEnum
	:rtype: bool
") HasBRep;
		static Standard_Boolean HasBRep (const TopAbs_ShapeEnum theT);
		%feature("autodoc", "	* Returns true if the type <theT> can be participant of an interference

	:param theT:
	:type theT: TopAbs_ShapeEnum
	:rtype: bool
") IsInterfering;
		static Standard_Boolean IsInterfering (const TopAbs_ShapeEnum theT);
};


%feature("shadow") BOPDS_Tools::~BOPDS_Tools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_Tools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfEE;
class BOPDS_InterfEE : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfEE;
		 BOPDS_InterfEE ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfEE;
		 BOPDS_InterfEE (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "	* /** * Modifier * Sets the info of common part * @param theCP * common part */

	:param theCP:
	:type theCP: IntTools_CommonPrt &
	:rtype: None
") SetCommonPart;
		void SetCommonPart (const IntTools_CommonPrt & theCP);
		%feature("autodoc", "	* /** * Selector * Returns the info of common part * returns * common part */

	:rtype: IntTools_CommonPrt
") CommonPart;
		const IntTools_CommonPrt & CommonPart ();
};


%feature("shadow") BOPDS_InterfEE::~BOPDS_InterfEE %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfEE {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfEF;
class BOPDS_InterfEF : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfEF;
		 BOPDS_InterfEF ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory *//** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfEF;
		 BOPDS_InterfEF (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "	* /** * Modifier * Sets the info of common part * @param theCP * common part */

	:param theCP:
	:type theCP: IntTools_CommonPrt &
	:rtype: None
") SetCommonPart;
		void SetCommonPart (const IntTools_CommonPrt & theCP);
		%feature("autodoc", "	* /** * Selector * Returns the info of common part * returns * common part */

	:rtype: IntTools_CommonPrt
") CommonPart;
		const IntTools_CommonPrt & CommonPart ();
};


%feature("shadow") BOPDS_InterfEF::~BOPDS_InterfEF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfEF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfEZ;
class BOPDS_InterfEZ : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfEZ;
		 BOPDS_InterfEZ ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfEZ;
		 BOPDS_InterfEZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%feature("shadow") BOPDS_InterfEZ::~BOPDS_InterfEZ %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfEZ {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfFF;
class BOPDS_InterfFF : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfFF;
		 BOPDS_InterfFF ();
		%feature("autodoc", "	* /** * Initializer * @param theNbCurves * number of intersection curves * @param theNbPoints * number of intersection points */

	:param theNbCurves:
	:type theNbCurves: Standard_Integer
	:param theNbPoints:
	:type theNbPoints: Standard_Integer
	:rtype: None
") Init;
		void Init (const Standard_Integer theNbCurves,const Standard_Integer theNbPoints);
		%feature("autodoc", "	* /** * Modifier * Sets the flag of whether the faces are tangent * @param theFlag * the flag */

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetTangentFaces;
		void SetTangentFaces (const Standard_Boolean theFlag);
		%feature("autodoc", "	* /** * Selector * Returns the flag whether the faces are tangent * returns * the flag */

	:rtype: bool
") TangentFaces;
		Standard_Boolean TangentFaces ();
		%feature("autodoc", "	* /** * Modifier * Sets the value of 3D tolerance * @param theTol * 3D tolerance */

	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolR3D;
		void SetTolR3D (const Standard_Real theTol);
		%feature("autodoc", "	* /** * Selector * Returns the value of 3D tolerance * returns * 3D tolerance */

	:rtype: float
") TolR3D;
		Standard_Real TolR3D ();
		%feature("autodoc", "	* /** * Modifier * Sets the value of 2D tolerance * @param theTol * 2D tolerance */

	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolR2D;
		void SetTolR2D (const Standard_Real theTol);
		%feature("autodoc", "	* /** * Selector * Returns the value of 2D tolerance * returns * 2D tolerance */

	:rtype: float
") TolR2D;
		Standard_Real TolR2D ();
		%feature("autodoc", "	* /** * Selector * Returns the intersection curves * returns * intersection curves */

	:rtype: BOPDS_VectorOfCurve
") Curves;
		const BOPDS_VectorOfCurve & Curves ();
		%feature("autodoc", "	* /** * Selector/Modifier * Returns the intersection curves * returns * intersection curves */

	:rtype: BOPDS_VectorOfCurve
") ChangeCurves;
		BOPDS_VectorOfCurve & ChangeCurves ();
		%feature("autodoc", "	* /** * Selector * Returns the intersection points * returns * intersection points */

	:rtype: BOPDS_VectorOfPoint
") Points;
		const BOPDS_VectorOfPoint & Points ();
		%feature("autodoc", "	* /** * Selector/Modifier * Returns the intersection points * returns * intersection points */

	:rtype: BOPDS_VectorOfPoint
") ChangePoints;
		BOPDS_VectorOfPoint & ChangePoints ();
};


%feature("shadow") BOPDS_InterfFF::~BOPDS_InterfFF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfFF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfFZ;
class BOPDS_InterfFZ : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfFZ;
		 BOPDS_InterfFZ ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfFZ;
		 BOPDS_InterfFZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%feature("shadow") BOPDS_InterfFZ::~BOPDS_InterfFZ %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfFZ {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfVE;
class BOPDS_InterfVE : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVE;
		 BOPDS_InterfVE ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVE;
		 BOPDS_InterfVE (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "	* /** * Modifier * Sets the value of parameter * of the point of the vertex * on the curve of the edge * @param theT * value of parameter */

	:param theT:
	:type theT: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real theT);
		%feature("autodoc", "	* /** * Selector * Returrns the value of parameter * of the point of the vertex * on the curve of the edge * returns * value of parameter */

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
};


%feature("shadow") BOPDS_InterfVE::~BOPDS_InterfVE %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfVE {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfVF;
class BOPDS_InterfVF : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVF;
		 BOPDS_InterfVF ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVF;
		 BOPDS_InterfVF (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "	* /** * Modifier * Sets the value of parameters * of the point of the vertex * on the surface of of the face * @param theU * value of U parameter * @param theV * value of U parameter */

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:rtype: None
") SetUV;
		void SetUV (const Standard_Real theU,const Standard_Real theV);
		%feature("autodoc", "	* /** * Selector * Returns the value of parameters * of the point of the vertex * on the surface of of the face * @param theU * value of U parameter * @param theV * value of U parameter */

	:param theU:
	:type theU: float &
	:param theV:
	:type theV: float &
	:rtype: None
") UV;
		void UV (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") BOPDS_InterfVF::~BOPDS_InterfVF %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfVF {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfVV;
class BOPDS_InterfVV : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVV;
		 BOPDS_InterfVV ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVV;
		 BOPDS_InterfVV (const Handle_NCollection_BaseAllocator & theAllocator);
};


%feature("shadow") BOPDS_InterfVV::~BOPDS_InterfVV %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfVV {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfVZ;
class BOPDS_InterfVZ : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVZ;
		 BOPDS_InterfVZ ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVZ;
		 BOPDS_InterfVZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%feature("shadow") BOPDS_InterfVZ::~BOPDS_InterfVZ %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfVZ {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_InterfZZ;
class BOPDS_InterfZZ : public BOPDS_Interf {
	public:
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfZZ;
		 BOPDS_InterfZZ ();
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfZZ;
		 BOPDS_InterfZZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%feature("shadow") BOPDS_InterfZZ::~BOPDS_InterfZZ %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_InterfZZ {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_IteratorSI;
class BOPDS_IteratorSI : public BOPDS_Iterator {
	public:
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI ();
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	* Updates the lists of possible intersections according to the value of <theLevel>. It defines which interferferences will be checked: 0 - only V/V; 1 - V/V and V/E; 2 - V/V, V/E and E/E; 3 - V/V, V/E, E/E and V/F; 4 - V/V, V/E, E/E, V/F and E/F; other - all interferences.

	:param theLevel:
	:type theLevel: Standard_Integer
	:rtype: None
") UpdateByLevelOfCheck;
		void UpdateByLevelOfCheck (const Standard_Integer theLevel);
};


%feature("shadow") BOPDS_IteratorSI::~BOPDS_IteratorSI %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_IteratorSI {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPDS_PassKeyBoolean;
class BOPDS_PassKeyBoolean : public BOPDS_PassKey {
	public:
		%feature("autodoc", "	:rtype: None
") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean ();
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "	:param Other:
	:type Other: BOPDS_PassKeyBoolean &
	:rtype: None
") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean (const BOPDS_PassKeyBoolean & Other);
		%feature("autodoc", "	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetFlag;
		void SetFlag (const Standard_Boolean theFlag);
		%feature("autodoc", "	:param &:
	:type &: BOPDS_PassKeyBoolean
	:rtype: BOPDS_PassKeyBoolean
") operator=;
		BOPDS_PassKeyBoolean & operator = (const BOPDS_PassKeyBoolean &);
		%feature("autodoc", "	:rtype: bool
") Flag;
		Standard_Boolean Flag ();
};


%feature("shadow") BOPDS_PassKeyBoolean::~BOPDS_PassKeyBoolean %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPDS_PassKeyBoolean {
	void _kill_pointed() {
		delete $self;
	}
};
