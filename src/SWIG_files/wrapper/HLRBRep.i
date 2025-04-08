/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_hlrbrep.html"
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
#include<BRepTopAdaptor_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Bnd_module.hxx>
#include<HLRTopoBRep_module.hxx>
#include<math_module.hxx>
#include<IntCurve_module.hxx>
#include<Extrema_module.hxx>
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
%import BRepTopAdaptor.i
%import IntCurveSurface.i
%import Bnd.i
%import HLRTopoBRep.i
%import math.i
%import IntCurve.i
%import Extrema.i
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
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(HLRBRep_ListOfBPoint) NCollection_List<HLRBRep_BiPoint>;

%extend NCollection_List<HLRBRep_BiPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(HLRBRep_SeqOfShapeBounds) NCollection_Sequence<HLRBRep_ShapeBounds>;

%extend NCollection_Sequence<HLRBRep_ShapeBounds> {
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
		/****** md5 signature: e591b23fabf95c4ab404ee0647c75a86 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
ec: HLRBRep_Curve
U1: float
U2: float

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") MakeEdge;
		static TopoDS_Edge MakeEdge(const HLRBRep_Curve & ec, const Standard_Real U1, const Standard_Real U2);

		/****** HLRBRep::MakeEdge3d ******/
		/****** md5 signature: 7c264ca0adc8ec18dc5eb00295b0e86d ******/
		%feature("compactdefaultargs") MakeEdge3d;
		%feature("autodoc", "
Parameters
----------
ec: HLRBRep_Curve
U1: float
U2: float

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") MakeEdge3d;
		static TopoDS_Edge MakeEdge3d(const HLRBRep_Curve & ec, const Standard_Real U1, const Standard_Real U2);

		/****** HLRBRep::PolyHLRAngleAndDeflection ******/
		/****** md5 signature: dca95dec52d4066f89646200d828aab1 ******/
		%feature("compactdefaultargs") PolyHLRAngleAndDeflection;
		%feature("autodoc", "
Parameters
----------
InAngl: float

Return
-------
OutAngl: float
OutDefl: float

Description
-----------
No available documentation.
") PolyHLRAngleAndDeflection;
		static void PolyHLRAngleAndDeflection(const Standard_Real InAngl, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: e7be70ef1dbdd02981c8b22b0b3f35e2 ******/
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
		 HLRBRep_AreaLimit(const HLRAlgo_Intersection & V, const Standard_Boolean Boundary, const Standard_Boolean Interference, const TopAbs_State StateBefore, const TopAbs_State StateAfter, const TopAbs_State EdgeBefore, const TopAbs_State EdgeAfter);

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
		/****** md5 signature: 9d78e8db3d0caa05aa9a267c764c472e ******/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****** HLRBRep_AreaLimit::IsInterference ******/
		/****** md5 signature: 70cfb7482a8242c7b6f97a307bb277ee ******/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsInterference;
		Standard_Boolean IsInterference();

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
		/****** md5 signature: c3da18ad8945aa1fa8ebb01e7d52aec7 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P);

		/****** HLRBRep_BCurveTool::D1 ******/
		/****** md5 signature: 8bc93f3c1bff851324423ed02edfb3e1 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** HLRBRep_BCurveTool::D2 ******/
		/****** md5 signature: b2ec4e844fab19ed2485d22a8745268f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float
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
		static void D2(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** HLRBRep_BCurveTool::D3 ******/
		/****** md5 signature: 77f327d302e5c58bef64f7dabd80585e ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float
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
		static void D3(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** HLRBRep_BCurveTool::DN ******/
		/****** md5 signature: 894141b8c266b6c1fbfc460b3090e6da ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec DN(const BRepAdaptor_Curve & C, const Standard_Real U, const Standard_Integer N);

		/****** HLRBRep_BCurveTool::Degree ******/
		/****** md5 signature: 52e82e702df5ffa25cc76bc95897f00a ******/
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
		static Standard_Integer Degree(const BRepAdaptor_Curve & C);

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
		/****** md5 signature: 1757779ac38cb6ed7a7fc48dc2248f69 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const BRepAdaptor_Curve & C);

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
		/****** md5 signature: f429463d75cd548af36c429f480bc438 ******/
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
		/****** md5 signature: d99184f67fee887517aba38b86e74693 ******/
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
		static Standard_Boolean IsClosed(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::IsPeriodic ******/
		/****** md5 signature: 194751d0899ddeffcd2f9544f0fa0255 ******/
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
		static Standard_Boolean IsPeriodic(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::IsRational ******/
		/****** md5 signature: c9c5d0c656fb44894939b4a60c4b6249 ******/
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
		static Standard_Boolean IsRational(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::LastParameter ******/
		/****** md5 signature: e697bafb03d659fa87fd20dbec7f562b ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const BRepAdaptor_Curve & C);

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
		/****** md5 signature: c4391d4034556532fdf723807037192a ******/
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
		static Standard_Integer NbIntervals(const BRepAdaptor_Curve & C, const GeomAbs_Shape S);

		/****** HLRBRep_BCurveTool::NbKnots ******/
		/****** md5 signature: 8a333d639d0d4eb92125136dc3258061 ******/
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
		static Standard_Integer NbKnots(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::NbPoles ******/
		/****** md5 signature: 6d7e633819b4f814ca00223438d295c4 ******/
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
		static Standard_Integer NbPoles(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::NbSamples ******/
		/****** md5 signature: 08db67dee4bca7e396222c05f7fc54e9 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const BRepAdaptor_Curve & C, const Standard_Real U0, const Standard_Real U1);

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
		/****** md5 signature: 54e2bb7b341b5e9768d7e59aff136bbb ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const BRepAdaptor_Curve & C);

		/****** HLRBRep_BCurveTool::Poles ******/
		/****** md5 signature: 12002c5f466ee084863dfdc9a28e4f3f ******/
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
		/****** md5 signature: c103846c763c66bd878fada0e2d4bd94 ******/
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
		/****** md5 signature: 63fc446420be2fd68699d622a91ff91b ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static Standard_Real Resolution(const BRepAdaptor_Curve & C, const Standard_Real R3d);

		/****** HLRBRep_BCurveTool::Value ******/
		/****** md5 signature: 23b56266cc1e7b195b61ae726893d32f ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: BRepAdaptor_Curve
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt Value(const BRepAdaptor_Curve & C, const Standard_Real U);

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
		/****** md5 signature: 7de8d55cb4ff4b525dc93e614657e18b ******/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "
Parameters
----------
x1: float
y1: float
x2: float
y2: float
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
		 HLRBRep_BiPnt2D(const Standard_Real x1, const Standard_Real y1, const Standard_Real x2, const Standard_Real y2, const TopoDS_Shape & S, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****** HLRBRep_BiPnt2D::HLRBRep_BiPnt2D ******/
		/****** md5 signature: a614f22a1e85cb9e105bb92c0f4493b9 ******/
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
		 HLRBRep_BiPnt2D(const gp_XY & thePoint1, const gp_XY & thePoint2, const TopoDS_Shape & S, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****** HLRBRep_BiPnt2D::IntLine ******/
		/****** md5 signature: 12d7cbbfcbf9b7024b633fb2f23f4627 ******/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntLine;
		Standard_Boolean IntLine();

		/****** HLRBRep_BiPnt2D::IntLine ******/
		/****** md5 signature: db1141c08b265a5a4892f7f723f2dd5f ******/
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
		void IntLine(const Standard_Boolean B);

		/****** HLRBRep_BiPnt2D::OutLine ******/
		/****** md5 signature: 5ca0f10eca0ab31cafc651fcdd487066 ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		Standard_Boolean OutLine();

		/****** HLRBRep_BiPnt2D::OutLine ******/
		/****** md5 signature: b1713b4ae8c761b2d01b059d873779f4 ******/
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
		void OutLine(const Standard_Boolean B);

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
		/****** md5 signature: 909228d95e513182f5095879976686a6 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****** HLRBRep_BiPnt2D::Rg1Line ******/
		/****** md5 signature: 8664f6dc97a60a9616441f541a3d378e ******/
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
		void Rg1Line(const Standard_Boolean B);

		/****** HLRBRep_BiPnt2D::RgNLine ******/
		/****** md5 signature: 9048b7d28453594775a66644606d3856 ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		Standard_Boolean RgNLine();

		/****** HLRBRep_BiPnt2D::RgNLine ******/
		/****** md5 signature: 15cd72eef01a3ba9cd0d52f504140d36 ******/
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
		void RgNLine(const Standard_Boolean B);

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
		/****** md5 signature: ebcb9699c5eff50e6efc4b93c8fc33b1 ******/
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", "
Parameters
----------
x1: float
y1: float
z1: float
x2: float
y2: float
z2: float
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
		 HLRBRep_BiPoint(const Standard_Real x1, const Standard_Real y1, const Standard_Real z1, const Standard_Real x2, const Standard_Real y2, const Standard_Real z2, const TopoDS_Shape & S, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****** HLRBRep_BiPoint::IntLine ******/
		/****** md5 signature: 12d7cbbfcbf9b7024b633fb2f23f4627 ******/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IntLine;
		Standard_Boolean IntLine();

		/****** HLRBRep_BiPoint::IntLine ******/
		/****** md5 signature: db1141c08b265a5a4892f7f723f2dd5f ******/
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
		void IntLine(const Standard_Boolean B);

		/****** HLRBRep_BiPoint::OutLine ******/
		/****** md5 signature: 5ca0f10eca0ab31cafc651fcdd487066 ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		Standard_Boolean OutLine();

		/****** HLRBRep_BiPoint::OutLine ******/
		/****** md5 signature: b1713b4ae8c761b2d01b059d873779f4 ******/
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
		void OutLine(const Standard_Boolean B);

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
		/****** md5 signature: 909228d95e513182f5095879976686a6 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****** HLRBRep_BiPoint::Rg1Line ******/
		/****** md5 signature: 8664f6dc97a60a9616441f541a3d378e ******/
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
		void Rg1Line(const Standard_Boolean B);

		/****** HLRBRep_BiPoint::RgNLine ******/
		/****** md5 signature: 9048b7d28453594775a66644606d3856 ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		Standard_Boolean RgNLine();

		/****** HLRBRep_BiPoint::RgNLine ******/
		/****** md5 signature: 15cd72eef01a3ba9cd0d52f504140d36 ******/
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
		void RgNLine(const Standard_Boolean B);

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
		/****** md5 signature: 8aeca064bc4aec39e268cb59eeacecf1 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Self Intersection of a curve.
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: f9d3b51e2abd4c9171599d9ca3bcc84e ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
D: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Self Intersection of a curve with a domain.
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C, const IntRes2d_Domain & D, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: fa3264cb6400a364ff4e498fe1794e3e ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
C2: Standard_Address
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: 5c301b77f7af16945f2926768b1a5bbc ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: 7d3a3989b37b0e8898f57df53903be49 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::HLRBRep_CInter ******/
		/****** md5 signature: f51d407d7df0e74e810746561629d7d8 ******/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::ComputeDomain ******/
		/****** md5 signature: 3c697f1654eff7dabc7704497c8e7b94 ******/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
TolDomain: float

Return
-------
IntRes2d_Domain

Description
-----------
Create a domain from a curve.
") ComputeDomain;
		IntRes2d_Domain ComputeDomain(const Standard_Address & C1, const Standard_Real TolDomain);

		/****** HLRBRep_CInter::GetMinNbSamples ******/
		/****** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: e605cb2068426fb82451d7c083111eab ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 0c0100dc2c5c7f1f96c9e7224dfa0205 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
C2: Standard_Address
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Standard_Address & C1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 2c5742a6011dc5b9894110ef4a8eed32 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 12f47e6c03dae71785fae4255205030b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Standard_Address & C1, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: 276d1fa59419189aca1404af4f7aa0f7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::Perform ******/
		/****** md5 signature: c480cebfff37e04c2c51bdf97d545474 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between 2 curves.
") Perform;
		void Perform(const Standard_Address & C1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_CInter::SetMinNbSamples ******/
		/****** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ******/
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
		void SetMinNbSamples(const Standard_Integer theMinNbSamples);

};


%extend HLRBRep_CInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class HLRBRep_CLProps *
************************/
class HLRBRep_CLProps {
	public:
		/****** HLRBRep_CLProps::HLRBRep_CLProps ******/
		/****** md5 signature: 399ace1f9418e160719ad20b2c45e758 ******/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_Curve *
N: int
Resolution: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
") HLRBRep_CLProps;
		 HLRBRep_CLProps(const HLRBRep_Curve * & C, const Standard_Integer N, const Standard_Real Resolution);

		/****** HLRBRep_CLProps::HLRBRep_CLProps ******/
		/****** md5 signature: b2ed732e896f384f0f2bcff0c690289d ******/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_Curve *
U: float
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
") HLRBRep_CLProps;
		 HLRBRep_CLProps(const HLRBRep_Curve * & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****** HLRBRep_CLProps::HLRBRep_CLProps ******/
		/****** md5 signature: 073bdafcef583228bb61b2f5743095fe ******/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "
Parameters
----------
N: int
Resolution: float

Return
-------
None

Description
-----------
Same as previous constructor but here the parameter is set to the value <U> and the curve is set with SetCurve. the curve can have a empty constructor All the computations done will be related to <C> and <U> when the functions 'set' will be done.
") HLRBRep_CLProps;
		 HLRBRep_CLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** HLRBRep_CLProps::CentreOfCurvature ******/
		/****** md5 signature: 626d695d5de587ba5c831f0811118d8d ******/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the centre of curvature <P>.
") CentreOfCurvature;
		void CentreOfCurvature(gp_Pnt2d & P);

		/****** HLRBRep_CLProps::Curvature ******/
		/****** md5 signature: 4886f38d109c8344d719e9973cfea7e1 ******/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the curvature.
") Curvature;
		Standard_Real Curvature();

		/****** HLRBRep_CLProps::D1 ******/
		/****** md5 signature: 400251dec252a18ea516927809341fa7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the first derivative. The derivative is computed if it has not been yet.
") D1;
		const gp_Vec2d D1();

		/****** HLRBRep_CLProps::D2 ******/
		/****** md5 signature: 14a212b020ed6e6189286e37088e41e7 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the second derivative. The derivative is computed if it has not been yet.
") D2;
		const gp_Vec2d D2();

		/****** HLRBRep_CLProps::D3 ******/
		/****** md5 signature: a13380eb2e77ee845c4ad05a4d86bd7b ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Returns the third derivative. The derivative is computed if it has not been yet.
") D3;
		const gp_Vec2d D3();

		/****** HLRBRep_CLProps::IsTangentDefined ******/
		/****** md5 signature: 96b1d1e7ead0e227ec7d76f9ad798ae8 ******/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the tangent is defined. For example, the tangent is not defined if the three first derivatives are all null.
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****** HLRBRep_CLProps::Normal ******/
		/****** md5 signature: 4d525a8e066324f482e1de5d65bdd7c5 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
N: gp_Dir2d

Return
-------
None

Description
-----------
Returns the normal direction <N>.
") Normal;
		void Normal(gp_Dir2d & N);

		/****** HLRBRep_CLProps::SetCurve ******/
		/****** md5 signature: da07409ce368cb5221f947ebff0385b2 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: HLRBRep_Curve *

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the new curve.
") SetCurve;
		void SetCurve(const HLRBRep_Curve * & C);

		/****** HLRBRep_CLProps::SetParameter ******/
		/****** md5 signature: 6d7d0a8f07175b76bb327cfdc33d2266 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
None

Description
-----------
Initializes the local properties of the curve for the parameter value <U>.
") SetParameter;
		void SetParameter(const Standard_Real U);

		/****** HLRBRep_CLProps::Tangent ******/
		/****** md5 signature: 2adaff97f5d84c22114b84a6e5def58d ******/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir2d

Return
-------
None

Description
-----------
output the tangent direction <D>.
") Tangent;
		void Tangent(gp_Dir2d & D);

		/****** HLRBRep_CLProps::Value ******/
		/****** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the Point.
") Value;
		const gp_Pnt2d Value();

};


%extend HLRBRep_CLProps {
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
		/****** md5 signature: 7f420247eac68a867f281f9781f3778d ******/
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
returns the order of continuity of the curve <C>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable. returns 3: first, second and third are computable.
") Continuity;
		static Standard_Integer Continuity(const HLRBRep_Curve * A);

		/****** HLRBRep_CLPropsATool::D1 ******/
		/****** md5 signature: 2affccc0306e8c31f3afb59ee11e39ec ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.
") D1;
		static void D1(const HLRBRep_Curve * A, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****** HLRBRep_CLPropsATool::D2 ******/
		/****** md5 signature: ef03d4ea0914821edca3c5a3bfb8303a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: float
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
		static void D2(const HLRBRep_Curve * A, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** HLRBRep_CLPropsATool::D3 ******/
		/****** md5 signature: 26a3636f7317f599ad717fd785640591 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: float
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
		static void D3(const HLRBRep_Curve * A, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** HLRBRep_CLPropsATool::FirstParameter ******/
		/****** md5 signature: 2ece17ae4157df8c8b654bc774ab4624 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *

Return
-------
float

Description
-----------
returns the first parameter bound of the curve.
") FirstParameter;
		static Standard_Real FirstParameter(const HLRBRep_Curve * A);

		/****** HLRBRep_CLPropsATool::LastParameter ******/
		/****** md5 signature: fc9fe85a11bd888680272df9015993f7 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *

Return
-------
float

Description
-----------
returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.
") LastParameter;
		static Standard_Real LastParameter(const HLRBRep_Curve * A);

		/****** HLRBRep_CLPropsATool::Value ******/
		/****** md5 signature: 7f6215c66dcceff6cc4c7f2b8f016e3c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
A: HLRBRep_Curve *
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point <P> of parameter <U> on the Curve from HLRBRep <C>.
") Value;
		static void Value(const HLRBRep_Curve * A, const Standard_Real U, gp_Pnt2d & P);

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
		/****** md5 signature: c5111ce8ff4abb74b6c4ba34040c62bb ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the 3D point of parameter U on the curve.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** HLRBRep_Curve::D0 ******/
		/****** md5 signature: 85d1e98e1313be6e4d71518a7016009f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****** HLRBRep_Curve::D1 ******/
		/****** md5 signature: 1460fb893db73aba38f92f1893861fce ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** HLRBRep_Curve::D1 ******/
		/****** md5 signature: 857bb09c503ab50c52904dfc4cdc1a50 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** HLRBRep_Curve::D2 ******/
		/****** md5 signature: 8574226eb2474fe793edb28b9a188341 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
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
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** HLRBRep_Curve::D3 ******/
		/****** md5 signature: 30bd0f2c5f6642dfece94c3612cd0e2f ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
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
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** HLRBRep_Curve::DN ******/
		/****** md5 signature: 0932075ca22fa86aeae3a5a4650fb0ff ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****** HLRBRep_Curve::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		Standard_Integer Degree();

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
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

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
		/****** md5 signature: c7a2f17df7514293a67a56baae0afb68 ******/
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
		/****** md5 signature: 29709d02fadc9fcb79a766bc9679271b ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** HLRBRep_Curve::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** HLRBRep_Curve::IsRational ******/
		/****** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		Standard_Boolean IsRational();

		/****** HLRBRep_Curve::Knots ******/
		/****** md5 signature: 6ec7b1cc69f6d718a60017b92f325470 ******/
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
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

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
		/****** md5 signature: 91f16d3446296cf815739601f36e1b4f ******/
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
		/****** md5 signature: a9cec7e4e6cb5b355a27e6de1f3fc9d9 ******/
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
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** HLRBRep_Curve::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		Standard_Integer NbKnots();

		/****** HLRBRep_Curve::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		Standard_Integer NbPoles();

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
		/****** md5 signature: a7d193182f9115c6e67ca000faffc353 ******/
		%feature("compactdefaultargs") Parameter2d;
		%feature("autodoc", "
Parameters
----------
P3d: float

Return
-------
float

Description
-----------
Returns the parameter on the 2d curve from the parameter on the 3d curve.
") Parameter2d;
		Standard_Real Parameter2d(const Standard_Real P3d);

		/****** HLRBRep_Curve::Parameter3d ******/
		/****** md5 signature: cdd6c8e0285fa1d302b3159a50de98c8 ******/
		%feature("compactdefaultargs") Parameter3d;
		%feature("autodoc", "
Parameters
----------
P2d: float

Return
-------
float

Description
-----------
Returns the parameter on the 3d curve from the parameter on the 2d curve.
") Parameter3d;
		Standard_Real Parameter3d(const Standard_Real P2d);

		/****** HLRBRep_Curve::Period ******/
		/****** md5 signature: 0270204961d3b0052ffe029cbcdbacd9 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		Standard_Real Period();

		/****** HLRBRep_Curve::Poles ******/
		/****** md5 signature: d8d43060127b6f850ce0778e9da31e11 ******/
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
		/****** md5 signature: 0f404e0cd8b4eb95e29776c75d04fa62 ******/
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
		/****** md5 signature: a9bec1f6251c51689ebe9180ef9b86fd ******/
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
		/****** md5 signature: 1ddc0ce09b4c6bb4a0ca2edd7d7f703a ******/
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
		/****** md5 signature: 955dbc498c06516d62e17e1e8d38cba7 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** HLRBRep_Curve::Tangent ******/
		/****** md5 signature: 34a3a88b37e77805b502c5bea027e3bb ******/
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
		void Tangent(const Standard_Boolean AtStart, gp_Pnt2d & P, gp_Dir2d & D);

		/****** HLRBRep_Curve::Update ******/
		/****** md5 signature: 41f3afa541b64cf099deddb1648a46f9 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
TotMin: float
TotMax: float

Return
-------
float

Description
-----------
Update the minmax and the internal data.
") Update;
		Standard_Real Update(Standard_Real TotMin[16], Standard_Real TotMax[16]);

		/****** HLRBRep_Curve::UpdateMinMax ******/
		/****** md5 signature: 211e01ed8fa6b28c2271ba3f6d64c4e9 ******/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "
Parameters
----------
TotMin: float
TotMax: float

Return
-------
float

Description
-----------
Update the minmax returns tol for enlarge;.
") UpdateMinMax;
		Standard_Real UpdateMinMax(Standard_Real TotMin[16], Standard_Real TotMax[16]);

		/****** HLRBRep_Curve::Value ******/
		/****** md5 signature: 1105e8ccba0b18e6fe7169aa8e376b83 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt2d Value(const Standard_Real U);

		/****** HLRBRep_Curve::Value3D ******/
		/****** md5 signature: 187ff8a66e93e16bfe9f47212c7f0d91 ******/
		%feature("compactdefaultargs") Value3D;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the 3D point of parameter U on the curve.
") Value3D;
		gp_Pnt Value3D(const Standard_Real U);

		/****** HLRBRep_Curve::Z ******/
		/****** md5 signature: 790deef5d3b9047eae218dd2026bdbcc ******/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
float

Description
-----------
Computes the Z coordinate of the point of parameter U on the curve in the viewing coordinate system.
") Z;
		Standard_Real Z(const Standard_Real U);

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
		/****** md5 signature: 2177fa1d8976097e3319280506b1aa04 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const Standard_Address C);

		/****** HLRBRep_CurveTool::Bezier ******/
		/****** md5 signature: cfcba0a203d2de2d5e47740c57198852 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const Standard_Address C);

		/****** HLRBRep_CurveTool::Circle ******/
		/****** md5 signature: 36cdd8e90aa1604a62a27eecb1bbb6c8 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		static gp_Circ2d Circle(const Standard_Address C);

		/****** HLRBRep_CurveTool::Continuity ******/
		/****** md5 signature: 207911b924a3bd0bcd78d03ce40d3709 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const Standard_Address C);

		/****** HLRBRep_CurveTool::D0 ******/
		/****** md5 signature: ba74b7e0fddaf63c3e24e1478d2cdc9f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
U: float
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P);

		/****** HLRBRep_CurveTool::D1 ******/
		/****** md5 signature: e354f413deaeac2c1cb2b5b536dbc88f ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
U: float
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** HLRBRep_CurveTool::D2 ******/
		/****** md5 signature: 2e4aa30e98316159f06a6b20c385ffe1 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
U: float
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
		static void D2(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** HLRBRep_CurveTool::D3 ******/
		/****** md5 signature: 8b716517fc6e7bcd2392ce31d62f1735 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
U: float
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
		static void D3(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** HLRBRep_CurveTool::DN ******/
		/****** md5 signature: c7d96ebb86b9b90c0b816abbaf142325 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
U: float
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec2d DN(const Standard_Address C, const Standard_Real U, const Standard_Integer N);

		/****** HLRBRep_CurveTool::Degree ******/
		/****** md5 signature: 3340ce7d9ecc95fdf0b2f3e377aa96cd ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static Standard_Integer Degree(const Standard_Address C);

		/****** HLRBRep_CurveTool::Ellipse ******/
		/****** md5 signature: 68cae55eafb658a008939e6a3aa299ac ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips2d Ellipse(const Standard_Address C);

		/****** HLRBRep_CurveTool::EpsX ******/
		/****** md5 signature: 004527eae5d36fde4532a52d6dc913b5 ******/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") EpsX;
		static Standard_Real EpsX(const Standard_Address C);

		/****** HLRBRep_CurveTool::FirstParameter ******/
		/****** md5 signature: c378718bb40d4e7b8252a7e45c378546 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const Standard_Address C);

		/****** HLRBRep_CurveTool::GetInterval ******/
		/****** md5 signature: a9b8a823327d4a0fa07ea3033f787c20 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
Index: int
Tab: TColStd_Array1OfReal

Return
-------
U1: float
U2: float

Description
-----------
output the bounds of interval of index <Index> used if Type == Composite.
") GetInterval;
		static void GetInterval(const Standard_Address C, const Standard_Integer Index, const TColStd_Array1OfReal & Tab, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_CurveTool::GetType ******/
		/****** md5 signature: 8b7383fa02616489c875ad03f598f733 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const Standard_Address C);

		/****** HLRBRep_CurveTool::Hyperbola ******/
		/****** md5 signature: da632be57a5318e78f5d54bc53449506 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Standard_Address C);

		/****** HLRBRep_CurveTool::Intervals ******/
		/****** md5 signature: f4845d7a44f9b537c0b15d3febb0634f ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
T: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const Standard_Address C, TColStd_Array1OfReal & T);

		/****** HLRBRep_CurveTool::IsClosed ******/
		/****** md5 signature: 2796a2d6021b66cbaedd1b0b2679bc7a ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static Standard_Boolean IsClosed(const Standard_Address C);

		/****** HLRBRep_CurveTool::IsPeriodic ******/
		/****** md5 signature: 5e784f1b227a710aae72ff0aa23cda45 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Standard_Address C);

		/****** HLRBRep_CurveTool::LastParameter ******/
		/****** md5 signature: 2591b07f11d11b23c8c3d864bfb25e96 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const Standard_Address C);

		/****** HLRBRep_CurveTool::Line ******/
		/****** md5 signature: 82fe24c48846770fb82932e7b7f81980 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		static gp_Lin2d Line(const Standard_Address C);

		/****** HLRBRep_CurveTool::NbIntervals ******/
		/****** md5 signature: 40109efd49108f15f718e2e81b5d56b1 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static Standard_Integer NbIntervals(const Standard_Address C);

		/****** HLRBRep_CurveTool::NbSamples ******/
		/****** md5 signature: dc471ec39b0d5e7315e53cbc91bccf0c ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const Standard_Address C, const Standard_Real U0, const Standard_Real U1);

		/****** HLRBRep_CurveTool::NbSamples ******/
		/****** md5 signature: c727a432db531d6137f3e13ad423f60e ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const Standard_Address C);

		/****** HLRBRep_CurveTool::Parabola ******/
		/****** md5 signature: 49af9ceba40c2767bc97ed2c78b8cd33 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab2d Parabola(const Standard_Address C);

		/****** HLRBRep_CurveTool::Period ******/
		/****** md5 signature: c69c9ecb2f367b217305d34416f61427 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const Standard_Address C);

		/****** HLRBRep_CurveTool::Resolution ******/
		/****** md5 signature: a1331491ee2e22f42b36979da3ae16a7 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static Standard_Real Resolution(const Standard_Address C, const Standard_Real R3d);

		/****** HLRBRep_CurveTool::TheType ******/
		/****** md5 signature: 7d470bcc389e52b12d2d622cdcecbb3e ******/
		%feature("compactdefaultargs") TheType;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") TheType;
		static GeomAbs_CurveType TheType(const Standard_Address C);

		/****** HLRBRep_CurveTool::Value ******/
		/****** md5 signature: f183fb2be73075bf12de9d5d961f26ae ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
U: float

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const Standard_Address C, const Standard_Real U);

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
		/****** md5 signature: 6bc92c8b89d989160c8deceff29720e2 ******/
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
		 HLRBRep_Data(const Standard_Integer NV, const Standard_Integer NE, const Standard_Integer NF);

		/****** HLRBRep_Data::AboveInterference ******/
		/****** md5 signature: 729da64e83c2dfe8faf20cc7ce75f35d ******/
		%feature("compactdefaultargs") AboveInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the rejected interference is above the face.
") AboveInterference;
		Standard_Boolean AboveInterference();

		/****** HLRBRep_Data::Classify ******/
		/****** md5 signature: ac770ab0ca5064b3acfa5defc06358e4 ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData
LevelFlag: bool
param: float

Return
-------
Level: int

Description
-----------
Classification of an edge.
") Classify;
		TopAbs_State Classify(const Standard_Integer E, const HLRBRep_EdgeData & ED, const Standard_Boolean LevelFlag, Standard_Integer &OutValue, const Standard_Real param);

		/****** HLRBRep_Data::Compare ******/
		/****** md5 signature: 40c293b2397e78ce5f9f71ed411f8d12 ******/
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
		TopAbs_State Compare(const Standard_Integer E, const HLRBRep_EdgeData & ED);

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
		/****** md5 signature: 25075feea815b822c23adfa9385f5f5b ******/
		%feature("compactdefaultargs") EDataArray;
		%feature("autodoc", "Return
-------
HLRBRep_Array1OfEData

Description
-----------
No available documentation.
") EDataArray;
		HLRBRep_Array1OfEData & EDataArray();

		/****** HLRBRep_Data::Edge ******/
		/****** md5 signature: 76748ffd591f786c44105943fcd6acd5 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current Edge.
") Edge;
		Standard_Integer Edge();

		/****** HLRBRep_Data::EdgeMap ******/
		/****** md5 signature: 458ef859c89a82a90fb9721a91e98744 ******/
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
		/****** md5 signature: 2c9a7e020c7f9b78da9f9cae94f21f47 ******/
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
		Standard_Boolean EdgeOfTheHidingFace(const Standard_Integer E, const HLRBRep_EdgeData & ED);

		/****** HLRBRep_Data::EdgeState ******/
		/****** md5 signature: 6a557e52488b6aa228d4e523d232b0f6 ******/
		%feature("compactdefaultargs") EdgeState;
		%feature("autodoc", "
Parameters
----------
p1: float
p2: float

Return
-------
stbef: TopAbs_State
staf: TopAbs_State

Description
-----------
Returns the local 3D state of the intersection between the current edge and the current face at the <p1> and <p2> parameters.
") EdgeState;
		void EdgeState(const Standard_Real p1, const Standard_Real p2, TopAbs_State &OutValue, TopAbs_State &OutValue);

		/****** HLRBRep_Data::FDataArray ******/
		/****** md5 signature: 8b996173cc67c06948a23a9f10e25897 ******/
		%feature("compactdefaultargs") FDataArray;
		%feature("autodoc", "Return
-------
HLRBRep_Array1OfFData

Description
-----------
No available documentation.
") FDataArray;
		HLRBRep_Array1OfFData & FDataArray();

		/****** HLRBRep_Data::FaceMap ******/
		/****** md5 signature: e9b0badc08981c32de9df95c6482080a ******/
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
		/****** md5 signature: 7e3d3f3673a4248ae2f8916145e5e485 ******/
		%feature("compactdefaultargs") HidingStartLevel;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData
IL: HLRAlgo_InterferenceList

Return
-------
int

Description
-----------
Returns the number of levels of hiding face above the first point of the edge <ED>. The InterferenceList is given to compute far away of the Interferences and then come back.
") HidingStartLevel;
		Standard_Integer HidingStartLevel(const Standard_Integer E, const HLRBRep_EdgeData & ED, const HLRAlgo_InterferenceList & IL);

		/****** HLRBRep_Data::HidingTheFace ******/
		/****** md5 signature: be771e494142bf25aecaa8cee703055c ******/
		%feature("compactdefaultargs") HidingTheFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current edge to be hidden belongs to the hiding face.
") HidingTheFace;
		Standard_Boolean HidingTheFace();

		/****** HLRBRep_Data::InitBoundSort ******/
		/****** md5 signature: c3adf1627084ad2b75f4590dcec45b41 ******/
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
		void InitBoundSort(const HLRAlgo_EdgesBlock::MinMaxIndices & MinMaxTot, const Standard_Integer e1, const Standard_Integer e2);

		/****** HLRBRep_Data::InitEdge ******/
		/****** md5 signature: e8118fa61516698f8563ec2ad6932b88 ******/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "
Parameters
----------
FI: int
MST: BRepTopAdaptor_MapOfShapeTool

Return
-------
None

Description
-----------
Begin an iteration only on visible Edges crossing the face number <FI>.
") InitEdge;
		void InitEdge(const Standard_Integer FI, BRepTopAdaptor_MapOfShapeTool & MST);

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
		/****** md5 signature: 4b415393f709cfd363a681a8fbed1894 ******/
		%feature("compactdefaultargs") IsBadFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current face is bad.
") IsBadFace;
		Standard_Boolean IsBadFace();

		/****** HLRBRep_Data::LocalFEGeometry2D ******/
		/****** md5 signature: c71d133254da871ffedb9630fa1f63b5 ******/
		%feature("compactdefaultargs") LocalFEGeometry2D;
		%feature("autodoc", "
Parameters
----------
FE: int
Param: float
Tg: gp_Dir2d
Nm: gp_Dir2d

Return
-------
Cu: float

Description
-----------
Returns the local description of the projection of the current FEdge at parameter <Param>.
") LocalFEGeometry2D;
		void LocalFEGeometry2D(const Standard_Integer FE, const Standard_Real Param, gp_Dir2d & Tg, gp_Dir2d & Nm, Standard_Real &OutValue);

		/****** HLRBRep_Data::LocalLEGeometry2D ******/
		/****** md5 signature: 264541d78c870e607a2d2a3233d58c1e ******/
		%feature("compactdefaultargs") LocalLEGeometry2D;
		%feature("autodoc", "
Parameters
----------
Param: float
Tg: gp_Dir2d
Nm: gp_Dir2d

Return
-------
Cu: float

Description
-----------
Returns the local description of the projection of the current LEdge at parameter <Param>.
") LocalLEGeometry2D;
		void LocalLEGeometry2D(const Standard_Real Param, gp_Dir2d & Tg, gp_Dir2d & Nm, Standard_Real &OutValue);

		/****** HLRBRep_Data::MoreEdge ******/
		/****** md5 signature: 809deb2c8c3dfedac2033850fc8cfdca ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****** HLRBRep_Data::MoreInterference ******/
		/****** md5 signature: 0a7175ba1cb74c0b701216179940703a ******/
		%feature("compactdefaultargs") MoreInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreInterference;
		Standard_Boolean MoreInterference();

		/****** HLRBRep_Data::NbEdges ******/
		/****** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ******/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEdges;
		Standard_Integer NbEdges();

		/****** HLRBRep_Data::NbFaces ******/
		/****** md5 signature: 1f0fd1808c5306ae27c425978ee57bb5 ******/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbFaces;
		Standard_Integer NbFaces();

		/****** HLRBRep_Data::NbVertices ******/
		/****** md5 signature: 435b05539d6b9d704dc04d9218f26996 ******/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertices;
		Standard_Integer NbVertices();

		/****** HLRBRep_Data::NextEdge ******/
		/****** md5 signature: 1c83cd09f8651c493848926e55f10cf0 ******/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "
Parameters
----------
skip: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") NextEdge;
		void NextEdge(const Standard_Boolean skip = Standard_True);

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
		/****** md5 signature: 26992f35c0878dfc19b1aafa3f7d82e2 ******/
		%feature("compactdefaultargs") RejectedInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the interference is rejected.
") RejectedInterference;
		Standard_Boolean RejectedInterference();

		/****** HLRBRep_Data::SimplClassify ******/
		/****** md5 signature: 55d1fd4787d6f9ea6b9011a26a063db8 ******/
		%feature("compactdefaultargs") SimplClassify;
		%feature("autodoc", "
Parameters
----------
E: int
ED: HLRBRep_EdgeData
Nbp: int
p1: float
p2: float

Return
-------
TopAbs_State

Description
-----------
Simple classification of part of edge [p1, p2]. Returns OUT if at least 1 of Nbp points of edge is out; otherwise returns IN. It is used to check 'suspicion' hidden part of edge.
") SimplClassify;
		TopAbs_State SimplClassify(const Standard_Integer E, const HLRBRep_EdgeData & ED, const Standard_Integer Nbp, const Standard_Real p1, const Standard_Real p2);

		/****** HLRBRep_Data::SimpleHidingFace ******/
		/****** md5 signature: 56d2df81b8d7270deced365aa9db2ca6 ******/
		%feature("compactdefaultargs") SimpleHidingFace;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the current hiding face is not an auto-intersected one.
") SimpleHidingFace;
		Standard_Boolean SimpleHidingFace();

		/****** HLRBRep_Data::Tolerance ******/
		/****** md5 signature: f92d18598761037d5d2e15a52adc608d ******/
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
		void Tolerance(const Standard_ShortReal tol);

		/****** HLRBRep_Data::Tolerance ******/
		/****** md5 signature: 680c1c68cea56ee6a9513e808e1d379c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the tolerance for the rejections during the exploration.
") Tolerance;
		Standard_ShortReal Tolerance();

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
		/****** md5 signature: 6d1eb43f63124ce2993d9046adad8ea0 ******/
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
		void Write(const opencascade::handle<HLRBRep_Data> & DS, const Standard_Integer dv, const Standard_Integer de, const Standard_Integer df);

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
		/****** md5 signature: da4382613fc0ffeaa5e3c26fd20f2488 ******/
		%feature("compactdefaultargs") HasArea;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current area.
") HasArea;
		Standard_Boolean HasArea();

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
		/****** md5 signature: 9d78e8db3d0caa05aa9a267c764c472e ******/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex comes from the boundary of the edge.
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****** HLRBRep_EdgeBuilder::IsInterference ******/
		/****** md5 signature: 70cfb7482a8242c7b6f97a307bb277ee ******/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex was an interference.
") IsInterference;
		Standard_Boolean IsInterference();

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
		/****** md5 signature: ae9c44c48922d7def77564a0d6f2c592 ******/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more new edges to build.
") MoreEdges;
		Standard_Boolean MoreEdges();

		/****** HLRBRep_EdgeBuilder::MoreVertices ******/
		/****** md5 signature: 30eb28ce85d2d60a20b0a6612625139c ******/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if there are more vertices in the current new edge.
") MoreVertices;
		Standard_Boolean MoreVertices();

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
		/****** md5 signature: f3b63fa47326396193c02b762d672dde ******/
		%feature("compactdefaultargs") AutoIntersectionDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AutoIntersectionDone;
		Standard_Boolean AutoIntersectionDone();

		/****** HLRBRep_EdgeData::AutoIntersectionDone ******/
		/****** md5 signature: 983422aefd23fcb828c6a2a3715aa232 ******/
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
		void AutoIntersectionDone(const Standard_Boolean B);

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
		/****** md5 signature: 01fb1e4591022d7397a616fbc41983e3 ******/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CutAtEnd;
		Standard_Boolean CutAtEnd();

		/****** HLRBRep_EdgeData::CutAtEnd ******/
		/****** md5 signature: ad7dfc598a1f3af53e2a4329d7551916 ******/
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
		void CutAtEnd(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::CutAtSta ******/
		/****** md5 signature: 08af25db18add68ea7c756f2a4889334 ******/
		%feature("compactdefaultargs") CutAtSta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") CutAtSta;
		Standard_Boolean CutAtSta();

		/****** HLRBRep_EdgeData::CutAtSta ******/
		/****** md5 signature: 0cb5af0afa1d0e214f74b38d955b6cf2 ******/
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
		void CutAtSta(const Standard_Boolean B);

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
		/****** md5 signature: 38d1acd9954e54785f99bc88211278f2 ******/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") HideCount;
		Standard_Integer HideCount();

		/****** HLRBRep_EdgeData::HideCount ******/
		/****** md5 signature: 10b94c2844285945763db1acb5c34ecb ******/
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
		void HideCount(const Standard_Integer I);

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
		/****** md5 signature: 25dcc2869b7e32596c628d2dd9a037d3 ******/
		%feature("compactdefaultargs") OutLVEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLVEnd;
		Standard_Boolean OutLVEnd();

		/****** HLRBRep_EdgeData::OutLVEnd ******/
		/****** md5 signature: f9e97e67d8fcfbd2864a843ec906e0c5 ******/
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
		void OutLVEnd(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::OutLVSta ******/
		/****** md5 signature: c1e726b151115aed2df3b99b1cb0ea82 ******/
		%feature("compactdefaultargs") OutLVSta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLVSta;
		Standard_Boolean OutLVSta();

		/****** HLRBRep_EdgeData::OutLVSta ******/
		/****** md5 signature: 55b55bb6eea705979c3df5f974212b61 ******/
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
		void OutLVSta(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::Rg1Line ******/
		/****** md5 signature: e4a654ff2c0c228277da43801fa86146 ******/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****** HLRBRep_EdgeData::Rg1Line ******/
		/****** md5 signature: 600e0f21d82c218c81d037c3147d4d93 ******/
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
		void Rg1Line(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::RgNLine ******/
		/****** md5 signature: 9e05bc90bec583cf5ccc9b3bd0b8a5bd ******/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") RgNLine;
		Standard_Boolean RgNLine();

		/****** HLRBRep_EdgeData::RgNLine ******/
		/****** md5 signature: 08a14a9a85e3a29ae0482f1db7c2399c ******/
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
		void RgNLine(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::Selected ******/
		/****** md5 signature: 5d74076148a32a2f44281b7de1236633 ******/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Selected;
		Standard_Boolean Selected();

		/****** HLRBRep_EdgeData::Selected ******/
		/****** md5 signature: 8ff2b8ca05e344d8592cece668b6c014 ******/
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
		void Selected(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::Set ******/
		/****** md5 signature: 13485fc18eb4756f48ed929755f9053b ******/
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
Start: float
TolStart: float
End: float
TolEnd: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Boolean Reg1, const Standard_Boolean RegN, const TopoDS_Edge & EG, const Standard_Integer V1, const Standard_Integer V2, const Standard_Boolean Out1, const Standard_Boolean Out2, const Standard_Boolean Cut1, const Standard_Boolean Cut2, const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd);

		/****** HLRBRep_EdgeData::Simple ******/
		/****** md5 signature: a0bb1fd543e316c4cc1710184f1b8b69 ******/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Simple;
		Standard_Boolean Simple();

		/****** HLRBRep_EdgeData::Simple ******/
		/****** md5 signature: d6f2f4300dde7ef65d46e0f966abe7b2 ******/
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
		void Simple(const Standard_Boolean B);

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
		/****** md5 signature: 680c1c68cea56ee6a9513e808e1d379c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_ShortReal Tolerance();

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
		/****** md5 signature: 1e74809d0229afc91578e082dbdc4788 ******/
		%feature("compactdefaultargs") Used;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Used;
		Standard_Boolean Used();

		/****** HLRBRep_EdgeData::Used ******/
		/****** md5 signature: ab1dc51c46a3b5e205a3d680426cbea5 ******/
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
		void Used(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::VEnd ******/
		/****** md5 signature: c441f0596bebb8c97af23b402ad564c9 ******/
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VEnd;
		Standard_Integer VEnd();

		/****** HLRBRep_EdgeData::VEnd ******/
		/****** md5 signature: 9f6e9fea4e6eb67f667157819f9211bc ******/
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
		void VEnd(const Standard_Integer I);

		/****** HLRBRep_EdgeData::VSta ******/
		/****** md5 signature: 4f139b76a77eb5b8c271c1fa4725ee96 ******/
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VSta;
		Standard_Integer VSta();

		/****** HLRBRep_EdgeData::VSta ******/
		/****** md5 signature: 0fafdd1618cb7a0b9a19e6922ae939df ******/
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
		void VSta(const Standard_Integer I);

		/****** HLRBRep_EdgeData::VerAtEnd ******/
		/****** md5 signature: e6ba410a364ed56d113dbb098a9c7afd ******/
		%feature("compactdefaultargs") VerAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") VerAtEnd;
		Standard_Boolean VerAtEnd();

		/****** HLRBRep_EdgeData::VerAtEnd ******/
		/****** md5 signature: a570001d4af2dd002ea14ac3b8382d77 ******/
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
		void VerAtEnd(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::VerAtSta ******/
		/****** md5 signature: 0779bfe8c583daa1b143a492052ce152 ******/
		%feature("compactdefaultargs") VerAtSta;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") VerAtSta;
		Standard_Boolean VerAtSta();

		/****** HLRBRep_EdgeData::VerAtSta ******/
		/****** md5 signature: 6ba93591d3e77c7fb2aa0c129368d9f5 ******/
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
		void VerAtSta(const Standard_Boolean B);

		/****** HLRBRep_EdgeData::Vertical ******/
		/****** md5 signature: ccf91eafdf77a07d66f4f7dcebc1b226 ******/
		%feature("compactdefaultargs") Vertical;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Vertical;
		Standard_Boolean Vertical();

		/****** HLRBRep_EdgeData::Vertical ******/
		/****** md5 signature: 2a7d04df2946980475f98e3c45fcfb5b ******/
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
		void Vertical(const Standard_Boolean B);

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
		/****** md5 signature: 2b5097b769ed2d6e0c11c0c1c9e80336 ******/
		%feature("compactdefaultargs") CurvatureValue;
		%feature("autodoc", "
Parameters
----------
F: Standard_Address
U: float
V: float
Tg: gp_Dir

Return
-------
float

Description
-----------
No available documentation.
") CurvatureValue;
		static Standard_Real CurvatureValue(const Standard_Address F, const Standard_Real U, const Standard_Real V, const gp_Dir & Tg);

		/****** HLRBRep_EdgeFaceTool::UVPoint ******/
		/****** md5 signature: 23f4c3826da4b29b41c138f0bcf3a0a2 ******/
		%feature("compactdefaultargs") UVPoint;
		%feature("autodoc", "
Parameters
----------
Par: float
E: Standard_Address
F: Standard_Address

Return
-------
U: float
V: float

Description
-----------
return True if U and V are found.
") UVPoint;
		static Standard_Boolean UVPoint(const Standard_Real Par, const Standard_Address E, const Standard_Address F, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: e1f0e33bc46e72a3beaf2bdbb9f48e3f ******/
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "
Parameters
----------
IL: HLRAlgo_InterferenceList
I: HLRAlgo_Interference
T: HLRBRep_EdgeInterferenceTool

Return
-------
None

Description
-----------
Add the interference <I> to the list <IL>.
") AddInterference;
		static void AddInterference(HLRAlgo_InterferenceList & IL, const HLRAlgo_Interference & I, const HLRBRep_EdgeInterferenceTool & T);

		/****** HLRBRep_EdgeIList::ProcessComplex ******/
		/****** md5 signature: fb997f1670d30d67dd5593d4670f9b69 ******/
		%feature("compactdefaultargs") ProcessComplex;
		%feature("autodoc", "
Parameters
----------
IL: HLRAlgo_InterferenceList
T: HLRBRep_EdgeInterferenceTool

Return
-------
None

Description
-----------
Process complex transitions on the list IL.
") ProcessComplex;
		static void ProcessComplex(HLRAlgo_InterferenceList & IL, const HLRBRep_EdgeInterferenceTool & T);

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
		/****** md5 signature: ab21fd9f12a344c39577c17eb014cdfa ******/
		%feature("compactdefaultargs") CurrentParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") CurrentParameter;
		Standard_Real CurrentParameter();

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
		/****** md5 signature: c8f1cf53cd7649a821733f928fc566a1 ******/
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", "
Parameters
----------
Param: float
Tgt: gp_Dir
Nrm: gp_Dir

Return
-------
Curv: float

Description
-----------
Returns local geometric description of the Edge at parameter <Para>. See method Reset of class EdgeFaceTransition from TopCnx for other arguments.
") EdgeGeometry;
		void EdgeGeometry(const Standard_Real Param, gp_Dir & Tgt, gp_Dir & Nrm, Standard_Real &OutValue);

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
		/****** md5 signature: 9084fbcedf4e8429930e7c969f91301c ******/
		%feature("compactdefaultargs") InterferenceBoundaryGeometry;
		%feature("autodoc", "
Parameters
----------
I: HLRAlgo_Interference
Tang: gp_Dir
Norm: gp_Dir

Return
-------
Curv: float

Description
-----------
Returns the geometry of the boundary at the interference <I>. See the AddInterference method of the class EdgeFaceTransition from TopCnx for the other arguments.
") InterferenceBoundaryGeometry;
		void InterferenceBoundaryGeometry(const HLRAlgo_Interference & I, gp_Dir & Tang, gp_Dir & Norm, Standard_Real &OutValue);

		/****** HLRBRep_EdgeInterferenceTool::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

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
		/****** md5 signature: 30eb28ce85d2d60a20b0a6612625139c ******/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertices;
		Standard_Boolean MoreVertices();

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
		/****** md5 signature: 6eb987a2f2a6305e8405661daecd856d ******/
		%feature("compactdefaultargs") ParameterOfInterference;
		%feature("autodoc", "
Parameters
----------
I: HLRAlgo_Interference

Return
-------
float

Description
-----------
No available documentation.
") ParameterOfInterference;
		Standard_Real ParameterOfInterference(const HLRAlgo_Interference & I);

		/****** HLRBRep_EdgeInterferenceTool::SameInterferences ******/
		/****** md5 signature: 86d65de3c8387af864376688859f880f ******/
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
		Standard_Boolean SameInterferences(const HLRAlgo_Interference & I1, const HLRAlgo_Interference & I2);

		/****** HLRBRep_EdgeInterferenceTool::SameVertexAndInterference ******/
		/****** md5 signature: aad472927c83f790d0d28912a327e01e ******/
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
		Standard_Boolean SameVertexAndInterference(const HLRAlgo_Interference & I);

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
		/****** md5 signature: 8d9dadc5fc5f0348b08718fcf1dde2d6 ******/
		%feature("compactdefaultargs") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
C1: Standard_Address
C2: Standard_Address
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter(const Standard_Address & C1, const Standard_Address & C2, const Standard_Real Tol);

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::AnErrorOccurred ******/
		/****** md5 signature: 7f72d28f1d64c3e0ff5b578209701958 ******/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred();

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::NbRoots ******/
		/****** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		Standard_Integer NbRoots();

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: f14997063acb35eeaf788acb1802c2a7 ******/
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
ParamOnSeg1: float
ParamOnSeg2: float

Description
-----------
No available documentation.
") Perform;
		void Perform(const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly1, const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: 95ca10966a8387b775958da0f1189e3d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Uo: float
Vo: float
UInf: float
VInf: float
USup: float
VSup: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real Uo, const Standard_Real Vo, const Standard_Real UInf, const Standard_Real VInf, const Standard_Real USup, const Standard_Real VSup);

		/****** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::Roots ******/
		/****** md5 signature: 8d4622811e04b4565f31efccbad15fef ******/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

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
		/****** md5 signature: cd9372718c7f8bdc9fcd8201e2f9203f ******/
		%feature("compactdefaultargs") Back;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Back;
		Standard_Boolean Back();

		/****** HLRBRep_FaceData::Back ******/
		/****** md5 signature: d047173ad5f3864fbb2d5299bb8c6b95 ******/
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
		void Back(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Closed ******/
		/****** md5 signature: 6964da666f9b5a80bedb32cfb1fdc0ba ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		Standard_Boolean Closed();

		/****** HLRBRep_FaceData::Closed ******/
		/****** md5 signature: 94c08de7f5f8128010d9976e15db8efd ******/
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
		void Closed(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Cone ******/
		/****** md5 signature: 81a444014a717545dd6a66b8774ccde3 ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Cone;
		Standard_Boolean Cone();

		/****** HLRBRep_FaceData::Cone ******/
		/****** md5 signature: eb710dad0aa3f142d633badb48a91b90 ******/
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
		void Cone(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Cut ******/
		/****** md5 signature: 69240458c77b35230fafc7c3af224c24 ******/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Cut;
		Standard_Boolean Cut();

		/****** HLRBRep_FaceData::Cut ******/
		/****** md5 signature: fccdba7023ae16bcdab358aa191780d5 ******/
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
		void Cut(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Cylinder ******/
		/****** md5 signature: f51a27d8676ee0e7ea069c4ce457cdc7 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Cylinder;
		Standard_Boolean Cylinder();

		/****** HLRBRep_FaceData::Cylinder ******/
		/****** md5 signature: 9d3a99bf7be96c92b5b1a8ceb92e5f9b ******/
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
		void Cylinder(const Standard_Boolean B);

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
		/****** md5 signature: bc42207e7cb8f65a46eef744c498e613 ******/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Hiding;
		Standard_Boolean Hiding();

		/****** HLRBRep_FaceData::Hiding ******/
		/****** md5 signature: 40db543b0765548de774883363c55a4b ******/
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
		void Hiding(const Standard_Boolean B);

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
		/****** md5 signature: f121aaa25d867da488b72c7fc2c26685 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Plane;
		Standard_Boolean Plane();

		/****** HLRBRep_FaceData::Plane ******/
		/****** md5 signature: d2ffd027ae5f6a63ed8ea028fb27552b ******/
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
		void Plane(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Selected ******/
		/****** md5 signature: 5d74076148a32a2f44281b7de1236633 ******/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Selected;
		Standard_Boolean Selected();

		/****** HLRBRep_FaceData::Selected ******/
		/****** md5 signature: 8ff2b8ca05e344d8592cece668b6c014 ******/
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
		void Selected(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Set ******/
		/****** md5 signature: 95a5cb236d441a5c67c18ce538f1e613 ******/
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
<Or> is the orientation of the face. <Cl> is true if the face belongs to a closed volume. <NW> is the number of wires ( or block of edges ) of the face.
") Set;
		void Set(const TopoDS_Face & FG, const TopAbs_Orientation Or, const Standard_Boolean Cl, const Standard_Integer NW);

		/****** HLRBRep_FaceData::SetWEdge ******/
		/****** md5 signature: d997dc34d3c54823fc5ab479d80f2e18 ******/
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
		void SetWEdge(const Standard_Integer WI, const Standard_Integer EWI, const Standard_Integer EI, const TopAbs_Orientation Or, const Standard_Boolean OutL, const Standard_Boolean Inte, const Standard_Boolean Dble, const Standard_Boolean IsoL);

		/****** HLRBRep_FaceData::SetWire ******/
		/****** md5 signature: 4a402606b93cd1bc65832d196131e55d ******/
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
		void SetWire(const Standard_Integer WI, const Standard_Integer NE);

		/****** HLRBRep_FaceData::Side ******/
		/****** md5 signature: b051c6b7c64d27374782556662de25d5 ******/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Side;
		Standard_Boolean Side();

		/****** HLRBRep_FaceData::Side ******/
		/****** md5 signature: 99f9b3fb171c48f2f127cc8f20d48780 ******/
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
		void Side(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Simple ******/
		/****** md5 signature: a0bb1fd543e316c4cc1710184f1b8b69 ******/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Simple;
		Standard_Boolean Simple();

		/****** HLRBRep_FaceData::Simple ******/
		/****** md5 signature: d6f2f4300dde7ef65d46e0f966abe7b2 ******/
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
		void Simple(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Size ******/
		/****** md5 signature: a8e9905382c3964d697ee929ccdb9562 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Size;
		Standard_Real Size();

		/****** HLRBRep_FaceData::Size ******/
		/****** md5 signature: caa33fcc13a2ff9ea4a95ab2ce3d5924 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "
Parameters
----------
S: float

Return
-------
None

Description
-----------
No available documentation.
") Size;
		void Size(const Standard_Real S);

		/****** HLRBRep_FaceData::Sphere ******/
		/****** md5 signature: 3ffe70065a3d00e08533c52a615de711 ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Sphere;
		Standard_Boolean Sphere();

		/****** HLRBRep_FaceData::Sphere ******/
		/****** md5 signature: f5e128a267ad828a88fd680ee392c612 ******/
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
		void Sphere(const Standard_Boolean B);

		/****** HLRBRep_FaceData::Tolerance ******/
		/****** md5 signature: 680c1c68cea56ee6a9513e808e1d379c ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_ShortReal Tolerance();

		/****** HLRBRep_FaceData::Torus ******/
		/****** md5 signature: ce39c659a55decd69a2cee5678fbab44 ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Torus;
		Standard_Boolean Torus();

		/****** HLRBRep_FaceData::Torus ******/
		/****** md5 signature: 8e204a2bf186d8b8721f25f21de2b201 ******/
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
		void Torus(const Standard_Boolean B);

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
		/****** md5 signature: 3c66a94b1c7ee08e6b8a2fa066cc44d8 ******/
		%feature("compactdefaultargs") WithOutL;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithOutL;
		Standard_Boolean WithOutL();

		/****** HLRBRep_FaceData::WithOutL ******/
		/****** md5 signature: ffb82d26c98b8aa27e9d131d2c49546a ******/
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
		void WithOutL(const Standard_Boolean B);

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
		/****** md5 signature: 08a80bf9673a0bb64c5402cb4f9c7371 ******/
		%feature("compactdefaultargs") BeginningOfWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current edge is the first of a wire.
") BeginningOfWire;
		Standard_Boolean BeginningOfWire();

		/****** HLRBRep_FaceIterator::Double ******/
		/****** md5 signature: 8e7b76dbe7d0d25634fd22872f1a9eab ******/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Double;
		Standard_Boolean Double();

		/****** HLRBRep_FaceIterator::Edge ******/
		/****** md5 signature: 76748ffd591f786c44105943fcd6acd5 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Edge;
		Standard_Integer Edge();

		/****** HLRBRep_FaceIterator::EndOfWire ******/
		/****** md5 signature: 98ac37dc8042863f016e7904eded0942 ******/
		%feature("compactdefaultargs") EndOfWire;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current edge is the last of a wire.
") EndOfWire;
		Standard_Boolean EndOfWire();

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
		/****** md5 signature: 5ef23a8bb89a8c65384a3c52774e0041 ******/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Internal;
		Standard_Boolean Internal();

		/****** HLRBRep_FaceIterator::IsoLine ******/
		/****** md5 signature: df815a00be6369dbaeff09d05445d1a0 ******/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsoLine;
		Standard_Boolean IsoLine();

		/****** HLRBRep_FaceIterator::MoreEdge ******/
		/****** md5 signature: 3deabda73e93b20e8a72f2f0ebea4e02 ******/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreEdge;
		Standard_Boolean MoreEdge();

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
		/****** md5 signature: d122c0487489d9158e71cfc6be51302d ******/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OutLine;
		Standard_Boolean OutLine();

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
		/****** md5 signature: 71c887a277d9d5a40d5ebebcb54316c6 ******/
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
		TopoDS_Shape CompoundOfEdges(const HLRBRep_TypeOfResultingEdge type, const Standard_Boolean visible, const Standard_Boolean In3d);

		/****** HLRBRep_HLRToShape::CompoundOfEdges ******/
		/****** md5 signature: 6c46497bdf04eb2ad6fe50bbd4953e3b ******/
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
		TopoDS_Shape CompoundOfEdges(const TopoDS_Shape & S, const HLRBRep_TypeOfResultingEdge type, const Standard_Boolean visible, const Standard_Boolean In3d);

		/****** HLRBRep_HLRToShape::HCompound ******/
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
No available documentation.
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
		/****** md5 signature: 767cf6aab6d1df52670f15b01ced6148 ******/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "
Parameters
----------
FI: int
MST: BRepTopAdaptor_MapOfShapeTool

Return
-------
None

Description
-----------
Removes from the edges, the parts hidden by the hiding face number <FI>.
") Hide;
		void Hide(const Standard_Integer FI, BRepTopAdaptor_MapOfShapeTool & MST);

		/****** HLRBRep_Hider::OwnHiding ******/
		/****** md5 signature: d7166ae9c760930cf296f9334e882a27 ******/
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
		void OwnHiding(const Standard_Integer FI);

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
		/****** md5 signature: f40a85f399c243c843b85844d0f6b8b9 ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: bcff132257b5b6b8e97647cb8df2aab6 ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: 8b5e64a296d5dc6b6d1066ca6d8fbce2 ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: e861aa6a3d91b183eb5833470d59b62f ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::HLRBRep_IntConicCurveOfCInter ******/
		/****** md5 signature: ac48fa9113995fb36b0983ee7e4f6b08 ******/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 256f0ab35aa34bea4dadb6bd5eb4a19c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 08d385c076b409ee44899b99b87bce65 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: adcc3156cc7d9584606acdb0e8a9fcc3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 590908aa03a8133564eed84deecb5d15 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_IntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 71d5c9759e509bec96b20ad2637d7730 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

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
		/****** md5 signature: 775ee260cc06c85bb480d3123a3ecf42 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
Surface: Standard_Address

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface.
") Perform;
		void Perform(const gp_Lin & Curve, const Standard_Address & Surface);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: 63afc9c04fdbf464989b3f347e12cd03 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
Polygon: HLRBRep_ThePolygonOfInterCSurf
Surface: Standard_Address

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <Polygon> is given.
") Perform;
		void Perform(const gp_Lin & Curve, const HLRBRep_ThePolygonOfInterCSurf & Polygon, const Standard_Address & Surface);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: 0f2218ada737e9d8e5e92c928ff52b9a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
ThePolygon: HLRBRep_ThePolygonOfInterCSurf
Surface: Standard_Address
Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.
") Perform;
		void Perform(const gp_Lin & Curve, const HLRBRep_ThePolygonOfInterCSurf & ThePolygon, const Standard_Address & Surface, const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: 68b3dab960f1f09b0471dccfe1db21d0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
ThePolygon: HLRBRep_ThePolygonOfInterCSurf
Surface: Standard_Address
Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf
BndBSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.
") Perform;
		void Perform(const gp_Lin & Curve, const HLRBRep_ThePolygonOfInterCSurf & ThePolygon, const Standard_Address & Surface, const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron, Bnd_BoundSortBox & BndBSB);

		/****** HLRBRep_InterCSurf::Perform ******/
		/****** md5 signature: f85573ee239fa0e6cd93ae6402d6a1da ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
Surface: Standard_Address
Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Compute the Intersection between the curve and the surface. The Surface is already sampled and its polyhedron: <Polyhedron> is given.
") Perform;
		void Perform(const gp_Lin & Curve, const Standard_Address & Surface, const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);

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
		/****** md5 signature: 9ec00ae92bb9dabb0f3b92dbec69abd1 ******/
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
		void Debug(const Standard_Boolean deb);

		/****** HLRBRep_InternalAlgo::Debug ******/
		/****** md5 signature: c5ed4da64ffa88071867c0cccf683e9a ******/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Debug;
		Standard_Boolean Debug();

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
		/****** md5 signature: a0a6c6a0560cf0a28cf6cf97b437befc ******/
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
		void Hide(const Standard_Integer I);

		/****** HLRBRep_InternalAlgo::Hide ******/
		/****** md5 signature: 3c5421ad096f3eeb44be04fe7666b697 ******/
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
		void Hide(const Standard_Integer I, const Standard_Integer J);

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
		/****** md5 signature: b44e1fcd67c90925d4234f31ef2d0b2e ******/
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
		void HideAll(const Standard_Integer I);

		/****** HLRBRep_InternalAlgo::Index ******/
		/****** md5 signature: 187fdee228a294ce16137a07b47c9d85 ******/
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
		Standard_Integer Index(const opencascade::handle<HLRTopoBRep_OutLiner> & S);

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
		/****** md5 signature: e9bddba1b8406ebaefb01c237a9c4d1f ******/
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
		void Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const opencascade::handle<Standard_Transient> & SData, const Standard_Integer nbIso = 0);

		/****** HLRBRep_InternalAlgo::Load ******/
		/****** md5 signature: 56eb0ffc589543fd9e6dd49a9e885782 ******/
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
		void Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const Standard_Integer nbIso = 0);

		/****** HLRBRep_InternalAlgo::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		Standard_Integer NbShapes();

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
		/****** md5 signature: e9cf861e645127938dcff0ea13bfa8c2 ******/
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
		void Remove(const Standard_Integer I);

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
		/****** md5 signature: 7492f53dfed6fd6b6cb147ee1f1a2612 ******/
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
		void Select(const Standard_Integer I);

		/****** HLRBRep_InternalAlgo::SelectEdge ******/
		/****** md5 signature: 9d38d629011eae37cd5229c2ee061dc6 ******/
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
		void SelectEdge(const Standard_Integer I);

		/****** HLRBRep_InternalAlgo::SelectFace ******/
		/****** md5 signature: 00a2dd2008480d52177b8336a23ac4b7 ******/
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
		void SelectFace(const Standard_Integer I);

		/****** HLRBRep_InternalAlgo::SeqOfShapeBounds ******/
		/****** md5 signature: 4e702d2f67476d94fa53ff151ba70dcb ******/
		%feature("compactdefaultargs") SeqOfShapeBounds;
		%feature("autodoc", "Return
-------
HLRBRep_SeqOfShapeBounds

Description
-----------
No available documentation.
") SeqOfShapeBounds;
		HLRBRep_SeqOfShapeBounds & SeqOfShapeBounds();

		/****** HLRBRep_InternalAlgo::ShapeBounds ******/
		/****** md5 signature: ac736476f628e1407978e327f1424b69 ******/
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
		HLRBRep_ShapeBounds & ShapeBounds(const Standard_Integer I);

		/****** HLRBRep_InternalAlgo::ShapeData ******/
		/****** md5 signature: a3f40ee6d762d920739602e2de0add47 ******/
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
		void ShapeData(const Standard_Integer I, const opencascade::handle<Standard_Transient> & SData);

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
		/****** md5 signature: 3ad94b28582fe688b9ad08e822e403c1 ******/
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
		void ShowAll(const Standard_Integer I);

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
		/****** md5 signature: 3ad21118600f72be699184d19a93464b ******/
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
		IntCurveSurface_IntersectionPoint CSPoint(const Standard_Integer N);

		/****** HLRBRep_Intersector::CSSegment ******/
		/****** md5 signature: cdcfb6a547ece08784f0bdf0d0732007 ******/
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
		IntCurveSurface_IntersectionSegment CSSegment(const Standard_Integer N);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** HLRBRep_Intersector::Load ******/
		/****** md5 signature: 6e50e343ba82585300ed1664ff5ef0c0 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
A: Standard_Address

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(Standard_Address & A);

		/****** HLRBRep_Intersector::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** HLRBRep_Intersector::NbSegments ******/
		/****** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSegments;
		Standard_Integer NbSegments();

		/****** HLRBRep_Intersector::Perform ******/
		/****** md5 signature: ad6a57edaa391e06877cb1bee2bae6c2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
A1: Standard_Address
da1: float
db1: float

Return
-------
None

Description
-----------
Performs the auto intersection of an edge. The edge domain is cut at start with da1*(b-a) and at end with db1*(b-a).
") Perform;
		void Perform(const Standard_Address A1, const Standard_Real da1, const Standard_Real db1);

		/****** HLRBRep_Intersector::Perform ******/
		/****** md5 signature: 4f119c0498079f9f268caca23730d0d5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
nA: int
A1: Standard_Address
da1: float
db1: float
nB: int
A2: Standard_Address
da2: float
db2: float
NoBound: bool

Return
-------
None

Description
-----------
Performs the intersection between the two edges. The edges domains are cut at start with da*(b-a) and at end with db*(b-a).
") Perform;
		void Perform(const Standard_Integer nA, const Standard_Address A1, const Standard_Real da1, const Standard_Real db1, const Standard_Integer nB, const Standard_Address A2, const Standard_Real da2, const Standard_Real db2, const Standard_Boolean NoBound);

		/****** HLRBRep_Intersector::Perform ******/
		/****** md5 signature: b97b7f841573c60a82a40f858de3f2b6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
P: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & L, const Standard_Real P);

		/****** HLRBRep_Intersector::Point ******/
		/****** md5 signature: ab5be2f4faa8204905c7defafba7f249 ******/
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
		const IntRes2d_IntersectionPoint & Point(const Standard_Integer N);

		/****** HLRBRep_Intersector::Segment ******/
		/****** md5 signature: 423d5f868e6a816f02143de11c5f58dc ******/
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
		const IntRes2d_IntersectionSegment & Segment(const Standard_Integer N);

		/****** HLRBRep_Intersector::SimulateOnePoint ******/
		/****** md5 signature: ea69fcdb586b8cc34be7b877311faab8 ******/
		%feature("compactdefaultargs") SimulateOnePoint;
		%feature("autodoc", "
Parameters
----------
A1: Standard_Address
U: float
A2: Standard_Address
V: float

Return
-------
None

Description
-----------
Create a single IntersectionPoint (U on A1) (V on A2) The point is middle on both curves.
") SimulateOnePoint;
		void SimulateOnePoint(const Standard_Address A1, const Standard_Real U, const Standard_Address A2, const Standard_Real V);

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
		/****** md5 signature: df50c8cb2a7a467049518446760283cc ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the line.
") D0;
		static void D0(const gp_Lin & C, const Standard_Real U, gp_Pnt & P);

		/****** HLRBRep_LineTool::D1 ******/
		/****** md5 signature: cc6578642642883233e657d067a50adc ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the line with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const gp_Lin & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** HLRBRep_LineTool::D2 ******/
		/****** md5 signature: b21e1d311e32a163d305e924e9cc0885 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: float
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
		static void D2(const gp_Lin & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** HLRBRep_LineTool::D3 ******/
		/****** md5 signature: 7fe7498a6369a96f7db270009ab64a32 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: float
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
		static void D3(const gp_Lin & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** HLRBRep_LineTool::DN ******/
		/****** md5 signature: 72d3a77c487e68835c5a00c3ab93a892 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec DN(const gp_Lin & C, const Standard_Real U, const Standard_Integer N);

		/****** HLRBRep_LineTool::Degree ******/
		/****** md5 signature: ce823cd96f5087483be858368a6f9908 ******/
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
		static Standard_Integer Degree(const gp_Lin & C);

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
		/****** md5 signature: e64a464242bf01ff4625baedc30199a4 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const gp_Lin & C);

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
		/****** md5 signature: 883451ed66bc68dd9be59a74ab22a30c ******/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
float

Description
-----------
Returns the first parameter of the current interval.
") IntervalFirst;
		static Standard_Real IntervalFirst(const gp_Lin & C);

		/****** HLRBRep_LineTool::IntervalLast ******/
		/****** md5 signature: b97048513f8df32c3d3fb9e943489920 ******/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
float

Description
-----------
Returns the last parameter of the current interval.
") IntervalLast;
		static Standard_Real IntervalLast(const gp_Lin & C);

		/****** HLRBRep_LineTool::Intervals ******/
		/****** md5 signature: 3ffed521a9811d11176105e8ca08c7ff ******/
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
		/****** md5 signature: 05f48005588bc1ebffe9d50caafa7136 ******/
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
		static Standard_Boolean IsClosed(const gp_Lin & C);

		/****** HLRBRep_LineTool::IsPeriodic ******/
		/****** md5 signature: 94d16d951cc0c3cabf7ff3c01533e1b6 ******/
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
		static Standard_Boolean IsPeriodic(const gp_Lin & C);

		/****** HLRBRep_LineTool::IsRational ******/
		/****** md5 signature: 4341e9f8b33ff321206e143a166499ce ******/
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
		static Standard_Boolean IsRational(const gp_Lin & C);

		/****** HLRBRep_LineTool::KnotsAndMultiplicities ******/
		/****** md5 signature: c82d93d487930d28e784ded0f522d5db ******/
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
		/****** md5 signature: e427d772ca3add3bd60c88cf78268e5c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const gp_Lin & C);

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
		/****** md5 signature: 5d500956a6a4ceb8bea94f685055c6df ******/
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
		static Standard_Integer NbIntervals(const gp_Lin & C, const GeomAbs_Shape S);

		/****** HLRBRep_LineTool::NbKnots ******/
		/****** md5 signature: ea1d08f7a8cc968c2fc1702e540e9860 ******/
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
		static Standard_Integer NbKnots(const gp_Lin & C);

		/****** HLRBRep_LineTool::NbPoles ******/
		/****** md5 signature: c7c18240249e0a7b737616d551009059 ******/
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
		static Standard_Integer NbPoles(const gp_Lin & C);

		/****** HLRBRep_LineTool::NbSamples ******/
		/****** md5 signature: 37e2cb5bf4aa983d77d4d9800d0ebcd8 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const gp_Lin & C, const Standard_Real U0, const Standard_Real U1);

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
		/****** md5 signature: da90dcf013c319e7a8d3053f5a74e336 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const gp_Lin & C);

		/****** HLRBRep_LineTool::Poles ******/
		/****** md5 signature: cecc681bf55705f50b5b8d89253de13a ******/
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
		/****** md5 signature: 25eb83c010bf4036ccf71bbe36ec9bf8 ******/
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
		/****** md5 signature: 828e677117947b59cb33694658d42a33 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static Standard_Real Resolution(const gp_Lin & C, const Standard_Real R3d);

		/****** HLRBRep_LineTool::SamplePars ******/
		/****** md5 signature: 06cb58e77264b5dfa6e15c6a8b897b6d ******/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U0: float
U1: float
Defl: float
NbMin: int
Pars: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SamplePars;
		static void SamplePars(const gp_Lin & C, const Standard_Real U0, const Standard_Real U1, const Standard_Real Defl, const Standard_Integer NbMin, opencascade::handle<TColStd_HArray1OfReal> & Pars);

		/****** HLRBRep_LineTool::Value ******/
		/****** md5 signature: 03bb47a1e9ef7b8bc9b7a7ce321e38ea ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the line.
") Value;
		static gp_Pnt Value(const gp_Lin & C, const Standard_Real U);

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
		/****** md5 signature: 02de6cdd0d16aa29d41caaf2fdbeb8a4 ******/
		%feature("compactdefaultargs") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
IT: IntCurve_IConicTool
PC: Standard_Address

Return
-------
None

Description
-----------
Constructor of the class.
") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter(const IntCurve_IConicTool & IT, const Standard_Address & PC);

		/****** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::Derivative ******/
		/****** md5 signature: f61c873331fa555e182f1973e95f59da ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
D: float

Description
-----------
Computes the derivative of the previous function at parameter Param.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::Value ******/
		/****** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float

Description
-----------
Computes the value of the signed distance between the implicit curve and the point at parameter Param on the parametrised curve.
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::Values ******/
		/****** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float
D: float

Description
-----------
Computes the value and the derivative of the function.
") Values;
		Standard_Boolean Values(const Standard_Real Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************************
* class HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter *
************************************************************/
class HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter : public math_FunctionWithDerivative {
	public:
		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ******/
		/****** md5 signature: ef2b6c60ae2e7488efe1085e96dccd33 ******/
		%feature("compactdefaultargs") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter();

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ******/
		/****** md5 signature: 027be352b880a0d46127e59615fc982f ******/
		%feature("compactdefaultargs") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Standard_Address

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter(const gp_Pnt2d & P, const Standard_Address & C);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::Derivative ******/
		/****** md5 signature: 74e45b7ef1cb50395f459121235df2cd ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
DF: float

Description
-----------
Calculation of F'(U).
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::GetStateNumber ******/
		/****** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::Initialize ******/
		/****** md5 signature: eea140d2a7c54343781978adcd2828b3 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address

Return
-------
None

Description
-----------
sets the field mycurve of the function.
") Initialize;
		void Initialize(const Standard_Address & C);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::IsMin ******/
		/****** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Shows if the Nth distance is a minimum.
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::NbExt ******/
		/****** md5 signature: 84ada636e4651cacf916eb056265a1d9 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		Standard_Integer NbExt();

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::Point ******/
		/****** md5 signature: 6123812027804044a54749cfa19bef5e ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::SearchOfTolerance ******/
		/****** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ******/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::SetPoint ******/
		/****** md5 signature: 0ad85ba084f338225cb11e827425ab5f ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
sets the field P of the function.
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::SquareDistance ******/
		/****** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the Nth distance.
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::SubIntervalInitialize ******/
		/****** md5 signature: 424565e975e565ea668d16ca9ce728b5 ******/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "
Parameters
----------
theUfirst: float
theUlast: float

Return
-------
None

Description
-----------
Determines boundaries of subinterval for find of root.
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::Value ******/
		/****** md5 signature: e3462efa1edccfd4021bca61bc42d936 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float

Description
-----------
Calculation of F(U).
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::Values ******/
		/****** md5 signature: a9de0e54fbbad71406954eb825560b84 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
F: float
DF: float

Description
-----------
Calculation of F(U) and F'(U).
") Values;
		Standard_Boolean Values(const Standard_Real U, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter {
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
		/****** md5 signature: 69dc7ba9221c00c4012a027efb557742 ******/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Debug;
		Standard_Boolean Debug();

		/****** HLRBRep_PolyAlgo::Debug ******/
		/****** md5 signature: 5a84295d1fdccd631752aed041f3c397 ******/
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
		void Debug(const Standard_Boolean theDebug);

		/****** HLRBRep_PolyAlgo::Hide ******/
		/****** md5 signature: 6909c92a5658f468316390940e7bea34 ******/
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
		/****** md5 signature: 9e94bb6d7b4221be4165f8639cd27d92 ******/
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
		Standard_Integer Index(const TopoDS_Shape & S);

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
		/****** md5 signature: ee934ca6bfa0a4423c581ec95be0690b ******/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreHide;
		Standard_Boolean MoreHide();

		/****** HLRBRep_PolyAlgo::MoreShow ******/
		/****** md5 signature: 676e76c7f6a46e8688a744d734543b5e ******/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreShow;
		Standard_Boolean MoreShow();

		/****** HLRBRep_PolyAlgo::NbShapes ******/
		/****** md5 signature: c49f25449a07f6fd2b7c8d09e76ddf1b ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		Standard_Integer NbShapes();

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
		/****** md5 signature: e9cf861e645127938dcff0ea13bfa8c2 ******/
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
		void Remove(const Standard_Integer I);

		/****** HLRBRep_PolyAlgo::Shape ******/
		/****** md5 signature: b38214dc52925d212203a446234e9de3 ******/
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
		TopoDS_Shape Shape(const Standard_Integer I);

		/****** HLRBRep_PolyAlgo::Show ******/
		/****** md5 signature: fcba02d084d4b66d814a22fc57955911 ******/
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
		/****** md5 signature: a0cac09d05df8a373bc57341a3bdbdac ******/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TolAngular;
		Standard_Real TolAngular();

		/****** HLRBRep_PolyAlgo::TolAngular ******/
		/****** md5 signature: 4094ebd98e1eba0acbcd66ec1aaadfeb ******/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
No available documentation.
") TolAngular;
		void TolAngular(const Standard_Real theTol);

		/****** HLRBRep_PolyAlgo::TolCoef ******/
		/****** md5 signature: d2fea73ed2426c0333fec48a4b3e7f07 ******/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TolCoef;
		Standard_Real TolCoef();

		/****** HLRBRep_PolyAlgo::TolCoef ******/
		/****** md5 signature: 481c30d8f4ead55eb016cae2e0c01d3c ******/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
No available documentation.
") TolCoef;
		void TolCoef(const Standard_Real theTol);

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

/************************
* class HLRBRep_SLProps *
************************/
class HLRBRep_SLProps {
	public:
		/****** HLRBRep_SLProps::HLRBRep_SLProps ******/
		/****** md5 signature: 78f0374b7b7eeb83b89b827d014ac753 ******/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
U: float
V: float
N: int
Resolution: float

Return
-------
None

Description
-----------
Initializes the local properties of the surface <S> for the parameter values (<U>, <V>). The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, or 2). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
") HLRBRep_SLProps;
		 HLRBRep_SLProps(const Standard_Address & S, const Standard_Real U, const Standard_Real V, const Standard_Integer N, const Standard_Real Resolution);

		/****** HLRBRep_SLProps::HLRBRep_SLProps ******/
		/****** md5 signature: eb8aa57972d644a87d3e5fe72e6a204e ******/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
N: int
Resolution: float

Return
-------
None

Description
-----------
idem as previous constructor but without setting the value of parameters <U> and <V>.
") HLRBRep_SLProps;
		 HLRBRep_SLProps(const Standard_Address & S, const Standard_Integer N, const Standard_Real Resolution);

		/****** HLRBRep_SLProps::HLRBRep_SLProps ******/
		/****** md5 signature: f5c3d071302aa2344a5432a3fdbf8bc0 ******/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "
Parameters
----------
N: int
Resolution: float

Return
-------
None

Description
-----------
idem as previous constructor but without setting the value of parameters <U> and <V> and the surface. the surface can have an empty constructor.
") HLRBRep_SLProps;
		 HLRBRep_SLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****** HLRBRep_SLProps::CurvatureDirections ******/
		/****** md5 signature: dce4de0944d73f0923cc57f1cae010ce ******/
		%feature("compactdefaultargs") CurvatureDirections;
		%feature("autodoc", "
Parameters
----------
MaxD: gp_Dir
MinD: gp_Dir

Return
-------
None

Description
-----------
Returns the direction of the maximum and minimum curvature <MaxD> and <MinD>.
") CurvatureDirections;
		void CurvatureDirections(gp_Dir & MaxD, gp_Dir & MinD);

		/****** HLRBRep_SLProps::D1U ******/
		/****** md5 signature: 7fcd61e774b6033eceefa61e3338377a ******/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the first U derivative. The derivative is computed if it has not been yet.
") D1U;
		const gp_Vec D1U();

		/****** HLRBRep_SLProps::D1V ******/
		/****** md5 signature: ad864d52b93c95482f9a3644c7fe473c ******/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the first V derivative. The derivative is computed if it has not been yet.
") D1V;
		const gp_Vec D1V();

		/****** HLRBRep_SLProps::D2U ******/
		/****** md5 signature: 0472ef4d94574816aeb47829a66bdbae ******/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the second U derivatives The derivative is computed if it has not been yet.
") D2U;
		const gp_Vec D2U();

		/****** HLRBRep_SLProps::D2V ******/
		/****** md5 signature: c70c5cc9b31ef0a3470d3c29498b5305 ******/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the second V derivative. The derivative is computed if it has not been yet.
") D2V;
		const gp_Vec D2V();

		/****** HLRBRep_SLProps::DUV ******/
		/****** md5 signature: 93a293abda31f525f2bff5034aabc11a ******/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Returns the second UV cross-derivative. The derivative is computed if it has not been yet.
") DUV;
		const gp_Vec DUV();

		/****** HLRBRep_SLProps::GaussianCurvature ******/
		/****** md5 signature: 6f1ed6a8aa49074ec45c7600ff9ed9ad ******/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the Gaussian curvature.
") GaussianCurvature;
		Standard_Real GaussianCurvature();

		/****** HLRBRep_SLProps::IsCurvatureDefined ******/
		/****** md5 signature: 24d1c4dc0bb5e5b3cd3acab3d6b3723c ******/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the curvature is defined.
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined();

		/****** HLRBRep_SLProps::IsNormalDefined ******/
		/****** md5 signature: b4faa90626237a62ab1311b7cb7ad450 ******/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the normal is defined.
") IsNormalDefined;
		Standard_Boolean IsNormalDefined();

		/****** HLRBRep_SLProps::IsTangentUDefined ******/
		/****** md5 signature: 92ed6ca4fade225cd5464af6490033b3 ******/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the U tangent is defined. For example, the tangent is not defined if the two first U derivatives are null.
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined();

		/****** HLRBRep_SLProps::IsTangentVDefined ******/
		/****** md5 signature: 53c94c0bb0d39a933984467e0683397e ******/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns if the V tangent is defined. For example, the tangent is not defined if the two first V derivatives are null.
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined();

		/****** HLRBRep_SLProps::IsUmbilic ******/
		/****** md5 signature: a045467d1ec2cad50bd2dfbeab29b8fd ******/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the point is umbilic (i.e. if the curvature is constant).
") IsUmbilic;
		Standard_Boolean IsUmbilic();

		/****** HLRBRep_SLProps::MaxCurvature ******/
		/****** md5 signature: 42c5b0c05da3040d5856fffc987ed742 ******/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximum curvature.
") MaxCurvature;
		Standard_Real MaxCurvature();

		/****** HLRBRep_SLProps::MeanCurvature ******/
		/****** md5 signature: 5c7a78b552e4ca890e50b485026f52f3 ******/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the mean curvature.
") MeanCurvature;
		Standard_Real MeanCurvature();

		/****** HLRBRep_SLProps::MinCurvature ******/
		/****** md5 signature: 9c5c8915c2ccf5b49a49ab2765ec946f ******/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minimum curvature.
") MinCurvature;
		Standard_Real MinCurvature();

		/****** HLRBRep_SLProps::Normal ******/
		/****** md5 signature: 24a2507aa20216689971a0ec1fd83f76 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the normal direction.
") Normal;
		const gp_Dir Normal();

		/****** HLRBRep_SLProps::SetParameters ******/
		/****** md5 signature: 766228d61435cf9eaba866b58733ed73 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
None

Description
-----------
Initializes the local properties of the surface S for the new parameter values (<U>, <V>).
") SetParameters;
		void SetParameters(const Standard_Real U, const Standard_Real V);

		/****** HLRBRep_SLProps::SetSurface ******/
		/****** md5 signature: fdd17ffc74b005040cec1fe6f5cb6245 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
None

Description
-----------
Initializes the local properties of the surface S for the new surface.
") SetSurface;
		void SetSurface(const Standard_Address & S);

		/****** HLRBRep_SLProps::TangentU ******/
		/****** md5 signature: ff20f7d1d23e153974b932d55fa30a7f ******/
		%feature("compactdefaultargs") TangentU;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
Returns the tangent direction <D> on the iso-V.
") TangentU;
		void TangentU(gp_Dir & D);

		/****** HLRBRep_SLProps::TangentV ******/
		/****** md5 signature: 8241dc858e42533746e4d61351ceccd4 ******/
		%feature("compactdefaultargs") TangentV;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
Returns the tangent direction <D> on the iso-V.
") TangentV;
		void TangentV(gp_Dir & D);

		/****** HLRBRep_SLProps::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point.
") Value;
		const gp_Pnt Value();

};


%extend HLRBRep_SLProps {
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
		/****** md5 signature: e8dfb084ac6c872071bbf7788de530dc ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
A: Standard_Address

Return
-------
U1: float
V1: float
U2: float
V2: float

Description
-----------
returns the bounds of the Surface.
") Bounds;
		static void Bounds(const Standard_Address A, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_SLPropsATool::Continuity ******/
		/****** md5 signature: d3733a3bc8f06c200ea6422cb6df16a3 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
A: Standard_Address

Return
-------
int

Description
-----------
returns the order of continuity of the Surface <A>. returns 1: first derivative only is computable returns 2: first and second derivative only are computable.
") Continuity;
		static Standard_Integer Continuity(const Standard_Address A);

		/****** HLRBRep_SLPropsATool::D1 ******/
		/****** md5 signature: ab16415dfcd6c110739148d174a08916 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
A: Standard_Address
U: float
V: float
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
		static void D1(const Standard_Address A, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** HLRBRep_SLPropsATool::D2 ******/
		/****** md5 signature: 370c635cad04eda1fd2dd910286efcfc ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
A: Standard_Address
U: float
V: float
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
		static void D2(const Standard_Address A, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****** HLRBRep_SLPropsATool::DN ******/
		/****** md5 signature: a73021e7fbb4baaa97773a3193a4bd2d ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
A: Standard_Address
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Standard_Address A, const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****** HLRBRep_SLPropsATool::Value ******/
		/****** md5 signature: 8139ac0cd44cdaaedf457ca18eb5c577 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
A: Standard_Address
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point <P> of 	parameter <U> and <V> on the Surface <A>.
") Value;
		static void Value(const Standard_Address A, const Standard_Real U, const Standard_Real V, gp_Pnt & P);

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
		/****** md5 signature: 0a8fad3a04895602a2a2eaf90593212e ******/
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
		 HLRBRep_ShapeBounds(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const opencascade::handle<Standard_Transient> & SData, const Standard_Integer nbIso, const Standard_Integer V1, const Standard_Integer V2, const Standard_Integer E1, const Standard_Integer E2, const Standard_Integer F1, const Standard_Integer F2);

		/****** HLRBRep_ShapeBounds::HLRBRep_ShapeBounds ******/
		/****** md5 signature: 8f7396ab30415814fca95d7f235319fe ******/
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
		 HLRBRep_ShapeBounds(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const Standard_Integer nbIso, const Standard_Integer V1, const Standard_Integer V2, const Standard_Integer E1, const Standard_Integer E2, const Standard_Integer F1, const Standard_Integer F2);

		/****** HLRBRep_ShapeBounds::Bounds ******/
		/****** md5 signature: f60797aaa87b18ae8eee336740778b1b ******/
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
		/****** md5 signature: d6498e9f6e042d33d4a795499305cc6a ******/
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
		void NbOfIso(const Standard_Integer nbIso);

		/****** HLRBRep_ShapeBounds::NbOfIso ******/
		/****** md5 signature: 2501d827e295fdb15b2e4f0fdd55a1d1 ******/
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbOfIso;
		Standard_Integer NbOfIso();

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
		/****** md5 signature: 6e03d1fb636ffd96e03886872ae43cbc ******/
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
		/****** md5 signature: ad6e8ce71dff0ff74ad40c8a7677de8c ******/
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
		void Translate(const Standard_Integer NV, const Standard_Integer NE, const Standard_Integer NF);

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
		/****** md5 signature: 585d95ec184c2728ffe4987b5958a887 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: HLRTopoBRep_OutLiner
P: HLRAlgo_Projector
MST: BRepTopAdaptor_MapOfShapeTool
nbIso: int (optional, default to 0)

Return
-------
opencascade::handle<HLRBRep_Data>

Description
-----------
Creates a DataStructure containing the OutLiner <S> depending on the projector <P> and nbIso.
") Load;
		static opencascade::handle<HLRBRep_Data> Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const HLRAlgo_Projector & P, BRepTopAdaptor_MapOfShapeTool & MST, const Standard_Integer nbIso = 0);

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
		/****** md5 signature: 774f6b487a9c91f2e3802b53c6f52934 ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::BSpline ******/
		/****** md5 signature: 4695f4a3cad1aeda00bf7c7841037db8 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::BasisCurve ******/
		/****** md5 signature: 800cb1ec50ed14042ffd84fb9d7f16fe ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		static opencascade::handle<Adaptor3d_Curve> BasisCurve(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::BasisSurface ******/
		/****** md5 signature: e90675a246e7d6d61a9ca69df68a8bde ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		static opencascade::handle<Adaptor3d_Surface> BasisSurface(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::Bezier ******/
		/****** md5 signature: 1b7883c3f8ccd14ba98ea3102b92482a ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::Cone ******/
		/****** md5 signature: 9116ace92295c2b717b2e79fa73bf64b ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		static gp_Cone Cone(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::Cylinder ******/
		/****** md5 signature: 319460b2f0a60310bde48833957a0a91 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		static gp_Cylinder Cylinder(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::D0 ******/
		/****** md5 signature: 386213dc28ade2f890d2f5be1547aaa1 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
u: float
v: float
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P);

		/****** HLRBRep_SurfaceTool::D1 ******/
		/****** md5 signature: 579ba7f4726dfc0972727190519230ac ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
u: float
v: float
P: gp_Pnt
D1u: gp_Vec
D1v: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1u, gp_Vec & D1v);

		/****** HLRBRep_SurfaceTool::D2 ******/
		/****** md5 signature: 7ecbecc48d83901accd97713f8d50de3 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
u: float
v: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** HLRBRep_SurfaceTool::D3 ******/
		/****** md5 signature: 0290e8d24b84bf13182c70eca72b3a89 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
u: float
v: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** HLRBRep_SurfaceTool::DN ******/
		/****** md5 signature: b83a1f1078fa21e66749acd7ddb1bde1 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
u: float
v: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Standard_Address S, const Standard_Real u, const Standard_Real v, const Standard_Integer Nu, const Standard_Integer Nv);

		/****** HLRBRep_SurfaceTool::Direction ******/
		/****** md5 signature: 792b1b8de9ba06c93f71fd5ec6831045 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		static gp_Dir Direction(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::FirstUParameter ******/
		/****** md5 signature: 6e04b137dab4c5b166945e605ab70ea8 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") FirstUParameter;
		static Standard_Real FirstUParameter(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::FirstVParameter ******/
		/****** md5 signature: 3adaefd96854190b632c757288696f54 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") FirstVParameter;
		static Standard_Real FirstVParameter(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::GetType ******/
		/****** md5 signature: af7f71ef48b12d89bd1ccfb79f8b5cbb ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
GeomAbs_SurfaceType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_SurfaceType GetType(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::IsUClosed ******/
		/****** md5 signature: 461ae9cbf9f4af5bb9698e7d522639ac ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		static Standard_Boolean IsUClosed(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::IsUPeriodic ******/
		/****** md5 signature: 8f734a7cfb3edf22adf9628add5a5891 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		static Standard_Boolean IsUPeriodic(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::IsVClosed ******/
		/****** md5 signature: efa961c94006eb3089b0699bab1d0c1c ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		static Standard_Boolean IsVClosed(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::IsVPeriodic ******/
		/****** md5 signature: 7926aca9924f7fc7fbfcef3fe14aa396 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		static Standard_Boolean IsVPeriodic(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::LastUParameter ******/
		/****** md5 signature: f2a9f5d3250a667370bf390e6ac0c08e ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") LastUParameter;
		static Standard_Real LastUParameter(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::LastVParameter ******/
		/****** md5 signature: b8355c68406b1dfc8be1d82e8b506bec ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") LastVParameter;
		static Standard_Real LastVParameter(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: 8f1620b5617d2e63b048978c72d7fef8 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static Standard_Integer NbSamplesU(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::NbSamplesU ******/
		/****** md5 signature: 11ce3cf3e58a1ce9f9ec6bb48af96ec2 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
u1: float
u2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static Standard_Integer NbSamplesU(const Standard_Address S, const Standard_Real u1, const Standard_Real u2);

		/****** HLRBRep_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: a82f5bd7b9e757284443d92588a08924 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static Standard_Integer NbSamplesV(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::NbSamplesV ******/
		/****** md5 signature: a2089a491614488d16ab97b5e5a07e56 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
v1: float
v2: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static Standard_Integer NbSamplesV(const Standard_Address S, const Standard_Real v1, const Standard_Real v2);

		/****** HLRBRep_SurfaceTool::NbUIntervals ******/
		/****** md5 signature: 5516eb3a8f3b210cf025639c7ec2f9a2 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
Sh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbUIntervals;
		static Standard_Integer NbUIntervals(const Standard_Address S, const GeomAbs_Shape Sh);

		/****** HLRBRep_SurfaceTool::NbVIntervals ******/
		/****** md5 signature: bd96f761c6f84259778f914d3f734f6c ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
Sh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbVIntervals;
		static Standard_Integer NbVIntervals(const Standard_Address S, const GeomAbs_Shape Sh);

		/****** HLRBRep_SurfaceTool::OffsetValue ******/
		/****** md5 signature: eded75293dc119057b8f7ff6121b5261 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") OffsetValue;
		static Standard_Real OffsetValue(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::Plane ******/
		/****** md5 signature: 18aefb3d267fd8c0f21d3aa5d8154d4e ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		static gp_Pln Plane(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::Sphere ******/
		/****** md5 signature: 01a724a2628bfa4e0cc9f87eefc4d73f ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		static gp_Sphere Sphere(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::Torus ******/
		/****** md5 signature: 9f110fc52a07d36d19aefe5d2106d8fd ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		static gp_Torus Torus(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::UIntervals ******/
		/****** md5 signature: 85e0f7e1735591de2890181742678900 ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") UIntervals;
		static void UIntervals(const Standard_Address S, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****** HLRBRep_SurfaceTool::UPeriod ******/
		/****** md5 signature: 819bb74d78e04bf0ec8b085a289b4293 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") UPeriod;
		static Standard_Real UPeriod(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::UResolution ******/
		/****** md5 signature: 608a102cedd3f598f490045f31e2eff9 ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
R3d: float

Return
-------
float

Description
-----------
No available documentation.
") UResolution;
		static Standard_Real UResolution(const Standard_Address S, const Standard_Real R3d);

		/****** HLRBRep_SurfaceTool::UTrim ******/
		/****** md5 signature: 85e441d9fff0bfb7cfe199a8ef2d2aec ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") UTrim;
		static opencascade::handle<Adaptor3d_Surface> UTrim(const Standard_Address S, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** HLRBRep_SurfaceTool::VIntervals ******/
		/****** md5 signature: 349fd1650c53bee88da5eb6085891c0c ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") VIntervals;
		static void VIntervals(const Standard_Address S, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****** HLRBRep_SurfaceTool::VPeriod ******/
		/****** md5 signature: 5789ce07d40fd8fe19da4683e9309241 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address

Return
-------
float

Description
-----------
No available documentation.
") VPeriod;
		static Standard_Real VPeriod(const Standard_Address S);

		/****** HLRBRep_SurfaceTool::VResolution ******/
		/****** md5 signature: b9fa52c61fbc638529fb1c50121c1e16 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
R3d: float

Return
-------
float

Description
-----------
No available documentation.
") VResolution;
		static Standard_Real VResolution(const Standard_Address S, const Standard_Real R3d);

		/****** HLRBRep_SurfaceTool::VTrim ******/
		/****** md5 signature: 9c95e57bce1c7a7d40af515009ac46f7 ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") VTrim;
		static opencascade::handle<Adaptor3d_Surface> VTrim(const Standard_Address S, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** HLRBRep_SurfaceTool::Value ******/
		/****** md5 signature: 6dbf71d8deef85164fbe55f3e77b5728 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
u: float
v: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const Standard_Address S, const Standard_Real u, const Standard_Real v);

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
		/****** md5 signature: dddb49b0f671f145f07224822f44d8a3 ******/
		%feature("compactdefaultargs") HLRBRep_TheCSFunctionOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
C: gp_Lin

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_TheCSFunctionOfInterCSurf;
		 HLRBRep_TheCSFunctionOfInterCSurf(const Standard_Address & S, const gp_Lin & C);

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
		/****** md5 signature: 87061916fb36bcf60a62cdc5d51b199e ******/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "Return
-------
Standard_Address

Description
-----------
No available documentation.
") AuxillarSurface;
		const Standard_Address & AuxillarSurface();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
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
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** HLRBRep_TheCSFunctionOfInterCSurf::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

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
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Root;
		Standard_Real Root();

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
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
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** HLRBRep_TheCSFunctionOfInterCSurf::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
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
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend HLRBRep_TheCSFunctionOfInterCSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class HLRBRep_TheCurveLocatorOfTheProjPCurOfCInter *
*****************************************************/
/******************************************************************
* class HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter *
******************************************************************/
class HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter : public math_FunctionSetWithDerivatives {
	public:
		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter ******/
		/****** md5 signature: dc489d8fc6afb00f97e01339a44990ef ******/
		%feature("compactdefaultargs") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
curve1: Standard_Address
curve2: Standard_Address

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter(const Standard_Address & curve1, const Standard_Address & curve2);

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
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
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbEquations;
		Standard_Integer NbEquations();

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns 2.
") NbVariables;
		Standard_Integer NbVariables();

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
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
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
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
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 35027a872491f243347a98967181cab1 ******/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
W: float
F: HLRBRep_TheCSFunctionOfInterCSurf
TolTangency: float
MarginCoef: float (optional, default to 0.0)

Return
-------
None

Description
-----------
compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst).
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf(const Standard_Real U, const Standard_Real V, const Standard_Real W, const HLRBRep_TheCSFunctionOfInterCSurf & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****** HLRBRep_TheExactInterCSurf::HLRBRep_TheExactInterCSurf ******/
		/****** md5 signature: d179f3ee640105aa7eae2b41ac8aebf6 ******/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "
Parameters
----------
F: HLRBRep_TheCSFunctionOfInterCSurf
TolTangency: float

Return
-------
None

Description
-----------
initialize the parameters to compute the solution.
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf(const HLRBRep_TheCSFunctionOfInterCSurf & F, const Standard_Real TolTangency);

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
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		Standard_Boolean IsDone();

		/****** HLRBRep_TheExactInterCSurf::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** HLRBRep_TheExactInterCSurf::ParameterOnCurve ******/
		/****** md5 signature: ac81682b4b1f0988f8f73835e37144bf ******/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****** HLRBRep_TheExactInterCSurf::ParameterOnSurface ******/
		/****** md5 signature: b1ff2b42bc6096157075c8f0a6c1b6a5 ******/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_TheExactInterCSurf::Perform ******/
		/****** md5 signature: 193bc13b7dd6d13fbf6a72a44d7ddd7b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
W: float
Rsnld: math_FunctionSetRoot
u0: float
v0: float
u1: float
v1: float
w0: float
w1: float

Return
-------
None

Description
-----------
compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }.
") Perform;
		void Perform(const Standard_Real U, const Standard_Real V, const Standard_Real W, math_FunctionSetRoot & Rsnld, const Standard_Real u0, const Standard_Real v0, const Standard_Real u1, const Standard_Real v1, const Standard_Real w0, const Standard_Real w1);

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
		/****** md5 signature: c6177a09eb30648e1d6dc6a88b4c02b6 ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: 74e440ab552a6cacaa917310398ec74d ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: 98fb253d56385e056e5ba58b09255c72 ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: d7b24b192a879ef9e3731101880d3c41 ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::HLRBRep_TheIntConicCurveOfCInter ******/
		/****** md5 signature: 2fed0f0a7b09c728a424e068fe3d8d59 ******/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 256f0ab35aa34bea4dadb6bd5eb4a19c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 08d385c076b409ee44899b99b87bce65 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a line and a parametric curve.
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: adcc3156cc7d9584606acdb0e8a9fcc3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an ellipse and a parametric curve.
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 590908aa03a8133564eed84deecb5d15 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between a parabola and a parametric curve.
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: 71d5c9759e509bec96b20ad2637d7730 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between the main branch of an hyperbola and a parametric curve.
") Perform;
		void Perform(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

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
		/****** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ******/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****** HLRBRep_TheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: 75a6ce72bd7eec344eb77f6930bd4f54 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: Standard_Address
Domain1: IntRes2d_Domain
Curve2: Standard_Address
Domain2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Address & Curve1, const IntRes2d_Domain & Domain1, const Standard_Address & Curve2, const IntRes2d_Domain & Domain2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntPCurvePCurveOfCInter::Perform ******/
		/****** md5 signature: 3444554241e0391406b55fc664c16052 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve1: Standard_Address
Domain1: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Address & Curve1, const IntRes2d_Domain & Domain1, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntPCurvePCurveOfCInter::SetMinNbSamples ******/
		/****** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ******/
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
		void SetMinNbSamples(const Standard_Integer theMinNbSamples);

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
		/****** md5 signature: f49aa8c9c38c517bde626c32e17dfb4a ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const Intf_Array1OfLin & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

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
		/****** md5 signature: 938875f7c5a892c7d600c3fc19abd9fd ******/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const Intf_Array1OfLin & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

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
		/****** md5 signature: 6d6ce03fedf23875669997dba9551ac4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
None

Description
-----------
Computes an interference between the Straight Lines and the Polyhedron.
") Perform;
		void Perform(const Intf_Array1OfLin & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

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
		/****** md5 signature: 80f7c9a2729a5ff62423b11488230e9b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the Straight Lines and the Polyhedron.
") Perform;
		void Perform(const Intf_Array1OfLin & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

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
		/****** md5 signature: f63808ec2ccfe9b74a79fd5e8ffc37dc ******/
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Standard_Address
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Standard_Address & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::And_Domaine_Objet1_Intersections ******/
		/****** md5 signature: b25937465436483d60d73ecd96841b70 ******/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "
Parameters
----------
TheImpTool: IntCurve_IConicTool
TheParCurve: Standard_Address
TheImpCurveDomain: IntRes2d_Domain
TheParCurveDomain: IntRes2d_Domain
Inter2_And_Domain2: TColStd_Array1OfReal
Inter1: TColStd_Array1OfReal
Resultat1: TColStd_Array1OfReal
Resultat2: TColStd_Array1OfReal
EpsNul: float

Return
-------
NbResultats: int

Description
-----------
No available documentation.
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const Standard_Address & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const Standard_Real EpsNul);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::FindU ******/
		/****** md5 signature: 73bba458174e8964e7a800b1e6377c1f ******/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "
Parameters
----------
parameter: float
point: gp_Pnt2d
TheParCurev: Standard_Address
TheImpTool: IntCurve_IConicTool

Return
-------
float

Description
-----------
No available documentation.
") FindU;
		Standard_Real FindU(const Standard_Real parameter, gp_Pnt2d & point, const Standard_Address & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::FindV ******/
		/****** md5 signature: 0086ec5c0d8c4e05c3fa4eb9c212c651 ******/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "
Parameters
----------
parameter: float
point: gp_Pnt2d
TheImpTool: IntCurve_IConicTool
ParCurve: Standard_Address
TheParCurveDomain: IntRes2d_Domain
V0: float
V1: float
Tolerance: float

Return
-------
float

Description
-----------
No available documentation.
") FindV;
		Standard_Real FindV(const Standard_Real parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const Standard_Address & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const Standard_Real V0, const Standard_Real V1, const Standard_Real Tolerance);

		/****** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::Perform ******/
		/****** md5 signature: e3bfb0880b36035ae94fd59907a3b653 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Standard_Address
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Return
-------
None

Description
-----------
Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
") Perform;
		void Perform(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Standard_Address & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

};


%extend HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter *
****************************************************/
class HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter {
	public:
		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******/
		/****** md5 signature: ddbc566b275baafc612d96b848ef7c5f ******/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter();

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******/
		/****** md5 signature: 2404bc558ec12c49789c3598f94daa2b ******/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Standard_Address
U0: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter(const gp_Pnt2d & P, const Standard_Address & C, const Standard_Real U0, const Standard_Real TolU);

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******/
		/****** md5 signature: e0698389ad945e5cff9fe9be0284beb7 ******/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: Standard_Address
U0: float
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searches a zero near the close point. Zeros are searched between Umin and Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter(const gp_Pnt2d & P, const Standard_Address & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::Initialize ******/
		/****** md5 signature: 80847cbf9c7c914995c1b28a4117b549 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
Umin: float
Usup: float
TolU: float

Return
-------
None

Description
-----------
sets the fields of the algorithm.
") Initialize;
		void Initialize(const Standard_Address & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		Standard_Boolean IsDone();

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::IsMin ******/
		/****** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the extremum distance is a minimum.
") IsMin;
		Standard_Boolean IsMin();

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::Perform ******/
		/****** md5 signature: 572d96f228989fec803e5b8f273e32cd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
U0: float

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::Point ******/
		/****** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnCurv2d & Point();

		/****** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::SquareDistance ******/
		/****** md5 signature: 2eba58521e0603c1ef0e683534b03956 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		Standard_Real SquareDistance();

};


%extend HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter {
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
		/****** md5 signature: 758922762309bc321e3ec267e54bd834 ******/
		%feature("compactdefaultargs") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "
Parameters
----------
Curve: Standard_Address
NbPnt: int
Domain: IntRes2d_Domain
Tol: float

Return
-------
None

Description
-----------
Compute a polygon on the domain of the curve.
") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter(const Standard_Address & Curve, const Standard_Integer NbPnt, const IntRes2d_Domain & Domain, const Standard_Real Tol);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::ApproxParamOnCurve ******/
		/****** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ******/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: float

Return
-------
float

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::AutoIntersectionIsPossible ******/
		/****** md5 signature: 461afa84e474b507672077d4d358a741 ******/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::CalculRegion ******/
		/****** md5 signature: 34769b0e402ed40fc1aa75180518eb35 ******/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", "
Parameters
----------
x: float
y: float
x1: float
x2: float
y1: float
y2: float

Return
-------
int

Description
-----------
No available documentation.
") CalculRegion;
		Standard_Integer CalculRegion(const Standard_Real x, const Standard_Real y, const Standard_Real x1, const Standard_Real x2, const Standard_Real y1, const Standard_Real y2);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::Closed ******/
		/****** md5 signature: c5b0bafd47da29606481588a971270ce ******/
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
		void Closed(const Standard_Boolean clos);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::Closed ******/
		/****** md5 signature: fb3b1ea0f3831f02fc7dc8ae66caac7b ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the polyline is closed.
") Closed;
		virtual Standard_Boolean Closed();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::ComputeWithBox ******/
		/****** md5 signature: 7d618b2066ef81b993e4f38bdebc62ca ******/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "
Parameters
----------
Curve: Standard_Address
OtherBox: Bnd_Box2d

Return
-------
None

Description
-----------
The current polygon is modified if most of the points of the polygon are outside the box <OtherBox>. In this situation, bounds are computed to build a polygon inside or near the OtherBox.
") ComputeWithBox;
		void ComputeWithBox(const Standard_Address & Curve, const Bnd_Box2d & OtherBox);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::DeflectionOverEstimation ******/
		/****** md5 signature: 43f4e747867c1147de91dcc2fd648827 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

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
		/****** md5 signature: 8559659cfaf88d25c04ace5dcdcbde32 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		Standard_Real InfParameter();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::NbSegments ******/
		/****** md5 signature: 3964cbfa1f20d4814234f7fc3d204bbb ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::Segment ******/
		/****** md5 signature: 86ed8dcd5c63b8c7622186f373e5af81 ******/
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
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::SetDeflectionOverEstimation ******/
		/****** md5 signature: 310446258d4443a660c9cfe280519b05 ******/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: float

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::SupParameter ******/
		/****** md5 signature: 67f72e7357fa61911c23a764d72614ea ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
") SupParameter;
		Standard_Real SupParameter();

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
		/****** md5 signature: 79543caa66f4a2eba12772466b930f36 ******/
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
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const Standard_Integer NbPnt);

		/****** HLRBRep_ThePolygonOfInterCSurf::HLRBRep_ThePolygonOfInterCSurf ******/
		/****** md5 signature: 66656965e7c4fb784af8d64fcd3b894f ******/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", "
Parameters
----------
Curve: gp_Lin
U1: float
U2: float
NbPnt: int

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const Standard_Real U1, const Standard_Real U2, const Standard_Integer NbPnt);

		/****** HLRBRep_ThePolygonOfInterCSurf::HLRBRep_ThePolygonOfInterCSurf ******/
		/****** md5 signature: 61e91cda033e4acddf27b3672e799663 ******/
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
		/****** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ******/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: float

Return
-------
float

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****** HLRBRep_ThePolygonOfInterCSurf::BeginOfSeg ******/
		/****** md5 signature: d9c773bc099d0d92cc222653e8226d5e ******/
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
		const gp_Pnt BeginOfSeg(const Standard_Integer theIndex);

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
		/****** md5 signature: e853f3a0de69f6e7f92ebd8ac1362e0c ******/
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
		void Closed(const Standard_Boolean flag);

		/****** HLRBRep_ThePolygonOfInterCSurf::Closed ******/
		/****** md5 signature: f94551c898fe323903f1d14861bbe901 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		Standard_Boolean Closed();

		/****** HLRBRep_ThePolygonOfInterCSurf::DeflectionOverEstimation ******/
		/****** md5 signature: b4c80a54735f171bb52e56c083257109 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation();

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
		/****** md5 signature: fa65a7dd84749b3192eff93d48f5b1d6 ******/
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
		const gp_Pnt EndOfSeg(const Standard_Integer theIndex);

		/****** HLRBRep_ThePolygonOfInterCSurf::InfParameter ******/
		/****** md5 signature: f596238a0398d517210e4fad0d4b84b2 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		Standard_Real InfParameter();

		/****** HLRBRep_ThePolygonOfInterCSurf::NbSegments ******/
		/****** md5 signature: 9f8199ef0d5690074e4037e7feba62da ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		Standard_Integer NbSegments();

		/****** HLRBRep_ThePolygonOfInterCSurf::SetDeflectionOverEstimation ******/
		/****** md5 signature: 872cf63726ece2c3b812a597bb60fe29 ******/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: float

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****** HLRBRep_ThePolygonOfInterCSurf::SupParameter ******/
		/****** md5 signature: 688f110f02a5711ae550904ec8e3220d ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
") SupParameter;
		Standard_Real SupParameter();

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
		/****** md5 signature: 55407fea5ab9036d69b424d673e06dba ******/
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
		static const gp_Pnt BeginOfSeg(const HLRBRep_ThePolygonOfInterCSurf & thePolygon, const Standard_Integer Index);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::Bounding ******/
		/****** md5 signature: a65a8cfe5e008ba3c420412aea532527 ******/
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
		/****** md5 signature: 7974a746229283e640549ed6c6815362 ******/
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
		static Standard_Boolean Closed(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::DeflectionOverEstimation ******/
		/****** md5 signature: 0bf744c4fcd18221f07d9a8c4f62cb20 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Return
-------
float

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

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
		/****** md5 signature: 6f3f05b0e8fd64c1200cd86095e4a588 ******/
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
		static const gp_Pnt EndOfSeg(const HLRBRep_ThePolygonOfInterCSurf & thePolygon, const Standard_Integer Index);

		/****** HLRBRep_ThePolygonToolOfInterCSurf::NbSegments ******/
		/****** md5 signature: d176c4bd90c786c126613286e532eae4 ******/
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
		static Standard_Integer NbSegments(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

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
		/****** md5 signature: dadf7ad2951be8c787a119fcb63ae887 ******/
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
		/****** md5 signature: 5db00fc773feb22147eca6258b4688f6 ******/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
opencascade::handle<Bnd_HArray1OfBox>

Description
-----------
Give the array of boxes. The box <n> corresponding to the triangle <n>.
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::DeflectionOverEstimation ******/
		/****** md5 signature: b23e8847ee8b23843b5cb969525baf23 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
float

Description
-----------
Give the tolerance of the polygon.
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

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
		/****** md5 signature: e6fbb19517eaae68e4d1fef6004cb753 ******/
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "
Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Return
-------
float

Description
-----------
This method returns a border deflection of the polyhedron.
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::IsOnBound ******/
		/****** md5 signature: 6c53cbb5e36d22da1872bca4c23234b5 ******/
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
		static Standard_Boolean IsOnBound(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const Standard_Integer Index1, const Standard_Integer Index2);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::NbTriangles ******/
		/****** md5 signature: 8aae3d76f3218cae09710e3ea2158686 ******/
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
		static Standard_Integer NbTriangles(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::Point ******/
		/****** md5 signature: 5674891cbaca4c7ce90a78a09fc4c54a ******/
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
		static const gp_Pnt Point(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const Standard_Integer Index);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::TriConnex ******/
		/****** md5 signature: d041417e60bce37dbe8565dbf06d95a0 ******/
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
		static Standard_Integer TriConnex(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** HLRBRep_ThePolyhedronToolOfInterCSurf::Triangle ******/
		/****** md5 signature: 422f3843c714b9be42ae9a1ee9b5b2e6 ******/
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
		static void Triangle(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

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
		/****** md5 signature: ece1816b3f28762e1d44b5aa074a236b ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
Pnt: gp_Pnt2d
Tol: float

Return
-------
float

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the right parameter has to be made on the natural parametric domain of the curve.
") FindParameter;
		static Standard_Real FindParameter(const Standard_Address & C, const gp_Pnt2d & Pnt, const Standard_Real Tol);

		/****** HLRBRep_TheProjPCurOfCInter::FindParameter ******/
		/****** md5 signature: 7a692a1a974abdb0d81ce6c269a9e2dc ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
C: Standard_Address
Pnt: gp_Pnt2d
LowParameter: float
HighParameter: float
Tol: float

Return
-------
float

Description
-----------
Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondence between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in which the parameter certainly lies. These parameters are given to implement a more efficient algorithm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.
") FindParameter;
		static Standard_Real FindParameter(const Standard_Address & C, const gp_Pnt2d & Pnt, const Standard_Real LowParameter, const Standard_Real HighParameter, const Standard_Real Tol);

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
		/****** md5 signature: cbb3799ba29b24dbc7d64e6deede5e1b ******/
		%feature("compactdefaultargs") HLRBRep_TheQuadCurvExactInterCSurf;
		%feature("autodoc", "
Parameters
----------
S: Standard_Address
C: gp_Lin

Return
-------
None

Description
-----------
Provides the signed distance function: Q(w) and its first derivative dQ(w)/dw.
") HLRBRep_TheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvExactInterCSurf(const Standard_Address & S, const gp_Lin & C);

		/****** HLRBRep_TheQuadCurvExactInterCSurf::Intervals ******/
		/****** md5 signature: a19f8bd23050233003b16b9179a07a15 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: float
U2: float

Description
-----------
U1 and U2 are the parameters of a segment on the curve.
") Intervals;
		void Intervals(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** HLRBRep_TheQuadCurvExactInterCSurf::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** HLRBRep_TheQuadCurvExactInterCSurf::NbIntervals ******/
		/****** md5 signature: 64f54fde4d9752772b52d73d27261bcb ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****** HLRBRep_TheQuadCurvExactInterCSurf::NbRoots ******/
		/****** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		Standard_Integer NbRoots();

		/****** HLRBRep_TheQuadCurvExactInterCSurf::Root ******/
		/****** md5 signature: 2e5be20bda2ce764c489750fb301f80e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") Root;
		Standard_Real Root(const Standard_Integer Index);

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
		/****** md5 signature: f61c873331fa555e182f1973e95f59da ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
D: float

Description
-----------
Computes the derivative of the previous function at parameter Param. Derivative always returns True.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf::Value ******/
		/****** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float

Description
-----------
Computes the value of the signed distance between the implicit surface and the point at parameter Param on the parametrised curve. Value always returns True.
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf::Values ******/
		/****** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float
D: float

Description
-----------
Computes the value and the derivative of the function. returns True.
") Values;
		Standard_Boolean Values(const Standard_Real Param, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 1088c64383a391d12d62657d4b5eba0e ******/
		%feature("compactdefaultargs") HLRBRep_VertexList;
		%feature("autodoc", "
Parameters
----------
T: HLRBRep_EdgeInterferenceTool
I: HLRAlgo_ListIteratorOfInterferenceList

Return
-------
None

Description
-----------
No available documentation.
") HLRBRep_VertexList;
		 HLRBRep_VertexList(const HLRBRep_EdgeInterferenceTool & T, const HLRAlgo_ListIteratorOfInterferenceList & I);

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
		/****** md5 signature: 9d78e8db3d0caa05aa9a267c764c472e ******/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex is on the boundary of the edge.
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****** HLRBRep_VertexList::IsInterference ******/
		/****** md5 signature: 70cfb7482a8242c7b6f97a307bb277ee ******/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the current vertex is an interference.
") IsInterference;
		Standard_Boolean IsInterference();

		/****** HLRBRep_VertexList::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the curve is periodic.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** HLRBRep_VertexList::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when there are more vertices.
") More;
		Standard_Boolean More();

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
		/****** md5 signature: 6379c0d305ee414dfad782cb1da8368d ******/
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
		void Add(const TopoDS_Shape & S, const opencascade::handle<Standard_Transient> & SData, const Standard_Integer nbIso = 0);

		/****** HLRBRep_Algo::Add ******/
		/****** md5 signature: 77b1d033995ab33411a6e2d6d031ec01 ******/
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
		void Add(const TopoDS_Shape & S, const Standard_Integer nbIso = 0);

		/****** HLRBRep_Algo::Index ******/
		/****** md5 signature: 608bba99c3bb7818dd553bf28d6b3a79 ******/
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
		Standard_Integer Index(const TopoDS_Shape & S);

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
