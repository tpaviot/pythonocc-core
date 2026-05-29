/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_locope.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
%ignore NCollection_DataMap<TopoDS_Shape,gp_Pnt,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,gp_Pnt,TopTools_ShapeMapHasher>::KeyValues;
%template(LocOpe_DataMapOfShapePnt) NCollection_DataMap<TopoDS_Shape,gp_Pnt,TopTools_ShapeMapHasher>;
%template(LocOpe_SequenceOfCirc) NCollection_Sequence<gp_Circ>;

%extend NCollection_Sequence<gp_Circ> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(LocOpe_SequenceOfLin) NCollection_Sequence<gp_Lin>;

%extend NCollection_Sequence<gp_Lin> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(LocOpe_SequenceOfPntFace) NCollection_Sequence<LocOpe_PntFace>;

%extend NCollection_Sequence<LocOpe_PntFace> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
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
		/****** LocOpe::Closed ******/
		/****** md5 signature: d7c2377f578d275ab699900e3474f3d7 ******/
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
Returns true when the wire <W> is closed on the face <OnF>.
") Closed;
		static bool Closed(const TopoDS_Wire & W, const TopoDS_Face & OnF);

		/****** LocOpe::Closed ******/
		/****** md5 signature: 1991b0564eb645808b8cbf36375c8866 ******/
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
Returns true when the edge <E> is closed on the face <OnF>.
") Closed;
		static bool Closed(const TopoDS_Edge & E, const TopoDS_Face & OnF);

		/****** LocOpe::SampleEdges ******/
		/****** md5 signature: 2ce5cdc73a2ff7a08367472fc563a245 ******/
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

		/****** LocOpe::TgtFaces ******/
		/****** md5 signature: 0a93567d8dbaff47a02b4a8ef41a0fe0 ******/
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
Returns true when the faces are tangent.
") TgtFaces;
		static bool TgtFaces(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2);

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
		/****** LocOpe_BuildShape::LocOpe_BuildShape ******/
		/****** md5 signature: 8dd41df5d2d189082377958dc7871414 ******/
		%feature("compactdefaultargs") LocOpe_BuildShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_BuildShape;
		 LocOpe_BuildShape();

		/****** LocOpe_BuildShape::LocOpe_BuildShape ******/
		/****** md5 signature: d8c764d1113d9ba6bb61f543df0c5c49 ******/
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
Builds shape(s) from the list <L>. Uses only the faces of <L>.
") LocOpe_BuildShape;
		 LocOpe_BuildShape(const TopTools_ListOfShape & L);

		/****** LocOpe_BuildShape::Perform ******/
		/****** md5 signature: b270647b13c6414b2c9a30cdcf09419a ******/
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
Builds shape(s) from the list <L>. Uses only the faces of <L>.
") Perform;
		void Perform(const TopTools_ListOfShape & L);

		/****** LocOpe_BuildShape::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
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
		/****** LocOpe_BuildWires::LocOpe_BuildWires ******/
		/****** md5 signature: 9812afc6b98a2ea5f11fc59245706b54 ******/
		%feature("compactdefaultargs") LocOpe_BuildWires;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_BuildWires;
		 LocOpe_BuildWires();

		/****** LocOpe_BuildWires::LocOpe_BuildWires ******/
		/****** md5 signature: cc777b15d6822698a3b99f6eaa54af2a ******/
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

		/****** LocOpe_BuildWires::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** LocOpe_BuildWires::Perform ******/
		/****** md5 signature: 16e47df1e01c40694ae4f6dc7a11d5bc ******/
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

		/****** LocOpe_BuildWires::Result ******/
		/****** md5 signature: 83e504274481e6f00be7aae49621d422 ******/
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
		/****** LocOpe_CSIntersector::LocOpe_CSIntersector ******/
		/****** md5 signature: b42d043d62be9605a2626066ea0010ac ******/
		%feature("compactdefaultargs") LocOpe_CSIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector();

		/****** LocOpe_CSIntersector::LocOpe_CSIntersector ******/
		/****** md5 signature: 528908f4d87c8037893eb5fddfa6d9b6 ******/
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
Creates and performs the intersection between <Ax1> and <S>.
") LocOpe_CSIntersector;
		 LocOpe_CSIntersector(const TopoDS_Shape & S);

		/****** LocOpe_CSIntersector::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** LocOpe_CSIntersector::Init ******/
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
Performs the intersection between <Ax1 and <S>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** LocOpe_CSIntersector::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <true> if the intersection has been done.
") IsDone;
		bool IsDone();

		/****** LocOpe_CSIntersector::LocalizeAfter ******/
		/****** md5 signature: 2781d84352d68d7c468e35684c7297f2 ******/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
I: int
From: double
Tol: double

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
On the element of range <I>, searches the first intersection point located after the parameter <From>, which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <false>.
") LocalizeAfter;
		bool LocalizeAfter(const int I, const double From, const double Tol, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CSIntersector::LocalizeAfter ******/
		/****** md5 signature: 27e8b3f2f63ec74537c671e5b17771fc ******/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
I: int
FromInd: int
Tol: double

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
On the element of range <I>, searches the first intersection point located after the index <FromInd> ( >= FromInd + 1), which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <false>.
") LocalizeAfter;
		bool LocalizeAfter(const int I, const int FromInd, const double Tol, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CSIntersector::LocalizeBefore ******/
		/****** md5 signature: 86c777f036ae438d128725bc69d4b350 ******/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
I: int
From: double
Tol: double

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
On the element of range <I>, searches the first intersection point located before the parameter <From>, which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <false>.
") LocalizeBefore;
		bool LocalizeBefore(const int I, const double From, const double Tol, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CSIntersector::LocalizeBefore ******/
		/****** md5 signature: a70b72cb26c5ec78466138f744018795 ******/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
I: int
FromInd: int
Tol: double

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
On the element of range <I>, searches the first intersection point located before the index <FromInd> (<= FromInd -1), which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). <Tol> is used to determine if 2 parameters are equal. //! Otherwise, returns <false>.
") LocalizeBefore;
		bool LocalizeBefore(const int I, const int FromInd, const double Tol, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CSIntersector::NbPoints ******/
		/****** md5 signature: fdefc715355f14c2eaf6464a6af5a9bb ******/
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
Returns the number of intersection point on the element of range <I>.
") NbPoints;
		int NbPoints(const int I);

		/****** LocOpe_CSIntersector::Perform ******/
		/****** md5 signature: 189c92a5029cc595eaa2b0a59f152b70 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Slin: NCollection_Sequence<gp_Lin>

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const NCollection_Sequence<gp_Lin> & Slin);

		/****** LocOpe_CSIntersector::Perform ******/
		/****** md5 signature: 75427f6a997b85e616ff1ee9d5946e8a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Scir: NCollection_Sequence<gp_Circ>

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const NCollection_Sequence<gp_Circ> & Scir);

		/****** LocOpe_CSIntersector::Perform ******/
		/****** md5 signature: 155f16cfeeffd209e065bc04d56be3dd ******/
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

		/****** LocOpe_CSIntersector::Point ******/
		/****** md5 signature: 0c3c4b16e4f7e34feeb2fba0e382aa8c ******/
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
Returns the intersection point of range <Index> on element of range <I>. The points are sorted in increasing order of parameter along the axis.
") Point;
		const LocOpe_PntFace & Point(const int I, const int Index);

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
		/****** LocOpe_CurveShapeIntersector::LocOpe_CurveShapeIntersector ******/
		/****** md5 signature: 79716c9553c555c74b58e68e1e02e261 ******/
		%feature("compactdefaultargs") LocOpe_CurveShapeIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector();

		/****** LocOpe_CurveShapeIntersector::LocOpe_CurveShapeIntersector ******/
		/****** md5 signature: f0bbac54a186320b9d69477b598785d3 ******/
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
Creates and performs the intersection between <Ax1> and <S>.
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector(const gp_Ax1 & Axis, const TopoDS_Shape & S);

		/****** LocOpe_CurveShapeIntersector::LocOpe_CurveShapeIntersector ******/
		/****** md5 signature: 0f01941a5b28c6315842dbc1b736ac7d ******/
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
Creates and performs the intersection between <C> and <S>.
") LocOpe_CurveShapeIntersector;
		 LocOpe_CurveShapeIntersector(const gp_Circ & C, const TopoDS_Shape & S);

		/****** LocOpe_CurveShapeIntersector::Init ******/
		/****** md5 signature: fa661d710d2a3307cee68a20ae303ad7 ******/
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
Performs the intersection between <Ax1 and <S>.
") Init;
		void Init(const gp_Ax1 & Axis, const TopoDS_Shape & S);

		/****** LocOpe_CurveShapeIntersector::Init ******/
		/****** md5 signature: 7526852bc0774e00733050f764740799 ******/
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
Performs the intersection between <Ax1 and <S>.
") Init;
		void Init(const gp_Circ & C, const TopoDS_Shape & S);

		/****** LocOpe_CurveShapeIntersector::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <true> if the intersection has been done.
") IsDone;
		bool IsDone();

		/****** LocOpe_CurveShapeIntersector::LocalizeAfter ******/
		/****** md5 signature: 6a4f76dde0d7d8faf1c729828ad61b09 ******/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
From: double

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located after the parameter <From>, which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). //! Otherwise, returns <false>.
") LocalizeAfter;
		bool LocalizeAfter(const double From, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CurveShapeIntersector::LocalizeAfter ******/
		/****** md5 signature: 20dca8d7140e89b594f1d8858e2e2622 ******/
		%feature("compactdefaultargs") LocalizeAfter;
		%feature("autodoc", "
Parameters
----------
FromInd: int

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located after the index <FromInd> (>= FromInd + 1), which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point. (IndFrom <= IndTo). //! Otherwise, returns <false>.
") LocalizeAfter;
		bool LocalizeAfter(const int FromInd, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CurveShapeIntersector::LocalizeBefore ******/
		/****** md5 signature: 3c362f47c3303d651d28db9d0dc5dcda ******/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
From: double

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located before the parameter <From>, which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). //! Otherwise, returns <false>.
") LocalizeBefore;
		bool LocalizeBefore(const double From, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CurveShapeIntersector::LocalizeBefore ******/
		/****** md5 signature: bbfc613e5469e7ddb15de2aada860ca5 ******/
		%feature("compactdefaultargs") LocalizeBefore;
		%feature("autodoc", "
Parameters
----------
FromInd: int

Return
-------
Or: TopAbs_Orientation
IndFrom: int
IndTo: int

Description
-----------
Searches the first intersection point located before the index <FromInd> ( <= FromInd -1), which orientation is not TopAbs_EXTERNAL. If found, returns <true>. <Or> contains the orientation of the point, <IndFrom> and <IndTo> represents the interval of index in the sequence of intersection point corresponding to the point (IndFrom <= IndTo). //! Otherwise, returns <false>.
") LocalizeBefore;
		bool LocalizeBefore(const int FromInd, TopAbs_Orientation &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** LocOpe_CurveShapeIntersector::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection point.
") NbPoints;
		int NbPoints();

		/****** LocOpe_CurveShapeIntersector::Point ******/
		/****** md5 signature: b44b09d8da413116ab464799b694acda ******/
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
Returns the intersection point of range <Index>. The points are sorted in increasing order of parameter along the axis.
") Point;
		const LocOpe_PntFace & Point(const int Index);

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
		/****** LocOpe_DPrism::LocOpe_DPrism ******/
		/****** md5 signature: dacdca50edc0fd1fc66859032e53ff8c ******/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Height1: double
Height2: double
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_DPrism;
		 LocOpe_DPrism(const TopoDS_Face & Spine, const double Height1, const double Height2, const double Angle);

		/****** LocOpe_DPrism::LocOpe_DPrism ******/
		/****** md5 signature: f39fc7da8bec97127e0cf2cc6293cae3 ******/
		%feature("compactdefaultargs") LocOpe_DPrism;
		%feature("autodoc", "
Parameters
----------
Spine: TopoDS_Face
Height: double
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_DPrism;
		 LocOpe_DPrism(const TopoDS_Face & Spine, const double Height, const double Angle);

		/****** LocOpe_DPrism::BarycCurve ******/
		/****** md5 signature: 84f06532e4d5bbe2363bba52b4d91200 ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****** LocOpe_DPrism::Curves ******/
		/****** md5 signature: 2bc5dc27fc029256991027a0d8ed6fa5 ******/
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

		/****** LocOpe_DPrism::FirstShape ******/
		/****** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** LocOpe_DPrism::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** LocOpe_DPrism::LastShape ******/
		/****** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****** LocOpe_DPrism::Profile ******/
		/****** md5 signature: 79a7d86b74870c796d2c753c300c851a ******/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Profile;
		const TopoDS_Shape Profile();

		/****** LocOpe_DPrism::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** LocOpe_DPrism::Shapes ******/
		/****** md5 signature: 6893c0a8043f0c4a7bec2afcb318259f ******/
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

		/****** LocOpe_DPrism::Spine ******/
		/****** md5 signature: f6ea6e7c5910a000caa86ed2eb47e3d7 ******/
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
		/****** LocOpe_FindEdges::LocOpe_FindEdges ******/
		/****** md5 signature: 2aabbf199c65a9c397778a66d5c9a9ed ******/
		%feature("compactdefaultargs") LocOpe_FindEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_FindEdges;
		 LocOpe_FindEdges();

		/****** LocOpe_FindEdges::LocOpe_FindEdges ******/
		/****** md5 signature: 926297f5f09fdac32f43dd8c93f04a66 ******/
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

		/****** LocOpe_FindEdges::EdgeFrom ******/
		/****** md5 signature: d67fb24f8f01d4f4943b8189789b8869 ******/
		%feature("compactdefaultargs") EdgeFrom;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") EdgeFrom;
		const TopoDS_Edge EdgeFrom();

		/****** LocOpe_FindEdges::EdgeTo ******/
		/****** md5 signature: 82b67b5e3be114aa1489723da8cf608c ******/
		%feature("compactdefaultargs") EdgeTo;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") EdgeTo;
		const TopoDS_Edge EdgeTo();

		/****** LocOpe_FindEdges::InitIterator ******/
		/****** md5 signature: 5552a2067807727af1920ceee666514b ******/
		%feature("compactdefaultargs") InitIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitIterator;
		void InitIterator();

		/****** LocOpe_FindEdges::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** LocOpe_FindEdges::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** LocOpe_FindEdges::Set ******/
		/****** md5 signature: 06445e9f8663fe183c61def934056826 ******/
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
		/****** LocOpe_FindEdgesInFace::LocOpe_FindEdgesInFace ******/
		/****** md5 signature: fc261ecc2b140d01256f9ee6e03dac78 ******/
		%feature("compactdefaultargs") LocOpe_FindEdgesInFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_FindEdgesInFace;
		 LocOpe_FindEdgesInFace();

		/****** LocOpe_FindEdgesInFace::LocOpe_FindEdgesInFace ******/
		/****** md5 signature: 69c50a173fa5d37fb3c95f1ae6c3830f ******/
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

		/****** LocOpe_FindEdgesInFace::Edge ******/
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

		/****** LocOpe_FindEdgesInFace::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** LocOpe_FindEdgesInFace::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** LocOpe_FindEdgesInFace::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** LocOpe_FindEdgesInFace::Set ******/
		/****** md5 signature: e65bb5dffb39ffb1d29dff808d2177ab ******/
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
		/****** LocOpe_GeneratedShape::Generated ******/
		/****** md5 signature: 499008311e503e8516f37a26ae20c6c4 ******/
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
Returns the edge created by the vertex <V>. If none, must return a null shape.
") Generated;
		virtual TopoDS_Edge Generated(const TopoDS_Vertex & V);

		/****** LocOpe_GeneratedShape::Generated ******/
		/****** md5 signature: 30ecec4c451f58e7e0a04f78911dab04 ******/
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
Returns the face created by the edge <E>. If none, must return a null shape.
") Generated;
		virtual TopoDS_Face Generated(const TopoDS_Edge & E);

		/****** LocOpe_GeneratedShape::GeneratingEdges ******/
		/****** md5 signature: 0e2250d836aeae0c114d38878fef969c ******/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") GeneratingEdges;
		virtual const TopTools_ListOfShape & GeneratingEdges();

		/****** LocOpe_GeneratedShape::OrientedFaces ******/
		/****** md5 signature: 2f0ad793faf07fd02ee98c37edc09272 ******/
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
		/****** LocOpe_Generator::LocOpe_Generator ******/
		/****** md5 signature: 948058747d455e5f0c5b2e0628c56a2d ******/
		%feature("compactdefaultargs") LocOpe_Generator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_Generator;
		 LocOpe_Generator();

		/****** LocOpe_Generator::LocOpe_Generator ******/
		/****** md5 signature: aa41bd692fb2610b5eda9bca247a2030 ******/
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
Creates the algorithm on the shape <S>.
") LocOpe_Generator;
		 LocOpe_Generator(const TopoDS_Shape & S);

		/****** LocOpe_Generator::DescendantFace ******/
		/****** md5 signature: 373f05d6b05045666ad08a7970186a95 ******/
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
Returns the descendant face of <F>. <F> may belong to the original shape or to the 'generated' shape. The returned face may be a null shape (when <F> disappears).
") DescendantFace;
		const TopTools_ListOfShape & DescendantFace(const TopoDS_Face & F);

		/****** LocOpe_Generator::Init ******/
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
Initializes the algorithm on the shape <S>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** LocOpe_Generator::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** LocOpe_Generator::Perform ******/
		/****** md5 signature: fcb599904c10f6cd1e4c4ba45080c4f5 ******/
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

		/****** LocOpe_Generator::ResultingShape ******/
		/****** md5 signature: d353819ad888f0057399e1c340ff17c9 ******/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the new shape.
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****** LocOpe_Generator::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
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
		/****** LocOpe_Gluer::LocOpe_Gluer ******/
		/****** md5 signature: 8d004d184b4ac56fa133912528743e6b ******/
		%feature("compactdefaultargs") LocOpe_Gluer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Gluer;
		 LocOpe_Gluer();

		/****** LocOpe_Gluer::LocOpe_Gluer ******/
		/****** md5 signature: b7ad7b234e8182c2dec192f5af1f475b ******/
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

		/****** LocOpe_Gluer::BasisShape ******/
		/****** md5 signature: 21cd65d6b80cb61a9e13e787117a65b0 ******/
		%feature("compactdefaultargs") BasisShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") BasisShape;
		const TopoDS_Shape BasisShape();

		/****** LocOpe_Gluer::Bind ******/
		/****** md5 signature: 00651bec56a12d0418e54d774f302230 ******/
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

		/****** LocOpe_Gluer::Bind ******/
		/****** md5 signature: 3016e09a55c1e17b8452fe31e36138db ******/
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

		/****** LocOpe_Gluer::DescendantFaces ******/
		/****** md5 signature: 8fcd4f80b33f6d7adf5d907cbaf76ef2 ******/
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

		/****** LocOpe_Gluer::Edges ******/
		/****** md5 signature: 037aaf7464b521eb3427cc0fdaf891f0 ******/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Edges;
		const TopTools_ListOfShape & Edges();

		/****** LocOpe_Gluer::GluedShape ******/
		/****** md5 signature: cc05062c19ffec36edea50e2f74757fb ******/
		%feature("compactdefaultargs") GluedShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") GluedShape;
		const TopoDS_Shape GluedShape();

		/****** LocOpe_Gluer::Init ******/
		/****** md5 signature: 72f1171950e222f265d5fc22bf237f99 ******/
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

		/****** LocOpe_Gluer::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** LocOpe_Gluer::OpeType ******/
		/****** md5 signature: 6301740c99fde6f602c33a48a205b637 ******/
		%feature("compactdefaultargs") OpeType;
		%feature("autodoc", "Return
-------
LocOpe_Operation

Description
-----------
No available documentation.
") OpeType;
		LocOpe_Operation OpeType();

		/****** LocOpe_Gluer::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** LocOpe_Gluer::ResultingShape ******/
		/****** md5 signature: d353819ad888f0057399e1c340ff17c9 ******/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****** LocOpe_Gluer::TgtEdges ******/
		/****** md5 signature: 4625c2d2cf027a1f9f8defe365dcab16 ******/
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
		/****** LocOpe_LinearForm::LocOpe_LinearForm ******/
		/****** md5 signature: 84355a6c132af777b54b38335d4d0d37 ******/
		%feature("compactdefaultargs") LocOpe_LinearForm;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_LinearForm;
		 LocOpe_LinearForm();

		/****** LocOpe_LinearForm::LocOpe_LinearForm ******/
		/****** md5 signature: 0cc2b502e1ca94867393f9b11cb1665f ******/
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

		/****** LocOpe_LinearForm::LocOpe_LinearForm ******/
		/****** md5 signature: f648af9b5cabdac90e62be23c609968b ******/
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

		/****** LocOpe_LinearForm::FirstShape ******/
		/****** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** LocOpe_LinearForm::LastShape ******/
		/****** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****** LocOpe_LinearForm::Perform ******/
		/****** md5 signature: b20133613d92cb4f26a0a5a9de52faf6 ******/
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

		/****** LocOpe_LinearForm::Perform ******/
		/****** md5 signature: e22108117c43d85d2e9af3b412510f28 ******/
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

		/****** LocOpe_LinearForm::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** LocOpe_LinearForm::Shapes ******/
		/****** md5 signature: 6893c0a8043f0c4a7bec2afcb318259f ******/
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
		/****** LocOpe_Pipe::LocOpe_Pipe ******/
		/****** md5 signature: 887fa4a5bc369f1b6ad85686839f090f ******/
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

		/****** LocOpe_Pipe::BarycCurve ******/
		/****** md5 signature: 66d2a457dbd580b676149c11f86ad8b1 ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****** LocOpe_Pipe::Curves ******/
		/****** md5 signature: 1de5a627f1308f523495196c80d8a2ba ******/
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
		TColGeom_SequenceOfCurve Curves(const TColgp_SequenceOfPnt & Spt);

		/****** LocOpe_Pipe::FirstShape ******/
		/****** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** LocOpe_Pipe::LastShape ******/
		/****** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****** LocOpe_Pipe::Profile ******/
		/****** md5 signature: 79a7d86b74870c796d2c753c300c851a ******/
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Profile;
		const TopoDS_Shape Profile();

		/****** LocOpe_Pipe::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** LocOpe_Pipe::Shapes ******/
		/****** md5 signature: 7b68a8263b90c81c34dd91561aad6dca ******/
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

		/****** LocOpe_Pipe::Spine ******/
		/****** md5 signature: f6ea6e7c5910a000caa86ed2eb47e3d7 ******/
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
		/****** LocOpe_PntFace::LocOpe_PntFace ******/
		/****** md5 signature: c684a8bde8adce128427067674a86331 ******/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor. Useful only for the list.
") LocOpe_PntFace;
		 LocOpe_PntFace();

		/****** LocOpe_PntFace::LocOpe_PntFace ******/
		/****** md5 signature: 83f811faa24ae3fa402214a42e0efb3d ******/
		%feature("compactdefaultargs") LocOpe_PntFace;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
F: TopoDS_Face
Or: TopAbs_Orientation
Param: double
UPar: double
VPar: double

Return
-------
None

Description
-----------
No available documentation.
") LocOpe_PntFace;
		 LocOpe_PntFace(const gp_Pnt & P, const TopoDS_Face & F, const TopAbs_Orientation Or, const double Param, const double UPar, const double VPar);

		/****** LocOpe_PntFace::ChangeOrientation ******/
		/****** md5 signature: 395518e4d56710f4afb539b195cfdc3c ******/
		%feature("compactdefaultargs") ChangeOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") ChangeOrientation;
		TopAbs_Orientation  ChangeOrientation();

		/****** LocOpe_PntFace::Face ******/
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

		/****** LocOpe_PntFace::Orientation ******/
		/****** md5 signature: 03010048da537511bfd11160d3c898dc ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** LocOpe_PntFace::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** LocOpe_PntFace::Pnt ******/
		/****** md5 signature: cb508877c7fa83c676a7983e5eeb1a5e ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Pnt;
		const gp_Pnt Pnt();

		/****** LocOpe_PntFace::UParameter ******/
		/****** md5 signature: 18620388b11f326f3dc578ff687ec7ed ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") UParameter;
		double UParameter();

		/****** LocOpe_PntFace::VParameter ******/
		/****** md5 signature: de1f6e83463dcefe43d02da05541b023 ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") VParameter;
		double VParameter();

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
		/****** LocOpe_Prism::LocOpe_Prism ******/
		/****** md5 signature: 3bcd2249739c6dc14064bb1b62a023f6 ******/
		%feature("compactdefaultargs") LocOpe_Prism;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_Prism;
		 LocOpe_Prism();

		/****** LocOpe_Prism::LocOpe_Prism ******/
		/****** md5 signature: e088e36fa8d0883a214fc221ddbe2de9 ******/
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

		/****** LocOpe_Prism::LocOpe_Prism ******/
		/****** md5 signature: 0dbcb11e8cca8b8bed826edc59571630 ******/
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

		/****** LocOpe_Prism::BarycCurve ******/
		/****** md5 signature: 84f06532e4d5bbe2363bba52b4d91200 ******/
		%feature("compactdefaultargs") BarycCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") BarycCurve;
		opencascade::handle<Geom_Curve> BarycCurve();

		/****** LocOpe_Prism::Curves ******/
		/****** md5 signature: 2bc5dc27fc029256991027a0d8ed6fa5 ******/
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

		/****** LocOpe_Prism::FirstShape ******/
		/****** md5 signature: 7feb91b88f8f76be63dd0e52049cfbe6 ******/
		%feature("compactdefaultargs") FirstShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") FirstShape;
		const TopoDS_Shape FirstShape();

		/****** LocOpe_Prism::LastShape ******/
		/****** md5 signature: e1c69c3678b816cb0e3d73096b528c5f ******/
		%feature("compactdefaultargs") LastShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") LastShape;
		const TopoDS_Shape LastShape();

		/****** LocOpe_Prism::Perform ******/
		/****** md5 signature: 73df62c2a421a7786212748e22f19d32 ******/
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

		/****** LocOpe_Prism::Perform ******/
		/****** md5 signature: 0f8aac93e43970f9e58cac57ca386d55 ******/
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

		/****** LocOpe_Prism::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** LocOpe_Prism::Shapes ******/
		/****** md5 signature: 6893c0a8043f0c4a7bec2afcb318259f ******/
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
		/****** LocOpe_SplitDrafts::LocOpe_SplitDrafts ******/
		/****** md5 signature: 51a1cb9e479948f52d3f0a9f7f2002c6 ******/
		%feature("compactdefaultargs") LocOpe_SplitDrafts;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts();

		/****** LocOpe_SplitDrafts::LocOpe_SplitDrafts ******/
		/****** md5 signature: e2701639f1b17ae18c73bfdf74b775be ******/
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
Creates the algorithm on the shape <S>.
") LocOpe_SplitDrafts;
		 LocOpe_SplitDrafts(const TopoDS_Shape & S);

		/****** LocOpe_SplitDrafts::Init ******/
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
Initializes the algorithm with the shape <S>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** LocOpe_SplitDrafts::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns <true> if the modification has been successfully performed.
") IsDone;
		bool IsDone();

		/****** LocOpe_SplitDrafts::OriginalShape ******/
		/****** md5 signature: 0c1425ae3411e433ee33975a98ab8edc ******/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") OriginalShape;
		const TopoDS_Shape OriginalShape();

		/****** LocOpe_SplitDrafts::Perform ******/
		/****** md5 signature: e5aaaca34e2aa20d7da2128aa69aa47e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire
Extractg: gp_Dir
NPlg: gp_Pln
Angleg: double
Extractd: gp_Dir
NPld: gp_Pln
Angled: double
ModifyLeft: bool (optional, default to true)
ModifyRight: bool (optional, default to true)

Return
-------
None

Description
-----------
Splits the face <F> of the former given shape with the wire <W>. The wire is assumed to lie on the face. Puts a draft angle on both parts of the wire. <Extractg>, <Nplg>, <Angleg> define the arguments for the left part of the wire. <Extractd>, <Npld>, <Angled> define the arguments for the right part of the wire. The draft angle is measured with the direction <Extract>. <Npl> defines the neutral plane (points belonging to the neutral plane are not modified). <Angle> is the value of the draft angle. If <ModifyLeft> is set to <false>, no draft angle is applied to the left part of the wire. If <ModifyRight> is set to <false>,no draft angle is applied to the right part of the wire.
") Perform;
		void Perform(const TopoDS_Face & F, const TopoDS_Wire & W, const gp_Dir & Extractg, const gp_Pln & NPlg, const double Angleg, const gp_Dir & Extractd, const gp_Pln & NPld, const double Angled, const bool ModifyLeft = true, const bool ModifyRight = true);

		/****** LocOpe_SplitDrafts::Perform ******/
		/****** md5 signature: c7b5553b5f2726288a926e06bbe40e13 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
W: TopoDS_Wire
Extract: gp_Dir
NPl: gp_Pln
Angle: double

Return
-------
None

Description
-----------
Splits the face <F> of the former given shape with the wire <W>. The wire is assumed to lie on the face. Puts a draft angle on the left part of the wire. The draft angle is measured with the direction <Extract>. <Npl> defines the neutral plane (points belonging to the neutral plane are not modified). <Angle> is the value of the draft angle.
") Perform;
		void Perform(const TopoDS_Face & F, const TopoDS_Wire & W, const gp_Dir & Extract, const gp_Pln & NPl, const double Angle);

		/****** LocOpe_SplitDrafts::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the modified shape.
") Shape;
		const TopoDS_Shape Shape();

		/****** LocOpe_SplitDrafts::ShapesFromShape ******/
		/****** md5 signature: 83b8c3a5e0b21a7b31cde09d7ad2951a ******/
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
		/****** LocOpe_SplitShape::LocOpe_SplitShape ******/
		/****** md5 signature: 35b01b43000dd405f998f499e4073bea ******/
		%feature("compactdefaultargs") LocOpe_SplitShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_SplitShape;
		 LocOpe_SplitShape();

		/****** LocOpe_SplitShape::LocOpe_SplitShape ******/
		/****** md5 signature: 30c3ad05a3b430b95f83235181d90a75 ******/
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
Creates the process with the shape <S>.
") LocOpe_SplitShape;
		 LocOpe_SplitShape(const TopoDS_Shape & S);

		/****** LocOpe_SplitShape::Add ******/
		/****** md5 signature: 4ee9b6caa65a8ede075d50530a0f438b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: double
E: TopoDS_Edge

Return
-------
None

Description
-----------
Adds the vertex <V> on the edge <E>, at parameter <P>.
") Add;
		void Add(const TopoDS_Vertex & V, const double P, const TopoDS_Edge & E);

		/****** LocOpe_SplitShape::Add ******/
		/****** md5 signature: d82c28773ec361c9e175654b50107242 ******/
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
Adds the wire <W> on the face <F>.
") Add;
		bool Add(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****** LocOpe_SplitShape::Add ******/
		/****** md5 signature: 64a4885f80c89cc68be9c479b59ba46f ******/
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
Adds the list of wires <Lwires> on the face <F>.
") Add;
		bool Add(const TopTools_ListOfShape & Lwires, const TopoDS_Face & F);

		/****** LocOpe_SplitShape::CanSplit ******/
		/****** md5 signature: ab5acad19be48f50aed4b725f13c8f98 ******/
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
Tests if it is possible to split the edge <E>.
") CanSplit;
		bool CanSplit(const TopoDS_Edge & E);

		/****** LocOpe_SplitShape::DescendantShapes ******/
		/****** md5 signature: 872d543240621103e615d2c61b0a9a17 ******/
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
Returns the list of descendant shapes of <S>.
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes(const TopoDS_Shape & S);

		/****** LocOpe_SplitShape::Init ******/
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
Initializes the process on the shape <S>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** LocOpe_SplitShape::LeftOf ******/
		/****** md5 signature: 71fdc2dfd84f74fced44bb442394da2e ******/
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
Returns the 'left' part defined by the wire <W> on the face <F>. The returned list of shape is in fact a list of faces. The face <F> is considered with its topological orientation in the original shape. <W> is considered with its orientation.
") LeftOf;
		const TopTools_ListOfShape & LeftOf(const TopoDS_Wire & W, const TopoDS_Face & F);

		/****** LocOpe_SplitShape::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
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
		/****** LocOpe_Spliter::LocOpe_Spliter ******/
		/****** md5 signature: 8cf5ce859db05a3d705a995c8f4c99f1 ******/
		%feature("compactdefaultargs") LocOpe_Spliter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") LocOpe_Spliter;
		 LocOpe_Spliter();

		/****** LocOpe_Spliter::LocOpe_Spliter ******/
		/****** md5 signature: 0346ab3981532042dc46d5d22befb541 ******/
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
Creates the algorithm on the shape <S>.
") LocOpe_Spliter;
		 LocOpe_Spliter(const TopoDS_Shape & S);

		/****** LocOpe_Spliter::DescendantShapes ******/
		/****** md5 signature: 872d543240621103e615d2c61b0a9a17 ******/
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
Returns the list of descendant shapes of <S>.
") DescendantShapes;
		const TopTools_ListOfShape & DescendantShapes(const TopoDS_Shape & S);

		/****** LocOpe_Spliter::DirectLeft ******/
		/****** md5 signature: 0dcdbf098f12ae717ee8e5124bb48c8d ******/
		%feature("compactdefaultargs") DirectLeft;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces which are the left of the projected wires and which are.
") DirectLeft;
		const TopTools_ListOfShape & DirectLeft();

		/****** LocOpe_Spliter::Init ******/
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
Initializes the algorithm on the shape <S>.
") Init;
		void Init(const TopoDS_Shape & S);

		/****** LocOpe_Spliter::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** LocOpe_Spliter::Left ******/
		/****** md5 signature: be2f18492c53905055a91ad1bc70753b ******/
		%feature("compactdefaultargs") Left;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
Returns the faces of the 'left' part on the shape. (It is build from DirectLeft, with the faces connected to this set, and so on...).
") Left;
		const TopTools_ListOfShape & Left();

		/****** LocOpe_Spliter::Perform ******/
		/****** md5 signature: 81f184fa3b695b3f713141fe6156b7b1 ******/
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

		/****** LocOpe_Spliter::ResultingShape ******/
		/****** md5 signature: d353819ad888f0057399e1c340ff17c9 ******/
		%feature("compactdefaultargs") ResultingShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the new shape.
") ResultingShape;
		const TopoDS_Shape ResultingShape();

		/****** LocOpe_Spliter::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
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
		/****** LocOpe_WiresOnShape::LocOpe_WiresOnShape ******/
		/****** md5 signature: 09ac373b07724e32dd0fa06274b01b27 ******/
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

		/****** LocOpe_WiresOnShape::Add ******/
		/****** md5 signature: dc061856d6403e7ea77474558c0cb36c ******/
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
Add splitting edges or wires for whole initial shape without additional specification edge->face, edge->edge This method puts edge on the corresponding faces from initial shape.
") Add;
		bool Add(const TopTools_SequenceOfShape & theEdges);

		/****** LocOpe_WiresOnShape::Bind ******/
		/****** md5 signature: 4b8d37767a759e53f1ff5474f2d75938 ******/
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

		/****** LocOpe_WiresOnShape::Bind ******/
		/****** md5 signature: 00e02bd2b6d7fb5ecab8b6a06bcf0404 ******/
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

		/****** LocOpe_WiresOnShape::Bind ******/
		/****** md5 signature: a26a4a4b0f2806f01ffb5421e1847703 ******/
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

		/****** LocOpe_WiresOnShape::Bind ******/
		/****** md5 signature: 207c01ec90c87c143bfc25038aabb965 ******/
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

		/****** LocOpe_WiresOnShape::BindAll ******/
		/****** md5 signature: 2ecc085aa904d51ca25040bdea9d8415 ******/
		%feature("compactdefaultargs") BindAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BindAll;
		void BindAll();

		/****** LocOpe_WiresOnShape::Edge ******/
		/****** md5 signature: 6daa50e42e357ab838ace460a01de4f9 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		TopoDS_Edge Edge();

		/****** LocOpe_WiresOnShape::Init ******/
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

		/****** LocOpe_WiresOnShape::InitEdgeIterator ******/
		/****** md5 signature: 33903e2afb34dc5222bb42326d13a964 ******/
		%feature("compactdefaultargs") InitEdgeIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitEdgeIterator;
		void InitEdgeIterator();

		/****** LocOpe_WiresOnShape::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** LocOpe_WiresOnShape::IsFaceWithSection ******/
		/****** md5 signature: f17269d9f49e8ebb8a03dc1e09f25e9f ******/
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
tells is the face to be split by section or not.
") IsFaceWithSection;
		bool IsFaceWithSection(const TopoDS_Shape & aFace);

		/****** LocOpe_WiresOnShape::MoreEdge ******/
		/****** md5 signature: 1afdcdb10ae7dd8361c8d3d5f65dbeca ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		bool MoreEdge();

		/****** LocOpe_WiresOnShape::NextEdge ******/
		/****** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge();

		/****** LocOpe_WiresOnShape::OnEdge ******/
		/****** md5 signature: 5441a07650d6afec90fb24bb110098ac ******/
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
If the current edge is projected on an edge, returns <true> and sets the value of <E>. Otherwise, returns <false>.
") OnEdge;
		bool OnEdge(TopoDS_Edge & E);

		/****** LocOpe_WiresOnShape::OnEdge ******/
		/****** md5 signature: 5e25b76c1f82072b68297c77bee42900 ******/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
P: double

Description
-----------
If the vertex <V> lies on an edge of the original shape, returns <true> and sets the concerned edge in <E>, and the parameter on the edge in <P>. Else returns <false>.
") OnEdge;
		bool OnEdge(const TopoDS_Vertex & V, TopoDS_Edge & E, Standard_Real &OutValue);

		/****** LocOpe_WiresOnShape::OnEdge ******/
		/****** md5 signature: 88d6ff79a33cfe35612580daded0a35e ******/
		%feature("compactdefaultargs") OnEdge;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
EdgeFrom: TopoDS_Edge
E: TopoDS_Edge

Return
-------
P: double

Description
-----------
If the vertex <V> lies on an edge of the original shape, returns <true> and sets the concerned edge in <E>, and the parameter on the edge in <P>. Else returns <false>.
") OnEdge;
		bool OnEdge(const TopoDS_Vertex & V, const TopoDS_Edge & EdgeFrom, TopoDS_Edge & E, Standard_Real &OutValue);

		/****** LocOpe_WiresOnShape::OnFace ******/
		/****** md5 signature: a04a7e8fa6834141c5c1e4ec7a86b633 ******/
		%feature("compactdefaultargs") OnFace;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the face of the shape on which the current edge is projected.
") OnFace;
		TopoDS_Face OnFace();

		/****** LocOpe_WiresOnShape::OnVertex ******/
		/****** md5 signature: 19ea71daf171884730f6566d82ec962b ******/
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
		bool OnVertex(const TopoDS_Vertex & Vwire, TopoDS_Vertex & Vshape);

		/****** LocOpe_WiresOnShape::SetCheckInterior ******/
		/****** md5 signature: efb1f3d0d41242227a9413162dceab9f ******/
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
Set the flag of check internal intersections default value is True (to check).
") SetCheckInterior;
		void SetCheckInterior(const bool ToCheckInterior);

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
		/****** LocOpe_GluedShape::LocOpe_GluedShape ******/
		/****** md5 signature: ec8a904dad761a10866084f604542a5e ******/
		%feature("compactdefaultargs") LocOpe_GluedShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LocOpe_GluedShape;
		 LocOpe_GluedShape();

		/****** LocOpe_GluedShape::LocOpe_GluedShape ******/
		/****** md5 signature: 2cfdad7c23a155b9200ff852da3646d8 ******/
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

		/****** LocOpe_GluedShape::Generated ******/
		/****** md5 signature: fded8c242e236a015b82ce27456c3c53 ******/
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
Returns the edge created by the vertex <V>. If none, must return a null shape.
") Generated;
		TopoDS_Edge Generated(const TopoDS_Vertex & V);

		/****** LocOpe_GluedShape::Generated ******/
		/****** md5 signature: d0e2dc623c2f0150a1e5687a30d2b6f5 ******/
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
Returns the face created by the edge <E>. If none, must return a null shape.
") Generated;
		TopoDS_Face Generated(const TopoDS_Edge & E);

		/****** LocOpe_GluedShape::GeneratingEdges ******/
		/****** md5 signature: fd6282804c49e2c2ad55082d4ce91edb ******/
		%feature("compactdefaultargs") GeneratingEdges;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") GeneratingEdges;
		const TopTools_ListOfShape & GeneratingEdges();

		/****** LocOpe_GluedShape::GlueOnFace ******/
		/****** md5 signature: a4642afc420a44d60619fbf28fad5c55 ******/
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

		/****** LocOpe_GluedShape::Init ******/
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

		/****** LocOpe_GluedShape::OrientedFaces ******/
		/****** md5 signature: e1789da10d12eef7b0a79f259570d8e4 ******/
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
