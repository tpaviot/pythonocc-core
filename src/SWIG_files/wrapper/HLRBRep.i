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
		%feature("autodoc", "Args:
	ec(HLRBRep_Curve)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static TopoDS_Edge

No detailed docstring for this function.") MakeEdge;
		static TopoDS_Edge MakeEdge (const HLRBRep_Curve & ec,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	ec(HLRBRep_Curve)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static TopoDS_Edge

No detailed docstring for this function.") MakeEdge3d;
		static TopoDS_Edge MakeEdge3d (const HLRBRep_Curve & ec,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	InAngl(Standard_Real)
	OutAngl(Standard_Real)
	OutDefl(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") PolyHLRAngleAndDeflection;
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
		%feature("autodoc", "Args:
	V(HLRAlgo_Intersection)
	Boundary(Standard_Boolean)
	Interference(Standard_Boolean)
	StateBefore(TopAbs_State)
	StateAfter(TopAbs_State)
	EdgeBefore(TopAbs_State)
	EdgeAfter(TopAbs_State)

Returns:
	None

The previous and next field are set to NULL.") HLRBRep_AreaLimit;
		 HLRBRep_AreaLimit (const HLRAlgo_Intersection & V,const Standard_Boolean Boundary,const Standard_Boolean Interference,const TopAbs_State StateBefore,const TopAbs_State StateAfter,const TopAbs_State EdgeBefore,const TopAbs_State EdgeAfter);
		%feature("autodoc", "Args:
	St(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") StateBefore;
		void StateBefore (const TopAbs_State St);
		%feature("autodoc", "Args:
	St(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") StateAfter;
		void StateAfter (const TopAbs_State St);
		%feature("autodoc", "Args:
	St(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") EdgeBefore;
		void EdgeBefore (const TopAbs_State St);
		%feature("autodoc", "Args:
	St(TopAbs_State)

Returns:
	None

No detailed docstring for this function.") EdgeAfter;
		void EdgeAfter (const TopAbs_State St);
		%feature("autodoc", "Args:
	P(Handle_HLRBRep_AreaLimit)

Returns:
	None

No detailed docstring for this function.") Previous;
		void Previous (const Handle_HLRBRep_AreaLimit & P);
		%feature("autodoc", "Args:
	N(Handle_HLRBRep_AreaLimit)

Returns:
	None

No detailed docstring for this function.") Next;
		void Next (const Handle_HLRBRep_AreaLimit & N);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Intersection

No detailed docstring for this function.") Vertex;
		const HLRAlgo_Intersection & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBoundary;
		Standard_Boolean IsBoundary ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsInterference;
		Standard_Boolean IsInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") StateBefore;
		TopAbs_State StateBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") StateAfter;
		TopAbs_State StateAfter ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") EdgeBefore;
		TopAbs_State EdgeBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

No detailed docstring for this function.") EdgeAfter;
		TopAbs_State EdgeAfter ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRBRep_AreaLimit

No detailed docstring for this function.") Previous;
		Handle_HLRBRep_AreaLimit Previous ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRBRep_AreaLimit

No detailed docstring for this function.") Next;
		Handle_HLRBRep_AreaLimit Next ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_Array1OfEData;
		 HLRBRep_Array1OfEData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(HLRBRep_EdgeData)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_Array1OfEData;
		 HLRBRep_Array1OfEData (const HLRBRep_EdgeData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(HLRBRep_EdgeData)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRBRep_EdgeData & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(HLRBRep_Array1OfEData)

Returns:
	HLRBRep_Array1OfEData

No detailed docstring for this function.") Assign;
		const HLRBRep_Array1OfEData & Assign (const HLRBRep_Array1OfEData & Other);
		%feature("autodoc", "Args:
	Other(HLRBRep_Array1OfEData)

Returns:
	HLRBRep_Array1OfEData

No detailed docstring for this function.") operator=;
		const HLRBRep_Array1OfEData & operator = (const HLRBRep_Array1OfEData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRBRep_EdgeData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRBRep_EdgeData & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRBRep_EdgeData

No detailed docstring for this function.") Value;
		const HLRBRep_EdgeData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRBRep_EdgeData

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_Array1OfFData;
		 HLRBRep_Array1OfFData (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(HLRBRep_FaceData)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_Array1OfFData;
		 HLRBRep_Array1OfFData (const HLRBRep_FaceData & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(HLRBRep_FaceData)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const HLRBRep_FaceData & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(HLRBRep_Array1OfFData)

Returns:
	HLRBRep_Array1OfFData

No detailed docstring for this function.") Assign;
		const HLRBRep_Array1OfFData & Assign (const HLRBRep_Array1OfFData & Other);
		%feature("autodoc", "Args:
	Other(HLRBRep_Array1OfFData)

Returns:
	HLRBRep_Array1OfFData

No detailed docstring for this function.") operator=;
		const HLRBRep_Array1OfFData & operator = (const HLRBRep_Array1OfFData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(HLRBRep_FaceData)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRBRep_FaceData & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRBRep_FaceData

No detailed docstring for this function.") Value;
		const HLRBRep_FaceData & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRBRep_FaceData

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(myclass) >= <S>") NbIntervals;
		static Standard_Integer NbIntervals (BRepAdaptor_Curve & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		static void Intervals (BRepAdaptor_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)

Returns:
	static gp_Pnt

Computes the point of parameter U on the curve.") Value;
		static gp_Pnt Value (const BRepAdaptor_Curve & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

Computes the point of parameter U on the curve.") D0;
		static void D0 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	static void

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		static void D1 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		static void D2 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		static void D3 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		static gp_Vec DN (const BRepAdaptor_Curve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	R3d(Standard_Real)

Returns:
	static Standard_Real

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		static Standard_Real Resolution (const BRepAdaptor_Curve & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
		static GeomAbs_CurveType GetType (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static gp_Lin

No detailed docstring for this function.") Line;
		static gp_Lin Line (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static gp_Circ

No detailed docstring for this function.") Circle;
		static gp_Circ Circle (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static gp_Elips

No detailed docstring for this function.") Ellipse;
		static gp_Elips Ellipse (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static gp_Hypr

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr Hyperbola (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static gp_Parab

No detailed docstring for this function.") Parabola;
		static gp_Parab Parabola (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierCurve Bezier (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Degree;
		static Standard_Integer Degree (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsRational;
		static Standard_Boolean IsRational (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbPoles;
		static Standard_Integer NbPoles (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbKnots;
		static Standard_Integer NbKnots (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	T(TColgp_Array1OfPnt)

Returns:
	static void

No detailed docstring for this function.") Poles;
		static void Poles (const BRepAdaptor_Curve & C,TColgp_Array1OfPnt & T);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	T(TColgp_Array1OfPnt)
	W(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") PolesAndWeights;
		static void PolesAndWeights (const BRepAdaptor_Curve & C,TColgp_Array1OfPnt & T,TColStd_Array1OfReal & W);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D ();
		%feature("autodoc", "Args:
	x1(Standard_Real)
	y1(Standard_Real)
	x2(Standard_Real)
	y2(Standard_Real)
	S(TopoDS_Shape)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") HLRBRep_BiPnt2D;
		 HLRBRep_BiPnt2D (const Standard_Real x1,const Standard_Real y1,const Standard_Real x2,const Standard_Real y2,const TopoDS_Shape & S,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") P1;
		const gp_Pnt2d & P1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") P2;
		const gp_Pnt2d & P2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Shape;
		void Shape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") OutLine;
		void OutLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IntLine;
		Standard_Boolean IntLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IntLine;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_BiPoint;
		 HLRBRep_BiPoint ();
		%feature("autodoc", "Args:
	x1(Standard_Real)
	y1(Standard_Real)
	z1(Standard_Real)
	x2(Standard_Real)
	y2(Standard_Real)
	z2(Standard_Real)
	S(TopoDS_Shape)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") HLRBRep_BiPoint;
		 HLRBRep_BiPoint (const Standard_Real x1,const Standard_Real y1,const Standard_Real z1,const Standard_Real x2,const Standard_Real y2,const Standard_Real z2,const TopoDS_Shape & S,const Standard_Boolean reg1,const Standard_Boolean regn,const Standard_Boolean outl,const Standard_Boolean intl);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") P1;
		const gp_Pnt & P1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") P2;
		const gp_Pnt & P2 ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Shape;
		void Shape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") OutLine;
		void OutLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IntLine;
		Standard_Boolean IntLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IntLine;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_CInter;
		 HLRBRep_CInter ();
		%feature("autodoc", "Args:
	C(Standard_Address)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Standard_Address)
	D(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C,const IntRes2d_Domain & D,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	C2(Standard_Address)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	D1(IntRes2d_Domain)
	C2(Standard_Address)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	C2(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	D1(IntRes2d_Domain)
	C2(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CInter;
		 HLRBRep_CInter (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	D1(IntRes2d_Domain)
	C2(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	C2(Standard_Address)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	D1(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Address & C1,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	D1(IntRes2d_Domain)
	C2(Standard_Address)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Address & C1,const IntRes2d_Domain & D1,const Standard_Address & C2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	C2(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Address & C1,const Standard_Address & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C1(Standard_Address)
	TolDomain(Standard_Real)

Returns:
	IntRes2d_Domain

No detailed docstring for this function.") ComputeDomain;
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
		%feature("autodoc", "Args:
	C(Standard_Address)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CLProps;
		 HLRBRep_CLProps (const Standard_Address & C,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U(Standard_Real)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CLProps;
		 HLRBRep_CLProps (const Standard_Address & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_CLProps;
		 HLRBRep_CLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameter;
		void SetParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	None

No detailed docstring for this function.") SetCurve;
		void SetCurve (const Standard_Address & C);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value;
		const gp_Pnt2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") D1;
		const gp_Vec2d & D1 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") D2;
		const gp_Vec2d & D2 ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec2d

No detailed docstring for this function.") D3;
		const gp_Vec2d & D3 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();
		%feature("autodoc", "Args:
	D(gp_Dir2d)

Returns:
	None

No detailed docstring for this function.") Tangent;
		void Tangent (gp_Dir2d & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Curvature;
		Standard_Real Curvature ();
		%feature("autodoc", "Args:
	N(gp_Dir2d)

Returns:
	None

No detailed docstring for this function.") Normal;
		void Normal (gp_Dir2d & N);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") CentreOfCurvature;
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
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static void

Computes the  point <P> of  parameter <U>   on the  
         Curve from HLRBRep <C>.") Value;
		static void Value (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	static void

Computes the point <P>  and  first derivative <V1>  
         of parameter <U> on the curve <C>.") D1;
		static void D1 (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

Computes the point <P>,  the first derivative <V1>  
         and second derivative <V2> of parameter <U> on the  
         curve <C>.") D2;
		static void D2 (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

Computes the point <P>, the first derivative <V1>,  
         the second derivative  <V2>   and third derivative  
         <V3> of parameter <U> on the curve <C>.") D3;
		static void D3 (const Standard_Address A,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	A(Standard_Address)

Returns:
	static Standard_Integer

returns the order  of continuity of the curve <C>.  
         returns 1 :  first  derivative only is  computable  
         returns 2  : first and  second derivative only are  
         computable.  returns  3 : first,  second and third  
         are computable.") Continuity;
		static Standard_Integer Continuity (const Standard_Address A);
		%feature("autodoc", "Args:
	A(Standard_Address)

Returns:
	static Standard_Real

returns the first parameter bound of the curve.") FirstParameter;
		static Standard_Real FirstParameter (const Standard_Address A);
		%feature("autodoc", "Args:
	A(Standard_Address)

Returns:
	static Standard_Real

returns the  last  parameter bound  of  the curve.  
         FirstParameter must be less than LastParamenter.") LastParameter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an undefined Curve.") HLRBRep_Curve;
		 HLRBRep_Curve ();
		%feature("autodoc", "Args:
	Proj(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Projector;
		void Projector (const Standard_Address Proj);
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Curve

Returns the 3D curve.") Curve;
		BRepAdaptor_Curve & Curve ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Sets the 3D curve to be projected.") Curve;
		void Curve (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Curve

Returns the 3D curve.") GetCurve;
		const BRepAdaptor_Curve & GetCurve ();
		%feature("autodoc", "Args:
	P3d(Standard_Real)

Returns:
	Standard_Real

Returns the parameter   on the 2d  curve  from the  
         parameter on the 3d curve.") Parameter2d;
		Standard_Real Parameter2d (const Standard_Real P3d);
		%feature("autodoc", "Args:
	P2d(Standard_Real)

Returns:
	Standard_Real

Returns the parameter   on the 3d  curve  from the  
         parameter on the 2d curve.") Parameter3d;
		Standard_Real Parameter3d (const Standard_Real P2d);
		%feature("autodoc", "Args:
	TotMin(Standard_Address)
	TotMax(Standard_Address)

Returns:
	Standard_Real

Update the minmax and the internal data") Update;
		Standard_Real Update (const Standard_Address TotMin,const Standard_Address TotMax);
		%feature("autodoc", "Args:
	TotMin(Standard_Address)
	TotMax(Standard_Address)

Returns:
	Standard_Real

Update the minmax returns tol for enlarge;") UpdateMinMax;
		Standard_Real UpdateMinMax (const Standard_Address TotMin,const Standard_Address TotMax);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Computes the Z    coordinate  of the  point  of  
 parameter U on the curve in the viewing coordinate system") Z;
		Standard_Real Z (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt

Computes the 3D point   of parameter U  on the  
 curve.") Value3D;
		gp_Pnt Value3D (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the 3D point   of parameter U  on the  
 curve.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter  U on the curve  
 with its first derivative.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	AtStart(Standard_Boolean)
	P(gp_Pnt2d)
	D(gp_Dir2d)

Returns:
	None

Depending on <AtStart> computes the 2D point and  
 tangent on the curve  at sart (or at  end).  If the  first  
 derivative is null look after  at start (or before at end)  
 with the second derivative.") Tangent;
		void Tangent (const Standard_Boolean AtStart,gp_Pnt2d & P,gp_Dir2d & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

If necessary,  breaks the  curve in  intervals  of  
         continuity  <S>.    And  returns   the number   of  
         intervals.") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Period;
		Standard_Real Period ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt2d

Computes the point of parameter U on the curve.") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	None

Computes the point of parameter U on the curve.") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	None

Computes the point  of  parameter U on the curve  
 with its first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	None

Raised if the continuity of the current interval  
 is not C2.") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	None

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec2d

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

No detailed docstring for this function.") Line;
		gp_Lin2d Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

No detailed docstring for this function.") Circle;
		gp_Circ2d Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips2d

No detailed docstring for this function.") Ellipse;
		gp_Elips2d Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		gp_Hypr2d Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab2d

No detailed docstring for this function.") Parabola;
		gp_Parab2d Parabola ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	TP(TColgp_Array1OfPnt2d)

Returns:
	None

No detailed docstring for this function.") Poles;
		void Poles (TColgp_Array1OfPnt2d & TP);
		%feature("autodoc", "Args:
	aCurve(Handle_Geom_BSplineCurve)
	TP(TColgp_Array1OfPnt2d)

Returns:
	None

No detailed docstring for this function.") Poles;
		void Poles (const Handle_Geom_BSplineCurve & aCurve,TColgp_Array1OfPnt2d & TP);
		%feature("autodoc", "Args:
	TP(TColgp_Array1OfPnt2d)
	TW(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") PolesAndWeights;
		void PolesAndWeights (TColgp_Array1OfPnt2d & TP,TColStd_Array1OfReal & TW);
		%feature("autodoc", "Args:
	aCurve(Handle_Geom_BSplineCurve)
	TP(TColgp_Array1OfPnt2d)
	TW(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") PolesAndWeights;
		void PolesAndWeights (const Handle_Geom_BSplineCurve & aCurve,TColgp_Array1OfPnt2d & TP,TColStd_Array1OfReal & TW);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	kn(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") Knots;
		void Knots (TColStd_Array1OfReal & kn);
		%feature("autodoc", "Args:
	mu(TColStd_Array1OfInteger)

Returns:
	None

No detailed docstring for this function.") Multiplicities;
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
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(myclass) >= <S>") NbIntervals;
		static Standard_Integer NbIntervals (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)
	T(TColStd_Array1OfReal)

Returns:
	static void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		static void Intervals (const Standard_Address C,TColStd_Array1OfReal & T);
		%feature("autodoc", "Args:
	C(Standard_Address)
	Index(Standard_Integer)
	Tab(TColStd_Array1OfReal)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static void

output the bounds of interval of index <Index>  
          used if Type == Composite.") GetInterval;
		static void GetInterval (const Standard_Address C,const Standard_Integer Index,const TColStd_Array1OfReal & Tab,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U(Standard_Real)

Returns:
	static gp_Pnt2d

Computes the point of parameter U on the curve.") Value;
		static gp_Pnt2d Value (const Standard_Address C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	static void

Computes the point of parameter U on the curve.") D0;
		static void D0 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	static void

Computes the point  of parameter U on the curve  
 with its first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		static void D1 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	static void

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		static void D2 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	static void

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		static void D3 (const Standard_Address C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec2d

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		static gp_Vec2d DN (const Standard_Address C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Standard_Address)
	R3d(Standard_Real)

Returns:
	static Standard_Real

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		static Standard_Real Resolution (const Standard_Address C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
		static GeomAbs_CurveType GetType (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") TheType;
		static GeomAbs_CurveType TheType (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Line;
		static gp_Lin2d Line (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static gp_Circ2d

No detailed docstring for this function.") Circle;
		static gp_Circ2d Circle (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static gp_Elips2d

No detailed docstring for this function.") Ellipse;
		static gp_Elips2d Ellipse (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr2d Hyperbola (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static gp_Parab2d

No detailed docstring for this function.") Parabola;
		static gp_Parab2d Parabola (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") EpsX;
		static Standard_Real EpsX (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Standard_Address C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Standard_Address C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Degree;
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
		%feature("autodoc", "Args:
	NV(Standard_Integer)
	NE(Standard_Integer)
	NF(Standard_Integer)

Returns:
	None

Create an  empty data structure  of <NV> vertices,  
         <NE> edges and <NF> faces.") HLRBRep_Data;
		 HLRBRep_Data (const Standard_Integer NV,const Standard_Integer NE,const Standard_Integer NF);
		%feature("autodoc", "Args:
	DS(Handle_HLRBRep_Data)
	dv(Standard_Integer)
	de(Standard_Integer)
	df(Standard_Integer)

Returns:
	None

Write <DS>    in   me  with   a     translation of  
         <dv>,<de>,<df>.") Write;
		void Write (const Handle_HLRBRep_Data & DS,const Standard_Integer dv,const Standard_Integer de,const Standard_Integer df);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_Array1OfEData

No detailed docstring for this function.") EDataArray;
		HLRBRep_Array1OfEData & EDataArray ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_Array1OfFData

No detailed docstring for this function.") FDataArray;
		HLRBRep_Array1OfFData & FDataArray ();
		%feature("autodoc", "Args:
	tol(Standard_ShortReal)

Returns:
	None

Set the  tolerance for the  rejections  during the  
         exploration") Tolerance;
		void Tolerance (const Standard_ShortReal tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

returns  the tolerance for the  rejections  during  
         the exploration") Tolerance;
		Standard_ShortReal Tolerance ();
		%feature("autodoc", "Args:
	P(HLRAlgo_Projector)

Returns:
	None

end of building  of the Data and updating  
         all the informations linked to the projection.") Update;
		void Update (const HLRAlgo_Projector & P);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Projector

No detailed docstring for this function.") Projector;
		HLRAlgo_Projector & Projector ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEdges;
		Standard_Integer NbEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbFaces;
		Standard_Integer NbFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") EdgeMap;
		TopTools_IndexedMapOfShape & EdgeMap ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") FaceMap;
		TopTools_IndexedMapOfShape & FaceMap ();
		%feature("autodoc", "Args:
	MinMaxTot(Standard_Address)
	e1(Standard_Integer)
	e2(Standard_Integer)

Returns:
	None

to compare with only non rejected edges.") InitBoundSort;
		void InitBoundSort (const Standard_Address MinMaxTot,const Standard_Integer e1,const Standard_Integer e2);
		%feature("autodoc", "Args:
	FI(Standard_Integer)
	MST(BRepTopAdaptor_MapOfShapeTool)

Returns:
	None

Begin an iteration only  on visible Edges  
         crossing the face number <FI>.") InitEdge;
		void InitEdge (const Standard_Integer FI,BRepTopAdaptor_MapOfShapeTool & MST);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	skip(Standard_Boolean)=Standard_True

Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge (const Standard_Boolean skip = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the  current Edge") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if   the  current edge to   be hidden  
         belongs to the hiding face.") HidingTheFace;
		Standard_Boolean HidingTheFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the current hiding face is not  an  
         auto-intersected one.") SimpleHidingFace;
		Standard_Boolean SimpleHidingFace ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Intersect  the current  Edge  with the boundary of  
         the hiding  face.   The interferences are given by  
         the More, Next, and Value methods.") InitInterference;
		void InitInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreInterference;
		Standard_Boolean MoreInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextInterference;
		void NextInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True if the  interference is rejected.") RejectedInterference;
		Standard_Boolean RejectedInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the rejected interference is above  
         the face.") AboveInterference;
		Standard_Boolean AboveInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Interference

No detailed docstring for this function.") Interference;
		HLRAlgo_Interference & Interference ();
		%feature("autodoc", "Args:
	Param(Standard_Real)
	Tg(gp_Dir2d)
	Nm(gp_Dir2d)
	Cu(Standard_Real)

Returns:
	None

Returns the local description of the projection of  
         the current LEdge  at parameter  <Param>.") LocalLEGeometry2D;
		void LocalLEGeometry2D (const Standard_Real Param,gp_Dir2d & Tg,gp_Dir2d & Nm,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	FE(Standard_Integer)
	Param(Standard_Real)
	Tg(gp_Dir2d)
	Nm(gp_Dir2d)
	Cu(Standard_Real)

Returns:
	None

Returns the local description of the projection of  
         the current FEdge  at parameter  <Param>.") LocalFEGeometry2D;
		void LocalFEGeometry2D (const Standard_Integer FE,const Standard_Real Param,gp_Dir2d & Tg,gp_Dir2d & Nm,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	p1(Standard_Real)
	p2(Standard_Real)
	stbef(TopAbs_State)
	staf(TopAbs_State)

Returns:
	None

Returns the local  3D   state of the  intersection  
         between the current edge and the current face at the  
         <p1> and <p2> parameters.") EdgeState;
		void EdgeState (const Standard_Real p1,const Standard_Real p2,TopAbs_State & stbef,TopAbs_State & staf);
		%feature("autodoc", "Args:
	E(Standard_Integer)
	EData(HLRBRep_EdgeData)

Returns:
	Standard_Boolean

Returns the  true if the  Edge <EData> belongs to the  
         Hiding Face.") EdgeOfTheHidingFace;
		Standard_Boolean EdgeOfTheHidingFace (const Standard_Integer E,const HLRBRep_EdgeData & EData);
		%feature("autodoc", "Args:
	E(Standard_Integer)
	EData(HLRBRep_EdgeData)
	IL(HLRAlgo_InterferenceList)

Returns:
	Standard_Integer

Returns the number of  levels of hiding face above  
         the   first  point  of   the    edge <EData>.     The  
         InterferenceList is  given to  compute far away of  
         the Interferences and then come back.") HidingStartLevel;
		Standard_Integer HidingStartLevel (const Standard_Integer E,const HLRBRep_EdgeData & EData,const HLRAlgo_InterferenceList & IL);
		%feature("autodoc", "Args:
	E(Standard_Integer)
	EData(HLRBRep_EdgeData)

Returns:
	TopAbs_State

Returns   the  state   of  the   Edge  <EData>  after  
         classification.") Compare;
		TopAbs_State Compare (const Standard_Integer E,const HLRBRep_EdgeData & EData);
		%feature("autodoc", "Args:
	E(Standard_Integer)
	EData(HLRBRep_EdgeData)
	Nbp(Standard_Integer)
	p1(Standard_Real)
	p2(Standard_Real)

Returns:
	TopAbs_State

Simple classification of part of edge  [p1,  p2]  
 returns  OUT  if  at  least  1 of  Nbp  points  of  edge  is  out  
 othewise  returns  IN  
 It  is  used  to  check  'suspision'  hided  part  of  edge.") SimplClassify;
		TopAbs_State SimplClassify (const Standard_Integer E,const HLRBRep_EdgeData & EData,const Standard_Integer Nbp,const Standard_Real p1,const Standard_Real p2);
		%feature("autodoc", "Args:
	E(Standard_Integer)
	EData(HLRBRep_EdgeData)
	LevelFlag(Standard_Boolean)
	Level(Standard_Integer)
	param(Standard_Real)

Returns:
	TopAbs_State

Classification of an edge.") Classify;
		TopAbs_State Classify (const Standard_Integer E,const HLRBRep_EdgeData & EData,const Standard_Boolean LevelFlag,Standard_Integer &OutValue,const Standard_Real param);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
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
		%feature("autodoc", "Args:
	VList(HLRBRep_VertexList)

Returns:
	None

Creates  an   EdgeBuilder    algorithm.    <VList>  
         describes   the edge    and  the    interferences.  
         AreaLimits   are   created  from   the   vertices.  
         Builds(IN) is automatically called.") HLRBRep_EdgeBuilder;
		 HLRBRep_EdgeBuilder (HLRBRep_VertexList & VList);
		%feature("autodoc", "Args:
	None
Returns:
	None

Initialize an iteration on the areas.") InitAreas;
		void InitAreas ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Set the current area to the next area.") NextArea;
		void NextArea ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Set the current area to the previous area.") PreviousArea;
		void PreviousArea ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a current area.") HasArea;
		Standard_Boolean HasArea ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the state of the current area.") AreaState;
		TopAbs_State AreaState ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the edge state of the current area.") AreaEdgeState;
		TopAbs_State AreaEdgeState ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRBRep_AreaLimit

Returns the  AreaLimit beginning the current area.  
         This is a NULL handle when the area is infinite on  
         the left.") LeftLimit;
		Handle_HLRBRep_AreaLimit LeftLimit ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRBRep_AreaLimit

Returns the  AreaLimit   ending  the current area.  
         This is a NULL handle when the area is infinite on  
         the right.") RightLimit;
		Handle_HLRBRep_AreaLimit RightLimit ();
		%feature("autodoc", "Args:
	ToBuild(TopAbs_State)

Returns:
	None

Reinitialize  the results  iteration  to the parts  
         with State <ToBuild>. If this method is not called  
         after construction the default is <ToBuild> = IN.") Builds;
		void Builds (const TopAbs_State ToBuild);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there are more new edges to build.") MoreEdges;
		Standard_Boolean MoreEdges ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Proceeds  to  the  next  edge to  build.  Skip all  
         remaining vertices on the current edge.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if there are more vertices in the current new  
         edge.") MoreVertices;
		Standard_Boolean MoreVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Proceeds to the next vertex of the current edge.") NextVertex;
		void NextVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Intersection

Returns the current vertex of the current edge.") Current;
		const HLRAlgo_Intersection & Current ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the  current vertex comes from the  
         boundary of the edge.") IsBoundary;
		Standard_Boolean IsBoundary ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True if    the  current  vertex  was   an  
         interference.") IsInterference;
		Standard_Boolean IsInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the new orientation of the current vertex.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_EdgeData;
		 HLRBRep_EdgeData ();
		%feature("autodoc", "Args:
	Reg1(Standard_Boolean)
	RegN(Standard_Boolean)
	EG(TopoDS_Edge)
	V1(Standard_Integer)
	V2(Standard_Integer)
	Out1(Standard_Boolean)
	Out2(Standard_Boolean)
	Cut1(Standard_Boolean)
	Cut2(Standard_Boolean)
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Standard_Boolean Reg1,const Standard_Boolean RegN,const TopoDS_Edge & EG,const Standard_Integer V1,const Standard_Integer V2,const Standard_Boolean Out1,const Standard_Boolean Out2,const Standard_Boolean Cut1,const Standard_Boolean Cut2,const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Selected;
		Standard_Boolean Selected ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Selected;
		void Selected (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Rg1Line;
		Standard_Boolean Rg1Line ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Rg1Line;
		void Rg1Line (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") RgNLine;
		Standard_Boolean RgNLine ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") RgNLine;
		void RgNLine (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Vertical;
		Standard_Boolean Vertical ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Vertical;
		void Vertical (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Simple;
		Standard_Boolean Simple ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Simple;
		void Simple (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OutLVSta;
		Standard_Boolean OutLVSta ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") OutLVSta;
		void OutLVSta (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OutLVEnd;
		Standard_Boolean OutLVEnd ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") OutLVEnd;
		void OutLVEnd (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CutAtSta;
		Standard_Boolean CutAtSta ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") CutAtSta;
		void CutAtSta (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") CutAtEnd;
		Standard_Boolean CutAtEnd ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") CutAtEnd;
		void CutAtEnd (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") VerAtSta;
		Standard_Boolean VerAtSta ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") VerAtSta;
		void VerAtSta (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") VerAtEnd;
		Standard_Boolean VerAtEnd ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") VerAtEnd;
		void VerAtEnd (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AutoIntersectionDone;
		Standard_Boolean AutoIntersectionDone ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") AutoIntersectionDone;
		void AutoIntersectionDone (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Used;
		Standard_Boolean Used ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Used;
		void Used (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") HideCount;
		Standard_Integer HideCount ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HideCount;
		void HideCount (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VSta;
		Standard_Integer VSta ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") VSta;
		void VSta (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VEnd;
		Standard_Integer VEnd ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") VEnd;
		void VEnd (const Standard_Integer I);
		%feature("autodoc", "Args:
	TotMinMax(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") MinMax;
		Standard_Address MinMax ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_EdgeStatus

No detailed docstring for this function.") Status;
		HLRAlgo_EdgeStatus & Status ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_Curve

No detailed docstring for this function.") ChangeGeometry;
		HLRBRep_Curve & ChangeGeometry ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_Curve

No detailed docstring for this function.") Geometry;
		const HLRBRep_Curve & Geometry ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") Curve;
		Standard_Address Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Tolerance;
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
		%feature("autodoc", "Args:
	F(Standard_Address)
	U(Standard_Real)
	V(Standard_Real)
	Tg(gp_Dir)

Returns:
	static Standard_Real

No detailed docstring for this function.") CurvatureValue;
		static Standard_Real CurvatureValue (const Standard_Address F,const Standard_Real U,const Standard_Real V,const gp_Dir & Tg);
		%feature("autodoc", "Args:
	Par(Standard_Real)
	E(Standard_Address)
	F(Standard_Address)
	U(Standard_Real)
	V(Standard_Real)

Returns:
	static Standard_Boolean

return True if U and V are found.") UVPoint;
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
		%feature("autodoc", "Args:
	IL(HLRAlgo_InterferenceList)
	I(HLRAlgo_Interference)
	T(HLRBRep_EdgeInterferenceTool)

Returns:
	static void

Add the interference <I> to the list <IL>.") AddInterference;
		static void AddInterference (HLRAlgo_InterferenceList & IL,const HLRAlgo_Interference & I,const HLRBRep_EdgeInterferenceTool & T);
		%feature("autodoc", "Args:
	IL(HLRAlgo_InterferenceList)
	T(HLRBRep_EdgeInterferenceTool)

Returns:
	static void

Process complex transitions on the list IL.") ProcessComplex;
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
		%feature("autodoc", "Args:
	DS(Handle_HLRBRep_Data)

Returns:
	None

No detailed docstring for this function.") HLRBRep_EdgeInterferenceTool;
		 HLRBRep_EdgeInterferenceTool (const Handle_HLRBRep_Data & DS);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") LoadEdge;
		void LoadEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitVertices;
		void InitVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreVertices;
		Standard_Boolean MoreVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextVertex;
		void NextVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Intersection

No detailed docstring for this function.") CurrentVertex;
		const HLRAlgo_Intersection & CurrentVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") CurrentOrientation;
		TopAbs_Orientation CurrentOrientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") CurrentParameter;
		Standard_Real CurrentParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	Param(Standard_Real)
	Tgt(gp_Dir)
	Nrm(gp_Dir)
	Curv(Standard_Real)

Returns:
	None

Returns local geometric description of the Edge at  
         parameter   <Para>.  See  method  Reset  of  class  
         EdgeFaceTransition from TopCnx for other arguments.") EdgeGeometry;
		void EdgeGeometry (const Standard_Real Param,gp_Dir & Tgt,gp_Dir & Nrm,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)

Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOfInterference;
		Standard_Real ParameterOfInterference (const HLRAlgo_Interference & I);
		%feature("autodoc", "Args:
	I1(HLRAlgo_Interference)
	I2(HLRAlgo_Interference)

Returns:
	Standard_Boolean

True if   the  two interferences are on   the same  
         geometric locus.") SameInterferences;
		Standard_Boolean SameInterferences (const HLRAlgo_Interference & I1,const HLRAlgo_Interference & I2);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)

Returns:
	Standard_Boolean

True if the  Interference and the  current  Vertex  
         are on the same geometric locus.") SameVertexAndInterference;
		Standard_Boolean SameVertexAndInterference (const HLRAlgo_Interference & I);
		%feature("autodoc", "Args:
	I(HLRAlgo_Interference)
	Tang(gp_Dir)
	Norm(gp_Dir)
	Curv(Standard_Real)

Returns:
	None

Returns   the  geometry of  the   boundary  at the  
         interference  <I>.  See the AddInterference method  
         of the class  EdgeFaceTransition  from  TopCnx for  
         the other arguments.") InterferenceBoundaryGeometry;
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
		%feature("autodoc", "Args:
	C1(Standard_Address)
	C2(Standard_Address)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ExactIntersectionPointOfTheIntPCurvePCurveOfCInter (const Standard_Address & C1,const Standard_Address & C2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Poly1(HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter)
	Poly2(HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter)
	NumSegOn1(Standard_Integer)
	NumSegOn2(Standard_Integer)
	ParamOnSeg1(Standard_Real)
	ParamOnSeg2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly1,const HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter & Poly2,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Uo(Standard_Real)
	Vo(Standard_Real)
	UInf(Standard_Real)
	VInf(Standard_Real)
	USup(Standard_Real)
	VSup(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real Uo,const Standard_Real Vo,const Standard_Real UInf,const Standard_Real VInf,const Standard_Real USup,const Standard_Real VSup);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Roots;
		void Roots (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AnErrorOccurred;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_FaceData;
		 HLRBRep_FaceData ();
		%feature("autodoc", "Args:
	FG(TopoDS_Face)
	Or(TopAbs_Orientation)
	Cl(Standard_Boolean)
	NW(Standard_Integer)

Returns:
	None

<Or> is the orientation of the face.  <Cl> is true  
         if the face  belongs to a  closed  volume. <NW> is  
         the number of wires ( or block  of  edges ) of the  
         face.") Set;
		void Set (const TopoDS_Face & FG,const TopAbs_Orientation Or,const Standard_Boolean Cl,const Standard_Integer NW);
		%feature("autodoc", "Args:
	WI(Standard_Integer)
	NE(Standard_Integer)

Returns:
	None

Set <NE> the number  of  edges of the wire  number  
         <WI>.") SetWire;
		void SetWire (const Standard_Integer WI,const Standard_Integer NE);
		%feature("autodoc", "Args:
	WI(Standard_Integer)
	EWI(Standard_Integer)
	EI(Standard_Integer)
	Or(TopAbs_Orientation)
	OutL(Standard_Boolean)
	Inte(Standard_Boolean)
	Dble(Standard_Boolean)
	IsoL(Standard_Boolean)

Returns:
	None

Set the edge number <EWI> of the  wire <WI>.") SetWEdge;
		void SetWEdge (const Standard_Integer WI,const Standard_Integer EWI,const Standard_Integer EI,const TopAbs_Orientation Or,const Standard_Boolean OutL,const Standard_Boolean Inte,const Standard_Boolean Dble,const Standard_Boolean IsoL);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Selected;
		Standard_Boolean Selected ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Selected;
		void Selected (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Back;
		Standard_Boolean Back ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Back;
		void Back (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Side;
		Standard_Boolean Side ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Side;
		void Side (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Closed;
		void Closed (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Hiding;
		Standard_Boolean Hiding ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Hiding;
		void Hiding (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Simple;
		Standard_Boolean Simple ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Simple;
		void Simple (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Cut;
		Standard_Boolean Cut ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Cut;
		void Cut (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") WithOutL;
		Standard_Boolean WithOutL ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") WithOutL;
		void WithOutL (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Plane;
		Standard_Boolean Plane ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Plane;
		void Plane (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Cylinder;
		Standard_Boolean Cylinder ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Cylinder;
		void Cylinder (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Cone;
		Standard_Boolean Cone ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Cone;
		void Cone (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Sphere;
		Standard_Boolean Sphere ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Sphere;
		void Sphere (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Torus;
		Standard_Boolean Torus ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Torus;
		void Torus (const Standard_Boolean B);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Size;
		Standard_Real Size ();
		%feature("autodoc", "Args:
	S(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Size;
		void Size (const Standard_Real S);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	O(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Orientation;
		void Orientation (const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRAlgo_WiresBlock

No detailed docstring for this function.") Wires;
		Handle_HLRAlgo_WiresBlock & Wires ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_Surface

No detailed docstring for this function.") Geometry;
		HLRBRep_Surface & Geometry ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") Tolerance;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_FaceIterator;
		 HLRBRep_FaceIterator ();
		%feature("autodoc", "Args:
	fd(HLRBRep_FaceData)

Returns:
	None

Begin an exploration of the edges of the face <fd>") InitEdge;
		void InitEdge (HLRBRep_FaceData & fd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the current edge is the first of a  
         wire.") BeginningOfWire;
		Standard_Boolean BeginningOfWire ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the current edge is the  last of a  
         wire.") EndOfWire;
		Standard_Boolean EndOfWire ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Skip the current wire in the exploration.") SkipWire;
		void SkipWire ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRAlgo_EdgesBlock

Returns the edges of the current wire.") Wire;
		Handle_HLRAlgo_EdgesBlock Wire ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Edge;
		Standard_Integer Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") OutLine;
		Standard_Boolean OutLine ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Internal;
		Standard_Boolean Internal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Double;
		Standard_Boolean Double ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsoLine;
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
		%feature("autodoc", "Args:
	A(Handle_HLRBRep_Algo)

Returns:
	None

Constructs a framework for filtering the  
results of the HLRBRep_Algo algorithm, A.  
Use the extraction filters to obtain the results you want for A.") HLRBRep_HLRToShape;
		 HLRBRep_HLRToShape (const Handle_HLRBRep_Algo & A);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") VCompound;
		TopoDS_Shape VCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") VCompound;
		TopoDS_Shape VCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLineVCompound;
		TopoDS_Shape OutLineVCompound ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLineVCompound3d;
		TopoDS_Shape OutLineVCompound3d ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLineVCompound;
		TopoDS_Shape OutLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") IsoLineVCompound;
		TopoDS_Shape IsoLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") HCompound;
		TopoDS_Shape HCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") HCompound;
		TopoDS_Shape HCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLineHCompound;
		TopoDS_Shape OutLineHCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLineHCompound;
		TopoDS_Shape OutLineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") IsoLineHCompound;
		TopoDS_Shape IsoLineHCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") IsoLineHCompound;
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
		%feature("autodoc", "Args:
	DS(Handle_HLRBRep_Data)

Returns:
	None

Creates a Hider processing  the set  of  Edges and  
         hiding faces described by <DS>.  Stores the hidden  
         parts in <DS>.") HLRBRep_Hider;
		 HLRBRep_Hider (const Handle_HLRBRep_Data & DS);
		%feature("autodoc", "Args:
	FI(Standard_Integer)

Returns:
	None

own hiding the side face number <FI>.") OwnHiding;
		void OwnHiding (const Standard_Integer FI);
		%feature("autodoc", "Args:
	FI(Standard_Integer)
	MST(BRepTopAdaptor_MapOfShapeTool)

Returns:
	None

Removes from the edges,   the parts hidden by  the  
         hiding face number <FI>.") Hide;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_IntConicCurveOfCInter;
		 HLRBRep_IntConicCurveOfCInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_InterCSurf;
		 HLRBRep_InterCSurf ();
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	Surface(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & Curve,const Standard_Address & Surface);
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	Polygon(HLRBRep_ThePolygonOfInterCSurf)
	Surface(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & Polygon,const Standard_Address & Surface);
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	ThePolygon(HLRBRep_ThePolygonOfInterCSurf)
	Surface(Standard_Address)
	Polyhedron(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & ThePolygon,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron);
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	ThePolygon(HLRBRep_ThePolygonOfInterCSurf)
	Surface(Standard_Address)
	Polyhedron(HLRBRep_ThePolyhedronOfInterCSurf)
	BndBSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & Curve,const HLRBRep_ThePolygonOfInterCSurf & ThePolygon,const Standard_Address & Surface,const HLRBRep_ThePolyhedronOfInterCSurf & Polyhedron,Bnd_BoundSortBox & BndBSB);
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	Surface(Standard_Address)
	Polyhedron(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") Perform;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo ();
		%feature("autodoc", "Args:
	A(Handle_HLRBRep_InternalAlgo)

Returns:
	None

No detailed docstring for this function.") HLRBRep_InternalAlgo;
		 HLRBRep_InternalAlgo (const Handle_HLRBRep_InternalAlgo & A);
		%feature("autodoc", "Args:
	P(HLRAlgo_Projector)

Returns:
	None

set the projector.") Projector;
		void Projector (const HLRAlgo_Projector & P);
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Projector

set the projector.") Projector;
		HLRAlgo_Projector & Projector ();
		%feature("autodoc", "Args:
	None
Returns:
	None

update the DataStructure.") Update;
		void Update ();
		%feature("autodoc", "Args:
	S(Handle_HLRTopoBRep_OutLiner)
	SData(Handle_MMgt_TShared)
	nbIso(Standard_Integer)=0

Returns:
	None

add the shape <S>.") Load;
		void Load (const Handle_HLRTopoBRep_OutLiner & S,const Handle_MMgt_TShared & SData,const Standard_Integer nbIso = 0);
		%feature("autodoc", "Args:
	S(Handle_HLRTopoBRep_OutLiner)
	nbIso(Standard_Integer)=0

Returns:
	None

add the shape <S>.") Load;
		void Load (const Handle_HLRTopoBRep_OutLiner & S,const Standard_Integer nbIso = 0);
		%feature("autodoc", "Args:
	S(Handle_HLRTopoBRep_OutLiner)

Returns:
	Standard_Integer

return the index of the Shape <S> and  return 0 if  
         the Shape <S> is not found.") Index;
		Standard_Integer Index (const Handle_HLRTopoBRep_OutLiner & S);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

remove the Shape of Index <I>.") Remove;
		void Remove (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	SData(Handle_MMgt_TShared)

Returns:
	None

Change the Shape Data of the Shape of index <I>.") ShapeData;
		void ShapeData (const Standard_Integer I,const Handle_MMgt_TShared & SData);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_SeqOfShapeBounds

No detailed docstring for this function.") SeqOfShapeBounds;
		HLRBRep_SeqOfShapeBounds & SeqOfShapeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	HLRBRep_ShapeBounds

No detailed docstring for this function.") ShapeBounds;
		HLRBRep_ShapeBounds & ShapeBounds (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

init the status of the selected edges depending of  
         the back faces of a closed shell.") InitEdgeStatus;
		void InitEdgeStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	None

select all the DataStructure.") Select;
		void Select ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

select  only   the Shape of index <I>.") Select;
		void Select (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

select only the edges of the Shape <S>.") SelectEdge;
		void SelectEdge (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

select only the faces of the Shape <S>.") SelectFace;
		void SelectFace (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

set to visible all the edges.") ShowAll;
		void ShowAll ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

set to visible all the edges of the Shape <S>.") ShowAll;
		void ShowAll (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

set to hide all the edges.") HideAll;
		void HideAll ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

set to  hide all the  edges of the  Shape <S>.") HideAll;
		void HideAll (const Standard_Integer I);
		%feature("autodoc", "Args:
	None
Returns:
	None

own hiding  of all the shapes of the DataStructure  
         without hiding by each other.") PartialHide;
		void PartialHide ();
		%feature("autodoc", "Args:
	None
Returns:
	None

hide all the DataStructure.") Hide;
		void Hide ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

hide the Shape <S> by itself.") Hide;
		void Hide (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)
	J(Standard_Integer)

Returns:
	None

hide the Shape <S1> by the shape <S2>.") Hide;
		void Hide (const Standard_Integer I,const Standard_Integer J);
		%feature("autodoc", "Args:
	deb(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Debug;
		void Debug (const Standard_Boolean deb);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Debug;
		Standard_Boolean Debug ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRBRep_Data

No detailed docstring for this function.") DataStructure;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_Intersector;
		 HLRBRep_Intersector ();
		%feature("autodoc", "Args:
	A1(Standard_Address)
	da1(Standard_Real)
	db1(Standard_Real)

Returns:
	None

Performs the auto  intersection  of  an edge. The  
         edge domain is cutted at start with da1*(b-a) and  
         at end with db1*(b-a).") Perform;
		void Perform (const Standard_Address A1,const Standard_Real da1,const Standard_Real db1);
		%feature("autodoc", "Args:
	nA(Standard_Integer)
	A1(Standard_Address)
	da1(Standard_Real)
	db1(Standard_Real)
	nB(Standard_Integer)
	A2(Standard_Address)
	da2(Standard_Real)
	db2(Standard_Real)
	NoBound(Standard_Boolean)

Returns:
	None

Performs the  intersection between the two edges.  
         The  edges  domains  are  cutted  at  start  with  
         da*(b-a) and at end with db*(b-a).") Perform;
		void Perform (const Standard_Integer nA,const Standard_Address A1,const Standard_Real da1,const Standard_Real db1,const Standard_Integer nB,const Standard_Address A2,const Standard_Real da2,const Standard_Real db2,const Standard_Boolean NoBound);
		%feature("autodoc", "Args:
	A1(Standard_Address)
	U(Standard_Real)
	A2(Standard_Address)
	V(Standard_Real)

Returns:
	None

Create a single IntersectionPoint (U on A1) (V on A2)  
         The point is middle on both curves.") SimulateOnePoint;
		void SimulateOnePoint (const Standard_Address A1,const Standard_Real U,const Standard_Address A2,const Standard_Real V);
		%feature("autodoc", "Args:
	A(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (Standard_Address & A);
		%feature("autodoc", "Args:
	L(gp_Lin)
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & L,const Standard_Real P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") Point;
		const IntRes2d_IntersectionPoint & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") CSPoint;
		const IntCurveSurface_IntersectionPoint & CSPoint (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntRes2d_IntersectionSegment

No detailed docstring for this function.") Segment;
		const IntRes2d_IntersectionSegment & Segment (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionSegment

No detailed docstring for this function.") CSSegment;
		const IntCurveSurface_IntersectionSegment & CSSegment (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
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
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

If necessary,   breaks the line  in  intervals of  
         continuity <S>.     And   returns  the  number  of  
         intervals.") NbIntervals;
		static Standard_Integer NbIntervals (const gp_Lin & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(gp_Lin)
	T(TColStd_Array1OfReal)
	Sh(GeomAbs_Shape)

Returns:
	static void

Sets the current working interval.") Intervals;
		static void Intervals (const gp_Lin & C,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Real

Returns  the  first  parameter    of  the  current  
         interval.") IntervalFirst;
		static Standard_Real IntervalFirst (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Real

Returns  the  last  parameter    of  the  current  
         interval.") IntervalLast;
		static Standard_Real IntervalLast (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") IntervalContinuity;
		static GeomAbs_Shape IntervalContinuity (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U(Standard_Real)

Returns:
	static gp_Pnt

Computes the point of parameter U on the line.") Value;
		static gp_Pnt Value (const gp_Lin & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

Computes the point of parameter U on the line.") D0;
		static void D0 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	static void

Computes the point of parameter U on the line with its  
 first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		static void D1 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		static void D2 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		static void D3 (const gp_Lin & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		static gp_Vec DN (const gp_Lin & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(gp_Lin)
	R3d(Standard_Real)

Returns:
	static Standard_Real

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		static Standard_Real Resolution (const gp_Lin & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static GeomAbs_CurveType

Returns  the  type of the   line  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
		static GeomAbs_CurveType GetType (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static gp_Lin

No detailed docstring for this function.") Line;
		static gp_Lin Line (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static gp_Circ

No detailed docstring for this function.") Circle;
		static gp_Circ Circle (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static gp_Elips

No detailed docstring for this function.") Ellipse;
		static gp_Elips Ellipse (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static gp_Hypr

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr Hyperbola (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static gp_Parab

No detailed docstring for this function.") Parabola;
		static gp_Parab Parabola (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierCurve Bezier (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Degree;
		static Standard_Integer Degree (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbPoles;
		static Standard_Integer NbPoles (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)
	TP(TColgp_Array1OfPnt)

Returns:
	static void

No detailed docstring for this function.") Poles;
		static void Poles (const gp_Lin & C,TColgp_Array1OfPnt & TP);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsRational;
		static Standard_Boolean IsRational (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)
	TP(TColgp_Array1OfPnt)
	TW(TColStd_Array1OfReal)

Returns:
	static void

No detailed docstring for this function.") PolesAndWeights;
		static void PolesAndWeights (const gp_Lin & C,TColgp_Array1OfPnt & TP,TColStd_Array1OfReal & TW);
		%feature("autodoc", "Args:
	C(gp_Lin)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbKnots;
		static Standard_Integer NbKnots (const gp_Lin & C);
		%feature("autodoc", "Args:
	C(gp_Lin)
	TK(TColStd_Array1OfReal)
	TM(TColStd_Array1OfInteger)

Returns:
	static void

No detailed docstring for this function.") KnotsAndMultiplicities;
		static void KnotsAndMultiplicities (const gp_Lin & C,TColStd_Array1OfReal & TK,TColStd_Array1OfInteger & TM);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const gp_Lin & C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "Args:
	C(gp_Lin)
	U0(Standard_Real)
	U1(Standard_Real)
	Defl(Standard_Real)
	NbMin(Standard_Integer)
	Pars(Handle_TColStd_HArray1OfReal)

Returns:
	static void

No detailed docstring for this function.") SamplePars;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_ListIteratorOfListOfBPnt2D;
		 HLRBRep_ListIteratorOfListOfBPnt2D ();
		%feature("autodoc", "Args:
	L(HLRBRep_ListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ListIteratorOfListOfBPnt2D;
		 HLRBRep_ListIteratorOfListOfBPnt2D (const HLRBRep_ListOfBPnt2D & L);
		%feature("autodoc", "Args:
	L(HLRBRep_ListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const HLRBRep_ListOfBPnt2D & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPnt2D

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_ListIteratorOfListOfBPoint;
		 HLRBRep_ListIteratorOfListOfBPoint ();
		%feature("autodoc", "Args:
	L(HLRBRep_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ListIteratorOfListOfBPoint;
		 HLRBRep_ListIteratorOfListOfBPoint (const HLRBRep_ListOfBPoint & L);
		%feature("autodoc", "Args:
	L(HLRBRep_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const HLRBRep_ListOfBPoint & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPoint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(HLRBRep_BiPnt2D)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ListNodeOfListOfBPnt2D;
		 HLRBRep_ListNodeOfListOfBPnt2D (const HLRBRep_BiPnt2D & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPnt2D

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(HLRBRep_BiPoint)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ListNodeOfListOfBPoint;
		 HLRBRep_ListNodeOfListOfBPoint (const HLRBRep_BiPoint & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPoint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_ListOfBPnt2D;
		 HLRBRep_ListOfBPnt2D ();
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(HLRBRep_BiPnt2D)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRBRep_BiPnt2D & I);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPnt2D)
	theIt(HLRBRep_ListIteratorOfListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & theIt);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPnt2D)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRBRep_BiPnt2D & I);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPnt2D)
	theIt(HLRBRep_ListIteratorOfListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & theIt);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HLRBRep_ListOfBPnt2D & Other);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPnt2D

No detailed docstring for this function.") First;
		HLRBRep_BiPnt2D & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPnt2D

No detailed docstring for this function.") Last;
		HLRBRep_BiPnt2D & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(HLRBRep_ListIteratorOfListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPnt2D)
	It(HLRBRep_ListIteratorOfListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPnt2D)
	It(HLRBRep_ListIteratorOfListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (HLRBRep_ListOfBPnt2D & Other,HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPnt2D)
	It(HLRBRep_ListIteratorOfListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const HLRBRep_BiPnt2D & I,HLRBRep_ListIteratorOfListOfBPnt2D & It);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPnt2D)
	It(HLRBRep_ListIteratorOfListOfBPnt2D)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_ListOfBPoint;
		 HLRBRep_ListOfBPoint ();
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(HLRBRep_BiPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRBRep_BiPoint & I);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPoint)
	theIt(HLRBRep_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRBRep_BiPoint & I);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPoint)
	theIt(HLRBRep_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & theIt);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HLRBRep_ListOfBPoint & Other);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPoint

No detailed docstring for this function.") First;
		HLRBRep_BiPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_BiPoint

No detailed docstring for this function.") Last;
		HLRBRep_BiPoint & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(HLRBRep_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPoint)
	It(HLRBRep_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPoint)
	It(HLRBRep_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (HLRBRep_ListOfBPoint & Other,HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	I(HLRBRep_BiPoint)
	It(HLRBRep_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const HLRBRep_BiPoint & I,HLRBRep_ListIteratorOfListOfBPoint & It);
		%feature("autodoc", "Args:
	Other(HLRBRep_ListOfBPoint)
	It(HLRBRep_ListIteratorOfListOfBPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	IT(IntCurve_IConicTool)
	PC(Standard_Address)

Returns:
	None

No detailed docstring for this function.") HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_MyImpParToolOfTheIntersectorOfTheIntConicCurveOfCInter (const IntCurve_IConicTool & IT,const Standard_Address & PC);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Standard_Address)

Returns:
	None

No detailed docstring for this function.") HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_PCLocFOfTheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C);
		%feature("autodoc", "Args:
	C(Standard_Address)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Standard_Address & C);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetPoint;
		void SetPoint (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real U,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	F(Standard_Real)
	DF(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbExt;
		Standard_Integer NbExt ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin (const Standard_Integer N);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
		const Extrema_POnCurv2d & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	theUfirst(Standard_Real)
	theUlast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SubIntervalInitialize;
		void SubIntervalInitialize (const Standard_Real theUfirst,const Standard_Real theUlast);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SearchOfTolerance;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework for the  
calculation of the visible and hidden lines of a shape in a projection.  
Use the functions:  
-   Projector to define the point of view  
-   Load to select the shape or shapes to be  visualized  
-   Update to compute the visible and hidden lines of the shape.  
  Warning  
The shape or shapes to be visualized must have already been triangulated.") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo ();
		%feature("autodoc", "Args:
	A(Handle_HLRBRep_PolyAlgo)

Returns:
	None

No detailed docstring for this function.") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo (const Handle_HLRBRep_PolyAlgo & A);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") HLRBRep_PolyAlgo;
		 HLRBRep_PolyAlgo (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		TopoDS_Shape & Shape (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	None

remove the Shape of Index <I>.") Remove;
		void Remove (const Standard_Integer I);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

return the index of the Shape <S> and  return 0 if  
         the Shape <S> is not found.") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Loads the shape S into this framework.  
Warning S must have already been triangulated.") Load;
		void Load (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRAlgo_PolyAlgo

No detailed docstring for this function.") Algo;
		Handle_HLRAlgo_PolyAlgo Algo ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Projector

Sets the parameters of the view for this framework.  
These parameters are defined by an HLRAlgo_Projector object,  
which is returned by the Projector function on a Prs3d_Projector object.") Projector;
		const HLRAlgo_Projector & Projector ();
		%feature("autodoc", "Args:
	P(HLRAlgo_Projector)

Returns:
	None

No detailed docstring for this function.") Projector;
		void Projector (const HLRAlgo_Projector & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Angle;
		Standard_Real Angle ();
		%feature("autodoc", "Args:
	Ang(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Angle;
		void Angle (const Standard_Real Ang);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TolAngular;
		Standard_Real TolAngular ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TolAngular;
		void TolAngular (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") TolCoef;
		Standard_Real TolCoef ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") TolCoef;
		void TolCoef (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

Launches calculation of outlines of the shape  
visualized by this framework. Used after setting the point of view and  
defining the shape or shapes to be visualized.") Update;
		void Update ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitHide;
		void InitHide ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreHide;
		Standard_Boolean MoreHide ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextHide;
		void NextHide ();
		%feature("autodoc", "Args:
	Coordinates(Standard_Address)
	status(HLRAlgo_EdgeStatus)
	S(TopoDS_Shape)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Hide;
		void Hide (Standard_Address & Coordinates,HLRAlgo_EdgeStatus & status,TopoDS_Shape & S,Standard_Boolean & reg1,Standard_Boolean & regn,Standard_Boolean & outl,Standard_Boolean & intl);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitShow;
		void InitShow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreShow;
		Standard_Boolean MoreShow ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextShow;
		void NextShow ();
		%feature("autodoc", "Args:
	Coordinates(Standard_Address)
	S(TopoDS_Shape)
	reg1(Standard_Boolean)
	regn(Standard_Boolean)
	outl(Standard_Boolean)
	intl(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Show;
		void Show (Standard_Address & Coordinates,TopoDS_Shape & S,Standard_Boolean & reg1,Standard_Boolean & regn,Standard_Boolean & outl,Standard_Boolean & intl);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Make a shape  with  the internal outlines in  each  
         face.") OutLinedShape;
		TopoDS_Shape OutLinedShape (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Debug;
		Standard_Boolean Debug ();
		%feature("autodoc", "Args:
	B(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Debug;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs a framework for filtering the results  
of the HLRBRep_Algo algorithm, A.  
Use the extraction filters to obtain the results you want for A.") HLRBRep_PolyHLRToShape;
		 HLRBRep_PolyHLRToShape ();
		%feature("autodoc", "Args:
	A(Handle_HLRBRep_PolyAlgo)

Returns:
	None

No detailed docstring for this function.") Update;
		void Update (const Handle_HLRBRep_PolyAlgo & A);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Show;
		void Show ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Hide;
		void Hide ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") VCompound;
		TopoDS_Shape VCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") VCompound;
		TopoDS_Shape VCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Sets the extraction filter for visible smooth edges.") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Rg1LineVCompound;
		TopoDS_Shape Rg1LineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Sets the extraction filter for visible sewn edges.") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") RgNLineVCompound;
		TopoDS_Shape RgNLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLineVCompound;
		TopoDS_Shape OutLineVCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Sets the extraction filter for visible outlines.") OutLineVCompound;
		TopoDS_Shape OutLineVCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") HCompound;
		TopoDS_Shape HCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") HCompound;
		TopoDS_Shape HCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Sets the extraction filter for hidden smooth edges.") Rg1LineHCompound;
		TopoDS_Shape Rg1LineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Sets the extraction filter for hidden sewn edges.") RgNLineHCompound;
		TopoDS_Shape RgNLineHCompound (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLineHCompound;
		TopoDS_Shape OutLineHCompound ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Sets the extraction filter for hidden outlines.  
Hidden outlines occur, for instance, in tori. In  
this case, the inner outlines of the torus seen on its side are hidden.") OutLineHCompound;
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
		%feature("autodoc", "Args:
	S(Standard_Address)
	U(Standard_Real)
	V(Standard_Real)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Address & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	S(Standard_Address)
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Address & S,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	N(Standard_Integer)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_SLProps;
		 HLRBRep_SLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	None

No detailed docstring for this function.") SetSurface;
		void SetSurface (const Standard_Address & S);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		const gp_Pnt & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D1U;
		const gp_Vec & D1U ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D1V;
		const gp_Vec & D1V ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D2U;
		const gp_Vec & D2U ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") D2V;
		const gp_Vec & D2V ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Vec

No detailed docstring for this function.") DUV;
		const gp_Vec & DUV ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined ();
		%feature("autodoc", "Args:
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") TangentU;
		void TangentU (gp_Dir & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined ();
		%feature("autodoc", "Args:
	D(gp_Dir)

Returns:
	None

No detailed docstring for this function.") TangentV;
		void TangentV (gp_Dir & D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsNormalDefined;
		Standard_Boolean IsNormalDefined ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Normal;
		const gp_Dir & Normal ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUmbilic;
		Standard_Boolean IsUmbilic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MaxCurvature;
		Standard_Real MaxCurvature ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MinCurvature;
		Standard_Real MinCurvature ();
		%feature("autodoc", "Args:
	MaxD(gp_Dir)
	MinD(gp_Dir)

Returns:
	None

No detailed docstring for this function.") CurvatureDirections;
		void CurvatureDirections (gp_Dir & MaxD,gp_Dir & MinD);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") MeanCurvature;
		Standard_Real MeanCurvature ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GaussianCurvature;
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
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

Computes the point  <P> of 	parameter <U> and <V>  
         on the Surface <A>.") Value;
		static void Value (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	static void

Computes the point <P>  and first derivative <D1*>  
         of parameter <U> and <V> on the Surface <A>.") D1;
		static void D1 (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	DUV(gp_Vec)

Returns:
	static void

Computes the point <P>, the first derivative <D1*>  
         and second  derivative <D2*> of parameter  <U> and  
         <V> on the Surface <A>.") D2;
		static void D2 (const Standard_Address A,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);
		%feature("autodoc", "Args:
	A(Standard_Address)
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Address A,const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	A(Standard_Address)

Returns:
	static Standard_Integer

returns the order of   continuity of the   Surface  
         <A>.  returns  1   :  first  derivative    only is  
         computable returns 2 : first and second derivative  
         only are computable.") Continuity;
		static Standard_Integer Continuity (const Standard_Address A);
		%feature("autodoc", "Args:
	A(Standard_Address)
	U1(Standard_Real)
	V1(Standard_Real)
	U2(Standard_Real)
	V2(Standard_Real)

Returns:
	static void

returns the bounds of the Surface.") Bounds;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_SeqOfShapeBounds;
		 HLRBRep_SeqOfShapeBounds ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(HLRBRep_SeqOfShapeBounds)

Returns:
	HLRBRep_SeqOfShapeBounds

No detailed docstring for this function.") Assign;
		const HLRBRep_SeqOfShapeBounds & Assign (const HLRBRep_SeqOfShapeBounds & Other);
		%feature("autodoc", "Args:
	Other(HLRBRep_SeqOfShapeBounds)

Returns:
	HLRBRep_SeqOfShapeBounds

No detailed docstring for this function.") operator=;
		const HLRBRep_SeqOfShapeBounds & operator = (const HLRBRep_SeqOfShapeBounds & Other);
		%feature("autodoc", "Args:
	T(HLRBRep_ShapeBounds)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "Args:
	S(HLRBRep_SeqOfShapeBounds)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "Args:
	T(HLRBRep_ShapeBounds)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "Args:
	S(HLRBRep_SeqOfShapeBounds)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HLRBRep_ShapeBounds)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HLRBRep_SeqOfShapeBounds)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HLRBRep_ShapeBounds)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HLRBRep_ShapeBounds & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HLRBRep_SeqOfShapeBounds)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HLRBRep_SeqOfShapeBounds & S);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_ShapeBounds

No detailed docstring for this function.") First;
		const HLRBRep_ShapeBounds & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_ShapeBounds

No detailed docstring for this function.") Last;
		const HLRBRep_ShapeBounds & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(HLRBRep_SeqOfShapeBounds)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,HLRBRep_SeqOfShapeBounds & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRBRep_ShapeBounds

No detailed docstring for this function.") Value;
		const HLRBRep_ShapeBounds & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(HLRBRep_ShapeBounds)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HLRBRep_ShapeBounds & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HLRBRep_ShapeBounds

No detailed docstring for this function.") ChangeValue;
		HLRBRep_ShapeBounds & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter)

Returns:
	HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter

No detailed docstring for this function.") Assign;
		const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Assign (const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Other);
		%feature("autodoc", "Args:
	Other(HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter)

Returns:
	HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter

No detailed docstring for this function.") operator=;
		const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & operator = (const HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Other);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "Args:
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	S(HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Extrema_POnCurv2d & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & S);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") First;
		const Extrema_POnCurv2d & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Last;
		const Extrema_POnCurv2d & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,HLRBRep_SeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
		const Extrema_POnCurv2d & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Extrema_POnCurv2d)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Extrema_POnCurv2d & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") ChangeValue;
		Extrema_POnCurv2d & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	I(HLRBRep_ShapeBounds)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRBRep_SequenceNodeOfSeqOfShapeBounds;
		 HLRBRep_SequenceNodeOfSeqOfShapeBounds (const HLRBRep_ShapeBounds & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_ShapeBounds

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(Extrema_POnCurv2d)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_SequenceNodeOfSeqPCOfPCLocFOfTheLocateExtPCOfTheProjPCurOfCInter (const Extrema_POnCurv2d & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds ();
		%feature("autodoc", "Args:
	S(Handle_HLRTopoBRep_OutLiner)
	SData(Handle_MMgt_TShared)
	nbIso(Standard_Integer)
	V1(Standard_Integer)
	V2(Standard_Integer)
	E1(Standard_Integer)
	E2(Standard_Integer)
	F1(Standard_Integer)
	F2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds (const Handle_HLRTopoBRep_OutLiner & S,const Handle_MMgt_TShared & SData,const Standard_Integer nbIso,const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer E1,const Standard_Integer E2,const Standard_Integer F1,const Standard_Integer F2);
		%feature("autodoc", "Args:
	S(Handle_HLRTopoBRep_OutLiner)
	nbIso(Standard_Integer)
	V1(Standard_Integer)
	V2(Standard_Integer)
	E1(Standard_Integer)
	E2(Standard_Integer)
	F1(Standard_Integer)
	F2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ShapeBounds;
		 HLRBRep_ShapeBounds (const Handle_HLRTopoBRep_OutLiner & S,const Standard_Integer nbIso,const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer E1,const Standard_Integer E2,const Standard_Integer F1,const Standard_Integer F2);
		%feature("autodoc", "Args:
	NV(Standard_Integer)
	NE(Standard_Integer)
	NF(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Translate;
		void Translate (const Standard_Integer NV,const Standard_Integer NE,const Standard_Integer NF);
		%feature("autodoc", "Args:
	S(Handle_HLRTopoBRep_OutLiner)

Returns:
	None

No detailed docstring for this function.") Shape;
		void Shape (const Handle_HLRTopoBRep_OutLiner & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_HLRTopoBRep_OutLiner

No detailed docstring for this function.") Shape;
		const Handle_HLRTopoBRep_OutLiner & Shape ();
		%feature("autodoc", "Args:
	SD(Handle_MMgt_TShared)

Returns:
	None

No detailed docstring for this function.") ShapeData;
		void ShapeData (const Handle_MMgt_TShared & SD);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MMgt_TShared

No detailed docstring for this function.") ShapeData;
		const Handle_MMgt_TShared & ShapeData ();
		%feature("autodoc", "Args:
	nbIso(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") NbOfIso;
		void NbOfIso (const Standard_Integer nbIso);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbOfIso;
		Standard_Integer NbOfIso ();
		%feature("autodoc", "Args:
	NV(Standard_Integer)
	NE(Standard_Integer)
	NF(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Sizes;
		void Sizes (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	E1(Standard_Integer)
	E2(Standard_Integer)
	F1(Standard_Integer)
	F2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Bounds;
		void Bounds (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	TotMinMax(Standard_Address)

Returns:
	None

No detailed docstring for this function.") UpdateMinMax;
		void UpdateMinMax (const Standard_Address TotMinMax);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") MinMax;
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
		%feature("autodoc", "Args:
	S(Handle_HLRTopoBRep_OutLiner)
	P(HLRAlgo_Projector)
	MST(BRepTopAdaptor_MapOfShapeTool)
	nbIso(Standard_Integer)=0

Returns:
	static Handle_HLRBRep_Data

Creates  a DataStructure   containing the OutLiner  
         <S> depending on the projector <P> and nbIso.") Load;
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
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstUParameter;
		static Standard_Real FirstUParameter (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstVParameter;
		static Standard_Real FirstVParameter (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastUParameter;
		static Standard_Real LastUParameter (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastVParameter;
		static Standard_Real LastVParameter (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)
	Sh(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbUIntervals;
		static Standard_Integer NbUIntervals (const Standard_Address S,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Standard_Address)
	Sh(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbVIntervals;
		static Standard_Integer NbVIntervals (const Standard_Address S,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Standard_Address)
	T(TColStd_Array1OfReal)
	Sh(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") UIntervals;
		static void UIntervals (const Standard_Address S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Standard_Address)
	T(TColStd_Array1OfReal)
	Sh(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") VIntervals;
		static void VIntervals (const Standard_Address S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Standard_Address)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Handle_Adaptor3d_HSurface

If <First> >= <Last>") UTrim;
		static Handle_Adaptor3d_HSurface UTrim (const Standard_Address S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(Standard_Address)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Handle_Adaptor3d_HSurface

If <First> >= <Last>") VTrim;
		static Handle_Adaptor3d_HSurface VTrim (const Standard_Address S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		static Standard_Boolean IsUClosed (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		static Standard_Boolean IsVClosed (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		static Standard_Boolean IsUPeriodic (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") UPeriod;
		static Standard_Real UPeriod (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		static Standard_Boolean IsVPeriodic (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") VPeriod;
		static Standard_Real VPeriod (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Standard_Address S,const Standard_Real u,const Standard_Real v);
		%feature("autodoc", "Args:
	S(Standard_Address)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P);
		%feature("autodoc", "Args:
	S(Standard_Address)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)
	D1u(gp_Vec)
	D1v(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1u,gp_Vec & D1v);
		%feature("autodoc", "Args:
	S(Standard_Address)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	S(Standard_Address)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Standard_Address S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	S(Standard_Address)
	u(Standard_Real)
	v(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Standard_Address S,const Standard_Real u,const Standard_Real v,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	S(Standard_Address)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") UResolution;
		static Standard_Real UResolution (const Standard_Address S,const Standard_Real R3d);
		%feature("autodoc", "Args:
	S(Standard_Address)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") VResolution;
		static Standard_Real VResolution (const Standard_Address S,const Standard_Real R3d);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static GeomAbs_SurfaceType

No detailed docstring for this function.") GetType;
		static GeomAbs_SurfaceType GetType (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static gp_Pln

No detailed docstring for this function.") Plane;
		static gp_Pln Plane (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static gp_Cylinder

No detailed docstring for this function.") Cylinder;
		static gp_Cylinder Cylinder (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static gp_Cone

No detailed docstring for this function.") Cone;
		static gp_Cone Cone (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static gp_Torus

No detailed docstring for this function.") Torus;
		static gp_Torus Torus (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static gp_Sphere

No detailed docstring for this function.") Sphere;
		static gp_Sphere Sphere (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierSurface Bezier (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Handle_Geom_BSplineSurface

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineSurface BSpline (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static gp_Dir

No detailed docstring for this function.") Direction;
		static gp_Dir Direction (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Handle_Adaptor3d_HCurve

No detailed docstring for this function.") BasisCurve;
		static Handle_Adaptor3d_HCurve BasisCurve (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Handle_Adaptor3d_HSurface

No detailed docstring for this function.") BasisSurface;
		static Handle_Adaptor3d_HSurface BasisSurface (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Real

No detailed docstring for this function.") OffsetValue;
		static Standard_Real OffsetValue (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
		static Standard_Integer NbSamplesV (const Standard_Address S);
		%feature("autodoc", "Args:
	S(Standard_Address)
	u1(Standard_Real)
	u2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const Standard_Address S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "Args:
	S(Standard_Address)
	v1(Standard_Real)
	v2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
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
		%feature("autodoc", "Args:
	S(Standard_Address)
	C(gp_Lin)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheCSFunctionOfInterCSurf;
		 HLRBRep_TheCSFunctionOfInterCSurf (const Standard_Address & S,const gp_Lin & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Root;
		Standard_Real Root ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Address

No detailed docstring for this function.") AuxillarSurface;
		const Standard_Address & AuxillarSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") AuxillarCurve;
		const gp_Lin & AuxillarCurve ();
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
		%feature("autodoc", "Args:
	curve1(Standard_Address)
	curve2(Standard_Address)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_TheDistBetweenPCurvesOfTheIntPCurvePCurveOfCInter (const Standard_Address & curve1,const Standard_Address & curve2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
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
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	F(HLRBRep_TheCSFunctionOfInterCSurf)
	TolTangency(Standard_Real)
	MarginCoef(Standard_Real)=0.0

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf (const Standard_Real U,const Standard_Real V,const Standard_Real W,const HLRBRep_TheCSFunctionOfInterCSurf & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);
		%feature("autodoc", "Args:
	F(HLRBRep_TheCSFunctionOfInterCSurf)
	TolTangency(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheExactInterCSurf;
		 HLRBRep_TheExactInterCSurf (const HLRBRep_TheCSFunctionOfInterCSurf & F,const Standard_Real TolTangency);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	Rsnld(math_FunctionSetRoot)
	u0(Standard_Real)
	v0(Standard_Real)
	u1(Standard_Real)
	v1(Standard_Real)
	w0(Standard_Real)
	w1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	HLRBRep_TheCSFunctionOfInterCSurf

No detailed docstring for this function.") Function;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter ();
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntConicCurveOfCInter;
		 HLRBRep_TheIntConicCurveOfCInter (const gp_Hypr2d & H,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin2d & L,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(gp_Circ2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Circ2d & C,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(gp_Elips2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Elips2d & E,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Prb(gp_Parab2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Parab2d & Prb,const IntRes2d_Domain & D1,const Standard_Address & PCurve,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	H(gp_Hypr2d)
	D1(IntRes2d_Domain)
	PCurve(Standard_Address)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntPCurvePCurveOfCInter;
		 HLRBRep_TheIntPCurvePCurveOfCInter ();
		%feature("autodoc", "Args:
	Curve1(Standard_Address)
	Domain1(IntRes2d_Domain)
	Curve2(Standard_Address)
	Domain2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Address & Curve1,const IntRes2d_Domain & Domain1,const Standard_Address & Curve2,const IntRes2d_Domain & Domain2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Curve1(Standard_Address)
	Domain1(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf ();
		%feature("autodoc", "Args:
	thePolyg(HLRBRep_ThePolygonOfInterCSurf)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	thePolyg(HLRBRep_ThePolygonOfInterCSurf)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	thePolyg(HLRBRep_ThePolygonOfInterCSurf)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheInterferenceOfInterCSurf;
		 HLRBRep_TheInterferenceOfInterCSurf (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	thePolyg(HLRBRep_ThePolygonOfInterCSurf)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & theLin,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	thePolyg(HLRBRep_ThePolygonOfInterCSurf)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Interference;
		void Interference (const HLRBRep_ThePolygonOfInterCSurf & thePolyg,const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	thePolyg(HLRBRep_ThePolygonOfInterCSurf)
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	None

No detailed docstring for this function.") Interference;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter ();
		%feature("autodoc", "Args:
	ITool(IntCurve_IConicTool)
	Dom1(IntRes2d_Domain)
	PCurve(Standard_Address)
	Dom2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter;
		 HLRBRep_TheIntersectorOfTheIntConicCurveOfCInter (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Standard_Address & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	ITool(IntCurve_IConicTool)
	Dom1(IntRes2d_Domain)
	PCurve(Standard_Address)
	Dom2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const IntCurve_IConicTool & ITool,const IntRes2d_Domain & Dom1,const Standard_Address & PCurve,const IntRes2d_Domain & Dom2,const Standard_Real TolConf,const Standard_Real Tol);
		%feature("autodoc", "Args:
	parameter(Standard_Real)
	point(gp_Pnt2d)
	TheParCurev(Standard_Address)
	TheImpTool(IntCurve_IConicTool)

Returns:
	Standard_Real

No detailed docstring for this function.") FindU;
		Standard_Real FindU (const Standard_Real parameter,gp_Pnt2d & point,const Standard_Address & TheParCurev,const IntCurve_IConicTool & TheImpTool);
		%feature("autodoc", "Args:
	parameter(Standard_Real)
	point(gp_Pnt2d)
	TheImpTool(IntCurve_IConicTool)
	ParCurve(Standard_Address)
	TheParCurveDomain(IntRes2d_Domain)
	V0(Standard_Real)
	V1(Standard_Real)
	Tolerance(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") FindV;
		Standard_Real FindV (const Standard_Real parameter,gp_Pnt2d & point,const IntCurve_IConicTool & TheImpTool,const Standard_Address & ParCurve,const IntRes2d_Domain & TheParCurveDomain,const Standard_Real V0,const Standard_Real V1,const Standard_Real Tolerance);
		%feature("autodoc", "Args:
	TheImpTool(IntCurve_IConicTool)
	TheParCurve(Standard_Address)
	TheImpCurveDomain(IntRes2d_Domain)
	TheParCurveDomain(IntRes2d_Domain)
	NbResultats(Standard_Integer)
	Inter2_And_Domain2(TColStd_Array1OfReal)
	Inter1(TColStd_Array1OfReal)
	Resultat1(TColStd_Array1OfReal)
	Resultat2(TColStd_Array1OfReal)
	EpsNul(Standard_Real)

Returns:
	None

No detailed docstring for this function.") And_Domaine_Objet1_Intersections;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Standard_Address)
	U0(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C,const Standard_Real U0,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	C(Standard_Address)
	U0(Standard_Real)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter;
		 HLRBRep_TheLocateExtPCOfTheProjPCurOfCInter (const gp_Pnt2d & P,const Standard_Address & C,const Standard_Real U0,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	C(Standard_Address)
	Umin(Standard_Real)
	Usup(Standard_Real)
	TolU(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Standard_Address & C,const Standard_Real Umin,const Standard_Real Usup,const Standard_Real TolU);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	U0(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Pnt2d & P,const Standard_Real U0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SquareDistance;
		Standard_Real SquareDistance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsMin;
		Standard_Boolean IsMin ();
		%feature("autodoc", "Args:
	None
Returns:
	Extrema_POnCurv2d

No detailed docstring for this function.") Point;
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
		%feature("autodoc", "Args:
	Curve(Standard_Address)
	NbPnt(Standard_Integer)
	Domain(IntRes2d_Domain)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter (const Standard_Address & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Curve(Standard_Address)
	NbPnt(Standard_Integer)
	Domain(IntRes2d_Domain)
	Tol(Standard_Real)
	OtherBox(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter;
		 HLRBRep_ThePolygon2dOfTheIntPCurvePCurveOfCInter (const Standard_Address & Curve,const Standard_Integer NbPnt,const IntRes2d_Domain & Domain,const Standard_Real Tol,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "Args:
	Curve(Standard_Address)
	OtherBox(Bnd_Box2d)

Returns:
	None

No detailed docstring for this function.") ComputeWithBox;
		void ComputeWithBox (const Standard_Address & Curve,const Bnd_Box2d & OtherBox);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "Args:
	x(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "Args:
	clos(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)
	theBegin(gp_Pnt2d)
	theEnd(gp_Pnt2d)

Returns:
	virtual void

No detailed docstring for this function.") Segment;
		virtual void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") AutoIntersectionIsPossible;
		Standard_Boolean AutoIntersectionIsPossible ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParamOnLine(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "Args:
	x(Standard_Real)
	y(Standard_Real)
	x1(Standard_Real)
	x2(Standard_Real)
	y1(Standard_Real)
	y2(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") CalculRegion;
		Standard_Integer CalculRegion (const Standard_Real x,const Standard_Real y,const Standard_Real x1,const Standard_Real x2,const Standard_Real y1,const Standard_Real y2);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	NbPnt(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const Standard_Integer NbPnt);
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	U1(Standard_Real)
	U2(Standard_Real)
	NbPnt(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const Standard_Real U1,const Standard_Real U2,const Standard_Integer NbPnt);
		%feature("autodoc", "Args:
	Curve(gp_Lin)
	Upars(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") HLRBRep_ThePolygonOfInterCSurf;
		 HLRBRep_ThePolygonOfInterCSurf (const gp_Lin & Curve,const TColStd_Array1OfReal & Upars);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Bounding;
		const Bnd_Box & Bounding ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "Args:
	x(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "Args:
	clos(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") BeginOfSeg;
		const gp_Pnt & BeginOfSeg (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") EndOfSeg;
		const gp_Pnt & EndOfSeg (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParamOnLine(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	thePolygon(HLRBRep_ThePolygonOfInterCSurf)

Returns:
	static  Bnd_Box

No detailed docstring for this function.") Bounding;
		static const Bnd_Box & Bounding (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(HLRBRep_ThePolygonOfInterCSurf)

Returns:
	static Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(HLRBRep_ThePolygonOfInterCSurf)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Closed;
		static Standard_Boolean Closed (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(HLRBRep_ThePolygonOfInterCSurf)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSegments;
		static Standard_Integer NbSegments (const HLRBRep_ThePolygonOfInterCSurf & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(HLRBRep_ThePolygonOfInterCSurf)
	Index(Standard_Integer)

Returns:
	static  gp_Pnt

No detailed docstring for this function.") BeginOfSeg;
		static const gp_Pnt & BeginOfSeg (const HLRBRep_ThePolygonOfInterCSurf & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "Args:
	thePolygon(HLRBRep_ThePolygonOfInterCSurf)
	Index(Standard_Integer)

Returns:
	static  gp_Pnt

No detailed docstring for this function.") EndOfSeg;
		static const gp_Pnt & EndOfSeg (const HLRBRep_ThePolygonOfInterCSurf & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "Args:
	thePolygon(HLRBRep_ThePolygonOfInterCSurf)

Returns:
	static void

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	static  Bnd_Box

No detailed docstring for this function.") Bounding;
		static const Bnd_Box & Bounding (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	static  Handle_Bnd_HArray1OfBox

No detailed docstring for this function.") ComponentsBounding;
		static const Handle_Bnd_HArray1OfBox & ComponentsBounding (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	static Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbTriangles;
		static Standard_Integer NbTriangles (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	Index(Standard_Integer)
	P1(Standard_Integer)
	P2(Standard_Integer)
	P3(Standard_Integer)

Returns:
	static void

No detailed docstring for this function.") Triangle;
		static void Triangle (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	Index(Standard_Integer)

Returns:
	static  gp_Pnt

No detailed docstring for this function.") Point;
		static const gp_Pnt & Point (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	Triang(Standard_Integer)
	Pivot(Standard_Integer)
	Pedge(Standard_Integer)
	TriCon(Standard_Integer)
	OtherP(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") TriConnex;
		static Standard_Integer TriConnex (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)
	Index1(Standard_Integer)
	Index2(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsOnBound;
		static Standard_Boolean IsOnBound (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh,const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	static Standard_Real

No detailed docstring for this function.") GetBorderDeflection;
		static Standard_Real GetBorderDeflection (const HLRBRep_ThePolyhedronOfInterCSurf & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(HLRBRep_ThePolyhedronOfInterCSurf)

Returns:
	static void

No detailed docstring for this function.") Dump;
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
		%feature("autodoc", "Args:
	C(Standard_Address)
	Pnt(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") FindParameter;
		static Standard_Real FindParameter (const Standard_Address & C,const gp_Pnt2d & Pnt,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Standard_Address)
	Pnt(gp_Pnt2d)
	LowParameter(Standard_Real)
	HighParameter(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") FindParameter;
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
		%feature("autodoc", "Args:
	S(Standard_Address)
	C(gp_Lin)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvExactInterCSurf (const Standard_Address & S,const gp_Lin & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Root;
		Standard_Real Root (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Intervals;
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
		%feature("autodoc", "Args:
	Q(IntSurf_Quadric)
	C(gp_Lin)

Returns:
	None

No detailed docstring for this function.") HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf;
		 HLRBRep_TheQuadCurvFuncOfTheQuadCurvExactInterCSurf (const IntSurf_Quadric & Q,const gp_Lin & C);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
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
		%feature("autodoc", "Args:
	T(HLRBRep_EdgeInterferenceTool)
	I(HLRAlgo_ListIteratorOfInterferenceList)

Returns:
	None

No detailed docstring for this function.") HLRBRep_VertexList;
		 HLRBRep_VertexList (const HLRBRep_EdgeInterferenceTool & T,const HLRAlgo_ListIteratorOfInterferenceList & I);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True when the curve is periodic.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True when there are more vertices.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Proceeds to the next vertex.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRAlgo_Intersection

Returns the current vertex") Current;
		const HLRAlgo_Intersection & Current ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True  if the current  vertex  is is on the  
         boundary of the edge.") IsBoundary;
		Standard_Boolean IsBoundary ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True   if   the current    vertex  is  an  
         interference.") IsInterference;
		Standard_Boolean IsInterference ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the  orientation of the  current vertex if  
         it is on the boundary of the edge.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns  the transition  of the  current vertex if  
         it is an interference.") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns  the  transition  of  the  current  vertex  
         relative to the boundary if it is an interference.") BoundaryTransition;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty framework for the  
calculation of visible and hidden lines of a shape in a projection.  
Use the function:  
-   Projector to define the point of view  
-   Add to select the shape or shapes to be visualized  
-   Update to compute the outlines of the shape, and  
-   Hide to compute the visible and hidden lines of the shape.") HLRBRep_Algo;
		 HLRBRep_Algo ();
		%feature("autodoc", "Args:
	A(Handle_HLRBRep_Algo)

Returns:
	None

No detailed docstring for this function.") HLRBRep_Algo;
		 HLRBRep_Algo (const Handle_HLRBRep_Algo & A);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SData(Handle_MMgt_TShared)
	nbIso(Standard_Integer)=0

Returns:
	None

add the Shape <S>.") Add;
		void Add (const TopoDS_Shape & S,const Handle_MMgt_TShared & SData,const Standard_Integer nbIso = 0);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	nbIso(Standard_Integer)=0

Returns:
	None

Adds the shape S to this framework, and  
specifies the number of isoparameters nbiso desired in visualizing S.  
You may add as many shapes as you wish. Use the function Add once for each shape.") Add;
		void Add (const TopoDS_Shape & S,const Standard_Integer nbIso = 0);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Integer

return  the index  of  the  Shape <S>  and  
         return 0 if the Shape <S> is not found.") Index;
		Standard_Integer Index (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

nullify all the results of OutLiner from HLRTopoBRep.") OutLinedShapeNullify;
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

