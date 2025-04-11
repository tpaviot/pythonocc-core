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
%define BREPCLASSDOCSTRING
"BRepClass module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepclass.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<BRepClass_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
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
%import TopTools.i
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

/* python proxy classes for enums */
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
		/****** BRepClass_Edge::BRepClass_Edge ******/
		/****** md5 signature: fa499f57858b64345785d348f81cc818 ******/
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepClass_Edge;
		 BRepClass_Edge();

		/****** BRepClass_Edge::BRepClass_Edge ******/
		/****** md5 signature: a6a6c460541f16aaabfb79777156b15f ******/
		%feature("compactdefaultargs") BRepClass_Edge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") BRepClass_Edge;
		 BRepClass_Edge(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepClass_Edge::Edge ******/
		/****** md5 signature: 7927ca64a27bc7479e2b4d4ab87dbb48 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the current Edge.
") Edge;
		TopoDS_Edge Edge();

		/****** BRepClass_Edge::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepClass_Edge::Face ******/
		/****** md5 signature: 6e8f5f8b51d0684fdc076a3f5ea16883 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the Face for the current Edge.
") Face;
		TopoDS_Face Face();

		/****** BRepClass_Edge::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****** BRepClass_Edge::MaxTolerance ******/
		/****** md5 signature: 34f00536788c474152c6e8ed59dfb31e ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum tolerance.
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****** BRepClass_Edge::NextEdge ******/
		/****** md5 signature: 46e9b5528185041e80eced3cd59f29f3 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the next Edge.
") NextEdge;
		const TopoDS_Edge NextEdge();

		/****** BRepClass_Edge::SetMaxTolerance ******/
		/****** md5 signature: d9b5f48764b511c321401dad8b37d561 ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets the maximum tolerance at which to start checking in the intersector.
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real theValue);

		/****** BRepClass_Edge::SetNextEdge ******/
		/****** md5 signature: c50a2707391a16a921afeeeda217e8ca ******/
		%feature("compactdefaultargs") SetNextEdge;
		%feature("autodoc", "
Parameters
----------
theMapVE: TopTools_IndexedDataMapOfShapeListOfShape

Return
-------
None

Description
-----------
Finds and sets the next Edge for the current.
") SetNextEdge;
		void SetNextEdge(const TopTools_IndexedDataMapOfShapeListOfShape & theMapVE);

		/****** BRepClass_Edge::SetUseBndBox ******/
		/****** md5 signature: a345a208e442f23a048168731ab1417e ******/
		%feature("compactdefaultargs") SetUseBndBox;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Sets the status of whether we are using boxes or not.
") SetUseBndBox;
		void SetUseBndBox(const Standard_Boolean theValue);

		/****** BRepClass_Edge::UseBndBox ******/
		/****** md5 signature: 02b68d127830fd41ee322e70833ed230 ******/
		%feature("compactdefaultargs") UseBndBox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if we are using boxes in the intersector.
") UseBndBox;
		Standard_Boolean UseBndBox();

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
		/****** BRepClass_FClass2dOfFClassifier::BRepClass_FClass2dOfFClassifier ******/
		/****** md5 signature: d19d8fe9d8d32983ec914a63ccdfb452 ******/
		%feature("compactdefaultargs") BRepClass_FClass2dOfFClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined classifier.
") BRepClass_FClass2dOfFClassifier;
		 BRepClass_FClass2dOfFClassifier();

		/****** BRepClass_FClass2dOfFClassifier::ClosestIntersection ******/
		/****** md5 signature: 025d23acf1aa6c435dba31dbf4248fd0 ******/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
") ClosestIntersection;
		Standard_Integer ClosestIntersection();

		/****** BRepClass_FClass2dOfFClassifier::Compare ******/
		/****** md5 signature: b424d6a228cca9b1cde54a0ef4d4799b ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
E: BRepClass_Edge
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
Updates the classification process with the edge <E> from the boundary.
") Compare;
		void Compare(const BRepClass_Edge & E, const TopAbs_Orientation Or);

		/****** BRepClass_FClass2dOfFClassifier::Intersector ******/
		/****** md5 signature: 8af3d3515af322223174c8018ef27775 ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
BRepClass_Intersector

Description
-----------
Returns the intersecting algorithm.
") Intersector;
		BRepClass_Intersector & Intersector();

		/****** BRepClass_FClass2dOfFClassifier::IsHeadOrEnd ******/
		/****** md5 signature: bb302ba418a265161aeac4ed94262010 ******/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Standard_True if the closest intersection point represents head or end of the edge. Returns Standard_False otherwise.
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd();

		/****** BRepClass_FClass2dOfFClassifier::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the current value of the parameter.
") Parameter;
		Standard_Real Parameter();

		/****** BRepClass_FClass2dOfFClassifier::Reset ******/
		/****** md5 signature: a8c5889582c62cd16da1026d9b738b50 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: float
Tol: float

Return
-------
None

Description
-----------
Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
") Reset;
		void Reset(const gp_Lin2d & L, const Standard_Real P, const Standard_Real Tol);

		/****** BRepClass_FClass2dOfFClassifier::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the current state of the point.
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
		/****** BRepClass_FClassifier::BRepClass_FClassifier ******/
		/****** md5 signature: bbd41df2b8f9d5c7ae4b1c2c2b0ca106 ******/
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, undefined algorithm.
") BRepClass_FClassifier;
		 BRepClass_FClassifier();

		/****** BRepClass_FClassifier::BRepClass_FClassifier ******/
		/****** md5 signature: a52683ba5457715c4c8153cd3d0c762a ******/
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "
Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: float

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face described by <F>.
") BRepClass_FClassifier;
		 BRepClass_FClassifier(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****** BRepClass_FClassifier::Edge ******/
		/****** md5 signature: bd52887a3e64f99d6944617c67174745 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
BRepClass_Edge

Description
-----------
Returns the Edge used to determine the classification. When the State is ON this is the Edge containing the point.
") Edge;
		const BRepClass_Edge & Edge();

		/****** BRepClass_FClassifier::EdgeParameter ******/
		/****** md5 signature: a4ccdc0e9c154705af034e3ac274511c ******/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on Edge() used to determine the classification.
") EdgeParameter;
		Standard_Real EdgeParameter();

		/****** BRepClass_FClassifier::NoWires ******/
		/****** md5 signature: 990679762274e4aefbb7c462574e4bcd ******/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the face contains no wire. The state is IN.
") NoWires;
		Standard_Boolean NoWires();

		/****** BRepClass_FClassifier::Perform ******/
		/****** md5 signature: 3cd7b17096eabe50d8cc92b191abf9d7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: float

Return
-------
None

Description
-----------
Classify the Point P with Tolerance <T> on the face described by <F>.
") Perform;
		void Perform(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****** BRepClass_FClassifier::Position ******/
		/****** md5 signature: 675457384dc44fc07e204a19b6850fe8 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
IntRes2d_Position

Description
-----------
Returns the position of the point on the edge returned by Edge.
") Position;
		IntRes2d_Position Position();

		/****** BRepClass_FClassifier::Rejected ******/
		/****** md5 signature: 56d604911041dd9f442bde612c88e4cd ******/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the state was computed by a rejection. The state is OUT.
") Rejected;
		Standard_Boolean Rejected();

		/****** BRepClass_FClassifier::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the result of the classification.
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
		/****** BRepClass_FaceExplorer::BRepClass_FaceExplorer ******/
		/****** md5 signature: 7ec391bc05dc26ffc180bb1023f157a1 ******/
		%feature("compactdefaultargs") BRepClass_FaceExplorer;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") BRepClass_FaceExplorer;
		 BRepClass_FaceExplorer(const TopoDS_Face & F);

		/****** BRepClass_FaceExplorer::CheckPoint ******/
		/****** md5 signature: 6dc400c8511fac8549e1a227e33ff0eb ******/
		%feature("compactdefaultargs") CheckPoint;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
bool

Description
-----------
Checks the point and change its coords if it is located too far from the bounding box of the face. New Coordinates of the point will be on the line between the point and the center of the bounding box. Returns True if point was not changed.
") CheckPoint;
		Standard_Boolean CheckPoint(gp_Pnt2d & thePoint);

		/****** BRepClass_FaceExplorer::CurrentEdge ******/
		/****** md5 signature: 612321e6d88f3d95d82e61c0e149151b ******/
		%feature("compactdefaultargs") CurrentEdge;
		%feature("autodoc", "
Parameters
----------
E: BRepClass_Edge

Return
-------
Or: TopAbs_Orientation

Description
-----------
Current edge in current wire and its orientation.
") CurrentEdge;
		void CurrentEdge(BRepClass_Edge & E, TopAbs_Orientation &OutValue);

		/****** BRepClass_FaceExplorer::InitEdges ******/
		/****** md5 signature: 91bbc4c29d3c5c1c40b8c41a10bba4ae ******/
		%feature("compactdefaultargs") InitEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts an exploration of the edges of the current wire.
") InitEdges;
		void InitEdges();

		/****** BRepClass_FaceExplorer::InitWires ******/
		/****** md5 signature: ebff8f083b93df212af42dee4111419b ******/
		%feature("compactdefaultargs") InitWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
Starts an exploration of the wires.
") InitWires;
		void InitWires();

		/****** BRepClass_FaceExplorer::MaxTolerance ******/
		/****** md5 signature: 34f00536788c474152c6e8ed59dfb31e ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum tolerance.
") MaxTolerance;
		Standard_Real MaxTolerance();

		/****** BRepClass_FaceExplorer::MoreEdges ******/
		/****** md5 signature: ae9c44c48922d7def77564a0d6f2c592 ******/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current edge.
") MoreEdges;
		Standard_Boolean MoreEdges();

		/****** BRepClass_FaceExplorer::MoreWires ******/
		/****** md5 signature: b99e6f15aacc2cac79d7fb8f92595589 ******/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current wire.
") MoreWires;
		Standard_Boolean MoreWires();

		/****** BRepClass_FaceExplorer::NextEdge ******/
		/****** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the explorer to the next edge.
") NextEdge;
		void NextEdge();

		/****** BRepClass_FaceExplorer::NextWire ******/
		/****** md5 signature: 11b92f2dcc830f98b32d40bd651c0b28 ******/
		%feature("compactdefaultargs") NextWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the explorer to the next wire.
") NextWire;
		void NextWire();

		/****** BRepClass_FaceExplorer::OtherSegment ******/
		/****** md5 signature: 27490dca9d2d53354d092dd2a3334ce2 ******/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: float

Description
-----------
Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections. Each call gives another segment.
") OtherSegment;
		Standard_Boolean OtherSegment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****** BRepClass_FaceExplorer::Reject ******/
		/****** md5 signature: a145789dcdf45149993e111ed41174ea ******/
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
bool

Description
-----------
Should return True if the point is outside a bounding volume of the face.
") Reject;
		Standard_Boolean Reject(const gp_Pnt2d & P);

		/****** BRepClass_FaceExplorer::RejectEdge ******/
		/****** md5 signature: ac46be93532b1dfcf60e7e385f949d17 ******/
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: float

Return
-------
bool

Description
-----------
Returns True if the edge bounding volume does not intersect the segment.
") RejectEdge;
		Standard_Boolean RejectEdge(const gp_Lin2d & L, const Standard_Real Par);

		/****** BRepClass_FaceExplorer::RejectWire ******/
		/****** md5 signature: a3caa1d04bab721ad3228acbea576ecb ******/
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: float

Return
-------
bool

Description
-----------
Returns True if the wire bounding volume does not intersect the segment.
") RejectWire;
		Standard_Boolean RejectWire(const gp_Lin2d & L, const Standard_Real Par);

		/****** BRepClass_FaceExplorer::Segment ******/
		/****** md5 signature: 5eb3735a7b24946e69be33f96fb9d7b5 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: float

Description
-----------
Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections.
") Segment;
		Standard_Boolean Segment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****** BRepClass_FaceExplorer::SetMaxTolerance ******/
		/****** md5 signature: d9b5f48764b511c321401dad8b37d561 ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: float

Return
-------
None

Description
-----------
Sets the maximum tolerance at which to start checking in the intersector.
") SetMaxTolerance;
		void SetMaxTolerance(const Standard_Real theValue);

		/****** BRepClass_FaceExplorer::SetUseBndBox ******/
		/****** md5 signature: a345a208e442f23a048168731ab1417e ******/
		%feature("compactdefaultargs") SetUseBndBox;
		%feature("autodoc", "
Parameters
----------
theValue: bool

Return
-------
None

Description
-----------
Sets the status of whether we are using boxes or not.
") SetUseBndBox;
		void SetUseBndBox(const Standard_Boolean theValue);

		/****** BRepClass_FaceExplorer::UseBndBox ******/
		/****** md5 signature: 02b68d127830fd41ee322e70833ed230 ******/
		%feature("compactdefaultargs") UseBndBox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if we are using boxes in the intersector.
") UseBndBox;
		Standard_Boolean UseBndBox();

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
		/****** BRepClass_FacePassiveClassifier::BRepClass_FacePassiveClassifier ******/
		/****** md5 signature: 802f6ac24977e4faa647825a59cd29e0 ******/
		%feature("compactdefaultargs") BRepClass_FacePassiveClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined classifier.
") BRepClass_FacePassiveClassifier;
		 BRepClass_FacePassiveClassifier();

		/****** BRepClass_FacePassiveClassifier::ClosestIntersection ******/
		/****** md5 signature: 025d23acf1aa6c435dba31dbf4248fd0 ******/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
") ClosestIntersection;
		Standard_Integer ClosestIntersection();

		/****** BRepClass_FacePassiveClassifier::Compare ******/
		/****** md5 signature: b424d6a228cca9b1cde54a0ef4d4799b ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
E: BRepClass_Edge
Or: TopAbs_Orientation

Return
-------
None

Description
-----------
Updates the classification process with the edge <E> from the boundary.
") Compare;
		void Compare(const BRepClass_Edge & E, const TopAbs_Orientation Or);

		/****** BRepClass_FacePassiveClassifier::Intersector ******/
		/****** md5 signature: 8af3d3515af322223174c8018ef27775 ******/
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "Return
-------
BRepClass_Intersector

Description
-----------
Returns the intersecting algorithm.
") Intersector;
		BRepClass_Intersector & Intersector();

		/****** BRepClass_FacePassiveClassifier::IsHeadOrEnd ******/
		/****** md5 signature: bb302ba418a265161aeac4ed94262010 ******/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the Standard_True if the closest intersection point represents head or end of the edge. Returns Standard_False otherwise.
") IsHeadOrEnd;
		Standard_Boolean IsHeadOrEnd();

		/****** BRepClass_FacePassiveClassifier::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the current value of the parameter.
") Parameter;
		Standard_Real Parameter();

		/****** BRepClass_FacePassiveClassifier::Reset ******/
		/****** md5 signature: a8c5889582c62cd16da1026d9b738b50 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: float
Tol: float

Return
-------
None

Description
-----------
Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
") Reset;
		void Reset(const gp_Lin2d & L, const Standard_Real P, const Standard_Real Tol);

		/****** BRepClass_FacePassiveClassifier::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the current state of the point.
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
		/****** BRepClass_Intersector::BRepClass_Intersector ******/
		/****** md5 signature: a88e9c7d891ba6eb26fc5a5e12d952ea ******/
		%feature("compactdefaultargs") BRepClass_Intersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRepClass_Intersector;
		 BRepClass_Intersector();

		/****** BRepClass_Intersector::LocalGeometry ******/
		/****** md5 signature: 70935b52098ea68ba72383cea6594aad ******/
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "
Parameters
----------
E: BRepClass_Edge
U: float
T: gp_Dir2d
N: gp_Dir2d

Return
-------
C: float

Description
-----------
Returns in <T>, <N> and <C> the tangent, normal and curvature of the edge <E> at parameter value <U>.
") LocalGeometry;
		void LocalGeometry(const BRepClass_Edge & E, const Standard_Real U, gp_Dir2d & T, gp_Dir2d & N, Standard_Real &OutValue);

		/****** BRepClass_Intersector::Perform ******/
		/****** md5 signature: 5249f9e060959ae45003d92383e6b6b7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: float
Tol: float
E: BRepClass_Edge

Return
-------
None

Description
-----------
Intersect the line segment and the edge.
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
class BRepClass_FaceClassifier : public BRepClass_FClassifier {
	public:
		/****** BRepClass_FaceClassifier::BRepClass_FaceClassifier ******/
		/****** md5 signature: 3aeb4d4449ed7e7167a0e7f4bbb500a3 ******/
		%feature("compactdefaultargs") BRepClass_FaceClassifier;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor, undefined algorithm.
") BRepClass_FaceClassifier;
		 BRepClass_FaceClassifier();

		/****** BRepClass_FaceClassifier::BRepClass_FaceClassifier ******/
		/****** md5 signature: 9f90975def9132fa18342a3e56ae4e4a ******/
		%feature("compactdefaultargs") BRepClass_FaceClassifier;
		%feature("autodoc", "
Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: float

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face described by <F>.
") BRepClass_FaceClassifier;
		 BRepClass_FaceClassifier(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const Standard_Real Tol);

		/****** BRepClass_FaceClassifier::BRepClass_FaceClassifier ******/
		/****** md5 signature: ba4f6fe23b613f1af759144923fac8b6 ******/
		%feature("compactdefaultargs") BRepClass_FaceClassifier;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt2d
theTol: float
theUseBndBox: bool (optional, default to Standard_False)
theGapCheckTol: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") BRepClass_FaceClassifier;
		 BRepClass_FaceClassifier(const TopoDS_Face & theF, const gp_Pnt2d & theP, const Standard_Real theTol, const Standard_Boolean theUseBndBox = Standard_False, const Standard_Real theGapCheckTol = 0.1);

		/****** BRepClass_FaceClassifier::BRepClass_FaceClassifier ******/
		/****** md5 signature: 8cd88928fae7d28c32ff4af3cafa3435 ******/
		%feature("compactdefaultargs") BRepClass_FaceClassifier;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt
theTol: float
theUseBndBox: bool (optional, default to Standard_False)
theGapCheckTol: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") BRepClass_FaceClassifier;
		 BRepClass_FaceClassifier(const TopoDS_Face & theF, const gp_Pnt & theP, const Standard_Real theTol, const Standard_Boolean theUseBndBox = Standard_False, const Standard_Real theGapCheckTol = 0.1);

		/****** BRepClass_FaceClassifier::Perform ******/
		/****** md5 signature: 3ced0bf5a7958aa636c9d28b2159163d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt2d
theTol: float
theUseBndBox: bool (optional, default to Standard_False)
theGapCheckTol: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Classify the Point P with Tolerance <T> on the face described by <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") Perform;
		void Perform(const TopoDS_Face & theF, const gp_Pnt2d & theP, const Standard_Real theTol, const Standard_Boolean theUseBndBox = Standard_False, const Standard_Real theGapCheckTol = 0.1);

		/****** BRepClass_FaceClassifier::Perform ******/
		/****** md5 signature: 5d29b2c64e703bbc79782bcb18b7f6fa ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt
theTol: float
theUseBndBox: bool (optional, default to Standard_False)
theGapCheckTol: float (optional, default to 0.1)

Return
-------
None

Description
-----------
Classify the Point P with Tolerance <T> on the face described by <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") Perform;
		void Perform(const TopoDS_Face & theF, const gp_Pnt & theP, const Standard_Real theTol, const Standard_Boolean theUseBndBox = Standard_False, const Standard_Real theGapCheckTol = 0.1);

};


%extend BRepClass_FaceClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
