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
		/**** md5 signature: fa499f57858b64345785d348f81cc818 ****/
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepClass_Edge;
		 BRepClass_Edge();

		/****************** BRepClass_Edge ******************/
		/**** md5 signature: a6a6c460541f16aaabfb79777156b15f ****/
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
		/**** md5 signature: 7927ca64a27bc7479e2b4d4ab87dbb48 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge();

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Face ******************/
		/**** md5 signature: 6e8f5f8b51d0684fdc076a3f5ea16883 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		TopoDS_Face Face();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
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
		/**** md5 signature: d19d8fe9d8d32983ec914a63ccdfb452 ****/
		%feature("compactdefaultargs") BRepClass_FClass2dOfFClassifier;
		%feature("autodoc", "Creates an undefined classifier.

Returns
-------
None
") BRepClass_FClass2dOfFClassifier;
		 BRepClass_FClass2dOfFClassifier();

		/****************** ClosestIntersection ******************/
		/**** md5 signature: 025d23acf1aa6c435dba31dbf4248fd0 ****/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Returns 0 if the last compared edge had no relevant intersection. else returns the index of this intersection in the last intersection algorithm.

Returns
-------
int
") ClosestIntersection;
		Standard_Integer ClosestIntersection();

		/****************** Compare ******************/
		/**** md5 signature: b424d6a228cca9b1cde54a0ef4d4799b ****/
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
		/**** md5 signature: 8af3d3515af322223174c8018ef27775 ****/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Returns the intersecting algorithm.

Returns
-------
BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector();

		/****************** IsHeadOrEnd ******************/
		/**** md5 signature: bb302ba418a265161aeac4ed94262010 ****/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Returns the standard_true if the closest intersection point represents head or end of the edge. returns standard_false otherwise.

Returns
-------
bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the current value of the parameter.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reset ******************/
		/**** md5 signature: a8c5889582c62cd16da1026d9b738b50 ****/
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
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
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
		/**** md5 signature: bbd41df2b8f9d5c7ae4b1c2c2b0ca106 ****/
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "Empty constructor, undefined algorithm.

Returns
-------
None
") BRepClass_FClassifier;
		 BRepClass_FClassifier();

		/****************** BRepClass_FClassifier ******************/
		/**** md5 signature: a52683ba5457715c4c8153cd3d0c762a ****/
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
		/**** md5 signature: bd52887a3e64f99d6944617c67174745 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge used to determine the classification. when the state is on this is the edge containing the point.

Returns
-------
BRepClass_Edge
") Edge;
		const BRepClass_Edge & Edge();

		/****************** EdgeParameter ******************/
		/**** md5 signature: a4ccdc0e9c154705af034e3ac274511c ****/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Returns the parameter on edge() used to determine the classification.

Returns
-------
float
") EdgeParameter;
		Standard_Real EdgeParameter();

		/****************** NoWires ******************/
		/**** md5 signature: 990679762274e4aefbb7c462574e4bcd ****/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "Returns true if the face contains no wire. the state is in.

Returns
-------
bool
") NoWires;
		Standard_Boolean NoWires();

		/****************** Perform ******************/
		/**** md5 signature: 3cd7b17096eabe50d8cc92b191abf9d7 ****/
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
		/**** md5 signature: 675457384dc44fc07e204a19b6850fe8 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the position of the point on the edge returned by edge.

Returns
-------
IntRes2d_Position
") Position;
		IntRes2d_Position Position();

		/****************** Rejected ******************/
		/**** md5 signature: 56d604911041dd9f442bde612c88e4cd ****/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Returns true when the state was computed by a rejection. the state is out.

Returns
-------
bool
") Rejected;
		Standard_Boolean Rejected();

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
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
		/**** md5 signature: 7ec391bc05dc26ffc180bb1023f157a1 ****/
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
		/**** md5 signature: 6dc400c8511fac8549e1a227e33ff0eb ****/
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
		/**** md5 signature: 612321e6d88f3d95d82e61c0e149151b ****/
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
		/**** md5 signature: 91bbc4c29d3c5c1c40b8c41a10bba4ae ****/
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "Starts an exploration of the edges of the current wire.

Returns
-------
None
") InitEdges;
		void InitEdges();

		/****************** InitWires ******************/
		/**** md5 signature: ebff8f083b93df212af42dee4111419b ****/
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "Starts an exploration of the wires.

Returns
-------
None
") InitWires;
		void InitWires();

		/****************** MoreEdges ******************/
		/**** md5 signature: ae9c44c48922d7def77564a0d6f2c592 ****/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Returns true if there is a current edge.

Returns
-------
bool
") MoreEdges;
		Standard_Boolean MoreEdges();

		/****************** MoreWires ******************/
		/**** md5 signature: b99e6f15aacc2cac79d7fb8f92595589 ****/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "Returns true if there is a current wire.

Returns
-------
bool
") MoreWires;
		Standard_Boolean MoreWires();

		/****************** NextEdge ******************/
		/**** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Sets the explorer to the next edge.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** NextWire ******************/
		/**** md5 signature: 11b92f2dcc830f98b32d40bd651c0b28 ****/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "Sets the explorer to the next wire.

Returns
-------
None
") NextWire;
		void NextWire();

		/****************** OtherSegment ******************/
		/**** md5 signature: 27490dca9d2d53354d092dd2a3334ce2 ****/
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
		/**** md5 signature: a145789dcdf45149993e111ed41174ea ****/
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
		/**** md5 signature: ac46be93532b1dfcf60e7e385f949d17 ****/
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
		/**** md5 signature: a3caa1d04bab721ad3228acbea576ecb ****/
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
		/**** md5 signature: 5eb3735a7b24946e69be33f96fb9d7b5 ****/
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
		/**** md5 signature: 802f6ac24977e4faa647825a59cd29e0 ****/
		%feature("compactdefaultargs") BRepClass_FacePassiveClassifier;
		%feature("autodoc", "Creates an undefined classifier.

Returns
-------
None
") BRepClass_FacePassiveClassifier;
		 BRepClass_FacePassiveClassifier();

		/****************** ClosestIntersection ******************/
		/**** md5 signature: 025d23acf1aa6c435dba31dbf4248fd0 ****/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Returns 0 if the last compared edge had no relevant intersection. else returns the index of this intersection in the last intersection algorithm.

Returns
-------
int
") ClosestIntersection;
		Standard_Integer ClosestIntersection();

		/****************** Compare ******************/
		/**** md5 signature: b424d6a228cca9b1cde54a0ef4d4799b ****/
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
		/**** md5 signature: 8af3d3515af322223174c8018ef27775 ****/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Returns the intersecting algorithm.

Returns
-------
BRepClass_Intersector
") Intersector;
		BRepClass_Intersector & Intersector();

		/****************** IsHeadOrEnd ******************/
		/**** md5 signature: bb302ba418a265161aeac4ed94262010 ****/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Returns the standard_true if the closest intersection point represents head or end of the edge. returns standard_false otherwise.

Returns
-------
bool
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd();

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the current value of the parameter.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Reset ******************/
		/**** md5 signature: a8c5889582c62cd16da1026d9b738b50 ****/
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
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
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
		/**** md5 signature: a88e9c7d891ba6eb26fc5a5e12d952ea ****/
		%feature("compactdefaultargs") BRepClass_Intersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRepClass_Intersector;
		 BRepClass_Intersector();

		/****************** LocalGeometry ******************/
		/**** md5 signature: 70935b52098ea68ba72383cea6594aad ****/
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
		/**** md5 signature: 5249f9e060959ae45003d92383e6b6b7 ****/
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
