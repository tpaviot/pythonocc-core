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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass_Edge;
		 BRepClass_Edge ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") BRepClass_Edge;
		 BRepClass_Edge (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face ();
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass_FClass2dOfFClassifier;
		 BRepClass_FClass2dOfFClassifier ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(BRepClass_Edge)
	Or(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepClass_Intersector

No detailed docstring for this function.") Intersector;
		BRepClass_Intersector & Intersector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHeadOrEnd;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass_FClassifier;
		 BRepClass_FClassifier ();
		%feature("autodoc", "Args:
	F(BRepClass_FaceExplorer)
	P(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepClass_FClassifier;
		 BRepClass_FClassifier (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(BRepClass_FaceExplorer)
	P(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Rejected;
		Standard_Boolean Rejected ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") NoWires;
		Standard_Boolean NoWires ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepClass_Edge

No detailed docstring for this function.") Edge;
		const BRepClass_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") EdgeParameter;
		Standard_Real EdgeParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Position

No detailed docstring for this function.") Position;
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
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") BRepClass_FaceExplorer;
		 BRepClass_FaceExplorer (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Boolean

Should  return  True  if the  point  is  outside a  
         bounding volume of the face.") Reject;
		Standard_Boolean Reject (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

Returns  in <L>, <Par>  a segment having at least  
         one  intersection  with  the   face  boundary  to  
         compute  intersections.") Segment;
		Standard_Boolean Segment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

Returns  in <L>, <Par>  a segment having at least  
         one  intersection  with  the   face  boundary  to  
         compute  intersections. Each call gives another segment.") OtherSegment;
		Standard_Boolean OtherSegment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Starts an exploration of the wires.") InitWires;
		void InitWires ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is  a current wire.") MoreWires;
		Standard_Boolean MoreWires ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the explorer  to the  next  wire.") NextWire;
		void NextWire ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

Returns True  if the wire  bounding volume does not  
         intersect the segment.") RejectWire;
		Standard_Boolean RejectWire (const gp_Lin2d & L,const Standard_Real Par);
		%feature("autodoc", "Args:
	None
Returns:
	None

Starts an exploration of the  edges of the current  
         wire.") InitEdges;
		void InitEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a current edge.") MoreEdges;
		Standard_Boolean MoreEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the explorer  to the  next  edge.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	Par(Standard_Real)

Returns:
	Standard_Boolean

Returns True  if the edge  bounding volume does not  
         intersect the segment.") RejectEdge;
		Standard_Boolean RejectEdge (const gp_Lin2d & L,const Standard_Real Par);
		%feature("autodoc", "Args:
	E(BRepClass_Edge)
	Or(TopAbs_Orientation)

Returns:
	None

Current edge in current wire and its orientation.") CurrentEdge;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass_FacePassiveClassifier;
		 BRepClass_FacePassiveClassifier ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(BRepClass_Edge)
	Or(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepClass_Intersector

No detailed docstring for this function.") Intersector;
		BRepClass_Intersector & Intersector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsHeadOrEnd;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepClass_Intersector;
		 BRepClass_Intersector ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	P(Standard_Real)
	Tol(Standard_Real)
	E(BRepClass_Edge)

Returns:
	None

Intersect the line segment and the edge.") Perform;
		void Perform (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol,const BRepClass_Edge & E);
		%feature("autodoc", "Args:
	E(BRepClass_Edge)
	U(Standard_Real)
	T(gp_Dir2d)
	N(gp_Dir2d)
	C(Standard_Real)

Returns:
	None

Returns in <T>,  <N> and <C>  the tangent,  normal  
         and  curvature of the edge  <E> at parameter value  
         <U>.") LocalGeometry;
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
