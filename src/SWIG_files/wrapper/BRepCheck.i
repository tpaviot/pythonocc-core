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
from enum import IntEnum
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

class BRepCheck_Status(IntEnum):
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
BRepCheck_NoError = BRepCheck_Status.BRepCheck_NoError
BRepCheck_InvalidPointOnCurve = BRepCheck_Status.BRepCheck_InvalidPointOnCurve
BRepCheck_InvalidPointOnCurveOnSurface = BRepCheck_Status.BRepCheck_InvalidPointOnCurveOnSurface
BRepCheck_InvalidPointOnSurface = BRepCheck_Status.BRepCheck_InvalidPointOnSurface
BRepCheck_No3DCurve = BRepCheck_Status.BRepCheck_No3DCurve
BRepCheck_Multiple3DCurve = BRepCheck_Status.BRepCheck_Multiple3DCurve
BRepCheck_Invalid3DCurve = BRepCheck_Status.BRepCheck_Invalid3DCurve
BRepCheck_NoCurveOnSurface = BRepCheck_Status.BRepCheck_NoCurveOnSurface
BRepCheck_InvalidCurveOnSurface = BRepCheck_Status.BRepCheck_InvalidCurveOnSurface
BRepCheck_InvalidCurveOnClosedSurface = BRepCheck_Status.BRepCheck_InvalidCurveOnClosedSurface
BRepCheck_InvalidSameRangeFlag = BRepCheck_Status.BRepCheck_InvalidSameRangeFlag
BRepCheck_InvalidSameParameterFlag = BRepCheck_Status.BRepCheck_InvalidSameParameterFlag
BRepCheck_InvalidDegeneratedFlag = BRepCheck_Status.BRepCheck_InvalidDegeneratedFlag
BRepCheck_FreeEdge = BRepCheck_Status.BRepCheck_FreeEdge
BRepCheck_InvalidMultiConnexity = BRepCheck_Status.BRepCheck_InvalidMultiConnexity
BRepCheck_InvalidRange = BRepCheck_Status.BRepCheck_InvalidRange
BRepCheck_EmptyWire = BRepCheck_Status.BRepCheck_EmptyWire
BRepCheck_RedundantEdge = BRepCheck_Status.BRepCheck_RedundantEdge
BRepCheck_SelfIntersectingWire = BRepCheck_Status.BRepCheck_SelfIntersectingWire
BRepCheck_NoSurface = BRepCheck_Status.BRepCheck_NoSurface
BRepCheck_InvalidWire = BRepCheck_Status.BRepCheck_InvalidWire
BRepCheck_RedundantWire = BRepCheck_Status.BRepCheck_RedundantWire
BRepCheck_IntersectingWires = BRepCheck_Status.BRepCheck_IntersectingWires
BRepCheck_InvalidImbricationOfWires = BRepCheck_Status.BRepCheck_InvalidImbricationOfWires
BRepCheck_EmptyShell = BRepCheck_Status.BRepCheck_EmptyShell
BRepCheck_RedundantFace = BRepCheck_Status.BRepCheck_RedundantFace
BRepCheck_InvalidImbricationOfShells = BRepCheck_Status.BRepCheck_InvalidImbricationOfShells
BRepCheck_UnorientableShape = BRepCheck_Status.BRepCheck_UnorientableShape
BRepCheck_NotClosed = BRepCheck_Status.BRepCheck_NotClosed
BRepCheck_NotConnected = BRepCheck_Status.BRepCheck_NotConnected
BRepCheck_SubshapeNotInShape = BRepCheck_Status.BRepCheck_SubshapeNotInShape
BRepCheck_BadOrientation = BRepCheck_Status.BRepCheck_BadOrientation
BRepCheck_BadOrientationOfSubshape = BRepCheck_Status.BRepCheck_BadOrientationOfSubshape
BRepCheck_InvalidPolygonOnTriangulation = BRepCheck_Status.BRepCheck_InvalidPolygonOnTriangulation
BRepCheck_InvalidToleranceValue = BRepCheck_Status.BRepCheck_InvalidToleranceValue
BRepCheck_EnclosedRegion = BRepCheck_Status.BRepCheck_EnclosedRegion
BRepCheck_CheckFail = BRepCheck_Status.BRepCheck_CheckFail
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

%extend NCollection_List<BRepCheck_Status> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: bedfa5bf84f03f430e2a976318bd4d44 ****/
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
		/**** md5 signature: ca69acd06fec0c99014d9a2e8efe98cf ****/
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
		/**** md5 signature: 1ee0cf2b6eac4a6cd14cb86720323439 ****/
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
		/**** md5 signature: bb04b20d19bd60ec83e4525199c06c3b ****/
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
		/**** md5 signature: 1ea01ba3f32c876f168d8f18b7120753 ****/
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
		/**** md5 signature: 5196c4939ad07fcdde4186169aa9d21c ****/
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
		/**** md5 signature: 067e002b3bd9e0362264cfada4f4eeac ****/
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
		/**** md5 signature: 2809e700423e4fe6ecd395953f3a2406 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns true if no defect is detected on the shape s or any of its subshapes. returns true if the shape s is valid. this function checks whether a given shape is valid by checking that: - the topology is correct - parameterization of edges in particular is correct. for the topology to be correct, the following conditions must be satisfied: - edges should have at least two vertices if they are not degenerate edges. the vertices should be within the range of the bounding edges at the tolerance specified in the vertex, - edges should share at least one face. the representation of the edges should be within the tolerance criterion assigned to them. - wires defining a face should not self-intersect and should be closed, - there should be one wire which contains all other wires inside a face, - wires should be correctly oriented with respect to each of the edges, - faces should be correctly oriented, in particular with respect to adjacent faces if these faces define a solid, - shells defining a solid should be closed. there should be one enclosing shell if the shape is a solid; to check parameterization of edge, there are 2 approaches depending on the edge?s contextual situation. - if the edge is either single, or it is in the context of a wire or a compound, its parameterization is defined by the parameterization of its 3d curve and is considered as valid. - if the edge is in the context of a face, it should have sameparameter and samerange flags set to standard_true. to check these flags, you should call the function brep_tool::sameparameter and brep_tool::samerange for an edge. if at least one of these flags is set to standard_false, the edge is considered as invalid without any additional check. if the edge is contained by a face, and it has sameparameter and samerange flags set to standard_true, isvalid checks whether representation of the edge on face, in context of which the edge is considered, has the same parameterization up to the tolerance value coded on the edge. for a given parameter t on the edge having c as a 3d curve and one pcurve p on a surface s (base surface of the reference face), this checks that |c(t) - s(p(t))| is less than or equal to tolerance, where tolerance is the tolerance value coded on the edge.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Result ******************/
		/**** md5 signature: 7fd5f89db753d52aa955dc54a91f1dca ****/
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
		/**** md5 signature: a1ab049e14b32de120dd2ea19807b88d ****/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		virtual void Blind();

		/****************** ContextualShape ******************/
		/**** md5 signature: a584ebc1dedd342131b091fe5e1e437d ****/
		%feature("compactdefaultargs") ContextualShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ContextualShape;
		const TopoDS_Shape ContextualShape();

		/****************** InContext ******************/
		/**** md5 signature: 0fa7f35fe7112fd6ac32ee69a7cd8f93 ****/
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
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
		/**** md5 signature: 055b8946b118029a0bda6f11c38e1af0 ****/
		%feature("compactdefaultargs") InitContextIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitContextIterator;
		void InitContextIterator();

		/****************** IsBlind ******************/
		/**** md5 signature: ff5e40e27b44b4cdc0af878d02e09a0e ****/
		%feature("compactdefaultargs") IsBlind;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsBlind;
		Standard_Boolean IsBlind();

		/****************** IsMinimum ******************/
		/**** md5 signature: 6488fc4883a388bc6a5f73438abeaae1 ****/
		%feature("compactdefaultargs") IsMinimum;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsMinimum;
		Standard_Boolean IsMinimum();

		/****************** Minimum ******************/
		/**** md5 signature: 567db75783723918a8acfdd7121b3ae4 ****/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		virtual void Minimum();

		/****************** MoreShapeInContext ******************/
		/**** md5 signature: abe30661c8b45664c5aa94279afd2fd5 ****/
		%feature("compactdefaultargs") MoreShapeInContext;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreShapeInContext;
		Standard_Boolean MoreShapeInContext();

		/****************** NextShapeInContext ******************/
		/**** md5 signature: 279884531473bc64fc375fb134c53593 ****/
		%feature("compactdefaultargs") NextShapeInContext;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextShapeInContext;
		void NextShapeInContext();

		/****************** SetFailStatus ******************/
		/**** md5 signature: 258e6542a6a15f2fae38c3b9476b7210 ****/
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
		/**** md5 signature: 2b35975a0de3dfdf852d1653c75a7cab ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
BRepCheck_ListOfStatus
") Status;
		const BRepCheck_ListOfStatus & Status();

		/****************** StatusOnShape ******************/
		/**** md5 signature: ea055126ff7476811793b92dafd7757d ****/
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
		/**** md5 signature: b9a7334597b91c919b966f5d1e8d799f ****/
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
		/**** md5 signature: ca66a001fe402a1661316ddbfbe09937 ****/
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
		/**** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ****/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** CheckPolygonOnTriangulation ******************/
		/**** md5 signature: 4d8b4b0088c17108fc572dd80979b176 ****/
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
		/**** md5 signature: 37d96a49d68a7118896a14ac30457fb2 ****/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****************** GeometricControls ******************/
		/**** md5 signature: 16194f16c24aad512d5519bba6fbad11 ****/
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
		/**** md5 signature: 068e04b29819e902bf375d055c106b65 ****/
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
		/**** md5 signature: bcca4bce745250eb4a0cbc554641b42d ****/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** SetStatus ******************/
		/**** md5 signature: 86ab384d3d45dec24b5a7e095ad3e061 ****/
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
		/**** md5 signature: 014b06346af255e506514edbf19cdb2c ****/
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
		/**** md5 signature: ffaa5efe498f128a0f1112b1a5efeb0e ****/
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
		/**** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ****/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** ClassifyWires ******************/
		/**** md5 signature: bb809bae2576b6926cd5d7fae290be65 ****/
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
		/**** md5 signature: 37d96a49d68a7118896a14ac30457fb2 ****/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****************** GeometricControls ******************/
		/**** md5 signature: 16194f16c24aad512d5519bba6fbad11 ****/
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
		/**** md5 signature: 068e04b29819e902bf375d055c106b65 ****/
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
		/**** md5 signature: c3735730ccec0181832410a49f869f1f ****/
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
		/**** md5 signature: 17483e961c63ce65c4e2be8f16bc72a0 ****/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUnorientable;
		Standard_Boolean IsUnorientable();

		/****************** Minimum ******************/
		/**** md5 signature: bcca4bce745250eb4a0cbc554641b42d ****/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** OrientationOfWires ******************/
		/**** md5 signature: 3d0ccc0a3319e206c424d8d492226c82 ****/
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
		/**** md5 signature: 86ab384d3d45dec24b5a7e095ad3e061 ****/
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
		/**** md5 signature: 2f269456d5f1ea5e8b2cc3a49e5ea74f ****/
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
		/**** md5 signature: 309826e2b109bc8c22ada37375badcaf ****/
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
		/**** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ****/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** Closed ******************/
		/**** md5 signature: 13c91693b79f0b3874479828b766a2ec ****/
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
		/**** md5 signature: 068e04b29819e902bf375d055c106b65 ****/
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
		/**** md5 signature: 17483e961c63ce65c4e2be8f16bc72a0 ****/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUnorientable;
		Standard_Boolean IsUnorientable();

		/****************** Minimum ******************/
		/**** md5 signature: bcca4bce745250eb4a0cbc554641b42d ****/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** NbConnectedSet ******************/
		/**** md5 signature: 486bb36e33ee94a7ee60e1326cdd8de4 ****/
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
		/**** md5 signature: 3ac937d67db0dcd6512a5c13770310c9 ****/
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
		/**** md5 signature: 2f269456d5f1ea5e8b2cc3a49e5ea74f ****/
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
		/**** md5 signature: 8777687e7fe8f001f2eafb6fa25c0a3a ****/
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
		/**** md5 signature: d3654c48391487543928e984233515d4 ****/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "See the parent class for more details.

Returns
-------
None
") Blind;
		virtual void Blind();

		/****************** InContext ******************/
		/**** md5 signature: fc3ba1a648e2a8cd0fb0e179a74b9ebb ****/
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
		/**** md5 signature: 6432f12790acf2012f66746d67657613 ****/
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
		/**** md5 signature: 68efde7ae373863d3e1be49e11e82d88 ****/
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
		/**** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ****/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Blind;
		void Blind();

		/****************** InContext ******************/
		/**** md5 signature: 068e04b29819e902bf375d055c106b65 ****/
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
		/**** md5 signature: bcca4bce745250eb4a0cbc554641b42d ****/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** Tolerance ******************/
		/**** md5 signature: 014b06346af255e506514edbf19cdb2c ****/
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
		/**** md5 signature: ab6c2dd585c88fb5fb0be4ceaf53f81e ****/
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
		/**** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ****/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Does nothing.

Returns
-------
None
") Blind;
		void Blind();

		/****************** Closed ******************/
		/**** md5 signature: 13c91693b79f0b3874479828b766a2ec ****/
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
		/**** md5 signature: ec5831e967eb070b5c82ca8964b55fe8 ****/
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
		/**** md5 signature: 37d96a49d68a7118896a14ac30457fb2 ****/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "Report selfintersect() check would be (is) done.

Returns
-------
bool
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****************** GeometricControls ******************/
		/**** md5 signature: 16194f16c24aad512d5519bba6fbad11 ****/
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
		/**** md5 signature: 068e04b29819e902bf375d055c106b65 ****/
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
		/**** md5 signature: bcca4bce745250eb4a0cbc554641b42d ****/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Checks that the wire is not empty and 'connex'. called by constructor.

Returns
-------
None
") Minimum;
		void Minimum();

		/****************** Orientation ******************/
		/**** md5 signature: f1973ba2c13b16645155497d42e54b08 ****/
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
		/**** md5 signature: f62c98c78906534e424d1494ff924720 ****/
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
		/**** md5 signature: 86ab384d3d45dec24b5a7e095ad3e061 ****/
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
