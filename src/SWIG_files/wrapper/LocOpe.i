/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_locope.html"
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
%include ../common/EnumTemplates.i
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

/* python proxy classes for enums */
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

%extend NCollection_Sequence<gp_Circ> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(LocOpe_SequenceOfLin) NCollection_Sequence<gp_Lin>;

%extend NCollection_Sequence<gp_Lin> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(LocOpe_SequenceOfPntFace) NCollection_Sequence<LocOpe_PntFace>;

%extend NCollection_Sequence<LocOpe_PntFace> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: fbb157484e330feceec7d488110ae1e4 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
OnF: TopoDS_Face

Return
-------
bool

Description
-----------
Returns standard_true when the wire <w> is closed on the face <onf>.
") Closed;
		static Standard_Boolean Closed(const TopoDS_Wire & W, const TopoDS_Face & OnF);

		/****************** Closed ******************/
		/**** md5 signature: 2669c9687e0732c0038f16d1daf4d6a2 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
OnF: TopoDS_Face

Return
-------
bool

Description
-----------
Returns standard_true when the edge <e> is closed on the face <onf>.
") Closed;
		static Standard_Boolean Closed(const TopoDS_Edge & E, const TopoDS_Face & OnF);

		/****************** SampleEdges ******************/
		/**** md5 signature: f1154ae22c369e9497c31a5a83612489 ****/
		%feature("compactdefaultargs") SampleEdges;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Pt: TColgp_SequenceOfPnt

Return
-------
None

Description
-----------
No available documentation.
") SampleEdges;
		static void SampleEdges(const TopoDS_Shape & S, TColgp_SequenceOfPnt & Pt);

		/****************** TgtFaces ******************/
		/**** md5 signature: c906e89846aea6959f05edaa2974e4bd ****/
		%feature("compactdefaultargs") TgtFaces;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
bool

Description
-----------
Returns standard_true when the faces are tangent.
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
		/**** md5 signature: 8dd41df5d2d189082377958dc7871414 ****/
		%feature("compactdefaultargs") LocOpe_BuildShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_BuildShape;
		 LocOpe_BuildShape();

		/****************** LocOpe_BuildShape ******************/
		/**** md5 signature: 292d904c875e5cb94eb3da4e102f5625 ****/
		%feature("compactdefaultargs") LocOpe_BuildShape;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
Builds shape(s) from the list <l>. uses only the faces of <l>.
") LocOpe_BuildShape;
		 LocOpe_BuildShape(const TopTools_ListOfShape & L);

		/****************** Perform ******************/
		/**** md5 signature: aef5bdb5986ea65197c9e51e771dc9fa ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape

Return
-------
None

Description
-----------
Builds shape(s) from the list <l>. uses only the faces of <l>.
") Perform;
		void Perform(const TopTools_ListOfShape & L);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/**** md5 signature: 9812afc6b98a2ea5f11fc59245706b54 ****/
		%feature("compactdefaultargs") LocOpe_BuildWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_BuildWires;
		 LocOpe_BuildWires();

		/****************** LocOpe_BuildWires ******************/
		/**** md5 signature: c84cb440017a86449afe8570398493c3 ****/
		%feature("compactdefaultargs") LocOpe_BuildWires;
		%feature("autodoc", "
Parameters
----------
Ledges: TopTools_ListOfShape
PW: LocOpe_WiresOnShape

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_BuildWires;
		 LocOpe_BuildWires(const TopTools_ListOfShape & Ledges, const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: 614ea950b6600d6429bebd9def612a4e ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Ledges: TopTools_ListOfShape
PW: LocOpe_WiresOnShape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopTools_ListOfShape & Ledges, const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** Result ******************/
		/**** md5 signature: 681704f874a846c02474e624abdd199e ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
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
		/**** md5 signature: b42d043d62be9605a2626066ea0010ac ****/
		%feature("compactdefaultargs") LocOpe_CSIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector();

		/****************** LocOpe_CSIntersector ******************/
		/**** md5 signature: 528908f4d87c8037893eb5fddfa6d9b6 ****/
		%feature("compactdefaultargs") LocOpe_CSIntersector;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates and performs the intersection betwwen <ax1> and <s>.
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector(const TopoDS_Shape & S);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
Performs the intersection between <ax1 and <s>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <standard_true> if the intersection has been done.
") IsDone;
		Standard_Boolean IsDone();

		/****************** LocalizeAfter ******************/
		/**** md5 signature: 0c047f3521a889ad3beace61675cb16c ****/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
I: int
From: float
Tol: float
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
On the element of range <i>, searches the first intersection point located after the parameter <from>, which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Integer I, const Standard_Real From, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeAfter ******************/
		/**** md5 signature: d56de202f543156481760d3d927eea66 ****/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
I: int
FromInd: int
Tol: float
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
On the element of range <i>, searches the first intersection point located after the index <fromind> ( >= fromind + 1), which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Integer I, const Standard_Integer FromInd, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		/**** md5 signature: 5b2b6de66ba5a81aeee8506f68cfc270 ****/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
I: int
From: float
Tol: float
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
On the element of range <i>, searches the first intersection point located before the parameter <from>, which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Integer I, const Standard_Real From, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		/**** md5 signature: 89f05e176ad1cd9828188d9a6ada9149 ****/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
I: int
FromInd: int
Tol: float
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
On the element of range <i>, searches the first intersection point located before the index <fromind> ( <= fromind -1), which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). <tol> is used to determine if 2 parameters are equal. //! otherwise, returns <standard_false>.
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Integer I, const Standard_Integer FromInd, const Standard_Real Tol, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NbPoints ******************/
		/**** md5 signature: 8d71e01fa7b21bd925ab1ef4bd70145e ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
Returns the number of intersection point on the element of range <i>.
") NbPoints;
		Standard_Integer NbPoints(const Standard_Integer I);

		/****************** Perform ******************/
		/**** md5 signature: 54d68fc86781272bd4fc9950f77e7f8f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Slin: LocOpe_SequenceOfLin

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const LocOpe_SequenceOfLin & Slin);

		/****************** Perform ******************/
		/**** md5 signature: 1e965e9e0424adbdc49d9f0eb8d86799 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Scir: LocOpe_SequenceOfCirc

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const LocOpe_SequenceOfCirc & Scir);

		/****************** Perform ******************/
		/**** md5 signature: bcd495517b0442eb41ba4df47bb16c1e ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Scur: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TColGeom_SequenceOfCurve & Scur);

		/****************** Point ******************/
		/**** md5 signature: be9b7393a058f951546484423e8f5511 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
I: int
Index: int

Return
-------
LocOpe_PntFace

Description
-----------
Returns the intersection point of range <index> on element of range <i>. the points are sorted in increasing order of parameter along the axis.
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
		/**** md5 signature: 79716c9553c555c74b58e68e1e02e261 ****/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector();

		/****************** LocOpe_CurveShapeIntersector ******************/
		/**** md5 signature: f0bbac54a186320b9d69477b598785d3 ****/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates and performs the intersection betwwen <ax1> and <s>.
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector(const gp_Ax1 & Axis, const TopoDS_Shape & S);

		/****************** LocOpe_CurveShapeIntersector ******************/
		/**** md5 signature: 0f01941a5b28c6315842dbc1b736ac7d ****/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates and performs yte intersection betwwen <c> and <s>.
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector(const gp_Circ & C, const TopoDS_Shape & S);

		/****************** Init ******************/
		/**** md5 signature: fa661d710d2a3307cee68a20ae303ad7 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Axis: gp_Ax1
S: TopoDS_Shape

Return
-------
None

Description
-----------
Performs the intersection between <ax1 and <s>.
") Init;
		void Init(const gp_Ax1 & Axis, const TopoDS_Shape & S);

		/****************** Init ******************/
		/**** md5 signature: 7526852bc0774e00733050f764740799 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: TopoDS_Shape

Return
-------
None

Description
-----------
Performs the intersection between <ax1 and <s>.
") Init;
		void Init(const gp_Circ & C, const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <standard_true> if the intersection has been done.
") IsDone;
		Standard_Boolean IsDone();

		/****************** LocalizeAfter ******************/
		/**** md5 signature: db4c67a77f192de37c747de6a6aed7d3 ****/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
From: float
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located after the parameter <from>, which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). //! otherwise, returns <standard_false>.
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Real From, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeAfter ******************/
		/**** md5 signature: dc5b7987079415874eaa183c6149c405 ****/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
FromInd: int
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located after the index <fromind> ( >= fromind + 1), which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point. (indfrom <= indto). //! otherwise, returns <standard_false>.
") LocalizeAfter;
		Standard_Boolean LocalizeAfter(const Standard_Integer FromInd, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		/**** md5 signature: fbf6caaf11561e5474c6e8bcbfa6392a ****/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
From: float
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located before the parameter <from>, which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). //! otherwise, returns <standard_false>.
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Real From, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** LocalizeBefore ******************/
		/**** md5 signature: 977b8e8fd7ae8fde8152e2d971922b09 ****/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
FromInd: int
Or: TopAbs_Orientation

Return
-------
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located before the index <fromind> ( <= fromind -1), which orientation is not topabs_external. if found, returns <standard_true>. <or> contains the orientation of the point, <indfrom> and <indto> represents the interval of index in the sequence of intersection point corresponding to the point (indfrom <= indto). //! otherwise, returns <standard_false>.
") LocalizeBefore;
		Standard_Boolean LocalizeBefore(const Standard_Integer FromInd, TopAbs_Orientation & Or, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection point.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		/**** md5 signature: 18d4bf115bf073ea4a2498ffabdab770 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
LocOpe_PntFace

Description
-----------
Returns the intersection point of range <index>. the points are sorted in increasing order of parameter along the axis.
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
		/**** md5 signature: 58c05f5bb67aae28e1d395cddb81eb58 ****/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Height1: float
Height2: float
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_DPrism;
		 LocOpe_DPrism(const TopoDS_Face & Spine, const Standard_Real Height1, const Standard_Real Height2, const Standard_Real Angle);

		/****************** LocOpe_DPrism ******************/
		/**** md5 signature: 94b73c39f3776b4d086b62f127b6771e ****/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Height: float
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_DPrism;
		 LocOpe_DPrism(const TopoDS_Face & Spine, const Standard_Real Height, const Standard_Real Angle);

		/****************** BarycCurve ******************/
		/**** md5 signature: 84f06532e4d5bbe2363bba52b4d91200 ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		/**** md5 signature: 3cd8ae8d636ea132b7feab04844c473e ****/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
SCurves: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(TColGeom_SequenceOfCurve & SCurves);

		/****************** FirstShape ******************/
		/**** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** LastShape ******************/
		/**** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Profile ******************/
		/**** md5 signature: 79a7d86b74870c796d2c753c300c851a ****/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Profile;
		const TopoDS_Shape Profile();

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		/**** md5 signature: e20f60f3e506bce7024d0d1d17884dc7 ****/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Shapes;
		const TopTools_ListOfShape & Shapes(const TopoDS_Shape & S);

		/****************** Spine ******************/
		/**** md5 signature: f6ea6e7c5910a000caa86ed2eb47e3d7 ****/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/**** md5 signature: 2aabbf199c65a9c397778a66d5c9a9ed ****/
		%feature("compactdefaultargs") LocOpe_FindEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_FindEdges;
		 LocOpe_FindEdges();

		/****************** LocOpe_FindEdges ******************/
		/**** md5 signature: 926297f5f09fdac32f43dd8c93f04a66 ****/
		%feature("compactdefaultargs") LocOpe_FindEdges;
		%feature("autodoc", "
Parameters
----------
FFrom: TopoDS_Shape
FTo: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_FindEdges;
		 LocOpe_FindEdges(const TopoDS_Shape & FFrom, const TopoDS_Shape & FTo);

		/****************** EdgeFrom ******************/
		/**** md5 signature: d67fb24f8f01d4f4943b8189789b8869 ****/
		%feature("compactdefaultargs") EdgeFrom;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") EdgeFrom;
		const TopoDS_Edge EdgeFrom();

		/****************** EdgeTo ******************/
		/**** md5 signature: 82b67b5e3be114aa1489723da8cf608c ****/
		%feature("compactdefaultargs") EdgeTo;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") EdgeTo;
		const TopoDS_Edge EdgeTo();

		/****************** InitIterator ******************/
		/**** md5 signature: 5552a2067807727af1920ceee666514b ****/
		%feature("compactdefaultargs") InitIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitIterator;
		void InitIterator();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Set ******************/
		/**** md5 signature: 06445e9f8663fe183c61def934056826 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
FFrom: TopoDS_Shape
FTo: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
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
		/**** md5 signature: fc261ecc2b140d01256f9ee6e03dac78 ****/
		%feature("compactdefaultargs") LocOpe_FindEdgesInFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace();

		/****************** LocOpe_FindEdgesInFace ******************/
		/**** md5 signature: 69c50a173fa5d37fb3c95f1ae6c3830f ****/
		%feature("compactdefaultargs") LocOpe_FindEdgesInFace;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace(const TopoDS_Shape & S, const TopoDS_Face & F);

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Set ******************/
		/**** md5 signature: e65bb5dffb39ffb1d29dff808d2177ab ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
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
		/**** md5 signature: 499008311e503e8516f37a26ae20c6c4 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
TopoDS_Edge

Description
-----------
Returns the edge created by the vertex <v>. if none, must return a null shape.
") Generated;
		virtual TopoDS_Edge Generated(const TopoDS_Vertex & V);

		/****************** Generated ******************/
		/**** md5 signature: 30ecec4c451f58e7e0a04f78911dab04 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopoDS_Face

Description
-----------
Returns the face created by the edge <e>. if none, must return a null shape.
") Generated;
		virtual TopoDS_Face Generated(const TopoDS_Edge & E);

		/****************** GeneratingEdges ******************/
		/**** md5 signature: 86d79bf42e19a8928d504fa3eb0518fb ****/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") GeneratingEdges;
		virtual const TopTools_ListOfShape & GeneratingEdges();

		/****************** OrientedFaces ******************/
		/**** md5 signature: 4ac50ba921eaec682bb022c4c72c3f73 ****/
		%feature("compactdefaultargs") OrientedFaces;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of correctly oriented generated faces.
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
		/**** md5 signature: 948058747d455e5f0c5b2e0628c56a2d ****/
		%feature("compactdefaultargs") LocOpe_Generator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_Generator;
		 LocOpe_Generator();

		/****************** LocOpe_Generator ******************/
		/**** md5 signature: aa41bd692fb2610b5eda9bca247a2030 ****/
		%feature("compactdefaultargs") LocOpe_Generator;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates the algorithm on the shape <s>.
") LocOpe_Generator;
		 LocOpe_Generator(const TopoDS_Shape & S);

		/****************** DescendantFace ******************/
		/**** md5 signature: 30ca8cffd4d1287532f4a07b95211e9e ****/
		%feature("compactdefaultargs") DescendantFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the descendant face of <f>. <f> may belong to the original shape or to the 'generated' shape. the returned face may be a null shape (when <f> disappears).
") DescendantFace;
		const TopTools_ListOfShape & DescendantFace(const TopoDS_Face & F);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
Initializes the algorithm on the shape <s>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: fcb599904c10f6cd1e4c4ba45080c4f5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
G: LocOpe_GeneratedShape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<LocOpe_GeneratedShape> & G);

		/****************** ResultingShape ******************/
		/**** md5 signature: d353819ad888f0057399e1c340ff17c9 ****/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the new shape.
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the initial shape.
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
		/**** md5 signature: 8d004d184b4ac56fa133912528743e6b ****/
		%feature("compactdefaultargs") LocOpe_Gluer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Gluer;
		 LocOpe_Gluer();

		/****************** LocOpe_Gluer ******************/
		/**** md5 signature: b7ad7b234e8182c2dec192f5af1f475b ****/
		%feature("compactdefaultargs") LocOpe_Gluer;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Snew: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Gluer;
		 LocOpe_Gluer(const TopoDS_Shape & Sbase, const TopoDS_Shape & Snew);

		/****************** BasisShape ******************/
		/**** md5 signature: 21cd65d6b80cb61a9e13e787117a65b0 ****/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") BasisShape;
		const TopoDS_Shape BasisShape();

		/****************** Bind ******************/
		/**** md5 signature: 00651bec56a12d0418e54d774f302230 ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
Fnew: TopoDS_Face
Fbase: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const TopoDS_Face & Fnew, const TopoDS_Face & Fbase);

		/****************** Bind ******************/
		/**** md5 signature: 3016e09a55c1e17b8452fe31e36138db ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
Enew: TopoDS_Edge
Ebase: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const TopoDS_Edge & Enew, const TopoDS_Edge & Ebase);

		/****************** DescendantFaces ******************/
		/**** md5 signature: c46a5914c3b94b6137edf6b04681854b ****/
		%feature("compactdefaultargs") DescendantFaces;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") DescendantFaces;
		const TopTools_ListOfShape & DescendantFaces(const TopoDS_Face & F);

		/****************** Edges ******************/
		/**** md5 signature: 12cb468babe503b836d4bfcfd0341963 ****/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Edges;
		const TopTools_ListOfShape & Edges();

		/****************** GluedShape ******************/
		/**** md5 signature: cc05062c19ffec36edea50e2f74757fb ****/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") GluedShape;
		const TopoDS_Shape GluedShape();

		/****************** Init ******************/
		/**** md5 signature: 72f1171950e222f265d5fc22bf237f99 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Sbase: TopoDS_Shape
Snew: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & Sbase, const TopoDS_Shape & Snew);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** OpeType ******************/
		/**** md5 signature: 6301740c99fde6f602c33a48a205b637 ****/
		%feature("compactdefaultargs") OpeType;
		%feature("autodoc", "Return
-------
LocOpe_Operation

Description
-----------
No available documentation.
") OpeType;
		LocOpe_Operation OpeType();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****************** ResultingShape ******************/
		/**** md5 signature: d353819ad888f0057399e1c340ff17c9 ****/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****************** TgtEdges ******************/
		/**** md5 signature: 2c3d33bfb9d502b29d86c6dafd2350e0 ****/
		%feature("compactdefaultargs") TgtEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
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
		/**** md5 signature: 84355a6c132af777b54b38335d4d0d37 ****/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_LinearForm;
		 LocOpe_LinearForm();

		/****************** LocOpe_LinearForm ******************/
		/**** md5 signature: 0cc2b502e1ca94867393f9b11cb1665f ****/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_LinearForm;
		 LocOpe_LinearForm(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** LocOpe_LinearForm ******************/
		/**** md5 signature: f648af9b5cabdac90e62be23c609968b ****/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vectra: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_LinearForm;
		 LocOpe_LinearForm(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vectra, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** FirstShape ******************/
		/**** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** LastShape ******************/
		/**** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Perform ******************/
		/**** md5 signature: b20133613d92cb4f26a0a5a9de52faf6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** Perform ******************/
		/**** md5 signature: e22108117c43d85d2e9af3b412510f28 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vectra: gp_Vec
Pnt1: gp_Pnt
Pnt2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vectra, const gp_Pnt & Pnt1, const gp_Pnt & Pnt2);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		/**** md5 signature: e20f60f3e506bce7024d0d1d17884dc7 ****/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
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
		/**** md5 signature: 887fa4a5bc369f1b6ad85686839f090f ****/
		%feature("compactdefaultargs") LocOpe_Pipe;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Wire
Profile: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Pipe;
		 LocOpe_Pipe(const TopoDS_Wire & Spine, const TopoDS_Shape & Profile);

		/****************** BarycCurve ******************/
		/**** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		/**** md5 signature: 1257c66269c3591394f3b4e0a9f964c4 ****/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
Spt: TColgp_SequenceOfPnt

Return
-------
TColGeom_SequenceOfCurve

Description
-----------
No available documentation.
") Curves;
		const TColGeom_SequenceOfCurve & Curves(const TColgp_SequenceOfPnt & Spt);

		/****************** FirstShape ******************/
		/**** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** LastShape ******************/
		/**** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Profile ******************/
		/**** md5 signature: 79a7d86b74870c796d2c753c300c851a ****/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Profile;
		const TopoDS_Shape Profile();

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		/**** md5 signature: 78f7811a365f84338b71e3baefa770bd ****/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Shapes;
		const TopTools_ListOfShape & Shapes(const TopoDS_Shape & S);

		/****************** Spine ******************/
		/**** md5 signature: f6ea6e7c5910a000caa86ed2eb47e3d7 ****/
		%feature("compactdefaultargs") Spine;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
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
		/**** md5 signature: c684a8bde8adce128427067674a86331 ****/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor. useful only for the list.
") LocOpe_PntFace;
		 LocOpe_PntFace();

		/****************** LocOpe_PntFace ******************/
		/**** md5 signature: ea86175f30e9af52a111a51286aaae17 ****/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
F: TopoDS_Face
Or: TopAbs_Orientation
Param: float
UPar: float
VPar: float

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_PntFace;
		 LocOpe_PntFace(const gp_Pnt & P, const TopoDS_Face & F, const TopAbs_Orientation Or, const Standard_Real Param, const Standard_Real UPar, const Standard_Real VPar);

		/****************** ChangeOrientation ******************/
		/**** md5 signature: 395518e4d56710f4afb539b195cfdc3c ****/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") ChangeOrientation;
		TopAbs_Orientation & ChangeOrientation();

		/****************** Face ******************/
		/**** md5 signature: 95406b8d0d556c0537e0768c48713f21 ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****************** Orientation ******************/
		/**** md5 signature: 03010048da537511bfd11160d3c898dc ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Parameter ******************/
		/**** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** Pnt ******************/
		/**** md5 signature: cb508877c7fa83c676a7983e5eeb1a5e ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Pnt;
		const gp_Pnt Pnt();

		/****************** UParameter ******************/
		/**** md5 signature: 2cfa7266169b92bb41b1ad8de865ac2d ****/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") UParameter;
		Standard_Real UParameter();

		/****************** VParameter ******************/
		/**** md5 signature: 67c421cab90e3dfea268bc11f638dc72 ****/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/**** md5 signature: 3bcd2249739c6dc14064bb1b62a023f6 ****/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Prism;
		 LocOpe_Prism();

		/****************** LocOpe_Prism ******************/
		/**** md5 signature: e088e36fa8d0883a214fc221ddbe2de9 ****/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Prism;
		 LocOpe_Prism(const TopoDS_Shape & Base, const gp_Vec & V);

		/****************** LocOpe_Prism ******************/
		/**** md5 signature: 0dbcb11e8cca8b8bed826edc59571630 ****/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vectra: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Prism;
		 LocOpe_Prism(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vectra);

		/****************** BarycCurve ******************/
		/**** md5 signature: 84f06532e4d5bbe2363bba52b4d91200 ****/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****************** Curves ******************/
		/**** md5 signature: 3cd8ae8d636ea132b7feab04844c473e ****/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "
Parameters
----------
SCurves: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Curves;
		void Curves(TColGeom_SequenceOfCurve & SCurves);

		/****************** FirstShape ******************/
		/**** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ****/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****************** LastShape ******************/
		/**** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ****/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****************** Perform ******************/
		/**** md5 signature: 73df62c2a421a7786212748e22f19d32 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V);

		/****************** Perform ******************/
		/**** md5 signature: 0f8aac93e43970f9e58cac57ca386d55 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Base: TopoDS_Shape
V: gp_Vec
Vtra: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const TopoDS_Shape & Base, const gp_Vec & V, const gp_Vec & Vtra);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shapes ******************/
		/**** md5 signature: e20f60f3e506bce7024d0d1d17884dc7 ****/
		%feature("compactdefaultargs") Shapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
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
		/**** md5 signature: 2ee8be10ba301fc967707fa630016f82 ****/
		%feature("compactdefaultargs") LocOpe_SplitDrafts;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts();

		/****************** LocOpe_SplitDrafts ******************/
		/**** md5 signature: e2701639f1b17ae18c73bfdf74b775be ****/
		%feature("compactdefaultargs") LocOpe_SplitDrafts;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates the algorithm on the shape <s>.
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts(const TopoDS_Shape & S);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
Initializes the algorithm with the shape <s>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: e385477ab1bec806154173d4a550fd68 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <standard_true> if the modification has been successfully performed.
") IsDone;
		Standard_Boolean IsDone();

		/****************** OriginalShape ******************/
		/**** md5 signature: 0c1425ae3411e433ee33975a98ab8edc ****/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") OriginalShape;
		const TopoDS_Shape OriginalShape();

		/****************** Perform ******************/
		/**** md5 signature: 06049251e5058c5d93cb1e4c850648e3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
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
ModifyLeft: bool (optional, default to Standard_True)
ModifyRight: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Splits the face <f> of the former given shape with the wire <w>. the wire is assumed to lie on the face. puts a draft angle on both parts of the wire. <extractg>, <nplg>, <angleg> define the arguments for the left part of the wire. <extractd>, <npld>, <angled> define the arguments for the right part of the wire. the draft angle is measured with the direction <extract>. <npl> defines the neutral plane (points belonging to the neutral plane are not modified). <angle> is the value of the draft angle. if <modifyleft> is set to <standard_false>, no draft angle is applied to the left part of the wire. if <modifyright> is set to <standard_false>,no draft angle is applied to the right part of the wire.
") Perform;
		void Perform(const TopoDS_Face & F, const TopoDS_Wire & W, const gp_Dir & Extractg, const gp_Pln & NPlg, const Standard_Real Angleg, const gp_Dir & Extractd, const gp_Pln & NPld, const Standard_Real Angled, const Standard_Boolean ModifyLeft = Standard_True, const Standard_Boolean ModifyRight = Standard_True);

		/****************** Perform ******************/
		/**** md5 signature: 33119ee8fef1a08344058cd4112ff127 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire
Extract: gp_Dir
NPl: gp_Pln
Angle: float

Return
-------
None

Description
-----------
Splits the face <f> of the former given shape with the wire <w>. the wire is assumed to lie on the face. puts a draft angle on the left part of the wire. the draft angle is measured with the direction <extract>. <npl> defines the neutral plane (points belonging to the neutral plane are not modified). <angle> is the value of the draft angle.
") Perform;
		void Perform(const TopoDS_Face & F, const TopoDS_Wire & W, const gp_Dir & Extract, const gp_Pln & NPl, const Standard_Real Angle);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape.
") Shape;
		const TopoDS_Shape Shape();

		/****************** ShapesFromShape ******************/
		/**** md5 signature: 9b19997d48fe09caab448d7d2a15b8e6 ****/
		%feature("compactdefaultargs") ShapesFromShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Manages the descendant shapes.
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
		/**** md5 signature: 35b01b43000dd405f998f499e4073bea ****/
		%feature("compactdefaultargs") LocOpe_SplitShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_SplitShape;
		 LocOpe_SplitShape();

		/****************** LocOpe_SplitShape ******************/
		/**** md5 signature: 30c3ad05a3b430b95f83235181d90a75 ****/
		%feature("compactdefaultargs") LocOpe_SplitShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates the process with the shape <s>.
") LocOpe_SplitShape;
		 LocOpe_SplitShape(const TopoDS_Shape & S);

		/****************** Add ******************/
		/**** md5 signature: f83a740d583d75ef073857245678fcf7 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds the vertex <v> on the edge <e>, at parameter <p>.
") Add;
		void Add(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E);

		/****************** Add ******************/
		/**** md5 signature: a033629ccbdbc371707d5c76ce6135fb ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Return
-------
bool

Description
-----------
Adds the wire <w> on the face <f>.
") Add;
		Standard_Boolean Add(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Add ******************/
		/**** md5 signature: 53f90a2127879e94c7efb239b955201f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Lwires: TopTools_ListOfShape
F: TopoDS_Face

Return
-------
bool

Description
-----------
Adds the list of wires <lwires> on the face <f>.
") Add;
		Standard_Boolean Add(const TopTools_ListOfShape & Lwires, const TopoDS_Face & F);

		/****************** CanSplit ******************/
		/**** md5 signature: 4e905e4aa3dc0a3d213d1c78ecb29068 ****/
		%feature("compactdefaultargs") CanSplit;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Tests if it is possible to split the edge <e>.
") CanSplit;
		Standard_Boolean CanSplit(const TopoDS_Edge & E);

		/****************** DescendantShapes ******************/
		/**** md5 signature: b55237191d8494fe72efd8032d9163b8 ****/
		%feature("compactdefaultargs") DescendantShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of descendant shapes of <s>.
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes(const TopoDS_Shape & S);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
Initializes the process on the shape <s>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** LeftOf ******************/
		/**** md5 signature: b7631372eb087b6699b45ed9bbbe5ca6 ****/
		%feature("compactdefaultargs") LeftOf;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the 'left' part defined by the wire <w> on the face <f>. the returned list of shape is in fact a list of faces. the face <f> is considered with its topological orientation in the original shape. <w> is considered with its orientation.
") LeftOf;
		const TopTools_ListOfShape & LeftOf(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the 'original' shape.
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
		/**** md5 signature: 8cf5ce859db05a3d705a995c8f4c99f1 ****/
		%feature("compactdefaultargs") LocOpe_Spliter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_Spliter;
		 LocOpe_Spliter();

		/****************** LocOpe_Spliter ******************/
		/**** md5 signature: 0346ab3981532042dc46d5d22befb541 ****/
		%feature("compactdefaultargs") LocOpe_Spliter;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
Creates the algorithm on the shape <s>.
") LocOpe_Spliter;
		 LocOpe_Spliter(const TopoDS_Shape & S);

		/****************** DescendantShapes ******************/
		/**** md5 signature: b55237191d8494fe72efd8032d9163b8 ****/
		%feature("compactdefaultargs") DescendantShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of descendant shapes of <s>.
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes(const TopoDS_Shape & S);

		/****************** DirectLeft ******************/
		/**** md5 signature: 3439933aeda7f1a1ec21dfaafbe0ab1a ****/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces which are the left of the projected wires and which are.
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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
Initializes the algorithm on the shape <s>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Left ******************/
		/**** md5 signature: 70ee7865256185190dd6eecfb1fc40f8 ****/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces of the 'left' part on the shape. (it is build from directleft, with the faces connected to this set, and so on...).
") Left;
		const TopTools_ListOfShape & Left();

		/****************** Perform ******************/
		/**** md5 signature: 81f184fa3b695b3f713141fe6156b7b1 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
PW: LocOpe_WiresOnShape

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<LocOpe_WiresOnShape> & PW);

		/****************** ResultingShape ******************/
		/**** md5 signature: d353819ad888f0057399e1c340ff17c9 ****/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the new shape.
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the initial shape.
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
		/**** md5 signature: 09ac373b07724e32dd0fa06274b01b27 ****/
		%feature("compactdefaultargs") LocOpe_WiresOnShape;
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
") LocOpe_WiresOnShape;
		 LocOpe_WiresOnShape(const TopoDS_Shape & S);

		/****************** Add ******************/
		/**** md5 signature: a2f8855eb9d20716f921d30ba939fd6a ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theEdges: TopTools_SequenceOfShape

Return
-------
bool

Description
-----------
Add splitting edges or wires for whole initial shape without additional specification edge->face, edge->edge this method puts edge on the corresponding faces from initial shape.
") Add;
		Standard_Boolean Add(const TopTools_SequenceOfShape & theEdges);

		/****************** Bind ******************/
		/**** md5 signature: 4b8d37767a759e53f1ff5474f2d75938 ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****************** Bind ******************/
		/**** md5 signature: 00e02bd2b6d7fb5ecab8b6a06bcf0404 ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
Comp: TopoDS_Compound
F: TopoDS_Face

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const TopoDS_Compound & Comp, const TopoDS_Face & F);

		/****************** Bind ******************/
		/**** md5 signature: a26a4a4b0f2806f01ffb5421e1847703 ****/
		%feature("compactdefaultargs") Bind;
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
") Bind;
		void Bind(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Bind ******************/
		/**** md5 signature: 207c01ec90c87c143bfc25038aabb965 ****/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "
Parameters
----------
EfromW: TopoDS_Edge
EonFace: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") Bind;
		void Bind(const TopoDS_Edge & EfromW, const TopoDS_Edge & EonFace);

		/****************** BindAll ******************/
		/**** md5 signature: 2ecc085aa904d51ca25040bdea9d8415 ****/
		%feature("compactdefaultargs") BindAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BindAll;
		void BindAll();

		/****************** Edge ******************/
		/**** md5 signature: 6daa50e42e357ab838ace460a01de4f9 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		TopoDS_Edge Edge();

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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

		/****************** InitEdgeIterator ******************/
		/**** md5 signature: 33903e2afb34dc5222bb42326d13a964 ****/
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdgeIterator;
		void InitEdgeIterator();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsFaceWithSection ******************/
		/**** md5 signature: 453c46f0c0bbd0df89a249832f09337b ****/
		%feature("compactdefaultargs") IsFaceWithSection;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Shape

Return
-------
bool

Description
-----------
Tells is the face to be split by section or not.
") IsFaceWithSection;
		Standard_Boolean IsFaceWithSection(const TopoDS_Shape & aFace);

		/****************** MoreEdge ******************/
		/**** md5 signature: 809deb2c8c3dfedac2033850fc8cfdca ****/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** NextEdge ******************/
		/**** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****************** OnEdge ******************/
		/**** md5 signature: 29ad464e46d837d9fbaf500a7bbcf85f ****/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
If the current edge is projected on an edge, returns <standard_true> and sets the value of <e>. otherwise, returns <standard_false>.
") OnEdge;
		Standard_Boolean OnEdge(TopoDS_Edge & E);

		/****************** OnEdge ******************/
		/**** md5 signature: 658640c00451cfa43ebdf8cb65627a29 ****/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: float

Description
-----------
If the vertex <v> lies on an edge of the original shape, returns <standard_true> and sets the concerned edge in <e>, and the parameter on the edge in <p>. else returns <standard_false>.
") OnEdge;
		Standard_Boolean OnEdge(const TopoDS_Vertex & V, TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** OnEdge ******************/
		/**** md5 signature: 1c14a6039267b7829c86af26279784a8 ****/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
EdgeFrom: TopoDS_Edge
E: TopoDS_Edge

Return
-------
P: float

Description
-----------
If the vertex <v> lies on an edge of the original shape, returns <standard_true> and sets the concerned edge in <e>, and the parameter on the edge in <p>. else returns <standard_false>.
") OnEdge;
		Standard_Boolean OnEdge(const TopoDS_Vertex & V, const TopoDS_Edge & EdgeFrom, TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** OnFace ******************/
		/**** md5 signature: a04a7e8fa6834141c5c1e4ec7a86b633 ****/
		%feature("compactdefaultargs") OnFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the face of the shape on which the current edge is projected.
") OnFace;
		TopoDS_Face OnFace();

		/****************** OnVertex ******************/
		/**** md5 signature: 741d3a6ecd746d31c15e3efe97ef4827 ****/
		%feature("compactdefaultargs") OnVertex;
		%feature("autodoc", "
Parameters
----------
Vwire: TopoDS_Vertex
Vshape: TopoDS_Vertex

Return
-------
bool

Description
-----------
No available documentation.
") OnVertex;
		Standard_Boolean OnVertex(const TopoDS_Vertex & Vwire, TopoDS_Vertex & Vshape);

		/****************** SetCheckInterior ******************/
		/**** md5 signature: 2d00b58c59d6af210c84a7fdd261d94b ****/
		%feature("compactdefaultargs") SetCheckInterior;
		%feature("autodoc", "
Parameters
----------
ToCheckInterior: bool

Return
-------
None

Description
-----------
Set the flag of check internal intersections default value is true (to check).
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
		/**** md5 signature: ec8a904dad761a10866084f604542a5e ****/
		%feature("compactdefaultargs") LocOpe_GluedShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_GluedShape;
		 LocOpe_GluedShape();

		/****************** LocOpe_GluedShape ******************/
		/**** md5 signature: 2cfdad7c23a155b9200ff852da3646d8 ****/
		%feature("compactdefaultargs") LocOpe_GluedShape;
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
") LocOpe_GluedShape;
		 LocOpe_GluedShape(const TopoDS_Shape & S);

		/****************** Generated ******************/
		/**** md5 signature: 12fac5c9686aa58e81abe0e0278b5975 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
TopoDS_Edge

Description
-----------
Returns the edge created by the vertex <v>. if none, must return a null shape.
") Generated;
		TopoDS_Edge Generated(const TopoDS_Vertex & V);

		/****************** Generated ******************/
		/**** md5 signature: 2f36cb95a1e983d92e93c5a30cf1e5f4 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
TopoDS_Face

Description
-----------
Returns the face created by the edge <e>. if none, must return a null shape.
") Generated;
		TopoDS_Face Generated(const TopoDS_Edge & E);

		/****************** GeneratingEdges ******************/
		/**** md5 signature: ee249c46969f861d6e0e4bc29ae4bfeb ****/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") GeneratingEdges;
		const TopTools_ListOfShape & GeneratingEdges();

		/****************** GlueOnFace ******************/
		/**** md5 signature: a4642afc420a44d60619fbf28fad5c55 ****/
		%feature("compactdefaultargs") GlueOnFace;
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
") GlueOnFace;
		void GlueOnFace(const TopoDS_Face & F);

		/****************** Init ******************/
		/**** md5 signature: 5b69b32485b3d9f82ae4abb9c853c3c7 ****/
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

		/****************** OrientedFaces ******************/
		/**** md5 signature: daf89b2afb0d5ac79505728faeed1fe1 ****/
		%feature("compactdefaultargs") OrientedFaces;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the list of correctly oriented generated faces.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def locope_Closed(*args):
	return locope.Closed(*args)

@deprecated
def locope_Closed(*args):
	return locope.Closed(*args)

@deprecated
def locope_SampleEdges(*args):
	return locope.SampleEdges(*args)

@deprecated
def locope_TgtFaces(*args):
	return locope.TgtFaces(*args)

}
