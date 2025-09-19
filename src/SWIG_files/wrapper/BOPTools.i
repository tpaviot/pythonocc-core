/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_boptools.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<IntCurvesFace_module.hxx>
#include<Geom2dHatch_module.hxx>
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
/* end handles declaration */

/* templates */
%template(BOPTools_IndexedDataMapOfSetShape) NCollection_IndexedDataMap<BOPTools_Set,TopoDS_Shape>;
%template(BOPTools_ListOfConnexityBlock) NCollection_List<BOPTools_ConnexityBlock>;

%extend NCollection_List<BOPTools_ConnexityBlock> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = BOPTools_ListIteratorOfListOfConnexityBlock(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(BOPTools_ListOfCoupleOfShape) NCollection_List<BOPTools_CoupleOfShape>;

%extend NCollection_List<BOPTools_CoupleOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = BOPTools_ListIteratorOfListOfCoupleOfShape(self.this)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(BOPTools_MapOfSet) NCollection_Map<BOPTools_Set>;
/* end templates declaration */

/* typedefs */
typedef BOPTools_PairSelector<2> BOPTools_Box2dPairSelector;
typedef BOPTools_BoxSet<Standard_Real, 2, Standard_Integer> BOPTools_Box2dTree;
typedef BOPTools_BoxSelector<2> BOPTools_Box2dTreeSelector;
typedef BOPTools_PairSelector<3> BOPTools_BoxPairSelector;
typedef BOPTools_BoxSet<Standard_Real, 3, Standard_Integer> BOPTools_BoxTree;
typedef BOPTools_BoxSelector<3> BOPTools_BoxTreeSelector;
typedef NCollection_IndexedDataMap<BOPTools_Set, TopoDS_Shape> BOPTools_IndexedDataMapOfSetShape;
typedef BOPTools_ListOfConnexityBlock::Iterator BOPTools_ListIteratorOfListOfConnexityBlock;
typedef BOPTools_ListOfCoupleOfShape::Iterator BOPTools_ListIteratorOfListOfCoupleOfShape;
typedef NCollection_List<BOPTools_ConnexityBlock> BOPTools_ListOfConnexityBlock;
typedef NCollection_List<BOPTools_CoupleOfShape> BOPTools_ListOfCoupleOfShape;
typedef BOPTools_MapOfSet::Iterator BOPTools_MapIteratorOfMapOfSet;
typedef NCollection_Map<BOPTools_Set> BOPTools_MapOfSet;
/* end typedefs declaration */

/***************************
* class BOPTools_AlgoTools *
***************************/
class BOPTools_AlgoTools {
	public:
		/****** BOPTools_AlgoTools::AreFacesSameDomain ******/
		/****** md5 signature: f19a161cde21c66b6d9731224fae68c3 ******/
		%feature("compactdefaultargs") AreFacesSameDomain;
		%feature("autodoc", "
Parameters
----------
theF1: TopoDS_Face
theF2: TopoDS_Face
theContext: IntTools_Context
theFuzz: float (optional, default to Precision::Confusion())

Return
-------
bool

Description
-----------
Checking if the faces are coinciding Checks if the given faces are same-domain, i.e. coincide.
") AreFacesSameDomain;
		static Standard_Boolean AreFacesSameDomain(const TopoDS_Face & theF1, const TopoDS_Face & theF2, const opencascade::handle<IntTools_Context> & theContext, const Standard_Real theFuzz = Precision::Confusion());

		/****** BOPTools_AlgoTools::ComputeState ******/
		/****** md5 signature: e1da6e0dddf6168f52e3a834aad1830a ******/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt
theSolid: TopoDS_Solid
theTol: float
theContext: IntTools_Context

Return
-------
TopAbs_State

Description
-----------
Computes the 3-D state of the point thePoint toward solid theSolid. theTol - value of precision of computation theContext- cached geometrical tools Returns 3-D state.
") ComputeState;
		static TopAbs_State ComputeState(const gp_Pnt & thePoint, const TopoDS_Solid & theSolid, const Standard_Real theTol, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::ComputeState ******/
		/****** md5 signature: 0e8d68857685f81b632e860a849d408b ******/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "
Parameters
----------
theVertex: TopoDS_Vertex
theSolid: TopoDS_Solid
theTol: float
theContext: IntTools_Context

Return
-------
TopAbs_State

Description
-----------
Computes the 3-D state of the vertex theVertex toward solid theSolid. theTol - value of precision of computation theContext- cached geometrical tools Returns 3-D state.
") ComputeState;
		static TopAbs_State ComputeState(const TopoDS_Vertex & theVertex, const TopoDS_Solid & theSolid, const Standard_Real theTol, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::ComputeState ******/
		/****** md5 signature: 07abb3cbea99ca44435f7dfed83dfdd6 ******/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theSolid: TopoDS_Solid
theTol: float
theContext: IntTools_Context

Return
-------
TopAbs_State

Description
-----------
Computes the 3-D state of the edge theEdge toward solid theSolid. theTol - value of precision of computation theContext- cached geometrical tools Returns 3-D state.
") ComputeState;
		static TopAbs_State ComputeState(const TopoDS_Edge & theEdge, const TopoDS_Solid & theSolid, const Standard_Real theTol, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::ComputeState ******/
		/****** md5 signature: 613ab8d336b931c1067e3f19202d5361 ******/
		%feature("compactdefaultargs") ComputeState;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theSolid: TopoDS_Solid
theTol: float
theBounds: TopTools_IndexedMapOfShape
theContext: IntTools_Context

Return
-------
TopAbs_State

Description
-----------
Computes the 3-D state of the face theFace toward solid theSolid. theTol - value of precision of computation theBounds - set of edges of <theSolid> to avoid theContext- cached geometrical tools Returns 3-D state.
") ComputeState;
		static TopAbs_State ComputeState(const TopoDS_Face & theFace, const TopoDS_Solid & theSolid, const Standard_Real theTol, const TopTools_IndexedMapOfShape & theBounds, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::ComputeStateByOnePoint ******/
		/****** md5 signature: b025f56a823a8059eb68e2b7f182fd84 ******/
		%feature("compactdefaultargs") ComputeStateByOnePoint;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theSolid: TopoDS_Solid
theTol: float
theContext: IntTools_Context

Return
-------
TopAbs_State

Description
-----------
Computes the 3-D state of the shape theShape toward solid theSolid. theTol - value of precision of computation theContext- cached geometrical tools Returns 3-D state.
") ComputeStateByOnePoint;
		static TopAbs_State ComputeStateByOnePoint(const TopoDS_Shape & theShape, const TopoDS_Solid & theSolid, const Standard_Real theTol, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::ComputeTolerance ******/
		/****** md5 signature: 4fdfb1ebaaf4b76d31630b511de1fb0d ******/
		%feature("compactdefaultargs") ComputeTolerance;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge

Return
-------
theMaxDist: float
theMaxPar: float

Description
-----------
Computes the necessary value of the tolerance for the edge.
") ComputeTolerance;
		static Standard_Boolean ComputeTolerance(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BOPTools_AlgoTools::ComputeVV ******/
		/****** md5 signature: ce3c2889c3813a71551b7079a9adab2b ******/
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theP: gp_Pnt
theTolP: float

Return
-------
int

Description
-----------
Intersects the vertex <theV1> with the point <theP> with tolerance <theTolP>. Returns the error status: - 0 - no error, meaning that the vertex intersects the point; - 1 - the distance between vertex and point is grater than the sum of tolerances.
") ComputeVV;
		static Standard_Integer ComputeVV(const TopoDS_Vertex & theV, const gp_Pnt & theP, const Standard_Real theTolP);

		/****** BOPTools_AlgoTools::ComputeVV ******/
		/****** md5 signature: 1152c272803dc704f9b84852434b26e2 ******/
		%feature("compactdefaultargs") ComputeVV;
		%feature("autodoc", "
Parameters
----------
theV1: TopoDS_Vertex
theV2: TopoDS_Vertex
theFuzz: float (optional, default to Precision::Confusion())

Return
-------
int

Description
-----------
Intersects the given vertices with given fuzzy value. Returns the error status: - 0 - no error, meaning that the vertices interferes with given tolerance; - 1 - the distance between vertices is grater than the sum of their tolerances.
") ComputeVV;
		static Standard_Integer ComputeVV(const TopoDS_Vertex & theV1, const TopoDS_Vertex & theV2, const Standard_Real theFuzz = Precision::Confusion());

		/****** BOPTools_AlgoTools::CopyEdge ******/
		/****** md5 signature: cb546e2ef298c5840b3996d97aa2246f ******/
		%feature("compactdefaultargs") CopyEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
TopoDS_Edge

Description
-----------
Makes a copy of <theEdge> with vertices.
") CopyEdge;
		static TopoDS_Edge CopyEdge(const TopoDS_Edge & theEdge);

		/****** BOPTools_AlgoTools::CorrectCurveOnSurface ******/
		/****** md5 signature: 10e6eb9f4a96224371686f6c20ae90c0 ******/
		%feature("compactdefaultargs") CorrectCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theMapToAvoid: TopTools_IndexedMapOfShape
theTolMax: float (optional, default to 0.0001)
theRunParallel: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Provides valid values of tolerances for the shape <theS> in terms of BRepCheck_InvalidCurveOnSurface.
") CorrectCurveOnSurface;
		static void CorrectCurveOnSurface(const TopoDS_Shape & theS, const TopTools_IndexedMapOfShape & theMapToAvoid, const Standard_Real theTolMax = 0.0001, const Standard_Boolean theRunParallel = Standard_False);

		/****** BOPTools_AlgoTools::CorrectPointOnCurve ******/
		/****** md5 signature: dd25a290a42192e5b7e5e25d15a694ee ******/
		%feature("compactdefaultargs") CorrectPointOnCurve;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theMapToAvoid: TopTools_IndexedMapOfShape
theTolMax: float (optional, default to 0.0001)
theRunParallel: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Provides valid values of tolerances for the shape <theS> in terms of BRepCheck_InvalidPointOnCurve.
") CorrectPointOnCurve;
		static void CorrectPointOnCurve(const TopoDS_Shape & theS, const TopTools_IndexedMapOfShape & theMapToAvoid, const Standard_Real theTolMax = 0.0001, const Standard_Boolean theRunParallel = Standard_False);

		/****** BOPTools_AlgoTools::CorrectRange ******/
		/****** md5 signature: 1d43794148dcee778ea6198feb9555eb ******/
		%feature("compactdefaultargs") CorrectRange;
		%feature("autodoc", "
Parameters
----------
aE1: TopoDS_Edge
aE2: TopoDS_Edge
aSR: IntTools_Range
aNewSR: IntTools_Range

Return
-------
None

Description
-----------
Correct shrunk range <aSR> taking into account 3D-curve resolution and corresponding tolerance values of <aE1>, <aE2>.
") CorrectRange;
		static void CorrectRange(const TopoDS_Edge & aE1, const TopoDS_Edge & aE2, const IntTools_Range & aSR, IntTools_Range & aNewSR);

		/****** BOPTools_AlgoTools::CorrectRange ******/
		/****** md5 signature: b869bcda69d543a929cd0189038ab247 ******/
		%feature("compactdefaultargs") CorrectRange;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aSR: IntTools_Range
aNewSR: IntTools_Range

Return
-------
None

Description
-----------
Correct shrunk range <aSR> taking into account 3D-curve resolution and corresponding tolerance values of <aE>, <aF>.
") CorrectRange;
		static void CorrectRange(const TopoDS_Edge & aE, const TopoDS_Face & aF, const IntTools_Range & aSR, IntTools_Range & aNewSR);

		/****** BOPTools_AlgoTools::CorrectShapeTolerances ******/
		/****** md5 signature: 779ed39723dda01baad62e4986778cba ******/
		%feature("compactdefaultargs") CorrectShapeTolerances;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theMapToAvoid: TopTools_IndexedMapOfShape
theRunParallel: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Corrects tolerance values of the sub-shapes of the shape <theS> if needed.
") CorrectShapeTolerances;
		static void CorrectShapeTolerances(const TopoDS_Shape & theS, const TopTools_IndexedMapOfShape & theMapToAvoid, const Standard_Boolean theRunParallel = Standard_False);

		/****** BOPTools_AlgoTools::CorrectTolerances ******/
		/****** md5 signature: 2fa2989532a10025b0282c9f0792a848 ******/
		%feature("compactdefaultargs") CorrectTolerances;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theMapToAvoid: TopTools_IndexedMapOfShape
theTolMax: float (optional, default to 0.0001)
theRunParallel: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Provides valid values of tolerances for the shape <theS> <theTolMax> is max value of the tolerance that can be accepted for correction. If real value of the tolerance will be greater than <aTolMax>, the correction does not perform.
") CorrectTolerances;
		static void CorrectTolerances(const TopoDS_Shape & theS, const TopTools_IndexedMapOfShape & theMapToAvoid, const Standard_Real theTolMax = 0.0001, const Standard_Boolean theRunParallel = Standard_False);

		/****** BOPTools_AlgoTools::DTolerance ******/
		/****** md5 signature: 075ca2e9d4910a8f1018c8adbac7e64d ******/
		%feature("compactdefaultargs") DTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Additional tolerance (delta tolerance) is used in Boolean Operations to ensure that the tolerance of new/old entities obtained by intersection of two shapes is slightly bigger than the actual distances to these shapes. It helps to avoid numerical instability which may occur when comparing distances and tolerances.
") DTolerance;
		static Standard_Real DTolerance();

		/****** BOPTools_AlgoTools::Dimension ******/
		/****** md5 signature: 348038e7dc0c04e091d0a280a71bd60d ******/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
int

Description
-----------
Returns dimension of the shape <theS>. If the shape contains elements of different dimension, -1 is returned.
") Dimension;
		static Standard_Integer Dimension(const TopoDS_Shape & theS);

		/****** BOPTools_AlgoTools::Dimensions ******/
		/****** md5 signature: 485029a60f5198c2ef6a429c06efcd81 ******/
		%feature("compactdefaultargs") Dimensions;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape

Return
-------
theDMin: int
theDMax: int

Description
-----------
Returns the min and max dimensions of the shape <theS>.
") Dimensions;
		static void Dimensions(const TopoDS_Shape & theS, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BOPTools_AlgoTools::GetEdgeOff ******/
		/****** md5 signature: f9ff0abb00c2f2593eff9881311221cd ******/
		%feature("compactdefaultargs") GetEdgeOff;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theEdgeOff: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns True if the face theFace contains the edge theEdge but with opposite orientation. If the method returns True theEdgeOff is the edge founded.
") GetEdgeOff;
		static Standard_Boolean GetEdgeOff(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, TopoDS_Edge & theEdgeOff);

		/****** BOPTools_AlgoTools::GetEdgeOnFace ******/
		/****** md5 signature: 0e11d8dc0b657d498bdb441974222906 ******/
		%feature("compactdefaultargs") GetEdgeOnFace;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theEdgeOnF: TopoDS_Edge

Return
-------
bool

Description
-----------
For the face theFace gets the edge theEdgeOnF that is the same as theEdge Returns True if such edge exists Returns False if there is no such edge.
") GetEdgeOnFace;
		static Standard_Boolean GetEdgeOnFace(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, TopoDS_Edge & theEdgeOnF);

		/****** BOPTools_AlgoTools::GetFaceOff ******/
		/****** md5 signature: 64851eed7f9e8632025e1105ca710a20 ******/
		%feature("compactdefaultargs") GetFaceOff;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theFace: TopoDS_Face
theLCEF: BOPTools_ListOfCoupleOfShape
theFaceOff: TopoDS_Face
theContext: IntTools_Context

Return
-------
bool

Description
-----------
For the face theFace and its edge theEdge finds the face suitable to produce shell. theLCEF - set of faces to search. All faces from theLCEF must share edge theEdge.
") GetFaceOff;
		static Standard_Boolean GetFaceOff(const TopoDS_Edge & theEdge, const TopoDS_Face & theFace, BOPTools_ListOfCoupleOfShape & theLCEF, TopoDS_Face & theFaceOff, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::IsBlockInOnFace ******/
		/****** md5 signature: 0a530195aed4f2f6869b608c9e8dbd2d ******/
		%feature("compactdefaultargs") IsBlockInOnFace;
		%feature("autodoc", "
Parameters
----------
aShR: IntTools_Range
aF: TopoDS_Face
aE: TopoDS_Edge
aContext: IntTools_Context

Return
-------
bool

Description
-----------
Returns True if PaveBlock <aPB> lays on the face <aF>, i.e the <PB> is IN or ON in 2D of <aF>.
") IsBlockInOnFace;
		static Standard_Boolean IsBlockInOnFace(const IntTools_Range & aShR, const TopoDS_Face & aF, const TopoDS_Edge & aE, const opencascade::handle<IntTools_Context> & aContext);

		/****** BOPTools_AlgoTools::IsHole ******/
		/****** md5 signature: 16350fb929e278089d74b09ce926512b ******/
		%feature("compactdefaultargs") IsHole;
		%feature("autodoc", "
Parameters
----------
theW: TopoDS_Shape
theF: TopoDS_Shape

Return
-------
bool

Description
-----------
Checks if the wire is a hole for the face.
") IsHole;
		static Standard_Boolean IsHole(const TopoDS_Shape & theW, const TopoDS_Shape & theF);

		/****** BOPTools_AlgoTools::IsInternalFace ******/
		/****** md5 signature: 158ceb98611c9190a402b54fc4233804 ******/
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge
theFace1: TopoDS_Face
theFace2: TopoDS_Face
theContext: IntTools_Context

Return
-------
int

Description
-----------
Returns True if the face theFace is inside of the couple of faces theFace1, theFace2. The faces theFace, theFace1, theFace2 must share the edge theEdge Return values: * 0 state is not IN * 1 state is IN * 2 state can not be found by the method of angles.
") IsInternalFace;
		static Standard_Integer IsInternalFace(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge, const TopoDS_Face & theFace1, const TopoDS_Face & theFace2, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::IsInternalFace ******/
		/****** md5 signature: ef3d71c29b8862372e271068609aff5d ******/
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theEdge: TopoDS_Edge
theLF: TopTools_ListOfShape
theContext: IntTools_Context

Return
-------
int

Description
-----------
Returns True if the face theFace is inside of the appropriate couple of faces (from the set theLF) . The faces of the set theLF and theFace must share the edge theEdge * 0 state is not IN * 1 state is IN * 2 state can not be found by the method of angles.
") IsInternalFace;
		static Standard_Integer IsInternalFace(const TopoDS_Face & theFace, const TopoDS_Edge & theEdge, TopTools_ListOfShape & theLF, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::IsInternalFace ******/
		/****** md5 signature: d0cf743dc3c8deca3bd05e2d6d3d3021 ******/
		%feature("compactdefaultargs") IsInternalFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theSolid: TopoDS_Solid
theMEF: TopTools_IndexedDataMapOfShapeListOfShape
theTol: float
theContext: IntTools_Context

Return
-------
bool

Description
-----------
Returns True if the face theFace is inside the solid theSolid. theMEF - Map Edge/Faces for theSolid theTol - value of precision of computation theContext- cached geometrical tools.
") IsInternalFace;
		static Standard_Boolean IsInternalFace(const TopoDS_Face & theFace, const TopoDS_Solid & theSolid, TopTools_IndexedDataMapOfShapeListOfShape & theMEF, const Standard_Real theTol, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::IsInvertedSolid ******/
		/****** md5 signature: 1452a0a79b70e8f5fe2cd3c3e8f9b78a ******/
		%feature("compactdefaultargs") IsInvertedSolid;
		%feature("autodoc", "
Parameters
----------
theSolid: TopoDS_Solid

Return
-------
bool

Description
-----------
Returns true if the solid <theSolid> is inverted.
") IsInvertedSolid;
		static Standard_Boolean IsInvertedSolid(const TopoDS_Solid & theSolid);

		/****** BOPTools_AlgoTools::IsMicroEdge ******/
		/****** md5 signature: d73c5d5d7a5e25bd1a97838d4b7775dc ******/
		%feature("compactdefaultargs") IsMicroEdge;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge
theContext: IntTools_Context
theCheckSplittable: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Checks if it is possible to compute shrunk range for the edge <aE> Flag <theCheckSplittable> defines whether to take into account the possibility to split the edge or not.
") IsMicroEdge;
		static Standard_Boolean IsMicroEdge(const TopoDS_Edge & theEdge, const opencascade::handle<IntTools_Context> & theContext, const Standard_Boolean theCheckSplittable = Standard_True);

		/****** BOPTools_AlgoTools::IsOpenShell ******/
		/****** md5 signature: a5c32af687e24a03aee16645b11f6a05 ******/
		%feature("compactdefaultargs") IsOpenShell;
		%feature("autodoc", "
Parameters
----------
theShell: TopoDS_Shell

Return
-------
bool

Description
-----------
Returns true if the shell <theShell> is open.
") IsOpenShell;
		static Standard_Boolean IsOpenShell(const TopoDS_Shell & theShell);

		/****** BOPTools_AlgoTools::IsSplitToReverse ******/
		/****** md5 signature: 6dca305aeb7fd21e742843dd4184640f ******/
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "
Parameters
----------
theSplit: TopoDS_Shape
theShape: TopoDS_Shape
theContext: IntTools_Context
theError: int * (optional, default to NULL)

Return
-------
bool

Description
-----------
Checks if the direction of the split shape is opposite to the direction of the original shape. The method is an overload for (Edge,Edge) and (Face,Face) corresponding methods and checks only these types of shapes. For faces the method checks if normal directions are opposite. For edges the method checks if tangent vectors are opposite. //! In case the directions do not coincide, it returns True, meaning that split shape has to be reversed to match the direction of the original shape. //! If requested (<theError> is not null), the method returns the status of the operation: - 0 - no error; - Error from (Edge,Edge) or (Face,Face) corresponding method - 100 - bad types. In case of any error the method always returns False. //! 
Input parameter: theSplit Split shape 
Input parameter: theShape Original shape 
Input parameter: theContext cached geometrical tools @param[out] theError Error Status of the operation.
") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse(const TopoDS_Shape & theSplit, const TopoDS_Shape & theShape, const opencascade::handle<IntTools_Context> & theContext, Standard_Integer * theError = NULL);

		/****** BOPTools_AlgoTools::IsSplitToReverse ******/
		/****** md5 signature: a442a1278308b2eef20ed84d8ecc93fd ******/
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "
Parameters
----------
theSplit: TopoDS_Face
theShape: TopoDS_Face
theContext: IntTools_Context
theError: int * (optional, default to NULL)

Return
-------
bool

Description
-----------
Checks if the normal direction of the split face is opposite to the normal direction of the original face. The normal directions for both faces are taken in the same point - point inside the split face is projected onto the original face. Returns True if the normals do not coincide, meaning the necessity to revert the orientation of the split face to match the direction of the original face. //! If requested (<theError> is not null), the method returns the status of the operation: - 0 - no error; - 1 - unable to find the point inside split face; - 2 - unable to compute the normal for the split face; - 3 - unable to project the point inside the split face on the original face; - 4 - unable to compute the normal for the original face. In case of any error the method always returns False. //! 
Input parameter: theSplit Split face 
Input parameter: theShape Original face 
Input parameter: theContext cached geometrical tools @param[out] theError Error Status of the operation.
") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse(const TopoDS_Face & theSplit, const TopoDS_Face & theShape, const opencascade::handle<IntTools_Context> & theContext, Standard_Integer * theError = NULL);

		/****** BOPTools_AlgoTools::IsSplitToReverse ******/
		/****** md5 signature: db1c9d5e59695f6d3bb15e0065a0cb7c ******/
		%feature("compactdefaultargs") IsSplitToReverse;
		%feature("autodoc", "
Parameters
----------
theSplit: TopoDS_Edge
theShape: TopoDS_Edge
theContext: IntTools_Context
theError: int * (optional, default to NULL)

Return
-------
bool

Description
-----------
Checks if the tangent vector of the split edge is opposite to the tangent vector of the original edge. The tangent vectors for both edges are computed in the same point - point inside the split edge is projected onto the original edge. Returns True if the tangent vectors do not coincide, meaning the necessity to revert the orientation of the split edge to match the direction of the original edge. //! If requested (<theError> is not null), the method returns the status of the operation: - 0 - no error; - 1 - degenerated edges are given; - 2 - unable to compute the tangent vector for the split edge; - 3 - unable to project the point inside the split edge on the original edge; - 4 - unable to compute the tangent vector for the original edge; In case of any error the method always returns False. //! 
Input parameter: theSplit Split edge 
Input parameter: theShape Original edge 
Input parameter: theContext cached geometrical tools @param[out] theError Error Status of the operation.
") IsSplitToReverse;
		static Standard_Boolean IsSplitToReverse(const TopoDS_Edge & theSplit, const TopoDS_Edge & theShape, const opencascade::handle<IntTools_Context> & theContext, Standard_Integer * theError = NULL);

		/****** BOPTools_AlgoTools::IsSplitToReverseWithWarn ******/
		/****** md5 signature: fbda1a9b6060691a6d3b9849776e0dd2 ******/
		%feature("compactdefaultargs") IsSplitToReverseWithWarn;
		%feature("autodoc", "
Parameters
----------
theSplit: TopoDS_Shape
theShape: TopoDS_Shape
theContext: IntTools_Context
theReport: Message_Report (optional, default to NULL)

Return
-------
bool

Description
-----------
Add-on for the *IsSplitToReverse()* to check for its errors and in case of any add the *BOPAlgo_AlertUnableToOrientTheShape* warning to the report.
") IsSplitToReverseWithWarn;
		static Standard_Boolean IsSplitToReverseWithWarn(const TopoDS_Shape & theSplit, const TopoDS_Shape & theShape, const opencascade::handle<IntTools_Context> & theContext, const opencascade::handle<Message_Report> & theReport = NULL);

		/****** BOPTools_AlgoTools::MakeConnexityBlock ******/
		/****** md5 signature: b7df8e82e607190cf7b0d31cdf0e2e3f ******/
		%feature("compactdefaultargs") MakeConnexityBlock;
		%feature("autodoc", "
Parameters
----------
theLS: TopTools_ListOfShape
theMapAvoid: TopTools_IndexedMapOfShape
theLSCB: TopTools_ListOfShape
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
For the list of faces theLS build block theLSCB in terms of connexity by edges theMapAvoid - set of edges to avoid for the treatment.
") MakeConnexityBlock;
		static void MakeConnexityBlock(TopTools_ListOfShape & theLS, TopTools_IndexedMapOfShape & theMapAvoid, TopTools_ListOfShape & theLSCB, const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPTools_AlgoTools::MakeConnexityBlocks ******/
		/****** md5 signature: 1d845647893fe0ad8b655563e0e2896c ******/
		%feature("compactdefaultargs") MakeConnexityBlocks;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theConnectionType: TopAbs_ShapeEnum
theElementType: TopAbs_ShapeEnum
theLCB: TopTools_ListOfShape

Return
-------
None

Description
-----------
For the compound <theS> builds the blocks (compounds) of elements of type <theElementType> connected through the shapes of the type <theConnectionType>. The blocks are stored into the list <theLCB>.
") MakeConnexityBlocks;
		static void MakeConnexityBlocks(const TopoDS_Shape & theS, const TopAbs_ShapeEnum theConnectionType, const TopAbs_ShapeEnum theElementType, TopTools_ListOfShape & theLCB);

		/****** BOPTools_AlgoTools::MakeConnexityBlocks ******/
		/****** md5 signature: b12c70a2c8443f1c36f9af9ba8b4ac80 ******/
		%feature("compactdefaultargs") MakeConnexityBlocks;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theConnectionType: TopAbs_ShapeEnum
theElementType: TopAbs_ShapeEnum
theLCB: TopTools_ListOfListOfShape
theConnectionMap: TopTools_IndexedDataMapOfShapeListOfShape

Return
-------
None

Description
-----------
For the compound <theS> builds the blocks (compounds) of elements of type <theElementType> connected through the shapes of the type <theConnectionType>. The blocks are stored into the list of lists <theLCB>. Returns also the connection map <theConnectionMap>, filled during operation.
") MakeConnexityBlocks;
		static void MakeConnexityBlocks(const TopoDS_Shape & theS, const TopAbs_ShapeEnum theConnectionType, const TopAbs_ShapeEnum theElementType, TopTools_ListOfListOfShape & theLCB, TopTools_IndexedDataMapOfShapeListOfShape & theConnectionMap);

		/****** BOPTools_AlgoTools::MakeConnexityBlocks ******/
		/****** md5 signature: bb4aea338b418a5a1c4628df310b8238 ******/
		%feature("compactdefaultargs") MakeConnexityBlocks;
		%feature("autodoc", "
Parameters
----------
theLS: TopTools_ListOfShape
theConnectionType: TopAbs_ShapeEnum
theElementType: TopAbs_ShapeEnum
theLCB: BOPTools_ListOfConnexityBlock

Return
-------
None

Description
-----------
Makes connexity blocks of elements of the given type with the given type of the connecting elements. The blocks are checked on regularity (multi-connectivity) and stored to the list of blocks <theLCB>.
") MakeConnexityBlocks;
		static void MakeConnexityBlocks(const TopTools_ListOfShape & theLS, const TopAbs_ShapeEnum theConnectionType, const TopAbs_ShapeEnum theElementType, BOPTools_ListOfConnexityBlock & theLCB);

		/****** BOPTools_AlgoTools::MakeContainer ******/
		/****** md5 signature: d164053e2421f42b427ee6ca8c740ef3 ******/
		%feature("compactdefaultargs") MakeContainer;
		%feature("autodoc", "
Parameters
----------
theType: TopAbs_ShapeEnum
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Makes empty container of requested type.
") MakeContainer;
		static void MakeContainer(const TopAbs_ShapeEnum theType, TopoDS_Shape & theShape);

		/****** BOPTools_AlgoTools::MakeEdge ******/
		/****** md5 signature: b44b1e692b1f84e15ce8b2e982731375 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
theCurve: IntTools_Curve
theV1: TopoDS_Vertex
theT1: float
theV2: TopoDS_Vertex
theT2: float
theTolR3D: float
theE: TopoDS_Edge

Return
-------
None

Description
-----------
Makes the edge based on the given curve with given bounding vertices.
") MakeEdge;
		static void MakeEdge(const IntTools_Curve & theCurve, const TopoDS_Vertex & theV1, const Standard_Real theT1, const TopoDS_Vertex & theV2, const Standard_Real theT2, const Standard_Real theTolR3D, TopoDS_Edge & theE);

		/****** BOPTools_AlgoTools::MakeNewVertex ******/
		/****** md5 signature: 20aff0c1048b5c5c0a4a448e2877799c ******/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "
Parameters
----------
aP1: gp_Pnt
aTol: float
aNewVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Make a vertex using 3D-point <aP1> and 3D-tolerance value <aTol>.
") MakeNewVertex;
		static void MakeNewVertex(const gp_Pnt & aP1, const Standard_Real aTol, TopoDS_Vertex & aNewVertex);

		/****** BOPTools_AlgoTools::MakeNewVertex ******/
		/****** md5 signature: e8f9b3aed21c857920517234e2cb3d4c ******/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "
Parameters
----------
aV1: TopoDS_Vertex
aV2: TopoDS_Vertex
aNewVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Make a vertex using couple of vertices <aV1, aV2>.
") MakeNewVertex;
		static void MakeNewVertex(const TopoDS_Vertex & aV1, const TopoDS_Vertex & aV2, TopoDS_Vertex & aNewVertex);

		/****** BOPTools_AlgoTools::MakeNewVertex ******/
		/****** md5 signature: 8b8a909912cc829455275d8c562e22a4 ******/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "
Parameters
----------
aE1: TopoDS_Edge
aP1: float
aE2: TopoDS_Edge
aP2: float
aNewVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Make a vertex in place of intersection between two edges <aE1, aE2> with parameters <aP1, aP2>.
") MakeNewVertex;
		static void MakeNewVertex(const TopoDS_Edge & aE1, const Standard_Real aP1, const TopoDS_Edge & aE2, const Standard_Real aP2, TopoDS_Vertex & aNewVertex);

		/****** BOPTools_AlgoTools::MakeNewVertex ******/
		/****** md5 signature: 12c18f3b7c437a6229e434be5765471e ******/
		%feature("compactdefaultargs") MakeNewVertex;
		%feature("autodoc", "
Parameters
----------
aE1: TopoDS_Edge
aP1: float
aF2: TopoDS_Face
aNewVertex: TopoDS_Vertex

Return
-------
None

Description
-----------
Make a vertex in place of intersection between the edge <aE1> with parameter <aP1> and the face <aF2>.
") MakeNewVertex;
		static void MakeNewVertex(const TopoDS_Edge & aE1, const Standard_Real aP1, const TopoDS_Face & aF2, TopoDS_Vertex & aNewVertex);

		/****** BOPTools_AlgoTools::MakePCurve ******/
		/****** md5 signature: 8bbdbc99fd96168957f47b3153252374 ******/
		%feature("compactdefaultargs") MakePCurve;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
theF1: TopoDS_Face
theF2: TopoDS_Face
theCurve: IntTools_Curve
thePC1: bool
thePC2: bool
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Makes 2d curve of the edge <theE> on the faces <theF1> and <theF2>. <theContext> - storage for caching the geometrical tools.
") MakePCurve;
		static void MakePCurve(const TopoDS_Edge & theE, const TopoDS_Face & theF1, const TopoDS_Face & theF2, const IntTools_Curve & theCurve, const Standard_Boolean thePC1, const Standard_Boolean thePC2, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools::MakeSectEdge ******/
		/****** md5 signature: c8c6abde60f8f50c47ff89728e6814bd ******/
		%feature("compactdefaultargs") MakeSectEdge;
		%feature("autodoc", "
Parameters
----------
aIC: IntTools_Curve
aV1: TopoDS_Vertex
aP1: float
aV2: TopoDS_Vertex
aP2: float
aNewEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Make the edge from 3D-Curve <aIC> and two vertices <aV1,aV2> at parameters <aP1,aP2>.
") MakeSectEdge;
		static void MakeSectEdge(const IntTools_Curve & aIC, const TopoDS_Vertex & aV1, const Standard_Real aP1, const TopoDS_Vertex & aV2, const Standard_Real aP2, TopoDS_Edge & aNewEdge);

		/****** BOPTools_AlgoTools::MakeSplitEdge ******/
		/****** md5 signature: 0acf5ac7a732e796dbde53c34f933d47 ******/
		%feature("compactdefaultargs") MakeSplitEdge;
		%feature("autodoc", "
Parameters
----------
aE1: TopoDS_Edge
aV1: TopoDS_Vertex
aP1: float
aV2: TopoDS_Vertex
aP2: float
aNewEdge: TopoDS_Edge

Return
-------
None

Description
-----------
Make the edge from base edge <aE1> and two vertices <aV1,aV2> at parameters <aP1,aP2>.
") MakeSplitEdge;
		static void MakeSplitEdge(const TopoDS_Edge & aE1, const TopoDS_Vertex & aV1, const Standard_Real aP1, const TopoDS_Vertex & aV2, const Standard_Real aP2, TopoDS_Edge & aNewEdge);

		/****** BOPTools_AlgoTools::MakeVertex ******/
		/****** md5 signature: c738caacf439f5a59ed8d30ee737580f ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
theLV: TopTools_ListOfShape
theV: TopoDS_Vertex

Return
-------
None

Description
-----------
Makes the vertex in the middle of given vertices with the tolerance covering all tolerance spheres of vertices.
") MakeVertex;
		static void MakeVertex(const TopTools_ListOfShape & theLV, TopoDS_Vertex & theV);

		/****** BOPTools_AlgoTools::OrientEdgesOnWire ******/
		/****** md5 signature: 3119ef215b80e42dba9486eca423d427 ******/
		%feature("compactdefaultargs") OrientEdgesOnWire;
		%feature("autodoc", "
Parameters
----------
theWire: TopoDS_Shape

Return
-------
None

Description
-----------
Correctly orients edges on the wire.
") OrientEdgesOnWire;
		static void OrientEdgesOnWire(TopoDS_Shape & theWire);

		/****** BOPTools_AlgoTools::OrientFacesOnShell ******/
		/****** md5 signature: 138da3099ae4c9981676404bd500db7d ******/
		%feature("compactdefaultargs") OrientFacesOnShell;
		%feature("autodoc", "
Parameters
----------
theShell: TopoDS_Shape

Return
-------
None

Description
-----------
Correctly orients faces on the shell.
") OrientFacesOnShell;
		static void OrientFacesOnShell(TopoDS_Shape & theShell);

		/****** BOPTools_AlgoTools::PointOnEdge ******/
		/****** md5 signature: efda6336f7826223dac800f528eaf90a ******/
		%feature("compactdefaultargs") PointOnEdge;
		%feature("autodoc", "
Parameters
----------
aEdge: TopoDS_Edge
aPrm: float
aP: gp_Pnt

Return
-------
None

Description
-----------
Compute a 3D-point on the edge <aEdge> at parameter <aPrm>.
") PointOnEdge;
		static void PointOnEdge(const TopoDS_Edge & aEdge, const Standard_Real aPrm, gp_Pnt & aP);

		/****** BOPTools_AlgoTools::Sense ******/
		/****** md5 signature: 76462cc1a9fbb8274cf2ed746aa1a8f5 ******/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "
Parameters
----------
theF1: TopoDS_Face
theF2: TopoDS_Face
theContext: IntTools_Context

Return
-------
int

Description
-----------
Checks if the normals direction of the given faces computed near the shared edge coincide. Returns the status of operation: * 0 - in case of error (shared edge not found or directions are not collinear) * 1 - normal directions coincide; * -1 - normal directions are opposite.
") Sense;
		static Standard_Integer Sense(const TopoDS_Face & theF1, const TopoDS_Face & theF2, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools::TreatCompound ******/
		/****** md5 signature: de5d3c86660c5bbcc7b54c5705952878 ******/
		%feature("compactdefaultargs") TreatCompound;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theList: TopTools_ListOfShape
theMap: TopTools_MapOfShape * (optional, default to NULL)

Return
-------
None

Description
-----------
Collects in the output list recursively all non-compound sub-shapes of the first level of the given shape theS. The optional map theMap is used to avoid the duplicates in the output list, so it will also contain all non-compound sub-shapes.
") TreatCompound;
		static void TreatCompound(const TopoDS_Shape & theS, TopTools_ListOfShape & theList, TopTools_MapOfShape * theMap = NULL);

		/****** BOPTools_AlgoTools::UpdateVertex ******/
		/****** md5 signature: 5e037b5f776c89b9ff812aeeecab575f ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
aIC: IntTools_Curve
aT: float
aV: TopoDS_Vertex

Return
-------
None

Description
-----------
Update the tolerance value for vertex <aV> taking into account the fact that <aV> lays on the curve <aIC>.
") UpdateVertex;
		static void UpdateVertex(const IntTools_Curve & aIC, const Standard_Real aT, const TopoDS_Vertex & aV);

		/****** BOPTools_AlgoTools::UpdateVertex ******/
		/****** md5 signature: ab6e5c4eb33ee08a8d5d38547e7d4eae ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aT: float
aV: TopoDS_Vertex

Return
-------
None

Description
-----------
Update the tolerance value for vertex <aV> taking into account the fact that <aV> lays on the edge <aE>.
") UpdateVertex;
		static void UpdateVertex(const TopoDS_Edge & aE, const Standard_Real aT, const TopoDS_Vertex & aV);

		/****** BOPTools_AlgoTools::UpdateVertex ******/
		/****** md5 signature: 72d4d1d8b5f8f681ed272bca91d39668 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
aVF: TopoDS_Vertex
aVN: TopoDS_Vertex

Return
-------
None

Description
-----------
Update the tolerance value for vertex <aVN> taking into account the fact that <aVN> should cover tolerance zone of <aVF>.
") UpdateVertex;
		static void UpdateVertex(const TopoDS_Vertex & aVF, const TopoDS_Vertex & aVN);

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
		/****** BOPTools_AlgoTools2D::AdjustPCurveOnFace ******/
		/****** md5 signature: 6d1118c3873bca73de508e130c1b23cc ******/
		%feature("compactdefaultargs") AdjustPCurveOnFace;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theC3D: Geom_Curve
theC2D: Geom2d_Curve
theC2DA: Geom2d_Curve
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Adjust P-Curve <theC2D> (3D-curve <theC3D>) on surface of the face <theF>. <theContext> - storage for caching the geometrical tools.
") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace(const TopoDS_Face & theF, const opencascade::handle<Geom_Curve> & theC3D, const opencascade::handle<Geom2d_Curve> & theC2D, opencascade::handle<Geom2d_Curve> & theC2DA, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::AdjustPCurveOnFace ******/
		/****** md5 signature: 73b4d6c2d8ce8f742911e4b1bd3424f5 ******/
		%feature("compactdefaultargs") AdjustPCurveOnFace;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theFirst: float
theLast: float
theC2D: Geom2d_Curve
theC2DA: Geom2d_Curve
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> . [aT1, aT2] - range to adjust <theContext> - storage for caching the geometrical tools.
") AdjustPCurveOnFace;
		static void AdjustPCurveOnFace(const TopoDS_Face & theF, const Standard_Real theFirst, const Standard_Real theLast, const opencascade::handle<Geom2d_Curve> & theC2D, opencascade::handle<Geom2d_Curve> & theC2DA, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::AdjustPCurveOnSurf ******/
		/****** md5 signature: 9f66aa04ccc5fe5ab7f76a83eca55926 ******/
		%feature("compactdefaultargs") AdjustPCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
aF: BRepAdaptor_Surface
aT1: float
aT2: float
aC2D: Geom2d_Curve
aC2DA: Geom2d_Curve

Return
-------
None

Description
-----------
Adjust P-Curve <aC2D> (3D-curve <C3D>) on surface <aF> . [aT1, aT2] - range to adjust.
") AdjustPCurveOnSurf;
		static void AdjustPCurveOnSurf(const BRepAdaptor_Surface & aF, const Standard_Real aT1, const Standard_Real aT2, const opencascade::handle<Geom2d_Curve> & aC2D, opencascade::handle<Geom2d_Curve> & aC2DA);

		/****** BOPTools_AlgoTools2D::AttachExistingPCurve ******/
		/****** md5 signature: d2c950c6e7103dd55a431f337bd524de ******/
		%feature("compactdefaultargs") AttachExistingPCurve;
		%feature("autodoc", "
Parameters
----------
aEold: TopoDS_Edge
aEnew: TopoDS_Edge
aF: TopoDS_Face
aCtx: IntTools_Context

Return
-------
int

Description
-----------
Attach P-Curve from the edge <aEold> on surface <aF> to the edge <aEnew> Returns 0 in case of success.
") AttachExistingPCurve;
		static Standard_Integer AttachExistingPCurve(const TopoDS_Edge & aEold, const TopoDS_Edge & aEnew, const TopoDS_Face & aF, const opencascade::handle<IntTools_Context> & aCtx);

		/****** BOPTools_AlgoTools2D::BuildPCurveForEdgeOnFace ******/
		/****** md5 signature: 9d16532ebffa946107d9612c7596ff2e ******/
		%feature("compactdefaultargs") BuildPCurveForEdgeOnFace;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Compute P-Curve for the edge <aE> on the face <aF>. Raises exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools.
") BuildPCurveForEdgeOnFace;
		static void BuildPCurveForEdgeOnFace(const TopoDS_Edge & aE, const TopoDS_Face & aF, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::CurveOnSurface ******/
		/****** md5 signature: df3a833e56d9d7562127ad18d8051975 ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aC: Geom2d_Curve
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
aToler: float

Description
-----------
Get P-Curve <aC> for the edge <aE> on surface <aF> . If the P-Curve does not exist, build it using Make2D(). [aToler] - reached tolerance Raises exception Standard_ConstructionError if algorithm Make2D() fails. <theContext> - storage for caching the geometrical tools.
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & aE, const TopoDS_Face & aF, opencascade::handle<Geom2d_Curve> & aC, Standard_Real &OutValue, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::CurveOnSurface ******/
		/****** md5 signature: e2898c58b122e827bd654617de4aca96 ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aC: Geom2d_Curve
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
aFirst: float
aLast: float
aToler: float

Description
-----------
Get P-Curve <aC> for the edge <aE> on surface <aF> . If the P-Curve does not exist, build it using Make2D(). [aFirst, aLast] - range of the P-Curve [aToler] - reached tolerance Raises exception Standard_ConstructionError if algorithm Make2D() fails. <theContext> - storage for caching the geometrical tools.
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & aE, const TopoDS_Face & aF, opencascade::handle<Geom2d_Curve> & aC, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::EdgeTangent ******/
		/****** md5 signature: 5761815d648dad69375685b041b42424 ******/
		%feature("compactdefaultargs") EdgeTangent;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge
aT: float
Tau: gp_Vec

Return
-------
bool

Description
-----------
Compute tangent for the edge <aE> [in 3D] at parameter <aT>.
") EdgeTangent;
		static Standard_Boolean EdgeTangent(const TopoDS_Edge & anE, const Standard_Real aT, gp_Vec & Tau);

		/****** BOPTools_AlgoTools2D::HasCurveOnSurface ******/
		/****** md5 signature: 8b08ee63182b04e9348ee1f48c35a9f2 ******/
		%feature("compactdefaultargs") HasCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aC: Geom2d_Curve

Return
-------
aFirst: float
aLast: float
aToler: float

Description
-----------
Returns True if the edge <aE> has P-Curve <aC> on surface <aF> . [aFirst, aLast] - range of the P-Curve [aToler] - reached tolerance If the P-Curve does not exist, aC.IsNull()=True.
") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface(const TopoDS_Edge & aE, const TopoDS_Face & aF, opencascade::handle<Geom2d_Curve> & aC, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BOPTools_AlgoTools2D::HasCurveOnSurface ******/
		/****** md5 signature: ed0b1e2b2daee6cab07c579768d15a31 ******/
		%feature("compactdefaultargs") HasCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if the edge <aE> has P-Curve <aC> on surface <aF> . If the P-Curve does not exist, aC.IsNull()=True.
") HasCurveOnSurface;
		static Standard_Boolean HasCurveOnSurface(const TopoDS_Edge & aE, const TopoDS_Face & aF);

		/****** BOPTools_AlgoTools2D::IntermediatePoint ******/
		/****** md5 signature: 8663f92679b0dc5e2760d0cb00974303 ******/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "
Parameters
----------
aFirst: float
aLast: float

Return
-------
float

Description
-----------
Compute intermediate value in between [aFirst, aLast] .
") IntermediatePoint;
		static Standard_Real IntermediatePoint(const Standard_Real aFirst, const Standard_Real aLast);

		/****** BOPTools_AlgoTools2D::IntermediatePoint ******/
		/****** md5 signature: ff96e71d7875046d3368a83dabf4302a ******/
		%feature("compactdefaultargs") IntermediatePoint;
		%feature("autodoc", "
Parameters
----------
anE: TopoDS_Edge

Return
-------
float

Description
-----------
Compute intermediate value of parameter for the edge <anE>.
") IntermediatePoint;
		static Standard_Real IntermediatePoint(const TopoDS_Edge & anE);

		/****** BOPTools_AlgoTools2D::IsEdgeIsoline ******/
		/****** md5 signature: f327241ed8b7983321061c77e81b5e58 ******/
		%feature("compactdefaultargs") IsEdgeIsoline;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
theF: TopoDS_Face

Return
-------
isTheUIso: bool
isTheVIso: bool

Description
-----------
Checks if CurveOnSurface of theE on theF matches with isoline of theF surface. Sets corresponding values for isTheUIso and isTheVIso variables. //! ATTENTION!!! This method is based on the comparison between direction of surface (which theF is based on) iso-lines and the direction of the edge p-curve (on theF) in middle-point of the p-curve. //! This method should be used carefully (e.g. BRep_Tool::IsClosed(...) together) in order to avoid false classification some p-curves as isoline (e.g. circle on a plane).
") IsEdgeIsoline;
		static void IsEdgeIsoline(const TopoDS_Edge & theE, const TopoDS_Face & theF, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** BOPTools_AlgoTools2D::Make2D ******/
		/****** md5 signature: 1cafd6dad2a417f7794802f509a42258 ******/
		%feature("compactdefaultargs") Make2D;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aC: Geom2d_Curve
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
aFirst: float
aLast: float
aToler: float

Description
-----------
Make P-Curve <aC> for the edge <aE> on surface <aF> . [aFirst, aLast] - range of the P-Curve [aToler] - reached tolerance Raises exception Standard_ConstructionError if algorithm fails. <theContext> - storage for caching the geometrical tools.
") Make2D;
		static void Make2D(const TopoDS_Edge & aE, const TopoDS_Face & aF, opencascade::handle<Geom2d_Curve> & aC, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::MakePCurveOnFace ******/
		/****** md5 signature: 83df2e5770a0a1e9e3908f45b8c8dd41 ******/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
C3D: Geom_Curve
aC: Geom2d_Curve
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
aToler: float

Description
-----------
Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> . [aToler] - reached tolerance Raises exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools.
") MakePCurveOnFace;
		static void MakePCurveOnFace(const TopoDS_Face & aF, const opencascade::handle<Geom_Curve> & C3D, opencascade::handle<Geom2d_Curve> & aC, Standard_Real &OutValue, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::MakePCurveOnFace ******/
		/****** md5 signature: b2a78a17fdd321c29302db9d7ddcc9b0 ******/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", "
Parameters
----------
aF: TopoDS_Face
C3D: Geom_Curve
aT1: float
aT2: float
aC: Geom2d_Curve
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
aToler: float

Description
-----------
Make P-Curve <aC> for the 3D-curve <C3D> on surface <aF> . [aT1, aT2] - range to build [aToler] - reached tolerance Raises exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools.
") MakePCurveOnFace;
		static void MakePCurveOnFace(const TopoDS_Face & aF, const opencascade::handle<Geom_Curve> & C3D, const Standard_Real aT1, const Standard_Real aT2, opencascade::handle<Geom2d_Curve> & aC, Standard_Real &OutValue, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools2D::PointOnSurface ******/
		/****** md5 signature: 610be3c3edd48240bdf3e793d5503e5a ******/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aT: float
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
U: float
V: float

Description
-----------
Compute surface parameters <U,V> of the face <aF> for the point from the edge <aE> at parameter <aT>. If <aE> has't pcurve on surface, algorithm tries to get it by projection and can raise exception Standard_ConstructionError if projection algorithm fails. <theContext> - storage for caching the geometrical tools.
") PointOnSurface;
		static void PointOnSurface(const TopoDS_Edge & aE, const TopoDS_Face & aF, const Standard_Real aT, Standard_Real &OutValue, Standard_Real &OutValue, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

};


%extend BOPTools_AlgoTools2D {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def MakeCurveOnSurface(self):
		pass
	}
};

/*****************************
* class BOPTools_AlgoTools3D *
*****************************/
class BOPTools_AlgoTools3D {
	public:
		/****** BOPTools_AlgoTools3D::DoSplitSEAMOnFace ******/
		/****** md5 signature: 317e2c98140c02945abbec924936c1ea ******/
		%feature("compactdefaultargs") DoSplitSEAMOnFace;
		%feature("autodoc", "
Parameters
----------
theESplit: TopoDS_Edge
theFace: TopoDS_Face

Return
-------
bool

Description
-----------
Makes the edge <theESplit> seam edge for the face <theFace> basing on the surface properties (U and V periods).
") DoSplitSEAMOnFace;
		static Standard_Boolean DoSplitSEAMOnFace(const TopoDS_Edge & theESplit, const TopoDS_Face & theFace);

		/****** BOPTools_AlgoTools3D::DoSplitSEAMOnFace ******/
		/****** md5 signature: 9b4cff8cc35f1c3b3a0c4ca69663cf34 ******/
		%feature("compactdefaultargs") DoSplitSEAMOnFace;
		%feature("autodoc", "
Parameters
----------
theEOrigin: TopoDS_Edge
theESplit: TopoDS_Edge
theFace: TopoDS_Face

Return
-------
bool

Description
-----------
Makes the split edge <theESplit> seam edge for the face <theFace> basing on the positions of 2d curves of the original edge <theEOrigin>.
") DoSplitSEAMOnFace;
		static Standard_Boolean DoSplitSEAMOnFace(const TopoDS_Edge & theEOrigin, const TopoDS_Edge & theESplit, const TopoDS_Face & theFace);

		/****** BOPTools_AlgoTools3D::GetApproxNormalToFaceOnEdge ******/
		/****** md5 signature: 662a57a2b13e5b445fecdd7a9db5ba05 ******/
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aT: float
aPx: gp_Pnt
aD: gp_Dir
theContext: IntTools_Context

Return
-------
bool

Description
-----------
Computes normal to the face <aF> for the 3D-point that belongs to the edge <aE> at parameter <aT>. Output: aPx - the 3D-point where the normal computed aD - the normal; Warning: The normal is computed not exactly in the point on the edge, but in point that is near to the edge towards to the face material (so, we'll have approx. normal); The point is computed using PointNearEdge function, with the shifting value BOPTools_AlgoTools3D::MinStepIn2d(), from the edge, but if this value is too big, the point will be computed using Hatcher (PointInFace function). Returns True in case of success.
") GetApproxNormalToFaceOnEdge;
		static Standard_Boolean GetApproxNormalToFaceOnEdge(const TopoDS_Edge & aE, const TopoDS_Face & aF, const Standard_Real aT, gp_Pnt & aPx, gp_Dir & aD, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools3D::GetApproxNormalToFaceOnEdge ******/
		/****** md5 signature: 432a5d217f2c92976bd3836d59ae3126 ******/
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
theF: TopoDS_Face
aT: float
aP: gp_Pnt
aDNF: gp_Dir
aDt2D: float

Return
-------
bool

Description
-----------
Computes normal to the face <aF> for the 3D-point that belongs to the edge <aE> at parameter <aT>. Output: aPx - the 3D-point where the normal computed aD - the normal; Warning: The normal is computed not exactly in the point on the edge, but in point that is near to the edge towards to the face material (so, we'll have approx. normal); The point is computed using PointNearEdge function with the shifting value <aDt2D> from the edge; No checks on this value will be done. Returns True in case of success.
") GetApproxNormalToFaceOnEdge;
		static Standard_Boolean GetApproxNormalToFaceOnEdge(const TopoDS_Edge & theE, const TopoDS_Face & theF, const Standard_Real aT, gp_Pnt & aP, gp_Dir & aDNF, const Standard_Real aDt2D);

		/****** BOPTools_AlgoTools3D::GetApproxNormalToFaceOnEdge ******/
		/****** md5 signature: 0d7e453d668ffaef04017e672ebf7cd8 ******/
		%feature("compactdefaultargs") GetApproxNormalToFaceOnEdge;
		%feature("autodoc", "
Parameters
----------
theE: TopoDS_Edge
theF: TopoDS_Face
aT: float
aDt2D: float
aP: gp_Pnt
aDNF: gp_Dir
theContext: IntTools_Context

Return
-------
bool

Description
-----------
Computes normal to the face <aF> for the 3D-point that belongs to the edge <aE> at parameter <aT>. Output: aPx - the 3D-point where the normal computed aD - the normal; Warning: The normal is computed not exactly in the point on the edge, but in point that is near to the edge towards to the face material (so, we'll have approx. normal); The point is computed using PointNearEdge function with the shifting value <aDt2D> from the edge, but if this value is too big the point will be computed using Hatcher (PointInFace function). Returns True in case of success.
") GetApproxNormalToFaceOnEdge;
		static Standard_Boolean GetApproxNormalToFaceOnEdge(const TopoDS_Edge & theE, const TopoDS_Face & theF, const Standard_Real aT, const Standard_Real aDt2D, gp_Pnt & aP, gp_Dir & aDNF, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools3D::GetNormalToFaceOnEdge ******/
		/****** md5 signature: bf95002b59a88f422052872860bf9ba3 ******/
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aT: float
aD: gp_Dir
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Computes normal to the face <aF> for the point on the edge <aE> at parameter <aT>. <theContext> - storage for caching the geometrical tools.
") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge(const TopoDS_Edge & aE, const TopoDS_Face & aF, const Standard_Real aT, gp_Dir & aD, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools3D::GetNormalToFaceOnEdge ******/
		/****** md5 signature: caac691e172913bbc6951d237d25e02e ******/
		%feature("compactdefaultargs") GetNormalToFaceOnEdge;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aD: gp_Dir
theContext: IntTools_Context (optional, default to opencascade::handle<IntTools_Context>())

Return
-------
None

Description
-----------
Computes normal to the face <aF> for the point on the edge <aE> at arbitrary intermediate parameter. <theContext> - storage for caching the geometrical tools.
") GetNormalToFaceOnEdge;
		static void GetNormalToFaceOnEdge(const TopoDS_Edge & aE, const TopoDS_Face & aF, gp_Dir & aD, const opencascade::handle<IntTools_Context> & theContext = opencascade::handle<IntTools_Context>());

		/****** BOPTools_AlgoTools3D::GetNormalToSurface ******/
		/****** md5 signature: fadf018537fa0db50dedc46448844d75 ******/
		%feature("compactdefaultargs") GetNormalToSurface;
		%feature("autodoc", "
Parameters
----------
aS: Geom_Surface
U: float
V: float
aD: gp_Dir

Return
-------
bool

Description
-----------
Compute normal <aD> to surface <aS> in point (U,V) Returns True if directions aD1U, aD1V coincide.
") GetNormalToSurface;
		static Standard_Boolean GetNormalToSurface(const opencascade::handle<Geom_Surface> & aS, const Standard_Real U, const Standard_Real V, gp_Dir & aD);

		/****** BOPTools_AlgoTools3D::IsEmptyShape ******/
		/****** md5 signature: 705d0cbf3a767fb030ed3d0273652728 ******/
		%feature("compactdefaultargs") IsEmptyShape;
		%feature("autodoc", "
Parameters
----------
aS: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns True if the shape <aS> does not contain geometry information (e.g. empty compound).
") IsEmptyShape;
		static Standard_Boolean IsEmptyShape(const TopoDS_Shape & aS);

		/****** BOPTools_AlgoTools3D::MinStepIn2d ******/
		/****** md5 signature: 55bfd12f091895ccbedf8983db301515 ******/
		%feature("compactdefaultargs") MinStepIn2d;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns simple step value that is used in 2D-computations = 1.e-5.
") MinStepIn2d;
		static Standard_Real MinStepIn2d();

		/****** BOPTools_AlgoTools3D::OrientEdgeOnFace ******/
		/****** md5 signature: c79b989ebff1b81ac9c1c0872fb48dd0 ******/
		%feature("compactdefaultargs") OrientEdgeOnFace;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aER: TopoDS_Edge

Return
-------
None

Description
-----------
Get the edge <aER> from the face <aF> that is the same as the edge <aE>.
") OrientEdgeOnFace;
		static void OrientEdgeOnFace(const TopoDS_Edge & aE, const TopoDS_Face & aF, TopoDS_Edge & aER);

		/****** BOPTools_AlgoTools3D::PointInFace ******/
		/****** md5 signature: fb4d80b0c5e7b54dd7e9e3700bdd62ef ******/
		%feature("compactdefaultargs") PointInFace;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt
theP2D: gp_Pnt2d
theContext: IntTools_Context

Return
-------
int

Description
-----------
Computes arbitrary point <theP> inside the face <theF>. <theP2D> - 2D representation of <theP> on the surface of <theF> Returns 0 in case of success.
") PointInFace;
		static Standard_Integer PointInFace(const TopoDS_Face & theF, gp_Pnt & theP, gp_Pnt2d & theP2D, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools3D::PointInFace ******/
		/****** md5 signature: d8a07bb3206e54319a435f003dc62fb0 ******/
		%feature("compactdefaultargs") PointInFace;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theE: TopoDS_Edge
theT: float
theDt2D: float
theP: gp_Pnt
theP2D: gp_Pnt2d
theContext: IntTools_Context

Return
-------
int

Description
-----------
Computes a point <theP> inside the face <theF> using starting point taken by the parameter <theT> from the 2d curve of the edge <theE> on the face <theF> in the direction perpendicular to the tangent vector of the 2d curve of the edge. The point will be distanced on <theDt2D> from the 2d curve. <theP2D> - 2D representation of <theP> on the surface of <theF> Returns 0 in case of success.
") PointInFace;
		static Standard_Integer PointInFace(const TopoDS_Face & theF, const TopoDS_Edge & theE, const Standard_Real theT, const Standard_Real theDt2D, gp_Pnt & theP, gp_Pnt2d & theP2D, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools3D::PointInFace ******/
		/****** md5 signature: 37f6b0b13b751b088ca1668abf11cab7 ******/
		%feature("compactdefaultargs") PointInFace;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theL: Geom2d_Curve
theP: gp_Pnt
theP2D: gp_Pnt2d
theContext: IntTools_Context
theDt2D: float (optional, default to 0.0)

Return
-------
int

Description
-----------
Computes a point <theP> inside the face <theF> using the line <theL> so that 2D point <theP2D>, 2D representation of <theP> on the surface of <theF>, lies on that line. Returns 0 in case of success.
") PointInFace;
		static Standard_Integer PointInFace(const TopoDS_Face & theF, const opencascade::handle<Geom2d_Curve> & theL, gp_Pnt & theP, gp_Pnt2d & theP2D, const opencascade::handle<IntTools_Context> & theContext, const Standard_Real theDt2D = 0.0);

		/****** BOPTools_AlgoTools3D::PointNearEdge ******/
		/****** md5 signature: 28ea360f1c859e12be4170d223ae64b7 ******/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aT: float
aDt2D: float
aP2D: gp_Pnt2d
aPx: gp_Pnt
theContext: IntTools_Context

Return
-------
int

Description
-----------
Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is <aDt2D> If the value of shifting is too big the point will be computed using Hatcher (PointInFace function). Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>; 2 - the computed point is out of the face.
") PointNearEdge;
		static Standard_Integer PointNearEdge(const TopoDS_Edge & aE, const TopoDS_Face & aF, const Standard_Real aT, const Standard_Real aDt2D, gp_Pnt2d & aP2D, gp_Pnt & aPx, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools3D::PointNearEdge ******/
		/****** md5 signature: 8c4c6748c97e44ce957c2b8614e0029f ******/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aT: float
aDt2D: float
aP2D: gp_Pnt2d
aPx: gp_Pnt

Return
-------
int

Description
-----------
Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is <aDt2D>. No checks on this value will be done. Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>.
") PointNearEdge;
		static Standard_Integer PointNearEdge(const TopoDS_Edge & aE, const TopoDS_Face & aF, const Standard_Real aT, const Standard_Real aDt2D, gp_Pnt2d & aP2D, gp_Pnt & aPx);

		/****** BOPTools_AlgoTools3D::PointNearEdge ******/
		/****** md5 signature: e53caafb25c5b51491bf62af17f56817 ******/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aT: float
aP2D: gp_Pnt2d
aPx: gp_Pnt
theContext: IntTools_Context

Return
-------
int

Description
-----------
Computes the point <aPx>, (<aP2D>) that is near to the edge <aE> at parameter <aT> towards to the material of the face <aF>. The value of shifting in 2D is dt2D=BOPTools_AlgoTools3D::MinStepIn2d() If the value of shifting is too big the point will be computed using Hatcher (PointInFace function). Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>; 2 - the computed point is out of the face.
") PointNearEdge;
		static Standard_Integer PointNearEdge(const TopoDS_Edge & aE, const TopoDS_Face & aF, const Standard_Real aT, gp_Pnt2d & aP2D, gp_Pnt & aPx, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools3D::PointNearEdge ******/
		/****** md5 signature: 35029e745729034983dcaed868cd05a8 ******/
		%feature("compactdefaultargs") PointNearEdge;
		%feature("autodoc", "
Parameters
----------
aE: TopoDS_Edge
aF: TopoDS_Face
aP2D: gp_Pnt2d
aPx: gp_Pnt
theContext: IntTools_Context

Return
-------
int

Description
-----------
Compute the point <aPx>, (<aP2D>) that is near to the edge <aE> at arbitrary parameter towards to the material of the face <aF>. The value of shifting in 2D is dt2D=BOPTools_AlgoTools3D::MinStepIn2d(). If the value of shifting is too big the point will be computed using Hatcher (PointInFace function). Returns error status: 0 - in case of success; 1 - <aE> does not have 2d curve on the face <aF>; 2 - the computed point is out of the face.
") PointNearEdge;
		static Standard_Integer PointNearEdge(const TopoDS_Edge & aE, const TopoDS_Face & aF, gp_Pnt2d & aP2D, gp_Pnt & aPx, const opencascade::handle<IntTools_Context> & theContext);

		/****** BOPTools_AlgoTools3D::SenseFlag ******/
		/****** md5 signature: 6c19a30f29c48dda7851cfdc81d48708 ******/
		%feature("compactdefaultargs") SenseFlag;
		%feature("autodoc", "
Parameters
----------
aNF1: gp_Dir
aNF2: gp_Dir

Return
-------
int

Description
-----------
Returns 1 if scalar product aNF1* aNF2>0. Returns 0 if directions aNF1 aNF2 coincide Returns -1 if scalar product aNF1* aNF2<0.
") SenseFlag;
		static Standard_Integer SenseFlag(const gp_Dir & aNF1, const gp_Dir & aNF2);

};


%extend BOPTools_AlgoTools3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BOPTools_BoxSelector *
*****************************/
/************************
* class BOPTools_BoxSet *
************************/
/********************************
* class BOPTools_ConnexityBlock *
********************************/
class BOPTools_ConnexityBlock {
	public:
		/****** BOPTools_ConnexityBlock::BOPTools_ConnexityBlock ******/
		/****** md5 signature: 324aa99e61f940627fecd050de98e960 ******/
		%feature("compactdefaultargs") BOPTools_ConnexityBlock;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock();

		/****** BOPTools_ConnexityBlock::BOPTools_ConnexityBlock ******/
		/****** md5 signature: 848312be9796e7a157ffbf546c9820e0 ******/
		%feature("compactdefaultargs") BOPTools_ConnexityBlock;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPTools_ConnexityBlock;
		 BOPTools_ConnexityBlock(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPTools_ConnexityBlock::ChangeLoops ******/
		/****** md5 signature: 97af80f62f92c5a560ebfd3d94268f4c ******/
		%feature("compactdefaultargs") ChangeLoops;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeLoops;
		TopTools_ListOfShape & ChangeLoops();

		/****** BOPTools_ConnexityBlock::ChangeShapes ******/
		/****** md5 signature: 47d36ad0f18ffdedc957b231f37208f9 ******/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeShapes;
		TopTools_ListOfShape & ChangeShapes();

		/****** BOPTools_ConnexityBlock::IsRegular ******/
		/****** md5 signature: 3d038b1e31cde956ec93c56a127b2088 ******/
		%feature("compactdefaultargs") IsRegular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRegular;
		Standard_Boolean IsRegular();

		/****** BOPTools_ConnexityBlock::Loops ******/
		/****** md5 signature: 28c8d70c5f0b2679616b2e020052a004 ******/
		%feature("compactdefaultargs") Loops;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Loops;
		const TopTools_ListOfShape & Loops();

		/****** BOPTools_ConnexityBlock::SetRegular ******/
		/****** md5 signature: 2164d1b536b9c0958859434dc620596f ******/
		%feature("compactdefaultargs") SetRegular;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
No available documentation.
") SetRegular;
		void SetRegular(const Standard_Boolean theFlag);

		/****** BOPTools_ConnexityBlock::Shapes ******/
		/****** md5 signature: 2884193c58152e0cda5e99b2900fdc8e ******/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Shapes;
		const TopTools_ListOfShape & Shapes();

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
		/****** BOPTools_CoupleOfShape::BOPTools_CoupleOfShape ******/
		/****** md5 signature: a463423d837c3e973864801ded1eb0ed ******/
		%feature("compactdefaultargs") BOPTools_CoupleOfShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPTools_CoupleOfShape;
		 BOPTools_CoupleOfShape();

		/****** BOPTools_CoupleOfShape::SetShape1 ******/
		/****** md5 signature: 7c06cdd673405cb80d7e01e8b123dae3 ******/
		%feature("compactdefaultargs") SetShape1;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetShape1;
		void SetShape1(const TopoDS_Shape & theShape);

		/****** BOPTools_CoupleOfShape::SetShape2 ******/
		/****** md5 signature: 004248e6b3471f78e02542f4252af7ef ******/
		%feature("compactdefaultargs") SetShape2;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetShape2;
		void SetShape2(const TopoDS_Shape & theShape);

		/****** BOPTools_CoupleOfShape::Shape1 ******/
		/****** md5 signature: 8981b86985f46147f6d78d0ef2565c6e ******/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape1;
		const TopoDS_Shape Shape1();

		/****** BOPTools_CoupleOfShape::Shape2 ******/
		/****** md5 signature: 2c54bae91519136523ed62dc1f27ae72 ******/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape2;
		const TopoDS_Shape Shape2();

};


%extend BOPTools_CoupleOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BOPTools_PairSelector *
******************************/
/**************************
* class BOPTools_Parallel *
**************************/
/*********************
* class BOPTools_Set *
*********************/
class BOPTools_Set {
	public:
		/****** BOPTools_Set::BOPTools_Set ******/
		/****** md5 signature: 251058268e0ffaca9bd9102e20650099 ******/
		%feature("compactdefaultargs") BOPTools_Set;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BOPTools_Set;
		 BOPTools_Set();

		/****** BOPTools_Set::BOPTools_Set ******/
		/****** md5 signature: 4850b6916cc2c1a8a2157f59bb217d27 ******/
		%feature("compactdefaultargs") BOPTools_Set;
		%feature("autodoc", "
Parameters
----------
theAllocator: NCollection_BaseAllocator

Return
-------
None

Description
-----------
No available documentation.
") BOPTools_Set;
		 BOPTools_Set(const opencascade::handle<NCollection_BaseAllocator> & theAllocator);

		/****** BOPTools_Set::BOPTools_Set ******/
		/****** md5 signature: 7348c096189fc94262374b8cbb0ee264 ******/
		%feature("compactdefaultargs") BOPTools_Set;
		%feature("autodoc", "
Parameters
----------
theOther: BOPTools_Set

Return
-------
None

Description
-----------
Copy constructor.
") BOPTools_Set;
		 BOPTools_Set(const BOPTools_Set & theOther);

		/****** BOPTools_Set::Add ******/
		/****** md5 signature: 1f2b35071de7c8625d2e5b7b7b1a38f7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Shape
theType: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & theS, const TopAbs_ShapeEnum theType);

		/****** BOPTools_Set::Assign ******/
		/****** md5 signature: 928626bc3ceb859906184486d169fe7b ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
Other: BOPTools_Set

Return
-------
BOPTools_Set

Description
-----------
No available documentation.
") Assign;
		BOPTools_Set & Assign(const BOPTools_Set & Other);

		/****** BOPTools_Set::GetSum ******/
		/****** md5 signature: 527ff5550a99b698021be9c8afb7a809 ******/
		%feature("compactdefaultargs") GetSum;
		%feature("autodoc", "Return
-------
size_t

Description
-----------
No available documentation.
") GetSum;
		size_t GetSum();

		/****** BOPTools_Set::IsEqual ******/
		/****** md5 signature: 474281f165027d105331737daa2a5ea2 ******/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
aOther: BOPTools_Set

Return
-------
bool

Description
-----------
No available documentation.
") IsEqual;
		Standard_Boolean IsEqual(const BOPTools_Set & aOther);

		/****** BOPTools_Set::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		Standard_Integer NbShapes();

		/****** BOPTools_Set::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();


%extend{
    bool __eq_wrapper__(const BOPTools_Set other) {
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


%extend BOPTools_Set {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class hash<BOPTools_Set> *
***************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BOPTools_Parallel:
	pass

@classnotwrapped
class BOPTools_BoxSelector:
	pass

@classnotwrapped
class BOPTools_BoxSet:
	pass

@classnotwrapped
class BOPTools_PairSelector:
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
def BOPTools_AlgoTools_AreFacesSameDomain(*args):
	return BOPTools_AlgoTools.AreFacesSameDomain(*args)

@deprecated
def BOPTools_AlgoTools_ComputeState(*args):
	return BOPTools_AlgoTools.ComputeState(*args)

@deprecated
def BOPTools_AlgoTools_ComputeState(*args):
	return BOPTools_AlgoTools.ComputeState(*args)

@deprecated
def BOPTools_AlgoTools_ComputeState(*args):
	return BOPTools_AlgoTools.ComputeState(*args)

@deprecated
def BOPTools_AlgoTools_ComputeState(*args):
	return BOPTools_AlgoTools.ComputeState(*args)

@deprecated
def BOPTools_AlgoTools_ComputeStateByOnePoint(*args):
	return BOPTools_AlgoTools.ComputeStateByOnePoint(*args)

@deprecated
def BOPTools_AlgoTools_ComputeTolerance(*args):
	return BOPTools_AlgoTools.ComputeTolerance(*args)

@deprecated
def BOPTools_AlgoTools_ComputeVV(*args):
	return BOPTools_AlgoTools.ComputeVV(*args)

@deprecated
def BOPTools_AlgoTools_ComputeVV(*args):
	return BOPTools_AlgoTools.ComputeVV(*args)

@deprecated
def BOPTools_AlgoTools_CopyEdge(*args):
	return BOPTools_AlgoTools.CopyEdge(*args)

@deprecated
def BOPTools_AlgoTools_CorrectCurveOnSurface(*args):
	return BOPTools_AlgoTools.CorrectCurveOnSurface(*args)

@deprecated
def BOPTools_AlgoTools_CorrectPointOnCurve(*args):
	return BOPTools_AlgoTools.CorrectPointOnCurve(*args)

@deprecated
def BOPTools_AlgoTools_CorrectRange(*args):
	return BOPTools_AlgoTools.CorrectRange(*args)

@deprecated
def BOPTools_AlgoTools_CorrectRange(*args):
	return BOPTools_AlgoTools.CorrectRange(*args)

@deprecated
def BOPTools_AlgoTools_CorrectShapeTolerances(*args):
	return BOPTools_AlgoTools.CorrectShapeTolerances(*args)

@deprecated
def BOPTools_AlgoTools_CorrectTolerances(*args):
	return BOPTools_AlgoTools.CorrectTolerances(*args)

@deprecated
def BOPTools_AlgoTools_DTolerance(*args):
	return BOPTools_AlgoTools.DTolerance(*args)

@deprecated
def BOPTools_AlgoTools_Dimension(*args):
	return BOPTools_AlgoTools.Dimension(*args)

@deprecated
def BOPTools_AlgoTools_Dimensions(*args):
	return BOPTools_AlgoTools.Dimensions(*args)

@deprecated
def BOPTools_AlgoTools_GetEdgeOff(*args):
	return BOPTools_AlgoTools.GetEdgeOff(*args)

@deprecated
def BOPTools_AlgoTools_GetEdgeOnFace(*args):
	return BOPTools_AlgoTools.GetEdgeOnFace(*args)

@deprecated
def BOPTools_AlgoTools_GetFaceOff(*args):
	return BOPTools_AlgoTools.GetFaceOff(*args)

@deprecated
def BOPTools_AlgoTools_IsBlockInOnFace(*args):
	return BOPTools_AlgoTools.IsBlockInOnFace(*args)

@deprecated
def BOPTools_AlgoTools_IsHole(*args):
	return BOPTools_AlgoTools.IsHole(*args)

@deprecated
def BOPTools_AlgoTools_IsInternalFace(*args):
	return BOPTools_AlgoTools.IsInternalFace(*args)

@deprecated
def BOPTools_AlgoTools_IsInternalFace(*args):
	return BOPTools_AlgoTools.IsInternalFace(*args)

@deprecated
def BOPTools_AlgoTools_IsInternalFace(*args):
	return BOPTools_AlgoTools.IsInternalFace(*args)

@deprecated
def BOPTools_AlgoTools_IsInvertedSolid(*args):
	return BOPTools_AlgoTools.IsInvertedSolid(*args)

@deprecated
def BOPTools_AlgoTools_IsMicroEdge(*args):
	return BOPTools_AlgoTools.IsMicroEdge(*args)

@deprecated
def BOPTools_AlgoTools_IsOpenShell(*args):
	return BOPTools_AlgoTools.IsOpenShell(*args)

@deprecated
def BOPTools_AlgoTools_IsSplitToReverse(*args):
	return BOPTools_AlgoTools.IsSplitToReverse(*args)

@deprecated
def BOPTools_AlgoTools_IsSplitToReverse(*args):
	return BOPTools_AlgoTools.IsSplitToReverse(*args)

@deprecated
def BOPTools_AlgoTools_IsSplitToReverse(*args):
	return BOPTools_AlgoTools.IsSplitToReverse(*args)

@deprecated
def BOPTools_AlgoTools_IsSplitToReverseWithWarn(*args):
	return BOPTools_AlgoTools.IsSplitToReverseWithWarn(*args)

@deprecated
def BOPTools_AlgoTools_MakeConnexityBlock(*args):
	return BOPTools_AlgoTools.MakeConnexityBlock(*args)

@deprecated
def BOPTools_AlgoTools_MakeConnexityBlocks(*args):
	return BOPTools_AlgoTools.MakeConnexityBlocks(*args)

@deprecated
def BOPTools_AlgoTools_MakeConnexityBlocks(*args):
	return BOPTools_AlgoTools.MakeConnexityBlocks(*args)

@deprecated
def BOPTools_AlgoTools_MakeConnexityBlocks(*args):
	return BOPTools_AlgoTools.MakeConnexityBlocks(*args)

@deprecated
def BOPTools_AlgoTools_MakeContainer(*args):
	return BOPTools_AlgoTools.MakeContainer(*args)

@deprecated
def BOPTools_AlgoTools_MakeEdge(*args):
	return BOPTools_AlgoTools.MakeEdge(*args)

@deprecated
def BOPTools_AlgoTools_MakeNewVertex(*args):
	return BOPTools_AlgoTools.MakeNewVertex(*args)

@deprecated
def BOPTools_AlgoTools_MakeNewVertex(*args):
	return BOPTools_AlgoTools.MakeNewVertex(*args)

@deprecated
def BOPTools_AlgoTools_MakeNewVertex(*args):
	return BOPTools_AlgoTools.MakeNewVertex(*args)

@deprecated
def BOPTools_AlgoTools_MakeNewVertex(*args):
	return BOPTools_AlgoTools.MakeNewVertex(*args)

@deprecated
def BOPTools_AlgoTools_MakePCurve(*args):
	return BOPTools_AlgoTools.MakePCurve(*args)

@deprecated
def BOPTools_AlgoTools_MakeSectEdge(*args):
	return BOPTools_AlgoTools.MakeSectEdge(*args)

@deprecated
def BOPTools_AlgoTools_MakeSplitEdge(*args):
	return BOPTools_AlgoTools.MakeSplitEdge(*args)

@deprecated
def BOPTools_AlgoTools_MakeVertex(*args):
	return BOPTools_AlgoTools.MakeVertex(*args)

@deprecated
def BOPTools_AlgoTools_OrientEdgesOnWire(*args):
	return BOPTools_AlgoTools.OrientEdgesOnWire(*args)

@deprecated
def BOPTools_AlgoTools_OrientFacesOnShell(*args):
	return BOPTools_AlgoTools.OrientFacesOnShell(*args)

@deprecated
def BOPTools_AlgoTools_PointOnEdge(*args):
	return BOPTools_AlgoTools.PointOnEdge(*args)

@deprecated
def BOPTools_AlgoTools_Sense(*args):
	return BOPTools_AlgoTools.Sense(*args)

@deprecated
def BOPTools_AlgoTools_TreatCompound(*args):
	return BOPTools_AlgoTools.TreatCompound(*args)

@deprecated
def BOPTools_AlgoTools_UpdateVertex(*args):
	return BOPTools_AlgoTools.UpdateVertex(*args)

@deprecated
def BOPTools_AlgoTools_UpdateVertex(*args):
	return BOPTools_AlgoTools.UpdateVertex(*args)

@deprecated
def BOPTools_AlgoTools_UpdateVertex(*args):
	return BOPTools_AlgoTools.UpdateVertex(*args)

@deprecated
def BOPTools_AlgoTools2D_AdjustPCurveOnFace(*args):
	return BOPTools_AlgoTools2D.AdjustPCurveOnFace(*args)

@deprecated
def BOPTools_AlgoTools2D_AdjustPCurveOnFace(*args):
	return BOPTools_AlgoTools2D.AdjustPCurveOnFace(*args)

@deprecated
def BOPTools_AlgoTools2D_AdjustPCurveOnSurf(*args):
	return BOPTools_AlgoTools2D.AdjustPCurveOnSurf(*args)

@deprecated
def BOPTools_AlgoTools2D_AttachExistingPCurve(*args):
	return BOPTools_AlgoTools2D.AttachExistingPCurve(*args)

@deprecated
def BOPTools_AlgoTools2D_BuildPCurveForEdgeOnFace(*args):
	return BOPTools_AlgoTools2D.BuildPCurveForEdgeOnFace(*args)

@deprecated
def BOPTools_AlgoTools2D_CurveOnSurface(*args):
	return BOPTools_AlgoTools2D.CurveOnSurface(*args)

@deprecated
def BOPTools_AlgoTools2D_CurveOnSurface(*args):
	return BOPTools_AlgoTools2D.CurveOnSurface(*args)

@deprecated
def BOPTools_AlgoTools2D_EdgeTangent(*args):
	return BOPTools_AlgoTools2D.EdgeTangent(*args)

@deprecated
def BOPTools_AlgoTools2D_HasCurveOnSurface(*args):
	return BOPTools_AlgoTools2D.HasCurveOnSurface(*args)

@deprecated
def BOPTools_AlgoTools2D_HasCurveOnSurface(*args):
	return BOPTools_AlgoTools2D.HasCurveOnSurface(*args)

@deprecated
def BOPTools_AlgoTools2D_IntermediatePoint(*args):
	return BOPTools_AlgoTools2D.IntermediatePoint(*args)

@deprecated
def BOPTools_AlgoTools2D_IntermediatePoint(*args):
	return BOPTools_AlgoTools2D.IntermediatePoint(*args)

@deprecated
def BOPTools_AlgoTools2D_IsEdgeIsoline(*args):
	return BOPTools_AlgoTools2D.IsEdgeIsoline(*args)

@deprecated
def BOPTools_AlgoTools2D_Make2D(*args):
	return BOPTools_AlgoTools2D.Make2D(*args)

@deprecated
def BOPTools_AlgoTools2D_MakePCurveOnFace(*args):
	return BOPTools_AlgoTools2D.MakePCurveOnFace(*args)

@deprecated
def BOPTools_AlgoTools2D_MakePCurveOnFace(*args):
	return BOPTools_AlgoTools2D.MakePCurveOnFace(*args)

@deprecated
def BOPTools_AlgoTools2D_PointOnSurface(*args):
	return BOPTools_AlgoTools2D.PointOnSurface(*args)

@deprecated
def BOPTools_AlgoTools3D_DoSplitSEAMOnFace(*args):
	return BOPTools_AlgoTools3D.DoSplitSEAMOnFace(*args)

@deprecated
def BOPTools_AlgoTools3D_DoSplitSEAMOnFace(*args):
	return BOPTools_AlgoTools3D.DoSplitSEAMOnFace(*args)

@deprecated
def BOPTools_AlgoTools3D_GetApproxNormalToFaceOnEdge(*args):
	return BOPTools_AlgoTools3D.GetApproxNormalToFaceOnEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_GetApproxNormalToFaceOnEdge(*args):
	return BOPTools_AlgoTools3D.GetApproxNormalToFaceOnEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_GetApproxNormalToFaceOnEdge(*args):
	return BOPTools_AlgoTools3D.GetApproxNormalToFaceOnEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_GetNormalToFaceOnEdge(*args):
	return BOPTools_AlgoTools3D.GetNormalToFaceOnEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_GetNormalToFaceOnEdge(*args):
	return BOPTools_AlgoTools3D.GetNormalToFaceOnEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_GetNormalToSurface(*args):
	return BOPTools_AlgoTools3D.GetNormalToSurface(*args)

@deprecated
def BOPTools_AlgoTools3D_IsEmptyShape(*args):
	return BOPTools_AlgoTools3D.IsEmptyShape(*args)

@deprecated
def BOPTools_AlgoTools3D_MinStepIn2d(*args):
	return BOPTools_AlgoTools3D.MinStepIn2d(*args)

@deprecated
def BOPTools_AlgoTools3D_OrientEdgeOnFace(*args):
	return BOPTools_AlgoTools3D.OrientEdgeOnFace(*args)

@deprecated
def BOPTools_AlgoTools3D_PointInFace(*args):
	return BOPTools_AlgoTools3D.PointInFace(*args)

@deprecated
def BOPTools_AlgoTools3D_PointInFace(*args):
	return BOPTools_AlgoTools3D.PointInFace(*args)

@deprecated
def BOPTools_AlgoTools3D_PointInFace(*args):
	return BOPTools_AlgoTools3D.PointInFace(*args)

@deprecated
def BOPTools_AlgoTools3D_PointNearEdge(*args):
	return BOPTools_AlgoTools3D.PointNearEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_PointNearEdge(*args):
	return BOPTools_AlgoTools3D.PointNearEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_PointNearEdge(*args):
	return BOPTools_AlgoTools3D.PointNearEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_PointNearEdge(*args):
	return BOPTools_AlgoTools3D.PointNearEdge(*args)

@deprecated
def BOPTools_AlgoTools3D_SenseFlag(*args):
	return BOPTools_AlgoTools3D.SenseFlag(*args)

}
