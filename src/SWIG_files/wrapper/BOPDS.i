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
%define BOPDSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BOPDSDOCSTRING) BOPDS

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include BOPDS_headers.i


%include "BOPCol_NCVector.hxx";
/* templates */
%template(BOPDS_VectorOfInterfZZ) BOPCol_NCVector <BOPDS_InterfZZ>;
%template(BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks) NCollection_IndexedDataMap <TopoDS_Shape , BOPDS_CoupleOfPaveBlocks , TopTools_ShapeMapHasher>;
%template(BOPDS_VectorOfInterfVV) BOPCol_NCVector <BOPDS_InterfVV>;
%template(BOPDS_VectorOfIndexRange) BOPCol_NCVector <BOPDS_IndexRange>;
%template(BOPDS_VectorOfFaceInfo) BOPCol_NCVector <BOPDS_FaceInfo>;
%template(BOPDS_MapOfPassKey) NCollection_Map <BOPDS_PassKey , BOPDS_PassKeyMapHasher>;
%template(BOPDS_VectorOfCurve) BOPCol_NCVector <BOPDS_Curve>;
%template(BOPDS_IndexedMapOfPaveBlock) NCollection_IndexedMap <Handle_BOPDS_PaveBlock , TColStd_MapTransientHasher>;
%template(BOPDS_VectorOfInterfVF) BOPCol_NCVector <BOPDS_InterfVF>;
%template(BOPDS_MapOfPave) NCollection_Map <BOPDS_Pave , BOPDS_PaveMapHasher>;
%template(BOPDS_VectorOfInterfFZ) BOPCol_NCVector <BOPDS_InterfFZ>;
%template(BOPDS_IndexedDataMapOfPaveBlockListOfInteger) NCollection_IndexedDataMap <Handle_BOPDS_PaveBlock , BOPCol_ListOfInteger , TColStd_MapTransientHasher>;
%template(BOPDS_VectorOfPoint) BOPCol_NCVector <BOPDS_Point>;
%template(BOPDS_VectorOfPave) NCollection_Array1 <BOPDS_Pave>;

%extend NCollection_Array1 <BOPDS_Pave> {
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
%template(BOPDS_VectorOfInterfEZ) BOPCol_NCVector <BOPDS_InterfEZ>;
%template(BOPDS_DataMapOfPaveBlockListOfPaveBlock) NCollection_DataMap <Handle_BOPDS_PaveBlock , BOPDS_ListOfPaveBlock , TColStd_MapTransientHasher>;
%template(BOPDS_MapOfCommonBlock) NCollection_Map <Handle_BOPDS_CommonBlock , TColStd_MapTransientHasher>;
%template(BOPDS_VectorOfInterfFF) BOPCol_NCVector <BOPDS_InterfFF>;
%template(BOPDS_ListOfPave) NCollection_List <BOPDS_Pave>;
%template(BOPDS_DataMapOfPaveBlockListOfInteger) NCollection_DataMap <Handle_BOPDS_PaveBlock , BOPCol_ListOfInteger , TColStd_MapTransientHasher>;
%template(BOPDS_DataMapOfShapeCoupleOfPaveBlocks) NCollection_DataMap <TopoDS_Shape , BOPDS_CoupleOfPaveBlocks , TopTools_ShapeMapHasher>;
%template(BOPDS_MapOfPassKeyBoolean) NCollection_Map <BOPDS_PassKeyBoolean , BOPDS_PassKeyMapHasher>;
%template(BOPDS_VectorOfVectorOfPair) BOPCol_NCVector <BOPDS_VectorOfPair>;
%template(BOPDS_VectorOfListOfPaveBlock) BOPCol_NCVector <BOPDS_ListOfPaveBlock>;
%template(BOPDS_VectorOfInterfEE) BOPCol_NCVector <BOPDS_InterfEE>;
%template(BOPDS_VectorOfShapeInfo) BOPCol_NCVector <BOPDS_ShapeInfo>;
%template(BOPDS_VectorOfInterfVZ) BOPCol_NCVector <BOPDS_InterfVZ>;
%template(BOPDS_VectorOfPair) BOPCol_NCVector <BOPDS_Pair>;
%template(BOPDS_VectorOfInterfEF) BOPCol_NCVector <BOPDS_InterfEF>;
%template(BOPDS_VectorOfInterfVE) BOPCol_NCVector <BOPDS_InterfVE>;
%template(BOPDS_DataMapOfPassKeyListOfPaveBlock) NCollection_DataMap <BOPDS_PassKey , BOPDS_ListOfPaveBlock , BOPDS_PassKeyMapHasher>;
%template(BOPDS_DataMapOfIntegerListOfPaveBlock) NCollection_DataMap <Standard_Integer , BOPDS_ListOfPaveBlock , TColStd_MapIntegerHasher>;
%template(BOPDS_VectorOfListOfPassKeyBoolean) BOPCol_NCVector <BOPDS_ListOfPassKeyBoolean>;
%template(BOPDS_ListOfPassKeyBoolean) NCollection_List <BOPDS_PassKeyBoolean>;
%template(BOPDS_MapOfPair) NCollection_Map <BOPDS_Pair , BOPDS_PairMapHasher>;
%template(BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock) NCollection_IndexedDataMap <Handle_BOPDS_PaveBlock , BOPDS_ListOfPaveBlock , TColStd_MapTransientHasher>;
%template(BOPDS_ListOfPaveBlock) NCollection_List <Handle_BOPDS_PaveBlock>;
%template(BOPDS_MapOfPaveBlock) NCollection_Map <Handle_BOPDS_PaveBlock , TColStd_MapTransientHasher>;
/* end templates declaration */


/* typedefs */
typedef BOPCol_NCVector <BOPDS_InterfZZ> BOPDS_VectorOfInterfZZ;
typedef NCollection_IndexedDataMap <TopoDS_Shape , BOPDS_CoupleOfPaveBlocks , TopTools_ShapeMapHasher> BOPDS_IndexedDataMapOfShapeCoupleOfPaveBlocks;
typedef BOPCol_NCVector <BOPDS_InterfVV> BOPDS_VectorOfInterfVV;
typedef BOPCol_NCVector <BOPDS_IndexRange> BOPDS_VectorOfIndexRange;
typedef BOPDS_IteratorSI * BOPDS_PIteratorSI;
typedef BOPCol_NCVector <BOPDS_FaceInfo> BOPDS_VectorOfFaceInfo;
typedef NCollection_Map <BOPDS_PassKey , BOPDS_PassKeyMapHasher> BOPDS_MapOfPassKey;
typedef BOPDS_MapOfPassKey::Iterator BOPDS_MapIteratorMapOfPassKey;
typedef BOPCol_NCVector <BOPDS_Curve> BOPDS_VectorOfCurve;
typedef NCollection_IndexedMap <Handle_BOPDS_PaveBlock , TColStd_MapTransientHasher> BOPDS_IndexedMapOfPaveBlock;
typedef BOPCol_NCVector <BOPDS_InterfVF> BOPDS_VectorOfInterfVF;
typedef BOPDS_DataMapOfPaveBlockCommonBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockCommonBlock;
typedef NCollection_Map <BOPDS_Pave , BOPDS_PaveMapHasher> BOPDS_MapOfPave;
typedef BOPDS_MapOfPave::Iterator BOPDS_MapIteratorOfMapOfPave;
typedef BOPCol_NCVector <BOPDS_InterfFZ> BOPDS_VectorOfInterfFZ;
typedef NCollection_IndexedDataMap <Handle_BOPDS_PaveBlock , BOPCol_ListOfInteger , TColStd_MapTransientHasher> BOPDS_IndexedDataMapOfPaveBlockListOfInteger;
typedef BOPCol_NCVector <BOPDS_Point> BOPDS_VectorOfPoint;
typedef NCollection_Array1 <BOPDS_Pave> BOPDS_VectorOfPave;
typedef BOPDS_DS * BOPDS_PDS;
typedef BOPCol_NCVector <BOPDS_InterfEZ> BOPDS_VectorOfInterfEZ;
typedef NCollection_DataMap <Handle_BOPDS_PaveBlock , BOPDS_ListOfPaveBlock , TColStd_MapTransientHasher> BOPDS_DataMapOfPaveBlockListOfPaveBlock;
typedef BOPDS_DataMapOfPaveBlockListOfPaveBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfPaveBlock;
typedef NCollection_Map <Handle_BOPDS_CommonBlock , TColStd_MapTransientHasher> BOPDS_MapOfCommonBlock;
typedef BOPDS_MapOfCommonBlock::Iterator BOPDS_MapIteratorOfMapOfCommonBlock;
typedef BOPCol_NCVector <BOPDS_InterfFF> BOPDS_VectorOfInterfFF;
typedef NCollection_List <BOPDS_Pave> BOPDS_ListOfPave;
typedef BOPDS_ListOfPave::Iterator BOPDS_ListIteratorOfListOfPave;
typedef NCollection_DataMap <Handle_BOPDS_PaveBlock , BOPCol_ListOfInteger , TColStd_MapTransientHasher> BOPDS_DataMapOfPaveBlockListOfInteger;
typedef BOPDS_DataMapOfPaveBlockListOfInteger::Iterator BOPDS_DataMapIteratorOfDataMapOfPaveBlockListOfInteger;
typedef NCollection_DataMap <TopoDS_Shape , BOPDS_CoupleOfPaveBlocks , TopTools_ShapeMapHasher> BOPDS_DataMapOfShapeCoupleOfPaveBlocks;
typedef BOPDS_DataMapOfShapeCoupleOfPaveBlocks::Iterator BOPDS_DataMapIteratorOfDataMapOfShapeCoupleOfPaveBlocks;
typedef NCollection_Map <BOPDS_PassKeyBoolean , BOPDS_PassKeyMapHasher> BOPDS_MapOfPassKeyBoolean;
typedef BOPDS_MapOfPassKeyBoolean::Iterator BOPDS_MapIteratorMapOfPassKeyBoolean;
typedef BOPCol_NCVector <BOPDS_VectorOfPair> BOPDS_VectorOfVectorOfPair;
typedef BOPCol_NCVector <BOPDS_ListOfPaveBlock> BOPDS_VectorOfListOfPaveBlock;
typedef BOPCol_NCVector <BOPDS_InterfEE> BOPDS_VectorOfInterfEE;
typedef BOPCol_NCVector <BOPDS_ShapeInfo> BOPDS_VectorOfShapeInfo;
typedef BOPCol_NCVector <BOPDS_InterfVZ> BOPDS_VectorOfInterfVZ;
typedef BOPCol_NCVector <BOPDS_Pair> BOPDS_VectorOfPair;
typedef BOPDS_Iterator * BOPDS_PIterator;
typedef BOPCol_NCVector <BOPDS_InterfEF> BOPDS_VectorOfInterfEF;
typedef BOPCol_NCVector <BOPDS_InterfVE> BOPDS_VectorOfInterfVE;
typedef NCollection_DataMap <BOPDS_PassKey , BOPDS_ListOfPaveBlock , BOPDS_PassKeyMapHasher> BOPDS_DataMapOfPassKeyListOfPaveBlock;
typedef BOPDS_DataMapOfPassKeyListOfPaveBlock::Iterator BOPDS_DataMapIteratorOfDataMapOfPassKeyListOfPaveBlock;
typedef NCollection_DataMap <Standard_Integer , BOPDS_ListOfPaveBlock , TColStd_MapIntegerHasher> BOPDS_DataMapOfIntegerListOfPaveBlock;
typedef BOPCol_NCVector <BOPDS_ListOfPassKeyBoolean> BOPDS_VectorOfListOfPassKeyBoolean;
typedef NCollection_List <BOPDS_PassKeyBoolean> BOPDS_ListOfPassKeyBoolean;
typedef BOPDS_ListOfPassKeyBoolean::Iterator BOPDS_ListIteratorOfListOfPassKeyBoolean;
typedef NCollection_Map <BOPDS_Pair , BOPDS_PairMapHasher> BOPDS_MapOfPair;
typedef BOPDS_MapOfPair::Iterator BOPDS_MapIteratorOfMapOfPair;
typedef NCollection_IndexedDataMap <Handle_BOPDS_PaveBlock , BOPDS_ListOfPaveBlock , TColStd_MapTransientHasher> BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock;
typedef NCollection_List <Handle_BOPDS_PaveBlock> BOPDS_ListOfPaveBlock;
typedef BOPDS_ListOfPaveBlock::Iterator BOPDS_ListIteratorOfListOfPaveBlock;
typedef NCollection_Map <Handle_BOPDS_PaveBlock , TColStd_MapTransientHasher> BOPDS_MapOfPaveBlock;
typedef BOPDS_MapOfPaveBlock::Iterator BOPDS_MapIteratorOfMapOfPaveBlock;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(BOPDS_CommonBlock)
%wrap_handle(BOPDS_PaveBlock)

%nodefaultctor BOPDS_CommonBlock;
class BOPDS_CommonBlock : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	* Modifier Adds the index of the face <aF> to the list of indices of faces of the common block

	:param aF:
	:type aF: int
	:rtype: None
") AddFace;
		void AddFace (const Standard_Integer aF);
		%feature("compactdefaultargs") AddPaveBlock;
		%feature("autodoc", "	* Modifier Adds the pave block <aPB> to the list of pave blocks of the common block

	:param aPB:
	:type aPB: Handle_BOPDS_PaveBlock &
	:rtype: None
") AddPaveBlock;
		void AddPaveBlock (const Handle_BOPDS_PaveBlock & aPB);
		%feature("compactdefaultargs") AppendFaces;
		%feature("autodoc", "	* Modifier Appends the list of indices of faces <aLF> to the list of indices of faces of the common block (the input list is emptied)

	:param aLF:
	:type aLF: BOPCol_ListOfInteger &
	:rtype: None
") AppendFaces;
		void AppendFaces (BOPCol_ListOfInteger & aLF);
		%feature("compactdefaultargs") BOPDS_CommonBlock;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock ();
		%feature("compactdefaultargs") BOPDS_CommonBlock;
		%feature("autodoc", "	* Contructor <theAllocator> - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_CommonBlock;
		 BOPDS_CommonBlock (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Query Returns true if the common block contains a pave block that is equal to <thePB>

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Query Returns true if the common block contains the face with index equal to <theF>

	:param theF:
	:type theF: int
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theF);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Selector Returns the index of the edge of all pave blocks of the common block

	:rtype: int
") Edge;
		Standard_Integer Edge ();
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "	* Selector Returns the list of indices of faces of the common block

	:rtype: BOPCol_ListOfInteger
") Faces;
		const BOPCol_ListOfInteger & Faces ();
		%feature("compactdefaultargs") IsPaveBlockOnEdge;
		%feature("autodoc", "	* Query Returns true if the common block contains a pave block that belongs to the edge with index <theIx>

	:param theIndex:
	:type theIndex: int
	:rtype: bool
") IsPaveBlockOnEdge;
		Standard_Boolean IsPaveBlockOnEdge (const Standard_Integer theIndex);
		%feature("compactdefaultargs") IsPaveBlockOnFace;
		%feature("autodoc", "	* Query Returns true if the common block contains a pave block that belongs to the face with index <theIx>

	:param theIndex:
	:type theIndex: int
	:rtype: bool
") IsPaveBlockOnFace;
		Standard_Boolean IsPaveBlockOnFace (const Standard_Integer theIndex);
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "	* Selector Returns the first pave block of the common block

	:rtype: Handle_BOPDS_PaveBlock
") PaveBlock1;
		Handle_BOPDS_PaveBlock PaveBlock1 ();
		%feature("compactdefaultargs") PaveBlockOnEdge;
		%feature("autodoc", "	* Selector Returns the pave block that belongs to the edge with index <theIx>

	:param theIndex:
	:type theIndex: int
	:rtype: Handle_BOPDS_PaveBlock
") PaveBlockOnEdge;
		Handle_BOPDS_PaveBlock PaveBlockOnEdge (const Standard_Integer theIndex);
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "	* Selector Returns the list of pave blocks of the common block

	:rtype: BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks ();
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "	* Modifier Assign the index <theEdge> as the edge index to all pave blocks of the common block

	:param theEdge:
	:type theEdge: int
	:rtype: None
") SetEdge;
		void SetEdge (const Standard_Integer theEdge);
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "	* Modifier Sets the list of indices of faces <aLF> of the common block

	:param aLF:
	:type aLF: BOPCol_ListOfInteger &
	:rtype: None
") SetFaces;
		void SetFaces (const BOPCol_ListOfInteger & aLF);
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "	* Modifier Adds the list of pave blocks <aLPB> to the list of pave blocks of the common block

	:param aLPB:
	:type aLPB: BOPDS_ListOfPaveBlock &
	:rtype: None
") SetPaveBlocks;
		void SetPaveBlocks (const BOPDS_ListOfPaveBlock & aLPB);
};


%make_alias(BOPDS_CommonBlock)

%extend BOPDS_CommonBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_CoupleOfPaveBlocks;
class BOPDS_CoupleOfPaveBlocks {
	public:
		%feature("compactdefaultargs") BOPDS_CoupleOfPaveBlocks;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks ();
		%feature("compactdefaultargs") BOPDS_CoupleOfPaveBlocks;
		%feature("autodoc", "	* /** * Constructor * @param thePB1 * first pave block * @param thePB2 * secondt pave block */

	:param thePB1:
	:type thePB1: Handle_BOPDS_PaveBlock &
	:param thePB2:
	:type thePB2: Handle_BOPDS_PaveBlock &
	:rtype: None
") BOPDS_CoupleOfPaveBlocks;
		 BOPDS_CoupleOfPaveBlocks (const Handle_BOPDS_PaveBlock & thePB1,const Handle_BOPDS_PaveBlock & thePB2);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* /** * Returns the index * returns * index */

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") IndexInterf;
		%feature("autodoc", "	* /** * Returns the index of an interference * returns * index of an interference */

	:rtype: int
") IndexInterf;
		Standard_Integer IndexInterf ();
		%feature("compactdefaultargs") PaveBlock1;
		%feature("autodoc", "	* /** * Returns the first pave block * returns * the first pave block */

	:rtype: Handle_BOPDS_PaveBlock
") PaveBlock1;
		Handle_BOPDS_PaveBlock PaveBlock1 ();
		%feature("compactdefaultargs") PaveBlock2;
		%feature("autodoc", "	* /** * Returns the second pave block * returns * the second pave block */

	:rtype: Handle_BOPDS_PaveBlock
") PaveBlock2;
		Handle_BOPDS_PaveBlock PaveBlock2 ();
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "	* /** * Returns pave blocks * @param thePB1 * the first pave block * @param thePB2 * the second pave block */

	:param thePB1:
	:type thePB1: Handle_BOPDS_PaveBlock &
	:param thePB2:
	:type thePB2: Handle_BOPDS_PaveBlock &
	:rtype: None
") PaveBlocks;
		void PaveBlocks (Handle_BOPDS_PaveBlock & thePB1,Handle_BOPDS_PaveBlock & thePB2);
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* /** * Sets an index * @param theIndex * index */

	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetIndexInterf;
		%feature("autodoc", "	* /** * Sets an index of an interference * @param theIndex * index of an interference */

	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetIndexInterf;
		void SetIndexInterf (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetPaveBlock1;
		%feature("autodoc", "	* /** * Sets the first pave block * @param thePB * the first pave block */

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: None
") SetPaveBlock1;
		void SetPaveBlock1 (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") SetPaveBlock2;
		%feature("autodoc", "	* /** * Sets the second pave block * @param thePB * the second pave block */

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: None
") SetPaveBlock2;
		void SetPaveBlock2 (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "	* /** * Sets pave blocks * @param thePB1 * first pave block * @param thePB2 * secondt pave block */

	:param thePB1:
	:type thePB1: Handle_BOPDS_PaveBlock &
	:param thePB2:
	:type thePB2: Handle_BOPDS_PaveBlock &
	:rtype: None
") SetPaveBlocks;
		void SetPaveBlocks (const Handle_BOPDS_PaveBlock & thePB1,const Handle_BOPDS_PaveBlock & thePB2);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* /** * Sets the tolerance associated with this couple */

	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* /** * Returns the tolerance associated with this couple */

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
};


%extend BOPDS_CoupleOfPaveBlocks {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_Curve;
class BOPDS_Curve {
	public:
		%feature("compactdefaultargs") BOPDS_Curve;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Curve;
		 BOPDS_Curve ();
		%feature("compactdefaultargs") BOPDS_Curve;
		%feature("autodoc", "	* Contructor <theAllocator> - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_Curve;
		 BOPDS_Curve (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Selector Returns the bounding box of the curve

	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
		%feature("compactdefaultargs") ChangeBox;
		%feature("autodoc", "	* Selector/Modifier Returns the bounding box of the curve

	:rtype: Bnd_Box
") ChangeBox;
		Bnd_Box & ChangeBox ();
		%feature("compactdefaultargs") ChangePaveBlock1;
		%feature("autodoc", "	* Selector/Modifier Returns initial pave block of the curve

	:rtype: Handle_BOPDS_PaveBlock
") ChangePaveBlock1;
		Handle_BOPDS_PaveBlock ChangePaveBlock1 ();
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "	* Selector/Modifier Returns the list of pave blocks of the curve

	:rtype: BOPDS_ListOfPaveBlock
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks ();
		%feature("compactdefaultargs") ChangeTechnoVertices;
		%feature("autodoc", "	* Selector/Modifier Returns list of indices of technologic vertices of the curve

	:rtype: BOPCol_ListOfInteger
") ChangeTechnoVertices;
		BOPCol_ListOfInteger & ChangeTechnoVertices ();
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Selector Returns the curve

	:rtype: IntTools_Curve
") Curve;
		const IntTools_Curve & Curve ();
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "	* Query Returns true if at least one pave block of the curve has edge

	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge ();
		%feature("compactdefaultargs") InitPaveBlock1;
		%feature("autodoc", "	* Creates initial pave block of the curve

	:rtype: None
") InitPaveBlock1;
		void InitPaveBlock1 ();
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "	* Selector Returns the list of pave blocks of the curve

	:rtype: BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks ();
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "	* Modifier Sets the bounding box <theBox> of the curve

	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") SetBox;
		void SetBox (const Bnd_Box & theBox);
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "	* Modifier Sets the curve <theC>

	:param theC:
	:type theC: IntTools_Curve &
	:rtype: None
") SetCurve;
		void SetCurve (const IntTools_Curve & theC);
		%feature("compactdefaultargs") SetPaveBlocks;
		%feature("autodoc", "	:param theLPB:
	:type theLPB: BOPDS_ListOfPaveBlock &
	:rtype: None
") SetPaveBlocks;
		void SetPaveBlocks (const BOPDS_ListOfPaveBlock & theLPB);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets the tolerance for the curve.

	:param theTol:
	:type theTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theTol);
		%feature("compactdefaultargs") TangentialTolerance;
		%feature("autodoc", "	* Returns the tangential tolerance of the curve

	:rtype: float
") TangentialTolerance;
		Standard_Real TangentialTolerance ();
		%feature("compactdefaultargs") TechnoVertices;
		%feature("autodoc", "	* Selector Returns list of indices of technologic vertices of the curve

	:rtype: BOPCol_ListOfInteger
") TechnoVertices;
		const BOPCol_ListOfInteger & TechnoVertices ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns the tolerance of the curve

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
};


%extend BOPDS_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_DS;
class BOPDS_DS {
	public:
		%feature("compactdefaultargs") AddInterf;
		%feature("autodoc", "	* Modifier Adds the information about an interference between shapes with indices theI1, theI2 to the summary table of interferences

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: None
") AddInterf;
		void AddInterf (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") AddShapeSD;
		%feature("autodoc", "	* Modifier Adds the information about same domain shapes with indices theIndex, theIndexSD

	:param theIndex:
	:type theIndex: int
	:param theIndexSD:
	:type theIndexSD: int
	:rtype: None
") AddShapeSD;
		void AddShapeSD (const Standard_Integer theIndex,const Standard_Integer theIndexSD);
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "	* Selector

	:rtype: BOPCol_BaseAllocator
") Allocator;
		const BOPCol_BaseAllocator & Allocator ();
		%feature("compactdefaultargs") AloneVertices;
		%feature("autodoc", "	* Selector Returns the indices of alone vertices for the face with index theIndex

	:param theF:
	:type theF: int
	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") AloneVertices;
		void AloneVertices (const Standard_Integer theF,BOPCol_ListOfInteger & theLI);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Modifier Appends the information about the shape [theSI] to the data structure Returns the index of theSI in the data structure

	:param theSI:
	:type theSI: BOPDS_ShapeInfo &
	:rtype: int
") Append;
		Standard_Integer Append (const BOPDS_ShapeInfo & theSI);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	* Modifier Appends the default information about the shape [theS] to the data structure Returns the index of theS in the data structure

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: int
") Append;
		Standard_Integer Append (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	* Selector Returns the arguments of an operation

	:rtype: BOPCol_ListOfShape
") Arguments;
		const BOPCol_ListOfShape & Arguments ();
		%feature("compactdefaultargs") BOPDS_DS;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_DS;
		 BOPDS_DS ();
		%feature("compactdefaultargs") BOPDS_DS;
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_DS;
		 BOPDS_DS (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") ChangeFaceInfo;
		%feature("autodoc", "	* Selector/Modifier Returns the state of face with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: BOPDS_FaceInfo
") ChangeFaceInfo;
		BOPDS_FaceInfo & ChangeFaceInfo (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ChangePaveBlocks;
		%feature("autodoc", "	* Selector/Modifier Returns the pave blocks for the shape with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: BOPDS_ListOfPaveBlock
") ChangePaveBlocks;
		BOPDS_ListOfPaveBlock & ChangePaveBlocks (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ChangePaveBlocksPool;
		%feature("autodoc", "	* Selector/Modifier Returns the information about pave blocks on source edges

	:rtype: BOPDS_VectorOfListOfPaveBlock
") ChangePaveBlocksPool;
		BOPDS_VectorOfListOfPaveBlock & ChangePaveBlocksPool ();
		%feature("compactdefaultargs") ChangeShapeInfo;
		%feature("autodoc", "	* Selector/Modifier Returns the information about the shape with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: BOPDS_ShapeInfo
") ChangeShapeInfo;
		BOPDS_ShapeInfo & ChangeShapeInfo (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the contents

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") CommonBlock;
		%feature("autodoc", "	* Selector Returns the common block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: Handle_BOPDS_CommonBlock
") CommonBlock;
		Handle_BOPDS_CommonBlock CommonBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") FaceInfo;
		%feature("autodoc", "	* Selector Returns the state of face with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: BOPDS_FaceInfo
") FaceInfo;
		const BOPDS_FaceInfo & FaceInfo (const Standard_Integer theIndex);
		%feature("compactdefaultargs") FaceInfoIn;
		%feature("autodoc", "	* Selector Returns the state In [theMPB,theMVP] of face with index theIndex

	:param theIndex:
	:type theIndex: int
	:param theMPB:
	:type theMPB: BOPDS_IndexedMapOfPaveBlock &
	:param theMVP:
	:type theMVP: BOPCol_MapOfInteger &
	:rtype: None
") FaceInfoIn;
		void FaceInfoIn (const Standard_Integer theIndex,BOPDS_IndexedMapOfPaveBlock & theMPB,BOPCol_MapOfInteger & theMVP);
		%feature("compactdefaultargs") FaceInfoOn;
		%feature("autodoc", "	* Selector Returns the state On [theMPB,theMVP] of face with index theIndex

	:param theIndex:
	:type theIndex: int
	:param theMPB:
	:type theMPB: BOPDS_IndexedMapOfPaveBlock &
	:param theMVP:
	:type theMVP: BOPCol_MapOfInteger &
	:rtype: None
") FaceInfoOn;
		void FaceInfoOn (const Standard_Integer theIndex,BOPDS_IndexedMapOfPaveBlock & theMPB,BOPCol_MapOfInteger & theMVP);
		%feature("compactdefaultargs") FaceInfoPool;
		%feature("autodoc", "	* Selector Returns the information about state of faces

	:rtype: BOPDS_VectorOfFaceInfo
") FaceInfoPool;
		const BOPDS_VectorOfFaceInfo & FaceInfoPool ();
		%feature("compactdefaultargs") HasFaceInfo;
		%feature("autodoc", "	* Query Returns true if the shape with index theIndex has the information about state of face

	:param theIndex:
	:type theIndex: int
	:rtype: bool
") HasFaceInfo;
		Standard_Boolean HasFaceInfo (const Standard_Integer theIndex);
		%feature("compactdefaultargs") HasInterf;
		%feature("autodoc", "	* Query Returns true if the shape with index theI is interferred

	:param theI:
	:type theI: int
	:rtype: bool
") HasInterf;
		Standard_Boolean HasInterf (const Standard_Integer theI);
		%feature("compactdefaultargs") HasInterf;
		%feature("autodoc", "	* Query Returns true if the shapes with indices theI1, theI2 are interferred

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: bool
") HasInterf;
		Standard_Boolean HasInterf (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") HasInterfShapeSubShapes;
		%feature("autodoc", "	* Query Returns true if the shape with index theI1 is interfered with any sub-shape of the shape with index theI2 (theFlag=true) all sub-shapes of the shape with index theI2 (theFlag=false)

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:param theFlag: default value is Standard_True
	:type theFlag: bool
	:rtype: bool
") HasInterfShapeSubShapes;
		Standard_Boolean HasInterfShapeSubShapes (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Boolean theFlag = Standard_True);
		%feature("compactdefaultargs") HasInterfSubShapes;
		%feature("autodoc", "	* Query Returns true if the shapes with indices theI1, theI2 have interferred sub-shapes

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: bool
") HasInterfSubShapes;
		Standard_Boolean HasInterfSubShapes (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") HasPaveBlocks;
		%feature("autodoc", "	* Query Returns true if the shape with index theIndex has the information about pave blocks

	:param theIndex:
	:type theIndex: int
	:rtype: bool
") HasPaveBlocks;
		Standard_Boolean HasPaveBlocks (const Standard_Integer theIndex);
		%feature("compactdefaultargs") HasShapeSD;
		%feature("autodoc", "	* Query Returns true if the shape with index theIndex has the same domain shape. In this case theIndexSD will contain the index of same domain shape found //! interferences

	:param theIndex:
	:type theIndex: int
	:param theIndexSD:
	:type theIndexSD: int &
	:rtype: bool
") HasShapeSD;
		Standard_Boolean HasShapeSD (const Standard_Integer theIndex,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Selector Returns the index of the shape theS

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the data structure for the arguments

	:param theFuzz: default value is Precision::Confusion()
	:type theFuzz: float
	:rtype: None
") Init;
		void Init (const Standard_Real theFuzz = Precision::Confusion());
		%feature("compactdefaultargs") InitPaveBlocksForVertex;
		%feature("autodoc", "	:param theNV:
	:type theNV: int
	:rtype: None
") InitPaveBlocksForVertex;
		void InitPaveBlocksForVertex (const Standard_Integer theNV);
		%feature("compactdefaultargs") InterfEE;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Edge/Edge

	:rtype: BOPDS_VectorOfInterfEE
") InterfEE;
		BOPDS_VectorOfInterfEE & InterfEE ();
		%feature("compactdefaultargs") InterfEF;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Edge/Face

	:rtype: BOPDS_VectorOfInterfEF
") InterfEF;
		BOPDS_VectorOfInterfEF & InterfEF ();
		%feature("compactdefaultargs") InterfEZ;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Edge/Solid

	:rtype: BOPDS_VectorOfInterfEZ
") InterfEZ;
		BOPDS_VectorOfInterfEZ & InterfEZ ();
		%feature("compactdefaultargs") InterfFF;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Face/Face

	:rtype: BOPDS_VectorOfInterfFF
") InterfFF;
		BOPDS_VectorOfInterfFF & InterfFF ();
		%feature("compactdefaultargs") InterfFZ;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Face/Solid

	:rtype: BOPDS_VectorOfInterfFZ
") InterfFZ;
		BOPDS_VectorOfInterfFZ & InterfFZ ();
		%feature("compactdefaultargs") InterfVE;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Edge

	:rtype: BOPDS_VectorOfInterfVE
") InterfVE;
		BOPDS_VectorOfInterfVE & InterfVE ();
		%feature("compactdefaultargs") InterfVF;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Face

	:rtype: BOPDS_VectorOfInterfVF
") InterfVF;
		BOPDS_VectorOfInterfVF & InterfVF ();
		%feature("compactdefaultargs") InterfVV;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Vertex

	:rtype: BOPDS_VectorOfInterfVV
") InterfVV;
		BOPDS_VectorOfInterfVV & InterfVV ();
		%feature("compactdefaultargs") InterfVZ;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Vertex/Solid

	:rtype: BOPDS_VectorOfInterfVZ
") InterfVZ;
		BOPDS_VectorOfInterfVZ & InterfVZ ();
		%feature("compactdefaultargs") InterfZZ;
		%feature("autodoc", "	* Selector/Modifier Returns the collection of interferences Solid/Solid

	:rtype: BOPDS_VectorOfInterfZZ
") InterfZZ;
		BOPDS_VectorOfInterfZZ & InterfZZ ();
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "	* Selector Returns the table of interferences //! debug

	:rtype: BOPDS_MapOfPair
") Interferences;
		const BOPDS_MapOfPair & Interferences ();
		%feature("compactdefaultargs") IsCommonBlock;
		%feature("autodoc", "	* Query Returns true if the pave block is common block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: bool
") IsCommonBlock;
		Standard_Boolean IsCommonBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") IsCommonBlockOnEdge;
		%feature("autodoc", "	* Query Returns true if common block contains more then one pave block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: bool
") IsCommonBlockOnEdge;
		Standard_Boolean IsCommonBlockOnEdge (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") IsNewShape;
		%feature("autodoc", "	* Returns true if the shape of index 'i' is not the source shape/sub-shape

	:param theIndex:
	:type theIndex: int
	:rtype: bool
") IsNewShape;
		Standard_Boolean IsNewShape (const Standard_Integer theIndex);
		%feature("compactdefaultargs") IsSubShape;
		%feature("autodoc", "	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: bool
") IsSubShape;
		Standard_Boolean IsSubShape (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") IsValidShrunkData;
		%feature("autodoc", "	* Checks if the existing shrunk data of the pave block is still valid. The shrunk data may become invalid if e.g. the vertices of the pave block have been replaced with the new one with bigger tolerances, or the tolerances of the existing vertices have been increased.

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: bool
") IsValidShrunkData;
		Standard_Boolean IsValidShrunkData (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") NbInterfTypes;
		%feature("autodoc", "	* Returns the number of types of the interferences

	:rtype: int
") NbInterfTypes;
		static Standard_Integer NbInterfTypes ();
		%feature("compactdefaultargs") NbRanges;
		%feature("autodoc", "	* Selector Returns the number of index ranges

	:rtype: int
") NbRanges;
		Standard_Integer NbRanges ();
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	* Selector Returns the total number of shapes stored

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") NbSourceShapes;
		%feature("autodoc", "	* Selector Returns the total number of source shapes stored

	:rtype: int
") NbSourceShapes;
		Standard_Integer NbSourceShapes ();
		%feature("compactdefaultargs") PaveBlocks;
		%feature("autodoc", "	* Selector Returns the pave blocks for the shape with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: BOPDS_ListOfPaveBlock
") PaveBlocks;
		const BOPDS_ListOfPaveBlock & PaveBlocks (const Standard_Integer theIndex);
		%feature("compactdefaultargs") PaveBlocksPool;
		%feature("autodoc", "	* Selector Returns the information about pave blocks on source edges

	:rtype: BOPDS_VectorOfListOfPaveBlock
") PaveBlocksPool;
		const BOPDS_VectorOfListOfPaveBlock & PaveBlocksPool ();
		%feature("compactdefaultargs") Paves;
		%feature("autodoc", "	* Fills theLP with sorted paves of the shape with index theIndex

	:param theIndex:
	:type theIndex: int
	:param theLP:
	:type theLP: BOPDS_ListOfPave &
	:rtype: None
") Paves;
		void Paves (const Standard_Integer theIndex,BOPDS_ListOfPave & theLP);
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	* Selector Returns the index range 'i'

	:param theIndex:
	:type theIndex: int
	:rtype: BOPDS_IndexRange
") Range;
		const BOPDS_IndexRange & Range (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "	* Selector Returns the rank of the shape of index 'i'

	:param theIndex:
	:type theIndex: int
	:rtype: int
") Rank;
		Standard_Integer Rank (const Standard_Integer theIndex);
		%feature("compactdefaultargs") RealPaveBlock;
		%feature("autodoc", "	* Selector Returns the real first pave block

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: Handle_BOPDS_PaveBlock
") RealPaveBlock;
		Handle_BOPDS_PaveBlock RealPaveBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") RefineFaceInfoOn;
		%feature("autodoc", "	* Refine the state On for the all faces having state information //! ++

	:rtype: None
") RefineFaceInfoOn;
		void RefineFaceInfoOn ();
		%feature("compactdefaultargs") ReleasePaveBlocks;
		%feature("autodoc", "	* Clears information about PaveBlocks for the untouched edges

	:rtype: None
") ReleasePaveBlocks;
		void ReleasePaveBlocks ();
		%feature("compactdefaultargs") SetArguments;
		%feature("autodoc", "	* Modifier Sets the arguments [theLS] of an operation

	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") SetArguments;
		void SetArguments (const BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") SetCommonBlock;
		%feature("autodoc", "	* Modifier Sets the common block <theCB>

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:rtype: None
") SetCommonBlock;
		void SetCommonBlock (const Handle_BOPDS_PaveBlock & thePB,const Handle_BOPDS_CommonBlock & theCB);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Selector Returns the shape with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ShapeInfo;
		%feature("autodoc", "	* Selector Returns the information about the shape with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: BOPDS_ShapeInfo
") ShapeInfo;
		const BOPDS_ShapeInfo & ShapeInfo (const Standard_Integer theIndex);
		%feature("compactdefaultargs") ShapesSD;
		%feature("autodoc", "	* Selector Returns the collection same domain shapes

	:rtype: BOPCol_DataMapOfIntegerInteger
") ShapesSD;
		BOPCol_DataMapOfIntegerInteger & ShapesSD ();
		%feature("compactdefaultargs") SharedEdges;
		%feature("autodoc", "	* Returns the indices of edges that are shared for the faces with indices theF1, theF2 //! same domain shapes

	:param theF1:
	:type theF1: int
	:param theF2:
	:type theF2: int
	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") SharedEdges;
		void SharedEdges (const Standard_Integer theF1,const Standard_Integer theF2,BOPCol_ListOfInteger & theLI,const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") SubShapesOnIn;
		%feature("autodoc", "	* Returns information about ON/IN subshapes of the given faces. @param theMVOnIn the indices of ON/IN vertices from both faces @param thePBOnIn all On/In pave blocks from both faces @param theCommonPB the common pave blocks (that are shared by both faces).

	:param theF1:
	:type theF1: int
	:param theF2:
	:type theF2: int
	:param theMVOnIn:
	:type theMVOnIn: BOPCol_MapOfInteger &
	:param thePBOnIn:
	:type thePBOnIn: BOPDS_IndexedMapOfPaveBlock &
	:param theCommonPB:
	:type theCommonPB: BOPDS_MapOfPaveBlock &
	:rtype: None
") SubShapesOnIn;
		void SubShapesOnIn (const Standard_Integer theF1,const Standard_Integer theF2,BOPCol_MapOfInteger & theMVOnIn,BOPDS_IndexedMapOfPaveBlock & thePBOnIn,BOPDS_MapOfPaveBlock & theCommonPB);
		%feature("compactdefaultargs") UpdateCommonBlock;
		%feature("autodoc", "	* Update the common block theCB

	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:param theFuzz:
	:type theFuzz: float
	:rtype: None
") UpdateCommonBlock;
		void UpdateCommonBlock (const Handle_BOPDS_CommonBlock & theCB,const Standard_Real theFuzz);
		%feature("compactdefaultargs") UpdateCommonBlockWithSDVertices;
		%feature("autodoc", "	* Update the pave block of the common block for all shapes in data structure

	:param theCB:
	:type theCB: Handle_BOPDS_CommonBlock &
	:rtype: None
") UpdateCommonBlockWithSDVertices;
		void UpdateCommonBlockWithSDVertices (const Handle_BOPDS_CommonBlock & theCB);
		%feature("compactdefaultargs") UpdateEdgeTolerance;
		%feature("autodoc", "	* Updates tolerance of the sub-shapes of the shape with index <theIndex>.

	:param theIndex:
	:type theIndex: int
	:param theTolerance:
	:type theTolerance: float
	:param theFuzz: default value is Precision::Confusion()
	:type theFuzz: float
	:rtype: None
") UpdateEdgeTolerance;
		void UpdateEdgeTolerance (const Standard_Integer theIndex,const Standard_Real theTolerance,const Standard_Real theFuzz = Precision::Confusion());
		%feature("compactdefaultargs") UpdateFaceInfoIn;
		%feature("autodoc", "	* Update the state In of face with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: None
") UpdateFaceInfoIn;
		void UpdateFaceInfoIn (const Standard_Integer theIndex);
		%feature("compactdefaultargs") UpdateFaceInfoOn;
		%feature("autodoc", "	* Update the state On of face with index theIndex

	:param theIndex:
	:type theIndex: int
	:rtype: None
") UpdateFaceInfoOn;
		void UpdateFaceInfoOn (const Standard_Integer theIndex);
		%feature("compactdefaultargs") UpdatePaveBlock;
		%feature("autodoc", "	* Update the pave block thePB

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: None
") UpdatePaveBlock;
		void UpdatePaveBlock (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") UpdatePaveBlockWithSDVertices;
		%feature("autodoc", "	* Update the pave block for all shapes in data structure

	:param thePB:
	:type thePB: Handle_BOPDS_PaveBlock &
	:rtype: None
") UpdatePaveBlockWithSDVertices;
		void UpdatePaveBlockWithSDVertices (const Handle_BOPDS_PaveBlock & thePB);
		%feature("compactdefaultargs") UpdatePaveBlocks;
		%feature("autodoc", "	* Update the pave blocks for the all shapes in data structure

	:rtype: None
") UpdatePaveBlocks;
		void UpdatePaveBlocks ();
		%feature("compactdefaultargs") UpdatePaveBlocksWithSDVertices;
		%feature("autodoc", "	* Update the pave blocks for all shapes in data structure

	:rtype: None
") UpdatePaveBlocksWithSDVertices;
		void UpdatePaveBlocksWithSDVertices ();
};


%extend BOPDS_DS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_FaceInfo;
class BOPDS_FaceInfo {
	public:
		%feature("compactdefaultargs") BOPDS_FaceInfo;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo ();
		%feature("compactdefaultargs") BOPDS_FaceInfo;
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_FaceInfo;
		 BOPDS_FaceInfo (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") ChangePaveBlocksIn;
		%feature("autodoc", "	* Selector/Modifier Returns the pave blocks of the face that have state In

	:rtype: BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksIn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksIn ();
		%feature("compactdefaultargs") ChangePaveBlocksOn;
		%feature("autodoc", "	* Selector/Modifier Returns the pave blocks of the face that have state On

	:rtype: BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksOn;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksOn ();
		%feature("compactdefaultargs") ChangePaveBlocksSc;
		%feature("autodoc", "	:rtype: BOPDS_IndexedMapOfPaveBlock
") ChangePaveBlocksSc;
		BOPDS_IndexedMapOfPaveBlock & ChangePaveBlocksSc ();
		%feature("compactdefaultargs") ChangeVerticesIn;
		%feature("autodoc", "	* Selector/Modifier Returns the list of indices for vertices of the face that have state In //! On

	:rtype: BOPCol_MapOfInteger
") ChangeVerticesIn;
		BOPCol_MapOfInteger & ChangeVerticesIn ();
		%feature("compactdefaultargs") ChangeVerticesOn;
		%feature("autodoc", "	* Selector/Modifier Returns the list of indices for vertices of the face that have state On //! Sections

	:rtype: BOPCol_MapOfInteger
") ChangeVerticesOn;
		BOPCol_MapOfInteger & ChangeVerticesOn ();
		%feature("compactdefaultargs") ChangeVerticesSc;
		%feature("autodoc", "	* Selector/Modifier Returns the list of indices for section vertices of the face //! Others

	:rtype: BOPCol_MapOfInteger
") ChangeVerticesSc;
		BOPCol_MapOfInteger & ChangeVerticesSc ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the contents

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Selector Returns the index of the face //! In

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") PaveBlocksIn;
		%feature("autodoc", "	* Selector Returns the pave blocks of the face that have state In

	:rtype: BOPDS_IndexedMapOfPaveBlock
") PaveBlocksIn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksIn ();
		%feature("compactdefaultargs") PaveBlocksOn;
		%feature("autodoc", "	* Selector Returns the pave blocks of the face that have state On

	:rtype: BOPDS_IndexedMapOfPaveBlock
") PaveBlocksOn;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksOn ();
		%feature("compactdefaultargs") PaveBlocksSc;
		%feature("autodoc", "	* Selector Returns the pave blocks of the face that are pave blocks of section edges

	:rtype: BOPDS_IndexedMapOfPaveBlock
") PaveBlocksSc;
		const BOPDS_IndexedMapOfPaveBlock & PaveBlocksSc ();
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Modifier Sets the index of the face <theI>

	:param theI:
	:type theI: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theI);
		%feature("compactdefaultargs") VerticesIn;
		%feature("autodoc", "	* Selector Returns the list of indices for vertices of the face that have state In

	:rtype: BOPCol_MapOfInteger
") VerticesIn;
		const BOPCol_MapOfInteger & VerticesIn ();
		%feature("compactdefaultargs") VerticesOn;
		%feature("autodoc", "	* Selector Returns the list of indices for vertices of the face that have state On

	:rtype: BOPCol_MapOfInteger
") VerticesOn;
		const BOPCol_MapOfInteger & VerticesOn ();
		%feature("compactdefaultargs") VerticesSc;
		%feature("autodoc", "	* Selector Returns the list of indices for section vertices of the face

	:rtype: BOPCol_MapOfInteger
") VerticesSc;
		const BOPCol_MapOfInteger & VerticesSc ();
};


%extend BOPDS_FaceInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_IndexRange;
class BOPDS_IndexRange {
	public:
		%feature("compactdefaultargs") BOPDS_IndexRange;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_IndexRange;
		 BOPDS_IndexRange ();
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Query Returns true if the range contains <theIndex>

	:param theIndex:
	:type theIndex: int
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	* Selector Returns the first index of the range

	:rtype: int
") First;
		Standard_Integer First ();
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	* Selector Returns the first index of the range <theI1> Returns the second index of the range <theI2>

	:param theI1:
	:type theI1: int &
	:param theI2:
	:type theI2: int &
	:rtype: None
") Indices;
		void Indices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	* Selector Returns the second index of the range

	:rtype: int
") Last;
		Standard_Integer Last ();
		%feature("compactdefaultargs") SetFirst;
		%feature("autodoc", "	* Modifier Sets the first index <theI1> of the range

	:param theI1:
	:type theI1: int
	:rtype: None
") SetFirst;
		void SetFirst (const Standard_Integer theI1);
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "	* Modifier Sets the first index of the range <theI1> Sets the second index of the range <theI2>

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: None
") SetIndices;
		void SetIndices (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") SetLast;
		%feature("autodoc", "	* Modifier Sets the second index <theI2> of the range

	:param theI2:
	:type theI2: int
	:rtype: None
") SetLast;
		void SetLast (const Standard_Integer theI2);
};


%extend BOPDS_IndexRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_Iterator;
class BOPDS_Iterator {
	public:
		%feature("compactdefaultargs") BOPDS_Iterator;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Iterator;
		 BOPDS_Iterator ();
		%feature("compactdefaultargs") BOPDS_Iterator;
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_Iterator;
		 BOPDS_Iterator (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") BlockLength;
		%feature("autodoc", "	* Returns the block length

	:rtype: int
") BlockLength;
		Standard_Integer BlockLength ();
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "	* Selector Returns the data structure

	:rtype: BOPDS_DS
") DS;
		const BOPDS_DS & DS ();
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "	* Returns the number of intersections founded

	:rtype: int
") ExpectedLength;
		Standard_Integer ExpectedLength ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the iterator theType1 - the first type of shape theType2 - the second type of shape

	:param theType1:
	:type theType1: TopAbs_ShapeEnum
	:param theType2:
	:type theType2: TopAbs_ShapeEnum
	:rtype: None
") Initialize;
		void Initialize (const TopAbs_ShapeEnum theType1,const TopAbs_ShapeEnum theType2);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns true if still there are pairs of intersected shapes

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Moves iterations ahead

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "	* Perform the intersection algorithm and prepare the results to be used

	:rtype: void
") Prepare;
		virtual void Prepare ();
		%feature("compactdefaultargs") RunParallel;
		%feature("autodoc", "	* Returns the flag of parallel processing

	:rtype: bool
") RunParallel;
		Standard_Boolean RunParallel ();
		%feature("compactdefaultargs") SetDS;
		%feature("autodoc", "	* Modifier Sets the data structure <pDS> to process

	:param pDS:
	:type pDS: BOPDS_PDS &
	:rtype: None
") SetDS;
		void SetDS (const BOPDS_PDS & pDS);
		%feature("compactdefaultargs") SetRunParallel;
		%feature("autodoc", "	* Set the flag of parallel processing if <theFlag> is true the parallel processing is switched on if <theFlag> is false the parallel processing is switched off

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetRunParallel;
		void SetRunParallel (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns indices (DS) of intersected shapes theIndex1 - the index of the first shape theIndex2 - the index of the second shape

	:param theIndex1:
	:type theIndex1: int &
	:param theIndex2:
	:type theIndex2: int &
	:rtype: None
") Value;
		void Value (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend BOPDS_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_Pair;
class BOPDS_Pair {
	public:
		%feature("compactdefaultargs") BOPDS_Pair;
		%feature("autodoc", "	:rtype: None
") BOPDS_Pair;
		 BOPDS_Pair ();
		%feature("compactdefaultargs") BOPDS_Pair;
		%feature("autodoc", "	:param theIndex1:
	:type theIndex1: int
	:param theIndex2:
	:type theIndex2: int
	:rtype: None
") BOPDS_Pair;
		 BOPDS_Pair (const Standard_Integer theIndex1,const Standard_Integer theIndex2);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns hash code

	:param theUpper:
	:type theUpper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer theUpper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	* Gets the indices

	:param theIndex1:
	:type theIndex1: int &
	:param theIndex2:
	:type theIndex2: int &
	:rtype: None
") Indices;
		void Indices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns true if the Pair is equal to <the theOther>

	:param theOther:
	:type theOther: BOPDS_Pair &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BOPDS_Pair & theOther);
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "	* Sets the indices

	:param theIndex1:
	:type theIndex1: int
	:param theIndex2:
	:type theIndex2: int
	:rtype: None
") SetIndices;
		void SetIndices (const Standard_Integer theIndex1,const Standard_Integer theIndex2);
		%feature("compactdefaultargs") operator <;
		%feature("autodoc", "	* Operator less

	:param theOther:
	:type theOther: BOPDS_Pair &
	:rtype: bool
") operator <;
		Standard_Boolean operator < (const BOPDS_Pair & theOther);
};


%extend BOPDS_Pair {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPDS_PairMapHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param thePair:
	:type thePair: BOPDS_Pair &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BOPDS_Pair & thePair,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param thePair1:
	:type thePair1: BOPDS_Pair &
	:param thePair2:
	:type thePair2: BOPDS_Pair &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BOPDS_Pair & thePair1,const BOPDS_Pair & thePair2);
};


%extend BOPDS_PairMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_PassKey;
class BOPDS_PassKey {
	public:
		%feature("compactdefaultargs") BOPDS_PassKey;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_PassKey;
		 BOPDS_PassKey ();
		%feature("compactdefaultargs") BOPDS_PassKey;
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_PassKey;
		 BOPDS_PassKey (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") BOPDS_PassKey;
		%feature("autodoc", "	* Copy Contructor

	:param Other:
	:type Other: BOPDS_PassKey &
	:rtype: None
") BOPDS_PassKey;
		 BOPDS_PassKey (const BOPDS_PassKey & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear the contents

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param aHex: default value is 0
	:type aHex: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer aHex = 0);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Query Returns hash code

	:param theUpper:
	:type theUpper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer theUpper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") Id;
		%feature("autodoc", "	* Selector Returns Id of index <theIndex>

	:param theIndex:
	:type theIndex: int
	:rtype: int
") Id;
		Standard_Integer Id (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Ids;
		%feature("autodoc", "	* Selector Returns the first two Ids <theI1>,<theI2>

	:param theI1:
	:type theI1: int &
	:param theI2:
	:type theI2: int &
	:rtype: None
") Ids;
		void Ids (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Query Returns true if the PassKey is equal to <the theOther>

	:param theOther:
	:type theOther: BOPDS_PassKey &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BOPDS_PassKey & theOther);
		%feature("compactdefaultargs") NbIds;
		%feature("autodoc", "	* Selector Returns the number of Ids>

	:rtype: int
") NbIds;
		Standard_Integer NbIds ();
		%feature("compactdefaultargs") SetIds;
		%feature("autodoc", "	* Modifier Sets one Id <theI1>

	:param theI1:
	:type theI1: int
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1);
		%feature("compactdefaultargs") SetIds;
		%feature("autodoc", "	* Modifier Sets two Id <theI1>,<theI2>

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2);
		%feature("compactdefaultargs") SetIds;
		%feature("autodoc", "	* Modifier Sets three Id <theI1>,<theI2>,<theI3>

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:param theI3:
	:type theI3: int
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Integer theI3);
		%feature("compactdefaultargs") SetIds;
		%feature("autodoc", "	* Modifier Sets four Id <theI1>,<theI2>,<theI3>,<theI4>

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:param theI3:
	:type theI3: int
	:param theI4:
	:type theI4: int
	:rtype: None
") SetIds;
		void SetIds (const Standard_Integer theI1,const Standard_Integer theI2,const Standard_Integer theI3,const Standard_Integer theI4);
		%feature("compactdefaultargs") SetIds;
		%feature("autodoc", "	* Modifier Sets the list of Id <theLI>

	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") SetIds;
		void SetIds (const BOPCol_ListOfInteger & theLI);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BOPDS_PassKey &
	:rtype: BOPDS_PassKey
") operator =;
		BOPDS_PassKey & operator = (const BOPDS_PassKey & Other);
};


%extend BOPDS_PassKey {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPDS_PassKeyMapHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param aPKey:
	:type aPKey: BOPDS_PassKey &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BOPDS_PassKey & aPKey,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param aPKey1:
	:type aPKey1: BOPDS_PassKey &
	:param aPKey2:
	:type aPKey2: BOPDS_PassKey &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BOPDS_PassKey & aPKey1,const BOPDS_PassKey & aPKey2);
};


%extend BOPDS_PassKeyMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_Pave;
class BOPDS_Pave {
	public:
		%feature("compactdefaultargs") BOPDS_Pave;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Pave;
		 BOPDS_Pave ();
		%feature("compactdefaultargs") Contents;
		%feature("autodoc", "	* Selector Returns the index of vertex <theIndex> Returns the parameter of vertex <theParameter>

	:param theIndex:
	:type theIndex: int &
	:param theParameter:
	:type theParameter: float &
	:rtype: None
") Contents;
		void Contents (Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Selector Returns the index of vertex

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Query Returns true if thr parameter od this is equal to the parameter of <theOther>

	:param theOther:
	:type theOther: BOPDS_Pave &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BOPDS_Pave & theOther);
		%feature("compactdefaultargs") IsLess;
		%feature("autodoc", "	* Query Returns true if thr parameter od this is less than the parameter of <theOther>

	:param theOther:
	:type theOther: BOPDS_Pave &
	:rtype: bool
") IsLess;
		Standard_Boolean IsLess (const BOPDS_Pave & theOther);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Selector Returns the parameter of vertex

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Modifier Sets the index of vertex <theIndex>

	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	* Modifier Sets the parameter of vertex <theParameter>

	:param theParameter:
	:type theParameter: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real theParameter);
		%feature("compactdefaultargs") operator <;
		%feature("autodoc", "	:param theOther:
	:type theOther: BOPDS_Pave &
	:rtype: bool
") operator <;
		Standard_Boolean operator < (const BOPDS_Pave & theOther);

        %extend{
            bool __eq_wrapper__(const BOPDS_Pave  other) {
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
%nodefaultctor BOPDS_PaveBlock;
class BOPDS_PaveBlock : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AppendExtPave;
		%feature("autodoc", "	* Modifier Appends extra paves <thePave>

	:param thePave:
	:type thePave: BOPDS_Pave &
	:rtype: None
") AppendExtPave;
		void AppendExtPave (const BOPDS_Pave & thePave);
		%feature("compactdefaultargs") AppendExtPave1;
		%feature("autodoc", "	* Modifier Appends extra pave <thePave>

	:param thePave:
	:type thePave: BOPDS_Pave &
	:rtype: None
") AppendExtPave1;
		void AppendExtPave1 (const BOPDS_Pave & thePave);
		%feature("compactdefaultargs") BOPDS_PaveBlock;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock ();
		%feature("compactdefaultargs") BOPDS_PaveBlock;
		%feature("autodoc", "	* Contructor <theAllocator> - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_PaveBlock;
		 BOPDS_PaveBlock (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") ChangeExtPaves;
		%feature("autodoc", "	* Selector / Modifier Returns the extra paves

	:rtype: BOPDS_ListOfPave
") ChangeExtPaves;
		BOPDS_ListOfPave & ChangeExtPaves ();
		%feature("compactdefaultargs") ContainsParameter;
		%feature("autodoc", "	* Query Returns true if the extra paves contain the pave with given value of the parameter <thePrm> <theTol> - the value of the tolerance to compare <theInd> - index of the found pave

	:param thePrm:
	:type thePrm: float
	:param theTol:
	:type theTol: float
	:param theInd:
	:type theInd: int &
	:rtype: bool
") ContainsParameter;
		Standard_Boolean ContainsParameter (const Standard_Real thePrm,const Standard_Real theTol,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Selector Returns the index of edge of pave block

	:rtype: int
") Edge;
		Standard_Integer Edge ();
		%feature("compactdefaultargs") ExtPaves;
		%feature("autodoc", "	* Selector Returns the extra paves

	:rtype: BOPDS_ListOfPave
") ExtPaves;
		const BOPDS_ListOfPave & ExtPaves ();
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "	* Query Returns true if the pave block has edge

	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge ();
		%feature("compactdefaultargs") HasEdge;
		%feature("autodoc", "	* Query Returns true if the pave block has edge Returns the index of edge <theEdge>

	:param theEdge:
	:type theEdge: int &
	:rtype: bool
") HasEdge;
		Standard_Boolean HasEdge (Standard_Integer &OutValue);
		%feature("compactdefaultargs") HasSameBounds;
		%feature("autodoc", "	* Query Returns true if the pave block has pave indices that equal to the pave indices of the pave block <theOther>

	:param theOther:
	:type theOther: Handle_BOPDS_PaveBlock &
	:rtype: bool
") HasSameBounds;
		Standard_Boolean HasSameBounds (const Handle_BOPDS_PaveBlock & theOther);
		%feature("compactdefaultargs") HasShrunkData;
		%feature("autodoc", "	* Query Returns true if the pave block contains the shrunk data

	:rtype: bool
") HasShrunkData;
		Standard_Boolean HasShrunkData ();
		%feature("compactdefaultargs") Indices;
		%feature("autodoc", "	* Selector Returns the pave indices <theIndex1,theIndex2> of the pave block

	:param theIndex1:
	:type theIndex1: int &
	:param theIndex2:
	:type theIndex2: int &
	:rtype: None
") Indices;
		void Indices (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsSplitEdge;
		%feature("autodoc", "	* Query Returns true if the edge is equal to the original edge of the pave block

	:rtype: bool
") IsSplitEdge;
		Standard_Boolean IsSplitEdge ();
		%feature("compactdefaultargs") IsSplittable;
		%feature("autodoc", "	* Query Returns False if the pave block has a too short shrunk range and cannot be split, otherwise returns True

	:rtype: bool
") IsSplittable;
		Standard_Boolean IsSplittable ();
		%feature("compactdefaultargs") IsToUpdate;
		%feature("autodoc", "	* Query Returns true if the pave block contains extra paves

	:rtype: bool
") IsToUpdate;
		Standard_Boolean IsToUpdate ();
		%feature("compactdefaultargs") OriginalEdge;
		%feature("autodoc", "	* Selector Returns the index of original edge of pave block

	:rtype: int
") OriginalEdge;
		Standard_Integer OriginalEdge ();
		%feature("compactdefaultargs") Pave1;
		%feature("autodoc", "	* Selector Returns the first pave

	:rtype: BOPDS_Pave
") Pave1;
		const BOPDS_Pave & Pave1 ();
		%feature("compactdefaultargs") Pave2;
		%feature("autodoc", "	* Selector Returns the second pave

	:rtype: BOPDS_Pave
") Pave2;
		const BOPDS_Pave & Pave2 ();
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "	* Selector Returns the parametric range <theT1,theT2> of the pave block

	:param theT1:
	:type theT1: float &
	:param theT2:
	:type theT2: float &
	:rtype: None
") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") RemoveExtPave;
		%feature("autodoc", "	* Modifier Removes a pave with the given vertex number from extra paves

	:param theVertNum:
	:type theVertNum: int
	:rtype: None
") RemoveExtPave;
		void RemoveExtPave (const Standard_Integer theVertNum);
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "	* Modifier Sets the index of edge of pave block <theEdge>

	:param theEdge:
	:type theEdge: int
	:rtype: None
") SetEdge;
		void SetEdge (const Standard_Integer theEdge);
		%feature("compactdefaultargs") SetOriginalEdge;
		%feature("autodoc", "	* Modifier Sets the index of original edge of the pave block <theEdge>

	:param theEdge:
	:type theEdge: int
	:rtype: None
") SetOriginalEdge;
		void SetOriginalEdge (const Standard_Integer theEdge);
		%feature("compactdefaultargs") SetPave1;
		%feature("autodoc", "	* Modifier Sets the first pave <thePave>

	:param thePave:
	:type thePave: BOPDS_Pave &
	:rtype: None
") SetPave1;
		void SetPave1 (const BOPDS_Pave & thePave);
		%feature("compactdefaultargs") SetPave2;
		%feature("autodoc", "	* Modifier Sets the second pave <thePave>

	:param thePave:
	:type thePave: BOPDS_Pave &
	:rtype: None
") SetPave2;
		void SetPave2 (const BOPDS_Pave & thePave);
		%feature("compactdefaultargs") SetShrunkData;
		%feature("autodoc", "	* Modifier Sets the shrunk data for the pave block <theTS1>, <theTS2> - shrunk range <theBox> - the bounding box <theIsSplittable> - defines whether the edge can be split

	:param theTS1:
	:type theTS1: float
	:param theTS2:
	:type theTS2: float
	:param theBox:
	:type theBox: Bnd_Box &
	:param theIsSplittable:
	:type theIsSplittable: bool
	:rtype: None
") SetShrunkData;
		void SetShrunkData (const Standard_Real theTS1,const Standard_Real theTS2,const Bnd_Box & theBox,const Standard_Boolean theIsSplittable);
		%feature("compactdefaultargs") ShrunkData;
		%feature("autodoc", "	* Selector Returns the shrunk data for the pave block <theTS1>, <theTS2> - shrunk range <theBox> - the bounding box <theIsSplittable> - defines whether the edge can be split

	:param theTS1:
	:type theTS1: float &
	:param theTS2:
	:type theTS2: float &
	:param theBox:
	:type theBox: Bnd_Box &
	:param theIsSplittable:
	:type theIsSplittable: bool
	:rtype: None
") ShrunkData;
		void ShrunkData (Standard_Real &OutValue,Standard_Real &OutValue,Bnd_Box & theBox,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Modifier Updates the pave block. The extra paves are used to create new pave blocks <theLPB>. <theFlag> - if true, the first pave and the second pave are used to produce new pave blocks.

	:param theLPB:
	:type theLPB: BOPDS_ListOfPaveBlock &
	:param theFlag: default value is Standard_True
	:type theFlag: bool
	:rtype: None
") Update;
		void Update (BOPDS_ListOfPaveBlock & theLPB,const Standard_Boolean theFlag = Standard_True);
};


%make_alias(BOPDS_PaveBlock)

%extend BOPDS_PaveBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPDS_PaveMapHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param aPave:
	:type aPave: BOPDS_Pave &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BOPDS_Pave & aPave,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param aPave1:
	:type aPave1: BOPDS_Pave &
	:param aPave2:
	:type aPave2: BOPDS_Pave &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BOPDS_Pave & aPave1,const BOPDS_Pave & aPave2);
};


%extend BOPDS_PaveMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_Point;
class BOPDS_Point {
	public:
		%feature("compactdefaultargs") BOPDS_Point;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_Point;
		 BOPDS_Point ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	* Selector Returns index of the vertex

	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Selector Returns 3D point

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("compactdefaultargs") Pnt2D1;
		%feature("autodoc", "	* Selector Returns 2D point on the first face <thePnt>

	:rtype: gp_Pnt2d
") Pnt2D1;
		const gp_Pnt2d  Pnt2D1 ();
		%feature("compactdefaultargs") Pnt2D2;
		%feature("autodoc", "	* Selector Returns 2D point on the second face <thePnt>

	:rtype: gp_Pnt2d
") Pnt2D2;
		const gp_Pnt2d  Pnt2D2 ();
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* Modifier Sets the index of the vertex <theIndex>

	:param theIndex:
	:type theIndex: int
	:rtype: None
") SetIndex;
		void SetIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "	* Modifier Sets 3D point <thePnt>

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") SetPnt2D1;
		%feature("autodoc", "	* Modifier Sets 2D point on the first face <thePnt>

	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None
") SetPnt2D1;
		void SetPnt2D1 (const gp_Pnt2d & thePnt);
		%feature("compactdefaultargs") SetPnt2D2;
		%feature("autodoc", "	* Modifier Sets 2D point on the second face <thePnt>

	:param thePnt:
	:type thePnt: gp_Pnt2d
	:rtype: None
") SetPnt2D2;
		void SetPnt2D2 (const gp_Pnt2d & thePnt);
};


%extend BOPDS_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_ShapeInfo;
class BOPDS_ShapeInfo {
	public:
		%feature("compactdefaultargs") BOPDS_ShapeInfo;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo ();
		%feature("compactdefaultargs") BOPDS_ShapeInfo;
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_ShapeInfo;
		 BOPDS_ShapeInfo (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Selector Returns the boundung box of the shape

	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
		%feature("compactdefaultargs") ChangeBox;
		%feature("autodoc", "	* Selector/Modifier Returns the boundung box of the shape

	:rtype: Bnd_Box
") ChangeBox;
		Bnd_Box & ChangeBox ();
		%feature("compactdefaultargs") ChangeSubShapes;
		%feature("autodoc", "	* Selector/ Modifier Returns the list of indices of sub-shapes

	:rtype: BOPCol_ListOfInteger
") ChangeSubShapes;
		BOPCol_ListOfInteger & ChangeSubShapes ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "	* Returns the flag

	:rtype: int
") Flag;
		Standard_Integer Flag ();
		%feature("compactdefaultargs") HasBRep;
		%feature("autodoc", "	* Query Returns true if the shape has boundary representation

	:rtype: bool
") HasBRep;
		Standard_Boolean HasBRep ();
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "	* Query Returns true if there is flag.

	:rtype: bool
") HasFlag;
		Standard_Boolean HasFlag ();
		%feature("compactdefaultargs") HasFlag;
		%feature("autodoc", "	* Query Returns true if there is flag. Returns the the flag theFlag

	:param theFlag:
	:type theFlag: int &
	:rtype: bool
") HasFlag;
		Standard_Boolean HasFlag (Standard_Integer &OutValue);
		%feature("compactdefaultargs") HasReference;
		%feature("autodoc", "	:rtype: bool
") HasReference;
		Standard_Boolean HasReference ();
		%feature("compactdefaultargs") HasSubShape;
		%feature("autodoc", "	* Query Returns true if the shape has sub-shape with index theI

	:param theI:
	:type theI: int
	:rtype: bool
") HasSubShape;
		Standard_Boolean HasSubShape (const Standard_Integer theI);
		%feature("compactdefaultargs") IsInterfering;
		%feature("autodoc", "	* Returns true if the shape can be participant of an interference //! Flag

	:rtype: bool
") IsInterfering;
		Standard_Boolean IsInterfering ();
		%feature("compactdefaultargs") Reference;
		%feature("autodoc", "	* Selector Returns the index of a reference information

	:rtype: int
") Reference;
		Standard_Integer Reference ();
		%feature("compactdefaultargs") SetBox;
		%feature("autodoc", "	* Modifier Sets the boundung box of the shape theBox

	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") SetBox;
		void SetBox (const Bnd_Box & theBox);
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	* Modifier Sets the flag

	:param theI:
	:type theI: int
	:rtype: None
") SetFlag;
		void SetFlag (const Standard_Integer theI);
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "	* Modifier Sets the index of a reference information

	:param theI:
	:type theI: int
	:rtype: None
") SetReference;
		void SetReference (const Standard_Integer theI);
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	* Modifier Sets the shape <theS>

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") SetShapeType;
		%feature("autodoc", "	* Modifier Sets the type of shape theType

	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None
") SetShapeType;
		void SetShapeType (const TopAbs_ShapeEnum theType);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Selector Returns the shape

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Selector Returns the type of shape

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "	* Selector Returns the list of indices of sub-shapes

	:rtype: BOPCol_ListOfInteger
") SubShapes;
		const BOPCol_ListOfInteger & SubShapes ();
};


%extend BOPDS_ShapeInfo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_SubIterator;
class BOPDS_SubIterator {
	public:
		%feature("compactdefaultargs") BOPDS_SubIterator;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") BOPDS_SubIterator;
		 BOPDS_SubIterator ();
		%feature("compactdefaultargs") BOPDS_SubIterator;
		%feature("autodoc", "	* Constructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_SubIterator;
		 BOPDS_SubIterator (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") DS;
		%feature("autodoc", "	* Returns the data structure

	:rtype: BOPDS_DS
") DS;
		const BOPDS_DS & DS ();
		%feature("compactdefaultargs") ExpectedLength;
		%feature("autodoc", "	* Returns the number of interfering pairs

	:rtype: int
") ExpectedLength;
		Standard_Integer ExpectedLength ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes the iterator

	:rtype: None
") Initialize;
		void Initialize ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns true if there are more pairs of intersected shapes

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Moves iterations ahead

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "	* Perform the intersection algorithm and prepare the results to be used

	:rtype: void
") Prepare;
		virtual void Prepare ();
		%feature("compactdefaultargs") SetDS;
		%feature("autodoc", "	* Sets the data structure <pDS> to process. It is used to access the shapes and their bounding boxes.

	:param pDS:
	:type pDS: BOPDS_PDS &
	:rtype: None
") SetDS;
		void SetDS (const BOPDS_PDS & pDS);
		%feature("compactdefaultargs") SetSubSet1;
		%feature("autodoc", "	* Sets the first set of indices <theLI> to process

	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") SetSubSet1;
		void SetSubSet1 (const BOPCol_ListOfInteger & theLI);
		%feature("compactdefaultargs") SetSubSet2;
		%feature("autodoc", "	* Sets the second set of indices <theLI> to process

	:param theLI:
	:type theLI: BOPCol_ListOfInteger &
	:rtype: None
") SetSubSet2;
		void SetSubSet2 (const BOPCol_ListOfInteger & theLI);
		%feature("compactdefaultargs") SubSet1;
		%feature("autodoc", "	* Returns the first set of indices to process

	:rtype: BOPCol_ListOfInteger
") SubSet1;
		const BOPCol_ListOfInteger & SubSet1 ();
		%feature("compactdefaultargs") SubSet2;
		%feature("autodoc", "	* Returns the second set of indices to process

	:rtype: BOPCol_ListOfInteger
") SubSet2;
		const BOPCol_ListOfInteger & SubSet2 ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns indices (DS) of intersected shapes theIndex1 - the index of the first shape theIndex2 - the index of the second shape

	:param theIndex1:
	:type theIndex1: int &
	:param theIndex2:
	:type theIndex2: int &
	:rtype: None
") Value;
		void Value (Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend BOPDS_SubIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPDS_Tools {
	public:
		%feature("compactdefaultargs") HasBRep;
		%feature("autodoc", "	* Returns true if the type <theT> correspond to a shape having boundary representation

	:param theT:
	:type theT: TopAbs_ShapeEnum
	:rtype: bool
") HasBRep;
		static Standard_Boolean HasBRep (const TopAbs_ShapeEnum theT);
		%feature("compactdefaultargs") IsInterfering;
		%feature("autodoc", "	* Returns true if the type <theT> can be participant of an interference

	:param theT:
	:type theT: TopAbs_ShapeEnum
	:rtype: bool
") IsInterfering;
		static Standard_Boolean IsInterfering (const TopAbs_ShapeEnum theT);
		%feature("compactdefaultargs") TypeToInteger;
		%feature("autodoc", "	* Converts the conmbination of two types of shape <theT1>,<theT2> to the one integer value, that is returned

	:param theT1:
	:type theT1: TopAbs_ShapeEnum
	:param theT2:
	:type theT2: TopAbs_ShapeEnum
	:rtype: int
") TypeToInteger;
		static Standard_Integer TypeToInteger (const TopAbs_ShapeEnum theT1,const TopAbs_ShapeEnum theT2);
		%feature("compactdefaultargs") TypeToInteger;
		%feature("autodoc", "	* Converts the type of shape <theT>, to integer value, that is returned

	:param theT:
	:type theT: TopAbs_ShapeEnum
	:rtype: int
") TypeToInteger;
		static Standard_Integer TypeToInteger (const TopAbs_ShapeEnum theT);
};


%extend BOPDS_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfEE;
class BOPDS_InterfEE : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfEE;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfEE;
		 BOPDS_InterfEE ();
		%feature("compactdefaultargs") BOPDS_InterfEE;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfEE;
		 BOPDS_InterfEE (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") CommonPart;
		%feature("autodoc", "	* /** * Selector * Returns the info of common part * returns * common part */

	:rtype: IntTools_CommonPrt
") CommonPart;
		const IntTools_CommonPrt & CommonPart ();
		%feature("compactdefaultargs") SetCommonPart;
		%feature("autodoc", "	* /** * Modifier * Sets the info of common part * @param theCP * common part */

	:param theCP:
	:type theCP: IntTools_CommonPrt &
	:rtype: None
") SetCommonPart;
		void SetCommonPart (const IntTools_CommonPrt & theCP);
};


%extend BOPDS_InterfEE {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfEF;
class BOPDS_InterfEF : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfEF;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfEF;
		 BOPDS_InterfEF ();
		%feature("compactdefaultargs") BOPDS_InterfEF;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory *//** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfEF;
		 BOPDS_InterfEF (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") CommonPart;
		%feature("autodoc", "	* /** * Selector * Returns the info of common part * returns * common part */

	:rtype: IntTools_CommonPrt
") CommonPart;
		const IntTools_CommonPrt & CommonPart ();
		%feature("compactdefaultargs") SetCommonPart;
		%feature("autodoc", "	* /** * Modifier * Sets the info of common part * @param theCP * common part */

	:param theCP:
	:type theCP: IntTools_CommonPrt &
	:rtype: None
") SetCommonPart;
		void SetCommonPart (const IntTools_CommonPrt & theCP);
};


%extend BOPDS_InterfEF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfEZ;
class BOPDS_InterfEZ : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfEZ;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfEZ;
		 BOPDS_InterfEZ ();
		%feature("compactdefaultargs") BOPDS_InterfEZ;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfEZ;
		 BOPDS_InterfEZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%extend BOPDS_InterfEZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfFF;
class BOPDS_InterfFF : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfFF;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfFF;
		 BOPDS_InterfFF ();
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", "	* /** * Selector/Modifier * Returns the intersection curves * returns * intersection curves */

	:rtype: BOPDS_VectorOfCurve
") ChangeCurves;
		BOPDS_VectorOfCurve & ChangeCurves ();
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", "	* /** * Selector/Modifier * Returns the intersection points * returns * intersection points */

	:rtype: BOPDS_VectorOfPoint
") ChangePoints;
		BOPDS_VectorOfPoint & ChangePoints ();
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "	* /** * Selector * Returns the intersection curves * returns * intersection curves */

	:rtype: BOPDS_VectorOfCurve
") Curves;
		const BOPDS_VectorOfCurve & Curves ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* /** * Initializer * @param theNbCurves * number of intersection curves * @param theNbPoints * number of intersection points */

	:param theNbCurves:
	:type theNbCurves: int
	:param theNbPoints:
	:type theNbPoints: int
	:rtype: None
") Init;
		void Init (const Standard_Integer theNbCurves,const Standard_Integer theNbPoints);
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	* /** * Selector * Returns the intersection points * returns * intersection points */

	:rtype: BOPDS_VectorOfPoint
") Points;
		const BOPDS_VectorOfPoint & Points ();
		%feature("compactdefaultargs") SetTangentFaces;
		%feature("autodoc", "	* /** * Modifier * Sets the flag of whether the faces are tangent * @param theFlag * the flag */

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetTangentFaces;
		void SetTangentFaces (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "	* /** * Selector * Returns the flag whether the faces are tangent * returns * the flag */

	:rtype: bool
") TangentFaces;
		Standard_Boolean TangentFaces ();
};


%extend BOPDS_InterfFF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfFZ;
class BOPDS_InterfFZ : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfFZ;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfFZ;
		 BOPDS_InterfFZ ();
		%feature("compactdefaultargs") BOPDS_InterfFZ;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfFZ;
		 BOPDS_InterfFZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%extend BOPDS_InterfFZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfVE;
class BOPDS_InterfVE : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfVE;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVE;
		 BOPDS_InterfVE ();
		%feature("compactdefaultargs") BOPDS_InterfVE;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVE;
		 BOPDS_InterfVE (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* /** * Selector * Returrns the value of parameter * of the point of the vertex * on the curve of the edge * returns * value of parameter */

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	* /** * Modifier * Sets the value of parameter * of the point of the vertex * on the curve of the edge * @param theT * value of parameter */

	:param theT:
	:type theT: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real theT);
};


%extend BOPDS_InterfVE {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfVF;
class BOPDS_InterfVF : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfVF;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVF;
		 BOPDS_InterfVF ();
		%feature("compactdefaultargs") BOPDS_InterfVF;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVF;
		 BOPDS_InterfVF (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "	* /** * Modifier * Sets the value of parameters * of the point of the vertex * on the surface of of the face * @param theU * value of U parameter * @param theV * value of U parameter */

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:rtype: None
") SetUV;
		void SetUV (const Standard_Real theU,const Standard_Real theV);
		%feature("compactdefaultargs") UV;
		%feature("autodoc", "	* /** * Selector * Returns the value of parameters * of the point of the vertex * on the surface of of the face * @param theU * value of U parameter * @param theV * value of U parameter */

	:param theU:
	:type theU: float &
	:param theV:
	:type theV: float &
	:rtype: None
") UV;
		void UV (Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend BOPDS_InterfVF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfVV;
class BOPDS_InterfVV : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfVV;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVV;
		 BOPDS_InterfVV ();
		%feature("compactdefaultargs") BOPDS_InterfVV;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVV;
		 BOPDS_InterfVV (const Handle_NCollection_BaseAllocator & theAllocator);
};


%extend BOPDS_InterfVV {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfVZ;
class BOPDS_InterfVZ : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfVZ;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfVZ;
		 BOPDS_InterfVZ ();
		%feature("compactdefaultargs") BOPDS_InterfVZ;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfVZ;
		 BOPDS_InterfVZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%extend BOPDS_InterfVZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_InterfZZ;
class BOPDS_InterfZZ : public BOPDS_Interf {
	public:
		%feature("compactdefaultargs") BOPDS_InterfZZ;
		%feature("autodoc", "	* /** * Constructor */

	:rtype: None
") BOPDS_InterfZZ;
		 BOPDS_InterfZZ ();
		%feature("compactdefaultargs") BOPDS_InterfZZ;
		%feature("autodoc", "	* /** * Constructor * @param theAllocator * allocator to manage the memory */

	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPDS_InterfZZ;
		 BOPDS_InterfZZ (const Handle_NCollection_BaseAllocator & theAllocator);
};


%extend BOPDS_InterfZZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_IteratorSI;
class BOPDS_IteratorSI : public BOPDS_Iterator {
	public:
		%feature("compactdefaultargs") BOPDS_IteratorSI;
		%feature("autodoc", "	* Empty contructor

	:rtype: None
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI ();
		%feature("compactdefaultargs") BOPDS_IteratorSI;
		%feature("autodoc", "	* Contructor theAllocator - the allocator to manage the memory

	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_IteratorSI;
		 BOPDS_IteratorSI (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") UpdateByLevelOfCheck;
		%feature("autodoc", "	* Updates the lists of possible intersections according to the value of <theLevel>. It defines which interferferences will be checked: 0 - only V/V; 1 - V/V and V/E; 2 - V/V, V/E and E/E; 3 - V/V, V/E, E/E and V/F; 4 - V/V, V/E, E/E, V/F and E/F; other - all interferences.

	:param theLevel:
	:type theLevel: int
	:rtype: None
") UpdateByLevelOfCheck;
		void UpdateByLevelOfCheck (const Standard_Integer theLevel);
};


%extend BOPDS_IteratorSI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPDS_PassKeyBoolean;
class BOPDS_PassKeyBoolean : public BOPDS_PassKey {
	public:
		%feature("compactdefaultargs") BOPDS_PassKeyBoolean;
		%feature("autodoc", "	:rtype: None
") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean ();
		%feature("compactdefaultargs") BOPDS_PassKeyBoolean;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") BOPDS_PassKeyBoolean;
		%feature("autodoc", "	:param Other:
	:type Other: BOPDS_PassKeyBoolean &
	:rtype: None
") BOPDS_PassKeyBoolean;
		 BOPDS_PassKeyBoolean (const BOPDS_PassKeyBoolean & Other);
		%feature("compactdefaultargs") Flag;
		%feature("autodoc", "	:rtype: bool
") Flag;
		Standard_Boolean Flag ();
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetFlag;
		void SetFlag (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param &:
	:type &: BOPDS_PassKeyBoolean
	:rtype: BOPDS_PassKeyBoolean
") operator =;
		BOPDS_PassKeyBoolean & operator = (const BOPDS_PassKeyBoolean &);
};


%extend BOPDS_PassKeyBoolean {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
