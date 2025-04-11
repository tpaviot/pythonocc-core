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
%define BREPCHECKDOCSTRING
"BRepCheck module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepcheck.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%template(BRepCheck_IndexedDataMapOfShapeResult) NCollection_IndexedDataMap<TopoDS_Shape,opencascade::handle<BRepCheck_Result>>;
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
typedef NCollection_DataMap<TopoDS_Shape, Handle ( NCollection_Shared<BRepCheck_ListOfStatus>), TopTools_ShapeMapHasher>::Iterator BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
typedef NCollection_DataMap<TopoDS_Shape, Handle ( NCollection_Shared<BRepCheck_ListOfStatus>), TopTools_ShapeMapHasher> BRepCheck_DataMapOfShapeListOfStatus;
typedef NCollection_Shared<BRepCheck_ListOfStatus> BRepCheck_HListOfStatus;
typedef NCollection_IndexedDataMap<TopoDS_Shape, opencascade::handle<BRepCheck_Result>> BRepCheck_IndexedDataMapOfShapeResult;
typedef NCollection_List<BRepCheck_Status>::Iterator BRepCheck_ListIteratorOfListOfStatus;
typedef NCollection_List<BRepCheck_Status> BRepCheck_ListOfStatus;
/* end typedefs declaration */

/******************
* class BRepCheck *
******************/
%rename(brepcheck) BRepCheck;
class BRepCheck {
	public:
		/****** BRepCheck::Add ******/
		/****** md5 signature: bedfa5bf84f03f430e2a976318bd4d44 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
List: BRepCheck_ListOfStatus
Stat: BRepCheck_Status

Return
-------
None

Description
-----------
No available documentation.
") Add;
		static void Add(BRepCheck_ListOfStatus & List, const BRepCheck_Status Stat);

		/****** BRepCheck::PrecCurve ******/
		/****** md5 signature: ca69acd06fec0c99014d9a2e8efe98cf ******/
		%feature("compactdefaultargs") PrecCurve;
		%feature("autodoc", "
Parameters
----------
aAC3D: Adaptor3d_Curve

Return
-------
float

Description
-----------
Returns the resolution on the 3d curve.
") PrecCurve;
		static Standard_Real PrecCurve(const Adaptor3d_Curve & aAC3D);

		/****** BRepCheck::PrecSurface ******/
		/****** md5 signature: 6f4c623dddf91472dbeeff8461bbbbf9 ******/
		%feature("compactdefaultargs") PrecSurface;
		%feature("autodoc", "
Parameters
----------
aAHSurf: Adaptor3d_Surface

Return
-------
float

Description
-----------
Returns the resolution on the surface.
") PrecSurface;
		static Standard_Real PrecSurface(const opencascade::handle<Adaptor3d_Surface> & aAHSurf);

		/****** BRepCheck::Print ******/
		/****** md5 signature: 0f4f5589255e0cda18fd387e5d4e5b49 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
Stat: BRepCheck_Status

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Print;
		static void Print(const BRepCheck_Status Stat, std::ostream &OutValue);

		/****** BRepCheck::SelfIntersection ******/
		/****** md5 signature: bb04b20d19bd60ec83e4525199c06c3b ******/
		%feature("compactdefaultargs") SelfIntersection;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge

Return
-------
bool

Description
-----------
No available documentation.
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
		/****** BRepCheck_Analyzer::BRepCheck_Analyzer ******/
		/****** md5 signature: c4951524e7a1ce44dddda94aa6e9d260 ******/
		%feature("compactdefaultargs") BRepCheck_Analyzer;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
GeomControls: bool (optional, default to Standard_True)
theIsParallel: bool (optional, default to Standard_False)
theIsExact: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a shape validation object defined by the shape S. <S> is the shape to control. <GeomControls> If False only topological informaions are checked. The geometricals controls are For a Vertex: BRepCheck_InvalidToleranceValue NYI For an Edge: BRepCheck_InvalidCurveOnClosedSurface, BRepCheck_InvalidCurveOnSurface, BRepCheck_InvalidSameParameterFlag, BRepCheck_InvalidToleranceValue NYI For a face: BRepCheck_UnorientableShape, BRepCheck_IntersectingWires, BRepCheck_InvalidToleranceValue NYI For a wire: BRepCheck_SelfIntersectingWire.
") BRepCheck_Analyzer;
		 BRepCheck_Analyzer(const TopoDS_Shape & S, const Standard_Boolean GeomControls = Standard_True, const Standard_Boolean theIsParallel = Standard_False, const Standard_Boolean theIsExact = Standard_False);

		/****** BRepCheck_Analyzer::Init ******/
		/****** md5 signature: 5196c4939ad07fcdde4186169aa9d21c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
GeomControls: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
<S> is the shape to control. <GeomControls> If False only topological informaions are checked. The geometricals controls are For a Vertex: BRepCheck_InvalidTolerance NYI For an Edge: BRepCheck_InvalidCurveOnClosedSurface, BRepCheck_InvalidCurveOnSurface, BRepCheck_InvalidSameParameterFlag, BRepCheck_InvalidTolerance NYI For a face: BRepCheck_UnorientableShape, BRepCheck_IntersectingWires, BRepCheck_InvalidTolerance NYI For a wire: BRepCheck_SelfIntersectingWire.
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Boolean GeomControls = Standard_True);

		/****** BRepCheck_Analyzer::IsExactMethod ******/
		/****** md5 signature: 5e4b019881aa7aa6b5765966d6b467ca ******/
		%feature("compactdefaultargs") IsExactMethod;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if exact method selected.
") IsExactMethod;
		Standard_Boolean IsExactMethod();

		/****** BRepCheck_Analyzer::IsParallel ******/
		/****** md5 signature: fc1de18a583c6aa3b3d9897c80aa553e ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if parallel flag is set.
") IsParallel;
		Standard_Boolean IsParallel();

		/****** BRepCheck_Analyzer::IsValid ******/
		/****** md5 signature: 067e002b3bd9e0362264cfada4f4eeac ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
<S> is a subshape of the original shape. Returns <STandard_True> if no default has been detected on <S> and any of its subshape.
") IsValid;
		Standard_Boolean IsValid(const TopoDS_Shape & S);

		/****** BRepCheck_Analyzer::IsValid ******/
		/****** md5 signature: 7d115ff85bb657b98ab8790006673845 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if no defect is detected on the shape S or any of its subshapes. Returns true if the shape S is valid. This function checks whether a given shape is valid by checking that: - the topology is correct - parameterization of edges in particular is correct. For the topology to be correct, the following conditions must be satisfied: - edges should have at least two vertices if they are not degenerate edges. The vertices should be within the range of the bounding edges at the tolerance specified in the vertex, - edges should share at least one face. The representation of the edges should be within the tolerance criterion assigned to them. - wires defining a face should not self-intersect and should be closed, - there should be one wire which contains all other wires inside a face, - wires should be correctly oriented with respect to each of the edges, - faces should be correctly oriented, in particular with respect to adjacent faces if these faces define a solid, - shells defining a solid should be closed. There should be one enclosing shell if the shape is a solid; To check parameterization of edge, there are 2 approaches depending on the edge?s contextual situation. - if the edge is either single, or it is in the context of a wire or a compound, its parameterization is defined by the parameterization of its 3D curve and is considered as valid. - If the edge is in the context of a face, it should have SameParameter and SameRange flags set to Standard_True. To check these flags, you should call the function BRep_Tool::SameParameter and BRep_Tool::SameRange for an edge. If at least one of these flags is set to Standard_False, the edge is considered as invalid without any additional check. If the edge is contained by a face, and it has SameParameter and SameRange flags set to Standard_True, IsValid checks whether representation of the edge on face, in context of which the edge is considered, has the same parameterization up to the tolerance value coded on the edge. For a given parameter t on the edge having C as a 3D curve and one PCurve P on a surface S (base surface of the reference face), this checks that |C(t) - S(P(t))| is less than or equal to tolerance, where tolerance is the tolerance value coded on the edge.
") IsValid;
		Standard_Boolean IsValid();

		/****** BRepCheck_Analyzer::Result ******/
		/****** md5 signature: 4d39ddda3bce0424b01a6b2fbba14ad2 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "
Parameters
----------
theSubS: TopoDS_Shape

Return
-------
opencascade::handle<BRepCheck_Result>

Description
-----------
No available documentation.
") Result;
		const opencascade::handle<BRepCheck_Result> & Result(const TopoDS_Shape & theSubS);

		/****** BRepCheck_Analyzer::SetExactMethod ******/
		/****** md5 signature: 7e9fb7a39514337474c163d15b041f18 ******/
		%feature("compactdefaultargs") SetExactMethod;
		%feature("autodoc", "
Parameters
----------
theIsExact: bool

Return
-------
None

Description
-----------
Sets method to calculate distance: Calculating in finite number of points (if theIsExact is false, faster, but possible not correct result) or exact calculating by using BRepLib_CheckCurveOnSurface class (if theIsExact is true, slowly, but more correctly). Exact method is used only when edge is SameParameter. Default method is calculating in finite number of points.
") SetExactMethod;
		void SetExactMethod(const Standard_Boolean theIsExact);

		/****** BRepCheck_Analyzer::SetParallel ******/
		/****** md5 signature: 91c6328a8c6135d4f1f1da7db8aee28f ******/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "
Parameters
----------
theIsParallel: bool

Return
-------
None

Description
-----------
Sets parallel flag.
") SetParallel;
		void SetParallel(const Standard_Boolean theIsParallel);

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
		/****** BRepCheck_Result::Blind ******/
		/****** md5 signature: a1ab049e14b32de120dd2ea19807b88d ******/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Blind;
		virtual void Blind();

		/****** BRepCheck_Result::ContextualShape ******/
		/****** md5 signature: eb8bd6cde885ea4f72b149425281ff43 ******/
		%feature("compactdefaultargs") ContextualShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ContextualShape;
		const TopoDS_Shape ContextualShape();

		/****** BRepCheck_Result::InContext ******/
		/****** md5 signature: 0fa7f35fe7112fd6ac32ee69a7cd8f93 ******/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "
Parameters
----------
ContextShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InContext;
		virtual void InContext(const TopoDS_Shape & ContextShape);

		/****** BRepCheck_Result::Init ******/
		/****** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** BRepCheck_Result::InitContextIterator ******/
		/****** md5 signature: 055b8946b118029a0bda6f11c38e1af0 ******/
		%feature("compactdefaultargs") InitContextIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitContextIterator;
		void InitContextIterator();

		/****** BRepCheck_Result::IsBlind ******/
		/****** md5 signature: 7bdfbaa9abb88d00524ebffdd69f140b ******/
		%feature("compactdefaultargs") IsBlind;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsBlind;
		Standard_Boolean IsBlind();

		/****** BRepCheck_Result::IsMinimum ******/
		/****** md5 signature: a6bf8651a71b5ace0b26012ddb26bfd5 ******/
		%feature("compactdefaultargs") IsMinimum;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsMinimum;
		Standard_Boolean IsMinimum();

		/****** BRepCheck_Result::IsStatusOnShape ******/
		/****** md5 signature: 7a9b88e66fff4774274cebabd6b916eb ******/
		%feature("compactdefaultargs") IsStatusOnShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") IsStatusOnShape;
		Standard_Boolean IsStatusOnShape(const TopoDS_Shape & theShape);

		/****** BRepCheck_Result::Minimum ******/
		/****** md5 signature: 567db75783723918a8acfdd7121b3ae4 ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Minimum;
		virtual void Minimum();

		/****** BRepCheck_Result::MoreShapeInContext ******/
		/****** md5 signature: aaff979dbb1ba3d73332a5aa219d6b33 ******/
		%feature("compactdefaultargs") MoreShapeInContext;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShapeInContext;
		Standard_Boolean MoreShapeInContext();

		/****** BRepCheck_Result::NextShapeInContext ******/
		/****** md5 signature: 279884531473bc64fc375fb134c53593 ******/
		%feature("compactdefaultargs") NextShapeInContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextShapeInContext;
		void NextShapeInContext();

		/****** BRepCheck_Result::SetFailStatus ******/
		/****** md5 signature: 258e6542a6a15f2fae38c3b9476b7210 ******/
		%feature("compactdefaultargs") SetFailStatus;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetFailStatus;
		void SetFailStatus(const TopoDS_Shape & S);

		/****** BRepCheck_Result::SetParallel ******/
		/****** md5 signature: 75181e0ac6329b778751501d9f3f15d9 ******/
		%feature("compactdefaultargs") SetParallel;
		%feature("autodoc", "
Parameters
----------
theIsParallel: bool

Return
-------
None

Description
-----------
No available documentation.
") SetParallel;
		void SetParallel(Standard_Boolean theIsParallel);

		/****** BRepCheck_Result::Status ******/
		/****** md5 signature: 64167c852e0650aecc4792387cb6ad32 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
BRepCheck_ListOfStatus

Description
-----------
No available documentation.
") Status;
		const BRepCheck_ListOfStatus & Status();

		/****** BRepCheck_Result::StatusOnShape ******/
		/****** md5 signature: 9d703d3594f470498bdec69da88c13b2 ******/
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", "Return
-------
BRepCheck_ListOfStatus

Description
-----------
No available documentation.
") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape();

		/****** BRepCheck_Result::StatusOnShape ******/
		/****** md5 signature: c188dfc8bfd0a5dda5145143d5c9b549 ******/
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
BRepCheck_ListOfStatus

Description
-----------
No available documentation.
") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape(const TopoDS_Shape & theShape);

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
		/****** BRepCheck_Edge::BRepCheck_Edge ******/
		/****** md5 signature: ca66a001fe402a1661316ddbfbe09937 ******/
		%feature("compactdefaultargs") BRepCheck_Edge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") BRepCheck_Edge;
		 BRepCheck_Edge(const TopoDS_Edge & E);

		/****** BRepCheck_Edge::Blind ******/
		/****** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ******/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Blind;
		void Blind();

		/****** BRepCheck_Edge::CheckPolygonOnTriangulation ******/
		/****** md5 signature: 4d8b4b0088c17108fc572dd80979b176 ******/
		%feature("compactdefaultargs") CheckPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
BRepCheck_Status

Description
-----------
Checks, if polygon on triangulation of heEdge is out of 3D-curve of this edge.
") CheckPolygonOnTriangulation;
		BRepCheck_Status CheckPolygonOnTriangulation(const TopoDS_Edge & theEdge);

		/****** BRepCheck_Edge::GeometricControls ******/
		/****** md5 signature: 37d96a49d68a7118896a14ac30457fb2 ******/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****** BRepCheck_Edge::GeometricControls ******/
		/****** md5 signature: 16194f16c24aad512d5519bba6fbad11 ******/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") GeometricControls;
		void GeometricControls(const Standard_Boolean B);

		/****** BRepCheck_Edge::InContext ******/
		/****** md5 signature: 068e04b29819e902bf375d055c106b65 ******/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "
Parameters
----------
ContextShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****** BRepCheck_Edge::IsExactMethod ******/
		/****** md5 signature: 5e4b019881aa7aa6b5765966d6b467ca ******/
		%feature("compactdefaultargs") IsExactMethod;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if exact method selected.
") IsExactMethod;
		Standard_Boolean IsExactMethod();

		/****** BRepCheck_Edge::Minimum ******/
		/****** md5 signature: bcca4bce745250eb4a0cbc554641b42d ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Minimum;
		void Minimum();

		/****** BRepCheck_Edge::SetExactMethod ******/
		/****** md5 signature: 61e71faebec158e548494f19380d6da6 ******/
		%feature("compactdefaultargs") SetExactMethod;
		%feature("autodoc", "
Parameters
----------
theIsExact: bool

Return
-------
None

Description
-----------
Sets method to calculate distance: Calculating in finite number of points (if theIsExact is false, faster, but possible not correct result) or exact calculating by using BRepLib_CheckCurveOnSurface class (if theIsExact is true, slowly, but more correctly). Exact method is used only when edge is SameParameter. Default method is calculating in finite number of points.
") SetExactMethod;
		void SetExactMethod(Standard_Boolean theIsExact);

		/****** BRepCheck_Edge::SetStatus ******/
		/****** md5 signature: 86ab384d3d45dec24b5a7e095ad3e061 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
theStatus: BRepCheck_Status

Return
-------
None

Description
-----------
Sets status of Edge;.
") SetStatus;
		void SetStatus(const BRepCheck_Status theStatus);

		/****** BRepCheck_Edge::Tolerance ******/
		/****** md5 signature: 014b06346af255e506514edbf19cdb2c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/****** BRepCheck_Face::BRepCheck_Face ******/
		/****** md5 signature: ffaa5efe498f128a0f1112b1a5efeb0e ******/
		%feature("compactdefaultargs") BRepCheck_Face;
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
") BRepCheck_Face;
		 BRepCheck_Face(const TopoDS_Face & F);

		/****** BRepCheck_Face::Blind ******/
		/****** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ******/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Blind;
		void Blind();

		/****** BRepCheck_Face::ClassifyWires ******/
		/****** md5 signature: bb809bae2576b6926cd5d7fae290be65 ******/
		%feature("compactdefaultargs") ClassifyWires;
		%feature("autodoc", "
Parameters
----------
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
No available documentation.
") ClassifyWires;
		BRepCheck_Status ClassifyWires(const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Face::GeometricControls ******/
		/****** md5 signature: 37d96a49d68a7118896a14ac30457fb2 ******/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****** BRepCheck_Face::GeometricControls ******/
		/****** md5 signature: 16194f16c24aad512d5519bba6fbad11 ******/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") GeometricControls;
		void GeometricControls(const Standard_Boolean B);

		/****** BRepCheck_Face::InContext ******/
		/****** md5 signature: 068e04b29819e902bf375d055c106b65 ******/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "
Parameters
----------
ContextShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****** BRepCheck_Face::IntersectWires ******/
		/****** md5 signature: c3735730ccec0181832410a49f869f1f ******/
		%feature("compactdefaultargs") IntersectWires;
		%feature("autodoc", "
Parameters
----------
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
No available documentation.
") IntersectWires;
		BRepCheck_Status IntersectWires(const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Face::IsUnorientable ******/
		/****** md5 signature: 17483e961c63ce65c4e2be8f16bc72a0 ******/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUnorientable;
		Standard_Boolean IsUnorientable();

		/****** BRepCheck_Face::Minimum ******/
		/****** md5 signature: bcca4bce745250eb4a0cbc554641b42d ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Minimum;
		void Minimum();

		/****** BRepCheck_Face::OrientationOfWires ******/
		/****** md5 signature: 3d0ccc0a3319e206c424d8d492226c82 ******/
		%feature("compactdefaultargs") OrientationOfWires;
		%feature("autodoc", "
Parameters
----------
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
No available documentation.
") OrientationOfWires;
		BRepCheck_Status OrientationOfWires(const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Face::SetStatus ******/
		/****** md5 signature: 86ab384d3d45dec24b5a7e095ad3e061 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
theStatus: BRepCheck_Status

Return
-------
None

Description
-----------
Sets status of Face;.
") SetStatus;
		void SetStatus(const BRepCheck_Status theStatus);

		/****** BRepCheck_Face::SetUnorientable ******/
		/****** md5 signature: 2f269456d5f1ea5e8b2cc3a49e5ea74f ******/
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRepCheck_Shell::BRepCheck_Shell ******/
		/****** md5 signature: 309826e2b109bc8c22ada37375badcaf ******/
		%feature("compactdefaultargs") BRepCheck_Shell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shell

Return
-------
None

Description
-----------
No available documentation.
") BRepCheck_Shell;
		 BRepCheck_Shell(const TopoDS_Shell & S);

		/****** BRepCheck_Shell::Blind ******/
		/****** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ******/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Blind;
		void Blind();

		/****** BRepCheck_Shell::Closed ******/
		/****** md5 signature: 13c91693b79f0b3874479828b766a2ec ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
Checks if the oriented faces of the shell give a closed shell. If the wire is closed, returns BRepCheck_NoError.If <Update> is set to Standard_True, registers the status in the list.
") Closed;
		BRepCheck_Status Closed(const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Shell::InContext ******/
		/****** md5 signature: 068e04b29819e902bf375d055c106b65 ******/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "
Parameters
----------
ContextShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****** BRepCheck_Shell::IsUnorientable ******/
		/****** md5 signature: 17483e961c63ce65c4e2be8f16bc72a0 ******/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUnorientable;
		Standard_Boolean IsUnorientable();

		/****** BRepCheck_Shell::Minimum ******/
		/****** md5 signature: bcca4bce745250eb4a0cbc554641b42d ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Minimum;
		void Minimum();

		/****** BRepCheck_Shell::NbConnectedSet ******/
		/****** md5 signature: 486bb36e33ee94a7ee60e1326cdd8de4 ******/
		%feature("compactdefaultargs") NbConnectedSet;
		%feature("autodoc", "
Parameters
----------
theSets: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") NbConnectedSet;
		Standard_Integer NbConnectedSet(TopTools_ListOfShape & theSets);

		/****** BRepCheck_Shell::Orientation ******/
		/****** md5 signature: 3ac937d67db0dcd6512a5c13770310c9 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
Checks if the oriented faces of the shell are correctly oriented. An internal call is made to the method Closed. If <Update> is set to Standard_True, registers the status in the list.
") Orientation;
		BRepCheck_Status Orientation(const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Shell::SetUnorientable ******/
		/****** md5 signature: 2f269456d5f1ea5e8b2cc3a49e5ea74f ******/
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRepCheck_Solid::BRepCheck_Solid ******/
		/****** md5 signature: 8777687e7fe8f001f2eafb6fa25c0a3a ******/
		%feature("compactdefaultargs") BRepCheck_Solid;
		%feature("autodoc", "
Parameters
----------
theS: TopoDS_Solid

Return
-------
None

Description
-----------
Constructor <theS> is the solid to check.
") BRepCheck_Solid;
		 BRepCheck_Solid(const TopoDS_Solid & theS);

		/****** BRepCheck_Solid::Blind ******/
		/****** md5 signature: d3654c48391487543928e984233515d4 ******/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Return
-------
None

Description
-----------
see the parent class for more details.
") Blind;
		virtual void Blind();

		/****** BRepCheck_Solid::InContext ******/
		/****** md5 signature: fc3ba1a648e2a8cd0fb0e179a74b9ebb ******/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "
Parameters
----------
theContextShape: TopoDS_Shape

Return
-------
None

Description
-----------
Checks the solid in context of the shape <theContextShape>.
") InContext;
		virtual void InContext(const TopoDS_Shape & theContextShape);

		/****** BRepCheck_Solid::Minimum ******/
		/****** md5 signature: 6432f12790acf2012f66746d67657613 ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
None

Description
-----------
Checks the solid per se. //! The scan area is: 1. Shells that overlaps each other Status: BRepCheck_InvalidImbricationOfShells //! 2. Detached parts of the solid (vertices, edges) that have non-internal orientation Status: BRepCheck_BadOrientationOfSubshape //! 3. For closed, non-internal shells: 3.1 Shells containing entities of the solid that are outside towards the shells Status: BRepCheck_SubshapeNotInShape //! 3.2 Shells that encloses other Shells (for non-holes) Status: BRepCheck_EnclosedRegion.
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
		/****** BRepCheck_Vertex::BRepCheck_Vertex ******/
		/****** md5 signature: 68efde7ae373863d3e1be49e11e82d88 ******/
		%feature("compactdefaultargs") BRepCheck_Vertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BRepCheck_Vertex;
		 BRepCheck_Vertex(const TopoDS_Vertex & V);

		/****** BRepCheck_Vertex::Blind ******/
		/****** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ******/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Blind;
		void Blind();

		/****** BRepCheck_Vertex::InContext ******/
		/****** md5 signature: 068e04b29819e902bf375d055c106b65 ******/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "
Parameters
----------
ContextShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****** BRepCheck_Vertex::Minimum ******/
		/****** md5 signature: bcca4bce745250eb4a0cbc554641b42d ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Minimum;
		void Minimum();

		/****** BRepCheck_Vertex::Tolerance ******/
		/****** md5 signature: 014b06346af255e506514edbf19cdb2c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/****** BRepCheck_Wire::BRepCheck_Wire ******/
		/****** md5 signature: ab6c2dd585c88fb5fb0be4ceaf53f81e ******/
		%feature("compactdefaultargs") BRepCheck_Wire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire

Return
-------
None

Description
-----------
No available documentation.
") BRepCheck_Wire;
		 BRepCheck_Wire(const TopoDS_Wire & W);

		/****** BRepCheck_Wire::Blind ******/
		/****** md5 signature: 05cb8700c802bda95aa5d71d47a1c542 ******/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "Return
-------
None

Description
-----------
Does nothing.
") Blind;
		void Blind();

		/****** BRepCheck_Wire::Closed ******/
		/****** md5 signature: 13c91693b79f0b3874479828b766a2ec ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
Checks if the oriented edges of the wire give a closed wire. If the wire is closed, returns BRepCheck_NoError. Warning: if the first and last edge are infinite, the wire will be considered as a closed one. If <Update> is set to Standard_True, registers the status in the list. May return (and registers): **BRepCheck_NotConnected, if wire is not topologically closed **BRepCheck_RedundantEdge, if an edge is in wire more than 3 times or in case of 2 occurrences if not with FORWARD and REVERSED orientation. **BRepCheck_NoError.
") Closed;
		BRepCheck_Status Closed(const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Wire::Closed2d ******/
		/****** md5 signature: ec5831e967eb070b5c82ca8964b55fe8 ******/
		%feature("compactdefaultargs") Closed2d;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
Checks if edges of the wire give a wire closed in 2d space. Returns BRepCheck_NoError, or BRepCheck_NotClosed If <Update> is set to Standard_True, registers the status in the list.
") Closed2d;
		BRepCheck_Status Closed2d(const TopoDS_Face & F, const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Wire::GeometricControls ******/
		/****** md5 signature: 37d96a49d68a7118896a14ac30457fb2 ******/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "Return
-------
bool

Description
-----------
report SelfIntersect() check would be (is) done.
") GeometricControls;
		Standard_Boolean GeometricControls();

		/****** BRepCheck_Wire::GeometricControls ******/
		/****** md5 signature: 16194f16c24aad512d5519bba6fbad11 ******/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
set SelfIntersect() to be checked.
") GeometricControls;
		void GeometricControls(const Standard_Boolean B);

		/****** BRepCheck_Wire::InContext ******/
		/****** md5 signature: 068e04b29819e902bf375d055c106b65 ******/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "
Parameters
----------
ContextShape: TopoDS_Shape

Return
-------
None

Description
-----------
if <ContextShape> is a face, consequently checks SelfIntersect(), Closed(), Orientation() and Closed2d until faulty is found.
") InContext;
		void InContext(const TopoDS_Shape & ContextShape);

		/****** BRepCheck_Wire::Minimum ******/
		/****** md5 signature: bcca4bce745250eb4a0cbc554641b42d ******/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Return
-------
None

Description
-----------
checks that the wire is not empty and 'connex'. Called by constructor.
") Minimum;
		void Minimum();

		/****** BRepCheck_Wire::Orientation ******/
		/****** md5 signature: f1973ba2c13b16645155497d42e54b08 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
Checks if the oriented edges of the wire are correctly oriented. An internal call is made to the method Closed. If no face exists, call the method with a null face (TopoDS_face()). If <Update> is set to Standard_True, registers the status in the list. May return (and registers): BRepCheck_InvalidDegeneratedFlag, BRepCheck_BadOrientationOfSubshape, BRepCheck_NotClosed, BRepCheck_NoError.
") Orientation;
		BRepCheck_Status Orientation(const TopoDS_Face & F, const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Wire::SelfIntersect ******/
		/****** md5 signature: f62c98c78906534e424d1494ff924720 ******/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
E1: TopoDS_Edge
E2: TopoDS_Edge
Update: bool (optional, default to Standard_False)

Return
-------
BRepCheck_Status

Description
-----------
Checks if the wire intersect itself on the face <F>. <E1> and <E2> are the first intersecting edges found. <E2> may be a null edge when a self-intersecting edge is found.If <Update> is set to Standard_True, registers the status in the list. May return (and register): BRepCheck_EmptyWire, BRepCheck_SelfIntersectingWire, BRepCheck_NoCurveOnSurface, BRepCheck_NoError.
") SelfIntersect;
		BRepCheck_Status SelfIntersect(const TopoDS_Face & F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Boolean Update = Standard_False);

		/****** BRepCheck_Wire::SetStatus ******/
		/****** md5 signature: 86ab384d3d45dec24b5a7e095ad3e061 ******/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "
Parameters
----------
theStatus: BRepCheck_Status

Return
-------
None

Description
-----------
Sets status of Wire;.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def brepcheck_Add(*args):
	return brepcheck.Add(*args)

@deprecated
def brepcheck_PrecCurve(*args):
	return brepcheck.PrecCurve(*args)

@deprecated
def brepcheck_PrecSurface(*args):
	return brepcheck.PrecSurface(*args)

@deprecated
def brepcheck_Print(*args):
	return brepcheck.Print(*args)

@deprecated
def brepcheck_SelfIntersection(*args):
	return brepcheck.SelfIntersection(*args)

}
