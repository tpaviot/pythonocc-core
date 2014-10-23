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
%module (package="OCC") BRepLib

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

%include BRepLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BRepLib_EdgeError {
	BRepLib_EdgeDone = 0,
	BRepLib_PointProjectionFailed = 1,
	BRepLib_ParameterOutOfRange = 2,
	BRepLib_DifferentPointsOnClosedCurve = 3,
	BRepLib_PointWithInfiniteParameter = 4,
	BRepLib_DifferentsPointAndParameter = 5,
	BRepLib_LineThroughIdenticPoints = 6,
};

enum BRepLib_FaceError {
	BRepLib_FaceDone = 0,
	BRepLib_NoFace = 1,
	BRepLib_NotPlanar = 2,
	BRepLib_CurveProjectionFailed = 3,
	BRepLib_ParametersOutOfRange = 4,
};

enum BRepLib_ShapeModification {
	BRepLib_Preserved = 0,
	BRepLib_Deleted = 1,
	BRepLib_Trimmed = 2,
	BRepLib_Merged = 3,
	BRepLib_BoundaryModified = 4,
};

enum BRepLib_ShellError {
	BRepLib_ShellDone = 0,
	BRepLib_EmptyShell = 1,
	BRepLib_DisconnectedShell = 2,
	BRepLib_ShellParametersOutOfRange = 3,
};

enum BRepLib_WireError {
	BRepLib_WireDone = 0,
	BRepLib_EmptyWire = 1,
	BRepLib_DisconnectedWire = 2,
	BRepLib_NonManifoldWire = 3,
};

/* end public enums declaration */

%rename(breplib) BRepLib;
%nodefaultctor BRepLib;
class BRepLib {
	public:
		%feature("autodoc", "	* Sets the default precision. The current Precision is returned.

	:param P:
	:type P: float
	:rtype: void
") Precision;
		static void Precision (const Standard_Real P);
		%feature("autodoc", "	* Returns the default precision.

	:rtype: float
") Precision;
		static Standard_Real Precision ();
		%feature("autodoc", "	* Sets the current plane to P.

	:param P:
	:type P: Handle_Geom_Plane &
	:rtype: void
") Plane;
		static void Plane (const Handle_Geom_Plane & P);
		%feature("autodoc", "	* Returns the current plane.

	:rtype: Handle_Geom_Plane
") Plane;
		static const Handle_Geom_Plane & Plane ();
		%feature("autodoc", "	* checks if the Edge is same range IGNORING the same range flag of the edge Confusion argument is to compare real numbers idenpendently of any model space tolerance

	:param E:
	:type E: TopoDS_Edge &
	:param Confusion: default value is 1.0e-12
	:type Confusion: float
	:rtype: bool
") CheckSameRange;
		static Standard_Boolean CheckSameRange (const TopoDS_Edge & E,const Standard_Real Confusion = 1.0e-12);
		%feature("autodoc", "	* will make all the curve representation have the same range domain for the parameters. This will IGNORE the same range flag value to proceed. If there is a 3D curve there it will the range of that curve. If not the first curve representation encountered in the list will give its range to the all the other curves.

	:param E:
	:type E: TopoDS_Edge &
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:rtype: void
") SameRange;
		static void SameRange (const TopoDS_Edge & E,const Standard_Real Tolerance = 1.0e-5);
		%feature("autodoc", "	* Computes the 3d curve for the edge <E> if it does not exist. Returns True if the curve was computed or existed. Returns False if there is no planar pcurve or the computation failed. <MaxSegment> >= 30 in approximation

	:param E:
	:type E: TopoDS_Edge &
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:param MaxDegree: default value is 14
	:type MaxDegree: Standard_Integer
	:param MaxSegment: default value is 0
	:type MaxSegment: Standard_Integer
	:rtype: bool
") BuildCurve3d;
		static Standard_Boolean BuildCurve3d (const TopoDS_Edge & E,const Standard_Real Tolerance = 1.0e-5,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Integer MaxDegree = 14,const Standard_Integer MaxSegment = 0);
		%feature("autodoc", "	* Computes the 3d curves for all the edges of <S> return False if one of the computation failed. <MaxSegment> >= 30 in approximation

	:param S:
	:type S: TopoDS_Shape &
	:param Tolerance:
	:type Tolerance: float
	:param Continuity: default value is GeomAbs_C1
	:type Continuity: GeomAbs_Shape
	:param MaxDegree: default value is 14
	:type MaxDegree: Standard_Integer
	:param MaxSegment: default value is 0
	:type MaxSegment: Standard_Integer
	:rtype: bool
") BuildCurves3d;
		static Standard_Boolean BuildCurves3d (const TopoDS_Shape & S,const Standard_Real Tolerance,const GeomAbs_Shape Continuity = GeomAbs_C1,const Standard_Integer MaxDegree = 14,const Standard_Integer MaxSegment = 0);
		%feature("autodoc", "	* Computes the 3d curves for all the edges of <S> return False if one of the computation failed.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") BuildCurves3d;
		static Standard_Boolean BuildCurves3d (const TopoDS_Shape & S);
		%feature("autodoc", "	* Checks if the edge has a Tolerance smaller than -- -- -- -- MaxToleranceToCheck if so it will compute the radius of -- the cylindrical pipe surface that MinToleranceRequest is the minimum tolerance before it is usefull to start testing. Usually it should be arround 10e-5 contains all -- the curve represenation of the edge returns True if the Edge tolerance had to be updated

	:param E:
	:type E: TopoDS_Edge &
	:param MinToleranceRequest:
	:type MinToleranceRequest: float
	:param MaxToleranceToCheck:
	:type MaxToleranceToCheck: float
	:rtype: bool
") UpdateEdgeTol;
		static Standard_Boolean UpdateEdgeTol (const TopoDS_Edge & E,const Standard_Real MinToleranceRequest,const Standard_Real MaxToleranceToCheck);
		%feature("autodoc", "	* -- Checks all the edges of the shape whose -- -- -- Tolerance is smaller than MaxToleranceToCheck -- Returns True if at least one edge was updated -- MinToleranceRequest is the minimum tolerance before -- it -- is usefull to start testing. Usually it should be arround -- 10e-5-- Warning :The method is very slow as it checks all.  Use only in interfaces or processing assimilate batch

	:param S:
	:type S: TopoDS_Shape &
	:param MinToleranceRequest:
	:type MinToleranceRequest: float
	:param MaxToleranceToCheck:
	:type MaxToleranceToCheck: float
	:rtype: bool
") UpdateEdgeTolerance;
		static Standard_Boolean UpdateEdgeTolerance (const TopoDS_Shape & S,const Standard_Real MinToleranceRequest,const Standard_Real MaxToleranceToCheck);
		%feature("autodoc", "	* Computes new 2d curve(s) for the edge <E> to have the same parameter as the 3d curve. The algorithm is not done if the flag SameParameter was True on the Edge.

	:param E:
	:type E: TopoDS_Edge &
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:rtype: void
") SameParameter;
		static void SameParameter (const TopoDS_Edge & E,const Standard_Real Tolerance = 1.0e-5);
		%feature("autodoc", "	* Computes new 2d curve(s) for all the edges of <S> to have the same parameter as the 3d curve. The algorithm is not done if the flag SameParameter was True on an Edge.

	:param S:
	:type S: TopoDS_Shape &
	:param Tolerance: default value is 1.0e-5
	:type Tolerance: float
	:param forced: default value is Standard_False
	:type forced: bool
	:rtype: void
") SameParameter;
		static void SameParameter (const TopoDS_Shape & S,const Standard_Real Tolerance = 1.0e-5,const Standard_Boolean forced = Standard_False);
		%feature("autodoc", "	* Replaces tolerance of FACE EDGE VERTEX by the tolerance Max of their connected handling shapes. It is not necessary to use this call after SameParameter. (called in)

	:param S:
	:type S: TopoDS_Shape &
	:param verifyFaceTolerance: default value is Standard_False
	:type verifyFaceTolerance: bool
	:rtype: void
") UpdateTolerances;
		static void UpdateTolerances (const TopoDS_Shape & S,const Standard_Boolean verifyFaceTolerance = Standard_False);
		%feature("autodoc", "	* Orients the solid forward and the shell with the orientation to have matter in the solid. Returns False if the solid is unOrientable (open or incoherent)

	:param solid:
	:type solid: TopoDS_Solid &
	:rtype: bool
") OrientClosedSolid;
		static Standard_Boolean OrientClosedSolid (TopoDS_Solid & solid);
		%feature("autodoc", "	* Encodes the Regularity of edges on a Shape. Warning: <TolAng> is an angular tolerance, expressed in Rad. Warning: If the edges's regularity are coded before, nothing is done.

	:param S:
	:type S: TopoDS_Shape &
	:param TolAng: default value is 1.0e-10
	:type TolAng: float
	:rtype: void
") EncodeRegularity;
		static void EncodeRegularity (const TopoDS_Shape & S,const Standard_Real TolAng = 1.0e-10);
		%feature("autodoc", "	* Encodes the Regularity beetween <F1> and <F2> by <E> Warning: <TolAng> is an angular tolerance, expressed in Rad. Warning: If the edge's regularity is coded before, nothing is done.

	:param S:
	:type S: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param TolAng: default value is 1.0e-10
	:type TolAng: float
	:rtype: void
") EncodeRegularity;
		static void EncodeRegularity (TopoDS_Edge & S,const TopoDS_Face & F1,const TopoDS_Face & F2,const Standard_Real TolAng = 1.0e-10);
		%feature("autodoc", "	* Sorts in LF the Faces of S on the complexity of  their surfaces (Plane,Cylinder,Cone,Sphere,Torus,other)

	:param S:
	:type S: TopoDS_Shape &
	:param LF:
	:type LF: TopTools_ListOfShape &
	:rtype: void
") SortFaces;
		static void SortFaces (const TopoDS_Shape & S,TopTools_ListOfShape & LF);
		%feature("autodoc", "	* Sorts in LF the Faces of S on the reverse  complexity of their surfaces (other,Torus,Sphere,Cone,Cylinder,Plane)

	:param S:
	:type S: TopoDS_Shape &
	:param LF:
	:type LF: TopTools_ListOfShape &
	:rtype: void
") ReverseSortFaces;
		static void ReverseSortFaces (const TopoDS_Shape & S,TopTools_ListOfShape & LF);
};


%feature("shadow") BRepLib::~BRepLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_Command;
class BRepLib_Command {
	public:
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Raises NotDone if done is false.

	:rtype: None
") Check;
		void Check ();
};


%feature("shadow") BRepLib_Command::~BRepLib_Command %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_Command {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_FindSurface;
class BRepLib_FindSurface {
	public:
		%feature("autodoc", "	:rtype: None
") BRepLib_FindSurface;
		 BRepLib_FindSurface ();
		%feature("autodoc", "	* Computes the Surface from the edges of <S> with the given tolerance. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set. If <OnlyClosed> is true, then S sould be a wire and the existing surface, on which wire S is not closed in 2D, will be ignored.

	:param S:
	:type S: TopoDS_Shape &
	:param Tol: default value is - 1
	:type Tol: float
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:rtype: None
") BRepLib_FindSurface;
		 BRepLib_FindSurface (const TopoDS_Shape & S,const Standard_Real Tol = - 1,const Standard_Boolean OnlyPlane = Standard_False,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("autodoc", "	* Computes the Surface from the edges of <S> with the given tolerance. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set. If <OnlyClosed> is true, then S sould be a wire and the existing surface, on which wire S is not closed in 2D, will be ignored.

	:param S:
	:type S: TopoDS_Shape &
	:param Tol: default value is - 1
	:type Tol: float
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,const Standard_Real Tol = - 1,const Standard_Boolean OnlyPlane = Standard_False,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("autodoc", "	:rtype: bool
") Found;
		Standard_Boolean Found ();
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Surface;
		Handle_Geom_Surface Surface ();
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: float
") ToleranceReached;
		Standard_Real ToleranceReached ();
		%feature("autodoc", "	:rtype: bool
") Existed;
		Standard_Boolean Existed ();
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		TopLoc_Location Location ();
};


%feature("shadow") BRepLib_FindSurface::~BRepLib_FindSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_FindSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_FuseEdges;
class BRepLib_FuseEdges {
	public:
		%feature("autodoc", "	* Initialise members and build construction of map of ancestors.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param PerformNow: default value is Standard_False
	:type PerformNow: bool
	:rtype: None
") BRepLib_FuseEdges;
		 BRepLib_FuseEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_False);
		%feature("autodoc", "	* set edges to avoid being fused

	:param theMapEdg:
	:type theMapEdg: TopTools_IndexedMapOfShape &
	:rtype: None
") AvoidEdges;
		void AvoidEdges (const TopTools_IndexedMapOfShape & theMapEdg);
		%feature("autodoc", "	* set mode to enable concatenation G1 BSpline edges in one End Modified by IFV 19.04.07

	:param theConcatBSpl: default value is Standard_True
	:type theConcatBSpl: bool
	:rtype: None
") SetConcatBSpl;
		void SetConcatBSpl (const Standard_Boolean theConcatBSpl = Standard_True);
		%feature("autodoc", "	* returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.

	:param theMapLstEdg:
	:type theMapLstEdg: TopTools_DataMapOfIntegerListOfShape &
	:rtype: None
") Edges;
		void Edges (TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);
		%feature("autodoc", "	* returns all the fused edges. each integer entry in the map corresponds to the integer in the DataMapOfIntegerListOfShape we get in method Edges. That is to say, to the list of edges in theMapLstEdg(i) corresponds the resulting edge theMapEdge(i)

	:param theMapEdg:
	:type theMapEdg: TopTools_DataMapOfIntegerShape &
	:rtype: None
") ResultEdges;
		void ResultEdges (TopTools_DataMapOfIntegerShape & theMapEdg);
		%feature("autodoc", "	* returns the map of modified faces.

	:param theMapFac:
	:type theMapFac: TopTools_DataMapOfShapeShape &
	:rtype: None
") Faces;
		void Faces (TopTools_DataMapOfShapeShape & theMapFac);
		%feature("autodoc", "	* returns myShape modified with the list of internal edges removed from it.

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape & Shape ();
		%feature("autodoc", "	* returns the number of vertices candidate to be removed

	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "	* Using map of list of connex edges, fuse each list to one edge and then update myShape

	:rtype: None
") Perform;
		void Perform ();
};


%feature("shadow") BRepLib_FuseEdges::~BRepLib_FuseEdges %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_FuseEdges {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeShape;
class BRepLib_MakeShape : public BRepLib_Command {
	public:
		%feature("autodoc", "	* This is called by Shape(). It does nothing but may be redefined.

	:rtype: None
") Build;
		void Build ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Shape;
		 operator TopoDS_Shape ();
		%feature("autodoc", "	* returns the status of the Face after the shape creation.

	:param F:
	:type F: TopoDS_Face &
	:rtype: BRepLib_ShapeModification
") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus (const TopoDS_Face & F);
		%feature("autodoc", "	* Returns True if the Face generates new topology.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") HasDescendants;
		virtual Standard_Boolean HasDescendants (const TopoDS_Face & F);
		%feature("autodoc", "	* returns the list of generated Faces.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") DescendantFaces;
		virtual const TopTools_ListOfShape & DescendantFaces (const TopoDS_Face & F);
		%feature("autodoc", "	* returns the number of surfaces after the shape creation.

	:rtype: int
") NbSurfaces;
		virtual Standard_Integer NbSurfaces ();
		%feature("autodoc", "	* Return the faces created for surface I.

	:param I:
	:type I: Standard_Integer
	:rtype: TopTools_ListOfShape
") NewFaces;
		virtual const TopTools_ListOfShape & NewFaces (const Standard_Integer I);
		%feature("autodoc", "	* returns a list of the created faces from the edge <E>.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopTools_ListOfShape
") FacesFromEdges;
		virtual const TopTools_ListOfShape & FacesFromEdges (const TopoDS_Edge & E);
};


%feature("shadow") BRepLib_MakeShape::~BRepLib_MakeShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeEdge;
class BRepLib_MakeEdge : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge ();
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Lin & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Circ & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Elips & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Hypr & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const gp_Parab & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge;
		 BRepLib_MakeEdge (const Handle_Geom2d_Curve & L,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const gp_Pnt & P1,const gp_Pnt & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	* Returns the error description when NotDone.

	:rtype: BRepLib_EdgeError
") Error;
		BRepLib_EdgeError Error ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("autodoc", "	* Returns the first vertex of the edge. May be Null.

	:rtype: TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex & Vertex1 ();
		%feature("autodoc", "	* Returns the second vertex of the edge. May be Null.

	:rtype: TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex & Vertex2 ();
};


%feature("shadow") BRepLib_MakeEdge::~BRepLib_MakeEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeEdge2d;
class BRepLib_MakeEdge2d : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Lin2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Circ2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Circ2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Elips2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Elips2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Hypr2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Hypr2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param L:
	:type L: gp_Parab2d
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const gp_Parab2d & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param L:
	:type L: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") BRepLib_MakeEdge2d;
		 BRepLib_MakeEdge2d (const Handle_Geom2d_Curve & L,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_Curve & C,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	* Returns the error description when NotDone.

	:rtype: BRepLib_EdgeError
") Error;
		BRepLib_EdgeError Error ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("autodoc", "	* Returns the first vertex of the edge. May be Null.

	:rtype: TopoDS_Vertex
") Vertex1;
		const TopoDS_Vertex & Vertex1 ();
		%feature("autodoc", "	* Returns the second vertex of the edge. May be Null.

	:rtype: TopoDS_Vertex
") Vertex2;
		const TopoDS_Vertex & Vertex2 ();
};


%feature("shadow") BRepLib_MakeEdge2d::~BRepLib_MakeEdge2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeEdge2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeFace;
class BRepLib_MakeFace : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	* Not done.

	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace ();
		%feature("autodoc", "	* Load a face. Usefull to add wires.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const TopoDS_Face & F);
		%feature("autodoc", "	* Make a face from a plane.

	:param P:
	:type P: gp_Pln
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Pln & P);
		%feature("autodoc", "	* Make a face from a cylinder.

	:param C:
	:type C: gp_Cylinder
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cylinder & C);
		%feature("autodoc", "	* Make a face from a cone.

	:param C:
	:type C: gp_Cone
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cone & C);
		%feature("autodoc", "	* Make a face from a sphere.

	:param S:
	:type S: gp_Sphere
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Sphere & S);
		%feature("autodoc", "	* Make a face from a torus.

	:param C:
	:type C: gp_Torus
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Torus & C);
		%feature("autodoc", "	* Make a face from a Surface. Accepts tolerance value (TolDegen) for resolution of degenerated edges.

	:param S:
	:type S: Handle_Geom_Surface &
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const Handle_Geom_Surface & S,const Standard_Real TolDegen);
		%feature("autodoc", "	* Make a face from a plane.

	:param P:
	:type P: gp_Pln
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Pln & P,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "	* Make a face from a cylinder.

	:param C:
	:type C: gp_Cylinder
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cylinder & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "	* Make a face from a cone.

	:param C:
	:type C: gp_Cone
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cone & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "	* Make a face from a sphere.

	:param S:
	:type S: gp_Sphere
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Sphere & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "	* Make a face from a torus.

	:param C:
	:type C: gp_Torus
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Torus & C,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax);
		%feature("autodoc", "	* Make a face from a Surface. Accepts min & max parameters to construct the face's bounds. Also accepts tolerance value (TolDegen) for resolution of degenerated edges.

	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("autodoc", "	* Find a surface from the wire and make a face. if <OnlyPlane> is true, the computed surface will be a plane. If it is not possible to find a plane, the flag NotDone will be set.

	:param W:
	:type W: TopoDS_Wire &
	:param OnlyPlane: default value is Standard_False
	:type OnlyPlane: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const TopoDS_Wire & W,const Standard_Boolean OnlyPlane = Standard_False);
		%feature("autodoc", "	* Make a face from a plane and a wire.

	:param P:
	:type P: gp_Pln
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Pln & P,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "	* Make a face from a cylinder and a wire.

	:param C:
	:type C: gp_Cylinder
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cylinder & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "	* Make a face from a cone and a wire.

	:param C:
	:type C: gp_Cone
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Cone & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "	* Make a face from a sphere and a wire.

	:param S:
	:type S: gp_Sphere
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Sphere & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "	* Make a face from a torus and a wire.

	:param C:
	:type C: gp_Torus
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const gp_Torus & C,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "	* Make a face from a Surface and a wire.

	:param S:
	:type S: Handle_Geom_Surface &
	:param W:
	:type W: TopoDS_Wire &
	:param Inside: default value is Standard_True
	:type Inside: bool
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const Handle_Geom_Surface & S,const TopoDS_Wire & W,const Standard_Boolean Inside = Standard_True);
		%feature("autodoc", "	* Adds the wire <W> in the face <F>

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") BRepLib_MakeFace;
		 BRepLib_MakeFace (const TopoDS_Face & F,const TopoDS_Wire & W);
		%feature("autodoc", "	* Load the face.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "	* Creates the face from the surface. If Bound is True a wire is made from the natural bounds. Accepts tolerance value (TolDegen) for resolution of degenerated edges.

	:param S:
	:type S: Handle_Geom_Surface &
	:param Bound:
	:type Bound: bool
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Boolean Bound,const Standard_Real TolDegen);
		%feature("autodoc", "	* Creates the face from the surface and the min-max values. Accepts tolerance value (TolDegen) for resolution of degenerated edges.

	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param TolDegen:
	:type TolDegen: float
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Real TolDegen);
		%feature("autodoc", "	* Adds the wire <W> in the current face.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & W);
		%feature("autodoc", "	:rtype: BRepLib_FaceError
") Error;
		BRepLib_FaceError Error ();
		%feature("autodoc", "	* Returns the new face.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Face;
		 operator TopoDS_Face ();
};


%feature("shadow") BRepLib_MakeFace::~BRepLib_MakeFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeFace {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakePolygon;
class BRepLib_MakePolygon : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	* Creates an empty MakePolygon.

	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon ();
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2);
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt
	:param P2:
	:type P2: gp_Pnt
	:param P3:
	:type P3: gp_Pnt
	:param P4:
	:type P4: gp_Pnt
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const gp_Pnt & P1,const gp_Pnt & P2,const gp_Pnt & P3,const gp_Pnt & P4,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param V3:
	:type V3: TopoDS_Vertex &
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param V3:
	:type V3: TopoDS_Vertex &
	:param V4:
	:type V4: TopoDS_Vertex &
	:param Close: default value is Standard_False
	:type Close: bool
	:rtype: None
") BRepLib_MakePolygon;
		 BRepLib_MakePolygon (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const TopoDS_Vertex & V3,const TopoDS_Vertex & V4,const Standard_Boolean Close = Standard_False);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") Add;
		void Add (const gp_Pnt & P);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") Add;
		void Add (const TopoDS_Vertex & V);
		%feature("autodoc", "	* Returns True if the last vertex or point was succesfully added.

	:rtype: bool
") Added;
		Standard_Boolean Added ();
		%feature("autodoc", "	:rtype: None
") Close;
		void Close ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") FirstVertex;
		const TopoDS_Vertex & FirstVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") LastVertex;
		const TopoDS_Vertex & LastVertex ();
		%feature("autodoc", "	* Returns the last edge added to the polygon.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Edge;
		 operator TopoDS_Edge ();
		%feature("autodoc", "	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Wire;
		 operator TopoDS_Wire ();
};


%feature("shadow") BRepLib_MakePolygon::~BRepLib_MakePolygon %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakePolygon {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeShell;
class BRepLib_MakeShell : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	* Not done.

	:rtype: None
") BRepLib_MakeShell;
		 BRepLib_MakeShell ();
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") BRepLib_MakeShell;
		 BRepLib_MakeShell (const Handle_Geom_Surface & S,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") BRepLib_MakeShell;
		 BRepLib_MakeShell (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "	* Creates the shell from the surface and the min-max values.

	:param S:
	:type S: Handle_Geom_Surface &
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:param VMin:
	:type VMin: float
	:param VMax:
	:type VMax: float
	:param Segment: default value is Standard_False
	:type Segment: bool
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & S,const Standard_Real UMin,const Standard_Real UMax,const Standard_Real VMin,const Standard_Real VMax,const Standard_Boolean Segment = Standard_False);
		%feature("autodoc", "	:rtype: BRepLib_ShellError
") Error;
		BRepLib_ShellError Error ();
		%feature("autodoc", "	* Returns the new Shell.

	:rtype: TopoDS_Shell
") Shell;
		const TopoDS_Shell & Shell ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Shell;
		 operator TopoDS_Shell ();
};


%feature("shadow") BRepLib_MakeShell::~BRepLib_MakeShell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeShell {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeSolid;
class BRepLib_MakeSolid : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	* Solid covers whole space.

	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid ();
		%feature("autodoc", "	* Make a solid from a CompSolid.

	:param S:
	:type S: TopoDS_CompSolid &
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_CompSolid & S);
		%feature("autodoc", "	* Make a solid from a shell.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Shell & S);
		%feature("autodoc", "	* Make a solid from two shells.

	:param S1:
	:type S1: TopoDS_Shell &
	:param S2:
	:type S2: TopoDS_Shell &
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2);
		%feature("autodoc", "	* Make a solid from three shells.

	:param S1:
	:type S1: TopoDS_Shell &
	:param S2:
	:type S2: TopoDS_Shell &
	:param S3:
	:type S3: TopoDS_Shell &
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Shell & S1,const TopoDS_Shell & S2,const TopoDS_Shell & S3);
		%feature("autodoc", "	* Make a solid from a solid. Usefull for adding later.

	:param So:
	:type So: TopoDS_Solid &
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Solid & So);
		%feature("autodoc", "	* Add a shell to a solid.

	:param So:
	:type So: TopoDS_Solid &
	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") BRepLib_MakeSolid;
		 BRepLib_MakeSolid (const TopoDS_Solid & So,const TopoDS_Shell & S);
		%feature("autodoc", "	* Add the shell to the current solid.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") Add;
		void Add (const TopoDS_Shell & S);
		%feature("autodoc", "	* Returns the new Solid.

	:rtype: TopoDS_Solid
") Solid;
		const TopoDS_Solid & Solid ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Solid;
		 operator TopoDS_Solid ();
		%feature("autodoc", "	* returns the status of the Face after the shape creation.

	:param F:
	:type F: TopoDS_Face &
	:rtype: BRepLib_ShapeModification
") FaceStatus;
		virtual BRepLib_ShapeModification FaceStatus (const TopoDS_Face & F);
};


%feature("shadow") BRepLib_MakeSolid::~BRepLib_MakeSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeSolid {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeVertex;
class BRepLib_MakeVertex : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") BRepLib_MakeVertex;
		 BRepLib_MakeVertex (const gp_Pnt & P);
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Vertex;
		 operator TopoDS_Vertex ();
};


%feature("shadow") BRepLib_MakeVertex::~BRepLib_MakeVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepLib_MakeWire;
class BRepLib_MakeWire : public BRepLib_MakeShape {
	public:
		%feature("autodoc", "	* NotDone MakeWire.

	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire ();
		%feature("autodoc", "	* Make a Wire from an edge.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E);
		%feature("autodoc", "	* Make a Wire from two edges.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "	* Make a Wire from three edges.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param E3:
	:type E3: TopoDS_Edge &
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3);
		%feature("autodoc", "	* Make a Wire from four edges.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param E3:
	:type E3: TopoDS_Edge &
	:param E4:
	:type E4: TopoDS_Edge &
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Edge & E3,const TopoDS_Edge & E4);
		%feature("autodoc", "	* Make a Wire from a Wire. Usefull for adding later.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Wire & W);
		%feature("autodoc", "	* Add an edge to a wire.

	:param W:
	:type W: TopoDS_Wire &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BRepLib_MakeWire;
		 BRepLib_MakeWire (const TopoDS_Wire & W,const TopoDS_Edge & E);
		%feature("autodoc", "	* Add the edge <E> to the current wire.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & E);
		%feature("autodoc", "	* Add the edges of <W> to the current wire.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & W);
		%feature("autodoc", "	* Add the edges of <L> to the current wire. The edges are not to be consecutive. But they are to be all connected geometrically or topologically.

	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Add;
		void Add (const TopTools_ListOfShape & L);
		%feature("autodoc", "	:rtype: BRepLib_WireError
") Error;
		BRepLib_WireError Error ();
		%feature("autodoc", "	* Returns the new wire.

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "	:rtype: 
") operatorTopoDS_Wire;
		 operator TopoDS_Wire ();
		%feature("autodoc", "	* Returns the last edge added to the wire.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "	* Returns the last connecting vertex.

	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex & Vertex ();
};


%feature("shadow") BRepLib_MakeWire::~BRepLib_MakeWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepLib_MakeWire {
	void _kill_pointed() {
		delete $self;
	}
};
