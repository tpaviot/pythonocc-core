/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") HLRBRep

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include HLRBRep_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(hlrbrep) HLRBRep;
%nodefaultctor HLRBRep;
class HLRBRep {
	public:
		%feature("autodoc", "	:param ec:
	:type ec: HLRBRep_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: TopoDS_Edge
") MakeEdge;
		static TopoDS_Edge MakeEdge (const HLRBRep_Curve & ec,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "	:param ec:
	:type ec: HLRBRep_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: TopoDS_Edge
") MakeEdge3d;
		static TopoDS_Edge MakeEdge3d (const HLRBRep_Curve & ec,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "	:param InAngl:
	:type InAngl: float
	:param OutAngl:
	:type OutAngl: float &
	:param OutDefl:
	:type OutDefl: float &
	:rtype: void
") PolyHLRAngleAndDeflection;
		static void PolyHLRAngleAndDeflection (const Standard_Real InAngl,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") HLRBRep::~HLRBRep %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_AreaLimit;
class HLRBRep_AreaLimit : public MMgt_TShared {
	public:
		%feature("autodoc", "	* The previous and next field are set to NULL.

	:param V:
	:type V: HLRAlgo_Intersection &
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
	:rtype: None
") HLRBRep_AreaLimit;
		 HLRBRep_AreaLimit (const HLRAlgo_Intersection & V,const Standard_Boolean Boundary,const Standard_Boolean Interference,const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_State EdgeBefore,const TopAbs_State EdgeAfter);
		%feature("autodoc", "	:param St:
	:type St: TopAbs_State
	:rtype: None
") StateBefore;
		void StateBefore (const TopAbs_State St);
		%feature("autodoc", "	:param St:
	:type St: TopAbs_State
	:rtype: None
") StateAfter;
		void StateAfter (const TopAbs_State St);
		%feature("autodoc", "	:param St:
	:type St: TopAbs_State
	:rtype: None
") EdgeBefore;
		void EdgeBefore (const TopAbs_State St);
		%feature("autodoc", "	:param St:
	:type St: TopAbs_State
	:rtype: None
") EdgeAfter;
		void EdgeAfter (const TopAbs_State St);
		%feature("autodoc", "	:param P:
	:type P: Handle_HLRBRep_AreaLimit &
	:rtype: None
") Previous;
		void Previous (const Handle_HLRBRep_AreaLimit & P);
		%feature("autodoc", "	:param N:
	:type N: Handle_HLRBRep_AreaLimit &
	:rtype: None
") Next;
		void Next (const Handle_HLRBRep_AreaLimit & N);
		%feature("autodoc", "	:rtype: HLRAlgo_Intersection
") Vertex;
		const HLRAlgo_Intersection & Vertex ();
		%feature("autodoc", "	:rtype: bool
") IsBoundary;
		Standard_Boolean IsBoundary ();
		%feature("autodoc", "	:rtype: bool
") IsInterference;
		Standard_Boolean IsInterference ();
		%feature("autodoc", "	:rtype: TopAbs_State
") StateBefore;
		TopAbs_State StateBefore ();
		%feature("autodoc", "	:rtype: TopAbs_State
") StateAfter;
		TopAbs_State StateAfter ();
		%feature("autodoc", "	:rtype: TopAbs_State
") EdgeBefore;
		TopAbs_State EdgeBefore ();
		%feature("autodoc", "	:rtype: TopAbs_State
") EdgeAfter;
		TopAbs_State EdgeAfter ();
		%feature("autodoc", "	:rtype: Handle_HLRBRep_AreaLimit
") Previous;
		Handle_HLRBRep_AreaLimit Previous ();
		%feature("autodoc", "	:rtype: Handle_HLRBRep_AreaLimit
") Next;
		Handle_HLRBRep_AreaLimit Next ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
};


%feature("shadow") HLRBRep_AreaLimit::~HLRBRep_AreaLimit %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_AreaLimit {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_AreaLimit {
	Handle_HLRBRep_AreaLimit GetHandle() {
	return *(Handle_HLRBRep_AreaLimit*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_AreaLimit;
class Handle_HLRBRep_AreaLimit : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRBRep_AreaLimit();
        Handle_HLRBRep_AreaLimit(const Handle_HLRBRep_AreaLimit &aHandle);
        Handle_HLRBRep_AreaLimit(const HLRBRep_AreaLimit *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_AreaLimit DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_AreaLimit {
    HLRBRep_AreaLimit* GetObject() {
    return (HLRBRep_AreaLimit*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_AreaLimit::~Handle_HLRBRep_AreaLimit %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_AreaLimit {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_Array1OfEData;
class HLRBRep_Array1OfEData {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRBRep_Array1OfEData;
		 HLRBRep_Array1OfEData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: HLRBRep_EdgeData &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRBRep_Array1OfEData;
		 HLRBRep_Array1OfEData (const HLRBRep_EdgeData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: HLRBRep_EdgeData &
	:rtype: None
") Init;
		void Init (const HLRBRep_EdgeData & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_Array1OfEData &
	:rtype: HLRBRep_Array1OfEData
") Assign;
		const HLRBRep_Array1OfEData & Assign (const HLRBRep_Array1OfEData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_Array1OfEData &
	:rtype: HLRBRep_Array1OfEData
") operator=;
		const HLRBRep_Array1OfEData & operator = (const HLRBRep_Array1OfEData & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRBRep_EdgeData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRBRep_EdgeData & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRBRep_EdgeData
") Value;
		const HLRBRep_EdgeData & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRBRep_EdgeData
") ChangeValue;
		HLRBRep_EdgeData & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") HLRBRep_Array1OfEData::~HLRBRep_Array1OfEData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_Array1OfEData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_Array1OfFData;
class HLRBRep_Array1OfFData {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRBRep_Array1OfFData;
		 HLRBRep_Array1OfFData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: HLRBRep_FaceData &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") HLRBRep_Array1OfFData;
		 HLRBRep_Array1OfFData (const HLRBRep_FaceData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: HLRBRep_FaceData &
	:rtype: None
") Init;
		void Init (const HLRBRep_FaceData & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_Array1OfFData &
	:rtype: HLRBRep_Array1OfFData
") Assign;
		const HLRBRep_Array1OfFData & Assign (const HLRBRep_Array1OfFData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_Array1OfFData &
	:rtype: HLRBRep_Array1OfFData
") operator=;
		const HLRBRep_Array1OfFData & operator = (const HLRBRep_Array1OfFData & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: HLRBRep_FaceData &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRBRep_FaceData & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRBRep_FaceData
") Value;
		const HLRBRep_FaceData & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRBRep_FaceData
") ChangeValue;
		HLRBRep_FaceData & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") HLRBRep_Array1OfFData::~HLRBRep_Array1OfFData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_Array1OfFData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_BCurveTool;
class HLRBRep_BCurveTool {
	public:
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>

	:param C:
	:type C: BRepAdaptor_Curve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (BRepAdaptor_Curve & C,const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: BRepAdaptor_Curve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (BRepAdaptor_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: float
") Period;
		static Standard_Real Period (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const BRepAdaptor_Curve & C,const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

	:param C:
	:type C: BRepAdaptor_Curve &
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
	:rtype: void
") D3;
		static void D3 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const BRepAdaptor_Curve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* Returns the parametric resolution corresponding  to the real space resolution <R3d>.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const BRepAdaptor_Curve & C,const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: Handle_Geom_BezierCurve
") Bezier;
		static Handle_Geom_BezierCurve Bezier (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: int
") Degree;
		static Standard_Integer Degree (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param T:
	:type T: TColgp_Array1OfPnt
	:rtype: void
") Poles;
		static void Poles (const BRepAdaptor_Curve & C,TColgp_Array1OfPnt & T);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param T:
	:type T: TColgp_Array1OfPnt
	:param W:
	:type W: TColStd_Array1OfReal &
	:rtype: void
") PolesAndWeights;
		static void PolesAndWeights (const BRepAdaptor_Curve & C,TColgp_Array1OfPnt & T,TColStd_Array1OfReal & W);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const BRepAdaptor_Curve & C,const Standard_Real U0,const Standard_Real U1);
};


%feature("shadow") HLRBRep_BCurveTool::~HLRBRep_BCurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_BCurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_BiPnt2D;
class HLRBRep_BiPnt2D {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D ();
		%feature("autodoc", "	:param x1:
	:type x1: float
	:param y1:
	:type y1: float
	:param x2:
	:type x2: float
	:param y2:
	:type y2: float
	:param S:
	:type S: TopoDS_Shape &
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D (const Standard_Real x1,const Standard_Real y1,const Standard_Real x2,const Standard_Real y2,const TopoDS_Shape & S,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "	:rtype: gp_Pnt2d
") P1;
		const gp_Pnt2d  P1 ();
		%feature("autodoc", "	:rtype: gp_Pnt2d
") P2;
		const gp_Pnt2d  P2 ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Shape;
		void Shape (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: bool
") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") OutLine;
		void OutLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") IntLine;
		Standard_Boolean IntLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") IntLine;
		void IntLine (const Standard_Boolean B);
};


%feature("shadow") HLRBRep_BiPnt2D::~HLRBRep_BiPnt2D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_BiPnt2D {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_BiPoint;
class HLRBRep_BiPoint {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_BiPoint;
		 HLRBRep_BiPoint ();
		%feature("autodoc", "	:param x1:
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
	:type S: TopoDS_Shape &
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") HLRBRep_BiPoint;
		 HLRBRep_BiPoint (const Standard_Real x1,const Standard_Real y1,const Standard_Real z1,const Standard_Real x2,const Standard_Real y2,const Standard_Real z2,const TopoDS_Shape & S,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "	:rtype: gp_Pnt
") P1;
		const gp_Pnt  P1 ();
		%feature("autodoc", "	:rtype: gp_Pnt
") P2;
		const gp_Pnt  P2 ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Shape;
		void Shape (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: bool
") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") OutLine;
		void OutLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") IntLine;
		Standard_Boolean IntLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") IntLine;
		void IntLine (const Standard_Boolean B);
};


%feature("shadow") HLRBRep_BiPoint::~HLRBRep_BiPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_BiPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_CInter;
class HLRBRep_CInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_CInter;
		 HLRBRep_CInter ();
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:param D:
	:type D: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C,const IntRes2d_Domain & D,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param C2:
	:type C2: Standard_Address &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Standard_Address &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param C2:
	:type C2: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param C2:
	:type C2: Standard_Address &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & C1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Standard_Address &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param C2:
	:type C2: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & C1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param TolDomain:
	:type TolDomain: float
	:rtype: IntRes2d_Domain
") ComputeDomain;
		IntRes2d_Domain ComputeDomain (const Standard_Address & C1,const Standard_Real TolDomain);
};


%feature("shadow") HLRBRep_CInter::~HLRBRep_CInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_CInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_CLProps;
class HLRBRep_CLProps {
	public:
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") HLRBRep_CLProps;
		 HLRBRep_CLProps (const Standard_Address & C,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") HLRBRep_CLProps;
		 HLRBRep_CLProps (const Standard_Address & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") HLRBRep_CLProps;
		 HLRBRep_CLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:rtype: None
") SetCurve;
		void SetCurve (const Standard_Address & C);
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") D1;
		const gp_Vec2d  D1 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") D2;
		const gp_Vec2d  D2 ();
		%feature("autodoc", "	:rtype: gp_Vec2d
") D3;
		const gp_Vec2d  D3 ();
		%feature("autodoc", "	:rtype: bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();
		%feature("autodoc", "	:param D:
	:type D: gp_Dir2d
	:rtype: None
") Tangent;
		void Tangent (gp_Dir2d & D);
		%feature("autodoc", "	:rtype: float
") Curvature;
		Standard_Real Curvature ();
		%feature("autodoc", "	:param N:
	:type N: gp_Dir2d
	:rtype: None
") Normal;
		void Normal (gp_Dir2d & N);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt2d & P);
};


%feature("shadow") HLRBRep_CLProps::~HLRBRep_CLProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_CLProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_CLPropsATool;
class HLRBRep_CLPropsATool {
	public:
		%feature("autodoc", "	* Computes the point <P> of parameter <U> on the Curve from HLRBRep <C>.

	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") Value;
		static void Value (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	* Computes the point <P> and first derivative <V1> of parameter <U> on the curve <C>.

	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the curve <C>.

	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: void
") D2;
		static void D2 (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the curve <C>.

	:param A:
	:type A: Standard_Address
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
	:rtype: void
") D3;
		static void D3 (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	* returns the order of continuity of the curve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

	:param A:
	:type A: Standard_Address
	:rtype: int
") Continuity;
		static Standard_Integer Continuity (const Standard_Address A);
		%feature("autodoc", "	* returns the first parameter bound of the curve.

	:param A:
	:type A: Standard_Address
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Standard_Address A);
		%feature("autodoc", "	* returns the last parameter bound of the curve. FirstParameter must be less than LastParamenter.

	:param A:
	:type A: Standard_Address
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Standard_Address A);
};


%feature("shadow") HLRBRep_CLPropsATool::~HLRBRep_CLPropsATool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_CLPropsATool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_Curve;
class HLRBRep_Curve {
	public:
		%feature("autodoc", "	* Creates an undefined Curve.

	:rtype: None
") HLRBRep_Curve;
		 HLRBRep_Curve ();
		%feature("autodoc", "	:param Proj:
	:type Proj: Standard_Address
	:rtype: None
") Projector;
		void Projector (const Standard_Address Proj);
		%feature("autodoc", "	* Returns the 3D curve.

	:rtype: BRepAdaptor_Curve
") Curve;
		BRepAdaptor_Curve & Curve ();
		%feature("autodoc", "	* Sets the 3D curve to be projected.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Curve;
		void Curve (const TopoDS_Edge & E);
		%feature("autodoc", "	* Returns the 3D curve.

	:rtype: BRepAdaptor_Curve
") GetCurve;
		const BRepAdaptor_Curve & GetCurve ();
		%feature("autodoc", "	* Returns the parameter on the 2d curve from the parameter on the 3d curve.

	:param P3d:
	:type P3d: float
	:rtype: float
") Parameter2d;
		Standard_Real Parameter2d (const Standard_Real P3d);
		%feature("autodoc", "	* Returns the parameter on the 3d curve from the parameter on the 2d curve.

	:param P2d:
	:type P2d: float
	:rtype: float
") Parameter3d;
		Standard_Real Parameter3d (const Standard_Real P2d);
		%feature("autodoc", "	* Update the minmax and the internal data

	:param TotMin:
	:type TotMin: Standard_Address
	:param TotMax:
	:type TotMax: Standard_Address
	:rtype: float
") Update;
		Standard_Real Update (const Standard_Address TotMin,const Standard_Address TotMax);
		%feature("autodoc", "	* Update the minmax returns tol for enlarge;

	:param TotMin:
	:type TotMin: Standard_Address
	:param TotMax:
	:type TotMax: Standard_Address
	:rtype: float
") UpdateMinMax;
		Standard_Real UpdateMinMax (const Standard_Address TotMin,const Standard_Address TotMax);
		%feature("autodoc", "	* Computes the Z coordinate of the point of parameter U on the curve in the viewing coordinate system

	:param U:
	:type U: float
	:rtype: float
") Z;
		Standard_Real Z (const Standard_Real U);
		%feature("autodoc", "	* Computes the 3D point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value3D;
		gp_Pnt Value3D (const Standard_Real U);
		%feature("autodoc", "	* Computes the 3D point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	* Depending on <AtStart> computes the 2D point and tangent on the curve at sart (or at end). If the first derivative is null look after at start (or before at end) with the second derivative.

	:param AtStart:
	:type AtStart: bool
	:param P:
	:type P: gp_Pnt2d
	:param D:
	:type D: gp_Dir2d
	:rtype: None
") Tangent;
		void Tangent (const Standard_Boolean AtStart,gp_Pnt2d & P,gp_Dir2d & D);
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	* Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* Returns the parametric resolution corresponding  to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "	:rtype: gp_Lin2d
") Line;
		gp_Lin2d Line ();
		%feature("autodoc", "	:rtype: gp_Circ2d
") Circle;
		gp_Circ2d Circle ();
		%feature("autodoc", "	:rtype: gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse ();
		%feature("autodoc", "	:rtype: gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola ();
		%feature("autodoc", "	:rtype: gp_Parab2d
") Parabola;
		gp_Parab2d Parabola ();
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "	:param TP:
	:type TP: TColgp_Array1OfPnt2d
	:rtype: None
") Poles;
		void Poles (TColgp_Array1OfPnt2d & TP);
		%feature("autodoc", "	:param aCurve:
	:type aCurve: Handle_Geom_BSplineCurve &
	:param TP:
	:type TP: TColgp_Array1OfPnt2d
	:rtype: None
") Poles;
		void Poles (const Handle_Geom_BSplineCurve & aCurve,TColgp_Array1OfPnt2d & TP);
		%feature("autodoc", "	:param TP:
	:type TP: TColgp_Array1OfPnt2d
	:param TW:
	:type TW: TColStd_Array1OfReal &
	:rtype: None
") PolesAndWeights;
		void PolesAndWeights (TColgp_Array1OfPnt2d & TP,TColStd_Array1OfReal & TW);
		%feature("autodoc", "	:param aCurve:
	:type aCurve: Handle_Geom_BSplineCurve &
	:param TP:
	:type TP: TColgp_Array1OfPnt2d
	:param TW:
	:type TW: TColStd_Array1OfReal &
	:rtype: None
") PolesAndWeights;
		void PolesAndWeights (const Handle_Geom_BSplineCurve & aCurve,TColgp_Array1OfPnt2d & TP,TColStd_Array1OfReal & TW);
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "	:param kn:
	:type kn: TColStd_Array1OfReal &
	:rtype: None
") Knots;
		void Knots (TColStd_Array1OfReal & kn);
		%feature("autodoc", "	:param mu:
	:type mu: TColStd_Array1OfInteger &
	:rtype: None
") Multiplicities;
		void Multiplicities (TColStd_Array1OfInteger & mu);
};


%feature("shadow") HLRBRep_Curve::~HLRBRep_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_CurveTool;
class HLRBRep_CurveTool {
	public:
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Standard_Address C);
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>

	:param C:
	:type C: Standard_Address
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Standard_Address C);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: Standard_Address
	:param T:
	:type T: TColStd_Array1OfReal &
	:rtype: void
") Intervals;
		static void Intervals (const Standard_Address C,TColStd_Array1OfReal & T);
		%feature("autodoc", "	* output the bounds of interval of index <Index> used if Type == Composite.

	:param C:
	:type C: Standard_Address
	:param Index:
	:type Index: Standard_Integer
	:param Tab:
	:type Tab: TColStd_Array1OfReal &
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: void
") GetInterval;
		static void GetInterval (const Standard_Address C,const Standard_Integer Index,const TColStd_Array1OfReal & Tab,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") Period;
		static Standard_Real Period (const Standard_Address C);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Standard_Address C,const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

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
	:rtype: void
") D2;
		static void D2 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
	:rtype: void
") D3;
		static void D3 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param C:
	:type C: Standard_Address
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Standard_Address C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* Returns the parametric resolution corresponding  to the real space resolution <R3d>.

	:param C:
	:type C: Standard_Address
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Standard_Address C,const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: Standard_Address
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Standard_Address C);
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: Standard_Address
	:rtype: GeomAbs_CurveType
") TheType;
		static GeomAbs_CurveType TheType (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: float
") EpsX;
		static Standard_Real EpsX (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Standard_Address C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Standard_Address C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address
	:rtype: int
") Degree;
		static Standard_Integer Degree (const Standard_Address C);
};


%feature("shadow") HLRBRep_CurveTool::~HLRBRep_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_Data;
class HLRBRep_Data : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Create an empty data structure of <NV> vertices, <NE> edges and <NF> faces.

	:param NV:
	:type NV: Standard_Integer
	:param NE:
	:type NE: Standard_Integer
	:param NF:
	:type NF: Standard_Integer
	:rtype: None
") HLRBRep_Data;
		 HLRBRep_Data (const Standard_Integer NV,const Standard_Integer NE,const Standard_Integer NF);
		%feature("autodoc", "	* Write <DS> in me with a translation of <dv>,<de>,<df>.

	:param DS:
	:type DS: Handle_HLRBRep_Data &
	:param dv:
	:type dv: Standard_Integer
	:param de:
	:type de: Standard_Integer
	:param df:
	:type df: Standard_Integer
	:rtype: None
") Write;
		void Write (const Handle_HLRBRep_Data & DS,const Standard_Integer dv,const Standard_Integer de,const Standard_Integer df);
		%feature("autodoc", "	:rtype: HLRBRep_Array1OfEData
") EDataArray;
		HLRBRep_Array1OfEData & EDataArray ();
		%feature("autodoc", "	:rtype: HLRBRep_Array1OfFData
") FDataArray;
		HLRBRep_Array1OfFData & FDataArray ();
		%feature("autodoc", "	* Set the tolerance for the rejections during the exploration

	:param tol:
	:type tol: Standard_ShortReal
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_ShortReal tol);
		%feature("autodoc", "	* returns the tolerance for the rejections during the exploration

	:rtype: Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance ();
		%feature("autodoc", "	* end of building of the Data and updating all the informations linked to the projection.

	:param P:
	:type P: HLRAlgo_Projector &
	:rtype: None
") Update;
		void Update (const HLRAlgo_Projector & P);
		%feature("autodoc", "	:rtype: HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector & Projector ();
		%feature("autodoc", "	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "	:rtype: int
") NbFaces;
		Standard_Integer NbFaces ();
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") EdgeMap;
		TopTools_IndexedMapOfShape & EdgeMap ();
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") FaceMap;
		TopTools_IndexedMapOfShape & FaceMap ();
		%feature("autodoc", "	* to compare with only non rejected edges.

	:param MinMaxTot:
	:type MinMaxTot: Standard_Address
	:param e1:
	:type e1: Standard_Integer
	:param e2:
	:type e2: Standard_Integer
	:rtype: None
") InitBoundSort;
		void InitBoundSort (const Standard_Address MinMaxTot,const Standard_Integer e1,const Standard_Integer e2);
		%feature("autodoc", "	* Begin an iteration only on visible Edges crossing the face number <FI>.

	:param FI:
	:type FI: Standard_Integer
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool &
	:rtype: None
") InitEdge;
		void InitEdge (const Standard_Integer FI,BRepTopAdaptor_MapOfShapeTool & MST);
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "	:param skip: default value is Standard_True
	:type skip: bool
	:rtype: None
") NextEdge;
		void NextEdge (const Standard_Boolean skip = Standard_True);
		%feature("autodoc", "	* Returns the current Edge

	:rtype: int
") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "	* Returns true if the current edge to be hidden belongs to the hiding face.

	:rtype: bool
") HidingTheFace;
		Standard_Boolean HidingTheFace ();
		%feature("autodoc", "	* Returns true if the current hiding face is not an auto-intersected one.

	:rtype: bool
") SimpleHidingFace;
		Standard_Boolean SimpleHidingFace ();
		%feature("autodoc", "	* Intersect the current Edge with the boundary of the hiding face. The interferences are given by the More, Next, and Value methods.

	:rtype: None
") InitInterference;
		void InitInterference ();
		%feature("autodoc", "	:rtype: bool
") MoreInterference;
		Standard_Boolean MoreInterference ();
		%feature("autodoc", "	:rtype: None
") NextInterference;
		void NextInterference ();
		%feature("autodoc", "	* Returns True if the interference is rejected.

	:rtype: bool
") RejectedInterference;
		Standard_Boolean RejectedInterference ();
		%feature("autodoc", "	* Returns True if the rejected interference is above the face.

	:rtype: bool
") AboveInterference;
		Standard_Boolean AboveInterference ();
		%feature("autodoc", "	:rtype: HLRAlgo_Interference
") Interference;
		HLRAlgo_Interference & Interference ();
		%feature("autodoc", "	* Returns the local description of the projection of the current LEdge at parameter <Param>.

	:param Param:
	:type Param: float
	:param Tg:
	:type Tg: gp_Dir2d
	:param Nm:
	:type Nm: gp_Dir2d
	:param Cu:
	:type Cu: float &
	:rtype: None
") LocalLEGeometry2D;
		void LocalLEGeometry2D (const Standard_Real Param,gp_Dir2d & Tg,gp_Dir2d & Nm,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the local description of the projection of the current FEdge at parameter <Param>.

	:param FE:
	:type FE: Standard_Integer
	:param Param:
	:type Param: float
	:param Tg:
	:type Tg: gp_Dir2d
	:param Nm:
	:type Nm: gp_Dir2d
	:param Cu:
	:type Cu: float &
	:rtype: None
") LocalFEGeometry2D;
		void LocalFEGeometry2D (const Standard_Integer FE,const Standard_Real Param,gp_Dir2d & Tg,gp_Dir2d & Nm,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the local 3D state of the intersection between the current edge and the current face at the <p1> and <p2> parameters.

	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:param stbef:
	:type stbef: TopAbs_State &
	:param staf:
	:type staf: TopAbs_State &
	:rtype: None
") EdgeState;
		void EdgeState (const Standard_Real p1,const Standard_Real p2,TopAbs_State & stbef,TopAbs_State & staf);
		%feature("autodoc", "	* Returns the true if the Edge <EData> belongs to the Hiding Face.

	:param E:
	:type E: Standard_Integer
	:param EData:
	:type EData: HLRBRep_EdgeData &
	:rtype: bool
") EdgeOfTheHidingFace;
		Standard_Boolean EdgeOfTheHidingFace (const Standard_Integer E,const HLRBRep_EdgeData & EData);
		%feature("autodoc", "	* Returns the number of levels of hiding face above the first point of the edge <EData>. The InterferenceList is given to compute far away of the Interferences and then come back.

	:param E:
	:type E: Standard_Integer
	:param EData:
	:type EData: HLRBRep_EdgeData &
	:param IL:
	:type IL: HLRAlgo_InterferenceList &
	:rtype: int
") HidingStartLevel;
		Standard_Integer HidingStartLevel (const Standard_Integer E,const HLRBRep_EdgeData & EData,const HLRAlgo_InterferenceList & IL);
		%feature("autodoc", "	* Returns the state of the Edge <EData> after classification.

	:param E:
	:type E: Standard_Integer
	:param EData:
	:type EData: HLRBRep_EdgeData &
	:rtype: TopAbs_State
") Compare;
		TopAbs_State Compare (const Standard_Integer E,const HLRBRep_EdgeData & EData);
		%feature("autodoc", "	* Simple classification of part of edge [p1, p2] returns OUT if at least 1 of Nbp points of edge is out othewise returns IN It is used to check 'suspision' hided part of edge.

	:param E:
	:type E: Standard_Integer
	:param EData:
	:type EData: HLRBRep_EdgeData &
	:param Nbp:
	:type Nbp: Standard_Integer
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: TopAbs_State
") SimplClassify;
		TopAbs_State SimplClassify (const Standard_Integer E,const HLRBRep_EdgeData & EData,const Standard_Integer Nbp,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "	* Classification of an edge.

	:param E:
	:type E: Standard_Integer
	:param EData:
	:type EData: HLRBRep_EdgeData &
	:param LevelFlag:
	:type LevelFlag: bool
	:param Level:
	:type Level: Standard_Integer &
	:param param:
	:type param: float
	:rtype: TopAbs_State
") Classify;
		TopAbs_State Classify (const Standard_Integer E,const HLRBRep_EdgeData & EData,const Standard_Boolean LevelFlag,Standard_Integer &OutValue,const Standard_Real param);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%feature("shadow") HLRBRep_Data::~HLRBRep_Data %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_Data {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_Data {
	Handle_HLRBRep_Data GetHandle() {
	return *(Handle_HLRBRep_Data*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_Data;
class Handle_HLRBRep_Data : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRBRep_Data();
        Handle_HLRBRep_Data(const Handle_HLRBRep_Data &aHandle);
        Handle_HLRBRep_Data(const HLRBRep_Data *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_Data DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_Data {
    HLRBRep_Data* GetObject() {
    return (HLRBRep_Data*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_Data::~Handle_HLRBRep_Data %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_Data {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_EdgeBuilder;
class HLRBRep_EdgeBuilder {
	public:
		%feature("autodoc", "	* Creates an EdgeBuilder algorithm. <VList> describes the edge and the interferences. AreaLimits are created from the vertices. Builds(IN) is automatically called.

	:param VList:
	:type VList: HLRBRep_VertexList &
	:rtype: None
") HLRBRep_EdgeBuilder;
		 HLRBRep_EdgeBuilder (HLRBRep_VertexList & VList);
		%feature("autodoc", "	* Initialize an iteration on the areas.

	:rtype: None
") InitAreas;
		void InitAreas ();
		%feature("autodoc", "	* Set the current area to the next area.

	:rtype: None
") NextArea;
		void NextArea ();
		%feature("autodoc", "	* Set the current area to the previous area.

	:rtype: None
") PreviousArea;
		void PreviousArea ();
		%feature("autodoc", "	* Returns True if there is a current area.

	:rtype: bool
") HasArea;
		Standard_Boolean HasArea ();
		%feature("autodoc", "	* Returns the state of the current area.

	:rtype: TopAbs_State
") AreaState;
		TopAbs_State AreaState ();
		%feature("autodoc", "	* Returns the edge state of the current area.

	:rtype: TopAbs_State
") AreaEdgeState;
		TopAbs_State AreaEdgeState ();
		%feature("autodoc", "	* Returns the AreaLimit beginning the current area. This is a NULL handle when the area is infinite on the left.

	:rtype: Handle_HLRBRep_AreaLimit
") LeftLimit;
		Handle_HLRBRep_AreaLimit LeftLimit ();
		%feature("autodoc", "	* Returns the AreaLimit ending the current area. This is a NULL handle when the area is infinite on the right.

	:rtype: Handle_HLRBRep_AreaLimit
") RightLimit;
		Handle_HLRBRep_AreaLimit RightLimit ();
		%feature("autodoc", "	* Reinitialize the results iteration to the parts with State <ToBuild>. If this method is not called after construction the default is <ToBuild> = IN.

	:param ToBuild:
	:type ToBuild: TopAbs_State
	:rtype: None
") Builds;
		void Builds (const TopAbs_State ToBuild);
		%feature("autodoc", "	* Returns True if there are more new edges to build.

	:rtype: bool
") MoreEdges;
		Standard_Boolean MoreEdges ();
		%feature("autodoc", "	* Proceeds to the next edge to build. Skip all remaining vertices on the current edge.

	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("autodoc", "	* True if there are more vertices in the current new edge.

	:rtype: bool
") MoreVertices;
		Standard_Boolean MoreVertices ();
		%feature("autodoc", "	* Proceeds to the next vertex of the current edge.

	:rtype: None
") NextVertex;
		void NextVertex ();
		%feature("autodoc", "	* Returns the current vertex of the current edge.

	:rtype: HLRAlgo_Intersection
") Current;
		const HLRAlgo_Intersection & Current ();
		%feature("autodoc", "	* Returns True if the current vertex comes from the boundary of the edge.

	:rtype: bool
") IsBoundary;
		Standard_Boolean IsBoundary ();
		%feature("autodoc", "	* Returns True if the current vertex was an interference.

	:rtype: bool
") IsInterference;
		Standard_Boolean IsInterference ();
		%feature("autodoc", "	* Returns the new orientation of the current vertex.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%feature("shadow") HLRBRep_EdgeBuilder::~HLRBRep_EdgeBuilder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_EdgeBuilder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_EdgeData;
class HLRBRep_EdgeData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_EdgeData;
		 HLRBRep_EdgeData ();
		%feature("autodoc", "	:param Reg1:
	:type Reg1: bool
	:param RegN:
	:type RegN: bool
	:param EG:
	:type EG: TopoDS_Edge &
	:param V1:
	:type V1: Standard_Integer
	:param V2:
	:type V2: Standard_Integer
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
	:rtype: None
") Set;
		void Set (const Standard_Boolean Reg1,const Standard_Boolean RegN,const TopoDS_Edge & EG,const Standard_Integer V1,const Standard_Integer V2,const Standard_Boolean Out1,const Standard_Boolean Out2,const Standard_Boolean Cut1,const Standard_Boolean Cut2,const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "	:rtype: bool
") Selected;
		Standard_Boolean Selected ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Selected;
		void Selected (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Vertical;
		Standard_Boolean Vertical ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Vertical;
		void Vertical (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Simple;
		Standard_Boolean Simple ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Simple;
		void Simple (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") OutLVSta;
		Standard_Boolean OutLVSta ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") OutLVSta;
		void OutLVSta (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") OutLVEnd;
		Standard_Boolean OutLVEnd ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") OutLVEnd;
		void OutLVEnd (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") CutAtSta;
		Standard_Boolean CutAtSta ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") CutAtSta;
		void CutAtSta (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") CutAtEnd;
		Standard_Boolean CutAtEnd ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") CutAtEnd;
		void CutAtEnd (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") VerAtSta;
		Standard_Boolean VerAtSta ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") VerAtSta;
		void VerAtSta (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") VerAtEnd;
		Standard_Boolean VerAtEnd ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") VerAtEnd;
		void VerAtEnd (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") AutoIntersectionDone;
		Standard_Boolean AutoIntersectionDone ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") AutoIntersectionDone;
		void AutoIntersectionDone (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Used;
		Standard_Boolean Used ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Used;
		void Used (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: int
") HideCount;
		Standard_Integer HideCount ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") HideCount;
		void HideCount (const Standard_Integer I);
		%feature("autodoc", "	:rtype: int
") VSta;
		Standard_Integer VSta ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") VSta;
		void VSta (const Standard_Integer I);
		%feature("autodoc", "	:rtype: int
") VEnd;
		Standard_Integer VEnd ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: None
") VEnd;
		void VEnd (const Standard_Integer I);
		%feature("autodoc", "	:param TotMinMax:
	:type TotMinMax: Standard_Address
	:rtype: None
") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "	:rtype: Standard_Address
") MinMax;
		Standard_Address MinMax ();
		%feature("autodoc", "	:rtype: HLRAlgo_EdgeStatus
") Status;
		HLRAlgo_EdgeStatus & Status ();
		%feature("autodoc", "	:rtype: HLRBRep_Curve
") ChangeGeometry;
		HLRBRep_Curve & ChangeGeometry ();
		%feature("autodoc", "	:rtype: HLRBRep_Curve
") Geometry;
		const HLRBRep_Curve & Geometry ();
		%feature("autodoc", "	:rtype: Standard_Address
") Curve;
		Standard_Address Curve ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance ();
};


%feature("shadow") HLRBRep_EdgeData::~HLRBRep_EdgeData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_EdgeData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_EdgeFaceTool;
class HLRBRep_EdgeFaceTool {
	public:
		%feature("autodoc", "	:param F:
	:type F: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Tg:
	:type Tg: gp_Dir
	:rtype: float
") CurvatureValue;
		static Standard_Real CurvatureValue (const Standard_Address F,const Standard_Real U,const Standard_Real V,const gp_Dir & Tg);
		%feature("autodoc", "	* return True if U and V are found.

	:param Par:
	:type Par: float
	:param E:
	:type E: Standard_Address
	:param F:
	:type F: Standard_Address
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: bool
") UVPoint;
		static Standard_Boolean UVPoint (const Standard_Real Par,const Standard_Address E,const Standard_Address F,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") HLRBRep_EdgeFaceTool::~HLRBRep_EdgeFaceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_EdgeFaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_EdgeIList;
class HLRBRep_EdgeIList {
	public:
		%feature("autodoc", "	* Add the interference <I> to the list <IL>.

	:param IL:
	:type IL: HLRAlgo_InterferenceList &
	:param I:
	:type I: HLRAlgo_Interference &
	:param T:
	:type T: HLRBRep_EdgeInterferenceTool &
	:rtype: void
") AddInterference;
		static void AddInterference (HLRAlgo_InterferenceList & IL,const HLRAlgo_Interference & I,const HLRBRep_EdgeInterferenceTool & T);
		%feature("autodoc", "	* Process complex transitions on the list IL.

	:param IL:
	:type IL: HLRAlgo_InterferenceList &
	:param T:
	:type T: HLRBRep_EdgeInterferenceTool &
	:rtype: void
") ProcessComplex;
		static void ProcessComplex (HLRAlgo_InterferenceList & IL,const HLRBRep_EdgeInterferenceTool & T);
};


%feature("shadow") HLRBRep_EdgeIList::~HLRBRep_EdgeIList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_EdgeIList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_EdgeInterferenceTool;
class HLRBRep_EdgeInterferenceTool {
	public:
		%feature("autodoc", "	:param DS:
	:type DS: Handle_HLRBRep_Data &
	:rtype: None
") HLRBRep_EdgeInterferenceTool;
		 HLRBRep_EdgeInterferenceTool (const Handle_HLRBRep_Data & DS);
		%feature("autodoc", "	:rtype: None
") LoadEdge;
		void LoadEdge ();
		%feature("autodoc", "	:rtype: None
") InitVertices;
		void InitVertices ();
		%feature("autodoc", "	:rtype: bool
") MoreVertices;
		Standard_Boolean MoreVertices ();
		%feature("autodoc", "	:rtype: None
") NextVertex;
		void NextVertex ();
		%feature("autodoc", "	:rtype: HLRAlgo_Intersection
") CurrentVertex;
		const HLRAlgo_Intersection & CurrentVertex ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") CurrentOrientation;
		TopAbs_Orientation CurrentOrientation ();
		%feature("autodoc", "	:rtype: float
") CurrentParameter;
		Standard_Real CurrentParameter ();
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	* Returns local geometric description of the Edge at parameter <Para>. See method Reset of class EdgeFaceTransition from TopCnx for other arguments.

	:param Param:
	:type Param: float
	:param Tgt:
	:type Tgt: gp_Dir
	:param Nrm:
	:type Nrm: gp_Dir
	:param Curv:
	:type Curv: float &
	:rtype: None
") EdgeGeometry;
		void EdgeGeometry (const Standard_Real Param,gp_Dir & Tgt,gp_Dir & Nrm,Standard_Real &OutValue);
		%feature("autodoc", "	:param I:
	:type I: HLRAlgo_Interference &
	:rtype: float
") ParameterOfInterference;
		Standard_Real ParameterOfInterference (const HLRAlgo_Interference & I);
		%feature("autodoc", "	* True if the two interferences are on the same geometric locus.

	:param I1:
	:type I1: HLRAlgo_Interference &
	:param I2:
	:type I2: HLRAlgo_Interference &
	:rtype: bool
") SameInterferences;
		Standard_Boolean SameInterferences (const HLRAlgo_Interference & I1,const HLRAlgo_Interference & I2);
		%feature("autodoc", "	* True if the Interference and the current Vertex are on the same geometric locus.

	:param I:
	:type I: HLRAlgo_Interference &
	:rtype: bool
") SameVertexAndInterference;
		Standard_Boolean SameVertexAndInterference (const HLRAlgo_Interference & I);
		%feature("autodoc", "	* Returns the geometry of the boundary at the interference <I>. See the AddInterference method of the class EdgeFaceTransition from TopCnx for the other arguments.

	:param I:
	:type I: HLRAlgo_Interference &
	:param Tang:
	:type Tang: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float &
	:rtype: None
") InterferenceBoundaryGeometry;
		void InterferenceBoundaryGeometry (const HLRAlgo_Interference & I,gp_Dir & Tang,gp_Dir & Norm,Standard_Real &OutValue);
};


%feature("shadow") HLRBRep_EdgeInterferenceTool::~HLRBRep_EdgeInterferenceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_EdgeInterferenceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
class HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter {
	public:
		%feature("autodoc", "	:param C1:
	:type C1: Standard_Address &
	:param C2:
	:type C2: Standard_Address &
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real Tol);
		%feature("autodoc", "	:param Poly1:
	:type Poly1: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter &
	:param Poly2:
	:type Poly2: HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter &
	:param NumSegOn1:
	:type NumSegOn1: Standard_Integer &
	:param NumSegOn2:
	:type NumSegOn2: Standard_Integer &
	:param ParamOnSeg1:
	:type ParamOnSeg1: float &
	:param ParamOnSeg2:
	:type ParamOnSeg2: float &
	:rtype: None
") Perform;
		void Perform (const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly1,const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Uo:
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
	:rtype: None
") Perform;
		void Perform (const Standard_Real Uo,const Standard_Real Vo,const Standard_Real UInf,const Standard_Real VInf,const Standard_Real USup,const Standard_Real VSup);
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") Roots;
		void Roots (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: bool
") AnErrorOccurred;
		Standard_Boolean AnErrorOccurred ();
};


%feature("shadow") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter::~HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_FaceData;
class HLRBRep_FaceData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_FaceData;
		 HLRBRep_FaceData ();
		%feature("autodoc", "	* <Or> is the orientation of the face. <Cl> is true if the face belongs to a closed volume. <NW> is the number of wires ( or block of edges ) of the face.

	:param FG:
	:type FG: TopoDS_Face &
	:param Or:
	:type Or: TopAbs_Orientation
	:param Cl:
	:type Cl: bool
	:param NW:
	:type NW: Standard_Integer
	:rtype: None
") Set;
		void Set (const TopoDS_Face & FG,const TopAbs_Orientation Or,const Standard_Boolean Cl,const Standard_Integer NW);
		%feature("autodoc", "	* Set <NE> the number of edges of the wire number <WI>.

	:param WI:
	:type WI: Standard_Integer
	:param NE:
	:type NE: Standard_Integer
	:rtype: None
") SetWire;
		void SetWire (const Standard_Integer WI,const Standard_Integer NE);
		%feature("autodoc", "	* Set the edge number <EWI> of the wire <WI>.

	:param WI:
	:type WI: Standard_Integer
	:param EWI:
	:type EWI: Standard_Integer
	:param EI:
	:type EI: Standard_Integer
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
	:rtype: None
") SetWEdge;
		void SetWEdge (const Standard_Integer WI,const Standard_Integer EWI,const Standard_Integer EI,const TopAbs_Orientation Or,const Standard_Boolean OutL,const Standard_Boolean Inte,const Standard_Boolean Dble,const Standard_Boolean IsoL);
		%feature("autodoc", "	:rtype: bool
") Selected;
		Standard_Boolean Selected ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Selected;
		void Selected (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Back;
		Standard_Boolean Back ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Back;
		void Back (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Side;
		Standard_Boolean Side ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Side;
		void Side (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Hiding;
		Standard_Boolean Hiding ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Hiding;
		void Hiding (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Simple;
		Standard_Boolean Simple ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Simple;
		void Simple (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Cut;
		Standard_Boolean Cut ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Cut;
		void Cut (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") WithOutL;
		Standard_Boolean WithOutL ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") WithOutL;
		void WithOutL (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Plane;
		Standard_Boolean Plane ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Plane;
		void Plane (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Cylinder;
		Standard_Boolean Cylinder ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Cylinder;
		void Cylinder (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Cone;
		Standard_Boolean Cone ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Cone;
		void Cone (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Sphere;
		Standard_Boolean Sphere ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Sphere;
		void Sphere (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: bool
") Torus;
		Standard_Boolean Torus ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Torus;
		void Torus (const Standard_Boolean B);
		%feature("autodoc", "	:rtype: float
") Size;
		Standard_Real Size ();
		%feature("autodoc", "	:param S:
	:type S: float
	:rtype: None
") Size;
		void Size (const Standard_Real S);
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("autodoc", "	:rtype: Handle_HLRAlgo_WiresBlock
") Wires;
		Handle_HLRAlgo_WiresBlock & Wires ();
		%feature("autodoc", "	:rtype: HLRBRep_Surface
") Geometry;
		HLRBRep_Surface & Geometry ();
		%feature("autodoc", "	:rtype: Standard_ShortReal
") Tolerance;
		Standard_ShortReal Tolerance ();
};


%feature("shadow") HLRBRep_FaceData::~HLRBRep_FaceData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_FaceData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_FaceIterator;
class HLRBRep_FaceIterator {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_FaceIterator;
		 HLRBRep_FaceIterator ();
		%feature("autodoc", "	* Begin an exploration of the edges of the face <fd>

	:param fd:
	:type fd: HLRBRep_FaceData &
	:rtype: None
") InitEdge;
		void InitEdge (HLRBRep_FaceData & fd);
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("autodoc", "	* Returns True if the current edge is the first of a wire.

	:rtype: bool
") BeginningOfWire;
		Standard_Boolean BeginningOfWire ();
		%feature("autodoc", "	* Returns True if the current edge is the last of a wire.

	:rtype: bool
") EndOfWire;
		Standard_Boolean EndOfWire ();
		%feature("autodoc", "	* Skip the current wire in the exploration.

	:rtype: None
") SkipWire;
		void SkipWire ();
		%feature("autodoc", "	* Returns the edges of the current wire.

	:rtype: Handle_HLRAlgo_EdgesBlock
") Wire;
		Handle_HLRAlgo_EdgesBlock Wire ();
		%feature("autodoc", "	:rtype: int
") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	:rtype: bool
") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "	:rtype: bool
") Internal;
		Standard_Boolean Internal ();
		%feature("autodoc", "	:rtype: bool
") Double;
		Standard_Boolean Double ();
		%feature("autodoc", "	:rtype: bool
") IsoLine;
		Standard_Boolean IsoLine ();
};


%feature("shadow") HLRBRep_FaceIterator::~HLRBRep_FaceIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_FaceIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_HLRToShape;
class HLRBRep_HLRToShape {
	public:
		%feature("autodoc", "	* Constructs a framework for filtering the results of the HLRBRep_Algo algorithm, A. Use the extraction filters to obtain the results you want for A.

	:param A:
	:type A: Handle_HLRBRep_Algo &
	:rtype: None
") HLRBRep_HLRToShape;
		 HLRBRep_HLRToShape (const Handle_HLRBRep_Algo & A);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OutLineVCompound3d;
		TopoDS_Shape OutLineVCompound3d ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound (const TopoDS_Shape & S);
};


%feature("shadow") HLRBRep_HLRToShape::~HLRBRep_HLRToShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_HLRToShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_Hider;
class HLRBRep_Hider {
	public:
		%feature("autodoc", "	* Creates a Hider processing the set of Edges and hiding faces described by <DS>. Stores the hidden parts in <DS>.

	:param DS:
	:type DS: Handle_HLRBRep_Data &
	:rtype: None
") HLRBRep_Hider;
		 HLRBRep_Hider (const Handle_HLRBRep_Data & DS);
		%feature("autodoc", "	* own hiding the side face number <FI>.

	:param FI:
	:type FI: Standard_Integer
	:rtype: None
") OwnHiding;
		void OwnHiding (const Standard_Integer FI);
		%feature("autodoc", "	* Removes from the edges, the parts hidden by the hiding face number <FI>.

	:param FI:
	:type FI: Standard_Integer
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool &
	:rtype: None
") Hide;
		void Hide (const Standard_Integer FI,BRepTopAdaptor_MapOfShapeTool & MST);
};


%feature("shadow") HLRBRep_Hider::~HLRBRep_Hider %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_Hider {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_IntConicCurveOfCInter;
class HLRBRep_IntConicCurveOfCInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
};


%feature("shadow") HLRBRep_IntConicCurveOfCInter::~HLRBRep_IntConicCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_IntConicCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_InterCSurf;
class HLRBRep_InterCSurf : public IntCurveSurface_Intersection {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_InterCSurf;
		 HLRBRep_InterCSurf ();
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param Surface:
	:type Surface: Standard_Address &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & Curve,const Standard_Address & Surface);
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param Polygon:
	:type Polygon: HLRBRep_ThePolygonOfInterCSurf &
	:param Surface:
	:type Surface: Standard_Address &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & Polygon,const Standard_Address & Surface);
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param ThePolygon:
	:type ThePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:param Surface:
	:type Surface: Standard_Address &
	:param Polyhedron:
	:type Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & ThePolygon,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param ThePolygon:
	:type ThePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:param Surface:
	:type Surface: Standard_Address &
	:param Polyhedron:
	:type Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf &
	:param BndBSB:
	:type BndBSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & ThePolygon,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron,Bnd_BoundSortBox & BndBSB);
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param Surface:
	:type Surface: Standard_Address &
	:param Polyhedron:
	:type Polyhedron: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & Curve,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);
};


%feature("shadow") HLRBRep_InterCSurf::~HLRBRep_InterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_InterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_InternalAlgo;
class HLRBRep_InternalAlgo : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo ();
		%feature("autodoc", "	:param A:
	:type A: Handle_HLRBRep_InternalAlgo &
	:rtype: None
") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo (const Handle_HLRBRep_InternalAlgo & A);
		%feature("autodoc", "	* set the projector.

	:param P:
	:type P: HLRAlgo_Projector &
	:rtype: None
") Projector;
		void Projector (const HLRAlgo_Projector & P);
		%feature("autodoc", "	* set the projector.

	:rtype: HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector & Projector ();
		%feature("autodoc", "	* update the DataStructure.

	:rtype: None
") Update;
		void Update ();
		%feature("autodoc", "	* add the shape <S>.

	:param S:
	:type S: Handle_HLRTopoBRep_OutLiner &
	:param SData:
	:type SData: Handle_MMgt_TShared &
	:param nbIso: default value is 0
	:type nbIso: Standard_Integer
	:rtype: None
") Load;
		void Load (const Handle_HLRTopoBRep_OutLiner & S,const Handle_MMgt_TShared & SData,const Standard_Integer nbIso = 0);
		%feature("autodoc", "	* add the shape <S>.

	:param S:
	:type S: Handle_HLRTopoBRep_OutLiner &
	:param nbIso: default value is 0
	:type nbIso: Standard_Integer
	:rtype: None
") Load;
		void Load (const Handle_HLRTopoBRep_OutLiner & S,const Standard_Integer nbIso = 0);
		%feature("autodoc", "	* return the index of the Shape <S> and return 0 if the Shape <S> is not found.

	:param S:
	:type S: Handle_HLRTopoBRep_OutLiner &
	:rtype: int
") Index;
		Standard_Integer Index (const Handle_HLRTopoBRep_OutLiner & S);
		%feature("autodoc", "	* remove the Shape of Index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer I);
		%feature("autodoc", "	* Change the Shape Data of the Shape of index <I>.

	:param I:
	:type I: Standard_Integer
	:param SData:
	:type SData: Handle_MMgt_TShared &
	:rtype: None
") ShapeData;
		void ShapeData (const Standard_Integer I,const Handle_MMgt_TShared & SData);
		%feature("autodoc", "	:rtype: HLRBRep_SeqOfShapeBounds
") SeqOfShapeBounds;
		HLRBRep_SeqOfShapeBounds & SeqOfShapeBounds ();
		%feature("autodoc", "	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: HLRBRep_ShapeBounds
") ShapeBounds;
		HLRBRep_ShapeBounds & ShapeBounds (const Standard_Integer I);
		%feature("autodoc", "	* init the status of the selected edges depending of the back faces of a closed shell.

	:rtype: None
") InitEdgeStatus;
		void InitEdgeStatus ();
		%feature("autodoc", "	* select all the DataStructure.

	:rtype: None
") Select;
		void Select ();
		%feature("autodoc", "	* select only the Shape of index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") Select;
		void Select (const Standard_Integer I);
		%feature("autodoc", "	* select only the edges of the Shape <S>.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") SelectEdge;
		void SelectEdge (const Standard_Integer I);
		%feature("autodoc", "	* select only the faces of the Shape <S>.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") SelectFace;
		void SelectFace (const Standard_Integer I);
		%feature("autodoc", "	* set to visible all the edges.

	:rtype: None
") ShowAll;
		void ShowAll ();
		%feature("autodoc", "	* set to visible all the edges of the Shape <S>.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") ShowAll;
		void ShowAll (const Standard_Integer I);
		%feature("autodoc", "	* set to hide all the edges.

	:rtype: None
") HideAll;
		void HideAll ();
		%feature("autodoc", "	* set to hide all the edges of the Shape <S>.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") HideAll;
		void HideAll (const Standard_Integer I);
		%feature("autodoc", "	* own hiding of all the shapes of the DataStructure without hiding by each other.

	:rtype: None
") PartialHide;
		void PartialHide ();
		%feature("autodoc", "	* hide all the DataStructure.

	:rtype: None
") Hide;
		void Hide ();
		%feature("autodoc", "	* hide the Shape <S> by itself.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") Hide;
		void Hide (const Standard_Integer I);
		%feature("autodoc", "	* hide the Shape <S1> by the shape <S2>.

	:param I:
	:type I: Standard_Integer
	:param J:
	:type J: Standard_Integer
	:rtype: None
") Hide;
		void Hide (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "	:param deb:
	:type deb: bool
	:rtype: None
") Debug;
		void Debug (const Standard_Boolean deb);
		%feature("autodoc", "	:rtype: bool
") Debug;
		Standard_Boolean Debug ();
		%feature("autodoc", "	:rtype: Handle_HLRBRep_Data
") DataStructure;
		Handle_HLRBRep_Data DataStructure ();
};


%feature("shadow") HLRBRep_InternalAlgo::~HLRBRep_InternalAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_InternalAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_InternalAlgo {
	Handle_HLRBRep_InternalAlgo GetHandle() {
	return *(Handle_HLRBRep_InternalAlgo*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_InternalAlgo;
class Handle_HLRBRep_InternalAlgo : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRBRep_InternalAlgo();
        Handle_HLRBRep_InternalAlgo(const Handle_HLRBRep_InternalAlgo &aHandle);
        Handle_HLRBRep_InternalAlgo(const HLRBRep_InternalAlgo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_InternalAlgo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_InternalAlgo {
    HLRBRep_InternalAlgo* GetObject() {
    return (HLRBRep_InternalAlgo*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_InternalAlgo::~Handle_HLRBRep_InternalAlgo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_InternalAlgo {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_Intersector;
class HLRBRep_Intersector {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_Intersector;
		 HLRBRep_Intersector ();
		%feature("autodoc", "	* Performs the auto intersection of an edge. The edge domain is cutted at start with da1*(b-a) and at end with db1*(b-a).

	:param A1:
	:type A1: Standard_Address
	:param da1:
	:type da1: float
	:param db1:
	:type db1: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address A1,const Standard_Real da1,const Standard_Real db1);
		%feature("autodoc", "	* Performs the intersection between the two edges. The edges domains are cutted at start with da*(b-a) and at end with db*(b-a).

	:param nA:
	:type nA: Standard_Integer
	:param A1:
	:type A1: Standard_Address
	:param da1:
	:type da1: float
	:param db1:
	:type db1: float
	:param nB:
	:type nB: Standard_Integer
	:param A2:
	:type A2: Standard_Address
	:param da2:
	:type da2: float
	:param db2:
	:type db2: float
	:param NoBound:
	:type NoBound: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Integer nA,const Standard_Address A1,const Standard_Real da1,const Standard_Real db1,const Standard_Integer nB,const Standard_Address A2,const Standard_Real da2,const Standard_Real db2,const Standard_Boolean NoBound);
		%feature("autodoc", "	* Create a single IntersectionPoint (U on A1) (V on A2) The point is middle on both curves.

	:param A1:
	:type A1: Standard_Address
	:param U:
	:type U: float
	:param A2:
	:type A2: Standard_Address
	:param V:
	:type V: float
	:rtype: None
") SimulateOnePoint;
		void SimulateOnePoint (const Standard_Address A1,const Standard_Real U,const Standard_Address A2,const Standard_Real V);
		%feature("autodoc", "	:param A:
	:type A: Standard_Address &
	:rtype: None
") Load;
		void Load (Standard_Address & A);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:param P:
	:type P: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const Standard_Real P);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: IntRes2d_IntersectionPoint
") Point;
		const IntRes2d_IntersectionPoint & Point (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: IntCurveSurface_IntersectionPoint
") CSPoint;
		const IntCurveSurface_IntersectionPoint & CSPoint (const Standard_Integer N);
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: IntRes2d_IntersectionSegment
") Segment;
		const IntRes2d_IntersectionSegment & Segment (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: IntCurveSurface_IntersectionSegment
") CSSegment;
		const IntCurveSurface_IntersectionSegment & CSSegment (const Standard_Integer N);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%feature("shadow") HLRBRep_Intersector::~HLRBRep_Intersector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_Intersector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_LineTool;
class HLRBRep_LineTool {
	public:
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const gp_Lin & C);
		%feature("autodoc", "	* If necessary, breaks the line in intervals of continuity <S>. And returns the number of intervals.

	:param C:
	:type C: gp_Lin
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const gp_Lin & C,const GeomAbs_Shape S);
		%feature("autodoc", "	* Sets the current working interval.

	:param C:
	:type C: gp_Lin
	:param T:
	:type T: TColStd_Array1OfReal &
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const gp_Lin & C,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "	* Returns the first parameter of the current interval.

	:param C:
	:type C: gp_Lin
	:rtype: float
") IntervalFirst;
		static Standard_Real IntervalFirst (const gp_Lin & C);
		%feature("autodoc", "	* Returns the last parameter of the current interval.

	:param C:
	:type C: gp_Lin
	:rtype: float
") IntervalLast;
		static Standard_Real IntervalLast (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: GeomAbs_Shape
") IntervalContinuity;
		static GeomAbs_Shape IntervalContinuity (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: float
") Period;
		static Standard_Real Period (const gp_Lin & C);
		%feature("autodoc", "	* Computes the point of parameter U on the line.

	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const gp_Lin & C,const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U on the line.

	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point of parameter U on the line with its first derivative. Raised if the continuity of the current interval is not C1.

	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

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
	:rtype: void
") D2;
		static void D2 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
	:rtype: void
") D3;
		static void D3 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param C:
	:type C: gp_Lin
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const gp_Lin & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* Returns the parametric resolution corresponding  to the real space resolution <R3d>.

	:param C:
	:type C: gp_Lin
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const gp_Lin & C,const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the line in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: gp_Lin
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: Handle_Geom_BezierCurve
") Bezier;
		static Handle_Geom_BezierCurve Bezier (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: int
") Degree;
		static Standard_Integer Degree (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: int
") NbPoles;
		static Standard_Integer NbPoles (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param TP:
	:type TP: TColgp_Array1OfPnt
	:rtype: void
") Poles;
		static void Poles (const gp_Lin & C,TColgp_Array1OfPnt & TP);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: bool
") IsRational;
		static Standard_Boolean IsRational (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param TP:
	:type TP: TColgp_Array1OfPnt
	:param TW:
	:type TW: TColStd_Array1OfReal &
	:rtype: void
") PolesAndWeights;
		static void PolesAndWeights (const gp_Lin & C,TColgp_Array1OfPnt & TP,TColStd_Array1OfReal & TW);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:rtype: int
") NbKnots;
		static Standard_Integer NbKnots (const gp_Lin & C);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param TK:
	:type TK: TColStd_Array1OfReal &
	:param TM:
	:type TM: TColStd_Array1OfInteger &
	:rtype: void
") KnotsAndMultiplicities;
		static void KnotsAndMultiplicities (const gp_Lin & C,TColStd_Array1OfReal & TK,TColStd_Array1OfInteger & TM);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const gp_Lin & C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "	:param C:
	:type C: gp_Lin
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param Defl:
	:type Defl: float
	:param NbMin:
	:type NbMin: Standard_Integer
	:param Pars:
	:type Pars: Handle_TColStd_HArray1OfReal &
	:rtype: void
") SamplePars;
		static void SamplePars (const gp_Lin & C,const Standard_Real U0,const Standard_Real U1,const Standard_Real Defl,const Standard_Integer NbMin,Handle_TColStd_HArray1OfReal & Pars);
};


%feature("shadow") HLRBRep_LineTool::~HLRBRep_LineTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_LineTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ListIteratorOfListOfBPnt2D;
class HLRBRep_ListIteratorOfListOfBPnt2D {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_ListIteratorOfListOfBPnt2D;
		 HLRBRep_ListIteratorOfListOfBPnt2D ();
		%feature("autodoc", "	:param L:
	:type L: HLRBRep_ListOfBPnt2D &
	:rtype: None
") HLRBRep_ListIteratorOfListOfBPnt2D;
		 HLRBRep_ListIteratorOfListOfBPnt2D (const HLRBRep_ListOfBPnt2D & L);
		%feature("autodoc", "	:param L:
	:type L: HLRBRep_ListOfBPnt2D &
	:rtype: None
") Initialize;
		void Initialize (const HLRBRep_ListOfBPnt2D & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: HLRBRep_BiPnt2D
") Value;
		HLRBRep_BiPnt2D & Value ();
};


%feature("shadow") HLRBRep_ListIteratorOfListOfBPnt2D::~HLRBRep_ListIteratorOfListOfBPnt2D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ListIteratorOfListOfBPnt2D {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ListIteratorOfListOfBPoint;
class HLRBRep_ListIteratorOfListOfBPoint {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_ListIteratorOfListOfBPoint;
		 HLRBRep_ListIteratorOfListOfBPoint ();
		%feature("autodoc", "	:param L:
	:type L: HLRBRep_ListOfBPoint &
	:rtype: None
") HLRBRep_ListIteratorOfListOfBPoint;
		 HLRBRep_ListIteratorOfListOfBPoint (const HLRBRep_ListOfBPoint & L);
		%feature("autodoc", "	:param L:
	:type L: HLRBRep_ListOfBPoint &
	:rtype: None
") Initialize;
		void Initialize (const HLRBRep_ListOfBPoint & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: HLRBRep_BiPoint
") Value;
		HLRBRep_BiPoint & Value ();
};


%feature("shadow") HLRBRep_ListIteratorOfListOfBPoint::~HLRBRep_ListIteratorOfListOfBPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ListIteratorOfListOfBPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ListNodeOfListOfBPnt2D;
class HLRBRep_ListNodeOfListOfBPnt2D : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPnt2D &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRBRep_ListNodeOfListOfBPnt2D;
		 HLRBRep_ListNodeOfListOfBPnt2D (const HLRBRep_BiPnt2D & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: HLRBRep_BiPnt2D
") Value;
		HLRBRep_BiPnt2D & Value ();
};


%feature("shadow") HLRBRep_ListNodeOfListOfBPnt2D::~HLRBRep_ListNodeOfListOfBPnt2D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ListNodeOfListOfBPnt2D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_ListNodeOfListOfBPnt2D {
	Handle_HLRBRep_ListNodeOfListOfBPnt2D GetHandle() {
	return *(Handle_HLRBRep_ListNodeOfListOfBPnt2D*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_ListNodeOfListOfBPnt2D;
class Handle_HLRBRep_ListNodeOfListOfBPnt2D : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_HLRBRep_ListNodeOfListOfBPnt2D();
        Handle_HLRBRep_ListNodeOfListOfBPnt2D(const Handle_HLRBRep_ListNodeOfListOfBPnt2D &aHandle);
        Handle_HLRBRep_ListNodeOfListOfBPnt2D(const HLRBRep_ListNodeOfListOfBPnt2D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_ListNodeOfListOfBPnt2D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_ListNodeOfListOfBPnt2D {
    HLRBRep_ListNodeOfListOfBPnt2D* GetObject() {
    return (HLRBRep_ListNodeOfListOfBPnt2D*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_ListNodeOfListOfBPnt2D::~Handle_HLRBRep_ListNodeOfListOfBPnt2D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_ListNodeOfListOfBPnt2D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_ListNodeOfListOfBPoint;
class HLRBRep_ListNodeOfListOfBPoint : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPoint &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRBRep_ListNodeOfListOfBPoint;
		 HLRBRep_ListNodeOfListOfBPoint (const HLRBRep_BiPoint & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: HLRBRep_BiPoint
") Value;
		HLRBRep_BiPoint & Value ();
};


%feature("shadow") HLRBRep_ListNodeOfListOfBPoint::~HLRBRep_ListNodeOfListOfBPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ListNodeOfListOfBPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_ListNodeOfListOfBPoint {
	Handle_HLRBRep_ListNodeOfListOfBPoint GetHandle() {
	return *(Handle_HLRBRep_ListNodeOfListOfBPoint*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_ListNodeOfListOfBPoint;
class Handle_HLRBRep_ListNodeOfListOfBPoint : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_HLRBRep_ListNodeOfListOfBPoint();
        Handle_HLRBRep_ListNodeOfListOfBPoint(const Handle_HLRBRep_ListNodeOfListOfBPoint &aHandle);
        Handle_HLRBRep_ListNodeOfListOfBPoint(const HLRBRep_ListNodeOfListOfBPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_ListNodeOfListOfBPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_ListNodeOfListOfBPoint {
    HLRBRep_ListNodeOfListOfBPoint* GetObject() {
    return (HLRBRep_ListNodeOfListOfBPoint*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_ListNodeOfListOfBPoint::~Handle_HLRBRep_ListNodeOfListOfBPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_ListNodeOfListOfBPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_ListOfBPnt2D;
class HLRBRep_ListOfBPnt2D {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_ListOfBPnt2D;
		 HLRBRep_ListOfBPnt2D ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPnt2D &
	:rtype: None
") Assign;
		void Assign (const HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPnt2D &
	:rtype: None
") operator=;
		void operator = (const HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPnt2D &
	:rtype: None
") Prepend;
		void Prepend (const HLRBRep_BiPnt2D & I);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPnt2D &
	:param theIt:
	:type theIt: HLRBRep_ListIteratorOfListOfBPnt2D &
	:rtype: None
") Prepend;
		void Prepend (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPnt2D &
	:rtype: None
") Prepend;
		void Prepend (HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPnt2D &
	:rtype: None
") Append;
		void Append (const HLRBRep_BiPnt2D & I);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPnt2D &
	:param theIt:
	:type theIt: HLRBRep_ListIteratorOfListOfBPnt2D &
	:rtype: None
") Append;
		void Append (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPnt2D &
	:rtype: None
") Append;
		void Append (HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "	:rtype: HLRBRep_BiPnt2D
") First;
		HLRBRep_BiPnt2D & First ();
		%feature("autodoc", "	:rtype: HLRBRep_BiPnt2D
") Last;
		HLRBRep_BiPnt2D & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPnt2D &
	:rtype: None
") Remove;
		void Remove (HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPnt2D &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPnt2D &
	:rtype: None
") InsertBefore;
		void InsertBefore (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPnt2D &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPnt2D &
	:rtype: None
") InsertBefore;
		void InsertBefore (HLRBRep_ListOfBPnt2D & Other,HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPnt2D &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPnt2D &
	:rtype: None
") InsertAfter;
		void InsertAfter (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPnt2D &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPnt2D &
	:rtype: None
") InsertAfter;
		void InsertAfter (HLRBRep_ListOfBPnt2D & Other,HLRBRep_ListIteratorOfListOfBPnt2D & It);
};


%feature("shadow") HLRBRep_ListOfBPnt2D::~HLRBRep_ListOfBPnt2D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ListOfBPnt2D {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ListOfBPoint;
class HLRBRep_ListOfBPoint {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_ListOfBPoint;
		 HLRBRep_ListOfBPoint ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPoint &
	:rtype: None
") Assign;
		void Assign (const HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPoint &
	:rtype: None
") operator=;
		void operator = (const HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPoint &
	:rtype: None
") Prepend;
		void Prepend (const HLRBRep_BiPoint & I);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPoint &
	:param theIt:
	:type theIt: HLRBRep_ListIteratorOfListOfBPoint &
	:rtype: None
") Prepend;
		void Prepend (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPoint &
	:rtype: None
") Prepend;
		void Prepend (HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPoint &
	:rtype: None
") Append;
		void Append (const HLRBRep_BiPoint & I);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPoint &
	:param theIt:
	:type theIt: HLRBRep_ListIteratorOfListOfBPoint &
	:rtype: None
") Append;
		void Append (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPoint &
	:rtype: None
") Append;
		void Append (HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "	:rtype: HLRBRep_BiPoint
") First;
		HLRBRep_BiPoint & First ();
		%feature("autodoc", "	:rtype: HLRBRep_BiPoint
") Last;
		HLRBRep_BiPoint & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPoint &
	:rtype: None
") Remove;
		void Remove (HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPoint &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPoint &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (HLRBRep_ListOfBPoint & Other,HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_BiPoint &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_ListOfBPoint &
	:param It:
	:type It: HLRBRep_ListIteratorOfListOfBPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (HLRBRep_ListOfBPoint & Other,HLRBRep_ListIteratorOfListOfBPoint & It);
};


%feature("shadow") HLRBRep_ListOfBPoint::~HLRBRep_ListOfBPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ListOfBPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
class HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:param IT:
	:type IT: IntCurve_IConicTool &
	:param PC:
	:type PC: Standard_Address &
	:rtype: None
") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter (const IntCurve_IConicTool & IT,const Standard_Address & PC);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter::~HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
class HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Standard_Address &
	:rtype: None
") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:rtype: None
") Initialize;
		void Initialize (const Standard_Address & C);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param DF:
	:type DF: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "	:param U:
	:type U: float
	:param F:
	:type F: float &
	:param DF:
	:type DF: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "	:rtype: int
") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: bool
") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "	:param theUfirst:
	:type theUfirst: float
	:param theUlast:
	:type theUlast: float
	:rtype: None
") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "	:rtype: float
") SearchOfTolerance;
		Standard_Real SearchOfTolerance ();
};


%feature("shadow") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::~HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_PolyAlgo;
class HLRBRep_PolyAlgo : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Constructs an empty framework for the calculation of the visible and hidden lines of a shape in a projection. Use the functions: - Projector to define the point of view - Load to select the shape or shapes to be visualized - Update to compute the visible and hidden lines of the shape. Warning The shape or shapes to be visualized must have already been triangulated.

	:rtype: None
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo ();
		%feature("autodoc", "	:param A:
	:type A: Handle_HLRBRep_PolyAlgo &
	:rtype: None
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo (const Handle_HLRBRep_PolyAlgo & A);
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "	:param I:
	:type I: Standard_Integer
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape  Shape (const Standard_Integer I);
		%feature("autodoc", "	* remove the Shape of Index <I>.

	:param I:
	:type I: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer I);
		%feature("autodoc", "	* return the index of the Shape <S> and return 0 if the Shape <S> is not found.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "	* Loads the shape S into this framework. Warning S must have already been triangulated.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: Handle_HLRAlgo_PolyAlgo
") Algo;
		Handle_HLRAlgo_PolyAlgo Algo ();
		%feature("autodoc", "	* Sets the parameters of the view for this framework. These parameters are defined by an HLRAlgo_Projector object, which is returned by the Projector function on a Prs3d_Projector object.

	:rtype: HLRAlgo_Projector
") Projector;
		const HLRAlgo_Projector & Projector ();
		%feature("autodoc", "	:param P:
	:type P: HLRAlgo_Projector &
	:rtype: None
") Projector;
		void Projector (const HLRAlgo_Projector & P);
		%feature("autodoc", "	:rtype: float
") Angle;
		Standard_Real Angle ();
		%feature("autodoc", "	:param Ang:
	:type Ang: float
	:rtype: None
") Angle;
		void Angle (const Standard_Real Ang);
		%feature("autodoc", "	:rtype: float
") TolAngular;
		Standard_Real TolAngular ();
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") TolAngular;
		void TolAngular (const Standard_Real Tol);
		%feature("autodoc", "	:rtype: float
") TolCoef;
		Standard_Real TolCoef ();
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") TolCoef;
		void TolCoef (const Standard_Real Tol);
		%feature("autodoc", "	* Launches calculation of outlines of the shape visualized by this framework. Used after setting the point of view and defining the shape or shapes to be visualized.

	:rtype: None
") Update;
		void Update ();
		%feature("autodoc", "	:rtype: None
") InitHide;
		void InitHide ();
		%feature("autodoc", "	:rtype: bool
") MoreHide;
		Standard_Boolean MoreHide ();
		%feature("autodoc", "	:rtype: None
") NextHide;
		void NextHide ();
		%feature("autodoc", "	:param Coordinates:
	:type Coordinates: Standard_Address &
	:param status:
	:type status: HLRAlgo_EdgeStatus &
	:param S:
	:type S: TopoDS_Shape &
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") Hide;
		void Hide (Standard_Address & Coordinates,HLRAlgo_EdgeStatus & status,TopoDS_Shape & S,Standard_Boolean & reg1,Standard_Boolean & regn,Standard_Boolean & outl,Standard_Boolean & intl);
		%feature("autodoc", "	:rtype: None
") InitShow;
		void InitShow ();
		%feature("autodoc", "	:rtype: bool
") MoreShow;
		Standard_Boolean MoreShow ();
		%feature("autodoc", "	:rtype: None
") NextShow;
		void NextShow ();
		%feature("autodoc", "	:param Coordinates:
	:type Coordinates: Standard_Address &
	:param S:
	:type S: TopoDS_Shape &
	:param reg1:
	:type reg1: bool
	:param regn:
	:type regn: bool
	:param outl:
	:type outl: bool
	:param intl:
	:type intl: bool
	:rtype: None
") Show;
		void Show (Standard_Address & Coordinates,TopoDS_Shape & S,Standard_Boolean & reg1,Standard_Boolean & regn,Standard_Boolean & outl,Standard_Boolean & intl);
		%feature("autodoc", "	* Make a shape with the internal outlines in each face.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") OutLinedShape;
		TopoDS_Shape OutLinedShape (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: bool
") Debug;
		Standard_Boolean Debug ();
		%feature("autodoc", "	:param B:
	:type B: bool
	:rtype: None
") Debug;
		void Debug (const Standard_Boolean B);
};


%feature("shadow") HLRBRep_PolyAlgo::~HLRBRep_PolyAlgo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_PolyAlgo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_PolyAlgo {
	Handle_HLRBRep_PolyAlgo GetHandle() {
	return *(Handle_HLRBRep_PolyAlgo*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_PolyAlgo;
class Handle_HLRBRep_PolyAlgo : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRBRep_PolyAlgo();
        Handle_HLRBRep_PolyAlgo(const Handle_HLRBRep_PolyAlgo &aHandle);
        Handle_HLRBRep_PolyAlgo(const HLRBRep_PolyAlgo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_PolyAlgo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_PolyAlgo {
    HLRBRep_PolyAlgo* GetObject() {
    return (HLRBRep_PolyAlgo*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_PolyAlgo::~Handle_HLRBRep_PolyAlgo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_PolyAlgo {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_PolyHLRToShape;
class HLRBRep_PolyHLRToShape {
	public:
		%feature("autodoc", "	* Constructs a framework for filtering the results of the HLRBRep_Algo algorithm, A. Use the extraction filters to obtain the results you want for A.

	:rtype: None
") HLRBRep_PolyHLRToShape;
		 HLRBRep_PolyHLRToShape ();
		%feature("autodoc", "	:param A:
	:type A: Handle_HLRBRep_PolyAlgo &
	:rtype: None
") Update;
		void Update (const Handle_HLRBRep_PolyAlgo & A);
		%feature("autodoc", "	:rtype: None
") Show;
		void Show ();
		%feature("autodoc", "	:rtype: None
") Hide;
		void Hide ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") VCompound;
		TopoDS_Shape VCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	* Sets the extraction filter for visible smooth edges.

	:rtype: TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	* Sets the extraction filter for visible sewn edges.

	:rtype: TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound ();
		%feature("autodoc", "	* Sets the extraction filter for visible outlines.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") OutLineVCompound;
		TopoDS_Shape OutLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound ();
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") HCompound;
		TopoDS_Shape HCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound ();
		%feature("autodoc", "	* Sets the extraction filter for hidden smooth edges.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound ();
		%feature("autodoc", "	* Sets the extraction filter for hidden sewn edges.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound ();
		%feature("autodoc", "	* Sets the extraction filter for hidden outlines. Hidden outlines occur, for instance, in tori. In this case, the inner outlines of the torus seen on its side are hidden.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") OutLineHCompound;
		TopoDS_Shape OutLineHCompound (const TopoDS_Shape & S);
};


%feature("shadow") HLRBRep_PolyHLRToShape::~HLRBRep_PolyHLRToShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_PolyHLRToShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_SLProps;
class HLRBRep_SLProps {
	public:
		%feature("autodoc", "	:param S:
	:type S: Standard_Address &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Address & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address &
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Address & S,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address &
	:rtype: None
") SetSurface;
		void SetSurface (const Standard_Address & S);
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	:rtype: gp_Vec
") D1U;
		const gp_Vec  D1U ();
		%feature("autodoc", "	:rtype: gp_Vec
") D1V;
		const gp_Vec  D1V ();
		%feature("autodoc", "	:rtype: gp_Vec
") D2U;
		const gp_Vec  D2U ();
		%feature("autodoc", "	:rtype: gp_Vec
") D2V;
		const gp_Vec  D2V ();
		%feature("autodoc", "	:rtype: gp_Vec
") DUV;
		const gp_Vec  DUV ();
		%feature("autodoc", "	:rtype: bool
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined ();
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") TangentU;
		void TangentU (gp_Dir & D);
		%feature("autodoc", "	:rtype: bool
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined ();
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") TangentV;
		void TangentV (gp_Dir & D);
		%feature("autodoc", "	:rtype: bool
") IsNormalDefined;
		Standard_Boolean IsNormalDefined ();
		%feature("autodoc", "	:rtype: gp_Dir
") Normal;
		const gp_Dir  Normal ();
		%feature("autodoc", "	:rtype: bool
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined ();
		%feature("autodoc", "	:rtype: bool
") IsUmbilic;
		Standard_Boolean IsUmbilic ();
		%feature("autodoc", "	:rtype: float
") MaxCurvature;
		Standard_Real MaxCurvature ();
		%feature("autodoc", "	:rtype: float
") MinCurvature;
		Standard_Real MinCurvature ();
		%feature("autodoc", "	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:rtype: None
") CurvatureDirections;
		void CurvatureDirections (gp_Dir & MaxD,gp_Dir & MinD);
		%feature("autodoc", "	:rtype: float
") MeanCurvature;
		Standard_Real MeanCurvature ();
		%feature("autodoc", "	:rtype: float
") GaussianCurvature;
		Standard_Real GaussianCurvature ();
};


%feature("shadow") HLRBRep_SLProps::~HLRBRep_SLProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_SLProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_SLPropsATool;
class HLRBRep_SLPropsATool {
	public:
		%feature("autodoc", "	* Computes the point <P> of 	parameter <U> and <V> on the Surface <A>.

	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") Value;
		static void Value (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the Surface <A>.

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
	:rtype: void
") D1;
		static void D1 (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the Surface <A>.

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
	:rtype: void
") D2;
		static void D2 (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);
		%feature("autodoc", "	:param A:
	:type A: Standard_Address
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: Standard_Integer
	:param Nv:
	:type Nv: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Address A,const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "	* returns the order of continuity of the Surface <A>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.

	:param A:
	:type A: Standard_Address
	:rtype: int
") Continuity;
		static Standard_Integer Continuity (const Standard_Address A);
		%feature("autodoc", "	* returns the bounds of the Surface.

	:param A:
	:type A: Standard_Address
	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: void
") Bounds;
		static void Bounds (const Standard_Address A,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") HLRBRep_SLPropsATool::~HLRBRep_SLPropsATool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_SLPropsATool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_SeqOfShapeBounds;
class HLRBRep_SeqOfShapeBounds : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_SeqOfShapeBounds;
		 HLRBRep_SeqOfShapeBounds ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_SeqOfShapeBounds &
	:rtype: HLRBRep_SeqOfShapeBounds
") Assign;
		const HLRBRep_SeqOfShapeBounds & Assign (const HLRBRep_SeqOfShapeBounds & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_SeqOfShapeBounds &
	:rtype: HLRBRep_SeqOfShapeBounds
") operator=;
		const HLRBRep_SeqOfShapeBounds & operator = (const HLRBRep_SeqOfShapeBounds & Other);
		%feature("autodoc", "	:param T:
	:type T: HLRBRep_ShapeBounds &
	:rtype: None
") Append;
		void Append (const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "	:param S:
	:type S: HLRBRep_SeqOfShapeBounds &
	:rtype: None
") Append;
		void Append (HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "	:param T:
	:type T: HLRBRep_ShapeBounds &
	:rtype: None
") Prepend;
		void Prepend (const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "	:param S:
	:type S: HLRBRep_SeqOfShapeBounds &
	:rtype: None
") Prepend;
		void Prepend (HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: HLRBRep_ShapeBounds &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: HLRBRep_SeqOfShapeBounds &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: HLRBRep_ShapeBounds &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: HLRBRep_SeqOfShapeBounds &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "	:rtype: HLRBRep_ShapeBounds
") First;
		const HLRBRep_ShapeBounds & First ();
		%feature("autodoc", "	:rtype: HLRBRep_ShapeBounds
") Last;
		const HLRBRep_ShapeBounds & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: HLRBRep_SeqOfShapeBounds &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,HLRBRep_SeqOfShapeBounds & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRBRep_ShapeBounds
") Value;
		const HLRBRep_ShapeBounds & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: HLRBRep_ShapeBounds &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const HLRBRep_ShapeBounds & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: HLRBRep_ShapeBounds
") ChangeValue;
		HLRBRep_ShapeBounds & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") HLRBRep_SeqOfShapeBounds::~HLRBRep_SeqOfShapeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_SeqOfShapeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
class HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &
	:rtype: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter
") Assign;
		const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Assign (const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &
	:rtype: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter
") operator=;
		const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & operator = (const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Other);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &
	:rtype: None
") Append;
		void Append (HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param S:
	:type S: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &
	:rtype: None
") Prepend;
		void Prepend (HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: Extrema_POnCurv2d &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: Extrema_POnCurv2d &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: Extrema_POnCurv2d
") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::~HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_SequenceNodeOfSeqOfShapeBounds;
class HLRBRep_SequenceNodeOfSeqOfShapeBounds : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: HLRBRep_ShapeBounds &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") HLRBRep_SequenceNodeOfSeqOfShapeBounds;
		 HLRBRep_SequenceNodeOfSeqOfShapeBounds (const HLRBRep_ShapeBounds & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: HLRBRep_ShapeBounds
") Value;
		HLRBRep_ShapeBounds & Value ();
};


%feature("shadow") HLRBRep_SequenceNodeOfSeqOfShapeBounds::~HLRBRep_SequenceNodeOfSeqOfShapeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_SequenceNodeOfSeqOfShapeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_SequenceNodeOfSeqOfShapeBounds {
	Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds GetHandle() {
	return *(Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds;
class Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds();
        Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds(const Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds &aHandle);
        Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds(const HLRBRep_SequenceNodeOfSeqOfShapeBounds *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds {
    HLRBRep_SequenceNodeOfSeqOfShapeBounds* GetObject() {
    return (HLRBRep_SequenceNodeOfSeqOfShapeBounds*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds::~Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_SequenceNodeOfSeqOfShapeBounds {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
class HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: Extrema_POnCurv2d &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Value;
		Extrema_POnCurv2d & Value ();
};


%feature("shadow") HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::~HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter {
	Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter GetHandle() {
	return *(Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
class Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter();
        Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter(const Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter &aHandle);
        Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter(const HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter {
    HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter* GetObject() {
    return (HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter::~Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRBRep_ShapeBounds;
class HLRBRep_ShapeBounds {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds ();
		%feature("autodoc", "	:param S:
	:type S: Handle_HLRTopoBRep_OutLiner &
	:param SData:
	:type SData: Handle_MMgt_TShared &
	:param nbIso:
	:type nbIso: Standard_Integer
	:param V1:
	:type V1: Standard_Integer
	:param V2:
	:type V2: Standard_Integer
	:param E1:
	:type E1: Standard_Integer
	:param E2:
	:type E2: Standard_Integer
	:param F1:
	:type F1: Standard_Integer
	:param F2:
	:type F2: Standard_Integer
	:rtype: None
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds (const Handle_HLRTopoBRep_OutLiner & S,const Handle_MMgt_TShared & SData,const Standard_Integer nbIso,const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer E1,const Standard_Integer E2,const Standard_Integer F1,const Standard_Integer F2);
		%feature("autodoc", "	:param S:
	:type S: Handle_HLRTopoBRep_OutLiner &
	:param nbIso:
	:type nbIso: Standard_Integer
	:param V1:
	:type V1: Standard_Integer
	:param V2:
	:type V2: Standard_Integer
	:param E1:
	:type E1: Standard_Integer
	:param E2:
	:type E2: Standard_Integer
	:param F1:
	:type F1: Standard_Integer
	:param F2:
	:type F2: Standard_Integer
	:rtype: None
") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds (const Handle_HLRTopoBRep_OutLiner & S,const Standard_Integer nbIso,const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer E1,const Standard_Integer E2,const Standard_Integer F1,const Standard_Integer F2);
		%feature("autodoc", "	:param NV:
	:type NV: Standard_Integer
	:param NE:
	:type NE: Standard_Integer
	:param NF:
	:type NF: Standard_Integer
	:rtype: None
") Translate;
		void Translate (const Standard_Integer NV,const Standard_Integer NE,const Standard_Integer NF);
		%feature("autodoc", "	:param S:
	:type S: Handle_HLRTopoBRep_OutLiner &
	:rtype: None
") Shape;
		void Shape (const Handle_HLRTopoBRep_OutLiner & S);
		%feature("autodoc", "	:rtype: Handle_HLRTopoBRep_OutLiner
") Shape;
		const Handle_HLRTopoBRep_OutLiner & Shape ();
		%feature("autodoc", "	:param SD:
	:type SD: Handle_MMgt_TShared &
	:rtype: None
") ShapeData;
		void ShapeData (const Handle_MMgt_TShared & SD);
		%feature("autodoc", "	:rtype: Handle_MMgt_TShared
") ShapeData;
		const Handle_MMgt_TShared & ShapeData ();
		%feature("autodoc", "	:param nbIso:
	:type nbIso: Standard_Integer
	:rtype: None
") NbOfIso;
		void NbOfIso (const Standard_Integer nbIso);
		%feature("autodoc", "	:rtype: int
") NbOfIso;
		Standard_Integer NbOfIso ();
		%feature("autodoc", "	:param NV:
	:type NV: Standard_Integer &
	:param NE:
	:type NE: Standard_Integer &
	:param NF:
	:type NF: Standard_Integer &
	:rtype: None
") Sizes;
		void Sizes (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param V1:
	:type V1: Standard_Integer &
	:param V2:
	:type V2: Standard_Integer &
	:param E1:
	:type E1: Standard_Integer &
	:param E2:
	:type E2: Standard_Integer &
	:param F1:
	:type F1: Standard_Integer &
	:param F2:
	:type F2: Standard_Integer &
	:rtype: None
") Bounds;
		void Bounds (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param TotMinMax:
	:type TotMinMax: Standard_Address
	:rtype: None
") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "	:rtype: Standard_Address
") MinMax;
		Standard_Address MinMax ();
};


%feature("shadow") HLRBRep_ShapeBounds::~HLRBRep_ShapeBounds %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ShapeBounds {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ShapeToHLR;
class HLRBRep_ShapeToHLR {
	public:
		%feature("autodoc", "	* Creates a DataStructure containing the OutLiner <S> depending on the projector <P> and nbIso.

	:param S:
	:type S: Handle_HLRTopoBRep_OutLiner &
	:param P:
	:type P: HLRAlgo_Projector &
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool &
	:param nbIso: default value is 0
	:type nbIso: Standard_Integer
	:rtype: Handle_HLRBRep_Data
") Load;
		static Handle_HLRBRep_Data Load (const Handle_HLRTopoBRep_OutLiner & S,const HLRAlgo_Projector & P,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso = 0);
};


%feature("shadow") HLRBRep_ShapeToHLR::~HLRBRep_ShapeToHLR %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ShapeToHLR {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_SurfaceTool;
class HLRBRep_SurfaceTool {
	public:
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: float
") FirstUParameter;
		static Standard_Real FirstUParameter (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: float
") FirstVParameter;
		static Standard_Real FirstVParameter (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: float
") LastUParameter;
		static Standard_Real LastUParameter (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: float
") LastVParameter;
		static Standard_Real LastVParameter (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		static Standard_Integer NbUIntervals (const Standard_Address S,const GeomAbs_Shape Sh);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		static Standard_Integer NbVIntervals (const Standard_Address S,const GeomAbs_Shape Sh);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param T:
	:type T: TColStd_Array1OfReal &
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: void
") UIntervals;
		static void UIntervals (const Standard_Address S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param T:
	:type T: TColStd_Array1OfReal &
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: void
") VIntervals;
		static void VIntervals (const Standard_Address S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "	* If <First> >= <Last>

	:param S:
	:type S: Standard_Address
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") UTrim;
		static Handle_Adaptor3d_HSurface UTrim (const Standard_Address S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	* If <First> >= <Last>

	:param S:
	:type S: Standard_Address
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") VTrim;
		static Handle_Adaptor3d_HSurface VTrim (const Standard_Address S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: bool
") IsUClosed;
		static Standard_Boolean IsUClosed (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: bool
") IsVClosed;
		static Standard_Boolean IsVClosed (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: bool
") IsUPeriodic;
		static Standard_Boolean IsUPeriodic (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: float
") UPeriod;
		static Standard_Real UPeriod (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: bool
") IsVPeriodic;
		static Standard_Boolean IsVPeriodic (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: float
") VPeriod;
		static Standard_Real VPeriod (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Standard_Address S,const Standard_Real u,const Standard_Real v);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P);
		%feature("autodoc", "	:param S:
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
	:rtype: void
") D1;
		static void D1 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1u,gp_Vec & D1v);
		%feature("autodoc", "	:param S:
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
	:rtype: void
") D2;
		static void D2 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "	:param S:
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
	:rtype: void
") D3;
		static void D3 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param Nu:
	:type Nu: Standard_Integer
	:param Nv:
	:type Nv: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Standard_Address S,const Standard_Real u,const Standard_Real v,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		static Standard_Real UResolution (const Standard_Address S,const Standard_Real R3d);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		static Standard_Real VResolution (const Standard_Address S,const Standard_Real R3d);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: GeomAbs_SurfaceType
") GetType;
		static GeomAbs_SurfaceType GetType (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: gp_Pln
") Plane;
		static gp_Pln Plane (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: gp_Cylinder
") Cylinder;
		static gp_Cylinder Cylinder (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: gp_Cone
") Cone;
		static gp_Cone Cone (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: gp_Torus
") Torus;
		static gp_Torus Torus (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: gp_Sphere
") Sphere;
		static gp_Sphere Sphere (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: Handle_Geom_BezierSurface
") Bezier;
		static Handle_Geom_BezierSurface Bezier (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		static Handle_Geom_BSplineSurface BSpline (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: gp_Ax1
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: gp_Dir
") Direction;
		static gp_Dir Direction (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		static Handle_Adaptor3d_HCurve BasisCurve (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: Handle_Adaptor3d_HSurface
") BasisSurface;
		static Handle_Adaptor3d_HSurface BasisSurface (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: float
") OffsetValue;
		static Standard_Real OffsetValue (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Standard_Address S);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Standard_Address S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "	:param S:
	:type S: Standard_Address
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Standard_Address S,const Standard_Real v1,const Standard_Real v2);
};


%feature("shadow") HLRBRep_SurfaceTool::~HLRBRep_SurfaceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_SurfaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheCSFunctionOfInterCSurf;
class HLRBRep_TheCSFunctionOfInterCSurf : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param S:
	:type S: Standard_Address &
	:param C:
	:type C: gp_Lin
	:rtype: None
") HLRBRep_TheCSFunctionOfInterCSurf;
		 HLRBRep_TheCSFunctionOfInterCSurf (const Standard_Address & S,const gp_Lin & C);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("autodoc", "	:rtype: Standard_Address
") AuxillarSurface;
		const Standard_Address & AuxillarSurface ();
		%feature("autodoc", "	:rtype: gp_Lin
") AuxillarCurve;
		const gp_Lin  AuxillarCurve ();
};


%feature("shadow") HLRBRep_TheCSFunctionOfInterCSurf::~HLRBRep_TheCSFunctionOfInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheCSFunctionOfInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
class HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "	:param curve1:
	:type curve1: Standard_Address &
	:param curve2:
	:type curve2: Standard_Address &
	:rtype: None
") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter (const Standard_Address & curve1,const Standard_Address & curve2);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%feature("shadow") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter::~HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheExactInterCSurf;
class HLRBRep_TheExactInterCSurf {
	public:
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param F:
	:type F: HLRBRep_TheCSFunctionOfInterCSurf &
	:param TolTangency:
	:type TolTangency: float
	:param MarginCoef: default value is 0.0
	:type MarginCoef: float
	:rtype: None
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf (const Standard_Real U,const Standard_Real V,const Standard_Real W,const HLRBRep_TheCSFunctionOfInterCSurf & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);
		%feature("autodoc", "	:param F:
	:type F: HLRBRep_TheCSFunctionOfInterCSurf &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf (const HLRBRep_TheCSFunctionOfInterCSurf & F,const Standard_Real TolTangency);
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
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
	:rtype: None
") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("autodoc", "	:rtype: float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: HLRBRep_TheCSFunctionOfInterCSurf
") Function;
		HLRBRep_TheCSFunctionOfInterCSurf & Function ();
};


%feature("shadow") HLRBRep_TheExactInterCSurf::~HLRBRep_TheExactInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheExactInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheIntConicCurveOfCInter;
class HLRBRep_TheIntConicCurveOfCInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter ();
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: gp_Circ2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param E:
	:type E: gp_Elips2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Prb:
	:type Prb: gp_Parab2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param H:
	:type H: gp_Hypr2d
	:param D1:
	:type D1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
};


%feature("shadow") HLRBRep_TheIntConicCurveOfCInter::~HLRBRep_TheIntConicCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheIntConicCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheIntPCurvePCurveOfCInter;
class HLRBRep_TheIntPCurvePCurveOfCInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_TheIntPCurvePCurveOfCInter;
		 HLRBRep_TheIntPCurvePCurveOfCInter ();
		%feature("autodoc", "	:param Curve1:
	:type Curve1: Standard_Address &
	:param Domain1:
	:type Domain1: IntRes2d_Domain &
	:param Curve2:
	:type Curve2: Standard_Address &
	:param Domain2:
	:type Domain2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & Curve1,const IntRes2d_Domain & Domain1,const Standard_Address & Curve2,const IntRes2d_Domain & Domain2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param Curve1:
	:type Curve1: Standard_Address &
	:param Domain1:
	:type Domain1: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const Standard_Address & Curve1,const IntRes2d_Domain & Domain1,const Standard_Real TolConf,const Standard_Real Tol);
};


%feature("shadow") HLRBRep_TheIntPCurvePCurveOfCInter::~HLRBRep_TheIntPCurvePCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheIntPCurvePCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheInterferenceOfInterCSurf;
class HLRBRep_TheInterferenceOfInterCSurf : public Intf_Interference {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf ();
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") Perform;
		void Perform (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Interference;
		void Interference (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: HLRBRep_ThePolygonOfInterCSurf &
	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: None
") Interference;
		void Interference (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
};


%feature("shadow") HLRBRep_TheInterferenceOfInterCSurf::~HLRBRep_TheInterferenceOfInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheInterferenceOfInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
class HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ();
		%feature("autodoc", "	:param ITool:
	:type ITool: IntCurve_IConicTool &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param Dom2:
	:type Dom2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Standard_Address & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param ITool:
	:type ITool: IntCurve_IConicTool &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:param PCurve:
	:type PCurve: Standard_Address &
	:param Dom2:
	:type Dom2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Standard_Address & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheParCurev:
	:type TheParCurev: Standard_Address &
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:rtype: float
") FindU;
		Standard_Real FindU (const Standard_Real parameter,gp_Pnt2d & point,const Standard_Address & TheParCurev,const IntCurve_IConicTool & TheImpTool);
		%feature("autodoc", "	:param parameter:
	:type parameter: float
	:param point:
	:type point: gp_Pnt2d
	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:param ParCurve:
	:type ParCurve: Standard_Address &
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain &
	:param V0:
	:type V0: float
	:param V1:
	:type V1: float
	:param Tolerance:
	:type Tolerance: float
	:rtype: float
") FindV;
		Standard_Real FindV (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_IConicTool & TheImpTool,const Standard_Address & ParCurve,const IntRes2d_Domain & TheParCurveDomain,const Standard_Real V0,const Standard_Real V1,const Standard_Real Tolerance);
		%feature("autodoc", "	:param TheImpTool:
	:type TheImpTool: IntCurve_IConicTool &
	:param TheParCurve:
	:type TheParCurve: Standard_Address &
	:param TheImpCurveDomain:
	:type TheImpCurveDomain: IntRes2d_Domain &
	:param TheParCurveDomain:
	:type TheParCurveDomain: IntRes2d_Domain &
	:param NbResultats:
	:type NbResultats: Standard_Integer &
	:param Inter2_And_Domain2:
	:type Inter2_And_Domain2: TColStd_Array1OfReal &
	:param Inter1:
	:type Inter1: TColStd_Array1OfReal &
	:param Resultat1:
	:type Resultat1: TColStd_Array1OfReal &
	:param Resultat2:
	:type Resultat2: TColStd_Array1OfReal &
	:param EpsNul:
	:type EpsNul: float
	:rtype: None
") And_Domaine_Objet1_Intersections;
		void And_Domaine_Objet1_Intersections (const IntCurve_IConicTool & TheImpTool,const Standard_Address & TheParCurve,const IntRes2d_Domain & TheImpCurveDomain,const IntRes2d_Domain & TheParCurveDomain,Standard_Integer &OutValue,TColStd_Array1OfReal & Inter2_And_Domain2,TColStd_Array1OfReal & Inter1,TColStd_Array1OfReal & Resultat1,TColStd_Array1OfReal & Resultat2,const Standard_Real EpsNul);
};


%feature("shadow") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter::~HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
class HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter {
	public:
		%feature("autodoc", "	:rtype: None
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Standard_Address &
	:param U0:
	:type U0: float
	:param TolU:
	:type TolU: float
	:rtype: None
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param C:
	:type C: Standard_Address &
	:param U0:
	:type U0: float
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:param Umin:
	:type Umin: float
	:param Usup:
	:type Usup: float
	:param TolU:
	:type TolU: float
	:rtype: None
") Initialize;
		void Initialize (const Standard_Address & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param U0:
	:type U0: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "	:rtype: bool
") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "	:rtype: Extrema_POnCurv2d
") Point;
		const Extrema_POnCurv2d & Point ();
};


%feature("shadow") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter::~HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
class HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter : public Intf_Polygon2d {
	public:
		%feature("autodoc", "	:param Curve:
	:type Curve: Standard_Address &
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:param Domain:
	:type Domain: IntRes2d_Domain &
	:param Tol:
	:type Tol: float
	:rtype: None
") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter (const Standard_Address & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol);
		%feature("autodoc", "	:param Curve:
	:type Curve: Standard_Address &
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:param Domain:
	:type Domain: IntRes2d_Domain &
	:param Tol:
	:type Tol: float
	:param OtherBox:
	:type OtherBox: Bnd_Box2d &
	:rtype: None
") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter (const Standard_Address & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "	:param Curve:
	:type Curve: Standard_Address &
	:param OtherBox:
	:type OtherBox: Bnd_Box2d &
	:rtype: None
") ComputeWithBox;
		void ComputeWithBox (const Standard_Address & Curve,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param theIndex:
	:type theIndex: Standard_Integer
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: void
") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
		%feature("autodoc", "	:rtype: float
") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "	:rtype: float
") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "	:rtype: bool
") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "	:param x:
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
	:rtype: int
") CalculRegion;
		Standard_Integer CalculRegion (const Standard_Real x,const Standard_Real y,const Standard_Real x1,const Standard_Real x2,const Standard_Real y1,const Standard_Real y2);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter::~HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ThePolygonOfInterCSurf;
class HLRBRep_ThePolygonOfInterCSurf {
	public:
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:rtype: None
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const Standard_Integer NbPnt);
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:rtype: None
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const Standard_Real U1,const Standard_Real U2,const Standard_Integer NbPnt);
		%feature("autodoc", "	:param Curve:
	:type Curve: gp_Lin
	:param Upars:
	:type Upars: TColStd_Array1OfReal &
	:rtype: None
") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const TColStd_Array1OfReal & Upars);
		%feature("autodoc", "	:rtype: Bnd_Box
") Bounding;
		const Bnd_Box & Bounding ();
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") BeginOfSeg;
		const gp_Pnt  BeginOfSeg (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") EndOfSeg;
		const gp_Pnt  EndOfSeg (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: float
") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "	:rtype: float
") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%feature("shadow") HLRBRep_ThePolygonOfInterCSurf::~HLRBRep_ThePolygonOfInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ThePolygonOfInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ThePolygonToolOfInterCSurf;
class HLRBRep_ThePolygonToolOfInterCSurf {
	public:
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:rtype: bool
") Closed;
		static Standard_Boolean Closed (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:rtype: int
") NbSegments;
		static Standard_Integer NbSegments (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") BeginOfSeg;
		static const gp_Pnt  BeginOfSeg (const HLRBRep_ThePolygonOfInterCSurf & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") EndOfSeg;
		static const gp_Pnt  EndOfSeg (const HLRBRep_ThePolygonOfInterCSurf & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: HLRBRep_ThePolygonOfInterCSurf &
	:rtype: void
") Dump;
		static void Dump (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
};


%feature("shadow") HLRBRep_ThePolygonToolOfInterCSurf::~HLRBRep_ThePolygonToolOfInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ThePolygonToolOfInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_ThePolyhedronToolOfInterCSurf;
class HLRBRep_ThePolyhedronToolOfInterCSurf {
	public:
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: Handle_Bnd_HArray1OfBox
") ComponentsBounding;
		static const Handle_Bnd_HArray1OfBox & ComponentsBounding (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: int
") NbTriangles;
		static Standard_Integer NbTriangles (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param Index:
	:type Index: Standard_Integer
	:param P1:
	:type P1: Standard_Integer &
	:param P2:
	:type P2: Standard_Integer &
	:param P3:
	:type P3: Standard_Integer &
	:rtype: void
") Triangle;
		static void Triangle (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") Point;
		static const gp_Pnt  Point (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param Triang:
	:type Triang: Standard_Integer
	:param Pivot:
	:type Pivot: Standard_Integer
	:param Pedge:
	:type Pedge: Standard_Integer
	:param TriCon:
	:type TriCon: Standard_Integer &
	:param OtherP:
	:type OtherP: Standard_Integer &
	:rtype: int
") TriConnex;
		static Standard_Integer TriConnex (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:param Index1:
	:type Index1: Standard_Integer
	:param Index2:
	:type Index2: Standard_Integer
	:rtype: bool
") IsOnBound;
		static Standard_Boolean IsOnBound (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: float
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: HLRBRep_ThePolyhedronOfInterCSurf &
	:rtype: void
") Dump;
		static void Dump (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
};


%feature("shadow") HLRBRep_ThePolyhedronToolOfInterCSurf::~HLRBRep_ThePolyhedronToolOfInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_ThePolyhedronToolOfInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheProjPCurOfCInter;
class HLRBRep_TheProjPCurOfCInter {
	public:
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter (const Standard_Address & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);
		%feature("autodoc", "	:param C:
	:type C: Standard_Address &
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param LowParameter:
	:type LowParameter: float
	:param HighParameter:
	:type HighParameter: float
	:param Tol:
	:type Tol: float
	:rtype: float
") FindParameter;
		static Standard_Real FindParameter (const Standard_Address & C,const gp_Pnt2d & Pnt,const Standard_Real LowParameter,const Standard_Real HighParameter,const Standard_Real Tol);
};


%feature("shadow") HLRBRep_TheProjPCurOfCInter::~HLRBRep_TheProjPCurOfCInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheProjPCurOfCInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheQuadCurvExactInterCSurf;
class HLRBRep_TheQuadCurvExactInterCSurf {
	public:
		%feature("autodoc", "	:param S:
	:type S: Standard_Address &
	:param C:
	:type C: gp_Lin
	:rtype: None
") HLRBRep_TheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvExactInterCSurf (const Standard_Address & S,const gp_Lin & C);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") Root;
		Standard_Real Root (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Intervals;
		void Intervals (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") HLRBRep_TheQuadCurvExactInterCSurf::~HLRBRep_TheQuadCurvExactInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheQuadCurvExactInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
class HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "	:param Q:
	:type Q: IntSurf_Quadric &
	:param C:
	:type C: gp_Lin
	:rtype: None
") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf (const IntSurf_Quadric & Q,const gp_Lin & C);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf::~HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_VertexList;
class HLRBRep_VertexList {
	public:
		%feature("autodoc", "	:param T:
	:type T: HLRBRep_EdgeInterferenceTool &
	:param I:
	:type I: HLRAlgo_ListIteratorOfInterferenceList &
	:rtype: None
") HLRBRep_VertexList;
		 HLRBRep_VertexList (const HLRBRep_EdgeInterferenceTool & T,const HLRAlgo_ListIteratorOfInterferenceList & I);
		%feature("autodoc", "	* Returns True when the curve is periodic.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	* Returns True when there are more vertices.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Proceeds to the next vertex.

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns the current vertex

	:rtype: HLRAlgo_Intersection
") Current;
		const HLRAlgo_Intersection & Current ();
		%feature("autodoc", "	* Returns True if the current vertex is is on the boundary of the edge.

	:rtype: bool
") IsBoundary;
		Standard_Boolean IsBoundary ();
		%feature("autodoc", "	* Returns True if the current vertex is an interference.

	:rtype: bool
") IsInterference;
		Standard_Boolean IsInterference ();
		%feature("autodoc", "	* Returns the orientation of the current vertex if it is on the boundary of the edge.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	* Returns the transition of the current vertex if it is an interference.

	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "	* Returns the transition of the current vertex relative to the boundary if it is an interference.

	:rtype: TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();
};


%feature("shadow") HLRBRep_VertexList::~HLRBRep_VertexList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_VertexList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRBRep_Algo;
class HLRBRep_Algo : public HLRBRep_InternalAlgo {
	public:
		%feature("autodoc", "	* Constructs an empty framework for the calculation of visible and hidden lines of a shape in a projection. Use the function: - Projector to define the point of view - Add to select the shape or shapes to be visualized - Update to compute the outlines of the shape, and - Hide to compute the visible and hidden lines of the shape.

	:rtype: None
") HLRBRep_Algo;
		 HLRBRep_Algo ();
		%feature("autodoc", "	:param A:
	:type A: Handle_HLRBRep_Algo &
	:rtype: None
") HLRBRep_Algo;
		 HLRBRep_Algo (const Handle_HLRBRep_Algo & A);
		%feature("autodoc", "	* add the Shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param SData:
	:type SData: Handle_MMgt_TShared &
	:param nbIso: default value is 0
	:type nbIso: Standard_Integer
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & S,const Handle_MMgt_TShared & SData,const Standard_Integer nbIso = 0);
		%feature("autodoc", "	* Adds the shape S to this framework, and specifies the number of isoparameters nbiso desired in visualizing S. You may add as many shapes as you wish. Use the function Add once for each shape.

	:param S:
	:type S: TopoDS_Shape &
	:param nbIso: default value is 0
	:type nbIso: Standard_Integer
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & S,const Standard_Integer nbIso = 0);
		%feature("autodoc", "	* return the index of the Shape <S> and return 0 if the Shape <S> is not found.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "	* nullify all the results of OutLiner from HLRTopoBRep.

	:rtype: None
") OutLinedShapeNullify;
		void OutLinedShapeNullify ();
};


%feature("shadow") HLRBRep_Algo::~HLRBRep_Algo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRBRep_Algo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRBRep_Algo {
	Handle_HLRBRep_Algo GetHandle() {
	return *(Handle_HLRBRep_Algo*) &$self;
	}
};

%nodefaultctor Handle_HLRBRep_Algo;
class Handle_HLRBRep_Algo : public Handle_HLRBRep_InternalAlgo {

    public:
        // constructors
        Handle_HLRBRep_Algo();
        Handle_HLRBRep_Algo(const Handle_HLRBRep_Algo &aHandle);
        Handle_HLRBRep_Algo(const HLRBRep_Algo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRBRep_Algo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRBRep_Algo {
    HLRBRep_Algo* GetObject() {
    return (HLRBRep_Algo*)$self->Access();
    }
};
%feature("shadow") Handle_HLRBRep_Algo::~Handle_HLRBRep_Algo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRBRep_Algo {
    void _kill_pointed() {
        delete $self;
    }
};

