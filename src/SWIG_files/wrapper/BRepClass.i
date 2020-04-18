/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepClass_Edge;
		 BRepClass_Edge();

		/****************** BRepClass_Edge ******************/
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") BRepClass_Edge;
		 BRepClass_Edge(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

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
		%feature("autodoc", "Creates an undefined classifier.

Returns
-------
None
") BRepClass_FClass2dOfFClassifier;
		 BRepClass_FClass2dOfFClassifier();

		/****************** ClosestIntersection ******************/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Returns 0 if the last compared edge had no relevant intersection. else returns the index of this intersection in the last intersection algorithm.

Returns
-------
int
") ClosestIntersection;
		Standard_Integer ClosestIntersection();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Updates the classification process with the edge <e> from the boundary.

Parameters
----------
E: BRepClass_Edge
Or: TopAbs_Orientation

Returns
-------
None
") Compare;
		void Compare(const BRepClass_Edge & E, const TopAbs_Orientation Or);

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Returns the intersecting algorithm.

Returns
-------
BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector();

		/****************** IsHeadOrEnd ******************/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Returns the standard_true if the closest intersection point represents head or end of the edge. returns standard_false otherwise.

Returns
-------
bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the current value of the parameter.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Starts a classification process. the point to classify is the origin of the line <l>. <p> is the original length of the segment on <l> used to compute intersections. <tol> is the tolerance attached to the line segment in intersections.

Parameters
----------
L: gp_Lin2d
P: float
Tol: float

Returns
-------
None
") Reset;
		void Reset(const gp_Lin2d & L, const Standard_Real P, const Standard_Real Tol);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the current state of the point.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

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
		%feature("autodoc", "Empty constructor, undefined algorithm.

Returns
-------
None
") BRepClass_FClassifier;
		 BRepClass_FClassifier();

		/****************** BRepClass_FClassifier ******************/
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "Creates an algorithm to classify the point p with tolerance <t> on the face described by <f>.

Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: float

Returns
-------
None
") BRepClass_FClassifier;
		 BRepClass_FClassifier(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge used to determine the classification. when the state is on this is the edge containing the point.

Returns
-------
BRepClass_Edge
") Edge;
		const BRepClass_Edge & Edge();

		/****************** EdgeParameter ******************/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Returns the parameter on edge() used to determine the classification.

Returns
-------
float
") EdgeParameter;
		Standard_Real EdgeParameter();

		/****************** NoWires ******************/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "Returns true if the face contains no wire. the state is in.

Returns
-------
bool
") NoWires;
		Standard_Boolean NoWires();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Classify the point p with tolerance <t> on the face described by <f>.

Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: float

Returns
-------
None
") Perform;
		void Perform(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the point on the edge returned by edge.

Returns
-------
IntRes2d_Position
") Position;
		IntRes2d_Position Position();

		/****************** Rejected ******************/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Returns true when the state was computed by a rejection. the state is out.

Returns
-------
bool
") Rejected;
		Standard_Boolean Rejected();

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the result of the classification.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") BRepClass_FaceExplorer;
		 BRepClass_FaceExplorer(const TopoDS_Face & F);

		/****************** CheckPoint ******************/
		%feature("compactdefaultargs") CheckPoint;
		%feature("autodoc", "Checks the point and change its coords if it is located too far from the bounding box of the face. new coordinates of the point will be on the line between the point and the center of the bounding box. returns true if point was not changed.

Parameters
----------
thePoint: gp_Pnt2d

Returns
-------
bool
") CheckPoint;
		Standard_Boolean CheckPoint(gp_Pnt2d & thePoint);

		/****************** CurrentEdge ******************/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "Current edge in current wire and its orientation.

Parameters
----------
E: BRepClass_Edge
Or: TopAbs_Orientation

Returns
-------
None
") CurrentEdge;
		void CurrentEdge(BRepClass_Edge & E, TopAbs_Orientation & Or);

		/****************** InitEdges ******************/
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "Starts an exploration of the edges of the current wire.

Returns
-------
None
") InitEdges;
		void InitEdges();

		/****************** InitWires ******************/
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "Starts an exploration of the wires.

Returns
-------
None
") InitWires;
		void InitWires();

		/****************** MoreEdges ******************/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Returns true if there is a current edge.

Returns
-------
bool
") MoreEdges;
		Standard_Boolean MoreEdges();

		/****************** MoreWires ******************/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "Returns true if there is a current wire.

Returns
-------
bool
") MoreWires;
		Standard_Boolean MoreWires();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Sets the explorer to the next edge.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** NextWire ******************/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "Sets the explorer to the next wire.

Returns
-------
None
") NextWire;
		void NextWire();

		/****************** OtherSegment ******************/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "Returns in <l>, <par> a segment having at least one intersection with the face boundary to compute intersections. each call gives another segment.

Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Returns
-------
Par: float
") OtherSegment;
		Standard_Boolean OtherSegment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****************** Reject ******************/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "Should return true if the point is outside a bounding volume of the face.

Parameters
----------
P: gp_Pnt2d

Returns
-------
bool
") Reject;
		Standard_Boolean Reject(const gp_Pnt2d & P);

		/****************** RejectEdge ******************/
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "Returns true if the edge bounding volume does not intersect the segment.

Parameters
----------
L: gp_Lin2d
Par: float

Returns
-------
bool
") RejectEdge;
		Standard_Boolean RejectEdge(const gp_Lin2d & L, const Standard_Real Par);

		/****************** RejectWire ******************/
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "Returns true if the wire bounding volume does not intersect the segment.

Parameters
----------
L: gp_Lin2d
Par: float

Returns
-------
bool
") RejectWire;
		Standard_Boolean RejectWire(const gp_Lin2d & L, const Standard_Real Par);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns in <l>, <par> a segment having at least one intersection with the face boundary to compute intersections.

Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Returns
-------
Par: float
") Segment;
		Standard_Boolean Segment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

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
		%feature("autodoc", "Creates an undefined classifier.

Returns
-------
None
") BRepClass_FacePassiveClassifier;
		 BRepClass_FacePassiveClassifier();

		/****************** ClosestIntersection ******************/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Returns 0 if the last compared edge had no relevant intersection. else returns the index of this intersection in the last intersection algorithm.

Returns
-------
int
") ClosestIntersection;
		Standard_Integer ClosestIntersection();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Updates the classification process with the edge <e> from the boundary.

Parameters
----------
E: BRepClass_Edge
Or: TopAbs_Orientation

Returns
-------
None
") Compare;
		void Compare(const BRepClass_Edge & E, const TopAbs_Orientation Or);

		/****************** Intersector ******************/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Returns the intersecting algorithm.

Returns
-------
BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector();

		/****************** IsHeadOrEnd ******************/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Returns the standard_true if the closest intersection point represents head or end of the edge. returns standard_false otherwise.

Returns
-------
bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the current value of the parameter.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Starts a classification process. the point to classify is the origin of the line <l>. <p> is the original length of the segment on <l> used to compute intersections. <tol> is the tolerance attached to the line segment in intersections.

Parameters
----------
L: gp_Lin2d
P: float
Tol: float

Returns
-------
None
") Reset;
		void Reset(const gp_Lin2d & L, const Standard_Real P, const Standard_Real Tol);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Returns the current state of the point.

Returns
-------
TopAbs_State
") State;
		TopAbs_State State();

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepClass_Intersector;
		 BRepClass_Intersector();

		/****************** LocalGeometry ******************/
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "Returns in <t>, <n> and <c> the tangent, normal and curvature of the edge <e> at parameter value <u>.

Parameters
----------
E: BRepClass_Edge
U: float
T: gp_Dir2d
N: gp_Dir2d

Returns
-------
C: float
") LocalGeometry;
		void LocalGeometry(const BRepClass_Edge & E, const Standard_Real U, gp_Dir2d & T, gp_Dir2d & N, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersect the line segment and the edge.

Parameters
----------
L: gp_Lin2d
P: float
Tol: float
E: BRepClass_Edge

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const Standard_Real P, const Standard_Real Tol, const BRepClass_Edge & E);

};


%extend BRepClass_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepClass_FaceClassifier *
*********************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class BRepClass_FaceClassifier:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
