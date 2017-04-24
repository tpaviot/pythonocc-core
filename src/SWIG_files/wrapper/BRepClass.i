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
%module (package="OCC") BRepClass

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


%include BRepClass_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepClass_Edge;
class BRepClass_Edge {
	public:
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", "	:rtype: None
") BRepClass_Edge;
		 BRepClass_Edge ();
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepClass_Edge;
		 BRepClass_Edge (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		TopoDS_Face  Face ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
};


%extend BRepClass_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass_FClass2dOfFClassifier;
class BRepClass_FClass2dOfFClassifier {
	public:
		%feature("compactdefaultargs") BRepClass_FClass2dOfFClassifier;
		%feature("autodoc", "	:rtype: None
") BRepClass_FClass2dOfFClassifier;
		 BRepClass_FClass2dOfFClassifier ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	:param E:
	:type E: BRepClass_Edge &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	:rtype: BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector ();
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "	:rtype: int
") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "	:rtype: bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();
};


%extend BRepClass_FClass2dOfFClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass_FClassifier;
class BRepClass_FClassifier {
	public:
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "	:rtype: None
") BRepClass_FClassifier;
		 BRepClass_FClassifier ();
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "	:param F:
	:type F: BRepClass_FaceExplorer &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepClass_FClassifier;
		 BRepClass_FClassifier (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: BRepClass_FaceExplorer &
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "	:rtype: bool
") Rejected;
		Standard_Boolean Rejected ();
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "	:rtype: bool
") NoWires;
		Standard_Boolean NoWires ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: BRepClass_Edge
") Edge;
		const BRepClass_Edge & Edge ();
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "	:rtype: float
") EdgeParameter;
		Standard_Real EdgeParameter ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: IntRes2d_Position
") Position;
		IntRes2d_Position Position ();
};


%extend BRepClass_FClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass_FaceExplorer;
class BRepClass_FaceExplorer {
	public:
		%feature("compactdefaultargs") BRepClass_FaceExplorer;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepClass_FaceExplorer;
		 BRepClass_FaceExplorer (const TopoDS_Face & F);
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	* Should return True if the point is outside a bounding volume of the face.

	:param P:
	:type P: gp_Pnt2d
	:rtype: bool
") Reject;
		Standard_Boolean Reject (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Segment;
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
		%feature("compactdefaultargs") OtherSegment;
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
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "	* Starts an exploration of the wires.

	:rtype: None
") InitWires;
		void InitWires ();
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "	* Returns True if there is a current wire.

	:rtype: bool
") MoreWires;
		Standard_Boolean MoreWires ();
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "	* Sets the explorer to the next wire.

	:rtype: None
") NextWire;
		void NextWire ();
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "	* Returns True if the wire bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool
") RejectWire;
		Standard_Boolean RejectWire (const gp_Lin2d & L,const Standard_Real Par);
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "	* Starts an exploration of the edges of the current wire.

	:rtype: None
") InitEdges;
		void InitEdges ();
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "	* Returns True if there is a current edge.

	:rtype: bool
") MoreEdges;
		Standard_Boolean MoreEdges ();
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	* Sets the explorer to the next edge.

	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "	* Returns True if the edge bounding volume does not intersect the segment.

	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool
") RejectEdge;
		Standard_Boolean RejectEdge (const gp_Lin2d & L,const Standard_Real Par);
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "	* Current edge in current wire and its orientation.

	:param E:
	:type E: BRepClass_Edge &
	:param Or:
	:type Or: TopAbs_Orientation &
	:rtype: None
") CurrentEdge;
		void CurrentEdge (BRepClass_Edge & E,TopAbs_Orientation & Or);
};


%extend BRepClass_FaceExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass_FacePassiveClassifier;
class BRepClass_FacePassiveClassifier {
	public:
		%feature("compactdefaultargs") BRepClass_FacePassiveClassifier;
		%feature("autodoc", "	:rtype: None
") BRepClass_FacePassiveClassifier;
		 BRepClass_FacePassiveClassifier ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	:param E:
	:type E: BRepClass_Edge &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	:rtype: BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector ();
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "	:rtype: int
") ClosestIntersection;
		Standard_Integer ClosestIntersection ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "	:rtype: bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();
};


%extend BRepClass_FacePassiveClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass_Intersector;
class BRepClass_Intersector : public Geom2dInt_IntConicCurveOfGInter {
	public:
		%feature("compactdefaultargs") BRepClass_Intersector;
		%feature("autodoc", "	:rtype: None
") BRepClass_Intersector;
		 BRepClass_Intersector ();
		%feature("compactdefaultargs") Perform;
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
		%feature("compactdefaultargs") LocalGeometry;
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


%extend BRepClass_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
