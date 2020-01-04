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
%define BREPCLASSDOCSTRING
"BRepClass module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepclass.html"
%enddef
%module (package="OCC.Core", docstring=BREPCLASSDOCSTRING) BRepClass


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
#include<BRepClass_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<gp_module.hxx>
#include<IntRes2d_module.hxx>
#include<Geom2dInt_module.hxx>
#include<Geom2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Extrema_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopAbs.i
%import gp.i
%import IntRes2d.i
%import Geom2dInt.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class BRepClass_Edge *
***********************/
class BRepClass_Edge {
	public:
		/****************** BRepClass_Edge ******************/
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", ":rtype: None") BRepClass_Edge;
		 BRepClass_Edge ();

		/****************** BRepClass_Edge ******************/
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") BRepClass_Edge;
		 BRepClass_Edge (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		TopoDS_Edge  Edge ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		TopoDS_Face  Face ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

};


%extend BRepClass_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepClass_FClass2dOfFClassifier *
****************************************/
class BRepClass_FClass2dOfFClassifier {
	public:
		/****************** BRepClass_FClass2dOfFClassifier ******************/
		%feature("compactdefaultargs") BRepClass_FClass2dOfFClassifier;
		%feature("autodoc", "* Creates an undefined classifier.
	:rtype: None") BRepClass_FClass2dOfFClassifier;
		 BRepClass_FClass2dOfFClassifier ();

		/****************** ClosestIntersection ******************/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "* Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
	:rtype: int") ClosestIntersection;
		Standard_Integer ClosestIntersection ();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Updates the classification process with the edge <E> from the boundary.
	:param E:
	:type E: BRepClass_Edge
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "* Returns the intersecting algorithm.
	:rtype: BRepClass_Intersector") Intersector;
		BRepClass_Intersector & Intersector ();

		/****************** IsHeadOrEnd ******************/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "* Returns the Standard_True if the closest intersection point represents head or end of the edge. Returns Standard_False otherwise.
	:rtype: bool") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the current value of the parameter.
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns the current state of the point.
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

};


%extend BRepClass_FClass2dOfFClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepClass_FClassifier *
******************************/
class BRepClass_FClassifier {
	public:
		/****************** BRepClass_FClassifier ******************/
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "* Empty constructor, undefined algorithm.
	:rtype: None") BRepClass_FClassifier;
		 BRepClass_FClassifier ();

		/****************** BRepClass_FClassifier ******************/
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "* Creates an algorithm to classify the Point P with Tolerance <T> on the face described by <F>.
	:param F:
	:type F: BRepClass_FaceExplorer
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None") BRepClass_FClassifier;
		 BRepClass_FClassifier (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the Edge used to determine the classification. When the State is ON this is the Edge containing the point.
	:rtype: BRepClass_Edge") Edge;
		const BRepClass_Edge & Edge ();

		/****************** EdgeParameter ******************/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "* Returns the parameter on Edge() used to determine the classification.
	:rtype: float") EdgeParameter;
		Standard_Real EdgeParameter ();

		/****************** NoWires ******************/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "* Returns True if the face contains no wire. The state is IN.
	:rtype: bool") NoWires;
		Standard_Boolean NoWires ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Classify the Point P with Tolerance <T> on the face described by <F>.
	:param F:
	:type F: BRepClass_FaceExplorer
	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (BRepClass_FaceExplorer & F,const gp_Pnt2d & P,const Standard_Real Tol);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "* Returns the position of the point on the edge returned by Edge.
	:rtype: IntRes2d_Position") Position;
		IntRes2d_Position Position ();

		/****************** Rejected ******************/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "* Returns True when the state was computed by a rejection. The state is OUT.
	:rtype: bool") Rejected;
		Standard_Boolean Rejected ();

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns the result of the classification.
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

};


%extend BRepClass_FClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepClass_FaceExplorer *
*******************************/
class BRepClass_FaceExplorer {
	public:
		/****************** BRepClass_FaceExplorer ******************/
		%feature("compactdefaultargs") BRepClass_FaceExplorer;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: None") BRepClass_FaceExplorer;
		 BRepClass_FaceExplorer (const TopoDS_Face & F);

		/****************** CheckPoint ******************/
		%feature("compactdefaultargs") CheckPoint;
		%feature("autodoc", "* Checks the point and change its coords if it is located too far from the bounding box of the face. New Coordinates of the point will be on the line between the point and the center of the bounding box. Returns True if point was not changed.
	:param thePoint:
	:type thePoint: gp_Pnt2d
	:rtype: bool") CheckPoint;
		Standard_Boolean CheckPoint (gp_Pnt2d & thePoint);

		/****************** CurrentEdge ******************/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "* Current edge in current wire and its orientation.
	:param E:
	:type E: BRepClass_Edge
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None") CurrentEdge;
		void CurrentEdge (BRepClass_Edge & E,TopAbs_Orientation & Or);

		/****************** InitEdges ******************/
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "* Starts an exploration of the edges of the current wire.
	:rtype: None") InitEdges;
		void InitEdges ();

		/****************** InitWires ******************/
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "* Starts an exploration of the wires.
	:rtype: None") InitWires;
		void InitWires ();

		/****************** MoreEdges ******************/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "* Returns True if there is a current edge.
	:rtype: bool") MoreEdges;
		Standard_Boolean MoreEdges ();

		/****************** MoreWires ******************/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "* Returns True if there is a current wire.
	:rtype: bool") MoreWires;
		Standard_Boolean MoreWires ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "* Sets the explorer to the next edge.
	:rtype: None") NextEdge;
		void NextEdge ();

		/****************** NextWire ******************/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "* Sets the explorer to the next wire.
	:rtype: None") NextWire;
		void NextWire ();

		/****************** OtherSegment ******************/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "* Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections. Each call gives another segment.
	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") OtherSegment;
		Standard_Boolean OtherSegment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);

		/****************** Reject ******************/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "* Should return True if the point is outside a bounding volume of the face.
	:param P:
	:type P: gp_Pnt2d
	:rtype: bool") Reject;
		Standard_Boolean Reject (const gp_Pnt2d & P);

		/****************** RejectEdge ******************/
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "* Returns True if the edge bounding volume does not intersect the segment.
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") RejectEdge;
		Standard_Boolean RejectEdge (const gp_Lin2d & L,const Standard_Real Par);

		/****************** RejectWire ******************/
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "* Returns True if the wire bounding volume does not intersect the segment.
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") RejectWire;
		Standard_Boolean RejectWire (const gp_Lin2d & L,const Standard_Real Par);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections.
	:param P:
	:type P: gp_Pnt2d
	:param L:
	:type L: gp_Lin2d
	:param Par:
	:type Par: float
	:rtype: bool") Segment;
		Standard_Boolean Segment (const gp_Pnt2d & P,gp_Lin2d & L,Standard_Real &OutValue);

};


%extend BRepClass_FaceExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BRepClass_FacePassiveClassifier *
****************************************/
class BRepClass_FacePassiveClassifier {
	public:
		/****************** BRepClass_FacePassiveClassifier ******************/
		%feature("compactdefaultargs") BRepClass_FacePassiveClassifier;
		%feature("autodoc", "* Creates an undefined classifier.
	:rtype: None") BRepClass_FacePassiveClassifier;
		 BRepClass_FacePassiveClassifier ();

		/****************** ClosestIntersection ******************/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "* Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
	:rtype: int") ClosestIntersection;
		Standard_Integer ClosestIntersection ();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Updates the classification process with the edge <E> from the boundary.
	:param E:
	:type E: BRepClass_Edge
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None") Compare;
		void Compare (const BRepClass_Edge & E,const TopAbs_Orientation Or);

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "* Returns the intersecting algorithm.
	:rtype: BRepClass_Intersector") Intersector;
		BRepClass_Intersector & Intersector ();

		/****************** IsHeadOrEnd ******************/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "* Returns the Standard_True if the closest intersection point represents head or end of the edge. Returns Standard_False otherwise.
	:rtype: bool") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the current value of the parameter.
	:rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None") Reset;
		void Reset (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* Returns the current state of the point.
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

};


%extend BRepClass_FacePassiveClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRepClass_Intersector *
******************************/
class BRepClass_Intersector : public Geom2dInt_IntConicCurveOfGInter {
	public:
		/****************** BRepClass_Intersector ******************/
		%feature("compactdefaultargs") BRepClass_Intersector;
		%feature("autodoc", ":rtype: None") BRepClass_Intersector;
		 BRepClass_Intersector ();

		/****************** LocalGeometry ******************/
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "* Returns in <T>, <N> and <C> the tangent, normal and curvature of the edge <E> at parameter value <U>.
	:param E:
	:type E: BRepClass_Edge
	:param U:
	:type U: float
	:param T:
	:type T: gp_Dir2d
	:param N:
	:type N: gp_Dir2d
	:param C:
	:type C: float
	:rtype: None") LocalGeometry;
		void LocalGeometry (const BRepClass_Edge & E,const Standard_Real U,gp_Dir2d & T,gp_Dir2d & N,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersect the line segment and the edge.
	:param L:
	:type L: gp_Lin2d
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:param E:
	:type E: BRepClass_Edge
	:rtype: None") Perform;
		void Perform (const gp_Lin2d & L,const Standard_Real P,const Standard_Real Tol,const BRepClass_Edge & E);

};


%extend BRepClass_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepClass_FaceClassifier *
*********************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
