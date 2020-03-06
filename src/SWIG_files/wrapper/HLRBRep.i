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

class HLRBRep_TypeOfResultingEdge:
	HLRBRep_Undefined = 0
	HLRBRep_IsoLine = 1
	HLRBRep_OutLine = 2
	HLRBRep_Rg1Line = 3
	HLRBRep_RgNLine = 4
	HLRBRep_Sharp = 5
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
%template(HLRBRep_ListOfBPoint) NCollection_List<HLRBRep_BiPoint>;
%template(HLRBRep_SeqOfShapeBounds) NCollection_Sequence<HLRBRep_ShapeBounds>;
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** EdgeAfter ******************/
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
		%feature("compactdefaultargs") EdgeAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") EdgeAfter;
		TopAbs_State EdgeAfter();

		/****************** EdgeBefore ******************/
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
		%feature("compactdefaultargs") EdgeBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") EdgeBefore;
		TopAbs_State EdgeBefore();

		/****************** IsBoundary ******************/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****************** IsInterference ******************/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsInterference;
		Standard_Boolean IsInterference();

		/****************** Next ******************/
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
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRBRep_AreaLimit>
") Next;
		opencascade::handle<HLRBRep_AreaLimit> Next();

		/****************** Previous ******************/
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
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRBRep_AreaLimit>
") Previous;
		opencascade::handle<HLRBRep_AreaLimit> Previous();

		/****************** StateAfter ******************/
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
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
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
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

		/****************** Vertex ******************/
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
		%feature("compactdefaultargs") HLRBRep_BiPnt2D;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D();

		/****************** HLRBRep_BiPnt2D ******************/
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
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IntLine;
		Standard_Boolean IntLine();

		/****************** IntLine ******************/
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
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine();

		/****************** OutLine ******************/
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
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") P1;
		const gp_Pnt2d P1();

		/****************** P2 ******************/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
") P2;
		const gp_Pnt2d P2();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****************** Rg1Line ******************/
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
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") RgNLine;
		Standard_Boolean RgNLine();

		/****************** RgNLine ******************/
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
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shape ******************/
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
		%feature("compactdefaultargs") HLRBRep_BiPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_BiPoint;
		 HLRBRep_BiPoint();

		/****************** HLRBRep_BiPoint ******************/
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
		%feature("compactdefaultargs") IntLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IntLine;
		Standard_Boolean IntLine();

		/****************** IntLine ******************/
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
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine();

		/****************** OutLine ******************/
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
		%feature("compactdefaultargs") P1;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") P1;
		const gp_Pnt P1();

		/****************** P2 ******************/
		%feature("compactdefaultargs") P2;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") P2;
		const gp_Pnt P2();

		/****************** Rg1Line ******************/
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****************** Rg1Line ******************/
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
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") RgNLine;
		Standard_Boolean RgNLine();

		/****************** RgNLine ******************/
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
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** Shape ******************/
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
		%feature("compactdefaultargs") HLRBRep_CInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_CInter;
		 HLRBRep_CInter();

		/****************** HLRBRep_CInter ******************/
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
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Curvature;
		%feature("autodoc", "Returns the curvature.

Returns
-------
float
") Curvature;
		Standard_Real Curvature();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the first derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D1;
		const gp_Vec2d D1();

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the second derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D2;
		const gp_Vec2d D2();

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the third derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec2d
") D3;
		const gp_Vec2d D3();

		/****************** IsTangentDefined ******************/
		%feature("compactdefaultargs") IsTangentDefined;
		%feature("autodoc", "Returns true if the tangent is defined. for example, the tangent is not defined if the three first derivatives are all null.

Returns
-------
bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined();

		/****************** Normal ******************/
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
		%feature("compactdefaultargs") HLRBRep_Curve;
		%feature("autodoc", "Creates an undefined curve.

Returns
-------
None
") HLRBRep_Curve;
		 HLRBRep_Curve();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ2d
") Circle;
		gp_Circ2d Circle();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the 3d curve.

Returns
-------
BRepAdaptor_Curve
") Curve;
		BRepAdaptor_Curve & Curve();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the 3d curve.

Returns
-------
BRepAdaptor_Curve
") GetCurve;
		const BRepAdaptor_Curve & GetCurve();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****************** Intervals ******************/
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knots ******************/
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
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin2d
") Line;
		gp_Lin2d Line();

		/****************** Multiplicities ******************/
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
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab2d
") Parabola;
		gp_Parab2d Parabola();

		/****************** Parameter2d ******************/
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
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Poles ******************/
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
		%feature("compactdefaultargs") AboveInterference;
		%feature("autodoc", "Returns true if the rejected interference is above the face.

Returns
-------
bool
") AboveInterference;
		Standard_Boolean AboveInterference();

		/****************** Classify ******************/
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
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** EDataArray ******************/
		%feature("compactdefaultargs") EDataArray;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Array1OfEData
") EDataArray;
		HLRBRep_Array1OfEData & EDataArray();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the current edge.

Returns
-------
int
") Edge;
		Standard_Integer Edge();

		/****************** EdgeMap ******************/
		%feature("compactdefaultargs") EdgeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") EdgeMap;
		TopTools_IndexedMapOfShape & EdgeMap();

		/****************** EdgeOfTheHidingFace ******************/
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
		%feature("compactdefaultargs") FDataArray;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Array1OfFData
") FDataArray;
		HLRBRep_Array1OfFData & FDataArray();

		/****************** FaceMap ******************/
		%feature("compactdefaultargs") FaceMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") FaceMap;
		TopTools_IndexedMapOfShape & FaceMap();

		/****************** HidingStartLevel ******************/
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
		%feature("compactdefaultargs") HidingTheFace;
		%feature("autodoc", "Returns true if the current edge to be hidden belongs to the hiding face.

Returns
-------
bool
") HidingTheFace;
		Standard_Boolean HidingTheFace();

		/****************** InitBoundSort ******************/
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
		%feature("compactdefaultargs") InitInterference;
		%feature("autodoc", "Intersect the current edge with the boundary of the hiding face. the interferences are given by the more, next, and value methods.

Returns
-------
None
") InitInterference;
		void InitInterference();

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Interference
") Interference;
		HLRAlgo_Interference & Interference();

		/****************** IsBadFace ******************/
		%feature("compactdefaultargs") IsBadFace;
		%feature("autodoc", "Returns true if the current face is bad.

Returns
-------
bool
") IsBadFace;
		Standard_Boolean IsBadFace();

		/****************** LocalFEGeometry2D ******************/
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
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreEdge;
		Standard_Boolean MoreEdge();

		/****************** MoreInterference ******************/
		%feature("compactdefaultargs") MoreInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreInterference;
		Standard_Boolean MoreInterference();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges();

		/****************** NbFaces ******************/
		%feature("compactdefaultargs") NbFaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbFaces;
		Standard_Integer NbFaces();

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertices;
		Standard_Integer NbVertices();

		/****************** NextEdge ******************/
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
		%feature("compactdefaultargs") NextInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextInterference;
		void NextInterference();

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector & Projector();

		/****************** RejectedInterference ******************/
		%feature("compactdefaultargs") RejectedInterference;
		%feature("autodoc", "Returns true if the interference is rejected.

Returns
-------
bool
") RejectedInterference;
		Standard_Boolean RejectedInterference();

		/****************** SimplClassify ******************/
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
		%feature("compactdefaultargs") SimpleHidingFace;
		%feature("autodoc", "Returns true if the current hiding face is not an auto-intersected one.

Returns
-------
bool
") SimpleHidingFace;
		Standard_Boolean SimpleHidingFace();

		/****************** Tolerance ******************/
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
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance for the rejections during the exploration.

Returns
-------
Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance();

		/****************** Update ******************/
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
		%feature("compactdefaultargs") AreaEdgeState;
		%feature("autodoc", "Returns the edge state of the current area.

Returns
-------
TopAbs_State
") AreaEdgeState;
		TopAbs_State AreaEdgeState();

		/****************** AreaState ******************/
		%feature("compactdefaultargs") AreaState;
		%feature("autodoc", "Returns the state of the current area.

Returns
-------
TopAbs_State
") AreaState;
		TopAbs_State AreaState();

		/****************** Builds ******************/
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
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current vertex of the current edge.

Returns
-------
HLRAlgo_Intersection
") Current;
		const HLRAlgo_Intersection & Current();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** HasArea ******************/
		%feature("compactdefaultargs") HasArea;
		%feature("autodoc", "Returns true if there is a current area.

Returns
-------
bool
") HasArea;
		Standard_Boolean HasArea();

		/****************** InitAreas ******************/
		%feature("compactdefaultargs") InitAreas;
		%feature("autodoc", "Initialize an iteration on the areas.

Returns
-------
None
") InitAreas;
		void InitAreas();

		/****************** IsBoundary ******************/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Returns true if the current vertex comes from the boundary of the edge.

Returns
-------
bool
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****************** IsInterference ******************/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Returns true if the current vertex was an interference.

Returns
-------
bool
") IsInterference;
		Standard_Boolean IsInterference();

		/****************** LeftLimit ******************/
		%feature("compactdefaultargs") LeftLimit;
		%feature("autodoc", "Returns the arealimit beginning the current area. this is a null handle when the area is infinite on the left.

Returns
-------
opencascade::handle<HLRBRep_AreaLimit>
") LeftLimit;
		opencascade::handle<HLRBRep_AreaLimit> LeftLimit();

		/****************** MoreEdges ******************/
		%feature("compactdefaultargs") MoreEdges;
		%feature("autodoc", "Returns true if there are more new edges to build.

Returns
-------
bool
") MoreEdges;
		Standard_Boolean MoreEdges();

		/****************** MoreVertices ******************/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "True if there are more vertices in the current new edge.

Returns
-------
bool
") MoreVertices;
		Standard_Boolean MoreVertices();

		/****************** NextArea ******************/
		%feature("compactdefaultargs") NextArea;
		%feature("autodoc", "Set the current area to the next area.

Returns
-------
None
") NextArea;
		void NextArea();

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "Proceeds to the next edge to build. skip all remaining vertices on the current edge.

Returns
-------
None
") NextEdge;
		void NextEdge();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Proceeds to the next vertex of the current edge.

Returns
-------
None
") NextVertex;
		void NextVertex();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the new orientation of the current vertex.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** PreviousArea ******************/
		%feature("compactdefaultargs") PreviousArea;
		%feature("autodoc", "Set the current area to the previous area.

Returns
-------
None
") PreviousArea;
		void PreviousArea();

		/****************** RightLimit ******************/
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
		%feature("compactdefaultargs") HLRBRep_EdgeData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_EdgeData;
		 HLRBRep_EdgeData();

		/****************** AutoIntersectionDone ******************/
		%feature("compactdefaultargs") AutoIntersectionDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AutoIntersectionDone;
		Standard_Boolean AutoIntersectionDone();

		/****************** AutoIntersectionDone ******************/
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
		%feature("compactdefaultargs") ChangeGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Curve
") ChangeGeometry;
		HLRBRep_Curve & ChangeGeometry();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Curve *
") Curve;
		HLRBRep_Curve * Curve();

		/****************** CutAtEnd ******************/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CutAtEnd;
		Standard_Boolean CutAtEnd();

		/****************** CutAtEnd ******************/
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
		%feature("compactdefaultargs") CutAtSta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") CutAtSta;
		Standard_Boolean CutAtSta();

		/****************** CutAtSta ******************/
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
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Curve
") Geometry;
		const HLRBRep_Curve & Geometry();

		/****************** HideCount ******************/
		%feature("compactdefaultargs") HideCount;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") HideCount;
		Standard_Integer HideCount();

		/****************** HideCount ******************/
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
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgesBlock::MinMaxIndices
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****************** OutLVEnd ******************/
		%feature("compactdefaultargs") OutLVEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLVEnd;
		Standard_Boolean OutLVEnd();

		/****************** OutLVEnd ******************/
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
		%feature("compactdefaultargs") OutLVSta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLVSta;
		Standard_Boolean OutLVSta();

		/****************** OutLVSta ******************/
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
		%feature("compactdefaultargs") Rg1Line;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Rg1Line;
		Standard_Boolean Rg1Line();

		/****************** Rg1Line ******************/
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
		%feature("compactdefaultargs") RgNLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") RgNLine;
		Standard_Boolean RgNLine();

		/****************** RgNLine ******************/
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
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Selected;
		Standard_Boolean Selected();

		/****************** Selected ******************/
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
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Simple;
		Standard_Boolean Simple();

		/****************** Simple ******************/
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
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgeStatus
") Status;
		HLRAlgo_EdgeStatus & Status();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance();

		/****************** UpdateMinMax ******************/
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
		%feature("compactdefaultargs") Used;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Used;
		Standard_Boolean Used();

		/****************** Used ******************/
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
		%feature("compactdefaultargs") VEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VEnd;
		Standard_Integer VEnd();

		/****************** VEnd ******************/
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
		%feature("compactdefaultargs") VSta;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VSta;
		Standard_Integer VSta();

		/****************** VSta ******************/
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
		%feature("compactdefaultargs") VerAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") VerAtEnd;
		Standard_Boolean VerAtEnd();

		/****************** VerAtEnd ******************/
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
		%feature("compactdefaultargs") VerAtSta;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") VerAtSta;
		Standard_Boolean VerAtSta();

		/****************** VerAtSta ******************/
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
		%feature("compactdefaultargs") Vertical;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Vertical;
		Standard_Boolean Vertical();

		/****************** Vertical ******************/
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
		%feature("compactdefaultargs") CurrentOrientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") CurrentOrientation;
		TopAbs_Orientation CurrentOrientation();

		/****************** CurrentParameter ******************/
		%feature("compactdefaultargs") CurrentParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") CurrentParameter;
		Standard_Real CurrentParameter();

		/****************** CurrentVertex ******************/
		%feature("compactdefaultargs") CurrentVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Intersection
") CurrentVertex;
		const HLRAlgo_Intersection & CurrentVertex();

		/****************** EdgeGeometry ******************/
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
		%feature("compactdefaultargs") InitVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertices;
		void InitVertices();

		/****************** InterferenceBoundaryGeometry ******************/
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
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LoadEdge ******************/
		%feature("compactdefaultargs") LoadEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LoadEdge;
		void LoadEdge();

		/****************** MoreVertices ******************/
		%feature("compactdefaultargs") MoreVertices;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertices;
		Standard_Boolean MoreVertices();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		void NextVertex();

		/****************** ParameterOfInterference ******************/
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
		%feature("compactdefaultargs") AnErrorOccurred;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") HLRBRep_FaceData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_FaceData;
		 HLRBRep_FaceData();

		/****************** Back ******************/
		%feature("compactdefaultargs") Back;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Back;
		Standard_Boolean Back();

		/****************** Back ******************/
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
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** Closed ******************/
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
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Cone;
		Standard_Boolean Cone();

		/****************** Cone ******************/
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
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Cut;
		Standard_Boolean Cut();

		/****************** Cut ******************/
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
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Cylinder;
		Standard_Boolean Cylinder();

		/****************** Cylinder ******************/
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
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_Surface
") Geometry;
		HLRBRep_Surface & Geometry();

		/****************** Hiding ******************/
		%feature("compactdefaultargs") Hiding;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Hiding;
		Standard_Boolean Hiding();

		/****************** Hiding ******************/
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
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Orientation ******************/
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
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Plane;
		Standard_Boolean Plane();

		/****************** Plane ******************/
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
		%feature("compactdefaultargs") Selected;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Selected;
		Standard_Boolean Selected();

		/****************** Selected ******************/
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
		%feature("compactdefaultargs") Side;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Side;
		Standard_Boolean Side();

		/****************** Side ******************/
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
		%feature("compactdefaultargs") Simple;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Simple;
		Standard_Boolean Simple();

		/****************** Simple ******************/
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
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Size;
		Standard_Real Size();

		/****************** Size ******************/
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
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Sphere;
		Standard_Boolean Sphere();

		/****************** Sphere ******************/
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
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Torus;
		Standard_Boolean Torus();

		/****************** Torus ******************/
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
		%feature("compactdefaultargs") Wires;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRAlgo_WiresBlock>
") Wires;
		opencascade::handle<HLRAlgo_WiresBlock> & Wires();

		/****************** WithOutL ******************/
		%feature("compactdefaultargs") WithOutL;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") WithOutL;
		Standard_Boolean WithOutL();

		/****************** WithOutL ******************/
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
		%feature("compactdefaultargs") HLRBRep_FaceIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_FaceIterator;
		 HLRBRep_FaceIterator();

		/****************** BeginningOfWire ******************/
		%feature("compactdefaultargs") BeginningOfWire;
		%feature("autodoc", "Returns true if the current edge is the first of a wire.

Returns
-------
bool
") BeginningOfWire;
		Standard_Boolean BeginningOfWire();

		/****************** Double ******************/
		%feature("compactdefaultargs") Double;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Double;
		Standard_Boolean Double();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Edge;
		Standard_Integer Edge();

		/****************** EndOfWire ******************/
		%feature("compactdefaultargs") EndOfWire;
		%feature("autodoc", "Returns true if the current edge is the last of a wire.

Returns
-------
bool
") EndOfWire;
		Standard_Boolean EndOfWire();

		/****************** InitEdge ******************/
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
		%feature("compactdefaultargs") Internal;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Internal;
		Standard_Boolean Internal();

		/****************** IsoLine ******************/
		%feature("compactdefaultargs") IsoLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsoLine;
		Standard_Boolean IsoLine();

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

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** OutLine ******************/
		%feature("compactdefaultargs") OutLine;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OutLine;
		Standard_Boolean OutLine();

		/****************** SkipWire ******************/
		%feature("compactdefaultargs") SkipWire;
		%feature("autodoc", "Skip the current wire in the exploration.

Returns
-------
None
") SkipWire;
		void SkipWire();

		/****************** Wire ******************/
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
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound();

		/****************** HCompound ******************/
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
		%feature("compactdefaultargs") IsoLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound();

		/****************** IsoLineHCompound ******************/
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
		%feature("compactdefaultargs") IsoLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound();

		/****************** IsoLineVCompound ******************/
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
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound();

		/****************** OutLineHCompound ******************/
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
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound();

		/****************** OutLineVCompound ******************/
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
		%feature("compactdefaultargs") OutLineVCompound3d;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineVCompound3d;
		TopoDS_Shape OutLineVCompound3d();

		/****************** Rg1LineHCompound ******************/
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound();

		/****************** Rg1LineHCompound ******************/
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
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound();

		/****************** Rg1LineVCompound ******************/
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
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound();

		/****************** RgNLineHCompound ******************/
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
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound();

		/****************** RgNLineVCompound ******************/
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
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound();

		/****************** VCompound ******************/
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
		%feature("compactdefaultargs") HLRBRep_IntConicCurveOfCInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter();

		/****************** HLRBRep_IntConicCurveOfCInter ******************/
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
		%feature("compactdefaultargs") HLRBRep_InterCSurf;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_InterCSurf;
		 HLRBRep_InterCSurf();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") HLRBRep_InternalAlgo;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo();

		/****************** HLRBRep_InternalAlgo ******************/
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
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRBRep_Data>
") DataStructure;
		opencascade::handle<HLRBRep_Data> DataStructure();

		/****************** Debug ******************/
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
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Debug;
		Standard_Boolean Debug();

		/****************** Hide ******************/
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "Hide all the datastructure.

Returns
-------
None
") Hide;
		void Hide();

		/****************** Hide ******************/
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
		%feature("compactdefaultargs") HideAll;
		%feature("autodoc", "Set to hide all the edges.

Returns
-------
None
") HideAll;
		void HideAll();

		/****************** HideAll ******************/
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
		%feature("compactdefaultargs") InitEdgeStatus;
		%feature("autodoc", "Init the status of the selected edges depending of the back faces of a closed shell.

Returns
-------
None
") InitEdgeStatus;
		void InitEdgeStatus();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** PartialHide ******************/
		%feature("compactdefaultargs") PartialHide;
		%feature("autodoc", "Own hiding of all the shapes of the datastructure without hiding by each other.

Returns
-------
None
") PartialHide;
		void PartialHide();

		/****************** Projector ******************/
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
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Set the projector.

Returns
-------
HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector & Projector();

		/****************** Remove ******************/
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
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Select all the datastructure.

Returns
-------
None
") Select;
		void Select();

		/****************** Select ******************/
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
		%feature("compactdefaultargs") SeqOfShapeBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRBRep_SeqOfShapeBounds
") SeqOfShapeBounds;
		HLRBRep_SeqOfShapeBounds & SeqOfShapeBounds();

		/****************** ShapeBounds ******************/
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
		%feature("compactdefaultargs") ShowAll;
		%feature("autodoc", "Set to visible all the edges.

Returns
-------
None
") ShowAll;
		void ShowAll();

		/****************** ShowAll ******************/
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
		%feature("compactdefaultargs") HLRBRep_Intersector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_Intersector;
		 HLRBRep_Intersector();

		/****************** CSPoint ******************/
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
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter();

		/****************** HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ******************/
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
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Save the found extremum.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Initialize ******************/
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
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return the nunber of found extrema.

Returns
-------
int
") NbExt;
		Standard_Integer NbExt();

		/****************** Point ******************/
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
		%feature("compactdefaultargs") SearchOfTolerance;
		%feature("autodoc", "Computes a tol value. if 1st derivative of curve |d1|<tol, it is considered d1=0.

Returns
-------
float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance();

		/****************** SetPoint ******************/
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
		%feature("compactdefaultargs") HLRBRep_PolyAlgo;
		%feature("autodoc", "Constructs an empty framework for the calculation of the visible and hidden lines of a shape in a projection. use the functions: - projector to define the point of view - load to select the shape or shapes to be visualized - update to compute the visible and hidden lines of the shape. warning the shape or shapes to be visualized must have already been triangulated.

Returns
-------
None
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo();

		/****************** HLRBRep_PolyAlgo ******************/
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
		%feature("compactdefaultargs") Algo;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRAlgo_PolyAlgo>
") Algo;
		opencascade::handle<HLRAlgo_PolyAlgo> Algo();

		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Angle ******************/
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
		%feature("compactdefaultargs") Debug;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Debug;
		Standard_Boolean Debug();

		/****************** Debug ******************/
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
		%feature("compactdefaultargs") InitHide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitHide;
		void InitHide();

		/****************** InitShow ******************/
		%feature("compactdefaultargs") InitShow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitShow;
		void InitShow();

		/****************** Load ******************/
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
		%feature("compactdefaultargs") MoreHide;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreHide;
		Standard_Boolean MoreHide();

		/****************** MoreShow ******************/
		%feature("compactdefaultargs") MoreShow;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreShow;
		Standard_Boolean MoreShow();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NextHide ******************/
		%feature("compactdefaultargs") NextHide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextHide;
		void NextHide();

		/****************** NextShow ******************/
		%feature("compactdefaultargs") NextShow;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextShow;
		void NextShow();

		/****************** OutLinedShape ******************/
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
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Sets the parameters of the view for this framework. these parameters are defined by an hlralgo_projector object, which is returned by the projector function on a prs3d_projector object.

Returns
-------
HLRAlgo_Projector
") Projector;
		const HLRAlgo_Projector & Projector();

		/****************** Projector ******************/
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
		%feature("compactdefaultargs") TolAngular;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolAngular;
		Standard_Real TolAngular();

		/****************** TolAngular ******************/
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
		%feature("compactdefaultargs") TolCoef;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolCoef;
		Standard_Real TolCoef();

		/****************** TolCoef ******************/
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
		%feature("compactdefaultargs") HLRBRep_PolyHLRToShape;
		%feature("autodoc", "Constructs a framework for filtering the results of the hlrbrep_algo algorithm, a. use the extraction filters to obtain the results you want for a.

Returns
-------
None
") HLRBRep_PolyHLRToShape;
		 HLRBRep_PolyHLRToShape();

		/****************** HCompound ******************/
		%feature("compactdefaultargs") HCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound();

		/****************** HCompound ******************/
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
		%feature("compactdefaultargs") Hide;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Hide;
		void Hide();

		/****************** OutLineHCompound ******************/
		%feature("compactdefaultargs") OutLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound();

		/****************** OutLineHCompound ******************/
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
		%feature("compactdefaultargs") OutLineVCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound();

		/****************** OutLineVCompound ******************/
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
		%feature("compactdefaultargs") Rg1LineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound();

		/****************** Rg1LineHCompound ******************/
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
		%feature("compactdefaultargs") Rg1LineVCompound;
		%feature("autodoc", "Sets the extraction filter for visible smooth edges.

Returns
-------
TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound();

		/****************** Rg1LineVCompound ******************/
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
		%feature("compactdefaultargs") RgNLineHCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound();

		/****************** RgNLineHCompound ******************/
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
		%feature("compactdefaultargs") RgNLineVCompound;
		%feature("autodoc", "Sets the extraction filter for visible sewn edges.

Returns
-------
TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound();

		/****************** RgNLineVCompound ******************/
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
		%feature("compactdefaultargs") Show;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Show;
		void Show();

		/****************** Update ******************/
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
		%feature("compactdefaultargs") VCompound;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound();

		/****************** VCompound ******************/
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
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "Returns the first u derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1U;
		const gp_Vec D1U();

		/****************** D1V ******************/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "Returns the first v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D1V;
		const gp_Vec D1V();

		/****************** D2U ******************/
		%feature("compactdefaultargs") D2U;
		%feature("autodoc", "Returns the second u derivatives the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2U;
		const gp_Vec D2U();

		/****************** D2V ******************/
		%feature("compactdefaultargs") D2V;
		%feature("autodoc", "Returns the second v derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") D2V;
		const gp_Vec D2V();

		/****************** DUV ******************/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "Returns the second uv cross-derivative. the derivative is computed if it has not been yet.

Returns
-------
gp_Vec
") DUV;
		const gp_Vec DUV();

		/****************** GaussianCurvature ******************/
		%feature("compactdefaultargs") GaussianCurvature;
		%feature("autodoc", "Returns the gaussian curvature.

Returns
-------
float
") GaussianCurvature;
		Standard_Real GaussianCurvature();

		/****************** IsCurvatureDefined ******************/
		%feature("compactdefaultargs") IsCurvatureDefined;
		%feature("autodoc", "Returns true if the curvature is defined.

Returns
-------
bool
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined();

		/****************** IsNormalDefined ******************/
		%feature("compactdefaultargs") IsNormalDefined;
		%feature("autodoc", "Tells if the normal is defined.

Returns
-------
bool
") IsNormalDefined;
		Standard_Boolean IsNormalDefined();

		/****************** IsTangentUDefined ******************/
		%feature("compactdefaultargs") IsTangentUDefined;
		%feature("autodoc", "Returns true if the u tangent is defined. for example, the tangent is not defined if the two first u derivatives are null.

Returns
-------
bool
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined();

		/****************** IsTangentVDefined ******************/
		%feature("compactdefaultargs") IsTangentVDefined;
		%feature("autodoc", "Returns if the v tangent is defined. for example, the tangent is not defined if the two first v derivatives are null.

Returns
-------
bool
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined();

		/****************** IsUmbilic ******************/
		%feature("compactdefaultargs") IsUmbilic;
		%feature("autodoc", "Returns true if the point is umbilic (i.e. if the curvature is constant).

Returns
-------
bool
") IsUmbilic;
		Standard_Boolean IsUmbilic();

		/****************** MaxCurvature ******************/
		%feature("compactdefaultargs") MaxCurvature;
		%feature("autodoc", "Returns the maximum curvature.

Returns
-------
float
") MaxCurvature;
		Standard_Real MaxCurvature();

		/****************** MeanCurvature ******************/
		%feature("compactdefaultargs") MeanCurvature;
		%feature("autodoc", "Returns the mean curvature.

Returns
-------
float
") MeanCurvature;
		Standard_Real MeanCurvature();

		/****************** MinCurvature ******************/
		%feature("compactdefaultargs") MinCurvature;
		%feature("autodoc", "Returns the minimum curvature.

Returns
-------
float
") MinCurvature;
		Standard_Real MinCurvature();

		/****************** Normal ******************/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns the normal direction.

Returns
-------
gp_Dir
") Normal;
		const gp_Dir Normal();

		/****************** SetParameters ******************/
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
		%feature("compactdefaultargs") HLRBRep_ShapeBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds();

		/****************** HLRBRep_ShapeBounds ******************/
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
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_EdgesBlock::MinMaxIndices
") MinMax;
		HLRAlgo_EdgesBlock::MinMaxIndices & MinMax();

		/****************** NbOfIso ******************/
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
		%feature("compactdefaultargs") NbOfIso;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbOfIso;
		Standard_Integer NbOfIso();

		/****************** Shape ******************/
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
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<HLRTopoBRep_OutLiner>
") Shape;
		const opencascade::handle<HLRTopoBRep_OutLiner> & Shape();

		/****************** ShapeData ******************/
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
		%feature("compactdefaultargs") ShapeData;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") ShapeData;
		const opencascade::handle<Standard_Transient> & ShapeData();

		/****************** Sizes ******************/
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
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") AuxillarCurve;
		const gp_Lin AuxillarCurve();

		/****************** AuxillarSurface ******************/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_Address
") AuxillarSurface;
		const Standard_Address & AuxillarSurface();

		/****************** Derivatives ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns 2.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
HLRBRep_TheCSFunctionOfInterCSurf
") Function;
		HLRBRep_TheCSFunctionOfInterCSurf & Function();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** ParameterOnCurve ******************/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****************** ParameterOnSurface ******************/
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
		%feature("compactdefaultargs") HLRBRep_TheIntConicCurveOfCInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter();

		/****************** HLRBRep_TheIntConicCurveOfCInter ******************/
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
		%feature("compactdefaultargs") HLRBRep_TheIntPCurvePCurveOfCInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_TheIntPCurvePCurveOfCInter;
		 HLRBRep_TheIntPCurvePCurveOfCInter();

		/****************** GetMinNbSamples ******************/
		%feature("compactdefaultargs") GetMinNbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetMinNbSamples;
		Standard_Integer GetMinNbSamples();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") HLRBRep_TheInterferenceOfInterCSurf;
		%feature("autodoc", "Constructs an empty interference between polygon and polyhedron.

Returns
-------
None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf();

		/****************** HLRBRep_TheInterferenceOfInterCSurf ******************/
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
		%feature("compactdefaultargs") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter();

		/****************** HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ******************/
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
		%feature("compactdefaultargs") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter();

		/****************** HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the distance is found.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsMin ******************/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "Returns true if the extremum distance is a minimum.

Returns
-------
bool
") IsMin;
		Standard_Boolean IsMin();

		/****************** Perform ******************/
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
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of the extremum distance.

Returns
-------
Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point();

		/****************** SquareDistance ******************/
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
		%feature("compactdefaultargs") AutoIntersectionIsPossible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible();

		/****************** CalculRegion ******************/
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
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the polyline is closed.

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** ComputeWithBox ******************/
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
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** InfParameter ******************/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Segment ******************/
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
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polygon.

Returns
-------
Bnd_Box
") Bounding;
		const Bnd_Box & Bounding();

		/****************** Closed ******************/
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
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** EndOfSeg ******************/
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
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** SetDeflectionOverEstimation ******************/
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Root ******************/
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
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "Returns the transition of the current vertex relative to the boundary if it is an interference.

Returns
-------
TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current vertex.

Returns
-------
HLRAlgo_Intersection
") Current;
		const HLRAlgo_Intersection & Current();

		/****************** IsBoundary ******************/
		%feature("compactdefaultargs") IsBoundary;
		%feature("autodoc", "Returns true if the current vertex is is on the boundary of the edge.

Returns
-------
bool
") IsBoundary;
		Standard_Boolean IsBoundary();

		/****************** IsInterference ******************/
		%feature("compactdefaultargs") IsInterference;
		%feature("autodoc", "Returns true if the current vertex is an interference.

Returns
-------
bool
") IsInterference;
		Standard_Boolean IsInterference();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true when the curve is periodic.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true when there are more vertices.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Proceeds to the next vertex.

Returns
-------
None
") Next;
		void Next();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the current vertex if it is on the boundary of the edge.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Transition ******************/
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
		%feature("compactdefaultargs") HLRBRep_Algo;
		%feature("autodoc", "Constructs an empty framework for the calculation of visible and hidden lines of a shape in a projection. use the function: - projector to define the point of view - add to select the shape or shapes to be visualized - update to compute the outlines of the shape, and - hide to compute the visible and hidden lines of the shape.

Returns
-------
None
") HLRBRep_Algo;
		 HLRBRep_Algo();

		/****************** HLRBRep_Algo ******************/
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
