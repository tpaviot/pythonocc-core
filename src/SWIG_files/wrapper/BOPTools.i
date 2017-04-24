/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BOPTools

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BOPTools_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef BOPTools_ListOfCoupleOfShape::Iterator BOPTools_ListIteratorOfListOfCoupleOfShape;
typedef NCollection_List <BOPTools_CoupleOfShape> BOPTools_ListOfCoupleOfShape;
typedef NCollection_List <BOPTools_EdgeSet> BOPTools_ListOfEdgeSet;
typedef BOPTools_MapOfSet::Iterator BOPTools_MapIteratorOfMapOfSet;
typedef BOPTools_ListOfConnexityBlock::Iterator BOPTools_ListIteratorOfListOfConnexityBlock;
typedef BOPTools_ListOfEdgeSet::Iterator BOPTools_ListIteratorOfListOfEdgeSet;
typedef NCollection_List <BOPTools_ConnexityBlock> BOPTools_ListOfConnexityBlock;
typedef BOPTools_ListOfShapeSet::Iterator BOPTools_ListIteratorOfListOfShapeSet;
typedef NCollection_List <BOPTools_ShapeSet> BOPTools_ListOfShapeSet;
typedef NCollection_Map <BOPTools_Set , BOPTools_SetMapHasher> BOPTools_MapOfSet;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(boptools) BOPTools;
class BOPTools {
	public:
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param M:
	:type M: BOPCol_MapOfShape &
	:rtype: void
") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,BOPCol_MapOfShape & M);
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param M:
	:type M: BOPCol_IndexedMapOfShape &
	:rtype: void
") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,BOPCol_IndexedMapOfShape & M);
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: TopAbs_ShapeEnum
	:param M:
	:type M: BOPCol_IndexedMapOfShape &
	:rtype: void
") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,const TopAbs_ShapeEnum T,BOPCol_IndexedMapOfShape & M);
		%feature("compactdefaultargs") MapShapesAndAncestors;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA:
	:type TA: TopAbs_ShapeEnum
	:param M:
	:type M: BOPCol_IndexedDataMapOfShapeListOfShape &
	:rtype: void
") MapShapesAndAncestors;
		static void MapShapesAndAncestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA,BOPCol_IndexedDataMapOfShapeListOfShape & M);
};


%extend BOPTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPTools_AlgoTools {
	public:
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "	:param aV1:
	:type aV1: TopoDS_Vertex &
	:param aP2:
	:type aP2: gp_Pnt
	:param aTolP2:
	:type aTolP2: float
	:rtype: int
") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & aV1,const gp_Pnt & aP2,const Standard_Real aTolP2);
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "	:param aV1:
	:type aV1: TopoDS_Vertex &
	:param aV2:
	:type aV2: TopoDS_Vertex &
	:rtype: int
") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2);
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "	:param aLV:
	:type aLV: BOPCol_ListOfShape &
	:param aV:
	:type aV: TopoDS_Vertex &
	:rtype: void
") MakeVertex;
		static void MakeVertex (BOPCol_ListOfShape & aLV,TopoDS_Vertex & aV);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	:param theCurve:
	:type theCurve: IntTools_Curve &
	:param theV1:
	:type theV1: TopoDS_Vertex &
	:param theT1:
	:type theT1: float
	:param theV2:
	:type theV2: TopoDS_Vertex &
	:param theT2:
	:type theT2: float
	:param theTolR3D:
	:type theTolR3D: float
	:param theE:
	:type theE: TopoDS_Edge &
	:rtype: void
") MakeEdge;
		static void MakeEdge (const IntTools_Curve & theCurve,const TopoDS_Vertex & theV1,const Standard_Real theT1,const TopoDS_Vertex & theV2,const Standard_Real theT2,const Standard_Real theTolR3D,TopoDS_Edge & theE);
		%feature("compactdefaultargs") MakePCurve;
		%feature("autodoc", "	:param theE:
	:type theE: TopoDS_Edge &
	:param theF1:
	:type theF1: TopoDS_Face &
	:param theF2:
	:type theF2: TopoDS_Face &
	:param theCurve:
	:type theCurve: IntTools_Curve &
	:param thePC1:
	:type thePC1: bool
	:param thePC2:
	:type thePC2: bool
	:rtype: void
") MakePCurve;
		static void MakePCurve (const TopoDS_Edge & theE,const TopoDS_Face & theF1,const TopoDS_Face & theF2,const IntTools_Curve & theCurve,const Standard_Boolean thePC1,const Standard_Boolean thePC2);
		%feature("compactdefaultargs") MakeContainer;
		%feature("autodoc", "	:param theType:
	:type theType: TopAbs_ShapeEnum
	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: void
") MakeContainer;
		static void MakeContainer (const TopAbs_ShapeEnum theType,TopoDS_Shape & theShape);
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", "	:param aW:
	:type aW: TopoDS_Shape &
	:param aF:
	:type aF: TopoDS_Shape &
	:rtype: bool
") IsHole;
		static Standard_Boolean IsHole (const TopoDS_Shape & aW,const TopoDS_Shape & aF);
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "	* Returns True if the shape theSplit has opposite direction than theShape theContext - cashed geometrical tools

	:param theSplit:
	:type theSplit: TopoDS_Shape &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: bool
") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Shape & theSplit,const TopoDS_Shape & theShape,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "	* Returns True if normal direction of the face theShape is not the same as for the face theSplit theContext - cashed geometrical tools

	:param theSplit:
	:type theSplit: TopoDS_Face &
	:param theShape:
	:type theShape: TopoDS_Face &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: bool
") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Face & theSplit,const TopoDS_Face & theShape,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "	:param aE1:
	:type aE1: TopoDS_Edge &
	:param aE2:
	:type aE2: TopoDS_Edge &
	:param aContext:
	:type aContext: Handle_IntTools_Context &
	:rtype: bool
") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Edge & aE1,const TopoDS_Edge & aE2,Handle_IntTools_Context & aContext);
		%feature("compactdefaultargs") AreFacesSameDomain;
		%feature("autodoc", "	:param theF1:
	:type theF1: TopoDS_Face &
	:param theF2:
	:type theF2: TopoDS_Face &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: bool
") AreFacesSameDomain;
		static Standard_Boolean AreFacesSameDomain (const TopoDS_Face & theF1,const TopoDS_Face & theF2,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") CheckSameGeom;
		%feature("autodoc", "	:param theF1:
	:type theF1: TopoDS_Face &
	:param theF2:
	:type theF2: TopoDS_Face &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: bool
") CheckSameGeom;
		static Standard_Boolean CheckSameGeom (const TopoDS_Face & theF1,const TopoDS_Face & theF2,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "	:param theF1:
	:type theF1: TopoDS_Face &
	:param theF2:
	:type theF2: TopoDS_Face &
	:rtype: int
") Sense;
		static Standard_Integer Sense (const TopoDS_Face & theF1,const TopoDS_Face & theF2);
		%feature("compactdefaultargs") GetEdgeOff;
		%feature("autodoc", "	* Returns True if the face theFace contains the edge theEdge but with opposite orientation. If the method returns True theEdgeOff is the edge founded

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdgeOff:
	:type theEdgeOff: TopoDS_Edge &
	:rtype: bool
") GetEdgeOff;
		static Standard_Boolean GetEdgeOff (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,TopoDS_Edge & theEdgeOff);
		%feature("compactdefaultargs") GetFaceOff;
		%feature("autodoc", "	* For the face theFace and its edge theEdge finds the face suitable to produce shell. theLCEF - set of faces to search. All faces from theLCEF must share edge theEdge

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theLCEF:
	:type theLCEF: BOPTools_ListOfCoupleOfShape &
	:param theFaceOff:
	:type theFaceOff: TopoDS_Face &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: bool
") GetFaceOff;
		static Standard_Boolean GetFaceOff (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,BOPTools_ListOfCoupleOfShape & theLCEF,TopoDS_Face & theFaceOff,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "	* Returns True if the face theFace is inside of the couple of faces theFace1, theFace2. The faces theFace, theFace1, theFace2 must share the edge theEdge

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace1:
	:type theFace1: TopoDS_Face &
	:param theFace2:
	:type theFace2: TopoDS_Face &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: int
") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,const TopoDS_Face & theFace1,const TopoDS_Face & theFace2,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "	* Returns True if the face theFace is inside of the appropriate couple of faces (from the set theLF) . The faces of the set theLF and theFace must share the edge theEdge

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theLF:
	:type theLF: BOPCol_ListOfShape &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: int
") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,BOPCol_ListOfShape & theLF,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "	* Returns True if the face theFace is inside the solid theSolid. theMEF - Map Edge/Faces for theSolid theTol - value of precision of computation theContext- cahed geometrical tools

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:param theMEF:
	:type theMEF: BOPCol_IndexedDataMapOfShapeListOfShape &
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: int
") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Solid & theSolid,BOPCol_IndexedDataMapOfShapeListOfShape & theMEF,const Standard_Real theTol,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") GetEdgeOnFace;
		%feature("autodoc", "	* For the face theFace gets the edge theEdgeOnF that is the same as theEdge Returns True if such edge exists Returns False if there is no such edge

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdgeOnF:
	:type theEdgeOnF: TopoDS_Edge &
	:rtype: bool
") GetEdgeOnFace;
		static Standard_Boolean GetEdgeOnFace (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,TopoDS_Edge & theEdgeOnF);
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "	* Computes the 3-D state of the point thePoint toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.

	:param thePoint:
	:type thePoint: gp_Pnt
	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: TopAbs_State
") ComputeState;
		static TopAbs_State ComputeState (const gp_Pnt & thePoint,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "	* Computes the 3-D state of the vertex theVertex toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.

	:param theVertex:
	:type theVertex: TopoDS_Vertex &
	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: TopAbs_State
") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Vertex & theVertex,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "	* Computes the 3-D state of the edge theEdge toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: TopAbs_State
") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Edge & theEdge,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "	* Computes the 3-D state of the face theFace toward solid theSolid. theTol - value of precision of computation theBounds - set of edges of theFace to avoid theContext- cahed geometrical tools Returns 3-D state.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:param theTol:
	:type theTol: float
	:param theBounds:
	:type theBounds: BOPCol_IndexedMapOfShape &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: TopAbs_State
") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Face & theFace,const TopoDS_Solid & theSolid,const Standard_Real theTol,BOPCol_IndexedMapOfShape & theBounds,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") ComputeStateByOnePoint;
		%feature("autodoc", "	* Computes the 3-D state of the shape theShape toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: TopAbs_State
") ComputeStateByOnePoint;
		static TopAbs_State ComputeStateByOnePoint (const TopoDS_Shape & theShape,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") MakeConnexityBlock;
		%feature("autodoc", "	* For the list of faces theLS build block theLSCB in terms of connexity by edges theMapAvoid - set of edges to avoid for the treatment

	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:param theMapAvoid:
	:type theMapAvoid: BOPCol_IndexedMapOfShape &
	:param theLSCB:
	:type theLSCB: BOPCol_ListOfShape &
	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: void
") MakeConnexityBlock;
		static void MakeConnexityBlock (BOPCol_ListOfShape & theLS,BOPCol_IndexedMapOfShape & theMapAvoid,BOPCol_ListOfShape & theLSCB,const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") MakeConnexityBlocks;
		%feature("autodoc", "	* For the compound theS build the blocks theLCB (as list of compounds) in terms of connexity by the shapes of theType

	:param theS:
	:type theS: TopoDS_Shape &
	:param theType1:
	:type theType1: TopAbs_ShapeEnum
	:param theType2:
	:type theType2: TopAbs_ShapeEnum
	:param theLCB:
	:type theLCB: BOPCol_ListOfShape &
	:rtype: void
") MakeConnexityBlocks;
		static void MakeConnexityBlocks (const TopoDS_Shape & theS,const TopAbs_ShapeEnum theType1,const TopAbs_ShapeEnum theType2,BOPCol_ListOfShape & theLCB);
		%feature("compactdefaultargs") OrientFacesOnShell;
		%feature("autodoc", "	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: void
") OrientFacesOnShell;
		static void OrientFacesOnShell (TopoDS_Shape & theS);
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", "	* Provides valid values of tolerances for the shape <theS> <theTolMax> is max value of the tolerance that can be accepted for correction. If real value of the tolerance will be greater than <aTolMax>, the correction does not perform.

	:param theS:
	:type theS: TopoDS_Shape &
	:param theTolMax: default value is 0.0001
	:type theTolMax: float
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void
") CorrectTolerances;
		static void CorrectTolerances (const TopoDS_Shape & theS,const Standard_Real theTolMax = 0.0001,const Standard_Boolean theRunParallel = Standard_False);
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", "	* Provides valid values of tolerances for the shape <theS> in terms of BRepCheck_InvalidCurveOnSurface.

	:param theS:
	:type theS: TopoDS_Shape &
	:param theTolMax: default value is 0.0001
	:type theTolMax: float
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void
") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface (const TopoDS_Shape & theS,const Standard_Real theTolMax = 0.0001,const Standard_Boolean theRunParallel = Standard_False);
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", "	* Provides valid values of tolerances for the shape <theS> in terms of BRepCheck_InvalidPointOnCurve.

	:param theS:
	:type theS: TopoDS_Shape &
	:param theTolMax: default value is 0.0001
	:type theTolMax: float
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void
") CorrectPointOnCurve;
		static void CorrectPointOnCurve (const TopoDS_Shape & theS,const Standard_Real theTolMax = 0.0001,const Standard_Boolean theRunParallel = Standard_False);
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "	* Make a vertex using 3D-point <aP1> and 3D-tolerance value <aTol>

	:param aP1:
	:type aP1: gp_Pnt
	:param aTol:
	:type aTol: float
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex &
	:rtype: void
") MakeNewVertex;
		static void MakeNewVertex (const gp_Pnt & aP1,const Standard_Real aTol,TopoDS_Vertex & aNewVertex);
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "	* Make a vertex using couple of vertices <aV1, aV2>

	:param aV1:
	:type aV1: TopoDS_Vertex &
	:param aV2:
	:type aV2: TopoDS_Vertex &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex &
	:rtype: void
") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2,TopoDS_Vertex & aNewVertex);
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "	* Make a vertex in place of intersection between two edges <aE1, aE2> with parameters <aP1, aP2>

	:param aE1:
	:type aE1: TopoDS_Edge &
	:param aP1:
	:type aP1: float
	:param aE2:
	:type aE2: TopoDS_Edge &
	:param aP2:
	:type aP2: float
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex &
	:rtype: void
") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Edge & aE1,const Standard_Real aP1,const TopoDS_Edge & aE2,const Standard_Real aP2,TopoDS_Vertex & aNewVertex);
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "	* Make a vertex in place of intersection between the edge <aE1> with parameter <aP1> and the face <aF2>

	:param aE1:
	:type aE1: TopoDS_Edge &
	:param aP1:
	:type aP1: float
	:param aF2:
	:type aF2: TopoDS_Face &
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex &
	:rtype: void
") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Edge & aE1,const Standard_Real aP1,const TopoDS_Face & aF2,TopoDS_Vertex & aNewVertex);
		%feature("compactdefaultargs") PointOnEdge;
		%feature("autodoc", "	* Compute a 3D-point on the edge <aEdge> at parameter <aPrm>

	:param aEdge:
	:type aEdge: TopoDS_Edge &
	:param aPrm:
	:type aPrm: float
	:param aP:
	:type aP: gp_Pnt
	:rtype: void
") PointOnEdge;
		static void PointOnEdge (const TopoDS_Edge & aEdge,const Standard_Real aPrm,gp_Pnt & aP);
		%feature("compactdefaultargs") MakeSplitEdge;
		%feature("autodoc", "	* Make the edge from base edge <aE1> and two vertices <aV1,aV2> at parameters <aP1,aP2>

	:param aE1:
	:type aE1: TopoDS_Edge &
	:param aV1:
	:type aV1: TopoDS_Vertex &
	:param aP1:
	:type aP1: float
	:param aV2:
	:type aV2: TopoDS_Vertex &
	:param aP2:
	:type aP2: float
	:param aNewEdge:
	:type aNewEdge: TopoDS_Edge &
	:rtype: void
") MakeSplitEdge;
		static void MakeSplitEdge (const TopoDS_Edge & aE1,const TopoDS_Vertex & aV1,const Standard_Real aP1,const TopoDS_Vertex & aV2,const Standard_Real aP2,TopoDS_Edge & aNewEdge);
		%feature("compactdefaultargs") MakeSectEdge;
		%feature("autodoc", "	* Make the edge from 3D-Curve <aIC> and two vertices <aV1,aV2> at parameters <aP1,aP2>

	:param aIC:
	:type aIC: IntTools_Curve &
	:param aV1:
	:type aV1: TopoDS_Vertex &
	:param aP1:
	:type aP1: float
	:param aV2:
	:type aV2: TopoDS_Vertex &
	:param aP2:
	:type aP2: float
	:param aNewEdge:
	:type aNewEdge: TopoDS_Edge &
	:rtype: void
") MakeSectEdge;
		static void MakeSectEdge (const IntTools_Curve & aIC,const TopoDS_Vertex & aV1,const Standard_Real aP1,const TopoDS_Vertex & aV2,const Standard_Real aP2,TopoDS_Edge & aNewEdge);
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "	* Update the tolerance value for vertex <aV> taking into account the fact that <aV> lays on the curve <aIC>

	:param aIC:
	:type aIC: IntTools_Curve &
	:param aT:
	:type aT: float
	:param aV:
	:type aV: TopoDS_Vertex &
	:rtype: void
") UpdateVertex;
		static void UpdateVertex (const IntTools_Curve & aIC,const Standard_Real aT,const TopoDS_Vertex & aV);
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "	* Update the tolerance value for vertex <aV> taking into account the fact that <aV> lays on the edge <aE>

	:param aE:
	:type aE: TopoDS_Edge &
	:param aT:
	:type aT: float
	:param aV:
	:type aV: TopoDS_Vertex &
	:rtype: void
") UpdateVertex;
		static void UpdateVertex (const TopoDS_Edge & aE,const Standard_Real aT,const TopoDS_Vertex & aV);
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "	* Update the tolerance value for vertex <aVN> taking into account the fact that <aVN> should cover tolerance zone of <aVF>

	:param aVF:
	:type aVF: TopoDS_Vertex &
	:param aVN:
	:type aVN: TopoDS_Vertex &
	:rtype: void
") UpdateVertex;
		static void UpdateVertex (const TopoDS_Vertex & aVF,const TopoDS_Vertex & aVN);
		%feature("compactdefaultargs") CorrectRange;
		%feature("autodoc", "	* Correct shrunk range <aSR> taking into account 3D-curve resolution and corresp. tolerances' values of <aE1>, <aE2>

	:param aE1:
	:type aE1: TopoDS_Edge &
	:param aE2:
	:type aE2: TopoDS_Edge &
	:param aSR:
	:type aSR: IntTools_Range &
	:param aNewSR:
	:type aNewSR: IntTools_Range &
	:rtype: void
") CorrectRange;
		static void CorrectRange (const TopoDS_Edge & aE1,const TopoDS_Edge & aE2,const IntTools_Range & aSR,IntTools_Range & aNewSR);
		%feature("compactdefaultargs") CorrectRange;
		%feature("autodoc", "	* Correct shrunk range <aSR> taking into account 3D-curve resolution and corresp. tolerances' values of <aE>, <aF>

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aSR:
	:type aSR: IntTools_Range &
	:param aNewSR:
	:type aNewSR: IntTools_Range &
	:rtype: void
") CorrectRange;
		static void CorrectRange (const TopoDS_Edge & aE,const TopoDS_Face & aF,const IntTools_Range & aSR,IntTools_Range & aNewSR);
		%feature("compactdefaultargs") IsBlockInOnFace;
		%feature("autodoc", "	* Returns True if PaveBlock <aPB> lays on the face <aF>, i.e the <PB> is IN or ON in 2D of <aF>

	:param aShR:
	:type aShR: IntTools_Range &
	:param aF:
	:type aF: TopoDS_Face &
	:param aE:
	:type aE: TopoDS_Edge &
	:param aContext:
	:type aContext: Handle_IntTools_Context &
	:rtype: bool
") IsBlockInOnFace;
		static Standard_Boolean IsBlockInOnFace (const IntTools_Range & aShR,const TopoDS_Face & aF,const TopoDS_Edge & aE,Handle_IntTools_Context & aContext);
		%feature("compactdefaultargs") IsMicroEdge;
		%feature("autodoc", "	* Checks if it is possible to compute shrunk range for the edge <aE>.

	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: bool
") IsMicroEdge;
		static Standard_Boolean IsMicroEdge (const TopoDS_Edge & theEdge,const Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") CorrectShapeTolerances;
		%feature("autodoc", "	* Corrects tolerance values of the sub-shapes of the shape <theS> if needed.

	:param theS:
	:type theS: TopoDS_Shape &
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void
") CorrectShapeTolerances;
		static void CorrectShapeTolerances (const TopoDS_Shape & theS,const Standard_Boolean theRunParallel = Standard_False);
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "	* Retutns dimension of the shape <theS>.

	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: int
") Dimension;
		static Standard_Integer Dimension (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") IsOpenShell;
		%feature("autodoc", "	* Returns true if the shell <theShell> is open

	:param theShell:
	:type theShell: TopoDS_Shell &
	:rtype: bool
") IsOpenShell;
		static Standard_Boolean IsOpenShell (const TopoDS_Shell & theShell);
		%feature("compactdefaultargs") IsInvertedSolid;
		%feature("autodoc", "	* Returns true if the solid <theSolid> is inverted

	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:rtype: bool
") IsInvertedSolid;
		static Standard_Boolean IsInvertedSolid (const TopoDS_Solid & theSolid);
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "	* Computes the necessary value of the tolerance for the edge

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:param theMaxDist:
	:type theMaxDist: float &
	:param theMaxPar:
	:type theMaxPar: float &
	:rtype: bool
") ComputeTolerance;
		static Standard_Boolean ComputeTolerance (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend BOPTools_AlgoTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPTools_AlgoTools2D {
	public:
		%feature("compactdefaultargs") BuildPCurveForEdgeOnFace;
		%feature("autodoc", "	* Compute P-Curve for the edge <aE> on the face <aF> Raises exception Standard_ConstructionError if projection algorithm fails

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:rtype: void
") BuildPCurveForEdgeOnFace;
		static void BuildPCurveForEdgeOnFace (const TopoDS_Edge & aE,const TopoDS_Face & aF);
		%feature("compactdefaultargs") EdgeTangent;
		%feature("autodoc", "	* Compute tangent for the edge <aE> [in 3D] at parameter <aT>

	:param anE:
	:type anE: TopoDS_Edge &
	:param aT:
	:type aT: float
	:param Tau:
	:type Tau: gp_Vec
	:rtype: bool
") EdgeTangent;
		static Standard_Boolean EdgeTangent (const TopoDS_Edge & anE,const Standard_Real aT,gp_Vec & Tau);
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "	* Compute surface parameters <U,V> of the face <aF> for the point from the edge <aE> at parameter <aT>. If <aE> has't pcurve on surface, algorithm tries to get it by projection and can raise exception Standard_ConstructionError if projection algorithm fails

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aT:
	:type aT: float
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: void
") PointOnSurface;
		static void PointOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasCurveOnSurface;
		%feature("autodoc", "	* Returns True if the edge <aE> has P-Curve <aC> on surface <aF> . [aFirst, aLast] - range of the P-Curve [aToler] - reached tolerance If the P-Curve does not exist, aC.IsNull()=True.

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aC:
	:type aC: Handle_Geom2d_Curve &
	:param aFirst:
	:type aFirst: float &
	:param aLast:
	:type aLast: float &
	:param aToler:
	:type aToler: float &
	:rtype: bool
") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF,Handle_Geom2d_Curve & aC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasCurveOnSurface;
		%feature("autodoc", "	* Returns True if the edge <aE> has P-Curve <aC> on surface <aF> . If the P-Curve does not exist, aC.IsNull()=True.

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:rtype: bool
") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF);
		%feature("compactdefaultargs") AdjustPCurveOnFace;
		%feature("autodoc", "	* Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> .

	:param aF:
	:type aF: TopoDS_Face &
	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param aC2D:
	:type aC2D: Handle_Geom2d_Curve &
	:param aC2DA:
	:type aC2DA: Handle_Geom2d_Curve &
	:rtype: void
") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace (const TopoDS_Face & aF,const Handle_Geom_Curve & C3D,const Handle_Geom2d_Curve & aC2D,Handle_Geom2d_Curve & aC2DA);
		%feature("compactdefaultargs") AdjustPCurveOnFace;
		%feature("autodoc", "	* Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> . [aT1, aT2] - range to adjust

	:param aF:
	:type aF: TopoDS_Face &
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aC2D:
	:type aC2D: Handle_Geom2d_Curve &
	:param aC2DA:
	:type aC2DA: Handle_Geom2d_Curve &
	:rtype: void
") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace (const TopoDS_Face & aF,const Standard_Real aT1,const Standard_Real aT2,const Handle_Geom2d_Curve & aC2D,Handle_Geom2d_Curve & aC2DA);
		%feature("compactdefaultargs") AdjustPCurveOnFace;
		%feature("autodoc", "	* Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> . [aT1, aT2] - range to adjust

	:param aF:
	:type aF: BRepAdaptor_Surface &
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aC2D:
	:type aC2D: Handle_Geom2d_Curve &
	:param aC2DA:
	:type aC2DA: Handle_Geom2d_Curve &
	:rtype: void
") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace (const BRepAdaptor_Surface & aF,const Standard_Real aT1,const Standard_Real aT2,const Handle_Geom2d_Curve & aC2D,Handle_Geom2d_Curve & aC2DA);
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "	* Compute intermediate value in between [aFirst, aLast] .

	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: float
") IntermediatePoint;
		static Standard_Real IntermediatePoint (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "	* Compute intermediate value of parameter for the edge <anE>.

	:param anE:
	:type anE: TopoDS_Edge &
	:rtype: float
") IntermediatePoint;
		static Standard_Real IntermediatePoint (const TopoDS_Edge & anE);
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "	:param theE:
	:type theE: TopoDS_Edge &
	:param theF:
	:type theF: TopoDS_Face &
	:rtype: void
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane (const TopoDS_Edge & theE,const TopoDS_Face & theF);
		%feature("compactdefaultargs") BuildPCurveForEdgeOnPlane;
		%feature("autodoc", "	:param theE:
	:type theE: TopoDS_Edge &
	:param theF:
	:type theF: TopoDS_Face &
	:param theC2D:
	:type theC2D: Handle_Geom2d_Curve &
	:param bToUpdate:
	:type bToUpdate: bool
	:rtype: void
") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane (const TopoDS_Edge & theE,const TopoDS_Face & theF,Handle_Geom2d_Curve & theC2D,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") BuildPCurveForEdgesOnPlane;
		%feature("autodoc", "	:param theLE:
	:type theLE: BOPCol_ListOfShape &
	:param theF:
	:type theF: TopoDS_Face &
	:rtype: void
") BuildPCurveForEdgesOnPlane;
		static void BuildPCurveForEdgesOnPlane (const BOPCol_ListOfShape & theLE,const TopoDS_Face & theF);
		%feature("compactdefaultargs") Make2D;
		%feature("autodoc", "	* Make P-Curve <aC> for the edge <aE> on surface <aF> . [aFirst, aLast] - range of the P-Curve [aToler] - reached tolerance Raises exception Standard_ConstructionError if algorithm fails

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aC:
	:type aC: Handle_Geom2d_Curve &
	:param aFirst:
	:type aFirst: float &
	:param aLast:
	:type aLast: float &
	:param aToler:
	:type aToler: float &
	:rtype: void
") Make2D;
		static void Make2D (const TopoDS_Edge & aE,const TopoDS_Face & aF,Handle_Geom2d_Curve & aC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "	* Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> . [aToler] - reached tolerance Raises exception Standard_ConstructionError if projection algorithm fails

	:param aF:
	:type aF: TopoDS_Face &
	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param aC:
	:type aC: Handle_Geom2d_Curve &
	:param aToler:
	:type aToler: float &
	:rtype: void
") MakePCurveOnFace;
		static void MakePCurveOnFace (const TopoDS_Face & aF,const Handle_Geom_Curve & C3D,Handle_Geom2d_Curve & aC,Standard_Real &OutValue);
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "	* Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> . [aT1, aT2] - range to build [aToler] - reached tolerance Raises exception Standard_ConstructionError if projection algorithm fails

	:param aF:
	:type aF: TopoDS_Face &
	:param C3D:
	:type C3D: Handle_Geom_Curve &
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aC:
	:type aC: Handle_Geom2d_Curve &
	:param aToler:
	:type aToler: float &
	:rtype: void
") MakePCurveOnFace;
		static void MakePCurveOnFace (const TopoDS_Face & aF,const Handle_Geom_Curve & C3D,const Standard_Real aT1,const Standard_Real aT2,Handle_Geom2d_Curve & aC,Standard_Real &OutValue);
		%feature("compactdefaultargs") MakePCurveOfType;
		%feature("autodoc", "	* Make empty P-Curve <aC> of relevant to <PC> type

	:param PC:
	:type PC: ProjLib_ProjectedCurve &
	:param aC:
	:type aC: Handle_Geom2d_Curve &
	:rtype: void
") MakePCurveOfType;
		static void MakePCurveOfType (const ProjLib_ProjectedCurve & PC,Handle_Geom2d_Curve & aC);
		%feature("compactdefaultargs") AttachExistingPCurve;
		%feature("autodoc", "	* Attach P-Curve from the edge <aEold> on surface <aF> to the edge <aEnew> Returns 0 in case of success

	:param aEold:
	:type aEold: TopoDS_Edge &
	:param aEnew:
	:type aEnew: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aCtx:
	:type aCtx: Handle_IntTools_Context &
	:rtype: int
") AttachExistingPCurve;
		static Standard_Integer AttachExistingPCurve (const TopoDS_Edge & aEold,const TopoDS_Edge & aEnew,const TopoDS_Face & aF,const Handle_IntTools_Context & aCtx);
};


%extend BOPTools_AlgoTools2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPTools_AlgoTools3D {
	public:
		%feature("compactdefaultargs") DoSplitSEAMOnFace;
		%feature("autodoc", "	* Make the edge <aSp> seam edge for the face <aF>

	:param aSp:
	:type aSp: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:rtype: void
") DoSplitSEAMOnFace;
		static void DoSplitSEAMOnFace (const TopoDS_Edge & aSp,const TopoDS_Face & aF);
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "	* Computes normal to the face <aF> for the point on the edge <aE> at parameter <aT>

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aT:
	:type aT: float
	:param aD:
	:type aD: gp_Dir
	:rtype: void
") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Dir & aD);
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "	* Computes normal to the face <aF> for the point on the edge <aE> at arbitrary intermediate parameter

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aD:
	:type aD: gp_Dir
	:rtype: void
") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,gp_Dir & aD);
		%feature("compactdefaultargs") SenseFlag;
		%feature("autodoc", "	* Returns 1 if scalar product aNF1* aNF2>0. Returns 0 if directions aNF1 aNF2 coinside Returns -1 if scalar product aNF1* aNF2<0.

	:param aNF1:
	:type aNF1: gp_Dir
	:param aNF2:
	:type aNF2: gp_Dir
	:rtype: int
") SenseFlag;
		static Standard_Integer SenseFlag (const gp_Dir & aNF1,const gp_Dir & aNF2);
		%feature("compactdefaultargs") GetNormalToSurface;
		%feature("autodoc", "	* Compute normal <aD> to surface <aS> in point (U,V) Returns True if directions aD1U, aD1V coinside

	:param aS:
	:type aS: Handle_Geom_Surface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param aD:
	:type aD: gp_Dir
	:rtype: bool
") GetNormalToSurface;
		static Standard_Boolean GetNormalToSurface (const Handle_Geom_Surface & aS,const Standard_Real U,const Standard_Real V,gp_Dir & aD);
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "	* Computes normal to the face <aF> for the 3D-point that belonds to the edge <aE> at parameter <aT>. Output: aPx - the 3D-point where the normal computed aD - the normal; //! Warning: The normal is computed not exactly in the point on the edge, but in point that is near to the edge towards to the face material (so, we'll have approx. normal)

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aT:
	:type aT: float
	:param aPx:
	:type aPx: gp_Pnt
	:param aD:
	:type aD: gp_Dir
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: void
") GetApproxNormalToFaceOnEdge;
		static void GetApproxNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Pnt & aPx,gp_Dir & aD,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "	:param theE:
	:type theE: TopoDS_Edge &
	:param theF:
	:type theF: TopoDS_Face &
	:param aT:
	:type aT: float
	:param aP:
	:type aP: gp_Pnt
	:param aDNF:
	:type aDNF: gp_Dir
	:param aDt2D:
	:type aDt2D: float
	:rtype: void
") GetApproxNormalToFaceOnEdge;
		static void GetApproxNormalToFaceOnEdge (const TopoDS_Edge & theE,const TopoDS_Face & theF,const Standard_Real aT,gp_Pnt & aP,gp_Dir & aDNF,const Standard_Real aDt2D);
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "	* Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is <aDt2D>

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aT:
	:type aT: float
	:param aDt2D:
	:type aDt2D: float
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:param aPx:
	:type aPx: gp_Pnt
	:rtype: void
") PointNearEdge;
		static void PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,const Standard_Real aDt2D,gp_Pnt2d & aP2D,gp_Pnt & aPx);
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "	* Computes the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is dt2D=BOPTools_AlgoTools3D::MinStepIn2d()

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aT:
	:type aT: float
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:param aPx:
	:type aPx: gp_Pnt
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: void
") PointNearEdge;
		static void PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Pnt2d & aP2D,gp_Pnt & aPx,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "	* Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at arbitrary parameter towards to the material of the face <aF>. The value of shifting in 2D is dt2D=BOPTools_AlgoTools3D::MinStepIn2d()

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:param aPx:
	:type aPx: gp_Pnt
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: void
") PointNearEdge;
		static void PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,gp_Pnt2d & aP2D,gp_Pnt & aPx,Handle_IntTools_Context & theContext);
		%feature("compactdefaultargs") MinStepIn2d;
		%feature("autodoc", "	* Returns simple step value that is used in 2D-computations = 1.e-5

	:rtype: float
") MinStepIn2d;
		static Standard_Real MinStepIn2d ();
		%feature("compactdefaultargs") IsEmptyShape;
		%feature("autodoc", "	* Returns True if the shape <aS> does not contain geometry information (e.g. empty compound)

	:param aS:
	:type aS: TopoDS_Shape &
	:rtype: bool
") IsEmptyShape;
		static Standard_Boolean IsEmptyShape (const TopoDS_Shape & aS);
		%feature("compactdefaultargs") OrientEdgeOnFace;
		%feature("autodoc", "	* Get the edge <aER> from the face <aF> that is the same as the edge <aE>

	:param aE:
	:type aE: TopoDS_Edge &
	:param aF:
	:type aF: TopoDS_Face &
	:param aER:
	:type aER: TopoDS_Edge &
	:rtype: void
") OrientEdgeOnFace;
		static void OrientEdgeOnFace (const TopoDS_Edge & aE,const TopoDS_Face & aF,TopoDS_Edge & aER);
		%feature("compactdefaultargs") PointInFace;
		%feature("autodoc", "	* Computes a point <theP> inside the face <theF>. <theP2D> - 2D representation of <theP> on the surface of <theF> Returns 0 in case of success.

	:param theF:
	:type theF: TopoDS_Face &
	:param theP:
	:type theP: gp_Pnt
	:param theP2D:
	:type theP2D: gp_Pnt2d
	:param theContext:
	:type theContext: Handle_IntTools_Context &
	:rtype: int
") PointInFace;
		static Standard_Integer PointInFace (const TopoDS_Face & theF,gp_Pnt & theP,gp_Pnt2d & theP2D,Handle_IntTools_Context & theContext);
};


%extend BOPTools_AlgoTools3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPTools_ConnexityBlock;
class BOPTools_ConnexityBlock {
	public:
		%feature("compactdefaultargs") BOPTools_ConnexityBlock;
		%feature("autodoc", "	:rtype: None
") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock ();
		%feature("compactdefaultargs") BOPTools_ConnexityBlock;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: Handle_NCollection_BaseAllocator &
	:rtype: None
") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") Shapes;
		const BOPCol_ListOfShape & Shapes ();
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") ChangeShapes;
		BOPCol_ListOfShape & ChangeShapes ();
		%feature("compactdefaultargs") SetRegular;
		%feature("autodoc", "	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetRegular;
		void SetRegular (const Standard_Boolean theFlag);
		%feature("compactdefaultargs") IsRegular;
		%feature("autodoc", "	:rtype: bool
") IsRegular;
		Standard_Boolean IsRegular ();
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") Loops;
		const BOPCol_ListOfShape & Loops ();
		%feature("compactdefaultargs") ChangeLoops;
		%feature("autodoc", "	:rtype: BOPCol_ListOfShape
") ChangeLoops;
		BOPCol_ListOfShape & ChangeLoops ();
};


%extend BOPTools_ConnexityBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPTools_EdgeSet;
class BOPTools_EdgeSet {
	public:
		%feature("compactdefaultargs") BOPTools_EdgeSet;
		%feature("autodoc", "	:rtype: None
") BOPTools_EdgeSet;
		 BOPTools_EdgeSet ();
		%feature("compactdefaultargs") BOPTools_EdgeSet;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPTools_EdgeSet;
		 BOPTools_EdgeSet (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: None
") AddEdge;
		void AddEdge (const TopoDS_Edge & theEdge);
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") AddEdges;
		void AddEdges (const BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "	:param theFace:
	:type theFace: TopoDS_Shape &
	:rtype: None
") AddEdges;
		void AddEdges (const TopoDS_Shape & theFace);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") Get;
		void Get (BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theSet:
	:type theSet: BOPTools_EdgeSet &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const BOPTools_EdgeSet & theSet);
};


%extend BOPTools_EdgeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPTools_Set;
class BOPTools_Set {
	public:
		%feature("compactdefaultargs") BOPTools_Set;
		%feature("autodoc", "	:rtype: None
") BOPTools_Set;
		 BOPTools_Set ();
		%feature("compactdefaultargs") BOPTools_Set;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPTools_Set;
		 BOPTools_Set (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BOPTools_Set &
	:rtype: BOPTools_Set
") Assign;
		BOPTools_Set & Assign (const BOPTools_Set & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BOPTools_Set &
	:rtype: BOPTools_Set
") operator =;
		BOPTools_Set & operator = (const BOPTools_Set & Other);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theS:
	:type theS: TopoDS_Shape &
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & theS,const TopAbs_ShapeEnum theType);
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param aOther:
	:type aOther: BOPTools_Set &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const BOPTools_Set & aOther);
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        };


%extend BOPTools_Set {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BOPTools_SetMapHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param aSet:
	:type aSet: BOPTools_Set &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const BOPTools_Set & aSet,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param aSet1:
	:type aSet1: BOPTools_Set &
	:param aSet2:
	:type aSet2: BOPTools_Set &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const BOPTools_Set & aSet1,const BOPTools_Set & aSet2);
};


%extend BOPTools_SetMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BOPTools_ShapeSet;
class BOPTools_ShapeSet {
	public:
		%feature("compactdefaultargs") BOPTools_ShapeSet;
		%feature("autodoc", "	:rtype: None
") BOPTools_ShapeSet;
		 BOPTools_ShapeSet ();
		%feature("compactdefaultargs") BOPTools_ShapeSet;
		%feature("autodoc", "	:param theAllocator:
	:type theAllocator: BOPCol_BaseAllocator &
	:rtype: None
") BOPTools_ShapeSet;
		 BOPTools_ShapeSet (const BOPCol_BaseAllocator & theAllocator);
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	:param theS:
	:type theS: TopoDS_Shape &
	:rtype: None
") SetShape;
		void SetShape (const TopoDS_Shape & theS);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") Add;
		void Add (const BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "	:param theEdge:
	:type theEdge: TopoDS_Edge &
	:rtype: None
") AddEdge;
		void AddEdge (const TopoDS_Edge & theEdge);
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") AddEdges;
		void AddEdges (const BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") AddEdges;
		%feature("autodoc", "	:param theFace:
	:type theFace: TopoDS_Shape &
	:rtype: None
") AddEdges;
		void AddEdges (const TopoDS_Shape & theFace);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	:param theSet:
	:type theSet: BOPTools_ShapeSet &
	:rtype: None
") Subtract;
		void Subtract (const BOPTools_ShapeSet & theSet);
		%feature("compactdefaultargs") operator -=;
		%feature("autodoc", "	:param theSet:
	:type theSet: BOPTools_ShapeSet &
	:rtype: None
") operator -=;
		void operator -= (const BOPTools_ShapeSet & theSet);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:param theLS:
	:type theLS: BOPCol_ListOfShape &
	:rtype: None
") Get;
		void Get (BOPCol_ListOfShape & theLS);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param theSet:
	:type theSet: BOPTools_ShapeSet &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const BOPTools_ShapeSet & theSet);
};


%extend BOPTools_ShapeSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
