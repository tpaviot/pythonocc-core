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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_CommonBlock;
		 BOPDS_CommonBlock ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 <theAllocator> - the allocator to manage the memory") BOPDS_CommonBlock;
		 BOPDS_CommonBlock (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	aPB(Handle_BOPDS_PaveBlock)

Returns:
	None

Modifier  
Adds the pave block <aPB> to the list of pave blocks  
of the common block") AddPaveBlock;
		void AddPaveBlock (const Handle_BOPDS_PaveBlock & aPB);
		%feature("autodoc", "Args:
	aLPB(BOPDS_ListOfPaveBlock)

Returns:
	None

Modifier  
Adds the list of pave blocks <aLPB>  
to the list of pave blocks  
of the common block") AddPaveBlocks;
		void AddPaveBlocks (const BOPDS_ListOfPaveBlock & aLPB);
		%feature("autodoc", "Args:
	aF(Standard_Integer)

Returns:
	None

Modifier  
Adds the index of the face <aF>  
to the list of indices of faces  
of the common block") AddFace;
		void AddFace (const Standard_Integer aF);
		%feature("autodoc", "Args:
	aLF(BOPCol_ListOfInteger)

Returns:
	None

Modifier  
Adds the list of indices of faces <aLF>  
to the list of indices of faces  
of the common block") AddFaces;
		void AddFaces (const BOPCol_ListOfInteger & aLF);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_ListOfPaveBlock

Selector  
Returns the list of pave blocks  
of the common block") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfInteger

Selector  
Returns the list of indices of faces  
of the common block") Faces;
		const BOPCol_ListOfInteger & Faces ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPDS_PaveBlock

Selector  
Returns the first pave block  
of the common block") PaveBlock1;
		const Handle_BOPDS_PaveBlock & PaveBlock1 ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Handle_BOPDS_PaveBlock

Selector  
Returns the pave block that belongs  
to the edge with index <theIx>") PaveBlockOnEdge;
		Handle_BOPDS_PaveBlock & PaveBlockOnEdge (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the common block contains  
 a pave block that belongs  
to the face with index <theIx>") IsPaveBlockOnFace;
		Standard_Boolean IsPaveBlockOnFace (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the common block contains  
 a pave block that belongs  
to the edge with index <theIx>") IsPaveBlockOnEdge;
		Standard_Boolean IsPaveBlockOnEdge (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	Standard_Boolean

Query  
Returns true if the common block contains  
 a pave block that is equal  to <thePB>") Contains;
		Standard_Boolean Contains (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	theF(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the common block contains  
 the face with index equal  to <theF>") Contains;
		Standard_Boolean Contains (const Standard_Integer theF);
		%feature("autodoc", "Args:
	theEdge(Standard_Integer)

Returns:
	None

Modifier  
Assign the index <theEdge> as the edge index  
to all pave blocks of the common block") SetEdge;
		void SetEdge (const Standard_Integer theEdge);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the index of the edge  
of  all pave blocks of the common block") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
* Constructor
*/") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks ();
		%feature("autodoc", "Args:
	thePB1(Handle_BOPDS_PaveBlock)
	thePB2(Handle_BOPDS_PaveBlock)

Returns:
	None

/**
* Constructor
* @param thePB1
*  first pave block
* @param thePB2
*  secondt pave block
*/") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks (const Handle_BOPDS_PaveBlock & thePB1,const Handle_BOPDS_PaveBlock & thePB2);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

/**
* Sets an index
* @param theIndex
*  index
*/") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

/**
* Returns the index
* @return 
*   index
*/") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

/**
* Sets an index of an interference 
* @param theIndex
*  index of an interference 
*/") SetIndexInterf;
		void SetIndexInterf (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

/**
* Returns the index of an interference 
* @return 
*   index of an interference 
*/") IndexInterf;
		Standard_Integer IndexInterf ();
		%feature("autodoc", "Args:
	thePB1(Handle_BOPDS_PaveBlock)
	thePB2(Handle_BOPDS_PaveBlock)

Returns:
	None

/**
* Sets pave blocks
* @param thePB1
*  first pave block
* @param thePB2
*  secondt pave block
*/") SetPaveBlocks;
		void SetPaveBlocks (const Handle_BOPDS_PaveBlock & thePB1,const Handle_BOPDS_PaveBlock & thePB2);
		%feature("autodoc", "Args:
	thePB1(Handle_BOPDS_PaveBlock)
	thePB2(Handle_BOPDS_PaveBlock)

Returns:
	None

/**
* Returns pave blocks
* @param thePB1
*  the first pave block
* @param thePB2
*  the second pave block
*/") PaveBlocks;
		void PaveBlocks (Handle_BOPDS_PaveBlock & thePB1,Handle_BOPDS_PaveBlock & thePB2);
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	None

/**
* Sets the first pave block
* @param thePB
*  the first pave block
*/") SetPaveBlock1;
		void SetPaveBlock1 (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPDS_PaveBlock

/**
* Returns the first pave block
* @return 
* the first pave block
*/") PaveBlock1;
		const Handle_BOPDS_PaveBlock & PaveBlock1 ();
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	None

/**
* Sets the second pave block
* @param thePB
*  the second pave block
*/") SetPaveBlock2;
		void SetPaveBlock2 (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPDS_PaveBlock

/**
* Returns the second pave block
* @return 
* the second pave block
*/") PaveBlock2;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_Curve;
		 BOPDS_Curve ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 <theAllocator> - the allocator to manage the memory") BOPDS_Curve;
		 BOPDS_Curve (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theC(IntTools_Curve)

Returns:
	None

Modifier  
Sets the curve <theC>") SetCurve;
		void SetCurve (const IntTools_Curve & theC);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_Curve

Selector  
Returns the curve") Curve;
		const IntTools_Curve & Curve ();
		%feature("autodoc", "Args:
	theBox(Bnd_Box)

Returns:
	None

Modifier  
Sets the bounding box <theBox> of the curve") SetBox;
		void SetBox (const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

Selector  
Returns the bounding box of the curve") Box;
		const Bnd_Box & Box ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

Selector/Modifier  
Returns the bounding box of the curve") ChangeBox;
		Bnd_Box & ChangeBox ();
		%feature("autodoc", "Args:
	theLPB(BOPDS_ListOfPaveBlock)

Returns:
	None

No detailed docstring for this function.") SetPaveBlocks;
		void SetPaveBlocks (const BOPDS_ListOfPaveBlock & theLPB);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_ListOfPaveBlock

Selector  
Returns the list of pave blocks  
of the curve") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_ListOfPaveBlock

Selector/Modifier  
Returns the list of pave blocks  
of the curve") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates  initial pave block  
of the curve") InitPaveBlock1;
		void InitPaveBlock1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BOPDS_PaveBlock

Selector/Modifier  
Returns  initial pave block  
of the curve") ChangePaveBlock1;
		Handle_BOPDS_PaveBlock & ChangePaveBlock1 ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfInteger

Selector  
Returns list of indices of technologic vertices  
of the curve") TechnoVertices;
		const BOPCol_ListOfInteger & TechnoVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfInteger

Selector/Modifier  
Returns list of indices of technologic vertices  
of the curve") ChangeTechnoVertices;
		BOPCol_ListOfInteger & ChangeTechnoVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Query  
Returns true if at least one pave block of the curve  
 has edge") HasEdge;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_DS;
		 BOPDS_DS ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 theAllocator - the allocator to manage the memory") BOPDS_DS;
		 BOPDS_DS (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the contents") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_BaseAllocator

Selector") Allocator;
		const BOPCol_BaseAllocator & Allocator ();
		%feature("autodoc", "Args:
	theLS(BOPCol_ListOfShape)

Returns:
	None

Modifier  
Sets the arguments [theLS] of an operation") SetArguments;
		void SetArguments (const BOPCol_ListOfShape & theLS);
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfShape

Selector  
Returns the arguments of an operation") Arguments;
		const BOPCol_ListOfShape & Arguments ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the data structure for  
 the arguments") Init;
		void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the total number of shapes stored") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the total number of source shapes stored") NbSourceShapes;
		Standard_Integer NbSourceShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the number of index ranges") NbRanges;
		Standard_Integer NbRanges ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BOPDS_IndexRange

Selector  
Returns the index range 'i'") Range;
		const BOPDS_IndexRange & Range (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Integer

Selector  
Returns the rank of the shape of index 'i'") Rank;
		Standard_Integer Rank (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Returns true if the shape of index 'i' is not  
the source shape/sub-shape") IsNewShape;
		Standard_Boolean IsNewShape (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theSI(BOPDS_ShapeInfo)

Returns:
	Standard_Integer

Modifier  
Appends the information about the shape [theSI]  
to the data structure  
Returns the index of theSI in the data structure") Append;
		Standard_Integer Append (const BOPDS_ShapeInfo & theSI);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	Standard_Integer

Modifier  
Appends the default information about the shape [theS]  
to the data structure  
Returns the index of theS in the data structure") Append;
		Standard_Integer Append (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BOPDS_ShapeInfo

Selector  
Returns the information about the shape  
with index theIndex") ShapeInfo;
		const BOPDS_ShapeInfo & ShapeInfo (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BOPDS_ShapeInfo

Selector/Modifier  
Returns the information about the shape  
with index theIndex") ChangeShapeInfo;
		BOPDS_ShapeInfo & ChangeShapeInfo (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	TopoDS_Shape

Selector  
Returns the shape  
 with index theIndex") Shape;
		const TopoDS_Shape & Shape (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	Standard_Integer

Selector  
Returns the index  of the shape theS") Index;
		Standard_Integer Index (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfListOfPaveBlock

Selector  
Returns the information about pave blocks on source edges") PaveBlocksPool;
		const BOPDS_VectorOfListOfPaveBlock & PaveBlocksPool ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfListOfPaveBlock

Selector/Modifier  
Returns the information about pave blocks on source edges") ChangePaveBlocksPool;
		BOPDS_VectorOfListOfPaveBlock & ChangePaveBlocksPool ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the shape with index theIndex has the  
information about pave blocks") HasPaveBlocks;
		Standard_Boolean HasPaveBlocks (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BOPDS_ListOfPaveBlock

Selector  
Returns the pave blocks for the shape with index theIndex") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BOPDS_ListOfPaveBlock

Selector/Modifier  
Returns the pave blocks for the shape with index theIndex") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

Update the pave blocks for the all shapes in data structure") UpdatePaveBlocks;
		void UpdatePaveBlocks ();
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	None

Update the pave block thePB") UpdatePaveBlock;
		void UpdatePaveBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	theCB(Handle_BOPDS_CommonBlock)

Returns:
	None

Update the common block theCB") UpdateCommonBlock;
		void UpdateCommonBlock (const Handle_BOPDS_CommonBlock & theCB);
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	Standard_Boolean

Query  
Returns true if the pave block is common block") IsCommonBlock;
		Standard_Boolean IsCommonBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	Handle_BOPDS_CommonBlock

Selector  
Returns the common block") CommonBlock;
		Handle_BOPDS_CommonBlock CommonBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)
	theCB(Handle_BOPDS_CommonBlock)

Returns:
	None

Modifier  
Sets the common block <theCB>") SetCommonBlock;
		void SetCommonBlock (const Handle_BOPDS_PaveBlock & thePB,const Handle_BOPDS_CommonBlock & theCB);
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	Handle_BOPDS_PaveBlock

Selector  
Returns the real first pave block") RealPaveBlock;
		Handle_BOPDS_PaveBlock RealPaveBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	thePB(Handle_BOPDS_PaveBlock)

Returns:
	Standard_Boolean

Query  
Returns true if common block contains more then one pave block") IsCommonBlockOnEdge;
		Standard_Boolean IsCommonBlockOnEdge (const Handle_BOPDS_PaveBlock & thePB);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfFaceInfo

Selector  
Returns the information about state of faces") FaceInfoPool;
		const BOPDS_VectorOfFaceInfo & FaceInfoPool ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the shape with index theIndex has the  
information about state of face") HasFaceInfo;
		Standard_Boolean HasFaceInfo (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BOPDS_FaceInfo

Selector  
Returns the state of face with index theIndex") FaceInfo;
		const BOPDS_FaceInfo & FaceInfo (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	BOPDS_FaceInfo

Selector/Modifier  
Returns the state of face with index theIndex") ChangeFaceInfo;
		BOPDS_FaceInfo & ChangeFaceInfo (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

Update the state In of face with index theIndex") UpdateFaceInfoIn;
		void UpdateFaceInfoIn (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

Update the state On of face with index theIndex") UpdateFaceInfoOn;
		void UpdateFaceInfoOn (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theMPB(BOPDS_IndexedMapOfPaveBlock)
	theMVP(BOPCol_MapOfInteger)

Returns:
	None

Selector  
Returns the state On  
[theMPB,theMVP] of face with index theIndex") FaceInfoOn;
		void FaceInfoOn (const Standard_Integer theIndex,BOPDS_IndexedMapOfPaveBlock & theMPB,BOPCol_MapOfInteger & theMVP);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theMPB(BOPDS_IndexedMapOfPaveBlock)
	theMVP(BOPCol_MapOfInteger)

Returns:
	None

Selector  
Returns the state In  
[theMPB,theMVP] of face with index theIndex") FaceInfoIn;
		void FaceInfoIn (const Standard_Integer theIndex,BOPDS_IndexedMapOfPaveBlock & theMPB,BOPCol_MapOfInteger & theMVP);
		%feature("autodoc", "Args:
	theF(Standard_Integer)
	theLI(BOPCol_ListOfInteger)

Returns:
	None

Selector  
Returns the indices of alone vertices  
for the face with index theIndex") AloneVertices;
		void AloneVertices (const Standard_Integer theF,BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "Args:
	None
Returns:
	None

Refine the state On for the all faces having  
state information  
 
 ++") RefineFaceInfoOn;
		void RefineFaceInfoOn ();
		%feature("autodoc", "Args:
	theF1(Standard_Integer)
	theF2(Standard_Integer)
	theMI(BOPCol_MapOfInteger)
	aMPB(BOPDS_IndexedMapOfPaveBlock)

Returns:
	None

Returns the indices of vertices and pave blocks  
that  are On/In for the faces with indices theF1, theF2") VerticesOnIn;
		void VerticesOnIn (const Standard_Integer theF1,const Standard_Integer theF2,BOPCol_MapOfInteger & theMI,BOPDS_IndexedMapOfPaveBlock & aMPB);
		%feature("autodoc", "Args:
	theF1(Standard_Integer)
	theF2(Standard_Integer)
	theLI(BOPCol_ListOfInteger)
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Returns the indices of edges that are  shared  
for the faces with indices theF1, theF2  
 
same domain shapes") SharedEdges;
		void SharedEdges (const Standard_Integer theF1,const Standard_Integer theF2,BOPCol_ListOfInteger & theLI,const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_DataMapOfIntegerInteger

Selector  
Returns the collection same domain shapes") ShapesSD;
		BOPCol_DataMapOfIntegerInteger & ShapesSD ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theIndexSD(Standard_Integer)

Returns:
	None

Modifier  
Adds the information about same domain shapes  
with indices theIndex, theIndexSD") AddShapeSD;
		void AddShapeSD (const Standard_Integer theIndex,const Standard_Integer theIndexSD);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theIndexSD(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the shape with index theIndex has the  
same domain shape. In this case theIndexSD will contain  
 the index of same domain shape found  
 
interferences") HasShapeSD;
		Standard_Boolean HasShapeSD (const Standard_Integer theIndex,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfVV

Selector/Modifier  
Returns the collection of interferences Vertex/Vertex") InterfVV;
		BOPDS_VectorOfInterfVV & InterfVV ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfVE

Selector/Modifier  
Returns the collection of interferences Vertex/Edge") InterfVE;
		BOPDS_VectorOfInterfVE & InterfVE ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfVF

Selector/Modifier  
Returns the collection of interferences Vertex/Face") InterfVF;
		BOPDS_VectorOfInterfVF & InterfVF ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfEE

Selector/Modifier  
Returns the collection of interferences Edge/Edge") InterfEE;
		BOPDS_VectorOfInterfEE & InterfEE ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfEF

Selector/Modifier  
Returns the collection of interferences Edge/Face") InterfEF;
		BOPDS_VectorOfInterfEF & InterfEF ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfFF

Selector/Modifier  
Returns the collection of interferences Face/Face") InterfFF;
		BOPDS_VectorOfInterfFF & InterfFF ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfVZ

Selector/Modifier  
Returns the collection of interferences Vertex/Solid") InterfVZ;
		BOPDS_VectorOfInterfVZ & InterfVZ ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfEZ

Selector/Modifier  
Returns the collection of interferences Edge/Solid") InterfEZ;
		BOPDS_VectorOfInterfEZ & InterfEZ ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfFZ

Selector/Modifier  
Returns the collection of interferences Face/Solid") InterfFZ;
		BOPDS_VectorOfInterfFZ & InterfFZ ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfInterfZZ

Selector/Modifier  
Returns the collection of interferences Solid/Solid") InterfZZ;
		BOPDS_VectorOfInterfZZ & InterfZZ ();
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Integer

Returns the number of types of the interferences") NbInterfTypes;
		static Standard_Integer NbInterfTypes ();
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	None

Modifier  
Adds the information about an interference between  
shapes with indices theI1, theI2 to the summary  
table of interferences") AddInterf;
		void AddInterf (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "Args:
	theI(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the shape with index theI  
is interferred") HasInterf;
		Standard_Boolean HasInterf (const Standard_Integer theI);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the shapes with indices theI1, theI2  
are interferred") HasInterf;
		Standard_Boolean HasInterf (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)
	theFlag(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Query  
Returns true if the shape with index theI1 is interfered  
with  
   any sub-shape of the shape with index theI2  (theFlag=true)  
   all sub-shapes of the shape with index theI2 (theFlag=false)") HasInterfShapeSubShapes;
		Standard_Boolean HasInterfShapeSubShapes (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Boolean theFlag = Standard_True);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the shapes with indices theI1, theI2  
have interferred sub-shapes") HasInterfSubShapes;
		Standard_Boolean HasInterfSubShapes (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_MapOfPassKey

Selector  
Returns the table of interferences  
 
debug") Interferences;
		const BOPDS_MapOfPassKey & Interferences ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
		%feature("autodoc", "Args:
	theCB(Handle_BOPDS_CommonBlock)

Returns:
	None

No detailed docstring for this function.") SortPaveBlocks;
		void SortPaveBlocks (const Handle_BOPDS_CommonBlock & theCB);
		%feature("autodoc", "Args:
	theCB(Handle_BOPDS_CommonBlock)
	theI(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsToSort;
		Standard_Boolean IsToSort (const Handle_BOPDS_CommonBlock & theCB,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSubShape;
		Standard_Boolean IsSubShape (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theLP(BOPDS_ListOfPave)

Returns:
	None

Fills theLP with sorted paves  
of the shape with index theIndex") Paves;
		void Paves (const Standard_Integer theIndex,BOPDS_ListOfPave & theLP);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theTolerance(Standard_Real)

Returns:
	None

Updates tolerance of the sub-shapes of the shape with index <theIndex>.") UpdateEdgeTolerance;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_FaceInfo;
		 BOPDS_FaceInfo ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 theAllocator - the allocator to manage the memory") BOPDS_FaceInfo;
		 BOPDS_FaceInfo (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the contents") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	theI(Standard_Integer)

Returns:
	None

Modifier  
Sets the index of the face <theI>") SetIndex;
		void SetIndex (const Standard_Integer theI);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the index of the face  
 
In") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_IndexedMapOfPaveBlock

Selector  
Returns the pave blocks of the face  
that  have state In") PaveBlocksIn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksIn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_IndexedMapOfPaveBlock

Selector/Modifier  
Returns the pave blocks  
 of the face  
that  have state In") ChangePaveBlocksIn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksIn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_MapOfInteger

Selector  
Returns the list of indices for vertices  
 of the face  
that have state In") VerticesIn;
		const BOPCol_MapOfInteger & VerticesIn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_MapOfInteger

Selector/Modifier  
Returns the list of indices for vertices  
 of the face  
that have state In  
 
On") ChangeVerticesIn;
		BOPCol_MapOfInteger & ChangeVerticesIn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_IndexedMapOfPaveBlock

Selector  
Returns the pave blocks of the face  
that  have state On") PaveBlocksOn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksOn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_IndexedMapOfPaveBlock

Selector/Modifier  
Returns the pave blocks  
 of the face  
that  have state On") ChangePaveBlocksOn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksOn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_MapOfInteger

Selector  
Returns the list of indices for vertices  
 of the face  
that have state On") VerticesOn;
		const BOPCol_MapOfInteger & VerticesOn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_MapOfInteger

Selector/Modifier  
Returns the list of indices for vertices  
 of the face  
that have state On  
 
Sections") ChangeVerticesOn;
		BOPCol_MapOfInteger & ChangeVerticesOn ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_IndexedMapOfPaveBlock

Selector  
Returns the pave blocks of the face  
that are  pave blocks of section edges") PaveBlocksSc;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksSc ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_IndexedMapOfPaveBlock

No detailed docstring for this function.") ChangePaveBlocksSc;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksSc ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_MapOfInteger

Selector  
Returns the list of indices for section  vertices  
 of the face") VerticesSc;
		const BOPCol_MapOfInteger & VerticesSc ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_MapOfInteger

Selector/Modifier  
Returns the list of indices for section  vertices  
 of the face  
 
Others") ChangeVerticesSc;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_IndexRange;
		 BOPDS_IndexRange ();
		%feature("autodoc", "Args:
	theI1(Standard_Integer)

Returns:
	None

Modifier  
Sets the first index <theI1>  of the range") SetFirst;
		void SetFirst (const Standard_Integer theI1);
		%feature("autodoc", "Args:
	theI2(Standard_Integer)

Returns:
	None

Modifier  
Sets the second index <theI2>  of the range") SetLast;
		void SetLast (const Standard_Integer theI2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the first index of the range") First;
		Standard_Integer First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the second index of the range") Last;
		Standard_Integer Last ();
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	None

Modifier  
Sets the first index of the range  <theI1>  
Sets the second index of the range <theI2>") SetIndices;
		void SetIndices (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	None

Selector  
Returns the first index of the range  <theI1>  
Returns the second index of the range <theI2>") Indices;
		void Indices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the range contains <theIndex>") Contains;
		Standard_Boolean Contains (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_Iterator;
		 BOPDS_Iterator ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 theAllocator - the allocator to manage the memory") BOPDS_Iterator;
		 BOPDS_Iterator (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	pDS(BOPDS_PDS)

Returns:
	None

Modifier  
Sets the data structure <pDS> to process") SetDS;
		void SetDS (const BOPDS_PDS & pDS);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_DS

Selector  
Returns the data structure") DS;
		const BOPDS_DS & DS ();
		%feature("autodoc", "Args:
	theType1(TopAbs_ShapeEnum)
	theType2(TopAbs_ShapeEnum)

Returns:
	None

Initializes the  iterator  
theType1 - the first type of shape  
theType2 - the second type of shape") Initialize;
		void Initialize (const TopAbs_ShapeEnum theType1,const TopAbs_ShapeEnum theType2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  true if still there are pairs  
 of intersected shapes") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves iterations ahead") Next;
		void Next ();
		%feature("autodoc", "Args:
	theIndex1(Standard_Integer)
	theIndex2(Standard_Integer)
	theWithSubShape(Standard_Boolean)

Returns:
	None

Returns indices (DS) of intersected shapes  
theIndex1 - the index of the first shape  
theIndex2 - the index of the second shape  
theWithSubShape - flag. True if the sub-shapes of  
 shapes are intersected") Value;
		void Value (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Boolean & theWithSubShape);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Perform the intersection algorithm and prepare  
the results to be used") Prepare;
		virtual void Prepare ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of intersections founded") ExpectedLength;
		Standard_Integer ExpectedLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the block length") BlockLength;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_PassKey;
		 BOPDS_PassKey ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 theAllocator - the allocator to manage the memory") BOPDS_PassKey;
		 BOPDS_PassKey (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	Other(BOPDS_PassKey)

Returns:
	None

Copy Contructor") BOPDS_PassKey;
		 BOPDS_PassKey (const BOPDS_PassKey & Other);
		%feature("autodoc", "Args:
	Other(BOPDS_PassKey)

Returns:
	BOPDS_PassKey

No detailed docstring for this function.") operator=;
		BOPDS_PassKey & operator = (const BOPDS_PassKey & Other);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear the contents") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	theI1(Standard_Integer)

Returns:
	None

Modifier  
Sets one Id <theI1>") SetIds;
		void SetIds (const Standard_Integer theI1);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	None

Modifier  
Sets two Id <theI1>,<theI2>") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)
	theI3(Standard_Integer)

Returns:
	None

Modifier  
Sets three Id <theI1>,<theI2>,<theI3>") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Integer theI3);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)
	theI3(Standard_Integer)
	theI4(Standard_Integer)

Returns:
	None

Modifier  
Sets four Id <theI1>,<theI2>,<theI3>,<theI4>") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Integer theI3,const Standard_Integer theI4);
		%feature("autodoc", "Args:
	theLI(BOPCol_ListOfInteger)

Returns:
	None

Modifier  
Sets the list of Id <theLI>") SetIds;
		void SetIds (const BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the number of Ids>") NbIds;
		Standard_Integer NbIds ();
		%feature("autodoc", "Args:
	theOther(BOPDS_PassKey)

Returns:
	Standard_Boolean

Query  
Returns true if the PassKey is equal to <the theOther>") IsEqual;
		Standard_Boolean IsEqual (const BOPDS_PassKey & theOther);
		%feature("autodoc", "Args:
	theUpper(Standard_Integer)

Returns:
	Standard_Integer

Query  
Returns hash  code") HashCode;
		Standard_Integer HashCode (const Standard_Integer theUpper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	Standard_Integer

Selector  
Returns Id of index <theIndex>") Id;
		Standard_Integer Id (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	theI1(Standard_Integer)
	theI2(Standard_Integer)

Returns:
	None

Selector  
Returns the first two Ids <theI1>,<theI2>") Ids;
		void Ids (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	aHex(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	aPKey(BOPDS_PassKey)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const BOPDS_PassKey & aPKey,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	aPKey1(BOPDS_PassKey)
	aPKey2(BOPDS_PassKey)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_Pave;
		 BOPDS_Pave ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

Modifier  
Sets the index of vertex <theIndex>") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the index of vertex") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	theParameter(Standard_Real)

Returns:
	None

Modifier  
Sets the parameter of vertex <theParameter>") SetParameter;
		void SetParameter (const Standard_Real theParameter);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Selector  
Returns the parameter of vertex") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theParameter(Standard_Real)

Returns:
	None

Selector  
Returns the index of vertex <theIndex>  
Returns the parameter of vertex <theParameter>") Contents;
		void Contents (Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theOther(BOPDS_Pave)

Returns:
	Standard_Boolean

Query  
Returns true if thr parameter od this is less  
 than the parameter of  <theOther>") IsLess;
		Standard_Boolean IsLess (const BOPDS_Pave & theOther);
		%feature("autodoc", "Args:
	theOther(BOPDS_Pave)

Returns:
	Standard_Boolean

No detailed docstring for this function.") operator<;
		Standard_Boolean operator < (const BOPDS_Pave & theOther);
		%feature("autodoc", "Args:
	theOther(BOPDS_Pave)

Returns:
	Standard_Boolean

Query  
Returns true if thr parameter od this is equal  
 to the parameter of  <theOther>") IsEqual;
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
        		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_PaveBlock;
		 BOPDS_PaveBlock ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 <theAllocator> - the allocator to manage the memory") BOPDS_PaveBlock;
		 BOPDS_PaveBlock (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	thePave(BOPDS_Pave)

Returns:
	None

Modifier  
Sets the first pave <thePave>") SetPave1;
		void SetPave1 (const BOPDS_Pave & thePave);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_Pave

Selector  
Returns the first pave") Pave1;
		const BOPDS_Pave & Pave1 ();
		%feature("autodoc", "Args:
	thePave(BOPDS_Pave)

Returns:
	None

Modifier  
Sets the second pave <thePave>") SetPave2;
		void SetPave2 (const BOPDS_Pave & thePave);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_Pave

Selector  
Returns the second pave") Pave2;
		const BOPDS_Pave & Pave2 ();
		%feature("autodoc", "Args:
	theEdge(Standard_Integer)

Returns:
	None

Modifier  
Sets the index of edge of pave block <theEdge>") SetEdge;
		void SetEdge (const Standard_Integer theEdge);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the index of edge of pave block") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Query  
Returns true if the pave block has edge") HasEdge;
		Standard_Boolean HasEdge ();
		%feature("autodoc", "Args:
	theEdge(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the pave block has edge  
Returns the index of edge <theEdge>") HasEdge;
		Standard_Boolean HasEdge (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theEdge(Standard_Integer)

Returns:
	None

Modifier  
Sets the index of original edge  
of the pave block <theEdge>") SetOriginalEdge;
		void SetOriginalEdge (const Standard_Integer theEdge);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the index of original edge of pave block") OriginalEdge;
		Standard_Integer OriginalEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Query  
Returns true if the edge is equal to the original edge  
of the pave block") IsSplitEdge;
		Standard_Boolean IsSplitEdge ();
		%feature("autodoc", "Args:
	theT1(Standard_Real)
	theT2(Standard_Real)

Returns:
	None

Selector  
Returns the parametric range <theT1,theT2>  
of the pave block") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	theOther(Handle_BOPDS_PaveBlock)

Returns:
	Standard_Boolean

Query  
Returns true if the pave block has pave indices  
that equal to the  pave indices of the pave block  
<theOther>") HasSameBounds;
		Standard_Boolean HasSameBounds (const Handle_BOPDS_PaveBlock & theOther);
		%feature("autodoc", "Args:
	theIndex1(Standard_Integer)
	theIndex2(Standard_Integer)

Returns:
	None

Selector  
Returns the pave indices  <theIndex1,theIndex2>  
of the pave block") Indices;
		void Indices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Query  
Returns true if the pave block contains extra paves") IsToUpdate;
		Standard_Boolean IsToUpdate ();
		%feature("autodoc", "Args:
	theLP(BOPDS_Pave)

Returns:
	None

Modifier  
Appends extra paves <theLP>") AppendExtPave;
		void AppendExtPave (const BOPDS_Pave & theLP);
		%feature("autodoc", "Args:
	thePave(BOPDS_Pave)

Returns:
	None

Modifier  
Appends extra pave <thePave>") AppendExtPave1;
		void AppendExtPave1 (const BOPDS_Pave & thePave);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_ListOfPave

Selector  
Returns the  extra paves") ExtPaves;
		const BOPDS_ListOfPave & ExtPaves ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_ListOfPave

Selector / Modifier  
Returns the extra paves") ChangeExtPaves;
		BOPDS_ListOfPave & ChangeExtPaves ();
		%feature("autodoc", "Args:
	theLPB(BOPDS_ListOfPaveBlock)
	theFlag(Standard_Boolean)=Standard_True

Returns:
	None

Modifier  
Updates the pave block. The extra paves are used  
to create new pave blocks <theLPB>.  
<theFlag> - if true, the first pave and the second  
pave are used to produce new pave blocks.") Update;
		void Update (BOPDS_ListOfPaveBlock & theLPB,const Standard_Boolean theFlag = Standard_True);
		%feature("autodoc", "Args:
	thePrm(Standard_Real)
	theTol(Standard_Real)

Returns:
	Standard_Boolean

Query  
Returns true if the extra paves contain the pave  
with given value of the parameter <thePrm>  
 <theTol>  - the value of the tolerance to compare") ContainsParameter;
		Standard_Boolean ContainsParameter (const Standard_Real thePrm,const Standard_Real theTol);
		%feature("autodoc", "Args:
	theTS1(Standard_Real)
	theTS2(Standard_Real)
	theBox(Bnd_Box)

Returns:
	None

Modifier  
Sets the shrunk data for the pave block  
<theTS1>,  <theTS2> - shrunk range  
<theBox> - the bounding box") SetShrunkData;
		void SetShrunkData (const Standard_Real theTS1,const Standard_Real theTS2,const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	theTS1(Standard_Real)
	theTS2(Standard_Real)
	theBox(Bnd_Box)

Returns:
	None

Selector  
Returns  the shrunk data for the pave block  
<theTS1>,  <theTS2> - shrunk range  
<theBox> - the bounding box") ShrunkData;
		void ShrunkData (Standard_Real &OutValue,Standard_Real &OutValue,Bnd_Box & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Query  
Returns true if the pave block contains  
the shrunk data") HasShrunkData;
		Standard_Boolean HasShrunkData ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	aPave(BOPDS_Pave)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const BOPDS_Pave & aPave,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	aPave1(BOPDS_Pave)
	aPave2(BOPDS_Pave)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_Point;
		 BOPDS_Point ();
		%feature("autodoc", "Args:
	thePnt(gp_Pnt)

Returns:
	None

Modifier  
Sets 3D point <thePnt>") SetPnt;
		void SetPnt (const gp_Pnt & thePnt);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Selector  
Returns 3D point") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	thePnt(gp_Pnt2d)

Returns:
	None

Modifier  
Sets 2D point on the first face <thePnt>") SetPnt2D1;
		void SetPnt2D1 (const gp_Pnt2d & thePnt);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Selector  
Returns 2D point on the first face <thePnt>") Pnt2D1;
		const gp_Pnt2d & Pnt2D1 ();
		%feature("autodoc", "Args:
	thePnt(gp_Pnt2d)

Returns:
	None

Modifier  
Sets 2D point on the second face <thePnt>") SetPnt2D2;
		void SetPnt2D2 (const gp_Pnt2d & thePnt);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Selector  
Returns 2D point on the second face <thePnt>") Pnt2D2;
		const gp_Pnt2d & Pnt2D2 ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	None

Modifier  
Sets the index of the vertex <theIndex>") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns index of the vertex") Index;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 theAllocator - the allocator to manage the memory") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	None

Modifier  
Sets the shape <theS>") SetShape;
		void SetShape (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Selector  
Returns the shape") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	theType(TopAbs_ShapeEnum)

Returns:
	None

Modifier  
Sets the type of shape theType") SetShapeType;
		void SetShapeType (const TopAbs_ShapeEnum theType);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Selector  
Returns the type of shape") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	theBox(Bnd_Box)

Returns:
	None

Modifier  
Sets the boundung box of the shape theBox") SetBox;
		void SetBox (const Bnd_Box & theBox);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

Selector  
Returns the boundung box of the shape") Box;
		const Bnd_Box & Box ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

Selector/Modifier  
Returns the boundung box of the shape") ChangeBox;
		Bnd_Box & ChangeBox ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfInteger

Selector  
Returns the list of indices of sub-shapes") SubShapes;
		const BOPCol_ListOfInteger & SubShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfInteger

Selector/ Modifier  
Returns the list of indices of sub-shapes") ChangeSubShapes;
		BOPCol_ListOfInteger & ChangeSubShapes ();
		%feature("autodoc", "Args:
	theI(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if the shape has sub-shape with  
index theI") HasSubShape;
		Standard_Boolean HasSubShape (const Standard_Integer theI);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasReference;
		Standard_Boolean HasReference ();
		%feature("autodoc", "Args:
	theI(Standard_Integer)

Returns:
	None

Modifier  
Sets the index of a reference information") SetReference;
		void SetReference (const Standard_Integer theI);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Selector  
Returns the index of a reference information") Reference;
		Standard_Integer Reference ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Query  
Returns true if the shape has boundary representation") HasBRep;
		Standard_Boolean HasBRep ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the shape can be participant of  
an interference  
 
 Flag") IsInterfering;
		Standard_Boolean IsInterfering ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Query  
Returns true if there is flag.") HasFlag;
		Standard_Boolean HasFlag ();
		%feature("autodoc", "Args:
	theFlag(Standard_Integer)

Returns:
	Standard_Boolean

Query  
Returns true if there is flag.  
Returns the the  flag theFlag") HasFlag;
		Standard_Boolean HasFlag (Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	theI(Standard_Integer)

Returns:
	None

Modifier  
Sets the flag") SetFlag;
		void SetFlag (const Standard_Integer theI);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the flag") Flag;
		Standard_Integer Flag ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_SubIterator;
		 BOPDS_SubIterator ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 theAllocator - the allocator to manage the memory") BOPDS_SubIterator;
		 BOPDS_SubIterator (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	pDS(BOPDS_PDS)

Returns:
	None

Modifier  
Sets the data structure <pDS> to process") SetDS;
		void SetDS (const BOPDS_PDS & pDS);
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_DS

Selector  
Returns the data structure") DS;
		const BOPDS_DS & DS ();
		%feature("autodoc", "Args:
	theLI(BOPCol_ListOfInteger)

Returns:
	None

Modifier  
Sets the first set of indices  <theLI> to process") SetSubSet1;
		void SetSubSet1 (const BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfInteger

Selector  
Returns the first set of indices to process") SubSet1;
		const BOPCol_ListOfInteger & SubSet1 ();
		%feature("autodoc", "Args:
	theLI(BOPCol_ListOfInteger)

Returns:
	None

Modifier  
Sets the second set of indices  <theLI> to process") SetSubSet2;
		void SetSubSet2 (const BOPCol_ListOfInteger & theLI);
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfInteger

Selector  
Returns the second set of indices to process") SubSet2;
		const BOPCol_ListOfInteger & SubSet2 ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the  iterator") Initialize;
		void Initialize ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  true if still there are pairs  
 of intersected shapes") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves iterations ahead") Next;
		void Next ();
		%feature("autodoc", "Args:
	theIndex1(Standard_Integer)
	theIndex2(Standard_Integer)

Returns:
	None

Returns indices (DS) of intersected shapes  
theIndex1 - the index of the first shape  
theIndex2 - the index of the second shape") Value;
		void Value (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Perform the intersection algorithm and prepare  
the results to be used") Prepare;
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
		%feature("autodoc", "Args:
	theT1(TopAbs_ShapeEnum)
	theT2(TopAbs_ShapeEnum)

Returns:
	static Standard_Integer

Converts the conmbination of two types  
 of shape <theT1>,<theT2>  
to the one integer value, that is returned") TypeToInteger;
		static Standard_Integer TypeToInteger (const TopAbs_ShapeEnum theT1,const TopAbs_ShapeEnum theT2);
		%feature("autodoc", "Args:
	theT(TopAbs_ShapeEnum)

Returns:
	static Standard_Integer

Converts the type of shape <theT>,  
to integer value, that is returned") TypeToInteger;
		static Standard_Integer TypeToInteger (const TopAbs_ShapeEnum theT);
		%feature("autodoc", "Args:
	theT(TopAbs_ShapeEnum)

Returns:
	static Standard_Boolean

Returns true if the type  <theT> correspond  
to a shape having boundary representation") HasBRep;
		static Standard_Boolean HasBRep (const TopAbs_ShapeEnum theT);
		%feature("autodoc", "Args:
	theT(TopAbs_ShapeEnum)

Returns:
	static Standard_Boolean

Returns true if the type <theT> can be participant of  
an interference") IsInterfering;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfEE;
		 BOPDS_InterfEE ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfEE;
		 BOPDS_InterfEE (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theCP(IntTools_CommonPrt)

Returns:
	None

/**
*  Modifier
* Sets the info of common part 
* @param theCP
*   common part
*/") SetCommonPart;
		void SetCommonPart (const IntTools_CommonPrt & theCP);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CommonPrt

/**
*  Selector
* Returns the info of common part 
* @return
*   common part
*/") CommonPart;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfEF;
		 BOPDS_InterfEF ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*//**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfEF;
		 BOPDS_InterfEF (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theCP(IntTools_CommonPrt)

Returns:
	None

/**
* Modifier
* Sets the info of common part 
* @param theCP
*   common part
*/") SetCommonPart;
		void SetCommonPart (const IntTools_CommonPrt & theCP);
		%feature("autodoc", "Args:
	None
Returns:
	IntTools_CommonPrt

/**
*  Selector
* Returns the info of common part 
* @return
*   common part
*/") CommonPart;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfEZ;
		 BOPDS_InterfEZ ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfEZ;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfFF;
		 BOPDS_InterfFF ();
		%feature("autodoc", "Args:
	theNbCurves(Standard_Integer)
	theNbPoints(Standard_Integer)

Returns:
	None

/**
* Initializer
* @param theNbCurves
*   number of intersection curves
* @param theNbPoints
*   number of intersection points
*/") Init;
		void Init (const Standard_Integer theNbCurves,const Standard_Integer theNbPoints);
		%feature("autodoc", "Args:
	theFlag(Standard_Boolean)

Returns:
	None

/**
* Modifier
* Sets the flag of whether the faces are tangent  
* @param theFlag
*   the flag 
*/") SetTangentFaces;
		void SetTangentFaces (const Standard_Boolean theFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

/**
* Selector
* Returns the flag whether the faces are tangent  
* @return
*   the flag 
*/") TangentFaces;
		Standard_Boolean TangentFaces ();
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

/**
* Modifier
* Sets the value of 3D tolerance  
* @param theTol
*   3D tolerance
*/") SetTolR3D;
		void SetTolR3D (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

/**
* Selector
* Returns the value of 3D tolerance  
* @return
*   3D tolerance
*/") TolR3D;
		Standard_Real TolR3D ();
		%feature("autodoc", "Args:
	theTol(Standard_Real)

Returns:
	None

/**
* Modifier
* Sets the value of 2D tolerance  
* @param theTol
*   2D tolerance
*/") SetTolR2D;
		void SetTolR2D (const Standard_Real theTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

/**
* Selector 
* Returns the value of 2D tolerance  
* @return
*   2D tolerance
*/") TolR2D;
		Standard_Real TolR2D ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfCurve

/**
* Selector
* Returns the intersection curves  
* @return
*   intersection curves 
*/") Curves;
		const BOPDS_VectorOfCurve & Curves ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfCurve

/**
* Selector/Modifier
* Returns the intersection curves  
* @return
*   intersection curves 
*/") ChangeCurves;
		BOPDS_VectorOfCurve & ChangeCurves ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfPoint

/**
* Selector
* Returns the intersection points  
* @return
*   intersection points
*/") Points;
		const BOPDS_VectorOfPoint & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPDS_VectorOfPoint

/**
* Selector/Modifier
* Returns the intersection points  
* @return
*   intersection points
*/") ChangePoints;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfFZ;
		 BOPDS_InterfFZ ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfFZ;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfVE;
		 BOPDS_InterfVE ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfVE;
		 BOPDS_InterfVE (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theT(Standard_Real)

Returns:
	None

/**
*  Modifier
* Sets the value of parameter 
* of the point of the vertex 
* on the curve of the edge
* @param theT
*   value of parameter 
*/") SetParameter;
		void SetParameter (const Standard_Real theT);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

/**
*  Selector
* Returrns the value of parameter 
* of the point of the vertex 
* on the curve of the edge
* @return
*   value of parameter 
*/") Parameter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfVF;
		 BOPDS_InterfVF ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfVF;
		 BOPDS_InterfVF (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theU(Standard_Real)
	theV(Standard_Real)

Returns:
	None

/**
* Modifier
* Sets the value of parameters 
* of the point of the vertex 
* on the surface of of the face
* @param theU
*   value of U parameter
* @param theV 
*   value of U parameter 
*/") SetUV;
		void SetUV (const Standard_Real theU,const Standard_Real theV);
		%feature("autodoc", "Args:
	theU(Standard_Real)
	theV(Standard_Real)

Returns:
	None

/**
* Selector
* Returns the value of parameters 
* of the point of the vertex 
* on the surface of of the face
* @param theU
*   value of U parameter
* @param theV 
*   value of U parameter 
*/") UV;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfVV;
		 BOPDS_InterfVV ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfVV;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfVZ;
		 BOPDS_InterfVZ ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfVZ;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
*  Constructor
*/") BOPDS_InterfZZ;
		 BOPDS_InterfZZ ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
*  Constructor
* @param theAllocator
*   allocator to manage the memory
*/") BOPDS_InterfZZ;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty contructor") BOPDS_IteratorSI;
		 BOPDS_IteratorSI ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

Contructor  
 theAllocator - the allocator to manage the memory") BOPDS_IteratorSI;
		 BOPDS_IteratorSI (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theLevel(Standard_Integer)

Returns:
	None

Updates the lists of possible intersections  
          according to the value of <theLevel>.  
          It defines which interferferences will be checked:  
          0 - only V/V;  
          1 - V/V and V/E;  
          2 - V/V, V/E and E/E;  
          3 - V/V, V/E, E/E and V/F;  
          4 - V/V, V/E, E/E, V/F and E/F;  
          other - all interferences.") UpdateByLevelOfCheck;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	Other(BOPDS_PassKeyBoolean)

Returns:
	None

No detailed docstring for this function.") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean (const BOPDS_PassKeyBoolean & Other);
		%feature("autodoc", "Args:
	theFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetFlag;
		void SetFlag (const Standard_Boolean theFlag);
		%feature("autodoc", "Args:
	&(BOPDS_PassKeyBoolean)

Returns:
	BOPDS_PassKeyBoolean

No detailed docstring for this function.") operator=;
		BOPDS_PassKeyBoolean & operator = (const BOPDS_PassKeyBoolean &);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Flag;
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
