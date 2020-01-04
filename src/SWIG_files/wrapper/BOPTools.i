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
%define BOPTOOLSDOCSTRING
"BOPTools module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_boptools.html"
%enddef
%module (package="OCC.Core", docstring=BOPTOOLSDOCSTRING) BOPTools


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
#include<BOPTools_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<IntTools_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Extrema_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<IntPatch_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import IntTools.i
%import gp.i
%import TopAbs.i
%import TopTools.i
%import Message.i
%import Geom.i
%import Geom2d.i
%import BRepAdaptor.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(BOPTools_ListOfConnexityBlock) NCollection_List <BOPTools_ConnexityBlock>;
%template(BOPTools_MapOfSet) NCollection_Map <BOPTools_Set , BOPTools_SetMapHasher>;
%template(BOPTools_ListOfCoupleOfShape) NCollection_List <BOPTools_CoupleOfShape>;
%template(BOPTools_IndexedDataMapOfSetShape) NCollection_IndexedDataMap <BOPTools_Set , TopoDS_Shape , BOPTools_SetMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <BOPTools_ConnexityBlock> BOPTools_ListOfConnexityBlock;
typedef BOPTools_ListOfConnexityBlock::Iterator BOPTools_ListIteratorOfListOfConnexityBlock;
typedef BOPTools_BoxSet <Standard_Real , 2 , Standard_Integer> BOPTools_Box2dTree;
typedef BOPTools_BoxSelector <2> BOPTools_Box2dTreeSelector;
typedef BOPTools_PairSelector <2> BOPTools_Box2dPairSelector;
typedef BOPTools_BoxSet <Standard_Real , 3 , Standard_Integer> BOPTools_BoxTree;
typedef BOPTools_BoxSelector <3> BOPTools_BoxTreeSelector;
typedef BOPTools_PairSelector <3> BOPTools_BoxPairSelector;
typedef NCollection_Map <BOPTools_Set , BOPTools_SetMapHasher> BOPTools_MapOfSet;
typedef BOPTools_MapOfSet::Iterator BOPTools_MapIteratorOfMapOfSet;
typedef NCollection_List <BOPTools_CoupleOfShape> BOPTools_ListOfCoupleOfShape;
typedef BOPTools_ListOfCoupleOfShape::Iterator BOPTools_ListIteratorOfListOfCoupleOfShape;
typedef NCollection_IndexedDataMap <BOPTools_Set , TopoDS_Shape , BOPTools_SetMapHasher> BOPTools_IndexedDataMapOfSetShape;
/* end typedefs declaration */

/***************************
* class BOPTools_AlgoTools *
***************************/
class BOPTools_AlgoTools {
	public:
		/****************** AreFacesSameDomain ******************/
		%feature("compactdefaultargs") AreFacesSameDomain;
		%feature("autodoc", "* Checking if the faces are coinciding Checks if the given faces are same-domain, i.e. coincide.
	:param theF1:
	:type theF1: TopoDS_Face
	:param theF2:
	:type theF2: TopoDS_Face
	:param theContext:
	:type theContext: IntTools_Context
	:param theFuzz: default value is Precision::Confusion()
	:type theFuzz: float
	:rtype: bool") AreFacesSameDomain;
		static Standard_Boolean AreFacesSameDomain (const TopoDS_Face & theF1,const TopoDS_Face & theF2,const opencascade::handle<IntTools_Context> & theContext,const Standard_Real theFuzz = Precision::Confusion());

		/****************** ComputeState ******************/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "* @name Point/Edge/Face classification relatively solid Computes the 3-D state of the point thePoint toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: TopAbs_State") ComputeState;
		static TopAbs_State ComputeState (const gp_Pnt & thePoint,const TopoDS_Solid & theSolid,const Standard_Real theTol,const opencascade::handle<IntTools_Context> & theContext);

		/****************** ComputeState ******************/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "* Computes the 3-D state of the vertex theVertex toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.
	:param theVertex:
	:type theVertex: TopoDS_Vertex
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: TopAbs_State") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Vertex & theVertex,const TopoDS_Solid & theSolid,const Standard_Real theTol,const opencascade::handle<IntTools_Context> & theContext);

		/****************** ComputeState ******************/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "* Computes the 3-D state of the edge theEdge toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: TopAbs_State") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Edge & theEdge,const TopoDS_Solid & theSolid,const Standard_Real theTol,const opencascade::handle<IntTools_Context> & theContext);

		/****************** ComputeState ******************/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "* Computes the 3-D state of the face theFace toward solid theSolid. theTol - value of precision of computation theBounds - set of edges of <theSolid> to avoid theContext- cahed geometrical tools Returns 3-D state.
	:param theFace:
	:type theFace: TopoDS_Face
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:param theTol:
	:type theTol: float
	:param theBounds:
	:type theBounds: TopTools_IndexedMapOfShape
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: TopAbs_State") ComputeState;
		static TopAbs_State ComputeState (const TopoDS_Face & theFace,const TopoDS_Solid & theSolid,const Standard_Real theTol,const TopTools_IndexedMapOfShape & theBounds,const opencascade::handle<IntTools_Context> & theContext);

		/****************** ComputeStateByOnePoint ******************/
		%feature("compactdefaultargs") ComputeStateByOnePoint;
		%feature("autodoc", "* Computes the 3-D state of the shape theShape toward solid theSolid. theTol - value of precision of computation theContext- cahed geometrical tools Returns 3-D state.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: TopAbs_State") ComputeStateByOnePoint;
		static TopAbs_State ComputeStateByOnePoint (const TopoDS_Shape & theShape,const TopoDS_Solid & theSolid,const Standard_Real theTol,const opencascade::handle<IntTools_Context> & theContext);

		/****************** ComputeTolerance ******************/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "* @name Edge/Face Deviation computation Computes the necessary value of the tolerance for the edge
	:param theFace:
	:type theFace: TopoDS_Face
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theMaxDist:
	:type theMaxDist: float
	:param theMaxPar:
	:type theMaxPar: float
	:rtype: bool") ComputeTolerance;
		static Standard_Boolean ComputeTolerance (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ComputeVV ******************/
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "* @name Intersection of the vertices Intersects the vertex <theV1> with the point <theP> with tolerance <theTolP>. Returns the error status: - 0 - no error, meaning that the vertex intersects the point; - 1 - the distance between vertex and point is grater than the sum of tolerances.
	:param theV:
	:type theV: TopoDS_Vertex
	:param theP:
	:type theP: gp_Pnt
	:param theTolP:
	:type theTolP: float
	:rtype: int") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & theV,const gp_Pnt & theP,const Standard_Real theTolP);

		/****************** ComputeVV ******************/
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "* Intersects the given vertices with given fuzzy value. Returns the error status: - 0 - no error, meaning that the vertices interferes with given tolerance; - 1 - the distance between vertices is grater than the sum of their tolerances.
	:param theV1:
	:type theV1: TopoDS_Vertex
	:param theV2:
	:type theV2: TopoDS_Vertex
	:param theFuzz: default value is Precision::Confusion()
	:type theFuzz: float
	:rtype: int") ComputeVV;
		static Standard_Integer ComputeVV (const TopoDS_Vertex & theV1,const TopoDS_Vertex & theV2,const Standard_Real theFuzz = Precision::Confusion());

		/****************** CopyEdge ******************/
		%feature("compactdefaultargs") CopyEdge;
		%feature("autodoc", "* Makes a copy of <theEdge> with vertices.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: TopoDS_Edge") CopyEdge;
		static TopoDS_Edge CopyEdge (const TopoDS_Edge & theEdge);

		/****************** CorrectCurveOnSurface ******************/
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", "* Provides valid values of tolerances for the shape <theS> in terms of BRepCheck_InvalidCurveOnSurface.
	:param theS:
	:type theS: TopoDS_Shape
	:param theMapToAvoid:
	:type theMapToAvoid: TopTools_IndexedMapOfShape
	:param theTolMax: default value is 0.0001
	:type theTolMax: float
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface (const TopoDS_Shape & theS,const TopTools_IndexedMapOfShape & theMapToAvoid,const Standard_Real theTolMax = 0.0001,const Standard_Boolean theRunParallel = Standard_False);

		/****************** CorrectPointOnCurve ******************/
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", "* Provides valid values of tolerances for the shape <theS> in terms of BRepCheck_InvalidPointOnCurve.
	:param theS:
	:type theS: TopoDS_Shape
	:param theMapToAvoid:
	:type theMapToAvoid: TopTools_IndexedMapOfShape
	:param theTolMax: default value is 0.0001
	:type theTolMax: float
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void") CorrectPointOnCurve;
		static void CorrectPointOnCurve (const TopoDS_Shape & theS,const TopTools_IndexedMapOfShape & theMapToAvoid,const Standard_Real theTolMax = 0.0001,const Standard_Boolean theRunParallel = Standard_False);

		/****************** CorrectRange ******************/
		%feature("compactdefaultargs") CorrectRange;
		%feature("autodoc", "* @name Correction of the edges range Correct shrunk range <aSR> taking into account 3D-curve resolution and corresponding tolerance values of <aE1>, <aE2>
	:param aE1:
	:type aE1: TopoDS_Edge
	:param aE2:
	:type aE2: TopoDS_Edge
	:param aSR:
	:type aSR: IntTools_Range
	:param aNewSR:
	:type aNewSR: IntTools_Range
	:rtype: void") CorrectRange;
		static void CorrectRange (const TopoDS_Edge & aE1,const TopoDS_Edge & aE2,const IntTools_Range & aSR,IntTools_Range & aNewSR);

		/****************** CorrectRange ******************/
		%feature("compactdefaultargs") CorrectRange;
		%feature("autodoc", "* Correct shrunk range <aSR> taking into account 3D-curve resolution and corresponding tolerance values of <aE>, <aF>
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aSR:
	:type aSR: IntTools_Range
	:param aNewSR:
	:type aNewSR: IntTools_Range
	:rtype: void") CorrectRange;
		static void CorrectRange (const TopoDS_Edge & aE,const TopoDS_Face & aF,const IntTools_Range & aSR,IntTools_Range & aNewSR);

		/****************** CorrectShapeTolerances ******************/
		%feature("compactdefaultargs") CorrectShapeTolerances;
		%feature("autodoc", "* Corrects tolerance values of the sub-shapes of the shape <theS> if needed.
	:param theS:
	:type theS: TopoDS_Shape
	:param theMapToAvoid:
	:type theMapToAvoid: TopTools_IndexedMapOfShape
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void") CorrectShapeTolerances;
		static void CorrectShapeTolerances (const TopoDS_Shape & theS,const TopTools_IndexedMapOfShape & theMapToAvoid,const Standard_Boolean theRunParallel = Standard_False);

		/****************** CorrectTolerances ******************/
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", "* @name Methods for shape validation (correction) Provides valid values of tolerances for the shape <theS> <theTolMax> is max value of the tolerance that can be accepted for correction. If real value of the tolerance will be greater than <aTolMax>, the correction does not perform.
	:param theS:
	:type theS: TopoDS_Shape
	:param theMapToAvoid:
	:type theMapToAvoid: TopTools_IndexedMapOfShape
	:param theTolMax: default value is 0.0001
	:type theTolMax: float
	:param theRunParallel: default value is Standard_False
	:type theRunParallel: bool
	:rtype: void") CorrectTolerances;
		static void CorrectTolerances (const TopoDS_Shape & theS,const TopTools_IndexedMapOfShape & theMapToAvoid,const Standard_Real theTolMax = 0.0001,const Standard_Boolean theRunParallel = Standard_False);

		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "* Retutns dimension of the shape <theS>.
	:param theS:
	:type theS: TopoDS_Shape
	:rtype: int") Dimension;
		static Standard_Integer Dimension (const TopoDS_Shape & theS);

		/****************** GetEdgeOff ******************/
		%feature("compactdefaultargs") GetEdgeOff;
		%feature("autodoc", "* @name Looking for the edge in the face Returns True if the face theFace contains the edge theEdge but with opposite orientation. If the method returns True theEdgeOff is the edge founded
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:param theEdgeOff:
	:type theEdgeOff: TopoDS_Edge
	:rtype: bool") GetEdgeOff;
		static Standard_Boolean GetEdgeOff (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,TopoDS_Edge & theEdgeOff);

		/****************** GetEdgeOnFace ******************/
		%feature("compactdefaultargs") GetEdgeOnFace;
		%feature("autodoc", "* For the face theFace gets the edge theEdgeOnF that is the same as theEdge Returns True if such edge exists Returns False if there is no such edge
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:param theEdgeOnF:
	:type theEdgeOnF: TopoDS_Edge
	:rtype: bool") GetEdgeOnFace;
		static Standard_Boolean GetEdgeOnFace (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,TopoDS_Edge & theEdgeOnF);

		/****************** GetFaceOff ******************/
		%feature("compactdefaultargs") GetFaceOff;
		%feature("autodoc", "* @name Face classification relatively solid For the face theFace and its edge theEdge finds the face suitable to produce shell. theLCEF - set of faces to search. All faces from theLCEF must share edge theEdge
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace:
	:type theFace: TopoDS_Face
	:param theLCEF:
	:type theLCEF: BOPTools_ListOfCoupleOfShape
	:param theFaceOff:
	:type theFaceOff: TopoDS_Face
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: bool") GetFaceOff;
		static Standard_Boolean GetFaceOff (const TopoDS_Edge & theEdge,const TopoDS_Face & theFace,BOPTools_ListOfCoupleOfShape & theLCEF,TopoDS_Face & theFaceOff,const opencascade::handle<IntTools_Context> & theContext);

		/****************** IsBlockInOnFace ******************/
		%feature("compactdefaultargs") IsBlockInOnFace;
		%feature("autodoc", "* Returns True if PaveBlock <aPB> lays on the face <aF>, i.e the <PB> is IN or ON in 2D of <aF>
	:param aShR:
	:type aShR: IntTools_Range
	:param aF:
	:type aF: TopoDS_Face
	:param aE:
	:type aE: TopoDS_Edge
	:param aContext:
	:type aContext: IntTools_Context
	:rtype: bool") IsBlockInOnFace;
		static Standard_Boolean IsBlockInOnFace (const IntTools_Range & aShR,const TopoDS_Face & aF,const TopoDS_Edge & aE,const opencascade::handle<IntTools_Context> & aContext);

		/****************** IsHole ******************/
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", "* @name Wire classification relatively face Checks if the wire is a hole for the face.
	:param theW:
	:type theW: TopoDS_Shape
	:param theF:
	:type theF: TopoDS_Shape
	:rtype: bool") IsHole;
		static Standard_Boolean IsHole (const TopoDS_Shape & theW,const TopoDS_Shape & theF);

		/****************** IsInternalFace ******************/
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "* Returns True if the face theFace is inside of the couple of faces theFace1, theFace2. The faces theFace, theFace1, theFace2 must share the edge theEdge Return values: * 0 state is not IN * 1 state is IN * 2 state can not be found by the method of angles
	:param theFace:
	:type theFace: TopoDS_Face
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theFace1:
	:type theFace1: TopoDS_Face
	:param theFace2:
	:type theFace2: TopoDS_Face
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,const TopoDS_Face & theFace1,const TopoDS_Face & theFace2,const opencascade::handle<IntTools_Context> & theContext);

		/****************** IsInternalFace ******************/
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "* Returns True if the face theFace is inside of the appropriate couple of faces (from the set theLF) . The faces of the set theLF and theFace must share the edge theEdge * 0 state is not IN * 1 state is IN * 2 state can not be found by the method of angles
	:param theFace:
	:type theFace: TopoDS_Face
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theLF:
	:type theLF: TopTools_ListOfShape
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") IsInternalFace;
		static Standard_Integer IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Edge & theEdge,TopTools_ListOfShape & theLF,const opencascade::handle<IntTools_Context> & theContext);

		/****************** IsInternalFace ******************/
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "* Returns True if the face theFace is inside the solid theSolid. theMEF - Map Edge/Faces for theSolid theTol - value of precision of computation theContext- cahed geometrical tools
	:param theFace:
	:type theFace: TopoDS_Face
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:param theMEF:
	:type theMEF: TopTools_IndexedDataMapOfShapeListOfShape
	:param theTol:
	:type theTol: float
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: bool") IsInternalFace;
		static Standard_Boolean IsInternalFace (const TopoDS_Face & theFace,const TopoDS_Solid & theSolid,TopTools_IndexedDataMapOfShapeListOfShape & theMEF,const Standard_Real theTol,const opencascade::handle<IntTools_Context> & theContext);

		/****************** IsInvertedSolid ******************/
		%feature("compactdefaultargs") IsInvertedSolid;
		%feature("autodoc", "* @name Solid classification Returns true if the solid <theSolid> is inverted
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:rtype: bool") IsInvertedSolid;
		static Standard_Boolean IsInvertedSolid (const TopoDS_Solid & theSolid);

		/****************** IsMicroEdge ******************/
		%feature("compactdefaultargs") IsMicroEdge;
		%feature("autodoc", "* @name Checking edge on micro status Checks if it is possible to compute shrunk range for the edge <aE> Flag <theCheckSplittable> defines whether to take into account the possibility to split the edge or not.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:param theContext:
	:type theContext: IntTools_Context
	:param theCheckSplittable: default value is Standard_True
	:type theCheckSplittable: bool
	:rtype: bool") IsMicroEdge;
		static Standard_Boolean IsMicroEdge (const TopoDS_Edge & theEdge,const opencascade::handle<IntTools_Context> & theContext,const Standard_Boolean theCheckSplittable = Standard_True);

		/****************** IsOpenShell ******************/
		%feature("compactdefaultargs") IsOpenShell;
		%feature("autodoc", "* Returns true if the shell <theShell> is open
	:param theShell:
	:type theShell: TopoDS_Shell
	:rtype: bool") IsOpenShell;
		static Standard_Boolean IsOpenShell (const TopoDS_Shell & theShell);

		/****************** IsSplitToReverse ******************/
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "* @name Choosing correct orientation for the split shape Checks if the direction of the split shape is opposite to the direction of the original shape. The method is an overload for (Edge,Edge) and (Face,Face) corresponding methods and checks only these types of shapes. For faces the method checks if normal directions are opposite. For edges the method checks if tangent vectors are opposite. //! In case the directions do not coincide, it returns True, meaning that split shape has to be reversed to match the direction of the original shape. //! If requested (<theError> is not null), the method returns the status of the operation: - 0 - no error; - Error from (Edge,Edge) or (Face,Face) corresponding method - 100 - bad types. In case of any error the method always returns False. //! @param theSplit [in] Split shape @param theShape [in] Original shape @param theContext [in] Cashed geometrical tools @param theError [out] Error Status of the operation
	:param theSplit:
	:type theSplit: TopoDS_Shape
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theContext:
	:type theContext: IntTools_Context
	:param theError: default value is NULL
	:type theError: int *
	:rtype: bool") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Shape & theSplit,const TopoDS_Shape & theShape,const opencascade::handle<IntTools_Context> & theContext,Standard_Integer * theError = NULL);

		/****************** IsSplitToReverse ******************/
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "* Checks if the normal direction of the split face is opposite to the normal direction of the original face. The normal directions for both faces are taken in the same point - point inside the split face is projected onto the original face. Returns True if the normals do not coincide, meaning the necessity to revert the orientation of the split face to match the direction of the original face. //! If requested (<theError> is not null), the method returns the status of the operation: - 0 - no error; - 1 - unable to find the point inside split face; - 2 - unable to compute the normal for the split face; - 3 - unable to project the point inside the split face on the original face; - 4 - unable to compute the normal for the original face. In case of any error the method always returns False. //! @param theSplit [in] Split face @param theShape [in] Original face @param theContext [in] Cashed geometrical tools @param theError [out] Error Status of the operation
	:param theSplit:
	:type theSplit: TopoDS_Face
	:param theShape:
	:type theShape: TopoDS_Face
	:param theContext:
	:type theContext: IntTools_Context
	:param theError: default value is NULL
	:type theError: int *
	:rtype: bool") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Face & theSplit,const TopoDS_Face & theShape,const opencascade::handle<IntTools_Context> & theContext,Standard_Integer * theError = NULL);

		/****************** IsSplitToReverse ******************/
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "* Checks if the tangent vector of the split edge is opposite to the tangent vector of the original edge. The tangent vectors for both edges are computed in the same point - point inside the split edge is projected onto the original edge. Returns True if the tangent vectors do not coincide, meaning the necessity to revert the orientation of the split edge to match the direction of the original edge. //! If requested (<theError> is not null), the method returns the status of the operation: - 0 - no error; - 1 - degenerated edges are given; - 2 - unable to compute the tangent vector for the split edge; - 3 - unable to project the point inside the split edge on the original edge; - 4 - unable to compute the tangent vector for the original edge; In case of any error the method always returns False. //! @param theSplit [in] Split edge @param theShape [in] Original edge @param theContext [in] Cashed geometrical tools @param theError [out] Error Status of the operation
	:param theSplit:
	:type theSplit: TopoDS_Edge
	:param theShape:
	:type theShape: TopoDS_Edge
	:param theContext:
	:type theContext: IntTools_Context
	:param theError: default value is NULL
	:type theError: int *
	:rtype: bool") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse (const TopoDS_Edge & theSplit,const TopoDS_Edge & theShape,const opencascade::handle<IntTools_Context> & theContext,Standard_Integer * theError = NULL);

		/****************** IsSplitToReverseWithWarn ******************/
		%feature("compactdefaultargs") IsSplitToReverseWithWarn;
		%feature("autodoc", "* Add-on for the *IsSplitToReverse()* to check for its errors and in case of any add the *BOPAlgo_AlertUnableToOrientTheShape* warning to the report.
	:param theSplit:
	:type theSplit: TopoDS_Shape
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theContext:
	:type theContext: IntTools_Context
	:param theReport: default value is NULL
	:type theReport: Message_Report
	:rtype: bool") IsSplitToReverseWithWarn;
		static Standard_Boolean IsSplitToReverseWithWarn (const TopoDS_Shape & theSplit,const TopoDS_Shape & theShape,const opencascade::handle<IntTools_Context> & theContext,const opencascade::handle<Message_Report> & theReport = NULL);

		/****************** MakeConnexityBlock ******************/
		%feature("compactdefaultargs") MakeConnexityBlock;
		%feature("autodoc", "* @name Making connexity blocks For the list of faces theLS build block theLSCB in terms of connexity by edges theMapAvoid - set of edges to avoid for the treatment
	:param theLS:
	:type theLS: TopTools_ListOfShape
	:param theMapAvoid:
	:type theMapAvoid: TopTools_IndexedMapOfShape
	:param theLSCB:
	:type theLSCB: TopTools_ListOfShape
	:param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: void") MakeConnexityBlock;
		static void MakeConnexityBlock (TopTools_ListOfShape & theLS,TopTools_IndexedMapOfShape & theMapAvoid,TopTools_ListOfShape & theLSCB,const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** MakeConnexityBlocks ******************/
		%feature("compactdefaultargs") MakeConnexityBlocks;
		%feature("autodoc", "* For the compound <theS> builds the blocks (compounds) of elements of type <theElementType> connected through the shapes of the type <theConnectionType>. The blocks are stored into the list <theLCB>.
	:param theS:
	:type theS: TopoDS_Shape
	:param theConnectionType:
	:type theConnectionType: TopAbs_ShapeEnum
	:param theElementType:
	:type theElementType: TopAbs_ShapeEnum
	:param theLCB:
	:type theLCB: TopTools_ListOfShape
	:rtype: void") MakeConnexityBlocks;
		static void MakeConnexityBlocks (const TopoDS_Shape & theS,const TopAbs_ShapeEnum theConnectionType,const TopAbs_ShapeEnum theElementType,TopTools_ListOfShape & theLCB);

		/****************** MakeConnexityBlocks ******************/
		%feature("compactdefaultargs") MakeConnexityBlocks;
		%feature("autodoc", "* For the compound <theS> builds the blocks (compounds) of elements of type <theElementType> connected through the shapes of the type <theConnectionType>. The blocks are stored into the list of lists <theLCB>. Returns also the connection map <theConnectionMap>, filled during operation.
	:param theS:
	:type theS: TopoDS_Shape
	:param theConnectionType:
	:type theConnectionType: TopAbs_ShapeEnum
	:param theElementType:
	:type theElementType: TopAbs_ShapeEnum
	:param theLCB:
	:type theLCB: TopTools_ListOfListOfShape
	:param theConnectionMap:
	:type theConnectionMap: TopTools_IndexedDataMapOfShapeListOfShape
	:rtype: void") MakeConnexityBlocks;
		static void MakeConnexityBlocks (const TopoDS_Shape & theS,const TopAbs_ShapeEnum theConnectionType,const TopAbs_ShapeEnum theElementType,TopTools_ListOfListOfShape & theLCB,TopTools_IndexedDataMapOfShapeListOfShape & theConnectionMap);

		/****************** MakeConnexityBlocks ******************/
		%feature("compactdefaultargs") MakeConnexityBlocks;
		%feature("autodoc", "* Makes connexity blocks of elements of the given type with the given type of the connecting elements. The blocks are checked on regularity (multi-connectivity) and stored to the list of blocks <theLCB>.
	:param theLS:
	:type theLS: TopTools_ListOfShape
	:param theConnectionType:
	:type theConnectionType: TopAbs_ShapeEnum
	:param theElementType:
	:type theElementType: TopAbs_ShapeEnum
	:param theLCB:
	:type theLCB: BOPTools_ListOfConnexityBlock
	:rtype: void") MakeConnexityBlocks;
		static void MakeConnexityBlocks (const TopTools_ListOfShape & theLS,const TopAbs_ShapeEnum theConnectionType,const TopAbs_ShapeEnum theElementType,BOPTools_ListOfConnexityBlock & theLCB);

		/****************** MakeContainer ******************/
		%feature("compactdefaultargs") MakeContainer;
		%feature("autodoc", "* @name Other methods Makes empty container of requested type
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:param theShape:
	:type theShape: TopoDS_Shape
	:rtype: void") MakeContainer;
		static void MakeContainer (const TopAbs_ShapeEnum theType,TopoDS_Shape & theShape);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* @name Edge construction Makes the edge based on the given curve with given bounding vertices.
	:param theCurve:
	:type theCurve: IntTools_Curve
	:param theV1:
	:type theV1: TopoDS_Vertex
	:param theT1:
	:type theT1: float
	:param theV2:
	:type theV2: TopoDS_Vertex
	:param theT2:
	:type theT2: float
	:param theTolR3D:
	:type theTolR3D: float
	:param theE:
	:type theE: TopoDS_Edge
	:rtype: void") MakeEdge;
		static void MakeEdge (const IntTools_Curve & theCurve,const TopoDS_Vertex & theV1,const Standard_Real theT1,const TopoDS_Vertex & theV2,const Standard_Real theT2,const Standard_Real theTolR3D,TopoDS_Edge & theE);

		/****************** MakeNewVertex ******************/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "* Make a vertex using 3D-point <aP1> and 3D-tolerance value <aTol>
	:param aP1:
	:type aP1: gp_Pnt
	:param aTol:
	:type aTol: float
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex
	:rtype: void") MakeNewVertex;
		static void MakeNewVertex (const gp_Pnt & aP1,const Standard_Real aTol,TopoDS_Vertex & aNewVertex);

		/****************** MakeNewVertex ******************/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "* Make a vertex using couple of vertices <aV1, aV2>
	:param aV1:
	:type aV1: TopoDS_Vertex
	:param aV2:
	:type aV2: TopoDS_Vertex
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex
	:rtype: void") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Vertex & aV1,const TopoDS_Vertex & aV2,TopoDS_Vertex & aNewVertex);

		/****************** MakeNewVertex ******************/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "* Make a vertex in place of intersection between two edges <aE1, aE2> with parameters <aP1, aP2>
	:param aE1:
	:type aE1: TopoDS_Edge
	:param aP1:
	:type aP1: float
	:param aE2:
	:type aE2: TopoDS_Edge
	:param aP2:
	:type aP2: float
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex
	:rtype: void") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Edge & aE1,const Standard_Real aP1,const TopoDS_Edge & aE2,const Standard_Real aP2,TopoDS_Vertex & aNewVertex);

		/****************** MakeNewVertex ******************/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "* Make a vertex in place of intersection between the edge <aE1> with parameter <aP1> and the face <aF2>
	:param aE1:
	:type aE1: TopoDS_Edge
	:param aP1:
	:type aP1: float
	:param aF2:
	:type aF2: TopoDS_Face
	:param aNewVertex:
	:type aNewVertex: TopoDS_Vertex
	:rtype: void") MakeNewVertex;
		static void MakeNewVertex (const TopoDS_Edge & aE1,const Standard_Real aP1,const TopoDS_Face & aF2,TopoDS_Vertex & aNewVertex);

		/****************** MakePCurve ******************/
		%feature("compactdefaultargs") MakePCurve;
		%feature("autodoc", "* @name PCurve construction Makes 2d curve of the edge <theE> on the faces <theF1> and <theF2>. <theContext> - storage for caching the geometrical tools
	:param theE:
	:type theE: TopoDS_Edge
	:param theF1:
	:type theF1: TopoDS_Face
	:param theF2:
	:type theF2: TopoDS_Face
	:param theCurve:
	:type theCurve: IntTools_Curve
	:param thePC1:
	:type thePC1: bool
	:param thePC2:
	:type thePC2: bool
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") MakePCurve;
		static void MakePCurve (const TopoDS_Edge & theE,const TopoDS_Face & theF1,const TopoDS_Face & theF2,const IntTools_Curve & theCurve,const Standard_Boolean thePC1,const Standard_Boolean thePC2,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** MakeSectEdge ******************/
		%feature("compactdefaultargs") MakeSectEdge;
		%feature("autodoc", "* Make the edge from 3D-Curve <aIC> and two vertices <aV1,aV2> at parameters <aP1,aP2>
	:param aIC:
	:type aIC: IntTools_Curve
	:param aV1:
	:type aV1: TopoDS_Vertex
	:param aP1:
	:type aP1: float
	:param aV2:
	:type aV2: TopoDS_Vertex
	:param aP2:
	:type aP2: float
	:param aNewEdge:
	:type aNewEdge: TopoDS_Edge
	:rtype: void") MakeSectEdge;
		static void MakeSectEdge (const IntTools_Curve & aIC,const TopoDS_Vertex & aV1,const Standard_Real aP1,const TopoDS_Vertex & aV2,const Standard_Real aP2,TopoDS_Edge & aNewEdge);

		/****************** MakeSplitEdge ******************/
		%feature("compactdefaultargs") MakeSplitEdge;
		%feature("autodoc", "* Make the edge from base edge <aE1> and two vertices <aV1,aV2> at parameters <aP1,aP2>
	:param aE1:
	:type aE1: TopoDS_Edge
	:param aV1:
	:type aV1: TopoDS_Vertex
	:param aP1:
	:type aP1: float
	:param aV2:
	:type aV2: TopoDS_Vertex
	:param aP2:
	:type aP2: float
	:param aNewEdge:
	:type aNewEdge: TopoDS_Edge
	:rtype: void") MakeSplitEdge;
		static void MakeSplitEdge (const TopoDS_Edge & aE1,const TopoDS_Vertex & aV1,const Standard_Real aP1,const TopoDS_Vertex & aV2,const Standard_Real aP2,TopoDS_Edge & aNewEdge);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "* @name Vertices construction Makes the vertex in the middle of given vertices with the tolerance covering all tolerance spheres of vertices.
	:param theLV:
	:type theLV: TopTools_ListOfShape
	:param theV:
	:type theV: TopoDS_Vertex
	:rtype: void") MakeVertex;
		static void MakeVertex (const TopTools_ListOfShape & theLV,TopoDS_Vertex & theV);

		/****************** OrientEdgesOnWire ******************/
		%feature("compactdefaultargs") OrientEdgesOnWire;
		%feature("autodoc", "* @name Orienting elements in container Correctly orients edges on the wire
	:param theWire:
	:type theWire: TopoDS_Shape
	:rtype: void") OrientEdgesOnWire;
		static void OrientEdgesOnWire (TopoDS_Shape & theWire);

		/****************** OrientFacesOnShell ******************/
		%feature("compactdefaultargs") OrientFacesOnShell;
		%feature("autodoc", "* Correctly orients faces on the shell
	:param theShell:
	:type theShell: TopoDS_Shape
	:rtype: void") OrientFacesOnShell;
		static void OrientFacesOnShell (TopoDS_Shape & theShell);

		/****************** PointOnEdge ******************/
		%feature("compactdefaultargs") PointOnEdge;
		%feature("autodoc", "* Compute a 3D-point on the edge <aEdge> at parameter <aPrm>
	:param aEdge:
	:type aEdge: TopoDS_Edge
	:param aPrm:
	:type aPrm: float
	:param aP:
	:type aP: gp_Pnt
	:rtype: void") PointOnEdge;
		static void PointOnEdge (const TopoDS_Edge & aEdge,const Standard_Real aPrm,gp_Pnt & aP);

		/****************** Sense ******************/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "* Checks if the normals direction of the given faces computed near the shared edge coincide. Returns the status of operation: * 0 - in case of error (shared edge not found or directions are not collinear) * 1 - normal directions coincide; * -1 - normal directions are opposite.
	:param theF1:
	:type theF1: TopoDS_Face
	:param theF2:
	:type theF2: TopoDS_Face
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") Sense;
		static Standard_Integer Sense (const TopoDS_Face & theF1,const TopoDS_Face & theF2,const opencascade::handle<IntTools_Context> & theContext);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* @name Updating the vertex Update the tolerance value for vertex <aV> taking into account the fact that <aV> lays on the curve <aIC>
	:param aIC:
	:type aIC: IntTools_Curve
	:param aT:
	:type aT: float
	:param aV:
	:type aV: TopoDS_Vertex
	:rtype: void") UpdateVertex;
		static void UpdateVertex (const IntTools_Curve & aIC,const Standard_Real aT,const TopoDS_Vertex & aV);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Update the tolerance value for vertex <aV> taking into account the fact that <aV> lays on the edge <aE>
	:param aE:
	:type aE: TopoDS_Edge
	:param aT:
	:type aT: float
	:param aV:
	:type aV: TopoDS_Vertex
	:rtype: void") UpdateVertex;
		static void UpdateVertex (const TopoDS_Edge & aE,const Standard_Real aT,const TopoDS_Vertex & aV);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Update the tolerance value for vertex <aVN> taking into account the fact that <aVN> should cover tolerance zone of <aVF>
	:param aVF:
	:type aVF: TopoDS_Vertex
	:param aVN:
	:type aVN: TopoDS_Vertex
	:rtype: void") UpdateVertex;
		static void UpdateVertex (const TopoDS_Vertex & aVF,const TopoDS_Vertex & aVN);

};


%extend BOPTools_AlgoTools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPTools_AlgoTools2D *
*****************************/
class BOPTools_AlgoTools2D {
	public:
		/****************** AdjustPCurveOnFace ******************/
		%feature("compactdefaultargs") AdjustPCurveOnFace;
		%feature("autodoc", "* Adjust P-Curve <theC2D> (3D-curve <theC3D>) on surface of the face <theF>. <theContext> - storage for caching the geometrical tools
	:param theF:
	:type theF: TopoDS_Face
	:param theC3D:
	:type theC3D: Geom_Curve
	:param theC2D:
	:type theC2D: Geom2d_Curve
	:param theC2DA:
	:type theC2DA: Geom2d_Curve
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace (const TopoDS_Face & theF,const opencascade::handle<Geom_Curve> & theC3D,const opencascade::handle<Geom2d_Curve> & theC2D,opencascade::handle<Geom2d_Curve> & theC2DA,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** AdjustPCurveOnFace ******************/
		%feature("compactdefaultargs") AdjustPCurveOnFace;
		%feature("autodoc", "* Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> . [aT1, aT2] - range to adjust <theContext> - storage for caching the geometrical tools
	:param theF:
	:type theF: TopoDS_Face
	:param theFirst:
	:type theFirst: float
	:param theLast:
	:type theLast: float
	:param theC2D:
	:type theC2D: Geom2d_Curve
	:param theC2DA:
	:type theC2DA: Geom2d_Curve
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace (const TopoDS_Face & theF,const Standard_Real theFirst,const Standard_Real theLast,const opencascade::handle<Geom2d_Curve> & theC2D,opencascade::handle<Geom2d_Curve> & theC2DA,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** AdjustPCurveOnSurf ******************/
		%feature("compactdefaultargs") AdjustPCurveOnSurf;
		%feature("autodoc", "* Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> . [aT1, aT2] - range to adjust
	:param aF:
	:type aF: BRepAdaptor_Surface
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aC2D:
	:type aC2D: Geom2d_Curve
	:param aC2DA:
	:type aC2DA: Geom2d_Curve
	:rtype: void") AdjustPCurveOnSurf;
		static void AdjustPCurveOnSurf (const BRepAdaptor_Surface & aF,const Standard_Real aT1,const Standard_Real aT2,const opencascade::handle<Geom2d_Curve> & aC2D,opencascade::handle<Geom2d_Curve> & aC2DA);

		/****************** AttachExistingPCurve ******************/
		%feature("compactdefaultargs") AttachExistingPCurve;
		%feature("autodoc", "* Attach P-Curve from the edge <aEold> on surface <aF> to the edge <aEnew> Returns 0 in case of success
	:param aEold:
	:type aEold: TopoDS_Edge
	:param aEnew:
	:type aEnew: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aCtx:
	:type aCtx: IntTools_Context
	:rtype: int") AttachExistingPCurve;
		static Standard_Integer AttachExistingPCurve (const TopoDS_Edge & aEold,const TopoDS_Edge & aEnew,const TopoDS_Face & aF,const opencascade::handle<IntTools_Context> & aCtx);

		/****************** BuildPCurveForEdgeOnFace ******************/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnFace;
		%feature("autodoc", "* Compute P-Curve for the edge <aE> on the face <aF>. Raises exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") BuildPCurveForEdgeOnFace;
		static void BuildPCurveForEdgeOnFace (const TopoDS_Edge & aE,const TopoDS_Face & aF,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** EdgeTangent ******************/
		%feature("compactdefaultargs") EdgeTangent;
		%feature("autodoc", "* Compute tangent for the edge <aE> [in 3D] at parameter <aT>
	:param anE:
	:type anE: TopoDS_Edge
	:param aT:
	:type aT: float
	:param Tau:
	:type Tau: gp_Vec
	:rtype: bool") EdgeTangent;
		static Standard_Boolean EdgeTangent (const TopoDS_Edge & anE,const Standard_Real aT,gp_Vec & Tau);

		/****************** HasCurveOnSurface ******************/
		%feature("compactdefaultargs") HasCurveOnSurface;
		%feature("autodoc", "* Returns True if the edge <aE> has P-Curve <aC> on surface <aF> . [aFirst, aLast] - range of the P-Curve [aToler] - reached tolerance If the P-Curve does not exist, aC.IsNull()=True.
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aC:
	:type aC: Geom2d_Curve
	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:param aToler:
	:type aToler: float
	:rtype: bool") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF,opencascade::handle<Geom2d_Curve> & aC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** HasCurveOnSurface ******************/
		%feature("compactdefaultargs") HasCurveOnSurface;
		%feature("autodoc", "* Returns True if the edge <aE> has P-Curve <aC> on surface <aF> . If the P-Curve does not exist, aC.IsNull()=True.
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:rtype: bool") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF);

		/****************** IntermediatePoint ******************/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "* Compute intermediate value in between [aFirst, aLast] .
	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: float") IntermediatePoint;
		static Standard_Real IntermediatePoint (const Standard_Real aFirst,const Standard_Real aLast);

		/****************** IntermediatePoint ******************/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "* Compute intermediate value of parameter for the edge <anE>.
	:param anE:
	:type anE: TopoDS_Edge
	:rtype: float") IntermediatePoint;
		static Standard_Real IntermediatePoint (const TopoDS_Edge & anE);

		/****************** IsEdgeIsoline ******************/
		%feature("compactdefaultargs") IsEdgeIsoline;
		%feature("autodoc", "* Checks if CurveOnSurface of theE on theF matches with isoline of theF surface. Sets corresponding values for isTheUIso and isTheVIso variables. ATTENTION!!! This method is based on comparation between direction of surface (which theF is based on) iso-lines and the direction of the edge p-curve (on theF) in middle-point of the p-curve. This method should be used carefully (e.g. BRep_Tool::IsClosed(...) together) in order to avoid false classification some p-curves as isoline (e.g. circle on a plane).
	:param theE:
	:type theE: TopoDS_Edge
	:param theF:
	:type theF: TopoDS_Face
	:param isTheUIso:
	:type isTheUIso: bool
	:param isTheVIso:
	:type isTheVIso: bool
	:rtype: void") IsEdgeIsoline;
		static void IsEdgeIsoline (const TopoDS_Edge & theE,const TopoDS_Face & theF,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** Make2D ******************/
		%feature("compactdefaultargs") Make2D;
		%feature("autodoc", "* Make P-Curve <aC> for the edge <aE> on surface <aF> . [aFirst, aLast] - range of the P-Curve [aToler] - reached tolerance Raises exception Standard_ConstructionError if algorithm fails. <theContext> - storage for caching the geometrical tools
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aC:
	:type aC: Geom2d_Curve
	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:param aToler:
	:type aToler: float
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") Make2D;
		static void Make2D (const TopoDS_Edge & aE,const TopoDS_Face & aF,opencascade::handle<Geom2d_Curve> & aC,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** MakePCurveOnFace ******************/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "* Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> . [aToler] - reached tolerance Raises exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools
	:param aF:
	:type aF: TopoDS_Face
	:param C3D:
	:type C3D: Geom_Curve
	:param aC:
	:type aC: Geom2d_Curve
	:param aToler:
	:type aToler: float
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") MakePCurveOnFace;
		static void MakePCurveOnFace (const TopoDS_Face & aF,const opencascade::handle<Geom_Curve> & C3D,opencascade::handle<Geom2d_Curve> & aC,Standard_Real &OutValue,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** MakePCurveOnFace ******************/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "* Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> . [aT1, aT2] - range to build [aToler] - reached tolerance Raises exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools
	:param aF:
	:type aF: TopoDS_Face
	:param C3D:
	:type C3D: Geom_Curve
	:param aT1:
	:type aT1: float
	:param aT2:
	:type aT2: float
	:param aC:
	:type aC: Geom2d_Curve
	:param aToler:
	:type aToler: float
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") MakePCurveOnFace;
		static void MakePCurveOnFace (const TopoDS_Face & aF,const opencascade::handle<Geom_Curve> & C3D,const Standard_Real aT1,const Standard_Real aT2,opencascade::handle<Geom2d_Curve> & aC,Standard_Real &OutValue,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** PointOnSurface ******************/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "* Compute surface parameters <U,V> of the face <aF> for the point from the edge <aE> at parameter <aT>. If <aE> has't pcurve on surface, algorithm tries to get it by projection and can raise exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aT:
	:type aT: float
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") PointOnSurface;
		static void PointOnSurface (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,Standard_Real &OutValue,Standard_Real &OutValue,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

};


%extend BOPTools_AlgoTools2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPTools_AlgoTools3D *
*****************************/
class BOPTools_AlgoTools3D {
	public:
		/****************** DoSplitSEAMOnFace ******************/
		%feature("compactdefaultargs") DoSplitSEAMOnFace;
		%feature("autodoc", "* Make the edge <aSp> seam edge for the face <aF>
	:param aSp:
	:type aSp: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:rtype: void") DoSplitSEAMOnFace;
		static void DoSplitSEAMOnFace (const TopoDS_Edge & aSp,const TopoDS_Face & aF);

		/****************** GetApproxNormalToFaceOnEdge ******************/
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "* Computes normal to the face <aF> for the 3D-point that belongs to the edge <aE> at parameter <aT>. Output: aPx - the 3D-point where the normal computed aD - the normal; Warning: The normal is computed not exactly in the point on the edge, but in point that is near to the edge towards to the face material (so, we'll have approx. normal); The point is computed using PointNearEdge function, with the shifting value BOPTools_AlgoTools3D::MinStepIn2d(), from the edge, but if this value is too big, the point will be computed using Hatcher (PointInFace function). Returns True in case of success.
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aT:
	:type aT: float
	:param aPx:
	:type aPx: gp_Pnt
	:param aD:
	:type aD: gp_Dir
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: bool") GetApproxNormalToFaceOnEdge;
		static Standard_Boolean GetApproxNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Pnt & aPx,gp_Dir & aD,const opencascade::handle<IntTools_Context> & theContext);

		/****************** GetApproxNormalToFaceOnEdge ******************/
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "* Computes normal to the face <aF> for the 3D-point that belongs to the edge <aE> at parameter <aT>. Output: aPx - the 3D-point where the normal computed aD - the normal; Warning: The normal is computed not exactly in the point on the edge, but in point that is near to the edge towards to the face material (so, we'll have approx. normal); The point is computed using PointNearEdge function with the shifting value <aDt2D> from the edge; No checks on this value will be done. Returns True in case of success.
	:param theE:
	:type theE: TopoDS_Edge
	:param theF:
	:type theF: TopoDS_Face
	:param aT:
	:type aT: float
	:param aP:
	:type aP: gp_Pnt
	:param aDNF:
	:type aDNF: gp_Dir
	:param aDt2D:
	:type aDt2D: float
	:rtype: bool") GetApproxNormalToFaceOnEdge;
		static Standard_Boolean GetApproxNormalToFaceOnEdge (const TopoDS_Edge & theE,const TopoDS_Face & theF,const Standard_Real aT,gp_Pnt & aP,gp_Dir & aDNF,const Standard_Real aDt2D);

		/****************** GetApproxNormalToFaceOnEdge ******************/
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "* Computes normal to the face <aF> for the 3D-point that belongs to the edge <aE> at parameter <aT>. Output: aPx - the 3D-point where the normal computed aD - the normal; Warning: The normal is computed not exactly in the point on the edge, but in point that is near to the edge towards to the face material (so, we'll have approx. normal); The point is computed using PointNearEdge function with the shifting value <aDt2D> from the edge, but if this value is too big the point will be computed using Hatcher (PointInFace function). Returns True in case of success.
	:param theE:
	:type theE: TopoDS_Edge
	:param theF:
	:type theF: TopoDS_Face
	:param aT:
	:type aT: float
	:param aDt2D:
	:type aDt2D: float
	:param aP:
	:type aP: gp_Pnt
	:param aDNF:
	:type aDNF: gp_Dir
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: bool") GetApproxNormalToFaceOnEdge;
		static Standard_Boolean GetApproxNormalToFaceOnEdge (const TopoDS_Edge & theE,const TopoDS_Face & theF,const Standard_Real aT,const Standard_Real aDt2D,gp_Pnt & aP,gp_Dir & aDNF,const opencascade::handle<IntTools_Context> & theContext);

		/****************** GetNormalToFaceOnEdge ******************/
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "* Computes normal to the face <aF> for the point on the edge <aE> at parameter <aT>. <theContext> - storage for caching the geometrical tools
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aT:
	:type aT: float
	:param aD:
	:type aD: gp_Dir
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Dir & aD,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** GetNormalToFaceOnEdge ******************/
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "* Computes normal to the face <aF> for the point on the edge <aE> at arbitrary intermediate parameter. <theContext> - storage for caching the geometrical tools
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aD:
	:type aD: gp_Dir
	:param theContext: default value is opencascade::handle<IntTools_Context>()
	:type theContext: IntTools_Context
	:rtype: void") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,gp_Dir & aD,const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****************** GetNormalToSurface ******************/
		%feature("compactdefaultargs") GetNormalToSurface;
		%feature("autodoc", "* Compute normal <aD> to surface <aS> in point (U,V) Returns True if directions aD1U, aD1V coincide
	:param aS:
	:type aS: Geom_Surface
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param aD:
	:type aD: gp_Dir
	:rtype: bool") GetNormalToSurface;
		static Standard_Boolean GetNormalToSurface (const opencascade::handle<Geom_Surface> & aS,const Standard_Real U,const Standard_Real V,gp_Dir & aD);

		/****************** IsEmptyShape ******************/
		%feature("compactdefaultargs") IsEmptyShape;
		%feature("autodoc", "* Returns True if the shape <aS> does not contain geometry information (e.g. empty compound)
	:param aS:
	:type aS: TopoDS_Shape
	:rtype: bool") IsEmptyShape;
		static Standard_Boolean IsEmptyShape (const TopoDS_Shape & aS);

		/****************** MinStepIn2d ******************/
		%feature("compactdefaultargs") MinStepIn2d;
		%feature("autodoc", "* Returns simple step value that is used in 2D-computations = 1.e-5
	:rtype: float") MinStepIn2d;
		static Standard_Real MinStepIn2d ();

		/****************** OrientEdgeOnFace ******************/
		%feature("compactdefaultargs") OrientEdgeOnFace;
		%feature("autodoc", "* Get the edge <aER> from the face <aF> that is the same as the edge <aE>
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aER:
	:type aER: TopoDS_Edge
	:rtype: void") OrientEdgeOnFace;
		static void OrientEdgeOnFace (const TopoDS_Edge & aE,const TopoDS_Face & aF,TopoDS_Edge & aER);

		/****************** PointInFace ******************/
		%feature("compactdefaultargs") PointInFace;
		%feature("autodoc", "* Computes arbitrary point <theP> inside the face <theF>. <theP2D> - 2D representation of <theP> on the surface of <theF> Returns 0 in case of success.
	:param theF:
	:type theF: TopoDS_Face
	:param theP:
	:type theP: gp_Pnt
	:param theP2D:
	:type theP2D: gp_Pnt2d
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") PointInFace;
		static Standard_Integer PointInFace (const TopoDS_Face & theF,gp_Pnt & theP,gp_Pnt2d & theP2D,const opencascade::handle<IntTools_Context> & theContext);

		/****************** PointInFace ******************/
		%feature("compactdefaultargs") PointInFace;
		%feature("autodoc", "* Computes a point <theP> inside the face <theF> using starting point taken by the parameter <theT> from the 2d curve of the edge <theE> on the face <theF> in the direction perpendicular to the tangent vector of the 2d curve of the edge. The point will be distanced on <theDt2D> from the 2d curve. <theP2D> - 2D representation of <theP> on the surface of <theF> Returns 0 in case of success.
	:param theF:
	:type theF: TopoDS_Face
	:param theE:
	:type theE: TopoDS_Edge
	:param theT:
	:type theT: float
	:param theDt2D:
	:type theDt2D: float
	:param theP:
	:type theP: gp_Pnt
	:param theP2D:
	:type theP2D: gp_Pnt2d
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") PointInFace;
		static Standard_Integer PointInFace (const TopoDS_Face & theF,const TopoDS_Edge & theE,const Standard_Real theT,const Standard_Real theDt2D,gp_Pnt & theP,gp_Pnt2d & theP2D,const opencascade::handle<IntTools_Context> & theContext);

		/****************** PointInFace ******************/
		%feature("compactdefaultargs") PointInFace;
		%feature("autodoc", "* Computes a point <theP> inside the face <theF> using the line <theL> so that 2D point <theP2D>, 2D representation of <theP> on the surface of <theF>, lies on that line. Returns 0 in case of success.
	:param theF:
	:type theF: TopoDS_Face
	:param theL:
	:type theL: Geom2d_Curve
	:param theP:
	:type theP: gp_Pnt
	:param theP2D:
	:type theP2D: gp_Pnt2d
	:param theContext:
	:type theContext: IntTools_Context
	:param theDt2D: default value is 0.0
	:type theDt2D: float
	:rtype: int") PointInFace;
		static Standard_Integer PointInFace (const TopoDS_Face & theF,const opencascade::handle<Geom2d_Curve> & theL,gp_Pnt & theP,gp_Pnt2d & theP2D,const opencascade::handle<IntTools_Context> & theContext,const Standard_Real theDt2D = 0.0);

		/****************** PointNearEdge ******************/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "* Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is <aDt2D> If the value of shifting is too big the point will be computed using Hatcher (PointInFace function). Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>; 2 - the computed point is out of the face.
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aT:
	:type aT: float
	:param aDt2D:
	:type aDt2D: float
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:param aPx:
	:type aPx: gp_Pnt
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") PointNearEdge;
		static Standard_Integer PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,const Standard_Real aDt2D,gp_Pnt2d & aP2D,gp_Pnt & aPx,const opencascade::handle<IntTools_Context> & theContext);

		/****************** PointNearEdge ******************/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "* Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is <aDt2D>. No checks on this value will be done. Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>.
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aT:
	:type aT: float
	:param aDt2D:
	:type aDt2D: float
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:param aPx:
	:type aPx: gp_Pnt
	:rtype: int") PointNearEdge;
		static Standard_Integer PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,const Standard_Real aDt2D,gp_Pnt2d & aP2D,gp_Pnt & aPx);

		/****************** PointNearEdge ******************/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "* Computes the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is dt2D=BOPTools_AlgoTools3D::MinStepIn2d() If the value of shifting is too big the point will be computed using Hatcher (PointInFace function). Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>; 2 - the computed point is out of the face.
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aT:
	:type aT: float
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:param aPx:
	:type aPx: gp_Pnt
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") PointNearEdge;
		static Standard_Integer PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,const Standard_Real aT,gp_Pnt2d & aP2D,gp_Pnt & aPx,const opencascade::handle<IntTools_Context> & theContext);

		/****************** PointNearEdge ******************/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "* Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at arbitrary parameter towards to the material of the face <aF>. The value of shifting in 2D is dt2D=BOPTools_AlgoTools3D::MinStepIn2d(). If the value of shifting is too big the point will be computed using Hatcher (PointInFace function). Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>; 2 - the computed point is out of the face.
	:param aE:
	:type aE: TopoDS_Edge
	:param aF:
	:type aF: TopoDS_Face
	:param aP2D:
	:type aP2D: gp_Pnt2d
	:param aPx:
	:type aPx: gp_Pnt
	:param theContext:
	:type theContext: IntTools_Context
	:rtype: int") PointNearEdge;
		static Standard_Integer PointNearEdge (const TopoDS_Edge & aE,const TopoDS_Face & aF,gp_Pnt2d & aP2D,gp_Pnt & aPx,const opencascade::handle<IntTools_Context> & theContext);

		/****************** SenseFlag ******************/
		%feature("compactdefaultargs") SenseFlag;
		%feature("autodoc", "* Returns 1 if scalar product aNF1* aNF2>0. Returns 0 if directions aNF1 aNF2 coincide Returns -1 if scalar product aNF1* aNF2<0.
	:param aNF1:
	:type aNF1: gp_Dir
	:param aNF2:
	:type aNF2: gp_Dir
	:rtype: int") SenseFlag;
		static Standard_Integer SenseFlag (const gp_Dir & aNF1,const gp_Dir & aNF2);

};


%extend BOPTools_AlgoTools3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BOPTools_ConnexityBlock *
********************************/
class BOPTools_ConnexityBlock {
	public:
		/****************** BOPTools_ConnexityBlock ******************/
		%feature("compactdefaultargs") BOPTools_ConnexityBlock;
		%feature("autodoc", ":rtype: None") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock ();

		/****************** BOPTools_ConnexityBlock ******************/
		%feature("compactdefaultargs") BOPTools_ConnexityBlock;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** ChangeLoops ******************/
		%feature("compactdefaultargs") ChangeLoops;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") ChangeLoops;
		TopTools_ListOfShape & ChangeLoops ();

		/****************** ChangeShapes ******************/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") ChangeShapes;
		TopTools_ListOfShape & ChangeShapes ();

		/****************** IsRegular ******************/
		%feature("compactdefaultargs") IsRegular;
		%feature("autodoc", ":rtype: bool") IsRegular;
		Standard_Boolean IsRegular ();

		/****************** Loops ******************/
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Loops;
		const TopTools_ListOfShape & Loops ();

		/****************** SetRegular ******************/
		%feature("compactdefaultargs") SetRegular;
		%feature("autodoc", ":param theFlag:
	:type theFlag: bool
	:rtype: None") SetRegular;
		void SetRegular (const Standard_Boolean theFlag);

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Shapes;
		const TopTools_ListOfShape & Shapes ();

};


%extend BOPTools_ConnexityBlock {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BOPTools_CoupleOfShape *
*******************************/
class BOPTools_CoupleOfShape {
	public:
		/****************** BOPTools_CoupleOfShape ******************/
		%feature("compactdefaultargs") BOPTools_CoupleOfShape;
		%feature("autodoc", ":rtype: None") BOPTools_CoupleOfShape;
		 BOPTools_CoupleOfShape ();

		/****************** SetShape1 ******************/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", ":param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") SetShape1;
		void SetShape1 (const TopoDS_Shape & theShape);

		/****************** SetShape2 ******************/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", ":param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") SetShape2;
		void SetShape2 (const TopoDS_Shape & theShape);

		/****************** Shape1 ******************/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape1;
		const TopoDS_Shape  Shape1 ();

		/****************** Shape2 ******************/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape2;
		const TopoDS_Shape  Shape2 ();

};


%extend BOPTools_CoupleOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BOPTools_Parallel *
**************************/
/*********************
* class BOPTools_Set *
*********************/
class BOPTools_Set {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param theS:
	:type theS: TopoDS_Shape
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:rtype: None") Add;
		void Add (const TopoDS_Shape & theS,const TopAbs_ShapeEnum theType);

		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", ":param Other:
	:type Other: BOPTools_Set
	:rtype: BOPTools_Set") Assign;
		BOPTools_Set & Assign (const BOPTools_Set & Other);

		/****************** BOPTools_Set ******************/
		%feature("compactdefaultargs") BOPTools_Set;
		%feature("autodoc", ":rtype: None") BOPTools_Set;
		 BOPTools_Set ();

		/****************** BOPTools_Set ******************/
		%feature("compactdefaultargs") BOPTools_Set;
		%feature("autodoc", ":param theAllocator:
	:type theAllocator: NCollection_BaseAllocator
	:rtype: None") BOPTools_Set;
		 BOPTools_Set (const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for this set, in the range [1, theUpperBound] @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		Standard_Integer HashCode (Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        
		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param aOther:
	:type aOther: BOPTools_Set
	:rtype: bool") IsEqual;
		Standard_Boolean IsEqual (const BOPTools_Set & aOther);

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", ":rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param Other:
	:type Other: BOPTools_Set
	:rtype: BOPTools_Set") operator =;
		BOPTools_Set & operator = (const BOPTools_Set & Other);

};


%extend BOPTools_Set {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BOPTools_SetMapHasher *
******************************/
class BOPTools_SetMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "* Computes a hash code for the given set, in the range [1, theUpperBound] @param theSet the set which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]
	:param theSet:
	:type theSet: BOPTools_Set
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int") HashCode;
		static Standard_Integer HashCode (const BOPTools_Set & theSet,Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", ":param aSet1:
	:type aSet1: BOPTools_Set
	:param aSet2:
	:type aSet2: BOPTools_Set
	:rtype: bool") IsEqual;
		static Standard_Boolean IsEqual (const BOPTools_Set & aSet1,const BOPTools_Set & aSet2);

};


%extend BOPTools_SetMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
