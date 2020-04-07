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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum LocOpe_Operation {
	LocOpe_FUSE = 0,
	LocOpe_CUT = 1,
	LocOpe_INVALID = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class LocOpe_Operation(IntEnum):
	LocOpe_FUSE = 0
	LocOpe_CUT = 1
	LocOpe_INVALID = 2
LocOpe_FUSE = LocOpe_Operation.LocOpe_FUSE
LocOpe_CUT = LocOpe_Operation.LocOpe_CUT
LocOpe_INVALID = LocOpe_Operation.LocOpe_INVALID
};
/* end python proxy for enums */

/* handles */
%wrap_handle(LocOpe_GeneratedShape)
%wrap_handle(LocOpe_WiresOnShape)
%wrap_handle(LocOpe_GluedShape)
/* end handles declaration */

/* templates */
%template(LocOpe_DataMapOfShapePnt) NCollection_DataMap<TopoDS_Shape,gp_Pnt,TopTools_ShapeMapHasher>;
%template(LocOpe_SequenceOfCirc) NCollection_Sequence<gp_Circ>;
%template(LocOpe_SequenceOfLin) NCollection_Sequence<gp_Lin>;
%template(LocOpe_SequenceOfPntFace) NCollection_Sequence<LocOpe_PntFace>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TopoDS_Shape, gp_Pnt, TopTools_ShapeMapHasher>::Iterator LocOpe_DataMapIteratorOfDataMapOfShapePnt;
typedef NCollection_DataMap<TopoDS_Shape, gp_Pnt, TopTools_ShapeMapHasher> LocOpe_DataMapOfShapePnt;
typedef NCollection_Sequence<gp_Circ> LocOpe_SequenceOfCirc;
typedef NCollection_Sequence<gp_Lin> LocOpe_SequenceOfLin;
typedef NCollection_Sequence<LocOpe_PntFace> LocOpe_SequenceOfPntFace;
/* end typedefs declaration */

/***************
* class LocOpe *
***************/
%rename(locope) LocOpe;
class LocOpe {
	public:
		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns standard_true when the wire <w> is closed on the face <onf>.

Parameters
----------
W: TopoDS_Wire
OnF: TopoDS_Face

Returns
-------
bool
") Closed;
		static Standard_Boolean Closed(const TopoDS_Wire & W, const TopoDS_Face & OnF);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns standard_true when the edge <e> is closed on the face <onf>.

Parameters
----------
E: TopoDS_Edge
OnF: TopoDS_Face

Returns
-------
bool
") Closed;
		static Standard_Boolean Closed(const TopoDS_Edge & E, const TopoDS_Face & OnF);

		/****************** SampleEdges ******************/
		%feature("compactdefaultargs") SampleEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Pt: TColgp_SequenceOfPnt

Returns
-------
None
") SampleEdges;
		static void SampleEdges(const TopoDS_Shape & S, TColgp_SequenceOfPnt & Pt);

		/****************** TgtFaces ******************/
		%feature("compactdefaultargs") TgtFaces;
		%feature("autodoc", "Returns standard_true when the faces are tangent.

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
bool
") TgtFaces;
		static Standard_Boolean TgtFaces(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_BuildShape;
		 LocOpe_BuildShape();

		/****************** LocOpe_BuildShape ******************/
		%feature("compactdefaultargs") LocOpe_BuildShape;
		%feature("autodoc", "Builds shape(s) from the list <l>. uses only the faces of <l>.

Parameters
----------
L: TopTools_ListOfShape

Returns
-------
None
") LocOpe_BuildShape;
		 LocOpe_BuildShape(const TopTools_ListOfShape & L);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Builds shape(s) from the list <l>. uses only the faces of <l>.

Parameters
----------
L: TopTools_ListOfShape

Returns
-------
None
") Perform;
		void Perform(const TopTools_ListOfShape & L);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

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
		/****************** LocOpe_BuildWires ******************/
		%feature("compactdefaultargs") LocOpe_BuildWires;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_BuildWires;
		 LocOpe_BuildWires();

		/****************** LocOpe_BuildWires ******************/
		%feature("compactdefaultargs") LocOpe_BuildWires;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ledges: TopTools_ListOfShape
PW: LocOpe_WiresOnShape

Returns
-------
None
") LocOpe_BuildWires;
		 LocOpe_BuildWires(const TopTools_ListOfShape & Ledges, const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ledges: TopTools_ListOfShape
PW: LocOpe_WiresOnShape

Returns
-------
None
") Perform;
		void Perform(const TopTools_ListOfShape & Ledges, const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Result;
		const TopTools_ListOfShape & Result();

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
		/****************** LocOpe_CSIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CSIntersector;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector();

		/****************** LocOpe_CSIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CSIntersector;
		%feature("autodoc", "Creates and performs the intersection betwwen <ax1> and <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector(const TopoDS_Shape & S);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Performs the intersection between <ax1 and <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns <standard_true> if the intersection has been done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "On the element of range <i>, searches the first intersection point located after the parameter <from>, wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.

Parameters
----------
I: int
From: float
Tol: float
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Integer I, const Standard_Real From, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "On the element of range <i>, searches the first intersection point located after the index <fromind> ( >= fromind + 1), wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.

Parameters
----------
I: int
FromInd: int
Tol: float
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Integer I, const Standard_Integer FromInd, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "On the element of range <i>, searches the first intersection point located before the parameter <from>, wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.

Parameters
----------
I: int
From: float
Tol: float
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Integer I, const Standard_Real From, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "On the element of range <i>, searches the first intersection point located before the index <fromind> ( <= fromind -1), wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.

Parameters
----------
I: int
FromInd: int
Tol: float
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Integer I, const Standard_Integer FromInd, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection point on the element of range <i>.

Parameters
----------
I: int

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints(const Standard_Integer I);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Slin: LocOpe_SequenceOfLin

Returns
-------
None
") Perform;
		void Perform(const LocOpe_SequenceOfLin & Slin);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scir: LocOpe_SequenceOfCirc

Returns
-------
None
") Perform;
		void Perform(const LocOpe_SequenceOfCirc & Scir);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Scur: TColGeom_SequenceOfCurve

Returns
-------
None
") Perform;
		void Perform(const TColGeom_SequenceOfCurve & Scur);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range <index> on element of range <i>. the points are sorted in increasing order of parameter along the axis.

Parameters
----------
I: int
Index: int

Returns
-------
LocOpe_PntFace
") Point;
		const LocOpe_PntFace & Point(const Standard_Integer I, const Standard_Integer Index);

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
		/****************** LocOpe_CurveShapeIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector();

		/****************** LocOpe_CurveShapeIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "Creates and performs the intersection betwwen <ax1> and <s>.

Parameters
----------
Axis: gp_Ax1
S: TopoDS_Shape

Returns
-------
None
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector(const gp_Ax1 & Axis, const TopoDS_Shape & S);

		/****************** LocOpe_CurveShapeIntersector ******************/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "Creates and performs yte intersection betwwen <c> and <s>.

Parameters
----------
C: gp_Circ
S: TopoDS_Shape

Returns
-------
None
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector(const gp_Circ & C, const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Performs the intersection between <ax1 and <s>.

Parameters
----------
Axis: gp_Ax1
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const gp_Ax1 & Axis, const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Performs the intersection between <ax1 and <s>.

Parameters
----------
C: gp_Circ
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const gp_Circ & C, const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns <standard_true> if the intersection has been done.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "Searches the first intersection point located after the parameter <from>, wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). //! otherwise, returns <standard_false>.

Parameters
----------
From: float
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Real From, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeAfter ******************/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "Searches the first intersection point located after the index <fromind> ( >= fromind + 1), wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). //! otherwise, returns <standard_false>.

Parameters
----------
FromInd: int
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Integer FromInd, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "Searches the first intersection point located before the parameter <from>, wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). //! otherwise, returns <standard_false>.

Parameters
----------
From: float
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Real From, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "Searches the first intersection point located before the index <fromind> ( <= fromind -1), wich orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). //! otherwise, returns <standard_false>.

Parameters
----------
FromInd: int
Or: TopAbs_Orientation

Returns
-------
IndFrom: int
IndTo: int
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Integer FromInd, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection point.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range <index>. the points are sorted in increasing order of parameter along the axis.

Parameters
----------
Index: int

Returns
-------
LocOpe_PntFace
") Point;
		const LocOpe_PntFace & Point(const Standard_Integer Index);

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
		/****************** LocOpe_DPrism ******************/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spine: TopoDS_Face
Height1: float
Height2: float
Angle: float

Returns
-------
None
") LocOpe_DPrism;
		 LocOpe_DPrism(const TopoDS_Face & Spine, const Standard_Real Height1, const Standard_Real Height2, const Standard_Real Angle);

		/****************** LocOpe_DPrism ******************/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spine: TopoDS_Face
Height: float
Angle: float

Returns
-------
None
") LocOpe_DPrism;
		 LocOpe_DPrism(const TopoDS_Face & Spine, const Standard_Real Height, const Standard_Real Angle);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Parameters
----------
SCurves: TColGeom_SequenceOfCurve

Returns
-------
None
") Curves;
		void Curves(TColGeom_SequenceOfCurve & SCurves);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Profile ******************/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Profile;
		const TopoDS_Shape Profile();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes(const TopoDS_Shape & S);

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Spine;
		const TopoDS_Shape Spine();

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
		/****************** LocOpe_FindEdges ******************/
		%feature("compactdefaultargs") LocOpe_FindEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_FindEdges;
		 LocOpe_FindEdges();

		/****************** LocOpe_FindEdges ******************/
		%feature("compactdefaultargs") LocOpe_FindEdges;
		%feature("autodoc", "No available documentation.

Parameters
----------
FFrom: TopoDS_Shape
FTo: TopoDS_Shape

Returns
-------
None
") LocOpe_FindEdges;
		 LocOpe_FindEdges(const TopoDS_Shape & FFrom, const TopoDS_Shape & FTo);

		/****************** EdgeFrom ******************/
		%feature("compactdefaultargs") EdgeFrom;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") EdgeFrom;
		const TopoDS_Edge EdgeFrom();

		/****************** EdgeTo ******************/
		%feature("compactdefaultargs") EdgeTo;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") EdgeTo;
		const TopoDS_Edge EdgeTo();

		/****************** InitIterator ******************/
		%feature("compactdefaultargs") InitIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitIterator;
		void InitIterator();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
FFrom: TopoDS_Shape
FTo: TopoDS_Shape

Returns
-------
None
") Set;
		void Set(const TopoDS_Shape & FFrom, const TopoDS_Shape & FTo);

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
		/****************** LocOpe_FindEdgesInFace ******************/
		%feature("compactdefaultargs") LocOpe_FindEdgesInFace;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace();

		/****************** LocOpe_FindEdgesInFace ******************/
		%feature("compactdefaultargs") LocOpe_FindEdgesInFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
F: TopoDS_Face

Returns
-------
None
") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace(const TopoDS_Shape & S, const TopoDS_Face & F);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
F: TopoDS_Face

Returns
-------
None
") Set;
		void Set(const TopoDS_Shape & S, const TopoDS_Face & F);

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
		%feature("autodoc", "Returns the edge created by the vertex <v>. if none, must return a null shape.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
TopoDS_Edge
") Generated;
		virtual TopoDS_Edge Generated(const TopoDS_Vertex & V);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the face created by the edge <e>. if none, must return a null shape.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Face
") Generated;
		virtual TopoDS_Face Generated(const TopoDS_Edge & E);

		/****************** GeneratingEdges ******************/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") GeneratingEdges;
		virtual const TopTools_ListOfShape & GeneratingEdges();

		/****************** OrientedFaces ******************/
		%feature("compactdefaultargs") OrientedFaces;
		%feature("autodoc", "Returns the list of correctly oriented generated faces.

Returns
-------
TopTools_ListOfShape
") OrientedFaces;
		virtual const TopTools_ListOfShape & OrientedFaces();

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
		/****************** LocOpe_Generator ******************/
		%feature("compactdefaultargs") LocOpe_Generator;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") LocOpe_Generator;
		 LocOpe_Generator();

		/****************** LocOpe_Generator ******************/
		%feature("compactdefaultargs") LocOpe_Generator;
		%feature("autodoc", "Creates the algorithm on the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") LocOpe_Generator;
		 LocOpe_Generator(const TopoDS_Shape & S);

		/****************** DescendantFace ******************/
		%feature("compactdefaultargs") DescendantFace;
		%feature("autodoc", "Returns the descendant face of <f>. <f> may belong to the original shape or to the 'generated' shape. the returned face may be a null shape (when <f> disappears).

Parameters
----------
F: TopoDS_Face

Returns
-------
TopTools_ListOfShape
") DescendantFace;
		const TopTools_ListOfShape & DescendantFace(const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the algorithm on the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: LocOpe_GeneratedShape

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<LocOpe_GeneratedShape> & G);

		/****************** ResultingShape ******************/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Returns the new shape.

Returns
-------
TopoDS_Shape
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the initial shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

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
		/****************** LocOpe_Gluer ******************/
		%feature("compactdefaultargs") LocOpe_Gluer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_Gluer;
		 LocOpe_Gluer();

		/****************** LocOpe_Gluer ******************/
		%feature("compactdefaultargs") LocOpe_Gluer;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sbase: TopoDS_Shape
Snew: TopoDS_Shape

Returns
-------
None
") LocOpe_Gluer;
		 LocOpe_Gluer(const TopoDS_Shape & Sbase, const TopoDS_Shape & Snew);

		/****************** BasisShape ******************/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") BasisShape;
		const TopoDS_Shape BasisShape();

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
Fnew: TopoDS_Face
Fbase: TopoDS_Face

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Face & Fnew, const TopoDS_Face & Fbase);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
Enew: TopoDS_Edge
Ebase: TopoDS_Edge

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Edge & Enew, const TopoDS_Edge & Ebase);

		/****************** DescendantFaces ******************/
		%feature("compactdefaultargs") DescendantFaces;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
TopTools_ListOfShape
") DescendantFaces;
		const TopTools_ListOfShape & DescendantFaces(const TopoDS_Face & F);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") Edges;
		const TopTools_ListOfShape & Edges();

		/****************** GluedShape ******************/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") GluedShape;
		const TopoDS_Shape GluedShape();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sbase: TopoDS_Shape
Snew: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Snew);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** OpeType ******************/
		%feature("compactdefaultargs") OpeType;
		%feature("autodoc", "No available documentation.

Returns
-------
LocOpe_Operation
") OpeType;
		LocOpe_Operation OpeType();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** ResultingShape ******************/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****************** TgtEdges ******************/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") TgtEdges;
		const TopTools_ListOfShape & TgtEdges();

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
		/****************** LocOpe_LinearForm ******************/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_LinearForm;
		 LocOpe_LinearForm();

		/****************** LocOpe_LinearForm ******************/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Returns
-------
None
") LocOpe_LinearForm;
		 LocOpe_LinearForm(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** LocOpe_LinearForm ******************/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vectra: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Returns
-------
None
") LocOpe_LinearForm;
		 LocOpe_LinearForm(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vectra, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vectra: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vectra, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes(const TopoDS_Shape & S);

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
		/****************** LocOpe_Pipe ******************/
		%feature("compactdefaultargs") LocOpe_Pipe;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape

Returns
-------
None
") LocOpe_Pipe;
		 LocOpe_Pipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Parameters
----------
Spt: TColgp_SequenceOfPnt

Returns
-------
TColGeom_SequenceOfCurve
") Curves;
		const TColGeom_SequenceOfCurve & Curves(const TColgp_SequenceOfPnt & Spt);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Profile ******************/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Profile;
		const TopoDS_Shape Profile();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes(const TopoDS_Shape & S);

		/****************** Spine ******************/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Spine;
		const TopoDS_Shape Spine();

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
		/****************** LocOpe_PntFace ******************/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", "Empty constructor. useful only for the list.

Returns
-------
None
") LocOpe_PntFace;
		 LocOpe_PntFace();

		/****************** LocOpe_PntFace ******************/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
F: TopoDS_Face
Or: TopAbs_Orientation
Param: float
UPar: float
VPar: float

Returns
-------
None
") LocOpe_PntFace;
		 LocOpe_PntFace(const gp_Pnt & P, const TopoDS_Face & F, const TopAbs_Orientation Or, const Standard_Real Param, const Standard_Real UPar, const Standard_Real VPar);

		/****************** ChangeOrientation ******************/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** UParameter ******************/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UParameter;
		Standard_Real UParameter();

		/****************** VParameter ******************/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VParameter;
		Standard_Real VParameter();

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
		/****************** LocOpe_Prism ******************/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_Prism;
		 LocOpe_Prism();

		/****************** LocOpe_Prism ******************/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec

Returns
-------
None
") LocOpe_Prism;
		 LocOpe_Prism(const TopoDS_Shape & Base, const gp_Vec & V);

		/****************** LocOpe_Prism ******************/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vectra: gp_Vec

Returns
-------
None
") LocOpe_Prism;
		 LocOpe_Prism(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vectra);

		/****************** BarycCurve ******************/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Parameters
----------
SCurves: TColGeom_SequenceOfCurve

Returns
-------
None
") Curves;
		void Curves(TColGeom_SequenceOfCurve & SCurves);

		/****************** FirstShape ******************/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** LastShape ******************/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vtra: gp_Vec

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vtra);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Shapes;
		const TopTools_ListOfShape & Shapes(const TopoDS_Shape & S);

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
		/****************** LocOpe_SplitDrafts ******************/
		%feature("compactdefaultargs") LocOpe_SplitDrafts;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts();

		/****************** LocOpe_SplitDrafts ******************/
		%feature("compactdefaultargs") LocOpe_SplitDrafts;
		%feature("autodoc", "Creates the algoritm on the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts(const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the algoritm with the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns <standard_true> if the modification has been succesfully performed.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OriginalShape;
		const TopoDS_Shape OriginalShape();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Splits the face <f> of the former given shape with the wire <w>. the wire is assumed to lie on the face. puts a draft angle on both parts of the wire. <extractg>, <nplg>, <angleg> define the arguments for the left part of the wire. <extractd>, <npld>, <angled> define the arguments for the right part of the wire. the draft angle is measured with the direction <extract>. <npl> defines the neutral plane (points belonging to the neutral plane are not modified). <angle> is the value of the draft angle. if <modifyleft> is set to <standard_false>, no draft angle is applied to the left part of the wire. if <modifyright> is set to <standard_false>,no draft angle is applied to the right part of the wire.

Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire
Extractg: gp_Dir
NPlg: gp_Pln
Angleg: float
Extractd: gp_Dir
NPld: gp_Pln
Angled: float
ModifyLeft: bool,optional
	default value is Standard_True
ModifyRight: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Face & F, const TopoDS_Wire & W, const gp_Dir & Extractg, const gp_Pln & NPlg, const Standard_Real Angleg, const gp_Dir & Extractd, const gp_Pln & NPld, const Standard_Real Angled, const Standard_Boolean ModifyLeft = Standard_True, const Standard_Boolean ModifyRight = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Splits the face <f> of the former given shape with the wire <w>. the wire is assumed to lie on the face. puts a draft angle on the left part of the wire. the draft angle is measured with the direction <extract>. <npl> defines the neutral plane (points belonging to the neutral plane are not modified). <angle> is the value of the draft angle.

Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire
Extract: gp_Dir
NPl: gp_Pln
Angle: float

Returns
-------
None
") Perform;
		void Perform(const TopoDS_Face & F, const TopoDS_Wire & W, const gp_Dir & Extract, const gp_Pln & NPl, const Standard_Real Angle);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the modified shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** ShapesFromShape ******************/
		%feature("compactdefaultargs") ShapesFromShape;
		%feature("autodoc", "Manages the descendant shapes.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") ShapesFromShape;
		const TopTools_ListOfShape & ShapesFromShape(const TopoDS_Shape & S);

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
		/****************** LocOpe_SplitShape ******************/
		%feature("compactdefaultargs") LocOpe_SplitShape;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") LocOpe_SplitShape;
		 LocOpe_SplitShape();

		/****************** LocOpe_SplitShape ******************/
		%feature("compactdefaultargs") LocOpe_SplitShape;
		%feature("autodoc", "Creates the process with the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") LocOpe_SplitShape;
		 LocOpe_SplitShape(const TopoDS_Shape & S);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the vertex <v> on the edge <e>, at parameter <p>.

Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the wire <w> on the face <f>.

Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the list of wires <lwires> on the face <f>.

Parameters
----------
Lwires: TopTools_ListOfShape
F: TopoDS_Face

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopTools_ListOfShape & Lwires, const TopoDS_Face & F);

		/****************** CanSplit ******************/
		%feature("compactdefaultargs") CanSplit;
		%feature("autodoc", "Tests if it is possible to split the edge <e>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") CanSplit;
		Standard_Boolean CanSplit(const TopoDS_Edge & E);

		/****************** DescendantShapes ******************/
		%feature("compactdefaultargs") DescendantShapes;
		%feature("autodoc", "Returns the list of descendant shapes of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes(const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the process on the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** LeftOf ******************/
		%feature("compactdefaultargs") LeftOf;
		%feature("autodoc", "Returns the 'left' part defined by the wire <w> on the face <f>. the returned list of shape is in fact a list of faces. the face <f> is considered with its topological orientation in the original shape. <w> is considered with its orientation.

Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Returns
-------
TopTools_ListOfShape
") LeftOf;
		const TopTools_ListOfShape & LeftOf(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the 'original' shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

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
		/****************** LocOpe_Spliter ******************/
		%feature("compactdefaultargs") LocOpe_Spliter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") LocOpe_Spliter;
		 LocOpe_Spliter();

		/****************** LocOpe_Spliter ******************/
		%feature("compactdefaultargs") LocOpe_Spliter;
		%feature("autodoc", "Creates the algorithm on the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") LocOpe_Spliter;
		 LocOpe_Spliter(const TopoDS_Shape & S);

		/****************** DescendantShapes ******************/
		%feature("compactdefaultargs") DescendantShapes;
		%feature("autodoc", "Returns the list of descendant shapes of <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes(const TopoDS_Shape & S);

		/****************** DirectLeft ******************/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "Returns the faces which are the left of the projected wires and which are.

Returns
-------
TopTools_ListOfShape
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes the algorithm on the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Left ******************/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "Returns the faces of the 'left' part on the shape. (it is build from directleft, with the faces connected to this set, and so on...).

Returns
-------
TopTools_ListOfShape
") Left;
		const TopTools_ListOfShape & Left();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
PW: LocOpe_WiresOnShape

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** ResultingShape ******************/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Returns the new shape.

Returns
-------
TopoDS_Shape
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the initial shape.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

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
		/****************** LocOpe_WiresOnShape ******************/
		%feature("compactdefaultargs") LocOpe_WiresOnShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") LocOpe_WiresOnShape;
		 LocOpe_WiresOnShape(const TopoDS_Shape & S);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add splitting edges or wires for whole initial shape withot additional specification edge->face, edge->edge this method puts edge on the corresponding faces from initial shape.

Parameters
----------
theEdges: TopTools_SequenceOfShape

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopTools_SequenceOfShape & theEdges);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
Comp: TopoDS_Compound
F: TopoDS_Face

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Compound & Comp, const TopoDS_Face & F);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "No available documentation.

Parameters
----------
EfromW: TopoDS_Edge
EonFace: TopoDS_Edge

Returns
-------
None
") Bind;
		void Bind(const TopoDS_Edge & EfromW, const TopoDS_Edge & EonFace);

		/****************** BindAll ******************/
		%feature("compactdefaultargs") BindAll;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BindAll;
		void BindAll();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		TopoDS_Edge Edge();

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

		/****************** InitEdgeIterator ******************/
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitEdgeIterator;
		void InitEdgeIterator();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsFaceWithSection ******************/
		%feature("compactdefaultargs") IsFaceWithSection;
		%feature("autodoc", "Tells is the face to be split by section or not.

Parameters
----------
aFace: TopoDS_Shape

Returns
-------
bool
") IsFaceWithSection;
		Standard_Boolean IsFaceWithSection(const TopoDS_Shape & aFace);

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** OnEdge ******************/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "If the current edge is projected on an edge, returns <standard_true> and sets the value of <e>. otherwise, returns <standard_false>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") OnEdge;
		Standard_Boolean OnEdge(TopoDS_Edge & E);

		/****************** OnEdge ******************/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "If the vertex <v> lies on an edge of the original shape, returns <standard_true> and sets the concerned edge in <e>, and the parameter on the edge in <p>. else returns <standard_false>.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
P: float
") OnEdge;
		Standard_Boolean OnEdge(const TopoDS_Vertex & V, TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** OnEdge ******************/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "If the vertex <v> lies on an edge of the original shape, returns <standard_true> and sets the concerned edge in <e>, and the parameter on the edge in <p>. else returns <standard_false>.

Parameters
----------
V: TopoDS_Vertex
EdgeFrom: TopoDS_Edge
E: TopoDS_Edge

Returns
-------
P: float
") OnEdge;
		Standard_Boolean OnEdge(const TopoDS_Vertex & V, const TopoDS_Edge & EdgeFrom, TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** OnFace ******************/
		%feature("compactdefaultargs") OnFace;
		%feature("autodoc", "Returns the face of the shape on which the current edge is projected.

Returns
-------
TopoDS_Face
") OnFace;
		TopoDS_Face OnFace();

		/****************** OnVertex ******************/
		%feature("compactdefaultargs") OnVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Vwire: TopoDS_Vertex
Vshape: TopoDS_Vertex

Returns
-------
bool
") OnVertex;
		Standard_Boolean OnVertex(const TopoDS_Vertex & Vwire, TopoDS_Vertex & Vshape);

		/****************** SetCheckInterior ******************/
		%feature("compactdefaultargs") SetCheckInterior;
		%feature("autodoc", "Set the flag of check internal intersections default value is true (to check).

Parameters
----------
ToCheckInterior: bool

Returns
-------
None
") SetCheckInterior;
		void SetCheckInterior(const Standard_Boolean ToCheckInterior);

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
		/****************** LocOpe_GluedShape ******************/
		%feature("compactdefaultargs") LocOpe_GluedShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LocOpe_GluedShape;
		 LocOpe_GluedShape();

		/****************** LocOpe_GluedShape ******************/
		%feature("compactdefaultargs") LocOpe_GluedShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") LocOpe_GluedShape;
		 LocOpe_GluedShape(const TopoDS_Shape & S);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the edge created by the vertex <v>. if none, must return a null shape.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
TopoDS_Edge
") Generated;
		TopoDS_Edge Generated(const TopoDS_Vertex & V);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the face created by the edge <e>. if none, must return a null shape.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Face
") Generated;
		TopoDS_Face Generated(const TopoDS_Edge & E);

		/****************** GeneratingEdges ******************/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") GeneratingEdges;
		const TopTools_ListOfShape & GeneratingEdges();

		/****************** GlueOnFace ******************/
		%feature("compactdefaultargs") GlueOnFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") GlueOnFace;
		void GlueOnFace(const TopoDS_Face & F);

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

		/****************** OrientedFaces ******************/
		%feature("compactdefaultargs") OrientedFaces;
		%feature("autodoc", "Returns the list of correctly oriented generated faces.

Returns
-------
TopTools_ListOfShape
") OrientedFaces;
		const TopTools_ListOfShape & OrientedFaces();

};


%make_alias(LocOpe_GluedShape)

%extend LocOpe_GluedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class LocOpe_Revol:
	pass

@classnotwrapped
class LocOpe_RevolutionForm:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
