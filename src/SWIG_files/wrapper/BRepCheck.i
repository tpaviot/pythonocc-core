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
%template(BRepCheck_ListOfStatus) NCollection_List <BRepCheck_Status>;
%template(BRepCheck_ListIteratorOfListOfStatus) NCollection_TListIterator<BRepCheck_Status>;
%template(BRepCheck_DataMapOfShapeListOfStatus) NCollection_DataMap <TopoDS_Shape , BRepCheck_ListOfStatus , TopTools_ShapeMapHasher>;
%template(BRepCheck_DataMapOfShapeResult) NCollection_DataMap <TopoDS_Shape , opencascade::handle <BRepCheck_Result>, TopTools_OrientedShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <BRepCheck_Status> BRepCheck_ListOfStatus;
typedef NCollection_List <BRepCheck_Status>::Iterator BRepCheck_ListIteratorOfListOfStatus;
typedef NCollection_DataMap <TopoDS_Shape , BRepCheck_ListOfStatus , TopTools_ShapeMapHasher> BRepCheck_DataMapOfShapeListOfStatus;
typedef NCollection_DataMap <TopoDS_Shape , BRepCheck_ListOfStatus , TopTools_ShapeMapHasher>::Iterator BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <BRepCheck_Result>, TopTools_OrientedShapeMapHasher> BRepCheck_DataMapOfShapeResult;
typedef NCollection_DataMap <TopoDS_Shape , opencascade::handle <BRepCheck_Result>, TopTools_OrientedShapeMapHasher>::Iterator BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
/* end typedefs declaration */

/******************
* class BRepCheck *
******************/
%rename(brepcheck) BRepCheck;
class BRepCheck {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param List:
	:type List: BRepCheck_ListOfStatus
	:param Stat:
	:type Stat: BRepCheck_Status
	:rtype: void") Add;
		static void Add (BRepCheck_ListOfStatus & List,const BRepCheck_Status Stat);

		/****************** PrecCurve ******************/
		%feature("compactdefaultargs") PrecCurve;
		%feature("autodoc", "* Returns the resolution on the 3d curve
	:param aAC3D:
	:type aAC3D: Adaptor3d_Curve
	:rtype: float") PrecCurve;
		static Standard_Real PrecCurve (const Adaptor3d_Curve & aAC3D);

		/****************** PrecSurface ******************/
		%feature("compactdefaultargs") PrecSurface;
		%feature("autodoc", "* Returns the resolution on the surface
	:param aAHSurf:
	:type aAHSurf: Adaptor3d_HSurface
	:rtype: float") PrecSurface;
		static Standard_Real PrecSurface (const opencascade::handle<Adaptor3d_HSurface> & aAHSurf);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", ":param Stat:
	:type Stat: BRepCheck_Status
	:param OS:
	:type OS: Standard_OStream
	:rtype: void") Print;
		static void Print (const BRepCheck_Status Stat,Standard_OStream & OS);

		/****************** SelfIntersection ******************/
		%feature("compactdefaultargs") SelfIntersection;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:rtype: bool") SelfIntersection;
		static Standard_Boolean SelfIntersection (const TopoDS_Wire & W,const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2);

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
		%feature("autodoc", "* Constructs a shape validation object defined by the shape S. <S> is the shape to control. <GeomControls> If False only topological informaions are checked. The geometricals controls are For a Vertex : BRepCheck_InvalidToleranceValue NYI For an Edge : BRepCheck_InvalidCurveOnClosedSurface, BRepCheck_InvalidCurveOnSurface, BRepCheck_InvalidSameParameterFlag, BRepCheck_InvalidToleranceValue NYI For a face : BRepCheck_UnorientableShape, BRepCheck_IntersectingWires, BRepCheck_InvalidToleranceValue NYI For a wire : BRepCheck_SelfIntersectingWire
	:param S:
	:type S: TopoDS_Shape
	:param GeomControls: default value is Standard_True
	:type GeomControls: bool
	:rtype: None") BRepCheck_Analyzer;
		 BRepCheck_Analyzer (const TopoDS_Shape & S,const Standard_Boolean GeomControls = Standard_True);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* <S> is the shape to control. <GeomControls> If False only topological informaions are checked. The geometricals controls are For a Vertex : BRepCheck_InvalidTolerance NYI For an Edge : BRepCheck_InvalidCurveOnClosedSurface, BRepCheck_InvalidCurveOnSurface, BRepCheck_InvalidSameParameterFlag, BRepCheck_InvalidTolerance NYI For a face : BRepCheck_UnorientableShape, BRepCheck_IntersectingWires, BRepCheck_InvalidTolerance NYI For a wire : BRepCheck_SelfIntersectingWire
	:param S:
	:type S: TopoDS_Shape
	:param GeomControls: default value is Standard_True
	:type GeomControls: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S,const Standard_Boolean GeomControls = Standard_True);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* <S> is a subshape of the original shape. Returns <STandard_True> if no default has been detected on <S> and any of its subshape.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsValid;
		Standard_Boolean IsValid (const TopoDS_Shape & S);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Returns true if no defect is detected on the shape S or any of its subshapes. Returns true if the shape S is valid. This function checks whether a given shape is valid by checking that: - the topology is correct - parameterization of edges in particular is correct. For the topology to be correct, the following conditions must be satisfied: - edges should have at least two vertices if they are not degenerate edges. The vertices should be within the range of the bounding edges at the tolerance specified in the vertex, - edges should share at least one face. The representation of the edges should be within the tolerance criterion assigned to them. - wires defining a face should not self-intersect and should be closed, - there should be one wire which contains all other wires inside a face, - wires should be correctly oriented with respect to each of the edges, - faces should be correctly oriented, in particular with respect to adjacent faces if these faces define a solid, - shells defining a solid should be closed. There should be one enclosing shell if the shape is a solid; To check parameterization of edge, there are 2 approaches depending on the edge?s contextual situation. - if the edge is either single, or it is in the context of a wire or a compound, its parameterization is defined by the parameterization of its 3D curve and is considered as valid. - If the edge is in the context of a face, it should have SameParameter and SameRange flags set to Standard_True. To check these flags, you should call the function BRep_Tool::SameParameter and BRep_Tool::SameRange for an edge. If at least one of these flags is set to Standard_False, the edge is considered as invalid without any additional check. If the edge is contained by a face, and it has SameParameter and SameRange flags set to Standard_True, IsValid checks whether representation of the edge on face, in context of which the edge is considered, has the same parameterization up to the tolerance value coded on the edge. For a given parameter t on the edge having C as a 3D curve and one PCurve P on a surface S (base surface of the reference face), this checks that |C(t) - S(P(t))| is less than or equal to tolerance, where tolerance is the tolerance value coded on the edge.
	:rtype: bool") IsValid;
		Standard_Boolean IsValid ();

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", ":param SubS:
	:type SubS: TopoDS_Shape
	:rtype: opencascade::handle<BRepCheck_Result>") Result;
		const opencascade::handle<BRepCheck_Result> & Result (const TopoDS_Shape & SubS);

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
		%feature("autodoc", ":rtype: void") Blind;
		virtual void Blind ();

		/****************** ContextualShape ******************/
		%feature("compactdefaultargs") ContextualShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") ContextualShape;
		const TopoDS_Shape  ContextualShape ();

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", ":param ContextShape:
	:type ContextShape: TopoDS_Shape
	:rtype: void") InContext;
		virtual void InContext (const TopoDS_Shape & ContextShape);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** InitContextIterator ******************/
		%feature("compactdefaultargs") InitContextIterator;
		%feature("autodoc", ":rtype: None") InitContextIterator;
		void InitContextIterator ();

		/****************** IsBlind ******************/
		%feature("compactdefaultargs") IsBlind;
		%feature("autodoc", ":rtype: bool") IsBlind;
		Standard_Boolean IsBlind ();

		/****************** IsMinimum ******************/
		%feature("compactdefaultargs") IsMinimum;
		%feature("autodoc", ":rtype: bool") IsMinimum;
		Standard_Boolean IsMinimum ();

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", ":rtype: void") Minimum;
		virtual void Minimum ();

		/****************** MoreShapeInContext ******************/
		%feature("compactdefaultargs") MoreShapeInContext;
		%feature("autodoc", ":rtype: bool") MoreShapeInContext;
		Standard_Boolean MoreShapeInContext ();

		/****************** NextShapeInContext ******************/
		%feature("compactdefaultargs") NextShapeInContext;
		%feature("autodoc", ":rtype: None") NextShapeInContext;
		void NextShapeInContext ();

		/****************** SetFailStatus ******************/
		%feature("compactdefaultargs") SetFailStatus;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") SetFailStatus;
		void SetFailStatus (const TopoDS_Shape & S);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", ":rtype: BRepCheck_ListOfStatus") Status;
		const BRepCheck_ListOfStatus & Status ();

		/****************** StatusOnShape ******************/
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", "* If not already done, performs the InContext control and returns the list of status.
	:param S:
	:type S: TopoDS_Shape
	:rtype: BRepCheck_ListOfStatus") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape (const TopoDS_Shape & S);

		/****************** StatusOnShape ******************/
		%feature("compactdefaultargs") StatusOnShape;
		%feature("autodoc", ":rtype: BRepCheck_ListOfStatus") StatusOnShape;
		const BRepCheck_ListOfStatus & StatusOnShape ();

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
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: None") BRepCheck_Edge;
		 BRepCheck_Edge (const TopoDS_Edge & E);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", ":rtype: None") Blind;
		void Blind ();

		/****************** CheckPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") CheckPolygonOnTriangulation;
		%feature("autodoc", "* Checks, if polygon on triangulation of heEdge is out of 3D-curve of this edge.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: BRepCheck_Status") CheckPolygonOnTriangulation;
		BRepCheck_Status CheckPolygonOnTriangulation (const TopoDS_Edge & theEdge);

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", ":rtype: bool") GeometricControls;
		Standard_Boolean GeometricControls ();

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") GeometricControls;
		void GeometricControls (const Standard_Boolean B);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", ":param ContextShape:
	:type ContextShape: TopoDS_Shape
	:rtype: None") InContext;
		void InContext (const TopoDS_Shape & ContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", ":rtype: None") Minimum;
		void Minimum ();

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "* Sets status of Edge;
	:param theStatus:
	:type theStatus: BRepCheck_Status
	:rtype: None") SetStatus;
		void SetStatus (const BRepCheck_Status theStatus);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

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
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: None") BRepCheck_Face;
		 BRepCheck_Face (const TopoDS_Face & F);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", ":rtype: None") Blind;
		void Blind ();

		/****************** ClassifyWires ******************/
		%feature("compactdefaultargs") ClassifyWires;
		%feature("autodoc", ":param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") ClassifyWires;
		BRepCheck_Status ClassifyWires (const Standard_Boolean Update = Standard_False);

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", ":rtype: bool") GeometricControls;
		Standard_Boolean GeometricControls ();

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") GeometricControls;
		void GeometricControls (const Standard_Boolean B);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", ":param ContextShape:
	:type ContextShape: TopoDS_Shape
	:rtype: None") InContext;
		void InContext (const TopoDS_Shape & ContextShape);

		/****************** IntersectWires ******************/
		%feature("compactdefaultargs") IntersectWires;
		%feature("autodoc", ":param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") IntersectWires;
		BRepCheck_Status IntersectWires (const Standard_Boolean Update = Standard_False);

		/****************** IsUnorientable ******************/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", ":rtype: bool") IsUnorientable;
		Standard_Boolean IsUnorientable ();

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", ":rtype: None") Minimum;
		void Minimum ();

		/****************** OrientationOfWires ******************/
		%feature("compactdefaultargs") OrientationOfWires;
		%feature("autodoc", ":param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") OrientationOfWires;
		BRepCheck_Status OrientationOfWires (const Standard_Boolean Update = Standard_False);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "* Sets status of Face;
	:param theStatus:
	:type theStatus: BRepCheck_Status
	:rtype: None") SetStatus;
		void SetStatus (const BRepCheck_Status theStatus);

		/****************** SetUnorientable ******************/
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", ":rtype: None") SetUnorientable;
		void SetUnorientable ();

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
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shell
	:rtype: None") BRepCheck_Shell;
		 BRepCheck_Shell (const TopoDS_Shell & S);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", ":rtype: None") Blind;
		void Blind ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Checks if the oriented faces of the shell give a closed shell. If the wire is closed, returns BRepCheck_NoError.If <Update> is set to Standard_True, registers the status in the list.
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") Closed;
		BRepCheck_Status Closed (const Standard_Boolean Update = Standard_False);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", ":param ContextShape:
	:type ContextShape: TopoDS_Shape
	:rtype: None") InContext;
		void InContext (const TopoDS_Shape & ContextShape);

		/****************** IsUnorientable ******************/
		%feature("compactdefaultargs") IsUnorientable;
		%feature("autodoc", ":rtype: bool") IsUnorientable;
		Standard_Boolean IsUnorientable ();

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", ":rtype: None") Minimum;
		void Minimum ();

		/****************** NbConnectedSet ******************/
		%feature("compactdefaultargs") NbConnectedSet;
		%feature("autodoc", ":param theSets:
	:type theSets: TopTools_ListOfShape
	:rtype: int") NbConnectedSet;
		Standard_Integer NbConnectedSet (TopTools_ListOfShape & theSets);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Checks if the oriented faces of the shell are correctly oriented. An internal call is made to the method Closed. If <Update> is set to Standard_True, registers the status in the list.
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") Orientation;
		BRepCheck_Status Orientation (const Standard_Boolean Update = Standard_False);

		/****************** SetUnorientable ******************/
		%feature("compactdefaultargs") SetUnorientable;
		%feature("autodoc", ":rtype: None") SetUnorientable;
		void SetUnorientable ();

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
		%feature("autodoc", "* Constructor <theS> is the solid to check
	:param theS:
	:type theS: TopoDS_Solid
	:rtype: None") BRepCheck_Solid;
		 BRepCheck_Solid (const TopoDS_Solid & theS);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "* see the parent class for more details
	:rtype: void") Blind;
		virtual void Blind ();

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "* Checks the solid in context of the shape <theContextShape>
	:param theContextShape:
	:type theContextShape: TopoDS_Shape
	:rtype: void") InContext;
		virtual void InContext (const TopoDS_Shape & theContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "* Checks the solid per se. //! The scan area is: 1. Shells that overlaps each other Status: BRepCheck_InvalidImbricationOfShells //! 2. Detached parts of the solid (vertices, edges) that have non-internal orientation Status: BRepCheck_BadOrientationOfSubshape //! 3. For closed, non-internal shells: 3.1 Shells containing entities of the solid that are outside towards the shells Status: BRepCheck_SubshapeNotInShape //! 3.2 Shells that encloses other Shells (for non-holes) Status: BRepCheck_EnclosedRegion
	:rtype: void") Minimum;
		virtual void Minimum ();

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
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:rtype: None") BRepCheck_Vertex;
		 BRepCheck_Vertex (const TopoDS_Vertex & V);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", ":rtype: None") Blind;
		void Blind ();

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", ":param ContextShape:
	:type ContextShape: TopoDS_Shape
	:rtype: None") InContext;
		void InContext (const TopoDS_Shape & ContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", ":rtype: None") Minimum;
		void Minimum ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

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
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:rtype: None") BRepCheck_Wire;
		 BRepCheck_Wire (const TopoDS_Wire & W);

		/****************** Blind ******************/
		%feature("compactdefaultargs") Blind;
		%feature("autodoc", "* Does nothing
	:rtype: None") Blind;
		void Blind ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Checks if the oriented edges of the wire give a closed wire. If the wire is closed, returns BRepCheck_NoError. Warning : if the first and last edge are infinite, the wire will be considered as a closed one. If <Update> is set to Standard_True, registers the status in the list. May return (and registers): **BRepCheck_NotConnected, if wire is not topologically closed **BRepCheck_RedundantEdge, if an edge is in wire more than 3 times or in case of 2 occurences if not with FORWARD and REVERSED orientation. **BRepCheck_NoError
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") Closed;
		BRepCheck_Status Closed (const Standard_Boolean Update = Standard_False);

		/****************** Closed2d ******************/
		%feature("compactdefaultargs") Closed2d;
		%feature("autodoc", "* Checks if edges of the wire give a wire closed in 2d space. Returns BRepCheck_NoError, or BRepCheck_NotClosed If <Update> is set to Standard_True, registers the status in the list.
	:param F:
	:type F: TopoDS_Face
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") Closed2d;
		BRepCheck_Status Closed2d (const TopoDS_Face & F,const Standard_Boolean Update = Standard_False);

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "* report SelfIntersect() check would be (is) done
	:rtype: bool") GeometricControls;
		Standard_Boolean GeometricControls ();

		/****************** GeometricControls ******************/
		%feature("compactdefaultargs") GeometricControls;
		%feature("autodoc", "* set SelfIntersect() to be checked
	:param B:
	:type B: bool
	:rtype: None") GeometricControls;
		void GeometricControls (const Standard_Boolean B);

		/****************** InContext ******************/
		%feature("compactdefaultargs") InContext;
		%feature("autodoc", "* if <ContextShape> is a face, consequently checks SelfIntersect(), Closed(), Orientation() and Closed2d until faulty is found
	:param ContextShape:
	:type ContextShape: TopoDS_Shape
	:rtype: None") InContext;
		void InContext (const TopoDS_Shape & ContextShape);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "* checks that the wire is not empty and 'connex'. Called by constructor
	:rtype: None") Minimum;
		void Minimum ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Checks if the oriented edges of the wire are correctly oriented. An internal call is made to the method Closed. If no face exists, call the method with a null face (TopoDS_face()). If <Update> is set to Standard_True, registers the status in the list. May return (and registers): BRepCheck_InvalidDegeneratedFlag, BRepCheck_BadOrientationOfSubshape, BRepCheck_NotClosed, BRepCheck_NoError
	:param F:
	:type F: TopoDS_Face
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") Orientation;
		BRepCheck_Status Orientation (const TopoDS_Face & F,const Standard_Boolean Update = Standard_False);

		/****************** SelfIntersect ******************/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "* Checks if the wire intersect itself on the face <F>. <E1> and <E2> are the first intersecting edges found. <E2> may be a null edge when a self-intersecting edge is found.If <Update> is set to Standard_True, registers the status in the list. May return (and register): BRepCheck_EmptyWire, BRepCheck_SelfIntersectingWire, BRepCheck_NoCurveOnSurface, BRepCheck_NoError
	:param F:
	:type F: TopoDS_Face
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param Update: default value is Standard_False
	:type Update: bool
	:rtype: BRepCheck_Status") SelfIntersect;
		BRepCheck_Status SelfIntersect (const TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Boolean Update = Standard_False);

		/****************** SetStatus ******************/
		%feature("compactdefaultargs") SetStatus;
		%feature("autodoc", "* Sets status of Wire;
	:param theStatus:
	:type theStatus: BRepCheck_Status
	:rtype: None") SetStatus;
		void SetStatus (const BRepCheck_Status theStatus);

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
