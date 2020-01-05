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
%define LOCOPEDOCSTRING
"LocOpe module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_locope.html"
%enddef
%module (package="OCC.Core", docstring=LOCOPEDOCSTRING) LocOpe


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
#include<LocOpe_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TColgp_module.hxx>
#include<TopTools_module.hxx>
#include<TopAbs_module.hxx>
#include<TColGeom_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<BRepClass3d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopLoc_module.hxx>
#include<Intf_module.hxx>
#include<Message_module.hxx>
#include<IntSurf_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Extrema_module.hxx>
#include<Geom2d_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TColgp.i
%import TopTools.i
%import TopAbs.i
%import TColGeom.i
%import gp.i
%import Geom.i
/* public enums */
enum LocOpe_Operation {
	LocOpe_FUSE = 0,
	LocOpe_CUT = 1,
	LocOpe_INVALID = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(LocOpe_GeneratedShape)
%wrap_handle(LocOpe_WiresOnShape)
%wrap_handle(LocOpe_GluedShape)
/* end handles declaration */

/* templates */
%template(LocOpe_SequenceOfLin) NCollection_Sequence <gp_Lin>;
%template(LocOpe_DataMapOfShapePnt) NCollection_DataMap <TopoDS_Shape , gp_Pnt , TopTools_ShapeMapHasher>;
%template(LocOpe_SequenceOfCirc) NCollection_Sequence <gp_Circ>;
%template(LocOpe_SequenceOfPntFace) NCollection_Sequence <LocOpe_PntFace>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <gp_Lin> LocOpe_SequenceOfLin;
typedef NCollection_DataMap <TopoDS_Shape , gp_Pnt , TopTools_ShapeMapHasher> LocOpe_DataMapOfShapePnt;
typedef NCollection_DataMap <TopoDS_Shape , gp_Pnt , TopTools_ShapeMapHasher>::Iterator LocOpe_DataMapIteratorOfDataMapOfShapePnt;
typedef NCollection_Sequence <gp_Circ> LocOpe_SequenceOfCirc;
typedef NCollection_Sequence <LocOpe_PntFace> LocOpe_SequenceOfPntFace;
/* end typedefs declaration */

/***************
* class LocOpe *
***************/
%rename(locope) LocOpe;
class LocOpe {
	public:
		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Returns Standard_True when the wire <W> is closed on the face <OnF>.
	:param W:
	:type W: TopoDS_Wire
	:param OnF:
	:type OnF: TopoDS_Face
	:rtype: bool") Closed;
		static Standard_Boolean Closed (const TopoDS_Wire & W,const TopoDS_Face & OnF);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Returns Standard_True when the edge <E> is closed on the face <OnF>.
	:param E:
	:type E: TopoDS_Edge
	:param OnF:
	:type OnF: TopoDS_Face
	:rtype: bool") Closed;
		static Standard_Boolean Closed (const TopoDS_Edge & E,const TopoDS_Face & OnF);

		/****************** SampleEdges ******************/
		%feature("compactdefaultargs") SampleEdges;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Pt:
	:type Pt: TColgp_SequenceOfPnt
	:rtype: void") SampleEdges;
		static void SampleEdges (const TopoDS_Shape & S,TColgp_SequenceOfPnt & Pt);

		/****************** TgtFaces ******************/
		%feature("compactdefaultargs") TgtFaces;
		%feature("autodoc", "* Returns Standard_True when the faces are tangent
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:rtype: bool") TgtFaces;
		static Standard_Boolean TgtFaces (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2);

};


%extend LocOpe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class LocOpe_BuildShape *
**************************/
class LocOpe_BuildShape {
	public:
		/****************** LocOpe_BuildShape ******************/
		%feature("compactdefaultargs") LocOpe_BuildShape;
		%feature("autodoc", ":rtype: None") LocOpe_BuildShape;
		 LocOpe_BuildShape ();

		/****************** LocOpe_BuildShape ******************/
		%feature("compactdefaultargs") LocOpe_BuildShape;
		%feature("autodoc", "* Builds shape(s) from the list <L>. Uses only the faces of <L>.
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") LocOpe_BuildShape;
		 LocOpe_BuildShape (const TopTools_ListOfShape & L);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Builds shape(s) from the list <L>. Uses only the faces of <L>.
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") Perform;
		void Perform (const TopTools_ListOfShape & L);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

};


%extend LocOpe_BuildShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class LocOpe_BuildWires *
**************************/
class LocOpe_BuildWires {
	public:
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LocOpe_BuildWires ******************/
		%feature("compactdefaultargs") LocOpe_BuildWires;
		%feature("autodoc", ":rtype: None") LocOpe_BuildWires;
		 LocOpe_BuildWires ();

		/****************** LocOpe_BuildWires ******************/
		%feature("compactdefaultargs") LocOpe_BuildWires;
		%feature("autodoc", ":param Ledges:
	:type Ledges: TopTools_ListOfShape
	:param PW:
	:type PW: LocOpe_WiresOnShape
	:rtype: None") LocOpe_BuildWires;
		 LocOpe_BuildWires (const TopTools_ListOfShape & Ledges,const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Ledges:
	:type Ledges: TopTools_ListOfShape
	:param PW:
	:type PW: LocOpe_WiresOnShape
	:rtype: None") Perform;
		void Perform (const TopTools_ListOfShape & Ledges,const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Result;
		const TopTools_ListOfShape & Result ();

};


%extend LocOpe_BuildWires {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class LocOpe_CSIntersector *
*****************************/
class LocOpe_CSIntersector {
	public:
		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Performs the intersection between <Ax1 and <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns <Standard_True> if the intersection has been done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LocOpe_CSIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CSIntersector;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") LocOpe_CSIntersector;
		 LocOpe_CSIntersector ();

		/****************** LocOpe_CSIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CSIntersector;
		%feature("autodoc", "* Creates and performs the intersection betwwen <Ax1> and <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_CSIntersector;
		 LocOpe_CSIntersector (const TopoDS_Shape & S);

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "* On the element of range <I>, searches the first intersection point located after the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <Standard_False>.
	:param I:
	:type I: int
	:param From:
	:type From: float
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer I,const Standard_Real From,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "* On the element of range <I>, searches the first intersection point located after the index <FromInd> ( >= FromInd + 1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <Standard_False>.
	:param I:
	:type I: int
	:param FromInd:
	:type FromInd: int
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer I,const Standard_Integer FromInd,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "* On the element of range <I>, searches the first intersection point located before the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <Standard_False>.
	:param I:
	:type I: int
	:param From:
	:type From: float
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer I,const Standard_Real From,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "* On the element of range <I>, searches the first intersection point located before the index <FromInd> ( <= FromInd -1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <Standard_False>.
	:param I:
	:type I: int
	:param FromInd:
	:type FromInd: int
	:param Tol:
	:type Tol: float
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer I,const Standard_Integer FromInd,const Standard_Real Tol,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection point on the element of range <I>.
	:param I:
	:type I: int
	:rtype: int") NbPoints;
		Standard_Integer NbPoints (const Standard_Integer I);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Slin:
	:type Slin: LocOpe_SequenceOfLin
	:rtype: None") Perform;
		void Perform (const LocOpe_SequenceOfLin & Slin);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Scir:
	:type Scir: LocOpe_SequenceOfCirc
	:rtype: None") Perform;
		void Perform (const LocOpe_SequenceOfCirc & Scir);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Scur:
	:type Scur: TColGeom_SequenceOfCurve
	:rtype: None") Perform;
		void Perform (const TColGeom_SequenceOfCurve & Scur);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point of range <Index> on element of range <I>. The points are sorted in increasing order of parameter along the axis.
	:param I:
	:type I: int
	:param Index:
	:type Index: int
	:rtype: LocOpe_PntFace") Point;
		const LocOpe_PntFace & Point (const Standard_Integer I,const Standard_Integer Index);

};


%extend LocOpe_CSIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class LocOpe_CurveShapeIntersector *
*************************************/
class LocOpe_CurveShapeIntersector {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Performs the intersection between <Ax1 and <S>.
	:param Axis:
	:type Axis: gp_Ax1
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const gp_Ax1 & Axis,const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Performs the intersection between <Ax1 and <S>.
	:param C:
	:type C: gp_Circ
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const gp_Circ & C,const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns <Standard_True> if the intersection has been done.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LocOpe_CurveShapeIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector ();

		/****************** LocOpe_CurveShapeIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "* Creates and performs the intersection betwwen <Ax1> and <S>.
	:param Axis:
	:type Axis: gp_Ax1
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector (const gp_Ax1 & Axis,const TopoDS_Shape & S);

		/****************** LocOpe_CurveShapeIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "* Creates and performs yte intersection betwwen <C> and <S>.
	:param C:
	:type C: gp_Circ
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector (const gp_Circ & C,const TopoDS_Shape & S);

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "* Searches the first intersection point located after the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). //! Otherwise, returns <Standard_False>.
	:param From:
	:type From: float
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Real From,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "* Searches the first intersection point located after the index <FromInd> ( >= FromInd + 1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). //! Otherwise, returns <Standard_False>.
	:param FromInd:
	:type FromInd: int
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeAfter;
		Standard_Boolean LocalizeAfter (const Standard_Integer FromInd,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "* Searches the first intersection point located before the parameter <From>, wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). //! Otherwise, returns <Standard_False>.
	:param From:
	:type From: float
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Real From,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "* Searches the first intersection point located before the index <FromInd> ( <= FromInd -1), wich orientation is not TopAbs_EXTERNAL. If found, returns <Standard_True>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). //! Otherwise, returns <Standard_False>.
	:param FromInd:
	:type FromInd: int
	:param Or:
	:type Or: TopAbs_Orientation
	:param IndFrom:
	:type IndFrom: int
	:param IndTo:
	:type IndTo: int
	:rtype: bool") LocalizeBefore;
		Standard_Boolean LocalizeBefore (const Standard_Integer FromInd,TopAbs_Orientation & Or,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection point.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point of range <Index>. The points are sorted in increasing order of parameter along the axis.
	:param Index:
	:type Index: int
	:rtype: LocOpe_PntFace") Point;
		const LocOpe_PntFace & Point (const Standard_Integer Index);

};


%extend LocOpe_CurveShapeIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class LocOpe_DPrism *
**********************/
class LocOpe_DPrism {
	public:
		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":param SCurves:
	:type SCurves: TColGeom_SequenceOfCurve
	:rtype: None") Curves;
		void Curves (TColGeom_SequenceOfCurve & SCurves);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") FirstShape;
		const TopoDS_Shape  FirstShape ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") LastShape;
		const TopoDS_Shape  LastShape ();

		/****************** LocOpe_DPrism ******************/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", ":param Spine:
	:type Spine: TopoDS_Face
	:param Height1:
	:type Height1: float
	:param Height2:
	:type Height2: float
	:param Angle:
	:type Angle: float
	:rtype: None") LocOpe_DPrism;
		 LocOpe_DPrism (const TopoDS_Face & Spine,const Standard_Real Height1,const Standard_Real Height2,const Standard_Real Angle);

		/****************** LocOpe_DPrism ******************/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", ":param Spine:
	:type Spine: TopoDS_Face
	:param Height:
	:type Height: float
	:param Angle:
	:type Angle: float
	:rtype: None") LocOpe_DPrism;
		 LocOpe_DPrism (const TopoDS_Face & Spine,const Standard_Real Height,const Standard_Real Angle);

		/****************** Profile ******************/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", ":rtype: TopoDS_Shape") Profile;
		const TopoDS_Shape  Profile ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", ":rtype: TopoDS_Shape") Spine;
		const TopoDS_Shape  Spine ();

};


%extend LocOpe_DPrism {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class LocOpe_FindEdges *
*************************/
class LocOpe_FindEdges {
	public:
		/****************** EdgeFrom ******************/
		%feature("compactdefaultargs") EdgeFrom;
		%feature("autodoc", ":rtype: TopoDS_Edge") EdgeFrom;
		const TopoDS_Edge  EdgeFrom ();

		/****************** EdgeTo ******************/
		%feature("compactdefaultargs") EdgeTo;
		%feature("autodoc", ":rtype: TopoDS_Edge") EdgeTo;
		const TopoDS_Edge  EdgeTo ();

		/****************** InitIterator ******************/
		%feature("compactdefaultargs") InitIterator;
		%feature("autodoc", ":rtype: None") InitIterator;
		void InitIterator ();

		/****************** LocOpe_FindEdges ******************/
		%feature("compactdefaultargs") LocOpe_FindEdges;
		%feature("autodoc", ":rtype: None") LocOpe_FindEdges;
		 LocOpe_FindEdges ();

		/****************** LocOpe_FindEdges ******************/
		%feature("compactdefaultargs") LocOpe_FindEdges;
		%feature("autodoc", ":param FFrom:
	:type FFrom: TopoDS_Shape
	:param FTo:
	:type FTo: TopoDS_Shape
	:rtype: None") LocOpe_FindEdges;
		 LocOpe_FindEdges (const TopoDS_Shape & FFrom,const TopoDS_Shape & FTo);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param FFrom:
	:type FFrom: TopoDS_Shape
	:param FTo:
	:type FTo: TopoDS_Shape
	:rtype: None") Set;
		void Set (const TopoDS_Shape & FFrom,const TopoDS_Shape & FTo);

};


%extend LocOpe_FindEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class LocOpe_FindEdgesInFace *
*******************************/
class LocOpe_FindEdgesInFace {
	public:
		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":rtype: None") Init;
		void Init ();

		/****************** LocOpe_FindEdgesInFace ******************/
		%feature("compactdefaultargs") LocOpe_FindEdgesInFace;
		%feature("autodoc", ":rtype: None") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace ();

		/****************** LocOpe_FindEdgesInFace ******************/
		%feature("compactdefaultargs") LocOpe_FindEdgesInFace;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param F:
	:type F: TopoDS_Face
	:rtype: None") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace (const TopoDS_Shape & S,const TopoDS_Face & F);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Set;
		void Set (const TopoDS_Shape & S,const TopoDS_Face & F);

};


%extend LocOpe_FindEdgesInFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class LocOpe_GeneratedShape *
******************************/
%nodefaultctor LocOpe_GeneratedShape;
class LocOpe_GeneratedShape : public Standard_Transient {
	public:
		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the edge created by the vertex <V>. If none, must return a null shape.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: TopoDS_Edge") Generated;
		virtual TopoDS_Edge Generated (const TopoDS_Vertex & V);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the face created by the edge <E>. If none, must return a null shape.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopoDS_Face") Generated;
		virtual TopoDS_Face Generated (const TopoDS_Edge & E);

		/****************** GeneratingEdges ******************/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") GeneratingEdges;
		virtual const TopTools_ListOfShape & GeneratingEdges ();

		/****************** OrientedFaces ******************/
		%feature("compactdefaultargs") OrientedFaces;
		%feature("autodoc", "* Returns the list of correctly oriented generated faces.
	:rtype: TopTools_ListOfShape") OrientedFaces;
		virtual const TopTools_ListOfShape & OrientedFaces ();

};


%make_alias(LocOpe_GeneratedShape)

%extend LocOpe_GeneratedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class LocOpe_Generator *
*************************/
class LocOpe_Generator {
	public:
		/****************** DescendantFace ******************/
		%feature("compactdefaultargs") DescendantFace;
		%feature("autodoc", "* Returns the descendant face of <F>. <F> may belong to the original shape or to the 'generated' shape. The returned face may be a null shape (when <F> disappears).
	:param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") DescendantFace;
		const TopTools_ListOfShape & DescendantFace (const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the algorithm on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LocOpe_Generator ******************/
		%feature("compactdefaultargs") LocOpe_Generator;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") LocOpe_Generator;
		 LocOpe_Generator ();

		/****************** LocOpe_Generator ******************/
		%feature("compactdefaultargs") LocOpe_Generator;
		%feature("autodoc", "* Creates the algorithm on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_Generator;
		 LocOpe_Generator (const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param G:
	:type G: LocOpe_GeneratedShape
	:rtype: None") Perform;
		void Perform (const opencascade::handle<LocOpe_GeneratedShape> & G);

		/****************** ResultingShape ******************/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "* Returns the new shape
	:rtype: TopoDS_Shape") ResultingShape;
		const TopoDS_Shape  ResultingShape ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the initial shape
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

};


%extend LocOpe_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class LocOpe_Gluer *
*********************/
class LocOpe_Gluer {
	public:
		/****************** BasisShape ******************/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") BasisShape;
		const TopoDS_Shape  BasisShape ();

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param Fnew:
	:type Fnew: TopoDS_Face
	:param Fbase:
	:type Fbase: TopoDS_Face
	:rtype: None") Bind;
		void Bind (const TopoDS_Face & Fnew,const TopoDS_Face & Fbase);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param Enew:
	:type Enew: TopoDS_Edge
	:param Ebase:
	:type Ebase: TopoDS_Edge
	:rtype: None") Bind;
		void Bind (const TopoDS_Edge & Enew,const TopoDS_Edge & Ebase);

		/****************** DescendantFaces ******************/
		%feature("compactdefaultargs") DescendantFaces;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") DescendantFaces;
		const TopTools_ListOfShape & DescendantFaces (const TopoDS_Face & F);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Edges;
		const TopTools_ListOfShape & Edges ();

		/****************** GluedShape ******************/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") GluedShape;
		const TopoDS_Shape  GluedShape ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param Sbase:
	:type Sbase: TopoDS_Shape
	:param Snew:
	:type Snew: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & Sbase,const TopoDS_Shape & Snew);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LocOpe_Gluer ******************/
		%feature("compactdefaultargs") LocOpe_Gluer;
		%feature("autodoc", ":rtype: None") LocOpe_Gluer;
		 LocOpe_Gluer ();

		/****************** LocOpe_Gluer ******************/
		%feature("compactdefaultargs") LocOpe_Gluer;
		%feature("autodoc", ":param Sbase:
	:type Sbase: TopoDS_Shape
	:param Snew:
	:type Snew: TopoDS_Shape
	:rtype: None") LocOpe_Gluer;
		 LocOpe_Gluer (const TopoDS_Shape & Sbase,const TopoDS_Shape & Snew);

		/****************** OpeType ******************/
		%feature("compactdefaultargs") OpeType;
		%feature("autodoc", ":rtype: LocOpe_Operation") OpeType;
		LocOpe_Operation OpeType ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** ResultingShape ******************/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") ResultingShape;
		const TopoDS_Shape  ResultingShape ();

		/****************** TgtEdges ******************/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") TgtEdges;
		const TopTools_ListOfShape & TgtEdges ();

};


%extend LocOpe_Gluer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class LocOpe_LinearForm *
**************************/
class LocOpe_LinearForm {
	public:
		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") FirstShape;
		const TopoDS_Shape  FirstShape ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") LastShape;
		const TopoDS_Shape  LastShape ();

		/****************** LocOpe_LinearForm ******************/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", ":rtype: None") LocOpe_LinearForm;
		 LocOpe_LinearForm ();

		/****************** LocOpe_LinearForm ******************/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None") LocOpe_LinearForm;
		 LocOpe_LinearForm (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);

		/****************** LocOpe_LinearForm ******************/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:param Vectra:
	:type Vectra: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None") LocOpe_LinearForm;
		 LocOpe_LinearForm (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:param Vectra:
	:type Vectra: gp_Vec
	:param Pnt1:
	:type Pnt1: gp_Pnt
	:param Pnt2:
	:type Pnt2: gp_Pnt
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra,const gp_Pnt & Pnt1,const gp_Pnt & Pnt2);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);

};


%extend LocOpe_LinearForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class LocOpe_Pipe *
********************/
class LocOpe_Pipe {
	public:
		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":param Spt:
	:type Spt: TColgp_SequenceOfPnt
	:rtype: TColGeom_SequenceOfCurve") Curves;
		const TColGeom_SequenceOfCurve & Curves (const TColgp_SequenceOfPnt & Spt);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") FirstShape;
		const TopoDS_Shape  FirstShape ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") LastShape;
		const TopoDS_Shape  LastShape ();

		/****************** LocOpe_Pipe ******************/
		%feature("compactdefaultargs") LocOpe_Pipe;
		%feature("autodoc", ":param Spine:
	:type Spine: TopoDS_Wire
	:param Profile:
	:type Profile: TopoDS_Shape
	:rtype: None") LocOpe_Pipe;
		 LocOpe_Pipe (const TopoDS_Wire & Spine,const TopoDS_Shape & Profile);

		/****************** Profile ******************/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", ":rtype: TopoDS_Shape") Profile;
		const TopoDS_Shape  Profile ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", ":rtype: TopoDS_Shape") Spine;
		const TopoDS_Shape  Spine ();

};


%extend LocOpe_Pipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class LocOpe_PntFace *
***********************/
class LocOpe_PntFace {
	public:
		/****************** ChangeOrientation ******************/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** LocOpe_PntFace ******************/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", "* Empty constructor. Useful only for the list.
	:rtype: None") LocOpe_PntFace;
		 LocOpe_PntFace ();

		/****************** LocOpe_PntFace ******************/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param F:
	:type F: TopoDS_Face
	:param Or:
	:type Or: TopAbs_Orientation
	:param Param:
	:type Param: float
	:param UPar:
	:type UPar: float
	:param VPar:
	:type VPar: float
	:rtype: None") LocOpe_PntFace;
		 LocOpe_PntFace (const gp_Pnt & P,const TopoDS_Face & F,const TopAbs_Orientation Or,const Standard_Real Param,const Standard_Real UPar,const Standard_Real VPar);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", ":rtype: gp_Pnt") Pnt;
		const gp_Pnt  Pnt ();

		/****************** UParameter ******************/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", ":rtype: float") UParameter;
		Standard_Real UParameter ();

		/****************** VParameter ******************/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", ":rtype: float") VParameter;
		Standard_Real VParameter ();

};


%extend LocOpe_PntFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class LocOpe_Prism *
*********************/
class LocOpe_Prism {
	public:
		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":param SCurves:
	:type SCurves: TColGeom_SequenceOfCurve
	:rtype: None") Curves;
		void Curves (TColGeom_SequenceOfCurve & SCurves);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") FirstShape;
		const TopoDS_Shape  FirstShape ();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") LastShape;
		const TopoDS_Shape  LastShape ();

		/****************** LocOpe_Prism ******************/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", ":rtype: None") LocOpe_Prism;
		 LocOpe_Prism ();

		/****************** LocOpe_Prism ******************/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:rtype: None") LocOpe_Prism;
		 LocOpe_Prism (const TopoDS_Shape & Base,const gp_Vec & V);

		/****************** LocOpe_Prism ******************/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:param Vectra:
	:type Vectra: gp_Vec
	:rtype: None") LocOpe_Prism;
		 LocOpe_Prism (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vectra);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Base:
	:type Base: TopoDS_Shape
	:param V:
	:type V: gp_Vec
	:param Vtra:
	:type Vtra: gp_Vec
	:rtype: None") Perform;
		void Perform (const TopoDS_Shape & Base,const gp_Vec & V,const gp_Vec & Vtra);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Shapes;
		const TopTools_ListOfShape & Shapes (const TopoDS_Shape & S);

};


%extend LocOpe_Prism {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class LocOpe_Revol *
*********************/
/******************************
* class LocOpe_RevolutionForm *
******************************/
/***************************
* class LocOpe_SplitDrafts *
***************************/
class LocOpe_SplitDrafts {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the algoritm with the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns <Standard_True> if the modification has been succesfully performed.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** LocOpe_SplitDrafts ******************/
		%feature("compactdefaultargs") LocOpe_SplitDrafts;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts ();

		/****************** LocOpe_SplitDrafts ******************/
		%feature("compactdefaultargs") LocOpe_SplitDrafts;
		%feature("autodoc", "* Creates the algoritm on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts (const TopoDS_Shape & S);

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") OriginalShape;
		const TopoDS_Shape  OriginalShape ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Splits the face <F> of the former given shape with the wire <W>. The wire is assumed to lie on the face. Puts a draft angle on both parts of the wire. <Extractg>, <Nplg>, <Angleg> define the arguments for the left part of the wire. <Extractd>, <Npld>, <Angled> define the arguments for the right part of the wire. The draft angle is measured with the direction <Extract>. <Npl> defines the neutral plane (points belonging to the neutral plane are not modified). <Angle> is the value of the draft angle. If <ModifyLeft> is set to <Standard_False>, no draft angle is applied to the left part of the wire. If <ModifyRight> is set to <Standard_False>,no draft angle is applied to the right part of the wire.
	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:param Extractg:
	:type Extractg: gp_Dir
	:param NPlg:
	:type NPlg: gp_Pln
	:param Angleg:
	:type Angleg: float
	:param Extractd:
	:type Extractd: gp_Dir
	:param NPld:
	:type NPld: gp_Pln
	:param Angled:
	:type Angled: float
	:param ModifyLeft: default value is Standard_True
	:type ModifyLeft: bool
	:param ModifyRight: default value is Standard_True
	:type ModifyRight: bool
	:rtype: None") Perform;
		void Perform (const TopoDS_Face & F,const TopoDS_Wire & W,const gp_Dir & Extractg,const gp_Pln & NPlg,const Standard_Real Angleg,const gp_Dir & Extractd,const gp_Pln & NPld,const Standard_Real Angled,const Standard_Boolean ModifyLeft = Standard_True,const Standard_Boolean ModifyRight = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Splits the face <F> of the former given shape with the wire <W>. The wire is assumed to lie on the face. Puts a draft angle on the left part of the wire. The draft angle is measured with the direction <Extract>. <Npl> defines the neutral plane (points belonging to the neutral plane are not modified). <Angle> is the value of the draft angle.
	:param F:
	:type F: TopoDS_Face
	:param W:
	:type W: TopoDS_Wire
	:param Extract:
	:type Extract: gp_Dir
	:param NPl:
	:type NPl: gp_Pln
	:param Angle:
	:type Angle: float
	:rtype: None") Perform;
		void Perform (const TopoDS_Face & F,const TopoDS_Wire & W,const gp_Dir & Extract,const gp_Pln & NPl,const Standard_Real Angle);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the modified shape.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** ShapesFromShape ******************/
		%feature("compactdefaultargs") ShapesFromShape;
		%feature("autodoc", "* Manages the descendant shapes.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") ShapesFromShape;
		const TopTools_ListOfShape & ShapesFromShape (const TopoDS_Shape & S);

};


%extend LocOpe_SplitDrafts {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class LocOpe_SplitShape *
**************************/
class LocOpe_SplitShape {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the vertex <V> on the edge <E>, at parameter <P>.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the wire <W> on the face <F>.
	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") Add;
		Standard_Boolean Add (const TopoDS_Wire & W,const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the list of wires <Lwires> on the face <F>.
	:param Lwires:
	:type Lwires: TopTools_ListOfShape
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") Add;
		Standard_Boolean Add (const TopTools_ListOfShape & Lwires,const TopoDS_Face & F);

		/****************** CanSplit ******************/
		%feature("compactdefaultargs") CanSplit;
		%feature("autodoc", "* Tests if it is possible to split the edge <E>.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") CanSplit;
		Standard_Boolean CanSplit (const TopoDS_Edge & E);

		/****************** DescendantShapes ******************/
		%feature("compactdefaultargs") DescendantShapes;
		%feature("autodoc", "* Returns the list of descendant shapes of <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes (const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the process on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** LeftOf ******************/
		%feature("compactdefaultargs") LeftOf;
		%feature("autodoc", "* Returns the 'left' part defined by the wire <W> on the face <F>. The returned list of shape is in fact a list of faces. The face <F> is considered with its topological orientation in the original shape. <W> is considered with its orientation.
	:param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") LeftOf;
		const TopTools_ListOfShape & LeftOf (const TopoDS_Wire & W,const TopoDS_Face & F);

		/****************** LocOpe_SplitShape ******************/
		%feature("compactdefaultargs") LocOpe_SplitShape;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") LocOpe_SplitShape;
		 LocOpe_SplitShape ();

		/****************** LocOpe_SplitShape ******************/
		%feature("compactdefaultargs") LocOpe_SplitShape;
		%feature("autodoc", "* Creates the process with the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_SplitShape;
		 LocOpe_SplitShape (const TopoDS_Shape & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the 'original' shape.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

};


%extend LocOpe_SplitShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class LocOpe_Spliter *
***********************/
class LocOpe_Spliter {
	public:
		/****************** DescendantShapes ******************/
		%feature("compactdefaultargs") DescendantShapes;
		%feature("autodoc", "* Returns the list of descendant shapes of <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes (const TopoDS_Shape & S);

		/****************** DirectLeft ******************/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "* Returns the faces which are the left of the projected wires and which are
	:rtype: TopTools_ListOfShape") DirectLeft;
		const TopTools_ListOfShape & DirectLeft ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes the algorithm on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Left ******************/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "* Returns the faces of the 'left' part on the shape. (It is build from DirectLeft, with the faces connected to this set, and so on...).
	:rtype: TopTools_ListOfShape") Left;
		const TopTools_ListOfShape & Left ();

		/****************** LocOpe_Spliter ******************/
		%feature("compactdefaultargs") LocOpe_Spliter;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") LocOpe_Spliter;
		 LocOpe_Spliter ();

		/****************** LocOpe_Spliter ******************/
		%feature("compactdefaultargs") LocOpe_Spliter;
		%feature("autodoc", "* Creates the algorithm on the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_Spliter;
		 LocOpe_Spliter (const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param PW:
	:type PW: LocOpe_WiresOnShape
	:rtype: None") Perform;
		void Perform (const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** ResultingShape ******************/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "* Returns the new shape
	:rtype: TopoDS_Shape") ResultingShape;
		const TopoDS_Shape  ResultingShape ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the initial shape
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

};


%extend LocOpe_Spliter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class LocOpe_WiresOnShape *
****************************/
class LocOpe_WiresOnShape : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add splitting edges or wires for whole initial shape withot additional specification edge->face, edge->edge This method puts edge on the corresponding faces from initial shape
	:param theEdges:
	:type theEdges: TopTools_SequenceOfShape
	:rtype: bool") Add;
		Standard_Boolean Add (const TopTools_SequenceOfShape & theEdges);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Bind;
		void Bind (const TopoDS_Wire & W,const TopoDS_Face & F);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param Comp:
	:type Comp: TopoDS_Compound
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Bind;
		void Bind (const TopoDS_Compound & Comp,const TopoDS_Face & F);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Bind;
		void Bind (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", ":param EfromW:
	:type EfromW: TopoDS_Edge
	:param EonFace:
	:type EonFace: TopoDS_Edge
	:rtype: None") Bind;
		void Bind (const TopoDS_Edge & EfromW,const TopoDS_Edge & EonFace);

		/****************** BindAll ******************/
		%feature("compactdefaultargs") BindAll;
		%feature("autodoc", ":rtype: None") BindAll;
		void BindAll ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		TopoDS_Edge Edge ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** InitEdgeIterator ******************/
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", ":rtype: None") InitEdgeIterator;
		void InitEdgeIterator ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsFaceWithSection ******************/
		%feature("compactdefaultargs") IsFaceWithSection;
		%feature("autodoc", "* tells is the face to be split by section or not
	:param aFace:
	:type aFace: TopoDS_Shape
	:rtype: bool") IsFaceWithSection;
		Standard_Boolean IsFaceWithSection (const TopoDS_Shape & aFace);

		/****************** LocOpe_WiresOnShape ******************/
		%feature("compactdefaultargs") LocOpe_WiresOnShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_WiresOnShape;
		 LocOpe_WiresOnShape (const TopoDS_Shape & S);

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", ":rtype: bool") MoreEdge;
		Standard_Boolean MoreEdge ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", ":rtype: None") NextEdge;
		void NextEdge ();

		/****************** OnEdge ******************/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "* If the current edge is projected on an edge, returns <Standard_True> and sets the value of <E>. Otherwise, returns <Standard_False>.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") OnEdge;
		Standard_Boolean OnEdge (TopoDS_Edge & E);

		/****************** OnEdge ******************/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "* If the vertex <V> lies on an edge of the original shape, returns <Standard_True> and sets the concerned edge in <E>, and the parameter on the edge in <P>. Else returns <Standard_False>.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:rtype: bool") OnEdge;
		Standard_Boolean OnEdge (const TopoDS_Vertex & V,TopoDS_Edge & E,Standard_Real &OutValue);

		/****************** OnEdge ******************/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "* If the vertex <V> lies on an edge of the original shape, returns <Standard_True> and sets the concerned edge in <E>, and the parameter on the edge in <P>. Else returns <Standard_False>.
	:param V:
	:type V: TopoDS_Vertex
	:param EdgeFrom:
	:type EdgeFrom: TopoDS_Edge
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: float
	:rtype: bool") OnEdge;
		Standard_Boolean OnEdge (const TopoDS_Vertex & V,const TopoDS_Edge & EdgeFrom,TopoDS_Edge & E,Standard_Real &OutValue);

		/****************** OnFace ******************/
		%feature("compactdefaultargs") OnFace;
		%feature("autodoc", "* Returns the face of the shape on which the current edge is projected.
	:rtype: TopoDS_Face") OnFace;
		TopoDS_Face OnFace ();

		/****************** OnVertex ******************/
		%feature("compactdefaultargs") OnVertex;
		%feature("autodoc", ":param Vwire:
	:type Vwire: TopoDS_Vertex
	:param Vshape:
	:type Vshape: TopoDS_Vertex
	:rtype: bool") OnVertex;
		Standard_Boolean OnVertex (const TopoDS_Vertex & Vwire,TopoDS_Vertex & Vshape);

		/****************** SetCheckInterior ******************/
		%feature("compactdefaultargs") SetCheckInterior;
		%feature("autodoc", "* Set the flag of check internal intersections default value is True (to check)
	:param ToCheckInterior:
	:type ToCheckInterior: bool
	:rtype: None") SetCheckInterior;
		void SetCheckInterior (const Standard_Boolean ToCheckInterior);

};


%make_alias(LocOpe_WiresOnShape)

%extend LocOpe_WiresOnShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class LocOpe_GluedShape *
**************************/
class LocOpe_GluedShape : public LocOpe_GeneratedShape {
	public:
		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the edge created by the vertex <V>. If none, must return a null shape.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: TopoDS_Edge") Generated;
		TopoDS_Edge Generated (const TopoDS_Vertex & V);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the face created by the edge <E>. If none, must return a null shape.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopoDS_Face") Generated;
		TopoDS_Face Generated (const TopoDS_Edge & E);

		/****************** GeneratingEdges ******************/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") GeneratingEdges;
		const TopTools_ListOfShape & GeneratingEdges ();

		/****************** GlueOnFace ******************/
		%feature("compactdefaultargs") GlueOnFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: None") GlueOnFace;
		void GlueOnFace (const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** LocOpe_GluedShape ******************/
		%feature("compactdefaultargs") LocOpe_GluedShape;
		%feature("autodoc", ":rtype: None") LocOpe_GluedShape;
		 LocOpe_GluedShape ();

		/****************** LocOpe_GluedShape ******************/
		%feature("compactdefaultargs") LocOpe_GluedShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") LocOpe_GluedShape;
		 LocOpe_GluedShape (const TopoDS_Shape & S);

		/****************** OrientedFaces ******************/
		%feature("compactdefaultargs") OrientedFaces;
		%feature("autodoc", "* Returns the list of correctly oriented generated faces.
	:rtype: TopTools_ListOfShape") OrientedFaces;
		const TopTools_ListOfShape & OrientedFaces ();

};


%make_alias(LocOpe_GluedShape)

%extend LocOpe_GluedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
