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
#include<TopAbs_module.hxx>
#include<HLRAlgo_module.hxx>
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
%import TopAbs.i
%import HLRAlgo.i
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

/* handles */
%wrap_handle(HLRBRep_AreaLimit)
%wrap_handle(HLRBRep_Data)
%wrap_handle(HLRBRep_InternalAlgo)
%wrap_handle(HLRBRep_PolyAlgo)
%wrap_handle(HLRBRep_Algo)
/* end handles declaration */

/* templates */
%template(HLRBRep_ListOfBPoint) NCollection_List <HLRBRep_BiPoint>;
%template(HLRBRep_ListIteratorOfListOfBPoint) NCollection_TListIterator<HLRBRep_BiPoint>;
%template(HLRBRep_SeqOfShapeBounds) NCollection_Sequence <HLRBRep_ShapeBounds>;
%template(HLRBRep_Array1OfEData) NCollection_Array1 <HLRBRep_EdgeData>;

%extend NCollection_Array1 <HLRBRep_EdgeData> {
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
%template(HLRBRep_Array1OfFData) NCollection_Array1 <HLRBRep_FaceData>;

%extend NCollection_Array1 <HLRBRep_FaceData> {
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
%template(HLRBRep_ListOfBPnt2D) NCollection_List <HLRBRep_BiPnt2D>;
%template(HLRBRep_ListIteratorOfListOfBPnt2D) NCollection_TListIterator<HLRBRep_BiPnt2D>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <HLRBRep_BiPoint> HLRBRep_ListOfBPoint;
typedef NCollection_List <HLRBRep_BiPoint>::Iterator HLRBRep_ListIteratorOfListOfBPoint;
typedef NCollection_Sequence <HLRBRep_ShapeBounds> HLRBRep_SeqOfShapeBounds;
typedef NCollection_Array1 <HLRBRep_EdgeData> HLRBRep_Array1OfEData;
typedef NCollection_Array1 <HLRBRep_FaceData> HLRBRep_Array1OfFData;
typedef NCollection_List <HLRBRep_BiPnt2D> HLRBRep_ListOfBPnt2D;
typedef NCollection_List <HLRBRep_BiPnt2D>::Iterator HLRBRep_ListIteratorOfListOfBPnt2D;
/* end typedefs declaration */

/****************
* class HLRBRep *
****************/
%rename(hlrbrep) HLRBRep;
class HLRBRep {
	public:
		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", ":param ec:
	:type ec: HLRBRep_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: TopoDS_Edge") MakeEdge;
		static TopoDS_Edge MakeEdge (const HLRBRep_Curve & ec,const Standard_Real U1,const Standard_Real U2);

		/****************** MakeEdge3d ******************/
		%feature("compactdefaultargs") MakeEdge3d;
		%feature("autodoc", ":param ec:
	:type ec: HLRBRep_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: TopoDS_Edge") MakeEdge3d;
		static TopoDS_Edge MakeEdge3d (const HLRBRep_Curve & ec,const Standard_Real U1,const Standard_Real U2);

		/****************** PolyHLRAngleAndDeflection ******************/
		%feature("compactdefaultargs") PolyHLRAngleAndDeflection;
		%feature("autodoc", ":param InAngl:
	:type InAngl: float
	:param OutAngl:
	:type OutAngl: float
	:param OutDefl:
	:type OutDefl: float
	:rtype: void") PolyHLRAngleAndDeflection;
		static void PolyHLRAngleAndDeflection (const Standard_Real InAngl,Standard_Real &OutValue,Standard_Real &OutValue);

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
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** EdgeAfter ******************/
		%feature("compactdefaultargs") EdgeAfter;
		%feature("autodoc", ":param St:
	:type St: TopAbs_State
	:rtype: None") EdgeAfter;
		void EdgeAfter (const TopAbs_State St);

		/****************** EdgeAfter ******************/
		%feature("compactdefaultargs") EdgeAfter;
		%feature("autodoc", ":rtype: TopAbs_State") EdgeAfter;
		TopAbs_State EdgeAfter ();

		/****************** EdgeBefore ******************/
		%feature("compactdefaultargs") EdgeBefore;
		%feature("autodoc", ":param St:
	:type St: TopAbs_State
	:rtype: None") EdgeBefore;
		void EdgeBefore (const TopAbs_State St);

		/****************** EdgeBefore ******************/
		%feature("compactdefaultargs") EdgeBefore;
		%feature("autodoc", ":rtype: TopAbs_State") EdgeBefore;
		TopAbs_State EdgeBefore ();

		/****************** HLRBRep_AreaLimit ******************/
		%feature("compactdefaultargs") HLRBRep_AreaLimit;
		%feature("autodoc", "* The previous and next field are set to NULL.
	:param V:
	:type V: HLRAlgo_Intersection
	:param Boundary:
	:type Boundary: bool
	:param Interference:
	:type Interference: bool
	:param StateBefore:
	:type StateBefore: TopAbs_State
	:param StateAfter:
	:type StateAfter: TopAbs_State
	:param EdgeBefore:
	:type EdgeBefore: TopAbs_State
	:param EdgeAfter:
	:type EdgeAfter: TopAbs_State
	:rtype: None") HLRBRep_AreaLimit;
		 HLRBRep_AreaLimit (const HLRAlgo_Intersection & V,const Standard_Boolean Boundary,const Standard_Boolean Interference,const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_State EdgeBefore,const TopAbs_State EdgeAfter);

		/****************** IsBoundary ******************/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", ":rtype: bool") IsBoundary;
		Standard_Boolean IsBoundary ();

		/****************** IsInterference ******************/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", ":rtype: bool") IsInterference;
		Standard_Boolean IsInterference ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":param N:
	:type N: HLRBRep_AreaLimit
	:rtype: None") Next;
		void Next (const opencascade::handle<HLRBRep_AreaLimit> & N);

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: opencascade::handle<HLRBRep_AreaLimit>") Next;
		opencascade::handle<HLRBRep_AreaLimit> Next ();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", ":param P:
	:type P: HLRBRep_AreaLimit
	:rtype: None") Previous;
		void Previous (const opencascade::handle<HLRBRep_AreaLimit> & P);

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", ":rtype: opencascade::handle<HLRBRep_AreaLimit>") Previous;
		opencascade::handle<HLRBRep_AreaLimit> Previous ();

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", ":param St:
	:type St: TopAbs_State
	:rtype: None") StateAfter;
		void StateAfter (const TopAbs_State St);

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", ":rtype: TopAbs_State") StateAfter;
		TopAbs_State StateAfter ();

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", ":param St:
	:type St: TopAbs_State
	:rtype: None") StateBefore;
		void StateBefore (const TopAbs_State St);

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", ":rtype: TopAbs_State") StateBefore;
		TopAbs_State StateBefore ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: HLRAlgo_Intersection") Vertex;
		const HLRAlgo_Intersection & Vertex ();

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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline (const BRepAdaptor_Curve & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier (const BRepAdaptor_Curve & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: gp_Circ") Circle;
		static gp_Circ Circle (const BRepAdaptor_Curve & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const BRepAdaptor_Curve & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: BRepAdaptor_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		static void D0 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param C:
	:type C: BRepAdaptor_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		static void D1 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param C:
	:type C: BRepAdaptor_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D2;
		static void D2 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param C:
	:type C: BRepAdaptor_Curve
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None") D3;
		static void D3 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param C:
	:type C: BRepAdaptor_Curve
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		static gp_Vec DN (const BRepAdaptor_Curve & C,const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: int") Degree;
		static Standard_Integer Degree (const BRepAdaptor_Curve & C);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: gp_Elips") Ellipse;
		static gp_Elips Ellipse (const BRepAdaptor_Curve & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const BRepAdaptor_Curve & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:param C:
	:type C: BRepAdaptor_Curve
	:rtype: GeomAbs_CurveType") GetType;
		static GeomAbs_CurveType GetType (const BRepAdaptor_Curve & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: gp_Hypr") Hyperbola;
		static gp_Hypr Hyperbola (const BRepAdaptor_Curve & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param C:
	:type C: BRepAdaptor_Curve
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		static void Intervals (const BRepAdaptor_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const BRepAdaptor_Curve & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: bool") IsPeriodic;
		static Standard_Boolean IsPeriodic (const BRepAdaptor_Curve & C);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: bool") IsRational;
		static Standard_Boolean IsRational (const BRepAdaptor_Curve & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const BRepAdaptor_Curve & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: gp_Lin") Line;
		static gp_Lin Line (const BRepAdaptor_Curve & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>
	:param C:
	:type C: BRepAdaptor_Curve
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		static Standard_Integer NbIntervals (const BRepAdaptor_Curve & C,const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: int") NbKnots;
		static Standard_Integer NbKnots (const BRepAdaptor_Curve & C);

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: int") NbPoles;
		static Standard_Integer NbPoles (const BRepAdaptor_Curve & C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int") NbSamples;
		static Standard_Integer NbSamples (const BRepAdaptor_Curve & C,const Standard_Real U0,const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: gp_Parab") Parabola;
		static gp_Parab Parabola (const BRepAdaptor_Curve & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:rtype: float") Period;
		static Standard_Real Period (const BRepAdaptor_Curve & C);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:param T:
	:type T: TColgp_Array1OfPnt
	:rtype: void") Poles;
		static void Poles (const BRepAdaptor_Curve & C,TColgp_Array1OfPnt & T);

		/****************** PolesAndWeights ******************/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", ":param C:
	:type C: BRepAdaptor_Curve
	:param T:
	:type T: TColgp_Array1OfPnt
	:param W:
	:type W: TColStd_Array1OfReal
	:rtype: void") PolesAndWeights;
		static void PolesAndWeights (const BRepAdaptor_Curve & C,TColgp_Array1OfPnt & T,TColStd_Array1OfReal & W);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param C:
	:type C: BRepAdaptor_Curve
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		static Standard_Real Resolution (const BRepAdaptor_Curve & C,const Standard_Real R3d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: BRepAdaptor_Curve
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		static gp_Pnt Value (const BRepAdaptor_Curve & C,const Standard_Real U);

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
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", ":rtype: None") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D ();

		/****************** HLRBRep_BiPnt2D ******************/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", ":param x1:
	:type x1: float
	:param y1:
	:type y1: float
	:param x2:
	:type x2: float
	:param y2:
	:type y2: float
	:param S:
	:type S: TopoDS_Shape
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D (const Standard_Real x1,const Standard_Real y1,const Standard_Real x2,const Standard_Real y2,const TopoDS_Shape & S,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);

		/****************** HLRBRep_BiPnt2D ******************/
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", ":param thePoint1:
	:type thePoint1: gp_XY
	:param thePoint2:
	:type thePoint2: gp_XY
	:param S:
	:type S: TopoDS_Shape
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D (const gp_XY & thePoint1,const gp_XY & thePoint2,const TopoDS_Shape & S,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", ":rtype: bool") IntLine;
		Standard_Boolean IntLine ();

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") IntLine;
		void IntLine (const Standard_Boolean B);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":rtype: bool") OutLine;
		Standard_Boolean OutLine ();

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") OutLine;
		void OutLine (const Standard_Boolean B);

		/****************** P1 ******************/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", ":rtype: gp_Pnt2d") P1;
		const gp_Pnt2d  P1 ();

		/****************** P2 ******************/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", ":rtype: gp_Pnt2d") P2;
		const gp_Pnt2d  P2 ();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":rtype: bool") Rg1Line;
		Standard_Boolean Rg1Line ();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Rg1Line;
		void Rg1Line (const Standard_Boolean B);

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":rtype: bool") RgNLine;
		Standard_Boolean RgNLine ();

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") RgNLine;
		void RgNLine (const Standard_Boolean B);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Shape;
		void Shape (const TopoDS_Shape & S);

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
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", ":rtype: None") HLRBRep_BiPoint;
		 HLRBRep_BiPoint ();

		/****************** HLRBRep_BiPoint ******************/
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", ":param x1:
	:type x1: float
	:param y1:
	:type y1: float
	:param z1:
	:type z1: float
	:param x2:
	:type x2: float
	:param y2:
	:type y2: float
	:param z2:
	:type z2: float
	:param S:
	:type S: TopoDS_Shape
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None") HLRBRep_BiPoint;
		 HLRBRep_BiPoint (const Standard_Real x1,const Standard_Real y1,const Standard_Real z1,const Standard_Real x2,const Standard_Real y2,const Standard_Real z2,const TopoDS_Shape & S,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", ":rtype: bool") IntLine;
		Standard_Boolean IntLine ();

		/****************** IntLine ******************/
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") IntLine;
		void IntLine (const Standard_Boolean B);

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":rtype: bool") OutLine;
		Standard_Boolean OutLine ();

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") OutLine;
		void OutLine (const Standard_Boolean B);

		/****************** P1 ******************/
		%feature("compactdefaultargs") P1;
		%feature("autodoc", ":rtype: gp_Pnt") P1;
		const gp_Pnt  P1 ();

		/****************** P2 ******************/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", ":rtype: gp_Pnt") P2;
		const gp_Pnt  P2 ();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":rtype: bool") Rg1Line;
		Standard_Boolean Rg1Line ();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Rg1Line;
		void Rg1Line (const Standard_Boolean B);

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":rtype: bool") RgNLine;
		Standard_Boolean RgNLine ();

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") RgNLine;
		void RgNLine (const Standard_Boolean B);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Shape;
		void Shape (const TopoDS_Shape & S);

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
		/****************** ComputeDomain ******************/
		%feature("compactdefaultargs") ComputeDomain;
		%feature("autodoc", "* Create a domain from a curve
	:param C1:
	:type C1: Standard_Address
	:param TolDomain:
	:type TolDomain: float
	:rtype: IntRes2d_Domain") ComputeDomain;
		IntRes2d_Domain ComputeDomain (const Standard_Address & C1,const Standard_Real TolDomain);

		/****************** GetMinNbSamples ******************/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", ":rtype: int") GetMinNbSamples;
		Standard_Integer GetMinNbSamples ();

		/****************** HLRBRep_CInter ******************/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") HLRBRep_CInter;
		 HLRBRep_CInter ();

		/****************** HLRBRep_CInter ******************/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "* Self Intersection of a curve
	:param C:
	:type C: Standard_Address
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "* Self Intersection of a curve with a domain.
	:param C:
	:type C: Standard_Address
	:param D:
	:type D: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C,const IntRes2d_Domain & D,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param C2:
	:type C2: Standard_Address
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Standard_Address
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param C2:
	:type C2: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_CInter ******************/
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param C2:
	:type C2: Standard_Address
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param D1:
	:type D1: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & C1,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param D1:
	:type D1: IntRes2d_Domain
	:param C2:
	:type C2: Standard_Address
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between 2 curves.
	:param C1:
	:type C1: Standard_Address
	:param C2:
	:type C2: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & C1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "* Set / get minimum number of points in polygon intersection.
	:param theMinNbSamples:
	:type theMinNbSamples: int
	:rtype: None") SetMinNbSamples;
		void SetMinNbSamples (const Standard_Integer theMinNbSamples);

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
		/****************** CentreOfCurvature ******************/
		%feature("compactdefaultargs") CentreOfCurvature;
		%feature("autodoc", "* Returns the centre of curvature <P>.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt2d & P);

		/****************** Curvature ******************/
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "* Returns the curvature.
	:rtype: float") Curvature;
		Standard_Real Curvature ();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Returns the first derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec2d") D1;
		const gp_Vec2d  D1 ();

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the second derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec2d") D2;
		const gp_Vec2d  D2 ();

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the third derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec2d") D3;
		const gp_Vec2d  D3 ();

		/****************** HLRBRep_CLProps ******************/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "* Initializes the local properties of the curve <C> The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, 2 or 3). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
	:param C:
	:type C: HLRBRep_Curve *
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") HLRBRep_CLProps;
		 HLRBRep_CLProps (const HLRBRep_Curve * & C,const Standard_Integer N,const Standard_Real Resolution);

		/****************** HLRBRep_CLProps ******************/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U>. All the computations done will be related to <C> and <U>.
	:param C:
	:type C: HLRBRep_Curve *
	:param U:
	:type U: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") HLRBRep_CLProps;
		 HLRBRep_CLProps (const HLRBRep_Curve * & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);

		/****************** HLRBRep_CLProps ******************/
		%feature("compactdefaultargs") HLRBRep_CLProps;
		%feature("autodoc", "* Same as previous constructor but here the parameter is set to the value <U> and the curve is set with SetCurve. the curve can have a empty constructor All the computations done will be related to <C> and <U> when the functions 'set' will be done.
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") HLRBRep_CLProps;
		 HLRBRep_CLProps (const Standard_Integer N,const Standard_Real Resolution);

		/****************** IsTangentDefined ******************/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "* Returns True if the tangent is defined. For example, the tangent is not defined if the three first derivatives are all null.
	:rtype: bool") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Returns the normal direction <N>.
	:param N:
	:type N: gp_Dir2d
	:rtype: None") Normal;
		void Normal (gp_Dir2d & N);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "* Initializes the local properties of the curve for the new curve.
	:param C:
	:type C: HLRBRep_Curve *
	:rtype: None") SetCurve;
		void SetCurve (const HLRBRep_Curve * & C);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Initializes the local properties of the curve for the parameter value <U>.
	:param U:
	:type U: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real U);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "* output the tangent direction <D>
	:param D:
	:type D: gp_Dir2d
	:rtype: None") Tangent;
		void Tangent (gp_Dir2d & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Point.
	:rtype: gp_Pnt2d") Value;
		const gp_Pnt2d  Value ();

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
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the order of continuity of the curve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.
	:param A:
	:type A: HLRBRep_Curve *
	:rtype: int") Continuity;
		static Standard_Integer Continuity (const HLRBRep_Curve * A);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.
	:param A:
	:type A: HLRBRep_Curve *
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None") D1;
		static void D1 (const HLRBRep_Curve * A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.
	:param A:
	:type A: HLRBRep_Curve *
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		static void D2 (const HLRBRep_Curve * A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.
	:param A:
	:type A: HLRBRep_Curve *
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None") D3;
		static void D3 (const HLRBRep_Curve * A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* returns the first parameter bound of the curve.
	:param A:
	:type A: HLRBRep_Curve *
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const HLRBRep_Curve * A);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.
	:param A:
	:type A: HLRBRep_Curve *
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const HLRBRep_Curve * A);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point <P> of parameter <U> on the Curve from HLRBRep <C>.
	:param A:
	:type A: HLRBRep_Curve *
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void") Value;
		static void Value (const HLRBRep_Curve * A,const Standard_Real U,gp_Pnt2d & P);

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
		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ2d") Circle;
		gp_Circ2d Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the 3D curve.
	:rtype: BRepAdaptor_Curve") Curve;
		BRepAdaptor_Curve & Curve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Sets the 3D curve to be projected.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Curve;
		void Curve (const TopoDS_Edge & E);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the 3D point of parameter U on the curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Raised if the continuity of the current interval is not C2.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":rtype: int") Degree;
		Standard_Integer Degree ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips2d") Ellipse;
		gp_Elips2d Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns the 3D curve.
	:rtype: BRepAdaptor_Curve") GetCurve;
		const BRepAdaptor_Curve & GetCurve ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** HLRBRep_Curve ******************/
		%feature("compactdefaultargs") HLRBRep_Curve;
		%feature("autodoc", "* Creates an undefined Curve.
	:rtype: None") HLRBRep_Curve;
		 HLRBRep_Curve ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr2d") Hyperbola;
		gp_Hypr2d Hyperbola ();

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":rtype: bool") IsRational;
		Standard_Boolean IsRational ();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", ":param kn:
	:type kn: TColStd_Array1OfReal
	:rtype: None") Knots;
		void Knots (TColStd_Array1OfReal & kn);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin2d") Line;
		gp_Lin2d Line ();

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", ":param mu:
	:type mu: TColStd_Array1OfInteger
	:rtype: None") Multiplicities;
		void Multiplicities (TColStd_Array1OfInteger & mu);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":rtype: int") NbKnots;
		Standard_Integer NbKnots ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":rtype: int") NbPoles;
		Standard_Integer NbPoles ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab2d") Parabola;
		gp_Parab2d Parabola ();

		/****************** Parameter2d ******************/
		%feature("compactdefaultargs") Parameter2d;
		%feature("autodoc", "* Returns the parameter on the 2d curve from the parameter on the 3d curve.
	:param P3d:
	:type P3d: float
	:rtype: float") Parameter2d;
		Standard_Real Parameter2d (const Standard_Real P3d);

		/****************** Parameter3d ******************/
		%feature("compactdefaultargs") Parameter3d;
		%feature("autodoc", "* Returns the parameter on the 3d curve from the parameter on the 2d curve.
	:param P2d:
	:type P2d: float
	:rtype: float") Parameter3d;
		Standard_Real Parameter3d (const Standard_Real P2d);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", ":param TP:
	:type TP: TColgp_Array1OfPnt2d
	:rtype: None") Poles;
		void Poles (TColgp_Array1OfPnt2d & TP);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", ":param aCurve:
	:type aCurve: Geom_BSplineCurve
	:param TP:
	:type TP: TColgp_Array1OfPnt2d
	:rtype: None") Poles;
		void Poles (const opencascade::handle<Geom_BSplineCurve> & aCurve,TColgp_Array1OfPnt2d & TP);

		/****************** PolesAndWeights ******************/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", ":param TP:
	:type TP: TColgp_Array1OfPnt2d
	:param TW:
	:type TW: TColStd_Array1OfReal
	:rtype: None") PolesAndWeights;
		void PolesAndWeights (TColgp_Array1OfPnt2d & TP,TColStd_Array1OfReal & TW);

		/****************** PolesAndWeights ******************/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", ":param aCurve:
	:type aCurve: Geom_BSplineCurve
	:param TP:
	:type TP: TColgp_Array1OfPnt2d
	:param TW:
	:type TW: TColStd_Array1OfReal
	:rtype: None") PolesAndWeights;
		void PolesAndWeights (const opencascade::handle<Geom_BSplineCurve> & aCurve,TColgp_Array1OfPnt2d & TP,TColStd_Array1OfReal & TW);

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", ":param Proj:
	:type Proj: HLRAlgo_Projector *
	:rtype: None") Projector;
		void Projector (const HLRAlgo_Projector * Proj);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** Tangent ******************/
		%feature("compactdefaultargs") Tangent;
		%feature("autodoc", "* Depending on <AtStart> computes the 2D point and tangent on the curve at sart (or at end). If the first derivative is null look after at start (or before at end) with the second derivative.
	:param AtStart:
	:type AtStart: bool
	:param P:
	:type P: gp_Pnt2d
	:param D:
	:type D: gp_Dir2d
	:rtype: None") Tangent;
		void Tangent (const Standard_Boolean AtStart,gp_Pnt2d & P,gp_Dir2d & D);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Update the minmax and the internal data
	:param TotMin:
	:type TotMin: float
	:param TotMax:
	:type TotMax: float
	:rtype: float") Update;
		Standard_Real Update (Standard_Real TotMin[16],Standard_Real TotMax[16]);

		/****************** UpdateMinMax ******************/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", "* Update the minmax returns tol for enlarge;
	:param TotMin:
	:type TotMin: float
	:param TotMax:
	:type TotMax: float
	:rtype: float") UpdateMinMax;
		Standard_Real UpdateMinMax (Standard_Real TotMin[16],Standard_Real TotMax[16]);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") Value;
		gp_Pnt2d Value (const Standard_Real U);

		/****************** Value3D ******************/
		%feature("compactdefaultargs") Value3D;
		%feature("autodoc", "* Computes the 3D point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value3D;
		gp_Pnt Value3D (const Standard_Real U);

		/****************** Z ******************/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "* Computes the Z coordinate of the point of parameter U on the curve in the viewing coordinate system
	:param U:
	:type U: float
	:rtype: float") Z;
		Standard_Real Z (const Standard_Real U);

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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline (const Standard_Address C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: opencascade::handle<Geom2d_BezierCurve>") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier (const Standard_Address C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: gp_Circ2d") Circle;
		static gp_Circ2d Circle (const Standard_Address C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const Standard_Address C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		static void D0 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		static void D1 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		static void D2 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None") D3;
		static void D3 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		static gp_Vec2d DN (const Standard_Address C,const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: int") Degree;
		static Standard_Integer Degree (const Standard_Address C);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: gp_Elips2d") Ellipse;
		static gp_Elips2d Ellipse (const Standard_Address C);

		/****************** EpsX ******************/
		%feature("compactdefaultargs") EpsX;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: float") EpsX;
		static Standard_Real EpsX (const Standard_Address C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const Standard_Address C);

		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "* output the bounds of interval of index <Index> used if Type == Composite.
	:param C:
	:type C: Standard_Address
	:param Index:
	:type Index: int
	:param Tab:
	:type Tab: TColStd_Array1OfReal
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") GetInterval;
		static void GetInterval (const Standard_Address C,const Standard_Integer Index,const TColStd_Array1OfReal & Tab,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:param C:
	:type C: Standard_Address
	:rtype: GeomAbs_CurveType") GetType;
		static GeomAbs_CurveType GetType (const Standard_Address C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: gp_Hypr2d") Hyperbola;
		static gp_Hypr2d Hyperbola (const Standard_Address C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param C:
	:type C: Standard_Address
	:param T:
	:type T: TColStd_Array1OfReal
	:rtype: None") Intervals;
		static void Intervals (const Standard_Address C,TColStd_Array1OfReal & T);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const Standard_Address C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: bool") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Standard_Address C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const Standard_Address C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: gp_Lin2d") Line;
		static gp_Lin2d Line (const Standard_Address C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>
	:param C:
	:type C: Standard_Address
	:rtype: int") NbIntervals;
		static Standard_Integer NbIntervals (const Standard_Address C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int") NbSamples;
		static Standard_Integer NbSamples (const Standard_Address C,const Standard_Real U0,const Standard_Real U1);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: int") NbSamples;
		static Standard_Integer NbSamples (const Standard_Address C);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: gp_Parab2d") Parabola;
		static gp_Parab2d Parabola (const Standard_Address C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":param C:
	:type C: Standard_Address
	:rtype: float") Period;
		static Standard_Real Period (const Standard_Address C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param C:
	:type C: Standard_Address
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		static Standard_Real Resolution (const Standard_Address C,const Standard_Real R3d);

		/****************** TheType ******************/
		%feature("compactdefaultargs") TheType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:param C:
	:type C: Standard_Address
	:rtype: GeomAbs_CurveType") TheType;
		static GeomAbs_CurveType TheType (const Standard_Address C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") Value;
		static gp_Pnt2d Value (const Standard_Address C,const Standard_Real U);

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
		/****************** AboveInterference ******************/
		%feature("compactdefaultargs") AboveInterference;
		%feature("autodoc", "* Returns True if the rejected interference is above the face.
	:rtype: bool") AboveInterference;
		Standard_Boolean AboveInterference ();

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "* Classification of an edge.
	:param E:
	:type E: int
	:param ED:
	:type ED: HLRBRep_EdgeData
	:param LevelFlag:
	:type LevelFlag: bool
	:param Level:
	:type Level: int
	:param param:
	:type param: float
	:rtype: TopAbs_State") Classify;
		TopAbs_State Classify (const Standard_Integer E,const HLRBRep_EdgeData & ED,const Standard_Boolean LevelFlag,Standard_Integer &OutValue,const Standard_Real param);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "* Returns the state of the Edge <ED> after classification.
	:param E:
	:type E: int
	:param ED:
	:type ED: HLRBRep_EdgeData
	:rtype: TopAbs_State") Compare;
		TopAbs_State Compare (const Standard_Integer E,const HLRBRep_EdgeData & ED);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** EDataArray ******************/
		%feature("compactdefaultargs") EDataArray;
		%feature("autodoc", ":rtype: HLRBRep_Array1OfEData") EDataArray;
		HLRBRep_Array1OfEData & EDataArray ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the current Edge
	:rtype: int") Edge;
		Standard_Integer Edge ();

		/****************** EdgeMap ******************/
		%feature("compactdefaultargs") EdgeMap;
		%feature("autodoc", ":rtype: TopTools_IndexedMapOfShape") EdgeMap;
		TopTools_IndexedMapOfShape & EdgeMap ();

		/****************** EdgeOfTheHidingFace ******************/
		%feature("compactdefaultargs") EdgeOfTheHidingFace;
		%feature("autodoc", "* Returns the true if the Edge <ED> belongs to the Hiding Face.
	:param E:
	:type E: int
	:param ED:
	:type ED: HLRBRep_EdgeData
	:rtype: bool") EdgeOfTheHidingFace;
		Standard_Boolean EdgeOfTheHidingFace (const Standard_Integer E,const HLRBRep_EdgeData & ED);

		/****************** EdgeState ******************/
		%feature("compactdefaultargs") EdgeState;
		%feature("autodoc", "* Returns the local 3D state of the intersection between the current edge and the current face at the <p1> and <p2> parameters.
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:param stbef:
	:type stbef: TopAbs_State
	:param staf:
	:type staf: TopAbs_State
	:rtype: None") EdgeState;
		void EdgeState (const Standard_Real p1,const Standard_Real p2,TopAbs_State & stbef,TopAbs_State & staf);

		/****************** FDataArray ******************/
		%feature("compactdefaultargs") FDataArray;
		%feature("autodoc", ":rtype: HLRBRep_Array1OfFData") FDataArray;
		HLRBRep_Array1OfFData & FDataArray ();

		/****************** FaceMap ******************/
		%feature("compactdefaultargs") FaceMap;
		%feature("autodoc", ":rtype: TopTools_IndexedMapOfShape") FaceMap;
		TopTools_IndexedMapOfShape & FaceMap ();

		/****************** HLRBRep_Data ******************/
		%feature("compactdefaultargs") HLRBRep_Data;
		%feature("autodoc", "* Create an empty data structure of <NV> vertices, <NE> edges and <NF> faces.
	:param NV:
	:type NV: int
	:param NE:
	:type NE: int
	:param NF:
	:type NF: int
	:rtype: None") HLRBRep_Data;
		 HLRBRep_Data (const Standard_Integer NV,const Standard_Integer NE,const Standard_Integer NF);

		/****************** HidingStartLevel ******************/
		%feature("compactdefaultargs") HidingStartLevel;
		%feature("autodoc", "* Returns the number of levels of hiding face above the first point of the edge <ED>. The InterferenceList is given to compute far away of the Interferences and then come back.
	:param E:
	:type E: int
	:param ED:
	:type ED: HLRBRep_EdgeData
	:param IL:
	:type IL: HLRAlgo_InterferenceList
	:rtype: int") HidingStartLevel;
		Standard_Integer HidingStartLevel (const Standard_Integer E,const HLRBRep_EdgeData & ED,const HLRAlgo_InterferenceList & IL);

		/****************** HidingTheFace ******************/
		%feature("compactdefaultargs") HidingTheFace;
		%feature("autodoc", "* Returns true if the current edge to be hidden belongs to the hiding face.
	:rtype: bool") HidingTheFace;
		Standard_Boolean HidingTheFace ();

		/****************** InitBoundSort ******************/
		%feature("compactdefaultargs") InitBoundSort;
		%feature("autodoc", "* to compare with only non rejected edges.
	:param MinMaxTot:
	:type MinMaxTot: HLRAlgo_EdgesBlock::MinMaxIndices
	:param e1:
	:type e1: int
	:param e2:
	:type e2: int
	:rtype: None") InitBoundSort;
		void InitBoundSort (const HLRAlgo_EdgesBlock::MinMaxIndices & MinMaxTot,const Standard_Integer e1,const Standard_Integer e2);

		/****************** InitEdge ******************/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "* Begin an iteration only on visible Edges crossing the face number <FI>.
	:param FI:
	:type FI: int
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool
	:rtype: None") InitEdge;
		void InitEdge (const Standard_Integer FI,BRepTopAdaptor_MapOfShapeTool & MST);

		/****************** InitInterference ******************/
		%feature("compactdefaultargs") InitInterference;
		%feature("autodoc", "* Intersect the current Edge with the boundary of the hiding face. The interferences are given by the More, Next, and Value methods.
	:rtype: None") InitInterference;
		void InitInterference ();

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", ":rtype: HLRAlgo_Interference") Interference;
		HLRAlgo_Interference & Interference ();

		/****************** IsBadFace ******************/
		%feature("compactdefaultargs") IsBadFace;
		%feature("autodoc", "* Returns true if the current face is bad.
	:rtype: bool") IsBadFace;
		Standard_Boolean IsBadFace ();

		/****************** LocalFEGeometry2D ******************/
		%feature("compactdefaultargs") LocalFEGeometry2D;
		%feature("autodoc", "* Returns the local description of the projection of the current FEdge at parameter <Param>.
	:param FE:
	:type FE: int
	:param Param:
	:type Param: float
	:param Tg:
	:type Tg: gp_Dir2d
	:param Nm:
	:type Nm: gp_Dir2d
	:param Cu:
	:type Cu: float
	:rtype: None") LocalFEGeometry2D;
		void LocalFEGeometry2D (const Standard_Integer FE,const Standard_Real Param,gp_Dir2d & Tg,gp_Dir2d & Nm,Standard_Real &OutValue);

		/****************** LocalLEGeometry2D ******************/
		%feature("compactdefaultargs") LocalLEGeometry2D;
		%feature("autodoc", "* Returns the local description of the projection of the current LEdge at parameter <Param>.
	:param Param:
	:type Param: float
	:param Tg:
	:type Tg: gp_Dir2d
	:param Nm:
	:type Nm: gp_Dir2d
	:param Cu:
	:type Cu: float
	:rtype: None") LocalLEGeometry2D;
		void LocalLEGeometry2D (const Standard_Real Param,gp_Dir2d & Tg,gp_Dir2d & Nm,Standard_Real &OutValue);

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", ":rtype: bool") MoreEdge;
		Standard_Boolean MoreEdge ();

		/****************** MoreInterference ******************/
		%feature("compactdefaultargs") MoreInterference;
		%feature("autodoc", ":rtype: bool") MoreInterference;
		Standard_Boolean MoreInterference ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", ":rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** NbFaces ******************/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", ":rtype: int") NbFaces;
		Standard_Integer NbFaces ();

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", ":rtype: int") NbVertices;
		Standard_Integer NbVertices ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", ":param skip: default value is Standard_True
	:type skip: bool
	:rtype: None") NextEdge;
		void NextEdge (const Standard_Boolean skip = Standard_True);

		/****************** NextInterference ******************/
		%feature("compactdefaultargs") NextInterference;
		%feature("autodoc", ":rtype: None") NextInterference;
		void NextInterference ();

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", ":rtype: HLRAlgo_Projector") Projector;
		HLRAlgo_Projector & Projector ();

		/****************** RejectedInterference ******************/
		%feature("compactdefaultargs") RejectedInterference;
		%feature("autodoc", "* Returns True if the interference is rejected.
	:rtype: bool") RejectedInterference;
		Standard_Boolean RejectedInterference ();

		/****************** SimplClassify ******************/
		%feature("compactdefaultargs") SimplClassify;
		%feature("autodoc", "* Simple classification of part of edge [p1, p2] returns OUT if at least 1 of Nbp points of edge is out othewise returns IN It is used to check 'suspision' hided part of edge.
	:param E:
	:type E: int
	:param ED:
	:type ED: HLRBRep_EdgeData
	:param Nbp:
	:type Nbp: int
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: TopAbs_State") SimplClassify;
		TopAbs_State SimplClassify (const Standard_Integer E,const HLRBRep_EdgeData & ED,const Standard_Integer Nbp,const Standard_Real p1,const Standard_Real p2);

		/****************** SimpleHidingFace ******************/
		%feature("compactdefaultargs") SimpleHidingFace;
		%feature("autodoc", "* Returns true if the current hiding face is not an auto-intersected one.
	:rtype: bool") SimpleHidingFace;
		Standard_Boolean SimpleHidingFace ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Set the tolerance for the rejections during the exploration
	:param tol:
	:type tol: Standard_ShortReal
	:rtype: None") Tolerance;
		void Tolerance (const Standard_ShortReal tol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* returns the tolerance for the rejections during the exploration
	:rtype: Standard_ShortReal") Tolerance;
		Standard_ShortReal Tolerance ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* end of building of the Data and updating all the informations linked to the projection.
	:param P:
	:type P: HLRAlgo_Projector
	:rtype: None") Update;
		void Update (const HLRAlgo_Projector & P);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Write <DS> in me with a translation of <dv>,<de>,<df>.
	:param DS:
	:type DS: HLRBRep_Data
	:param dv:
	:type dv: int
	:param de:
	:type de: int
	:param df:
	:type df: int
	:rtype: None") Write;
		void Write (const opencascade::handle<HLRBRep_Data> & DS,const Standard_Integer dv,const Standard_Integer de,const Standard_Integer df);

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
		/****************** AreaEdgeState ******************/
		%feature("compactdefaultargs") AreaEdgeState;
		%feature("autodoc", "* Returns the edge state of the current area.
	:rtype: TopAbs_State") AreaEdgeState;
		TopAbs_State AreaEdgeState ();

		/****************** AreaState ******************/
		%feature("compactdefaultargs") AreaState;
		%feature("autodoc", "* Returns the state of the current area.
	:rtype: TopAbs_State") AreaState;
		TopAbs_State AreaState ();

		/****************** Builds ******************/
		%feature("compactdefaultargs") Builds;
		%feature("autodoc", "* Reinitialize the results iteration to the parts with State <ToBuild>. If this method is not called after construction the default is <ToBuild> = IN.
	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: None") Builds;
		void Builds (const TopAbs_State ToBuild);

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Returns the current vertex of the current edge.
	:rtype: HLRAlgo_Intersection") Current;
		const HLRAlgo_Intersection & Current ();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** HLRBRep_EdgeBuilder ******************/
		%feature("compactdefaultargs") HLRBRep_EdgeBuilder;
		%feature("autodoc", "* Creates an EdgeBuilder algorithm. <VList> describes the edge and the interferences. AreaLimits are created from the vertices. Builds(IN) is automatically called.
	:param VList:
	:type VList: HLRBRep_VertexList
	:rtype: None") HLRBRep_EdgeBuilder;
		 HLRBRep_EdgeBuilder (HLRBRep_VertexList & VList);

		/****************** HasArea ******************/
		%feature("compactdefaultargs") HasArea;
		%feature("autodoc", "* Returns True if there is a current area.
	:rtype: bool") HasArea;
		Standard_Boolean HasArea ();

		/****************** InitAreas ******************/
		%feature("compactdefaultargs") InitAreas;
		%feature("autodoc", "* Initialize an iteration on the areas.
	:rtype: None") InitAreas;
		void InitAreas ();

		/****************** IsBoundary ******************/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "* Returns True if the current vertex comes from the boundary of the edge.
	:rtype: bool") IsBoundary;
		Standard_Boolean IsBoundary ();

		/****************** IsInterference ******************/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "* Returns True if the current vertex was an interference.
	:rtype: bool") IsInterference;
		Standard_Boolean IsInterference ();

		/****************** LeftLimit ******************/
		%feature("compactdefaultargs") LeftLimit;
		%feature("autodoc", "* Returns the AreaLimit beginning the current area. This is a NULL handle when the area is infinite on the left.
	:rtype: opencascade::handle<HLRBRep_AreaLimit>") LeftLimit;
		opencascade::handle<HLRBRep_AreaLimit> LeftLimit ();

		/****************** MoreEdges ******************/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "* Returns True if there are more new edges to build.
	:rtype: bool") MoreEdges;
		Standard_Boolean MoreEdges ();

		/****************** MoreVertices ******************/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "* True if there are more vertices in the current new edge.
	:rtype: bool") MoreVertices;
		Standard_Boolean MoreVertices ();

		/****************** NextArea ******************/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "* Set the current area to the next area.
	:rtype: None") NextArea;
		void NextArea ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "* Proceeds to the next edge to build. Skip all remaining vertices on the current edge.
	:rtype: None") NextEdge;
		void NextEdge ();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "* Proceeds to the next vertex of the current edge.
	:rtype: None") NextVertex;
		void NextVertex ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns the new orientation of the current vertex.
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** PreviousArea ******************/
		%feature("compactdefaultargs") PreviousArea;
		%feature("autodoc", "* Set the current area to the previous area.
	:rtype: None") PreviousArea;
		void PreviousArea ();

		/****************** RightLimit ******************/
		%feature("compactdefaultargs") RightLimit;
		%feature("autodoc", "* Returns the AreaLimit ending the current area. This is a NULL handle when the area is infinite on the right.
	:rtype: opencascade::handle<HLRBRep_AreaLimit>") RightLimit;
		opencascade::handle<HLRBRep_AreaLimit> RightLimit ();

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
		/****************** AutoIntersectionDone ******************/
		%feature("compactdefaultargs") AutoIntersectionDone;
		%feature("autodoc", ":rtype: bool") AutoIntersectionDone;
		Standard_Boolean AutoIntersectionDone ();

		/****************** AutoIntersectionDone ******************/
		%feature("compactdefaultargs") AutoIntersectionDone;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") AutoIntersectionDone;
		void AutoIntersectionDone (const Standard_Boolean B);

		/****************** ChangeGeometry ******************/
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", ":rtype: HLRBRep_Curve") ChangeGeometry;
		HLRBRep_Curve & ChangeGeometry ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: HLRBRep_Curve *") Curve;
		HLRBRep_Curve * Curve ();

		/****************** CutAtEnd ******************/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", ":rtype: bool") CutAtEnd;
		Standard_Boolean CutAtEnd ();

		/****************** CutAtEnd ******************/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") CutAtEnd;
		void CutAtEnd (const Standard_Boolean B);

		/****************** CutAtSta ******************/
		%feature("compactdefaultargs") CutAtSta;
		%feature("autodoc", ":rtype: bool") CutAtSta;
		Standard_Boolean CutAtSta ();

		/****************** CutAtSta ******************/
		%feature("compactdefaultargs") CutAtSta;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") CutAtSta;
		void CutAtSta (const Standard_Boolean B);

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", ":rtype: HLRBRep_Curve") Geometry;
		const HLRBRep_Curve & Geometry ();

		/****************** HLRBRep_EdgeData ******************/
		%feature("compactdefaultargs") HLRBRep_EdgeData;
		%feature("autodoc", ":rtype: None") HLRBRep_EdgeData;
		 HLRBRep_EdgeData ();

		/****************** HideCount ******************/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", ":rtype: int") HideCount;
		Standard_Integer HideCount ();

		/****************** HideCount ******************/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") HideCount;
		void HideCount (const Standard_Integer I);

		/****************** MinMax ******************/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", ":rtype: HLRAlgo_EdgesBlock::MinMaxIndices") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax ();

		/****************** OutLVEnd ******************/
		%feature("compactdefaultargs") OutLVEnd;
		%feature("autodoc", ":rtype: bool") OutLVEnd;
		Standard_Boolean OutLVEnd ();

		/****************** OutLVEnd ******************/
		%feature("compactdefaultargs") OutLVEnd;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") OutLVEnd;
		void OutLVEnd (const Standard_Boolean B);

		/****************** OutLVSta ******************/
		%feature("compactdefaultargs") OutLVSta;
		%feature("autodoc", ":rtype: bool") OutLVSta;
		Standard_Boolean OutLVSta ();

		/****************** OutLVSta ******************/
		%feature("compactdefaultargs") OutLVSta;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") OutLVSta;
		void OutLVSta (const Standard_Boolean B);

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":rtype: bool") Rg1Line;
		Standard_Boolean Rg1Line ();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Rg1Line;
		void Rg1Line (const Standard_Boolean B);

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":rtype: bool") RgNLine;
		Standard_Boolean RgNLine ();

		/****************** RgNLine ******************/
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") RgNLine;
		void RgNLine (const Standard_Boolean B);

		/****************** Selected ******************/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", ":rtype: bool") Selected;
		Standard_Boolean Selected ();

		/****************** Selected ******************/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Selected;
		void Selected (const Standard_Boolean B);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Reg1:
	:type Reg1: bool
	:param RegN:
	:type RegN: bool
	:param EG:
	:type EG: TopoDS_Edge
	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param Out1:
	:type Out1: bool
	:param Out2:
	:type Out2: bool
	:param Cut1:
	:type Cut1: bool
	:param Cut2:
	:type Cut2: bool
	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None") Set;
		void Set (const Standard_Boolean Reg1,const Standard_Boolean RegN,const TopoDS_Edge & EG,const Standard_Integer V1,const Standard_Integer V2,const Standard_Boolean Out1,const Standard_Boolean Out2,const Standard_Boolean Cut1,const Standard_Boolean Cut2,const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);

		/****************** Simple ******************/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", ":rtype: bool") Simple;
		Standard_Boolean Simple ();

		/****************** Simple ******************/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Simple;
		void Simple (const Standard_Boolean B);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", ":rtype: HLRAlgo_EdgeStatus") Status;
		HLRAlgo_EdgeStatus & Status ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: Standard_ShortReal") Tolerance;
		Standard_ShortReal Tolerance ();

		/****************** UpdateMinMax ******************/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", ":param theTotMinMax:
	:type theTotMinMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: None") UpdateMinMax;
		void UpdateMinMax (const HLRAlgo_EdgesBlock::MinMaxIndices & theTotMinMax);

		/****************** Used ******************/
		%feature("compactdefaultargs") Used;
		%feature("autodoc", ":rtype: bool") Used;
		Standard_Boolean Used ();

		/****************** Used ******************/
		%feature("compactdefaultargs") Used;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Used;
		void Used (const Standard_Boolean B);

		/****************** VEnd ******************/
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", ":rtype: int") VEnd;
		Standard_Integer VEnd ();

		/****************** VEnd ******************/
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") VEnd;
		void VEnd (const Standard_Integer I);

		/****************** VSta ******************/
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", ":rtype: int") VSta;
		Standard_Integer VSta ();

		/****************** VSta ******************/
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") VSta;
		void VSta (const Standard_Integer I);

		/****************** VerAtEnd ******************/
		%feature("compactdefaultargs") VerAtEnd;
		%feature("autodoc", ":rtype: bool") VerAtEnd;
		Standard_Boolean VerAtEnd ();

		/****************** VerAtEnd ******************/
		%feature("compactdefaultargs") VerAtEnd;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") VerAtEnd;
		void VerAtEnd (const Standard_Boolean B);

		/****************** VerAtSta ******************/
		%feature("compactdefaultargs") VerAtSta;
		%feature("autodoc", ":rtype: bool") VerAtSta;
		Standard_Boolean VerAtSta ();

		/****************** VerAtSta ******************/
		%feature("compactdefaultargs") VerAtSta;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") VerAtSta;
		void VerAtSta (const Standard_Boolean B);

		/****************** Vertical ******************/
		%feature("compactdefaultargs") Vertical;
		%feature("autodoc", ":rtype: bool") Vertical;
		Standard_Boolean Vertical ();

		/****************** Vertical ******************/
		%feature("compactdefaultargs") Vertical;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Vertical;
		void Vertical (const Standard_Boolean B);

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
		%feature("compactdefaultargs") CurvatureValue;
		%feature("autodoc", ":param F:
	:type F: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tg:
	:type Tg: gp_Dir
	:rtype: float") CurvatureValue;
		static Standard_Real CurvatureValue (const Standard_Address F,const Standard_Real U,const Standard_Real V,const gp_Dir & Tg);

		/****************** UVPoint ******************/
		%feature("compactdefaultargs") UVPoint;
		%feature("autodoc", "* return True if U and V are found.
	:param Par:
	:type Par: float
	:param E:
	:type E: Standard_Address
	:param F:
	:type F: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: bool") UVPoint;
		static Standard_Boolean UVPoint (const Standard_Real Par,const Standard_Address E,const Standard_Address F,Standard_Real &OutValue,Standard_Real &OutValue);

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
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "* Add the interference <I> to the list <IL>.
	:param IL:
	:type IL: HLRAlgo_InterferenceList
	:param I:
	:type I: HLRAlgo_Interference
	:param T:
	:type T: HLRBRep_EdgeInterferenceTool
	:rtype: void") AddInterference;
		static void AddInterference (HLRAlgo_InterferenceList & IL,const HLRAlgo_Interference & I,const HLRBRep_EdgeInterferenceTool & T);

		/****************** ProcessComplex ******************/
		%feature("compactdefaultargs") ProcessComplex;
		%feature("autodoc", "* Process complex transitions on the list IL.
	:param IL:
	:type IL: HLRAlgo_InterferenceList
	:param T:
	:type T: HLRBRep_EdgeInterferenceTool
	:rtype: void") ProcessComplex;
		static void ProcessComplex (HLRAlgo_InterferenceList & IL,const HLRBRep_EdgeInterferenceTool & T);

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
		/****************** CurrentOrientation ******************/
		%feature("compactdefaultargs") CurrentOrientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") CurrentOrientation;
		TopAbs_Orientation CurrentOrientation ();

		/****************** CurrentParameter ******************/
		%feature("compactdefaultargs") CurrentParameter;
		%feature("autodoc", ":rtype: float") CurrentParameter;
		Standard_Real CurrentParameter ();

		/****************** CurrentVertex ******************/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", ":rtype: HLRAlgo_Intersection") CurrentVertex;
		const HLRAlgo_Intersection & CurrentVertex ();

		/****************** EdgeGeometry ******************/
		%feature("compactdefaultargs") EdgeGeometry;
		%feature("autodoc", "* Returns local geometric description of the Edge at parameter <Para>. See method Reset of class EdgeFaceTransition from TopCnx for other arguments.
	:param Param:
	:type Param: float
	:param Tgt:
	:type Tgt: gp_Dir
	:param Nrm:
	:type Nrm: gp_Dir
	:param Curv:
	:type Curv: float
	:rtype: None") EdgeGeometry;
		void EdgeGeometry (const Standard_Real Param,gp_Dir & Tgt,gp_Dir & Nrm,Standard_Real &OutValue);

		/****************** HLRBRep_EdgeInterferenceTool ******************/
		%feature("compactdefaultargs") HLRBRep_EdgeInterferenceTool;
		%feature("autodoc", ":param DS:
	:type DS: HLRBRep_Data
	:rtype: None") HLRBRep_EdgeInterferenceTool;
		 HLRBRep_EdgeInterferenceTool (const opencascade::handle<HLRBRep_Data> & DS);

		/****************** InitVertices ******************/
		%feature("compactdefaultargs") InitVertices;
		%feature("autodoc", ":rtype: None") InitVertices;
		void InitVertices ();

		/****************** InterferenceBoundaryGeometry ******************/
		%feature("compactdefaultargs") InterferenceBoundaryGeometry;
		%feature("autodoc", "* Returns the geometry of the boundary at the interference <I>. See the AddInterference method of the class EdgeFaceTransition from TopCnx for the other arguments.
	:param I:
	:type I: HLRAlgo_Interference
	:param Tang:
	:type Tang: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float
	:rtype: None") InterferenceBoundaryGeometry;
		void InterferenceBoundaryGeometry (const HLRAlgo_Interference & I,gp_Dir & Tang,gp_Dir & Norm,Standard_Real &OutValue);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** LoadEdge ******************/
		%feature("compactdefaultargs") LoadEdge;
		%feature("autodoc", ":rtype: None") LoadEdge;
		void LoadEdge ();

		/****************** MoreVertices ******************/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", ":rtype: bool") MoreVertices;
		Standard_Boolean MoreVertices ();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", ":rtype: None") NextVertex;
		void NextVertex ();

		/****************** ParameterOfInterference ******************/
		%feature("compactdefaultargs") ParameterOfInterference;
		%feature("autodoc", ":param I:
	:type I: HLRAlgo_Interference
	:rtype: float") ParameterOfInterference;
		Standard_Real ParameterOfInterference (const HLRAlgo_Interference & I);

		/****************** SameInterferences ******************/
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", "* True if the two interferences are on the same geometric locus.
	:param I1:
	:type I1: HLRAlgo_Interference
	:param I2:
	:type I2: HLRAlgo_Interference
	:rtype: bool") SameInterferences;
		Standard_Boolean SameInterferences (const HLRAlgo_Interference & I1,const HLRAlgo_Interference & I2);

		/****************** SameVertexAndInterference ******************/
		%feature("compactdefaultargs") SameVertexAndInterference;
		%feature("autodoc", "* True if the Interference and the current Vertex are on the same geometric locus.
	:param I:
	:type I: HLRAlgo_Interference
	:rtype: bool") SameVertexAndInterference;
		Standard_Boolean SameVertexAndInterference (const HLRAlgo_Interference & I);

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
		/****************** AnErrorOccurred ******************/
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", ":rtype: bool") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred ();

		/****************** HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", ":param C1:
	:type C1: Standard_Address
	:param C2:
	:type C2: Standard_Address
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real Tol);

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", ":rtype: int") NbRoots;
		Standard_Integer NbRoots ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Poly1:
	:type Poly1: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter
	:param Poly2:
	:type Poly2: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter
	:param NumSegOn1:
	:type NumSegOn1: int
	:param NumSegOn2:
	:type NumSegOn2: int
	:param ParamOnSeg1:
	:type ParamOnSeg1: float
	:param ParamOnSeg2:
	:type ParamOnSeg2: float
	:rtype: None") Perform;
		void Perform (const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly1,const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Uo:
	:type Uo: float
	:param Vo:
	:type Vo: float
	:param UInf:
	:type UInf: float
	:param VInf:
	:type VInf: float
	:param USup:
	:type USup: float
	:param VSup:
	:type VSup: float
	:rtype: None") Perform;
		void Perform (const Standard_Real Uo,const Standard_Real Vo,const Standard_Real UInf,const Standard_Real VInf,const Standard_Real USup,const Standard_Real VSup);

		/****************** Roots ******************/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") Roots;
		void Roots (Standard_Real &OutValue,Standard_Real &OutValue);

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
		/****************** Back ******************/
		%feature("compactdefaultargs") Back;
		%feature("autodoc", ":rtype: bool") Back;
		Standard_Boolean Back ();

		/****************** Back ******************/
		%feature("compactdefaultargs") Back;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Back;
		void Back (const Standard_Boolean B);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":rtype: bool") Closed;
		Standard_Boolean Closed ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Closed;
		void Closed (const Standard_Boolean B);

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":rtype: bool") Cone;
		Standard_Boolean Cone ();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Cone;
		void Cone (const Standard_Boolean B);

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", ":rtype: bool") Cut;
		Standard_Boolean Cut ();

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Cut;
		void Cut (const Standard_Boolean B);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: bool") Cylinder;
		Standard_Boolean Cylinder ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Cylinder;
		void Cylinder (const Standard_Boolean B);

		/****************** Geometry ******************/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", ":rtype: HLRBRep_Surface") Geometry;
		HLRBRep_Surface & Geometry ();

		/****************** HLRBRep_FaceData ******************/
		%feature("compactdefaultargs") HLRBRep_FaceData;
		%feature("autodoc", ":rtype: None") HLRBRep_FaceData;
		 HLRBRep_FaceData ();

		/****************** Hiding ******************/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", ":rtype: bool") Hiding;
		Standard_Boolean Hiding ();

		/****************** Hiding ******************/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Hiding;
		void Hiding (const Standard_Boolean B);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param O:
	:type O: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (const TopAbs_Orientation O);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: bool") Plane;
		Standard_Boolean Plane ();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Plane;
		void Plane (const Standard_Boolean B);

		/****************** Selected ******************/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", ":rtype: bool") Selected;
		Standard_Boolean Selected ();

		/****************** Selected ******************/
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Selected;
		void Selected (const Standard_Boolean B);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* <Or> is the orientation of the face. <Cl> is true if the face belongs to a closed volume. <NW> is the number of wires ( or block of edges ) of the face.
	:param FG:
	:type FG: TopoDS_Face
	:param Or:
	:type Or: TopAbs_Orientation
	:param Cl:
	:type Cl: bool
	:param NW:
	:type NW: int
	:rtype: None") Set;
		void Set (const TopoDS_Face & FG,const TopAbs_Orientation Or,const Standard_Boolean Cl,const Standard_Integer NW);

		/****************** SetWEdge ******************/
		%feature("compactdefaultargs") SetWEdge;
		%feature("autodoc", "* Set the edge number <EWI> of the wire <WI>.
	:param WI:
	:type WI: int
	:param EWI:
	:type EWI: int
	:param EI:
	:type EI: int
	:param Or:
	:type Or: TopAbs_Orientation
	:param OutL:
	:type OutL: bool
	:param Inte:
	:type Inte: bool
	:param Dble:
	:type Dble: bool
	:param IsoL:
	:type IsoL: bool
	:rtype: None") SetWEdge;
		void SetWEdge (const Standard_Integer WI,const Standard_Integer EWI,const Standard_Integer EI,const TopAbs_Orientation Or,const Standard_Boolean OutL,const Standard_Boolean Inte,const Standard_Boolean Dble,const Standard_Boolean IsoL);

		/****************** SetWire ******************/
		%feature("compactdefaultargs") SetWire;
		%feature("autodoc", "* Set <NE> the number of edges of the wire number <WI>.
	:param WI:
	:type WI: int
	:param NE:
	:type NE: int
	:rtype: None") SetWire;
		void SetWire (const Standard_Integer WI,const Standard_Integer NE);

		/****************** Side ******************/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", ":rtype: bool") Side;
		Standard_Boolean Side ();

		/****************** Side ******************/
		%feature("compactdefaultargs") Side;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Side;
		void Side (const Standard_Boolean B);

		/****************** Simple ******************/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", ":rtype: bool") Simple;
		Standard_Boolean Simple ();

		/****************** Simple ******************/
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Simple;
		void Simple (const Standard_Boolean B);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", ":rtype: float") Size;
		Standard_Real Size ();

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", ":param S:
	:type S: float
	:rtype: None") Size;
		void Size (const Standard_Real S);

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: bool") Sphere;
		Standard_Boolean Sphere ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Sphere;
		void Sphere (const Standard_Boolean B);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: Standard_ShortReal") Tolerance;
		Standard_ShortReal Tolerance ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: bool") Torus;
		Standard_Boolean Torus ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Torus;
		void Torus (const Standard_Boolean B);

		/****************** Wires ******************/
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", ":rtype: opencascade::handle<HLRAlgo_WiresBlock>") Wires;
		opencascade::handle<HLRAlgo_WiresBlock> & Wires ();

		/****************** WithOutL ******************/
		%feature("compactdefaultargs") WithOutL;
		%feature("autodoc", ":rtype: bool") WithOutL;
		Standard_Boolean WithOutL ();

		/****************** WithOutL ******************/
		%feature("compactdefaultargs") WithOutL;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") WithOutL;
		void WithOutL (const Standard_Boolean B);

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
		/****************** BeginningOfWire ******************/
		%feature("compactdefaultargs") BeginningOfWire;
		%feature("autodoc", "* Returns True if the current edge is the first of a wire.
	:rtype: bool") BeginningOfWire;
		Standard_Boolean BeginningOfWire ();

		/****************** Double ******************/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", ":rtype: bool") Double;
		Standard_Boolean Double ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: int") Edge;
		Standard_Integer Edge ();

		/****************** EndOfWire ******************/
		%feature("compactdefaultargs") EndOfWire;
		%feature("autodoc", "* Returns True if the current edge is the last of a wire.
	:rtype: bool") EndOfWire;
		Standard_Boolean EndOfWire ();

		/****************** HLRBRep_FaceIterator ******************/
		%feature("compactdefaultargs") HLRBRep_FaceIterator;
		%feature("autodoc", ":rtype: None") HLRBRep_FaceIterator;
		 HLRBRep_FaceIterator ();

		/****************** InitEdge ******************/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "* Begin an exploration of the edges of the face <fd>
	:param fd:
	:type fd: HLRBRep_FaceData
	:rtype: None") InitEdge;
		void InitEdge (HLRBRep_FaceData & fd);

		/****************** Internal ******************/
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", ":rtype: bool") Internal;
		Standard_Boolean Internal ();

		/****************** IsoLine ******************/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", ":rtype: bool") IsoLine;
		Standard_Boolean IsoLine ();

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", ":rtype: bool") MoreEdge;
		Standard_Boolean MoreEdge ();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", ":rtype: None") NextEdge;
		void NextEdge ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", ":rtype: bool") OutLine;
		Standard_Boolean OutLine ();

		/****************** SkipWire ******************/
		%feature("compactdefaultargs") SkipWire;
		%feature("autodoc", "* Skip the current wire in the exploration.
	:rtype: None") SkipWire;
		void SkipWire ();

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "* Returns the edges of the current wire.
	:rtype: opencascade::handle<HLRAlgo_EdgesBlock>") Wire;
		opencascade::handle<HLRAlgo_EdgesBlock> Wire ();

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
		/****************** CompoundOfEdges ******************/
		%feature("compactdefaultargs") CompoundOfEdges;
		%feature("autodoc", "* Returns compound of resulting edges of required type and visibility, taking into account the kind of space (2d or 3d)
	:param type:
	:type type: HLRBRep_TypeOfResultingEdge
	:param visible:
	:type visible: bool
	:param In3d:
	:type In3d: bool
	:rtype: TopoDS_Shape") CompoundOfEdges;
		TopoDS_Shape CompoundOfEdges (const HLRBRep_TypeOfResultingEdge type,const Standard_Boolean visible,const Standard_Boolean In3d);

		/****************** CompoundOfEdges ******************/
		%feature("compactdefaultargs") CompoundOfEdges;
		%feature("autodoc", "* For specified shape returns compound of resulting edges of required type and visibility, taking into account the kind of space (2d or 3d)
	:param S:
	:type S: TopoDS_Shape
	:param type:
	:type type: HLRBRep_TypeOfResultingEdge
	:param visible:
	:type visible: bool
	:param In3d:
	:type In3d: bool
	:rtype: TopoDS_Shape") CompoundOfEdges;
		TopoDS_Shape CompoundOfEdges (const TopoDS_Shape & S,const HLRBRep_TypeOfResultingEdge type,const Standard_Boolean visible,const Standard_Boolean In3d);

		/****************** HCompound ******************/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") HCompound;
		TopoDS_Shape HCompound ();

		/****************** HCompound ******************/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") HCompound;
		TopoDS_Shape HCompound (const TopoDS_Shape & S);

		/****************** HLRBRep_HLRToShape ******************/
		%feature("compactdefaultargs") HLRBRep_HLRToShape;
		%feature("autodoc", "* Constructs a framework for filtering the results of the HLRBRep_Algo algorithm, A. Use the extraction filters to obtain the results you want for A.
	:param A:
	:type A: HLRBRep_Algo
	:rtype: None") HLRBRep_HLRToShape;
		 HLRBRep_HLRToShape (const opencascade::handle<HLRBRep_Algo> & A);

		/****************** IsoLineHCompound ******************/
		%feature("compactdefaultargs") IsoLineHCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound ();

		/****************** IsoLineHCompound ******************/
		%feature("compactdefaultargs") IsoLineHCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound (const TopoDS_Shape & S);

		/****************** IsoLineVCompound ******************/
		%feature("compactdefaultargs") IsoLineVCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound ();

		/****************** IsoLineVCompound ******************/
		%feature("compactdefaultargs") IsoLineVCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound (const TopoDS_Shape & S);

		/****************** OutLineHCompound ******************/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") OutLineHCompound;
		TopoDS_Shape OutLineHCompound ();

		/****************** OutLineHCompound ******************/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") OutLineHCompound;
		TopoDS_Shape OutLineHCompound (const TopoDS_Shape & S);

		/****************** OutLineVCompound ******************/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") OutLineVCompound;
		TopoDS_Shape OutLineVCompound ();

		/****************** OutLineVCompound ******************/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") OutLineVCompound;
		TopoDS_Shape OutLineVCompound (const TopoDS_Shape & S);

		/****************** OutLineVCompound3d ******************/
		%feature("compactdefaultargs") OutLineVCompound3d;
		%feature("autodoc", ":rtype: TopoDS_Shape") OutLineVCompound3d;
		TopoDS_Shape OutLineVCompound3d ();

		/****************** Rg1LineHCompound ******************/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound ();

		/****************** Rg1LineHCompound ******************/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound (const TopoDS_Shape & S);

		/****************** Rg1LineVCompound ******************/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound ();

		/****************** Rg1LineVCompound ******************/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound (const TopoDS_Shape & S);

		/****************** RgNLineHCompound ******************/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound ();

		/****************** RgNLineHCompound ******************/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound (const TopoDS_Shape & S);

		/****************** RgNLineVCompound ******************/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound ();

		/****************** RgNLineVCompound ******************/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound (const TopoDS_Shape & S);

		/****************** VCompound ******************/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") VCompound;
		TopoDS_Shape VCompound ();

		/****************** VCompound ******************/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") VCompound;
		TopoDS_Shape VCompound (const TopoDS_Shape & S);

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
		%feature("compactdefaultargs") HLRBRep_Hider;
		%feature("autodoc", "* Creates a Hider processing the set of Edges and hiding faces described by <DS>. Stores the hidden parts in <DS>.
	:param DS:
	:type DS: HLRBRep_Data
	:rtype: None") HLRBRep_Hider;
		 HLRBRep_Hider (const opencascade::handle<HLRBRep_Data> & DS);

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "* Removes from the edges, the parts hidden by the hiding face number <FI>.
	:param FI:
	:type FI: int
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool
	:rtype: None") Hide;
		void Hide (const Standard_Integer FI,BRepTopAdaptor_MapOfShapeTool & MST);

		/****************** OwnHiding ******************/
		%feature("compactdefaultargs") OwnHiding;
		%feature("autodoc", "* own hiding the side face number <FI>.
	:param FI:
	:type FI: int
	:rtype: None") OwnHiding;
		void OwnHiding (const Standard_Integer FI);

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
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter ();

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between an ellipse and a parametric curve.
	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between a parabola and a parametric curve.
	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between the main branch of an hyperbola and a parametric curve.
	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between an ellipse and a parametric curve.
	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between a parabola and a parametric curve.
	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between the main branch of an hyperbola and a parametric curve.
	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

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
		%feature("compactdefaultargs") HLRBRep_InterCSurf;
		%feature("autodoc", "* Empty Constructor
	:rtype: None") HLRBRep_InterCSurf;
		 HLRBRep_InterCSurf ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Compute the Intersection between the curve and the surface
	:param Curve:
	:type Curve: gp_Lin
	:param Surface:
	:type Surface: Standard_Address
	:rtype: None") Perform;
		void Perform (const gp_Lin & Curve,const Standard_Address & Surface);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon : <Polygon> is given.
	:param Curve:
	:type Curve: gp_Lin
	:param Polygon:
	:type Polygon: HLRBRep_ThePolygonOfInterCSurf
	:param Surface:
	:type Surface: Standard_Address
	:rtype: None") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & Polygon,const Standard_Address & Surface);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon : <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.
	:param Curve:
	:type Curve: gp_Lin
	:param ThePolygon:
	:type ThePolygon: HLRBRep_ThePolygonOfInterCSurf
	:param Surface:
	:type Surface: Standard_Address
	:param Polyhedron:
	:type Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & ThePolygon,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon : <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.
	:param Curve:
	:type Curve: gp_Lin
	:param ThePolygon:
	:type ThePolygon: HLRBRep_ThePolygonOfInterCSurf
	:param Surface:
	:type Surface: Standard_Address
	:param Polyhedron:
	:type Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf
	:param BndBSB:
	:type BndBSB: Bnd_BoundSortBox
	:rtype: None") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & ThePolygon,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron,Bnd_BoundSortBox & BndBSB);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Compute the Intersection between the curve and the surface. The Surface is already sampled and its polyhedron : <Polyhedron> is given.
	:param Curve:
	:type Curve: gp_Lin
	:param Surface:
	:type Surface: Standard_Address
	:param Polyhedron:
	:type Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") Perform;
		void Perform (const gp_Lin & Curve,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);

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
		/****************** DataStructure ******************/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", ":rtype: opencascade::handle<HLRBRep_Data>") DataStructure;
		opencascade::handle<HLRBRep_Data> DataStructure ();

		/****************** Debug ******************/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", ":param deb:
	:type deb: bool
	:rtype: None") Debug;
		void Debug (const Standard_Boolean deb);

		/****************** Debug ******************/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", ":rtype: bool") Debug;
		Standard_Boolean Debug ();

		/****************** HLRBRep_InternalAlgo ******************/
		%feature("compactdefaultargs") HLRBRep_InternalAlgo;
		%feature("autodoc", ":rtype: None") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo ();

		/****************** HLRBRep_InternalAlgo ******************/
		%feature("compactdefaultargs") HLRBRep_InternalAlgo;
		%feature("autodoc", ":param A:
	:type A: HLRBRep_InternalAlgo
	:rtype: None") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo (const opencascade::handle<HLRBRep_InternalAlgo> & A);

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "* hide all the DataStructure.
	:rtype: None") Hide;
		void Hide ();

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "* hide the Shape <S> by itself.
	:param I:
	:type I: int
	:rtype: None") Hide;
		void Hide (const Standard_Integer I);

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "* hide the Shape <S1> by the shape <S2>.
	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: None") Hide;
		void Hide (const Standard_Integer I,const Standard_Integer J);

		/****************** HideAll ******************/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "* set to hide all the edges.
	:rtype: None") HideAll;
		void HideAll ();

		/****************** HideAll ******************/
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "* set to hide all the edges of the Shape <S>.
	:param I:
	:type I: int
	:rtype: None") HideAll;
		void HideAll (const Standard_Integer I);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* return the index of the Shape <S> and return 0 if the Shape <S> is not found.
	:param S:
	:type S: HLRTopoBRep_OutLiner
	:rtype: int") Index;
		Standard_Integer Index (const opencascade::handle<HLRTopoBRep_OutLiner> & S);

		/****************** InitEdgeStatus ******************/
		%feature("compactdefaultargs") InitEdgeStatus;
		%feature("autodoc", "* init the status of the selected edges depending of the back faces of a closed shell.
	:rtype: None") InitEdgeStatus;
		void InitEdgeStatus ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* add the shape <S>.
	:param S:
	:type S: HLRTopoBRep_OutLiner
	:param SData:
	:type SData: Standard_Transient
	:param nbIso: default value is 0
	:type nbIso: int
	:rtype: None") Load;
		void Load (const opencascade::handle<HLRTopoBRep_OutLiner> & S,const opencascade::handle<Standard_Transient> & SData,const Standard_Integer nbIso = 0);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* add the shape <S>.
	:param S:
	:type S: HLRTopoBRep_OutLiner
	:param nbIso: default value is 0
	:type nbIso: int
	:rtype: None") Load;
		void Load (const opencascade::handle<HLRTopoBRep_OutLiner> & S,const Standard_Integer nbIso = 0);

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", ":rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** PartialHide ******************/
		%feature("compactdefaultargs") PartialHide;
		%feature("autodoc", "* own hiding of all the shapes of the DataStructure without hiding by each other.
	:rtype: None") PartialHide;
		void PartialHide ();

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "* set the projector.
	:param P:
	:type P: HLRAlgo_Projector
	:rtype: None") Projector;
		void Projector (const HLRAlgo_Projector & P);

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "* set the projector.
	:rtype: HLRAlgo_Projector") Projector;
		HLRAlgo_Projector & Projector ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* remove the Shape of Index <I>.
	:param I:
	:type I: int
	:rtype: None") Remove;
		void Remove (const Standard_Integer I);

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* select all the DataStructure.
	:rtype: None") Select;
		void Select ();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* select only the Shape of index <I>.
	:param I:
	:type I: int
	:rtype: None") Select;
		void Select (const Standard_Integer I);

		/****************** SelectEdge ******************/
		%feature("compactdefaultargs") SelectEdge;
		%feature("autodoc", "* select only the edges of the Shape <S>.
	:param I:
	:type I: int
	:rtype: None") SelectEdge;
		void SelectEdge (const Standard_Integer I);

		/****************** SelectFace ******************/
		%feature("compactdefaultargs") SelectFace;
		%feature("autodoc", "* select only the faces of the Shape <S>.
	:param I:
	:type I: int
	:rtype: None") SelectFace;
		void SelectFace (const Standard_Integer I);

		/****************** SeqOfShapeBounds ******************/
		%feature("compactdefaultargs") SeqOfShapeBounds;
		%feature("autodoc", ":rtype: HLRBRep_SeqOfShapeBounds") SeqOfShapeBounds;
		HLRBRep_SeqOfShapeBounds & SeqOfShapeBounds ();

		/****************** ShapeBounds ******************/
		%feature("compactdefaultargs") ShapeBounds;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: HLRBRep_ShapeBounds") ShapeBounds;
		HLRBRep_ShapeBounds & ShapeBounds (const Standard_Integer I);

		/****************** ShapeData ******************/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "* Change the Shape Data of the Shape of index <I>.
	:param I:
	:type I: int
	:param SData:
	:type SData: Standard_Transient
	:rtype: None") ShapeData;
		void ShapeData (const Standard_Integer I,const opencascade::handle<Standard_Transient> & SData);

		/****************** ShowAll ******************/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "* set to visible all the edges.
	:rtype: None") ShowAll;
		void ShowAll ();

		/****************** ShowAll ******************/
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "* set to visible all the edges of the Shape <S>.
	:param I:
	:type I: int
	:rtype: None") ShowAll;
		void ShowAll (const Standard_Integer I);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* update the DataStructure.
	:rtype: None") Update;
		void Update ();

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
		/****************** CSPoint ******************/
		%feature("compactdefaultargs") CSPoint;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: IntCurveSurface_IntersectionPoint") CSPoint;
		const IntCurveSurface_IntersectionPoint & CSPoint (const Standard_Integer N);

		/****************** CSSegment ******************/
		%feature("compactdefaultargs") CSSegment;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: IntCurveSurface_IntersectionSegment") CSSegment;
		const IntCurveSurface_IntersectionSegment & CSSegment (const Standard_Integer N);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** HLRBRep_Intersector ******************/
		%feature("compactdefaultargs") HLRBRep_Intersector;
		%feature("autodoc", ":rtype: None") HLRBRep_Intersector;
		 HLRBRep_Intersector ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param A:
	:type A: Standard_Address
	:rtype: None") Load;
		void Load (Standard_Address & A);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", ":rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", ":rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the auto intersection of an edge. The edge domain is cutted at start with da1*(b-a) and at end with db1*(b-a).
	:param A1:
	:type A1: Standard_Address
	:param da1:
	:type da1: float
	:param db1:
	:type db1: float
	:rtype: None") Perform;
		void Perform (const Standard_Address A1,const Standard_Real da1,const Standard_Real db1);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between the two edges. The edges domains are cutted at start with da*(b-a) and at end with db*(b-a).
	:param nA:
	:type nA: int
	:param A1:
	:type A1: Standard_Address
	:param da1:
	:type da1: float
	:param db1:
	:type db1: float
	:param nB:
	:type nB: int
	:param A2:
	:type A2: Standard_Address
	:param da2:
	:type da2: float
	:param db2:
	:type db2: float
	:param NoBound:
	:type NoBound: bool
	:rtype: None") Perform;
		void Perform (const Standard_Integer nA,const Standard_Address A1,const Standard_Real da1,const Standard_Real db1,const Standard_Integer nB,const Standard_Address A2,const Standard_Real da2,const Standard_Real db2,const Standard_Boolean NoBound);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param L:
	:type L: gp_Lin
	:param P:
	:type P: float
	:rtype: None") Perform;
		void Perform (const gp_Lin & L,const Standard_Real P);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: IntRes2d_IntersectionPoint") Point;
		const IntRes2d_IntersectionPoint & Point (const Standard_Integer N);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", ":param N:
	:type N: int
	:rtype: IntRes2d_IntersectionSegment") Segment;
		const IntRes2d_IntersectionSegment & Segment (const Standard_Integer N);

		/****************** SimulateOnePoint ******************/
		%feature("compactdefaultargs") SimulateOnePoint;
		%feature("autodoc", "* Create a single IntersectionPoint (U on A1) (V on A2) The point is middle on both curves.
	:param A1:
	:type A1: Standard_Address
	:param U:
	:type U: float
	:param A2:
	:type A2: Standard_Address
	:param V:
	:type V: float
	:rtype: None") SimulateOnePoint;
		void SimulateOnePoint (const Standard_Address A1,const Standard_Real U,const Standard_Address A2,const Standard_Real V);

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
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline (const gp_Lin & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier (const gp_Lin & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: gp_Circ") Circle;
		static gp_Circ Circle (const gp_Lin & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const gp_Lin & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the line.
	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		static void D0 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the line with its first derivative. Raised if the continuity of the current interval is not C1.
	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		static void D1 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D2;
		static void D2 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None") D3;
		static void D3 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		static gp_Vec DN (const gp_Lin & C,const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: int") Degree;
		static Standard_Integer Degree (const gp_Lin & C);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: gp_Elips") Ellipse;
		static gp_Elips Ellipse (const gp_Lin & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const gp_Lin & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the line in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:param C:
	:type C: gp_Lin
	:rtype: GeomAbs_CurveType") GetType;
		static GeomAbs_CurveType GetType (const gp_Lin & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: gp_Hypr") Hyperbola;
		static gp_Hypr Hyperbola (const gp_Lin & C);

		/****************** IntervalContinuity ******************/
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: GeomAbs_Shape") IntervalContinuity;
		static GeomAbs_Shape IntervalContinuity (const gp_Lin & C);

		/****************** IntervalFirst ******************/
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "* Returns the first parameter of the current interval.
	:param C:
	:type C: gp_Lin
	:rtype: float") IntervalFirst;
		static Standard_Real IntervalFirst (const gp_Lin & C);

		/****************** IntervalLast ******************/
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "* Returns the last parameter of the current interval.
	:param C:
	:type C: gp_Lin
	:rtype: float") IntervalLast;
		static Standard_Real IntervalLast (const gp_Lin & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Sets the current working interval.
	:param C:
	:type C: gp_Lin
	:param T:
	:type T: TColStd_Array1OfReal
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: None") Intervals;
		static void Intervals (const gp_Lin & C,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const gp_Lin & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: bool") IsPeriodic;
		static Standard_Boolean IsPeriodic (const gp_Lin & C);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: bool") IsRational;
		static Standard_Boolean IsRational (const gp_Lin & C);

		/****************** KnotsAndMultiplicities ******************/
		%feature("compactdefaultargs") KnotsAndMultiplicities;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:param TK:
	:type TK: TColStd_Array1OfReal
	:param TM:
	:type TM: TColStd_Array1OfInteger
	:rtype: None") KnotsAndMultiplicities;
		static void KnotsAndMultiplicities (const gp_Lin & C,TColStd_Array1OfReal & TK,TColStd_Array1OfInteger & TM);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const gp_Lin & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: gp_Lin") Line;
		static gp_Lin Line (const gp_Lin & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* If necessary, breaks the line in intervals of continuity <S>. And returns the number of intervals.
	:param C:
	:type C: gp_Lin
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		static Standard_Integer NbIntervals (const gp_Lin & C,const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: int") NbKnots;
		static Standard_Integer NbKnots (const gp_Lin & C);

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: int") NbPoles;
		static Standard_Integer NbPoles (const gp_Lin & C);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int") NbSamples;
		static Standard_Integer NbSamples (const gp_Lin & C,const Standard_Real U0,const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: gp_Parab") Parabola;
		static gp_Parab Parabola (const gp_Lin & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:rtype: float") Period;
		static Standard_Real Period (const gp_Lin & C);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:param TP:
	:type TP: TColgp_Array1OfPnt
	:rtype: None") Poles;
		static void Poles (const gp_Lin & C,TColgp_Array1OfPnt & TP);

		/****************** PolesAndWeights ******************/
		%feature("compactdefaultargs") PolesAndWeights;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:param TP:
	:type TP: TColgp_Array1OfPnt
	:param TW:
	:type TW: TColStd_Array1OfReal
	:rtype: None") PolesAndWeights;
		static void PolesAndWeights (const gp_Lin & C,TColgp_Array1OfPnt & TP,TColStd_Array1OfReal & TW);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param C:
	:type C: gp_Lin
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		static Standard_Real Resolution (const gp_Lin & C,const Standard_Real R3d);

		/****************** SamplePars ******************/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", ":param C:
	:type C: gp_Lin
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param Defl:
	:type Defl: float
	:param NbMin:
	:type NbMin: int
	:param Pars:
	:type Pars: TColStd_HArray1OfReal
	:rtype: None") SamplePars;
		static void SamplePars (const gp_Lin & C,const Standard_Real U0,const Standard_Real U1,const Standard_Real Defl,const Standard_Integer NbMin,opencascade::handle<TColStd_HArray1OfReal> & Pars);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the line.
	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		static gp_Pnt Value (const gp_Lin & C,const Standard_Real U);

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
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* Computes the derivative of the previous function at parameter Param.
	:param Param:
	:type Param: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);

		/****************** HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "* Constructor of the class.
	:param IT:
	:type IT: IntCurve_IConicTool
	:param PC:
	:type PC: Standard_Address
	:rtype: None") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter (const IntCurve_IConicTool & IT,const Standard_Address & PC);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the value of the signed distance between the implicit curve and the point at parameter Param on the parametrised curve.
	:param Param:
	:type Param: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* Computes the value and the derivative of the function.
	:param Param:
	:type Param: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);

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
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* Calculation of F'(U).
	:param U:
	:type U: float
	:param DF:
	:type DF: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "* Save the found extremum.
	:rtype: int") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();

		/****************** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", ":rtype: None") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ();

		/****************** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Standard_Address
	:rtype: None") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* sets the field mycurve of the function.
	:param C:
	:type C: Standard_Address
	:rtype: None") Initialize;
		void Initialize (const Standard_Address & C);

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "* Shows if the Nth distance is a minimum.
	:param N:
	:type N: int
	:rtype: bool") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);

		/****************** NbExt ******************/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "* Return the nunber of found extrema.
	:rtype: int") NbExt;
		Standard_Integer NbExt ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the Nth extremum.
	:param N:
	:type N: int
	:rtype: Extrema_POnCurv2d") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);

		/****************** SearchOfTolerance ******************/
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "* Computes a Tol value. If 1st derivative of curve |D1|<Tol, it is considered D1=0.
	:rtype: float") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* sets the field P of the function.
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") SetPoint;
		void SetPoint (const gp_Pnt2d & P);

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Returns the Nth distance.
	:param N:
	:type N: int
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);

		/****************** SubIntervalInitialize ******************/
		%feature("compactdefaultargs") SubIntervalInitialize;
		%feature("autodoc", "* Determines boundaries of subinterval for find of root.
	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Calculation of F(U).
	:param U:
	:type U: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* Calculation of F(U) and F'(U).
	:param U:
	:type U: float
	:param F:
	:type F: float
	:param DF:
	:type DF: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);

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
		/****************** Algo ******************/
		%feature("compactdefaultargs") Algo;
		%feature("autodoc", ":rtype: opencascade::handle<HLRAlgo_PolyAlgo>") Algo;
		opencascade::handle<HLRAlgo_PolyAlgo> Algo ();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", ":rtype: float") Angle;
		Standard_Real Angle ();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", ":param Ang:
	:type Ang: float
	:rtype: None") Angle;
		void Angle (const Standard_Real Ang);

		/****************** Debug ******************/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", ":rtype: bool") Debug;
		Standard_Boolean Debug ();

		/****************** Debug ******************/
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", ":param B:
	:type B: bool
	:rtype: None") Debug;
		void Debug (const Standard_Boolean B);

		/****************** HLRBRep_PolyAlgo ******************/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", "* Constructs an empty framework for the calculation of the visible and hidden lines of a shape in a projection. Use the functions: - Projector to define the point of view - Load to select the shape or shapes to be visualized - Update to compute the visible and hidden lines of the shape. Warning The shape or shapes to be visualized must have already been triangulated.
	:rtype: None") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo ();

		/****************** HLRBRep_PolyAlgo ******************/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", ":param A:
	:type A: HLRBRep_PolyAlgo
	:rtype: None") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo (const opencascade::handle<HLRBRep_PolyAlgo> & A);

		/****************** HLRBRep_PolyAlgo ******************/
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo (const TopoDS_Shape & S);

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", ":param status:
	:type status: HLRAlgo_EdgeStatus
	:param S:
	:type S: TopoDS_Shape
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: HLRAlgo_BiPoint::PointsT") Hide;
		HLRAlgo_BiPoint::PointsT & Hide (HLRAlgo_EdgeStatus & status,TopoDS_Shape & S,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* return the index of the Shape <S> and return 0 if the Shape <S> is not found.
	:param S:
	:type S: TopoDS_Shape
	:rtype: int") Index;
		Standard_Integer Index (const TopoDS_Shape & S);

		/****************** InitHide ******************/
		%feature("compactdefaultargs") InitHide;
		%feature("autodoc", ":rtype: None") InitHide;
		void InitHide ();

		/****************** InitShow ******************/
		%feature("compactdefaultargs") InitShow;
		%feature("autodoc", ":rtype: None") InitShow;
		void InitShow ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads the shape S into this framework. Warning S must have already been triangulated.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Load;
		void Load (const TopoDS_Shape & S);

		/****************** MoreHide ******************/
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", ":rtype: bool") MoreHide;
		Standard_Boolean MoreHide ();

		/****************** MoreShow ******************/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", ":rtype: bool") MoreShow;
		Standard_Boolean MoreShow ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", ":rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** NextHide ******************/
		%feature("compactdefaultargs") NextHide;
		%feature("autodoc", ":rtype: None") NextHide;
		void NextHide ();

		/****************** NextShow ******************/
		%feature("compactdefaultargs") NextShow;
		%feature("autodoc", ":rtype: None") NextShow;
		void NextShow ();

		/****************** OutLinedShape ******************/
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", "* Make a shape with the internal outlines in each face.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") OutLinedShape;
		TopoDS_Shape OutLinedShape (const TopoDS_Shape & S);

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "* Sets the parameters of the view for this framework. These parameters are defined by an HLRAlgo_Projector object, which is returned by the Projector function on a Prs3d_Projector object.
	:rtype: HLRAlgo_Projector") Projector;
		const HLRAlgo_Projector & Projector ();

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", ":param P:
	:type P: HLRAlgo_Projector
	:rtype: None") Projector;
		void Projector (const HLRAlgo_Projector & P);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* remove the Shape of Index <I>.
	:param I:
	:type I: int
	:rtype: None") Remove;
		void Remove (const Standard_Integer I);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape  Shape (const Standard_Integer I);

		/****************** Show ******************/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: HLRAlgo_BiPoint::PointsT") Show;
		HLRAlgo_BiPoint::PointsT & Show (TopoDS_Shape & S,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);

		/****************** TolAngular ******************/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", ":rtype: float") TolAngular;
		Standard_Real TolAngular ();

		/****************** TolAngular ******************/
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") TolAngular;
		void TolAngular (const Standard_Real Tol);

		/****************** TolCoef ******************/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", ":rtype: float") TolCoef;
		Standard_Real TolCoef ();

		/****************** TolCoef ******************/
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") TolCoef;
		void TolCoef (const Standard_Real Tol);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Launches calculation of outlines of the shape visualized by this framework. Used after setting the point of view and defining the shape or shapes to be visualized.
	:rtype: None") Update;
		void Update ();

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
		/****************** HCompound ******************/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") HCompound;
		TopoDS_Shape HCompound ();

		/****************** HCompound ******************/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") HCompound;
		TopoDS_Shape HCompound (const TopoDS_Shape & S);

		/****************** HLRBRep_PolyHLRToShape ******************/
		%feature("compactdefaultargs") HLRBRep_PolyHLRToShape;
		%feature("autodoc", "* Constructs a framework for filtering the results of the HLRBRep_Algo algorithm, A. Use the extraction filters to obtain the results you want for A.
	:rtype: None") HLRBRep_PolyHLRToShape;
		 HLRBRep_PolyHLRToShape ();

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", ":rtype: None") Hide;
		void Hide ();

		/****************** OutLineHCompound ******************/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") OutLineHCompound;
		TopoDS_Shape OutLineHCompound ();

		/****************** OutLineHCompound ******************/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "* Sets the extraction filter for hidden outlines. Hidden outlines occur, for instance, in tori. In this case, the inner outlines of the torus seen on its side are hidden.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") OutLineHCompound;
		TopoDS_Shape OutLineHCompound (const TopoDS_Shape & S);

		/****************** OutLineVCompound ******************/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") OutLineVCompound;
		TopoDS_Shape OutLineVCompound ();

		/****************** OutLineVCompound ******************/
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "* Sets the extraction filter for visible outlines.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") OutLineVCompound;
		TopoDS_Shape OutLineVCompound (const TopoDS_Shape & S);

		/****************** Rg1LineHCompound ******************/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound ();

		/****************** Rg1LineHCompound ******************/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "* Sets the extraction filter for hidden smooth edges.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound (const TopoDS_Shape & S);

		/****************** Rg1LineVCompound ******************/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "* Sets the extraction filter for visible smooth edges.
	:rtype: TopoDS_Shape") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound ();

		/****************** Rg1LineVCompound ******************/
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound (const TopoDS_Shape & S);

		/****************** RgNLineHCompound ******************/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound ();

		/****************** RgNLineHCompound ******************/
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "* Sets the extraction filter for hidden sewn edges.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound (const TopoDS_Shape & S);

		/****************** RgNLineVCompound ******************/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "* Sets the extraction filter for visible sewn edges.
	:rtype: TopoDS_Shape") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound ();

		/****************** RgNLineVCompound ******************/
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound (const TopoDS_Shape & S);

		/****************** Show ******************/
		%feature("compactdefaultargs") Show;
		%feature("autodoc", ":rtype: None") Show;
		void Show ();

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", ":param A:
	:type A: HLRBRep_PolyAlgo
	:rtype: None") Update;
		void Update (const opencascade::handle<HLRBRep_PolyAlgo> & A);

		/****************** VCompound ******************/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", ":rtype: TopoDS_Shape") VCompound;
		TopoDS_Shape VCompound ();

		/****************** VCompound ******************/
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") VCompound;
		TopoDS_Shape VCompound (const TopoDS_Shape & S);

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
		/****************** CurvatureDirections ******************/
		%feature("compactdefaultargs") CurvatureDirections;
		%feature("autodoc", "* Returns the direction of the maximum and minimum curvature <MaxD> and <MinD>
	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:rtype: None") CurvatureDirections;
		void CurvatureDirections (gp_Dir & MaxD,gp_Dir & MinD);

		/****************** D1U ******************/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "* Returns the first U derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D1U;
		const gp_Vec  D1U ();

		/****************** D1V ******************/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "* Returns the first V derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D1V;
		const gp_Vec  D1V ();

		/****************** D2U ******************/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "* Returns the second U derivatives The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D2U;
		const gp_Vec  D2U ();

		/****************** D2V ******************/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "* Returns the second V derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") D2V;
		const gp_Vec  D2V ();

		/****************** DUV ******************/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "* Returns the second UV cross-derivative. The derivative is computed if it has not been yet.
	:rtype: gp_Vec") DUV;
		const gp_Vec  DUV ();

		/****************** GaussianCurvature ******************/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "* Returns the Gaussian curvature
	:rtype: float") GaussianCurvature;
		Standard_Real GaussianCurvature ();

		/****************** HLRBRep_SLProps ******************/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "* Initializes the local properties of the surface <S> for the parameter values (<U>, <V>). The current point and the derivatives are computed at the same time, which allows an optimization of the computation time. <N> indicates the maximum number of derivations to be done (0, 1, or 2). For example, to compute only the tangent, N should be equal to 1. <Resolution> is the linear tolerance (it is used to test if a vector is null).
	:param S:
	:type S: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Address & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);

		/****************** HLRBRep_SLProps ******************/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "* idem as previous constructor but without setting the value of parameters <U> and <V>.
	:param S:
	:type S: Standard_Address
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Address & S,const Standard_Integer N,const Standard_Real Resolution);

		/****************** HLRBRep_SLProps ******************/
		%feature("compactdefaultargs") HLRBRep_SLProps;
		%feature("autodoc", "* idem as previous constructor but without setting the value of parameters <U> and <V> and the surface. the surface can have an empty constructor.
	:param N:
	:type N: int
	:param Resolution:
	:type Resolution: float
	:rtype: None") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Integer N,const Standard_Real Resolution);

		/****************** IsCurvatureDefined ******************/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "* returns True if the curvature is defined.
	:rtype: bool") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined ();

		/****************** IsNormalDefined ******************/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "* Tells if the normal is defined.
	:rtype: bool") IsNormalDefined;
		Standard_Boolean IsNormalDefined ();

		/****************** IsTangentUDefined ******************/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "* returns True if the U tangent is defined. For example, the tangent is not defined if the two first U derivatives are null.
	:rtype: bool") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined ();

		/****************** IsTangentVDefined ******************/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "* returns if the V tangent is defined. For example, the tangent is not defined if the two first V derivatives are null.
	:rtype: bool") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined ();

		/****************** IsUmbilic ******************/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "* returns True if the point is umbilic (i.e. if the curvature is constant).
	:rtype: bool") IsUmbilic;
		Standard_Boolean IsUmbilic ();

		/****************** MaxCurvature ******************/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "* Returns the maximum curvature
	:rtype: float") MaxCurvature;
		Standard_Real MaxCurvature ();

		/****************** MeanCurvature ******************/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "* Returns the mean curvature.
	:rtype: float") MeanCurvature;
		Standard_Real MeanCurvature ();

		/****************** MinCurvature ******************/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "* Returns the minimum curvature
	:rtype: float") MinCurvature;
		Standard_Real MinCurvature ();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "* Returns the normal direction.
	:rtype: gp_Dir") Normal;
		const gp_Dir  Normal ();

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "* Initializes the local properties of the surface S for the new parameter values (<U>, <V>).
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);

		/****************** SetSurface ******************/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "* Initializes the local properties of the surface S for the new surface.
	:param S:
	:type S: Standard_Address
	:rtype: None") SetSurface;
		void SetSurface (const Standard_Address & S);

		/****************** TangentU ******************/
		%feature("compactdefaultargs") TangentU;
		%feature("autodoc", "* Returns the tangent direction <D> on the iso-V.
	:param D:
	:type D: gp_Dir
	:rtype: None") TangentU;
		void TangentU (gp_Dir & D);

		/****************** TangentV ******************/
		%feature("compactdefaultargs") TangentV;
		%feature("autodoc", "* Returns the tangent direction <D> on the iso-V.
	:param D:
	:type D: gp_Dir
	:rtype: None") TangentV;
		void TangentV (gp_Dir & D);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point.
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

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
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* returns the bounds of the Surface.
	:param A:
	:type A: Standard_Address
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") Bounds;
		static void Bounds (const Standard_Address A,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* returns the order of continuity of the Surface <A>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.
	:param A:
	:type A: Standard_Address
	:rtype: int") Continuity;
		static Standard_Integer Continuity (const Standard_Address A);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the Surface <A>.
	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None") D1;
		static void D1 (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the Surface <A>.
	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param DUV:
	:type DUV: gp_Vec
	:rtype: None") D2;
		static void D2 (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		static gp_Vec DN (const Standard_Address A,const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point <P> of 	parameter <U> and <V> on the Surface <A>.
	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") Value;
		static void Value (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P);

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
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", ":param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param E1:
	:type E1: int
	:param E2:
	:type E2: int
	:param F1:
	:type F1: int
	:param F2:
	:type F2: int
	:rtype: None") Bounds;
		void Bounds (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** HLRBRep_ShapeBounds ******************/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", ":rtype: None") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds ();

		/****************** HLRBRep_ShapeBounds ******************/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", ":param S:
	:type S: HLRTopoBRep_OutLiner
	:param SData:
	:type SData: Standard_Transient
	:param nbIso:
	:type nbIso: int
	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param E1:
	:type E1: int
	:param E2:
	:type E2: int
	:param F1:
	:type F1: int
	:param F2:
	:type F2: int
	:rtype: None") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds (const opencascade::handle<HLRTopoBRep_OutLiner> & S,const opencascade::handle<Standard_Transient> & SData,const Standard_Integer nbIso,const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer E1,const Standard_Integer E2,const Standard_Integer F1,const Standard_Integer F2);

		/****************** HLRBRep_ShapeBounds ******************/
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", ":param S:
	:type S: HLRTopoBRep_OutLiner
	:param nbIso:
	:type nbIso: int
	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param E1:
	:type E1: int
	:param E2:
	:type E2: int
	:param F1:
	:type F1: int
	:param F2:
	:type F2: int
	:rtype: None") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds (const opencascade::handle<HLRTopoBRep_OutLiner> & S,const Standard_Integer nbIso,const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer E1,const Standard_Integer E2,const Standard_Integer F1,const Standard_Integer F2);

		/****************** MinMax ******************/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", ":rtype: HLRAlgo_EdgesBlock::MinMaxIndices") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax ();

		/****************** NbOfIso ******************/
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", ":param nbIso:
	:type nbIso: int
	:rtype: None") NbOfIso;
		void NbOfIso (const Standard_Integer nbIso);

		/****************** NbOfIso ******************/
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", ":rtype: int") NbOfIso;
		Standard_Integer NbOfIso ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param S:
	:type S: HLRTopoBRep_OutLiner
	:rtype: None") Shape;
		void Shape (const opencascade::handle<HLRTopoBRep_OutLiner> & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: opencascade::handle<HLRTopoBRep_OutLiner>") Shape;
		const opencascade::handle<HLRTopoBRep_OutLiner> & Shape ();

		/****************** ShapeData ******************/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", ":param SD:
	:type SD: Standard_Transient
	:rtype: None") ShapeData;
		void ShapeData (const opencascade::handle<Standard_Transient> & SD);

		/****************** ShapeData ******************/
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Transient>") ShapeData;
		const opencascade::handle<Standard_Transient> & ShapeData ();

		/****************** Sizes ******************/
		%feature("compactdefaultargs") Sizes;
		%feature("autodoc", ":param NV:
	:type NV: int
	:param NE:
	:type NE: int
	:param NF:
	:type NF: int
	:rtype: None") Sizes;
		void Sizes (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param NV:
	:type NV: int
	:param NE:
	:type NE: int
	:param NF:
	:type NF: int
	:rtype: None") Translate;
		void Translate (const Standard_Integer NV,const Standard_Integer NE,const Standard_Integer NF);

		/****************** UpdateMinMax ******************/
		%feature("compactdefaultargs") UpdateMinMax;
		%feature("autodoc", ":param theTotMinMax:
	:type theTotMinMax: HLRAlgo_EdgesBlock::MinMaxIndices
	:rtype: None") UpdateMinMax;
		void UpdateMinMax (const HLRAlgo_EdgesBlock::MinMaxIndices & theTotMinMax);

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
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Creates a DataStructure containing the OutLiner <S> depending on the projector <P> and nbIso.
	:param S:
	:type S: HLRTopoBRep_OutLiner
	:param P:
	:type P: HLRAlgo_Projector
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool
	:param nbIso: default value is 0
	:type nbIso: int
	:rtype: opencascade::handle<HLRBRep_Data>") Load;
		static opencascade::handle<HLRBRep_Data> Load (const opencascade::handle<HLRTopoBRep_OutLiner> & S,const HLRAlgo_Projector & P,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso = 0);

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
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: gp_Ax1") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution (const Standard_Address S);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline (const Standard_Address S);

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		static opencascade::handle<Adaptor3d_HCurve> BasisCurve (const Standard_Address S);

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: opencascade::handle<Adaptor3d_HSurface>") BasisSurface;
		static opencascade::handle<Adaptor3d_HSurface> BasisSurface (const Standard_Address S);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier (const Standard_Address S);

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: gp_Cone") Cone;
		static gp_Cone Cone (const Standard_Address S);

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: gp_Cylinder") Cylinder;
		static gp_Cylinder Cylinder (const Standard_Address S);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		static void D0 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:param D1u:
	:type D1u: gp_Vec
	:param D1v:
	:type D1v: gp_Vec
	:rtype: None") D1;
		static void D1 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1u,gp_Vec & D1v);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None") D2;
		static void D2 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: None") D3;
		static void D3 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		static gp_Vec DN (const Standard_Address S,const Standard_Real u,const Standard_Real v,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: gp_Dir") Direction;
		static gp_Dir Direction (const Standard_Address S);

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: float") FirstUParameter;
		static Standard_Real FirstUParameter (const Standard_Address S);

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: float") FirstVParameter;
		static Standard_Real FirstVParameter (const Standard_Address S);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: GeomAbs_SurfaceType") GetType;
		static GeomAbs_SurfaceType GetType (const Standard_Address S);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: bool") IsUClosed;
		static Standard_Boolean IsUClosed (const Standard_Address S);

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: bool") IsUPeriodic;
		static Standard_Boolean IsUPeriodic (const Standard_Address S);

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: bool") IsVClosed;
		static Standard_Boolean IsVClosed (const Standard_Address S);

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: bool") IsVPeriodic;
		static Standard_Boolean IsVPeriodic (const Standard_Address S);

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: float") LastUParameter;
		static Standard_Real LastUParameter (const Standard_Address S);

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: float") LastVParameter;
		static Standard_Real LastVParameter (const Standard_Address S);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: int") NbSamplesU;
		static Standard_Integer NbSamplesU (const Standard_Address S);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int") NbSamplesU;
		static Standard_Integer NbSamplesU (const Standard_Address S,const Standard_Real u1,const Standard_Real u2);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: int") NbSamplesV;
		static Standard_Integer NbSamplesV (const Standard_Address S);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int") NbSamplesV;
		static Standard_Integer NbSamplesV (const Standard_Address S,const Standard_Real v1,const Standard_Real v2);

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		static Standard_Integer NbUIntervals (const Standard_Address S,const GeomAbs_Shape Sh);

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		static Standard_Integer NbVIntervals (const Standard_Address S,const GeomAbs_Shape Sh);

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: float") OffsetValue;
		static Standard_Real OffsetValue (const Standard_Address S);

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: gp_Pln") Plane;
		static gp_Pln Plane (const Standard_Address S);

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: gp_Sphere") Sphere;
		static gp_Sphere Sphere (const Standard_Address S);

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: gp_Torus") Torus;
		static gp_Torus Torus (const Standard_Address S);

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param T:
	:type T: TColStd_Array1OfReal
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: None") UIntervals;
		static void UIntervals (const Standard_Address S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: float") UPeriod;
		static Standard_Real UPeriod (const Standard_Address S);

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		static Standard_Real UResolution (const Standard_Address S,const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "* If <First> >= <Last>
	:param S:
	:type S: Standard_Address
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		static opencascade::handle<Adaptor3d_HSurface> UTrim (const Standard_Address S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param T:
	:type T: TColStd_Array1OfReal
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: None") VIntervals;
		static void VIntervals (const Standard_Address S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:rtype: float") VPeriod;
		static Standard_Real VPeriod (const Standard_Address S);

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		static Standard_Real VResolution (const Standard_Address S,const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "* If <First> >= <Last>
	:param S:
	:type S: Standard_Address
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		static opencascade::handle<Adaptor3d_HSurface> VTrim (const Standard_Address S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: gp_Pnt") Value;
		static gp_Pnt Value (const Standard_Address S,const Standard_Real u,const Standard_Real v);

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
		/****************** AuxillarCurve ******************/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", ":rtype: gp_Lin") AuxillarCurve;
		const gp_Lin  AuxillarCurve ();

		/****************** AuxillarSurface ******************/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", ":rtype: Standard_Address") AuxillarSurface;
		const Standard_Address & AuxillarSurface ();

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** HLRBRep_TheCSFunctionOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheCSFunctionOfInterCSurf;
		%feature("autodoc", ":param S:
	:type S: Standard_Address
	:param C:
	:type C: gp_Lin
	:rtype: None") HLRBRep_TheCSFunctionOfInterCSurf;
		 HLRBRep_TheCSFunctionOfInterCSurf (const Standard_Address & S,const gp_Lin & C);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", ":rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", ":rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", ":rtype: float") Root;
		Standard_Real Root ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

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
		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "* returns the values <D> of the derivatives for the variable <X>. returns True if the computation was done successfully, False otherwise.
	:param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", ":param curve1:
	:type curve1: Standard_Address
	:param curve2:
	:type curve2: Standard_Address
	:rtype: None") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter (const Standard_Address & curve1,const Standard_Address & curve2);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "* returns 2.
	:rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "* returns 2.
	:rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* computes the values <F> of the Functions for the variable <X>. returns True if the computation was done successfully, False otherwise.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* returns the values <F> of the functions and the derivatives <D> for the variable <X>. returns True if the computation was done successfully, False otherwise.
	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

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
		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "* return the math function which is used to compute the intersection
	:rtype: HLRBRep_TheCSFunctionOfInterCSurf") Function;
		HLRBRep_TheCSFunctionOfInterCSurf & Function ();

		/****************** HLRBRep_TheExactInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "* compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst)
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param F:
	:type F: HLRBRep_TheCSFunctionOfInterCSurf
	:param TolTangency:
	:type TolTangency: float
	:param MarginCoef: default value is 0.0
	:type MarginCoef: float
	:rtype: None") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf (const Standard_Real U,const Standard_Real V,const Standard_Real W,const HLRBRep_TheCSFunctionOfInterCSurf & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);

		/****************** HLRBRep_TheExactInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheExactInterCSurf;
		%feature("autodoc", "* initialize the parameters to compute the solution
	:param F:
	:type F: HLRBRep_TheCSFunctionOfInterCSurf
	:param TolTangency:
	:type TolTangency: float
	:rtype: None") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf (const HLRBRep_TheCSFunctionOfInterCSurf & F,const Standard_Real TolTangency);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the creation completed without failure.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", ":rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** ParameterOnCurve ******************/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", ":rtype: float") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();

		/****************** ParameterOnSurface ******************/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot
	:param u0:
	:type u0: float
	:param v0:
	:type v0: float
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param w0:
	:type w0: float
	:param w1:
	:type w1: float
	:rtype: None") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* returns the intersection point The exception NotDone is raised if IsDone is false. The exception DomainError is raised if IsEmpty is true.
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

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
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter ();

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between an ellipse and a parametric curve.
	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between a parabola and a parametric curve.
	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between the main branch of an hyperbola and a parametric curve.
	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between a line and a parametric curve.
	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between an ellipse and a parametric curve.
	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between a parabola and a parametric curve.
	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between the main branch of an hyperbola and a parametric curve.
	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param D2:
	:type D2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);

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
		/****************** GetMinNbSamples ******************/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", ":rtype: int") GetMinNbSamples;
		Standard_Integer GetMinNbSamples ();

		/****************** HLRBRep_TheIntPCurvePCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntPCurvePCurveOfCInter;
		%feature("autodoc", ":rtype: None") HLRBRep_TheIntPCurvePCurveOfCInter;
		 HLRBRep_TheIntPCurvePCurveOfCInter ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Curve1:
	:type Curve1: Standard_Address
	:param Domain1:
	:type Domain1: IntRes2d_Domain
	:param Curve2:
	:type Curve2: Standard_Address
	:param Domain2:
	:type Domain2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & Curve1,const IntRes2d_Domain & Domain1,const Standard_Address & Curve2,const IntRes2d_Domain & Domain2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Curve1:
	:type Curve1: Standard_Address
	:param Domain1:
	:type Domain1: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const Standard_Address & Curve1,const IntRes2d_Domain & Domain1,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** SetMinNbSamples ******************/
		%feature("compactdefaultargs") SetMinNbSamples;
		%feature("autodoc", "* Set / get minimum number of points in polygon for intersection.
	:param theMinNbSamples:
	:type theMinNbSamples: int
	:rtype: None") SetMinNbSamples;
		void SetMinNbSamples (const Standard_Integer theMinNbSamples);

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
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "* Constructs an empty interference between Polygon and Polyhedron.
	:rtype: None") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf ();

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "* Constructs and computes an interference between the Polygon and the Polyhedron.
	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "* Constructs and computes an interference between the Straight Line and the Polyhedron.
	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "* Constructs and computes an interference between the Straight Lines and the Polyhedron.
	:param theLins:
	:type theLins: Intf_Array1OfLin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "* Constructs and computes an interference between the Polygon and the Polyhedron.
	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox
	:rtype: None") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "* Constructs and computes an interference between the Straight Line and the Polyhedron.
	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox
	:rtype: None") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "* Constructs and computes an interference between the Straight Lines and the Polyhedron.
	:param theLins:
	:type theLins: Intf_Array1OfLin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox
	:rtype: None") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "* Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.
	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox
	:rtype: None") Interference;
		void Interference (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "* Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.
	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") Interference;
		void Interference (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes an interference between the Polygon and the Polyhedron.
	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") Perform;
		void Perform (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes an interference between the Straight Line and the Polyhedron.
	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") Perform;
		void Perform (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes an interference between the Straight Lines and the Polyhedron.
	:param theLins:
	:type theLins: Intf_Array1OfLin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: None") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes an interference between the Polygon and the Polyhedron.
	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox
	:rtype: None") Perform;
		void Perform (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes an interference between the Straight Line and the Polyhedron.
	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox
	:rtype: None") Perform;
		void Perform (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes an interference between the Straight Lines and the Polyhedron.
	:param theLins:
	:type theLins: Intf_Array1OfLin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox
	:rtype: None") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);

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
		/****************** And_Domaine_Objet1_Intersections ******************/
		%feature("compactdefaultargs") And_Domaine_Objet1_Intersections;
		%feature("autodoc", ":param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool
	:param TheParCurve:
	:type TheParCurve: Standard_Address
	:param TheImpCurveDomain:
	:type TheImpCurveDomain: IntRes2d_Domain
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain
	:param NbResultats:
	:type NbResultats: int
	:param Inter2_And_Domain2:
	:type Inter2_And_Domain2: TColStd_Array1OfReal
	:param Inter1:
	:type Inter1: TColStd_Array1OfReal
	:param Resultat1:
	:type Resultat1: TColStd_Array1OfReal
	:param Resultat2:
	:type Resultat2: TColStd_Array1OfReal
	:param EpsNul:
	:type EpsNul: float
	:rtype: None") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections (const IntCurve_IConicTool & TheImpTool,const Standard_Address & TheParCurve,const IntRes2d_Domain & TheImpCurveDomain,const IntRes2d_Domain & TheParCurveDomain,Standard_Integer &OutValue,TColStd_Array1OfReal & Inter2_And_Domain2,TColStd_Array1OfReal & Inter1,TColStd_Array1OfReal & Resultat1,TColStd_Array1OfReal & Resultat2,const Standard_Real EpsNul);

		/****************** FindU ******************/
		%feature("compactdefaultargs") FindU;
		%feature("autodoc", ":param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheParCurev:
	:type TheParCurev: Standard_Address
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool
	:rtype: float") FindU;
		Standard_Real FindU (const Standard_Real parameter,gp_Pnt2d & point,const Standard_Address & TheParCurev,const IntCurve_IConicTool & TheImpTool);

		/****************** FindV ******************/
		%feature("compactdefaultargs") FindV;
		%feature("autodoc", ":param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool
	:param ParCurve:
	:type ParCurve: Standard_Address
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain
	:param V0:
	:type V0: float
	:param V1:
	:type V1: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: float") FindV;
		Standard_Real FindV (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_IConicTool & TheImpTool,const Standard_Address & ParCurve,const IntRes2d_Domain & TheParCurveDomain,const Standard_Real V0,const Standard_Real V1,const Standard_Real Tolerance);

		/****************** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ();

		/****************** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "* Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
	:param ITool:
	:type ITool: IntCurve_IConicTool
	:param Dom1:
	:type Dom1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param Dom2:
	:type Dom2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Standard_Address & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Intersection between an implicit curve and a parametrised curve. The exception ConstructionError is raised if the domain of the parametrised curve does not verify HasFirstPoint and HasLastPoint return True.
	:param ITool:
	:type ITool: IntCurve_IConicTool
	:param Dom1:
	:type Dom1: IntRes2d_Domain
	:param PCurve:
	:type PCurve: Standard_Address
	:param Dom2:
	:type Dom2: IntRes2d_Domain
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Standard_Address & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);

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
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", ":rtype: None") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ();

		/****************** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Standard_Address
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C,const Standard_Real U0,const Standard_Real TolU);

		/****************** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "* Calculates the distance with a close point. The close point is defined by the parameter value U0. The function F(u)=distance(P,C(u)) has an extremum when g(u)=dF/du=0. The algorithm searchs a zero near the close point. Zeros are searched between Umin et Usup. TolU is used to decide to stop the iterations. At the nth iteration, the criteria is: abs(Un - Un-1) < TolU.
	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Standard_Address
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* sets the fields of the algorithm.
	:param C:
	:type C: Standard_Address
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None") Initialize;
		void Initialize (const Standard_Address & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the distance is found.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "* Returns True if the extremum distance is a minimum.
	:rtype: bool") IsMin;
		Standard_Boolean IsMin ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point of the extremum distance.
	:rtype: Extrema_POnCurv2d") Point;
		const Extrema_POnCurv2d & Point ();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "* Returns the value of the extremum square distance.
	:rtype: float") SquareDistance;
		Standard_Real SquareDistance ();

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
		/****************** ApproxParamOnCurve ******************/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "* Give an approximation of the parameter on the curve according to the discretization of the Curve.
	:param Index:
	:type Index: int
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);

		/****************** AutoIntersectionIsPossible ******************/
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", ":rtype: bool") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible ();

		/****************** CalculRegion ******************/
		%feature("compactdefaultargs") CalculRegion;
		%feature("autodoc", ":param x:
	:type x: float
	:param y:
	:type y: float
	:param x1:
	:type x1: float
	:param x2:
	:type x2: float
	:param y1:
	:type y1: float
	:param y2:
	:type y2: float
	:rtype: int") CalculRegion;
		Standard_Integer CalculRegion (const Standard_Real x,const Standard_Real y,const Standard_Real x1,const Standard_Real x2,const Standard_Real y1,const Standard_Real y2);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":param clos:
	:type clos: bool
	:rtype: None") Closed;
		void Closed (const Standard_Boolean clos);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Returns True if the polyline is closed.
	:rtype: bool") Closed;
		Standard_Boolean Closed ();

		/****************** ComputeWithBox ******************/
		%feature("compactdefaultargs") ComputeWithBox;
		%feature("autodoc", "* The current polygon is modified if most of the points of the polygon are are outside the box <OtherBox>. In this situation, bounds are computed to build a polygon inside or near the OtherBox.
	:param Curve:
	:type Curve: Standard_Address
	:param OtherBox:
	:type OtherBox: Bnd_Box2d
	:rtype: None") ComputeWithBox;
		void ComputeWithBox (const Standard_Address & Curve,const Bnd_Box2d & OtherBox);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", ":rtype: float") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter ******************/
		%feature("compactdefaultargs") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		%feature("autodoc", "* Compute a polygon on the domain of the curve.
	:param Curve:
	:type Curve: Standard_Address
	:param NbPnt:
	:type NbPnt: int
	:param Domain:
	:type Domain: IntRes2d_Domain
	:param Tol:
	:type Tol: float
	:rtype: None") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter (const Standard_Address & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol);

		/****************** InfParameter ******************/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "* Returns the parameter (On the curve) of the first point of the Polygon
	:rtype: float") InfParameter;
		Standard_Real InfParameter ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* Give the number of Segments in the polyline.
	:rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns the points of the segment <Index> in the Polygon.
	:param theIndex:
	:type theIndex: int
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: void") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);

		/****************** SetDeflectionOverEstimation ******************/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", ":param x:
	:type x: float
	:rtype: None") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);

		/****************** SupParameter ******************/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "* Returns the parameter (On the curve) of the last point of the Polygon
	:rtype: float") SupParameter;
		Standard_Real SupParameter ();

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
		/****************** ApproxParamOnCurve ******************/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "* Give an approximation of the parameter on the curve according to the discretization of the Curve.
	:param Index:
	:type Index: int
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);

		/****************** BeginOfSeg ******************/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "* Give the point of range Index in the Polygon.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") BeginOfSeg;
		const gp_Pnt  BeginOfSeg (const Standard_Integer Index);

		/****************** Bounding ******************/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "* Give the bounding box of the polygon.
	:rtype: Bnd_Box") Bounding;
		const Bnd_Box & Bounding ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":param clos:
	:type clos: bool
	:rtype: None") Closed;
		void Closed (const Standard_Boolean clos);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":rtype: bool") Closed;
		Standard_Boolean Closed ();

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", ":rtype: float") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** EndOfSeg ******************/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "* Give the point of range Index in the Polygon.
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") EndOfSeg;
		const gp_Pnt  EndOfSeg (const Standard_Integer Index);

		/****************** HLRBRep_ThePolygonOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", ":param Curve:
	:type Curve: gp_Lin
	:param NbPnt:
	:type NbPnt: int
	:rtype: None") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const Standard_Integer NbPnt);

		/****************** HLRBRep_ThePolygonOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", ":param Curve:
	:type Curve: gp_Lin
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param NbPnt:
	:type NbPnt: int
	:rtype: None") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const Standard_Real U1,const Standard_Real U2,const Standard_Integer NbPnt);

		/****************** HLRBRep_ThePolygonOfInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_ThePolygonOfInterCSurf;
		%feature("autodoc", ":param Curve:
	:type Curve: gp_Lin
	:param Upars:
	:type Upars: TColStd_Array1OfReal
	:rtype: None") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const TColStd_Array1OfReal & Upars);

		/****************** InfParameter ******************/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "* Returns the parameter (On the curve) of the first point of the Polygon
	:rtype: float") InfParameter;
		Standard_Real InfParameter ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* Give the number of Segments in the polyline.
	:rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** SetDeflectionOverEstimation ******************/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", ":param x:
	:type x: float
	:rtype: None") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);

		/****************** SupParameter ******************/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "* Returns the parameter (On the curve) of the last point of the Polygon
	:rtype: float") SupParameter;
		Standard_Real SupParameter ();

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
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "* Give the point of range Index in the Polygon.
	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") BeginOfSeg;
		static const gp_Pnt  BeginOfSeg (const HLRBRep_ThePolygonOfInterCSurf & thePolygon,const Standard_Integer Index);

		/****************** Bounding ******************/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "* Give the bounding box of the polygon.
	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf
	:rtype: Bnd_Box") Bounding;
		static const Bnd_Box & Bounding (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf
	:rtype: bool") Closed;
		static Standard_Boolean Closed (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", ":param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf
	:rtype: float") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf
	:rtype: void") Dump;
		static void Dump (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

		/****************** EndOfSeg ******************/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "* Give the point of range Index in the Polygon.
	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") EndOfSeg;
		static const gp_Pnt  EndOfSeg (const HLRBRep_ThePolygonOfInterCSurf & thePolygon,const Standard_Integer Index);

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", ":param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf
	:rtype: int") NbSegments;
		static Standard_Integer NbSegments (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);

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
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "* Give the bounding box of the PolyhedronTool.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: Bnd_Box") Bounding;
		static const Bnd_Box & Bounding (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** ComponentsBounding ******************/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "* Give the array of boxes. The box <n> corresponding to the triangle <n>.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: opencascade::handle<Bnd_HArray1OfBox>") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "* Give the tolerance of the polygon.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: float") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: void") Dump;
		static void Dump (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** GetBorderDeflection ******************/
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "* This method returns a border deflection of the polyhedron.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: float") GetBorderDeflection;
		static Standard_Real GetBorderDeflection (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** IsOnBound ******************/
		%feature("compactdefaultargs") IsOnBound;
		%feature("autodoc", "* This method returns true if the edge based on points with indices Index1 and Index2 represents a boundary edge. It is necessary to take into account the boundary deflection for this edge.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param Index1:
	:type Index1: int
	:param Index2:
	:type Index2: int
	:rtype: bool") IsOnBound;
		static Standard_Boolean IsOnBound (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index1,const Standard_Integer Index2);

		/****************** NbTriangles ******************/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "* Give the number of triangles in this polyedral surface.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:rtype: int") NbTriangles;
		static Standard_Integer NbTriangles (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Give the point of index i in the polyedral surface.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") Point;
		static const gp_Pnt  Point (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index);

		/****************** TriConnex ******************/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "* Give the addresse Tricon of the triangle connexe to the triangle of address Triang by the edge Pivot Pedge and the third point of this connexe triangle. When we are on a free edge TriCon==0 but the function return the value of the triangle in the other side of Pivot on the free edge. Used to turn around a vertex.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param Triang:
	:type Triang: int
	:param Pivot:
	:type Pivot: int
	:param Pedge:
	:type Pedge: int
	:param TriCon:
	:type TriCon: int
	:param OtherP:
	:type OtherP: int
	:rtype: int") TriConnex;
		static Standard_Integer TriConnex (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Triangle ******************/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "* Give the indices of the 3 points of the triangle of address Index in the PolyhedronTool.
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf
	:param Index:
	:type Index: int
	:param P1:
	:type P1: int
	:param P2:
	:type P2: int
	:param P3:
	:type P3: int
	:rtype: None") Triangle;
		static void Triangle (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

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
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "* Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondance between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. In that case, no bounds are given. The research of the rigth parameter has to be made on the natural parametric domain of the curve.
	:param C:
	:type C: Standard_Address
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: float") FindParameter;
		static Standard_Real FindParameter (const Standard_Address & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "* Returns the parameter V of the point on the parametric curve corresponding to the Point Pnt. The Correspondance between Pnt and the point P(V) on the parametric curve must be coherent with the way of determination of the signed distance between a point and the implicit curve. Tol is the tolerance on the distance between a point and the parametrised curve. LowParameter and HighParameter give the boundaries of the interval in wich the parameter certainly lies. These parameters are given to implement a more efficient algoritm. So, it is not necessary to check that the returned value verifies LowParameter <= Value <= HighParameter.
	:param C:
	:type C: Standard_Address
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param LowParameter:
	:type LowParameter: float
	:param HighParameter:
	:type HighParameter: float
	:param Tol:
	:type Tol: float
	:rtype: float") FindParameter;
		static Standard_Real FindParameter (const Standard_Address & C,const gp_Pnt2d & Pnt,const Standard_Real LowParameter,const Standard_Real HighParameter,const Standard_Real Tol);

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
		%feature("compactdefaultargs") HLRBRep_TheQuadCurvExactInterCSurf;
		%feature("autodoc", "* Provides the signed distance function : Q(w) and its first derivative dQ(w)/dw
	:param S:
	:type S: Standard_Address
	:param C:
	:type C: gp_Lin
	:rtype: None") HLRBRep_TheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvExactInterCSurf (const Standard_Address & S,const gp_Lin & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* U1 and U2 are the parameters of a segment on the curve.
	:param Index:
	:type Index: int
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None") Intervals;
		void Intervals (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", ":rtype: int") NbIntervals;
		Standard_Integer NbIntervals ();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", ":rtype: int") NbRoots;
		Standard_Integer NbRoots ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: float") Root;
		Standard_Real Root (const Standard_Integer Index);

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
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "* Computes the derivative of the previous function at parameter Param. Derivative always returns True.
	:param Param:
	:type Param: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);

		/****************** HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf ******************/
		%feature("compactdefaultargs") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		%feature("autodoc", "* Create the function.
	:param Q:
	:type Q: IntSurf_Quadric
	:param C:
	:type C: gp_Lin
	:rtype: None") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf (const IntSurf_Quadric & Q,const gp_Lin & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the value of the signed distance between the implicit surface and the point at parameter Param on the parametrised curve. Value always returns True.
	:param Param:
	:type Param: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "* Computes the value and the derivative of the function. returns True.
	:param Param:
	:type Param: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);

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
		/****************** BoundaryTransition ******************/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "* Returns the transition of the current vertex relative to the boundary if it is an interference.
	:rtype: TopAbs_Orientation") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "* Returns the current vertex
	:rtype: HLRAlgo_Intersection") Current;
		const HLRAlgo_Intersection & Current ();

		/****************** HLRBRep_VertexList ******************/
		%feature("compactdefaultargs") HLRBRep_VertexList;
		%feature("autodoc", ":param T:
	:type T: HLRBRep_EdgeInterferenceTool
	:param I:
	:type I: HLRAlgo_ListIteratorOfInterferenceList
	:rtype: None") HLRBRep_VertexList;
		 HLRBRep_VertexList (const HLRBRep_EdgeInterferenceTool & T,const HLRAlgo_ListIteratorOfInterferenceList & I);

		/****************** IsBoundary ******************/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "* Returns True if the current vertex is is on the boundary of the edge.
	:rtype: bool") IsBoundary;
		Standard_Boolean IsBoundary ();

		/****************** IsInterference ******************/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "* Returns True if the current vertex is an interference.
	:rtype: bool") IsInterference;
		Standard_Boolean IsInterference ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "* Returns True when the curve is periodic.
	:rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True when there are more vertices.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Proceeds to the next vertex.
	:rtype: None") Next;
		void Next ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns the orientation of the current vertex if it is on the boundary of the edge.
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "* Returns the transition of the current vertex if it is an interference.
	:rtype: TopAbs_Orientation") Transition;
		TopAbs_Orientation Transition ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* add the Shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:param SData:
	:type SData: Standard_Transient
	:param nbIso: default value is 0
	:type nbIso: int
	:rtype: None") Add;
		void Add (const TopoDS_Shape & S,const opencascade::handle<Standard_Transient> & SData,const Standard_Integer nbIso = 0);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the shape S to this framework, and specifies the number of isoparameters nbiso desired in visualizing S. You may add as many shapes as you wish. Use the function Add once for each shape.
	:param S:
	:type S: TopoDS_Shape
	:param nbIso: default value is 0
	:type nbIso: int
	:rtype: None") Add;
		void Add (const TopoDS_Shape & S,const Standard_Integer nbIso = 0);

		/****************** HLRBRep_Algo ******************/
		%feature("compactdefaultargs") HLRBRep_Algo;
		%feature("autodoc", "* Constructs an empty framework for the calculation of visible and hidden lines of a shape in a projection. Use the function: - Projector to define the point of view - Add to select the shape or shapes to be visualized - Update to compute the outlines of the shape, and - Hide to compute the visible and hidden lines of the shape.
	:rtype: None") HLRBRep_Algo;
		 HLRBRep_Algo ();

		/****************** HLRBRep_Algo ******************/
		%feature("compactdefaultargs") HLRBRep_Algo;
		%feature("autodoc", ":param A:
	:type A: HLRBRep_Algo
	:rtype: None") HLRBRep_Algo;
		 HLRBRep_Algo (const opencascade::handle<HLRBRep_Algo> & A);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* return the index of the Shape <S> and return 0 if the Shape <S> is not found.
	:param S:
	:type S: TopoDS_Shape
	:rtype: int") Index;
		Standard_Integer Index (const TopoDS_Shape & S);

		/****************** OutLinedShapeNullify ******************/
		%feature("compactdefaultargs") OutLinedShapeNullify;
		%feature("autodoc", "* nullify all the results of OutLiner from HLRTopoBRep.
	:rtype: None") OutLinedShapeNullify;
		void OutLinedShapeNullify ();

};


%make_alias(HLRBRep_Algo)

%extend HLRBRep_Algo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
