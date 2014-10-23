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
%module (package="OCC") BRepClass

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

%include BRepClass_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepClass_Edge;
class BRepClass_Edge {
	public:
		%feature("autodoc", "	:rtype: None
") BRepClass_Edge;
		 BRepClass_Edge ();
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepClass_Edge;
		 BRepClass_Edge (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		TopoDS_Edge  Edge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		TopoDS_Face  Face ();
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
};


%feature("shadow") BRepClass_Edge::~BRepClass_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass_FClass2dOfFClassifier;
class BRepClass_FClass2dOfFClassifier {
	public:
		%feature("autodoc", "	:rtype: None
") BRepClass_FClass2dOfFClassifier;
		 BRepClass_FClass2dOfFClassifier ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: BRepClass_Edge &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector ();
		%feature("autodoc", "	:rtype: int
") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	:rtype: bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();
};


%feature("shadow") BRepClass_FClass2dOfFClassifier::~BRepClass_FClass2dOfFClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass_FClass2dOfFClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass_FClassifier;
class BRepClass_FClassifier {
	public:
		%feature("autodoc", "	:rtype: None
") BRepClass_FClassifier;
		 BRepClass_FClassifier ();
		%feature("autodoc", "	:param F:
	:type F: BRepClass_FaceExplorer &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepClass_FClassifier;
		 BRepClass_FClassifier (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "	:param F:
	:type F: BRepClass_FaceExplorer &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	:rtype: bool
") Rejected;
		Standard_Boolean Rejected ();
		%feature("autodoc", "	:rtype: bool
") NoWires;
		Standard_Boolean NoWires ();
		%feature("autodoc", "	:rtype: BRepClass_Edge
") Edge;
		const BRepClass_Edge & Edge ();
		%feature("autodoc", "	:rtype: float
") EdgeParameter;
		Standard_Real EdgeParameter ();
		%feature("autodoc", "	:rtype: IntRes2d_Position
") Position;
		IntRes2d_Position Position ();
};


%feature("shadow") BRepClass_FClassifier::~BRepClass_FClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass_FClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass_FaceExplorer;
class BRepClass_FaceExplorer {
	public:
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepClass_FaceExplorer;
		 BRepClass_FaceExplorer (const TopoDS_Face & F);
		%feature("autodoc", "	* Should return True if the point is outside a bounding volume of the face.

	:param P:
	:type P: gp_Pnt2d
	:rtype: bool
") Reject;
		Standard_Boolean Reject (const gp_Pnt2d & P);
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections.

	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float &
	:rtype: bool
") Segment;
		Standard_Boolean Segment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections. Each call gives another segment.

	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float &
	:rtype: bool
") OtherSegment;
		Standard_Boolean OtherSegment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Starts an exploration of the wires.

	:rtype: None
") InitWires;
		void InitWires ();
		%feature("autodoc", "	* Returns True if there is a current wire.

	:rtype: bool
") MoreWires;
		Standard_Boolean MoreWires ();
		%feature("autodoc", "	* Sets the explorer to the next wire.

	:rtype: None
") NextWire;
		void NextWire ();
		%feature("autodoc", "	* Returns True if the wire bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool
") RejectWire;
		Standard_Boolean RejectWire (const gp_Lin2d & L,const Standard_Real Par);
		%feature("autodoc", "	* Starts an exploration of the edges of the current wire.

	:rtype: None
") InitEdges;
		void InitEdges ();
		%feature("autodoc", "	* Returns True if there is a current edge.

	:rtype: bool
") MoreEdges;
		Standard_Boolean MoreEdges ();
		%feature("autodoc", "	* Sets the explorer to the next edge.

	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("autodoc", "	* Returns True if the edge bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool
") RejectEdge;
		Standard_Boolean RejectEdge (const gp_Lin2d & L,const Standard_Real Par);
		%feature("autodoc", "	* Current edge in current wire and its orientation.

	:param E:
	:type E: BRepClass_Edge &
	:param Or:
	:type Or: TopAbs_Orientation &
	:rtype: None
") CurrentEdge;
		void CurrentEdge (BRepClass_Edge & E,TopAbs_Orientation & Or);
};


%feature("shadow") BRepClass_FaceExplorer::~BRepClass_FaceExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass_FaceExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass_FacePassiveClassifier;
class BRepClass_FacePassiveClassifier {
	public:
		%feature("autodoc", "	:rtype: None
") BRepClass_FacePassiveClassifier;
		 BRepClass_FacePassiveClassifier ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: BRepClass_Edge &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector ();
		%feature("autodoc", "	:rtype: int
") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	:rtype: bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();
};


%feature("shadow") BRepClass_FacePassiveClassifier::~BRepClass_FacePassiveClassifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass_FacePassiveClassifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepClass_Intersector;
class BRepClass_Intersector : public Geom2dInt_IntConicCurveOfGInter {
	public:
		%feature("autodoc", "	:rtype: None
") BRepClass_Intersector;
		 BRepClass_Intersector ();
		%feature("autodoc", "	* Intersect the line segment and the edge.

	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:param E:
	:type E: BRepClass_Edge &
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol,const BRepClass_Edge & E);
		%feature("autodoc", "	* Returns in <T>, <N> and <C> the tangent, normal and curvature of the edge <E> at parameter value <U>.

	:param E:
	:type E: BRepClass_Edge &
	:param U:
	:type U: float
	:param T:
	:type T: gp_Dir2d
	:param N:
	:type N: gp_Dir2d
	:param C:
	:type C: float &
	:rtype: None
") LocalGeometry;
		void LocalGeometry (const BRepClass_Edge & E,const Standard_Real U,gp_Dir2d & T,gp_Dir2d & N,Standard_Real &OutValue);
};


%feature("shadow") BRepClass_Intersector::~BRepClass_Intersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepClass_Intersector {
	void _kill_pointed() {
		delete $self;
	}
};
