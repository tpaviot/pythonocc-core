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
%define BREPCHECKDOCSTRING
"BRepCheck module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepcheck.html"
%enddef
%module (package="OCC.Core", docstring=BREPCHECKDOCSTRING) BRepCheck


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
#include<BRepCheck_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import TopoDS.i
%import TopTools.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum BRepCheck_Status {
	BRepCheck_NoError = 0,
	BRepCheck_InvalidPointOnCurve = 1,
	BRepCheck_InvalidPointOnCurveOnSurface = 2,
	BRepCheck_InvalidPointOnSurface = 3,
	BRepCheck_No3DCurve = 4,
	BRepCheck_Multiple3DCurve = 5,
	BRepCheck_Invalid3DCurve = 6,
	BRepCheck_NoCurveOnSurface = 7,
	BRepCheck_InvalidCurveOnSurface = 8,
	BRepCheck_InvalidCurveOnClosedSurface = 9,
	BRepCheck_InvalidSameRangeFlag = 10,
	BRepCheck_InvalidSameParameterFlag = 11,
	BRepCheck_InvalidDegeneratedFlag = 12,
	BRepCheck_FreeEdge = 13,
	BRepCheck_InvalidMultiConnexity = 14,
	BRepCheck_InvalidRange = 15,
	BRepCheck_EmptyWire = 16,
	BRepCheck_RedundantEdge = 17,
	BRepCheck_SelfIntersectingWire = 18,
	BRepCheck_NoSurface = 19,
	BRepCheck_InvalidWire = 20,
	BRepCheck_RedundantWire = 21,
	BRepCheck_IntersectingWires = 22,
	BRepCheck_InvalidImbricationOfWires = 23,
	BRepCheck_EmptyShell = 24,
	BRepCheck_RedundantFace = 25,
	BRepCheck_InvalidImbricationOfShells = 26,
	BRepCheck_UnorientableShape = 27,
	BRepCheck_NotClosed = 28,
	BRepCheck_NotConnected = 29,
	BRepCheck_SubshapeNotInShape = 30,
	BRepCheck_BadOrientation = 31,
	BRepCheck_BadOrientationOfSubshape = 32,
	BRepCheck_InvalidPolygonOnTriangulation = 33,
	BRepCheck_InvalidToleranceValue = 34,
	BRepCheck_EnclosedRegion = 35,
	BRepCheck_CheckFail = 36,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class BRepCheck_Status:
	BRepCheck_NoError = 0
	BRepCheck_InvalidPointOnCurve = 1
	BRepCheck_InvalidPointOnCurveOnSurface = 2
	BRepCheck_InvalidPointOnSurface = 3
	BRepCheck_No3DCurve = 4
	BRepCheck_Multiple3DCurve = 5
	BRepCheck_Invalid3DCurve = 6
	BRepCheck_NoCurveOnSurface = 7
	BRepCheck_InvalidCurveOnSurface = 8
	BRepCheck_InvalidCurveOnClosedSurface = 9
	BRepCheck_InvalidSameRangeFlag = 10
	BRepCheck_InvalidSameParameterFlag = 11
	BRepCheck_InvalidDegeneratedFlag = 12
	BRepCheck_FreeEdge = 13
	BRepCheck_InvalidMultiConnexity = 14
	BRepCheck_InvalidRange = 15
	BRepCheck_EmptyWire = 16
	BRepCheck_RedundantEdge = 17
	BRepCheck_SelfIntersectingWire = 18
	BRepCheck_NoSurface = 19
	BRepCheck_InvalidWire = 20
	BRepCheck_RedundantWire = 21
	BRepCheck_IntersectingWires = 22
	BRepCheck_InvalidImbricationOfWires = 23
	BRepCheck_EmptyShell = 24
	BRepCheck_RedundantFace = 25
	BRepCheck_InvalidImbricationOfShells = 26
	BRepCheck_UnorientableShape = 27
	BRepCheck_NotClosed = 28
	BRepCheck_NotConnected = 29
	BRepCheck_SubshapeNotInShape = 30
	BRepCheck_BadOrientation = 31
	BRepCheck_BadOrientationOfSubshape = 32
	BRepCheck_InvalidPolygonOnTriangulation = 33
	BRepCheck_InvalidToleranceValue = 34
	BRepCheck_EnclosedRegion = 35
	BRepCheck_CheckFail = 36
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepCheck_Result)
%wrap_handle(BRepCheck_Edge)
%wrap_handle(BRepCheck_Face)
%wrap_handle(BRepCheck_Shell)
%wrap_handle(BRepCheck_Solid)
%wrap_handle(BRepCheck_Vertex)
%wrap_handle(BRepCheck_Wire)
/* end handles declaration */

/* templates */
%template(BRepCheck_DataMapOfShapeListOfStatus) NCollection_DataMap<TopoDS_Shape,BRepCheck_ListOfStatus,TopTools_ShapeMapHasher>;
%template(BRepCheck_DataMapOfShapeResult) NCollection_DataMap<TopoDS_Shape,opencascade::handle<BRepCheck_Result>,TopTools_OrientedShapeMapHasher>;
%template(BRepCheck_ListIteratorOfListOfStatus) NCollection_TListIterator<BRepCheck_Status>;
%template(BRepCheck_ListOfStatus) NCollection_List<BRepCheck_Status>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, BRepCheck_ListOfStatus, TopTools_ShapeMapHasher>::Iterator BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<BRepCheck_Result>, TopTools_OrientedShapeMapHasher>::Iterator BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
typedef NCollection_DataMap<TopoDS_Shape, BRepCheck_ListOfStatus, TopTools_ShapeMapHasher> BRepCheck_DataMapOfShapeListOfStatus;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<BRepCheck_Result>, TopTools_OrientedShapeMapHasher> BRepCheck_DataMapOfShapeResult;
typedef NCollection_List<BRepCheck_Status>::Iterator BRepCheck_ListIteratorOfListOfStatus;
typedef NCollection_List<BRepCheck_Status> BRepCheck_ListOfStatus;
/* end typedefs declaration */

/******************
* class BRepCheck *
******************/
%rename(brepcheck) BRepCheck;
class BRepCheck {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
List: BRepCheck_ListOfStatus
Stat: BRepCheck_Status

Returns
-------
None
") Add;
		static void Add(BRepCheck_ListOfStatus & List, const BRepCheck_Status Stat);

		/****************** PrecCurve ******************/
		%feature("compactdefaultargs") PrecCurve;
		%feature("autodoc", "Returns the resolution on the 3d curve.

Parameters
----------
aAC3D: Adaptor3d_Curve

Returns
-------
float
") PrecCurve;
		static Standard_Real PrecCurve(const Adaptor3d_Curve & aAC3D);

		/****************** PrecSurface ******************/
		%feature("compactdefaultargs") PrecSurface;
		%feature("autodoc", "Returns the resolution on the surface.

Parameters
----------
aAHSurf: Adaptor3d_HSurface

Returns
-------
float
") PrecSurface;
		static Standard_Real PrecSurface(const opencascade::handle<Adaptor3d_HSurface> & aAHSurf);

		/****************** SelfIntersection ******************/
		%feature("compactdefaultargs") SelfIntersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge

Returns
-------
bool
") SelfIntersection;
		static Standard_Boolean SelfIntersection(const TopoDS_Wire & W, const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2);

};


%extend BRepCheck {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepCheck_Analyzer *
***************************/
class BRepCheck_Analyzer {
	public:
		/****************** BRepCheck_Analyzer ******************/
		%feature("compactdefaultargs") BRepCheck_Analyzer;
		%feature("autodoc", "Constructs a shape validation object defined by the shape s. <s> is the shape to control. <geomcontrols> if false only topological informaions are checked. the geometricals controls are for a vertex : brepcheck_invalidtolerancevalue nyi for an edge : brepcheck_invalidcurveonclosedsurface, brepcheck_invalidcurveonsurface, brepcheck_invalidsameparameterflag, brepcheck_invalidtolerancevalue nyi for a face : brepcheck_unorientableshape, brepcheck_intersectingwires, brepcheck_invalidtolerancevalue nyi for a wire : brepcheck_selfintersectingwire.

Parameters
----------
S: TopoDS_Shape
GeomControls: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepCheck_Analyzer;
		 BRepCheck_Analyzer(const TopoDS_Shape & S, const Standard_Boolean GeomControls = Standard_True);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "<s> is the shape to control. <geomcontrols> if false only topological informaions are checked. the geometricals controls are for a vertex : brepcheck_invalidtolerance nyi for an edge : brepcheck_invalidcurveonclosedsurface, brepcheck_invalidcurveonsurface, brepcheck_invalidsameparameterflag, brepcheck_invalidtolerance nyi for a face : brepcheck_unorientableshape, brepcheck_intersectingwires, brepcheck_invalidtolerance nyi for a wire : brepcheck_selfintersectingwire.

Parameters
----------
S: TopoDS_Shape
GeomControls: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Boolean GeomControls = Standard_True);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "<s> is a subshape of the original shape. returns <standard_true> if no default has been detected on <s> and any of its subshape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid(const TopoDS_Shape & S);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns true if no defect is detected on the shape s or any of its subshapes. returns true if the shape s is valid. this function checks whether a given shape is valid by checking that: - the topology is correct - parameterization of edges in particular is correct. for the topology to be correct, the following conditions must be satisfied: - edges should have at least two vertices if they are not degenerate edges. the vertices should be within the range of the bounding edges at the tolerance specified in the vertex, - edges should share at least one face. the representation of the edges should be within the tolerance criterion assigned to them. - wires defining a face should not self-intersect and should be closed, - there should be one wire which contains all other wires inside a face, - wires should be correctly oriented with respect to each of the edges, - faces should be correctly oriented, in particular with respect to adjacent faces if these faces define a solid, - shells defining a solid should be closed. there should be one enclosing shell if the shape is a solid; to check parameterization of edge, there are 2 approaches depending on the edge?s contextual situation. - if the edge is either single, or it is in the context of a wire or a compound, its parameterization is defined by the parameterization of its 3d curve and is considered as valid. - if the edge is in the context of a face, it should have sameparameter and samerange flags set to standard_true. to check these flags, you should call the function brep_tool::sameparameter and brep_tool::samerange for an edge. if at least one of these flags is set to standard_false, the edge is considered as invalid without any additional check. if the edge is contained by a face, and it has sameparameter and samerange flags set to standard_true, isvalid checks whether representation of the edge on face, in context of which the edge is considered, has the same parameterization up to the tolerance value coded on the edge. for a given parameter t on the edge having c as a 3d curve and one pcurve p on a surface s (base surface of the reference face), this checks that |c(t) - s(p(t))| is less than or equal to tolerance, where tolerance is the tolerance value coded on the edge.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Parameters
----------
SubS: TopoDS_Shape

Returns
-------
opencascade::handle<BRepCheck_Result>
") Result;
		const opencascade::handle<BRepCheck_Result> & Result(const TopoDS_Shape & SubS);

};


%extend BRepCheck_Analyzer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepCheck_Result *
*************************/
%nodefaultctor BRepCheck_Result;
class BRepCheck_Result : public Standard_Transient {
	public:
		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		virtual void Blind();

		/****************** ContextualShape ******************/
		%feature("compactdefaultargs") ContextualShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ContextualShape;
		const TopoDS_Shape ContextualShape();

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
ContextShape: TopoDS_Shape

Returns
-------
None
") InContext;
		virtual void InContext(const TopoDS_Shape & ContextShape);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** InitContextIterator ******************/
		%feature("compactdefaultargs") InitContextIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitContextIterator;
		void InitContextIterator();

		/****************** IsBlind ******************/
		%feature("compactdefaultargs") IsBlind;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsBlind;
		Standard_Boolean IsBlind();

		/****************** IsMinimum ******************/
		%feature("compactdefaultargs") IsMinimum;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMinimum;
		Standard_Boolean IsMinimum();

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		virtual void Minimum();

		/****************** MoreShapeInContext ******************/
		%feature("compactdefaultargs") MoreShapeInContext;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreShapeInContext;
		Standard_Boolean MoreShapeInContext();

		/****************** NextShapeInContext ******************/
		%feature("compactdefaultargs") NextShapeInContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextShapeInContext;
		void NextShapeInContext();

		/****************** SetFailStatus ******************/
		%feature("compactdefaultargs") SetFailStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") SetFailStatus;
		void SetFailStatus(const TopoDS_Shape & S);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepCheck_ListOfStatus
") Status;
		const BRepCheck_ListOfStatus & Status();

		/****************** StatusOnShape ******************/
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", "If not already done, performs the incontext control and returns the list of status.

Parameters
----------
S: TopoDS_Shape

Returns
-------
BRepCheck_ListOfStatus
") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape(const TopoDS_Shape & S);

		/****************** StatusOnShape ******************/
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepCheck_ListOfStatus
") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape();

};


%make_alias(BRepCheck_Result)

%extend BRepCheck_Result {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepCheck_Edge *
***********************/
class BRepCheck_Edge : public BRepCheck_Result {
	public:
		/****************** BRepCheck_Edge ******************/
		%feature("compactdefaultargs") BRepCheck_Edge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") BRepCheck_Edge;
		 BRepCheck_Edge(const TopoDS_Edge & E);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** CheckPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") CheckPolygonOnTriangulation;
		%feature("autodoc", "Checks, if polygon on triangulation of heedge is out of 3d-curve of this edge.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
BRepCheck_Status
") CheckPolygonOnTriangulation;
		BRepCheck_Status CheckPolygonOnTriangulation(const TopoDS_Edge & theEdge);

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") GeometricControls;
		void GeometricControls(const Standard_Boolean B);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
ContextShape: TopoDS_Shape

Returns
-------
None
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status of edge;.

Parameters
----------
theStatus: BRepCheck_Status

Returns
-------
None
") SetStatus;
		void SetStatus(const BRepCheck_Status theStatus);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

};


%make_alias(BRepCheck_Edge)

%extend BRepCheck_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepCheck_Face *
***********************/
class BRepCheck_Face : public BRepCheck_Result {
	public:
		/****************** BRepCheck_Face ******************/
		%feature("compactdefaultargs") BRepCheck_Face;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") BRepCheck_Face;
		 BRepCheck_Face(const TopoDS_Face & F);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** ClassifyWires ******************/
		%feature("compactdefaultargs") ClassifyWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") ClassifyWires;
		BRepCheck_Status ClassifyWires(const Standard_Boolean Update = Standard_False);

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") GeometricControls;
		void GeometricControls(const Standard_Boolean B);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
ContextShape: TopoDS_Shape

Returns
-------
None
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****************** IntersectWires ******************/
		%feature("compactdefaultargs") IntersectWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") IntersectWires;
		BRepCheck_Status IntersectWires(const Standard_Boolean Update = Standard_False);

		/****************** IsUnorientable ******************/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUnorientable;
		Standard_Boolean IsUnorientable();

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** OrientationOfWires ******************/
		%feature("compactdefaultargs") OrientationOfWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") OrientationOfWires;
		BRepCheck_Status OrientationOfWires(const Standard_Boolean Update = Standard_False);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status of face;.

Parameters
----------
theStatus: BRepCheck_Status

Returns
-------
None
") SetStatus;
		void SetStatus(const BRepCheck_Status theStatus);

		/****************** SetUnorientable ******************/
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetUnorientable;
		void SetUnorientable();

};


%make_alias(BRepCheck_Face)

%extend BRepCheck_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepCheck_Shell *
************************/
class BRepCheck_Shell : public BRepCheck_Result {
	public:
		/****************** BRepCheck_Shell ******************/
		%feature("compactdefaultargs") BRepCheck_Shell;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shell

Returns
-------
None
") BRepCheck_Shell;
		 BRepCheck_Shell(const TopoDS_Shell & S);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Checks if the oriented faces of the shell give a closed shell. if the wire is closed, returns brepcheck_noerror.if <update> is set to standard_true, registers the status in the list.

Parameters
----------
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") Closed;
		BRepCheck_Status Closed(const Standard_Boolean Update = Standard_False);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
ContextShape: TopoDS_Shape

Returns
-------
None
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****************** IsUnorientable ******************/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUnorientable;
		Standard_Boolean IsUnorientable();

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** NbConnectedSet ******************/
		%feature("compactdefaultargs") NbConnectedSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSets: TopTools_ListOfShape

Returns
-------
int
") NbConnectedSet;
		Standard_Integer NbConnectedSet(TopTools_ListOfShape & theSets);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Checks if the oriented faces of the shell are correctly oriented. an internal call is made to the method closed. if <update> is set to standard_true, registers the status in the list.

Parameters
----------
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") Orientation;
		BRepCheck_Status Orientation(const Standard_Boolean Update = Standard_False);

		/****************** SetUnorientable ******************/
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") SetUnorientable;
		void SetUnorientable();

};


%make_alias(BRepCheck_Shell)

%extend BRepCheck_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepCheck_Solid *
************************/
class BRepCheck_Solid : public BRepCheck_Result {
	public:
		/****************** BRepCheck_Solid ******************/
		%feature("compactdefaultargs") BRepCheck_Solid;
		%feature("autodoc", "Constructor <thes> is the solid to check.

Parameters
----------
theS: TopoDS_Solid

Returns
-------
None
") BRepCheck_Solid;
		 BRepCheck_Solid(const TopoDS_Solid & theS);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "See the parent class for more details.

Returns
-------
None
") Blind;
		virtual void Blind();

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "Checks the solid in context of the shape <thecontextshape>.

Parameters
----------
theContextShape: TopoDS_Shape

Returns
-------
None
") InContext;
		virtual void InContext(const TopoDS_Shape & theContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Checks the solid per se. //! the scan area is: 1. shells that overlaps each other status: brepcheck_invalidimbricationofshells //! 2. detached parts of the solid (vertices, edges) that have non-internal orientation status: brepcheck_badorientationofsubshape //! 3. for closed, non-internal shells: 3.1 shells containing entities of the solid that are outside towards the shells status: brepcheck_subshapenotinshape //! 3.2 shells that encloses other shells (for non-holes) status: brepcheck_enclosedregion.

Returns
-------
None
") Minimum;
		virtual void Minimum();

};


%make_alias(BRepCheck_Solid)

%extend BRepCheck_Solid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepCheck_Vertex *
*************************/
class BRepCheck_Vertex : public BRepCheck_Result {
	public:
		/****************** BRepCheck_Vertex ******************/
		%feature("compactdefaultargs") BRepCheck_Vertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
None
") BRepCheck_Vertex;
		 BRepCheck_Vertex(const TopoDS_Vertex & V);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "No available documentation.

Parameters
----------
ContextShape: TopoDS_Shape

Returns
-------
None
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

};


%make_alias(BRepCheck_Vertex)

%extend BRepCheck_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepCheck_Wire *
***********************/
class BRepCheck_Wire : public BRepCheck_Result {
	public:
		/****************** BRepCheck_Wire ******************/
		%feature("compactdefaultargs") BRepCheck_Wire;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire

Returns
-------
None
") BRepCheck_Wire;
		 BRepCheck_Wire(const TopoDS_Wire & W);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Does nothing.

Returns
-------
None
") Blind;
		void Blind();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Checks if the oriented edges of the wire give a closed wire. if the wire is closed, returns brepcheck_noerror. warning : if the first and last edge are infinite, the wire will be considered as a closed one. if <update> is set to standard_true, registers the status in the list. may return (and registers): **brepcheck_notconnected, if wire is not topologically closed **brepcheck_redundantedge, if an edge is in wire more than 3 times or in case of 2 occurences if not with forward and reversed orientation. **brepcheck_noerror.

Parameters
----------
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") Closed;
		BRepCheck_Status Closed(const Standard_Boolean Update = Standard_False);

		/****************** Closed2d ******************/
		%feature("compactdefaultargs") Closed2d;
		%feature("autodoc", "Checks if edges of the wire give a wire closed in 2d space. returns brepcheck_noerror, or brepcheck_notclosed if <update> is set to standard_true, registers the status in the list.

Parameters
----------
F: TopoDS_Face
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") Closed2d;
		BRepCheck_Status Closed2d(const TopoDS_Face & F, const Standard_Boolean Update = Standard_False);

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "Report selfintersect() check would be (is) done.

Returns
-------
bool
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "Set selfintersect() to be checked.

Parameters
----------
B: bool

Returns
-------
None
") GeometricControls;
		void GeometricControls(const Standard_Boolean B);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "If <contextshape> is a face, consequently checks selfintersect(), closed(), orientation() and closed2d until faulty is found.

Parameters
----------
ContextShape: TopoDS_Shape

Returns
-------
None
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Checks that the wire is not empty and 'connex'. called by constructor.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Checks if the oriented edges of the wire are correctly oriented. an internal call is made to the method closed. if no face exists, call the method with a null face (topods_face()). if <update> is set to standard_true, registers the status in the list. may return (and registers): brepcheck_invaliddegeneratedflag, brepcheck_badorientationofsubshape, brepcheck_notclosed, brepcheck_noerror.

Parameters
----------
F: TopoDS_Face
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") Orientation;
		BRepCheck_Status Orientation(const TopoDS_Face & F, const Standard_Boolean Update = Standard_False);

		/****************** SelfIntersect ******************/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "Checks if the wire intersect itself on the face <f>. <e1> and <e2> are the first intersecting edges found. <e2> may be a null edge when a self-intersecting edge is found.if <update> is set to standard_true, registers the status in the list. may return (and register): brepcheck_emptywire, brepcheck_selfintersectingwire, brepcheck_nocurveonsurface, brepcheck_noerror.

Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
Update: bool,optional
	default value is Standard_False

Returns
-------
BRepCheck_Status
") SelfIntersect;
		BRepCheck_Status SelfIntersect(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Boolean Update = Standard_False);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "Sets status of wire;.

Parameters
----------
theStatus: BRepCheck_Status

Returns
-------
None
") SetStatus;
		void SetStatus(const BRepCheck_Status theStatus);

};


%make_alias(BRepCheck_Wire)

%extend BRepCheck_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
