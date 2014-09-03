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
%module (package="OCC") Adaptor2d

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

%include Adaptor2d_headers.i

/* typedefs */
typedef Adaptor2d_Curve2d * Adaptor2d_Curve2dPtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Adaptor2d_Curve2d;
class Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

If necessary,  breaks the  curve in  intervals  of  
         continuity  <S>.    And  returns   the number   of  
         intervals.") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	virtual Handle_Adaptor2d_HCurve2d

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") Trim;
		virtual Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsClosed;
		virtual Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") Period;
		virtual Standard_Real Period ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	virtual gp_Pnt2d

Computes the point of parameter U on the curve.") Value;
		virtual gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	virtual void

Computes the point of parameter U on the curve.") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	virtual void

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	virtual void

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	virtual void

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	virtual gp_Vec2d

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		virtual gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	virtual Standard_Real

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
		virtual GeomAbs_CurveType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Lin2d

No detailed docstring for this function.") Line;
		virtual gp_Lin2d Line ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Circ2d

No detailed docstring for this function.") Circle;
		virtual gp_Circ2d Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Elips2d

No detailed docstring for this function.") Ellipse;
		virtual gp_Elips2d Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		virtual gp_Hypr2d Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Parab2d

No detailed docstring for this function.") Parabola;
		virtual gp_Parab2d Parabola ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Degree;
		virtual Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbPoles;
		virtual Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbKnots;
		virtual Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		virtual Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		virtual Handle_Geom2d_BSplineCurve BSpline ();
};


%feature("shadow") Adaptor2d_Curve2d::~Adaptor2d_Curve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor2d_Curve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor2d_HCurve2d;
class Adaptor2d_HCurve2d : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Adaptor2d_Curve2d

Returns a reference to the Curve2d inside the HCurve2d.") Curve2d;
		virtual const Adaptor2d_Curve2d & Curve2d ();
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

No detailed docstring for this function.") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor2d_HCurve2d

If <First> >= <Last>") Trim;
		Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
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

No detailed docstring for this function.") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec2d

No detailed docstring for this function.") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

No detailed docstring for this function.") GetType;
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
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
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

No detailed docstring for this function.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
};


%feature("shadow") Adaptor2d_HCurve2d::~Adaptor2d_HCurve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor2d_HCurve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor2d_HCurve2d {
	Handle_Adaptor2d_HCurve2d GetHandle() {
	return *(Handle_Adaptor2d_HCurve2d*) &$self;
	}
};

%nodefaultctor Handle_Adaptor2d_HCurve2d;
class Handle_Adaptor2d_HCurve2d : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Adaptor2d_HCurve2d();
        Handle_Adaptor2d_HCurve2d(const Handle_Adaptor2d_HCurve2d &aHandle);
        Handle_Adaptor2d_HCurve2d(const Adaptor2d_HCurve2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor2d_HCurve2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor2d_HCurve2d {
    Adaptor2d_HCurve2d* GetObject() {
    return (Adaptor2d_HCurve2d*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor2d_HCurve2d::~Handle_Adaptor2d_HCurve2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor2d_HCurve2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor2d_HLine2d;
class Adaptor2d_HLine2d : public Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor2d_HLine2d;
		 Adaptor2d_HLine2d ();
		%feature("autodoc", "Args:
	C(Adaptor2d_Line2d)

Returns:
	None

No detailed docstring for this function.") Adaptor2d_HLine2d;
		 Adaptor2d_HLine2d (const Adaptor2d_Line2d & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Line2d)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Adaptor2d_Line2d & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor2d_Curve2d

No detailed docstring for this function.") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor2d_Line2d

No detailed docstring for this function.") ChangeCurve2d;
		Adaptor2d_Line2d & ChangeCurve2d ();
};


%feature("shadow") Adaptor2d_HLine2d::~Adaptor2d_HLine2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor2d_HLine2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor2d_HLine2d {
	Handle_Adaptor2d_HLine2d GetHandle() {
	return *(Handle_Adaptor2d_HLine2d*) &$self;
	}
};

%nodefaultctor Handle_Adaptor2d_HLine2d;
class Handle_Adaptor2d_HLine2d : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_Adaptor2d_HLine2d();
        Handle_Adaptor2d_HLine2d(const Handle_Adaptor2d_HLine2d &aHandle);
        Handle_Adaptor2d_HLine2d(const Adaptor2d_HLine2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor2d_HLine2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor2d_HLine2d {
    Adaptor2d_HLine2d* GetObject() {
    return (Adaptor2d_HLine2d*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor2d_HLine2d::~Handle_Adaptor2d_HLine2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor2d_HLine2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor2d_Line2d;
class Adaptor2d_Line2d : public Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor2d_Line2d;
		 Adaptor2d_Line2d ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	D(gp_Dir2d)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Adaptor2d_Line2d;
		 Adaptor2d_Line2d (const gp_Pnt2d & P,const gp_Dir2d & D,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "Args:
	L(gp_Lin2d)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const gp_Lin2d & L);
		%feature("autodoc", "Args:
	L(gp_Lin2d)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const gp_Lin2d & L,const Standard_Real UFirst,const Standard_Real ULast);
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
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor2d_HCurve2d

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") Trim;
		Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
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
	X(Standard_Real)

Returns:
	gp_Pnt2d

No detailed docstring for this function.") Value;
		gp_Pnt2d Value (const Standard_Real X);
		%feature("autodoc", "Args:
	X(Standard_Real)
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real X,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	X(Standard_Real)
	P(gp_Pnt2d)
	V(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real X,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	X(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real X,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "Args:
	X(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	V3(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D3;
		void D3 (const Standard_Real X,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec2d

No detailed docstring for this function.") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

No detailed docstring for this function.") GetType;
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
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
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

No detailed docstring for this function.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
};


%feature("shadow") Adaptor2d_Line2d::~Adaptor2d_Line2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor2d_Line2d {
	void _kill_pointed() {
		delete $self;
	}
};
