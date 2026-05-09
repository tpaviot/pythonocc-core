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
%define HLRBREPDOCSTRING
"HLRBRep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_hlrbrep.html"
%enddef
%module (package="OCC.Core", docstring=HLRBREPDOCSTRING) HLRBRep


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
#include<HLRBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TopAbs_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<IntRes2d_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Bnd_module.hxx>
#include<HLRTopoBRep_module.hxx>
#include<math_module.hxx>
#include<IntCurve_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<Message_module.hxx>
#include<Contap_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import HLRAlgo.i
%import TopAbs.i
%import BRepAdaptor.i
%import Geom.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
%import TColgp.i
%import IntRes2d.i
%import Geom2d.i
%import TopTools.i
%import IntCurveSurface.i
%import Bnd.i
%import HLRTopoBRep.i
%import math.i
%import IntCurve.i
%import Adaptor3d.i
%import Intf.i
%import IntSurf.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum HLRBRep_TypeOfResultingEdge {
	HLRBRep_Undefined = 0,
	HLRBRep_IsoLine = 1,
	HLRBRep_OutLine = 2,
	HLRBRep_Rg1Line = 3,
	HLRBRep_RgNLine = 4,
	HLRBRep_Sharp = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class HLRBRep_TypeOfResultingEdge(IntEnum):
	HLRBRep_Undefined = 0
	HLRBRep_IsoLine = 1
	HLRBRep_OutLine = 2
	HLRBRep_Rg1Line = 3
	HLRBRep_RgNLine = 4
	HLRBRep_Sharp = 5
HLRBRep_Undefined = HLRBRep_TypeOfResultingEdge.HLRBRep_Undefined
HLRBRep_IsoLine = HLRBRep_TypeOfResultingEdge.HLRBRep_IsoLine
HLRBRep_OutLine = HLRBRep_TypeOfResultingEdge.HLRBRep_OutLine
HLRBRep_Rg1Line = HLRBRep_TypeOfResultingEdge.HLRBRep_Rg1Line
HLRBRep_RgNLine = HLRBRep_TypeOfResultingEdge.HLRBRep_RgNLine
HLRBRep_Sharp = HLRBRep_TypeOfResultingEdge.HLRBRep_Sharp
};
/* end python proxy for enums */

/* handles */
%wrap_handle(HLRBRep_AreaLimit)
%wrap_handle(HLRBRep_Data)
%wrap_handle(HLRBRep_InternalAlgo)
%wrap_handle(HLRBRep_PolyAlgo)
%wrap_handle(HLRBRep_Algo)
/* end handles declaration */

/* templates */
%template(HLRBRep_Array1OfEData) NCollection_Array1<HLRBRep_EdgeData>;
Array1ExtendIter(HLRBRep_EdgeData)

%template(HLRBRep_Array1OfFData) NCollection_Array1<HLRBRep_FaceData>;
Array1ExtendIter(HLRBRep_FaceData)

%template(HLRBRep_ListIteratorOfListOfBPnt2D) NCollection_TListIterator<HLRBRep_BiPnt2D>;
%template(HLRBRep_ListIteratorOfListOfBPoint) NCollection_TListIterator<HLRBRep_BiPoint>;
%template(HLRBRep_ListOfBPnt2D) NCollection_List<HLRBRep_BiPnt2D>;

%extend NCollection_List<HLRBRep_BiPnt2D> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = HLRBRep_ListIteratorOfListOfBPnt2D(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(HLRBRep_ListOfBPoint) NCollection_List<HLRBRep_BiPoint>;

%extend NCollection_List<HLRBRep_BiPoint> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = HLRBRep_ListIteratorOfListOfBPoint(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(HLRBRep_SeqOfShapeBounds) NCollection_Sequence<HLRBRep_ShapeBounds>;

%extend NCollection_Sequence<HLRBRep_ShapeBounds> {
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
typedef NCollection_Array1<HLRBRep_EdgeData> HLRBRep_Array1OfEData;
typedef NCollection_Array1<HLRBRep_FaceData> HLRBRep_Array1OfFData;
typedef NCollection_List<HLRBRep_BiPnt2D>::Iterator HLRBRep_ListIteratorOfListOfBPnt2D;
typedef NCollection_List<HLRBRep_BiPoint>::Iterator HLRBRep_ListIteratorOfListOfBPoint;
typedef NCollection_List<HLRBRep_BiPnt2D> HLRBRep_ListOfBPnt2D;
typedef NCollection_List<HLRBRep_BiPoint> HLRBRep_ListOfBPoint;
typedef NCollection_Sequence<HLRBRep_ShapeBounds> HLRBRep_SeqOfShapeBounds;
/* end typedefs declaration */

/****************
* class HLRBRep *
****************/
%rename(hlrbrep) HLRBRep;
class HLRBRep {
	public:
		/****** HLRBRep::MakeEdge ******/
		/****** md5 signature: 02cbaf33041162d3ec7af414b7af8bdf ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
ec: HLRBRep_Curve
U1: double
U2: double

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") MakeEdge;
		static TopoDS_Edge MakeEdge(const HLRBRep_Curve & ec, const double U1, const double U2);

		/****** HLRBRep::MakeEdge3d ******/
		/****** md5 signature: 458a7580034654c8d098941eef1a2cfe ******/
		%feature("compactdefaultargs") MakeEdge3d;
		%feature("autodoc", "
Parameters
----------
ec: HLRBRep_Curve
U1: double
U2: double

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") MakeEdge3d;
		static TopoDS_Edge MakeEdge3d(const HLRBRep_Curve & ec, const double U1, const double U2);

		/****** HLRBRep::PolyHLRAngleAndDeflection ******/
		/****** md5 signature: 12b02738b45763a6a6ff9bf61cf5a040 ******/
		%feature("compactdefaultargs") PolyHLRAngleAndDeflection;
		%feature("autodoc", "
Parameters
----------
InAngl: double

Return
-------
OutAngl: double
OutDefl: double

Description
-----------
No available documentation.
") PolyHLRAngleAndDeflection;
		static void PolyHLRAngleAndDeflection(const double InAngl, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend HLRBRep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class HLRBRep_AreaLimit *
**************************/
class HLRBRep_AreaLimit : public Standard_Transient {
	public:
		/****** HLRBRep_AreaLimit::HLRBRep_AreaLimit ******/
		/****** md5 signature: 54212fbf349d3b4342194a368dcdd613 ******/
		%feature("compactdefaultargs") HLRBRep_AreaLimit;
		%feature("autodoc", "
Parameters
----------
V: HLRAlgo_Intersection
Boundary: bool
Interference: bool
StateBefore: TopAbs_State
StateAfter: TopAbs_State
EdgeBefore: TopAbs_State
EdgeAfter: TopAbs_State

Return
-------
None

Description
-----------
The previous and next field are set to NULL.
") HLRBRep_AreaLimit;
		 HLRBRep_AreaLimit(const HLRAlgo_Intersection & V, const bool Boundary, const bool Interference, const TopAbs_State StateBefore, const TopAbs_State StateAfter, const TopAbs_State EdgeBefore, const TopAbs_State EdgeAfter);

		/****** HLRBRep_AreaLimit::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** HLRBRep_AreaLimit::EdgeAfter ******/
		/****** md5 signature: 88cd92fbcc817f50f7fc6e694262af20 ******/
		%feature("compactdefaultargs") EdgeAfter;
		%feature("autodoc", "
Parameters
----------
St: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") EdgeAfter;
		void EdgeAfter(const TopAbs_State St);

		/****** HLRBRep_AreaLimit::EdgeAfter ******/
		/****** md5 signature: 47462ffdaa9958f5311e9258f8fd4b44 ******/
		%feature("compactdefaultargs") EdgeAfter;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") EdgeAfter;
		TopAbs_State EdgeAfter();

		/****** HLRBRep_AreaLimit::EdgeBefore ******/
		/****** md5 signature: 1a82e41df43ad513e1a96132bbebfb1c ******/
		%feature("compactdefaultargs") EdgeBefore;
		%feature("autodoc", "
Parameters
----------
St: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") EdgeBefore;
		void EdgeBefore(const TopAbs_State St);

		/****** HLRBRep_AreaLimit::EdgeBefore ******/
		/****** md5 signature: 9e2531c630fb5c3890639003c83672bd ******/
		%feature("compactdefaultargs") EdgeBefore;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") EdgeBefore;
		TopAbs_State EdgeBefore();

		/****** HLRBRep_AreaLimit::IsBoundary ******/
		/****** md5 signature: e4571934dc233b1ff119256513384992 ******/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsBoundary;
		bool IsBoundary();

		/****** HLRBRep_AreaLimit::IsInterference ******/
		/****** md5 signature: 1c7f51e2a202946534099b00ee6668f5 ******/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsInterference;
		bool IsInterference();

		/****** HLRBRep_AreaLimit::Next ******/
		/****** md5 signature: 5c6a3048ebd638c072893b2b352d50d3 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "
Parameters
----------
N: HLRBRep_AreaLimit

Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next(const opencascade::handle<HLRBRep_AreaLimit> & N);

		/****** HLRBRep_AreaLimit::Next ******/
		/****** md5 signature: 3064cde2810da3e71af86e964de5293c ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRBRep_AreaLimit>

Description
-----------
No available documentation.
") Next;
		opencascade::handle<HLRBRep_AreaLimit> Next();

		/****** HLRBRep_AreaLimit::Previous ******/
		/****** md5 signature: 1d5059203bc25bf3e14b708476316cdc ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "
Parameters
----------
P: HLRBRep_AreaLimit

Return
-------
None

Description
-----------
No available documentation.
") Previous;
		void Previous(const opencascade::handle<HLRBRep_AreaLimit> & P);

		/****** HLRBRep_AreaLimit::Previous ******/
		/****** md5 signature: 8c2f19257130a0ffd994bd28ba4e3ce9 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRBRep_AreaLimit>

Description
-----------
No available documentation.
") Previous;
		opencascade::handle<HLRBRep_AreaLimit> Previous();

		/****** HLRBRep_AreaLimit::StateAfter ******/
		/****** md5 signature: 2989ad99c4f077a13dd691beb6ec97ba ******/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "
Parameters
----------
St: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") StateAfter;
		void StateAfter(const TopAbs_State St);

		/****** HLRBRep_AreaLimit::StateAfter ******/
		/****** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ******/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") StateAfter;
		TopAbs_State StateAfter();

		/****** HLRBRep_AreaLimit::StateBefore ******/
		/****** md5 signature: 3086b7234e843377136ff2098738261c ******/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "
Parameters
----------
St: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") StateBefore;
		void StateBefore(const TopAbs_State St);

		/****** HLRBRep_AreaLimit::StateBefore ******/
		/****** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ******/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") StateBefore;
		TopAbs_State StateBefore();

		/****** HLRBRep_AreaLimit::Vertex ******/
		/****** md5 signature: 5a55d0d2629ab986a101be038db1f931 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
HLRAlgo_Intersection

Description
-----------
No available documentation.
") Vertex;
		const HLRAlgo_Intersection & Vertex();

};


%make_alias(HLRBRep_AreaLimit)

%extend HLRBRep_AreaLimit {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class HLRBRep_BCurveTool *
***************************/
class HLRBRep_BCurveTool {
	public:
		/****** HLRBRep_BCurveTool::BSpline ******/
		/****** md5 signature: b6873b347279da91579a1c61a74b3de0 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Bezier ******/
		/****** md5 signature: 0a5d03b5ef6bf2fb813f5e3198980c26 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Circle ******/
		/****** md5 signature: 0cf7c3945482c36f79dd47dd08589e1d ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		static gp_Circ Circle(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Continuity ******/
		/****** md5 signature: affea448674e0387be6c62c004be746c ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::D0 ******/
		/****** md5 signature: b35994698035f470e1acfda4da9e5f34 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const BRepAdaptor_Curve & C, const double U, gp_Pnt & P);

		/****** HLRBRep_BCurveTool::D1 ******/
		/****** md5 signature: f65d9a4455551061cafcd8839c1e8e76 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const BRepAdaptor_Curve & C, const double U, gp_Pnt & P, gp_Vec & V);

		/****** HLRBRep_BCurveTool::D2 ******/
		/****** md5 signature: e069236d95cfcc6197d547048ab09cf7 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const BRepAdaptor_Curve & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** HLRBRep_BCurveTool::D3 ******/
		/****** md5 signature: 0e962f171995135475787492e88fb14c ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const BRepAdaptor_Curve & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** HLRBRep_BCurveTool::DN ******/
		/****** md5 signature: f81239d13f54d957d772b21d2ffa6aff ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: double
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec DN(const BRepAdaptor_Curve & C, const double U, const int N);

		/****** HLRBRep_BCurveTool::Degree ******/
		/****** md5 signature: 6da935808b28abefc9f94f2db97b43c8 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static int Degree(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Ellipse ******/
		/****** md5 signature: 71a2e5fcf431d07468fd52c7359140be ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips Ellipse(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::FirstParameter ******/
		/****** md5 signature: a921190cd233fea4fdaf8a9d5e9ba0ad ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::GetType ******/
		/****** md5 signature: 31fa720443f4ab9e306493e70c80396d ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Hyperbola ******/
		/****** md5 signature: c3f7b506bdb7de4c10fd3fca41bd5f68 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr Hyperbola(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Intervals ******/
		/****** md5 signature: a31b9bb1dc00b01a10e06528e0e359c3 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const BRepAdaptor_Curve & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** HLRBRep_BCurveTool::IsClosed ******/
		/****** md5 signature: c9743e180e75185eec7f6e077fa80626 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static bool IsClosed(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::IsPeriodic ******/
		/****** md5 signature: f2322cfd305cc4c6ae2eed56958041e4 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static bool IsPeriodic(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::IsRational ******/
		/****** md5 signature: 729288a9ff1d03be44d090411e2a4446 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		static bool IsRational(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::LastParameter ******/
		/****** md5 signature: 4de56dd4974681edb53fc4384c2df197 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Line ******/
		/****** md5 signature: 2112d4fa4fd46aab85b2063d90b4cca7 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		static gp_Lin Line(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::NbIntervals ******/
		/****** md5 signature: 390ea00267ddcfdaa05dea3652eb99a6 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static int NbIntervals(const BRepAdaptor_Curve & C, const GeomAbs_Shape S);

		/****** HLRBRep_BCurveTool::NbKnots ******/
		/****** md5 signature: 47e8f3072b12706af81625ae33285948 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		static int NbKnots(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::NbPoles ******/
		/****** md5 signature: 91dd67a2c652cdebe6b6ef6c3a840201 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		static int NbPoles(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::NbSamples ******/
		/****** md5 signature: bfc7c1ac9de07749995decee4f3257c4 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const BRepAdaptor_Curve & C, const double U0, const double U1);

		/****** HLRBRep_BCurveTool::Parabola ******/
		/****** md5 signature: fdbc46a61fb7fc963accfa5567aefdd3 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab Parabola(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Period ******/
		/****** md5 signature: 46ef8698d4d5f09dd1bd5cd52a01a720 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Poles ******/
		/****** md5 signature: 0d15a58610f4a6f9992a74d517b0b56e ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
T: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		static void Poles(const BRepAdaptor_Curve & C, TColgp_Array1OfPnt & T);

		/****** HLRBRep_BCurveTool::PolesAndWeights ******/
		/****** md5 signature: 4642a2df77806b299a089c1d9708425b ******/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
T: TColgp_Array1OfPnt
W: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") PolesAndWeights;
		static void PolesAndWeights(const BRepAdaptor_Curve & C, TColgp_Array1OfPnt & T, TColStd_Array1OfReal & W);

		/****** HLRBRep_BCurveTool::Resolution ******/
		/****** md5 signature: 8d1ff32cfbd3fd022cd36944eb214f13 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const BRepAdaptor_Curve & C, const double R3d);

		/****** HLRBRep_BCurveTool::Value ******/
		/****** md5 signature: d67c5b7f2895adcc19240fc5cdd383ff ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt Value(const BRepAdaptor_Curve & C, const double U);

};


%extend HLRBRep_BCurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRBRep_BSurfaceTool *
*****************************/
/************************
* class HLRBRep_BiPnt2D *
************************/
class HLRBRep_BiPnt2D {
	public:
		/****** HLRBRep_BiPnt2D::HLRBRep_BiPnt2D ******/
		/****** md5 signature: 5222eb713abf9c22008977029d3c38bb ******/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D();

		/****** HLRBRep_BiPnt2D::HLRBRep_BiPnt2D ******/
		/****** md5 signature: bf5e8a129b14aa2a0cf0103cfa6ac484 ******/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "
Parameters
----------
x1: double
y1: double
x2: double
y2: double
S: TopoDS_Shape
reg1: bool
regn: bool
outl: bool
intl: bool

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D(const double x1, const double y1, const double x2, const double y2, const TopoDS_Shape & S, const bool reg1, const bool regn, const bool outl, const bool intl);

		/****** HLRBRep_BiPnt2D::HLRBRep_BiPnt2D ******/
		/****** md5 signature: 49f9e057e7f014acc20d98fa426041fb ******/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "
Parameters
----------
thePoint1: gp_XY
thePoint2: gp_XY
S: TopoDS_Shape
reg1: bool
regn: bool
outl: bool
intl: bool

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D(const gp_XY & thePoint1, const gp_XY & thePoint2, const TopoDS_Shape & S, const bool reg1, const bool regn, const bool outl, const bool intl);

		/****** HLRBRep_BiPnt2D::IntLine ******/
		/****** md5 signature: c9edcd05c0ec34762bc524e689d9f660 ******/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntLine;
		bool IntLine();

		/****** HLRBRep_BiPnt2D::IntLine ******/
		/****** md5 signature: f256923667b92d1083769dbd58725016 ******/
		%feature("compactdefaultargs") IntLine;
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
") IntLine;
		void IntLine(const bool B);

		/****** HLRBRep_BiPnt2D::OutLine ******/
		/****** md5 signature: 42477242ba91d27bc1eca8a82bfa084d ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		bool OutLine();

		/****** HLRBRep_BiPnt2D::OutLine ******/
		/****** md5 signature: f28eafd4b7d27aa4a239d843dbdb30c1 ******/
		%feature("compactdefaultargs") OutLine;
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
") OutLine;
		void OutLine(const bool B);

		/****** HLRBRep_BiPnt2D::P1 ******/
		/****** md5 signature: 1b12b3d4ce274b258fc80c09f73b8981 ******/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") P1;
		const gp_Pnt2d P1();

		/****** HLRBRep_BiPnt2D::P2 ******/
		/****** md5 signature: 8eaf12f14ffeaaa4e7c3dfc243123291 ******/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") P2;
		const gp_Pnt2d P2();

		/****** HLRBRep_BiPnt2D::Rg1Line ******/
		/****** md5 signature: 2fe8ba46c5783bf24f6be03f02a12483 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		bool Rg1Line();

		/****** HLRBRep_BiPnt2D::Rg1Line ******/
		/****** md5 signature: 42a79575c6aef6c3cb7b530ee0aad078 ******/
		%feature("compactdefaultargs") Rg1Line;
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
") Rg1Line;
		void Rg1Line(const bool B);

		/****** HLRBRep_BiPnt2D::RgNLine ******/
		/****** md5 signature: 4d91c982e83f116a8b076b5c72ecd8df ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		bool RgNLine();

		/****** HLRBRep_BiPnt2D::RgNLine ******/
		/****** md5 signature: f244442396bb29b5e7c9917acbcf1d62 ******/
		%feature("compactdefaultargs") RgNLine;
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
") RgNLine;
		void RgNLine(const bool B);

		/****** HLRBRep_BiPnt2D::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** HLRBRep_BiPnt2D::Shape ******/
		/****** md5 signature: 68fa381a32d13461e712c03a43927c8b ******/
		%feature("compactdefaultargs") Shape;
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
") Shape;
		void Shape(const TopoDS_Shape & S);

};


%extend HLRBRep_BiPnt2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class HLRBRep_BiPoint *
************************/
class HLRBRep_BiPoint {
	public:
		/****** HLRBRep_BiPoint::HLRBRep_BiPoint ******/
		/****** md5 signature: 23f973eb3a4b8708e47e313d2a38e222 ******/
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_BiPoint;
		 HLRBRep_BiPoint();

		/****** HLRBRep_BiPoint::HLRBRep_BiPoint ******/
		/****** md5 signature: 70a7b6c7ccd4eefe171e86cbb934f2d9 ******/
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", "
Parameters
----------
x1: double
y1: double
z1: double
x2: double
y2: double
z2: double
S: TopoDS_Shape
reg1: bool
regn: bool
outl: bool
intl: bool

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_BiPoint;
		 HLRBRep_BiPoint(const double x1, const double y1, const double z1, const double x2, const double y2, const double z2, const TopoDS_Shape & S, const bool reg1, const bool regn, const bool outl, const bool intl);

		/****** HLRBRep_BiPoint::IntLine ******/
		/****** md5 signature: c9edcd05c0ec34762bc524e689d9f660 ******/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntLine;
		bool IntLine();

		/****** HLRBRep_BiPoint::IntLine ******/
		/****** md5 signature: f256923667b92d1083769dbd58725016 ******/
		%feature("compactdefaultargs") IntLine;
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
") IntLine;
		void IntLine(const bool B);

		/****** HLRBRep_BiPoint::OutLine ******/
		/****** md5 signature: 42477242ba91d27bc1eca8a82bfa084d ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		bool OutLine();

		/****** HLRBRep_BiPoint::OutLine ******/
		/****** md5 signature: f28eafd4b7d27aa4a239d843dbdb30c1 ******/
		%feature("compactdefaultargs") OutLine;
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
") OutLine;
		void OutLine(const bool B);

		/****** HLRBRep_BiPoint::P1 ******/
		/****** md5 signature: 08246bf94221b70fda85865c49f42ef1 ******/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") P1;
		const gp_Pnt P1();

		/****** HLRBRep_BiPoint::P2 ******/
		/****** md5 signature: 6202ce89be435d3c7cfefad65bb7fbca ******/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") P2;
		const gp_Pnt P2();

		/****** HLRBRep_BiPoint::Rg1Line ******/
		/****** md5 signature: 2fe8ba46c5783bf24f6be03f02a12483 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		bool Rg1Line();

		/****** HLRBRep_BiPoint::Rg1Line ******/
		/****** md5 signature: 42a79575c6aef6c3cb7b530ee0aad078 ******/
		%feature("compactdefaultargs") Rg1Line;
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
") Rg1Line;
		void Rg1Line(const bool B);

		/****** HLRBRep_BiPoint::RgNLine ******/
		/****** md5 signature: 4d91c982e83f116a8b076b5c72ecd8df ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		bool RgNLine();

		/****** HLRBRep_BiPoint::RgNLine ******/
		/****** md5 signature: f244442396bb29b5e7c9917acbcf1d62 ******/
		%feature("compactdefaultargs") RgNLine;
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
") RgNLine;
		void RgNLine(const bool B);

		/****** HLRBRep_BiPoint::Shape ******/
		/****** md5 signature: 1058569f5d639354fedf11e73741b7df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

		/****** HLRBRep_BiPoint::Shape ******/
		/****** md5 signature: 68fa381a32d13461e712c03a43927c8b ******/
		%feature("compactdefaultargs") Shape;
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
") Shape;
		void Shape(const TopoDS_Shape & S);

};


%extend HLRBRep_BiPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class HLRBRep_CInter *
***********************/
class HLRBRep_CInter : public IntRes2d_Intersection {
	public:
		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: e0f07d27cf95e76e27fff83d9794da53 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") HLRBRep_CInter;
		 HLRBRep_CInter();

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: 753a4c043668406b0d4d5530163ec6bb ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Self Intersection of a curve.
") HLRBRep_CInter;
		 HLRBRep_CInter(const HLRBRep_CurvePtr & C, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: fd3faa41891499498a4a628663deb6c8 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
D: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Self Intersection of a curve with a domain.
") HLRBRep_CInter;
		 HLRBRep_CInter(const HLRBRep_CurvePtr & C, const IntRes2d_Domain & D, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: a1cbc9536dff0c0c08487b2705606a22 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
C2: HLRBRep_CurvePtr
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const HLRBRep_CurvePtr & C1, const HLRBRep_CurvePtr & C2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: 7f5e083e48dfdade771d0b51f0938572 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
D1: IntRes2d_Domain
C2: HLRBRep_CurvePtr
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const HLRBRep_CurvePtr & C1, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & C2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: f3b72083116258aaffd90c851b27e29e ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
C2: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const HLRBRep_CurvePtr & C1, const HLRBRep_CurvePtr & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: de7c55e95f04b3eadfdc828ad968f991 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
D1: IntRes2d_Domain
C2: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const HLRBRep_CurvePtr & C1, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::ComputeDomain ******/
		/****** md5 signature: b0f060887e6c70bf3c91432139f66d7b ******/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
TolDomain: double

Return
-------
IntRes2d_Domain

Description
-----------
Create a domain from a curve.
") ComputeDomain;
		IntRes2d_Domain ComputeDomain(const HLRBRep_CurvePtr & C1, const double TolDomain);

		/****** HLRBRep_CInter::GetMinNbSamples ******/
		/****** md5 signature: fd21667dcec0124f6dfae4103cb5ec2b ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		int GetMinNbSamples();

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 750f695a4069772b93981be4be9b80e1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
D1: IntRes2d_Domain
C2: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const HLRBRep_CurvePtr & C1, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 3090834db8fce41cb32baa2244dfccbe ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
C2: HLRBRep_CurvePtr
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const HLRBRep_CurvePtr & C1, const HLRBRep_CurvePtr & C2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: baf3b2bc66dbb3d49db662e6d89fd6ca ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
D1: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const HLRBRep_CurvePtr & C1, const IntRes2d_Domain & D1, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 0d1c5946fca54fe494efd43c6b857d2e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const HLRBRep_CurvePtr & C1, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: af88dd9fccdc440c91192f81279dcfad ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
D1: IntRes2d_Domain
C2: HLRBRep_CurvePtr
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const HLRBRep_CurvePtr & C1, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & C2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 2e1dddc653fb50b897969b60e2adbd25 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
C2: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const HLRBRep_CurvePtr & C1, const HLRBRep_CurvePtr & C2, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_CInter::SetMinNbSamples ******/
		/****** md5 signature: 9d653919fbe121787c6b21a6579f45a2 ******/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "
Parameters
----------
theMinNbSamples: int

Return
-------
None

Description
-----------
Set / get minimum number of points in polygon intersection.
") SetMinNbSamples;
		void SetMinNbSamples(const int theMinNbSamples);

};


%extend HLRBRep_CInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRBRep_CLPropsATool *
*****************************/
class HLRBRep_CLPropsATool {
	public:
		/****** HLRBRep_CLPropsATool::Continuity ******/
		/****** md5 signature: d8a5fa9d7838757f3ea8354eabd3fd1a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *

Return
-------
int

Description
-----------
returns the order of continuity of the curve <C>. returns 1: first derivative only is computable. returns 2: first and second derivative only are computable. returns 3: first, second and third are computable.
") Continuity;
		static int Continuity(const HLRBRep_Curve * A);

		/****** HLRBRep_CLPropsATool::D1 ******/
		/****** md5 signature: 1c0a6e76998104ff7a6ad0f54069291c ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: double
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.
") D1;
		static void D1(const HLRBRep_Curve * A, const double U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** HLRBRep_CLPropsATool::D2 ******/
		/****** md5 signature: bba033efe55437c7d7ba4ba59cd84e30 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.
") D2;
		static void D2(const HLRBRep_Curve * A, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** HLRBRep_CLPropsATool::D3 ******/
		/****** md5 signature: 23984aaf8e0c75457154a3912a489d3f ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.
") D3;
		static void D3(const HLRBRep_Curve * A, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** HLRBRep_CLPropsATool::FirstParameter ******/
		/****** md5 signature: 3512a5a187a28e91f94a1961b1012523 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *

Return
-------
double

Description
-----------
returns the first parameter bound of the curve.
") FirstParameter;
		static double FirstParameter(const HLRBRep_Curve * A);

		/****** HLRBRep_CLPropsATool::LastParameter ******/
		/****** md5 signature: c2fd6fa37e79742a49374c10da0cdbd0 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *

Return
-------
double

Description
-----------
returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.
") LastParameter;
		static double LastParameter(const HLRBRep_Curve * A);

		/****** HLRBRep_CLPropsATool::Value ******/
		/****** md5 signature: 967944baace8d02029e18e093678ddd9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> on the Curve from HLRBRep <C>.
") Value;
		static void Value(const HLRBRep_Curve * A, const double U, gp_Pnt2d & P);

};


%extend HLRBRep_CLPropsATool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class HLRBRep_Curve *
**********************/
class HLRBRep_Curve {
	public:
		/****** HLRBRep_Curve::HLRBRep_Curve ******/
		/****** md5 signature: c465664e10860b6d84cb352353af9061 ******/
		%feature("compactdefaultargs") HLRBRep_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined Curve.
") HLRBRep_Curve;
		 HLRBRep_Curve();

		/****** HLRBRep_Curve::Circle ******/
		/****** md5 signature: 3db788e83f60e9102eb4d18e49dde44e ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		gp_Circ2d Circle();

		/****** HLRBRep_Curve::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** HLRBRep_Curve::Curve ******/
		/****** md5 signature: ad1240d56a791b18da85f7b9f3ee14ae ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
BRepAdaptor_Curve

Description
-----------
Returns the 3D curve.
") Curve;
		BRepAdaptor_Curve & Curve();

		/****** HLRBRep_Curve::Curve ******/
		/****** md5 signature: ef4d9d136c06cdf0b17cfd2ce1ca5af9 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Sets the 3D curve to be projected.
") Curve;
		void Curve(const TopoDS_Edge & E);

		/****** HLRBRep_Curve::D0 ******/
		/****** md5 signature: d44fc8b79f74fec79a6c1299c0966002 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the 3D point of parameter U on the curve.
") D0;
		void D0(const double U, gp_Pnt & P);

		/****** HLRBRep_Curve::D0 ******/
		/****** md5 signature: 84a53c546460cdfb18006d071bc91bb3 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const double U, gp_Pnt2d & P);

		/****** HLRBRep_Curve::D1 ******/
		/****** md5 signature: d19244fa24a36e163186f27b658fb38a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative.
") D1;
		void D1(const double U, gp_Pnt & P, gp_Vec & V);

		/****** HLRBRep_Curve::D1 ******/
		/****** md5 signature: 48c43d05c08267ed29499f9f800a10f7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		void D1(const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** HLRBRep_Curve::D2 ******/
		/****** md5 signature: 88c09fb237eeb094775e8973f548f176 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Raised if the continuity of the current interval is not C2.
") D2;
		void D2(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** HLRBRep_Curve::D3 ******/
		/****** md5 signature: aa71b4d4aec7c2fb22715bc2e3045b04 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		void D3(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** HLRBRep_Curve::DN ******/
		/****** md5 signature: ce0658955cf7ca6cb009d11c1a9081f7 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec2d DN(const double U, const int N);

		/****** HLRBRep_Curve::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** HLRBRep_Curve::Ellipse ******/
		/****** md5 signature: 4d2fb3c954fc20d00e7fb670cc75b8c5 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips2d Ellipse();

		/****** HLRBRep_Curve::FirstParameter ******/
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** HLRBRep_Curve::GetCurve ******/
		/****** md5 signature: 7d94e917f4c49b684e552ce75cc9abb1 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
BRepAdaptor_Curve

Description
-----------
Returns the 3D curve.
") GetCurve;
		BRepAdaptor_Curve GetCurve();

		/****** HLRBRep_Curve::GetType ******/
		/****** md5 signature: 6d4e6ae7972633971ba343e8afc91aa1 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		GeomAbs_CurveType GetType();

		/****** HLRBRep_Curve::Hyperbola ******/
		/****** md5 signature: 0bf75fd35e804f23a63a4cf957882adb ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****** HLRBRep_Curve::Intervals ******/
		/****** md5 signature: e4977c3906016e087e932448dc6271e5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** HLRBRep_Curve::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** HLRBRep_Curve::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** HLRBRep_Curve::IsRational ******/
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** HLRBRep_Curve::Knots ******/
		/****** md5 signature: 3afa22b3da08a0aed58b72fd3aa55c9f ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
kn: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & kn);

		/****** HLRBRep_Curve::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** HLRBRep_Curve::Line ******/
		/****** md5 signature: 8f714dea9190d608a011f61fa588b4f4 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		gp_Lin2d Line();

		/****** HLRBRep_Curve::Multiplicities ******/
		/****** md5 signature: 032d01361c1675bd452af6e944010796 ******/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "
Parameters
----------
mu: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & mu);

		/****** HLRBRep_Curve::NbIntervals ******/
		/****** md5 signature: a8ba1446e056c10b55516babe8124726 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** HLRBRep_Curve::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** HLRBRep_Curve::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** HLRBRep_Curve::Parabola ******/
		/****** md5 signature: b95e4eaba6ed0e103a45829a8ad74d91 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		gp_Parab2d Parabola();

		/****** HLRBRep_Curve::Parameter2d ******/
		/****** md5 signature: ec24c34a95c3e5c244272e55a0aa85d8 ******/
		%feature("compactdefaultargs") Parameter2d;
		%feature("autodoc", "
Parameters
----------
P3d: double

Return
-------
double

Description
-----------
Returns the parameter on the 2d curve from the parameter on the 3d curve.
") Parameter2d;
		double Parameter2d(const double P3d);

		/****** HLRBRep_Curve::Parameter3d ******/
		/****** md5 signature: cb4c8a2e8d5d31d044ef685297bd9338 ******/
		%feature("compactdefaultargs") Parameter3d;
		%feature("autodoc", "
Parameters
----------
P2d: double

Return
-------
double

Description
-----------
Returns the parameter on the 3d curve from the parameter on the 2d curve.
") Parameter3d;
		double Parameter3d(const double P2d);

		/****** HLRBRep_Curve::Period ******/
		/****** md5 signature: 46c44a3d0a70e4379c4de5440be6b09a ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** HLRBRep_Curve::Poles ******/
		/****** md5 signature: 6543f5043f68da7f8af4e00bc4e83cdd ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
TP: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		void Poles(TColgp_Array1OfPnt2d & TP);

		/****** HLRBRep_Curve::Poles ******/
		/****** md5 signature: e2584a859a1af0e2a9b1dbeb83ee9676 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
aCurve: Geom_BSplineCurve
TP: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		void Poles(const opencascade::handle<Geom_BSplineCurve> & aCurve, TColgp_Array1OfPnt2d & TP);

		/****** HLRBRep_Curve::PolesAndWeights ******/
		/****** md5 signature: 5353d3c5bd5899a90e860821f1a7a585 ******/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "
Parameters
----------
TP: TColgp_Array1OfPnt2d
TW: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") PolesAndWeights;
		void PolesAndWeights(TColgp_Array1OfPnt2d & TP, TColStd_Array1OfReal & TW);

		/****** HLRBRep_Curve::PolesAndWeights ******/
		/****** md5 signature: c48b32a091e146e6b2e8848d1248c442 ******/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "
Parameters
----------
aCurve: Geom_BSplineCurve
TP: TColgp_Array1OfPnt2d
TW: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") PolesAndWeights;
		void PolesAndWeights(const opencascade::handle<Geom_BSplineCurve> & aCurve, TColgp_Array1OfPnt2d & TP, TColStd_Array1OfReal & TW);

		/****** HLRBRep_Curve::Projector ******/
		/****** md5 signature: 410e9a0b959e6b25e2fe54ccebda5aa1 ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "
Parameters
----------
Proj: HLRAlgo_Projector *

Return
-------
None

Description
-----------
No available documentation.
") Projector;
		void Projector(const HLRAlgo_Projector * Proj);

		/****** HLRBRep_Curve::Resolution ******/
		/****** md5 signature: 9e003da76059b4ae9d259081be3b319a ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		double Resolution(const double R3d);

		/****** HLRBRep_Curve::Tangent ******/
		/****** md5 signature: 899d1d218e4b60b7649f14cfab407161 ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
AtStart: bool
P: gp_Pnt2d
D: gp_Dir2d

Return
-------
None

Description
-----------
Depending on <AtStart> computes the 2D point and tangent on the curve at sart (or at end). If the first derivative is null look after at start (or before at end) with the second derivative.
") Tangent;
		void Tangent(const bool AtStart, gp_Pnt2d & P, gp_Dir2d & D);

		/****** HLRBRep_Curve::Update ******/
		/****** md5 signature: c94cf0594b94aed4cf4f79d1d50b16ac ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
TotMin: double
TotMax: double

Return
-------
double

Description
-----------
Update the minmax and the internal data.
") Update;
		double Update(double TotMin[16], double TotMax[16]);

		/****** HLRBRep_Curve::UpdateMinMax ******/
		/****** md5 signature: cf428e1cc823b81a27b8632ce5aac46a ******/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "
Parameters
----------
TotMin: double
TotMax: double

Return
-------
double

Description
-----------
Update the minmax returns tol for enlarge;.
") UpdateMinMax;
		double UpdateMinMax(double TotMin[16], double TotMax[16]);

		/****** HLRBRep_Curve::Value ******/
		/****** md5 signature: d81b6c54096547700b91b9c259aefa3c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt2d Value(const double U);

		/****** HLRBRep_Curve::Value3D ******/
		/****** md5 signature: 5b33e153a3e333c25e74f4f62dda364d ******/
		%feature("compactdefaultargs") Value3D;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the 3D point of parameter U on the curve.
") Value3D;
		gp_Pnt Value3D(const double U);

		/****** HLRBRep_Curve::Z ******/
		/****** md5 signature: 795679f3a86979537c899081d99a7723 ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
double

Description
-----------
Computes the Z coordinate of the point of parameter U on the curve in the viewing coordinate system.
") Z;
		double Z(const double U);

};


%extend HLRBRep_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class HLRBRep_CurveTool *
**************************/
class HLRBRep_CurveTool {
	public:
		/****** HLRBRep_CurveTool::BSpline ******/
		/****** md5 signature: 48cf428c5a3991e17ba296d82cd29fc2 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Bezier ******/
		/****** md5 signature: 90c432e875e7d3ff25d9a36c4dfa8ee7 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Circle ******/
		/****** md5 signature: 5ccca221cb3eb0f994c13c1bfe961144 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		static gp_Circ2d Circle(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Continuity ******/
		/****** md5 signature: 0d2ba274b60148a44ca11a0fad57a8c2 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::D0 ******/
		/****** md5 signature: ea3ee4d226b91cab12278ad6098ed93b ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const HLRBRep_CurvePtr C, const double U, gp_Pnt2d & P);

		/****** HLRBRep_CurveTool::D1 ******/
		/****** md5 signature: 7c448c6929a6ce289730f289a29fa619 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
U: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const HLRBRep_CurvePtr C, const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** HLRBRep_CurveTool::D2 ******/
		/****** md5 signature: 0629ad814f6c260e608367b1d531d781 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const HLRBRep_CurvePtr C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** HLRBRep_CurveTool::D3 ******/
		/****** md5 signature: 2b2fc286058ebca97663b678b2e9b491 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const HLRBRep_CurvePtr C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** HLRBRep_CurveTool::DN ******/
		/****** md5 signature: 5ca0e33626391025dcc8423df7a0c035 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec2d DN(const HLRBRep_CurvePtr C, const double U, const int N);

		/****** HLRBRep_CurveTool::Degree ******/
		/****** md5 signature: 1483654dba220c337da427e695456928 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static int Degree(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Ellipse ******/
		/****** md5 signature: b23034b7a21a23eb3c58702d68d116c6 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips2d Ellipse(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::EpsX ******/
		/****** md5 signature: b83df5fbb04ee19466f3970e3e2da398 ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
double

Description
-----------
No available documentation.
") EpsX;
		static double EpsX(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::FirstParameter ******/
		/****** md5 signature: 98090e22b8fb291b0da76ef82e3463e7 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::GetInterval ******/
		/****** md5 signature: 4521a0981466a5375ccc73c03427bbce ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
Index: int
Tab: TColStd_Array1OfReal

Return
-------
U1: double
U2: double

Description
-----------
output the bounds of interval of index <Index> used if Type == Composite.
") GetInterval;
		static void GetInterval(const HLRBRep_CurvePtr C, const int Index, const TColStd_Array1OfReal & Tab, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_CurveTool::GetType ******/
		/****** md5 signature: d524700e42afa8f5bfb332726b6d6c9b ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Hyperbola ******/
		/****** md5 signature: 83f92de389ce9e3f618ccf947942d6b3 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Intervals ******/
		/****** md5 signature: ef3eb671433db1b9997b8d7ef124aaab ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
T: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const HLRBRep_CurvePtr C, TColStd_Array1OfReal & T);

		/****** HLRBRep_CurveTool::IsClosed ******/
		/****** md5 signature: b50992c5abf2dfdbe4c1043f558515c1 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static bool IsClosed(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::IsPeriodic ******/
		/****** md5 signature: a3ecf71ef5349e12d6a7f6ea0cda555f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static bool IsPeriodic(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::LastParameter ******/
		/****** md5 signature: 1adf179694a1ee212b1b7809ea1383a6 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Line ******/
		/****** md5 signature: 80ed101e333af9693270d8a1c447711f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		static gp_Lin2d Line(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::NbIntervals ******/
		/****** md5 signature: 7f110d9bb4ffbbc715cbba400cc722e2 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static int NbIntervals(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::NbSamples ******/
		/****** md5 signature: b64e41aa4af617798881b59caa7dc47d ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const HLRBRep_CurvePtr C, const double U0, const double U1);

		/****** HLRBRep_CurveTool::NbSamples ******/
		/****** md5 signature: 0c2735a36cfcad2a9537e3092dbef5fa ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Parabola ******/
		/****** md5 signature: 484e48738eebee30b6308bc66dffe9f8 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab2d Parabola(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Period ******/
		/****** md5 signature: c7cb3a7f292aee7c7a5c3ec91d84dbf8 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Resolution ******/
		/****** md5 signature: 030350684f9102f3e2d3889e3652ccf9 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const HLRBRep_CurvePtr C, const double R3d);

		/****** HLRBRep_CurveTool::TheType ******/
		/****** md5 signature: ed286c8397ae84cbfc135dd79e94a85b ******/
		%feature("compactdefaultargs") TheType;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") TheType;
		static GeomAbs_CurveType TheType(const HLRBRep_CurvePtr C);

		/****** HLRBRep_CurveTool::Value ******/
		/****** md5 signature: 414a27afbb756b0bf2a7fba04d9df38f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const HLRBRep_CurvePtr C, const double U);

};


%extend HLRBRep_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class HLRBRep_Data *
*********************/
class HLRBRep_Data : public Standard_Transient {
	public:
		/****** HLRBRep_Data::HLRBRep_Data ******/
		/****** md5 signature: 2aa3dcfc948cefc35f2bb5c450d6b349 ******/
		%feature("compactdefaultargs") HLRBRep_Data;
		%feature("autodoc", "
Parameters
----------
NV: int
NE: int
NF: int

Return
-------
None

Description
-----------
Create an empty data structure of <NV> vertices, <NE> edges and <NF> faces.
") HLRBRep_Data;
		 HLRBRep_Data(const int NV, const int NE, const int NF);

		/****** HLRBRep_Data::AboveInterference ******/
		/****** md5 signature: 68020114fcc3e55d79dc86a6ab0c18eb ******/
		%feature("compactdefaultargs") AboveInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the rejected interference is above the face.
") AboveInterference;
		bool AboveInterference();

		/****** HLRBRep_Data::Classify ******/
		/****** md5 signature: 9d61b0cd0bd9809580baf4328241ac06 ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData
LevelFlag: bool
param: double

Return
-------
Level: int

Description
-----------
Classification of an edge.
") Classify;
		TopAbs_State Classify(const int E, const HLRBRep_EdgeData & ED, const bool LevelFlag, Standard_Integer &OutValue, const double param);

		/****** HLRBRep_Data::Compare ******/
		/****** md5 signature: defeb714fc3592d25018a49a5258ddea ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData

Return
-------
TopAbs_State

Description
-----------
Returns the state of the Edge <ED> after classification.
") Compare;
		TopAbs_State Compare(const int E, const HLRBRep_EdgeData & ED);

		/****** HLRBRep_Data::Destroy ******/
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

		/****** HLRBRep_Data::EDataArray ******/
		/****** md5 signature: 3967fd7fa4611f0a451224ebca623643 ******/
		%feature("compactdefaultargs") EDataArray;
		%feature("autodoc", "Return
-------
NCollection_Array1<HLRBRep_EdgeData>

Description
-----------
No available documentation.
") EDataArray;
		NCollection_Array1<HLRBRep_EdgeData> & EDataArray();

		/****** HLRBRep_Data::Edge ******/
		/****** md5 signature: d6bcd55b8bae579e7b4b7931e982c5a2 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current Edge.
") Edge;
		int Edge();

		/****** HLRBRep_Data::EdgeMap ******/
		/****** md5 signature: d6b5be9f774da77b92680157a4c86616 ******/
		%feature("compactdefaultargs") EdgeMap;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
No available documentation.
") EdgeMap;
		TopTools_IndexedMapOfShape & EdgeMap();

		/****** HLRBRep_Data::EdgeOfTheHidingFace ******/
		/****** md5 signature: 08213348ed94cfe4b060fbc09877a01d ******/
		%feature("compactdefaultargs") EdgeOfTheHidingFace;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData

Return
-------
bool

Description
-----------
Returns the true if the Edge <ED> belongs to the Hiding Face.
") EdgeOfTheHidingFace;
		bool EdgeOfTheHidingFace(const int E, const HLRBRep_EdgeData & ED);

		/****** HLRBRep_Data::EdgeState ******/
		/****** md5 signature: ddbc57929fb7a561c12e678d099b228c ******/
		%feature("compactdefaultargs") EdgeState;
		%feature("autodoc", "
Parameters
----------
p1: double
p2: double

Return
-------
stbef: TopAbs_State
staf: TopAbs_State

Description
-----------
Returns the local 3D state of the intersection between the current edge and the current face at the <p1> and <p2> parameters.
") EdgeState;
		void EdgeState(const double p1, const double p2, TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** HLRBRep_Data::FDataArray ******/
		/****** md5 signature: c4085eed8f6ba41ff924ad535f4b713a ******/
		%feature("compactdefaultargs") FDataArray;
		%feature("autodoc", "Return
-------
NCollection_Array1<HLRBRep_FaceData>

Description
-----------
No available documentation.
") FDataArray;
		NCollection_Array1<HLRBRep_FaceData> & FDataArray();

		/****** HLRBRep_Data::FaceMap ******/
		/****** md5 signature: 718d1cb996bc5d91553f48bd6252bde5 ******/
		%feature("compactdefaultargs") FaceMap;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
No available documentation.
") FaceMap;
		TopTools_IndexedMapOfShape & FaceMap();

		/****** HLRBRep_Data::HidingStartLevel ******/
		/****** md5 signature: d7f1d2f08157d55975689e62e2cf5967 ******/
		%feature("compactdefaultargs") HidingStartLevel;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData
IL: NCollection_List<HLRAlgo_Interference>

Return
-------
int

Description
-----------
Returns the number of levels of hiding face above the first point of the edge <ED>. The InterferenceList is given to compute far away of the Interferences and then come back.
") HidingStartLevel;
		int HidingStartLevel(const int E, const HLRBRep_EdgeData & ED, const NCollection_List<HLRAlgo_Interference> & IL);

		/****** HLRBRep_Data::HidingTheFace ******/
		/****** md5 signature: 5f51bd8014fcc059a0a0d62ccbf46b47 ******/
		%feature("compactdefaultargs") HidingTheFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current edge to be hidden belongs to the hiding face.
") HidingTheFace;
		bool HidingTheFace();

		/****** HLRBRep_Data::InitBoundSort ******/
		/****** md5 signature: e54fafc8b98724745425c71c1026bbce ******/
		%feature("compactdefaultargs") InitBoundSort;
		%feature("autodoc", "
Parameters
----------
MinMaxTot: HLRAlgo_EdgesBlock::MinMaxIndices
e1: int
e2: int

Return
-------
None

Description
-----------
to compare with only non rejected edges.
") InitBoundSort;
		void InitBoundSort(const HLRAlgo_EdgesBlock::MinMaxIndices & MinMaxTot, const int e1, const int e2);

		/****** HLRBRep_Data::InitEdge ******/
		/****** md5 signature: 22ac47f660b696125a01700e2bae8113 ******/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "
Parameters
----------
FI: int
MST: NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
Begin an iteration only on visible Edges crossing the face number <FI>.
") InitEdge;
		void InitEdge(const int FI, NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher> & MST);

		/****** HLRBRep_Data::InitInterference ******/
		/****** md5 signature: a8142709484fb05b691d3f078c44b3e9 ******/
		%feature("compactdefaultargs") InitInterference;
		%feature("autodoc", "Return
-------
None

Description
-----------
Intersect the current Edge with the boundary of the hiding face. The interferences are given by the More, Next, and Value methods.
") InitInterference;
		void InitInterference();

		/****** HLRBRep_Data::Interference ******/
		/****** md5 signature: f2ea5be2885d51223258b68485612698 ******/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "Return
-------
HLRAlgo_Interference

Description
-----------
No available documentation.
") Interference;
		HLRAlgo_Interference & Interference();

		/****** HLRBRep_Data::IsBadFace ******/
		/****** md5 signature: e6203df9e31aab3efab80295fddb4e6a ******/
		%feature("compactdefaultargs") IsBadFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current face is bad.
") IsBadFace;
		bool IsBadFace();

		/****** HLRBRep_Data::LocalFEGeometry2D ******/
		/****** md5 signature: 06feee72cc510138be07c8a62c799584 ******/
		%feature("compactdefaultargs") LocalFEGeometry2D;
		%feature("autodoc", "
Parameters
----------
FE: int
Param: double
Tg: gp_Dir2d
Nm: gp_Dir2d

Return
-------
Cu: double

Description
-----------
Returns the local description of the projection of the current FEdge at parameter <Param>.
") LocalFEGeometry2D;
		void LocalFEGeometry2D(const int FE, const double Param, gp_Dir2d & Tg, gp_Dir2d & Nm, Standard_Real &OutValue);

		/****** HLRBRep_Data::LocalLEGeometry2D ******/
		/****** md5 signature: 0aef25ab3d78dc6d3b85d2e08b5f57db ******/
		%feature("compactdefaultargs") LocalLEGeometry2D;
		%feature("autodoc", "
Parameters
----------
Param: double
Tg: gp_Dir2d
Nm: gp_Dir2d

Return
-------
Cu: double

Description
-----------
Returns the local description of the projection of the current LEdge at parameter <Param>.
") LocalLEGeometry2D;
		void LocalLEGeometry2D(const double Param, gp_Dir2d & Tg, gp_Dir2d & Nm, Standard_Real &OutValue);

		/****** HLRBRep_Data::MoreEdge ******/
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

		/****** HLRBRep_Data::MoreInterference ******/
		/****** md5 signature: 894ab7b9cf73d5bf20087263670f0f94 ******/
		%feature("compactdefaultargs") MoreInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreInterference;
		bool MoreInterference();

		/****** HLRBRep_Data::NbEdges ******/
		/****** md5 signature: f741965989565caaff095f09d2955db8 ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		int NbEdges();

		/****** HLRBRep_Data::NbFaces ******/
		/****** md5 signature: 33b7583f623284719e1609b133e125ad ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFaces;
		int NbFaces();

		/****** HLRBRep_Data::NbVertices ******/
		/****** md5 signature: 859a4b3acdcc81718e66502bc37368ea ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertices;
		int NbVertices();

		/****** HLRBRep_Data::NextEdge ******/
		/****** md5 signature: a4a1782d788b370d2917b3fc31c78a66 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "
Parameters
----------
skip: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge(const bool skip = true);

		/****** HLRBRep_Data::NextInterference ******/
		/****** md5 signature: 1369cf3e07019b312a7ce479ae0dc594 ******/
		%feature("compactdefaultargs") NextInterference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextInterference;
		void NextInterference();

		/****** HLRBRep_Data::Projector ******/
		/****** md5 signature: d7f508ab183a1a90d9ac0ead0aeb116c ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Return
-------
HLRAlgo_Projector

Description
-----------
No available documentation.
") Projector;
		HLRAlgo_Projector & Projector();

		/****** HLRBRep_Data::RejectedInterference ******/
		/****** md5 signature: 66089660e47dc1797adf7d83dec4b5f1 ******/
		%feature("compactdefaultargs") RejectedInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the interference is rejected.
") RejectedInterference;
		bool RejectedInterference();

		/****** HLRBRep_Data::SimplClassify ******/
		/****** md5 signature: f5f18ac0e813337512c27f7763d30eb2 ******/
		%feature("compactdefaultargs") SimplClassify;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData
Nbp: int
p1: double
p2: double

Return
-------
TopAbs_State

Description
-----------
Simple classification of part of edge [p1, p2]. Returns OUT if at least 1 of Nbp points of edge is out; otherwise returns IN. It is used to check 'suspicion' hidden part of edge.
") SimplClassify;
		TopAbs_State SimplClassify(const int E, const HLRBRep_EdgeData & ED, const int Nbp, const double p1, const double p2);

		/****** HLRBRep_Data::SimpleHidingFace ******/
		/****** md5 signature: d5f204efd30a8ce24d3db7a32a10ff2a ******/
		%feature("compactdefaultargs") SimpleHidingFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current hiding face is not an auto-intersected one.
") SimpleHidingFace;
		bool SimpleHidingFace();

		/****** HLRBRep_Data::Tolerance ******/
		/****** md5 signature: 19b9521e1cd14d74df514315dd8ef145 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
None

Description
-----------
Set the tolerance for the rejections during the exploration.
") Tolerance;
		void Tolerance(const float tol);

		/****** HLRBRep_Data::Tolerance ******/
		/****** md5 signature: 27173cec126fd48cceae62b7a1012170 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the tolerance for the rejections during the exploration.
") Tolerance;
		float Tolerance();

		/****** HLRBRep_Data::Update ******/
		/****** md5 signature: d7a49bc87b072ee91bdb1d6dfd85432d ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
P: HLRAlgo_Projector

Return
-------
None

Description
-----------
end of building of the Data and updating all the information linked to the projection.
") Update;
		void Update(const HLRAlgo_Projector & P);

		/****** HLRBRep_Data::Write ******/
		/****** md5 signature: 3bbceb5f6f67625b95cff61bd48bb0db ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
DS: HLRBRep_Data
dv: int
de: int
df: int

Return
-------
None

Description
-----------
Write <DS> in me with a translation of <dv>,<de>,<df>.
") Write;
		void Write(const opencascade::handle<HLRBRep_Data> & DS, const int dv, const int de, const int df);

};


%make_alias(HLRBRep_Data)

%extend HLRBRep_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class HLRBRep_EdgeBuilder *
****************************/
class HLRBRep_EdgeBuilder {
	public:
		/****** HLRBRep_EdgeBuilder::HLRBRep_EdgeBuilder ******/
		/****** md5 signature: 9a90ccef178041752c05e72c933c614b ******/
		%feature("compactdefaultargs") HLRBRep_EdgeBuilder;
		%feature("autodoc", "
Parameters
----------
VList: HLRBRep_VertexList

Return
-------
None

Description
-----------
Creates an EdgeBuilder algorithm. <VList> describes the edge and the interferences. AreaLimits are created from the vertices. Builds(IN) is automatically called.
") HLRBRep_EdgeBuilder;
		 HLRBRep_EdgeBuilder(HLRBRep_VertexList & VList);

		/****** HLRBRep_EdgeBuilder::AreaEdgeState ******/
		/****** md5 signature: 57c8af2e06a14365566f4acef5918f24 ******/
		%feature("compactdefaultargs") AreaEdgeState;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the edge state of the current area.
") AreaEdgeState;
		TopAbs_State AreaEdgeState();

		/****** HLRBRep_EdgeBuilder::AreaState ******/
		/****** md5 signature: d1173dc5785d29edd40e7b8ac5ba3679 ******/
		%feature("compactdefaultargs") AreaState;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
Returns the state of the current area.
") AreaState;
		TopAbs_State AreaState();

		/****** HLRBRep_EdgeBuilder::Builds ******/
		/****** md5 signature: 4bcb635d97adc490d1fd8a8a20034a61 ******/
		%feature("compactdefaultargs") Builds;
		%feature("autodoc", "
Parameters
----------
ToBuild: TopAbs_State

Return
-------
None

Description
-----------
Reinitialize the results iteration to the parts with State <ToBuild>. If this method is not called after construction the default is <ToBuild> = IN.
") Builds;
		void Builds(const TopAbs_State ToBuild);

		/****** HLRBRep_EdgeBuilder::Current ******/
		/****** md5 signature: 0e36ea5e4e93af9d6e97cff42aa74163 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
HLRAlgo_Intersection

Description
-----------
Returns the current vertex of the current edge.
") Current;
		const HLRAlgo_Intersection & Current();

		/****** HLRBRep_EdgeBuilder::Destroy ******/
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

		/****** HLRBRep_EdgeBuilder::HasArea ******/
		/****** md5 signature: 691cbd5bc72535ce4a91fac2f03e285f ******/
		%feature("compactdefaultargs") HasArea;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current area.
") HasArea;
		bool HasArea();

		/****** HLRBRep_EdgeBuilder::InitAreas ******/
		/****** md5 signature: 884f1ed2c596da582272e700f151d788 ******/
		%feature("compactdefaultargs") InitAreas;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initialize an iteration on the areas.
") InitAreas;
		void InitAreas();

		/****** HLRBRep_EdgeBuilder::IsBoundary ******/
		/****** md5 signature: e4571934dc233b1ff119256513384992 ******/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex comes from the boundary of the edge.
") IsBoundary;
		bool IsBoundary();

		/****** HLRBRep_EdgeBuilder::IsInterference ******/
		/****** md5 signature: 1c7f51e2a202946534099b00ee6668f5 ******/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex was an interference.
") IsInterference;
		bool IsInterference();

		/****** HLRBRep_EdgeBuilder::LeftLimit ******/
		/****** md5 signature: dc7583eed3b1b2955e4155e3706d2cba ******/
		%feature("compactdefaultargs") LeftLimit;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRBRep_AreaLimit>

Description
-----------
Returns the AreaLimit beginning the current area. This is a NULL handle when the area is infinite on the left.
") LeftLimit;
		opencascade::handle<HLRBRep_AreaLimit> LeftLimit();

		/****** HLRBRep_EdgeBuilder::MoreEdges ******/
		/****** md5 signature: 5427e761ccb333be8c3787807b5804ee ******/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more new edges to build.
") MoreEdges;
		bool MoreEdges();

		/****** HLRBRep_EdgeBuilder::MoreVertices ******/
		/****** md5 signature: 83ca27360b528f6d463b672d75829d0a ******/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if there are more vertices in the current new edge.
") MoreVertices;
		bool MoreVertices();

		/****** HLRBRep_EdgeBuilder::NextArea ******/
		/****** md5 signature: f05125373cb5bdf4fd14c1f424e6a6c9 ******/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set the current area to the next area.
") NextArea;
		void NextArea();

		/****** HLRBRep_EdgeBuilder::NextEdge ******/
		/****** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Proceeds to the next edge to build. Skip all remaining vertices on the current edge.
") NextEdge;
		void NextEdge();

		/****** HLRBRep_EdgeBuilder::NextVertex ******/
		/****** md5 signature: c800122ce4f2c3bd5f52dba7f14e300c ******/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
Proceeds to the next vertex of the current edge.
") NextVertex;
		void NextVertex();

		/****** HLRBRep_EdgeBuilder::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the new orientation of the current vertex.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** HLRBRep_EdgeBuilder::PreviousArea ******/
		/****** md5 signature: f02f42f01273662174ef0f554b9a1381 ******/
		%feature("compactdefaultargs") PreviousArea;
		%feature("autodoc", "Return
-------
None

Description
-----------
Set the current area to the previous area.
") PreviousArea;
		void PreviousArea();

		/****** HLRBRep_EdgeBuilder::RightLimit ******/
		/****** md5 signature: ccd3836bfb7c8abb20422c76df4ce86b ******/
		%feature("compactdefaultargs") RightLimit;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRBRep_AreaLimit>

Description
-----------
Returns the AreaLimit ending the current area. This is a NULL handle when the area is infinite on the right.
") RightLimit;
		opencascade::handle<HLRBRep_AreaLimit> RightLimit();

};


%extend HLRBRep_EdgeBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRBRep_EdgeData *
*************************/
class HLRBRep_EdgeData {
	public:
		/****** HLRBRep_EdgeData::HLRBRep_EdgeData ******/
		/****** md5 signature: 52972d50f33ee119b5b220b1a28e2de6 ******/
		%feature("compactdefaultargs") HLRBRep_EdgeData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_EdgeData;
		 HLRBRep_EdgeData();

		/****** HLRBRep_EdgeData::AutoIntersectionDone ******/
		/****** md5 signature: 9bf425b9a626795fab2a4ebd7a5f8586 ******/
		%feature("compactdefaultargs") AutoIntersectionDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AutoIntersectionDone;
		bool AutoIntersectionDone();

		/****** HLRBRep_EdgeData::AutoIntersectionDone ******/
		/****** md5 signature: 2664a3768a57245c2cece55449583416 ******/
		%feature("compactdefaultargs") AutoIntersectionDone;
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
") AutoIntersectionDone;
		void AutoIntersectionDone(const bool B);

		/****** HLRBRep_EdgeData::ChangeGeometry ******/
		/****** md5 signature: 03555c45150a77119c9d706a589819de ******/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "Return
-------
HLRBRep_Curve

Description
-----------
No available documentation.
") ChangeGeometry;
		HLRBRep_Curve & ChangeGeometry();

		/****** HLRBRep_EdgeData::Curve ******/
		/****** md5 signature: 3d2c0bba3adc9b188e9b5d7d9b519bde ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
HLRBRep_Curve *

Description
-----------
No available documentation.
") Curve;
		HLRBRep_Curve * Curve();

		/****** HLRBRep_EdgeData::CutAtEnd ******/
		/****** md5 signature: 6108ea0d3088b75ce5cd01316aa6a887 ******/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CutAtEnd;
		bool CutAtEnd();

		/****** HLRBRep_EdgeData::CutAtEnd ******/
		/****** md5 signature: c8214bcaa6310ba32429ad4aeb241b69 ******/
		%feature("compactdefaultargs") CutAtEnd;
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
") CutAtEnd;
		void CutAtEnd(const bool B);

		/****** HLRBRep_EdgeData::CutAtSta ******/
		/****** md5 signature: d4805c82c1ab30f808d0366c36b351ee ******/
		%feature("compactdefaultargs") CutAtSta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CutAtSta;
		bool CutAtSta();

		/****** HLRBRep_EdgeData::CutAtSta ******/
		/****** md5 signature: 06f5f15c14f2af193ff46a873bd919a6 ******/
		%feature("compactdefaultargs") CutAtSta;
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
") CutAtSta;
		void CutAtSta(const bool B);

		/****** HLRBRep_EdgeData::Geometry ******/
		/****** md5 signature: 6133351b8e570d82263ecdcf25097ced ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
HLRBRep_Curve

Description
-----------
No available documentation.
") Geometry;
		HLRBRep_Curve Geometry();

		/****** HLRBRep_EdgeData::HideCount ******/
		/****** md5 signature: 67ee3f9769d28728f42227867937e9c3 ******/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") HideCount;
		int HideCount();

		/****** HLRBRep_EdgeData::HideCount ******/
		/****** md5 signature: bde702da73ed785264ef57dd6ec3c3ef ******/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") HideCount;
		void HideCount(const int I);

		/****** HLRBRep_EdgeData::MinMax ******/
		/****** md5 signature: b360e6f636632e8d4f24d53763098bae ******/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "Return
-------
HLRAlgo_EdgesBlock::MinMaxIndices

Description
-----------
No available documentation.
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****** HLRBRep_EdgeData::OutLVEnd ******/
		/****** md5 signature: a538e3527a9d89bf6370f613108db9f9 ******/
		%feature("compactdefaultargs") OutLVEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLVEnd;
		bool OutLVEnd();

		/****** HLRBRep_EdgeData::OutLVEnd ******/
		/****** md5 signature: 774f3e3fbc62ff37d4fd263eda73bd86 ******/
		%feature("compactdefaultargs") OutLVEnd;
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
") OutLVEnd;
		void OutLVEnd(const bool B);

		/****** HLRBRep_EdgeData::OutLVSta ******/
		/****** md5 signature: c29f51b5990997b571b3daeb9bf35239 ******/
		%feature("compactdefaultargs") OutLVSta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLVSta;
		bool OutLVSta();

		/****** HLRBRep_EdgeData::OutLVSta ******/
		/****** md5 signature: 306a5abfe0968495095c5f2e79391905 ******/
		%feature("compactdefaultargs") OutLVSta;
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
") OutLVSta;
		void OutLVSta(const bool B);

		/****** HLRBRep_EdgeData::Rg1Line ******/
		/****** md5 signature: 3603b21f50284c828a3123456ea8453b ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		bool Rg1Line();

		/****** HLRBRep_EdgeData::Rg1Line ******/
		/****** md5 signature: 9b6604bb70a374ebf00c30d6bb0f8be8 ******/
		%feature("compactdefaultargs") Rg1Line;
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
") Rg1Line;
		void Rg1Line(const bool B);

		/****** HLRBRep_EdgeData::RgNLine ******/
		/****** md5 signature: de7907b7f6b0dfc014b9f60c5a4fb82e ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		bool RgNLine();

		/****** HLRBRep_EdgeData::RgNLine ******/
		/****** md5 signature: e25dc744a7cdb743593e8ae60c115782 ******/
		%feature("compactdefaultargs") RgNLine;
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
") RgNLine;
		void RgNLine(const bool B);

		/****** HLRBRep_EdgeData::Selected ******/
		/****** md5 signature: 8641e0f09f52f1e2ed1b07fb3a8de9b1 ******/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Selected;
		bool Selected();

		/****** HLRBRep_EdgeData::Selected ******/
		/****** md5 signature: b9538ce37b46345d234100e61839d1aa ******/
		%feature("compactdefaultargs") Selected;
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
") Selected;
		void Selected(const bool B);

		/****** HLRBRep_EdgeData::Set ******/
		/****** md5 signature: a3b991d85d602e71ec727f3fe16a9ae3 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Reg1: bool
RegN: bool
EG: TopoDS_Edge
V1: int
V2: int
Out1: bool
Out2: bool
Cut1: bool
Cut2: bool
Start: double
TolStart: float
End: double
TolEnd: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const bool Reg1, const bool RegN, const TopoDS_Edge & EG, const int V1, const int V2, const bool Out1, const bool Out2, const bool Cut1, const bool Cut2, const double Start, const float TolStart, const double End, const float TolEnd);

		/****** HLRBRep_EdgeData::Simple ******/
		/****** md5 signature: cb250ada3ae377bdde721bc10127e5c0 ******/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Simple;
		bool Simple();

		/****** HLRBRep_EdgeData::Simple ******/
		/****** md5 signature: a463babaa0601d384101f963702e5967 ******/
		%feature("compactdefaultargs") Simple;
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
") Simple;
		void Simple(const bool B);

		/****** HLRBRep_EdgeData::Status ******/
		/****** md5 signature: ea65a70412c80527ab2445f2a836ebe7 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "Return
-------
HLRAlgo_EdgeStatus

Description
-----------
No available documentation.
") Status;
		HLRAlgo_EdgeStatus & Status();

		/****** HLRBRep_EdgeData::Tolerance ******/
		/****** md5 signature: 27173cec126fd48cceae62b7a1012170 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		float Tolerance();

		/****** HLRBRep_EdgeData::UpdateMinMax ******/
		/****** md5 signature: c563cf49ef5528b88530ee707872c5e6 ******/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "
Parameters
----------
theTotMinMax: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
None

Description
-----------
No available documentation.
") UpdateMinMax;
		void UpdateMinMax(const HLRAlgo_EdgesBlock::MinMaxIndices & theTotMinMax);

		/****** HLRBRep_EdgeData::Used ******/
		/****** md5 signature: 0577abad9132069c233e605d98602a1e ******/
		%feature("compactdefaultargs") Used;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Used;
		bool Used();

		/****** HLRBRep_EdgeData::Used ******/
		/****** md5 signature: c73a79a3540b18c0ba6cf9803a122473 ******/
		%feature("compactdefaultargs") Used;
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
") Used;
		void Used(const bool B);

		/****** HLRBRep_EdgeData::VEnd ******/
		/****** md5 signature: 3632d7c300566dee958caae4a25a830e ******/
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VEnd;
		int VEnd();

		/****** HLRBRep_EdgeData::VEnd ******/
		/****** md5 signature: 8e863328fe625eb54672bf0afcb925ac ******/
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") VEnd;
		void VEnd(const int I);

		/****** HLRBRep_EdgeData::VSta ******/
		/****** md5 signature: b561081e3d638d0187b39f53e1adb4f2 ******/
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VSta;
		int VSta();

		/****** HLRBRep_EdgeData::VSta ******/
		/****** md5 signature: 5b4b677661312da6032c065477d96b07 ******/
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") VSta;
		void VSta(const int I);

		/****** HLRBRep_EdgeData::VerAtEnd ******/
		/****** md5 signature: 201e8da112c6a8aeaa27754b4dc4373e ******/
		%feature("compactdefaultargs") VerAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") VerAtEnd;
		bool VerAtEnd();

		/****** HLRBRep_EdgeData::VerAtEnd ******/
		/****** md5 signature: 0731fb761b79b64ae6c840ea9bf05428 ******/
		%feature("compactdefaultargs") VerAtEnd;
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
") VerAtEnd;
		void VerAtEnd(const bool B);

		/****** HLRBRep_EdgeData::VerAtSta ******/
		/****** md5 signature: 9df0385bcb70dbb8dd7c017797eb0dce ******/
		%feature("compactdefaultargs") VerAtSta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") VerAtSta;
		bool VerAtSta();

		/****** HLRBRep_EdgeData::VerAtSta ******/
		/****** md5 signature: 6f09ed57cf3609efb7e29694ed994775 ******/
		%feature("compactdefaultargs") VerAtSta;
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
") VerAtSta;
		void VerAtSta(const bool B);

		/****** HLRBRep_EdgeData::Vertical ******/
		/****** md5 signature: 7b4649e49770fd1e8f259567304907fd ******/
		%feature("compactdefaultargs") Vertical;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Vertical;
		bool Vertical();

		/****** HLRBRep_EdgeData::Vertical ******/
		/****** md5 signature: 233dc3b0ac8e7d4261bcd6304c3f8c1d ******/
		%feature("compactdefaultargs") Vertical;
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
") Vertical;
		void Vertical(const bool B);

};


%extend HLRBRep_EdgeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRBRep_EdgeFaceTool *
*****************************/
class HLRBRep_EdgeFaceTool {
	public:
		/****** HLRBRep_EdgeFaceTool::CurvatureValue ******/
		/****** md5 signature: 5888d332f0306704c0920ac75148392d ******/
		%feature("compactdefaultargs") CurvatureValue;
		%feature("autodoc", "
Parameters
----------
F: HLRBRep_SurfacePtr
U: double
V: double
Tg: gp_Dir

Return
-------
double

Description
-----------
No available documentation.
") CurvatureValue;
		static double CurvatureValue(const HLRBRep_SurfacePtr F, const double U, const double V, const gp_Dir & Tg);

		/****** HLRBRep_EdgeFaceTool::UVPoint ******/
		/****** md5 signature: 92d0e08cf4766fb3cb6f6daa33b093dc ******/
		%feature("compactdefaultargs") UVPoint;
		%feature("autodoc", "
Parameters
----------
Par: double
E: HLRBRep_CurvePtr
F: HLRBRep_SurfacePtr

Return
-------
U: double
V: double

Description
-----------
return True if U and V are found.
") UVPoint;
		static bool UVPoint(const double Par, const HLRBRep_CurvePtr E, const HLRBRep_SurfacePtr F, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend HLRBRep_EdgeFaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class HLRBRep_EdgeIList *
**************************/
class HLRBRep_EdgeIList {
	public:
		/****** HLRBRep_EdgeIList::AddInterference ******/
		/****** md5 signature: 7f9aad2a5268bc8b72d3bcbbbf46cac4 ******/
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "
Parameters
----------
IL: NCollection_List<HLRAlgo_Interference>
I: HLRAlgo_Interference
T: HLRBRep_EdgeInterferenceTool

Return
-------
None

Description
-----------
Add the interference <I> to the list <IL>.
") AddInterference;
		static void AddInterference(NCollection_List<HLRAlgo_Interference> & IL, const HLRAlgo_Interference & I, const HLRBRep_EdgeInterferenceTool & T);

		/****** HLRBRep_EdgeIList::ProcessComplex ******/
		/****** md5 signature: 721123de42b7cfd7f3a2a0a62e5af96b ******/
		%feature("compactdefaultargs") ProcessComplex;
		%feature("autodoc", "
Parameters
----------
IL: NCollection_List<HLRAlgo_Interference>
T: HLRBRep_EdgeInterferenceTool

Return
-------
None

Description
-----------
Process complex transitions on the list IL.
") ProcessComplex;
		static void ProcessComplex(NCollection_List<HLRAlgo_Interference> & IL, const HLRBRep_EdgeInterferenceTool & T);

};


%extend HLRBRep_EdgeIList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class HLRBRep_EdgeInterferenceTool *
*************************************/
class HLRBRep_EdgeInterferenceTool {
	public:
		/****** HLRBRep_EdgeInterferenceTool::HLRBRep_EdgeInterferenceTool ******/
		/****** md5 signature: 19c0817432716e62e0396a441d2ed010 ******/
		%feature("compactdefaultargs") HLRBRep_EdgeInterferenceTool;
		%feature("autodoc", "
Parameters
----------
DS: HLRBRep_Data

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_EdgeInterferenceTool;
		 HLRBRep_EdgeInterferenceTool(const opencascade::handle<HLRBRep_Data> & DS);

		/****** HLRBRep_EdgeInterferenceTool::CurrentOrientation ******/
		/****** md5 signature: fb7e3ef23411454b6bebf24647845fa3 ******/
		%feature("compactdefaultargs") CurrentOrientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") CurrentOrientation;
		TopAbs_Orientation CurrentOrientation();

		/****** HLRBRep_EdgeInterferenceTool::CurrentParameter ******/
		/****** md5 signature: 17c3d72eb0a530060cafe7a0ba61c46b ******/
		%feature("compactdefaultargs") CurrentParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") CurrentParameter;
		double CurrentParameter();

		/****** HLRBRep_EdgeInterferenceTool::CurrentVertex ******/
		/****** md5 signature: adc69eba4081a42553cc0035dbebe4fc ******/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "Return
-------
HLRAlgo_Intersection

Description
-----------
No available documentation.
") CurrentVertex;
		const HLRAlgo_Intersection & CurrentVertex();

		/****** HLRBRep_EdgeInterferenceTool::EdgeGeometry ******/
		/****** md5 signature: 704f7771703d87206256fbbd7b403cf2 ******/
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", "
Parameters
----------
Param: double
Tgt: gp_Dir
Nrm: gp_Dir

Return
-------
Curv: double

Description
-----------
Returns local geometric description of the Edge at parameter <Para>. See method Reset of class EdgeFaceTransition from TopCnx for other arguments.
") EdgeGeometry;
		void EdgeGeometry(const double Param, gp_Dir & Tgt, gp_Dir & Nrm, Standard_Real &OutValue);

		/****** HLRBRep_EdgeInterferenceTool::InitVertices ******/
		/****** md5 signature: caeaea3f9845f6c8a1c237f8f1908aa4 ******/
		%feature("compactdefaultargs") InitVertices;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitVertices;
		void InitVertices();

		/****** HLRBRep_EdgeInterferenceTool::InterferenceBoundaryGeometry ******/
		/****** md5 signature: bac0593b7c7654d80127f8f63e019472 ******/
		%feature("compactdefaultargs") InterferenceBoundaryGeometry;
		%feature("autodoc", "
Parameters
----------
I: HLRAlgo_Interference
Tang: gp_Dir
Norm: gp_Dir

Return
-------
Curv: double

Description
-----------
Returns the geometry of the boundary at the interference <I>. See the AddInterference method of the class EdgeFaceTransition from TopCnx for the other arguments.
") InterferenceBoundaryGeometry;
		void InterferenceBoundaryGeometry(const HLRAlgo_Interference & I, gp_Dir & Tang, gp_Dir & Norm, Standard_Real &OutValue);

		/****** HLRBRep_EdgeInterferenceTool::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** HLRBRep_EdgeInterferenceTool::LoadEdge ******/
		/****** md5 signature: ed3f5a569bfc70a9fa74a468cb585b05 ******/
		%feature("compactdefaultargs") LoadEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LoadEdge;
		void LoadEdge();

		/****** HLRBRep_EdgeInterferenceTool::MoreVertices ******/
		/****** md5 signature: 83ca27360b528f6d463b672d75829d0a ******/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertices;
		bool MoreVertices();

		/****** HLRBRep_EdgeInterferenceTool::NextVertex ******/
		/****** md5 signature: c800122ce4f2c3bd5f52dba7f14e300c ******/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVertex;
		void NextVertex();

		/****** HLRBRep_EdgeInterferenceTool::ParameterOfInterference ******/
		/****** md5 signature: ebb5a2fc6328a9ccf51a32e192c3431d ******/
		%feature("compactdefaultargs") ParameterOfInterference;
		%feature("autodoc", "
Parameters
----------
I: HLRAlgo_Interference

Return
-------
double

Description
-----------
No available documentation.
") ParameterOfInterference;
		double ParameterOfInterference(const HLRAlgo_Interference & I);

		/****** HLRBRep_EdgeInterferenceTool::SameInterferences ******/
		/****** md5 signature: 79a7a583a019588e8c997a4532af4b7e ******/
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", "
Parameters
----------
I1: HLRAlgo_Interference
I2: HLRAlgo_Interference

Return
-------
bool

Description
-----------
True if the two interferences are on the same geometric locus.
") SameInterferences;
		bool SameInterferences(const HLRAlgo_Interference & I1, const HLRAlgo_Interference & I2);

		/****** HLRBRep_EdgeInterferenceTool::SameVertexAndInterference ******/
		/****** md5 signature: 27f2fe532e9c49e966735494e20c111f ******/
		%feature("compactdefaultargs") SameVertexAndInterference;
		%feature("autodoc", "
Parameters
----------
I: HLRAlgo_Interference

Return
-------
bool

Description
-----------
True if the Interference and the current Vertex are on the same geometric locus.
") SameVertexAndInterference;
		bool SameVertexAndInterference(const HLRAlgo_Interference & I);

};


%extend HLRBRep_EdgeInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************************************
* class HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter *
*******************************************************************/
class HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter {
	public:
		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter ******/
		/****** md5 signature: 529fdeeb2e59d1c13dcc4a84fee2615b ******/
		%feature("compactdefaultargs") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
C1: HLRBRep_CurvePtr
C2: HLRBRep_CurvePtr
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter(const HLRBRep_CurvePtr & C1, const HLRBRep_CurvePtr & C2, const double Tol);

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::AnErrorOccurred ******/
		/****** md5 signature: 7d94c3d5c515369c6ad5964d268d2351 ******/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AnErrorOccurred;
		bool AnErrorOccurred();

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::NbRoots ******/
		/****** md5 signature: fe443a1190b192943b5fddf45586a22a ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		int NbRoots();

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: 8666edd96369790c2c310bc4605ecfe7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Poly1: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter
Poly2: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter

Return
-------
NumSegOn1: int
NumSegOn2: int
ParamOnSeg1: double
ParamOnSeg2: double

Description
-----------
No available documentation.
") Perform;
		void Perform(const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly1, const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: b341aed1ff0668c7471621afc1e6ebee ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Uo: double
Vo: double
UInf: double
VInf: double
USup: double
VSup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double Uo, const double Vo, const double UInf, const double VInf, const double USup, const double VSup);

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::Roots ******/
		/****** md5 signature: 924b6eebb61ca2e1dfbab661d402f781 ******/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") Roots;
		void Roots(Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRBRep_FaceData *
*************************/
class HLRBRep_FaceData {
	public:
		/****** HLRBRep_FaceData::HLRBRep_FaceData ******/
		/****** md5 signature: ffa82d6b8a494ac6bb29c2b5876435ad ******/
		%feature("compactdefaultargs") HLRBRep_FaceData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_FaceData;
		 HLRBRep_FaceData();

		/****** HLRBRep_FaceData::Back ******/
		/****** md5 signature: 68ade9c819314d37d675e9079550f22d ******/
		%feature("compactdefaultargs") Back;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Back;
		bool Back();

		/****** HLRBRep_FaceData::Back ******/
		/****** md5 signature: 9eeef60dbc20e5026dc6b5d255f25543 ******/
		%feature("compactdefaultargs") Back;
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
") Back;
		void Back(const bool B);

		/****** HLRBRep_FaceData::Closed ******/
		/****** md5 signature: 3af99e52b24f54eb2b999649fc18915a ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		bool Closed();

		/****** HLRBRep_FaceData::Closed ******/
		/****** md5 signature: cfbc50578377d25b9987cac1a0f4885e ******/
		%feature("compactdefaultargs") Closed;
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
") Closed;
		void Closed(const bool B);

		/****** HLRBRep_FaceData::Cone ******/
		/****** md5 signature: 9a553220c0981d81bd4eef68911c522f ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Cone;
		bool Cone();

		/****** HLRBRep_FaceData::Cone ******/
		/****** md5 signature: f4df1f1a968b64ac392e4f3126a90852 ******/
		%feature("compactdefaultargs") Cone;
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
") Cone;
		void Cone(const bool B);

		/****** HLRBRep_FaceData::Cut ******/
		/****** md5 signature: aaa62f5beb32443418b6673158c64d45 ******/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Cut;
		bool Cut();

		/****** HLRBRep_FaceData::Cut ******/
		/****** md5 signature: a463451492cb5d985331ab7ef06b2820 ******/
		%feature("compactdefaultargs") Cut;
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
") Cut;
		void Cut(const bool B);

		/****** HLRBRep_FaceData::Cylinder ******/
		/****** md5 signature: 1e93fb6ea7dda7a2cd67511d3be9f801 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Cylinder;
		bool Cylinder();

		/****** HLRBRep_FaceData::Cylinder ******/
		/****** md5 signature: a5e6dedb90e91035c9798a35869448f2 ******/
		%feature("compactdefaultargs") Cylinder;
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
") Cylinder;
		void Cylinder(const bool B);

		/****** HLRBRep_FaceData::Geometry ******/
		/****** md5 signature: e80782a494064d296da9e48aa7b2075d ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
HLRBRep_Surface

Description
-----------
No available documentation.
") Geometry;
		HLRBRep_Surface & Geometry();

		/****** HLRBRep_FaceData::Hiding ******/
		/****** md5 signature: 1ecaf9532c51f7586db9e63b215ba79e ******/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hiding;
		bool Hiding();

		/****** HLRBRep_FaceData::Hiding ******/
		/****** md5 signature: 27a05e9856649a3097f9c9bdd349a146 ******/
		%feature("compactdefaultargs") Hiding;
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
") Hiding;
		void Hiding(const bool B);

		/****** HLRBRep_FaceData::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** HLRBRep_FaceData::Orientation ******/
		/****** md5 signature: 21772d27fe13757c215d17da49a64c59 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(const TopAbs_Orientation O);

		/****** HLRBRep_FaceData::Plane ******/
		/****** md5 signature: 4a9fa6d6b5f8a6a130a4083d7f091f07 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Plane;
		bool Plane();

		/****** HLRBRep_FaceData::Plane ******/
		/****** md5 signature: 3cd4f3bfe181d34bd2adc1bc2a1b7f40 ******/
		%feature("compactdefaultargs") Plane;
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
") Plane;
		void Plane(const bool B);

		/****** HLRBRep_FaceData::Selected ******/
		/****** md5 signature: 8641e0f09f52f1e2ed1b07fb3a8de9b1 ******/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Selected;
		bool Selected();

		/****** HLRBRep_FaceData::Selected ******/
		/****** md5 signature: b9538ce37b46345d234100e61839d1aa ******/
		%feature("compactdefaultargs") Selected;
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
") Selected;
		void Selected(const bool B);

		/****** HLRBRep_FaceData::Set ******/
		/****** md5 signature: df02a2f536f02a669daca45f0b3e1096 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
FG: TopoDS_Face
Or: TopAbs_Orientation
Cl: bool
NW: int

Return
-------
None

Description
-----------
<Or> is the orientation of the face. <Cl> is true if the face belongs to a closed volume. <NW> is the number of wires (or block of edges) of the face.
") Set;
		void Set(const TopoDS_Face & FG, const TopAbs_Orientation Or, const bool Cl, const int NW);

		/****** HLRBRep_FaceData::SetWEdge ******/
		/****** md5 signature: b8d9a23d38a81e2318c8d0b9025c264f ******/
		%feature("compactdefaultargs") SetWEdge;
		%feature("autodoc", "
Parameters
----------
WI: int
EWI: int
EI: int
Or: TopAbs_Orientation
OutL: bool
Inte: bool
Dble: bool
IsoL: bool

Return
-------
None

Description
-----------
Set the edge number <EWI> of the wire <WI>.
") SetWEdge;
		void SetWEdge(const int WI, const int EWI, const int EI, const TopAbs_Orientation Or, const bool OutL, const bool Inte, const bool Dble, const bool IsoL);

		/****** HLRBRep_FaceData::SetWire ******/
		/****** md5 signature: ffa67bbe52313b82d45d3dffff577cea ******/
		%feature("compactdefaultargs") SetWire;
		%feature("autodoc", "
Parameters
----------
WI: int
NE: int

Return
-------
None

Description
-----------
Set <NE> the number of edges of the wire number <WI>.
") SetWire;
		void SetWire(const int WI, const int NE);

		/****** HLRBRep_FaceData::Side ******/
		/****** md5 signature: f68f08cc98b638332cd82c350080942a ******/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Side;
		bool Side();

		/****** HLRBRep_FaceData::Side ******/
		/****** md5 signature: 8687a0b1974d15dd9c8323de15903a22 ******/
		%feature("compactdefaultargs") Side;
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
") Side;
		void Side(const bool B);

		/****** HLRBRep_FaceData::Simple ******/
		/****** md5 signature: cb250ada3ae377bdde721bc10127e5c0 ******/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Simple;
		bool Simple();

		/****** HLRBRep_FaceData::Simple ******/
		/****** md5 signature: a463babaa0601d384101f963702e5967 ******/
		%feature("compactdefaultargs") Simple;
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
") Simple;
		void Simple(const bool B);

		/****** HLRBRep_FaceData::Size ******/
		/****** md5 signature: 06192572c9cdca54cf74477cdabdab63 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Size;
		double Size();

		/****** HLRBRep_FaceData::Size ******/
		/****** md5 signature: 7b342acf50c406acd8d4b3190be1aa47 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "
Parameters
----------
S: double

Return
-------
None

Description
-----------
No available documentation.
") Size;
		void Size(const double S);

		/****** HLRBRep_FaceData::Sphere ******/
		/****** md5 signature: 07199349b6749e9326468d25ad829fab ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Sphere;
		bool Sphere();

		/****** HLRBRep_FaceData::Sphere ******/
		/****** md5 signature: 1bffcd26540541dc6fbff25ecac847af ******/
		%feature("compactdefaultargs") Sphere;
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
") Sphere;
		void Sphere(const bool B);

		/****** HLRBRep_FaceData::Tolerance ******/
		/****** md5 signature: 27173cec126fd48cceae62b7a1012170 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		float Tolerance();

		/****** HLRBRep_FaceData::Torus ******/
		/****** md5 signature: 896e22556fc0163213d2aa26958ab40f ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Torus;
		bool Torus();

		/****** HLRBRep_FaceData::Torus ******/
		/****** md5 signature: ec68c54fcae6396146cfdaccb7f7cac3 ******/
		%feature("compactdefaultargs") Torus;
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
") Torus;
		void Torus(const bool B);

		/****** HLRBRep_FaceData::Wires ******/
		/****** md5 signature: 5da1d69c9cd7d2017555f94806dbc1a7 ******/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRAlgo_WiresBlock>

Description
-----------
No available documentation.
") Wires;
		opencascade::handle<HLRAlgo_WiresBlock> & Wires();

		/****** HLRBRep_FaceData::WithOutL ******/
		/****** md5 signature: dff74776078d395e0714a55e493644c1 ******/
		%feature("compactdefaultargs") WithOutL;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithOutL;
		bool WithOutL();

		/****** HLRBRep_FaceData::WithOutL ******/
		/****** md5 signature: dcfc2a64019a167b6450dca7a24f7716 ******/
		%feature("compactdefaultargs") WithOutL;
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
") WithOutL;
		void WithOutL(const bool B);

};


%extend HLRBRep_FaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRBRep_FaceIterator *
*****************************/
class HLRBRep_FaceIterator {
	public:
		/****** HLRBRep_FaceIterator::HLRBRep_FaceIterator ******/
		/****** md5 signature: 5453faf27124e716f1a3220d72f7f270 ******/
		%feature("compactdefaultargs") HLRBRep_FaceIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_FaceIterator;
		 HLRBRep_FaceIterator();

		/****** HLRBRep_FaceIterator::BeginningOfWire ******/
		/****** md5 signature: 15c11196c3b8289a35976a28fda2e313 ******/
		%feature("compactdefaultargs") BeginningOfWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current edge is the first of a wire.
") BeginningOfWire;
		bool BeginningOfWire();

		/****** HLRBRep_FaceIterator::Double ******/
		/****** md5 signature: 69769c2256d697551956eca1afcac58a ******/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Double;
		bool Double();

		/****** HLRBRep_FaceIterator::Edge ******/
		/****** md5 signature: d6bcd55b8bae579e7b4b7931e982c5a2 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Edge;
		int Edge();

		/****** HLRBRep_FaceIterator::EndOfWire ******/
		/****** md5 signature: 58ae75f4663a44da854de0e4dc2ca8b9 ******/
		%feature("compactdefaultargs") EndOfWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current edge is the last of a wire.
") EndOfWire;
		bool EndOfWire();

		/****** HLRBRep_FaceIterator::InitEdge ******/
		/****** md5 signature: 422d899fea8385aeaf65601ef58754cb ******/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "
Parameters
----------
fd: HLRBRep_FaceData

Return
-------
None

Description
-----------
Begin an exploration of the edges of the face <fd>.
") InitEdge;
		void InitEdge(HLRBRep_FaceData & fd);

		/****** HLRBRep_FaceIterator::Internal ******/
		/****** md5 signature: 8098632e5e6958c60a875b3e867984fd ******/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Internal;
		bool Internal();

		/****** HLRBRep_FaceIterator::IsoLine ******/
		/****** md5 signature: 6c55b76c8a9fda149eb041d21fe6e745 ******/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsoLine;
		bool IsoLine();

		/****** HLRBRep_FaceIterator::MoreEdge ******/
		/****** md5 signature: 6ad80ac0d66dad5013f4fe4cff20c934 ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		bool MoreEdge();

		/****** HLRBRep_FaceIterator::NextEdge ******/
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

		/****** HLRBRep_FaceIterator::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** HLRBRep_FaceIterator::OutLine ******/
		/****** md5 signature: 5a2b30d4093f4f82558781e73ac9e2f1 ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		bool OutLine();

		/****** HLRBRep_FaceIterator::SkipWire ******/
		/****** md5 signature: 271db178bcbd81d9798133b29cce0b8c ******/
		%feature("compactdefaultargs") SkipWire;
		%feature("autodoc", "Return
-------
None

Description
-----------
Skip the current wire in the exploration.
") SkipWire;
		void SkipWire();

		/****** HLRBRep_FaceIterator::Wire ******/
		/****** md5 signature: ec8a49b48aaf0c44fad113b21c69d11b ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRAlgo_EdgesBlock>

Description
-----------
Returns the edges of the current wire.
") Wire;
		opencascade::handle<HLRAlgo_EdgesBlock> Wire();

};


%extend HLRBRep_FaceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class HLRBRep_HLRToShape *
***************************/
class HLRBRep_HLRToShape {
	public:
		/****** HLRBRep_HLRToShape::HLRBRep_HLRToShape ******/
		/****** md5 signature: ce67d79ba62707f55e214dec9007ee80 ******/
		%feature("compactdefaultargs") HLRBRep_HLRToShape;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Algo

Return
-------
None

Description
-----------
Constructs a framework for filtering the results of the HLRBRep_Algo algorithm, A. Use the extraction filters to obtain the results you want for A.
") HLRBRep_HLRToShape;
		 HLRBRep_HLRToShape(const opencascade::handle<HLRBRep_Algo> & A);

		/****** HLRBRep_HLRToShape::CompoundOfEdges ******/
		/****** md5 signature: daca2b39735f3c8a34e2b8c14cfa3a99 ******/
		%feature("compactdefaultargs") CompoundOfEdges;
		%feature("autodoc", "
Parameters
----------
type: HLRBRep_TypeOfResultingEdge
visible: bool
In3d: bool

Return
-------
TopoDS_Shape

Description
-----------
Returns compound of resulting edges of required type and visibility, taking into account the kind of space (2d or 3d).
") CompoundOfEdges;
		TopoDS_Shape CompoundOfEdges(const HLRBRep_TypeOfResultingEdge type, const bool visible, const bool In3d);

		/****** HLRBRep_HLRToShape::CompoundOfEdges ******/
		/****** md5 signature: 39eff87eee83e021a67472f4cebb19d6 ******/
		%feature("compactdefaultargs") CompoundOfEdges;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
type: HLRBRep_TypeOfResultingEdge
visible: bool
In3d: bool

Return
-------
TopoDS_Shape

Description
-----------
For specified shape returns compound of resulting edges of required type and visibility, taking into account the kind of space (2d or 3d).
") CompoundOfEdges;
		TopoDS_Shape CompoundOfEdges(const TopoDS_Shape & S, const HLRBRep_TypeOfResultingEdge type, const bool visible, const bool In3d);

		/****** HLRBRep_HLRToShape::HCompound ******/
		/****** md5 signature: d34edae76e829f1ff2d89a8960cf3e12 ******/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return hidden sharp edges (of C0-continuity).
") HCompound;
		TopoDS_Shape HCompound();

		/****** HLRBRep_HLRToShape::HCompound ******/
		/****** md5 signature: 2997b95b2432c211a71c2206e24af92a ******/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return hidden sharp edges (of C0-continuity) of specified shape.
") HCompound;
		TopoDS_Shape HCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::IsoLineHCompound ******/
		/****** md5 signature: 3e217bbc6357bfbd88b431b52f812707 ******/
		%feature("compactdefaultargs") IsoLineHCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return hidden isoparameters.
") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound();

		/****** HLRBRep_HLRToShape::IsoLineHCompound ******/
		/****** md5 signature: f872713c852e36eef4c1a70e517114a3 ******/
		%feature("compactdefaultargs") IsoLineHCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return hidden isoparameters of specified shape.
") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::IsoLineVCompound ******/
		/****** md5 signature: cc6f089f1a14cc7b1b26be65fd9a4fe4 ******/
		%feature("compactdefaultargs") IsoLineVCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return visible isoparameters.
") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound();

		/****** HLRBRep_HLRToShape::IsoLineVCompound ******/
		/****** md5 signature: a53808c8df6b194b024cf4aa7bf19e2e ******/
		%feature("compactdefaultargs") IsoLineVCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return visible isoparameters of specified shape.
") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::OutLineHCompound ******/
		/****** md5 signature: 993a692ca08865997787c9c432b66a0b ******/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return hidden outline edges ('silhouette').
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound();

		/****** HLRBRep_HLRToShape::OutLineHCompound ******/
		/****** md5 signature: 69b9f95e47e310fe017b907b8be5c05f ******/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return hidden outline edges ('silhouette') of specified shape.
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::OutLineVCompound ******/
		/****** md5 signature: 25faaf0a9af31872bd3162a776e94610 ******/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return visible outline edges ('silhouette').
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound();

		/****** HLRBRep_HLRToShape::OutLineVCompound ******/
		/****** md5 signature: dc53a0fc06a7656e9e77f9923845f706 ******/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return visible outline edges ('silhouette') of specified shape.
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::OutLineVCompound3d ******/
		/****** md5 signature: 2fc97b2addfb440046144017858aae7c ******/
		%feature("compactdefaultargs") OutLineVCompound3d;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return visible outline edges ('silhouette').
") OutLineVCompound3d;
		TopoDS_Shape OutLineVCompound3d();

		/****** HLRBRep_HLRToShape::Rg1LineHCompound ******/
		/****** md5 signature: 063e628b8490e553d3a05b3ca4a02e8b ******/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return hidden smooth edges (G1-continuity between two surfaces).
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound();

		/****** HLRBRep_HLRToShape::Rg1LineHCompound ******/
		/****** md5 signature: 8f888b00c60642e3ea8585f639fb09b4 ******/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return hidden smooth edges (G1-continuity between two surfaces) of specified shape.
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::Rg1LineVCompound ******/
		/****** md5 signature: 229e02efd65b2e1b670b659a88c7d415 ******/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return visible smooth edges (G1-continuity between two surfaces).
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound();

		/****** HLRBRep_HLRToShape::Rg1LineVCompound ******/
		/****** md5 signature: 89b5bda87b84171ac096a13345eb4112 ******/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return visible smooth edges (G1-continuity between two surfaces) of specified shape.
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::RgNLineHCompound ******/
		/****** md5 signature: 49e041ea3f17a34b12366f0bf44d8041 ******/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return hidden sewn edges (of CN-continuity on one surface).
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound();

		/****** HLRBRep_HLRToShape::RgNLineHCompound ******/
		/****** md5 signature: ba723fa11f7dac4ccdb53ec6ca9ed189 ******/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return hidden sewn edges (of CN-continuity on one surface) of specified shape.
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::RgNLineVCompound ******/
		/****** md5 signature: d8db52358f306f0be6b39a2a23ceb415 ******/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return visible sewn edges (of CN-continuity on one surface).
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound();

		/****** HLRBRep_HLRToShape::RgNLineVCompound ******/
		/****** md5 signature: ca8daffebca0973374b81b46c5ddaacb ******/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return visible sewn edges (of CN-continuity on one surface) of specified shape.
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound(const TopoDS_Shape & S);

		/****** HLRBRep_HLRToShape::VCompound ******/
		/****** md5 signature: 8199daca65384c5d1ce7561af621cc2d ******/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return visible sharp edges (of C0-continuity).
") VCompound;
		TopoDS_Shape VCompound();

		/****** HLRBRep_HLRToShape::VCompound ******/
		/****** md5 signature: 7bf9afb62ac439881e796a557babeda9 ******/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Return visible sharp edges (of C0-continuity) of specified shape.
") VCompound;
		TopoDS_Shape VCompound(const TopoDS_Shape & S);

};


%extend HLRBRep_HLRToShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class HLRBRep_Hider *
**********************/
class HLRBRep_Hider {
	public:
		/****** HLRBRep_Hider::HLRBRep_Hider ******/
		/****** md5 signature: 7418e6aacedad38b1ce12e83c961c116 ******/
		%feature("compactdefaultargs") HLRBRep_Hider;
		%feature("autodoc", "
Parameters
----------
DS: HLRBRep_Data

Return
-------
None

Description
-----------
Creates a Hider processing the set of Edges and hiding faces described by <DS>. Stores the hidden parts in <DS>.
") HLRBRep_Hider;
		 HLRBRep_Hider(const opencascade::handle<HLRBRep_Data> & DS);

		/****** HLRBRep_Hider::Hide ******/
		/****** md5 signature: 0e924ee0e7b44076b0fee93011548973 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
FI: int
MST: NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
Removes from the edges, the parts hidden by the hiding face number <FI>.
") Hide;
		void Hide(const int FI, NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher> & MST);

		/****** HLRBRep_Hider::OwnHiding ******/
		/****** md5 signature: 0a8283501a7d756e1a9a8912f53e43f9 ******/
		%feature("compactdefaultargs") OwnHiding;
		%feature("autodoc", "
Parameters
----------
FI: int

Return
-------
None

Description
-----------
own hiding the side face number <FI>.
") OwnHiding;
		void OwnHiding(const int FI);

};


%extend HLRBRep_Hider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class HLRBRep_IntConicCurveOfCInter *
**************************************/
class HLRBRep_IntConicCurveOfCInter : public IntRes2d_Intersection {
	public:
		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: 1803acbeca1183b86ed7d1a7732ec0f6 ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter();

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: 17267dea134b591f2fe8263b97f75009 ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: b2eeaab9da78b6ae31c1fe7b279c206c ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: 1e2f216d63539701f2eecc961fcfee0f ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: 30606bca3b2fd3ac869bd0eb6927779d ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: 75d8d3826166956094f33013b7a776d4 ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: f9b9eb3d8295f7a5235c4b961c512389 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 90c767a29faf1ed79b4fdbf08eca13e6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: b930d935742441869f4e8decde900041 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 1f9e13a8ffa1ec749a03fae729a1beb0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: fc249b74a03be399405216462aef799b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

};


%extend HLRBRep_IntConicCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class HLRBRep_InterCSurf *
***************************/
class HLRBRep_InterCSurf : public IntCurveSurface_Intersection {
	public:
		/****** HLRBRep_InterCSurf::HLRBRep_InterCSurf ******/
		/****** md5 signature: ebbd498376cf81c3b638da7f854cfb40 ******/
		%feature("compactdefaultargs") HLRBRep_InterCSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") HLRBRep_InterCSurf;
		 HLRBRep_InterCSurf();

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: a9da5ca52e247d0d9b17bee876a69d82 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theCurve: gp_Lin
theSurface: HLRBRep_Surface *

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface.
") Perform;
		void Perform(const gp_Lin & theCurve, HLRBRep_Surface * theSurface);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: 4e3f018ea2710309667d042ee2d50619 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theCurve: gp_Lin
thePolygon: HLRBRep_ThePolygonOfInterCSurf
theSurface: HLRBRep_Surface *

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <thePolygon> is given.
") Perform;
		void Perform(const gp_Lin & theCurve, const HLRBRep_ThePolygonOfInterCSurf & thePolygon, HLRBRep_Surface * theSurface);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: 9d49ce4f072cb22871b3a58e6b5dbcc7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theCurve: gp_Lin
thePolygon: HLRBRep_ThePolygonOfInterCSurf
theSurface: HLRBRep_Surface *
thePolyhedron: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <thePolygon> is given. The Surface is also sampled and <thePolyhedron> is given.
") Perform;
		void Perform(const gp_Lin & theCurve, const HLRBRep_ThePolygonOfInterCSurf & thePolygon, HLRBRep_Surface * theSurface, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyhedron);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: 5dda4cd25d15953378c4e9b96506b892 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theCurve: gp_Lin
thePolygon: HLRBRep_ThePolygonOfInterCSurf
theSurface: HLRBRep_Surface *
thePolyhedron: HLRBRep_ThePolyhedronOfInterCSurf
theBndBSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <thePolygon> is given. The Surface is also sampled and <thePolyhedron> is given.
") Perform;
		void Perform(const gp_Lin & theCurve, const HLRBRep_ThePolygonOfInterCSurf & thePolygon, HLRBRep_Surface * theSurface, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyhedron, Bnd_BoundSortBox & theBndBSB);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: 165ee0589d09008d817d92471330d7da ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theCurve: gp_Lin
theSurface: HLRBRep_Surface *
thePolyhedron: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Surface is already sampled and its polyhedron: <thePolyhedron> is given.
") Perform;
		void Perform(const gp_Lin & theCurve, HLRBRep_Surface * theSurface, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyhedron);

};


%extend HLRBRep_InterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRBRep_InternalAlgo *
*****************************/
class HLRBRep_InternalAlgo : public Standard_Transient {
	public:
		/****** HLRBRep_InternalAlgo::HLRBRep_InternalAlgo ******/
		/****** md5 signature: eb93e363bb74b770f63b2122d5ca46f1 ******/
		%feature("compactdefaultargs") HLRBRep_InternalAlgo;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo();

		/****** HLRBRep_InternalAlgo::HLRBRep_InternalAlgo ******/
		/****** md5 signature: ca81c7d3556807b125f940888c03f9eb ******/
		%feature("compactdefaultargs") HLRBRep_InternalAlgo;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_InternalAlgo

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo(const opencascade::handle<HLRBRep_InternalAlgo> & A);

		/****** HLRBRep_InternalAlgo::DataStructure ******/
		/****** md5 signature: 61aa34b795327513108271f6ad4a7e54 ******/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRBRep_Data>

Description
-----------
No available documentation.
") DataStructure;
		opencascade::handle<HLRBRep_Data> DataStructure();

		/****** HLRBRep_InternalAlgo::Debug ******/
		/****** md5 signature: 2f0fc838b443d4163ab857205f6593fe ******/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "
Parameters
----------
deb: bool

Return
-------
None

Description
-----------
No available documentation.
") Debug;
		void Debug(const bool deb);

		/****** HLRBRep_InternalAlgo::Debug ******/
		/****** md5 signature: 2a394f87c5d1c01601d8692769752b4d ******/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Debug;
		bool Debug();

		/****** HLRBRep_InternalAlgo::Hide ******/
		/****** md5 signature: 58365d1b8e35bd4bc81d336d692c97a2 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Return
-------
None

Description
-----------
hide all the DataStructure.
") Hide;
		void Hide();

		/****** HLRBRep_InternalAlgo::Hide ******/
		/****** md5 signature: 9a53166c2cf3ec9f652dc0cd0ff7ab86 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
hide the Shape <S> by itself.
") Hide;
		void Hide(const int I);

		/****** HLRBRep_InternalAlgo::Hide ******/
		/****** md5 signature: ce9e4d51727da99787cd127293b2d58f ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
None

Description
-----------
hide the Shape <S1> by the shape <S2>.
") Hide;
		void Hide(const int I, const int J);

		/****** HLRBRep_InternalAlgo::HideAll ******/
		/****** md5 signature: 9cbad012d33c32d21b12759548798548 ******/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
set to hide all the edges.
") HideAll;
		void HideAll();

		/****** HLRBRep_InternalAlgo::HideAll ******/
		/****** md5 signature: 88c7bbf6cdc1a008675c0e3be93b08d1 ******/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
set to hide all the edges of the Shape <S>.
") HideAll;
		void HideAll(const int I);

		/****** HLRBRep_InternalAlgo::Index ******/
		/****** md5 signature: 7606b376025567288bd55f8d649cae5c ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner

Return
-------
int

Description
-----------
return the index of the Shape <S> and return 0 if the Shape <S> is not found.
") Index;
		int Index(const opencascade::handle<HLRTopoBRep_OutLiner> & S);

		/****** HLRBRep_InternalAlgo::InitEdgeStatus ******/
		/****** md5 signature: 40dcf121d9289a2bba9a47db317f4f0b ******/
		%feature("compactdefaultargs") InitEdgeStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
init the status of the selected edges depending of the back faces of a closed shell.
") InitEdgeStatus;
		void InitEdgeStatus();

		/****** HLRBRep_InternalAlgo::Load ******/
		/****** md5 signature: 905d3fa782feeefbb5ee6fd464f48f8a ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner
SData: Standard_Transient
nbIso: int (optional, default to 0)

Return
-------
None

Description
-----------
add the shape <S>.
") Load;
		void Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const opencascade::handle<Standard_Transient> & SData, const int nbIso = 0);

		/****** HLRBRep_InternalAlgo::Load ******/
		/****** md5 signature: 7bb13ab74f4751ae2a759492ae314ac6 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner
nbIso: int (optional, default to 0)

Return
-------
None

Description
-----------
add the shape <S>.
") Load;
		void Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const int nbIso = 0);

		/****** HLRBRep_InternalAlgo::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		int NbShapes();

		/****** HLRBRep_InternalAlgo::PartialHide ******/
		/****** md5 signature: 5948a3f081b1bfebc097fd30ad7ee22c ******/
		%feature("compactdefaultargs") PartialHide;
		%feature("autodoc", "Return
-------
None

Description
-----------
own hiding of all the shapes of the DataStructure without hiding by each other.
") PartialHide;
		void PartialHide();

		/****** HLRBRep_InternalAlgo::Projector ******/
		/****** md5 signature: 1b358691806af1ecbf38ab72a35ea356 ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "
Parameters
----------
P: HLRAlgo_Projector

Return
-------
None

Description
-----------
set the projector.
") Projector;
		void Projector(const HLRAlgo_Projector & P);

		/****** HLRBRep_InternalAlgo::Projector ******/
		/****** md5 signature: d7f508ab183a1a90d9ac0ead0aeb116c ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Return
-------
HLRAlgo_Projector

Description
-----------
set the projector.
") Projector;
		HLRAlgo_Projector & Projector();

		/****** HLRBRep_InternalAlgo::Remove ******/
		/****** md5 signature: 9539381babdabf9d42bd9b8bddb394a0 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
remove the Shape of Index <I>.
") Remove;
		void Remove(const int I);

		/****** HLRBRep_InternalAlgo::Select ******/
		/****** md5 signature: b841eec3ea2cd8cbedd47c93babbe626 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Return
-------
None

Description
-----------
select all the DataStructure.
") Select;
		void Select();

		/****** HLRBRep_InternalAlgo::Select ******/
		/****** md5 signature: c04567a43a21d63cad0304a2cd791282 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
select only the Shape of index <I>.
") Select;
		void Select(const int I);

		/****** HLRBRep_InternalAlgo::SelectEdge ******/
		/****** md5 signature: 97a4660c639ec0b7f3109cc46a131e46 ******/
		%feature("compactdefaultargs") SelectEdge;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
select only the edges of the Shape <S>.
") SelectEdge;
		void SelectEdge(const int I);

		/****** HLRBRep_InternalAlgo::SelectFace ******/
		/****** md5 signature: 3bc107674e87e54fc958be4bb53d64a3 ******/
		%feature("compactdefaultargs") SelectFace;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
select only the faces of the Shape <S>.
") SelectFace;
		void SelectFace(const int I);

		/****** HLRBRep_InternalAlgo::SeqOfShapeBounds ******/
		/****** md5 signature: d266c0f5077f9481a7e30c30072c56ca ******/
		%feature("compactdefaultargs") SeqOfShapeBounds;
		%feature("autodoc", "Return
-------
NCollection_Sequence<HLRBRep_ShapeBounds>

Description
-----------
No available documentation.
") SeqOfShapeBounds;
		NCollection_Sequence<HLRBRep_ShapeBounds> & SeqOfShapeBounds();

		/****** HLRBRep_InternalAlgo::ShapeBounds ******/
		/****** md5 signature: 52c41f6dab6cee4fb3c3b1511de0ee60 ******/
		%feature("compactdefaultargs") ShapeBounds;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
HLRBRep_ShapeBounds

Description
-----------
No available documentation.
") ShapeBounds;
		HLRBRep_ShapeBounds & ShapeBounds(const int I);

		/****** HLRBRep_InternalAlgo::ShapeData ******/
		/****** md5 signature: b1a3be5cc325ec141199ef207f0e3f70 ******/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "
Parameters
----------
I: int
SData: Standard_Transient

Return
-------
None

Description
-----------
Change the Shape Data of the Shape of index <I>.
") ShapeData;
		void ShapeData(const int I, const opencascade::handle<Standard_Transient> & SData);

		/****** HLRBRep_InternalAlgo::ShowAll ******/
		/****** md5 signature: 16b8205837f09151db1f737d1a729fbd ******/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "Return
-------
None

Description
-----------
set to visible all the edges.
") ShowAll;
		void ShowAll();

		/****** HLRBRep_InternalAlgo::ShowAll ******/
		/****** md5 signature: 6d532afb82ced58bed02d85951bb16ef ******/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
set to visible all the edges of the Shape <S>.
") ShowAll;
		void ShowAll(const int I);

		/****** HLRBRep_InternalAlgo::Update ******/
		/****** md5 signature: 997c8dd85f474bf26af99d1a07d6fa3f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
update the DataStructure.
") Update;
		void Update();

};


%make_alias(HLRBRep_InternalAlgo)

%extend HLRBRep_InternalAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class HLRBRep_Intersector *
****************************/
class HLRBRep_Intersector {
	public:
		/****** HLRBRep_Intersector::HLRBRep_Intersector ******/
		/****** md5 signature: 03440fea82810f6b85a56244f2e1ee7b ******/
		%feature("compactdefaultargs") HLRBRep_Intersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_Intersector;
		 HLRBRep_Intersector();

		/****** HLRBRep_Intersector::CSPoint ******/
		/****** md5 signature: 4345d0cf8c36342538c843867fe389fd ******/
		%feature("compactdefaultargs") CSPoint;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntCurveSurface_IntersectionPoint

Description
-----------
No available documentation.
") CSPoint;
		IntCurveSurface_IntersectionPoint CSPoint(const int N);

		/****** HLRBRep_Intersector::CSSegment ******/
		/****** md5 signature: c0094a5e2015880fc1ea947cbcdae3fb ******/
		%feature("compactdefaultargs") CSSegment;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntCurveSurface_IntersectionSegment

Description
-----------
No available documentation.
") CSSegment;
		IntCurveSurface_IntersectionSegment CSSegment(const int N);

		/****** HLRBRep_Intersector::Destroy ******/
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

		/****** HLRBRep_Intersector::IsDone ******/
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

		/****** HLRBRep_Intersector::Load ******/
		/****** md5 signature: 41c5ef05698e84a4787a59995ef2d449 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theSurface: HLRBRep_Surface *

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(HLRBRep_Surface * theSurface);

		/****** HLRBRep_Intersector::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** HLRBRep_Intersector::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSegments;
		int NbSegments();

		/****** HLRBRep_Intersector::Perform ******/
		/****** md5 signature: dc3ed99e5368f6bdf4d3549b6824d26f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theEdge1: HLRBRep_EdgeData *
theDa1: double
theDb1: double

Return
-------
None

Description
-----------
Performs the auto intersection of an edge. The edge domain is cut at start with da1*(b-a) and at end with db1*(b-a).
") Perform;
		void Perform(HLRBRep_EdgeData * theEdge1, const double theDa1, const double theDb1);

		/****** HLRBRep_Intersector::Perform ******/
		/****** md5 signature: b58982d2e6a2a7abe05a5a464ec13bf8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theNA: int
theEdge1: HLRBRep_EdgeData *
theDa1: double
theDb1: double
theNB: int
theEdge2: HLRBRep_EdgeData *
theDa2: double
theDb2: double
theNoBound: bool

Return
-------
None

Description
-----------
Performs the intersection between the two edges. The edges domains are cut at start with da*(b-a) and at end with db*(b-a).
") Perform;
		void Perform(const int theNA, HLRBRep_EdgeData * theEdge1, const double theDa1, const double theDb1, const int theNB, HLRBRep_EdgeData * theEdge2, const double theDa2, const double theDb2, const bool theNoBound);

		/****** HLRBRep_Intersector::Perform ******/
		/****** md5 signature: db711b276ef26ded0a8f4d206a9f5576 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin
theP: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & theL, const double theP);

		/****** HLRBRep_Intersector::Point ******/
		/****** md5 signature: 2f59b4f0a1ef7de78ab232b1e95a2ce4 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntRes2d_IntersectionPoint

Description
-----------
No available documentation.
") Point;
		const IntRes2d_IntersectionPoint & Point(const int N);

		/****** HLRBRep_Intersector::Segment ******/
		/****** md5 signature: b1d4b7b120ed513838a14f8fe26feb70 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntRes2d_IntersectionSegment

Description
-----------
No available documentation.
") Segment;
		const IntRes2d_IntersectionSegment & Segment(const int N);

		/****** HLRBRep_Intersector::SimulateOnePoint ******/
		/****** md5 signature: f332b4e63774265cc7330af35e8f8059 ******/
		%feature("compactdefaultargs") SimulateOnePoint;
		%feature("autodoc", "
Parameters
----------
theEdge1: HLRBRep_EdgeData *
theU: double
theEdge2: HLRBRep_EdgeData *
theV: double

Return
-------
None

Description
-----------
Create a single IntersectionPoint (U on theEdge1) (V on theEdge2) The point is middle on both curves.
") SimulateOnePoint;
		void SimulateOnePoint(HLRBRep_EdgeData * theEdge1, const double theU, HLRBRep_EdgeData * theEdge2, const double theV);

};


%extend HLRBRep_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRBRep_LineTool *
*************************/
class HLRBRep_LineTool {
	public:
		/****** HLRBRep_LineTool::BSpline ******/
		/****** md5 signature: 8d585d6c8326a3750981dc6f70efad71 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const gp_Lin & C);

		/****** HLRBRep_LineTool::Bezier ******/
		/****** md5 signature: 64c594a036fbe9c4da520f893b260e04 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const gp_Lin & C);

		/****** HLRBRep_LineTool::Circle ******/
		/****** md5 signature: aee5286e4554b3ab95373fa9637c022d ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		static gp_Circ Circle(const gp_Lin & C);

		/****** HLRBRep_LineTool::Continuity ******/
		/****** md5 signature: 15d3a4716f672bb69b563f8c8a81e404 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const gp_Lin & C);

		/****** HLRBRep_LineTool::D0 ******/
		/****** md5 signature: 15df9c28d8128c922bf7a36701b66364 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the line.
") D0;
		static void D0(const gp_Lin & C, const double U, gp_Pnt & P);

		/****** HLRBRep_LineTool::D1 ******/
		/****** md5 signature: db74f666d1a894fa3af046698f8eca9a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the line with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const gp_Lin & C, const double U, gp_Pnt & P, gp_Vec & V);

		/****** HLRBRep_LineTool::D2 ******/
		/****** md5 signature: 437180bf5c47be7be9e96841e1a1ebce ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const gp_Lin & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** HLRBRep_LineTool::D3 ******/
		/****** md5 signature: d7076d9a8561b6c8b3319d871a607e54 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: double
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const gp_Lin & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** HLRBRep_LineTool::DN ******/
		/****** md5 signature: 372a8f4fe868a36984e319752d2aa7a0 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: double
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec DN(const gp_Lin & C, const double U, const int N);

		/****** HLRBRep_LineTool::Degree ******/
		/****** md5 signature: 51172f06f295e98e429c9bf01bb2d012 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static int Degree(const gp_Lin & C);

		/****** HLRBRep_LineTool::Ellipse ******/
		/****** md5 signature: ce9419a8e7b21b2ec96fa8cff7c8042a ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips Ellipse(const gp_Lin & C);

		/****** HLRBRep_LineTool::FirstParameter ******/
		/****** md5 signature: a0309b2d1147d5c7b02406fb80bf17dd ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const gp_Lin & C);

		/****** HLRBRep_LineTool::GetType ******/
		/****** md5 signature: 0c6dded5c2195cb0e701212c2c2726ad ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the line in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const gp_Lin & C);

		/****** HLRBRep_LineTool::Hyperbola ******/
		/****** md5 signature: 3a688767924d4d16f68d89899f98760a ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr Hyperbola(const gp_Lin & C);

		/****** HLRBRep_LineTool::IntervalContinuity ******/
		/****** md5 signature: 069974fe52c040887ebdd21408b74379 ******/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") IntervalContinuity;
		static GeomAbs_Shape IntervalContinuity(const gp_Lin & C);

		/****** HLRBRep_LineTool::IntervalFirst ******/
		/****** md5 signature: ed23161794d90845417991fde1fd5531 ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
double

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		static double IntervalFirst(const gp_Lin & C);

		/****** HLRBRep_LineTool::IntervalLast ******/
		/****** md5 signature: 864fb4494436e1f4fc8b7ca23bebe521 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
double

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		static double IntervalLast(const gp_Lin & C);

		/****** HLRBRep_LineTool::Intervals ******/
		/****** md5 signature: 7893924a1ee3f1e75112530eadecc676 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Return
-------
None

Description
-----------
Sets the current working interval.
") Intervals;
		static void Intervals(const gp_Lin & C, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****** HLRBRep_LineTool::IsClosed ******/
		/****** md5 signature: dc05e9a8721aa554c027de22f2090e06 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static bool IsClosed(const gp_Lin & C);

		/****** HLRBRep_LineTool::IsPeriodic ******/
		/****** md5 signature: 85e282cb03bd77101673ced1c012ae6e ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static bool IsPeriodic(const gp_Lin & C);

		/****** HLRBRep_LineTool::IsRational ******/
		/****** md5 signature: 7055383f58f5c19f59a55327d8e8434b ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		static bool IsRational(const gp_Lin & C);

		/****** HLRBRep_LineTool::KnotsAndMultiplicities ******/
		/****** md5 signature: eab27671f9dcda3152f79885b0413529 ******/
		%feature("compactdefaultargs") KnotsAndMultiplicities;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
TK: TColStd_Array1OfReal
TM: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") KnotsAndMultiplicities;
		static void KnotsAndMultiplicities(const gp_Lin & C, TColStd_Array1OfReal & TK, TColStd_Array1OfInteger & TM);

		/****** HLRBRep_LineTool::LastParameter ******/
		/****** md5 signature: 3aeb4991df69a85f4785a7b6c71308c3 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const gp_Lin & C);

		/****** HLRBRep_LineTool::Line ******/
		/****** md5 signature: cc6f80c77b35afffbc178831258eaf22 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		static gp_Lin Line(const gp_Lin & C);

		/****** HLRBRep_LineTool::NbIntervals ******/
		/****** md5 signature: 653497e5efc58d6044cbedb4c03b0dfc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: GeomAbs_Shape

Return
-------
int

Description
-----------
If necessary, breaks the line in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		static int NbIntervals(const gp_Lin & C, const GeomAbs_Shape S);

		/****** HLRBRep_LineTool::NbKnots ******/
		/****** md5 signature: 8cdd099bf3afbcf627cb5902e29d8893 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		static int NbKnots(const gp_Lin & C);

		/****** HLRBRep_LineTool::NbPoles ******/
		/****** md5 signature: e7e36a71b856f6e189c4fe08b50a49bd ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		static int NbPoles(const gp_Lin & C);

		/****** HLRBRep_LineTool::NbSamples ******/
		/****** md5 signature: fed75124e9ebe36eae5ec4283519fabc ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const gp_Lin & C, const double U0, const double U1);

		/****** HLRBRep_LineTool::Parabola ******/
		/****** md5 signature: d4661779802cfffcc637a199c62580d9 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab Parabola(const gp_Lin & C);

		/****** HLRBRep_LineTool::Period ******/
		/****** md5 signature: efbd179113fc04941a9a07161586733a ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const gp_Lin & C);

		/****** HLRBRep_LineTool::Poles ******/
		/****** md5 signature: 6e41eab4930964af9991c7c832c62d9e ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
TP: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		static void Poles(const gp_Lin & C, TColgp_Array1OfPnt & TP);

		/****** HLRBRep_LineTool::PolesAndWeights ******/
		/****** md5 signature: cec86be74047591bec6a87b12efef6ef ******/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
TP: TColgp_Array1OfPnt
TW: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") PolesAndWeights;
		static void PolesAndWeights(const gp_Lin & C, TColgp_Array1OfPnt & TP, TColStd_Array1OfReal & TW);

		/****** HLRBRep_LineTool::Resolution ******/
		/****** md5 signature: 7a10621c011cdc17a0084c1e3e8ca9f0 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const gp_Lin & C, const double R3d);

		/****** HLRBRep_LineTool::SamplePars ******/
		/****** md5 signature: cd8bbc1a1919e64a691e66781a06c839 ******/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U0: double
U1: double
Defl: double
NbMin: int

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns sample parameters for the line within [U0, U1] range. 
Input parameter: C the line 
Input parameter: U0 start parameter 
Input parameter: U1 end parameter 
Input parameter: Defl deflection tolerance (unused for lines) 
Input parameter: NbMin minimum number of sample points (unused for lines) 
Return: array of 3 sample parameter values.
") SamplePars;
		static opencascade::handle<TColStd_HArray1OfReal> SamplePars(const gp_Lin & C, const double U0, const double U1, const double Defl, const int NbMin);

		/****** HLRBRep_LineTool::SamplePars ******/
		/****** md5 signature: c52ef762d8145e48526371c8052826ef ******/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U0: double
U1: double
Defl: double
NbMin: int
Pars: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SamplePars;
		static void SamplePars(const gp_Lin & C, const double U0, const double U1, const double Defl, const int NbMin, opencascade::handle<TColStd_HArray1OfReal> & Pars);

		/****** HLRBRep_LineTool::Value ******/
		/****** md5 signature: ed7ab0156a63a943cda6a002feed4445 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the line.
") Value;
		static gp_Pnt Value(const gp_Lin & C, const double U);

};


%extend HLRBRep_LineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************************************
* class HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter *
***********************************************************************/
class HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter : public math_FunctionWithDerivative {
	public:
		/****** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter ******/
		/****** md5 signature: 4118b4b04fabd301063bbd8ddf88f967 ******/
		%feature("compactdefaultargs") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
IT: IntCurve_IConicTool
PC: HLRBRep_CurvePtr

Return
-------
None

Description
-----------
Constructor of the class.
") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter(const IntCurve_IConicTool & IT, const HLRBRep_CurvePtr & PC);

		/****** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::Derivative ******/
		/****** md5 signature: 9056fc5f695c62612651effc85cb18ad ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
D: double

Description
-----------
Computes the derivative of the previous function at parameter Param.
") Derivative;
		bool Derivative(const double Param, Standard_Real &OutValue);

		/****** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::Value ******/
		/****** md5 signature: 92dd35931de1aecdc8277d063de13ec7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double

Description
-----------
Computes the value of the signed distance between the implicit curve and the point at parameter Param on the parametrised curve.
") Value;
		bool Value(const double Param, Standard_Real &OutValue);

		/****** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::Values ******/
		/****** md5 signature: 03dca4b59c48db2ee672dd2d7904db60 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double
D: double

Description
-----------
Computes the value and the derivative of the function.
") Values;
		bool Values(const double Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRBRep_PolyAlgo *
*************************/
class HLRBRep_PolyAlgo : public Standard_Transient {
	public:
		/****** HLRBRep_PolyAlgo::HLRBRep_PolyAlgo ******/
		/****** md5 signature: f840694af0e014aa4284608f01bba94e ******/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework for the calculation of the visible and hidden lines of a shape in a projection. Use the functions: - Projector to define the point of view - Load to select the shape or shapes to be visualized - Update to compute the visible and hidden lines of the shape. Warning The shape or shapes to be visualized must have already been triangulated.
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo();

		/****** HLRBRep_PolyAlgo::HLRBRep_PolyAlgo ******/
		/****** md5 signature: 1af97386793d88a775904022c6ee7965 ******/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_PolyAlgo

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo(const opencascade::handle<HLRBRep_PolyAlgo> & A);

		/****** HLRBRep_PolyAlgo::HLRBRep_PolyAlgo ******/
		/****** md5 signature: ae2ef620ec86695e792ad732d56725e2 ******/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
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
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo(const TopoDS_Shape & S);

		/****** HLRBRep_PolyAlgo::Algo ******/
		/****** md5 signature: cd1fc8891d8e67ed127640c762ef6d62 ******/
		%feature("compactdefaultargs") Algo;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRAlgo_PolyAlgo>

Description
-----------
No available documentation.
") Algo;
		const opencascade::handle<HLRAlgo_PolyAlgo> & Algo();

		/****** HLRBRep_PolyAlgo::Debug ******/
		/****** md5 signature: 75d264d81a6f5a05c3d2806f64b732f5 ******/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Debug;
		bool Debug();

		/****** HLRBRep_PolyAlgo::Debug ******/
		/****** md5 signature: 3bdc6dbc94a5da9f98ff84265f964d6f ******/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "
Parameters
----------
theDebug: bool

Return
-------
None

Description
-----------
No available documentation.
") Debug;
		void Debug(const bool theDebug);

		/****** HLRBRep_PolyAlgo::Hide ******/
		/****** md5 signature: 7b1a2dae0f3e5c57d145029c52818bd0 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
status: HLRAlgo_EdgeStatus
S: TopoDS_Shape

Return
-------
reg1: bool
regn: bool
outl: bool
intl: bool

Description
-----------
No available documentation.
") Hide;
		HLRAlgo_BiPoint::PointsT & Hide(HLRAlgo_EdgeStatus & status, TopoDS_Shape & S, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** HLRBRep_PolyAlgo::Index ******/
		/****** md5 signature: 27bedbe3f62518ea8f5e80df9093520c ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
return the index of the Shape <S> and return 0 if the Shape <S> is not found.
") Index;
		int Index(const TopoDS_Shape & S);

		/****** HLRBRep_PolyAlgo::InitHide ******/
		/****** md5 signature: 6d3a01e37a94e3705475c3d6870e3eb9 ******/
		%feature("compactdefaultargs") InitHide;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitHide;
		void InitHide();

		/****** HLRBRep_PolyAlgo::InitShow ******/
		/****** md5 signature: 0c19b9d9bad511b1134c595c7ff3584f ******/
		%feature("compactdefaultargs") InitShow;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitShow;
		void InitShow();

		/****** HLRBRep_PolyAlgo::Load ******/
		/****** md5 signature: 56097b0038014c5783d770f95d4d1211 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
Loads the shape S into this framework. Warning S must have already been triangulated.
") Load;
		void Load(const TopoDS_Shape & theShape);

		/****** HLRBRep_PolyAlgo::MoreHide ******/
		/****** md5 signature: 209e689301a035d18ddc46a73d4882f7 ******/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreHide;
		bool MoreHide();

		/****** HLRBRep_PolyAlgo::MoreShow ******/
		/****** md5 signature: 43df07479bdbac7168dbf918778d43e2 ******/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShow;
		bool MoreShow();

		/****** HLRBRep_PolyAlgo::NbShapes ******/
		/****** md5 signature: 761cf24f04b8e6718c8673bd43d8905b ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		int NbShapes();

		/****** HLRBRep_PolyAlgo::NextHide ******/
		/****** md5 signature: dcb66ac8288020d4ad437ebf60391a66 ******/
		%feature("compactdefaultargs") NextHide;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextHide;
		void NextHide();

		/****** HLRBRep_PolyAlgo::NextShow ******/
		/****** md5 signature: 3588c30af16811e553b4bc86d4db1d70 ******/
		%feature("compactdefaultargs") NextShow;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextShow;
		void NextShow();

		/****** HLRBRep_PolyAlgo::OutLinedShape ******/
		/****** md5 signature: 70f8daa56f2313e2214686a155f0c5f5 ******/
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Make a shape with the internal outlines in each face.
") OutLinedShape;
		TopoDS_Shape OutLinedShape(const TopoDS_Shape & S);

		/****** HLRBRep_PolyAlgo::Projector ******/
		/****** md5 signature: bc8b1b600cbb38fc2f006052292ba737 ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Return
-------
HLRAlgo_Projector

Description
-----------
Sets the parameters of the view for this framework. These parameters are defined by an HLRAlgo_Projector object, which is returned by the Projector function on a Prs3d_Projector object.
") Projector;
		const HLRAlgo_Projector & Projector();

		/****** HLRBRep_PolyAlgo::Projector ******/
		/****** md5 signature: 991509663f3e24eb2c11be56f8c3a92f ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "
Parameters
----------
theProj: HLRAlgo_Projector

Return
-------
None

Description
-----------
No available documentation.
") Projector;
		void Projector(const HLRAlgo_Projector & theProj);

		/****** HLRBRep_PolyAlgo::Remove ******/
		/****** md5 signature: 9539381babdabf9d42bd9b8bddb394a0 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
remove the Shape of Index <I>.
") Remove;
		void Remove(const int I);

		/****** HLRBRep_PolyAlgo::Shape ******/
		/****** md5 signature: 32947d86a74f52b4e3494fa013950291 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		TopoDS_Shape Shape(const int I);

		/****** HLRBRep_PolyAlgo::Show ******/
		/****** md5 signature: d8b1c6828eede079f772743b3ebff1ca ******/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
reg1: bool
regn: bool
outl: bool
intl: bool

Description
-----------
No available documentation.
") Show;
		HLRAlgo_BiPoint::PointsT & Show(TopoDS_Shape & S, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****** HLRBRep_PolyAlgo::TolAngular ******/
		/****** md5 signature: 08fbab00fd4f488e392164e36068459a ******/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") TolAngular;
		double TolAngular();

		/****** HLRBRep_PolyAlgo::TolAngular ******/
		/****** md5 signature: 51d2385545cfee512301dc707cb7b32d ******/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
No available documentation.
") TolAngular;
		void TolAngular(const double theTol);

		/****** HLRBRep_PolyAlgo::TolCoef ******/
		/****** md5 signature: 4f3db66b4d9697f4e64b5863cda47c4b ******/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") TolCoef;
		double TolCoef();

		/****** HLRBRep_PolyAlgo::TolCoef ******/
		/****** md5 signature: d96c15079f4b3d9b009f68cbaa6b646b ******/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
No available documentation.
") TolCoef;
		void TolCoef(const double theTol);

		/****** HLRBRep_PolyAlgo::Update ******/
		/****** md5 signature: 997c8dd85f474bf26af99d1a07d6fa3f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Launches calculation of outlines of the shape visualized by this framework. Used after setting the point of view and defining the shape or shapes to be visualized.
") Update;
		void Update();

};


%make_alias(HLRBRep_PolyAlgo)

%extend HLRBRep_PolyAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class HLRBRep_PolyHLRToShape *
*******************************/
class HLRBRep_PolyHLRToShape {
	public:
		/****** HLRBRep_PolyHLRToShape::HLRBRep_PolyHLRToShape ******/
		/****** md5 signature: 316c066a5dd84a0d514693f15e0fd063 ******/
		%feature("compactdefaultargs") HLRBRep_PolyHLRToShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a framework for filtering the results of the HLRBRep_Algo algorithm, A. Use the extraction filters to obtain the results you want for A.
") HLRBRep_PolyHLRToShape;
		 HLRBRep_PolyHLRToShape();

		/****** HLRBRep_PolyHLRToShape::HCompound ******/
		/****** md5 signature: d34edae76e829f1ff2d89a8960cf3e12 ******/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") HCompound;
		TopoDS_Shape HCompound();

		/****** HLRBRep_PolyHLRToShape::HCompound ******/
		/****** md5 signature: 2997b95b2432c211a71c2206e24af92a ******/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") HCompound;
		TopoDS_Shape HCompound(const TopoDS_Shape & S);

		/****** HLRBRep_PolyHLRToShape::Hide ******/
		/****** md5 signature: 58365d1b8e35bd4bc81d336d692c97a2 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Hide;
		void Hide();

		/****** HLRBRep_PolyHLRToShape::OutLineHCompound ******/
		/****** md5 signature: 993a692ca08865997787c9c432b66a0b ******/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound();

		/****** HLRBRep_PolyHLRToShape::OutLineHCompound ******/
		/****** md5 signature: 69b9f95e47e310fe017b907b8be5c05f ******/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Sets the extraction filter for hidden outlines. Hidden outlines occur, for instance, in tori. In this case, the inner outlines of the torus seen on its side are hidden.
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound(const TopoDS_Shape & S);

		/****** HLRBRep_PolyHLRToShape::OutLineVCompound ******/
		/****** md5 signature: 25faaf0a9af31872bd3162a776e94610 ******/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound();

		/****** HLRBRep_PolyHLRToShape::OutLineVCompound ******/
		/****** md5 signature: dc53a0fc06a7656e9e77f9923845f706 ******/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Sets the extraction filter for visible outlines.
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound(const TopoDS_Shape & S);

		/****** HLRBRep_PolyHLRToShape::Rg1LineHCompound ******/
		/****** md5 signature: 063e628b8490e553d3a05b3ca4a02e8b ******/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound();

		/****** HLRBRep_PolyHLRToShape::Rg1LineHCompound ******/
		/****** md5 signature: 8f888b00c60642e3ea8585f639fb09b4 ******/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Sets the extraction filter for hidden smooth edges.
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound(const TopoDS_Shape & S);

		/****** HLRBRep_PolyHLRToShape::Rg1LineVCompound ******/
		/****** md5 signature: 229e02efd65b2e1b670b659a88c7d415 ******/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Sets the extraction filter for visible smooth edges.
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound();

		/****** HLRBRep_PolyHLRToShape::Rg1LineVCompound ******/
		/****** md5 signature: 89b5bda87b84171ac096a13345eb4112 ******/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound(const TopoDS_Shape & S);

		/****** HLRBRep_PolyHLRToShape::RgNLineHCompound ******/
		/****** md5 signature: 49e041ea3f17a34b12366f0bf44d8041 ******/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound();

		/****** HLRBRep_PolyHLRToShape::RgNLineHCompound ******/
		/****** md5 signature: ba723fa11f7dac4ccdb53ec6ca9ed189 ******/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Sets the extraction filter for hidden sewn edges.
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound(const TopoDS_Shape & S);

		/****** HLRBRep_PolyHLRToShape::RgNLineVCompound ******/
		/****** md5 signature: d8db52358f306f0be6b39a2a23ceb415 ******/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Sets the extraction filter for visible sewn edges.
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound();

		/****** HLRBRep_PolyHLRToShape::RgNLineVCompound ******/
		/****** md5 signature: ca8daffebca0973374b81b46c5ddaacb ******/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound(const TopoDS_Shape & S);

		/****** HLRBRep_PolyHLRToShape::Show ******/
		/****** md5 signature: 9067ac917ffb66a9e8ff84ea37a89cbe ******/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Show;
		void Show();

		/****** HLRBRep_PolyHLRToShape::Update ******/
		/****** md5 signature: 853d04a0792e48573fd53908bdce7810 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_PolyAlgo

Return
-------
None

Description
-----------
No available documentation.
") Update;
		void Update(const opencascade::handle<HLRBRep_PolyAlgo> & A);

		/****** HLRBRep_PolyHLRToShape::VCompound ******/
		/****** md5 signature: 8199daca65384c5d1ce7561af621cc2d ******/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") VCompound;
		TopoDS_Shape VCompound();

		/****** HLRBRep_PolyHLRToShape::VCompound ******/
		/****** md5 signature: 7bf9afb62ac439881e796a557babeda9 ******/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") VCompound;
		TopoDS_Shape VCompound(const TopoDS_Shape & S);

};


%extend HLRBRep_PolyHLRToShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRBRep_SLPropsATool *
*****************************/
class HLRBRep_SLPropsATool {
	public:
		/****** HLRBRep_SLPropsATool::Bounds ******/
		/****** md5 signature: 42e2057f2f02553b9130859f4d773d6e ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_SurfacePtr

Return
-------
U1: double
V1: double
U2: double
V2: double

Description
-----------
returns the bounds of the Surface.
") Bounds;
		static void Bounds(const HLRBRep_SurfacePtr A, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_SLPropsATool::Continuity ******/
		/****** md5 signature: 099d5c5769ee29f4aede672f362e5b49 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_SurfacePtr

Return
-------
int

Description
-----------
returns the order of continuity of the Surface <A>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable.
") Continuity;
		static int Continuity(const HLRBRep_SurfacePtr A);

		/****** HLRBRep_SLPropsATool::D1 ******/
		/****** md5 signature: f1ee7f085487f3f1f5c09c9e5087fcae ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_SurfacePtr
U: double
V: double
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the Surface <A>.
") D1;
		static void D1(const HLRBRep_SurfacePtr A, const double U, const double V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** HLRBRep_SLPropsATool::D2 ******/
		/****** md5 signature: 7b13eda14be67518f0af82f3152a8277 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_SurfacePtr
U: double
V: double
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
DUV: gp_Vec

Return
-------
None

Description
-----------
Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the Surface <A>.
") D2;
		static void D2(const HLRBRep_SurfacePtr A, const double U, const double V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****** HLRBRep_SLPropsATool::DN ******/
		/****** md5 signature: 8bf95a3cd0faedf658fb5669dde1dc76 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_SurfacePtr
U: double
V: double
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const HLRBRep_SurfacePtr A, const double U, const double V, const int Nu, const int Nv);

		/****** HLRBRep_SLPropsATool::Value ******/
		/****** md5 signature: 9d0a77e212ce235095d04daad6a66a0d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_SurfacePtr
U: double
V: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> and <V> on the Surface <A>.
") Value;
		static void Value(const HLRBRep_SurfacePtr A, const double U, const double V, gp_Pnt & P);

};


%extend HLRBRep_SLPropsATool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class HLRBRep_ShapeBounds *
****************************/
class HLRBRep_ShapeBounds {
	public:
		/****** HLRBRep_ShapeBounds::HLRBRep_ShapeBounds ******/
		/****** md5 signature: 379c0fe6d061356abb75ec8e7a7a2c74 ******/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds();

		/****** HLRBRep_ShapeBounds::HLRBRep_ShapeBounds ******/
		/****** md5 signature: 881e648863fd63215d5abda151335d8c ******/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner
SData: Standard_Transient
nbIso: int
V1: int
V2: int
E1: int
E2: int
F1: int
F2: int

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const opencascade::handle<Standard_Transient> & SData, const int nbIso, const int V1, const int V2, const int E1, const int E2, const int F1, const int F2);

		/****** HLRBRep_ShapeBounds::HLRBRep_ShapeBounds ******/
		/****** md5 signature: 0cc05cc30ff2d8f0dbaff4e232df8623 ******/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner
nbIso: int
V1: int
V2: int
E1: int
E2: int
F1: int
F2: int

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const int nbIso, const int V1, const int V2, const int E1, const int E2, const int F1, const int F2);

		/****** HLRBRep_ShapeBounds::Bounds ******/
		/****** md5 signature: 87b9356ee3941507b97b2c221d5cf1d5 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
V1: int
V2: int
E1: int
E2: int
F1: int
F2: int

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** HLRBRep_ShapeBounds::MinMax ******/
		/****** md5 signature: b360e6f636632e8d4f24d53763098bae ******/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "Return
-------
HLRAlgo_EdgesBlock::MinMaxIndices

Description
-----------
No available documentation.
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****** HLRBRep_ShapeBounds::NbOfIso ******/
		/****** md5 signature: 3d695ce283f67d0f0ea5029d69e46645 ******/
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", "
Parameters
----------
nbIso: int

Return
-------
None

Description
-----------
No available documentation.
") NbOfIso;
		void NbOfIso(const int nbIso);

		/****** HLRBRep_ShapeBounds::NbOfIso ******/
		/****** md5 signature: edfb23205008635510aa2730be3b34ff ******/
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOfIso;
		int NbOfIso();

		/****** HLRBRep_ShapeBounds::Shape ******/
		/****** md5 signature: c40d2651cf3439795c161bba801087bd ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner

Return
-------
None

Description
-----------
No available documentation.
") Shape;
		void Shape(const opencascade::handle<HLRTopoBRep_OutLiner> & S);

		/****** HLRBRep_ShapeBounds::Shape ******/
		/****** md5 signature: 9d560c29d1d7462539af7e9c3fd99beb ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
opencascade::handle<HLRTopoBRep_OutLiner>

Description
-----------
No available documentation.
") Shape;
		const opencascade::handle<HLRTopoBRep_OutLiner> & Shape();

		/****** HLRBRep_ShapeBounds::ShapeData ******/
		/****** md5 signature: 63c6b83301d53a94834f3840c5a95655 ******/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "
Parameters
----------
SD: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") ShapeData;
		void ShapeData(const opencascade::handle<Standard_Transient> & SD);

		/****** HLRBRep_ShapeBounds::ShapeData ******/
		/****** md5 signature: 333878c93abf5945b936c3ab1b51c32e ******/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") ShapeData;
		const opencascade::handle<Standard_Transient> & ShapeData();

		/****** HLRBRep_ShapeBounds::Sizes ******/
		/****** md5 signature: edcd3fe6f96538535c5b1305d0cfaed2 ******/
		%feature("compactdefaultargs") Sizes;
		%feature("autodoc", "
Parameters
----------

Return
-------
NV: int
NE: int
NF: int

Description
-----------
No available documentation.
") Sizes;
		void Sizes(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** HLRBRep_ShapeBounds::Translate ******/
		/****** md5 signature: 821a160949e8b87822134700d057bfee ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
NV: int
NE: int
NF: int

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const int NV, const int NE, const int NF);

		/****** HLRBRep_ShapeBounds::UpdateMinMax ******/
		/****** md5 signature: c563cf49ef5528b88530ee707872c5e6 ******/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "
Parameters
----------
theTotMinMax: HLRAlgo_EdgesBlock::MinMaxIndices

Return
-------
None

Description
-----------
No available documentation.
") UpdateMinMax;
		void UpdateMinMax(const HLRAlgo_EdgesBlock::MinMaxIndices & theTotMinMax);

};


%extend HLRBRep_ShapeBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class HLRBRep_ShapeToHLR *
***************************/
class HLRBRep_ShapeToHLR {
	public:
		/****** HLRBRep_ShapeToHLR::Load ******/
		/****** md5 signature: fb35ec8dbc8ea448c10aa29eb290955a ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner
P: HLRAlgo_Projector
MST: NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher>
nbIso: int (optional, default to 0)

Return
-------
opencascade::handle<HLRBRep_Data>

Description
-----------
Creates a DataStructure containing the OutLiner <S> depending on the projector <P> and nbIso.
") Load;
		static opencascade::handle<HLRBRep_Data> Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const HLRAlgo_Projector & P, NCollection_DataMap<TopoDS_Shape, BRepTopAdaptor_Tool, TopTools_ShapeMapHasher> & MST, const int nbIso = 0);

};


%extend HLRBRep_ShapeToHLR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class HLRBRep_Surface *
************************/
/****************************
* class HLRBRep_SurfaceTool *
****************************/
class HLRBRep_SurfaceTool {
	public:
		/****** HLRBRep_SurfaceTool::AxeOfRevolution ******/
		/****** md5 signature: 64b8617709d83786c98e9752df39ef95 ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::BSpline ******/
		/****** md5 signature: 50ce6de23c2b853497f8fb9da20289ef ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::BasisCurve ******/
		/****** md5 signature: 3b3297432f2ca108cc3d315edafe2234 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		static opencascade::handle<Adaptor3d_Curve> BasisCurve(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::BasisSurface ******/
		/****** md5 signature: 3c6f3645d71a8aff3689cfa690030ce3 ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		static opencascade::handle<Adaptor3d_Surface> BasisSurface(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::Bezier ******/
		/****** md5 signature: 921c3ccb60a3d8b816a21e394401d284 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::Cone ******/
		/****** md5 signature: cd37f4c63a63c68868a52aa071dc12c0 ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		static gp_Cone Cone(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::Cylinder ******/
		/****** md5 signature: 6bd4253579779627c4e08a34a1329b56 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		static gp_Cylinder Cylinder(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::D0 ******/
		/****** md5 signature: efaac1f7aba7c4bb0998162b620f80d1 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theU: double
theV: double
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const HLRBRep_Surface * theSurf, const double theU, const double theV, gp_Pnt & theP);

		/****** HLRBRep_SurfaceTool::D1 ******/
		/****** md5 signature: ba5f2ca80ca5c7564f996f31014f56c8 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theU: double
theV: double
theP: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const HLRBRep_Surface * theSurf, const double theU, const double theV, gp_Pnt & theP, gp_Vec & theD1U, gp_Vec & theD1V);

		/****** HLRBRep_SurfaceTool::D2 ******/
		/****** md5 signature: d831dd1d8ee72538bc57ed2b0805aad2 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theU: double
theV: double
theP: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const HLRBRep_Surface * theSurf, const double theU, const double theV, gp_Pnt & theP, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****** HLRBRep_SurfaceTool::D3 ******/
		/****** md5 signature: 58ac9a6dcd6a19ce7aeeec0b8e2a4975 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theU: double
theV: double
theP: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theD3U: gp_Vec
theD3V: gp_Vec
theD3UUV: gp_Vec
theD3UVV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const HLRBRep_Surface * theSurf, const double theU, const double theV, gp_Pnt & theP, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****** HLRBRep_SurfaceTool::DN ******/
		/****** md5 signature: 070fc2b698c285e210937d34a601e05a ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theU: double
theV: double
theNu: int
theNv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const HLRBRep_Surface * theSurf, const double theU, const double theV, const int theNu, const int theNv);

		/****** HLRBRep_SurfaceTool::Direction ******/
		/****** md5 signature: 972831f054225eb167eb78a0f1924120 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		static gp_Dir Direction(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::FirstUParameter ******/
		/****** md5 signature: 7318ad3c5d634e22e9ac3e804df78687 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		static double FirstUParameter(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::FirstVParameter ******/
		/****** md5 signature: fa55dc29e2993fb7113ba8d09a37adea ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		static double FirstVParameter(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::GetType ******/
		/****** md5 signature: 07544b3a1278c1a818ec185e5e4fbaae ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
GeomAbs_SurfaceType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_SurfaceType GetType(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::IsUClosed ******/
		/****** md5 signature: c99463f5dc474345efe147e5c3659fcb ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		static bool IsUClosed(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::IsUPeriodic ******/
		/****** md5 signature: 365b2dee2b4246a8df6f8a01305fe343 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		static bool IsUPeriodic(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::IsVClosed ******/
		/****** md5 signature: a8328f5347b212fa0adb8c8b7d6f1248 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		static bool IsVClosed(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::IsVPeriodic ******/
		/****** md5 signature: f3613eb1ef308d6297965f5eb10289c3 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		static bool IsVPeriodic(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::LastUParameter ******/
		/****** md5 signature: 29cc2d90858652279e929e582e4109c2 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		static double LastUParameter(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::LastVParameter ******/
		/****** md5 signature: 77dcc1a7a11d1d397a4c1c173f6331c3 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		static double LastVParameter(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: b636e30531eb5371a5629a645a5520dd ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: e5360fe3043774961408e153dae3762a ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theU1: double
theU2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const HLRBRep_Surface * theSurf, const double theU1, const double theU2);

		/****** HLRBRep_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: d2a063c56592031d412bfec96959c66e ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: b2dd49f61dd5dd4283d5ee85baca1755 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theV1: double
theV2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const HLRBRep_Surface * theSurf, const double theV1, const double theV2);

		/****** HLRBRep_SurfaceTool::NbUIntervals ******/
		/****** md5 signature: 0f58b95be46dcaafce91267f9049d426 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theSh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbUIntervals;
		static int NbUIntervals(const HLRBRep_Surface * theSurf, const GeomAbs_Shape theSh);

		/****** HLRBRep_SurfaceTool::NbVIntervals ******/
		/****** md5 signature: 63ea31ce25477d835f1034ad9f4cdf73 ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theSh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbVIntervals;
		static int NbVIntervals(const HLRBRep_Surface * theSurf, const GeomAbs_Shape theSh);

		/****** HLRBRep_SurfaceTool::OffsetValue ******/
		/****** md5 signature: cebc2cdb95141d215d4505bc7884e399 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
double

Description
-----------
No available documentation.
") OffsetValue;
		static double OffsetValue(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::Plane ******/
		/****** md5 signature: 11cb1b688b10b9c6eedb16b2eaaaf23a ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		static gp_Pln Plane(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::Sphere ******/
		/****** md5 signature: 3687b94f5a7466e828a5f12fc9fef2d0 ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		static gp_Sphere Sphere(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::Torus ******/
		/****** md5 signature: 43fcdae1693a90e2a7c85151838e79c5 ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		static gp_Torus Torus(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::UIntervals ******/
		/****** md5 signature: 0796519821eda684a1b51b8b00b0194f ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theT: TColStd_Array1OfReal
theSh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") UIntervals;
		static void UIntervals(const HLRBRep_Surface * theSurf, TColStd_Array1OfReal & theT, const GeomAbs_Shape theSh);

		/****** HLRBRep_SurfaceTool::UPeriod ******/
		/****** md5 signature: a7f468fc7b1c2a3a869640684ea3bc1b ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		static double UPeriod(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::UResolution ******/
		/****** md5 signature: a74b729d197cafe6c731b0e4792edf89 ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") UResolution;
		static double UResolution(const HLRBRep_Surface * theSurf, const double theR3d);

		/****** HLRBRep_SurfaceTool::UTrim ******/
		/****** md5 signature: de3402a2493d8623945bf35b0ebd7a6d ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theFirst: double
theLast: double
theTol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <theFirst> >= <theLast>.
") UTrim;
		static opencascade::handle<Adaptor3d_Surface> UTrim(const HLRBRep_Surface * theSurf, const double theFirst, const double theLast, const double theTol);

		/****** HLRBRep_SurfaceTool::VIntervals ******/
		/****** md5 signature: cd5fd9ce3f665ecf7daf54a8e8b2d601 ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theT: TColStd_Array1OfReal
theSh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") VIntervals;
		static void VIntervals(const HLRBRep_Surface * theSurf, TColStd_Array1OfReal & theT, const GeomAbs_Shape theSh);

		/****** HLRBRep_SurfaceTool::VPeriod ******/
		/****** md5 signature: 31816d481b7868e6b63ed59171a0c538 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *

Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		static double VPeriod(const HLRBRep_Surface * theSurf);

		/****** HLRBRep_SurfaceTool::VResolution ******/
		/****** md5 signature: 8193ae4d5c14b592c227016f79f60743 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") VResolution;
		static double VResolution(const HLRBRep_Surface * theSurf, const double theR3d);

		/****** HLRBRep_SurfaceTool::VTrim ******/
		/****** md5 signature: 3666352f132e738e092a9e08325a0a97 ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theFirst: double
theLast: double
theTol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <theFirst> >= <theLast>.
") VTrim;
		static opencascade::handle<Adaptor3d_Surface> VTrim(const HLRBRep_Surface * theSurf, const double theFirst, const double theLast, const double theTol);

		/****** HLRBRep_SurfaceTool::Value ******/
		/****** md5 signature: c7639710267406d823924755dce4e690 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theSurf: HLRBRep_Surface *
theU: double
theV: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const HLRBRep_Surface * theSurf, const double theU, const double theV);

};


%extend HLRBRep_SurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class HLRBRep_TheCSFunctionOfInterCSurf *
******************************************/
class HLRBRep_TheCSFunctionOfInterCSurf : public math_FunctionSetWithDerivatives {
	public:
		/****** HLRBRep_TheCSFunctionOfInterCSurf::HLRBRep_TheCSFunctionOfInterCSurf ******/
		/****** md5 signature: 9ecd9132105bf47e90238a1b705d6d8d ******/
		%feature("compactdefaultargs") HLRBRep_TheCSFunctionOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
S: HLRBRep_Surface *
C: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_TheCSFunctionOfInterCSurf;
		 HLRBRep_TheCSFunctionOfInterCSurf(HLRBRep_Surface * const & S, const gp_Lin & C);

		/****** HLRBRep_TheCSFunctionOfInterCSurf::AuxillarCurve ******/
		/****** md5 signature: 6a61ff41c44fd5e0d96a3296ffda6b5b ******/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") AuxillarCurve;
		const gp_Lin AuxillarCurve();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::AuxillarSurface ******/
		/****** md5 signature: 7c3292da60dfabaf50510bc580abac5f ******/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "Return
-------
HLRBRep_Surface *

Description
-----------
No available documentation.
") AuxillarSurface;
		HLRBRep_Surface * AuxillarSurface();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** HLRBRep_TheCSFunctionOfInterCSurf::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Root;
		double Root();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend HLRBRep_TheCSFunctionOfInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter *
******************************************************************/
class HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter : public math_FunctionSetWithDerivatives {
	public:
		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter ******/
		/****** md5 signature: 95355a31110e62ff66797b7e9113365b ******/
		%feature("compactdefaultargs") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
curve1: HLRBRep_CurvePtr
curve2: HLRBRep_CurvePtr

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter(const HLRBRep_CurvePtr & curve1, const HLRBRep_CurvePtr & curve2);

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbEquations;
		int NbEquations();

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbVariables;
		int NbVariables();

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. returns True if the computation was done successfully, False otherwise.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class HLRBRep_TheExactInterCSurf *
***********************************/
class HLRBRep_TheExactInterCSurf {
	public:
		/****** HLRBRep_TheExactInterCSurf::HLRBRep_TheExactInterCSurf ******/
		/****** md5 signature: 1d5935b63f3338cdca37e8c4c1d7d7e3 ******/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
W: double
F: HLRBRep_TheCSFunctionOfInterCSurf
TolTangency: double
MarginCoef: double (optional, default to 0.0)

Return
-------
None

Description
-----------
compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst).
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf(const double U, const double V, const double W, const HLRBRep_TheCSFunctionOfInterCSurf & F, const double TolTangency, const double MarginCoef = 0.0);

		/****** HLRBRep_TheExactInterCSurf::HLRBRep_TheExactInterCSurf ******/
		/****** md5 signature: 04638858767d53e6fb55fb6ebe5af067 ******/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "
Parameters
----------
F: HLRBRep_TheCSFunctionOfInterCSurf
TolTangency: double

Return
-------
None

Description
-----------
initialize the parameters to compute the solution.
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf(const HLRBRep_TheCSFunctionOfInterCSurf & F, const double TolTangency);

		/****** HLRBRep_TheExactInterCSurf::Function ******/
		/****** md5 signature: 42b19a18bcf6551f209a8f79f49f3a6e ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
HLRBRep_TheCSFunctionOfInterCSurf

Description
-----------
return the math function which is used to compute the intersection.
") Function;
		HLRBRep_TheCSFunctionOfInterCSurf & Function();

		/****** HLRBRep_TheExactInterCSurf::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		bool IsDone();

		/****** HLRBRep_TheExactInterCSurf::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** HLRBRep_TheExactInterCSurf::ParameterOnCurve ******/
		/****** md5 signature: 57f5295e1d0243d744a43fcea3cf7388 ******/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnCurve;
		double ParameterOnCurve();

		/****** HLRBRep_TheExactInterCSurf::ParameterOnSurface ******/
		/****** md5 signature: 7f31eb7c473aecf695130da66c37cc8a ******/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_TheExactInterCSurf::Perform ******/
		/****** md5 signature: 32414faba82bb6739429b692c1146008 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
W: double
Rsnld: math_FunctionSetRoot
u0: double
v0: double
u1: double
v1: double
w0: double
w1: double

Return
-------
None

Description
-----------
compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }.
") Perform;
		void Perform(const double U, const double V, const double W, math_FunctionSetRoot & Rsnld, const double u0, const double v0, const double u1, const double v1, const double w0, const double w1);

		/****** HLRBRep_TheExactInterCSurf::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns the intersection point The exception NotDone is raised if IsDone is false. The exception DomainError is raised if IsEmpty is true.
") Point;
		const gp_Pnt Point();

};


%extend HLRBRep_TheExactInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class HLRBRep_TheIntConicCurveOfCInter *
*****************************************/
class HLRBRep_TheIntConicCurveOfCInter : public IntRes2d_Intersection {
	public:
		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: fcfdd64aa2c2d522ed3b64d9c5490dbc ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter();

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: a1eca9bbd3aeba1ef92e37ba2e62dff1 ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: 2919538fbf923198aa471483659e5936 ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: 48b691918d1737b325e9cc91b33ab94e ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: ebb96b2f7efed63be0a05a2c0778cdee ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: 6e7d596ffde264daa60957f41d637679 ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: f9b9eb3d8295f7a5235c4b961c512389 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 90c767a29faf1ed79b4fdbf08eca13e6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: b930d935742441869f4e8decde900041 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 1f9e13a8ffa1ec749a03fae729a1beb0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: fc249b74a03be399405216462aef799b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
D2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & D2, const double TolConf, const double Tol);

};


%extend HLRBRep_TheIntConicCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class HLRBRep_TheIntPCurvePCurveOfCInter *
*******************************************/
class HLRBRep_TheIntPCurvePCurveOfCInter : public IntRes2d_Intersection {
	public:
		/****** HLRBRep_TheIntPCurvePCurveOfCInter::HLRBRep_TheIntPCurvePCurveOfCInter ******/
		/****** md5 signature: 0695fdc8fa1d0dc9def3f03aaac66d0f ******/
		%feature("compactdefaultargs") HLRBRep_TheIntPCurvePCurveOfCInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_TheIntPCurvePCurveOfCInter;
		 HLRBRep_TheIntPCurvePCurveOfCInter();

		/****** HLRBRep_TheIntPCurvePCurveOfCInter::GetMinNbSamples ******/
		/****** md5 signature: fd21667dcec0124f6dfae4103cb5ec2b ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		int GetMinNbSamples();

		/****** HLRBRep_TheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: ba932bb5ddc96400d423b3dceec8c552 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: HLRBRep_CurvePtr
Domain1: IntRes2d_Domain
Curve2: HLRBRep_CurvePtr
Domain2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const HLRBRep_CurvePtr & Curve1, const IntRes2d_Domain & Domain1, const HLRBRep_CurvePtr & Curve2, const IntRes2d_Domain & Domain2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: c317f607bdb816fe8c52660cfb42bbca ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: HLRBRep_CurvePtr
Domain1: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const HLRBRep_CurvePtr & Curve1, const IntRes2d_Domain & Domain1, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntPCurvePCurveOfCInter::SetMinNbSamples ******/
		/****** md5 signature: 9d653919fbe121787c6b21a6579f45a2 ******/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "
Parameters
----------
theMinNbSamples: int

Return
-------
None

Description
-----------
Set / get minimum number of points in polygon for intersection.
") SetMinNbSamples;
		void SetMinNbSamples(const int theMinNbSamples);

};


%extend HLRBRep_TheIntPCurvePCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class HLRBRep_TheInterferenceOfInterCSurf *
********************************************/
class HLRBRep_TheInterferenceOfInterCSurf : public Intf_Interference {
	public:
		/****** HLRBRep_TheInterferenceOfInterCSurf::HLRBRep_TheInterferenceOfInterCSurf ******/
		/****** md5 signature: 649a5d51337d3bee9d8acb2d500cc8cb ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interference between Polygon and Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf();

		/****** HLRBRep_TheInterferenceOfInterCSurf::HLRBRep_TheInterferenceOfInterCSurf ******/
		/****** md5 signature: 9a662104a5923a3db3c6bc30cd347e52 ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Constructs and computes an interference between the Polygon and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_TheInterferenceOfInterCSurf::HLRBRep_TheInterferenceOfInterCSurf ******/
		/****** md5 signature: 3bb86f46141c92b411175e203ab25e49 ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Line and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_TheInterferenceOfInterCSurf::HLRBRep_TheInterferenceOfInterCSurf ******/
		/****** md5 signature: fd8d22e8452ff7586202a617a10d889d ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const NCollection_Array1<gp_Lin> & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_TheInterferenceOfInterCSurf::HLRBRep_TheInterferenceOfInterCSurf ******/
		/****** md5 signature: e9abc3f8ffcb76b644777d8515a87180 ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the Polygon and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** HLRBRep_TheInterferenceOfInterCSurf::HLRBRep_TheInterferenceOfInterCSurf ******/
		/****** md5 signature: 736d91f670b7fff42e0b9e058f377413 ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Line and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** HLRBRep_TheInterferenceOfInterCSurf::HLRBRep_TheInterferenceOfInterCSurf ******/
		/****** md5 signature: 917f5a4beaa9d505515bac63ab83c024 ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const NCollection_Array1<gp_Lin> & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Interference ******/
		/****** md5 signature: 34220ab879293bb4da6b378528e1d8ae ******/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "
Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.
") Interference;
		void Interference(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Interference ******/
		/****** md5 signature: 11cb2f1b39b9a3c4d7e1a876414d1511 ******/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "
Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.
") Interference;
		void Interference(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Perform ******/
		/****** md5 signature: 275ab913ea58b7ed70af8ec61e979d83 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Computes an interference between the Polygon and the Polyhedron.
") Perform;
		void Perform(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Perform ******/
		/****** md5 signature: 9037d3afe578b7a123de772327e25beb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Computes an interference between the Straight Line and the Polyhedron.
") Perform;
		void Perform(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Perform ******/
		/****** md5 signature: 7eec749690920994154f41082d65b471 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Computes an interference between the Straight Lines and the Polyhedron.
") Perform;
		void Perform(const NCollection_Array1<gp_Lin> & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Perform ******/
		/****** md5 signature: 9d72f3ea3d51d77277fd39ac981edc93 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the Polygon and the Polyhedron.
") Perform;
		void Perform(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Perform ******/
		/****** md5 signature: a45c2f7531abebcdf9ffd623bce8a3de ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the Straight Line and the Polyhedron.
") Perform;
		void Perform(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** HLRBRep_TheInterferenceOfInterCSurf::Perform ******/
		/****** md5 signature: 57a327fbfc4d600694a81419f9154e08 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the Straight Lines and the Polyhedron.
") Perform;
		void Perform(const NCollection_Array1<gp_Lin> & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

};


%extend HLRBRep_TheInterferenceOfInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter *
*********************************************************/
class HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter : public IntRes2d_Intersection {
	public:
		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ******/
		/****** md5 signature: ceddaec07332ff871487862e824ed29d ******/
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter();

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ******/
		/****** md5 signature: de837fb956d0070631244b7e8234d6ae ******/
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
Dom2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & Dom2, const double TolConf, const double Tol);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::And_Domaine_Objet1_Intersections ******/
		/****** md5 signature: e025235cf231763bc2b8b2c734c3a0d4 ******/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "
Parameters
----------
TheImpTool: IntCurve_IConicTool
TheParCurve: HLRBRep_CurvePtr
TheImpCurveDomain: IntRes2d_Domain
TheParCurveDomain: IntRes2d_Domain
Inter2_And_Domain2: TColStd_Array1OfReal
Inter1: TColStd_Array1OfReal
Resultat1: TColStd_Array1OfReal
Resultat2: TColStd_Array1OfReal
EpsNul: double

Return
-------
NbResultats: int

Description
-----------
No available documentation.
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const HLRBRep_CurvePtr & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const double EpsNul);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::FindU ******/
		/****** md5 signature: eced76384d336c72043a92a8df1babc7 ******/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "
Parameters
----------
parameter: double
point: gp_Pnt2d
TheParCurev: HLRBRep_CurvePtr
TheImpTool: IntCurve_IConicTool

Return
-------
double

Description
-----------
No available documentation.
") FindU;
		double FindU(const double parameter, gp_Pnt2d & point, const HLRBRep_CurvePtr & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::FindV ******/
		/****** md5 signature: e5cec4bfe333c5efae822e8cff770e63 ******/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "
Parameters
----------
parameter: double
point: gp_Pnt2d
TheImpTool: IntCurve_IConicTool
ParCurve: HLRBRep_CurvePtr
TheParCurveDomain: IntRes2d_Domain
V0: double
V1: double
Tolerance: double

Return
-------
double

Description
-----------
No available documentation.
") FindV;
		double FindV(const double parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const HLRBRep_CurvePtr & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const double V0, const double V1, const double Tolerance);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: ed48772b1acea4dba44fa3af62b06a6d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: HLRBRep_CurvePtr
Dom2: IntRes2d_Domain
TolConf: double
Tol: double

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") Perform;
		void Perform(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const HLRBRep_CurvePtr & PCurve, const IntRes2d_Domain & Dom2, const double TolConf, const double Tol);

};


%extend HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter *
*********************************************************/
class HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter : public Intf_Polygon2d {
	public:
		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter ******/
		/****** md5 signature: b84bf1f89be49242636cff7074cfda18 ******/
		%feature("compactdefaultargs") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
Curve: HLRBRep_CurvePtr
NbPnt: int
Domain: IntRes2d_Domain
Tol: double

Return
-------
None

Description
-----------
Compute a polygon on the domain of the curve.
") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter(const HLRBRep_CurvePtr & Curve, const int NbPnt, const IntRes2d_Domain & Domain, const double Tol);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::ApproxParamOnCurve ******/
		/****** md5 signature: 520ca19aee00f08506bff5bce4928594 ******/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: double

Return
-------
double

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		double ApproxParamOnCurve(const int Index, const double ParamOnLine);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::AutoIntersectionIsPossible ******/
		/****** md5 signature: c0c30ede09ff6c71792ccade65941d74 ******/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AutoIntersectionIsPossible;
		bool AutoIntersectionIsPossible();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::CalculRegion ******/
		/****** md5 signature: 2cbc0f90983b45c167b6b92efc5060b4 ******/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", "
Parameters
----------
x: double
y: double
x1: double
x2: double
y1: double
y2: double

Return
-------
int

Description
-----------
No available documentation.
") CalculRegion;
		int CalculRegion(const double x, const double y, const double x1, const double x2, const double y1, const double y2);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::Closed ******/
		/****** md5 signature: 343c462cc9a130bb05f2dc37938d483b ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
clos: bool

Return
-------
None

Description
-----------
No available documentation.
") Closed;
		void Closed(const bool clos);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::Closed ******/
		/****** md5 signature: 3092748280563d0fa6546c2fddc4b4a5 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the polyline is closed.
") Closed;
		bool Closed();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::ComputeWithBox ******/
		/****** md5 signature: 0368c6cad3bf4442c0657b77c256216d ******/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "
Parameters
----------
Curve: HLRBRep_CurvePtr
OtherBox: Bnd_Box2d

Return
-------
None

Description
-----------
The current polygon is modified if most of the points of the polygon are outside the box <OtherBox>. In this situation, bounds are computed to build a polygon inside or near the OtherBox.
") ComputeWithBox;
		void ComputeWithBox(const HLRBRep_CurvePtr & Curve, const Bnd_Box2d & OtherBox);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::DeflectionOverEstimation ******/
		/****** md5 signature: 1fad6591a4ff1f9e8e821a3a0670bc18 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		double DeflectionOverEstimation();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::InfParameter ******/
		/****** md5 signature: 7a45ea36426f6319ca9fdcc45fed2b64 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		double InfParameter();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::NbSegments ******/
		/****** md5 signature: dd047a9d60ac19f7e8995b778d22aba9 ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		int NbSegments();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::Segment ******/
		/****** md5 signature: 492f28c821222ab2c8cda9dffc334375 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points of the segment <Index> in the Polygon.
") Segment;
		void Segment(const int theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::SetDeflectionOverEstimation ******/
		/****** md5 signature: 7b7a5fb89a75e64dee0d34a28f8ad75a ******/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: double

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const double x);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::SupParameter ******/
		/****** md5 signature: 0badd8e202f44bc5962c793cc4fca7e8 ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
") SupParameter;
		double SupParameter();

};


%extend HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class HLRBRep_ThePolygonOfInterCSurf *
***************************************/
class HLRBRep_ThePolygonOfInterCSurf {
	public:
		/****** HLRBRep_ThePolygonOfInterCSurf::HLRBRep_ThePolygonOfInterCSurf ******/
		/****** md5 signature: f14c0c7d63b72619a2694871b5f11215 ******/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
NbPnt: int

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const int NbPnt);

		/****** HLRBRep_ThePolygonOfInterCSurf::HLRBRep_ThePolygonOfInterCSurf ******/
		/****** md5 signature: 477412dbd6d6f239e7d0fca3276e60cf ******/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
U1: double
U2: double
NbPnt: int

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const double U1, const double U2, const int NbPnt);

		/****** HLRBRep_ThePolygonOfInterCSurf::HLRBRep_ThePolygonOfInterCSurf ******/
		/****** md5 signature: 15a3993116a465134c3a76ce7a79a876 ******/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
Upars: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const TColStd_Array1OfReal & Upars);

		/****** HLRBRep_ThePolygonOfInterCSurf::ApproxParamOnCurve ******/
		/****** md5 signature: 520ca19aee00f08506bff5bce4928594 ******/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: double

Return
-------
double

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		double ApproxParamOnCurve(const int Index, const double ParamOnLine);

		/****** HLRBRep_ThePolygonOfInterCSurf::BeginOfSeg ******/
		/****** md5 signature: b5f0a31ca14db0a2f84ebff20a6aa499 ******/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range Index in the Polygon.
") BeginOfSeg;
		const gp_Pnt BeginOfSeg(const int theIndex);

		/****** HLRBRep_ThePolygonOfInterCSurf::Bounding ******/
		/****** md5 signature: 54ccbf8f63f02bb43c2fc9c718922d78 ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the polygon.
") Bounding;
		const Bnd_Box & Bounding();

		/****** HLRBRep_ThePolygonOfInterCSurf::Closed ******/
		/****** md5 signature: 81313c484636cef829aac0b752efb72e ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
flag: bool

Return
-------
None

Description
-----------
No available documentation.
") Closed;
		void Closed(const bool flag);

		/****** HLRBRep_ThePolygonOfInterCSurf::Closed ******/
		/****** md5 signature: 8fa7f82a3a97ae7fb9544764f500c779 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		bool Closed();

		/****** HLRBRep_ThePolygonOfInterCSurf::DeflectionOverEstimation ******/
		/****** md5 signature: 414fb811f991fcfbdeae5077c8f62bef ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		double DeflectionOverEstimation();

		/****** HLRBRep_ThePolygonOfInterCSurf::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** HLRBRep_ThePolygonOfInterCSurf::EndOfSeg ******/
		/****** md5 signature: dc55838f0a8bf871ed662c6fdbf445f0 ******/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range Index in the Polygon.
") EndOfSeg;
		const gp_Pnt EndOfSeg(const int theIndex);

		/****** HLRBRep_ThePolygonOfInterCSurf::InfParameter ******/
		/****** md5 signature: 5220389c34cc0aa1dc89c36017792ac2 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		double InfParameter();

		/****** HLRBRep_ThePolygonOfInterCSurf::NbSegments ******/
		/****** md5 signature: a484f4ef51493a5d103a692e844665ba ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		int NbSegments();

		/****** HLRBRep_ThePolygonOfInterCSurf::SetDeflectionOverEstimation ******/
		/****** md5 signature: 1dc358280ad6b7d445cb3da24d8ffaf3 ******/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: double

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const double x);

		/****** HLRBRep_ThePolygonOfInterCSurf::SupParameter ******/
		/****** md5 signature: c9a151df103c425bae261f99509e51b2 ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
") SupParameter;
		double SupParameter();

};


%extend HLRBRep_ThePolygonOfInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class HLRBRep_ThePolygonToolOfInterCSurf *
*******************************************/
class HLRBRep_ThePolygonToolOfInterCSurf {
	public:
		/****** HLRBRep_ThePolygonToolOfInterCSurf::BeginOfSeg ******/
		/****** md5 signature: 0cc1b075aec06523f405d0325fb2d82c ******/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range Index in the Polygon.
") BeginOfSeg;
		static const gp_Pnt BeginOfSeg(const HLRBRep_ThePolygonOfInterCSurf & thePolygon, const int Index);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::Bounding ******/
		/****** md5 signature: bd4420175bf29f3a4de5a79c401aef69 ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the polygon.
") Bounding;
		static const Bnd_Box & Bounding(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::Closed ******/
		/****** md5 signature: 2f3b3e56e6fd8c40f306d84715957426 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		static bool Closed(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::DeflectionOverEstimation ******/
		/****** md5 signature: f39785b0db63f119cb5fa234c72b33c9 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Return
-------
double

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		static double DeflectionOverEstimation(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::Dump ******/
		/****** md5 signature: f89d69a95c39305c09d9e3ff050f23a9 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		static void Dump(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::EndOfSeg ******/
		/****** md5 signature: 163edc50ede46ab4e6a02cc993f063cb ******/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range Index in the Polygon.
") EndOfSeg;
		static const gp_Pnt EndOfSeg(const HLRBRep_ThePolygonOfInterCSurf & thePolygon, const int Index);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::NbSegments ******/
		/****** md5 signature: c4b18f68099ff28f6b057cd7efe228f2 ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Return
-------
int

Description
-----------
No available documentation.
") NbSegments;
		static int NbSegments(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

};


%extend HLRBRep_ThePolygonToolOfInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class HLRBRep_ThePolyhedronOfInterCSurf *
******************************************/
/**********************************************
* class HLRBRep_ThePolyhedronToolOfInterCSurf *
**********************************************/
class HLRBRep_ThePolyhedronToolOfInterCSurf {
	public:
		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::Bounding ******/
		/****** md5 signature: 079b8231d003b809a405ec805e811a2d ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the PolyhedronTool.
") Bounding;
		static const Bnd_Box & Bounding(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::ComponentsBounding ******/
		/****** md5 signature: 903cf56ee81c8dfb40e274e1232d93be ******/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
opencascade::handle<NCollection_HArray1<Bnd_Box>>

Description
-----------
Give the array of boxes. The box <n> corresponding to the triangle <n>.
") ComponentsBounding;
		static const opencascade::handle<NCollection_HArray1<Bnd_Box>> & ComponentsBounding(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::DeflectionOverEstimation ******/
		/****** md5 signature: 7644aa1513e8f54d3733f922a92b2c5a ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
double

Description
-----------
Give the tolerance of the polygon.
") DeflectionOverEstimation;
		static double DeflectionOverEstimation(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::Dump ******/
		/****** md5 signature: 702ac1d12e6272a4d2ec3e61c1d32fbb ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		static void Dump(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::GetBorderDeflection ******/
		/****** md5 signature: b3037db63f01648966d915d542278829 ******/
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
double

Description
-----------
This method returns a border deflection of the polyhedron.
") GetBorderDeflection;
		static double GetBorderDeflection(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::IsOnBound ******/
		/****** md5 signature: 1850315ce4e890fa2884785991646d6a ******/
		%feature("compactdefaultargs") IsOnBound;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Index1: int
Index2: int

Return
-------
bool

Description
-----------
This method returns true if the edge based on points with indices Index1 and Index2 represents a boundary edge. It is necessary to take into account the boundary deflection for this edge.
") IsOnBound;
		static bool IsOnBound(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const int Index1, const int Index2);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::NbTriangles ******/
		/****** md5 signature: f536bf30ca216a7ae1d86a048f83b532 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
int

Description
-----------
Give the number of triangles in this polyhedral surface.
") NbTriangles;
		static int NbTriangles(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::Point ******/
		/****** md5 signature: 4cd85babce542db081a0588b5b4aa998 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of index i in the polyhedral surface.
") Point;
		static const gp_Pnt Point(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const int Index);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::TriConnex ******/
		/****** md5 signature: 40bce82210649c0c3a95d3897118794a ******/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Triang: int
Pivot: int
Pedge: int

Return
-------
TriCon: int
OtherP: int

Description
-----------
Give the address Tricon of the triangle connexe to the triangle of address Triang by the edge Pivot Pedge and the third point of this connexe triangle. When we are on a free edge TriCon==0 but the function return the value of the triangle in the other side of Pivot on the free edge. Used to turn around a vertex.
") TriConnex;
		static int TriConnex(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const int Triang, const int Pivot, const int Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::Triangle ******/
		/****** md5 signature: 9b107b6b53bd8d1bde489d669e4dd1f3 ******/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Index: int

Return
-------
P1: int
P2: int
P3: int

Description
-----------
Give the indices of the 3 points of the triangle of address Index in the PolyhedronTool.
") Triangle;
		static void Triangle(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const int Index, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend HLRBRep_ThePolyhedronToolOfInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class HLRBRep_TheProjPCurOfCInter *
************************************/
class HLRBRep_TheProjPCurOfCInter {
	public:
		/****** HLRBRep_TheProjPCurOfCInter::FindParameter ******/
		/****** md5 signature: 74905bf035830eaf7962a4fa03be8e82 ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
Pnt: gp_Pnt2d
Tol: double

Return
-------
double

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the right parameter has to be made on the natural parametric domain of the curve.
") FindParameter;
		static double FindParameter(const HLRBRep_CurvePtr & C, const gp_Pnt2d & Pnt, const double Tol);

		/****** HLRBRep_TheProjPCurOfCInter::FindParameter ******/
		/****** md5 signature: 593526284e9953e7af9fea9baff4b0ad ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_CurvePtr
Pnt: gp_Pnt2d
LowParameter: double
HighParameter: double
Tol: double

Return
-------
double

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in which the parameter certainly lies. These parameters are given to implement a more efficient algorithm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.
") FindParameter;
		static double FindParameter(const HLRBRep_CurvePtr & C, const gp_Pnt2d & Pnt, const double LowParameter, const double HighParameter, const double Tol);

};


%extend HLRBRep_TheProjPCurOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class HLRBRep_TheQuadCurvExactInterCSurf *
*******************************************/
class HLRBRep_TheQuadCurvExactInterCSurf {
	public:
		/****** HLRBRep_TheQuadCurvExactInterCSurf::HLRBRep_TheQuadCurvExactInterCSurf ******/
		/****** md5 signature: c8ac28c84af9fbe57e57fa1792cc8e52 ******/
		%feature("compactdefaultargs") HLRBRep_TheQuadCurvExactInterCSurf;
		%feature("autodoc", "
Parameters
----------
S: HLRBRep_Surface *
C: gp_Lin

Return
-------
None

Description
-----------
Provides the signed distance function: Q(w) and its first derivative dQ(w)/dw.
") HLRBRep_TheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvExactInterCSurf(HLRBRep_Surface * S, const gp_Lin & C);

		/****** HLRBRep_TheQuadCurvExactInterCSurf::Intervals ******/
		/****** md5 signature: bdd6e5353d45148d8c089d86d60d9f07 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: double
U2: double

Description
-----------
U1 and U2 are the parameters of a segment on the curve.
") Intervals;
		void Intervals(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_TheQuadCurvExactInterCSurf::IsDone ******/
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

		/****** HLRBRep_TheQuadCurvExactInterCSurf::NbIntervals ******/
		/****** md5 signature: 487b014b9cd194c58d109502ca451d5e ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		int NbIntervals();

		/****** HLRBRep_TheQuadCurvExactInterCSurf::NbRoots ******/
		/****** md5 signature: fe443a1190b192943b5fddf45586a22a ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		int NbRoots();

		/****** HLRBRep_TheQuadCurvExactInterCSurf::Root ******/
		/****** md5 signature: 924d892bdccaf8b866e5773695c2abbb ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") Root;
		double Root(const int Index);

};


%extend HLRBRep_TheQuadCurvExactInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf *
************************************************************/
class HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf : public math_FunctionWithDerivative {
	public:
		/****** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf::HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf ******/
		/****** md5 signature: 949d0c28db942aebdafe829dad999512 ******/
		%feature("compactdefaultargs") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		%feature("autodoc", "
Parameters
----------
Q: IntSurf_Quadric
C: gp_Lin

Return
-------
None

Description
-----------
Create the function.
") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf(const IntSurf_Quadric & Q, const gp_Lin & C);

		/****** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf::Derivative ******/
		/****** md5 signature: 9056fc5f695c62612651effc85cb18ad ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
D: double

Description
-----------
Computes the derivative of the previous function at parameter Param. Derivative always returns True.
") Derivative;
		bool Derivative(const double Param, Standard_Real &OutValue);

		/****** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf::Value ******/
		/****** md5 signature: 92dd35931de1aecdc8277d063de13ec7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double

Description
-----------
Computes the value of the signed distance between the implicit surface and the point at parameter Param on the parametrised curve. Value always returns True.
") Value;
		bool Value(const double Param, Standard_Real &OutValue);

		/****** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf::Values ******/
		/****** md5 signature: 03dca4b59c48db2ee672dd2d7904db60 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double
D: double

Description
-----------
Computes the value and the derivative of the function. returns True.
") Values;
		bool Values(const double Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class HLRBRep_VertexList *
***************************/
class HLRBRep_VertexList {
	public:
		/****** HLRBRep_VertexList::HLRBRep_VertexList ******/
		/****** md5 signature: 149964ddf0ef25797defa3871b4366d2 ******/
		%feature("compactdefaultargs") HLRBRep_VertexList;
		%feature("autodoc", "
Parameters
----------
T: HLRBRep_EdgeInterferenceTool
I: NCollection_List<HLRAlgo_Interference >::Iterator

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_VertexList;
		 HLRBRep_VertexList(const HLRBRep_EdgeInterferenceTool & T, const NCollection_List<HLRAlgo_Interference >::Iterator & I);

		/****** HLRBRep_VertexList::BoundaryTransition ******/
		/****** md5 signature: 74f690bd95102dfac559cd0dc3a25347 ******/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the transition of the current vertex relative to the boundary if it is an interference.
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();

		/****** HLRBRep_VertexList::Current ******/
		/****** md5 signature: 0e36ea5e4e93af9d6e97cff42aa74163 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
HLRAlgo_Intersection

Description
-----------
Returns the current vertex.
") Current;
		const HLRAlgo_Intersection & Current();

		/****** HLRBRep_VertexList::IsBoundary ******/
		/****** md5 signature: e4571934dc233b1ff119256513384992 ******/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex is on the boundary of the edge.
") IsBoundary;
		bool IsBoundary();

		/****** HLRBRep_VertexList::IsInterference ******/
		/****** md5 signature: 1c7f51e2a202946534099b00ee6668f5 ******/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex is an interference.
") IsInterference;
		bool IsInterference();

		/****** HLRBRep_VertexList::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the curve is periodic.
") IsPeriodic;
		bool IsPeriodic();

		/****** HLRBRep_VertexList::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when there are more vertices.
") More;
		bool More();

		/****** HLRBRep_VertexList::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Proceeds to the next vertex.
") Next;
		void Next();

		/****** HLRBRep_VertexList::Orientation ******/
		/****** md5 signature: 328242fe19b1f80489d8169681ebc029 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the orientation of the current vertex if it is on the boundary of the edge.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** HLRBRep_VertexList::Transition ******/
		/****** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the transition of the current vertex if it is an interference.
") Transition;
		TopAbs_Orientation Transition();

};


%extend HLRBRep_VertexList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class HLRBRep_Algo *
*********************/
class HLRBRep_Algo : public HLRBRep_InternalAlgo {
	public:
		/****** HLRBRep_Algo::HLRBRep_Algo ******/
		/****** md5 signature: d6b9b1e2082659fa3788d431cf502e4e ******/
		%feature("compactdefaultargs") HLRBRep_Algo;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework for the calculation of visible and hidden lines of a shape in a projection. Use the function: - Projector to define the point of view - Add to select the shape or shapes to be visualized - Update to compute the outlines of the shape, and - Hide to compute the visible and hidden lines of the shape.
") HLRBRep_Algo;
		 HLRBRep_Algo();

		/****** HLRBRep_Algo::HLRBRep_Algo ******/
		/****** md5 signature: 07a4358a369d01290f5731ee7cb90936 ******/
		%feature("compactdefaultargs") HLRBRep_Algo;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Algo

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_Algo;
		 HLRBRep_Algo(const opencascade::handle<HLRBRep_Algo> & A);

		/****** HLRBRep_Algo::Add ******/
		/****** md5 signature: 31e49493aedb73f33bb94c9b5e8f5cf8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SData: Standard_Transient
nbIso: int (optional, default to 0)

Return
-------
None

Description
-----------
add the Shape <S>.
") Add;
		void Add(const TopoDS_Shape & S, const opencascade::handle<Standard_Transient> & SData, const int nbIso = 0);

		/****** HLRBRep_Algo::Add ******/
		/****** md5 signature: 9d48633e9bb1d8af902c520f02873490 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
nbIso: int (optional, default to 0)

Return
-------
None

Description
-----------
Adds the shape S to this framework, and specifies the number of isoparameters nbiso desired in visualizing S. You may add as many shapes as you wish. Use the function Add once for each shape.
") Add;
		void Add(const TopoDS_Shape & S, const int nbIso = 0);

		/****** HLRBRep_Algo::Index ******/
		/****** md5 signature: 2139bdf884d3c0cf5f249928e8b38d94 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
return the index of the Shape <S> and return 0 if the Shape <S> is not found.
") Index;
		int Index(const TopoDS_Shape & S);

		/****** HLRBRep_Algo::OutLinedShapeNullify ******/
		/****** md5 signature: 038d68d7b4c4de233e55ad5d723e4ec9 ******/
		%feature("compactdefaultargs") OutLinedShapeNullify;
		%feature("autodoc", "Return
-------
None

Description
-----------
nullify all the results of OutLiner from HLRTopoBRep.
") OutLinedShapeNullify;
		void OutLinedShapeNullify();

};


%make_alias(HLRBRep_Algo)

%extend HLRBRep_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class HLRBRep_ThePolyhedronOfInterCSurf:
	pass

@classnotwrapped
class HLRBRep_BSurfaceTool:
	pass

@classnotwrapped
class HLRBRep_Surface:
	pass

@classnotwrapped
class HLRBRep_TheCurveLocatorOfTheProjPCurOfCInter:
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
def hlrbrep_MakeEdge(*args):
	return hlrbrep.MakeEdge(*args)

@deprecated
def hlrbrep_MakeEdge3d(*args):
	return hlrbrep.MakeEdge3d(*args)

@deprecated
def hlrbrep_PolyHLRAngleAndDeflection(*args):
	return hlrbrep.PolyHLRAngleAndDeflection(*args)

@deprecated
def HLRBRep_BCurveTool_BSpline(*args):
	return HLRBRep_BCurveTool.BSpline(*args)

@deprecated
def HLRBRep_BCurveTool_Bezier(*args):
	return HLRBRep_BCurveTool.Bezier(*args)

@deprecated
def HLRBRep_BCurveTool_Circle(*args):
	return HLRBRep_BCurveTool.Circle(*args)

@deprecated
def HLRBRep_BCurveTool_Continuity(*args):
	return HLRBRep_BCurveTool.Continuity(*args)

@deprecated
def HLRBRep_BCurveTool_D0(*args):
	return HLRBRep_BCurveTool.D0(*args)

@deprecated
def HLRBRep_BCurveTool_D1(*args):
	return HLRBRep_BCurveTool.D1(*args)

@deprecated
def HLRBRep_BCurveTool_D2(*args):
	return HLRBRep_BCurveTool.D2(*args)

@deprecated
def HLRBRep_BCurveTool_D3(*args):
	return HLRBRep_BCurveTool.D3(*args)

@deprecated
def HLRBRep_BCurveTool_DN(*args):
	return HLRBRep_BCurveTool.DN(*args)

@deprecated
def HLRBRep_BCurveTool_Degree(*args):
	return HLRBRep_BCurveTool.Degree(*args)

@deprecated
def HLRBRep_BCurveTool_Ellipse(*args):
	return HLRBRep_BCurveTool.Ellipse(*args)

@deprecated
def HLRBRep_BCurveTool_FirstParameter(*args):
	return HLRBRep_BCurveTool.FirstParameter(*args)

@deprecated
def HLRBRep_BCurveTool_GetType(*args):
	return HLRBRep_BCurveTool.GetType(*args)

@deprecated
def HLRBRep_BCurveTool_Hyperbola(*args):
	return HLRBRep_BCurveTool.Hyperbola(*args)

@deprecated
def HLRBRep_BCurveTool_Intervals(*args):
	return HLRBRep_BCurveTool.Intervals(*args)

@deprecated
def HLRBRep_BCurveTool_IsClosed(*args):
	return HLRBRep_BCurveTool.IsClosed(*args)

@deprecated
def HLRBRep_BCurveTool_IsPeriodic(*args):
	return HLRBRep_BCurveTool.IsPeriodic(*args)

@deprecated
def HLRBRep_BCurveTool_IsRational(*args):
	return HLRBRep_BCurveTool.IsRational(*args)

@deprecated
def HLRBRep_BCurveTool_LastParameter(*args):
	return HLRBRep_BCurveTool.LastParameter(*args)

@deprecated
def HLRBRep_BCurveTool_Line(*args):
	return HLRBRep_BCurveTool.Line(*args)

@deprecated
def HLRBRep_BCurveTool_NbIntervals(*args):
	return HLRBRep_BCurveTool.NbIntervals(*args)

@deprecated
def HLRBRep_BCurveTool_NbKnots(*args):
	return HLRBRep_BCurveTool.NbKnots(*args)

@deprecated
def HLRBRep_BCurveTool_NbPoles(*args):
	return HLRBRep_BCurveTool.NbPoles(*args)

@deprecated
def HLRBRep_BCurveTool_NbSamples(*args):
	return HLRBRep_BCurveTool.NbSamples(*args)

@deprecated
def HLRBRep_BCurveTool_Parabola(*args):
	return HLRBRep_BCurveTool.Parabola(*args)

@deprecated
def HLRBRep_BCurveTool_Period(*args):
	return HLRBRep_BCurveTool.Period(*args)

@deprecated
def HLRBRep_BCurveTool_Poles(*args):
	return HLRBRep_BCurveTool.Poles(*args)

@deprecated
def HLRBRep_BCurveTool_PolesAndWeights(*args):
	return HLRBRep_BCurveTool.PolesAndWeights(*args)

@deprecated
def HLRBRep_BCurveTool_Resolution(*args):
	return HLRBRep_BCurveTool.Resolution(*args)

@deprecated
def HLRBRep_BCurveTool_Value(*args):
	return HLRBRep_BCurveTool.Value(*args)

@deprecated
def HLRBRep_CLPropsATool_Continuity(*args):
	return HLRBRep_CLPropsATool.Continuity(*args)

@deprecated
def HLRBRep_CLPropsATool_D1(*args):
	return HLRBRep_CLPropsATool.D1(*args)

@deprecated
def HLRBRep_CLPropsATool_D2(*args):
	return HLRBRep_CLPropsATool.D2(*args)

@deprecated
def HLRBRep_CLPropsATool_D3(*args):
	return HLRBRep_CLPropsATool.D3(*args)

@deprecated
def HLRBRep_CLPropsATool_FirstParameter(*args):
	return HLRBRep_CLPropsATool.FirstParameter(*args)

@deprecated
def HLRBRep_CLPropsATool_LastParameter(*args):
	return HLRBRep_CLPropsATool.LastParameter(*args)

@deprecated
def HLRBRep_CLPropsATool_Value(*args):
	return HLRBRep_CLPropsATool.Value(*args)

@deprecated
def HLRBRep_CurveTool_BSpline(*args):
	return HLRBRep_CurveTool.BSpline(*args)

@deprecated
def HLRBRep_CurveTool_Bezier(*args):
	return HLRBRep_CurveTool.Bezier(*args)

@deprecated
def HLRBRep_CurveTool_Circle(*args):
	return HLRBRep_CurveTool.Circle(*args)

@deprecated
def HLRBRep_CurveTool_Continuity(*args):
	return HLRBRep_CurveTool.Continuity(*args)

@deprecated
def HLRBRep_CurveTool_D0(*args):
	return HLRBRep_CurveTool.D0(*args)

@deprecated
def HLRBRep_CurveTool_D1(*args):
	return HLRBRep_CurveTool.D1(*args)

@deprecated
def HLRBRep_CurveTool_D2(*args):
	return HLRBRep_CurveTool.D2(*args)

@deprecated
def HLRBRep_CurveTool_D3(*args):
	return HLRBRep_CurveTool.D3(*args)

@deprecated
def HLRBRep_CurveTool_DN(*args):
	return HLRBRep_CurveTool.DN(*args)

@deprecated
def HLRBRep_CurveTool_Degree(*args):
	return HLRBRep_CurveTool.Degree(*args)

@deprecated
def HLRBRep_CurveTool_Ellipse(*args):
	return HLRBRep_CurveTool.Ellipse(*args)

@deprecated
def HLRBRep_CurveTool_EpsX(*args):
	return HLRBRep_CurveTool.EpsX(*args)

@deprecated
def HLRBRep_CurveTool_FirstParameter(*args):
	return HLRBRep_CurveTool.FirstParameter(*args)

@deprecated
def HLRBRep_CurveTool_GetInterval(*args):
	return HLRBRep_CurveTool.GetInterval(*args)

@deprecated
def HLRBRep_CurveTool_GetType(*args):
	return HLRBRep_CurveTool.GetType(*args)

@deprecated
def HLRBRep_CurveTool_Hyperbola(*args):
	return HLRBRep_CurveTool.Hyperbola(*args)

@deprecated
def HLRBRep_CurveTool_Intervals(*args):
	return HLRBRep_CurveTool.Intervals(*args)

@deprecated
def HLRBRep_CurveTool_IsClosed(*args):
	return HLRBRep_CurveTool.IsClosed(*args)

@deprecated
def HLRBRep_CurveTool_IsPeriodic(*args):
	return HLRBRep_CurveTool.IsPeriodic(*args)

@deprecated
def HLRBRep_CurveTool_LastParameter(*args):
	return HLRBRep_CurveTool.LastParameter(*args)

@deprecated
def HLRBRep_CurveTool_Line(*args):
	return HLRBRep_CurveTool.Line(*args)

@deprecated
def HLRBRep_CurveTool_NbIntervals(*args):
	return HLRBRep_CurveTool.NbIntervals(*args)

@deprecated
def HLRBRep_CurveTool_NbSamples(*args):
	return HLRBRep_CurveTool.NbSamples(*args)

@deprecated
def HLRBRep_CurveTool_NbSamples(*args):
	return HLRBRep_CurveTool.NbSamples(*args)

@deprecated
def HLRBRep_CurveTool_Parabola(*args):
	return HLRBRep_CurveTool.Parabola(*args)

@deprecated
def HLRBRep_CurveTool_Period(*args):
	return HLRBRep_CurveTool.Period(*args)

@deprecated
def HLRBRep_CurveTool_Resolution(*args):
	return HLRBRep_CurveTool.Resolution(*args)

@deprecated
def HLRBRep_CurveTool_TheType(*args):
	return HLRBRep_CurveTool.TheType(*args)

@deprecated
def HLRBRep_CurveTool_Value(*args):
	return HLRBRep_CurveTool.Value(*args)

@deprecated
def HLRBRep_EdgeFaceTool_CurvatureValue(*args):
	return HLRBRep_EdgeFaceTool.CurvatureValue(*args)

@deprecated
def HLRBRep_EdgeFaceTool_UVPoint(*args):
	return HLRBRep_EdgeFaceTool.UVPoint(*args)

@deprecated
def HLRBRep_EdgeIList_AddInterference(*args):
	return HLRBRep_EdgeIList.AddInterference(*args)

@deprecated
def HLRBRep_EdgeIList_ProcessComplex(*args):
	return HLRBRep_EdgeIList.ProcessComplex(*args)

@deprecated
def HLRBRep_LineTool_BSpline(*args):
	return HLRBRep_LineTool.BSpline(*args)

@deprecated
def HLRBRep_LineTool_Bezier(*args):
	return HLRBRep_LineTool.Bezier(*args)

@deprecated
def HLRBRep_LineTool_Circle(*args):
	return HLRBRep_LineTool.Circle(*args)

@deprecated
def HLRBRep_LineTool_Continuity(*args):
	return HLRBRep_LineTool.Continuity(*args)

@deprecated
def HLRBRep_LineTool_D0(*args):
	return HLRBRep_LineTool.D0(*args)

@deprecated
def HLRBRep_LineTool_D1(*args):
	return HLRBRep_LineTool.D1(*args)

@deprecated
def HLRBRep_LineTool_D2(*args):
	return HLRBRep_LineTool.D2(*args)

@deprecated
def HLRBRep_LineTool_D3(*args):
	return HLRBRep_LineTool.D3(*args)

@deprecated
def HLRBRep_LineTool_DN(*args):
	return HLRBRep_LineTool.DN(*args)

@deprecated
def HLRBRep_LineTool_Degree(*args):
	return HLRBRep_LineTool.Degree(*args)

@deprecated
def HLRBRep_LineTool_Ellipse(*args):
	return HLRBRep_LineTool.Ellipse(*args)

@deprecated
def HLRBRep_LineTool_FirstParameter(*args):
	return HLRBRep_LineTool.FirstParameter(*args)

@deprecated
def HLRBRep_LineTool_GetType(*args):
	return HLRBRep_LineTool.GetType(*args)

@deprecated
def HLRBRep_LineTool_Hyperbola(*args):
	return HLRBRep_LineTool.Hyperbola(*args)

@deprecated
def HLRBRep_LineTool_IntervalContinuity(*args):
	return HLRBRep_LineTool.IntervalContinuity(*args)

@deprecated
def HLRBRep_LineTool_IntervalFirst(*args):
	return HLRBRep_LineTool.IntervalFirst(*args)

@deprecated
def HLRBRep_LineTool_IntervalLast(*args):
	return HLRBRep_LineTool.IntervalLast(*args)

@deprecated
def HLRBRep_LineTool_Intervals(*args):
	return HLRBRep_LineTool.Intervals(*args)

@deprecated
def HLRBRep_LineTool_IsClosed(*args):
	return HLRBRep_LineTool.IsClosed(*args)

@deprecated
def HLRBRep_LineTool_IsPeriodic(*args):
	return HLRBRep_LineTool.IsPeriodic(*args)

@deprecated
def HLRBRep_LineTool_IsRational(*args):
	return HLRBRep_LineTool.IsRational(*args)

@deprecated
def HLRBRep_LineTool_KnotsAndMultiplicities(*args):
	return HLRBRep_LineTool.KnotsAndMultiplicities(*args)

@deprecated
def HLRBRep_LineTool_LastParameter(*args):
	return HLRBRep_LineTool.LastParameter(*args)

@deprecated
def HLRBRep_LineTool_Line(*args):
	return HLRBRep_LineTool.Line(*args)

@deprecated
def HLRBRep_LineTool_NbIntervals(*args):
	return HLRBRep_LineTool.NbIntervals(*args)

@deprecated
def HLRBRep_LineTool_NbKnots(*args):
	return HLRBRep_LineTool.NbKnots(*args)

@deprecated
def HLRBRep_LineTool_NbPoles(*args):
	return HLRBRep_LineTool.NbPoles(*args)

@deprecated
def HLRBRep_LineTool_NbSamples(*args):
	return HLRBRep_LineTool.NbSamples(*args)

@deprecated
def HLRBRep_LineTool_Parabola(*args):
	return HLRBRep_LineTool.Parabola(*args)

@deprecated
def HLRBRep_LineTool_Period(*args):
	return HLRBRep_LineTool.Period(*args)

@deprecated
def HLRBRep_LineTool_Poles(*args):
	return HLRBRep_LineTool.Poles(*args)

@deprecated
def HLRBRep_LineTool_PolesAndWeights(*args):
	return HLRBRep_LineTool.PolesAndWeights(*args)

@deprecated
def HLRBRep_LineTool_Resolution(*args):
	return HLRBRep_LineTool.Resolution(*args)

@deprecated
def HLRBRep_LineTool_SamplePars(*args):
	return HLRBRep_LineTool.SamplePars(*args)

@deprecated
def HLRBRep_LineTool_SamplePars(*args):
	return HLRBRep_LineTool.SamplePars(*args)

@deprecated
def HLRBRep_LineTool_Value(*args):
	return HLRBRep_LineTool.Value(*args)

@deprecated
def HLRBRep_SLPropsATool_Bounds(*args):
	return HLRBRep_SLPropsATool.Bounds(*args)

@deprecated
def HLRBRep_SLPropsATool_Continuity(*args):
	return HLRBRep_SLPropsATool.Continuity(*args)

@deprecated
def HLRBRep_SLPropsATool_D1(*args):
	return HLRBRep_SLPropsATool.D1(*args)

@deprecated
def HLRBRep_SLPropsATool_D2(*args):
	return HLRBRep_SLPropsATool.D2(*args)

@deprecated
def HLRBRep_SLPropsATool_DN(*args):
	return HLRBRep_SLPropsATool.DN(*args)

@deprecated
def HLRBRep_SLPropsATool_Value(*args):
	return HLRBRep_SLPropsATool.Value(*args)

@deprecated
def HLRBRep_ShapeToHLR_Load(*args):
	return HLRBRep_ShapeToHLR.Load(*args)

@deprecated
def HLRBRep_SurfaceTool_AxeOfRevolution(*args):
	return HLRBRep_SurfaceTool.AxeOfRevolution(*args)

@deprecated
def HLRBRep_SurfaceTool_BSpline(*args):
	return HLRBRep_SurfaceTool.BSpline(*args)

@deprecated
def HLRBRep_SurfaceTool_BasisCurve(*args):
	return HLRBRep_SurfaceTool.BasisCurve(*args)

@deprecated
def HLRBRep_SurfaceTool_BasisSurface(*args):
	return HLRBRep_SurfaceTool.BasisSurface(*args)

@deprecated
def HLRBRep_SurfaceTool_Bezier(*args):
	return HLRBRep_SurfaceTool.Bezier(*args)

@deprecated
def HLRBRep_SurfaceTool_Cone(*args):
	return HLRBRep_SurfaceTool.Cone(*args)

@deprecated
def HLRBRep_SurfaceTool_Cylinder(*args):
	return HLRBRep_SurfaceTool.Cylinder(*args)

@deprecated
def HLRBRep_SurfaceTool_D0(*args):
	return HLRBRep_SurfaceTool.D0(*args)

@deprecated
def HLRBRep_SurfaceTool_D1(*args):
	return HLRBRep_SurfaceTool.D1(*args)

@deprecated
def HLRBRep_SurfaceTool_D2(*args):
	return HLRBRep_SurfaceTool.D2(*args)

@deprecated
def HLRBRep_SurfaceTool_D3(*args):
	return HLRBRep_SurfaceTool.D3(*args)

@deprecated
def HLRBRep_SurfaceTool_DN(*args):
	return HLRBRep_SurfaceTool.DN(*args)

@deprecated
def HLRBRep_SurfaceTool_Direction(*args):
	return HLRBRep_SurfaceTool.Direction(*args)

@deprecated
def HLRBRep_SurfaceTool_FirstUParameter(*args):
	return HLRBRep_SurfaceTool.FirstUParameter(*args)

@deprecated
def HLRBRep_SurfaceTool_FirstVParameter(*args):
	return HLRBRep_SurfaceTool.FirstVParameter(*args)

@deprecated
def HLRBRep_SurfaceTool_GetType(*args):
	return HLRBRep_SurfaceTool.GetType(*args)

@deprecated
def HLRBRep_SurfaceTool_IsUClosed(*args):
	return HLRBRep_SurfaceTool.IsUClosed(*args)

@deprecated
def HLRBRep_SurfaceTool_IsUPeriodic(*args):
	return HLRBRep_SurfaceTool.IsUPeriodic(*args)

@deprecated
def HLRBRep_SurfaceTool_IsVClosed(*args):
	return HLRBRep_SurfaceTool.IsVClosed(*args)

@deprecated
def HLRBRep_SurfaceTool_IsVPeriodic(*args):
	return HLRBRep_SurfaceTool.IsVPeriodic(*args)

@deprecated
def HLRBRep_SurfaceTool_LastUParameter(*args):
	return HLRBRep_SurfaceTool.LastUParameter(*args)

@deprecated
def HLRBRep_SurfaceTool_LastVParameter(*args):
	return HLRBRep_SurfaceTool.LastVParameter(*args)

@deprecated
def HLRBRep_SurfaceTool_NbSamplesU(*args):
	return HLRBRep_SurfaceTool.NbSamplesU(*args)

@deprecated
def HLRBRep_SurfaceTool_NbSamplesU(*args):
	return HLRBRep_SurfaceTool.NbSamplesU(*args)

@deprecated
def HLRBRep_SurfaceTool_NbSamplesV(*args):
	return HLRBRep_SurfaceTool.NbSamplesV(*args)

@deprecated
def HLRBRep_SurfaceTool_NbSamplesV(*args):
	return HLRBRep_SurfaceTool.NbSamplesV(*args)

@deprecated
def HLRBRep_SurfaceTool_NbUIntervals(*args):
	return HLRBRep_SurfaceTool.NbUIntervals(*args)

@deprecated
def HLRBRep_SurfaceTool_NbVIntervals(*args):
	return HLRBRep_SurfaceTool.NbVIntervals(*args)

@deprecated
def HLRBRep_SurfaceTool_OffsetValue(*args):
	return HLRBRep_SurfaceTool.OffsetValue(*args)

@deprecated
def HLRBRep_SurfaceTool_Plane(*args):
	return HLRBRep_SurfaceTool.Plane(*args)

@deprecated
def HLRBRep_SurfaceTool_Sphere(*args):
	return HLRBRep_SurfaceTool.Sphere(*args)

@deprecated
def HLRBRep_SurfaceTool_Torus(*args):
	return HLRBRep_SurfaceTool.Torus(*args)

@deprecated
def HLRBRep_SurfaceTool_UIntervals(*args):
	return HLRBRep_SurfaceTool.UIntervals(*args)

@deprecated
def HLRBRep_SurfaceTool_UPeriod(*args):
	return HLRBRep_SurfaceTool.UPeriod(*args)

@deprecated
def HLRBRep_SurfaceTool_UResolution(*args):
	return HLRBRep_SurfaceTool.UResolution(*args)

@deprecated
def HLRBRep_SurfaceTool_UTrim(*args):
	return HLRBRep_SurfaceTool.UTrim(*args)

@deprecated
def HLRBRep_SurfaceTool_VIntervals(*args):
	return HLRBRep_SurfaceTool.VIntervals(*args)

@deprecated
def HLRBRep_SurfaceTool_VPeriod(*args):
	return HLRBRep_SurfaceTool.VPeriod(*args)

@deprecated
def HLRBRep_SurfaceTool_VResolution(*args):
	return HLRBRep_SurfaceTool.VResolution(*args)

@deprecated
def HLRBRep_SurfaceTool_VTrim(*args):
	return HLRBRep_SurfaceTool.VTrim(*args)

@deprecated
def HLRBRep_SurfaceTool_Value(*args):
	return HLRBRep_SurfaceTool.Value(*args)

@deprecated
def HLRBRep_ThePolygonToolOfInterCSurf_BeginOfSeg(*args):
	return HLRBRep_ThePolygonToolOfInterCSurf.BeginOfSeg(*args)

@deprecated
def HLRBRep_ThePolygonToolOfInterCSurf_Bounding(*args):
	return HLRBRep_ThePolygonToolOfInterCSurf.Bounding(*args)

@deprecated
def HLRBRep_ThePolygonToolOfInterCSurf_Closed(*args):
	return HLRBRep_ThePolygonToolOfInterCSurf.Closed(*args)

@deprecated
def HLRBRep_ThePolygonToolOfInterCSurf_DeflectionOverEstimation(*args):
	return HLRBRep_ThePolygonToolOfInterCSurf.DeflectionOverEstimation(*args)

@deprecated
def HLRBRep_ThePolygonToolOfInterCSurf_Dump(*args):
	return HLRBRep_ThePolygonToolOfInterCSurf.Dump(*args)

@deprecated
def HLRBRep_ThePolygonToolOfInterCSurf_EndOfSeg(*args):
	return HLRBRep_ThePolygonToolOfInterCSurf.EndOfSeg(*args)

@deprecated
def HLRBRep_ThePolygonToolOfInterCSurf_NbSegments(*args):
	return HLRBRep_ThePolygonToolOfInterCSurf.NbSegments(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_Bounding(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.Bounding(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_ComponentsBounding(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.ComponentsBounding(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_DeflectionOverEstimation(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.DeflectionOverEstimation(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_Dump(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.Dump(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_GetBorderDeflection(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.GetBorderDeflection(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_IsOnBound(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.IsOnBound(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_NbTriangles(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.NbTriangles(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_Point(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.Point(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_TriConnex(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.TriConnex(*args)

@deprecated
def HLRBRep_ThePolyhedronToolOfInterCSurf_Triangle(*args):
	return HLRBRep_ThePolyhedronToolOfInterCSurf.Triangle(*args)

@deprecated
def HLRBRep_TheProjPCurOfCInter_FindParameter(*args):
	return HLRBRep_TheProjPCurOfCInter.FindParameter(*args)

@deprecated
def HLRBRep_TheProjPCurOfCInter_FindParameter(*args):
	return HLRBRep_TheProjPCurOfCInter.FindParameter(*args)

}
