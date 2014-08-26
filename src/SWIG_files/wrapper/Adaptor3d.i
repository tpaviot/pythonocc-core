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
%module Adaptor3d

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

%include Adaptor3d_required_python_modules.i
%include Adaptor3d_headers.i

/* typedefs */
typedef Adaptor3d_Surface * Adaptor3d_SurfacePtr;
typedef Adaptor3d_Curve * Adaptor3d_CurvePtr;
typedef Adaptor3d_CurveOnSurface * Adaptor3d_CurveOnSurfacePtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor Adaptor3d_Curve;
class Adaptor3d_Curve {
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

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
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
	virtual Handle_Adaptor3d_HCurve

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") Trim;
		virtual Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
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
	virtual gp_Pnt

Computes the point of parameter U on the curve.") Value;
		virtual gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

Computes the point of parameter U on the curve.") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	virtual void

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	virtual void

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	virtual void

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	virtual gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Integer N);
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
	virtual gp_Lin

No detailed docstring for this function.") Line;
		virtual gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Circ

No detailed docstring for this function.") Circle;
		virtual gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Elips

No detailed docstring for this function.") Ellipse;
		virtual gp_Elips Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Hypr

No detailed docstring for this function.") Hyperbola;
		virtual gp_Hypr Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Parab

No detailed docstring for this function.") Parabola;
		virtual gp_Parab Parabola ();
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
	virtual Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		virtual Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		virtual Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") Adaptor3d_Curve::~Adaptor3d_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_HCurve;
class Adaptor3d_HCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Adaptor3d_Curve

Returns a pointer to the Curve inside the HCurve.") Curve;
		virtual const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Adaptor3d_Curve

Returns a pointer to the Curve inside the HCurve.") GetCurve;
		virtual Adaptor3d_Curve & GetCurve ();
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
	Handle_Adaptor3d_HCurve

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  
 If <First> >= <Last>") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
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
	gp_Pnt

No detailed docstring for this function.") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

No detailed docstring for this function.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
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
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

No detailed docstring for this function.") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

No detailed docstring for this function.") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

No detailed docstring for this function.") Parabola;
		gp_Parab Parabola ();
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
	Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") Adaptor3d_HCurve::~Adaptor3d_HCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HCurve {
	Handle_Adaptor3d_HCurve GetHandle() {
	return *(Handle_Adaptor3d_HCurve*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HCurve;
class Handle_Adaptor3d_HCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Adaptor3d_HCurve();
        Handle_Adaptor3d_HCurve(const Handle_Adaptor3d_HCurve &aHandle);
        Handle_Adaptor3d_HCurve(const Adaptor3d_HCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HCurve {
    Adaptor3d_HCurve* GetObject() {
    return (Adaptor3d_HCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HCurve::~Handle_Adaptor3d_HCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_HOffsetCurve;
class Adaptor3d_HOffsetCurve : public Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_HOffsetCurve;
		 Adaptor3d_HOffsetCurve ();
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_HOffsetCurve;
		 Adaptor3d_HOffsetCurve (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_OffsetCurve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Adaptor3d_OffsetCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor2d_Curve2d

No detailed docstring for this function.") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_OffsetCurve

No detailed docstring for this function.") ChangeCurve2d;
		Adaptor3d_OffsetCurve & ChangeCurve2d ();
};


%feature("shadow") Adaptor3d_HOffsetCurve::~Adaptor3d_HOffsetCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HOffsetCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HOffsetCurve {
	Handle_Adaptor3d_HOffsetCurve GetHandle() {
	return *(Handle_Adaptor3d_HOffsetCurve*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HOffsetCurve;
class Handle_Adaptor3d_HOffsetCurve : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_Adaptor3d_HOffsetCurve();
        Handle_Adaptor3d_HOffsetCurve(const Handle_Adaptor3d_HOffsetCurve &aHandle);
        Handle_Adaptor3d_HOffsetCurve(const Adaptor3d_HOffsetCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HOffsetCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HOffsetCurve {
    Adaptor3d_HOffsetCurve* GetObject() {
    return (Adaptor3d_HOffsetCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HOffsetCurve::~Handle_Adaptor3d_HOffsetCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HOffsetCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_HSurface;
class Adaptor3d_HSurface : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Adaptor3d_Surface

Returns a reference to the Surface inside the HSurface.") Surface;
		virtual const Adaptor3d_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

No detailed docstring for this function.") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") UPeriod;
		Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") VPeriod;
		Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

No detailed docstring for this function.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
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
	None

No detailed docstring for this function.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

No detailed docstring for this function.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_SurfaceType

No detailed docstring for this function.") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

No detailed docstring for this function.") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

No detailed docstring for this function.") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

No detailed docstring for this function.") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Sphere

No detailed docstring for this function.") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Torus

No detailed docstring for this function.") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") BasisSurface;
		Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") OffsetValue;
		Standard_Real OffsetValue ();
};


%feature("shadow") Adaptor3d_HSurface::~Adaptor3d_HSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HSurface {
	Handle_Adaptor3d_HSurface GetHandle() {
	return *(Handle_Adaptor3d_HSurface*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HSurface;
class Handle_Adaptor3d_HSurface : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Adaptor3d_HSurface();
        Handle_Adaptor3d_HSurface(const Handle_Adaptor3d_HSurface &aHandle);
        Handle_Adaptor3d_HSurface(const Adaptor3d_HSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HSurface {
    Adaptor3d_HSurface* GetObject() {
    return (Adaptor3d_HSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HSurface::~Handle_Adaptor3d_HSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_HSurfaceTool;
class Adaptor3d_HSurfaceTool {
	public:
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstUParameter;
		static Standard_Real FirstUParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstVParameter;
		static Standard_Real FirstVParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastUParameter;
		static Standard_Real LastUParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastVParameter;
		static Standard_Real LastVParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	Sh(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbUIntervals;
		static Standard_Integer NbUIntervals (const Handle_Adaptor3d_HSurface & S,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	Sh(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbVIntervals;
		static Standard_Integer NbVIntervals (const Handle_Adaptor3d_HSurface & S,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	T(TColStd_Array1OfReal)
	Sh(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") UIntervals;
		static void UIntervals (const Handle_Adaptor3d_HSurface & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	T(TColStd_Array1OfReal)
	Sh(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") VIntervals;
		static void VIntervals (const Handle_Adaptor3d_HSurface & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Handle_Adaptor3d_HSurface

If <First> >= <Last>") UTrim;
		static Handle_Adaptor3d_HSurface UTrim (const Handle_Adaptor3d_HSurface & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Handle_Adaptor3d_HSurface

If <First> >= <Last>") VTrim;
		static Handle_Adaptor3d_HSurface VTrim (const Handle_Adaptor3d_HSurface & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		static Standard_Boolean IsUClosed (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		static Standard_Boolean IsVClosed (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		static Standard_Boolean IsUPeriodic (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Real

No detailed docstring for this function.") UPeriod;
		static Standard_Real UPeriod (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		static Standard_Boolean IsVPeriodic (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Real

No detailed docstring for this function.") VPeriod;
		static Standard_Real VPeriod (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	u(Standard_Real)
	v(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	u(Standard_Real)
	v(Standard_Real)
	P(gp_Pnt)
	D1u(gp_Vec)
	D1v(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1u,gp_Vec & D1v);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
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
		static void D2 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
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
		static void D3 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	u(Standard_Real)
	v(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") UResolution;
		static Standard_Real UResolution (const Handle_Adaptor3d_HSurface & S,const Standard_Real R3d);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") VResolution;
		static Standard_Real VResolution (const Handle_Adaptor3d_HSurface & S,const Standard_Real R3d);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static GeomAbs_SurfaceType

No detailed docstring for this function.") GetType;
		static GeomAbs_SurfaceType GetType (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static gp_Pln

No detailed docstring for this function.") Plane;
		static gp_Pln Plane (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static gp_Cylinder

No detailed docstring for this function.") Cylinder;
		static gp_Cylinder Cylinder (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static gp_Cone

No detailed docstring for this function.") Cone;
		static gp_Cone Cone (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static gp_Torus

No detailed docstring for this function.") Torus;
		static gp_Torus Torus (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static gp_Sphere

No detailed docstring for this function.") Sphere;
		static gp_Sphere Sphere (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierSurface Bezier (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Handle_Geom_BSplineSurface

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineSurface BSpline (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static gp_Dir

No detailed docstring for this function.") Direction;
		static gp_Dir Direction (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Handle_Adaptor3d_HCurve

No detailed docstring for this function.") BasisCurve;
		static Handle_Adaptor3d_HCurve BasisCurve (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Handle_Adaptor3d_HSurface

No detailed docstring for this function.") BasisSurface;
		static Handle_Adaptor3d_HSurface BasisSurface (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Real

No detailed docstring for this function.") OffsetValue;
		static Standard_Real OffsetValue (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	u1(Standard_Real)
	u2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	v1(Standard_Real)
	v2(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
};


%feature("shadow") Adaptor3d_HSurfaceTool::~Adaptor3d_HSurfaceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HSurfaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_HVertex;
class Adaptor3d_HVertex : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_HVertex;
		 Adaptor3d_HVertex ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Ori(TopAbs_Orientation)
	Resolution(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_HVertex;
		 Adaptor3d_HVertex (const gp_Pnt2d & P,const TopAbs_Orientation Ori,const Standard_Real Resolution);
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pnt2d

No detailed docstring for this function.") Value;
		virtual gp_Pnt2d Value ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") Parameter;
		virtual Standard_Real Parameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual Standard_Real

Parametric resolution (2d).") Resolution;
		virtual Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopAbs_Orientation

No detailed docstring for this function.") Orientation;
		virtual TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	Other(Handle_Adaptor3d_HVertex)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsSame;
		virtual Standard_Boolean IsSame (const Handle_Adaptor3d_HVertex & Other);
};


%feature("shadow") Adaptor3d_HVertex::~Adaptor3d_HVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HVertex {
	Handle_Adaptor3d_HVertex GetHandle() {
	return *(Handle_Adaptor3d_HVertex*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HVertex;
class Handle_Adaptor3d_HVertex : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Adaptor3d_HVertex();
        Handle_Adaptor3d_HVertex(const Handle_Adaptor3d_HVertex &aHandle);
        Handle_Adaptor3d_HVertex(const Adaptor3d_HVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HVertex {
    Adaptor3d_HVertex* GetObject() {
    return (Adaptor3d_HVertex*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HVertex::~Handle_Adaptor3d_HVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HVertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_InterFunc;
class Adaptor3d_InterFunc : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	FixVal(Standard_Real)
	Fix(Standard_Integer)

Returns:
	None

build the function  U(t)=FixVal   if Fix =1 or  
           V(t)=FixVal if Fix=2") Adaptor3d_InterFunc;
		 Adaptor3d_InterFunc (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real FixVal,const Standard_Integer Fix);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

computes the value <F>of the function for the variable <X>.  
        Returns True if the calculation were successfully done,  
         False otherwise.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

computes the derivative <D> of the function  
         for the variable <X>.  
          Returns True if the calculation were successfully done,  
          False otherwise.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

computes the value <F> and the derivative <D> of the  
         function for the variable <X>.  
         Returns True if the calculation were successfully done,  
         False otherwise.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Adaptor3d_InterFunc::~Adaptor3d_InterFunc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_InterFunc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_OffsetCurve;
class Adaptor3d_OffsetCurve : public Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

The Offset is set to 0.") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	None

The curve is loaded. The Offset is set to 0.") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Offset(Standard_Real)

Returns:
	None

Creates  an  OffsetCurve curve.  
         The Offset is set to Offset.") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real Offset);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	Offset(Standard_Real)
	WFirst(Standard_Real)
	WLast(Standard_Real)

Returns:
	None

Create an Offset curve.  
         WFirst,WLast define the bounds of the Offset curve.") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real Offset,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("autodoc", "Args:
	S(Handle_Adaptor2d_HCurve2d)

Returns:
	None

Changes  the curve.  The Offset is reset to 0.") Load;
		void Load (const Handle_Adaptor2d_HCurve2d & S);
		%feature("autodoc", "Args:
	Offset(Standard_Real)

Returns:
	None

Changes the Offset on the current Curve.") Load;
		void Load (const Standard_Real Offset);
		%feature("autodoc", "Args:
	Offset(Standard_Real)
	WFirst(Standard_Real)
	WLast(Standard_Real)

Returns:
	None

Changes the Offset Curve on the current Curve.") Load;
		void Load (const Standard_Real Offset,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Curve;
		const Handle_Adaptor2d_HCurve2d & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Offset;
		Standard_Real Offset ();
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

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
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


%feature("shadow") Adaptor3d_OffsetCurve::~Adaptor3d_OffsetCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_OffsetCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_Surface;
class Adaptor3d_Surface {
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

No detailed docstring for this function.") FirstUParameter;
		virtual Standard_Real FirstUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") LastUParameter;
		virtual Standard_Real LastUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") FirstVParameter;
		virtual Standard_Real FirstVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") LastVParameter;
		virtual Standard_Real LastVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_Shape

No detailed docstring for this function.") UContinuity;
		virtual GeomAbs_Shape UContinuity ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_Shape

No detailed docstring for this function.") VContinuity;
		virtual GeomAbs_Shape VContinuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns the number of U intervals for  continuity  
         <S>. May be one if UContinuity(me) >= <S>") NbUIntervals;
		virtual Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	virtual Standard_Integer

Returns the number of V intervals for  continuity  
         <S>. May be one if VContinuity(me) >= <S>") NbVIntervals;
		virtual Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Returns the  intervals with the requested continuity  
         in the U direction.") UIntervals;
		virtual void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	virtual void

Returns the  intervals with the requested continuity  
         in the V direction.") VIntervals;
		virtual void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	virtual Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the U direction  
          equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") UTrim;
		virtual Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	virtual Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the V direction  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") VTrim;
		virtual Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		virtual Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		virtual Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") UPeriod;
		virtual Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") VPeriod;
		virtual Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	virtual gp_Pnt

Computes the point of parameters U,V on the surface.") Value;
		virtual gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

Computes the point of parameters U,V on the surface.") D0;
		virtual void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	virtual void

Computes the point  and the first derivatives on  
 the surface.  Raised   if  the continuity  of   the  current  
 intervals is not C1.") D1;
		virtual void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	virtual void

Computes   the point,  the  first  and  second  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C2.") D2;
		virtual void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
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
	virtual void

Computes the point,  the first, second and third  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C3.") D3;
		virtual void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	virtual gp_Vec

Computes the derivative of order Nu in the direction U and Nv  
 in the direction V at the point P(U, V).  Raised if the current U  interval is not not CNu  
 and the current V interval is not CNv.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	virtual Standard_Real

Returns the parametric U  resolution corresponding  
        to the real space resolution <R3d>.") UResolution;
		virtual Standard_Real UResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	virtual Standard_Real

Returns the parametric V  resolution corresponding  
        to the real space resolution <R3d>.") VResolution;
		virtual Standard_Real VResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual GeomAbs_SurfaceType

Returns the type of the surface : Plane, Cylinder,  
         Cone,      Sphere,        Torus,    BezierSurface,  
         BSplineSurface,               SurfaceOfRevolution,  
         SurfaceOfExtrusion, OtherSurface") GetType;
		virtual GeomAbs_SurfaceType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Pln

No detailed docstring for this function.") Plane;
		virtual gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Cylinder

No detailed docstring for this function.") Cylinder;
		virtual gp_Cylinder Cylinder ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Cone

No detailed docstring for this function.") Cone;
		virtual gp_Cone Cone ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Sphere

No detailed docstring for this function.") Sphere;
		virtual gp_Sphere Sphere ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Torus

No detailed docstring for this function.") Torus;
		virtual gp_Torus Torus ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") UDegree;
		virtual Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbUPoles;
		virtual Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") VDegree;
		virtual Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbVPoles;
		virtual Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbUKnots;
		virtual Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbVKnots;
		virtual Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsURational;
		virtual Standard_Boolean IsURational ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsVRational;
		virtual Standard_Boolean IsVRational ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		virtual Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Geom_BSplineSurface

No detailed docstring for this function.") BSpline;
		virtual Handle_Geom_BSplineSurface BSpline ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		virtual gp_Ax1 AxeOfRevolution ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual gp_Dir

No detailed docstring for this function.") Direction;
		virtual gp_Dir Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Adaptor3d_HCurve

No detailed docstring for this function.") BasisCurve;
		virtual Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Adaptor3d_HSurface

No detailed docstring for this function.") BasisSurface;
		virtual Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") OffsetValue;
		virtual Standard_Real OffsetValue ();
};


%feature("shadow") Adaptor3d_Surface::~Adaptor3d_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_TopolTool;
class Adaptor3d_TopolTool : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool ();
		%feature("autodoc", "Args:
	Surface(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool (const Handle_Adaptor3d_HSurface & Surface);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Initialize;
		virtual void Initialize ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	virtual void

No detailed docstring for this function.") Initialize;
		virtual void Initialize (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual void

No detailed docstring for this function.") Initialize;
		virtual void Initialize (const Handle_Adaptor2d_HCurve2d & Curve);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Init;
		virtual void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") More;
		virtual Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") Value;
		virtual Handle_Adaptor2d_HCurve2d Value ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Next;
		virtual void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") InitVertexIterator;
		virtual void InitVertexIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") MoreVertex;
		virtual Standard_Boolean MoreVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Adaptor3d_HVertex

No detailed docstring for this function.") Vertex;
		virtual Handle_Adaptor3d_HVertex Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") NextVertex;
		virtual void NextVertex ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Tol(Standard_Real)
	ReacdreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	virtual TopAbs_State

No detailed docstring for this function.") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P,const Standard_Real Tol,const Standard_Boolean ReacdreOnPeriodic = Standard_True);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Tol(Standard_Real)
	ReacdreOnPeriodic(Standard_Boolean)=Standard_True

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsThePointOn;
		virtual Standard_Boolean IsThePointOn (const gp_Pnt2d & P,const Standard_Real Tol,const Standard_Boolean ReacdreOnPeriodic = Standard_True);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual TopAbs_Orientation

If the function returns the orientation of the arc.  
         If the orientation is FORWARD or REVERSED, the arc is  
         a 'real' limit of the surface.  
         If the orientation is INTERNAL or EXTERNAL, the arc is  
         considered as an arc on the surface.") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)

Returns:
	virtual TopAbs_Orientation

Returns the orientation of the vertex V.  
         The vertex has been found with an exploration on  
         a given arc. The orientation is the orientation  
         of the vertex on this arc.") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	V1(Handle_Adaptor3d_HVertex)
	V2(Handle_Adaptor3d_HVertex)

Returns:
	virtual Standard_Boolean

Returns True if the vertices V1 and V2 are identical.  
         This method does not take the orientation of the  
         vertices in account.") Identical;
		virtual Standard_Boolean Identical (const Handle_Adaptor3d_HVertex & V1,const Handle_Adaptor3d_HVertex & V2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

answers if arcs and vertices may have 3d representations,  
         so that we could use Tol3d and Pnt methods.") Has3d;
		virtual Standard_Boolean Has3d ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	virtual Standard_Real

returns 3d tolerance of the arc C") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)

Returns:
	virtual Standard_Real

returns 3d tolerance of the vertex V") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	V(Handle_Adaptor3d_HVertex)

Returns:
	virtual gp_Pnt

returns 3d point of the vertex V") Pnt;
		virtual gp_Pnt Pnt (const Handle_Adaptor3d_HVertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

compute the sample-points for the intersections algorithms") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

compute the sample-points for the intersections algorithms") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

compute the sample-points for the intersections algorithms") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "Args:
	theArray(TColStd_Array1OfReal)

Returns:
	None

return the set of U parameters on the surface  
 obtained by the method SamplePnts") UParameters;
		void UParameters (TColStd_Array1OfReal & theArray);
		%feature("autodoc", "Args:
	theArray(TColStd_Array1OfReal)

Returns:
	None

return the set of V parameters on the surface  
 obtained by the method SamplePnts") VParameters;
		void VParameters (TColStd_Array1OfReal & theArray);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P2d(gp_Pnt2d)
	P3d(gp_Pnt)

Returns:
	virtual void

No detailed docstring for this function.") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Address

No detailed docstring for this function.") Edge;
		virtual Standard_Address Edge ();
		%feature("autodoc", "Args:
	theDefl(Standard_Real)
	theNUmin(Standard_Integer)
	theNVmin(Standard_Integer)

Returns:
	virtual void

compute the sample-points for the intersections algorithms  
by adaptive algorithm for BSpline surfaces. For other surfaces algorithm  
is the same as in method ComputeSamplePoints(), but only fill arrays of U  
and V sample parameters;  
theDefl is a requred deflection  
theNUmin, theNVmin are minimal nb points for U and V.") SamplePnts;
		virtual void SamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);
		%feature("autodoc", "Args:
	theDefl(Standard_Real)
	theNUmin(Standard_Integer)
	theNVmin(Standard_Integer)

Returns:
	virtual void

compute the sample-points for the intersections algorithms  
by adaptive algorithm for BSpline surfaces  -  is  used  in  SamplePnts  
theDefl is a requred deflection  
theNUmin, theNVmin are minimal nb points for U and V.") BSplSamplePnts;
		virtual void BSplSamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns true if provide uniform sampling of points.") IsUniformSampling;
		virtual Standard_Boolean IsUniformSampling ();
};


%feature("shadow") Adaptor3d_TopolTool::~Adaptor3d_TopolTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_TopolTool {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_TopolTool {
	Handle_Adaptor3d_TopolTool GetHandle() {
	return *(Handle_Adaptor3d_TopolTool*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_TopolTool;
class Handle_Adaptor3d_TopolTool : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Adaptor3d_TopolTool();
        Handle_Adaptor3d_TopolTool(const Handle_Adaptor3d_TopolTool &aHandle);
        Handle_Adaptor3d_TopolTool(const Adaptor3d_TopolTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_TopolTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_TopolTool {
    Adaptor3d_TopolTool* GetObject() {
    return (Adaptor3d_TopolTool*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_TopolTool::~Handle_Adaptor3d_TopolTool %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_TopolTool {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_CurveOnSurface;
class Adaptor3d_CurveOnSurface : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

Creates a CurveOnSurface from the 2d curve <C> and  
         the surface <S>.") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface (const Handle_Adaptor2d_HCurve2d & C,const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

Changes the surface.") Load;
		void Load (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor2d_HCurve2d)

Returns:
	None

Changes the 2d curve.") Load;
		void Load (const Handle_Adaptor2d_HCurve2d & C);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") GetCurve;
		const Handle_Adaptor2d_HCurve2d & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") GetSurface;
		const Handle_Adaptor3d_HSurface & GetSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") ChangeCurve;
		Handle_Adaptor2d_HCurve2d & ChangeCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") ChangeSurface;
		Handle_Adaptor3d_HSurface & ChangeSurface ();
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

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
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
	Handle_Adaptor3d_HCurve

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
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
	gp_Pnt

Computes the point of parameter U on the curve.") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U on the curve.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
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
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

No detailed docstring for this function.") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

No detailed docstring for this function.") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

No detailed docstring for this function.") Parabola;
		gp_Parab Parabola ();
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
	Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") Adaptor3d_CurveOnSurface::~Adaptor3d_CurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_CurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_HCurveOnSurface;
class Adaptor3d_HCurveOnSurface : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_HCurveOnSurface;
		 Adaptor3d_HCurveOnSurface ();
		%feature("autodoc", "Args:
	C(Adaptor3d_CurveOnSurface)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_HCurveOnSurface;
		 Adaptor3d_HCurveOnSurface (const Adaptor3d_CurveOnSurface & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_CurveOnSurface)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Adaptor3d_CurveOnSurface & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_CurveOnSurface

No detailed docstring for this function.") ChangeCurve;
		Adaptor3d_CurveOnSurface & ChangeCurve ();
};


%feature("shadow") Adaptor3d_HCurveOnSurface::~Adaptor3d_HCurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HCurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HCurveOnSurface {
	Handle_Adaptor3d_HCurveOnSurface GetHandle() {
	return *(Handle_Adaptor3d_HCurveOnSurface*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HCurveOnSurface;
class Handle_Adaptor3d_HCurveOnSurface : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_Adaptor3d_HCurveOnSurface();
        Handle_Adaptor3d_HCurveOnSurface(const Handle_Adaptor3d_HCurveOnSurface &aHandle);
        Handle_Adaptor3d_HCurveOnSurface(const Adaptor3d_HCurveOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HCurveOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HCurveOnSurface {
    Adaptor3d_HCurveOnSurface* GetObject() {
    return (Adaptor3d_HCurveOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HCurveOnSurface::~Handle_Adaptor3d_HCurveOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HCurveOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_HIsoCurve;
class Adaptor3d_HIsoCurve : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_HIsoCurve;
		 Adaptor3d_HIsoCurve ();
		%feature("autodoc", "Args:
	C(Adaptor3d_IsoCurve)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_HIsoCurve;
		 Adaptor3d_HIsoCurve (const Adaptor3d_IsoCurve & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_IsoCurve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Adaptor3d_IsoCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_IsoCurve

No detailed docstring for this function.") ChangeCurve;
		Adaptor3d_IsoCurve & ChangeCurve ();
};


%feature("shadow") Adaptor3d_HIsoCurve::~Adaptor3d_HIsoCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HIsoCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HIsoCurve {
	Handle_Adaptor3d_HIsoCurve GetHandle() {
	return *(Handle_Adaptor3d_HIsoCurve*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HIsoCurve;
class Handle_Adaptor3d_HIsoCurve : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_Adaptor3d_HIsoCurve();
        Handle_Adaptor3d_HIsoCurve(const Handle_Adaptor3d_HIsoCurve &aHandle);
        Handle_Adaptor3d_HIsoCurve(const Adaptor3d_HIsoCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HIsoCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HIsoCurve {
    Adaptor3d_HIsoCurve* GetObject() {
    return (Adaptor3d_HIsoCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HIsoCurve::~Handle_Adaptor3d_HIsoCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HIsoCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_HSurfaceOfLinearExtrusion;
class Adaptor3d_HSurfaceOfLinearExtrusion : public Adaptor3d_HSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_HSurfaceOfLinearExtrusion;
		 Adaptor3d_HSurfaceOfLinearExtrusion ();
		%feature("autodoc", "Args:
	S(Adaptor3d_SurfaceOfLinearExtrusion)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_HSurfaceOfLinearExtrusion;
		 Adaptor3d_HSurfaceOfLinearExtrusion (const Adaptor3d_SurfaceOfLinearExtrusion & S);
		%feature("autodoc", "Args:
	S(Adaptor3d_SurfaceOfLinearExtrusion)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Adaptor3d_SurfaceOfLinearExtrusion & S);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Surface

No detailed docstring for this function.") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_SurfaceOfLinearExtrusion

No detailed docstring for this function.") ChangeSurface;
		Adaptor3d_SurfaceOfLinearExtrusion & ChangeSurface ();
};


%feature("shadow") Adaptor3d_HSurfaceOfLinearExtrusion::~Adaptor3d_HSurfaceOfLinearExtrusion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HSurfaceOfLinearExtrusion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HSurfaceOfLinearExtrusion {
	Handle_Adaptor3d_HSurfaceOfLinearExtrusion GetHandle() {
	return *(Handle_Adaptor3d_HSurfaceOfLinearExtrusion*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HSurfaceOfLinearExtrusion;
class Handle_Adaptor3d_HSurfaceOfLinearExtrusion : public Handle_Adaptor3d_HSurface {

    public:
        // constructors
        Handle_Adaptor3d_HSurfaceOfLinearExtrusion();
        Handle_Adaptor3d_HSurfaceOfLinearExtrusion(const Handle_Adaptor3d_HSurfaceOfLinearExtrusion &aHandle);
        Handle_Adaptor3d_HSurfaceOfLinearExtrusion(const Adaptor3d_HSurfaceOfLinearExtrusion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HSurfaceOfLinearExtrusion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HSurfaceOfLinearExtrusion {
    Adaptor3d_HSurfaceOfLinearExtrusion* GetObject() {
    return (Adaptor3d_HSurfaceOfLinearExtrusion*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HSurfaceOfLinearExtrusion::~Handle_Adaptor3d_HSurfaceOfLinearExtrusion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HSurfaceOfLinearExtrusion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_HSurfaceOfRevolution;
class Adaptor3d_HSurfaceOfRevolution : public Adaptor3d_HSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_HSurfaceOfRevolution;
		 Adaptor3d_HSurfaceOfRevolution ();
		%feature("autodoc", "Args:
	S(Adaptor3d_SurfaceOfRevolution)

Returns:
	None

No detailed docstring for this function.") Adaptor3d_HSurfaceOfRevolution;
		 Adaptor3d_HSurfaceOfRevolution (const Adaptor3d_SurfaceOfRevolution & S);
		%feature("autodoc", "Args:
	S(Adaptor3d_SurfaceOfRevolution)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Adaptor3d_SurfaceOfRevolution & S);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Surface

No detailed docstring for this function.") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_SurfaceOfRevolution

No detailed docstring for this function.") ChangeSurface;
		Adaptor3d_SurfaceOfRevolution & ChangeSurface ();
};


%feature("shadow") Adaptor3d_HSurfaceOfRevolution::~Adaptor3d_HSurfaceOfRevolution %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_HSurfaceOfRevolution {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Adaptor3d_HSurfaceOfRevolution {
	Handle_Adaptor3d_HSurfaceOfRevolution GetHandle() {
	return *(Handle_Adaptor3d_HSurfaceOfRevolution*) &$self;
	}
};

%nodefaultctor Handle_Adaptor3d_HSurfaceOfRevolution;
class Handle_Adaptor3d_HSurfaceOfRevolution : public Handle_Adaptor3d_HSurface {

    public:
        // constructors
        Handle_Adaptor3d_HSurfaceOfRevolution();
        Handle_Adaptor3d_HSurfaceOfRevolution(const Handle_Adaptor3d_HSurfaceOfRevolution &aHandle);
        Handle_Adaptor3d_HSurfaceOfRevolution(const Adaptor3d_HSurfaceOfRevolution *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Adaptor3d_HSurfaceOfRevolution DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Adaptor3d_HSurfaceOfRevolution {
    Adaptor3d_HSurfaceOfRevolution* GetObject() {
    return (Adaptor3d_HSurfaceOfRevolution*)$self->Access();
    }
};
%feature("shadow") Handle_Adaptor3d_HSurfaceOfRevolution::~Handle_Adaptor3d_HSurfaceOfRevolution %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Adaptor3d_HSurfaceOfRevolution {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Adaptor3d_IsoCurve;
class Adaptor3d_IsoCurve : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

The iso is set to NoneIso.") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

The surface is loaded. The iso is set to NoneIso.") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	Iso(GeomAbs_IsoType)
	Param(Standard_Real)

Returns:
	None

Creates  an  IsoCurve curve.   Iso  defines the  
         type (isoU or  isoU) Param defines the value of  
         the iso. The bounds  of  the iso are the bounds  
         of the surface.") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const Handle_Adaptor3d_HSurface & S,const GeomAbs_IsoType Iso,const Standard_Real Param);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	Iso(GeomAbs_IsoType)
	Param(Standard_Real)
	WFirst(Standard_Real)
	WLast(Standard_Real)

Returns:
	None

Create an IsoCurve curve.  Iso defines the type  
         (isoU or isov).  Param defines the value of the  
         iso. WFirst,WLast define the bounds of the iso.") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const Handle_Adaptor3d_HSurface & S,const GeomAbs_IsoType Iso,const Standard_Real Param,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

Changes  the surface.  The  iso  is  reset  to  
         NoneIso.") Load;
		void Load (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	Iso(GeomAbs_IsoType)
	Param(Standard_Real)

Returns:
	None

Changes the iso on the current surface.") Load;
		void Load (const GeomAbs_IsoType Iso,const Standard_Real Param);
		%feature("autodoc", "Args:
	Iso(GeomAbs_IsoType)
	Param(Standard_Real)
	WFirst(Standard_Real)
	WLast(Standard_Real)

Returns:
	None

Changes the iso on the current surface.") Load;
		void Load (const GeomAbs_IsoType Iso,const Standard_Real Param,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") Surface;
		const Handle_Adaptor3d_HSurface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_IsoType

No detailed docstring for this function.") Iso;
		GeomAbs_IsoType Iso ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
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

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
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
	Handle_Adaptor3d_HCurve

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
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
	gp_Pnt

Computes the point of parameter U on the curve.") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U on the curve.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
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
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

No detailed docstring for this function.") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

No detailed docstring for this function.") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

No detailed docstring for this function.") Parabola;
		gp_Parab Parabola ();
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
	Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") Adaptor3d_IsoCurve::~Adaptor3d_IsoCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_IsoCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_SurfaceOfLinearExtrusion;
class Adaptor3d_SurfaceOfLinearExtrusion : public Adaptor3d_Surface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_SurfaceOfLinearExtrusion;
		 Adaptor3d_SurfaceOfLinearExtrusion ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

The Curve is loaded.") Adaptor3d_SurfaceOfLinearExtrusion;
		 Adaptor3d_SurfaceOfLinearExtrusion (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	V(gp_Dir)

Returns:
	None

Thew Curve and the Direction are loaded.") Adaptor3d_SurfaceOfLinearExtrusion;
		 Adaptor3d_SurfaceOfLinearExtrusion (const Handle_Adaptor3d_HCurve & C,const gp_Dir & V);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

Changes the Curve") Load;
		void Load (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	V(gp_Dir)

Returns:
	None

Changes the Direction") Load;
		void Load (const gp_Dir & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Return CN.") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns the number of U intervals for  continuity  
         <S>. May be one if UContinuity(me) >= <S>") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns the number of V intervals for  continuity  
         <S>. May be one if VContinuity(me) >= <S>") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Returns the  intervals with the requested continuity  
         in the U direction.") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Returns the  intervals with the requested continuity  
         in the V direction.") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the U direction  
          equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the V direction  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") UPeriod;
		Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") VPeriod;
		Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	gp_Pnt

Computes the point of parameters U,V on the surface.") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameters U,V on the surface.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the point  and the first derivatives on  
 the surface.  Raised   if  the continuity  of   the  current  
 intervals is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes   the point,  the  first  and  second  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
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
	None

Computes the point,  the first, second and third  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C3.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction U and Nv  
 in the direction V at the point P(U, V).  Raised if the current U  interval is not not CNu  
 and the current V interval is not CNv.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

Returns the parametric U  resolution corresponding  
        to the real space resolution <R3d>.") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

Returns the parametric V  resolution corresponding  
        to the real space resolution <R3d>.") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_SurfaceType

Returns the type of the surface : Plane, Cylinder,  
         Cone,      Sphere,        Torus,    BezierSurface,  
         BSplineSurface,               SurfaceOfRevolution,  
         SurfaceOfExtrusion, OtherSurface") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

No detailed docstring for this function.") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

No detailed docstring for this function.") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

No detailed docstring for this function.") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Sphere

No detailed docstring for this function.") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Torus

No detailed docstring for this function.") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
};


%feature("shadow") Adaptor3d_SurfaceOfLinearExtrusion::~Adaptor3d_SurfaceOfLinearExtrusion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_SurfaceOfLinearExtrusion {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Adaptor3d_SurfaceOfRevolution;
class Adaptor3d_SurfaceOfRevolution : public Adaptor3d_Surface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Adaptor3d_SurfaceOfRevolution;
		 Adaptor3d_SurfaceOfRevolution ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

The Curve is loaded.") Adaptor3d_SurfaceOfRevolution;
		 Adaptor3d_SurfaceOfRevolution (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	V(gp_Ax1)

Returns:
	None

The Curve and the Direction are loaded.") Adaptor3d_SurfaceOfRevolution;
		 Adaptor3d_SurfaceOfRevolution (const Handle_Adaptor3d_HCurve & C,const gp_Ax1 & V);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

Changes the Curve") Load;
		void Load (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	V(gp_Ax1)

Returns:
	None

Changes the Direction") Load;
		void Load (const gp_Ax1 & V);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

Return CN.") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns the number of U intervals for  continuity  
         <S>. May be one if UContinuity(me) >= <S>") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns the number of V intervals for  continuity  
         <S>. May be one if VContinuity(me) >= <S>") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Returns the  intervals with the requested continuity  
         in the U direction.") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Returns the  intervals with the requested continuity  
         in the V direction.") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the U direction  
          equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the V direction  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") UPeriod;
		Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") VPeriod;
		Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	gp_Pnt

Computes the point of parameters U,V on the surface.") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameters U,V on the surface.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the point  and the first derivatives on  
 the surface.  Raised   if  the continuity  of   the  current  
 intervals is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes   the point,  the  first  and  second  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
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
	None

Computes the point,  the first, second and third  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C3.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu  
 in the direction U and Nv in the direction V  
 at the point P(U, V).  Raised if the current U  interval is not not CNu  
 and the current V interval is not CNv.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

Returns the parametric U  resolution corresponding  
        to the real space resolution <R3d>.") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

Returns the parametric V  resolution corresponding  
        to the real space resolution <R3d>.") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_SurfaceType

Returns the type of the surface : Plane, Cylinder,  
         Cone,      Sphere,        Torus,    BezierSurface,  
         BSplineSurface,               SurfaceOfRevolution,  
         SurfaceOfExtrusion, OtherSurface") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

No detailed docstring for this function.") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

No detailed docstring for this function.") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

Apex of the Cone = Cone.Position().Location()  
          ==> ReferenceRadius = 0.") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Sphere

No detailed docstring for this function.") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Torus

No detailed docstring for this function.") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

No detailed docstring for this function.") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") Axis;
		gp_Ax3 Axis ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
};


%feature("shadow") Adaptor3d_SurfaceOfRevolution::~Adaptor3d_SurfaceOfRevolution %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Adaptor3d_SurfaceOfRevolution {
	void _kill_pointed() {
		delete $self;
	}
};
