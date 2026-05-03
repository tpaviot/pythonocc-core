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
		/****** md5 signature: 8caeb5e9c71df9d919f7ba515531757f ******/
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
		/****** md5 signature: 657c12d9769667081fd960b688690cc0 ******/
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
		/****** md5 signature: c631dc545618736c229625f04b6d5ef3 ******/
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
		/****** md5 signature: 95406b8d0d556c0537e0768c48713f21 ******/
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
		/****** md5 signature: 8b18d58cdf06b65fb910d2b109f46f19 ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the maximum tolerance.
") MaxTolerance;
		double MaxTolerance();

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
		/****** md5 signature: 849b0e4a8742a5728636ce1e06966b14 ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets the maximum tolerance at which to start checking in the intersector.
") SetMaxTolerance;
		void SetMaxTolerance(const double theValue);

		/****** BRepClass_Edge::SetNextEdge ******/
		/****** md5 signature: f88117bfde9c7048f6faf43a11b51b05 ******/
		%feature("compactdefaultargs") SetNextEdge;
		%feature("autodoc", "
Parameters
----------
theMapVE: NCollection_IndexedDataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
Finds and sets the next Edge for the current.
") SetNextEdge;
		void SetNextEdge(const NCollection_IndexedDataMap<TopoDS_Shape, NCollection_List<TopoDS_Shape>, TopTools_ShapeMapHasher> & theMapVE);

		/****** BRepClass_Edge::SetUseBndBox ******/
		/****** md5 signature: 251294af62b6eb7f33121f1722782657 ******/
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
		void SetUseBndBox(const bool theValue);

		/****** BRepClass_Edge::UseBndBox ******/
		/****** md5 signature: 45e565e4ff33097befa6c733a091f1d2 ******/
		%feature("compactdefaultargs") UseBndBox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if we are using boxes in the intersector.
") UseBndBox;
		bool UseBndBox();

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
		/****** md5 signature: 791df426661ff6f92d48ad8a543e5041 ******/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
") ClosestIntersection;
		int ClosestIntersection();

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
		/****** md5 signature: c86a3ec7832b4ef30f6476784410c038 ******/
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
		/****** md5 signature: f85f957468d96e8492cf8311f2d01e6e ******/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the true if the closest intersection point represents head or end of the edge. Returns false otherwise.
") IsHeadOrEnd;
		bool IsHeadOrEnd();

		/****** BRepClass_FClass2dOfFClassifier::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the current value of the parameter.
") Parameter;
		double Parameter();

		/****** BRepClass_FClass2dOfFClassifier::Reset ******/
		/****** md5 signature: 3fc673cc28042e0ab8c32b82346f7733 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: double
Tol: double

Return
-------
None

Description
-----------
Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
") Reset;
		void Reset(const gp_Lin2d & L, const double P, const double Tol);

		/****** BRepClass_FClass2dOfFClassifier::State ******/
		/****** md5 signature: f060e49862ba79cdeda588bb3f787fae ******/
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
		/****** md5 signature: 8afab97d6173ffdb4851a9d054252be1 ******/
		%feature("compactdefaultargs") BRepClass_FClassifier;
		%feature("autodoc", "
Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: double

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face described by <F>.
") BRepClass_FClassifier;
		 BRepClass_FClassifier(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const double Tol);

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
		/****** md5 signature: 13815005d0cc2fead11cfb9eb012e308 ******/
		%feature("compactdefaultargs") EdgeParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on Edge() used to determine the classification.
") EdgeParameter;
		double EdgeParameter();

		/****** BRepClass_FClassifier::NoWires ******/
		/****** md5 signature: 36079c7f6360c02941720bb6e5be93b3 ******/
		%feature("compactdefaultargs") NoWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the face contains no wire. The state is IN.
") NoWires;
		bool NoWires();

		/****** BRepClass_FClassifier::Perform ******/
		/****** md5 signature: c9f68527719520756678950688aa56a1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: double

Return
-------
None

Description
-----------
Classify the Point P with Tolerance <T> on the face described by <F>.
") Perform;
		void Perform(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const double Tol);

		/****** BRepClass_FClassifier::Position ******/
		/****** md5 signature: f524e9875848f72ebb7d922a7cc6a341 ******/
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
		/****** md5 signature: 789ba27b88c2ab0a5b8a44516e723655 ******/
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the state was computed by a rejection. The state is OUT.
") Rejected;
		bool Rejected();

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
		/****** md5 signature: f573eea2e1c0826d11547cc58d51a008 ******/
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
		bool CheckPoint(gp_Pnt2d & thePoint);

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
		/****** md5 signature: 8b18d58cdf06b65fb910d2b109f46f19 ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the maximum tolerance.
") MaxTolerance;
		double MaxTolerance();

		/****** BRepClass_FaceExplorer::MoreEdges ******/
		/****** md5 signature: bce6418c4ee156d7aebc5c5e398337e5 ******/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current edge.
") MoreEdges;
		bool MoreEdges();

		/****** BRepClass_FaceExplorer::MoreWires ******/
		/****** md5 signature: f7bd3902e3da35c83a343166c46dfbd4 ******/
		%feature("compactdefaultargs") MoreWires;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current wire.
") MoreWires;
		bool MoreWires();

		/****** BRepClass_FaceExplorer::NextEdge ******/
		/****** md5 signature: 0d8dcc74843a56c3f363847f562a8588 ******/
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
		/****** md5 signature: 68943e3dd2bc1359b40104fad8ef49fa ******/
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
		/****** md5 signature: 241d674d6a0ba85fa36470a000190605 ******/
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: double

Description
-----------
Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections. Each call gives another segment.
") OtherSegment;
		bool OtherSegment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****** BRepClass_FaceExplorer::Reject ******/
		/****** md5 signature: ed82d82b1709d7c86d3a577df384715a ******/
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
		bool Reject(const gp_Pnt2d & P);

		/****** BRepClass_FaceExplorer::RejectEdge ******/
		/****** md5 signature: 9b3a253e954492e9398385ca3bc1cc03 ******/
		%feature("compactdefaultargs") RejectEdge;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: double

Return
-------
bool

Description
-----------
Returns True if the edge bounding volume does not intersect the segment.
") RejectEdge;
		bool RejectEdge(const gp_Lin2d & L, const double Par);

		/****** BRepClass_FaceExplorer::RejectWire ******/
		/****** md5 signature: ec56899a034fc7d14d5b1f0ccd64bd09 ******/
		%feature("compactdefaultargs") RejectWire;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Par: double

Return
-------
bool

Description
-----------
Returns True if the wire bounding volume does not intersect the segment.
") RejectWire;
		bool RejectWire(const gp_Lin2d & L, const double Par);

		/****** BRepClass_FaceExplorer::Segment ******/
		/****** md5 signature: 45aa44dad44a1b63d1dd9da8eac33833 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d

Return
-------
Par: double

Description
-----------
Returns in <L>, <Par> a segment having at least one intersection with the face boundary to compute intersections.
") Segment;
		bool Segment(const gp_Pnt2d & P, gp_Lin2d & L, Standard_Real &OutValue);

		/****** BRepClass_FaceExplorer::SetMaxTolerance ******/
		/****** md5 signature: 849b0e4a8742a5728636ce1e06966b14 ******/
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
None

Description
-----------
Sets the maximum tolerance at which to start checking in the intersector.
") SetMaxTolerance;
		void SetMaxTolerance(const double theValue);

		/****** BRepClass_FaceExplorer::SetUseBndBox ******/
		/****** md5 signature: 251294af62b6eb7f33121f1722782657 ******/
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
		void SetUseBndBox(const bool theValue);

		/****** BRepClass_FaceExplorer::UseBndBox ******/
		/****** md5 signature: 45e565e4ff33097befa6c733a091f1d2 ******/
		%feature("compactdefaultargs") UseBndBox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if we are using boxes in the intersector.
") UseBndBox;
		bool UseBndBox();

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
		/****** md5 signature: 791df426661ff6f92d48ad8a543e5041 ******/
		%feature("compactdefaultargs") ClosestIntersection;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns 0 if the last compared edge had no relevant intersection. Else returns the index of this intersection in the last intersection algorithm.
") ClosestIntersection;
		int ClosestIntersection();

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
		/****** md5 signature: c86a3ec7832b4ef30f6476784410c038 ******/
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
		/****** md5 signature: f85f957468d96e8492cf8311f2d01e6e ******/
		%feature("compactdefaultargs") IsHeadOrEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the true if the closest intersection point represents head or end of the edge. Returns false otherwise.
") IsHeadOrEnd;
		bool IsHeadOrEnd();

		/****** BRepClass_FacePassiveClassifier::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the current value of the parameter.
") Parameter;
		double Parameter();

		/****** BRepClass_FacePassiveClassifier::Reset ******/
		/****** md5 signature: 3fc673cc28042e0ab8c32b82346f7733 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: double
Tol: double

Return
-------
None

Description
-----------
Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the line segment in intersections.
") Reset;
		void Reset(const gp_Lin2d & L, const double P, const double Tol);

		/****** BRepClass_FacePassiveClassifier::State ******/
		/****** md5 signature: f060e49862ba79cdeda588bb3f787fae ******/
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
		/****** md5 signature: 802b05b9981bc9a432755e1d2028663b ******/
		%feature("compactdefaultargs") LocalGeometry;
		%feature("autodoc", "
Parameters
----------
E: BRepClass_Edge
U: double
T: gp_Dir2d
N: gp_Dir2d

Return
-------
C: double

Description
-----------
Returns in <T>, <N> and <C> the tangent, normal and curvature of the edge <E> at parameter value <U>.
") LocalGeometry;
		void LocalGeometry(const BRepClass_Edge & E, const double U, gp_Dir2d & T, gp_Dir2d & N, Standard_Real &OutValue);

		/****** BRepClass_Intersector::Perform ******/
		/****** md5 signature: 8c265bede1b15d359d64442687ceedd6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
P: double
Tol: double
E: BRepClass_Edge

Return
-------
None

Description
-----------
Intersect the line segment and the edge.
") Perform;
		void Perform(const gp_Lin2d & L, const double P, const double Tol, const BRepClass_Edge & E);

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
		/****** md5 signature: 7da9e92fbabc073a0d14e27cb1a753aa ******/
		%feature("compactdefaultargs") BRepClass_FaceClassifier;
		%feature("autodoc", "
Parameters
----------
F: BRepClass_FaceExplorer
P: gp_Pnt2d
Tol: double

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face described by <F>.
") BRepClass_FaceClassifier;
		 BRepClass_FaceClassifier(BRepClass_FaceExplorer & F, const gp_Pnt2d & P, const double Tol);

		/****** BRepClass_FaceClassifier::BRepClass_FaceClassifier ******/
		/****** md5 signature: a80b6d81638dab49c749029d3fdfbdab ******/
		%feature("compactdefaultargs") BRepClass_FaceClassifier;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt2d
theTol: double
theUseBndBox: bool (optional, default to false)
theGapCheckTol: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") BRepClass_FaceClassifier;
		 BRepClass_FaceClassifier(const TopoDS_Face & theF, const gp_Pnt2d & theP, const double theTol, const bool theUseBndBox = false, const double theGapCheckTol = 0.1);

		/****** BRepClass_FaceClassifier::BRepClass_FaceClassifier ******/
		/****** md5 signature: d86622c20859b68fc93b903f5ea6786d ******/
		%feature("compactdefaultargs") BRepClass_FaceClassifier;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt
theTol: double
theUseBndBox: bool (optional, default to false)
theGapCheckTol: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Creates an algorithm to classify the Point P with Tolerance <T> on the face <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") BRepClass_FaceClassifier;
		 BRepClass_FaceClassifier(const TopoDS_Face & theF, const gp_Pnt & theP, const double theTol, const bool theUseBndBox = false, const double theGapCheckTol = 0.1);

		/****** BRepClass_FaceClassifier::Perform ******/
		/****** md5 signature: 1020a6ffe470ae94f5c4318e773bfc29 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt2d
theTol: double
theUseBndBox: bool (optional, default to false)
theGapCheckTol: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Classify the Point P with Tolerance <T> on the face described by <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") Perform;
		void Perform(const TopoDS_Face & theF, const gp_Pnt2d & theP, const double theTol, const bool theUseBndBox = false, const double theGapCheckTol = 0.1);

		/****** BRepClass_FaceClassifier::Perform ******/
		/****** md5 signature: b3836654ec4d66daa13e22055f4c10d1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theF: TopoDS_Face
theP: gp_Pnt
theTol: double
theUseBndBox: bool (optional, default to false)
theGapCheckTol: double (optional, default to 0.1)

Return
-------
None

Description
-----------
Classify the Point P with Tolerance <T> on the face described by <F>. Recommended to use Bnd_Box if the number of edges > 10 and the geometry is mostly spline.
") Perform;
		void Perform(const TopoDS_Face & theF, const gp_Pnt & theP, const double theTol, const bool theUseBndBox = false, const double theGapCheckTol = 0.1);

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
