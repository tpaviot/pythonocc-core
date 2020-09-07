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
%define HLRBREPDOCSTRING
"HLRBRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_hlrbrep.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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

%extend NCollection_Array1<HLRBRep_EdgeData> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(HLRBRep_Array1OfFData) NCollection_Array1<HLRBRep_FaceData>;

%extend NCollection_Array1<HLRBRep_FaceData> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
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
		/****************** MakeEdge ******************/
		/**** md5 signature: e591b23fabf95c4ab404ee0647c75a86 ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
ec: HLRBRep_Curve
U1: float
U2: float

Returns
-------
TopoDS_Edge
") MakeEdge;
		static TopoDS_Edge MakeEdge(const HLRBRep_Curve & ec, const Standard_Real U1, const Standard_Real U2);

		/****************** MakeEdge3d ******************/
		/**** md5 signature: 7c264ca0adc8ec18dc5eb00295b0e86d ****/
		%feature("compactdefaultargs") MakeEdge3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
ec: HLRBRep_Curve
U1: float
U2: float

Returns
-------
TopoDS_Edge
") MakeEdge3d;
		static TopoDS_Edge MakeEdge3d(const HLRBRep_Curve & ec, const Standard_Real U1, const Standard_Real U2);

		/****************** PolyHLRAngleAndDeflection ******************/
		/**** md5 signature: dca95dec52d4066f89646200d828aab1 ****/
		%feature("compactdefaultargs") PolyHLRAngleAndDeflection;
		%feature("autodoc", "No available documentation.

Parameters
----------
InAngl: float

Returns
-------
OutAngl: float
OutDefl: float
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
		/****************** HLRBRep_AreaLimit ******************/
		/**** md5 signature: e7be70ef1dbdd02981c8b22b0b3f35e2 ****/
		%feature("compactdefaultargs") HLRBRep_AreaLimit;
		%feature("autodoc", "The previous and next field are set to null.

Parameters
----------
V: HLRAlgo_Intersection
Boundary: bool
Interference: bool
StateBefore: TopAbs_State
StateAfter: TopAbs_State
EdgeBefore: TopAbs_State
EdgeAfter: TopAbs_State

Returns
-------
None
") HLRBRep_AreaLimit;
		 HLRBRep_AreaLimit(const HLRAlgo_Intersection & V, const Standard_Boolean Boundary, const Standard_Boolean Interference, const TopAbs_State StateBefore, const TopAbs_State StateAfter, const TopAbs_State EdgeBefore, const TopAbs_State EdgeAfter);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EdgeAfter ******************/
		/**** md5 signature: 88cd92fbcc817f50f7fc6e694262af20 ****/
		%feature("compactdefaultargs") EdgeAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
St: TopAbs_State

Returns
-------
None
") EdgeAfter;
		void EdgeAfter(const TopAbs_State St);

		/****************** EdgeAfter ******************/
		/**** md5 signature: 47462ffdaa9958f5311e9258f8fd4b44 ****/
		%feature("compactdefaultargs") EdgeAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") EdgeAfter;
		TopAbs_State EdgeAfter();

		/****************** EdgeBefore ******************/
		/**** md5 signature: 1a82e41df43ad513e1a96132bbebfb1c ****/
		%feature("compactdefaultargs") EdgeBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
St: TopAbs_State

Returns
-------
None
") EdgeBefore;
		void EdgeBefore(const TopAbs_State St);

		/****************** EdgeBefore ******************/
		/**** md5 signature: 9e2531c630fb5c3890639003c83672bd ****/
		%feature("compactdefaultargs") EdgeBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") EdgeBefore;
		TopAbs_State EdgeBefore();

		/****************** IsBoundary ******************/
		/**** md5 signature: 9d78e8db3d0caa05aa9a267c764c472e ****/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****************** IsInterference ******************/
		/**** md5 signature: 70cfb7482a8242c7b6f97a307bb277ee ****/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsInterference;
		Standard_Boolean IsInterference();

		/****************** Next ******************/
		/**** md5 signature: 5c6a3048ebd638c072893b2b352d50d3 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: HLRBRep_AreaLimit

Returns
-------
None
") Next;
		void Next(const opencascade::handle<HLRBRep_AreaLimit> & N);

		/****************** Next ******************/
		/**** md5 signature: 3064cde2810da3e71af86e964de5293c ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRBRep_AreaLimit>
") Next;
		opencascade::handle<HLRBRep_AreaLimit> Next();

		/****************** Previous ******************/
		/**** md5 signature: 1d5059203bc25bf3e14b708476316cdc ****/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: HLRBRep_AreaLimit

Returns
-------
None
") Previous;
		void Previous(const opencascade::handle<HLRBRep_AreaLimit> & P);

		/****************** Previous ******************/
		/**** md5 signature: 8c2f19257130a0ffd994bd28ba4e3ce9 ****/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRBRep_AreaLimit>
") Previous;
		opencascade::handle<HLRBRep_AreaLimit> Previous();

		/****************** StateAfter ******************/
		/**** md5 signature: 2989ad99c4f077a13dd691beb6ec97ba ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
St: TopAbs_State

Returns
-------
None
") StateAfter;
		void StateAfter(const TopAbs_State St);

		/****************** StateAfter ******************/
		/**** md5 signature: 00cc234f23b0e06606bd1ce121c9c7ae ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		/**** md5 signature: 3086b7234e843377136ff2098738261c ****/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
St: TopAbs_State

Returns
-------
None
") StateBefore;
		void StateBefore(const TopAbs_State St);

		/****************** StateBefore ******************/
		/**** md5 signature: 76fbbf983aacdcf0487328d9ca214104 ****/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

		/****************** Vertex ******************/
		/**** md5 signature: 5a55d0d2629ab986a101be038db1f931 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Intersection
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
		/****************** BSpline ******************/
		/**** md5 signature: b6873b347279da91579a1c61a74b3de0 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const BRepAdaptor_Curve & C);

		/****************** Bezier ******************/
		/**** md5 signature: 0a5d03b5ef6bf2fb813f5e3198980c26 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const BRepAdaptor_Curve & C);

		/****************** Circle ******************/
		/**** md5 signature: 0cf7c3945482c36f79dd47dd08589e1d ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
gp_Circ
") Circle;
		static gp_Circ Circle(const BRepAdaptor_Curve & C);

		/****************** Continuity ******************/
		/**** md5 signature: affea448674e0387be6c62c004be746c ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const BRepAdaptor_Curve & C);

		/****************** D0 ******************/
		/**** md5 signature: c3da18ad8945aa1fa8ebb01e7d52aec7 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 8bc93f3c1bff851324423ed02edfb3e1 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: b2ec4e844fab19ed2485d22a8745268f ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: 77f327d302e5c58bef64f7dabd80585e ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: BRepAdaptor_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const BRepAdaptor_Curve & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 894141b8c266b6c1fbfc460b3090e6da ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: BRepAdaptor_Curve
U: float
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const BRepAdaptor_Curve & C, const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 52e82e702df5ffa25cc76bc95897f00a ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const BRepAdaptor_Curve & C);

		/****************** Ellipse ******************/
		/**** md5 signature: 71a2e5fcf431d07468fd52c7359140be ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
gp_Elips
") Ellipse;
		static gp_Elips Ellipse(const BRepAdaptor_Curve & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: 1757779ac38cb6ed7a7fc48dc2248f69 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const BRepAdaptor_Curve & C);

		/****************** GetType ******************/
		/**** md5 signature: 31fa720443f4ab9e306493e70c80396d ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const BRepAdaptor_Curve & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: c3f7b506bdb7de4c10fd3fca41bd5f68 ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola(const BRepAdaptor_Curve & C);

		/****************** Intervals ******************/
		/**** md5 signature: f429463d75cd548af36c429f480bc438 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: BRepAdaptor_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const BRepAdaptor_Curve & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: d99184f67fee887517aba38b86e74693 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const BRepAdaptor_Curve & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 194751d0899ddeffcd2f9544f0fa0255 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const BRepAdaptor_Curve & C);

		/****************** IsRational ******************/
		/**** md5 signature: c9c5d0c656fb44894939b4a60c4b6249 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const BRepAdaptor_Curve & C);

		/****************** LastParameter ******************/
		/**** md5 signature: e697bafb03d659fa87fd20dbec7f562b ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const BRepAdaptor_Curve & C);

		/****************** Line ******************/
		/**** md5 signature: 2112d4fa4fd46aab85b2063d90b4cca7 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
gp_Lin
") Line;
		static gp_Lin Line(const BRepAdaptor_Curve & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: c4391d4034556532fdf723807037192a ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.

Parameters
----------
C: BRepAdaptor_Curve
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const BRepAdaptor_Curve & C, const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 8a333d639d0d4eb92125136dc3258061 ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
int
") NbKnots;
		static Standard_Integer NbKnots(const BRepAdaptor_Curve & C);

		/****************** NbPoles ******************/
		/**** md5 signature: 6d7e633819b4f814ca00223438d295c4 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
int
") NbPoles;
		static Standard_Integer NbPoles(const BRepAdaptor_Curve & C);

		/****************** NbSamples ******************/
		/**** md5 signature: 08db67dee4bca7e396222c05f7fc54e9 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const BRepAdaptor_Curve & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: fdbc46a61fb7fc963accfa5567aefdd3 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
gp_Parab
") Parabola;
		static gp_Parab Parabola(const BRepAdaptor_Curve & C);

		/****************** Period ******************/
		/**** md5 signature: 54e2bb7b341b5e9768d7e59aff136bbb ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
float
") Period;
		static Standard_Real Period(const BRepAdaptor_Curve & C);

		/****************** Poles ******************/
		/**** md5 signature: 12002c5f466ee084863dfdc9a28e4f3f ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve
T: TColgp_Array1OfPnt

Returns
-------
None
") Poles;
		static void Poles(const BRepAdaptor_Curve & C, TColgp_Array1OfPnt & T);

		/****************** PolesAndWeights ******************/
		/**** md5 signature: c103846c763c66bd878fada0e2d4bd94 ****/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: BRepAdaptor_Curve
T: TColgp_Array1OfPnt
W: TColStd_Array1OfReal

Returns
-------
None
") PolesAndWeights;
		static void PolesAndWeights(const BRepAdaptor_Curve & C, TColgp_Array1OfPnt & T, TColStd_Array1OfReal & W);

		/****************** Resolution ******************/
		/**** md5 signature: 63fc446420be2fd68699d622a91ff91b ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: BRepAdaptor_Curve
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const BRepAdaptor_Curve & C, const Standard_Real R3d);

		/****************** Value ******************/
		/**** md5 signature: 23b56266cc1e7b195b61ae726893d32f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: BRepAdaptor_Curve
U: float

Returns
-------
gp_Pnt
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
		/****************** HLRBRep_BiPnt2D ******************/
		/**** md5 signature: 5222eb713abf9c22008977029d3c38bb ****/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D();

		/****************** HLRBRep_BiPnt2D ******************/
		/**** md5 signature: 7de8d55cb4ff4b525dc93e614657e18b ****/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D(const Standard_Real x1, const Standard_Real y1, const Standard_Real x2, const Standard_Real y2, const TopoDS_Shape & S, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****************** HLRBRep_BiPnt2D ******************/
		/**** md5 signature: a614f22a1e85cb9e105bb92c0f4493b9 ****/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePoint1: gp_XY
thePoint2: gp_XY
S: TopoDS_Shape
reg1: bool
regn: bool
outl: bool
intl: bool

Returns
-------
None
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D(const gp_XY & thePoint1, const gp_XY & thePoint2, const TopoDS_Shape & S, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****************** IntLine ******************/
		/**** md5 signature: 12d7cbbfcbf9b7024b633fb2f23f4627 ****/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IntLine;
		Standard_Boolean IntLine();

		/****************** IntLine ******************/
		/**** md5 signature: db1141c08b265a5a4892f7f723f2dd5f ****/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") IntLine;
		void IntLine(const Standard_Boolean B);

		/****************** OutLine ******************/
		/**** md5 signature: 5ca0f10eca0ab31cafc651fcdd487066 ****/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine();

		/****************** OutLine ******************/
		/**** md5 signature: b1713b4ae8c761b2d01b059d873779f4 ****/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") OutLine;
		void OutLine(const Standard_Boolean B);

		/****************** P1 ******************/
		/**** md5 signature: 1b12b3d4ce274b258fc80c09f73b8981 ****/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") P1;
		const gp_Pnt2d P1();

		/****************** P2 ******************/
		/**** md5 signature: 8eaf12f14ffeaaa4e7c3dfc243123291 ****/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") P2;
		const gp_Pnt2d P2();

		/****************** Rg1Line ******************/
		/**** md5 signature: 909228d95e513182f5095879976686a6 ****/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****************** Rg1Line ******************/
		/**** md5 signature: 8664f6dc97a60a9616441f541a3d378e ****/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Rg1Line;
		void Rg1Line(const Standard_Boolean B);

		/****************** RgNLine ******************/
		/**** md5 signature: 9048b7d28453594775a66644606d3856 ****/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") RgNLine;
		Standard_Boolean RgNLine();

		/****************** RgNLine ******************/
		/**** md5 signature: 15cd72eef01a3ba9cd0d52f504140d36 ****/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") RgNLine;
		void RgNLine(const Standard_Boolean B);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shape ******************/
		/**** md5 signature: 68fa381a32d13461e712c03a43927c8b ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
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
		/****************** HLRBRep_BiPoint ******************/
		/**** md5 signature: 23f973eb3a4b8708e47e313d2a38e222 ****/
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_BiPoint;
		 HLRBRep_BiPoint();

		/****************** HLRBRep_BiPoint ******************/
		/**** md5 signature: ebcb9699c5eff50e6efc4b93c8fc33b1 ****/
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRBRep_BiPoint;
		 HLRBRep_BiPoint(const Standard_Real x1, const Standard_Real y1, const Standard_Real z1, const Standard_Real x2, const Standard_Real y2, const Standard_Real z2, const TopoDS_Shape & S, const Standard_Boolean reg1, const Standard_Boolean regn, const Standard_Boolean outl, const Standard_Boolean intl);

		/****************** IntLine ******************/
		/**** md5 signature: 12d7cbbfcbf9b7024b633fb2f23f4627 ****/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IntLine;
		Standard_Boolean IntLine();

		/****************** IntLine ******************/
		/**** md5 signature: db1141c08b265a5a4892f7f723f2dd5f ****/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") IntLine;
		void IntLine(const Standard_Boolean B);

		/****************** OutLine ******************/
		/**** md5 signature: 5ca0f10eca0ab31cafc651fcdd487066 ****/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine();

		/****************** OutLine ******************/
		/**** md5 signature: b1713b4ae8c761b2d01b059d873779f4 ****/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") OutLine;
		void OutLine(const Standard_Boolean B);

		/****************** P1 ******************/
		/**** md5 signature: 08246bf94221b70fda85865c49f42ef1 ****/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") P1;
		const gp_Pnt P1();

		/****************** P2 ******************/
		/**** md5 signature: 6202ce89be435d3c7cfefad65bb7fbca ****/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") P2;
		const gp_Pnt P2();

		/****************** Rg1Line ******************/
		/**** md5 signature: 909228d95e513182f5095879976686a6 ****/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****************** Rg1Line ******************/
		/**** md5 signature: 8664f6dc97a60a9616441f541a3d378e ****/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Rg1Line;
		void Rg1Line(const Standard_Boolean B);

		/****************** RgNLine ******************/
		/**** md5 signature: 9048b7d28453594775a66644606d3856 ****/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") RgNLine;
		Standard_Boolean RgNLine();

		/****************** RgNLine ******************/
		/**** md5 signature: 15cd72eef01a3ba9cd0d52f504140d36 ****/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") RgNLine;
		void RgNLine(const Standard_Boolean B);

		/****************** Shape ******************/
		/**** md5 signature: 1058569f5d639354fedf11e73741b7df ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shape ******************/
		/**** md5 signature: 68fa381a32d13461e712c03a43927c8b ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
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
		/****************** HLRBRep_CInter ******************/
		/**** md5 signature: e0f07d27cf95e76e27fff83d9794da53 ****/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter();

		/****************** HLRBRep_CInter ******************/
		/**** md5 signature: 8aeca064bc4aec39e268cb59eeacecf1 ****/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Self intersection of a curve.

Parameters
----------
C: Standard_Address
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		/**** md5 signature: f9d3b51e2abd4c9171599d9ca3bcc84e ****/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Self intersection of a curve with a domain.

Parameters
----------
C: Standard_Address
D: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C, const IntRes2d_Domain & D, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		/**** md5 signature: fa3264cb6400a364ff4e498fe1794e3e ****/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
C2: Standard_Address
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		/**** md5 signature: 5c301b77f7af16945f2926768b1a5bbc ****/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		/**** md5 signature: 7d3a3989b37b0e8898f57df53903be49 ****/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		/**** md5 signature: f51d407d7df0e74e810746561629d7d8 ****/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** ComputeDomain ******************/
		/**** md5 signature: 3c697f1654eff7dabc7704497c8e7b94 ****/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "Create a domain from a curve.

Parameters
----------
C1: Standard_Address
TolDomain: float

Returns
-------
IntRes2d_Domain
") ComputeDomain;
		IntRes2d_Domain ComputeDomain(const Standard_Address & C1, const Standard_Real TolDomain);

		/****************** GetMinNbSamples ******************/
		/**** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ****/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
		/**** md5 signature: e605cb2068426fb82451d7c083111eab ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 0c0100dc2c5c7f1f96c9e7224dfa0205 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
C2: Standard_Address
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & C1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 2c5742a6011dc5b9894110ef4a8eed32 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 12f47e6c03dae71785fae4255205030b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & C1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 276d1fa59419189aca1404af4f7aa0f7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
D1: IntRes2d_Domain
C2: Standard_Address
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & C1, const IntRes2d_Domain & D1, const Standard_Address & C2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: c480cebfff37e04c2c51bdf97d545474 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between 2 curves.

Parameters
----------
C1: Standard_Address
C2: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & C1, const Standard_Address & C2, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		/**** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ****/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "Set / get minimum number of points in polygon intersection.

Parameters
----------
theMinNbSamples: int

Returns
-------
None
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
		/****************** HLRBRep_CLProps ******************/
		/**** md5 signature: 399ace1f9418e160719ad20b2c45e758 ****/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "Initializes the local properties of the curve <c> the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, 2 or 3). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).

Parameters
----------
C: HLRBRep_Curve *
N: int
Resolution: float

Returns
-------
None
") HLRBRep_CLProps;
		 HLRBRep_CLProps(const HLRBRep_Curve * & C, const Standard_Integer N, const Standard_Real Resolution);

		/****************** HLRBRep_CLProps ******************/
		/**** md5 signature: b2ed732e896f384f0f2bcff0c690289d ****/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u>. all the computations done will be related to <c> and <u>.

Parameters
----------
C: HLRBRep_Curve *
U: float
N: int
Resolution: float

Returns
-------
None
") HLRBRep_CLProps;
		 HLRBRep_CLProps(const HLRBRep_Curve * & C, const Standard_Real U, const Standard_Integer N, const Standard_Real Resolution);

		/****************** HLRBRep_CLProps ******************/
		/**** md5 signature: 073bdafcef583228bb61b2f5743095fe ****/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "Same as previous constructor but here the parameter is set to the value <u> and the curve is set with setcurve. the curve can have a empty constructor all the computations done will be related to <c> and <u> when the functions 'set' will be done.

Parameters
----------
N: int
Resolution: float

Returns
-------
None
") HLRBRep_CLProps;
		 HLRBRep_CLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CentreOfCurvature ******************/
		/**** md5 signature: 626d695d5de587ba5c831f0811118d8d ****/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "Returns the centre of curvature <p>.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") CentreOfCurvature;
		void CentreOfCurvature(gp_Pnt2d & P);

		/****************** Curvature ******************/
		/**** md5 signature: 4886f38d109c8344d719e9973cfea7e1 ****/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the curvature.

Returns
-------
float
") Curvature;
		Standard_Real Curvature();

		/****************** D1 ******************/
		/**** md5 signature: 400251dec252a18ea516927809341fa7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the first derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D1;
		const gp_Vec2d D1();

		/****************** D2 ******************/
		/**** md5 signature: 14a212b020ed6e6189286e37088e41e7 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the second derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D2;
		const gp_Vec2d D2();

		/****************** D3 ******************/
		/**** md5 signature: a13380eb2e77ee845c4ad05a4d86bd7b ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the third derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D3;
		const gp_Vec2d D3();

		/****************** IsTangentDefined ******************/
		/**** md5 signature: 96b1d1e7ead0e227ec7d76f9ad798ae8 ****/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Returns true if the tangent is defined. for example, the tangent is not defined if the three first derivatives are all null.

Returns
-------
bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****************** Normal ******************/
		/**** md5 signature: 4d525a8e066324f482e1de5d65bdd7c5 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal direction <n>.

Parameters
----------
N: gp_Dir2d

Returns
-------
None
") Normal;
		void Normal(gp_Dir2d & N);

		/****************** SetCurve ******************/
		/**** md5 signature: da07409ce368cb5221f947ebff0385b2 ****/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "Initializes the local properties of the curve for the new curve.

Parameters
----------
C: HLRBRep_Curve *

Returns
-------
None
") SetCurve;
		void SetCurve(const HLRBRep_Curve * & C);

		/****************** SetParameter ******************/
		/**** md5 signature: 6d7d0a8f07175b76bb327cfdc33d2266 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Initializes the local properties of the curve for the parameter value <u>.

Parameters
----------
U: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real U);

		/****************** Tangent ******************/
		/**** md5 signature: 2adaff97f5d84c22114b84a6e5def58d ****/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Output the tangent direction <d>.

Parameters
----------
D: gp_Dir2d

Returns
-------
None
") Tangent;
		void Tangent(gp_Dir2d & D);

		/****************** Value ******************/
		/**** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt2d
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
		/****************** Continuity ******************/
		/**** md5 signature: 7f420247eac68a867f281f9781f3778d ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the order of continuity of the curve <c>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

Parameters
----------
A: HLRBRep_Curve *

Returns
-------
int
") Continuity;
		static Standard_Integer Continuity(const HLRBRep_Curve * A);

		/****************** D1 ******************/
		/**** md5 signature: 2affccc0306e8c31f3afb59ee11e39ec ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point <p> and first derivative <v1> of parameter <u> on the curve <c>.

Parameters
----------
A: HLRBRep_Curve *
U: float
P: gp_Pnt2d
V1: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const HLRBRep_Curve * A, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		/**** md5 signature: ef03d4ea0914821edca3c5a3bfb8303a ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1> and second derivative <v2> of parameter <u> on the curve <c>.

Parameters
----------
A: HLRBRep_Curve *
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const HLRBRep_Curve * A, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 26a3636f7317f599ad717fd785640591 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point <p>, the first derivative <v1>, the second derivative <v2> and third derivative <v3> of parameter <u> on the curve <c>.

Parameters
----------
A: HLRBRep_Curve *
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const HLRBRep_Curve * A, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** FirstParameter ******************/
		/**** md5 signature: 2ece17ae4157df8c8b654bc774ab4624 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter bound of the curve.

Parameters
----------
A: HLRBRep_Curve *

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const HLRBRep_Curve * A);

		/****************** LastParameter ******************/
		/**** md5 signature: fc9fe85a11bd888680272df9015993f7 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter bound of the curve. firstparameter must be less than lastparamenter.

Parameters
----------
A: HLRBRep_Curve *

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const HLRBRep_Curve * A);

		/****************** Value ******************/
		/**** md5 signature: 7f6215c66dcceff6cc4c7f2b8f016e3c ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point <p> of parameter <u> on the curve from hlrbrep <c>.

Parameters
----------
A: HLRBRep_Curve *
U: float
P: gp_Pnt2d

Returns
-------
None
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
		/****************** HLRBRep_Curve ******************/
		/**** md5 signature: c465664e10860b6d84cb352353af9061 ****/
		%feature("compactdefaultargs") HLRBRep_Curve;
		%feature("autodoc", "Creates an undefined curve.

Returns
-------
None
") HLRBRep_Curve;
		 HLRBRep_Curve();

		/****************** Circle ******************/
		/**** md5 signature: 3db788e83f60e9102eb4d18e49dde44e ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		/**** md5 signature: ad1240d56a791b18da85f7b9f3ee14ae ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the 3d curve.

Returns
-------
BRepAdaptor_Curve
") Curve;
		BRepAdaptor_Curve & Curve();

		/****************** Curve ******************/
		/**** md5 signature: ef4d9d136c06cdf0b17cfd2ce1ca5af9 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Sets the 3d curve to be projected.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Curve;
		void Curve(const TopoDS_Edge & E);

		/****************** D0 ******************/
		/**** md5 signature: c5111ce8ff4abb74b6c4ba34040c62bb ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the 3d point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D0 ******************/
		/**** md5 signature: 85d1e98e1313be6e4d71518a7016009f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: 1460fb893db73aba38f92f1893861fce ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D1 ******************/
		/**** md5 signature: 857bb09c503ab50c52904dfc4cdc1a50 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: 8574226eb2474fe793edb28b9a188341 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 30bd0f2c5f6642dfece94c3612cd0e2f ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: 0932075ca22fa86aeae3a5a4650fb0ff ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: e3276df1ce733e2c8e940db548a26d03 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: 4d2fb3c954fc20d00e7fb670cc75b8c5 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetCurve ******************/
		/**** md5 signature: 7d94e917f4c49b684e552ce75cc9abb1 ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the 3d curve.

Returns
-------
BRepAdaptor_Curve
") GetCurve;
		const BRepAdaptor_Curve & GetCurve();

		/****************** GetType ******************/
		/**** md5 signature: 6d4e6ae7972633971ba343e8afc91aa1 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: 0bf75fd35e804f23a63a4cf957882adb ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: c7a2f17df7514293a67a56baae0afb68 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knots ******************/
		/**** md5 signature: 6ec7b1cc69f6d718a60017b92f325470 ****/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "No available documentation.

Parameters
----------
kn: TColStd_Array1OfReal

Returns
-------
None
") Knots;
		void Knots(TColStd_Array1OfReal & kn);

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: 8f714dea9190d608a011f61fa588b4f4 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** Multiplicities ******************/
		/**** md5 signature: 91f16d3446296cf815739601f36e1b4f ****/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "No available documentation.

Parameters
----------
mu: TColStd_Array1OfInteger

Returns
-------
None
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & mu);

		/****************** NbIntervals ******************/
		/**** md5 signature: a9cec7e4e6cb5b355a27e6de1f3fc9d9 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the curve in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: ccda669299f8eba1ba0d3387af4c950e ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		/**** md5 signature: b95e4eaba6ed0e103a45829a8ad74d91 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Parameter2d ******************/
		/**** md5 signature: a7d193182f9115c6e67ca000faffc353 ****/
		%feature("compactdefaultargs") Parameter2d;
		%feature("autodoc", "Returns the parameter on the 2d curve from the parameter on the 3d curve.

Parameters
----------
P3d: float

Returns
-------
float
") Parameter2d;
		Standard_Real Parameter2d(const Standard_Real P3d);

		/****************** Parameter3d ******************/
		/**** md5 signature: cdd6c8e0285fa1d302b3159a50de98c8 ****/
		%feature("compactdefaultargs") Parameter3d;
		%feature("autodoc", "Returns the parameter on the 3d curve from the parameter on the 2d curve.

Parameters
----------
P2d: float

Returns
-------
float
") Parameter3d;
		Standard_Real Parameter3d(const Standard_Real P2d);

		/****************** Period ******************/
		/**** md5 signature: 0270204961d3b0052ffe029cbcdbacd9 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Poles ******************/
		/**** md5 signature: d8d43060127b6f850ce0778e9da31e11 ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "No available documentation.

Parameters
----------
TP: TColgp_Array1OfPnt2d

Returns
-------
None
") Poles;
		void Poles(TColgp_Array1OfPnt2d & TP);

		/****************** Poles ******************/
		/**** md5 signature: 0f404e0cd8b4eb95e29776c75d04fa62 ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCurve: Geom_BSplineCurve
TP: TColgp_Array1OfPnt2d

Returns
-------
None
") Poles;
		void Poles(const opencascade::handle<Geom_BSplineCurve> & aCurve, TColgp_Array1OfPnt2d & TP);

		/****************** PolesAndWeights ******************/
		/**** md5 signature: a9bec1f6251c51689ebe9180ef9b86fd ****/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "No available documentation.

Parameters
----------
TP: TColgp_Array1OfPnt2d
TW: TColStd_Array1OfReal

Returns
-------
None
") PolesAndWeights;
		void PolesAndWeights(TColgp_Array1OfPnt2d & TP, TColStd_Array1OfReal & TW);

		/****************** PolesAndWeights ******************/
		/**** md5 signature: 1ddc0ce09b4c6bb4a0ca2edd7d7f703a ****/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCurve: Geom_BSplineCurve
TP: TColgp_Array1OfPnt2d
TW: TColStd_Array1OfReal

Returns
-------
None
") PolesAndWeights;
		void PolesAndWeights(const opencascade::handle<Geom_BSplineCurve> & aCurve, TColgp_Array1OfPnt2d & TP, TColStd_Array1OfReal & TW);

		/****************** Projector ******************/
		/**** md5 signature: 410e9a0b959e6b25e2fe54ccebda5aa1 ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "No available documentation.

Parameters
----------
Proj: HLRAlgo_Projector *

Returns
-------
None
") Projector;
		void Projector(const HLRAlgo_Projector * Proj);

		/****************** Resolution ******************/
		/**** md5 signature: 955dbc498c06516d62e17e1e8d38cba7 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Tangent ******************/
		/**** md5 signature: 34a3a88b37e77805b502c5bea027e3bb ****/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "Depending on <atstart> computes the 2d point and tangent on the curve at sart (or at end). if the first derivative is null look after at start (or before at end) with the second derivative.

Parameters
----------
AtStart: bool
P: gp_Pnt2d
D: gp_Dir2d

Returns
-------
None
") Tangent;
		void Tangent(const Standard_Boolean AtStart, gp_Pnt2d & P, gp_Dir2d & D);

		/****************** Update ******************/
		/**** md5 signature: 41f3afa541b64cf099deddb1648a46f9 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update the minmax and the internal data.

Parameters
----------
TotMin: float
TotMax: float

Returns
-------
float
") Update;
		Standard_Real Update(Standard_Real TotMin[16], Standard_Real TotMax[16]);

		/****************** UpdateMinMax ******************/
		/**** md5 signature: 211e01ed8fa6b28c2271ba3f6d64c4e9 ****/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "Update the minmax returns tol for enlarge;.

Parameters
----------
TotMin: float
TotMax: float

Returns
-------
float
") UpdateMinMax;
		Standard_Real UpdateMinMax(Standard_Real TotMin[16], Standard_Real TotMax[16]);

		/****************** Value ******************/
		/**** md5 signature: 1105e8ccba0b18e6fe7169aa8e376b83 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real U);

		/****************** Value3D ******************/
		/**** md5 signature: 187ff8a66e93e16bfe9f47212c7f0d91 ****/
		%feature("compactdefaultargs") Value3D;
		%feature("autodoc", "Computes the 3d point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value3D;
		gp_Pnt Value3D(const Standard_Real U);

		/****************** Z ******************/
		/**** md5 signature: 790deef5d3b9047eae218dd2026bdbcc ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Computes the z coordinate of the point of parameter u on the curve in the viewing coordinate system.

Parameters
----------
U: float

Returns
-------
float
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
		/****************** BSpline ******************/
		/**** md5 signature: 2177fa1d8976097e3319280506b1aa04 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const Standard_Address C);

		/****************** Bezier ******************/
		/**** md5 signature: cfcba0a203d2de2d5e47740c57198852 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const Standard_Address C);

		/****************** Circle ******************/
		/**** md5 signature: 36cdd8e90aa1604a62a27eecb1bbb6c8 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const Standard_Address C);

		/****************** Continuity ******************/
		/**** md5 signature: 207911b924a3bd0bcd78d03ce40d3709 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const Standard_Address C);

		/****************** D0 ******************/
		/**** md5 signature: ba74b7e0fddaf63c3e24e1478d2cdc9f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Standard_Address
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		/**** md5 signature: e354f413deaeac2c1cb2b5b536dbc88f ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: Standard_Address
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		/**** md5 signature: 2e4aa30e98316159f06a6b20c385ffe1 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: Standard_Address
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		/**** md5 signature: 8b716517fc6e7bcd2392ce31d62f1735 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: Standard_Address
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const Standard_Address C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		/**** md5 signature: c7d96ebb86b9b90c0b816abbaf142325 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: Standard_Address
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const Standard_Address C, const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 3340ce7d9ecc95fdf0b2f3e377aa96cd ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const Standard_Address C);

		/****************** Ellipse ******************/
		/**** md5 signature: 68cae55eafb658a008939e6a3aa299ac ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const Standard_Address C);

		/****************** EpsX ******************/
		/**** md5 signature: 004527eae5d36fde4532a52d6dc913b5 ****/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
float
") EpsX;
		static Standard_Real EpsX(const Standard_Address C);

		/****************** FirstParameter ******************/
		/**** md5 signature: c378718bb40d4e7b8252a7e45c378546 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const Standard_Address C);

		/****************** GetInterval ******************/
		/**** md5 signature: a9b8a823327d4a0fa07ea3033f787c20 ****/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Output the bounds of interval of index <index> used if type == composite.

Parameters
----------
C: Standard_Address
Index: int
Tab: TColStd_Array1OfReal

Returns
-------
U1: float
U2: float
") GetInterval;
		static void GetInterval(const Standard_Address C, const Standard_Integer Index, const TColStd_Array1OfReal & Tab, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetType ******************/
		/**** md5 signature: 8b7383fa02616489c875ad03f598f733 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Standard_Address

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const Standard_Address C);

		/****************** Hyperbola ******************/
		/**** md5 signature: da632be57a5318e78f5d54bc53449506 ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Standard_Address C);

		/****************** Intervals ******************/
		/**** md5 signature: f4845d7a44f9b537c0b15d3febb0634f ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Standard_Address
T: TColStd_Array1OfReal

Returns
-------
None
") Intervals;
		static void Intervals(const Standard_Address C, TColStd_Array1OfReal & T);

		/****************** IsClosed ******************/
		/**** md5 signature: 2796a2d6021b66cbaedd1b0b2679bc7a ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const Standard_Address C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 5e784f1b227a710aae72ff0aa23cda45 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const Standard_Address C);

		/****************** LastParameter ******************/
		/**** md5 signature: 2591b07f11d11b23c8c3d864bfb25e96 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const Standard_Address C);

		/****************** Line ******************/
		/**** md5 signature: 82fe24c48846770fb82932e7b7f81980 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const Standard_Address C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 40109efd49108f15f718e2e81b5d56b1 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.

Parameters
----------
C: Standard_Address

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const Standard_Address C);

		/****************** NbSamples ******************/
		/**** md5 signature: dc471ec39b0d5e7315e53cbc91bccf0c ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const Standard_Address C, const Standard_Real U0, const Standard_Real U1);

		/****************** NbSamples ******************/
		/**** md5 signature: c727a432db531d6137f3e13ad423f60e ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const Standard_Address C);

		/****************** Parabola ******************/
		/**** md5 signature: 49af9ceba40c2767bc97ed2c78b8cd33 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const Standard_Address C);

		/****************** Period ******************/
		/**** md5 signature: c69c9ecb2f367b217305d34416f61427 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Standard_Address

Returns
-------
float
") Period;
		static Standard_Real Period(const Standard_Address C);

		/****************** Resolution ******************/
		/**** md5 signature: a1331491ee2e22f42b36979da3ae16a7 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Standard_Address
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const Standard_Address C, const Standard_Real R3d);

		/****************** TheType ******************/
		/**** md5 signature: 7d470bcc389e52b12d2d622cdcecbb3e ****/
		%feature("compactdefaultargs") TheType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Standard_Address

Returns
-------
GeomAbs_CurveType
") TheType;
		static GeomAbs_CurveType TheType(const Standard_Address C);

		/****************** Value ******************/
		/**** md5 signature: f183fb2be73075bf12de9d5d961f26ae ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Standard_Address
U: float

Returns
-------
gp_Pnt2d
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
		/****************** HLRBRep_Data ******************/
		/**** md5 signature: 6bc92c8b89d989160c8deceff29720e2 ****/
		%feature("compactdefaultargs") HLRBRep_Data;
		%feature("autodoc", "Create an empty data structure of <nv> vertices, <ne> edges and <nf> faces.

Parameters
----------
NV: int
NE: int
NF: int

Returns
-------
None
") HLRBRep_Data;
		 HLRBRep_Data(const Standard_Integer NV, const Standard_Integer NE, const Standard_Integer NF);

		/****************** AboveInterference ******************/
		/**** md5 signature: 729da64e83c2dfe8faf20cc7ce75f35d ****/
		%feature("compactdefaultargs") AboveInterference;
		%feature("autodoc", "Returns true if the rejected interference is above the face.

Returns
-------
bool
") AboveInterference;
		Standard_Boolean AboveInterference();

		/****************** Classify ******************/
		/**** md5 signature: ac770ab0ca5064b3acfa5defc06358e4 ****/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "Classification of an edge.

Parameters
----------
E: int
ED: HLRBRep_EdgeData
LevelFlag: bool
param: float

Returns
-------
Level: int
") Classify;
		TopAbs_State Classify(const Standard_Integer E, const HLRBRep_EdgeData & ED, const Standard_Boolean LevelFlag, Standard_Integer &OutValue, const Standard_Real param);

		/****************** Compare ******************/
		/**** md5 signature: 40c293b2397e78ce5f9f71ed411f8d12 ****/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Returns the state of the edge <ed> after classification.

Parameters
----------
E: int
ED: HLRBRep_EdgeData

Returns
-------
TopAbs_State
") Compare;
		TopAbs_State Compare(const Standard_Integer E, const HLRBRep_EdgeData & ED);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** EDataArray ******************/
		/**** md5 signature: 25075feea815b822c23adfa9385f5f5b ****/
		%feature("compactdefaultargs") EDataArray;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Array1OfEData
") EDataArray;
		HLRBRep_Array1OfEData & EDataArray();

		/****************** Edge ******************/
		/**** md5 signature: 76748ffd591f786c44105943fcd6acd5 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the current edge.

Returns
-------
int
") Edge;
		Standard_Integer Edge();

		/****************** EdgeMap ******************/
		/**** md5 signature: 458ef859c89a82a90fb9721a91e98744 ****/
		%feature("compactdefaultargs") EdgeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") EdgeMap;
		TopTools_IndexedMapOfShape & EdgeMap();

		/****************** EdgeOfTheHidingFace ******************/
		/**** md5 signature: 2c9a7e020c7f9b78da9f9cae94f21f47 ****/
		%feature("compactdefaultargs") EdgeOfTheHidingFace;
		%feature("autodoc", "Returns the true if the edge <ed> belongs to the hiding face.

Parameters
----------
E: int
ED: HLRBRep_EdgeData

Returns
-------
bool
") EdgeOfTheHidingFace;
		Standard_Boolean EdgeOfTheHidingFace(const Standard_Integer E, const HLRBRep_EdgeData & ED);

		/****************** EdgeState ******************/
		/**** md5 signature: 6a557e52488b6aa228d4e523d232b0f6 ****/
		%feature("compactdefaultargs") EdgeState;
		%feature("autodoc", "Returns the local 3d state of the intersection between the current edge and the current face at the <p1> and <p2> parameters.

Parameters
----------
p1: float
p2: float
stbef: TopAbs_State
staf: TopAbs_State

Returns
-------
None
") EdgeState;
		void EdgeState(const Standard_Real p1, const Standard_Real p2, TopAbs_State & stbef, TopAbs_State & staf);

		/****************** FDataArray ******************/
		/**** md5 signature: 8b996173cc67c06948a23a9f10e25897 ****/
		%feature("compactdefaultargs") FDataArray;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Array1OfFData
") FDataArray;
		HLRBRep_Array1OfFData & FDataArray();

		/****************** FaceMap ******************/
		/**** md5 signature: e9b0badc08981c32de9df95c6482080a ****/
		%feature("compactdefaultargs") FaceMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") FaceMap;
		TopTools_IndexedMapOfShape & FaceMap();

		/****************** HidingStartLevel ******************/
		/**** md5 signature: 7e3d3f3673a4248ae2f8916145e5e485 ****/
		%feature("compactdefaultargs") HidingStartLevel;
		%feature("autodoc", "Returns the number of levels of hiding face above the first point of the edge <ed>. the interferencelist is given to compute far away of the interferences and then come back.

Parameters
----------
E: int
ED: HLRBRep_EdgeData
IL: HLRAlgo_InterferenceList

Returns
-------
int
") HidingStartLevel;
		Standard_Integer HidingStartLevel(const Standard_Integer E, const HLRBRep_EdgeData & ED, const HLRAlgo_InterferenceList & IL);

		/****************** HidingTheFace ******************/
		/**** md5 signature: be771e494142bf25aecaa8cee703055c ****/
		%feature("compactdefaultargs") HidingTheFace;
		%feature("autodoc", "Returns true if the current edge to be hidden belongs to the hiding face.

Returns
-------
bool
") HidingTheFace;
		Standard_Boolean HidingTheFace();

		/****************** InitBoundSort ******************/
		/**** md5 signature: c3adf1627084ad2b75f4590dcec45b41 ****/
		%feature("compactdefaultargs") InitBoundSort;
		%feature("autodoc", "To compare with only non rejected edges.

Parameters
----------
MinMaxTot: HLRAlgo_EdgesBlock::MinMaxIndices
e1: int
e2: int

Returns
-------
None
") InitBoundSort;
		void InitBoundSort(const HLRAlgo_EdgesBlock::MinMaxIndices & MinMaxTot, const Standard_Integer e1, const Standard_Integer e2);

		/****************** InitEdge ******************/
		/**** md5 signature: e8118fa61516698f8563ec2ad6932b88 ****/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "Begin an iteration only on visible edges crossing the face number <fi>.

Parameters
----------
FI: int
MST: BRepTopAdaptor_MapOfShapeTool

Returns
-------
None
") InitEdge;
		void InitEdge(const Standard_Integer FI, BRepTopAdaptor_MapOfShapeTool & MST);

		/****************** InitInterference ******************/
		/**** md5 signature: a8142709484fb05b691d3f078c44b3e9 ****/
		%feature("compactdefaultargs") InitInterference;
		%feature("autodoc", "Intersect the current edge with the boundary of the hiding face. the interferences are given by the more, next, and value methods.

Returns
-------
None
") InitInterference;
		void InitInterference();

		/****************** Interference ******************/
		/**** md5 signature: f2ea5be2885d51223258b68485612698 ****/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Interference
") Interference;
		HLRAlgo_Interference & Interference();

		/****************** IsBadFace ******************/
		/**** md5 signature: 4b415393f709cfd363a681a8fbed1894 ****/
		%feature("compactdefaultargs") IsBadFace;
		%feature("autodoc", "Returns true if the current face is bad.

Returns
-------
bool
") IsBadFace;
		Standard_Boolean IsBadFace();

		/****************** LocalFEGeometry2D ******************/
		/**** md5 signature: c71d133254da871ffedb9630fa1f63b5 ****/
		%feature("compactdefaultargs") LocalFEGeometry2D;
		%feature("autodoc", "Returns the local description of the projection of the current fedge at parameter <param>.

Parameters
----------
FE: int
Param: float
Tg: gp_Dir2d
Nm: gp_Dir2d

Returns
-------
Cu: float
") LocalFEGeometry2D;
		void LocalFEGeometry2D(const Standard_Integer FE, const Standard_Real Param, gp_Dir2d & Tg, gp_Dir2d & Nm, Standard_Real &OutValue);

		/****************** LocalLEGeometry2D ******************/
		/**** md5 signature: 264541d78c870e607a2d2a3233d58c1e ****/
		%feature("compactdefaultargs") LocalLEGeometry2D;
		%feature("autodoc", "Returns the local description of the projection of the current ledge at parameter <param>.

Parameters
----------
Param: float
Tg: gp_Dir2d
Nm: gp_Dir2d

Returns
-------
Cu: float
") LocalLEGeometry2D;
		void LocalLEGeometry2D(const Standard_Real Param, gp_Dir2d & Tg, gp_Dir2d & Nm, Standard_Real &OutValue);

		/****************** MoreEdge ******************/
		/**** md5 signature: 809deb2c8c3dfedac2033850fc8cfdca ****/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** MoreInterference ******************/
		/**** md5 signature: 0a7175ba1cb74c0b701216179940703a ****/
		%feature("compactdefaultargs") MoreInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreInterference;
		Standard_Boolean MoreInterference();

		/****************** NbEdges ******************/
		/**** md5 signature: b4dae8fc9e9992109d200aaac9bd9ada ****/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NbFaces ******************/
		/**** md5 signature: 1f0fd1808c5306ae27c425978ee57bb5 ****/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFaces;
		Standard_Integer NbFaces();

		/****************** NbVertices ******************/
		/**** md5 signature: 435b05539d6b9d704dc04d9218f26996 ****/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** NextEdge ******************/
		/**** md5 signature: 1c83cd09f8651c493848926e55f10cf0 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
skip: bool,optional
	default value is Standard_True

Returns
-------
None
") NextEdge;
		void NextEdge(const Standard_Boolean skip = Standard_True);

		/****************** NextInterference ******************/
		/**** md5 signature: 1369cf3e07019b312a7ce479ae0dc594 ****/
		%feature("compactdefaultargs") NextInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextInterference;
		void NextInterference();

		/****************** Projector ******************/
		/**** md5 signature: d7f508ab183a1a90d9ac0ead0aeb116c ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector & Projector();

		/****************** RejectedInterference ******************/
		/**** md5 signature: 26992f35c0878dfc19b1aafa3f7d82e2 ****/
		%feature("compactdefaultargs") RejectedInterference;
		%feature("autodoc", "Returns true if the interference is rejected.

Returns
-------
bool
") RejectedInterference;
		Standard_Boolean RejectedInterference();

		/****************** SimplClassify ******************/
		/**** md5 signature: 55d1fd4787d6f9ea6b9011a26a063db8 ****/
		%feature("compactdefaultargs") SimplClassify;
		%feature("autodoc", "Simple classification of part of edge [p1, p2] returns out if at least 1 of nbp points of edge is out othewise returns in it is used to check 'suspision' hided part of edge.

Parameters
----------
E: int
ED: HLRBRep_EdgeData
Nbp: int
p1: float
p2: float

Returns
-------
TopAbs_State
") SimplClassify;
		TopAbs_State SimplClassify(const Standard_Integer E, const HLRBRep_EdgeData & ED, const Standard_Integer Nbp, const Standard_Real p1, const Standard_Real p2);

		/****************** SimpleHidingFace ******************/
		/**** md5 signature: 56d2df81b8d7270deced365aa9db2ca6 ****/
		%feature("compactdefaultargs") SimpleHidingFace;
		%feature("autodoc", "Returns true if the current hiding face is not an auto-intersected one.

Returns
-------
bool
") SimpleHidingFace;
		Standard_Boolean SimpleHidingFace();

		/****************** Tolerance ******************/
		/**** md5 signature: f92d18598761037d5d2e15a52adc608d ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Set the tolerance for the rejections during the exploration.

Parameters
----------
tol: Standard_ShortReal

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_ShortReal tol);

		/****************** Tolerance ******************/
		/**** md5 signature: 680c1c68cea56ee6a9513e808e1d379c ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance for the rejections during the exploration.

Returns
-------
Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance();

		/****************** Update ******************/
		/**** md5 signature: d7a49bc87b072ee91bdb1d6dfd85432d ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "End of building of the data and updating all the informations linked to the projection.

Parameters
----------
P: HLRAlgo_Projector

Returns
-------
None
") Update;
		void Update(const HLRAlgo_Projector & P);

		/****************** Write ******************/
		/**** md5 signature: 6d1eb43f63124ce2993d9046adad8ea0 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Write <ds> in me with a translation of <dv>,<de>,<df>.

Parameters
----------
DS: HLRBRep_Data
dv: int
de: int
df: int

Returns
-------
None
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
		/****************** HLRBRep_EdgeBuilder ******************/
		/**** md5 signature: 9a90ccef178041752c05e72c933c614b ****/
		%feature("compactdefaultargs") HLRBRep_EdgeBuilder;
		%feature("autodoc", "Creates an edgebuilder algorithm. <vlist> describes the edge and the interferences. arealimits are created from the vertices. builds(in) is automatically called.

Parameters
----------
VList: HLRBRep_VertexList

Returns
-------
None
") HLRBRep_EdgeBuilder;
		 HLRBRep_EdgeBuilder(HLRBRep_VertexList & VList);

		/****************** AreaEdgeState ******************/
		/**** md5 signature: 57c8af2e06a14365566f4acef5918f24 ****/
		%feature("compactdefaultargs") AreaEdgeState;
		%feature("autodoc", "Returns the edge state of the current area.

Returns
-------
TopAbs_State
") AreaEdgeState;
		TopAbs_State AreaEdgeState();

		/****************** AreaState ******************/
		/**** md5 signature: d1173dc5785d29edd40e7b8ac5ba3679 ****/
		%feature("compactdefaultargs") AreaState;
		%feature("autodoc", "Returns the state of the current area.

Returns
-------
TopAbs_State
") AreaState;
		TopAbs_State AreaState();

		/****************** Builds ******************/
		/**** md5 signature: 4bcb635d97adc490d1fd8a8a20034a61 ****/
		%feature("compactdefaultargs") Builds;
		%feature("autodoc", "Reinitialize the results iteration to the parts with state <tobuild>. if this method is not called after construction the default is <tobuild> = in.

Parameters
----------
ToBuild: TopAbs_State

Returns
-------
None
") Builds;
		void Builds(const TopAbs_State ToBuild);

		/****************** Current ******************/
		/**** md5 signature: 0e36ea5e4e93af9d6e97cff42aa74163 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current vertex of the current edge.

Returns
-------
HLRAlgo_Intersection
") Current;
		const HLRAlgo_Intersection & Current();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** HasArea ******************/
		/**** md5 signature: da4382613fc0ffeaa5e3c26fd20f2488 ****/
		%feature("compactdefaultargs") HasArea;
		%feature("autodoc", "Returns true if there is a current area.

Returns
-------
bool
") HasArea;
		Standard_Boolean HasArea();

		/****************** InitAreas ******************/
		/**** md5 signature: 884f1ed2c596da582272e700f151d788 ****/
		%feature("compactdefaultargs") InitAreas;
		%feature("autodoc", "Initialize an iteration on the areas.

Returns
-------
None
") InitAreas;
		void InitAreas();

		/****************** IsBoundary ******************/
		/**** md5 signature: 9d78e8db3d0caa05aa9a267c764c472e ****/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Returns true if the current vertex comes from the boundary of the edge.

Returns
-------
bool
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****************** IsInterference ******************/
		/**** md5 signature: 70cfb7482a8242c7b6f97a307bb277ee ****/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Returns true if the current vertex was an interference.

Returns
-------
bool
") IsInterference;
		Standard_Boolean IsInterference();

		/****************** LeftLimit ******************/
		/**** md5 signature: dc7583eed3b1b2955e4155e3706d2cba ****/
		%feature("compactdefaultargs") LeftLimit;
		%feature("autodoc", "Returns the arealimit beginning the current area. this is a null handle when the area is infinite on the left.

Returns
-------
opencascade::handle<HLRBRep_AreaLimit>
") LeftLimit;
		opencascade::handle<HLRBRep_AreaLimit> LeftLimit();

		/****************** MoreEdges ******************/
		/**** md5 signature: ae9c44c48922d7def77564a0d6f2c592 ****/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Returns true if there are more new edges to build.

Returns
-------
bool
") MoreEdges;
		Standard_Boolean MoreEdges();

		/****************** MoreVertices ******************/
		/**** md5 signature: 30eb28ce85d2d60a20b0a6612625139c ****/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "True if there are more vertices in the current new edge.

Returns
-------
bool
") MoreVertices;
		Standard_Boolean MoreVertices();

		/****************** NextArea ******************/
		/**** md5 signature: f05125373cb5bdf4fd14c1f424e6a6c9 ****/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "Set the current area to the next area.

Returns
-------
None
") NextArea;
		void NextArea();

		/****************** NextEdge ******************/
		/**** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Proceeds to the next edge to build. skip all remaining vertices on the current edge.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** NextVertex ******************/
		/**** md5 signature: c800122ce4f2c3bd5f52dba7f14e300c ****/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Proceeds to the next vertex of the current edge.

Returns
-------
None
") NextVertex;
		void NextVertex();

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the new orientation of the current vertex.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** PreviousArea ******************/
		/**** md5 signature: f02f42f01273662174ef0f554b9a1381 ****/
		%feature("compactdefaultargs") PreviousArea;
		%feature("autodoc", "Set the current area to the previous area.

Returns
-------
None
") PreviousArea;
		void PreviousArea();

		/****************** RightLimit ******************/
		/**** md5 signature: ccd3836bfb7c8abb20422c76df4ce86b ****/
		%feature("compactdefaultargs") RightLimit;
		%feature("autodoc", "Returns the arealimit ending the current area. this is a null handle when the area is infinite on the right.

Returns
-------
opencascade::handle<HLRBRep_AreaLimit>
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
		/****************** HLRBRep_EdgeData ******************/
		/**** md5 signature: 52972d50f33ee119b5b220b1a28e2de6 ****/
		%feature("compactdefaultargs") HLRBRep_EdgeData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_EdgeData;
		 HLRBRep_EdgeData();

		/****************** AutoIntersectionDone ******************/
		/**** md5 signature: f3b63fa47326396193c02b762d672dde ****/
		%feature("compactdefaultargs") AutoIntersectionDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AutoIntersectionDone;
		Standard_Boolean AutoIntersectionDone();

		/****************** AutoIntersectionDone ******************/
		/**** md5 signature: 983422aefd23fcb828c6a2a3715aa232 ****/
		%feature("compactdefaultargs") AutoIntersectionDone;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") AutoIntersectionDone;
		void AutoIntersectionDone(const Standard_Boolean B);

		/****************** ChangeGeometry ******************/
		/**** md5 signature: 03555c45150a77119c9d706a589819de ****/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Curve
") ChangeGeometry;
		HLRBRep_Curve & ChangeGeometry();

		/****************** Curve ******************/
		/**** md5 signature: 3d2c0bba3adc9b188e9b5d7d9b519bde ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Curve *
") Curve;
		HLRBRep_Curve * Curve();

		/****************** CutAtEnd ******************/
		/**** md5 signature: 01fb1e4591022d7397a616fbc41983e3 ****/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CutAtEnd;
		Standard_Boolean CutAtEnd();

		/****************** CutAtEnd ******************/
		/**** md5 signature: ad7dfc598a1f3af53e2a4329d7551916 ****/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") CutAtEnd;
		void CutAtEnd(const Standard_Boolean B);

		/****************** CutAtSta ******************/
		/**** md5 signature: 08af25db18add68ea7c756f2a4889334 ****/
		%feature("compactdefaultargs") CutAtSta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CutAtSta;
		Standard_Boolean CutAtSta();

		/****************** CutAtSta ******************/
		/**** md5 signature: 0cb5af0afa1d0e214f74b38d955b6cf2 ****/
		%feature("compactdefaultargs") CutAtSta;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") CutAtSta;
		void CutAtSta(const Standard_Boolean B);

		/****************** Geometry ******************/
		/**** md5 signature: 6133351b8e570d82263ecdcf25097ced ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Curve
") Geometry;
		const HLRBRep_Curve & Geometry();

		/****************** HideCount ******************/
		/**** md5 signature: 38d1acd9954e54785f99bc88211278f2 ****/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") HideCount;
		Standard_Integer HideCount();

		/****************** HideCount ******************/
		/**** md5 signature: 10b94c2844285945763db1acb5c34ecb ****/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") HideCount;
		void HideCount(const Standard_Integer I);

		/****************** MinMax ******************/
		/**** md5 signature: b360e6f636632e8d4f24d53763098bae ****/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgesBlock::MinMaxIndices
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****************** OutLVEnd ******************/
		/**** md5 signature: 25dcc2869b7e32596c628d2dd9a037d3 ****/
		%feature("compactdefaultargs") OutLVEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLVEnd;
		Standard_Boolean OutLVEnd();

		/****************** OutLVEnd ******************/
		/**** md5 signature: f9e97e67d8fcfbd2864a843ec906e0c5 ****/
		%feature("compactdefaultargs") OutLVEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") OutLVEnd;
		void OutLVEnd(const Standard_Boolean B);

		/****************** OutLVSta ******************/
		/**** md5 signature: c1e726b151115aed2df3b99b1cb0ea82 ****/
		%feature("compactdefaultargs") OutLVSta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLVSta;
		Standard_Boolean OutLVSta();

		/****************** OutLVSta ******************/
		/**** md5 signature: 55b55bb6eea705979c3df5f974212b61 ****/
		%feature("compactdefaultargs") OutLVSta;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") OutLVSta;
		void OutLVSta(const Standard_Boolean B);

		/****************** Rg1Line ******************/
		/**** md5 signature: e4a654ff2c0c228277da43801fa86146 ****/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****************** Rg1Line ******************/
		/**** md5 signature: 600e0f21d82c218c81d037c3147d4d93 ****/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Rg1Line;
		void Rg1Line(const Standard_Boolean B);

		/****************** RgNLine ******************/
		/**** md5 signature: 9e05bc90bec583cf5ccc9b3bd0b8a5bd ****/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") RgNLine;
		Standard_Boolean RgNLine();

		/****************** RgNLine ******************/
		/**** md5 signature: 08a14a9a85e3a29ae0482f1db7c2399c ****/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") RgNLine;
		void RgNLine(const Standard_Boolean B);

		/****************** Selected ******************/
		/**** md5 signature: 5d74076148a32a2f44281b7de1236633 ****/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Selected;
		Standard_Boolean Selected();

		/****************** Selected ******************/
		/**** md5 signature: 8ff2b8ca05e344d8592cece668b6c014 ****/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Selected;
		void Selected(const Standard_Boolean B);

		/****************** Set ******************/
		/**** md5 signature: 13485fc18eb4756f48ed929755f9053b ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

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
TolStart: Standard_ShortReal
End: float
TolEnd: Standard_ShortReal

Returns
-------
None
") Set;
		void Set(const Standard_Boolean Reg1, const Standard_Boolean RegN, const TopoDS_Edge & EG, const Standard_Integer V1, const Standard_Integer V2, const Standard_Boolean Out1, const Standard_Boolean Out2, const Standard_Boolean Cut1, const Standard_Boolean Cut2, const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd);

		/****************** Simple ******************/
		/**** md5 signature: a0bb1fd543e316c4cc1710184f1b8b69 ****/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Simple;
		Standard_Boolean Simple();

		/****************** Simple ******************/
		/**** md5 signature: d6f2f4300dde7ef65d46e0f966abe7b2 ****/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Simple;
		void Simple(const Standard_Boolean B);

		/****************** Status ******************/
		/**** md5 signature: ea65a70412c80527ab2445f2a836ebe7 ****/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgeStatus
") Status;
		HLRAlgo_EdgeStatus & Status();

		/****************** Tolerance ******************/
		/**** md5 signature: 680c1c68cea56ee6a9513e808e1d379c ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance();

		/****************** UpdateMinMax ******************/
		/**** md5 signature: c563cf49ef5528b88530ee707872c5e6 ****/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTotMinMax: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
None
") UpdateMinMax;
		void UpdateMinMax(const HLRAlgo_EdgesBlock::MinMaxIndices & theTotMinMax);

		/****************** Used ******************/
		/**** md5 signature: 1e74809d0229afc91578e082dbdc4788 ****/
		%feature("compactdefaultargs") Used;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Used;
		Standard_Boolean Used();

		/****************** Used ******************/
		/**** md5 signature: ab1dc51c46a3b5e205a3d680426cbea5 ****/
		%feature("compactdefaultargs") Used;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Used;
		void Used(const Standard_Boolean B);

		/****************** VEnd ******************/
		/**** md5 signature: c441f0596bebb8c97af23b402ad564c9 ****/
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VEnd;
		Standard_Integer VEnd();

		/****************** VEnd ******************/
		/**** md5 signature: 9f6e9fea4e6eb67f667157819f9211bc ****/
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") VEnd;
		void VEnd(const Standard_Integer I);

		/****************** VSta ******************/
		/**** md5 signature: 4f139b76a77eb5b8c271c1fa4725ee96 ****/
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VSta;
		Standard_Integer VSta();

		/****************** VSta ******************/
		/**** md5 signature: 0fafdd1618cb7a0b9a19e6922ae939df ****/
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") VSta;
		void VSta(const Standard_Integer I);

		/****************** VerAtEnd ******************/
		/**** md5 signature: e6ba410a364ed56d113dbb098a9c7afd ****/
		%feature("compactdefaultargs") VerAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") VerAtEnd;
		Standard_Boolean VerAtEnd();

		/****************** VerAtEnd ******************/
		/**** md5 signature: a570001d4af2dd002ea14ac3b8382d77 ****/
		%feature("compactdefaultargs") VerAtEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") VerAtEnd;
		void VerAtEnd(const Standard_Boolean B);

		/****************** VerAtSta ******************/
		/**** md5 signature: 0779bfe8c583daa1b143a492052ce152 ****/
		%feature("compactdefaultargs") VerAtSta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") VerAtSta;
		Standard_Boolean VerAtSta();

		/****************** VerAtSta ******************/
		/**** md5 signature: 6ba93591d3e77c7fb2aa0c129368d9f5 ****/
		%feature("compactdefaultargs") VerAtSta;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") VerAtSta;
		void VerAtSta(const Standard_Boolean B);

		/****************** Vertical ******************/
		/**** md5 signature: ccf91eafdf77a07d66f4f7dcebc1b226 ****/
		%feature("compactdefaultargs") Vertical;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Vertical;
		Standard_Boolean Vertical();

		/****************** Vertical ******************/
		/**** md5 signature: 2a7d04df2946980475f98e3c45fcfb5b ****/
		%feature("compactdefaultargs") Vertical;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
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
		/****************** CurvatureValue ******************/
		/**** md5 signature: 2b5097b769ed2d6e0c11c0c1c9e80336 ****/
		%feature("compactdefaultargs") CurvatureValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: Standard_Address
U: float
V: float
Tg: gp_Dir

Returns
-------
float
") CurvatureValue;
		static Standard_Real CurvatureValue(const Standard_Address F, const Standard_Real U, const Standard_Real V, const gp_Dir & Tg);

		/****************** UVPoint ******************/
		/**** md5 signature: 23f4c3826da4b29b41c138f0bcf3a0a2 ****/
		%feature("compactdefaultargs") UVPoint;
		%feature("autodoc", "Return true if u and v are found.

Parameters
----------
Par: float
E: Standard_Address
F: Standard_Address

Returns
-------
U: float
V: float
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
		/****************** AddInterference ******************/
		/**** md5 signature: e1f0e33bc46e72a3beaf2bdbb9f48e3f ****/
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "Add the interference <i> to the list <il>.

Parameters
----------
IL: HLRAlgo_InterferenceList
I: HLRAlgo_Interference
T: HLRBRep_EdgeInterferenceTool

Returns
-------
None
") AddInterference;
		static void AddInterference(HLRAlgo_InterferenceList & IL, const HLRAlgo_Interference & I, const HLRBRep_EdgeInterferenceTool & T);

		/****************** ProcessComplex ******************/
		/**** md5 signature: fb997f1670d30d67dd5593d4670f9b69 ****/
		%feature("compactdefaultargs") ProcessComplex;
		%feature("autodoc", "Process complex transitions on the list il.

Parameters
----------
IL: HLRAlgo_InterferenceList
T: HLRBRep_EdgeInterferenceTool

Returns
-------
None
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
		/****************** HLRBRep_EdgeInterferenceTool ******************/
		/**** md5 signature: 19c0817432716e62e0396a441d2ed010 ****/
		%feature("compactdefaultargs") HLRBRep_EdgeInterferenceTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: HLRBRep_Data

Returns
-------
None
") HLRBRep_EdgeInterferenceTool;
		 HLRBRep_EdgeInterferenceTool(const opencascade::handle<HLRBRep_Data> & DS);

		/****************** CurrentOrientation ******************/
		/**** md5 signature: fb7e3ef23411454b6bebf24647845fa3 ****/
		%feature("compactdefaultargs") CurrentOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") CurrentOrientation;
		TopAbs_Orientation CurrentOrientation();

		/****************** CurrentParameter ******************/
		/**** md5 signature: ab21fd9f12a344c39577c17eb014cdfa ****/
		%feature("compactdefaultargs") CurrentParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") CurrentParameter;
		Standard_Real CurrentParameter();

		/****************** CurrentVertex ******************/
		/**** md5 signature: adc69eba4081a42553cc0035dbebe4fc ****/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Intersection
") CurrentVertex;
		const HLRAlgo_Intersection & CurrentVertex();

		/****************** EdgeGeometry ******************/
		/**** md5 signature: c8f1cf53cd7649a821733f928fc566a1 ****/
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", "Returns local geometric description of the edge at parameter <para>. see method reset of class edgefacetransition from topcnx for other arguments.

Parameters
----------
Param: float
Tgt: gp_Dir
Nrm: gp_Dir

Returns
-------
Curv: float
") EdgeGeometry;
		void EdgeGeometry(const Standard_Real Param, gp_Dir & Tgt, gp_Dir & Nrm, Standard_Real &OutValue);

		/****************** InitVertices ******************/
		/**** md5 signature: caeaea3f9845f6c8a1c237f8f1908aa4 ****/
		%feature("compactdefaultargs") InitVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertices;
		void InitVertices();

		/****************** InterferenceBoundaryGeometry ******************/
		/**** md5 signature: 9084fbcedf4e8429930e7c969f91301c ****/
		%feature("compactdefaultargs") InterferenceBoundaryGeometry;
		%feature("autodoc", "Returns the geometry of the boundary at the interference <i>. see the addinterference method of the class edgefacetransition from topcnx for the other arguments.

Parameters
----------
I: HLRAlgo_Interference
Tang: gp_Dir
Norm: gp_Dir

Returns
-------
Curv: float
") InterferenceBoundaryGeometry;
		void InterferenceBoundaryGeometry(const HLRAlgo_Interference & I, gp_Dir & Tang, gp_Dir & Norm, Standard_Real &OutValue);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LoadEdge ******************/
		/**** md5 signature: ed3f5a569bfc70a9fa74a468cb585b05 ****/
		%feature("compactdefaultargs") LoadEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LoadEdge;
		void LoadEdge();

		/****************** MoreVertices ******************/
		/**** md5 signature: 30eb28ce85d2d60a20b0a6612625139c ****/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertices;
		Standard_Boolean MoreVertices();

		/****************** NextVertex ******************/
		/**** md5 signature: c800122ce4f2c3bd5f52dba7f14e300c ****/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		void NextVertex();

		/****************** ParameterOfInterference ******************/
		/**** md5 signature: 6eb987a2f2a6305e8405661daecd856d ****/
		%feature("compactdefaultargs") ParameterOfInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: HLRAlgo_Interference

Returns
-------
float
") ParameterOfInterference;
		Standard_Real ParameterOfInterference(const HLRAlgo_Interference & I);

		/****************** SameInterferences ******************/
		/**** md5 signature: 86d65de3c8387af864376688859f880f ****/
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", "True if the two interferences are on the same geometric locus.

Parameters
----------
I1: HLRAlgo_Interference
I2: HLRAlgo_Interference

Returns
-------
bool
") SameInterferences;
		Standard_Boolean SameInterferences(const HLRAlgo_Interference & I1, const HLRAlgo_Interference & I2);

		/****************** SameVertexAndInterference ******************/
		/**** md5 signature: aad472927c83f790d0d28912a327e01e ****/
		%feature("compactdefaultargs") SameVertexAndInterference;
		%feature("autodoc", "True if the interference and the current vertex are on the same geometric locus.

Parameters
----------
I: HLRAlgo_Interference

Returns
-------
bool
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
		/****************** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter ******************/
		/**** md5 signature: 8d9dadc5fc5f0348b08718fcf1dde2d6 ****/
		%feature("compactdefaultargs") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C1: Standard_Address
C2: Standard_Address
Tol: float

Returns
-------
None
") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter(const Standard_Address & C1, const Standard_Address & C2, const Standard_Real Tol);

		/****************** AnErrorOccurred ******************/
		/**** md5 signature: 7f72d28f1d64c3e0ff5b578209701958 ****/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred();

		/****************** NbRoots ******************/
		/**** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ****/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Perform ******************/
		/**** md5 signature: f14997063acb35eeaf788acb1802c2a7 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Poly1: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter
Poly2: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter

Returns
-------
NumSegOn1: int
NumSegOn2: int
ParamOnSeg1: float
ParamOnSeg2: float
") Perform;
		void Perform(const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly1, const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly2, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 95ca10966a8387b775958da0f1189e3d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Uo: float
Vo: float
UInf: float
VInf: float
USup: float
VSup: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real Uo, const Standard_Real Vo, const Standard_Real UInf, const Standard_Real VInf, const Standard_Real USup, const Standard_Real VSup);

		/****************** Roots ******************/
		/**** md5 signature: 8d4622811e04b4565f31efccbad15fef ****/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
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
		/****************** HLRBRep_FaceData ******************/
		/**** md5 signature: ffa82d6b8a494ac6bb29c2b5876435ad ****/
		%feature("compactdefaultargs") HLRBRep_FaceData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_FaceData;
		 HLRBRep_FaceData();

		/****************** Back ******************/
		/**** md5 signature: cd9372718c7f8bdc9fcd8201e2f9203f ****/
		%feature("compactdefaultargs") Back;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Back;
		Standard_Boolean Back();

		/****************** Back ******************/
		/**** md5 signature: d047173ad5f3864fbb2d5299bb8c6b95 ****/
		%feature("compactdefaultargs") Back;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Back;
		void Back(const Standard_Boolean B);

		/****************** Closed ******************/
		/**** md5 signature: 6964da666f9b5a80bedb32cfb1fdc0ba ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
		/**** md5 signature: 94c08de7f5f8128010d9976e15db8efd ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Closed;
		void Closed(const Standard_Boolean B);

		/****************** Cone ******************/
		/**** md5 signature: 81a444014a717545dd6a66b8774ccde3 ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Cone;
		Standard_Boolean Cone();

		/****************** Cone ******************/
		/**** md5 signature: eb710dad0aa3f142d633badb48a91b90 ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Cone;
		void Cone(const Standard_Boolean B);

		/****************** Cut ******************/
		/**** md5 signature: 69240458c77b35230fafc7c3af224c24 ****/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Cut;
		Standard_Boolean Cut();

		/****************** Cut ******************/
		/**** md5 signature: fccdba7023ae16bcdab358aa191780d5 ****/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Cut;
		void Cut(const Standard_Boolean B);

		/****************** Cylinder ******************/
		/**** md5 signature: f51a27d8676ee0e7ea069c4ce457cdc7 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Cylinder;
		Standard_Boolean Cylinder();

		/****************** Cylinder ******************/
		/**** md5 signature: 9d3a99bf7be96c92b5b1a8ceb92e5f9b ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Cylinder;
		void Cylinder(const Standard_Boolean B);

		/****************** Geometry ******************/
		/**** md5 signature: e80782a494064d296da9e48aa7b2075d ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Surface
") Geometry;
		HLRBRep_Surface & Geometry();

		/****************** Hiding ******************/
		/**** md5 signature: bc42207e7cb8f65a46eef744c498e613 ****/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Hiding;
		Standard_Boolean Hiding();

		/****************** Hiding ******************/
		/**** md5 signature: 40db543b0765548de774883363c55a4b ****/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Hiding;
		void Hiding(const Standard_Boolean B);

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Orientation ******************/
		/**** md5 signature: 21772d27fe13757c215d17da49a64c59 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(const TopAbs_Orientation O);

		/****************** Plane ******************/
		/**** md5 signature: f121aaa25d867da488b72c7fc2c26685 ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Plane;
		Standard_Boolean Plane();

		/****************** Plane ******************/
		/**** md5 signature: d2ffd027ae5f6a63ed8ea028fb27552b ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Plane;
		void Plane(const Standard_Boolean B);

		/****************** Selected ******************/
		/**** md5 signature: 5d74076148a32a2f44281b7de1236633 ****/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Selected;
		Standard_Boolean Selected();

		/****************** Selected ******************/
		/**** md5 signature: 8ff2b8ca05e344d8592cece668b6c014 ****/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Selected;
		void Selected(const Standard_Boolean B);

		/****************** Set ******************/
		/**** md5 signature: 95a5cb236d441a5c67c18ce538f1e613 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "<or> is the orientation of the face. <cl> is true if the face belongs to a closed volume. <nw> is the number of wires ( or block of edges ) of the face.

Parameters
----------
FG: TopoDS_Face
Or: TopAbs_Orientation
Cl: bool
NW: int

Returns
-------
None
") Set;
		void Set(const TopoDS_Face & FG, const TopAbs_Orientation Or, const Standard_Boolean Cl, const Standard_Integer NW);

		/****************** SetWEdge ******************/
		/**** md5 signature: d997dc34d3c54823fc5ab479d80f2e18 ****/
		%feature("compactdefaultargs") SetWEdge;
		%feature("autodoc", "Set the edge number <ewi> of the wire <wi>.

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

Returns
-------
None
") SetWEdge;
		void SetWEdge(const Standard_Integer WI, const Standard_Integer EWI, const Standard_Integer EI, const TopAbs_Orientation Or, const Standard_Boolean OutL, const Standard_Boolean Inte, const Standard_Boolean Dble, const Standard_Boolean IsoL);

		/****************** SetWire ******************/
		/**** md5 signature: 4a402606b93cd1bc65832d196131e55d ****/
		%feature("compactdefaultargs") SetWire;
		%feature("autodoc", "Set <ne> the number of edges of the wire number <wi>.

Parameters
----------
WI: int
NE: int

Returns
-------
None
") SetWire;
		void SetWire(const Standard_Integer WI, const Standard_Integer NE);

		/****************** Side ******************/
		/**** md5 signature: b051c6b7c64d27374782556662de25d5 ****/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Side;
		Standard_Boolean Side();

		/****************** Side ******************/
		/**** md5 signature: 99f9b3fb171c48f2f127cc8f20d48780 ****/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Side;
		void Side(const Standard_Boolean B);

		/****************** Simple ******************/
		/**** md5 signature: a0bb1fd543e316c4cc1710184f1b8b69 ****/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Simple;
		Standard_Boolean Simple();

		/****************** Simple ******************/
		/**** md5 signature: d6f2f4300dde7ef65d46e0f966abe7b2 ****/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Simple;
		void Simple(const Standard_Boolean B);

		/****************** Size ******************/
		/**** md5 signature: a8e9905382c3964d697ee929ccdb9562 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Size;
		Standard_Real Size();

		/****************** Size ******************/
		/**** md5 signature: caa33fcc13a2ff9ea4a95ab2ce3d5924 ****/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: float

Returns
-------
None
") Size;
		void Size(const Standard_Real S);

		/****************** Sphere ******************/
		/**** md5 signature: 3ffe70065a3d00e08533c52a615de711 ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Sphere;
		Standard_Boolean Sphere();

		/****************** Sphere ******************/
		/**** md5 signature: f5e128a267ad828a88fd680ee392c612 ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Sphere;
		void Sphere(const Standard_Boolean B);

		/****************** Tolerance ******************/
		/**** md5 signature: 680c1c68cea56ee6a9513e808e1d379c ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance();

		/****************** Torus ******************/
		/**** md5 signature: ce39c659a55decd69a2cee5678fbab44 ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Torus;
		Standard_Boolean Torus();

		/****************** Torus ******************/
		/**** md5 signature: 8e204a2bf186d8b8721f25f21de2b201 ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Torus;
		void Torus(const Standard_Boolean B);

		/****************** Wires ******************/
		/**** md5 signature: 5da1d69c9cd7d2017555f94806dbc1a7 ****/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRAlgo_WiresBlock>
") Wires;
		opencascade::handle<HLRAlgo_WiresBlock> & Wires();

		/****************** WithOutL ******************/
		/**** md5 signature: 3c66a94b1c7ee08e6b8a2fa066cc44d8 ****/
		%feature("compactdefaultargs") WithOutL;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") WithOutL;
		Standard_Boolean WithOutL();

		/****************** WithOutL ******************/
		/**** md5 signature: ffb82d26c98b8aa27e9d131d2c49546a ****/
		%feature("compactdefaultargs") WithOutL;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
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
		/****************** HLRBRep_FaceIterator ******************/
		/**** md5 signature: 5453faf27124e716f1a3220d72f7f270 ****/
		%feature("compactdefaultargs") HLRBRep_FaceIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_FaceIterator;
		 HLRBRep_FaceIterator();

		/****************** BeginningOfWire ******************/
		/**** md5 signature: 08a80bf9673a0bb64c5402cb4f9c7371 ****/
		%feature("compactdefaultargs") BeginningOfWire;
		%feature("autodoc", "Returns true if the current edge is the first of a wire.

Returns
-------
bool
") BeginningOfWire;
		Standard_Boolean BeginningOfWire();

		/****************** Double ******************/
		/**** md5 signature: 8e7b76dbe7d0d25634fd22872f1a9eab ****/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Double;
		Standard_Boolean Double();

		/****************** Edge ******************/
		/**** md5 signature: 76748ffd591f786c44105943fcd6acd5 ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Edge;
		Standard_Integer Edge();

		/****************** EndOfWire ******************/
		/**** md5 signature: 98ac37dc8042863f016e7904eded0942 ****/
		%feature("compactdefaultargs") EndOfWire;
		%feature("autodoc", "Returns true if the current edge is the last of a wire.

Returns
-------
bool
") EndOfWire;
		Standard_Boolean EndOfWire();

		/****************** InitEdge ******************/
		/**** md5 signature: 422d899fea8385aeaf65601ef58754cb ****/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "Begin an exploration of the edges of the face <fd>.

Parameters
----------
fd: HLRBRep_FaceData

Returns
-------
None
") InitEdge;
		void InitEdge(HLRBRep_FaceData & fd);

		/****************** Internal ******************/
		/**** md5 signature: 5ef23a8bb89a8c65384a3c52774e0041 ****/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Internal;
		Standard_Boolean Internal();

		/****************** IsoLine ******************/
		/**** md5 signature: df815a00be6369dbaeff09d05445d1a0 ****/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsoLine;
		Standard_Boolean IsoLine();

		/****************** MoreEdge ******************/
		/**** md5 signature: 3deabda73e93b20e8a72f2f0ebea4e02 ****/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** NextEdge ******************/
		/**** md5 signature: 8103c946a7f7c0a3d885514a8a740502 ****/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** OutLine ******************/
		/**** md5 signature: d122c0487489d9158e71cfc6be51302d ****/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine();

		/****************** SkipWire ******************/
		/**** md5 signature: 271db178bcbd81d9798133b29cce0b8c ****/
		%feature("compactdefaultargs") SkipWire;
		%feature("autodoc", "Skip the current wire in the exploration.

Returns
-------
None
") SkipWire;
		void SkipWire();

		/****************** Wire ******************/
		/**** md5 signature: ec8a49b48aaf0c44fad113b21c69d11b ****/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the edges of the current wire.

Returns
-------
opencascade::handle<HLRAlgo_EdgesBlock>
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
		/****************** HLRBRep_HLRToShape ******************/
		/**** md5 signature: ce67d79ba62707f55e214dec9007ee80 ****/
		%feature("compactdefaultargs") HLRBRep_HLRToShape;
		%feature("autodoc", "Constructs a framework for filtering the results of the hlrbrep_algo algorithm, a. use the extraction filters to obtain the results you want for a.

Parameters
----------
A: HLRBRep_Algo

Returns
-------
None
") HLRBRep_HLRToShape;
		 HLRBRep_HLRToShape(const opencascade::handle<HLRBRep_Algo> & A);

		/****************** CompoundOfEdges ******************/
		/**** md5 signature: 71c887a277d9d5a40d5ebebcb54316c6 ****/
		%feature("compactdefaultargs") CompoundOfEdges;
		%feature("autodoc", "Returns compound of resulting edges of required type and visibility, taking into account the kind of space (2d or 3d).

Parameters
----------
type: HLRBRep_TypeOfResultingEdge
visible: bool
In3d: bool

Returns
-------
TopoDS_Shape
") CompoundOfEdges;
		TopoDS_Shape CompoundOfEdges(const HLRBRep_TypeOfResultingEdge type, const Standard_Boolean visible, const Standard_Boolean In3d);

		/****************** CompoundOfEdges ******************/
		/**** md5 signature: 6c46497bdf04eb2ad6fe50bbd4953e3b ****/
		%feature("compactdefaultargs") CompoundOfEdges;
		%feature("autodoc", "For specified shape returns compound of resulting edges of required type and visibility, taking into account the kind of space (2d or 3d).

Parameters
----------
S: TopoDS_Shape
type: HLRBRep_TypeOfResultingEdge
visible: bool
In3d: bool

Returns
-------
TopoDS_Shape
") CompoundOfEdges;
		TopoDS_Shape CompoundOfEdges(const TopoDS_Shape & S, const HLRBRep_TypeOfResultingEdge type, const Standard_Boolean visible, const Standard_Boolean In3d);

		/****************** HCompound ******************/
		/**** md5 signature: d34edae76e829f1ff2d89a8960cf3e12 ****/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound();

		/****************** HCompound ******************/
		/**** md5 signature: 2997b95b2432c211a71c2206e24af92a ****/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound(const TopoDS_Shape & S);

		/****************** IsoLineHCompound ******************/
		/**** md5 signature: 3e217bbc6357bfbd88b431b52f812707 ****/
		%feature("compactdefaultargs") IsoLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound();

		/****************** IsoLineHCompound ******************/
		/**** md5 signature: f872713c852e36eef4c1a70e517114a3 ****/
		%feature("compactdefaultargs") IsoLineHCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound(const TopoDS_Shape & S);

		/****************** IsoLineVCompound ******************/
		/**** md5 signature: cc6f089f1a14cc7b1b26be65fd9a4fe4 ****/
		%feature("compactdefaultargs") IsoLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound();

		/****************** IsoLineVCompound ******************/
		/**** md5 signature: a53808c8df6b194b024cf4aa7bf19e2e ****/
		%feature("compactdefaultargs") IsoLineVCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound(const TopoDS_Shape & S);

		/****************** OutLineHCompound ******************/
		/**** md5 signature: 993a692ca08865997787c9c432b66a0b ****/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound();

		/****************** OutLineHCompound ******************/
		/**** md5 signature: 69b9f95e47e310fe017b907b8be5c05f ****/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound(const TopoDS_Shape & S);

		/****************** OutLineVCompound ******************/
		/**** md5 signature: 25faaf0a9af31872bd3162a776e94610 ****/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound();

		/****************** OutLineVCompound ******************/
		/**** md5 signature: dc53a0fc06a7656e9e77f9923845f706 ****/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound(const TopoDS_Shape & S);

		/****************** OutLineVCompound3d ******************/
		/**** md5 signature: 2fc97b2addfb440046144017858aae7c ****/
		%feature("compactdefaultargs") OutLineVCompound3d;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineVCompound3d;
		TopoDS_Shape OutLineVCompound3d();

		/****************** Rg1LineHCompound ******************/
		/**** md5 signature: 063e628b8490e553d3a05b3ca4a02e8b ****/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound();

		/****************** Rg1LineHCompound ******************/
		/**** md5 signature: 8f888b00c60642e3ea8585f639fb09b4 ****/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound(const TopoDS_Shape & S);

		/****************** Rg1LineVCompound ******************/
		/**** md5 signature: 229e02efd65b2e1b670b659a88c7d415 ****/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound();

		/****************** Rg1LineVCompound ******************/
		/**** md5 signature: 89b5bda87b84171ac096a13345eb4112 ****/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound(const TopoDS_Shape & S);

		/****************** RgNLineHCompound ******************/
		/**** md5 signature: 49e041ea3f17a34b12366f0bf44d8041 ****/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound();

		/****************** RgNLineHCompound ******************/
		/**** md5 signature: ba723fa11f7dac4ccdb53ec6ca9ed189 ****/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound(const TopoDS_Shape & S);

		/****************** RgNLineVCompound ******************/
		/**** md5 signature: d8db52358f306f0be6b39a2a23ceb415 ****/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound();

		/****************** RgNLineVCompound ******************/
		/**** md5 signature: ca8daffebca0973374b81b46c5ddaacb ****/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound(const TopoDS_Shape & S);

		/****************** VCompound ******************/
		/**** md5 signature: 8199daca65384c5d1ce7561af621cc2d ****/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound();

		/****************** VCompound ******************/
		/**** md5 signature: 7bf9afb62ac439881e796a557babeda9 ****/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
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
		/****************** HLRBRep_Hider ******************/
		/**** md5 signature: 7418e6aacedad38b1ce12e83c961c116 ****/
		%feature("compactdefaultargs") HLRBRep_Hider;
		%feature("autodoc", "Creates a hider processing the set of edges and hiding faces described by <ds>. stores the hidden parts in <ds>.

Parameters
----------
DS: HLRBRep_Data

Returns
-------
None
") HLRBRep_Hider;
		 HLRBRep_Hider(const opencascade::handle<HLRBRep_Data> & DS);

		/****************** Hide ******************/
		/**** md5 signature: 767cf6aab6d1df52670f15b01ced6148 ****/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Removes from the edges, the parts hidden by the hiding face number <fi>.

Parameters
----------
FI: int
MST: BRepTopAdaptor_MapOfShapeTool

Returns
-------
None
") Hide;
		void Hide(const Standard_Integer FI, BRepTopAdaptor_MapOfShapeTool & MST);

		/****************** OwnHiding ******************/
		/**** md5 signature: d7166ae9c760930cf296f9334e882a27 ****/
		%feature("compactdefaultargs") OwnHiding;
		%feature("autodoc", "Own hiding the side face number <fi>.

Parameters
----------
FI: int

Returns
-------
None
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
		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		/**** md5 signature: 1803acbeca1183b86ed7d1a7732ec0f6 ****/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter();

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		/**** md5 signature: f40a85f399c243c843b85844d0f6b8b9 ****/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		/**** md5 signature: bcff132257b5b6b8e97647cb8df2aab6 ****/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		/**** md5 signature: 8b5e64a296d5dc6b6d1066ca6d8fbce2 ****/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		/**** md5 signature: e861aa6a3d91b183eb5833470d59b62f ****/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		/**** md5 signature: ac48fa9113995fb36b0983ee7e4f6b08 ****/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 256f0ab35aa34bea4dadb6bd5eb4a19c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 08d385c076b409ee44899b99b87bce65 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: adcc3156cc7d9584606acdb0e8a9fcc3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 590908aa03a8133564eed84deecb5d15 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 71d5c9759e509bec96b20ad2637d7730 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
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
		/****************** HLRBRep_InterCSurf ******************/
		/**** md5 signature: ebbd498376cf81c3b638da7f854cfb40 ****/
		%feature("compactdefaultargs") HLRBRep_InterCSurf;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_InterCSurf;
		 HLRBRep_InterCSurf();

		/****************** Perform ******************/
		/**** md5 signature: 775ee260cc06c85bb480d3123a3ecf42 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface.

Parameters
----------
Curve: gp_Lin
Surface: Standard_Address

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & Curve, const Standard_Address & Surface);

		/****************** Perform ******************/
		/**** md5 signature: 63afc9c04fdbf464989b3f347e12cd03 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the curve is already sampled and its polygon : <polygon> is given.

Parameters
----------
Curve: gp_Lin
Polygon: HLRBRep_ThePolygonOfInterCSurf
Surface: Standard_Address

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & Curve, const HLRBRep_ThePolygonOfInterCSurf & Polygon, const Standard_Address & Surface);

		/****************** Perform ******************/
		/**** md5 signature: 0f2218ada737e9d8e5e92c928ff52b9a ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the curve is already sampled and its polygon : <polygon> is given. the surface is also sampled and <polyhedron> is given.

Parameters
----------
Curve: gp_Lin
ThePolygon: HLRBRep_ThePolygonOfInterCSurf
Surface: Standard_Address
Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & Curve, const HLRBRep_ThePolygonOfInterCSurf & ThePolygon, const Standard_Address & Surface, const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);

		/****************** Perform ******************/
		/**** md5 signature: 68b3dab960f1f09b0471dccfe1db21d0 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the curve is already sampled and its polygon : <polygon> is given. the surface is also sampled and <polyhedron> is given.

Parameters
----------
Curve: gp_Lin
ThePolygon: HLRBRep_ThePolygonOfInterCSurf
Surface: Standard_Address
Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf
BndBSB: Bnd_BoundSortBox

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & Curve, const HLRBRep_ThePolygonOfInterCSurf & ThePolygon, const Standard_Address & Surface, const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron, Bnd_BoundSortBox & BndBSB);

		/****************** Perform ******************/
		/**** md5 signature: f85573ee239fa0e6cd93ae6402d6a1da ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the surface is already sampled and its polyhedron : <polyhedron> is given.

Parameters
----------
Curve: gp_Lin
Surface: Standard_Address
Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
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
		/****************** HLRBRep_InternalAlgo ******************/
		/**** md5 signature: eb93e363bb74b770f63b2122d5ca46f1 ****/
		%feature("compactdefaultargs") HLRBRep_InternalAlgo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo();

		/****************** HLRBRep_InternalAlgo ******************/
		/**** md5 signature: ca81c7d3556807b125f940888c03f9eb ****/
		%feature("compactdefaultargs") HLRBRep_InternalAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: HLRBRep_InternalAlgo

Returns
-------
None
") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo(const opencascade::handle<HLRBRep_InternalAlgo> & A);

		/****************** DataStructure ******************/
		/**** md5 signature: 61aa34b795327513108271f6ad4a7e54 ****/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRBRep_Data>
") DataStructure;
		opencascade::handle<HLRBRep_Data> DataStructure();

		/****************** Debug ******************/
		/**** md5 signature: 9ec00ae92bb9dabb0f3b92dbec69abd1 ****/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "No available documentation.

Parameters
----------
deb: bool

Returns
-------
None
") Debug;
		void Debug(const Standard_Boolean deb);

		/****************** Debug ******************/
		/**** md5 signature: c5ed4da64ffa88071867c0cccf683e9a ****/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Debug;
		Standard_Boolean Debug();

		/****************** Hide ******************/
		/**** md5 signature: 58365d1b8e35bd4bc81d336d692c97a2 ****/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Hide all the datastructure.

Returns
-------
None
") Hide;
		void Hide();

		/****************** Hide ******************/
		/**** md5 signature: a0a6c6a0560cf0a28cf6cf97b437befc ****/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Hide the shape <s> by itself.

Parameters
----------
I: int

Returns
-------
None
") Hide;
		void Hide(const Standard_Integer I);

		/****************** Hide ******************/
		/**** md5 signature: 3c5421ad096f3eeb44be04fe7666b697 ****/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Hide the shape <s1> by the shape <s2>.

Parameters
----------
I: int
J: int

Returns
-------
None
") Hide;
		void Hide(const Standard_Integer I, const Standard_Integer J);

		/****************** HideAll ******************/
		/**** md5 signature: 9cbad012d33c32d21b12759548798548 ****/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "Set to hide all the edges.

Returns
-------
None
") HideAll;
		void HideAll();

		/****************** HideAll ******************/
		/**** md5 signature: b44e1fcd67c90925d4234f31ef2d0b2e ****/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "Set to hide all the edges of the shape <s>.

Parameters
----------
I: int

Returns
-------
None
") HideAll;
		void HideAll(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 187fdee228a294ce16137a07b47c9d85 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return the index of the shape <s> and return 0 if the shape <s> is not found.

Parameters
----------
S: HLRTopoBRep_OutLiner

Returns
-------
int
") Index;
		Standard_Integer Index(const opencascade::handle<HLRTopoBRep_OutLiner> & S);

		/****************** InitEdgeStatus ******************/
		/**** md5 signature: 40dcf121d9289a2bba9a47db317f4f0b ****/
		%feature("compactdefaultargs") InitEdgeStatus;
		%feature("autodoc", "Init the status of the selected edges depending of the back faces of a closed shell.

Returns
-------
None
") InitEdgeStatus;
		void InitEdgeStatus();

		/****************** Load ******************/
		/**** md5 signature: e9bddba1b8406ebaefb01c237a9c4d1f ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Add the shape <s>.

Parameters
----------
S: HLRTopoBRep_OutLiner
SData: Standard_Transient
nbIso: int,optional
	default value is 0

Returns
-------
None
") Load;
		void Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const opencascade::handle<Standard_Transient> & SData, const Standard_Integer nbIso = 0);

		/****************** Load ******************/
		/**** md5 signature: 56eb0ffc589543fd9e6dd49a9e885782 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Add the shape <s>.

Parameters
----------
S: HLRTopoBRep_OutLiner
nbIso: int,optional
	default value is 0

Returns
-------
None
") Load;
		void Load(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const Standard_Integer nbIso = 0);

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** PartialHide ******************/
		/**** md5 signature: 5948a3f081b1bfebc097fd30ad7ee22c ****/
		%feature("compactdefaultargs") PartialHide;
		%feature("autodoc", "Own hiding of all the shapes of the datastructure without hiding by each other.

Returns
-------
None
") PartialHide;
		void PartialHide();

		/****************** Projector ******************/
		/**** md5 signature: 1b358691806af1ecbf38ab72a35ea356 ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Set the projector.

Parameters
----------
P: HLRAlgo_Projector

Returns
-------
None
") Projector;
		void Projector(const HLRAlgo_Projector & P);

		/****************** Projector ******************/
		/**** md5 signature: d7f508ab183a1a90d9ac0ead0aeb116c ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Set the projector.

Returns
-------
HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector & Projector();

		/****************** Remove ******************/
		/**** md5 signature: e9cf861e645127938dcff0ea13bfa8c2 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove the shape of index <i>.

Parameters
----------
I: int

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer I);

		/****************** Select ******************/
		/**** md5 signature: b841eec3ea2cd8cbedd47c93babbe626 ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Select all the datastructure.

Returns
-------
None
") Select;
		void Select();

		/****************** Select ******************/
		/**** md5 signature: 7492f53dfed6fd6b6cb147ee1f1a2612 ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Select only the shape of index <i>.

Parameters
----------
I: int

Returns
-------
None
") Select;
		void Select(const Standard_Integer I);

		/****************** SelectEdge ******************/
		/**** md5 signature: 9d38d629011eae37cd5229c2ee061dc6 ****/
		%feature("compactdefaultargs") SelectEdge;
		%feature("autodoc", "Select only the edges of the shape <s>.

Parameters
----------
I: int

Returns
-------
None
") SelectEdge;
		void SelectEdge(const Standard_Integer I);

		/****************** SelectFace ******************/
		/**** md5 signature: 00a2dd2008480d52177b8336a23ac4b7 ****/
		%feature("compactdefaultargs") SelectFace;
		%feature("autodoc", "Select only the faces of the shape <s>.

Parameters
----------
I: int

Returns
-------
None
") SelectFace;
		void SelectFace(const Standard_Integer I);

		/****************** SeqOfShapeBounds ******************/
		/**** md5 signature: 4e702d2f67476d94fa53ff151ba70dcb ****/
		%feature("compactdefaultargs") SeqOfShapeBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_SeqOfShapeBounds
") SeqOfShapeBounds;
		HLRBRep_SeqOfShapeBounds & SeqOfShapeBounds();

		/****************** ShapeBounds ******************/
		/**** md5 signature: ac736476f628e1407978e327f1424b69 ****/
		%feature("compactdefaultargs") ShapeBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
HLRBRep_ShapeBounds
") ShapeBounds;
		HLRBRep_ShapeBounds & ShapeBounds(const Standard_Integer I);

		/****************** ShapeData ******************/
		/**** md5 signature: a3f40ee6d762d920739602e2de0add47 ****/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "Change the shape data of the shape of index <i>.

Parameters
----------
I: int
SData: Standard_Transient

Returns
-------
None
") ShapeData;
		void ShapeData(const Standard_Integer I, const opencascade::handle<Standard_Transient> & SData);

		/****************** ShowAll ******************/
		/**** md5 signature: 16b8205837f09151db1f737d1a729fbd ****/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "Set to visible all the edges.

Returns
-------
None
") ShowAll;
		void ShowAll();

		/****************** ShowAll ******************/
		/**** md5 signature: 3ad94b28582fe688b9ad08e822e403c1 ****/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "Set to visible all the edges of the shape <s>.

Parameters
----------
I: int

Returns
-------
None
") ShowAll;
		void ShowAll(const Standard_Integer I);

		/****************** Update ******************/
		/**** md5 signature: 997c8dd85f474bf26af99d1a07d6fa3f ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Update the datastructure.

Returns
-------
None
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
		/****************** HLRBRep_Intersector ******************/
		/**** md5 signature: 03440fea82810f6b85a56244f2e1ee7b ****/
		%feature("compactdefaultargs") HLRBRep_Intersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_Intersector;
		 HLRBRep_Intersector();

		/****************** CSPoint ******************/
		/**** md5 signature: 3ad21118600f72be699184d19a93464b ****/
		%feature("compactdefaultargs") CSPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: int

Returns
-------
IntCurveSurface_IntersectionPoint
") CSPoint;
		const IntCurveSurface_IntersectionPoint & CSPoint(const Standard_Integer N);

		/****************** CSSegment ******************/
		/**** md5 signature: cdcfb6a547ece08784f0bdf0d0732007 ****/
		%feature("compactdefaultargs") CSSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: int

Returns
-------
IntCurveSurface_IntersectionSegment
") CSSegment;
		const IntCurveSurface_IntersectionSegment & CSSegment(const Standard_Integer N);

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		/**** md5 signature: 6e50e343ba82585300ed1664ff5ef0c0 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Standard_Address

Returns
-------
None
") Load;
		void Load(Standard_Address & A);

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Perform ******************/
		/**** md5 signature: ad6a57edaa391e06877cb1bee2bae6c2 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the auto intersection of an edge. the edge domain is cutted at start with da1*(b-a) and at end with db1*(b-a).

Parameters
----------
A1: Standard_Address
da1: float
db1: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address A1, const Standard_Real da1, const Standard_Real db1);

		/****************** Perform ******************/
		/**** md5 signature: 4f119c0498079f9f268caca23730d0d5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between the two edges. the edges domains are cutted at start with da*(b-a) and at end with db*(b-a).

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

Returns
-------
None
") Perform;
		void Perform(const Standard_Integer nA, const Standard_Address A1, const Standard_Real da1, const Standard_Real db1, const Standard_Integer nB, const Standard_Address A2, const Standard_Real da2, const Standard_Real db2, const Standard_Boolean NoBound);

		/****************** Perform ******************/
		/**** md5 signature: b97b7f841573c60a82a40f858de3f2b6 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin
P: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & L, const Standard_Real P);

		/****************** Point ******************/
		/**** md5 signature: ab5be2f4faa8204905c7defafba7f249 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: int

Returns
-------
IntRes2d_IntersectionPoint
") Point;
		const IntRes2d_IntersectionPoint & Point(const Standard_Integer N);

		/****************** Segment ******************/
		/**** md5 signature: 423d5f868e6a816f02143de11c5f58dc ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: int

Returns
-------
IntRes2d_IntersectionSegment
") Segment;
		const IntRes2d_IntersectionSegment & Segment(const Standard_Integer N);

		/****************** SimulateOnePoint ******************/
		/**** md5 signature: ea69fcdb586b8cc34be7b877311faab8 ****/
		%feature("compactdefaultargs") SimulateOnePoint;
		%feature("autodoc", "Create a single intersectionpoint (u on a1) (v on a2) the point is middle on both curves.

Parameters
----------
A1: Standard_Address
U: float
A2: Standard_Address
V: float

Returns
-------
None
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
		/****************** BSpline ******************/
		/**** md5 signature: 8d585d6c8326a3750981dc6f70efad71 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const gp_Lin & C);

		/****************** Bezier ******************/
		/**** md5 signature: 64c594a036fbe9c4da520f893b260e04 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const gp_Lin & C);

		/****************** Circle ******************/
		/**** md5 signature: aee5286e4554b3ab95373fa9637c022d ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
gp_Circ
") Circle;
		static gp_Circ Circle(const gp_Lin & C);

		/****************** Continuity ******************/
		/**** md5 signature: 15d3a4716f672bb69b563f8c8a81e404 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const gp_Lin & C);

		/****************** D0 ******************/
		/**** md5 signature: df50c8cb2a7a467049518446760283cc ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the line.

Parameters
----------
C: gp_Lin
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const gp_Lin & C, const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: cc6578642642883233e657d067a50adc ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the line with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: gp_Lin
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const gp_Lin & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: b21e1d311e32a163d305e924e9cc0885 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: gp_Lin
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const gp_Lin & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: 7fe7498a6369a96f7db270009ab64a32 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: gp_Lin
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const gp_Lin & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 72d3a77c487e68835c5a00c3ab93a892 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: gp_Lin
U: float
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const gp_Lin & C, const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: ce823cd96f5087483be858368a6f9908 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
int
") Degree;
		static Standard_Integer Degree(const gp_Lin & C);

		/****************** Ellipse ******************/
		/**** md5 signature: ce9419a8e7b21b2ec96fa8cff7c8042a ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
gp_Elips
") Ellipse;
		static gp_Elips Ellipse(const gp_Lin & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: e64a464242bf01ff4625baedc30199a4 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const gp_Lin & C);

		/****************** GetType ******************/
		/**** md5 signature: 0c6dded5c2195cb0e701212c2c2726ad ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the line in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: gp_Lin

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const gp_Lin & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: 3a688767924d4d16f68d89899f98760a ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola(const gp_Lin & C);

		/****************** IntervalContinuity ******************/
		/**** md5 signature: 069974fe52c040887ebdd21408b74379 ****/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
GeomAbs_Shape
") IntervalContinuity;
		static GeomAbs_Shape IntervalContinuity(const gp_Lin & C);

		/****************** IntervalFirst ******************/
		/**** md5 signature: 883451ed66bc68dd9be59a74ab22a30c ****/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "Returns the first parameter of the current interval.

Parameters
----------
C: gp_Lin

Returns
-------
float
") IntervalFirst;
		static Standard_Real IntervalFirst(const gp_Lin & C);

		/****************** IntervalLast ******************/
		/**** md5 signature: b97048513f8df32c3d3fb9e943489920 ****/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "Returns the last parameter of the current interval.

Parameters
----------
C: gp_Lin

Returns
-------
float
") IntervalLast;
		static Standard_Real IntervalLast(const gp_Lin & C);

		/****************** Intervals ******************/
		/**** md5 signature: 3ffed521a9811d11176105e8ca08c7ff ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Sets the current working interval.

Parameters
----------
C: gp_Lin
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const gp_Lin & C, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****************** IsClosed ******************/
		/**** md5 signature: 05f48005588bc1ebffe9d50caafa7136 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const gp_Lin & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: 94d16d951cc0c3cabf7ff3c01533e1b6 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const gp_Lin & C);

		/****************** IsRational ******************/
		/**** md5 signature: 4341e9f8b33ff321206e143a166499ce ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
bool
") IsRational;
		static Standard_Boolean IsRational(const gp_Lin & C);

		/****************** KnotsAndMultiplicities ******************/
		/**** md5 signature: c82d93d487930d28e784ded0f522d5db ****/
		%feature("compactdefaultargs") KnotsAndMultiplicities;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
TK: TColStd_Array1OfReal
TM: TColStd_Array1OfInteger

Returns
-------
None
") KnotsAndMultiplicities;
		static void KnotsAndMultiplicities(const gp_Lin & C, TColStd_Array1OfReal & TK, TColStd_Array1OfInteger & TM);

		/****************** LastParameter ******************/
		/**** md5 signature: e427d772ca3add3bd60c88cf78268e5c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const gp_Lin & C);

		/****************** Line ******************/
		/**** md5 signature: cc6f80c77b35afffbc178831258eaf22 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
gp_Lin
") Line;
		static gp_Lin Line(const gp_Lin & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 5d500956a6a4ceb8bea94f685055c6df ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "If necessary, breaks the line in intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
C: gp_Lin
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const gp_Lin & C, const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: ea1d08f7a8cc968c2fc1702e540e9860 ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
int
") NbKnots;
		static Standard_Integer NbKnots(const gp_Lin & C);

		/****************** NbPoles ******************/
		/**** md5 signature: c7c18240249e0a7b737616d551009059 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
int
") NbPoles;
		static Standard_Integer NbPoles(const gp_Lin & C);

		/****************** NbSamples ******************/
		/**** md5 signature: 37e2cb5bf4aa983d77d4d9800d0ebcd8 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const gp_Lin & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: d4661779802cfffcc637a199c62580d9 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
gp_Parab
") Parabola;
		static gp_Parab Parabola(const gp_Lin & C);

		/****************** Period ******************/
		/**** md5 signature: da90dcf013c319e7a8d3053f5a74e336 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin

Returns
-------
float
") Period;
		static Standard_Real Period(const gp_Lin & C);

		/****************** Poles ******************/
		/**** md5 signature: cecc681bf55705f50b5b8d89253de13a ****/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
TP: TColgp_Array1OfPnt

Returns
-------
None
") Poles;
		static void Poles(const gp_Lin & C, TColgp_Array1OfPnt & TP);

		/****************** PolesAndWeights ******************/
		/**** md5 signature: 25eb83c010bf4036ccf71bbe36ec9bf8 ****/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
TP: TColgp_Array1OfPnt
TW: TColStd_Array1OfReal

Returns
-------
None
") PolesAndWeights;
		static void PolesAndWeights(const gp_Lin & C, TColgp_Array1OfPnt & TP, TColStd_Array1OfReal & TW);

		/****************** Resolution ******************/
		/**** md5 signature: 828e677117947b59cb33694658d42a33 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: gp_Lin
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const gp_Lin & C, const Standard_Real R3d);

		/****************** SamplePars ******************/
		/**** md5 signature: 06cb58e77264b5dfa6e15c6a8b897b6d ****/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: gp_Lin
U0: float
U1: float
Defl: float
NbMin: int
Pars: TColStd_HArray1OfReal

Returns
-------
None
") SamplePars;
		static void SamplePars(const gp_Lin & C, const Standard_Real U0, const Standard_Real U1, const Standard_Real Defl, const Standard_Integer NbMin, opencascade::handle<TColStd_HArray1OfReal> & Pars);

		/****************** Value ******************/
		/**** md5 signature: 03bb47a1e9ef7b8bc9b7a7ce321e38ea ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the line.

Parameters
----------
C: gp_Lin
U: float

Returns
-------
gp_Pnt
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
		/****************** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter ******************/
		/**** md5 signature: 02de6cdd0d16aa29d41caaf2fdbeb8a4 ****/
		%feature("compactdefaultargs") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "Constructor of the class.

Parameters
----------
IT: IntCurve_IConicTool
PC: Standard_Address

Returns
-------
None
") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter(const IntCurve_IConicTool & IT, const Standard_Address & PC);

		/****************** Derivative ******************/
		/**** md5 signature: f61c873331fa555e182f1973e95f59da ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the previous function at parameter param.

Parameters
----------
Param: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the signed distance between the implicit curve and the point at parameter param on the parametrised curve.

Parameters
----------
Param: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function.

Parameters
----------
Param: float

Returns
-------
F: float
D: float
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
		/****************** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ******************/
		/**** md5 signature: ef2b6c60ae2e7488efe1085e96dccd33 ****/
		%feature("compactdefaultargs") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter();

		/****************** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ******************/
		/**** md5 signature: 027be352b880a0d46127e59615fc982f ****/
		%feature("compactdefaultargs") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
C: Standard_Address

Returns
-------
None
") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter(const gp_Pnt2d & P, const Standard_Address & C);

		/****************** Derivative ******************/
		/**** md5 signature: 74e45b7ef1cb50395f459121235df2cd ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Calculation of f'(u).

Parameters
----------
U: float

Returns
-------
DF: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real U, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		/**** md5 signature: 49c44bd66dd4ec2381671c72ebd88158 ****/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
		/**** md5 signature: eea140d2a7c54343781978adcd2828b3 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the field mycurve of the function.

Parameters
----------
C: Standard_Address

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Address & C);

		/****************** IsMin ******************/
		/**** md5 signature: d296cefb075e9db02ee60a375c81a9f6 ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Shows if the nth distance is a minimum.

Parameters
----------
N: int

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin(const Standard_Integer N);

		/****************** NbExt ******************/
		/**** md5 signature: 84ada636e4651cacf916eb056265a1d9 ****/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
		/**** md5 signature: 6123812027804044a54749cfa19bef5e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the nth extremum.

Parameters
----------
N: int

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point(const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		/**** md5 signature: 73a2a1f7b776ed3aaadf205798ee8767 ****/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
		/**** md5 signature: 0ad85ba084f338225cb11e827425ab5f ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Sets the field p of the function.

Parameters
----------
P: gp_Pnt2d

Returns
-------
None
") SetPoint;
		void SetPoint(const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		/**** md5 signature: 60ba620c5cb13d85d5cb6606695896ce ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the nth distance.

Parameters
----------
N: int

Returns
-------
float
") SquareDistance;
		Standard_Real SquareDistance(const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		/**** md5 signature: 424565e975e565ea668d16ca9ce728b5 ****/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "Determines boundaries of subinterval for find of root.

Parameters
----------
theUfirst: float
theUlast: float

Returns
-------
None
") SubIntervalInitialize;
		void SubIntervalInitialize(const Standard_Real theUfirst, const Standard_Real theUlast);

		/****************** Value ******************/
		/**** md5 signature: e3462efa1edccfd4021bca61bc42d936 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Calculation of f(u).

Parameters
----------
U: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real U, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: a9de0e54fbbad71406954eb825560b84 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Calculation of f(u) and f'(u).

Parameters
----------
U: float

Returns
-------
F: float
DF: float
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
		/****************** HLRBRep_PolyAlgo ******************/
		/**** md5 signature: f840694af0e014aa4284608f01bba94e ****/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", "Constructs an empty framework for the calculation of the visible and hidden lines of a shape in a projection. use the functions: - projector to define the point of view - load to select the shape or shapes to be visualized - update to compute the visible and hidden lines of the shape. warning the shape or shapes to be visualized must have already been triangulated.

Returns
-------
None
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo();

		/****************** HLRBRep_PolyAlgo ******************/
		/**** md5 signature: 1af97386793d88a775904022c6ee7965 ****/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: HLRBRep_PolyAlgo

Returns
-------
None
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo(const opencascade::handle<HLRBRep_PolyAlgo> & A);

		/****************** HLRBRep_PolyAlgo ******************/
		/**** md5 signature: ae2ef620ec86695e792ad732d56725e2 ****/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo(const TopoDS_Shape & S);

		/****************** Algo ******************/
		/**** md5 signature: ebeae28e548136fa3c0a74aeb956a363 ****/
		%feature("compactdefaultargs") Algo;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRAlgo_PolyAlgo>
") Algo;
		opencascade::handle<HLRAlgo_PolyAlgo> Algo();

		/****************** Angle ******************/
		/**** md5 signature: dce50192c350c43b54f2e88e94e5372a ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Angle ******************/
		/**** md5 signature: 74500f49536b4f5912c02c18aac12bd7 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ang: float

Returns
-------
None
") Angle;
		void Angle(const Standard_Real Ang);

		/****************** Debug ******************/
		/**** md5 signature: c5ed4da64ffa88071867c0cccf683e9a ****/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Debug;
		Standard_Boolean Debug();

		/****************** Debug ******************/
		/**** md5 signature: 6b2ebbcb8f7924379067b3cf4c979192 ****/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") Debug;
		void Debug(const Standard_Boolean B);

		/****************** Hide ******************/
		/**** md5 signature: 6909c92a5658f468316390940e7bea34 ****/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "No available documentation.

Parameters
----------
status: HLRAlgo_EdgeStatus
S: TopoDS_Shape

Returns
-------
reg1: bool
regn: bool
outl: bool
intl: bool
") Hide;
		HLRAlgo_BiPoint::PointsT & Hide(HLRAlgo_EdgeStatus & status, TopoDS_Shape & S, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** Index ******************/
		/**** md5 signature: 9e94bb6d7b4221be4165f8639cd27d92 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return the index of the shape <s> and return 0 if the shape <s> is not found.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Shape & S);

		/****************** InitHide ******************/
		/**** md5 signature: 32bd2983c565ec4e2841cbdfc31fdf26 ****/
		%feature("compactdefaultargs") InitHide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitHide;
		void InitHide();

		/****************** InitShow ******************/
		/**** md5 signature: ea1a67c1f45ef7c44c521925fd0378a1 ****/
		%feature("compactdefaultargs") InitShow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitShow;
		void InitShow();

		/****************** Load ******************/
		/**** md5 signature: e8cac8ea20706569fcef43af3e2c23ea ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads the shape s into this framework. warning s must have already been triangulated.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Load;
		void Load(const TopoDS_Shape & S);

		/****************** MoreHide ******************/
		/**** md5 signature: d38676512d86f43f63f7be299a6fac64 ****/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreHide;
		Standard_Boolean MoreHide();

		/****************** MoreShow ******************/
		/**** md5 signature: 1f2b98cd697654109ddadc761c52bff2 ****/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreShow;
		Standard_Boolean MoreShow();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NextHide ******************/
		/**** md5 signature: 22f8ebe157186c9b9096225d279bf0df ****/
		%feature("compactdefaultargs") NextHide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextHide;
		void NextHide();

		/****************** NextShow ******************/
		/**** md5 signature: e69996302b094708790ccdf13c4fece3 ****/
		%feature("compactdefaultargs") NextShow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextShow;
		void NextShow();

		/****************** OutLinedShape ******************/
		/**** md5 signature: 70f8daa56f2313e2214686a155f0c5f5 ****/
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", "Make a shape with the internal outlines in each face.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") OutLinedShape;
		TopoDS_Shape OutLinedShape(const TopoDS_Shape & S);

		/****************** Projector ******************/
		/**** md5 signature: 23a6a7deb95f5da3cbce2596dee28e05 ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Sets the parameters of the view for this framework. these parameters are defined by an hlralgo_projector object, which is returned by the projector function on a prs3d_projector object.

Returns
-------
HLRAlgo_Projector
") Projector;
		const HLRAlgo_Projector & Projector();

		/****************** Projector ******************/
		/**** md5 signature: 1b358691806af1ecbf38ab72a35ea356 ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: HLRAlgo_Projector

Returns
-------
None
") Projector;
		void Projector(const HLRAlgo_Projector & P);

		/****************** Remove ******************/
		/**** md5 signature: e9cf861e645127938dcff0ea13bfa8c2 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove the shape of index <i>.

Parameters
----------
I: int

Returns
-------
None
") Remove;
		void Remove(const Standard_Integer I);

		/****************** Shape ******************/
		/**** md5 signature: b38214dc52925d212203a446234e9de3 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const Standard_Integer I);

		/****************** Show ******************/
		/**** md5 signature: fcba02d084d4b66d814a22fc57955911 ****/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
reg1: bool
regn: bool
outl: bool
intl: bool
") Show;
		HLRAlgo_BiPoint::PointsT & Show(TopoDS_Shape & S, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue, Standard_Boolean &OutValue);

		/****************** TolAngular ******************/
		/**** md5 signature: b72a2b3894db353785f7ca3e1bf2fd62 ****/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolAngular;
		Standard_Real TolAngular();

		/****************** TolAngular ******************/
		/**** md5 signature: 78d0136cd0be1cc61193f4c373c2b0b0 ****/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") TolAngular;
		void TolAngular(const Standard_Real Tol);

		/****************** TolCoef ******************/
		/**** md5 signature: 06f50361cd7fd1d11de29921eb8c7f4b ****/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolCoef;
		Standard_Real TolCoef();

		/****************** TolCoef ******************/
		/**** md5 signature: 993b617f7d9ad9fae826ed31a16d56b4 ****/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") TolCoef;
		void TolCoef(const Standard_Real Tol);

		/****************** Update ******************/
		/**** md5 signature: 997c8dd85f474bf26af99d1a07d6fa3f ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Launches calculation of outlines of the shape visualized by this framework. used after setting the point of view and defining the shape or shapes to be visualized.

Returns
-------
None
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
		/****************** HLRBRep_PolyHLRToShape ******************/
		/**** md5 signature: 316c066a5dd84a0d514693f15e0fd063 ****/
		%feature("compactdefaultargs") HLRBRep_PolyHLRToShape;
		%feature("autodoc", "Constructs a framework for filtering the results of the hlrbrep_algo algorithm, a. use the extraction filters to obtain the results you want for a.

Returns
-------
None
") HLRBRep_PolyHLRToShape;
		 HLRBRep_PolyHLRToShape();

		/****************** HCompound ******************/
		/**** md5 signature: d34edae76e829f1ff2d89a8960cf3e12 ****/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound();

		/****************** HCompound ******************/
		/**** md5 signature: 2997b95b2432c211a71c2206e24af92a ****/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound(const TopoDS_Shape & S);

		/****************** Hide ******************/
		/**** md5 signature: 58365d1b8e35bd4bc81d336d692c97a2 ****/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Hide;
		void Hide();

		/****************** OutLineHCompound ******************/
		/**** md5 signature: 993a692ca08865997787c9c432b66a0b ****/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound();

		/****************** OutLineHCompound ******************/
		/**** md5 signature: 69b9f95e47e310fe017b907b8be5c05f ****/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "Sets the extraction filter for hidden outlines. hidden outlines occur, for instance, in tori. in this case, the inner outlines of the torus seen on its side are hidden.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound(const TopoDS_Shape & S);

		/****************** OutLineVCompound ******************/
		/**** md5 signature: 25faaf0a9af31872bd3162a776e94610 ****/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound();

		/****************** OutLineVCompound ******************/
		/**** md5 signature: dc53a0fc06a7656e9e77f9923845f706 ****/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "Sets the extraction filter for visible outlines.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound(const TopoDS_Shape & S);

		/****************** Rg1LineHCompound ******************/
		/**** md5 signature: 063e628b8490e553d3a05b3ca4a02e8b ****/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound();

		/****************** Rg1LineHCompound ******************/
		/**** md5 signature: 8f888b00c60642e3ea8585f639fb09b4 ****/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "Sets the extraction filter for hidden smooth edges.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound(const TopoDS_Shape & S);

		/****************** Rg1LineVCompound ******************/
		/**** md5 signature: 229e02efd65b2e1b670b659a88c7d415 ****/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "Sets the extraction filter for visible smooth edges.

Returns
-------
TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound();

		/****************** Rg1LineVCompound ******************/
		/**** md5 signature: 89b5bda87b84171ac096a13345eb4112 ****/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound(const TopoDS_Shape & S);

		/****************** RgNLineHCompound ******************/
		/**** md5 signature: 49e041ea3f17a34b12366f0bf44d8041 ****/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound();

		/****************** RgNLineHCompound ******************/
		/**** md5 signature: ba723fa11f7dac4ccdb53ec6ca9ed189 ****/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "Sets the extraction filter for hidden sewn edges.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound(const TopoDS_Shape & S);

		/****************** RgNLineVCompound ******************/
		/**** md5 signature: d8db52358f306f0be6b39a2a23ceb415 ****/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "Sets the extraction filter for visible sewn edges.

Returns
-------
TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound();

		/****************** RgNLineVCompound ******************/
		/**** md5 signature: ca8daffebca0973374b81b46c5ddaacb ****/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound(const TopoDS_Shape & S);

		/****************** Show ******************/
		/**** md5 signature: 9067ac917ffb66a9e8ff84ea37a89cbe ****/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Show;
		void Show();

		/****************** Update ******************/
		/**** md5 signature: 853d04a0792e48573fd53908bdce7810 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: HLRBRep_PolyAlgo

Returns
-------
None
") Update;
		void Update(const opencascade::handle<HLRBRep_PolyAlgo> & A);

		/****************** VCompound ******************/
		/**** md5 signature: 8199daca65384c5d1ce7561af621cc2d ****/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound();

		/****************** VCompound ******************/
		/**** md5 signature: 7bf9afb62ac439881e796a557babeda9 ****/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopoDS_Shape
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
		/****************** HLRBRep_SLProps ******************/
		/**** md5 signature: 78f0374b7b7eeb83b89b827d014ac753 ****/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "Initializes the local properties of the surface <s> for the parameter values (<u>, <v>). the current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <n> indicates the maximum number of derivations to be done (0, 1, or 2). for example, to compute only the tangent, n should be equal to 1. <resolution> is the linear tolerance (it is used to test if a vector is null).

Parameters
----------
S: Standard_Address
U: float
V: float
N: int
Resolution: float

Returns
-------
None
") HLRBRep_SLProps;
		 HLRBRep_SLProps(const Standard_Address & S, const Standard_Real U, const Standard_Real V, const Standard_Integer N, const Standard_Real Resolution);

		/****************** HLRBRep_SLProps ******************/
		/**** md5 signature: eb8aa57972d644a87d3e5fe72e6a204e ****/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "Idem as previous constructor but without setting the value of parameters <u> and <v>.

Parameters
----------
S: Standard_Address
N: int
Resolution: float

Returns
-------
None
") HLRBRep_SLProps;
		 HLRBRep_SLProps(const Standard_Address & S, const Standard_Integer N, const Standard_Real Resolution);

		/****************** HLRBRep_SLProps ******************/
		/**** md5 signature: f5c3d071302aa2344a5432a3fdbf8bc0 ****/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "Idem as previous constructor but without setting the value of parameters <u> and <v> and the surface. the surface can have an empty constructor.

Parameters
----------
N: int
Resolution: float

Returns
-------
None
") HLRBRep_SLProps;
		 HLRBRep_SLProps(const Standard_Integer N, const Standard_Real Resolution);

		/****************** CurvatureDirections ******************/
		/**** md5 signature: dce4de0944d73f0923cc57f1cae010ce ****/
		%feature("compactdefaultargs") CurvatureDirections;
		%feature("autodoc", "Returns the direction of the maximum and minimum curvature <maxd> and <mind>.

Parameters
----------
MaxD: gp_Dir
MinD: gp_Dir

Returns
-------
None
") CurvatureDirections;
		void CurvatureDirections(gp_Dir & MaxD, gp_Dir & MinD);

		/****************** D1U ******************/
		/**** md5 signature: 7fcd61e774b6033eceefa61e3338377a ****/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "Returns the first u derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1U;
		const gp_Vec D1U();

		/****************** D1V ******************/
		/**** md5 signature: ad864d52b93c95482f9a3644c7fe473c ****/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "Returns the first v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1V;
		const gp_Vec D1V();

		/****************** D2U ******************/
		/**** md5 signature: 0472ef4d94574816aeb47829a66bdbae ****/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "Returns the second u derivatives the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2U;
		const gp_Vec D2U();

		/****************** D2V ******************/
		/**** md5 signature: c70c5cc9b31ef0a3470d3c29498b5305 ****/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "Returns the second v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2V;
		const gp_Vec D2V();

		/****************** DUV ******************/
		/**** md5 signature: 93a293abda31f525f2bff5034aabc11a ****/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "Returns the second uv cross-derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") DUV;
		const gp_Vec DUV();

		/****************** GaussianCurvature ******************/
		/**** md5 signature: 6f1ed6a8aa49074ec45c7600ff9ed9ad ****/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "Returns the gaussian curvature.

Returns
-------
float
") GaussianCurvature;
		Standard_Real GaussianCurvature();

		/****************** IsCurvatureDefined ******************/
		/**** md5 signature: 24d1c4dc0bb5e5b3cd3acab3d6b3723c ****/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "Returns true if the curvature is defined.

Returns
-------
bool
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined();

		/****************** IsNormalDefined ******************/
		/**** md5 signature: b4faa90626237a62ab1311b7cb7ad450 ****/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "Tells if the normal is defined.

Returns
-------
bool
") IsNormalDefined;
		Standard_Boolean IsNormalDefined();

		/****************** IsTangentUDefined ******************/
		/**** md5 signature: 92ed6ca4fade225cd5464af6490033b3 ****/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "Returns true if the u tangent is defined. for example, the tangent is not defined if the two first u derivatives are null.

Returns
-------
bool
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined();

		/****************** IsTangentVDefined ******************/
		/**** md5 signature: 53c94c0bb0d39a933984467e0683397e ****/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "Returns if the v tangent is defined. for example, the tangent is not defined if the two first v derivatives are null.

Returns
-------
bool
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined();

		/****************** IsUmbilic ******************/
		/**** md5 signature: a045467d1ec2cad50bd2dfbeab29b8fd ****/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "Returns true if the point is umbilic (i.e. if the curvature is constant).

Returns
-------
bool
") IsUmbilic;
		Standard_Boolean IsUmbilic();

		/****************** MaxCurvature ******************/
		/**** md5 signature: 42c5b0c05da3040d5856fffc987ed742 ****/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "Returns the maximum curvature.

Returns
-------
float
") MaxCurvature;
		Standard_Real MaxCurvature();

		/****************** MeanCurvature ******************/
		/**** md5 signature: 5c7a78b552e4ca890e50b485026f52f3 ****/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "Returns the mean curvature.

Returns
-------
float
") MeanCurvature;
		Standard_Real MeanCurvature();

		/****************** MinCurvature ******************/
		/**** md5 signature: 9c5c8915c2ccf5b49a49ab2765ec946f ****/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "Returns the minimum curvature.

Returns
-------
float
") MinCurvature;
		Standard_Real MinCurvature();

		/****************** Normal ******************/
		/**** md5 signature: 24a2507aa20216689971a0ec1fd83f76 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal direction.

Returns
-------
gp_Dir
") Normal;
		const gp_Dir Normal();

		/****************** SetParameters ******************/
		/**** md5 signature: 766228d61435cf9eaba866b58733ed73 ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Initializes the local properties of the surface s for the new parameter values (<u>, <v>).

Parameters
----------
U: float
V: float

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real U, const Standard_Real V);

		/****************** SetSurface ******************/
		/**** md5 signature: fdd17ffc74b005040cec1fe6f5cb6245 ****/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "Initializes the local properties of the surface s for the new surface.

Parameters
----------
S: Standard_Address

Returns
-------
None
") SetSurface;
		void SetSurface(const Standard_Address & S);

		/****************** TangentU ******************/
		/**** md5 signature: ff20f7d1d23e153974b932d55fa30a7f ****/
		%feature("compactdefaultargs") TangentU;
		%feature("autodoc", "Returns the tangent direction <d> on the iso-v.

Parameters
----------
D: gp_Dir

Returns
-------
None
") TangentU;
		void TangentU(gp_Dir & D);

		/****************** TangentV ******************/
		/**** md5 signature: 8241dc858e42533746e4d61351ceccd4 ****/
		%feature("compactdefaultargs") TangentV;
		%feature("autodoc", "Returns the tangent direction <d> on the iso-v.

Parameters
----------
D: gp_Dir

Returns
-------
None
") TangentV;
		void TangentV(gp_Dir & D);

		/****************** Value ******************/
		/**** md5 signature: eddd2908948849b73f6d8aacab318652 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point.

Returns
-------
gp_Pnt
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
		/****************** Bounds ******************/
		/**** md5 signature: e8dfb084ac6c872071bbf7788de530dc ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the bounds of the surface.

Parameters
----------
A: Standard_Address

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Bounds;
		static void Bounds(const Standard_Address A, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Continuity ******************/
		/**** md5 signature: d3733a3bc8f06c200ea6422cb6df16a3 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the order of continuity of the surface <a>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.

Parameters
----------
A: Standard_Address

Returns
-------
int
") Continuity;
		static Standard_Integer Continuity(const Standard_Address A);

		/****************** D1 ******************/
		/**** md5 signature: ab16415dfcd6c110739148d174a08916 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point <p> and first derivative <d1*> of parameter <u> and <v> on the surface <a>.

Parameters
----------
A: Standard_Address
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Address A, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		/**** md5 signature: 370c635cad04eda1fd2dd910286efcfc ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point <p>, the first derivative <d1*> and second derivative <d2*> of parameter <u> and <v> on the surface <a>.

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

Returns
-------
None
") D2;
		static void D2(const Standard_Address A, const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & DUV);

		/****************** DN ******************/
		/**** md5 signature: a73021e7fbb4baaa97773a3193a4bd2d ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Standard_Address
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Address A, const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Value ******************/
		/**** md5 signature: 8139ac0cd44cdaaedf457ca18eb5c577 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point <p> of 	parameter <u> and <v> on the surface <a>.

Parameters
----------
A: Standard_Address
U: float
V: float
P: gp_Pnt

Returns
-------
None
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
		/****************** HLRBRep_ShapeBounds ******************/
		/**** md5 signature: 379c0fe6d061356abb75ec8e7a7a2c74 ****/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds();

		/****************** HLRBRep_ShapeBounds ******************/
		/**** md5 signature: 0a8fad3a04895602a2a2eaf90593212e ****/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const opencascade::handle<Standard_Transient> & SData, const Standard_Integer nbIso, const Standard_Integer V1, const Standard_Integer V2, const Standard_Integer E1, const Standard_Integer E2, const Standard_Integer F1, const Standard_Integer F2);

		/****************** HLRBRep_ShapeBounds ******************/
		/**** md5 signature: 8f7396ab30415814fca95d7f235319fe ****/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds(const opencascade::handle<HLRTopoBRep_OutLiner> & S, const Standard_Integer nbIso, const Standard_Integer V1, const Standard_Integer V2, const Standard_Integer E1, const Standard_Integer E2, const Standard_Integer F1, const Standard_Integer F2);

		/****************** Bounds ******************/
		/**** md5 signature: f60797aaa87b18ae8eee336740778b1b ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
V1: int
V2: int
E1: int
E2: int
F1: int
F2: int
") Bounds;
		void Bounds(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** MinMax ******************/
		/**** md5 signature: b360e6f636632e8d4f24d53763098bae ****/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgesBlock::MinMaxIndices
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****************** NbOfIso ******************/
		/**** md5 signature: d6498e9f6e042d33d4a795499305cc6a ****/
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", "No available documentation.

Parameters
----------
nbIso: int

Returns
-------
None
") NbOfIso;
		void NbOfIso(const Standard_Integer nbIso);

		/****************** NbOfIso ******************/
		/**** md5 signature: 2501d827e295fdb15b2e4f0fdd55a1d1 ****/
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbOfIso;
		Standard_Integer NbOfIso();

		/****************** Shape ******************/
		/**** md5 signature: c40d2651cf3439795c161bba801087bd ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: HLRTopoBRep_OutLiner

Returns
-------
None
") Shape;
		void Shape(const opencascade::handle<HLRTopoBRep_OutLiner> & S);

		/****************** Shape ******************/
		/**** md5 signature: 9d560c29d1d7462539af7e9c3fd99beb ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRTopoBRep_OutLiner>
") Shape;
		const opencascade::handle<HLRTopoBRep_OutLiner> & Shape();

		/****************** ShapeData ******************/
		/**** md5 signature: 63c6b83301d53a94834f3840c5a95655 ****/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "No available documentation.

Parameters
----------
SD: Standard_Transient

Returns
-------
None
") ShapeData;
		void ShapeData(const opencascade::handle<Standard_Transient> & SD);

		/****************** ShapeData ******************/
		/**** md5 signature: 333878c93abf5945b936c3ab1b51c32e ****/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") ShapeData;
		const opencascade::handle<Standard_Transient> & ShapeData();

		/****************** Sizes ******************/
		/**** md5 signature: 6e03d1fb636ffd96e03886872ae43cbc ****/
		%feature("compactdefaultargs") Sizes;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
NV: int
NE: int
NF: int
") Sizes;
		void Sizes(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Translate ******************/
		/**** md5 signature: ad6e8ce71dff0ff74ad40c8a7677de8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
NV: int
NE: int
NF: int

Returns
-------
None
") Translate;
		void Translate(const Standard_Integer NV, const Standard_Integer NE, const Standard_Integer NF);

		/****************** UpdateMinMax ******************/
		/**** md5 signature: c563cf49ef5528b88530ee707872c5e6 ****/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
theTotMinMax: HLRAlgo_EdgesBlock::MinMaxIndices

Returns
-------
None
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
		/****************** Load ******************/
		/**** md5 signature: 585d95ec184c2728ffe4987b5958a887 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Creates a datastructure containing the outliner <s> depending on the projector <p> and nbiso.

Parameters
----------
S: HLRTopoBRep_OutLiner
P: HLRAlgo_Projector
MST: BRepTopAdaptor_MapOfShapeTool
nbIso: int,optional
	default value is 0

Returns
-------
opencascade::handle<HLRBRep_Data>
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
		/****************** AxeOfRevolution ******************/
		/**** md5 signature: 774f6b487a9c91f2e3802b53c6f52934 ****/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
gp_Ax1
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution(const Standard_Address S);

		/****************** BSpline ******************/
		/**** md5 signature: 4695f4a3cad1aeda00bf7c7841037db8 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline(const Standard_Address S);

		/****************** BasisCurve ******************/
		/**** md5 signature: 3449d1f2a4c351a42135a6894bbd624b ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		static opencascade::handle<Adaptor3d_HCurve> BasisCurve(const Standard_Address S);

		/****************** BasisSurface ******************/
		/**** md5 signature: 50ab537b396967f0626793f834225bd9 ****/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") BasisSurface;
		static opencascade::handle<Adaptor3d_HSurface> BasisSurface(const Standard_Address S);

		/****************** Bezier ******************/
		/**** md5 signature: 1b7883c3f8ccd14ba98ea3102b92482a ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier(const Standard_Address S);

		/****************** Cone ******************/
		/**** md5 signature: 9116ace92295c2b717b2e79fa73bf64b ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
gp_Cone
") Cone;
		static gp_Cone Cone(const Standard_Address S);

		/****************** Cylinder ******************/
		/**** md5 signature: 319460b2f0a60310bde48833957a0a91 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
gp_Cylinder
") Cylinder;
		static gp_Cylinder Cylinder(const Standard_Address S);

		/****************** D0 ******************/
		/**** md5 signature: 386213dc28ade2f890d2f5be1547aaa1 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
u: float
v: float
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 579ba7f4726dfc0972727190519230ac ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
u: float
v: float
P: gp_Pnt
D1u: gp_Vec
D1v: gp_Vec

Returns
-------
None
") D1;
		static void D1(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1u, gp_Vec & D1v);

		/****************** D2 ******************/
		/**** md5 signature: 7ecbecc48d83901accd97713f8d50de3 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") D2;
		static void D2(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		/**** md5 signature: 0290e8d24b84bf13182c70eca72b3a89 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

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

Returns
-------
None
") D3;
		static void D3(const Standard_Address S, const Standard_Real u, const Standard_Real v, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		/**** md5 signature: b83a1f1078fa21e66749acd7ddb1bde1 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
u: float
v: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const Standard_Address S, const Standard_Real u, const Standard_Real v, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Direction ******************/
		/**** md5 signature: 792b1b8de9ba06c93f71fd5ec6831045 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
gp_Dir
") Direction;
		static gp_Dir Direction(const Standard_Address S);

		/****************** FirstUParameter ******************/
		/**** md5 signature: 6e04b137dab4c5b166945e605ab70ea8 ****/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
float
") FirstUParameter;
		static Standard_Real FirstUParameter(const Standard_Address S);

		/****************** FirstVParameter ******************/
		/**** md5 signature: 3adaefd96854190b632c757288696f54 ****/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
float
") FirstVParameter;
		static Standard_Real FirstVParameter(const Standard_Address S);

		/****************** GetType ******************/
		/**** md5 signature: af7f71ef48b12d89bd1ccfb79f8b5cbb ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
GeomAbs_SurfaceType
") GetType;
		static GeomAbs_SurfaceType GetType(const Standard_Address S);

		/****************** IsUClosed ******************/
		/**** md5 signature: 461ae9cbf9f4af5bb9698e7d522639ac ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
bool
") IsUClosed;
		static Standard_Boolean IsUClosed(const Standard_Address S);

		/****************** IsUPeriodic ******************/
		/**** md5 signature: 8f734a7cfb3edf22adf9628add5a5891 ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
bool
") IsUPeriodic;
		static Standard_Boolean IsUPeriodic(const Standard_Address S);

		/****************** IsVClosed ******************/
		/**** md5 signature: efa961c94006eb3089b0699bab1d0c1c ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
bool
") IsVClosed;
		static Standard_Boolean IsVClosed(const Standard_Address S);

		/****************** IsVPeriodic ******************/
		/**** md5 signature: 7926aca9924f7fc7fbfcef3fe14aa396 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
bool
") IsVPeriodic;
		static Standard_Boolean IsVPeriodic(const Standard_Address S);

		/****************** LastUParameter ******************/
		/**** md5 signature: f2a9f5d3250a667370bf390e6ac0c08e ****/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
float
") LastUParameter;
		static Standard_Real LastUParameter(const Standard_Address S);

		/****************** LastVParameter ******************/
		/**** md5 signature: b8355c68406b1dfc8be1d82e8b506bec ****/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
float
") LastVParameter;
		static Standard_Real LastVParameter(const Standard_Address S);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 8f1620b5617d2e63b048978c72d7fef8 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const Standard_Address S);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 11ce3cf3e58a1ce9f9ec6bb48af96ec2 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
u1: float
u2: float

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const Standard_Address S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		/**** md5 signature: a82f5bd7b9e757284443d92588a08924 ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const Standard_Address S);

		/****************** NbSamplesV ******************/
		/**** md5 signature: a2089a491614488d16ab97b5e5a07e56 ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
v1: float
v2: float

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const Standard_Address S, const Standard_Real v1, const Standard_Real v2);

		/****************** NbUIntervals ******************/
		/**** md5 signature: 5516eb3a8f3b210cf025639c7ec2f9a2 ****/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
Sh: GeomAbs_Shape

Returns
-------
int
") NbUIntervals;
		static Standard_Integer NbUIntervals(const Standard_Address S, const GeomAbs_Shape Sh);

		/****************** NbVIntervals ******************/
		/**** md5 signature: bd96f761c6f84259778f914d3f734f6c ****/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
Sh: GeomAbs_Shape

Returns
-------
int
") NbVIntervals;
		static Standard_Integer NbVIntervals(const Standard_Address S, const GeomAbs_Shape Sh);

		/****************** OffsetValue ******************/
		/**** md5 signature: eded75293dc119057b8f7ff6121b5261 ****/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
float
") OffsetValue;
		static Standard_Real OffsetValue(const Standard_Address S);

		/****************** Plane ******************/
		/**** md5 signature: 18aefb3d267fd8c0f21d3aa5d8154d4e ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
gp_Pln
") Plane;
		static gp_Pln Plane(const Standard_Address S);

		/****************** Sphere ******************/
		/**** md5 signature: 01a724a2628bfa4e0cc9f87eefc4d73f ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
gp_Sphere
") Sphere;
		static gp_Sphere Sphere(const Standard_Address S);

		/****************** Torus ******************/
		/**** md5 signature: 9f110fc52a07d36d19aefe5d2106d8fd ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
gp_Torus
") Torus;
		static gp_Torus Torus(const Standard_Address S);

		/****************** UIntervals ******************/
		/**** md5 signature: 85e0f7e1735591de2890181742678900 ****/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Returns
-------
None
") UIntervals;
		static void UIntervals(const Standard_Address S, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****************** UPeriod ******************/
		/**** md5 signature: 819bb74d78e04bf0ec8b085a289b4293 ****/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
float
") UPeriod;
		static Standard_Real UPeriod(const Standard_Address S);

		/****************** UResolution ******************/
		/**** md5 signature: 608a102cedd3f598f490045f31e2eff9 ****/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
R3d: float

Returns
-------
float
") UResolution;
		static Standard_Real UResolution(const Standard_Address S, const Standard_Real R3d);

		/****************** UTrim ******************/
		/**** md5 signature: 5785ae163102422a94c3377374cc646a ****/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "If <first> >= <last>.

Parameters
----------
S: Standard_Address
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") UTrim;
		static opencascade::handle<Adaptor3d_HSurface> UTrim(const Standard_Address S, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** VIntervals ******************/
		/**** md5 signature: 349fd1650c53bee88da5eb6085891c0c ****/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
T: TColStd_Array1OfReal
Sh: GeomAbs_Shape

Returns
-------
None
") VIntervals;
		static void VIntervals(const Standard_Address S, TColStd_Array1OfReal & T, const GeomAbs_Shape Sh);

		/****************** VPeriod ******************/
		/**** md5 signature: 5789ce07d40fd8fe19da4683e9309241 ****/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address

Returns
-------
float
") VPeriod;
		static Standard_Real VPeriod(const Standard_Address S);

		/****************** VResolution ******************/
		/**** md5 signature: b9fa52c61fbc638529fb1c50121c1e16 ****/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
R3d: float

Returns
-------
float
") VResolution;
		static Standard_Real VResolution(const Standard_Address S, const Standard_Real R3d);

		/****************** VTrim ******************/
		/**** md5 signature: f5d24d13f9913349e068709e9ac96e5b ****/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "If <first> >= <last>.

Parameters
----------
S: Standard_Address
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") VTrim;
		static opencascade::handle<Adaptor3d_HSurface> VTrim(const Standard_Address S, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 6dbf71d8deef85164fbe55f3e77b5728 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
u: float
v: float

Returns
-------
gp_Pnt
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
		/****************** HLRBRep_TheCSFunctionOfInterCSurf ******************/
		/**** md5 signature: dddb49b0f671f145f07224822f44d8a3 ****/
		%feature("compactdefaultargs") HLRBRep_TheCSFunctionOfInterCSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Standard_Address
C: gp_Lin

Returns
-------
None
") HLRBRep_TheCSFunctionOfInterCSurf;
		 HLRBRep_TheCSFunctionOfInterCSurf(const Standard_Address & S, const gp_Lin & C);

		/****************** AuxillarCurve ******************/
		/**** md5 signature: 6a61ff41c44fd5e0d96a3296ffda6b5b ****/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") AuxillarCurve;
		const gp_Lin AuxillarCurve();

		/****************** AuxillarSurface ******************/
		/**** md5 signature: 87061916fb36bcf60a62cdc5d51b199e ****/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_Address
") AuxillarSurface;
		const Standard_Address & AuxillarSurface();

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
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
		/****************** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter ******************/
		/**** md5 signature: dc489d8fc6afb00f97e01339a44990ef ****/
		%feature("compactdefaultargs") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
curve1: Standard_Address
curve2: Standard_Address

Returns
-------
None
") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter(const Standard_Address & curve1, const Standard_Address & curve2);

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
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
		/****************** HLRBRep_TheExactInterCSurf ******************/
		/**** md5 signature: 35027a872491f243347a98967181cab1 ****/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "Compute the solution point with the close point margincoef is the coefficient for extension of uv bounds. ex., ufirst -= margincoef*(ulast-ufirst).

Parameters
----------
U: float
V: float
W: float
F: HLRBRep_TheCSFunctionOfInterCSurf
TolTangency: float
MarginCoef: float,optional
	default value is 0.0

Returns
-------
None
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf(const Standard_Real U, const Standard_Real V, const Standard_Real W, const HLRBRep_TheCSFunctionOfInterCSurf & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****************** HLRBRep_TheExactInterCSurf ******************/
		/**** md5 signature: d179f3ee640105aa7eae2b41ac8aebf6 ****/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "Initialize the parameters to compute the solution.

Parameters
----------
F: HLRBRep_TheCSFunctionOfInterCSurf
TolTangency: float

Returns
-------
None
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf(const HLRBRep_TheCSFunctionOfInterCSurf & F, const Standard_Real TolTangency);

		/****************** Function ******************/
		/**** md5 signature: 42b19a18bcf6551f209a8f79f49f3a6e ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
HLRBRep_TheCSFunctionOfInterCSurf
") Function;
		HLRBRep_TheCSFunctionOfInterCSurf & Function();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** ParameterOnCurve ******************/
		/**** md5 signature: ac81682b4b1f0988f8f73835e37144bf ****/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****************** ParameterOnSurface ******************/
		/**** md5 signature: b1ff2b42bc6096157075c8f0a6c1b6a5 ****/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 193bc13b7dd6d13fbf6a72a44d7ddd7b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the solution it's possible to write to optimize: intimp_intcs inter(s1,c1,toltangency) math_functionsetroot rsnld(inter.function()) while ...{ u=... v=... w=... inter.perform(u,v,w,rsnld) } or intimp_intcs inter(toltangency) inter.setsurface(s); math_functionsetroot rsnld(inter.function()) while ...{ c=... inter.setcurve(c); u=... v=... w=... inter.perform(u,v,w,rsnld) }.

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

Returns
-------
None
") Perform;
		void Perform(const Standard_Real U, const Standard_Real V, const Standard_Real W, math_FunctionSetRoot & Rsnld, const Standard_Real u0, const Standard_Real v0, const Standard_Real u1, const Standard_Real v1, const Standard_Real w0, const Standard_Real w1);

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point the exception notdone is raised if isdone is false. the exception domainerror is raised if isempty is true.

Returns
-------
gp_Pnt
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
		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		/**** md5 signature: fcfdd64aa2c2d522ed3b64d9c5490dbc ****/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter();

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		/**** md5 signature: c6177a09eb30648e1d6dc6a88b4c02b6 ****/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		/**** md5 signature: 74e440ab552a6cacaa917310398ec74d ****/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		/**** md5 signature: 98fb253d56385e056e5ba58b09255c72 ****/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		/**** md5 signature: d7b24b192a879ef9e3731101880d3c41 ****/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		/**** md5 signature: 2fed0f0a7b09c728a424e068fe3d8d59 ****/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter(const gp_Hypr2d & H, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 256f0ab35aa34bea4dadb6bd5eb4a19c ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
L: gp_Lin2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Lin2d & L, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 08d385c076b409ee44899b99b87bce65 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a line and a parametric curve.

Parameters
----------
C: gp_Circ2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Circ2d & C, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: adcc3156cc7d9584606acdb0e8a9fcc3 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an ellipse and a parametric curve.

Parameters
----------
E: gp_Elips2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Elips2d & E, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 590908aa03a8133564eed84deecb5d15 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between a parabola and a parametric curve.

Parameters
----------
Prb: gp_Parab2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const gp_Parab2d & Prb, const IntRes2d_Domain & D1, const Standard_Address & PCurve, const IntRes2d_Domain & D2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 71d5c9759e509bec96b20ad2637d7730 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between the main branch of an hyperbola and a parametric curve.

Parameters
----------
H: gp_Hypr2d
D1: IntRes2d_Domain
PCurve: Standard_Address
D2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
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
		/****************** HLRBRep_TheIntPCurvePCurveOfCInter ******************/
		/**** md5 signature: 0695fdc8fa1d0dc9def3f03aaac66d0f ****/
		%feature("compactdefaultargs") HLRBRep_TheIntPCurvePCurveOfCInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_TheIntPCurvePCurveOfCInter;
		 HLRBRep_TheIntPCurvePCurveOfCInter();

		/****************** GetMinNbSamples ******************/
		/**** md5 signature: 337038c4c6920a9f4b1d8efd60cf2219 ****/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
		/**** md5 signature: 75a6ce72bd7eec344eb77f6930bd4f54 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve1: Standard_Address
Domain1: IntRes2d_Domain
Curve2: Standard_Address
Domain2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & Curve1, const IntRes2d_Domain & Domain1, const Standard_Address & Curve2, const IntRes2d_Domain & Domain2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** Perform ******************/
		/**** md5 signature: 3444554241e0391406b55fc664c16052 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve1: Standard_Address
Domain1: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Address & Curve1, const IntRes2d_Domain & Domain1, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		/**** md5 signature: 32ce254ec9cb1151513557c7a8edb457 ****/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "Set / get minimum number of points in polygon for intersection.

Parameters
----------
theMinNbSamples: int

Returns
-------
None
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
		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		/**** md5 signature: 649a5d51337d3bee9d8acb2d500cc8cb ****/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs an empty interference between polygon and polyhedron.

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf();

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		/**** md5 signature: 9a662104a5923a3db3c6bc30cd347e52 ****/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs and computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		/**** md5 signature: 3bb86f46141c92b411175e203ab25e49 ****/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs and computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		/**** md5 signature: f49aa8c9c38c517bde626c32e17dfb4a ****/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs and computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const Intf_Array1OfLin & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		/**** md5 signature: e9abc3f8ffcb76b644777d8515a87180 ****/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs and computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		/**** md5 signature: 736d91f670b7fff42e0b9e058f377413 ****/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs and computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		/**** md5 signature: 938875f7c5a892c7d600c3fc19abd9fd ****/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs and computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf(const Intf_Array1OfLin & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		/**** md5 signature: 34220ab879293bb4da6b378528e1d8ae ****/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "Compares the boundings between the segment of <thepolyg> and the facets of <thepolyh>.

Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") Interference;
		void Interference(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		/**** md5 signature: 11cb2f1b39b9a3c4d7e1a876414d1511 ****/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "Compares the boundings between the segment of <thepolyg> and the facets of <thepolyh>.

Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") Interference;
		void Interference(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: 275ab913ea58b7ed70af8ec61e979d83 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") Perform;
		void Perform(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: 9037d3afe578b7a123de772327e25beb ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: 6d6ce03fedf23875669997dba9551ac4 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") Perform;
		void Perform(const Intf_Array1OfLin & theLins, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: 9d72f3ea3d51d77277fd39ac981edc93 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: HLRBRep_ThePolygonOfInterCSurf
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") Perform;
		void Perform(const HLRBRep_ThePolygonOfInterCSurf & thePolyg, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		/**** md5 signature: a45c2f7531abebcdf9ffd623bce8a3de ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & theLin, const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		/**** md5 signature: 80f7c9a2729a5ff62423b11488230e9b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
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
		/****************** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ******************/
		/**** md5 signature: ceddaec07332ff871487862e824ed29d ****/
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter();

		/****************** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ******************/
		/**** md5 signature: f63808ec2ccfe9b74a79fd5e8ffc37dc ****/
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Standard_Address
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter(const IntCurve_IConicTool & ITool, const IntRes2d_Domain & Dom1, const Standard_Address & PCurve, const IntRes2d_Domain & Dom2, const Standard_Real TolConf, const Standard_Real Tol);

		/****************** And_Domaine_Objet1_Intersections ******************/
		/**** md5 signature: b25937465436483d60d73ecd96841b70 ****/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", "No available documentation.

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

Returns
-------
NbResultats: int
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections(const IntCurve_IConicTool & TheImpTool, const Standard_Address & TheParCurve, const IntRes2d_Domain & TheImpCurveDomain, const IntRes2d_Domain & TheParCurveDomain, Standard_Integer &OutValue, TColStd_Array1OfReal & Inter2_And_Domain2, TColStd_Array1OfReal & Inter1, TColStd_Array1OfReal & Resultat1, TColStd_Array1OfReal & Resultat2, const Standard_Real EpsNul);

		/****************** FindU ******************/
		/**** md5 signature: 73bba458174e8964e7a800b1e6377c1f ****/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", "No available documentation.

Parameters
----------
parameter: float
point: gp_Pnt2d
TheParCurev: Standard_Address
TheImpTool: IntCurve_IConicTool

Returns
-------
float
") FindU;
		Standard_Real FindU(const Standard_Real parameter, gp_Pnt2d & point, const Standard_Address & TheParCurev, const IntCurve_IConicTool & TheImpTool);

		/****************** FindV ******************/
		/**** md5 signature: 0086ec5c0d8c4e05c3fa4eb9c212c651 ****/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", "No available documentation.

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

Returns
-------
float
") FindV;
		Standard_Real FindV(const Standard_Real parameter, gp_Pnt2d & point, const IntCurve_IConicTool & TheImpTool, const Standard_Address & ParCurve, const IntRes2d_Domain & TheParCurveDomain, const Standard_Real V0, const Standard_Real V1, const Standard_Real Tolerance);

		/****************** Perform ******************/
		/**** md5 signature: e3bfb0880b36035ae94fd59907a3b653 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Intersection between an implicit curve and a parametrised curve. the exception constructionerror is raised if the domain of the parametrised curve does not verify hasfirstpoint and haslastpoint return true.

Parameters
----------
ITool: IntCurve_IConicTool
Dom1: IntRes2d_Domain
PCurve: Standard_Address
Dom2: IntRes2d_Domain
TolConf: float
Tol: float

Returns
-------
None
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
		/****************** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******************/
		/**** md5 signature: ddbc566b275baafc612d96b848ef7c5f ****/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter();

		/****************** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******************/
		/**** md5 signature: 2404bc558ec12c49789c3598f94daa2b ****/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Standard_Address
U0: float
TolU: float

Returns
-------
None
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter(const gp_Pnt2d & P, const Standard_Address & C, const Standard_Real U0, const Standard_Real TolU);

		/****************** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******************/
		/**** md5 signature: e0698389ad945e5cff9fe9be0284beb7 ****/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "Calculates the distance with a close point. the close point is defined by the parameter value u0. the function f(u)=distance(p,c(u)) has an extremum when g(u)=df/du=0. the algorithm searchs a zero near the close point. zeros are searched between umin et usup. tolu is used to decide to stop the iterations. at the nth iteration, the criteria is: abs(un - un-1) < tolu.

Parameters
----------
P: gp_Pnt2d
C: Standard_Address
U0: float
Umin: float
Usup: float
TolU: float

Returns
-------
None
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter(const gp_Pnt2d & P, const Standard_Address & C, const Standard_Real U0, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** Initialize ******************/
		/**** md5 signature: 80847cbf9c7c914995c1b28a4117b549 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the fields of the algorithm.

Parameters
----------
C: Standard_Address
Umin: float
Usup: float
TolU: float

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Address & C, const Standard_Real Umin, const Standard_Real Usup, const Standard_Real TolU);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		/**** md5 signature: 1c0b1dbd0d0c10c93cbf9fefce4bad3b ****/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
		/**** md5 signature: 572d96f228989fec803e5b8f273e32cd ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The algorithm is done with the point p. an exception is raised if the fields have not been initialized.

Parameters
----------
P: gp_Pnt2d
U0: float

Returns
-------
None
") Perform;
		void Perform(const gp_Pnt2d & P, const Standard_Real U0);

		/****************** Point ******************/
		/**** md5 signature: 0b14be81c893f7916dafa40cecb53c69 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
		/**** md5 signature: 2eba58521e0603c1ef0e683534b03956 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Returns the value of the extremum square distance.

Returns
-------
float
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
		/****************** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter ******************/
		/**** md5 signature: 758922762309bc321e3ec267e54bd834 ****/
		%feature("compactdefaultargs") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "Compute a polygon on the domain of the curve.

Parameters
----------
Curve: Standard_Address
NbPnt: int
Domain: IntRes2d_Domain
Tol: float

Returns
-------
None
") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter(const Standard_Address & Curve, const Standard_Integer NbPnt, const IntRes2d_Domain & Domain, const Standard_Real Tol);

		/****************** ApproxParamOnCurve ******************/
		/**** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ****/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "Give an approximation of the parameter on the curve according to the discretization of the curve.

Parameters
----------
Index: int
ParamOnLine: float

Returns
-------
float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****************** AutoIntersectionIsPossible ******************/
		/**** md5 signature: 461afa84e474b507672077d4d358a741 ****/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible();

		/****************** CalculRegion ******************/
		/**** md5 signature: 34769b0e402ed40fc1aa75180518eb35 ****/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: float
y: float
x1: float
x2: float
y1: float
y2: float

Returns
-------
int
") CalculRegion;
		Standard_Integer CalculRegion(const Standard_Real x, const Standard_Real y, const Standard_Real x1, const Standard_Real x2, const Standard_Real y1, const Standard_Real y2);

		/****************** Closed ******************/
		/**** md5 signature: c5b0bafd47da29606481588a971270ce ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
clos: bool

Returns
-------
None
") Closed;
		void Closed(const Standard_Boolean clos);

		/****************** Closed ******************/
		/**** md5 signature: fb3b1ea0f3831f02fc7dc8ae66caac7b ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the polyline is closed.

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** ComputeWithBox ******************/
		/**** md5 signature: 7d618b2066ef81b993e4f38bdebc62ca ****/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "The current polygon is modified if most of the points of the polygon are are outside the box <otherbox>. in this situation, bounds are computed to build a polygon inside or near the otherbox.

Parameters
----------
Curve: Standard_Address
OtherBox: Bnd_Box2d

Returns
-------
None
") ComputeWithBox;
		void ComputeWithBox(const Standard_Address & Curve, const Bnd_Box2d & OtherBox);

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 43f4e747867c1147de91dcc2fd648827 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** InfParameter ******************/
		/**** md5 signature: 8559659cfaf88d25c04ace5dcdcbde32 ****/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		/**** md5 signature: 3964cbfa1f20d4814234f7fc3d204bbb ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Segment ******************/
		/**** md5 signature: 86ed8dcd5c63b8c7622186f373e5af81 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the points of the segment <index> in the polygon.

Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Returns
-------
None
") Segment;
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

		/****************** SetDeflectionOverEstimation ******************/
		/**** md5 signature: 310446258d4443a660c9cfe280519b05 ****/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: float

Returns
-------
None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****************** SupParameter ******************/
		/**** md5 signature: 67f72e7357fa61911c23a764d72614ea ****/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the last point of the polygon.

Returns
-------
float
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
		/****************** HLRBRep_ThePolygonOfInterCSurf ******************/
		/**** md5 signature: 79543caa66f4a2eba12772466b930f36 ****/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: gp_Lin
NbPnt: int

Returns
-------
None
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const Standard_Integer NbPnt);

		/****************** HLRBRep_ThePolygonOfInterCSurf ******************/
		/**** md5 signature: 66656965e7c4fb784af8d64fcd3b894f ****/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: gp_Lin
U1: float
U2: float
NbPnt: int

Returns
-------
None
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const Standard_Real U1, const Standard_Real U2, const Standard_Integer NbPnt);

		/****************** HLRBRep_ThePolygonOfInterCSurf ******************/
		/**** md5 signature: 61e91cda033e4acddf27b3672e799663 ****/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: gp_Lin
Upars: TColStd_Array1OfReal

Returns
-------
None
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf(const gp_Lin & Curve, const TColStd_Array1OfReal & Upars);

		/****************** ApproxParamOnCurve ******************/
		/**** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ****/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "Give an approximation of the parameter on the curve according to the discretization of the curve.

Parameters
----------
Index: int
ParamOnLine: float

Returns
-------
float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****************** BeginOfSeg ******************/
		/**** md5 signature: 3d238bbcef54b3e034127352ea83ab27 ****/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") BeginOfSeg;
		const gp_Pnt BeginOfSeg(const Standard_Integer Index);

		/****************** Bounding ******************/
		/**** md5 signature: 8283e6d7921bb28044a85a5b8e0569c1 ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polygon.

Returns
-------
Bnd_Box
") Bounding;
		const Bnd_Box & Bounding();

		/****************** Closed ******************/
		/**** md5 signature: c5b0bafd47da29606481588a971270ce ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
clos: bool

Returns
-------
None
") Closed;
		void Closed(const Standard_Boolean clos);

		/****************** Closed ******************/
		/**** md5 signature: 6964da666f9b5a80bedb32cfb1fdc0ba ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 0e10e8a0297f14d67919e7ee30d4f816 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** EndOfSeg ******************/
		/**** md5 signature: 926c5cd8e4c3aff42af21c0c8b794c75 ****/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") EndOfSeg;
		const gp_Pnt EndOfSeg(const Standard_Integer Index);

		/****************** InfParameter ******************/
		/**** md5 signature: 8559659cfaf88d25c04ace5dcdcbde32 ****/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** SetDeflectionOverEstimation ******************/
		/**** md5 signature: 310446258d4443a660c9cfe280519b05 ****/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: float

Returns
-------
None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****************** SupParameter ******************/
		/**** md5 signature: 67f72e7357fa61911c23a764d72614ea ****/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the last point of the polygon.

Returns
-------
float
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
		/****************** BeginOfSeg ******************/
		/**** md5 signature: 55407fea5ab9036d69b424d673e06dba ****/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf
Index: int

Returns
-------
gp_Pnt
") BeginOfSeg;
		static const gp_Pnt BeginOfSeg(const HLRBRep_ThePolygonOfInterCSurf & thePolygon, const Standard_Integer Index);

		/****************** Bounding ******************/
		/**** md5 signature: a65a8cfe5e008ba3c420412aea532527 ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polygon.

Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Returns
-------
Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** Closed ******************/
		/**** md5 signature: 7974a746229283e640549ed6c6815362 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Returns
-------
bool
") Closed;
		static Standard_Boolean Closed(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 0bf744c4fcd18221f07d9a8c4f62cb20 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Returns
-------
float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** Dump ******************/
		/**** md5 signature: f89d69a95c39305c09d9e3ff050f23a9 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Returns
-------
None
") Dump;
		static void Dump(const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** EndOfSeg ******************/
		/**** md5 signature: 6f3f05b0e8fd64c1200cd86095e4a588 ****/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf
Index: int

Returns
-------
gp_Pnt
") EndOfSeg;
		static const gp_Pnt EndOfSeg(const HLRBRep_ThePolygonOfInterCSurf & thePolygon, const Standard_Integer Index);

		/****************** NbSegments ******************/
		/**** md5 signature: d176c4bd90c786c126613286e532eae4 ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: HLRBRep_ThePolygonOfInterCSurf

Returns
-------
int
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
		/****************** Bounding ******************/
		/**** md5 signature: dadf7ad2951be8c787a119fcb63ae887 ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polyhedrontool.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** ComponentsBounding ******************/
		/**** md5 signature: 5db00fc773feb22147eca6258b4688f6 ****/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "Give the array of boxes. the box <n> corresponding to the triangle <n>.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
opencascade::handle<Bnd_HArray1OfBox>
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: b23e8847ee8b23843b5cb969525baf23 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Give the tolerance of the polygon.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Dump ******************/
		/**** md5 signature: 702ac1d12e6272a4d2ec3e61c1d32fbb ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
None
") Dump;
		static void Dump(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** GetBorderDeflection ******************/
		/**** md5 signature: e6fbb19517eaae68e4d1fef6004cb753 ****/
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "This method returns a border deflection of the polyhedron.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
float
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** IsOnBound ******************/
		/**** md5 signature: 6c53cbb5e36d22da1872bca4c23234b5 ****/
		%feature("compactdefaultargs") IsOnBound;
		%feature("autodoc", "This method returns true if the edge based on points with indices index1 and index2 represents a boundary edge. it is necessary to take into account the boundary deflection for this edge.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Index1: int
Index2: int

Returns
-------
bool
") IsOnBound;
		static Standard_Boolean IsOnBound(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const Standard_Integer Index1, const Standard_Integer Index2);

		/****************** NbTriangles ******************/
		/**** md5 signature: 8aae3d76f3218cae09710e3ea2158686 ****/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Give the number of triangles in this polyedral surface.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf

Returns
-------
int
") NbTriangles;
		static Standard_Integer NbTriangles(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Point ******************/
		/**** md5 signature: 5674891cbaca4c7ce90a78a09fc4c54a ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Give the point of index i in the polyedral surface.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Index: int

Returns
-------
gp_Pnt
") Point;
		static const gp_Pnt Point(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const Standard_Integer Index);

		/****************** TriConnex ******************/
		/**** md5 signature: d041417e60bce37dbe8565dbf06d95a0 ****/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "Give the addresse tricon of the triangle connexe to the triangle of address triang by the edge pivot pedge and the third point of this connexe triangle. when we are on a free edge tricon==0 but the function return the value of the triangle in the other side of pivot on the free edge. used to turn around a vertex.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Triang: int
Pivot: int
Pedge: int

Returns
-------
TriCon: int
OtherP: int
") TriConnex;
		static Standard_Integer TriConnex(const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Triangle ******************/
		/**** md5 signature: 422f3843c714b9be42ae9a1ee9b5b2e6 ****/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Give the indices of the 3 points of the triangle of address index in the polyhedrontool.

Parameters
----------
thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
Index: int

Returns
-------
P1: int
P2: int
P3: int
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
		/****************** FindParameter ******************/
		/**** md5 signature: ece1816b3f28762e1d44b5aa074a236b ****/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. in that case, no bounds are given. the research of the rigth parameter has to be made on the natural parametric domain of the curve.

Parameters
----------
C: Standard_Address
Pnt: gp_Pnt2d
Tol: float

Returns
-------
float
") FindParameter;
		static Standard_Real FindParameter(const Standard_Address & C, const gp_Pnt2d & Pnt, const Standard_Real Tol);

		/****************** FindParameter ******************/
		/**** md5 signature: 7a692a1a974abdb0d81ce6c269a9e2dc ****/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Returns the parameter v of the point on the parametric curve corresponding to the point pnt. the correspondance between pnt and the point p(v) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. tol is the tolerance on the distance between a point and the parametrised curve. lowparameter and highparameter give the boundaries of the interval in wich the parameter certainly lies. these parameters are given to implement a more efficient algoritm. so, it is not necessary to check that the returned value verifies lowparameter <= value <= highparameter.

Parameters
----------
C: Standard_Address
Pnt: gp_Pnt2d
LowParameter: float
HighParameter: float
Tol: float

Returns
-------
float
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
		/****************** HLRBRep_TheQuadCurvExactInterCSurf ******************/
		/**** md5 signature: cbb3799ba29b24dbc7d64e6deede5e1b ****/
		%feature("compactdefaultargs") HLRBRep_TheQuadCurvExactInterCSurf;
		%feature("autodoc", "Provides the signed distance function : q(w) and its first derivative dq(w)/dw.

Parameters
----------
S: Standard_Address
C: gp_Lin

Returns
-------
None
") HLRBRep_TheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvExactInterCSurf(const Standard_Address & S, const gp_Lin & C);

		/****************** Intervals ******************/
		/**** md5 signature: a19f8bd23050233003b16b9179a07a15 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "U1 and u2 are the parameters of a segment on the curve.

Parameters
----------
Index: int

Returns
-------
U1: float
U2: float
") Intervals;
		void Intervals(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIntervals ******************/
		/**** md5 signature: 64f54fde4d9752772b52d73d27261bcb ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbRoots ******************/
		/**** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ****/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Root ******************/
		/**** md5 signature: 2e5be20bda2ce764c489750fb301f80e ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
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
		/****************** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf ******************/
		/**** md5 signature: 949d0c28db942aebdafe829dad999512 ****/
		%feature("compactdefaultargs") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		%feature("autodoc", "Create the function.

Parameters
----------
Q: IntSurf_Quadric
C: gp_Lin

Returns
-------
None
") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf(const IntSurf_Quadric & Q, const gp_Lin & C);

		/****************** Derivative ******************/
		/**** md5 signature: f61c873331fa555e182f1973e95f59da ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the previous function at parameter param. derivative always returns true.

Parameters
----------
Param: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the signed distance between the implicit surface and the point at parameter param on the parametrised curve. value always returns true.

Parameters
----------
Param: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function. returns true.

Parameters
----------
Param: float

Returns
-------
F: float
D: float
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
		/****************** HLRBRep_VertexList ******************/
		/**** md5 signature: 1088c64383a391d12d62657d4b5eba0e ****/
		%feature("compactdefaultargs") HLRBRep_VertexList;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: HLRBRep_EdgeInterferenceTool
I: HLRAlgo_ListIteratorOfInterferenceList

Returns
-------
None
") HLRBRep_VertexList;
		 HLRBRep_VertexList(const HLRBRep_EdgeInterferenceTool & T, const HLRAlgo_ListIteratorOfInterferenceList & I);

		/****************** BoundaryTransition ******************/
		/**** md5 signature: 74f690bd95102dfac559cd0dc3a25347 ****/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "Returns the transition of the current vertex relative to the boundary if it is an interference.

Returns
-------
TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();

		/****************** Current ******************/
		/**** md5 signature: 0e36ea5e4e93af9d6e97cff42aa74163 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current vertex.

Returns
-------
HLRAlgo_Intersection
") Current;
		const HLRAlgo_Intersection & Current();

		/****************** IsBoundary ******************/
		/**** md5 signature: 9d78e8db3d0caa05aa9a267c764c472e ****/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Returns true if the current vertex is is on the boundary of the edge.

Returns
-------
bool
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****************** IsInterference ******************/
		/**** md5 signature: 70cfb7482a8242c7b6f97a307bb277ee ****/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Returns true if the current vertex is an interference.

Returns
-------
bool
") IsInterference;
		Standard_Boolean IsInterference();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true when the curve is periodic.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true when there are more vertices.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Proceeds to the next vertex.

Returns
-------
None
") Next;
		void Next();

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the current vertex if it is on the boundary of the edge.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Transition ******************/
		/**** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Returns the transition of the current vertex if it is an interference.

Returns
-------
TopAbs_Orientation
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
		/****************** HLRBRep_Algo ******************/
		/**** md5 signature: d6b9b1e2082659fa3788d431cf502e4e ****/
		%feature("compactdefaultargs") HLRBRep_Algo;
		%feature("autodoc", "Constructs an empty framework for the calculation of visible and hidden lines of a shape in a projection. use the function: - projector to define the point of view - add to select the shape or shapes to be visualized - update to compute the outlines of the shape, and - hide to compute the visible and hidden lines of the shape.

Returns
-------
None
") HLRBRep_Algo;
		 HLRBRep_Algo();

		/****************** HLRBRep_Algo ******************/
		/**** md5 signature: 07a4358a369d01290f5731ee7cb90936 ****/
		%feature("compactdefaultargs") HLRBRep_Algo;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: HLRBRep_Algo

Returns
-------
None
") HLRBRep_Algo;
		 HLRBRep_Algo(const opencascade::handle<HLRBRep_Algo> & A);

		/****************** Add ******************/
		/**** md5 signature: 6379c0d305ee414dfad782cb1da8368d ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Add the shape <s>.

Parameters
----------
S: TopoDS_Shape
SData: Standard_Transient
nbIso: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & S, const opencascade::handle<Standard_Transient> & SData, const Standard_Integer nbIso = 0);

		/****************** Add ******************/
		/**** md5 signature: 77b1d033995ab33411a6e2d6d031ec01 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shape s to this framework, and specifies the number of isoparameters nbiso desired in visualizing s. you may add as many shapes as you wish. use the function add once for each shape.

Parameters
----------
S: TopoDS_Shape
nbIso: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & S, const Standard_Integer nbIso = 0);

		/****************** Index ******************/
		/**** md5 signature: 608bba99c3bb7818dd553bf28d6b3a79 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return the index of the shape <s> and return 0 if the shape <s> is not found.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") Index;
		Standard_Integer Index(const TopoDS_Shape & S);

		/****************** OutLinedShapeNullify ******************/
		/**** md5 signature: 038d68d7b4c4de233e55ad5d723e4ec9 ****/
		%feature("compactdefaultargs") OutLinedShapeNullify;
		%feature("autodoc", "Nullify all the results of outliner from hlrtopobrep.

Returns
-------
None
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
