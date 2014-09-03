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
%module (package="OCC") BOPTools

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

%include BOPTools_headers.i

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
%nodefaultctor BOPTools;
class BOPTools {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	M(BOPCol_MapOfShape)

Returns:
	static void

No detailed docstring for this function.") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,BOPCol_MapOfShape & M);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	M(BOPCol_IndexedMapOfShape)

Returns:
	static void

No detailed docstring for this function.") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,BOPCol_IndexedMapOfShape & M);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	T(TopAbs_ShapeEnum)
	M(BOPCol_IndexedMapOfShape)

Returns:
	static void

No detailed docstring for this function.") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,const TopAbs_ShapeEnum T,BOPCol_IndexedMapOfShape & M);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)
	M(BOPCol_IndexedDataMapOfShapeListOfShape)

Returns:
	static void

No detailed docstring for this function.") MapShapesAndAncestors;
		static void MapShapesAndAncestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA,BOPCol_IndexedDataMapOfShapeListOfShape & M);
};


%feature("shadow") BOPTools::~BOPTools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_AlgoTools;
class BOPTools_AlgoTools {
	public:
		%feature("autodoc", "Args:
	aV1(TopoDS_Vertex)
	aP2(gp_Pnt)
	aTolP2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & aV1,const gp_Pnt & aP2,const Standard_Real aTolP2);
		%feature("autodoc", "Args:
	aV1(TopoDS_Vertex)
	aV2(TopoDS_Vertex)

Returns:
	static Standard_Integer

No detailed docstring for this function.") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2);
		%feature("autodoc", "Args:
	aLV(BOPCol_ListOfShape)
	aV(TopoDS_Vertex)

Returns:
	static void

No detailed docstring for this function.") MakeVertex;
		static void MakeVertex (BOPCol_ListOfShape & aLV,TopoDS_Vertex & aV);
		%feature("autodoc", "Args:
	theCurve(IntTools_Curve)
	theV1(TopoDS_Vertex)
	theT1(Standard_Real)
	theV2(TopoDS_Vertex)
	theT2(Standard_Real)
	theTolR3D(Standard_Real)
	theE(TopoDS_Edge)

Returns:
	static void

No detailed docstring for this function.") MakeEdge;
		static void MakeEdge (const IntTools_Curve & theCurve,const TopoDS_Vertex & theV1,const Standard_Real theT1,const TopoDS_Vertex & theV2,const Standard_Real theT2,const Standard_Real theTolR3D,TopoDS_Edge & theE);
		%feature("autodoc", "Args:
	theE(TopoDS_Edge)
	theF1(TopoDS_Face)
	theF2(TopoDS_Face)
	theCurve(IntTools_Curve)
	thePC1(Standard_Boolean)
	thePC2(Standard_Boolean)

Returns:
	static void

No detailed docstring for this function.") MakePCurve;
		static void MakePCurve (const TopoDS_Edge & theE,const TopoDS_Face & theF1,const TopoDS_Face & theF2,const IntTools_Curve & theCurve,const Standard_Boolean thePC1,const Standard_Boolean thePC2);
		%feature("autodoc", "Args:
	theType(TopAbs_ShapeEnum)
	theShape(TopoDS_Shape)

Returns:
	static void

No detailed docstring for this function.") MakeContainer;
		static void MakeContainer (const TopAbs_ShapeEnum theType,TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	aW(TopoDS_Shape)
	aF(TopoDS_Shape)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsHole;
		static Standard_Boolean IsHole (const TopoDS_Shape & aW,const TopoDS_Shape & aF);
		%feature("autodoc", "Args:
	theSplit(TopoDS_Shape)
	theShape(TopoDS_Shape)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

Returns True if the shape theSplit has opposite  
         direction than theShape  
         theContext - cashed geometrical tools") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Shape & theSplit,const TopoDS_Shape & theShape,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theSplit(TopoDS_Face)
	theShape(TopoDS_Face)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

Returns True if normal direction of the face  
         theShape is not the same as for the face  
         theSplit  
         theContext - cashed geometrical tools") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Face & theSplit,const TopoDS_Face & theShape,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	aE1(TopoDS_Edge)
	aE2(TopoDS_Edge)
	aContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Edge & aE1,const TopoDS_Edge & aE2,Handle_BOPInt_Context & aContext);
		%feature("autodoc", "Args:
	theF1(TopoDS_Face)
	theF2(TopoDS_Face)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") AreFacesSameDomain;
		static Standard_Boolean AreFacesSameDomain (const TopoDS_Face & theF1,const TopoDS_Face & theF2,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theF1(TopoDS_Face)
	theF2(TopoDS_Face)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") CheckSameGeom;
		static Standard_Boolean CheckSameGeom (const TopoDS_Face & theF1,const TopoDS_Face & theF2,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theF1(TopoDS_Face)
	theF2(TopoDS_Face)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Sense;
		static Standard_Integer Sense (const TopoDS_Face & theF1,const TopoDS_Face & theF2);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theFace(TopoDS_Face)
	theEdgeOff(TopoDS_Edge)

Returns:
	static Standard_Boolean

Returns True if the face theFace contains  
         the edge theEdge but with opposite orientation.  
         If the method  returns True theEdgeOff is the  
         edge founded") GetEdgeOff;
		static Standard_Boolean GetEdgeOff (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,TopoDS_Edge & theEdgeOff);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theFace(TopoDS_Face)
	theLCEF(BOPTools_ListOfCoupleOfShape)
	theFaceOff(TopoDS_Face)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

For the face theFace and its edge theEdge  
          finds the face suitable to produce shell.  
          theLCEF - set of faces to search. All faces  
          from theLCEF must share edge theEdge") GetFaceOff;
		static Standard_Boolean GetFaceOff (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,BOPTools_ListOfCoupleOfShape & theLCEF,TopoDS_Face & theFaceOff,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theEdge(TopoDS_Edge)
	theFace1(TopoDS_Face)
	theFace2(TopoDS_Face)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Integer

Returns True if the face theFace is inside of the  
         couple of faces theFace1, theFace2.  
         The faces theFace, theFace1, theFace2  must  
         share the edge theEdge") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,const TopoDS_Face & theFace1,const TopoDS_Face & theFace2,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theEdge(TopoDS_Edge)
	theLF(BOPCol_ListOfShape)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Integer

Returns True if the face theFace is inside of the  
         appropriate couple of faces (from the set theLF)    .  
         The faces of the set theLF and theFace  must  
         share the edge theEdge") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,BOPCol_ListOfShape & theLF,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theSolid(TopoDS_Solid)
	theMEF(BOPCol_IndexedDataMapOfShapeListOfShape)
	theTol(Standard_Real)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Integer

Returns True if the face theFace is inside the  
         solid theSolid.  
         theMEF - Map Edge/Faces for theSolid  
         theTol - value of precision of computation  
         theContext- cahed geometrical tools") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Solid & theSolid,BOPCol_IndexedDataMapOfShapeListOfShape & theMEF,const Standard_Real theTol,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theFace(TopoDS_Face)
	theEdgeOnF(TopoDS_Edge)

Returns:
	static Standard_Boolean

For the face theFace gets the edge theEdgeOnF  
         that is the same as theEdge  
         Returns True if such edge exists  
         Returns False if there is no such edge") GetEdgeOnFace;
		static Standard_Boolean GetEdgeOnFace (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,TopoDS_Edge & theEdgeOnF);
		%feature("autodoc", "Args:
	thePoint(gp_Pnt)
	theSolid(TopoDS_Solid)
	theTol(Standard_Real)
	theContext(Handle_BOPInt_Context)

Returns:
	static TopAbs_State

Computes the 3-D state of the point thePoint  
         toward solid theSolid.  
         theTol - value of precision of computation  
         theContext- cahed geometrical tools  
         Returns 3-D state.") ComputeState;
		static TopAbs_State ComputeState (const gp_Pnt & thePoint,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theVertex(TopoDS_Vertex)
	theSolid(TopoDS_Solid)
	theTol(Standard_Real)
	theContext(Handle_BOPInt_Context)

Returns:
	static TopAbs_State

Computes the 3-D state of the vertex theVertex  
         toward solid theSolid.  
         theTol - value of precision of computation  
         theContext- cahed geometrical tools  
         Returns 3-D state.") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Vertex & theVertex,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theSolid(TopoDS_Solid)
	theTol(Standard_Real)
	theContext(Handle_BOPInt_Context)

Returns:
	static TopAbs_State

Computes the 3-D state of the edge theEdge  
         toward solid theSolid.  
         theTol - value of precision of computation  
         theContext- cahed geometrical tools  
         Returns 3-D state.") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Edge & theEdge,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theFace(TopoDS_Face)
	theSolid(TopoDS_Solid)
	theTol(Standard_Real)
	theBounds(BOPCol_IndexedMapOfShape)
	theContext(Handle_BOPInt_Context)

Returns:
	static TopAbs_State

Computes the 3-D state of the face theFace  
         toward solid theSolid.  
         theTol - value of precision of computation  
         theBounds - set of edges of theFace to avoid  
         theContext- cahed geometrical tools  
         Returns 3-D state.") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Face & theFace,const TopoDS_Solid & theSolid,const Standard_Real theTol,BOPCol_IndexedMapOfShape & theBounds,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	theSolid(TopoDS_Solid)
	theTol(Standard_Real)
	theContext(Handle_BOPInt_Context)

Returns:
	static TopAbs_State

Computes the 3-D state of the shape theShape  
         toward solid theSolid.  
         theTol - value of precision of computation  
         theContext- cahed geometrical tools  
         Returns 3-D state.") ComputeStateByOnePoint;
		static TopAbs_State ComputeStateByOnePoint (const TopoDS_Shape & theShape,const TopoDS_Solid & theSolid,const Standard_Real theTol,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theLS(BOPCol_ListOfShape)
	theMapAvoid(BOPCol_IndexedMapOfShape)
	theLSCB(BOPCol_ListOfShape)
	theAllocator(BOPCol_BaseAllocator)

Returns:
	static void

For the list of faces theLS build block  
         theLSCB in terms of connexity by edges  
         theMapAvoid - set of edges to avoid for  
         the treatment") MakeConnexityBlock;
		static void MakeConnexityBlock (BOPCol_ListOfShape & theLS,BOPCol_IndexedMapOfShape & theMapAvoid,BOPCol_ListOfShape & theLSCB,const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	theType1(TopAbs_ShapeEnum)
	theType2(TopAbs_ShapeEnum)
	theLCB(BOPCol_ListOfShape)

Returns:
	static void

For the compound theS build the blocks  
         theLCB (as list of compounds)  
         in terms of connexity by the shapes of theType") MakeConnexityBlocks;
		static void MakeConnexityBlocks (const TopoDS_Shape & theS,const TopAbs_ShapeEnum theType1,const TopAbs_ShapeEnum theType2,BOPCol_ListOfShape & theLCB);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	static void

No detailed docstring for this function.") OrientFacesOnShell;
		static void OrientFacesOnShell (TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	theTolMax(Standard_Real)=0.0001

Returns:
	static void

Provides valid values of tolerances for the shape <theS>  
<theTolMax> is max value of the tolerance that can be  
accepted for correction.  If real value of the tolerance  
will be greater than  <aTolMax>, the correction does not  
perform.") CorrectTolerances;
		static void CorrectTolerances (const TopoDS_Shape & theS,const Standard_Real theTolMax = 0.0001);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	theTolMax(Standard_Real)=0.0001

Returns:
	static void

Provides valid values of tolerances for the shape <theS>  
in  terms of BRepCheck_InvalidCurveOnSurface.") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface (const TopoDS_Shape & theS,const Standard_Real theTolMax = 0.0001);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	theTolMax(Standard_Real)=0.0001

Returns:
	static void

Provides valid values of tolerances for the shape <theS>  
in  terms of BRepCheck_InvalidPointOnCurve.") CorrectPointOnCurve;
		static void CorrectPointOnCurve (const TopoDS_Shape & theS,const Standard_Real theTolMax = 0.0001);
		%feature("autodoc", "Args:
	aP1(gp_Pnt)
	aTol(Standard_Real)
	aNewVertex(TopoDS_Vertex)

Returns:
	static void

Make a vertex using 3D-point <aP1> and 3D-tolerance value <aTol>") MakeNewVertex;
		static void MakeNewVertex (const gp_Pnt & aP1,const Standard_Real aTol,TopoDS_Vertex & aNewVertex);
		%feature("autodoc", "Args:
	aV1(TopoDS_Vertex)
	aV2(TopoDS_Vertex)
	aNewVertex(TopoDS_Vertex)

Returns:
	static void

Make a vertex using couple of vertices  <aV1, aV2>") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2,TopoDS_Vertex & aNewVertex);
		%feature("autodoc", "Args:
	aE1(TopoDS_Edge)
	aP1(Standard_Real)
	aE2(TopoDS_Edge)
	aP2(Standard_Real)
	aNewVertex(TopoDS_Vertex)

Returns:
	static void

Make a vertex in place of intersection between two edges  
<aE1, aE2> with parameters <aP1, aP2>") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Edge & aE1,const Standard_Real aP1,const TopoDS_Edge & aE2,const Standard_Real aP2,TopoDS_Vertex & aNewVertex);
		%feature("autodoc", "Args:
	aE1(TopoDS_Edge)
	aP1(Standard_Real)
	aF2(TopoDS_Face)
	aNewVertex(TopoDS_Vertex)

Returns:
	static void

Make a vertex in place of intersection between the edge <aE1>  
with parameter <aP1> and the face <aF2>") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Edge & aE1,const Standard_Real aP1,const TopoDS_Face & aF2,TopoDS_Vertex & aNewVertex);
		%feature("autodoc", "Args:
	aEdge(TopoDS_Edge)
	aPrm(Standard_Real)
	aP(gp_Pnt)

Returns:
	static void

Compute a 3D-point on the edge <aEdge> at parameter <aPrm>") PointOnEdge;
		static void PointOnEdge (const TopoDS_Edge & aEdge,const Standard_Real aPrm,gp_Pnt & aP);
		%feature("autodoc", "Args:
	aE1(TopoDS_Edge)
	aV1(TopoDS_Vertex)
	aP1(Standard_Real)
	aV2(TopoDS_Vertex)
	aP2(Standard_Real)
	aNewEdge(TopoDS_Edge)

Returns:
	static void

Make the edge from base edge <aE1> and two vertices <aV1,aV2>  
at parameters <aP1,aP2>") MakeSplitEdge;
		static void MakeSplitEdge (const TopoDS_Edge & aE1,const TopoDS_Vertex & aV1,const Standard_Real aP1,const TopoDS_Vertex & aV2,const Standard_Real aP2,TopoDS_Edge & aNewEdge);
		%feature("autodoc", "Args:
	aIC(IntTools_Curve)
	aV1(TopoDS_Vertex)
	aP1(Standard_Real)
	aV2(TopoDS_Vertex)
	aP2(Standard_Real)
	aNewEdge(TopoDS_Edge)

Returns:
	static void

Make the edge from 3D-Curve <aIC>  and two vertices <aV1,aV2>  
at parameters <aP1,aP2>") MakeSectEdge;
		static void MakeSectEdge (const IntTools_Curve & aIC,const TopoDS_Vertex & aV1,const Standard_Real aP1,const TopoDS_Vertex & aV2,const Standard_Real aP2,TopoDS_Edge & aNewEdge);
		%feature("autodoc", "Args:
	aIC(IntTools_Curve)
	aT(Standard_Real)
	aV(TopoDS_Vertex)

Returns:
	static void

Update the tolerance value for vertex  <aV>  
taking into account the fact that <aV> lays on  
the curve <aIC>") UpdateVertex;
		static void UpdateVertex (const IntTools_Curve & aIC,const Standard_Real aT,const TopoDS_Vertex & aV);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aT(Standard_Real)
	aV(TopoDS_Vertex)

Returns:
	static void

Update the tolerance value for vertex  <aV>  
taking into account the fact that <aV> lays on  
the edge <aE>") UpdateVertex;
		static void UpdateVertex (const TopoDS_Edge & aE,const Standard_Real aT,const TopoDS_Vertex & aV);
		%feature("autodoc", "Args:
	aVF(TopoDS_Vertex)
	aVN(TopoDS_Vertex)

Returns:
	static void

Update the tolerance value for vertex  <aVN>  
taking into account the fact that <aVN> should  
cover tolerance zone of <aVF>") UpdateVertex;
		static void UpdateVertex (const TopoDS_Vertex & aVF,const TopoDS_Vertex & aVN);
		%feature("autodoc", "Args:
	aE1(TopoDS_Edge)
	aE2(TopoDS_Edge)
	aSR(IntTools_Range)
	aNewSR(IntTools_Range)

Returns:
	static void

Correct shrunk range <aSR> taking into account 3D-curve  
resolution and corresp. tolerances' values of <aE1>, <aE2>") CorrectRange;
		static void CorrectRange (const TopoDS_Edge & aE1,const TopoDS_Edge & aE2,const IntTools_Range & aSR,IntTools_Range & aNewSR);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aSR(IntTools_Range)
	aNewSR(IntTools_Range)

Returns:
	static void

Correct shrunk range <aSR> taking into account 3D-curve  
resolution and corresp. tolerances' values of <aE>, <aF>") CorrectRange;
		static void CorrectRange (const TopoDS_Edge & aE,const TopoDS_Face & aF,const IntTools_Range & aSR,IntTools_Range & aNewSR);
		%feature("autodoc", "Args:
	aShR(IntTools_Range)
	aF(TopoDS_Face)
	aE(TopoDS_Edge)
	aContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

Returns TRUE if PaveBlock <aPB> lays on the face <aF>, i.e  
the <PB> is IN or ON in 2D of <aF>") IsBlockInOnFace;
		static Standard_Boolean IsBlockInOnFace (const IntTools_Range & aShR,const TopoDS_Face & aF,const TopoDS_Edge & aE,Handle_BOPInt_Context & aContext);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Boolean

Checks if it is possible to compute shrunk range for the edge <aE>.") IsMicroEdge;
		static Standard_Boolean IsMicroEdge (const TopoDS_Edge & theEdge,const Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	static void

Corrects tolerance values of the sub-shapes of the shape <theS> if needed.") CorrectShapeTolerances;
		static void CorrectShapeTolerances (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	static Standard_Integer

Retutns dimension of the shape <theS>.") Dimension;
		static Standard_Integer Dimension (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	theShell(TopoDS_Shell)

Returns:
	static Standard_Boolean

Returns true if the  shell <theShell> is open") IsOpenShell;
		static Standard_Boolean IsOpenShell (const TopoDS_Shell & theShell);
		%feature("autodoc", "Args:
	theSolid(TopoDS_Solid)

Returns:
	static Standard_Boolean

Returns true if the solid <theSolid> is inverted") IsInvertedSolid;
		static Standard_Boolean IsInvertedSolid (const TopoDS_Solid & theSolid);
};


%feature("shadow") BOPTools_AlgoTools::~BOPTools_AlgoTools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_AlgoTools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_AlgoTools2D;
class BOPTools_AlgoTools2D {
	public:
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)

Returns:
	static void

Compute P-Curve for the edge <aE> on the face <aF>") BuildPCurveForEdgeOnFace;
		static void BuildPCurveForEdgeOnFace (const TopoDS_Edge & aE,const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)
	aT(Standard_Real)
	Tau(gp_Vec)

Returns:
	static Standard_Boolean

Compute tangent for the edge  <aE> [in 3D]  at parameter <aT>") EdgeTangent;
		static Standard_Boolean EdgeTangent (const TopoDS_Edge & anE,const Standard_Real aT,gp_Vec & Tau);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aT(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static void

Compute surface parameters <U,V> of the face <aF>  
for  the point from the edge <aE> at parameter <aT>.") PointOnSurface;
		static void PointOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aC(Handle_Geom2d_Curve)
	aFirst(Standard_Real)
	aLast(Standard_Real)
	aToler(Standard_Real)

Returns:
	static Standard_Boolean

Returns TRUE if the edge <aE>  has  P-Curve <aC>  
on surface <aF> .  
[aFirst, aLast] - range of the P-Curve  
[aToler] - reached tolerance  
If the P-Curve does not exist, aC.IsNull()=TRUE.") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF,Handle_Geom2d_Curve & aC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns TRUE if the edge <aE>  has  P-Curve <aC>  
on surface <aF> .  
If the P-Curve does not exist, aC.IsNull()=TRUE.") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	C3D(Handle_Geom_Curve)
	aC2D(Handle_Geom2d_Curve)
	aC2DA(Handle_Geom2d_Curve)

Returns:
	static void

Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> .") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace (const TopoDS_Face & aF,const Handle_Geom_Curve & C3D,const Handle_Geom2d_Curve & aC2D,Handle_Geom2d_Curve & aC2DA);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	aT1(Standard_Real)
	aT2(Standard_Real)
	aC2D(Handle_Geom2d_Curve)
	aC2DA(Handle_Geom2d_Curve)

Returns:
	static void

Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> .  
[aT1,  aT2] - range to adjust") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace (const TopoDS_Face & aF,const Standard_Real aT1,const Standard_Real aT2,const Handle_Geom2d_Curve & aC2D,Handle_Geom2d_Curve & aC2DA);
		%feature("autodoc", "Args:
	aFirst(Standard_Real)
	aLast(Standard_Real)

Returns:
	static Standard_Real

Compute intermediate  value in  between [aFirst, aLast] .") IntermediatePoint;
		static Standard_Real IntermediatePoint (const Standard_Real aFirst,const Standard_Real aLast);
		%feature("autodoc", "Args:
	anE(TopoDS_Edge)

Returns:
	static Standard_Real

Compute intermediate value of parameter for the edge <anE>.") IntermediatePoint;
		static Standard_Real IntermediatePoint (const TopoDS_Edge & anE);
		%feature("autodoc", "Args:
	theE(TopoDS_Edge)
	theF(TopoDS_Face)

Returns:
	static void

No detailed docstring for this function.") BuildPCurveForEdgeOnPlane;
		static void BuildPCurveForEdgeOnPlane (const TopoDS_Edge & theE,const TopoDS_Face & theF);
		%feature("autodoc", "Args:
	theLE(BOPCol_ListOfShape)
	theF(TopoDS_Face)

Returns:
	static void

No detailed docstring for this function.") BuildPCurveForEdgesOnPlane;
		static void BuildPCurveForEdgesOnPlane (const BOPCol_ListOfShape & theLE,const TopoDS_Face & theF);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aC(Handle_Geom2d_Curve)
	aFirst(Standard_Real)
	aLast(Standard_Real)
	aToler(Standard_Real)

Returns:
	static void

Make P-Curve <aC> for the edge <aE> on surface <aF> .  
[aFirst, aLast] - range of the P-Curve  
[aToler] - reached tolerance") Make2D;
		static void Make2D (const TopoDS_Edge & aE,const TopoDS_Face & aF,Handle_Geom2d_Curve & aC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	C3D(Handle_Geom_Curve)
	aC(Handle_Geom2d_Curve)
	aToler(Standard_Real)

Returns:
	static void

Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> .  
[aToler] - reached tolerance") MakePCurveOnFace;
		static void MakePCurveOnFace (const TopoDS_Face & aF,const Handle_Geom_Curve & C3D,Handle_Geom2d_Curve & aC,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	aF(TopoDS_Face)
	C3D(Handle_Geom_Curve)
	aT1(Standard_Real)
	aT2(Standard_Real)
	aC(Handle_Geom2d_Curve)
	aToler(Standard_Real)

Returns:
	static void

Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> .  
[aT1,  aT2] - range to build  
[aToler] - reached tolerance") MakePCurveOnFace;
		static void MakePCurveOnFace (const TopoDS_Face & aF,const Handle_Geom_Curve & C3D,const Standard_Real aT1,const Standard_Real aT2,Handle_Geom2d_Curve & aC,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	PC(ProjLib_ProjectedCurve)
	aC(Handle_Geom2d_Curve)

Returns:
	static void

Make empty  P-Curve <aC> of relevant to <PC> type") MakePCurveOfType;
		static void MakePCurveOfType (const ProjLib_ProjectedCurve & PC,Handle_Geom2d_Curve & aC);
};


%feature("shadow") BOPTools_AlgoTools2D::~BOPTools_AlgoTools2D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_AlgoTools2D {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_AlgoTools3D;
class BOPTools_AlgoTools3D {
	public:
		%feature("autodoc", "Args:
	aSp(TopoDS_Edge)
	aF(TopoDS_Face)

Returns:
	static void

Make the edge <aSp> seam edge for the face <aF>") DoSplitSEAMOnFace;
		static void DoSplitSEAMOnFace (const TopoDS_Edge & aSp,const TopoDS_Face & aF);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aT(Standard_Real)
	aD(gp_Dir)

Returns:
	static void

Computes normal to the face <aF> for the point on the edge <aE>  
at parameter <aT>") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Dir & aD);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aD(gp_Dir)

Returns:
	static void

Computes normal to the face <aF> for the point on the edge <aE>  
at arbitrary intermediate parameter") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,gp_Dir & aD);
		%feature("autodoc", "Args:
	aNF1(gp_Dir)
	aNF2(gp_Dir)

Returns:
	static Standard_Integer

Returns 1  if scalar product aNF1* aNF2>0.  
Returns 0  if directions aNF1 aNF2 coinside  
Returns -1 if scalar product aNF1* aNF2<0.") SenseFlag;
		static Standard_Integer SenseFlag (const gp_Dir & aNF1,const gp_Dir & aNF2);
		%feature("autodoc", "Args:
	aS(Handle_Geom_Surface)
	U(Standard_Real)
	V(Standard_Real)
	aD(gp_Dir)

Returns:
	static Standard_Boolean

Compute normal <aD> to surface <aS> in point (U,V)  
Returns TRUE if directions aD1U, aD1V coinside") GetNormalToSurface;
		static Standard_Boolean GetNormalToSurface (const Handle_Geom_Surface & aS,const Standard_Real U,const Standard_Real V,gp_Dir & aD);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aT(Standard_Real)
	aPx(gp_Pnt)
	aD(gp_Dir)
	theContext(Handle_BOPInt_Context)

Returns:
	static void

Computes normal to the face <aF> for the 3D-point that  
belonds to the edge <aE> at parameter <aT>.  
 Output:  
aPx  -  the 3D-point where the normal computed  
aD   -  the normal;  
 
 Warning:  
The normal is computed not exactly in the point on the  
edge, but in point that is near to the edge towards to  
the face material (so, we'll have approx. normal)") GetApproxNormalToFaceOnEdge;
		static void GetApproxNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Pnt & aPx,gp_Dir & aD,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	theE(TopoDS_Edge)
	theF(TopoDS_Face)
	aT(Standard_Real)
	aP(gp_Pnt)
	aDNF(gp_Dir)
	aDt2D(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") GetApproxNormalToFaceOnEdge;
		static void GetApproxNormalToFaceOnEdge (const TopoDS_Edge & theE,const TopoDS_Face & theF,const Standard_Real aT,gp_Pnt & aP,gp_Dir & aDNF,const Standard_Real aDt2D);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aT(Standard_Real)
	aDt2D(Standard_Real)
	aP2D(gp_Pnt2d)
	aPx(gp_Pnt)

Returns:
	static void

Compute the point <aPx>,  (<aP2D>)  that is near to  
the edge <aE>   at parameter <aT>  towards to the  
material of the face <aF>. The value of shifting in  
2D is <aDt2D>") PointNearEdge;
		static void PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,const Standard_Real aDt2D,gp_Pnt2d & aP2D,gp_Pnt & aPx);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aT(Standard_Real)
	aP2D(gp_Pnt2d)
	aPx(gp_Pnt)
	theContext(Handle_BOPInt_Context)

Returns:
	static void

Computes the point <aPx>,  (<aP2D>)  that is near to  
the edge <aE>   at parameter <aT>  towards to the  
material of the face <aF>. The value of shifting in  
 2D is  dt2D=BOPTools_AlgoTools3D::MinStepIn2d()") PointNearEdge;
		static void PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Pnt2d & aP2D,gp_Pnt & aPx,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aP2D(gp_Pnt2d)
	aPx(gp_Pnt)
	theContext(Handle_BOPInt_Context)

Returns:
	static void

Compute the point <aPx>,  (<aP2D>)  that is near to  
the edge <aE>   at arbitrary  parameter  towards to the  
material of the face <aF>. The value of shifting in  
 2D is  dt2D=BOPTools_AlgoTools3D::MinStepIn2d()") PointNearEdge;
		static void PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,gp_Pnt2d & aP2D,gp_Pnt & aPx,Handle_BOPInt_Context & theContext);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Real

Returns simple step value that is used in 2D-computations  
= 1.e-5") MinStepIn2d;
		static Standard_Real MinStepIn2d ();
		%feature("autodoc", "Args:
	aS(TopoDS_Shape)

Returns:
	static Standard_Boolean

Returns TRUE if the shape <aS> does not contain  
geometry information  (e.g. empty compound)") IsEmptyShape;
		static Standard_Boolean IsEmptyShape (const TopoDS_Shape & aS);
		%feature("autodoc", "Args:
	aE(TopoDS_Edge)
	aF(TopoDS_Face)
	aER(TopoDS_Edge)

Returns:
	static void

Get the edge <aER> from the face <aF> that is the same as  
the edge <aE>") OrientEdgeOnFace;
		static void OrientEdgeOnFace (const TopoDS_Edge & aE,const TopoDS_Face & aF,TopoDS_Edge & aER);
		%feature("autodoc", "Args:
	theF(TopoDS_Face)
	theP(gp_Pnt)
	theP2D(gp_Pnt2d)
	theContext(Handle_BOPInt_Context)

Returns:
	static Standard_Integer

Computes a point <theP> inside the face <theF>.    
         <theP2D> -  2D  representation of <theP>    
         on the surface of <theF>    
         Returns 0 in case of success.") PointInFace;
		static Standard_Integer PointInFace (const TopoDS_Face & theF,gp_Pnt & theP,gp_Pnt2d & theP2D,Handle_BOPInt_Context & theContext);
};


%feature("shadow") BOPTools_AlgoTools3D::~BOPTools_AlgoTools3D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_AlgoTools3D {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_ConnexityBlock;
class BOPTools_ConnexityBlock {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock ();
		%feature("autodoc", "Args:
	theAllocator(Handle_NCollection_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock (const Handle_NCollection_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfShape

No detailed docstring for this function.") Shapes;
		const BOPCol_ListOfShape & Shapes ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfShape

No detailed docstring for this function.") ChangeShapes;
		BOPCol_ListOfShape & ChangeShapes ();
		%feature("autodoc", "Args:
	theFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetRegular;
		void SetRegular (const Standard_Boolean theFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsRegular;
		Standard_Boolean IsRegular ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfShape

No detailed docstring for this function.") Loops;
		const BOPCol_ListOfShape & Loops ();
		%feature("autodoc", "Args:
	None
Returns:
	BOPCol_ListOfShape

No detailed docstring for this function.") ChangeLoops;
		BOPCol_ListOfShape & ChangeLoops ();
};


%feature("shadow") BOPTools_ConnexityBlock::~BOPTools_ConnexityBlock %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_ConnexityBlock {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_CoupleOfShape;
class BOPTools_CoupleOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPTools_CoupleOfShape;
		 BOPTools_CoupleOfShape ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetShape1;
		void SetShape1 (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape1;
		const TopoDS_Shape & Shape1 ();
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetShape2;
		void SetShape2 (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape2;
		const TopoDS_Shape & Shape2 ();
};


%feature("shadow") BOPTools_CoupleOfShape::~BOPTools_CoupleOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_CoupleOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_EdgeSet;
class BOPTools_EdgeSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPTools_EdgeSet;
		 BOPTools_EdgeSet ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BOPTools_EdgeSet;
		 BOPTools_EdgeSet (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetShape;
		void SetShape (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") AddEdge;
		void AddEdge (const TopoDS_Edge & theEdge);
		%feature("autodoc", "Args:
	theLS(BOPCol_ListOfShape)

Returns:
	None

No detailed docstring for this function.") AddEdges;
		void AddEdges (const BOPCol_ListOfShape & theLS);
		%feature("autodoc", "Args:
	theFace(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddEdges;
		void AddEdges (const TopoDS_Shape & theFace);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	theLS(BOPCol_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Get;
		void Get (BOPCol_ListOfShape & theLS);
		%feature("autodoc", "Args:
	theSet(BOPTools_EdgeSet)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const BOPTools_EdgeSet & theSet);
};


%feature("shadow") BOPTools_EdgeSet::~BOPTools_EdgeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_EdgeSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_Set;
class BOPTools_Set {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPTools_Set;
		 BOPTools_Set ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BOPTools_Set;
		 BOPTools_Set (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	Other(BOPTools_Set)

Returns:
	BOPTools_Set

No detailed docstring for this function.") Assign;
		BOPTools_Set & Assign (const BOPTools_Set & Other);
		%feature("autodoc", "Args:
	Other(BOPTools_Set)

Returns:
	BOPTools_Set

No detailed docstring for this function.") operator=;
		BOPTools_Set & operator = (const BOPTools_Set & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)
	theType(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & theS,const TopAbs_ShapeEnum theType);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	aOther(BOPTools_Set)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEqual;
		Standard_Boolean IsEqual (const BOPTools_Set & aOther);
		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);
};


%feature("shadow") BOPTools_Set::~BOPTools_Set %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_Set {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_SetMapHasher;
class BOPTools_SetMapHasher {
	public:
		%feature("autodoc", "Args:
	aSet(BOPTools_Set)
	Upper(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") HashCode;
		static Standard_Integer HashCode (const BOPTools_Set & aSet,const Standard_Integer Upper);
		%feature("autodoc", "Args:
	aSet1(BOPTools_Set)
	aSet2(BOPTools_Set)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsEqual;
		static Standard_Boolean IsEqual (const BOPTools_Set & aSet1,const BOPTools_Set & aSet2);
};


%feature("shadow") BOPTools_SetMapHasher::~BOPTools_SetMapHasher %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_SetMapHasher {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BOPTools_ShapeSet;
class BOPTools_ShapeSet {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BOPTools_ShapeSet;
		 BOPTools_ShapeSet ();
		%feature("autodoc", "Args:
	theAllocator(BOPCol_BaseAllocator)

Returns:
	None

No detailed docstring for this function.") BOPTools_ShapeSet;
		 BOPTools_ShapeSet (const BOPCol_BaseAllocator & theAllocator);
		%feature("autodoc", "Args:
	theS(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") SetShape;
		void SetShape (const TopoDS_Shape & theS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	theLS(BOPCol_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const BOPCol_ListOfShape & theLS);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & theShape);
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	theType(TopAbs_ShapeEnum)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theType);
		%feature("autodoc", "Args:
	theEdge(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") AddEdge;
		void AddEdge (const TopoDS_Edge & theEdge);
		%feature("autodoc", "Args:
	theLS(BOPCol_ListOfShape)

Returns:
	None

No detailed docstring for this function.") AddEdges;
		void AddEdges (const BOPCol_ListOfShape & theLS);
		%feature("autodoc", "Args:
	theFace(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddEdges;
		void AddEdges (const TopoDS_Shape & theFace);
		%feature("autodoc", "Args:
	theSet(BOPTools_ShapeSet)

Returns:
	None

No detailed docstring for this function.") Subtract;
		void Subtract (const BOPTools_ShapeSet & theSet);
		%feature("autodoc", "Args:
	theSet(BOPTools_ShapeSet)

Returns:
	None

No detailed docstring for this function.") operator-=;
		void operator -= (const BOPTools_ShapeSet & theSet);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	theLS(BOPCol_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Get;
		void Get (BOPCol_ListOfShape & theLS);
		%feature("autodoc", "Args:
	theSet(BOPTools_ShapeSet)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Contains;
		Standard_Boolean Contains (const BOPTools_ShapeSet & theSet);
};


%feature("shadow") BOPTools_ShapeSet::~BOPTools_ShapeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BOPTools_ShapeSet {
	void _kill_pointed() {
		delete $self;
	}
};
